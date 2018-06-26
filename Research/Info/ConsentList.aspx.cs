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

public partial class Info_ConsentList : System.Web.UI.Page
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
		load_consentlist();

	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		GetCurrentDefaultStudyID();

		load_consentlist();
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


		lblINTRO_studyname.Text = "Consents in Study: ";
		lblStudyname_ContentPage.Text = _content_studyname;
	}

	protected void load_consentlist()
	{


		SqlCommand sqlCI = new SqlCommand();
		sqlCI.Connection = oConn;
		sqlCI.CommandType = CommandType.StoredProcedure;
		sqlCI.CommandText = "spConsentList";

		sqlCI.Parameters.Add("@studyID", SqlDbType.Int, 4);

		sqlCI.Parameters["@studyID"].Value = _content_studyID;

		SqlDataReader drCI = sqlCI.ExecuteReader();

		DataTable dtCI = new DataTable();
		dtCI.Load(drCI);

		//Persist the table in the Session object.
		Session["dtCI"] = dtCI;

		gv_consentlist.DataSource = dtCI;
		gv_consentlist.DataBind();

		panel_details.Visible = false;
	}
	protected void gv_consentlist_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			GridViewRow row = e.Row;
			//LogToPageUrgent(" ** HERE IN gv_EditCFV_Items_RowDataBound*** ");


			try
			{
				Label version = e.Row.FindControl("Version") as Label;
				int versnum = Convert.ToInt16(version.Text);

				if (versnum > 1)
				{
					Label ConsentFormName = e.Row.FindControl("ConsentFormName") as Label;
					ConsentFormName.Visible = false;

					Label consentformID = e.Row.FindControl("consentformID") as Label;
					consentformID.Visible = false; 

				}
				else
				{
					e.Row.Style.Add("BORDER-TOP", "#666666 5px solid");
				}

				Label NumItems_lbl = e.Row.FindControl("NumItems") as Label;
				int NumItems = Convert.ToInt16(NumItems_lbl.Text);

				Button lnkbtn_Details = e.Row.FindControl("lnkbtn_Details") as Button;
				//ScriptManager1.RegisterAsyncPostBackControl(lnkbtn_Details);

				ScriptManager1.RegisterPostBackControl(lnkbtn_Details);

				if(NumItems > 0)
				{
					lnkbtn_Details.Visible = true;

				}

			}
			catch (Exception )
			{
				//LogToPageUrgent(exc.Message);
			}
		}
	}
	protected void lnkbtn_Details_Command(object sender, CommandEventArgs e)
	{
		if(e.CommandName=="details")
		{
			int cfvID = Convert.ToInt16(e.CommandArgument);

			SqlCommand sqlCI = new SqlCommand();
			sqlCI.Connection = oConn;
			sqlCI.CommandType = CommandType.StoredProcedure;
			sqlCI.CommandText = "spSEC_StudyDesign__ConsentItems";

			sqlCI.Parameters.Add("@edit", SqlDbType.Int, 4);
			sqlCI.Parameters.Add("@consentformversionID", SqlDbType.Int, 4);

			sqlCI.Parameters["@edit"].Value = 0;
			sqlCI.Parameters["@consentformversionID"].Value = cfvID;

			SqlDataReader drCI = sqlCI.ExecuteReader();

			DataTable dtCI = new DataTable();
			dtCI.Load(drCI);


			gv_details.DataSource = dtCI;
			gv_details.DataBind();
			panel_details.Visible = true;


		}
	}
}