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

public partial class Info_DataEntryTotals : System.Web.UI.Page
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
		Panel2.Controls.Clear();
		Populate_GridView("Panel1", "GridView_01", "exec  spAUTOSET__GetStudyMeas_by_StudyID_Access_by_USER " + _content_studyID.ToString(), oConnData);
		Panel1.Visible = true;
		Panel2.Visible = false;
		Panel1_header.Visible = true;
		Panel2_header.Visible = false;

		Panel_DataSets.Visible = false;
		btnShowHide_Panel_DataSets.Visible = true;

	}

	protected void LoadGridsForSet()
	{
		
		Panel1.Controls.Clear();
		Panel2.Controls.Clear();
		Populate_GridView("Panel2", "GridView_02", "exec  spAUTOSET__GetStudyMeas_by_setPK_Access_by_USER " + ddl_set.SelectedValue.ToString(), oConnData);

		Panel1.Visible = false;
		Panel2.Visible = true;
		Panel1_header.Visible = false;
		Panel2_header.Visible = true;
		
		Panel_DataSets.Visible = true;
		btnShowHide_Panel_DataSets.Visible = false;
	}

	protected void Click_DisplaySetPanel(object sender, EventArgs e)
	{
		Panel_DataSets.Visible = true;
		btnShowHide_Panel_DataSets.Visible = false;
	}

	

	protected void Click_LoadSet(object sender, EventArgs e)
	{
		LoadGridsForSet();
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

			GridView gv = new GridView();
			LogToPage("here in Populate_GridView  3");

			gv.ID = gv_name;
			gv.DataSource = dt; 
			LogToPage("here in Populate_GridView  4");

			gv.DataBind();
			LogToPage("here in Populate_GridView  5");

			Control ctl = this.FindControlRecursive(this.Page, panel_name);
			LogToPage("here in Populate_GridView  6");

			Panel panel = (Panel)ctl;
			panel.Controls.Add(gv);

			LogToPage("here in Populate_GridView  7");

			panel.Visible = true;

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
}



