using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
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

public partial class Info_TadpoleTXlog_REPORT : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private DBLookup oDBLookup;

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();

	//private int qs_studyID;
	//private string qs_studyname;
	//private int studymeasID;
	//private int measureID;
	//private string measurename;
	//private string measurename_nameonly;
	//private int[] studies;
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

		try
		{
			oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
			oConn.Open();
			oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
			oConnData.Open();

			if (oConnData.State == ConnectionState.Executing)
			{
				lblStatus.Text = "Connecting..........";
			}
			else if (oConnData.State == ConnectionState.Open)
			{
				lblStatus.Text = ""; // "Connected";
				//button1.Text = "Disconnect";
				//btnClear.Enabled = true;
			}


		}

		catch (Exception ex)
		{
			lblStatus.Text = ex.ToString();
			SqlConnection.ClearAllPools();

		}



		if(true)
		//if (oLogin.CheckGroupPermissions("TadpoleTXlogs".Split(',')))
		{           //enable editing here 

			LoadGrid0(); 
			LoadGrid1();
			LoadGrid2();
			LoadGrid3();
			
			Panel_graphs.Visible = true;

			CheckForPendingUpdates();

			LoadPlots();
		}
		else {

			Label lbl = new Label();
			lbl.Text = "You have not been granted access to view Tadpole Tx Log information.";
			lbl.ForeColor = Color.Red;
			Panel1.Controls.Add(lbl);

			Panel_graphs.Visible = false;

		}


		oDBLookup = new DBLookup(oConn);


		GetCurrentDefaultStudyID();


		
		if (!IsPostBack)
		{
			//Process_QueryString();
		}


	}


	protected void CheckForPendingUpdates()
	{

		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConnData;
		cmd.CommandType = CommandType.Text;
		cmd.CommandText = "select count(*) from vwall_tadpoletxlog_TOBELOGGED where subjectloggingstatus like '%*%'";

		int N_tolog = Convert.ToInt16(cmd.ExecuteScalar());

		if(N_tolog > 0)
		{
			btn_LogPending.Visible = true;
		}
		else
		{
			btn_LogPending.Visible = false;
		}




	}

	protected void LoadGrid0()
	{
		//LogToPageUrgent("preparing to load gv");
		try
		{

			Panel0.Controls.Clear();
			GridView agv = new AutoGridView("data", "vwTadpoleTxLogs__CHECK_stacked", "gv0", false, "", "all_gvNavy");


			Label lbl = new Label(); lbl.Font.Bold = true; lbl.Text = "Check 'ByWeek' vs. 'BySubject' data"; lbl.Font.Size = 12; lbl.ForeColor = Color.Navy;
			Panel0.Controls.Add(lbl);
			Panel0.Controls.Add(agv);

			GridView agv2 = new AutoGridView("data", "vwTadpoleTxLogs__CHECK_mismatch_by_ID", "gv0a", false, "","all_gvNavy");
			Label lbl2 = new Label(); lbl2.Font.Bold = true; lbl2.Text = "<br/>List of subjects with mismatches: "; lbl2.Font.Size = 10; lbl2.ForeColor = Color.Navy;

			if (agv2.Rows.Count > 0)
			{
				Panel0.Controls.Add(lbl2);
				Panel0.Controls.Add(agv2);
			}

			GridView agv3 = new AutoGridView("data", "select * from vwSEC_TadpoleTxLog_PotentialDUPS_ForWEB order by weekA, weekB, ID, [date]", "gv0b", false, "l,l,l,l,l,l,l,l,l,hyp4,hide,hyp4,hide", "all_gvNavy");
			Label lbl3 = new Label(); lbl3.Font.Bold = true; lbl3.Text = "<br/>List of potential duplicates: "; lbl3.Font.Size = 10; lbl3.ForeColor = Color.Navy;

			if (agv3.Rows.Count > 0)
			{
				Panel0.Controls.Add(lbl3);
				Panel0.Controls.Add(agv3);
			}
			else
			{
				lbl3.Text = "<br/>Hooray no duplicates!";
				Panel0.Controls.Add(lbl3);
			}



		}
		catch(Exception exc)
		{
			LogToPageUrgent(exc.Message);
		}
		//Populate_GridView("GridView_02", "select * from tblGroup where studyID = " + _content_studyID.ToString());
	}


		protected void LoadGrid1()
	{
		//LogToPageUrgent("preparing to load gv");
		try
		{

			Panel1.Controls.Clear();
			GridView agv = new AutoGridView("data", "vwSEC_Tadpole_TxHours_GROUP_TOTALS", "gv1", false, "all_l",
				"gvBlack,gvBlack,gvBlack,gvBlack,gvBoldBlack,gvGray,gvBlack,gvBlack,gvBlack,gvBlack,gvRed,gvPurple,gvDkRed,gvBlue,gvGreen,gvBlack,gvBlack,gvBlack,gvBlack");


			Label lbl = new Label(); lbl.Font.Bold = true; lbl.Text = "<br/><br/>Overall Totals by Group"; lbl.Font.Size = 12;
			Panel1.Controls.Add(lbl);
			Panel1.Controls.Add(agv);
		}
		catch(Exception exc)
		{
			LogToPageUrgent(exc.Message);
		}
		//Populate_GridView("GridView_02", "select * from tblGroup where studyID = " + _content_studyID.ToString());
	}
	


	protected void LoadGrid2()
	{
		//LogToPageUrgent("preparing to load gv");
		try
		{
			Panel2.Controls.Clear();
			GridView agv = new AutoGridView("data", "vwSEC_Tadpole_TxHours_GROUPxSITE_TOTALS", "gv2", false, "all_l",
				"gvBlack,gvBlack,gvBlack,gvBlack,gvBoldBlack,gvGray,gvBlack,gvBlack,gvBlack,gvBlack,gvRed,gvPurple,gvDkRed,gvBlue,gvGreen,gvBlack,gvBlack,gvBlack,gvBlack");

			Label lbl = new Label(); lbl.Font.Bold = true; lbl.Text = "Overall Totals by Site & Group"; lbl.Font.Size = 12;
			Panel2.Controls.Add(lbl);
			Panel2.Controls.Add(agv);
		}
		catch (Exception exc) 
		{
			LogToPageUrgent(exc.Message);
		}
		//Populate_GridView("GridView_02", "select * from tblGroup where studyID = " + _content_studyID.ToString());
	}


	protected void LoadGrid3()
	{
		//LogToPageUrgent("preparing to load gv");
//        try
//        {
			Panel3.Controls.Clear();
			GridView agv = new AutoGridView("data", "vwSEC_Tadpole_TxHours_GROUPxSITExID_TOTALS order by site, txgroup", "gv3", false, "all_l",
				"gvBlack,gvBlack,gvBlue,gvBlack,gvBlack,gvRed,gvBoldBlack,gvGray,gvBlack,gvBlack,gvBlack,gvBlack,gvRed,gvPurple,gvDkRed,gvBlue,gvGreen,gvBlack,gvBlack,gvBlack,gvBlack");


			Label lbl = new Label(); lbl.Font.Bold = true; lbl.Text = "Overall Totals by Site & Group & ID"; lbl.Font.Size = 12;
			Panel3.Controls.Add(lbl);
			Panel3.Controls.Add(agv);
		//}
		//catch (Exception) 
		//{
		//    LogToPageUrgent(exc.Message);
		//}
		////Populate_GridView("GridView_02", "select * from tblGroup where studyID = " + _content_studyID.ToString());
	}


	protected void LoadGrid4()
	{
		//LogToPageUrgent("preparing to load gv");
		//DropDownList ddlID = (DropDownList)FindControl("ddlID");

		if (ddlID.SelectedValue == "<select ID>")
		{ LogToPageUrgent("Select an ID to view."); }
		else
		{
			try
			{
				 Panel4.Controls.Clear();                 
				 GridView agv = new AutoGridView("data", "vwSEC_Tadpole_TxHours_WKLY_ByID_TOTALS__forWEB where ID = '" + ddlID.SelectedValue.ToString() + "' order by txwknum", "gv4", false, "",
						 "gvBlack,gvBlack,gvBlue,gvBlack,gvBlack,gvBlack,gvRed,gvBlack,gvBlack,gvBlack,gvBlack,gvBlack,gvRed,gvDkRed,gvDkRed,gvDkRed");


				Label lbl = new Label(); lbl.Font.Bold = true; lbl.Text = "Weekly Totals for ID: " + ddlID.SelectedValue.ToString(); lbl.Font.Size = 12;

				Panel4.Controls.Add(lbl);
				Panel4.Controls.Add(agv);

			}
			catch (Exception exc) 
			{
				LogToPageUrgent(exc.Message);
			}
			//Populate_GridView("GridView_02", "select * from tblGroup where studyID = " + _content_studyID.ToString());
		}
	}


	protected void LoadGrid4b()
	{
		try { 
			Panel4b.Controls.Clear();

			GridView agv2 = new AutoGridView("data", "vwTadpoleTxLogBySubj__List where ID = '" + ddlID.SelectedValue.ToString() + "' order by cast(date as date), [clin name]", "gv4b", false, "l,h",
					"gvBlue,gvBlack,gvBlack,gvBlack,gvBlack,gvBlack,gvBlack,gvBlack,gvBlack,gvDkRed", ",https://uwac.autism.washington.edu/research/DataEntryForms/Common/TadpoleTXlog/TadpoleTXlog.aspx?pk=");

			Label lbl2 = new Label(); lbl2.Font.Bold = true; lbl2.Text = "All entries for ID: " + ddlID.SelectedValue.ToString(); lbl2.Font.Size = 12;

			Panel4b.Controls.Add(lbl2);
			Panel4b.Controls.Add(agv2);
			}
			catch (Exception exc) 
			{
				LogToPageUrgent(exc.Message);
			}
	}


	protected void LogPending_submit(object sender, EventArgs e)
	{
		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConnData;
		sqlCmd.CommandType = CommandType.StoredProcedure;
		sqlCmd.CommandTimeout = 240;
		sqlCmd.CommandText = "sp_LogPending_TadpoleTxLogs";

		sqlCmd.ExecuteNonQuery();

		LoadGrid0(); 
		LoadGrid1();
		LoadGrid2();
		LoadGrid3();

		gv_LoggingStatus.DataBind();
		//LoadGrid4();

	}

	protected void ShowDetailsByID(object sender, EventArgs e)
	{
		LoadGrid4();
		Panel4.Visible = true;

		btnHidePanel4.Visible = true;
	}

	protected void ShowALLDetailsByID(object sender, EventArgs e)
	{
		LoadGrid4b();
		Panel4b.Visible = true;

		btnHidePanel4.Visible = true;
	}


	protected void HidePanel4(object sender, EventArgs e)
	{
		Panel4.Visible = false;
		Panel4b.Visible = false;
		btnHidePanel4.Visible = false;

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

		////Not needed on this page
		//lblINTRO_studyname.Text = "Study: ";
		//lblStudyname_ContentPage.Text = _content_studyname;
	}




	private void LogToPage(string text)
	{

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += text + "<br/>";
	}

	private void LogToPageUrgent(string text)
	{

		tblmyinfo.Rows[0].Cells[0].InnerHtml += text + "<br/>";
	}

	//private void LogToPageError(string text)
	//{
	//    if (text.Contains("rror"))
	//    {
	//        lblMyError.Text += text;
	//        lblMyInfo.Text += "";
	//    }
	//    else
	//    {

	//        lblMyInfo.Text = text.Replace("Warning: Null value is eliminated by an aggregate or other SET operation.", "");
	//        lblMyError.Text = "";
	//    }
	//}

	//private void ClearErrorLog()
	//{
	//    lblMyError.Text = "";
	//    lblMyInfo.Text = "";
	//    //tblmyerror.Rows[0].Cells[0].InnerHtml = "";
	//}



	protected void LoadPlots()
	{

		List<string> files = new List<string>();
		files.Add("wks_final.png");

		files.Add("txbegP1_final.png");
		files.Add("box_final.png");
		files.Add("hist_final.png");

		files.Add("w1_mis.png");
		files.Add("w1_ndays.png");
		files.Add("w1.png");
		files.Add("w1c.png");
		files.Add("w1cl.png");
		files.Add("w1h.png");
		files.Add("w1o.png");
		files.Add("w1s.png");
		files.Add("w1.png");

		panelPlots.Controls.Clear();

		foreach (string f in files)
		{
			System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();
			img.ImageUrl = f;
			panelPlots.Controls.Add(img);
		}



	}

}



