using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using DevExpress.Web.Data;
using uwac;
using uwac.data;
using uwac.trk;
using System.ComponentModel;


public partial class DataProject_Files : System.Web.UI.Page
{

	private bool dataproject_initialized = false;
	private List<int> selected_measlist;
	private List<int> selected_varslist;
	private List<int> selected_subjlist;

	DataTable tbl_selsubj;
	DataTable tbl_selmeas;
	DataTable tbl_selvars;

	private int selected_subjset_pk;



	#region Page Setup
	protected void Page_Init(object sender, EventArgs e)
	{
		Debug.Print("&&&&&&&&&&&&&&&&&&&&& Page_Init " + System.DateTime.Now.ToString() + "&&&&&&&&&&&&&&&&&&&&&");

		this.Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = this.Master.Master_studyID.ToString();
		ViewState["measNeedBind"] = "true";
		ViewState["varsNeedBind"] = "false";
		ViewState["subjNeedBind"] = "true";

	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("Index.aspx");
	}

	protected void Page_Unload(object sender, EventArgs e)
	{
		PrintStatus();
		Debug.Print(" ===================   Page_Unload " + System.DateTime.Now.ToString() + " ==================");
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		Debug.Print("*********************  Page_Load " + System.DateTime.Now.ToString() + " **************************");



		if (!IsPostBack)
		{


			Debug.Print("--- is NOT Postback " + System.DateTime.Now.ToString());




			// Not a postback and there is a defined DataProject - preload the selected Measures and Variables
			if (Request.QueryString["pk"] != null && Request.QueryString["pk"] != "")
			{
				//Load the Datafiles
				LoadDatafiles(Convert.ToInt32(Request.QueryString["pk"]));

				lbl0.Text = "Files for Data Project";
				lblPK.Text = "#" + Request.QueryString["pk"];

				SQL_utils sql = new SQL_utils("data");
				DataTable dtProj = sql.DataTable_from_SQLstring("select * from dp.DataProject where dataproj_pk = " + Request.QueryString["pk"]);
				lblTitle.Text = dtProj.Rows[0]["projTitle"].ToString();
				sql.Close();

			}
			else
			{
				//With no pk redirect
				Response.Redirect("Index.aspx");
			}
		}

		// IS PostBack
		else
		{
			Debug.Print("--- is Postback " + System.DateTime.Now.ToString());
			


		}



	}
	#endregion

	protected void InitializeSessionVars()
	{
		Debug.Print("  **  InitializeSessionVars ");
		
			Session["meas"] = null;
			Session["vars"] = null;

			Session["proj_subj"] = null;
			Session["proj_meas"] = null;
			Session["proj_vars"] = null;
			Session["proj_data"] = null;
			Session["proj_data_stack"] = null;
			Session["proj_infomsg"] = null;


			Session["selected_subjlist"] = null;
			Session["selected_varslist"] = null;
			Session["selected_measlist"] = null;
		
	}




	protected void SetRowFilterMenuToContains(ASPxGridView g)
	{
		foreach (var col in g.Columns)
		{
			if (col is GridViewDataColumn)
			{
				((GridViewDataColumn)col).Settings.AutoFilterCondition = AutoFilterCondition.Contains;
			}
		}
	}


