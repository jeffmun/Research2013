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
using System.Web;
using System.Configuration;

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


	#endregion


	protected void gridlkupMeas_ValueChanged(object sender, EventArgs e)
	{
		int measureID = Convert.ToInt32(gridlkupMeas.Value);
		Response.Redirect("Dictionary.aspx?mID=" + measureID.ToString());
		
	}


	protected void ExportDictionaryForNDAR(int measureID)
	{

		Datadictionary dict = new Datadictionary(measureID);

		if(dict.dt_ndardict.HasRows())
		{
			string dictfilename = String.Format("{0}_definitions", dict.measname);
			dict.dt_ndardict.TableName = dictfilename;
			SpreadsheetGearUtils.SaveDataTableToExcel(dict.dt_ndardict, dictfilename);
		}
	}

	protected void btnSaveNDARDict_OnClick (object sender, EventArgs e)
	{
		int mID = Convert.ToInt32(Request.QueryString["mID"]);

		if (mID > 0)
		{
			ExportDictionaryForNDAR(mID);
		}
	}

	protected void BindDict(int measureID)
	{

		SQL_utils sql = new SQL_utils("data");

		string code = String.Format("select fldpk, a.tblpk, ord_pos, fldname, fielddatatype, fielddatatypelength" + Environment.NewLine +
			", fielddatatype + (case when fielddatatype like '%char%' then coalesce('(' + cast(fielddatatypelength as varchar)+')',' NEEDS LENGTH!! ' + coalesce(cast(character_maximum_length as varchar),'') )  else '' end) " + Environment.NewLine +
			" + (case  when fielddatatype <> data_type then ' <>TYPE!!' else '' end) " + Environment.NewLine +
			" + (case  when fielddatatypelength<> character_maximum_length then ' <>' + cast(character_maximum_length as varchar) + ' [in DB]!!' else '' end ) as datatype " + Environment.NewLine +
			" , fieldlabel, fieldvaluesetID, inanalysis, varorigin " + Environment.NewLine +
			" ,'#'+cast(fieldvaluesetID as varchar) + ':<br/>' +  def.fnValueLabels_for_HtmlDisplay(fieldvaluesetID,'<br/>') valuelabels " + Environment.NewLine +
			" , missval, a.fieldcodeID, fieldcode, a.fldextractionmode, fldextractionmode_txt, importposition, constString  " + Environment.NewLine +
			" , (case when c.column_name is null then 'NOT IN SQL Table' else '' end) as fld_status, ExcludeFromNDARdict, ConvertFromLabelToValue " + Environment.NewLine +
			" from def.Fld a " + Environment.NewLine +
			" JOIN def.Tbl b ON a.tblpk = b.tblpk" + Environment.NewLine +
			" LEFT JOIN (select table_name, column_name, data_type, character_maximum_length from INFORMATION_SCHEMA.COLUMNS ) c ON b.tblname = c.table_name and a.fldname = c.column_name " + Environment.NewLine +
			" LEFT JOIN datFieldCode d ON a.fieldcodeID = d.fieldcodeID " + Environment.NewLine +
			" LEFT JOIN def.FldExtractionMode e ON a.fldextractionmode = e.fldextractionmode " + Environment.NewLine +
			" where a.tblpk = (select tblpk from def.tbl where measureID = {0}) " + Environment.NewLine +
			" and fldname not in ('studymeasID','indexnum','verified','created','updated','scored','createdby','updatedby','scoredby') " + Environment.NewLine +
			" and (a.fieldcodeID >= 0 or a.fieldcodeID is null) " + Environment.NewLine +
			" order by a.ord_pos", measureID);


		string measname = sql.StringScalar_from_SQLstring("select measname from uwautism_research_backend..tblMeasure where measureID=" + measureID.ToString());
		string measfullname = sql.StringScalar_from_SQLstring("select measfullname from uwautism_research_backend..tblMeasure where measureID=" + measureID.ToString());

		string tblinfo = sql.StringScalar_from_SQLstring("select 'tblpk: ' + cast(tblpk as varchar) + '  ' + tblname from uwautism_research_data.def.tbl where measureID=" + measureID.ToString());


		lblMeasName.Text = measname;
		if(measname != measfullname) lblMeasFullName.Text = " - " + measfullname;
		lblTblInfo.Text = tblinfo;


		DataTable dt = sql.DataTable_from_SQLstring(code);

		Session["dict"] = dt;

		gridDict.DataSource = dt;
		gridDict.DataBind();



		string tblname = sql.StringScalar_from_SQLstring("select tblname from def.tbl where measureID=" + Request.QueryString["mID"]);
		int nflds = sql.IntScalar_from_SQLstring("select count(*) from information_schema.columns where table_name='" + tblname + "'");

		bool showCreateTableButton = false;
		bool showImportDict = false;
		if (nflds > 0)
		{
			int nrecs = sql.IntScalar_from_SQLstring("select count(*) from " + tblname);
			int tblexists = sql.IntScalar_from_SQLstring("select(case when  OBJECT_ID('" + tblname + "') is not null then 1 else 0 end) as x");

			showCreateTableButton = (nrecs > 0) ? false : true;  //Do not show the Create button if there are records.  This allows us to recreate the table when there are zero records in it.
			showImportDict = (tblexists == 1) ? false : true;  //Show the dict upload if the table does not exist


		} 
		else{
			bool needslength = (dt.ColumnContainsValue("datatype", "NEEDS LENGTH"));
			showCreateTableButton = !needslength;
		}




		btnCreateTable.Visible = showCreateTableButton;
		lblFileUpload.Visible = showImportDict;
		FileUpload_Doc.Visible = showImportDict;

		sql.Close();
	}

	protected void CreateTable()
	{

		SQL_utils sql = new SQL_utils("data");


		string tblname = sql.StringScalar_from_SQLstring("select tblname from def.tbl where measureID=" + Request.QueryString["mID"]);

		int tblpk = sql.IntScalar_from_SQLstring("select tblpk from def.tbl where measureID=" + Request.QueryString["mID"]);

		if(tblpk > 0)
		{
			try
			{
				sql.NonQuery_from_SQLstring("grant alter to webuser;");
				sql.NonQuery_from_SQLstring("DROP TABLE IF EXISTS " + tblname );
				sql.NonQuery_from_SQLstring("revoke alter to webuser;");
			}
			catch (Exception ex) { }

			try
			{
				sql.NonQuery_from_SQLstring("grant alter to webuser;");
				//sql.NonQuery_from_SQLstring("grant create table to webuser;");
				sql.NonQuery_from_SQLstring(String.Format("exec  def.spUTIL_create_table_from_metadata {0}, 1", tblpk));
				//sql.NonQuery_from_SQLstring("revoke create table to webuser;");
				sql.NonQuery_from_SQLstring("revoke alter to webuser;");
			}
			catch (Exception ex) { }

			int mID = Convert.ToInt32(Request.QueryString["mID"]);

			BindDict(mID);

		}

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





	protected void ImportDict(object sender, EventArgs e)
	{
		int measureID = Convert.ToInt32(Request.QueryString["mID"]);

		if (FileUpload_Doc.HasFile)
		{

			DateTime startupload = DateTime.Now;
			string info = String.Format("Begin. {0}<br/>", startupload.ToString());

			for (int f = 0; f < FileUpload_Doc.PostedFiles.Count; f++)
			{
				HttpPostedFile httpfile = FileUpload_Doc.PostedFiles[f];
				Debug.WriteLine(String.Format("{0} {1}", httpfile.FileName, httpfile.ContentLength));
				string sFileExt = httpfile.FileName.Substring(httpfile.FileName.LastIndexOf(".")).ToLower();
				string sOrigFileName = httpfile.FileName;

				string sFilePath = ConfigurationManager.AppSettings["DataUploadPath"];


				string[] allowedExts = { ".xlsx", ".xls", ".txt", ".csv" };

				//bool isallowed = new bool();
				//isallowed = false;
				int matches = 0;
				for (int i = 0; i < allowedExts.Length; i++)
				{
					if (allowedExts[i] == sFileExt) matches++;
				}

				if (matches >= 1)
				{

					try
					{
						string sFileName = String.Format("Dict_mID{0}{1}"
							, measureID
							, sFileExt);

						//string sFileName = String.Format("smID{0}___ID{1}_{2}{3}"
						//	, cboStudymeas.Value.ToString()
						//	, cboSubject.Value.ToString()
						//	, f
						//	, sFileExt);

						string myfilepath = Server.MapPath(sFilePath) + sFileName;
						httpfile.SaveAs(myfilepath);

						string results = ProcessDictionary(myfilepath); // "some info"; // ProcessUploadedData(ID, studymeasID, Server.MapPath(sFilePath), sFileName);

						info += String.Format("You have successfully uploaded '{0}'. {1}<br/>"
							, httpfile.FileName
							, results);


						BindDict(measureID);
					}
					catch (Exception oErr)
					{
						string err = String.Format("<b>{0}</b><br/><br/>{1}<br/><br/>{2}"
						, oErr.Message
						, oErr.InnerException
						, oErr.StackTrace.Replace(Environment.NewLine, "<br/>"));
						lblDocUploadInfo.Text = Server.HtmlDecode(err);

						lblDocUploadInfo.ForeColor = Color.Red;

					}
				}
				else
				{ //Not an allowed file type

					lblDocUploadInfo.Text = "Error: This file type is not allowed.";
					lblDocUploadInfo.ForeColor = Color.Red;
				}
			}

			double timeelapsed = Math.Round((DateTime.Now - startupload).TotalSeconds, 2);
			info += String.Format("<br/> End. {0} total seconds.", timeelapsed);

			lblDocUploadInfo.Text = Server.HtmlDecode(info);
			lblDocUploadInfo.ForeColor = Color.Green;

		}

		else
		{
			lblDocUploadInfo.Text = "You must select a file for upload.";
			lblDocUploadInfo.ForeColor = Color.Red;
		}
		//oConn.Close();
	}



	protected void ImportDict_Cancel(object sender, EventArgs e)
	{
		//ddl_DocType.SelectedValue = "0";
		//ddl_DocStatus.SelectedValue = "0";
		//txtDocTitle.Text = "";
		//txtDocDesc.Text = "";
		//lblDocUploadInfo.Text = "";

		//Panel_UploadDocs.Update();


		//Panel_UploadDocs.Visible = false;

		//btnShowUploadDocPanel.Visible = true;

	}


	protected string ProcessDictionary(string filename)
	{
		string insertresults = "";
		SQL_utils sql = new SQL_utils("data");

		//Check for tblpk
		int tblpk = sql.IntScalar_from_SQLstring("select coalesce(tblpk,-1) from def.tbl where measureID=" + Request.QueryString["mID"]);

		if(tblpk > 0)
		{
			DataSet ds = SpreadsheetGearUtils.GetDataSet(filename, false);

			DataTable dt = ds.Tables[0];

			// Add tblpk
			DataColumn col = new DataColumn("tblpk", typeof(int));
			col.DefaultValue = tblpk;

			// Add fldextractionmode - and thus allow this measure to be imported
			DataColumn col2 = new DataColumn("fldextractionmode", typeof(int));
			int mode = (int)FieldExtractionMode.matchFldname;
			col2.DefaultValue = mode;

			dt.Columns.AddRange(new DataColumn[2] { col, col2 });

			insertresults = sql.BulkInsert(dt, "fld", "def");


		}

		sql.Close();

		return insertresults;
	}


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

			if(vallabels.Contains("??"))
			{
				e.Cell.BackColor = Color.Yellow;
			}

		}

		if (e.Cell != null & e.DataColumn.FieldName == "datatype")
		{
			var fn = e.DataColumn.FieldName;
			string datatype = e.CellValue.ToString();

			
			if(datatype.Contains("!"))
			{
				e.Cell.ForeColor = Color.Red;
			}

		}
		if (e.Cell != null & e.DataColumn.FieldName == "ExcludeFromNDARdict")
		{
			string exclude = e.CellValue.ToString();
			if(exclude=="1")
			{
				e.Cell.BackColor = Color.LightCoral;
				e.Cell.ForeColor = Color.DarkRed;
			}
		}
		if (e.Cell != null & e.DataColumn.FieldName == "ConvertFromLabelToValue")
		{
			string convert = e.CellValue.ToString();
			if (convert == "1")
			{
				e.Cell.BackColor = Color.LawnGreen;
				e.Cell.ForeColor = Color.Black;
			}
		}

	}


	protected void gridDict_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
	{
		if (e.RowType != GridViewRowType.Data)  return;
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

		var dict = (sender as ASPxGridView);

		try
		{
			string fieldcode = (sender as ASPxGridView).GetRowValues(e.VisibleIndex, "fieldcode").ToString();
			string status = (sender as ASPxGridView).GetRowValues(e.VisibleIndex, "fld_status").ToString();
			string fieldvaluesetID = (sender as ASPxGridView).GetRowValues(e.VisibleIndex, "fieldvaluesetID").ToString();

			if (e.ButtonType == ColumnCommandButtonType.Delete)
			{
				bool showDeleteBtn = (status == "NOT IN SQL Table") ? true : false;
				e.Visible = showDeleteBtn;
			}
			if (e.ButtonType == ColumnCommandButtonType.Edit)
			{
				bool showEditBtn = true;
				if (fieldcode == "PrimaryKey") showEditBtn = false;
				if (fieldcode == "ID_number") showEditBtn = true;
				e.Visible = showEditBtn;
			}
		}
		catch (Exception ex)
		{ }



	}


	protected void gridDict_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{

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
		int tblpk = sql.IntScalar_from_SQLstring("select tblpk from def.tbl where measureID=" + Request.QueryString["mID"]);
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
		int tblpk = sql.IntScalar_from_SQLstring("select tblpk from def.tbl where measureID=" + Request.QueryString["mID"]);



		DxDbOps.BuildDeleteSqlCode(e, "fld", "data", "def");
		//((ASPxGridView)sender).JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
		gv.CancelEdit();
		e.Cancel = true;

		gridDict.DataBind();

	}


	protected void gridDict_OnRowCommand(object sender, EventArgs e)
	{
		Debug.WriteLine(" !!!!!! gridDict_OnRowCommand");
	}

	protected void gridDict_OnParseValue(object sender, ASPxParseValueEventArgs e)
	{
		if (e.Value == null)
		{
			Debug.Write(" !!! IS NULL !!! ");
			e.Value = DBNull.Value;
		}
		Debug.WriteLine(String.Format("{0} {1}", e.FieldName, e.Value.ToString()));
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



	protected void btnMeasInfo_OnClick(object sender, EventArgs e)
	{
		string url = "~/Library/Measure.aspx?mID=" + Request.QueryString["mID"];
		Response.Redirect(url);
	}


	protected void btnCreateTable_OnClick(object sender, EventArgs e)
	{
		CreateTable();
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