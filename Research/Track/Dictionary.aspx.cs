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


public partial class Track_Dictionary: BasePage
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
			 if(Request.QueryString["measureID"] != null)
			 {
				int measureID = Convert.ToInt32(Request.QueryString["measureID"]);

				if (measureID > 0)
				{
					BindDict(measureID);
				}
			 }
		}

		else if (IsCallback )
		{

			int measureID = 0;
			if (Request.QueryString["measureID"] != null)
			{
				measureID = Convert.ToInt32(Request.QueryString["measureID"]);
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



	protected void gridDict_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
	{
	}

	protected void gridDict_DataBinding(object sender, EventArgs e)
	{	
	}

	protected void gridDict_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
	{
		if (e.RowType != GridViewRowType.Data)
			return;
		double ord_pos = Convert.ToDouble(e.GetValue("ord_pos").ToString());
		string color = "White";
		if (ord_pos <= 0.90)
		{
			color =  "LightGray";
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


	protected void gridlkupMeas_ValueChanged(object sender, EventArgs e)
	{
		int measureID = Convert.ToInt32(gridlkupMeas.Value);
		Response.Redirect("Dictionary.aspx?measureID=" + measureID.ToString());
		
	}



	protected void BindDict(int measureID)
	{

		SQL_utils sql = new SQL_utils("data");

		string code = String.Format("select fldpk, tblpk, ord_pos, fldname, fielddatatype, fielddatatypelength" +
			", fielddatatype + coalesce('(' + cast(fielddatatypelength as varchar)+')','') datatype, fieldlabel, fieldvaluesetID " + 
			" ,'#'+cast(fieldvaluesetID as varchar) + ':<br/>' +  def.fnValueLabels_for_HtmlDisplay(fieldvaluesetID) valuelabels " +
			" , missval " + 
			" from def.Fld where tblpk = (select tblpk from def.tbl where measureID = {0}) " +
			" and fldname not in ('studymeasID','indexnum','created','updated','scoredby','createdby','updatedby','scoredby') " + 
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





	#endregion

	protected void gridDict_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxGridView.BuildUpdateSqlCode(e, "fld", "data", "def");
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

		DxGridView.BuildInsertSqlCode(e, "fld", "data", "def");
		//((ASPxGridView)sender).JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
		gv.CancelEdit();
		e.Cancel = true;

		gridDict.DataBind();

	}

}