	protected void PrintStatus()
	{
		int n_projsubj = (Session["proj_subj"] != null) ? ((DataTable)Session["proj_subj"]).Rows.Count : 0;
		int n_projmeas = (Session["proj_meas"] != null) ? ((DataTable)Session["proj_meas"]).Rows.Count : 0;
		int n_projvars = (Session["proj_vars"] != null) ? ((DataTable)Session["proj_vars"]).Rows.Count : 0;
		//int n_projdata = (Session["proj_data"] != null) ? ((DataTable)Session["proj_data"]).Rows.Count : 0;

		//int n_subj = (Session["subj"] != null) ? ((DataTable)Session["subj"]).Rows.Count : 0;
		int n_meas = (Session["meas"] != null) ? ((DataTable)Session["meas"]).Rows.Count : 0;
		int n_vars = (Session["vars"] != null) ? ((DataTable)Session["vars"]).Rows.Count : 0;

		bool print = false;
		if (print)
		{
			Debug.Print("");
			Debug.Print("Session meas     = " + n_meas.ToString() + "   " + System.DateTime.Now.ToString());
			Debug.Print("Session vars     = " + n_vars.ToString() + "   " + System.DateTime.Now.ToString());
			Debug.Print("");
			Debug.Print("Session proj_subj = " + n_projsubj.ToString() + "   " + System.DateTime.Now.ToString());
			Debug.Print("Session proj_meas = " + n_projmeas.ToString() + "   " + System.DateTime.Now.ToString());
			Debug.Print("Session proj_vars = " + n_projvars.ToString() + "   " + System.DateTime.Now.ToString());

			//Debug.Print("Session proj_data = " + n_projdata.ToString() + "   " + System.DateTime.Now.ToString());
			Debug.Print("");
		}


	}

	

	#region Data Files
	protected void LoadDatafiles(int pk)
	{
		SQL_utils sql = new SQL_utils("data");
		string sqlcode = "select filename, N_subjects, N_measures, N_studymeas, N_datarows, N_other_datarows, N_datacols, N_data_dups, created, TimeSinceCreated, createdBy " +
			" from dp.vwDatafile where dataproj_pk = " + pk.ToString() + " and isDeleted=0 order by created";
		DataTable dt3 = sql.DataTable_from_SQLstring(sqlcode);
		gvViewDatafiles.DataSource = dt3;
		gvViewDatafiles.DataBind();

		sql.Close();
	}


	
	protected string DownloadFile(string filename)
	{

		string result = "";

		try
		{
			Response.Redirect("~/stats/DataFileHandler.ashx?file=" + filename);
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


	protected void LogDownload(string filename)
	{
		SQL_utils sql = new SQL_utils();

		//Log the Download
		List<SqlParameter> ps2 = new List<SqlParameter>();
		ps2.Add(sql.CreateParam("dataproj_pk", Request.QueryString["pk"], "int"));
		ps2.Add(sql.CreateParam("filename", filename, "text"));
		sql.NonQuery_from_ProcName("dp.spLogDownload", ps2);

		sql.Close();
	}
	#endregion


	#region Callbacks

	

	#endregion


	#region User Controls




	protected void btnExplore_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnExplore_OnClick " + System.DateTime.Now.ToString());
		Response.Redirect("Chart.aspx?pk=" + Request.QueryString["pk"]);
	}

	protected void btnEdit_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnEdit_OnClick " + System.DateTime.Now.ToString());
		Response.Redirect("Edit.aspx?pk=" + Request.QueryString["pk"]);
	}


	protected void btnCreate_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnCreate_OnClick " + System.DateTime.Now.ToString());

		int pk;
		bool has_pk = int.TryParse(Request.QueryString["pk"], out pk);


		ASPxSpreadsheet.Visible = false;


