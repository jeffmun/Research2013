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




public partial class Info_ResetVerified : System.Web.UI.Page
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


		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
		oConnData.Open();


		oDBLookup = new DBLookup(oConn);
		GetCurrentDefaultStudyID();

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

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		GetCurrentDefaultStudyID();
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
		}
	}





	#region ==== Populate DDLs ====
	protected void Populate_Studymeas_DDL()
	{
		//DropDownList ddl_studymeasID = (DropDownList)FindControl("ddl_studymeasID");


		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConn;
		sqlCmd.CommandType = CommandType.Text;
		sqlCmd.CommandText = "select 0 studymeasID, '---Measure---' studymeasname union select studymeasID, studymeasname + ' ['+timepoint_text+']' as studymeasname from vwStudymeas where studyID = " + _content_studyID.ToString() + " order by studymeasname";


		SqlDataReader sqlddl_reader = sqlCmd.ExecuteReader();
		DataTable dtSM = new DataTable();
		dtSM.Load(sqlddl_reader);

		ddl_studymeasID.DataSource = dtSM;
		ddl_studymeasID.DataTextField = "studymeasname";
		ddl_studymeasID.DataValueField = "studymeasID";
		ddl_studymeasID.DataBind();

	}

	protected void Populate_ID_DDL(int studymeasID)
	{
		//DropDownList ddl_studymeasID = (DropDownList)FindControl("ddl_studymeasID");


		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConnData;
		sqlCmd.CommandType = CommandType.StoredProcedure;
		sqlCmd.CommandText = "spID_and_Indexnum_by_smID";
		sqlCmd.Parameters.Add("studymeasID", SqlDbType.Int);
		sqlCmd.Parameters.Add("clin", SqlDbType.VarChar,100);

		sqlCmd.Parameters["studymeasID"].Value = studymeasID;
		sqlCmd.Parameters["clin"].Value = ddl_Clin.SelectedValue;

		sqlCmd.Parameters.Add("mode", SqlDbType.VarChar, 10);
		sqlCmd.Parameters["mode"].Value = "1,4";  //  dbl ent, and no data


		SqlDataReader sqlddl_reader = sqlCmd.ExecuteReader();
		DataTable dtSM = new DataTable();
		dtSM.Load(sqlddl_reader);

		ddl_ID.DataSource = dtSM;
		ddl_ID.DataTextField = "IDindex";
		ddl_ID.DataValueField = "pk";
		ddl_ID.DataBind();

		UpdatePanel01.Update();

	}


	protected void Populate_IDdelete_DDL(int studymeasID)
	{
		//DropDownList ddl_studymeasID = (DropDownList)FindControl("ddl_studymeasID");


		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConnData;
		sqlCmd.CommandType = CommandType.StoredProcedure;
		sqlCmd.CommandText = "spID_and_Indexnum_by_smID";
		sqlCmd.Parameters.Add("studymeasID", SqlDbType.Int);
		sqlCmd.Parameters.Add("clin", SqlDbType.VarChar, 100);

		sqlCmd.Parameters["studymeasID"].Value = studymeasID;
		sqlCmd.Parameters["clin"].Value = ddl_Clin.SelectedValue;

		sqlCmd.Parameters.Add("mode", SqlDbType.VarChar, 10);
		sqlCmd.Parameters["mode"].Value = "0,1,4";  // single ent, dbl ent, and no data

		SqlDataReader sqlddl_reader = sqlCmd.ExecuteReader();
		DataTable dtSM = new DataTable();
		dtSM.Load(sqlddl_reader);

		ddl_IDdelete.DataSource = dtSM;
		ddl_IDdelete.DataTextField = "IDindex";
		ddl_IDdelete.DataValueField = "pk";
		ddl_IDdelete.DataBind();

		UpdatePanel01.Update();

	}





	protected void Populate_StudyMeas_New_DDL(int studymeasID)
	{
		//DropDownList ddl_studymeasID = (DropDownList)FindControl("ddl_studymeasID");


		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConnData;
		sqlCmd.CommandType = CommandType.StoredProcedure;
		sqlCmd.CommandText = "spDEF__Potential_Movable_Studymeas";
		sqlCmd.Parameters.Add("studymeasID", SqlDbType.Int);

		sqlCmd.Parameters["studymeasID"].Value = studymeasID;

		SqlDataReader sqlddl_reader = sqlCmd.ExecuteReader();
		DataTable dtSM = new DataTable();
		dtSM.Load(sqlddl_reader);

		ddl_Studymeas_New.DataSource = dtSM;
		ddl_Studymeas_New.DataTextField = "studymeasname";
		ddl_Studymeas_New.DataValueField = "studymeasID";
		ddl_Studymeas_New.DataBind();

		UpdatePanel01.Update();

	}

	protected void Populate_IDmove_DDL(int studymeasID)
	{
		//DropDownList ddl_studymeasID = (DropDownList)FindControl("ddl_studymeasID");


		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConnData;
		sqlCmd.CommandType = CommandType.StoredProcedure;
		sqlCmd.CommandText = "spID_and_Indexnum_by_smID";
		sqlCmd.Parameters.Add("studymeasID", SqlDbType.Int);
		sqlCmd.Parameters.Add("clin", SqlDbType.VarChar, 100);

		sqlCmd.Parameters["studymeasID"].Value = studymeasID;
		sqlCmd.Parameters["clin"].Value = ddl_Clin.SelectedValue;

		sqlCmd.Parameters.Add("mode", SqlDbType.VarChar, 10);
		sqlCmd.Parameters["mode"].Value = "0,1,4";  // single ent, dbl ent, and no data

		SqlDataReader sqlddl_reader = sqlCmd.ExecuteReader();
		DataTable dtSM = new DataTable();
		dtSM.Load(sqlddl_reader);

		ddl_IDmove.DataSource = dtSM;
		ddl_IDmove.DataTextField = "IDindex";
		ddl_IDmove.DataValueField = "pk";
		ddl_IDmove.DataBind();

		UpdatePanel01.Update();

	}


	protected void LoadTxLogClins()
	{
		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConnData;
		sqlCmd.CommandType = CommandType.Text;
		sqlCmd.CommandText = "select clinname, siteclinname from vwTadpoleTxLog_Clins order by siteclinname";


		SqlDataReader sqlddl_reader = sqlCmd.ExecuteReader();
		DataTable dtSM = new DataTable();
		dtSM.Load(sqlddl_reader);


		ddl_Clin.DataSource = dtSM;
		ddl_Clin.DataTextField = "siteclinname";
		ddl_Clin.DataValueField = "clinname";
		ddl_Clin.DataBind();
	}



	protected void Populate_delSubj_ID_DDL()
	{
		//DropDownList ddl_studymeasID = (DropDownList)FindControl("ddl_studymeasID");


		//Only allow if you are in the "Admin" group

		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConn;
		sqlCmd.CommandType = CommandType.Text;
		sqlCmd.CommandText = "select -1 subjID, '--select--' idgrp union select subjID, ID + ' (' + groupname + ')' as idgrp from vwMasterStatus_S where groupID in (select groupID from dbo.fnSEC_Allowed_ADMIN_Groups_by_User()) " + 
			" and studyID = " + _content_studyID.ToString();

		SqlDataReader sqlddl_reader = sqlCmd.ExecuteReader();
		DataTable dtSM = new DataTable();
		dtSM.Load(sqlddl_reader);


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
			  
		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConnData;
		sqlCmd.CommandType = CommandType.StoredProcedure;
		sqlCmd.CommandText = "spDEF_RESET_Verified_to_0";
		sqlCmd.Parameters.Add("studymeasID", SqlDbType.Int);
		sqlCmd.Parameters.Add("pk", SqlDbType.Int);

		sqlCmd.Parameters["studymeasID"].Value = Convert.ToInt16(ddl_studymeasID.SelectedValue);
		sqlCmd.Parameters["pk"].Value = Convert.ToInt16(ddl_ID.SelectedValue);


		sqlCmd.ExecuteNonQuery();

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
			  
		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConnData;
		sqlCmd.CommandType = CommandType.StoredProcedure;
		sqlCmd.CommandText = "spDEF_DELETE_to_XML_RAW";
		sqlCmd.Parameters.Add("studymeasID", SqlDbType.Int);
		sqlCmd.Parameters.Add("pk", SqlDbType.Int);


		sqlCmd.Parameters["studymeasID"].Value = Convert.ToInt16(ddl_studymeasID.SelectedValue);
		sqlCmd.Parameters["pk"].Value = Convert.ToInt16(ddl_IDdelete.SelectedValue);



		sqlCmd.ExecuteNonQuery();

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

			SqlCommand sqlCmd = new SqlCommand();
			sqlCmd.Connection = oConn;
			sqlCmd.CommandType = CommandType.StoredProcedure;
			sqlCmd.CommandText = "spDeleteSubject_from_web";
			sqlCmd.Parameters.Add("subjID", SqlDbType.Int);
			sqlCmd.Parameters.Add("code", SqlDbType.VarChar, 50);

			

			sqlCmd.Parameters["subjID"].Value = Convert.ToInt32(ddl_delSubj1.SelectedValue);
			sqlCmd.Parameters["code"].Value = "Confirm deletion of " + Convert.ToString(ddl_delSubj1.SelectedValue);

	 

			try
			{
				sqlCmd.ExecuteNonQuery();
			}
			catch(SqlException exc)
			{
				error_label.Text = exc.Message;
			}

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

		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConnData;
		sqlCmd.CommandType = CommandType.StoredProcedure;
		sqlCmd.CommandText = "spDEF__Update_StudymeasID_for_entered_Measure";
		sqlCmd.Parameters.Add("old_studymeasID", SqlDbType.Int);
		sqlCmd.Parameters.Add("new_studymeasID", SqlDbType.Int);
		sqlCmd.Parameters.Add("pk", SqlDbType.Int);


		sqlCmd.Parameters["old_studymeasID"].Value = Convert.ToInt16(ddl_studymeasID.SelectedValue);
		sqlCmd.Parameters["new_studymeasID"].Value = Convert.ToInt16(ddl_Studymeas_New.SelectedValue);
		sqlCmd.Parameters["pk"].Value = Convert.ToInt16(ddl_IDmove.SelectedValue);



		sqlCmd.ExecuteNonQuery();

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