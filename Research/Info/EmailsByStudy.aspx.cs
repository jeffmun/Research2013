using System;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using AutismCenterBase.Utilities;

public partial class Info_EmailsByStudy : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private DBLookup oDBLookup;

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();

	private int _content_studyID;
	private string _content_studyname;
	private string version;

   
	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		GetCurrentDefaultStudyID();
		loadEmails();
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
	}

	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
	   // version = "1";
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	  
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
		oConnData.Open();

		GetCurrentDefaultStudyID();

		loadEmails();
	}

	protected void loadEmails()
	{

				//need to add the groups and subjstatus here
		string sql = "exec spSEC_Emails_by_study " + _content_studyID.ToString();



		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConn;
		cmd.CommandType = CommandType.Text;
		cmd.CommandText = sql;


		SqlDataReader SqlReader = cmd.ExecuteReader();

		//Fill the data table
		DataTable dt = new DataTable();
		dt.Load(SqlReader);

		gv1.DataSource = dt;
		gv1.DataBind();

	}





}