		if (has_pk)
		{
			Dataproject dataproject = new Dataproject(pk);

			//This saves the dataproject as an Excel file.
			dataproject.CreateDatafile();

			LoadDatafiles(pk);
		}

	}


	protected void btnDownloadExistingFile_Command(object sender, CommandEventArgs e)
	{
		ASPxSpreadsheet.Visible = false;
		if (e.CommandName == "DownloadExistingFile")
		{
			string filename = e.CommandArgument.ToString();

			if (File.Exists(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + filename)))
			{
				LogDownload(filename);
				DownloadFile(filename);
			}
			else
			{
				string result = "Sorry, the file [" + filename + "] was not found.";
				ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);
			}

		}
		else if (e.CommandName == "LoadXLSX")
		{
			string filename = e.CommandArgument.ToString();

			if (File.Exists(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + filename)))
			{
				ASPxSpreadsheet.Open(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + filename));
				ASPxSpreadsheet.Visible = true;
			}
			else
			{
				string result = "Sorry, the file [" + filename + "] was not found.";
				ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);
			}

		}
		else if (e.CommandName == "DownloadExistingFile_xls")
		{
			string filename = e.CommandArgument.ToString().Replace(".xlsx", ".xls");

			if (File.Exists(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + filename)))
			{
				LogDownload(filename);
				DownloadFile(filename);
			}
			else
			{

				if (File.Exists(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + e.CommandArgument.ToString())))
				{
					//convert to .xls here
					try
					{
						SpreadsheetGearUtils.Save_xls_from_xlsx(e.CommandArgument.ToString());

						LogDownload(filename);
						DownloadFile(filename);

					}
					catch (Exception ex)
					{
						string x = ex.Message;
						string result = "Sorry, the file [" + filename + "] was not found. We have tried to create it but an error occurred.";
						ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);

					}
				}
				else
				{
					string result = "Sorry, the file [" + filename + "] was not found.";
					ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);
				}

			}

		}

		else if (e.CommandName == "ViewSummary")
		{

			string filename = e.CommandArgument.ToString();


			string pageurl = "DataProjectStats.aspx";
			pageurl += "?filename=" + e.CommandArgument.ToString() + "&pk=" + Request.QueryString["pk"];
			Response.Redirect(pageurl);



			//if (File.Exists(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + filename)))
			//{
			//    //convert to .xls here
			//    try
			//    {
			//        DataSet dset_descstats = SpreadsheetGearUtils.GetDataSet(filename);

			//        int g = 0;

			//    }
			//    catch (Exception ex)
			//    {
			//        string result = "Sorry, the file [" + filename + "] was unable to load.  Create a new Excel file to generate the latest descriptive stats.";
			//        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);

			//    }
			//}
			//else
			//{

			//    string data_filename = filename.Replace("DescStats","Data");

			//    DataSet dset = SpreadsheetGearUtils.GetDataSet(data_filename);
			//    int dataproj_pk = Convert.ToInt32(Request.QueryString["pk"]);
			//    if(dataproj_pk > 0 & dset != null & dset.Tables.Count > 0 )
			//    {
			//        string result = "Sorry, the file [" + filename + "] was not found.  Attempting to create file now...";
			//        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);

			//        DataSet dset_descstats = utilDataProject.DataProject_Descstats(dataproj_pk, dset);

			//        SpreadsheetGearUtils.SaveDataSetToExcel(dset_descstats, filename);

			//        int g = 0;
			//    }
			//    else
			//    {
			//        string result = "Sorry, the file [" + filename + "] was not found.";
			//        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);

			//    }

			//}




		}


	}


	protected void btnDeleteDatafile_Command(object sender, CommandEventArgs e)
	{
		if (e.CommandName == "DeleteDatafile")
		{
			ASPxSpreadsheet.Visible = false;

			SQL_utils sql = new SQL_utils();

			string filename = e.CommandArgument.ToString();

			sql.NonQuery_from_SQLstring("update dp.Datafile set IsDeleted=1, deleted=getdate(), deletedBy=system_user  where filename = '" + filename + "'");

			int dataproj_pk = int.Parse(Request.QueryString["pk"]);

			LoadDatafiles(dataproj_pk);

			sql.Close();
		}


	}

	#endregion


	


	//when saving, I may need to update
	//
	//select val as var_pk, 0 as compvar_pk , 0 as dataproj_pk
	//from[dbo].[fnSplitCSV_int] ('1,2,3')
	//
	//
	// once I have the DF
	//
	// make a new datatable of M,SD,N, reference timepoint_text for each var
	//
	// ? pivot the data -> then calc the Z for each var by joining on varname
	//




	
}
