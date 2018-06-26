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


public partial class Info_DeletedRecs : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();

	private string[] group_names = new string[12];
	private string[] timepoint_names = new string[12];
	private string[] subjstatus_names = new string[12];

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

	}


	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

		GetCurrentDefaultStudyID();

		Populate_DeletedRecs_Gridview();

		if (!IsPostBack)
		{
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


//        lblINTRO_studyname.Text = "Study: ";
//        lblStudyname_ContentPage.Text = _content_studyname;
	}

	//Populate the Subjects Gridview
	protected void Populate_DeletedRecs_Gridview()
	{

		Panel1.Controls.Clear();
		Panel1.Visible = true;

		try
		{

			string sql = "select * from vwDeletedRecs  order by deleted desc";
			GridView DeletedRecs_gridview = new AutoGridView("data", sql, "SubjectDetails_gridview", false, "", "", "");

			Panel1.Controls.Clear();
			Panel1.Controls.Add(DeletedRecs_gridview);

			#region ORIG version
			//// here the cols are actually rows
			//SqlCommand sqlCmd_GetSubj = new System.Data.SqlClient.SqlCommand("exec spSEC_PIVOT__RowEQ_Subject__Dynamic_Where " + " ''," + where_cols, oConn);
			//DataTable dt_GetSubj = new DataTable();

			//SqlDataReader SqlReader_GetSubj = sqlCmd_GetSubj.ExecuteReader();
			//dt_GetSubj.Load(SqlReader_GetSubj);

			////SqlDataAdapter sqlAdapter_GetSubj = new SqlDataAdapter(sqlCmd_GetSubj);
			////sqlAdapter_GetSubj.Fill(dt_GetSubj);
			//int num_subjects = dt_GetSubj.Rows.Count;


			////build the Gridview & columns
			//GridView SubjectDetails_gridview = new GridView();
			//SubjectDetails_gridview.ID = "SubjectDetails_gridview";
			//SubjectDetails_gridview.AutoGenerateColumns = true;
			//SubjectDetails_gridview.CssClass = "tblinputsmall_blue";
			////SubjectDetails_gridview.RowDataBound += new GridViewRowEventHandler(SubjStatus_Totals_gridview_RowDataBound);


			////Bind the data
			//SubjectDetails_gridview.DataSource = dt_GetSubj;
			//SubjectDetails_gridview.DataBind();
			//Panel_SubjectDetails.Controls.Add(SubjectDetails_gridview);
			#endregion

		}

		catch (SqlException oException)
		{
			//errorLink1.InnerHtml += oException.Message;  //new with full study

			foreach (SqlError oErr in oException.Errors)
			{
				tblmyinfo.Rows[0].Cells[0].InnerHtml += oErr.Message;
			}
		}

	}


	#region ====== Utilities ======
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




