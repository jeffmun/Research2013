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
using uwac;



public partial class Info_ResetVerified : BasePage //System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();
	
	private DBLookup oDBLookup;
	private string[] _colnames;
	private string[] _url1;
	private int studyID;
	private string datasource;
	private string mydatasource;

	
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
		Populate_Studymeas_DDL();
		Populate_ID_DDL(0);
		Populate_IDdelete_DDL(0);
		LoadTxLogClins();

		Populate_delSubj_ID_DDL();

		btnReset.Visible = false;
		panelDelete.Visible = false;
		lbl_Clin.Visible = false;
		ddl_Clin.Visible = false;
	}


	protected void Page_Load(object sender, EventArgs e)
	{

		//UpdpatePanel01.RegisterAsyncPostBackControl(); 


		if (!IsPostBack)
		{
			Populate_Studymeas_DDL();
			Populate_ID_DDL(0);
			LoadTxLogClins();
			//LoadIDs();
			btnReset.Visible = false;
			panelDelete.Visible = false;
			lbl_Clin.Visible = false;
			ddl_Clin.Visible = false;

			Populate_delSubj_ID_DDL();

			if (Request.QueryString["mode"] == "delete")
			{
				int studymeasID = Convert.ToInt32(Request.QueryString["studymeasID"].ToString());
				string pkval = Request.QueryString["pkval"].ToString();

				ddl_studymeasID.SelectedValue = studymeasID.ToString();
				ddl_IDdelete.SelectedValue = pkval;

				Populate_IDdelete_DDL(studymeasID);
				//Populate_IDmove_DDL(studymeasID);
				//Populate_delSubj_ID_DDL(studymeasID);

				panelDelete.Visible = true;
			}
			else if (Request.QueryString["mode"] == "reset")
			{
				int studymeasID = Convert.ToInt32(Request.QueryString["studymeasID"].ToString());
				string pkval = Request.QueryString["pkval"].ToString();

				ddl_studymeasID.SelectedValue = studymeasID.ToString();

				Populate_ID_DDL(studymeasID);

				ddl_ID.SelectedValue = pkval;

				btnReset.Visible = true;
				//Populate_IDdelete_DDL(studymeasID);
				//Populate_IDmove_DDL(studymeasID);
				//Populate_delSubj_ID_DDL(studymeasID);

			}
		}
	}





	#region ==== Populate DDLs ====
	protected void Populate_Studymeas_DDL()
	{

		SQL_utils sql = new SQL_utils("backend");
		string sqlcode = "select 0 studymeasID, '---Measure---' studymeasname union select studymeasID, studymeasname + ' ['+timepoint_text+']' as studymeasname from vwStudymeas where studyID = " + Master.Master_studyID.ToString() + " order by studymeasname";

		DataTable dtSM = sql.DataTable_from_SQLstring(sqlcode);
		sql.Close();


		ddl_studymeasID.DataSource = dtSM;
		ddl_studymeasID.DataTextField = "studymeasname";
		ddl_studymeasID.DataValueField = "studymeasID";
		ddl_studymeasID.DataBind();

	}

	protected void Populate_ID_DDL(int studymeasID)
	{

		SQL_utils sql = new SQL_utils("data");

		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studymeasID", ddl_studymeasID.SelectedValue, "int"));
		ps.Add(sql.CreateParam("clin", ddl_Clin.SelectedValue, "text"));
		ps.Add(sql.CreateParam("mode", "1,4", "text"));

		
		DataTable dtSM = sql.DataTable_from_ProcName("spID_and_Indexnum_by_smID", ps);
		sql.Close();


		ddl_ID.DataSource = dtSM;
		ddl_ID.DataTextField = "IDindex";
		ddl_ID.DataValueField = "pk";
		ddl_ID.DataBind();

		UpdatePanel01.Update();

	}


	protected void Populate_IDdelete_DDL(int studymeasID)
	{


		SQL_utils sql = new SQL_utils("data");

		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studymeasID", ddl_studymeasID.SelectedValue, "int"));
		ps.Add(sql.CreateParam("clin", ddl_Clin.SelectedValue, "text"));
		ps.Add(sql.CreateParam("mode", "0,1,4", "text"));
		
		DataTable dtSM = sql.DataTable_from_ProcName("spID_and_Indexnum_by_smID", ps);
		sql.Close();

		ddl_IDdelete.DataSource = dtSM;
		ddl_IDdelete.DataTextField = "IDindex";
		ddl_IDdelete.DataValueField = "pk";
		ddl_IDdelete.DataBind();

		UpdatePanel01.Update();

	}





	protected void Populate_StudyMeas_New_DDL(int studymeasID)
	{

		SQL_utils sql = new SQL_utils("data");

		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studymeasID", studymeasID.ToString(), "int"));

		DataTable dtSM = sql.DataTable_from_ProcName("spDEF__Potential_Movable_Studymeas", ps);
		sql.Close();



		ddl_Studymeas_New.DataSource = dtSM;
		ddl_Studymeas_New.DataTextField = "studymeasname";
		ddl_Studymeas_New.DataValueField = "studymeasID";
		ddl_Studymeas_New.DataBind();

		UpdatePanel01.Update();

	}

	protected void Populate_IDmove_DDL(int studymeasID)
	{
		
		SQL_utils sql = new SQL_utils("data");

		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studymeasID", studymeasID.ToString(), "int"));
		ps.Add(sql.CreateParam("clin", ddl_Clin.SelectedValue, "text"));
		ps.Add(sql.CreateParam("mode", "0,1,4", "text"));

		DataTable dtSM = sql.DataTable_from_ProcName("spID_and_Indexnum_by_smID", ps);
		sql.Close();


		ddl_IDmove.DataSource = dtSM;
		ddl_IDmove.DataTextField = "IDindex";
		ddl_IDmove.DataValueField = "pk";
		ddl_IDmove.DataBind();

		UpdatePanel01.Update();

	}


	protected void LoadTxLogClins()
	{


		SQL_utils sql = new SQL_utils("data");
		string sqlcode = "select clinname, siteclinname from vwTadpoleTxLog_Clins order by siteclinname";
		DataTable dtSM = sql.DataTable_from_SQLstring(sqlcode);
		sql.Close();


		ddl_Clin.DataSource = dtSM;
		ddl_Clin.DataTextField = "siteclinname";
		ddl_Clin.DataValueField = "clinname";
		ddl_Clin.DataBind();
	}



	protected void Populate_delSubj_ID_DDL()
	{


		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = "select -1 subjID, '--select--' idgrp union select subjID, ID + ' (' + groupname + ')' as idgrp from vwMasterStatus_S where groupID in (select groupID from dbo.fnSEC_Allowed_ADMIN_Groups_by_User()) " +
			" and studyID = " + Master.Master_studyID.ToString();

		DataTable dtSM = sql.DataTable_from_SQLstring(sqlcode);
		sql.Close();



		if (dtSM.Rows.Count > 1)
		{
			lbl_DeleteSubject.Visible = true;
		   
			ddl_delSubj1.Visible = true;
			ddl_delSubj2.Visible = true;

			ddl_delSubj1.DataSource = dtSM;
			ddl_delSubj1.DataTextField = "idgrp";
			ddl_delSubj1.DataValueField = "subjID";
			ddl_delSubj1.DataBind();

			ddl_delSubj2.DataSource = dtSM;
			ddl_delSubj2.DataTextField = "idgrp";
			ddl_delSubj2.DataValueField = "subjID";
			ddl_delSubj2.DataBind();

		}
		else
		{
			lbl_DeleteSubject.Visible = false;
			btn_DeleteSubject.Visible = false;
			ddl_delSubj1.Visible = false;
			ddl_delSubj2.Visible = false;

			lbl_DeleteSubjectDENIED.Visible = true;
			
		}

		UpdatePanel01.Update();

	}



	#endregion

	

	#region ====== Selected Index Change on DDLs ======

	protected void ddl_studymeasID_SelectedIndexChanged(object sender, EventArgs e)
	{
		int smID = Convert.ToInt16(ddl_studymeasID.SelectedValue);
		//Load the ID's
		if (smID == 3534)  //Tadpole Tx Logs
		{
			lbl_Clin.Visible = true;
			ddl_Clin.Visible = true;
		}
		else
		{
			lbl_Clin.Visible = false;
			ddl_Clin.Visible = false;
			Populate_ID_DDLs();
		}


		panelDelete.Visible = false;
		txtDelete.Text = "";
		btnDelete.Visible = false;

		lbl_Studymeas_New.Visible = false;
		ddl_Studymeas_New.Visible = false;
	}

		
	protected void ddl_Clin_SelectedIndexChanged(object sender, EventArgs e)
	{

		if (ddl_Clin.SelectedValue != "--Select Clinician--")
		{
			Populate_ID_DDLs();
		}
		//else
		//{
		//    btnReset.Visible = false;
		//}

	}



	protected void ddl_Clindelete_SelectedIndexChanged(object sender, EventArgs e)
	{

		if (ddl_Clindelete.SelectedValue != "--Select Clinician--")
		{
			Populate_IDdelete_DDL(Convert.ToInt16(ddl_studymeasID.SelectedValue));
		}
		//else
		//{
		//    btnReset.Visible = false;
		//}

	}


	protected void ddl_ID_SelectedIndexChanged(object sender, EventArgs e)
	{

		if (Convert.ToInt16(ddl_ID.SelectedValue) > 0)
		{
			btnReset.Visible = true;
			panelDelete.Visible = false;

		}
		else
		{
			btnReset.Visible = false;
			panelDelete.Visible = false;
		}

	}



	protected void ddl_IDmove_SelectedIndexChanged(object sender, EventArgs e)
	{
		btnMove.Visible = false;

		if (Convert.ToInt16(ddl_IDmove.SelectedValue) > 0)
		{
			lbl_Studymeas_New.Visible = true;
			ddl_Studymeas_New.Visible = true;

			int old_studymeasID = Convert.ToInt16(ddl_studymeasID.SelectedValue);
			Populate_StudyMeas_New_DDL(old_studymeasID);

		}
		else
		{
			lbl_Studymeas_New.Visible = false;
			ddl_Studymeas_New.Visible = false;

			btnMove.Visible = false;
		}

	}


	protected void ddl_Studymeas_New_SelectedIndexChanged(object sender, EventArgs e)
	{

		if (Convert.ToInt16(ddl_IDmove.SelectedValue) > 0)
		{
			btnMove.Visible = true;
		}
		else
		{
			btnMove.Visible = false;
		}

	}




	protected void ddl_IDdelete_SelectedIndexChanged(object sender, EventArgs e)
	{

		txtDelete.Text = "";
		btnDelete.Visible = false;


		if (Convert.ToInt16(ddl_IDdelete.SelectedValue) > 0)
		{
			btnReset.Visible = false;
			panelDelete.Visible = true;

		}
		else
		{
			btnReset.Visible = false;
			panelDelete.Visible = false;
		}


	}

	protected void ddl_delSubj_SelectedIndexChanged(object sender, EventArgs e)
	{

		if(ddl_delSubj1.SelectedValue == ddl_delSubj2.SelectedValue & Convert.ToInt32(ddl_delSubj1.SelectedValue) > 0)
		{
			btn_DeleteSubject.Visible = true;
		}
		else
		{
			btn_DeleteSubject.Visible = false;
		}
	}


	#endregion



	protected void ResetForm(object sender, EventArgs e)
	{

		SQL_utils sql = new SQL_utils("data");
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studymeasID", ddl_studymeasID.SelectedValue, "int"));
		ps.Add(sql.CreateParam("pk", ddl_ID.SelectedValue, "int"));
		sql.NonQuery_from_ProcName("spDEF_RESET_Verified_to_0", ps);



		Populate_ID_DDLs();


		btnReset.Visible = false;
		panelDelete.Visible = false;
		btnDelete.Visible = false;
		txtDelete.Text = "";

		error_label.Text = "";

		UpdatePanel01.Update();
	}


	protected void ConfirmTextChanged(object sender, EventArgs e)
	{
		if (txtDelete.Text == "del")
		{
			btnDelete.Visible = true;
		}
		else
		{
			btnDelete.Visible = false;
		}

		UpdatePanel01.Update();
	}


	protected void DeleteRecord(object sender, EventArgs e)
	{
			  
		SQL_utils sql = new SQL_utils("data");
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studymeasID", ddl_studymeasID.SelectedValue, "int"));
		ps.Add(sql.CreateParam("pk", ddl_IDdelete.SelectedValue, "int"));
		sql.NonQuery_from_ProcName("spDEF_DELETE_to_XML_RAW", ps);


		
		Populate_ID_DDLs();

		btnReset.Visible = false;
		panelDelete.Visible = false;
		btnDelete.Visible = false;
		txtDelete.Text = "";

		UpdatePanel01.Update();
	}


	protected void DeleteSubject(object sender, EventArgs e)
	{

		if (Convert.ToInt32(ddl_delSubj1.SelectedValue) == Convert.ToInt32(ddl_delSubj2.SelectedValue))
		{


			SQL_utils sql = new SQL_utils("backend");
			List<SqlParameter> ps = new List<SqlParameter>();
			ps.Add(sql.CreateParam("subjID", ddl_delSubj1.SelectedValue, "int"));
			ps.Add(sql.CreateParam("code", "Confirm deletion of " + Convert.ToString(ddl_delSubj1.SelectedValue), "text"));
			
			
			try
			{
				sql.NonQuery_from_ProcName("spDeleteSubject_from_web", ps);

			}
			catch (SqlException exc)
			{
				error_label.Text = exc.Message;
			}

			sql.Close();

			Populate_delSubj_ID_DDL();

			btnReset.Visible = false;
			panelDelete.Visible = false;
			btnDelete.Visible = false;
			txtDelete.Text = "";

			UpdatePanel01.Update();
		}


	}


	protected void MoveRecord(object sender, EventArgs e)
	{

		SQL_utils sql = new SQL_utils("data");
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("old_studymeasID", ddl_studymeasID.SelectedValue, "int"));
		ps.Add(sql.CreateParam("new_studymeasID", ddl_Studymeas_New.SelectedValue, "int"));
		ps.Add(sql.CreateParam("pk", ddl_IDmove.SelectedValue, "int"));
		sql.NonQuery_from_ProcName("spDEF__Update_StudymeasID_for_entered_Measure", ps);

		sql.Close();


		Populate_ID_DDLs();

		btnReset.Visible = false;
		panelDelete.Visible = false;
		btnDelete.Visible = false;
		txtDelete.Text = "";

		lbl_Studymeas_New.Visible = false;
		ddl_Studymeas_New.Visible = false;
		btnMove.Visible = false;

		UpdatePanel01.Update();
	}

	protected void Populate_ID_DDLs()
	{
		Populate_ID_DDL(Convert.ToInt16(ddl_studymeasID.SelectedValue));
		Populate_IDmove_DDL(Convert.ToInt16(ddl_studymeasID.SelectedValue));
		Populate_IDdelete_DDL(Convert.ToInt16(ddl_studymeasID.SelectedValue));
	}

}