using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;

public partial class NDAR_Measures_by_study : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private DBLookup oDBLookup;

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();
	
	private int qs_studyID;
	private string qs_studyname;
	private int studymeasID;
	private int measureID;
	private string measurename;
	private string measurename_nameonly;
	private int[] studies;
	private int _content_studyID ;
	private string  _content_studyname ;

	private bool debugprint = false;

	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}


	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		GetCurrentDefaultStudyID();

		//Populate_DDL_SelectMeasureID(0);  //load the DDL with the measures in this study
		LoadGrids();
	}


	//protected string MySelectedMeasureID
	//{
	//    get
	//    {
	//        return (ViewState["MySelectedMeasureID"] == null) ? null : ViewState["MySelectedMeasureID"].ToString();
	//    }
	//    set
	//    {
	//        ViewState["MySelectedMeasureID"] = value;
	//    }
	//}

	protected void Page_Load(object sender, EventArgs e)
	{

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
		oConnData.Open();

		oDBLookup = new DBLookup(oConn);

		LogToPage("here in load.");
		GetCurrentDefaultStudyID();

		SqlCommand cmd = new SqlCommand("select '\\\\autism-sql\\' + path from NDAR.._const", oConnData);

		string current_path = (string)cmd.ExecuteScalar();

		lblCurrentPath.Text = current_path;

		LoadGrids();

		////TOHANDLE VIEWSTATE
		//// Check if the selectedValue has changed.
		//string selectedValue = Request[DDL_SelectMeasureID.UniqueID];
		//if (selectedValue != MySelectedMeasureID)
		//{
		//    // Value has changed, do whatever you would do in the SelectedIndexChanged event here.
		//}
		//MySelectedMeasureID = selectedValue;

		//// TODO: Populate the drop-down control
		//Populate_DDL_SelectMeasureID(0);

		//// set the set the selectedValue on the drop-down
		//if (selectedValue != null)
		//{
		//    DDL_SelectMeasureID.Items.FindByValue(selectedValue).Selected = true;
		//}


		if (!IsPostBack)
		{
			//Process_QueryString();
		}


	}


	protected void LoadGrids()
	{
		LogToPage("here in LoadGrids.");

		Panel1.Controls.Clear();
		Populate_GridView("Panel1", "GridView_01", "exec  spNDAR__Study_Specific_Views " + _content_studyID.ToString(), oConnData);
		Panel1.Visible = true;
		Panel1_header.Visible = true;

		Populate_GridView("Panel1a", "GridView_01a", "exec  spNDAR_tables_and_views_by_CurrentStudy " + ddl_SortOrder.Text, oConnData);
		Panel1a.Visible = true;
		Panel1a_header.Visible = true;


		Panel2.Controls.Clear();        
		Panel2.Visible = false;
		Panel2_header.Visible = false;

	}

	protected void Update_GridView02(object sender, EventArgs e)
	{
		Populate_GridView("Panel1a", "GridView_01a", "exec  spNDAR_tables_and_views_by_CurrentStudy " + ddl_SortOrder.Text, oConnData);
	}


	protected void gv_Tables_Views_RowDataBound(object sender, GridViewRowEventArgs e)
	{

		GridView mygv = (GridView)e.Row.NamingContainer;
		int counter = 0;


		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			counter++;

			//LogToPage(mygv.ToString() + "<br/>");

			//We're only interested in Rows that contain data
			//get a reference to the data used to databound the row
			DataRowView drv = ((DataRowView)e.Row.DataItem);

			//hide the dup rows of studyaction info

			if (drv["NDAR_view_status"].ToString() == "3) N/A FOR NDAR")
			{
				e.Row.BackColor = Color.Silver;
			}


			if (drv["ShortName"].ToString() == "")
			{
				Button btn_ShortName = e.Row.FindControl("btn_ShortName") as Button;
				if (btn_ShortName != null)
				{
					btn_ShortName.Visible = false;
				}
			}


			if (drv["inDataDB__UW_NDARview"].ToString() == "")
			{
				Button btn_1 = e.Row.FindControl("btn_1") as Button;
				if (btn_1 != null)
				{
					btn_1.Visible = false;
				}
			}

			if (drv["inNDAR_DS__UW_NDARview"].ToString() == "")
			{
				Button btn_2 = e.Row.FindControl("btn_2") as Button;
				if (btn_2 != null)
				{
					btn_2.Visible = false;
				}
			}

			if (drv["inNDAR_SSV__NDARview"].ToString() == "")
			{
				Button btn_3 = e.Row.FindControl("btn_3") as Button;
				if (btn_3 != null)
				{
					btn_3.Visible = false;
				}
			}

			


		}
	}



	protected void gv_Tables_Views_GridButtons_Command(object sender, CommandEventArgs e)
	{
		if (Convert.ToString(e.CommandName) == "ShowViewDef")
		{
			Load_gv_ViewDef(Convert.ToString(e.CommandArgument), "data");
		}

		if (Convert.ToString(e.CommandName) == "ShowViewDefNDAR")
		{
			Load_gv_ViewDef(Convert.ToString(e.CommandArgument), "NDAR");
		}


		if (Convert.ToString(e.CommandName) == "ShowNDARdse")
		{
			Load_gv_NDARdse(Convert.ToString(e.CommandArgument));
			Load_gv_UWtable(Convert.ToString(e.CommandArgument));
		}

		


	}



	protected void Load_gv_NDARdse(string ds_pk)
	{
		
		//try
		//{
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oConnData;
			if (oConnData.State == ConnectionState.Closed) oConnData.Open();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "spDEF__View_NDARdse";

			cmd.Parameters.Add("@ds_pk_txt", SqlDbType.VarChar, 10);
			cmd.Parameters["@ds_pk_txt"].Value = ds_pk;

			SqlDataReader rdr = cmd.ExecuteReader();

			DataTable dt = new DataTable();
			dt.Load(rdr);


			NDARdse_lblTitle.Text = ds_pk;


			gv_NDARdse.AutoGenerateColumns = false;
			gv_NDARdse.DataSource = dt;

			gv_NDARdse.DataBind();

			
			Panel_NDARdse.Update();

		//}
		//catch (SqlException exc)
		//{
		//    LogToPageError(exc.Message);
		//}
	}


	protected void gv_NDARdse_RowDataBound(object sender, GridViewRowEventArgs e)
	{

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			DataRowView drv = ((DataRowView)e.Row.DataItem);

			if (drv["UWfld"].ToString() != "")
			{
				e.Row.BackColor = Color.Thistle;
				if (NDARdse_chkShowOnlyUnmatched.Checked) e.Row.Visible = false;

			}

		}
	}

	
	
	protected void Refresh_NDARdse(object sender, EventArgs e)
	{
		 gv_NDARdse.DataBind();
		 gv_UWtable.DataBind();
		 
			Panel_NDARdse.Update();
	}


	protected void Load_gv_UWtable(string ds_pk)
	{

		//try
		//{
		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConnData;
		if (oConnData.State == ConnectionState.Closed) oConnData.Open();
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.CommandText = "spDEF__View_UWtable";

		cmd.Parameters.Add("@ds_pk_txt", SqlDbType.VarChar, 10);
		cmd.Parameters["@ds_pk_txt"].Value = ds_pk;

		SqlDataReader rdr = cmd.ExecuteReader();

		DataTable dt = new DataTable();
		dt.Load(rdr);


		NDARdse_lblTitle.Text = ds_pk;


		gv_UWtable.AutoGenerateColumns = false;
		gv_UWtable.DataSource = dt;

		gv_UWtable.DataBind();


		Panel_NDARdse.Update();

		//}
		//catch (SqlException exc)
		//{
		//    LogToPageError(exc.Message);
		//}
	}


	protected void gv_UWtable_RowDataBound(object sender, GridViewRowEventArgs e)
	{

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			DataRowView drv = ((DataRowView)e.Row.DataItem);

			if (drv["used"].ToString() == "1")
			{
				e.Row.BackColor = Color.Thistle;

				if (UWtable_chkShowOnlyUnmatched.Checked) e.Row.Visible = false;
			}

		}
	}





	protected void Load_gv_ViewDef(string vwname, string db)
	{
		try
		{
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oConnData;
			if (oConnData.State == ConnectionState.Closed) oConnData.Open();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "spDEF__ViewDef";

			cmd.Parameters.Add("@vwname", SqlDbType.VarChar,200);
			cmd.Parameters["@vwname"].Value = vwname;

			cmd.Parameters.Add("@db", SqlDbType.VarChar, 10);
			cmd.Parameters["@db"].Value = db;


			SqlDataReader rdr = cmd.ExecuteReader();

			DataTable dt = new DataTable();
			dt.Load(rdr);

			lblVwName.Text = vwname;
			//int i = 0;
			//foreach (DataRow row in dt.Rows)
			//{
			//    if (i == 0)
			//    {
			//        lblVwName.Text = Convert.ToString(row["VwName"]);
			//    }
			//    i++;
			//}

			gv_ViewDef.DataSource = dt;

			gv_ViewDef.DataBind();



		}
		catch (SqlException exc)
		{

		}
	}


	protected void Click_LoadStudy(object sender, EventArgs e)
	{
		LoadGrids();
	}


	protected void GetCurrentDefaultStudyID()
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-------> GetCurrentDefaultStudyID <br/>";

		SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("exec spSEC_Get_Default_StudyID_for_User", oConn);
		DataTable dt = new DataTable();
		SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
		sqlAdapter.Fill(dt);

		foreach (DataRow row in dt.Rows)
		{
			_content_studyID = Convert.ToInt16(row["defaultstudyID"]);
			_content_studyname = Convert.ToString(row["studyname"]);
		}


		//Control ctl = this.FindControlRecursive(this.Panel1, "lblStudyname_ContentPage");
		//Label lbl1 = (Label)ctl;

		lblStudyname_ContentPage.Text = _content_studyname;
	}




	protected void Populate_GridView(string panel_name, string gv_name, string mycmd, SqlConnection con)
	{
		LogToPage("here in Populate_GridView: " + panel_name + ", " + gv_name );


		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "<br/>---> Populate:" + gv_name + "  <br/>";

		try
		{
		
			   if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "--> mycmd: " + mycmd + "<br/>";

			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(mycmd, con);
			SqlDataReader sqlReader = sqlCmd.ExecuteReader();
			DataTable dt = new DataTable();
			LogToPage("here in Populate_GridView  1");
			dt.Load(sqlReader);
			LogToPage("here in Populate_GridView  2");


			if (gv_name == "GridView_01a")
			{
				gv_Tables_Views.DataSource = dt;
				gv_Tables_Views.DataBind();
			}

			else
			{
				GridView gv = new GridView();
				LogToPage("here in Populate_GridView  3");

				gv.ID = gv_name;
				gv.DataSource = dt;
				LogToPage("here in Populate_GridView  4");

				gv.RowCommand += new GridViewCommandEventHandler(gv_RowCommand);

				gv.DataBind();
				LogToPage("here in Populate_GridView  5");


				if (gv_name == "GridView_01")
				{
					foreach (System.Web.UI.WebControls.GridViewRow row in gv.Rows)
					{

						string val = row.Cells[11].Text; // row["NDARview"];
						row.Cells[0].Text = "";
						System.Web.UI.WebControls.Button btn = new System.Web.UI.WebControls.Button();
						btn.Text = "Export file";
						btn.CommandName = "cmdExport";
						btn.CommandArgument = val;
						row.Cells[0].Controls.Add(btn);
					}
				}





				Control ctl = this.FindControlRecursive(this.Page, panel_name);
				LogToPage("here in Populate_GridView  6");

				Panel panel = (Panel)ctl;
				panel.Controls.Add(gv);

				LogToPage("here in Populate_GridView  7");

				panel.Visible = true;
			}

		}


		catch (SqlException oException)
		{
			LogToPage("here in error. ");

			foreach (SqlError oErr in oException.Errors)
			{
				tblmyinfo.Rows[0].Cells[0].InnerHtml += oErr.Message;
			}
		}

	}

	void gv_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		switch (e.CommandName)
		{
			case "cmdExport":
				ExportFile(e.CommandArgument.ToString());

				break;
		}
	}


	protected void ExportFile(string viewname)
	{

		try
		{
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("exec spNDAR__ExportFile '" + viewname + "'", oConnData);
			sqlCmd.CommandTimeout = 120;
			sqlCmd.ExecuteNonQuery();
		}
		catch (SqlException exc)
		{
			LogToPageError(exc.Message);
		}

		//refresh the page
		LoadGrids();
	}


	protected void ExportFile_ALL(object sender, EventArgs e)
	{
		GridView GridView_01 = (GridView)Panel1.FindControl("GridView_01");
		string views = "";

		foreach(GridViewRow row in GridView_01.Rows)
		{
			string viewname = row.Cells[11].Text;
			views += row.Cells[11].Text + " <br/>";

			try
			{
				SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("exec spNDAR__ExportFile '" + viewname + "'", oConnData);
				sqlCmd.ExecuteNonQuery();
			}
			catch (SqlException exc)
			{
				LogToPageError(exc.Message);
			}



		}

		
		//refresh the page
		LoadGrids();
	}




	#region Misc Utilities 
	//Use to find controls in other controls
	private Control FindControlRecursive(Control rootControl, string controlID)
	{
		if (rootControl.ID == controlID) return rootControl;

		foreach (Control controlToSearch in rootControl.Controls)
		{
			Control controlToReturn =
				FindControlRecursive(controlToSearch, controlID);
			if (controlToReturn != null) return controlToReturn;
		}
		return null;
	}

	private void LogToPage(string text)
	{

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += text + "<br/>";
	}

	private void LogToPageUrgent(string text)
	{

		tblmyinfo.Rows[0].Cells[0].InnerHtml += text + "<br/>";
	}

	private void LogToPageError(string text)
	{
		if (text.Contains("rror"))
		{
			lblMyError.Text += text;
			lblMyInfo.Text += "";
		}
		else
		{

			lblMyInfo.Text = text.Replace("Warning: Null value is eliminated by an aggregate or other SET operation.", "");
			lblMyError.Text = "";
		}
	}
	#endregion

}



