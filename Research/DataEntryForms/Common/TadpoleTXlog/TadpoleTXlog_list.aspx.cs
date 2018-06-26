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

public partial class TadpoleTXlog_list : System.Web.UI.Page
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

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
		oConnData.Open();
		
		oDBLookup = new DBLookup(oConn);


		GetCurrentDefaultStudyID();

		
		if (!IsPostBack)
		{
			//Process_QueryString();
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


		//lblINTRO_studyname.Text = "Study: ";
		//lblStudyname_ContentPage.Text = _content_studyname;
	}


	protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			Button btn_EditTrigger = e.Row.FindControl("btnLogIt") as Button;
			Label lbl_status = e.Row.FindControl("lbl_status") as Label;

			if (lbl_status.Text.StartsWith("Logged."))
			{
				//btn_EditTrigger.Visible = false;

			}


			Label lbl_miss1 = e.Row.FindControl("lbl_miss1") as Label;
			Label lbl_miss2 = e.Row.FindControl("lbl_miss2") as Label;
			Label lbl_miss3 = e.Row.FindControl("lbl_miss3") as Label;
			Label lbl_miss_appttype = e.Row.FindControl("lbl_miss_appttype") as Label;

			Label lbl_days_since_prev= e.Row.FindControl("lbl_days_since_prev") as Label;


			if (Convert.ToDouble(lbl_miss1.Text) > 0)
			{
				lbl_miss1.ForeColor = Color.Red;
				lbl_miss1.Font.Bold= true;

			}
			else lbl_miss1.ForeColor = Color.Black;
			
			if (Convert.ToDouble(lbl_miss2.Text) > 0)
			{
				lbl_miss2.ForeColor = Color.Red;
				lbl_miss2.Font.Bold = true;
			}
			else lbl_miss2.ForeColor = Color.Black;

			if (Convert.ToDouble(lbl_miss3.Text) > 0)
			{
				lbl_miss3.ForeColor = Color.Red;
				lbl_miss3.Font.Bold = true;
			}
			else lbl_miss3.ForeColor = Color.Black;


			if (Convert.ToDouble(lbl_miss_appttype.Text) > 0)
			{
				lbl_miss_appttype.ForeColor = Color.Red;
				lbl_miss_appttype.Font.Bold = true;
			}
			else lbl_miss_appttype.ForeColor = Color.Black;

			if (Convert.ToDouble(lbl_days_since_prev.Text) > 10)
			{
				lbl_days_since_prev.ForeColor = Color.Red;
				lbl_days_since_prev.Font.Bold = true;
			}
			else lbl_days_since_prev.ForeColor = Color.Black; 

			

		}

	}

	protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		switch (e.CommandName) {
			case "LogTo_BySubj":
				LogTo_BySubj(Convert.ToInt32(e.CommandArgument.ToString()));
				break;
		}

	}


	protected void LogTo_BySubj(int ttl_pk)
	{
		if (ttl_pk > 0)
		{
			try
			{
				SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("spLOG_all_tadpoletxlog", oConnData);
				sqlCmd.CommandType = CommandType.StoredProcedure;
				if (oConnData.State == ConnectionState.Closed) oConnData.Open();
				sqlCmd.Parameters.Add("@ttl_pk", SqlDbType.Int);

				sqlCmd.Parameters["@ttl_pk"].Value = ttl_pk;

				sqlCmd.ExecuteNonQuery();

			}
			catch (SqlException )
			{

			}
		}
	}

}



