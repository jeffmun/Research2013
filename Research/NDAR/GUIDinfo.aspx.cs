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
using System.Data.OleDb;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;
using uwac;

public partial class NDAR_GUIDinfo : BasePage //System.Web.UI.Page
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
		Session["guid_studyID"] = Master.Master_studyID.ToString();
		loadgrid();
	}




	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

		GetCurrentDefaultStudyID();

		Session["guid_studyID"] = Master.Master_studyID.ToString();
		lblStudyname_ContentPage.Text = Master.Master_studyname;

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
		SQL_utils sql = new SQL_utils("backend");

		//string sqlcode = "exec spSEC__GUIDstatus_by_studyID " + Master.Master_studyID.ToString() + ", ''";
		//DataTable dtguid = sql.DataTable_from_SQLstring(sqlcode);

		//gridGuid.DataSource = dtguid;
		//gridGuid.DataBind();


		//Panel_gv.Controls.Clear();
		//GridView agv = new AutoGridView("backend", "exec spSEC__GUIDstatus_by_studyID " + _content_studyID.ToString() + ", ''"
		//	, "gv4", false, "l,l,l,l,l,hyp4,hide,l,l,l,l,l,l,l,hyp4,hide",
		//	"gvBlack,gvPurple,gvBlack,gvBlack,gvBlack,gvBlue,gvBlue,gvDkRed,gvDkRed,gvDkRed,gvDkRed,gvBlack,gvBlack,gvBlack,gvBlue"
		//	,""
		//	, "");


		//agv.RowDataBound += agv_RowDataBound;

		//Label lbl = new Label(); lbl.Font.Bold = true; lbl.Text = "<br/>NDAR GUID INFO" ; lbl.Font.Size = 12;

		//Panel_gv.Controls.Add(lbl);
		//Panel_gv.Controls.Add(agv);


		DataTable dt = sql.DataTable_from_SQLstring(       "select -1 personID, '--select subject for Invalid GUID--' IDlabel " +
				"union select a.personID, b.ID + '...' + GUID_status as IDlabel " + 
				"from vwNDAR_GUID_PII a " +
				"join vwMasterStatus_S b ON a.personID = b.personID " +
				"where GUID_status not like '1) Has GUID' and GUID_status not like '%Has INV_GUID%' " +
				"and studyID=" + Master.Master_studyID.ToString() + " order by 2");


		int nINV_left = sql.IntScalar_from_SQLstring("select count(*) from NDAR..GUID_not_yet_used");

		if (nINV_left==0)
		{
			lbl_nINVleft.Text = "There are " + nINV_left.ToString() + " INV GUIDs available for assignment. **GET MORE**";
		}
		else
		{
			lbl_nINVleft.Text = "There are " + nINV_left.ToString() + " INV GUIDs available for assignment.";
		}


		sql.Close();

		ddlPotentialINVALID.DataValueField = "personID";
		ddlPotentialINVALID.DataTextField = "IDlabel";
		ddlPotentialINVALID.DataSource = dt;
		ddlPotentialINVALID.DataBind();


	}

	protected void agv_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if(e.Row.RowType == DataControlRowType.DataRow)
		{

			DataRowView row = (DataRowView ) e.Row.DataItem;


			if(row["subjstatus"].ToString()=="DQ")
			{
				e.Row.BackColor = Color.PaleVioletRed;
			}
		}
	}




	protected void btnCreateGUIDfile_Click(object sender, EventArgs e)
	{
		GUID_fileinfo("savefile");
		btnDisplayGUIDFileInfo.Visible = true;
		btnCreateGUIDfile.Visible = false;
		btnCancel.Visible = false;
	}

	protected void btnDisplayGUIDFileInfo_Click(object sender, EventArgs e)
	{
		GUID_fileinfo("displayinfo");

		btnDisplayGUIDFileInfo.Visible = false;
		btnCreateGUIDfile.Visible = true;
		btnCancel.Visible = true;

	}


	protected void GUID_fileinfo(string stage)
	{
		SQL_utils sql = new SQL_utils();

		string proc = "NDAR..spNDAR_WEB_GUID_to_create_MULTIPLE_by_study";
		string mode = "_new_guid";

		if (rblMode.SelectedValue == "convert")
		{
			proc = "NDAR..spNDAR_WEB_GUID_to_convert_INVGUID_MULTIPLE_by_study";
			mode = "_convert_INVGUID";
		}

		string consent = "skip_consent";
		if (chkConsent.Checked)
		{
			consent = "use_consent";
		}
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
		ps.Add(sql.CreateParam("useconsent", consent, "text"));


		DataSet ds = sql.DataSet_from_ProcName(proc, ps);

		if (stage == "displayinfo")
		{

			GridView gv = new GridView();
			gv.BorderStyle = BorderStyle.None;
			gv.BorderColor = Color.White;
			gv.DataSource = ds.Tables[0];
			gv.DataBind();
			panelGuidFileInfo.ContentTemplateContainer.Controls.Add(gv);

			GridView gv2 = new GridView();
			gv2.BorderStyle = BorderStyle.None;
			gv2.BorderColor = Color.White;
			gv2.DataSource = ds.Tables[1];
			gv2.DataBind();
			panelGuidFileInfo.ContentTemplateContainer.Controls.Add(gv2);
			panelGuidFileInfo.Update();
		}

		else if (stage == "savefile")
		{
			string datetime = SpreadsheetGearUtils.DateTime_for_filename();
			SpreadsheetGearUtils.SaveDataTableToFile(ds.Tables[0], Master.Master_studyname + mode + datetime, "csv");
		}

		sql.Close();
	}
	protected void btnCancel_Click(object sender, EventArgs e)
	{
		Response.Redirect(this.Request.Url.ToString());
	}

	protected void btnAssignINVALID_Click(object sender, EventArgs e)
	{
		int personID = Convert.ToInt32(ddlPotentialINVALID.SelectedValue.ToString());

		if(personID > 0)
		{
			SQL_utils sql = new SQL_utils("backend");
			sql.NonQuery_from_SQLstring("exec NDAR..spGUID_assign_INV_GUID__to_personID " + personID.ToString());
			sql.Close();

			ddlPotentialINVALID.SelectedIndex = 0;

			Response.Redirect("GUIDinfo.aspx");
		}
	}

	protected void ddlPotentialINVALID_SelectedIndexChanged(object sender, EventArgs e)
	{
		int personID = Convert.ToInt32(ddlPotentialINVALID.SelectedValue.ToString());
		if (personID > 0)
		{
			btnAssignINVALID.Visible = true;
		}
	}
}