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

public partial class Info__testlinks : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private ReadConfig oConfig = new ReadConfig();


	//needed for using the DefaultStudyID
	private int _content_studyID;
	private string _content_studyname;
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
		loadgrid();
	}




	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

		GetCurrentDefaultStudyID();

		if (!IsPostBack)
		{
			loadgrid();
		}

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


		lblINTRO_studyname.Text = "Study: ";
		lblStudyname_ContentPage.Text = _content_studyname;
	}


	protected void loadgrid()
	{

		Panel_gv.Controls.Clear();
		GridView agv = new AutoGridView("backend", "exec spSEC__GUIDstatus_by_studyID " + _content_studyID.ToString() + ", ''"
			, "gv4", false, "l,l,l,l,hyp4,hide,l,l,l,l,l,l,l,hyp4,hide",
			"gvBlack,gvBlack,gvBlack,gvBlack,gvBlue,gvBlue,gvDkRed,gvDkRed,gvDkRed,gvDkRed,gvBlack,gvBlack,gvBlack,gvBlue"
			,""
			, "");


		Label lbl = new Label(); lbl.Font.Bold = true; lbl.Text = "<br/>NDAR GUID INFO" ; lbl.Font.Size = 12;

		Panel_gv.Controls.Add(lbl);
		Panel_gv.Controls.Add(agv);

	}
}