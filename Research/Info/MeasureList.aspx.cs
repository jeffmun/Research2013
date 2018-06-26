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
using System.Data.OleDb;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;

public partial class Info_MeasureList : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private DBLookup oDBLookup;

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();
	
	private int _content_studyID;
	private string _content_studyname;

		//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
		
		oDBLookup = new DBLookup(oConn);


		GetCurrentDefaultStudyID();

	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		GetCurrentDefaultStudyID();
		GridView1.DataBind();

		load_studymeaslist("1");
	}


	protected void GetCurrentDefaultStudyID()
	{
		
		SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("exec spSEC_Get_Default_StudyID_for_User", oConn);
		DataTable dt = new DataTable();
		SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
		sqlAdapter.Fill(dt);

		foreach (DataRow row in dt.Rows)
		{
			_content_studyID = Convert.ToInt16(row["defaultstudyID"]);
			_content_studyname = Convert.ToString(row["studyname"]);
		}


		lblINTRO_studyname.Text = "Measures in Study: ";
		lblStudyname_ContentPage.Text = _content_studyname;
	}

	protected void Change_SortMethod(object sender, EventArgs e)
	{
		GridView1.DataBind();
	}

	protected void btnRefresh_Click(object sender, EventArgs e)
	{
		GridView1.DataBind();
	}


	protected void load_studymeaslist(string sortorder)
	{
		string sql="";

		if(sortorder == "1")
		{
			sql = "  select measureID mID, Measname, TimePoint_text as TimePoint, studymeasID, StudyMeasName from vwMasterStatus_StudyMeas where studyID = " + _content_studyID.ToString() + " order by measname, timepoint_text, studymeasname";
		}

		else if (sortorder == "2")
		{
			sql = "  select TimePoint_text as TimePoint, measureID mID, Measname,  studymeasID, StudyMeasName from vwMasterStatus_StudyMeas where studyID = " + _content_studyID.ToString() + " order by timepoint_text, measname,  studymeasname";
		}
		else if (sortorder == "3")
		{
			sql = "  select TimePoint_text as TimePoint, measureID mID, Measname,  studymeasID, StudyMeasName from vwMasterStatus_StudyMeas where studyID = " + _content_studyID.ToString() + " order by studymeasID ";
		}
		GridView sm_gridview = new AutoGridView("backend", sql, "sm_gridview");


		sm_panel.Controls.Clear();
		sm_panel.Controls.Add(sm_gridview);


	}

	protected void sm_sort_1(object sender, EventArgs e)
	{
		load_studymeaslist("1");
	}
	protected void sm_sort_2(object sender, EventArgs e)
	{
		load_studymeaslist("2");
	}
	protected void sm_sort_3(object sender, EventArgs e)
	{
		load_studymeaslist("3");
	}


}