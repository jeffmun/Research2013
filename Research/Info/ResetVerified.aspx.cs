using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
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

			ddl_delSubj1.DataSource = dtSM;
			ddl_delSubj1.DataTextField = "idgrp";
			ddl_delSubj1.DataValueField = "subjID";
			ddl_delSubj1.DataBind();

			ddl_delSubj2.DataSource = dtSM;
			ddl_delSubj2.DataTextField = "idgrp";
			ddl_delSubj2.DataValueField = "subjID";
			ddl_delSubj2.DataBind();

			ddl_newID.DataSource = dtSM;
			ddl_newID.DataTextField = "idgrp";
			ddl_newID.DataValueField = "subjID";
			ddl_newID.DataBind();

			ddl_ChangeGroupID.DataSource = dtSM;
			ddl_ChangeGroupID.DataTextField = "idgrp";
			ddl_ChangeGroupID.DataValueField = "subjID";
			ddl_ChangeGroupID.DataBind();



			lbl_DeleteSubjectDENIED.Visible = false;
			editSubjectPanel.Visible = true;

		}
		else
		{

			lbl_DeleteSubjectDENIED.Visible = true;
			editSubjectPanel.Visible = false;

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


	protected void ddl_newID_SelectedIndexChanged(object sender, EventArgs e)
	{
		int subjID = Convert.ToInt32(ddl_newID.SelectedValue.ToString());

		btnValidateNewID.Visible = (subjID > 0) ? true : false;

	}

		


	protected void ddl_ChangeGroup_SelectedIndexChanged(object sender, EventArgs e)
	{
		int subjID = Convert.ToInt32(ddl_ChangeGroupID.SelectedValue.ToString());

		if (subjID > 0)
		{
			int newgroup1 = Convert.ToInt32(ddl_newGroup1.SelectedValue.ToString());
			int newgroup2 = Convert.ToInt32(ddl_newGroup2.SelectedValue.ToString());
			SQL_utils sql = new SQL_utils("backend");

			int oldgroup = sql.IntScalar_from_SQLstring(String.Format("select groupID from tblsubject where subjID={0}", subjID));

			if (newgroup1  == newgroup2 && newgroup1 > 0 && newgroup1 != oldgroup)
			{

				string sqlcode = String.Format("select groupID from tblsubject where subjID = {0}", subjID);
				int oldgroupID = sql.IntScalar_from_SQLstring(sqlcode);

				if (newgroup1 != oldgroupID)
				{
					btn_ChangeGroup.Visible = true;
				}
			}
			else
			{
				btn_ChangeGroup.Visible = false;
			}

			sql.Close();

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
			int subjID = Convert.ToInt32(ddl_delSubj1.SelectedValue);

			SQL_utils sql = new SQL_utils("backend");
			
			try{
				var del1 = DxDbOps.BuildDeleteSqlCode("tblstudymeassubj", "backend", "subjID", subjID);


				sql.NonQuery_from_SQLstring("update uwautism_research_backend.dbo.tblstudymeassubj set actionid = null where subjid = " + subjID.ToString());

//tblSubject
//tblaction
//tblReliabilityTracking
//tblSubjConsent
//tblstudymeassubj

				var del2 = DxDbOps.BuildDeleteSqlCode("tblapptstaff","backend", "actionID in (select actionID from tblaction where subjID = " + subjID.ToString() + ")");
				var del3 = DxDbOps.BuildDeleteSqlCode("tblSubjConsentitem","backend",  "subjconsentid in (select subjconsentid from uwautism_research_backend.dbo.tblSubjConsent where subjid = " + subjID.ToString() + ")");
				var del4 = DxDbOps.BuildDeleteSqlCode("tblSubjConsent", "backend", "subjID", subjID);
				var del5 = DxDbOps.BuildDeleteSqlCode("tblReliabilityTracking", "backend", "subjID", subjID);
				var del6 = DxDbOps.BuildDeleteSqlCode("tblaction", "backend", "subjID", subjID);
				var del7 = DxDbOps.BuildDeleteSqlCode("tblSubject", "backend", "subjID", subjID);

				error_label.Text = "Subject deleted.";

				btnDelete.Visible = false;

			}
			catch (SqlException exc)
			{
				error_label.Text = exc.Message;
			}


			//SQL_utils sql = new SQL_utils("backend");
			//List<SqlParameter> ps = new List<SqlParameter>();
			//ps.Add(sql.CreateParam("subjID", ddl_delSubj1.SelectedValue, "int"));
			//ps.Add(sql.CreateParam("code", "Confirm deletion of " + Convert.ToString(ddl_delSubj1.SelectedValue), "text"));
			
			
			//try
			//{
			//	sql.NonQuery_from_ProcName("spDeleteSubject_from_web", ps);

			//}
			//catch (SqlException exc)
			//{
			//	error_label.Text = exc.Message;
			//}

			sql.Close();

			Populate_delSubj_ID_DDL();

			btnReset.Visible = false;
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


	protected void ValidateNewID(object sender, EventArgs e)
	{

		string id1 = newID1.Text;
		string id2 = newID2.Text;
		string oldsubjid = ddl_newID.SelectedValue;
		SQL_utils sql = new SQL_utils("data");

		string oldid = sql.StringScalar_from_SQLstring(String.Format("select id from uwautism_research_backend..tblsubject where subjID={0}", oldsubjid));

		if (oldsubjid != "-1")
		{

			if (id1 == id2 && !String.IsNullOrEmpty(id1))
			{

				int n_newid = sql.IntScalar_from_SQLstring(String.Format("select coalesce(count(*),0) n from uwautism_research_backend..vwMasterStatus_S where studyID={0} and ID='{1}'"
						, Master.Master_studyID, id1));

				if (n_newid > 0)
				{
					error_label.Text = String.Format("The ID '{0}' is already taken.", id1);
				}
				else
				{
					//new ID is unique
					string sql_ndata = String.Format("select count(*) n from uwautism_research_data..datData where ID='{0}' and studymeasID in (select studymeasID from uwautism_research_backend..tblstudymeas where studyID={1})"
						, oldid, Master.Master_studyID);

					int ndata = sql.IntScalar_from_SQLstring(sql_ndata);
					List<string> dataupdateresult = new List<string>();

					if (ndata > 0)
					{

						error_label.Text = String.Format("'{0}' is available.  However, there are {1} entered data records in which ID='{2}'.<br/>Check the box if you want to update the entered data to this new ID '{0}'.<br/>Do not check the box if you want the {1} entered data records to remain as ID '{2}'.", id1, ndata, oldid);
						chkDataToo.Visible = true;
					}

					else
					{
						error_label.Text = String.Format("'{0}' is available. There is no entered data with the original ID '{1}'.", id1, oldid);
						//txtOVERRIDE.Text = "Enter 'fix' here to update entered data with the new ID.";
					}

					btnNewID.Visible = true;
					btnCancelNewID.Visible = true;
					btnValidateNewID.Visible = false;
					
				}

			}

			else
			{
				error_label.Text = "New ID values must match.";
			}

			sql.Close();
		}

	}

	protected void CancelNewID(object sender, EventArgs e)
	{
		Response.Redirect("~/Info/ResetVerified.aspx");

	}

		protected void ChangeIDSubject(object sender, EventArgs e)
	{

		string id1 = newID1.Text;
		string id2 = newID2.Text;
		string oldsubjid = ddl_newID.SelectedValue;
		SQL_utils sql = new SQL_utils("data");

		string oldid = sql.StringScalar_from_SQLstring(String.Format("select id from uwautism_research_backend..tblsubject where subjID={0}", oldsubjid));

		if (oldsubjid != "-1")
		{

			if (id1 == id2 && !String.IsNullOrEmpty(id1))
			{

				int n_newid = sql.IntScalar_from_SQLstring(String.Format("select coalesce(count(*),0) n from uwautism_research_backend..vwMasterStatus_S where studyID={0} and ID='{1}'"
						, Master.Master_studyID, id1));

				if (n_newid > 0)
				{
					error_label.Text = String.Format("The ID '{0}' is already taken.", id1);
				}
				else
				{
					//new ID is unique
					string sql_ndata = String.Format("select count(*) n from uwautism_research_data..datData where ID='{0}' and studymeasID in (select studymeasID from uwautism_research_backend..tblstudymeas where studyID={1})"
						, oldid, Master.Master_studyID);

					int ndata = sql.IntScalar_from_SQLstring(sql_ndata);
					List<string> dataupdateresult = new List<string>();


					string sqllogchange = String.Format("insert into uwautism_research_backend..AuditChanges(pk, pkfldname, tblname, fldname, oldvalue, newvalue, updated, updatedBy) values({0},'subjID','tblSubject', 'ID','{1}','{2}',getdate(),sec.systemuser())"
						, oldsubjid, oldid, id1);

					string sqlnewid = String.Format("update uwautism_research_backend..tblsubject set id='{0}' where  subjID={1} and ID='{2}'"
						, id1, oldsubjid, oldid);

					dataupdateresult.Add(sqllogchange);
					dataupdateresult.Add(sqlnewid);


					if (ndata > 0)
					{
						if (chkDataToo.Checked )
						{
							List<string> datachanges = UpdateDataID(Master.Master_studyID, oldid, id1);
							dataupdateresult.AddRange(datachanges);
						}
					}

					try
					{
						string dataupdateresults = String.Join(";", dataupdateresult);
						string dataupdateresults_for_diplay = String.Join("<br/>", dataupdateresult);

						string executeresults = sql.NonQuery_from_SQLstring_withRollback(dataupdateresults);

						string datamsg = (ndata == 0) ? String.Format("No entered data with ID='{0}' were found.<br/>", oldid) : "";



						error_label.Text = String.Format("ID updated to '{0}'.<br/><br/>/* SQL code executed: */<br/>{1}", id1, dataupdateresults_for_diplay);
					}
					catch (Exception ex)
					{

					}
					
				}
					
			}
		
			else
			{
				error_label.Text = "New ID values must match.";
			}

			sql.Close();
		}

	}


	protected List<string> UpdateDataID(int studyID, string oldid, string newid)
	{
		List<string> result = new List<string>();
		SQL_utils sql = new SQL_utils("data");
		string sql_changestomake = String.Format("select * from DatData where ID='{0}' and studymeasID in (select studymeasID from uwautism_research_backend..tblstudymeas where studyID={1})", oldid, studyID);
		DataTable dt = sql.DataTable_from_SQLstring(sql_changestomake);
		string tblname = "";
		string error = "";

		if (dt != null)
		{

			foreach (DataRow row in dt.Rows)
			{
				int tblpk = Convert.ToInt32(row["tblpk"].ToString());
				int pkval = Convert.ToInt32(row["tablePK"].ToString());

				string pkfld = "";
				pkfld = sql.StringScalar_from_SQLstring(String.Format("select fldname from def.fld where tblpk={0} and fieldcodeID=10", tblpk));

				tblname = sql.StringScalar_from_SQLstring("select tblname from def.tbl where tblpk=" + tblpk.ToString());

				if (tblname != "" && pkfld != "" && pkval > 0)
				{
					string update_datatable = String.Format(" Update {0} set ID='{1}' where ID='{2}' and {3}={4}", tblname, newid, oldid, pkfld, pkval);
					string update_datdata = String.Format(" Update datData set ID='{0}' where tblpk={1} and ID = '{2}' and tablePK={3}", newid, tblpk, oldid, pkval);

					result.Add(update_datatable);
					result.Add(update_datdata);
					Debug.WriteLine(update_datatable);
					Debug.WriteLine(update_datdata);
					try{
						//sql.NonQuery_from_SQLstring(update_datatable);
						//sql.NonQuery_from_SQLstring(update_datdata);

					}
					catch (Exception ex)
					{
						error = String.Format("Error when updating {0}.", tblname);
					}
				}

			}
		}

		if (error != "") return new List<string> { error };
		else return result;

	}



	//protected void ValidateChangeGroup(object sender, EventArgs e)
	//{

	//	int subjID = Convert.ToInt32(ddl_ChangeGroupID.SelectedValue.ToString());
	//	int newgroupID1 = Convert.ToInt32(ddl_newGroup1.SelectedValue.ToString());
	//	int newgroupID2 = Convert.ToInt32(ddl_newGroup2.SelectedValue.ToString());

	//	if(newgroupID1 == newgroupID2 && newgroupID1 > 0 && subjID > 0)
	//	{
	//		btn_ChangeGroup.Visible = true;
	//	}
	//}

	protected void ChangeGroup(object sender, EventArgs e)
	{

		int subjID = Convert.ToInt32(ddl_ChangeGroupID.SelectedValue.ToString());
		int newgroupID1 = Convert.ToInt32(ddl_newGroup1.SelectedValue.ToString());
		int newgroupID2 = Convert.ToInt32(ddl_newGroup2.SelectedValue.ToString());
		SQL_utils sql = new SQL_utils("backend");
		int oldgroup = sql.IntScalar_from_SQLstring(String.Format("select groupID from tblsubject where subjID={0}", subjID));


		if (newgroupID1 == newgroupID2 && newgroupID1 > 0 && subjID > 0 && newgroupID1 != oldgroup)
		{
			try
			{

				

				string sqlcode = String.Format(" update tblsubject set groupID = {0} where subjID = {1};", newgroupID1, subjID);

				string sqlAddActions = String.Format("exec spUpdate_SA_SM_for_Subj_with_new_group {0}", subjID);

				string sqllogchange = String.Format("insert into uwautism_research_backend..AuditChanges(pk, pkfldname, tblname, fldname, oldvalue, newvalue, updated, updatedBy) values({0},'subjID','tblSubject', 'groupID','{1}','{2}',getdate(),sec.systemuser());"
					, subjID, oldgroup, newgroupID1);

				string sql_all = String.Format("{0} {1} {2}", sqlcode, sqlAddActions, sqllogchange);


				sql.NonQuery_from_SQLstring_withRollback(sql_all);

				error_label.Text = String.Format("Group changed and actions and measures updated.");

				btn_ChangeGroup.Visible = false;

			}
			catch(Exception ex)
			{ }

		}
		sql.Close();

	}



}