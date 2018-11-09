using DevExpress.Web;
using DevExpress.Web.Export;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.Web.Data;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraGrid;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.Services;
using uwac;
using uwac.trk;


public partial class Data_Dictionary: BasePage
{
	private string ID;
	private string group_csv;
	private string subjstatus_csv;

	#region Page Events
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = Master.Master_studyID.ToString();
	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("Dictionary.aspx");
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		bool isCallback = IsCallback;
		bool isPostback = IsPostBack;


		if (!IsCallback && !IsPostBack)
		{
			 if(Request.QueryString["mID"] != null)
			 {
				int measureID = Convert.ToInt32(Request.QueryString["mID"]);

				if (measureID > 0)
				{
					BindDict(measureID);
				}
			 }
		}

		else if (IsCallback )
		{

			int measureID = 0;
			if (Request.QueryString["mID"] != null)
			{
				measureID = Convert.ToInt32(Request.QueryString["mID"]);
			}
			else 
			{
				measureID = Convert.ToInt32(gridlkupMeas.Value);
			}

			if (measureID > 0)
			{
				BindDict(measureID);
			}

		}

	}



	protected void gridlkupMeas_ValueChanged(object sender, EventArgs e)
	{
		int measureID = Convert.ToInt32(gridlkupMeas.Value);
		Response.Redirect("Dictionary.aspx?mID=" + measureID.ToString());
		
	}



	protected void BindDict(int measureID)
	{

		SQL_utils sql = new SQL_utils("data");

		string code = String.Format("select fldpk, a.tblpk, ord_pos, fldname, fielddatatype, fielddatatypelength" + Environment.NewLine +
			", fielddatatype + coalesce('(' + cast(fielddatatypelength as varchar)+')','') datatype, fieldlabel, fieldvaluesetID " + Environment.NewLine +
			" ,'#'+cast(fieldvaluesetID as varchar) + ':<br/>' +  def.fnValueLabels_for_HtmlDisplay(fieldvaluesetID) valuelabels " + Environment.NewLine +
			" , missval, fldextractionmode, importposition, constString  " + Environment.NewLine +
			" , (case when c.column_name is null then 'NOT IN SQL Table' else '' end) as fld_status " + Environment.NewLine +
			" from def.Fld a " + Environment.NewLine +
			" JOIN def.Tbl b ON a.tblpk = b.tblpk" + Environment.NewLine +
			" LEFT JOIN (select table_name, column_name from INFORMATION_SCHEMA.COLUMNS ) c ON b.tblname = c.table_name and a.fldname = c.column_name " + Environment.NewLine +
			" where a.tblpk = (select tblpk from def.tbl where measureID = {0}) " + Environment.NewLine +
			" and fldname not in ('studymeasID','indexnum','created','updated','scoredby','createdby','updatedby','scoredby') " + Environment.NewLine +
			" order by ord_pos", measureID);


		string measname = sql.StringScalar_from_SQLstring("select measname from uwautism_research_backend..tblMeasure where measureID=" + measureID.ToString());
		string measfullname = sql.StringScalar_from_SQLstring("select measfullname from uwautism_research_backend..tblMeasure where measureID=" + measureID.ToString());

		lblMeasName.Text = measname;
		if(measname != measfullname) lblMeasFullName.Text = " - " + measfullname;



		DataTable dt = sql.DataTable_from_SQLstring(code);

		Session["dict"] = dt;

		gridDict.DataSource = dt;
		gridDict.DataBind();

		
		sql.Close();
	}



	protected void BindVallabels(int fvsID)
	{

		SQL_utils sql = new SQL_utils("data");


		string code = String.Format("select * from datfieldvaluesetitem where fieldvaluesetID = {0}", fvsID);

		DataTable dt = sql.DataTable_from_SQLstring(code);


		if (dt.Rows.Count == 0)
		{
			//gridVallabels.ClientVisible = false;
			//btnCreateNewValueSet.ClientVisible = true;
			
		}
		else
		{
			//gridVallabels.ClientVisible = true;
			//btnCreateNewValueSet.ClientVisible = false;
			string name = sql.StringScalar_from_SQLstring(String.Format("select fieldvaluesetdesc from datfieldvalueset where fieldvaluesetID = {0}", fvsID));

			gridVallabels.Caption = String.Format("#{0}<br/>{1}", fvsID, name);

			gridVallabels.DataSource = dt;
			gridVallabels.DataBind();

		}
		sql.Close();
	}




	#endregion


	

	protected void gridDict_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
	{
		if (e.Cell != null & e.DataColumn.FieldName == "valuelabels")
		{
			var fn = e.DataColumn.FieldName;
			string vallabels = e.CellValue.ToString();

			List<string> lst_vallabels = vallabels.Split(':').ToList();

			string fvsID_text = lst_vallabels[0].Replace("#", "");
			int fvsID;
			bool success = Int32.TryParse(fvsID_text, out fvsID);

			int fldpk = Convert.ToInt32(e.KeyValue);

			e.Cell.Attributes.Add("onclick", "EditVallabels(" + fldpk.ToString() + "," + fvsID.ToString() + ");");
		}
	}

	protected void gridDict_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
	{
		if (e.RowType != GridViewRowType.Data)
			return;
		double ord_pos = Convert.ToDouble(e.GetValue("ord_pos").ToString());
		string color = "White";
		if (ord_pos <= 0.90)
		{
			color = "LightGray";
		}
		else
		{
			color = (e.VisibleIndex % 2 == 1) ? "WhiteSmoke" : "White";
		}
		Color c = Color.FromName(color);
		//this works
		//e.Row.BackColor = c;

		//this does not work
		e.Row.BackColor = c;

	}

	protected void gridDict_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
	{
		if (e.VisibleIndex == -1) return;

		string status = (sender as ASPxGridView).GetRowValues(e.VisibleIndex, "fld_status").ToString();
		string fieldvaluesetID = (sender as ASPxGridView).GetRowValues(e.VisibleIndex, "fieldvaluesetID").ToString();

		if (e.ButtonType == ColumnCommandButtonType.Delete)
		{
			e.Visible = (status == "NOT IN SQL Table") ? true : false;
		}



	}


	protected void gridDict_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		//Check for a new fieldvaluesetID (when it is equal to -1)
		var fvsID = e.NewValues["fieldvaluesetID"];
		
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildUpdateSqlCode(e, "fld", "data", "def");
		//((ASPxGridView) sender).JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
		gv.CancelEdit();
		e.Cancel = true;

		gridDict.DataBind();
	}

	protected void gridDict_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;

		SQL_utils sql = new SQL_utils("data");
		int tblpk = sql.IntScalar_from_SQLstring("select tblpk from def.tbl where measureID=" + Request.QueryString["measureID"]);
		e.NewValues.Add("tblpk", tblpk);

		DxDbOps.BuildInsertSqlCode(e, "fld", "data", "def");
		//((ASPxGridView)sender).JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
		gv.CancelEdit();
		e.Cancel = true;

		gridDict.DataBind();

	}

	
		protected void gridDict_OnRowDeleting(object sender, ASPxDataDeletingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;

		SQL_utils sql = new SQL_utils("data");
		int tblpk = sql.IntScalar_from_SQLstring("select tblpk from def.tbl where measureID=" + Request.QueryString["measureID"]);



		DxDbOps.BuildDeleteSqlCode(e, "fld", "data", "def");
		//((ASPxGridView)sender).JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
		gv.CancelEdit();
		e.Cancel = true;

		gridDict.DataBind();

	}



	protected void gridVallabels_BatchUpdate(object sender, DevExpress.Web.Data.ASPxDataBatchUpdateEventArgs e)
	{
		if (e.InsertValues.Count > 0)
		{
			foreach (var args in e.InsertValues)
			{
				var x = hidField["fieldvaluesetID"];
				args.NewValues.Add("fieldvaluesetID", x);
			}
		}
		string results = DxDbOps.ProcessBatch(e, "datFieldValueSetItem", "data", "dbo");
		e.Handled = true;
	}



	protected void gridVallabels_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
	{
		int fvsID = Convert.ToInt32(e.Parameters);

		BindVallabels(fvsID);
	}





	protected void btnCreateNewValueSet_Click(object sender, EventArgs e)
	{
		string valuesetname = txtNewValueSet.Text;
		int x = 0;

		//Create new ValueSet and populate with 1 dummy value;
		bool addDummyItem = true;
		//string valuelabel = "New Value Labels for " + lblMeasName.Text;
		SQL_utils sql = new SQL_utils("data");
		int newfvsID = DxDbOps.CreateValueSet(sql, valuesetname, addDummyItem, new List<string>());

		var fldpk = hidField["fldpk"];

		string code = String.Format("update def.fld set fieldvaluesetID={0} where fldpk={1}", newfvsID, fldpk);
		sql.NonQuery_from_SQLstring(code);

		sql.Close();
	}
}