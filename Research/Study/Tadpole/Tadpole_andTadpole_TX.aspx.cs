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
using uwac;


public partial class Study_Tadpole_Tadpole_and_Tadpole_TX : BasePage
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

		oDBLookup = new DBLookup(oConn);


		GetCurrentDefaultStudyID();

		LoadIt();
		
		if (!IsPostBack)
		{
			//Process_QueryString();
		}


	}



	protected void LoadIt()
	{
		////GridView it = new jmgv(oConn);
		//GridView gv0a = new AutoGridView("backend", "select * from vwTadpole_details_1");

		//Panel0a.Controls.Add(gv0a);


		//GridView gv1a = new AutoGridView("data", "select * from vwTadpole_and_Tadpole_TX_subjects_summary where [Site]='MIND'");
		//GridView gv1b = new AutoGridView("data", "select * from vwTadpole_and_Tadpole_TX_subjects_summary where [Site]='UW'");
		//GridView gv1c = new AutoGridView("data", "select * from vwTadpole_and_Tadpole_TX_subjects_summary where [Site]='VU'");

		//Panel1a.Controls.Add(gv1a);
		//Panel1b.Controls.Add(gv1b);
		//Panel1b.Controls.Add(gv1c);

		GridView it = new AutoGridView("data", "select * from vwTadpole_and_Tadpole_TX_subjects", "gv2", false,
			"l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l", "gvBlack,gvBlack,gvBlack,gvBlack,gvBlack,gvBlack,gvBlack,gvBlue,gvBlue,gvBlue,gvBlack,gvBlack,gvBlack,gvPurple,gvPurple,gvPurple,gvPurple,gvPurple,gvRed");  //"black,black,black,black,black,blue,blue,blue,black,black,red");

		Panel2.Controls.Add(it);
			   
	}


	protected void LoadGrids()
	{

		LogToPageUrgent("preparing to load gv");

		try
		{
		   // GridView gv = new GridView( IEnumerable<DynamicGV>(gv, "select * from tblEthnicity", oConn));
		   // gv.ID = "mygv";

		   //// DynamicGV(gv, "select * from tblEthnicity", oConn);
			

		   // gv.Visible = true;
		   // LogToPageUrgent(gv.Columns.Count.ToString());
		   // Panel1.Controls.Add(gv);

		   // Panel1.Visible = true;
		}
		catch
		{
			LogToPageUrgent("catch");
		}
		//Populate_GridView("GridView_02", "select * from tblGroup where studyID = " + _content_studyID.ToString());

	}
	

	protected void GetCurrentDefaultStudyID()
	{
		//if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-------> GetCurrentDefaultStudyID <br/>";

		//SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("exec spSEC_Get_Default_StudyID_for_User", oConn);
		//DataTable dt = new DataTable();
		//SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
		//sqlAdapter.Fill(dt);

		//foreach (DataRow row in dt.Rows)
		//{
		//	_content_studyID = Convert.ToInt16(row["defaultstudyID"]);
		//	_content_studyname = Convert.ToString(row["studyname"]);
		//}


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



}




