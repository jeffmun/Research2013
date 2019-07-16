using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Newtonsoft.Json.Schema;
using DevExpress.Web;
using DevExpress.Web.Data;
using Ionic.Zip;
using uwac;


public partial class NDAR_NDARapi : System.Web.UI.Page
{

	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			Session["ndarsaveresults"] = null;
			LoadDataStructures("localDB");
		}
		else {
			if (Session["datastructures"] != null)
			{
				grid.DataSource = (DataTable)Session["datastructures"];
				grid.DataBind();
			}
		}
		if(IsCallback)
		{
			int foo = 0;
		}

		//string current_status = (Session["ndarsaveresults"] != null) ? Session["ndarsaveresults"].ToString() : "";
		//lblSaveResults.Text = current_status;
		//lblSaveResults2.Text = current_status;

	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		lblSaveResults.Text = "";
		LoadDataStructures("localDB");
	}




	protected void btnSearchDS_Click(object sender, EventArgs e)
	{
		LoadDataStructures("localDB");
	}

	protected void LoadDataStructures(string source)
	{
		string where = txtWhere.Text;
		DataTable dt = new System.Data.DataTable();
		SQL_utils sql = new SQL_utils("data");
		if (chkInStudy.Checked)
		{
			//UWAutism uwac = new UWAutism();
			//int studyID = uwac.Master_studyID;

			int studyID = sql.GetUserStudyID();

			dt = NDAR.LoadFullDataStructureList(source, where, chkUWview.Checked, studyID);
		}
		else
		{
			dt = NDAR.LoadFullDataStructureList(source, where, chkUWview.Checked);
		}


		string code_no_ndar = String.Format("select * from uwautism_research_backend..tblMeasure where " +
			" measureID in (select measureID from uwautism_research_backend..tblStudyMeas where studyID={0}) and measureID not in " +
			" ( select measureID from def.Tbl a " +
			" join NDAR_DS b ON a.tblname = b.uwtable  where measureID>0) "
				, Master.Master_studyID);


		DataTable dt_no_ndar = sql.DataTable_from_SQLstring(code_no_ndar);
		sql.Close();

		gridNoNDAR.DataSource = dt_no_ndar;
		gridNoNDAR.DataBind();

		//gvScroll.DataSource = dt;
		//gvScroll.DataBind();
		Session["datastructures"] = dt;

		grid.DataSource = dt;
		grid.DataBind();

		lblN.Text = "No. of Data Structures: " + dt.Rows.Count.ToString();

	}


	protected void SaveAllDataStructures(DataTable dt)
	{
		SQL_utils sql = new SQL_utils();
		SqlParameter p = sql.CreateParam("NDAR_DS", dt);
		sql.NonQuery_from_ProcName("spNDAR_Insert_DS", p);
	}

	protected void OpenAllViewdataTabs(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils("data");
		string where = txtWhere.Text;
		int studyID = sql.GetUserStudyID();

		DataTable dt = NDAR.LoadFullDataStructureList("localDB", where, chkUWview.Checked, studyID);

		int counter = 0;
		foreach (DataRow row in dt.Rows)
		{
			string shortName = row["shortName"].ToString();

			string url = "NDARview.aspx?shortName=";

			string url2 = String.Format("window.open('{0}{1}','_blank');", url, shortName);

			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), String.Format("key{0}", counter), url2, true);
			counter++;
		}

	}


	protected void grid_DataBound(object sender, EventArgs e)
	{
		//Check to see if these have been added
		bool hasCol = (grid.Columns.IndexOf(grid.Columns["CommandColumnGroups"]) != -1) ? true : false;

		if (hasCol)
		{
			grid.Columns.Remove(grid.Columns["CommandColumnGroups"]);
		}

		GridViewCommandColumn col = new GridViewCommandColumn();
		col.Name = "CommandColumnGroups";

		GridViewCommandColumnCustomButton but = new GridViewCommandColumnCustomButton();
		but.ID = "btnImportFlds";
		but.Text = "Import flds from NDAR";
		but.Styles.Native = true;
		but.Styles.Style.Font.Size = 10;

		col.CustomButtons.Add(but);
		grid.Columns.Add(col);
		col.Index = 0;
	}


	protected void grid_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
	{
		ASPxGridView grid = (ASPxGridView)sender;

		int n = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "n_flds").ToString());

		if (n > 0)
		{
			e.Visible = DevExpress.Utils.DefaultBoolean.False;
		}

	}


	protected void grid_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
	{

		var ID = e.ButtonID;

		ASPxGridView grid = (ASPxGridView)sender;

		string shortname = grid.GetRowValues(e.VisibleIndex, "shortName").ToString();

		if (!String.IsNullOrEmpty(shortname))
		{

			SaveDSToDB(shortname);

		}
	}


	protected void btnSave_Click(object sender, EventArgs e)
	{
		DataTable dt = NDAR.LoadFullDataStructureList("NDAR");

		SaveAllDataStructures(dt);
	}

	protected void btnManualImport_Click(object sender, EventArgs e)
	{

		string shortname = txtShortName.Text;
		if (!String.IsNullOrEmpty(shortname))
		{
			SaveDSToDB(shortname);
		}
	}

	protected void SaveDSToDB(string shortname)
	{
		string results = NDAR.SaveToDB(shortname);

	}




	protected void SaveNDARCSVs() //, DataTable dt, string n, string IDexclude)
	{

		//SQL_utils sql = new SQL_utils("backend");
		List<object> objects = grid.GetSelectedFieldValues("shortName").ToList();

		//List<object> objects = new List<object>();
		List<string> shortNames = objects.Select(s => (string)s).ToList();



		string timepts = tokTimepts.Value.ToString();


		if (timepts != "")
		{
			//List<string> saveResults = SaveNDARCSVs(shortNames, timepts);


			List<string> saveResults = new List<string>();

			SQL_utils sql = new SQL_utils("backend");

			string IDexclude = txtIDexclude.Text;

			string now = DateTime.Now.ToString("yyyyMMdd__HH_mm");

			List<string> savedFilenames = new List<string>();

			int total_data_rows = 0;

			foreach (string n in shortNames)
			{

				string sqlcode = String.Format("select cast(studymeasID as varchar) studymeasID from tblstudymeas where timepointID in ({0}) " +
					" and studymeasID not in (select reliabilitystudymeasID from tblStudymeas where reliabilitystudymeasID is not null) " +
					" and measureID in (select cast(measureID as varchar) mID from uwautism_research_data.def.tbl where tblname in (select uwtable from uwautism_research_data..NDAR_DS where shortName = '{1}'))", timepts, n);
				DataTable dt = sql.DataTable_from_SQLstring(sqlcode);


				if (dt.HasRows())
				{
					List<string> smIDs = dt.AsEnumerable().Select(f => f.Field<string>("studymeasID")).ToList();

					string studymeasIDs = String.Join(",", smIDs);

					Debug.WriteLine(String.Format("shortName = {0}  studymeasIDs = {1}    IDexclude = {2}", n, studymeasIDs, IDexclude));

					string filename = Master.Master_studyname + "_" + n + "_" + now;


					string filename_results = SaveNDARCSV(n, IDexclude, studymeasIDs, filename, Master.Master_studyID);

					string filename_result = filename_results.Split('|')[0];
					string nrows = filename_results.Split('|')[1];

					total_data_rows += Convert.ToInt32(nrows);

					string result = "";

					if (filename_result.Contains("ERROR"))
					{
						result = String.Format("<div style=\"color: red\">ERROR Saving File: {0} (data table has {1} rows)</div>", filename, nrows);
					}
					else
					{
						result = String.Format("<div style=\"color: green\">Success: {0} written with {1} rows</div>", filename, nrows);
						savedFilenames.Add(filename_result);
					}
					Debug.WriteLine(result);
					saveResults.Add(result);
				}
				else 
				{
					string result = String.Format(String.Format("<div style =\"color: purple\">Warning: {0} (data table has 0 rows)</div>", n));
					saveResults.Add(result);
				}
			}
			sql.Close();


			if (total_data_rows > 0)
			{
				string zipName = String.Format("Zip_{0}_{1}.zip", Master.Master_studyname, DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));

				bool zipSaved = SaveFilesAsZip(savedFilenames, zipName);

				string zipfilepath = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDump/" + zipName );

				string basepath = ResolveUrl("~/stats/DataFileHandler.ashx");

				//string basepath = HttpContext.Current.Resol;

				string zipLink = String.Format("{0}?file={1}&folder={2}", basepath, zipName, "DataDump");
				saveResults.Add((zipSaved) ? String.Format("<b>Zip file '{0}' saved.</b> <a href=\"{1}\">Click here to download.</a>", zipName, zipLink) : "ERROR: Zip file NOT returned.");
			}
			else
			{
				saveResults.Add("<div style =\"color: purple\"><b>Warning: No data rows returned.</b></div>");
			}

			string allresults = String.Join("", saveResults);
			//string allresults = String.Join("<br/>", saveResults);
			lblSaveResults.Text = allresults;
			//cbPanel.DataBind();
			Session["ndarsaveresults"] = allresults;


		}

	}

	protected string SaveNDARCSV(string shortName, string IDexclude, string studymeasIDs, string filename, int studyID)
	{
		bool savedCSV = false;

		DataTable dt = NDAR.GetNDAR_view(shortName, studyID, 0, false, IDexclude, studymeasIDs);
		dt.TableName = shortName;

		if (dt.HasRows())
		{
			string filename_result = SpreadsheetGearUtils.WriteDataTableAsCSV(dt, filename, "csv", true);
			filename_result += String.Format("|{0}", dt.Rows.Count);

			return filename_result;
		}
		else
		{
			return String.Format("ERROR: No rows for {0}|0", shortName);
		}
	}


	protected bool SaveFilesAsZip(List<string> files, string zipName)
	{
		string status = "success";
		bool boolResult;
		try
		{ 
			using (ZipFile zip = new ZipFile())
			{
				zip.AlternateEncodingUsage = ZipOption.AsNecessary;
				//zip.AddDirectoryByName("Files");

				foreach (string f in files)
				{
					zip.AddFile(f, "");
				}


				string zipfilepath = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDump/" + zipName );

				zip.Save(zipfilepath);

				//HttpContext.Current.Response.Clear();
				//HttpContext.Current.Response.BufferOutput = false;
				//HttpContext.Current.Response.ContentType = "application/zip";
				//HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
				//zip.Save(HttpContext.Current.Response.OutputStream);

				//HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
				//HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
				//HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.

				//HttpContext.Current.Response.End();
				
			}
		}
		catch(ThreadAbortException)
		{ status = "caught"; }
		catch(Exception ex)
		{
			status =  "error";
		}
		finally
		{
			boolResult = (status == "error") ? false : true;
			//HttpContext.Current.Response.End();
		}

		if(boolResult)
		{
			//Delete all the individual csv files
			foreach (string f in files)
			{
				File.Delete(f);
			}
		}

		return boolResult;
	}




	protected string DownloadZip(string filename)
	{

		string result = "";

		try
		{
			Response.Redirect(String.Format("~/stats/DataFileHandler.ashx?file={0}&folder={1}" , filename, "DataDump"));
			result = "success";
		}
		catch (Exception ex)
		{
			string x = ex.Message;
			//lblInfo.Text += "#ERROR in DownloadFile: " + ex.Message;
			result = "error";
		}


		return result;
	}

	protected void btnSaveAll_click(object sender, EventArgs e)
	{
		Session["ndarsaveresults"] = null;
		SaveNDARCSVs();
	}

	protected void cbPanel_Callback(object sender, CallbackEventArgsBase e)
	{
		string[] parameters = e.Parameter.Split(':');

		//SaveNDARCSVs();
	}

	protected void cbPanel_CustomJSProperties(object sender,
		CustomJSPropertiesEventArgs e)
	{
		string current_status = (Session["ndarsaveresults"] != null) ? Session["ndarsaveresults"].ToString() : "";

		e.Properties["cpResults"] = current_status;
	}


	protected void dxgrid_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;


		SQL_utils sql = new SQL_utils("data");

		string uwtbl = e.NewValues["uwtable"].ToString();
		string shortname = e.NewValues["shortName"].ToString();


		string s = String.Format("update NDAR_DS set uwtable='{0}' where shortname='{1}'", uwtbl, shortname);

		sql.NonQuery_from_SQLstring(s);

		grid.DataBind();

		gv.CancelEdit();
		e.Cancel = true;

		
	}

}