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


public partial class Info_TrackingInfo : BasePage
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

	private string where_rows;
	private string where_sex;
	private string where_groups;
	private string where_subjstatus;
	private string where_timepoint;

	private string where_cols;
	private string where_cols_for_display;

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
		Populate_Subjects_Gridview();
		PopulateWhereClauseControls_forStudy();

		ShowHide_Button_Panels("none");
	}


	protected void Page_Load(object sender, EventArgs e)
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "--> Page_Load <br/>";

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
		oConnData.Open();

		oDBLookup = new DBLookup(oConn);

		GetCurrentDefaultStudyID();
		Populate_Subjects_Gridview();

		if (!IsPostBack)
		{
			datasource = "";
			mydatasource = "";
			PopulateWhereClauseControls_forStudy();
		}

		//if (!oLogin.CheckGroupPermissions("AUTISM\\Permissions Group".Split(',')))
		//{

		//    tblMaster.Rows[1].Cells[0].Controls.Clear();
		//    //tblMaster.Rows.RemoveAt(1);

		//    tblMaster.Rows[1].Cells[0].Attributes["style"] = "color: #B22222;";
		//    tblMaster.Rows[1].Cells[0].InnerHtml = "Only those in the 'Permissions group' Active Directory group are authorized to view this page.";

		//    Label1.Visible = false;
		//    DDL_SelectLabID.Visible = false;
		//    Label2.Visible = false;
		//}



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


	public CheckBox CreateWhereCheckBox(string strText)
	{
		CheckBox chk = new CheckBox();
		chk.ID = strText;
		chk.Text = strText;
		chk.EnableViewState = true;
		chk.AutoPostBack = false;

		if (strText.StartsWith("_GR") || strText.StartsWith("_TP"))
		{
			chk.Checked = false;
			chk.Visible = false;
		}
		else
		{
			chk.Checked = true;
			chk.Visible = true;
		}
		return chk;
	}

	protected void ChkChange(object sender, EventArgs e)
	{
		CheckBox chk = (CheckBox)sender;
	}


	protected void EnableThisCheckbox(CheckBox chk)
	{
		chk.Checked = true;
		chk.Visible = true;
	}

	protected void DisableThisCheckbox(CheckBox chk)
	{
		chk.Checked = false;
		chk.Visible = false;
	}


	//Populate the Group and Timepoint controls based on info from the selected study
	protected void PopulateWhereClauseControls_forStudy()
	{

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----> PopulateWhereClauseControls_forStudy <br/>";


		#region ///////////////////////// SUBJECT STATUS  ///////////////////////
		SqlCommand sqlCmd_GetSS = new System.Data.SqlClient.SqlCommand("select distinct(subjstatus) subjstatus from vwMasterStatus_S " +
		   " where groupID in (select groupID from  dbo.fnSEC_Allowed_TRACKING_GroupID_Name_by_User()) " +
			 " and studyID = " + _content_studyID.ToString(), oConn);
		DataTable dt_GetSS = new DataTable();
		SqlDataAdapter sqlAdapter_GetSS = new SqlDataAdapter(sqlCmd_GetSS);
		sqlAdapter_GetSS.Fill(dt_GetSS);
		int num_subjstatus = dt_GetSS.Rows.Count;
		int ss = 0;

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----->  NumSubjStatus: " + dt_GetSS.Rows.Count.ToString() + " <br/>";

		Control ctl0 = FindControlRecursive(this.Page, "PlaceHolder_WhereClauseControls");
		Panel s = (Panel)ctl0;
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----->  NumControls in s: " + s.Controls.Count.ToString() + " <br/>";


		DisableThisCheckbox(chkSS_TBS);
		DisableThisCheckbox(chkSS_ACT);
		DisableThisCheckbox(chkSS_FIN);
		DisableThisCheckbox(chkSS_DQ);
		DisableThisCheckbox(chkSS_OOS);
		DisableThisCheckbox(chkSS_INACT);
		DisableThisCheckbox(chkSS_NOTIN);
		DisableThisCheckbox(chkSS_NOTPART);
		DisableThisCheckbox(chkSS_NOTENR);

		DisableThisCheckbox(chkSS_XGACT);
		DisableThisCheckbox(chkSS_XGFIN);
		DisableThisCheckbox(chkSS_XGNOTPART);
		DisableThisCheckbox(chkSS_FINDROP);
		

		foreach (DataRow row_group in dt_GetSS.Rows)
		{
			subjstatus_names[ss] = row_group["subjstatus"].ToString();
			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----->  ss: " + ss.ToString() + row_group["subjstatus"].ToString() + " <br/>";

			switch (subjstatus_names[ss])
			{
				case "To Be Scheduled":
					EnableThisCheckbox(chkSS_TBS);
					break;
				case "Active":
					EnableThisCheckbox(chkSS_ACT);
					break;
				case "Inactive":
					EnableThisCheckbox(chkSS_INACT);
					break;
				case "Out of Study":
					EnableThisCheckbox(chkSS_OOS);
					break;
				case "DQ":
					EnableThisCheckbox(chkSS_DQ);
					break;
				case "Not Participating":
					EnableThisCheckbox(chkSS_NOTPART);
					break;
				case "Finished":
					EnableThisCheckbox(chkSS_FIN);
					break;
				case "Finished_DropOut":
					EnableThisCheckbox(chkSS_FINDROP);
					break;
				case "Not in Study":
					EnableThisCheckbox(chkSS_NOTIN);
					break;
				case "Not Enrolled":
					EnableThisCheckbox(chkSS_NOTENR);
					break;

				case "XGen_Active":
					EnableThisCheckbox(chkSS_XGACT);
					break;
				case "XGen_Finished":
					EnableThisCheckbox(chkSS_XGFIN);
					break;
				case "XGen_NotPartic":
					EnableThisCheckbox(chkSS_XGNOTPART);
					break;
			}
			ss++;
		}
		#endregion


		#region ///////////////////////// GROUPS  ///////////////////////
		SqlCommand sqlCmd_GetGroups = new System.Data.SqlClient.SqlCommand("select groupID, groupname from  dbo.fnSEC_Allowed_TRACKING_GroupID_Name_by_User() " +
			 " where groupID in (select groupID from tblgroup where studyID = " + _content_studyID.ToString() + ")", oConn);
		DataTable dt_GetGroups = new DataTable();
		SqlDataAdapter sqlAdapter_GetGroups = new SqlDataAdapter(sqlCmd_GetGroups);
		sqlAdapter_GetGroups.Fill(dt_GetGroups);
		int num_groups = dt_GetGroups.Rows.Count;
		int g = 0;

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----->  NumGroups: " + dt_GetGroups.Rows.Count.ToString() + " <br/>";

		Control ctl1 = FindControlRecursive(this.Page, "Panel_WhereClauseControls_Groups");
		Panel p = (Panel)ctl1;
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----->  NumControls in p: " + p.Controls.Count.ToString() + " <br/>";

		foreach (DataRow row_group in dt_GetGroups.Rows)
		{
			group_names[g] = row_group["groupname"].ToString();
			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----->  g: " + g.ToString() + row_group["groupname"].ToString() + " <br/>";
			g++;
		}

		int counter = 0;
		foreach (Control c in p.Controls)
		{
			if (c is CheckBox)
			{
				//if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----->  grp: " + tp.ToString() + row_timepoint["timepoint_text"].ToString() + " <br/>";
				CheckBox chk = (CheckBox)c;
				if (counter < num_groups)
				{
					chk.Text = group_names[counter];
					chk.Checked = true;
					chk.Visible = true;
				}
				else
				{
					chk.Text = group_names[counter];
					chk.Checked = false;
					chk.Visible = false;
				}
				counter++;
			}
		}
		#endregion


		#region /////////////////////// TIMEPOINTS ///////////////////////
		SqlCommand sqlCmd_GetTimePoints = new System.Data.SqlClient.SqlCommand("select timepoint_text from tblTimePoint where studyID = " + _content_studyID.ToString() + " order by timepoint", oConn);
		DataTable dt_GetTimePoints = new DataTable();
		SqlDataAdapter sqlAdapter_GetTimePoints = new SqlDataAdapter(sqlCmd_GetTimePoints);
		sqlAdapter_GetTimePoints.Fill(dt_GetTimePoints);
		int num_timepoints = dt_GetTimePoints.Rows.Count;

		Control ctl2 = FindControlRecursive(this.Page, "Panel_WhereClauseControls_Timepoints");
		Panel t = (Panel)ctl2;
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----->  NumControls in p: " + p.Controls.Count.ToString() + " <br/>";

		int tp = 0;

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----->  NumTimePoints: " + dt_GetTimePoints.Rows.Count.ToString() + " <br/>";

		foreach (DataRow row_timepoint in dt_GetTimePoints.Rows)
		{
			timepoint_names[tp] = row_timepoint["timepoint_text"].ToString();
			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----->  tp: " + tp.ToString() + row_timepoint["timepoint_text"].ToString() + " <br/>";
			tp++;
		}

		int tcounter = 0;
		foreach (Control c in t.Controls)
		{
			if (c is CheckBox)
			{
				CheckBox chk = (CheckBox)c;
				if (tcounter < num_timepoints)
				{
					chk.Text = timepoint_names[tcounter];
					chk.Checked = true;
					chk.Visible = true;
				}
				else
				{
					chk.Text = timepoint_names[tcounter];
					chk.Checked = false;
					chk.Visible = false;
				}
				tcounter++;
			}
		}

		#endregion

		#region ///////////////////////// ACTION TYPES  ///////////////////////
		SqlCommand sqlCmd_GetAT = new System.Data.SqlClient.SqlCommand("select distinct(actiontypeID) actiontypeID from vwMasterStatus_A " +
		   " where groupID in (select groupID from  dbo.fnSEC_Allowed_TRACKING_GroupID_Name_by_User()) " +
			 " and studyID = " + _content_studyID.ToString(), oConn);
		DataTable dt_getAT = new DataTable();
		SqlDataAdapter sqlAdapter_getAT = new SqlDataAdapter(sqlCmd_GetAT);
		sqlAdapter_getAT.Fill(dt_getAT);
		int num_actiontype = dt_getAT.Rows.Count;
		int at = 0;

		int[] actiontype = new int[30];

		//LogToPage("----->  NumSubjStatus: " + dt_getAT.Rows.Count.ToString() + " <br/>");

		//Control ctl0 = FindControlRecursive(this.Page, "PlaceHolder_WhereClauseControls");
		//Panel s = (Panel)ctl0;
		//LogToPage("----->  NumControls in s: " + s.Controls.Count.ToString() );


		DisableThisCheckbox(chkAT_1);
		DisableThisCheckbox(chkAT_2);
		DisableThisCheckbox(chkAT_3);
		DisableThisCheckbox(chkAT_4);
		DisableThisCheckbox(chkAT_18);
		DisableThisCheckbox(chkAT_8);
		DisableThisCheckbox(chkAT_9);
		DisableThisCheckbox(chkAT_7);
		DisableThisCheckbox(chkAT_6);
		DisableThisCheckbox(chkAT_25);
		DisableThisCheckbox(chkAT_14);
		DisableThisCheckbox(chkAT_16);
		DisableThisCheckbox(chkAT_20);
		DisableThisCheckbox(chkAT_17);
		DisableThisCheckbox(chkAT_11);
		DisableThisCheckbox(chkAT_5);
		DisableThisCheckbox(chkAT_19);
		DisableThisCheckbox(chkAT_22);
		DisableThisCheckbox(chkAT_24);
		DisableThisCheckbox(chkAT_15);
		DisableThisCheckbox(chkAT_26);
		DisableThisCheckbox(chkAT_21);
						  


		foreach (DataRow row_group in dt_getAT.Rows)
		{
			actiontype[at] = Convert.ToInt16(row_group["actiontypeID"].ToString());
			//LogToPage("----->  at: " + at.ToString() + row_group["actiontypeID"].ToString() );

			CheckBox chk = (CheckBox)FindControlRecursive(PlaceHolder_WhereClauseControls_ActionTypes, "chkAT_" + actiontype[at].ToString());

			EnableThisCheckbox(chk);
			at++;
		}
		#endregion



		#region ///////////////////////// ACTION STATUS  ///////////////////////
		SqlCommand sqlCmd_getAS = new System.Data.SqlClient.SqlCommand("select distinct(actionstatusshort) actionstatusshort from vwMasterStatus_A " +
		   " where groupID in (select groupID from  dbo.fnSEC_Allowed_TRACKING_GroupID_Name_by_User()) " +
			 " and studyID = " + _content_studyID.ToString(), oConn);
		DataTable dt_getAS = new DataTable();
		SqlDataAdapter sqlAdapter_getAS = new SqlDataAdapter(sqlCmd_getAS);
		sqlAdapter_getAS.Fill(dt_getAS);
		int num_actionstatus = dt_getAS.Rows.Count;
		int actstatus = 0;

		string[] actionstatus = new string[50];

		//LogToPage("----->  NumSubjStatus: " + dt_getAS.Rows.Count.ToString() + " <br/>");

		//Control ctl0 = FindControlRecursive(this.Page, "PlaceHolder_WhereClauseControls");
		//Panel s = (Panel)ctl0;
		//LogToPage("----->  NumControls in s: " + s.Controls.Count.ToString() );


		DisableThisCheckbox(chkAS_1);
		DisableThisCheckbox(chkAS_2);

		foreach (DataRow row_group in dt_getAS.Rows)
		{
			actstatus++;
			actionstatus[actstatus] = (row_group["actionstatusshort"].ToString());
			//LogToPage("----->  at: " + at.ToString() + row_group["actiontypeID"].ToString() );

			CheckBox chk = (CheckBox)FindControlRecursive(PlaceHolder_WhereClauseControls_ActionStatus, "chkAS_" + actstatus.ToString());
			if (chk != null)
			{
				EnableThisCheckbox(chk);
			}
		}
		#endregion
	}



	// Builds the dynamic WHERE clause to filter the results
	protected void CreateWhereClause(string data_to_return)
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> CreateWhereClause <br/>";


		string str_sex = "";
		string str_subjstatus = "";

		#region  ....... Dynamic Where COLUMNS: SubjectStatus .......
		Control ctl1 = FindControlRecursive(this.Page, "Panel_WhereClauseControls_Subjstatus");
		Panel p = (Panel)ctl1;

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> p.Controls.Count = " + p.Controls.Count.ToString() + " <br/>";

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> p= " + p.NamingContainer + ", " + p.ToString() + ", " + p.Controls.Count.ToString() + " <br/>";


		foreach (Control c in p.Controls)
		{
			//if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "---------------> c.NamingContainer:  " +c.ToString() + ", " + c.NamingContainer + " <br/>";

			if (c is CheckBox)
			{
				CheckBox chk = (CheckBox)c;
				string chkname = chk.Text;

				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "---------------> chkName:  " + chkname + " <br/>";

				switch (chkname)
				{
					case "ToBeSched":
						str_subjstatus += chk.Checked ? " ''To Be Scheduled'', " : "";
						break;
					case "Active":
						str_subjstatus += chk.Checked ? " ''Active'', " : "";
						break;
					case "OOS":
						str_subjstatus += chk.Checked ? " ''Out of Study'', " : "";
						break;
					case "DQ":
						str_subjstatus += chk.Checked ? " ''DQ'', " : "";
						break;
					case "Inactive":
						str_subjstatus += chk.Checked ? " ''Inactive'', " : "";
						break;
					case "Finished":
						str_subjstatus += chk.Checked ? " ''Finished'', " : "";
						break;
					case "Finished_DropOut":
						str_subjstatus += chk.Checked ? " ''Finished_DropOut'', " : "";
						break;
					case "NotInStudy":
						str_subjstatus += chk.Checked ? " ''Not In Study'', " : "";
						break;
					case "NotPartic":
						str_subjstatus += chk.Checked ? " ''Not Participating'', " : "";
						break;
					case "NotEnroll":
						str_subjstatus += chk.Checked ? " ''Not Enrolled'', " : "";
						break;

					case "XGen_Active":
						str_subjstatus += chk.Checked ? " ''XGen_Active'', " : "";
						break;
					case "XGen_Finished":
						str_subjstatus += chk.Checked ? " ''XGen_Finished'', " : "";
						break;
					case "XGen_NotPartic":
						str_subjstatus += chk.Checked ? " ''XGen_NotPartic'', " : "";
						break;
					//case "ToBeSched":
					//    str_subjstatus += chk.Checked ? " ''TBS'', " : "";
					//    break;
					//case "Active":
					//    str_subjstatus += chk.Checked ? " ''ACT'', " : "";
					//    break;
					//case "OOS":
					//    str_subjstatus += chk.Checked ? " ''OUT'', " : "";
					//    break;
					//case "DQ":
					//    str_subjstatus += chk.Checked ? " ''DQ'', " : "";
					//    break;
					//case "Inactive":
					//    str_subjstatus += chk.Checked ? " ''INACT'', " : "";
					//    break;
					//case "Finished":
					//    str_subjstatus += chk.Checked ? " ''FINISH'', " : "";
					//    break;
					//case "NotInStudy":
					//    str_subjstatus += chk.Checked ? " ''NinS'', " : "";
					//    break;
					//case "NotPartic":
					//    str_subjstatus += chk.Checked ? " ''NPART'', " : "";
					//    break;
					//case "NotEnroll":
					//    str_subjstatus += chk.Checked ? " ''NE'', " : "";
					//    break;

					//case "XGen_Active":
					//    str_subjstatus += chk.Checked ? " ''XGen_Act'', " : "";
					//    break;
					//case "XGen_Finished":
					//    str_subjstatus += chk.Checked ? " ''XGen_Fin'', " : "";
					//    break;
					//case "XGen_NotPartic":
					//    str_subjstatus += chk.Checked ? " ''XGen_NPRT'', " : "";
					//    break;

				}
			}

		}
		#endregion

		#region  ....... Dynamic Where COLUMNS: Sex .......

		foreach (Control c in Panel_WhereClauseControls_Sex.Controls)
		{
			if (c is CheckBox)
			{
				CheckBox chkgrp = (CheckBox)c;
				string sex = chkgrp.Text;
				str_sex += chkgrp.Checked ? " ''" + sex + "'', " : "";

			}
		}
		#endregion

		#region  ....... Dynamic Where COLUMNS: Groups .......
		string str_groups = "";
		foreach (Control c in Panel_WhereClauseControls_Groups.Controls)
		{
			if (c is CheckBox)
			{
				CheckBox chkgrp = (CheckBox)c;
				string grpname = chkgrp.Text;
				str_groups += chkgrp.Checked ? " ''" + grpname + "'', " : "";

			}
		}
		#endregion





		#region  ....... Dynamic Where ROWS: TimePoints .......
		string str_timepoints = "";
		foreach (Control c in Panel_WhereClauseControls_Timepoints.Controls)
		{
			if (c is CheckBox)
			{
				CheckBox chktp = (CheckBox)c;
				string timepointname = chktp.Text;
				str_timepoints += chktp.Checked ? " ''" + timepointname + "'', " : "";

			}

		}
		#endregion

		#region  ....... Dynamic Where ROWS: ActionTypes .......
		string str_actiontypes = "";
		foreach (Control c in PlaceHolder_WhereClauseControls_ActionTypes.Controls)
		{
			if (c is CheckBox)
			{
				CheckBox chkat = (CheckBox)c;
				string actiontype = chkat.Text;
				str_actiontypes += chkat.Checked ? " ''" + actiontype + "'', " : "";

			}

		}
		#endregion  

		#region  ....... Dynamic Where ROWS: ActionTypes .......  NO LONGER USED
		//// ActionStatus removed from the WHERE clause as it produces empty cells
		//string str_actionstatus = str_actionstatus";
		//foreach (Control c in PlaceHolder_WhereClauseControls_ActionStatus.Controls)
		//{
		//    if (c is CheckBox)
		//    {
		//        CheckBox chkas = (CheckBox)c;
		//        string actionstatus = chkas.Text;
		//        str_actionstatus += chkas.Checked ? " ''" + actionstatus + "'', " : "";

		//    }

		//}
		#endregion


		//for the data entry totals input params:
		if (data_to_return == "DEtotals")
		{
			//if (str_sex == "M,F" | str_sex == "F,M," | str_sex == "") where_sex = "'M','F'";
			//else where_sex = str_sex;

			where_groups = str_groups.Replace(" '", "") + ".";
			where_sex = str_sex.Replace(" '", "") + ".";
			where_subjstatus = str_subjstatus.Replace(" '", "") + ".";  //to terminate the CSV
			where_timepoint = str_timepoints.Replace(" '", "") + ".";

			where_groups = where_groups.Replace("'", "") ;
			where_sex = where_sex.Replace("'", "") ;
			where_subjstatus = where_subjstatus.Replace("'", "") ;  //to terminate the CSV
			where_timepoint = where_timepoint.Replace("'", "") ;

			where_groups = where_groups.Replace(", ", ",");
			where_sex = where_sex.Replace(", ", ",");
			where_subjstatus = where_subjstatus.Replace(", ", ",");  //to terminate the CSV
			where_timepoint = where_timepoint.Replace(", ", ",");
		}


		// for the rest of the data sources
		if (str_sex == "M") str_sex = " and Sex = ''M''   ";
		else if (str_sex == "F") str_sex = " and Sex = ''F''  ";
		else str_sex = "";


		string str_TE_only = "";
		if (data_to_return == "MTE")
		{
			str_TE_only += " and ID in (select distinct(ID) from vwMasterStatus_MD_stacked where statusshort like ''TE%'' and studyID = " + _content_studyID.ToString() + ") ";
		}

		where_cols = " ' " + str_sex + "  and subjstatus in (" + str_subjstatus + " ''.'') and groupname in (" + str_groups + " ''.'') " + str_TE_only + " '";




		string s1 = where_cols.Replace("and","<br/>"); 
		string s2 = s1.Replace("''", "");
		string s3 = s2.Replace("'", "");
		where_cols_for_display = s3.Replace(".)",")");


		


		if (data_to_return == "A")
		{
			where_rows = "' and timepoint_text in (" + str_timepoints + " ''.'')  and actiontype in (" + str_actiontypes + " ''.'') '";
				//+  " and statusshort in (" + str_actionstatus + " ''.'')  '";
		}
		else
		{
			where_rows = "' and timepoint_text in (" + str_timepoints + " ''.'')  '";
		}

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========> where_cols:  " + where_cols + " <br/>";
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========> where_rows:  " + where_rows + " <br/>";


	}



	#region  Show/hide Buttons =============================================================================


	protected void ShowHide_Button_Panels(string datasource)
	{

		LabelAM.Visible = false;
		LabelM.Visible = false;
		LabelA.Visible = false;
		LabelC.Visible = false;
		LabelS.Visible = false;
		LabelDEtotals.Visible = false;

		PlaceHolder1.Visible = false;

		Panel_Enrollment_Rpt_Header.Visible = false;
		Panel_Enrollment_Rpt0.Visible = false;
		Panel_Enrollment_Rpt1.Visible = false;

		Panel_Consents.Visible = false;
		Panel_Consents_Denied.Visible = false;


		Panel_DataEntryTotals.Visible = false;
		PlaceHolder_WhereClauseControls_ActionTypes.Visible = false;

		switch (datasource)
		{
			case "AM":
				LabelAM.Visible = true;
				PlaceHolder_WhereClauseControls_ActionTypes.Visible = true;
				break;
			case "A":
				LabelA.Visible = true;
				PlaceHolder_WhereClauseControls_ActionTypes.Visible = true;
				break;
			case "M":
				LabelM.Visible = true;
				break;
			case "C":
				LabelC.Visible = true;

				Panel_Consents.Visible = true;
				Panel_Consents_Denied.Visible = true;

				break;
			case "S":
				LabelS.Visible = true;
				break;
			case "DEtotals":
				LabelDEtotals.Visible = true;
				LabelDEtotals.Text = "Data Entry Totals";
				Panel_DataEntryTotals.Visible = true;
				break;
			case "DEtotalsREL":
				LabelDEtotals.Visible = true;
				LabelDEtotals.Text = "Data Entry Totals - RELIABILITY";
				Panel_DataEntryTotals.Visible = true;
				break;
			case "EnrollmentRpt":
				Panel_Enrollment_Rpt_Header.Visible = true;
				Panel_Enrollment_Rpt0.Visible = true;
				Panel_Enrollment_Rpt1.Visible = true;
				break;

		}
	}
	#endregion


	#region Get Data from Buttons ==========================================================================
	protected void setdata_AM(object sender, EventArgs e)
	{
		mydatasource = "AM";
		ShowHide_Button_Panels(mydatasource);
		Populate_MyGridView("AMCD");
	}

	protected void setdata_M(object sender, EventArgs e)
	{
		mydatasource = "M";
		ShowHide_Button_Panels(mydatasource);
		Populate_MyGridView("MD");
	}

	protected void setdata_MTE(object sender, EventArgs e)
	{
		mydatasource = "MTE";
		ShowHide_Button_Panels(mydatasource);
		Populate_MyGridView("MTE");
	}

	protected void setdata_A(object sender, EventArgs e)
	{
		mydatasource = "A";
		if (PlaceHolder_WhereClauseControls_ActionTypes.Visible)
		{
			ShowHide_Button_Panels(mydatasource);
			Populate_MyGridView("A");
		}
		else
		{
			ShowHide_Button_Panels(mydatasource);
		}
	}

	protected void setdata_A_duedate(object sender, EventArgs e)
	{
		mydatasource = "A";
		ShowHide_Button_Panels(mydatasource);
	}



	protected void setdata_C(object sender, EventArgs e)
	{
		mydatasource = "C";
		ShowHide_Button_Panels(mydatasource);
		Populate_MyGridView("C");
		Populate_Consents_Denied();
	}


	protected void setdata_S(object sender, EventArgs e)
	{
		mydatasource = "S";
		ShowHide_Button_Panels(mydatasource);
		Populate_SubjectDetails_Gridview();
	}


	protected void setdata_DEtotals(object sender, EventArgs e)
	{
		mydatasource = "DEtotals";

		SqlCommand cmd_tp = new SqlCommand();
		cmd_tp.Connection = oConnData;
		cmd_tp.CommandType = CommandType.StoredProcedure;
		cmd_tp.CommandText = "spSEC__DataEntryTotals_ByTimePoint";
		cmd_tp.Parameters.Add("where_sex", SqlDbType.VarChar, 20);
		cmd_tp.Parameters.Add("where_groups", SqlDbType.VarChar, 300);
		cmd_tp.Parameters.Add("where_subjstatus", SqlDbType.VarChar, 300);
		cmd_tp.Parameters.Add("where_timepoint", SqlDbType.VarChar, 300);

		SqlCommand cmd_g = new SqlCommand();
		cmd_g.Connection = oConnData;
		cmd_g.CommandType = CommandType.StoredProcedure;
		cmd_g.CommandText = "spSEC__DataEntryTotals_ByGroup";
		cmd_g.Parameters.Add("where_sex", SqlDbType.VarChar, 20);
		cmd_g.Parameters.Add("where_groups", SqlDbType.VarChar, 300);
		cmd_g.Parameters.Add("where_subjstatus", SqlDbType.VarChar, 300);
		cmd_g.Parameters.Add("where_timepoint", SqlDbType.VarChar, 300);

		CreateWhereClause("DEtotals");

		// make this the where_cols variable
		cmd_tp.Parameters["where_sex"].Value = where_sex;
		cmd_tp.Parameters["where_groups"].Value = where_groups;
		cmd_tp.Parameters["where_subjstatus"].Value = where_subjstatus;
		cmd_tp.Parameters["where_timepoint"].Value = where_timepoint;

		cmd_g.Parameters["where_sex"].Value = where_sex;
		cmd_g.Parameters["where_groups"].Value = where_groups;
		cmd_g.Parameters["where_subjstatus"].Value = where_subjstatus;
		cmd_g.Parameters["where_timepoint"].Value = where_timepoint;

	   // LogToPageUrgent(where_sex + " | " + where_subjstatus + " | " + where_groups + " | " + where_timepoint);

		if (oConnData.State == ConnectionState.Closed) oConnData.Open();

		cmd_tp.CommandTimeout = 60;
		cmd_g.CommandTimeout = 60;

		SqlDataReader sqlReader_tp = cmd_tp.ExecuteReader();
		DataTable dt_tp = new DataTable();
		dt_tp.Load(sqlReader_tp);
		GV_TimePoint.DataSource = dt_tp;
		GV_TimePoint.DataBind();
		sqlReader_tp.Close();

		SqlDataReader sqlReader_g = cmd_g.ExecuteReader();
		DataTable dt_g = new DataTable();
		dt_g.Load(sqlReader_g);
		GV_StudyMeas.DataSource = dt_g;
		GV_StudyMeas.DataBind();
		sqlReader_g.Close();

		ShowHide_Button_Panels(mydatasource);

		lblCheckSql.Text = "/* DE totals */ <br/> spSEC__DataEntryTotals_ByTimePoint <br/> sex=" + where_sex +
			"<br/>  groups=" + where_groups +
			"<br/>  subjstatus=" + where_subjstatus +
			"<br/>  timepoint=" + where_timepoint;   

	}


	protected void setdata_DEtotalsREL(object sender, EventArgs e)
	{
		mydatasource = "DEtotalsREL";

		SqlCommand cmd_tp = new SqlCommand();
		cmd_tp.Connection = oConnData;
		cmd_tp.CommandType = CommandType.StoredProcedure;
		cmd_tp.CommandText = "spSEC__DataEntryTotals_ByTimePoint_REL";
		cmd_tp.Parameters.Add("where_sex", SqlDbType.VarChar, 20);
		cmd_tp.Parameters.Add("where_groups", SqlDbType.VarChar, 300);
		cmd_tp.Parameters.Add("where_subjstatus", SqlDbType.VarChar, 300);
		cmd_tp.Parameters.Add("where_timepoint", SqlDbType.VarChar, 300);

		SqlCommand cmd_g = new SqlCommand();
		cmd_g.Connection = oConnData;
		cmd_g.CommandType = CommandType.StoredProcedure;
		cmd_g.CommandText = "spSEC__DataEntryTotals_ByGroup_REL";
		cmd_g.Parameters.Add("where_sex", SqlDbType.VarChar, 20);
		cmd_g.Parameters.Add("where_groups", SqlDbType.VarChar, 300);
		cmd_g.Parameters.Add("where_subjstatus", SqlDbType.VarChar, 300);
		cmd_g.Parameters.Add("where_timepoint", SqlDbType.VarChar, 300);

		CreateWhereClause("DEtotals");

		// make this the where_cols variable
		cmd_tp.Parameters["where_sex"].Value = where_sex;
		cmd_tp.Parameters["where_groups"].Value = where_groups;
		cmd_tp.Parameters["where_subjstatus"].Value = where_subjstatus;
		cmd_tp.Parameters["where_timepoint"].Value = where_timepoint;

		cmd_g.Parameters["where_sex"].Value = where_sex;
		cmd_g.Parameters["where_groups"].Value = where_groups;
		cmd_g.Parameters["where_subjstatus"].Value = where_subjstatus;
		cmd_g.Parameters["where_timepoint"].Value = where_timepoint;

		// LogToPageUrgent(where_sex + " | " + where_subjstatus + " | " + where_groups + " | " + where_timepoint);

		if (oConnData.State == ConnectionState.Closed) oConnData.Open();

		cmd_tp.CommandTimeout = 60;
		cmd_g.CommandTimeout = 60;

		SqlDataReader sqlReader_tp = cmd_tp.ExecuteReader();
		DataTable dt_tp = new DataTable();
		dt_tp.Load(sqlReader_tp);
		GV_TimePoint.DataSource = dt_tp;
		GV_TimePoint.DataBind();
		sqlReader_tp.Close();

		SqlDataReader sqlReader_g = cmd_g.ExecuteReader();
		DataTable dt_g = new DataTable();
		dt_g.Load(sqlReader_g);
		GV_StudyMeas.DataSource = dt_g;
		GV_StudyMeas.DataBind();
		sqlReader_g.Close();

		ShowHide_Button_Panels(mydatasource);

		lblCheckSql.Text = "/* DE totals REL */ <br/> spSEC__DataEntryTotals_ByTimePoint_REL <br/> sex=" + where_sex +
			"<br/>  groups=" + where_groups +
			"<br/>  subjstatus=" + where_subjstatus +
			"<br/>  timepoint=" + where_timepoint;  
	}
	


	protected void setdata_EnrollmentRpt(object sender, EventArgs e)
	{

		Panel_Enrollment_Rpt_Header.Controls.Clear();
		Panel_Enrollment_Rpt1.Controls.Clear();
		mydatasource = "EnrollmentRpt";


		HyperLink hyp = new HyperLink(); hyp.NavigateUrl = "http://grants.nih.gov/grants/funding/phs398/CumulativeInclusionEnrollmentReport.pdf";
		hyp.Target = "_new"; hyp.Text = "NIH Inclusion Enrollment Report (pdf)"; hyp.Font.Size = FontUnit.Point(14);
		Panel_Enrollment_Rpt_Header.Controls.Add(hyp);

		Label lfilter = new Label();
		lfilter.Text = "<br/><br/><b>" + _content_studyname  + "</b><br/><i>Filtered By:" + where_cols_for_display + "</i><br/><br/>";

		Label l0 = new Label(); l0.Font.Bold = true; l0.Font.Underline = true;
		l0.Text = "<br/><br/>Cumulative Inclusion Enrollment Report<br/><br/>";


		Label l1 = new Label(); l1.Font.Bold = true; l1.Font.Underline = true;
		l1.Text = "<br/><br/><br/><i>Formatting for the previous version:</i><br/><br/>PART A. TOTAL ENROLLMENT REPORT: Number of Subjects Enrolled to Date (Cumulative) by Ethnicity<br/><br/>";

		Label l2 = new Label(); l2.Font.Bold = true; l2.Font.Underline = true;
		l2.Text = "<br/><br/>PART A. TOTAL ENROLLMENT REPORT: Number of Subjects Enrolled to Date (Cumulative) by Race<br/><br/>";

		Label l3 = new Label(); l3.Font.Bold = true; l3.Font.Underline = true;
		l3.Text = "<br/><br/>PART B. HISPANIC ENROLLMENT REPORT: Number of Hispanics or Latinos Enrolled to Date (Cumulative)<br/><br/>";

		Panel_Enrollment_Rpt_Header.Controls.Add(lfilter);
		Panel_Enrollment_Rpt_Header.Controls.Add(l0);


		//GridView gv0 = Create_GV_from_SQLstring(oConn, "exec spSEC_EnrollmentReport 0, " + where_cols, "gvEnrollmentRpt_0");
		//Panel_Enrollment_Rpt0.Controls.Add(gv0); 
		
		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConn;
		cmd.CommandType = CommandType.Text;
		cmd.CommandText = "exec spSEC_EnrollmentReport 0, " + where_cols ;


		SqlDataReader sqlReader_tp = cmd.ExecuteReader();
		DataTable dt_tp = new DataTable();
		dt_tp.Load(sqlReader_tp);
		gv_Enrollment_Rpt0.DataSource = dt_tp;
		gv_Enrollment_Rpt0.DataBind();
		sqlReader_tp.Close();

 
		
		GridView gv1 = Create_GV_from_SQLstring(oConn, "exec spSEC_EnrollmentReport 1, " + where_cols, "gvEnrollmentRpt_1");
		Panel_Enrollment_Rpt1.Controls.Add(l1);
		Panel_Enrollment_Rpt1.Controls.Add(gv1);

		GridView gv2 = Create_GV_from_SQLstring(oConn, "exec spSEC_EnrollmentReport 2, " + where_cols, "gvEnrollmentRpt_2");
		Panel_Enrollment_Rpt1.Controls.Add(l2);
		Panel_Enrollment_Rpt1.Controls.Add(gv2);

		GridView gv3 = Create_GV_from_SQLstring(oConn, "exec spSEC_EnrollmentReport 3, " + where_cols, "gvEnrollmentRpt_3");
		Panel_Enrollment_Rpt1.Controls.Add(l3);
		Panel_Enrollment_Rpt1.Controls.Add(gv3);


		ShowHide_Button_Panels(mydatasource);

		Panel_Enrollment_Rpt_Header.Visible = true;
		Panel_Enrollment_Rpt0.Visible = true;
		Panel_Enrollment_Rpt1.Visible = true;
	}
	#endregion


	protected GridView Create_GV_from_SQLstring(SqlConnection c, string strSQL, string gvID)
	{
		SqlCommand cmd = new System.Data.SqlClient.SqlCommand(strSQL, c);
		if (c.State == ConnectionState.Closed) c.Open();
		DataTable dt = new DataTable();

		SqlDataReader r = cmd.ExecuteReader();
		dt.Load(r);

		//SqlDataAdapter sqlAdapter_GetSubj = new SqlDataAdapter(sqlCmd_GetSubj);
		//sqlAdapter_GetSubj.Fill(dt_GetSubj);
		int num_rows = dt.Rows.Count;


		//build the Gridview & columns
		GridView gv = new GridView();
		gv.ID = gvID;
		gv.AutoGenerateColumns = true;
		gv.CssClass = "tblinputsmall_blue";
		//SubjectDetails_gridview.RowDataBound += new GridViewRowEventHandler(SubjStatus_Totals_gridview_RowDataBound);


		//Bind the data
		gv.DataSource = dt;
		gv.DataBind();

		return gv;
	}




	//Populate the Subjects Gridview
	protected void Populate_SubjectDetails_Gridview()
	{

		Panel_SubjectDetails.Controls.Clear();
		PlaceHolder1.Visible = false;
		Panel_SubjectDetails.Visible = true;

		try
		{

			string sql = "exec spSEC_PIVOT__RowEQ_Subject__Dynamic_Where " + " ''," + where_cols;
			GridView SubjectDetails_gridview = new AutoGridView("backend", sql, "SubjectDetails_gridview", false, "hnext,hide,l,hnext,hide,", "",
				"~/Household/ViewHousehold.aspx?HouseholdID=,,,~/Measures/EditSubject.aspx?subjID=,");
			
			Panel_SubjectDetails.Controls.Clear();
			Panel_SubjectDetails.Controls.Add(SubjectDetails_gridview);

			lblCheckSql.Text = "/* Populate_SubjectDetails_Gridview */<br/>" + sql;

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


	protected void Populate_Consents_Denied()
	{

		// datasource = "exec spSEC_COUNTS_SUMMARY_SubjStatus_by_studyID " + _content_studyID.ToString();
		//if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> datasource: " + datasource + " <br/>";


		try
		{

			Panel_Consents_Denied.Controls.Clear();

			SqlCommand SqlCmd = new System.Data.SqlClient.SqlCommand("exec spMasterStatus_C_denied " + _content_studyID.ToString(), oConn);
			SqlDataReader SqlReader = SqlCmd.ExecuteReader();

			//Fill the data table
			DataTable dt = new DataTable();
			dt.Load(SqlReader);


			Int32 _rowcount = dt.Rows.Count;

			//build the Gridview & columns
			GridView mygridview = new GridView();
			mygridview.ID = "Consents_Denied_gridview";
			mygridview.AutoGenerateColumns = true;
			mygridview.CssClass = "tblinputsmall_blue";

			mygridview.EmptyDataText = "No consents denied for this study.";

			//Bind the data
			mygridview.DataSource = dt;
			mygridview.DataBind();

			LiteralControl lit = new LiteralControl();
			lit.Text = "<br/><br/><b><u>Consent items that have been denied:</u></b><br/>";
			Panel_Consents_Denied.Controls.Add(lit);

			Panel_Consents_Denied.Controls.Add(mygridview);

			Panel_Consents_Denied.Visible = true;

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



	#region Populate the Subjects table at the top of the page
	protected void Populate_Subjects_Gridview()
	{

		//studyID = Convert.ToInt16(DDL_SelectStudyID.SelectedValue);
		//studyID = Convert.ToInt16(this.Master.Master_studyID);

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> PRE  CreateWhereClause _content_studyID=" + _content_studyID.ToString() + "<br/>";
		CreateWhereClause("Populate_Subjects_Gridview");
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> POST CreateWhereClause _content_studyID=" + _content_studyID.ToString() + "<br/>";

		datasource = "exec spSEC_COUNTS_SUMMARY_SubjStatus_by_studyID " + _content_studyID.ToString();

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> datasource: " + datasource + " <br/>";


		try
		{

			Panel_SubjStatus_Totals.Controls.Clear();

			SqlCommand SqlCmd = new System.Data.SqlClient.SqlCommand("exec spSEC_COUNTS_SUMMARY_SubjStatus_by_studyID " + _content_studyID.ToString(), oConn);
			SqlDataReader SqlReader = SqlCmd.ExecuteReader();

			//Fill the data table
			DataTable dt = new DataTable();
			dt.Load(SqlReader);


			Int32 _rowcount = dt.Rows.Count;

			//build the Gridview & columns
			GridView mygridview = new GridView();
			mygridview.ID = "SubjStatus_Totals_gridview";
			mygridview.AutoGenerateColumns = true;
			mygridview.CssClass = "tblinputsmall_blue";
			mygridview.RowDataBound += new GridViewRowEventHandler(SubjStatus_Totals_gridview_RowDataBound);


			//Bind the data
			mygridview.DataSource = dt;
			mygridview.DataBind();
			Panel_SubjStatus_Totals.Controls.Add(mygridview);



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


	protected void SubjStatus_Totals_gridview_RowDataBound(Object sender, GridViewRowEventArgs e)
	{
		//if a data row
		if (e.Row.RowType == DataControlRowType.DataRow)
		{

			string mycellval = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "[Group]"));
			string mycellvalsex = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sex"));
			//tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========> mycellval: " + mycellval + " <br/>";

			if (mycellval == "_TOTAL_")
			{
				e.Row.Font.Bold = true;
				e.Row.Font.Size = 12;
			}
			else if (mycellvalsex == " ")
			{
				e.Row.Font.Size = 10;
				e.Row.Font.Bold = true;
				e.Row.ForeColor = System.Drawing.Color.DarkBlue;
			}

		}


	}
	#endregion


	protected void Populate_MyGridView(string data_to_return)
	{
		// Only used for:  AMCD, A, MD, C  (A>M,C  Actions  Measures  Consents)
		// Not used for DEtotals, Subjects, Enrollment


		bool use_scroll = (data_to_return == "C" | data_to_return == "MD") ? false : false;

		string cellcontents = "link_cell";


		//hide the subject details gridview
		Panel_SubjectDetails.Visible = false;
		PlaceHolder1.Visible = true;

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Populate_MyGridView <br/>";
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> PRE  CreateWhereClause _content_studyID=" + _content_studyID.ToString() + "<br/>";

		CreateWhereClause(data_to_return);


	 



		datasource = "exec spSEC_PIVOT__RowEQ_AMCDstacked_ColEQ_Subject__Dynamic_WhereNEW " + _content_studyID.ToString() + ",'" + data_to_return + "', '" + 
			cellcontents + "'," + where_cols + "," + where_rows;
		//LogToPageUrgent(" ---> " + datasource);

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> datasource: " + datasource + " <br/>";

		lblCheckSql.Text = "/* Populate_MyGridView */<br/>" + datasource;

		try
		{

			SqlCommand SqlCmd = new System.Data.SqlClient.SqlCommand(datasource, oConn);
			SqlCmd.CommandTimeout = 90;
			SqlDataReader SqlReader = SqlCmd.ExecuteReader();


			//Get the Columnnames 
			Int32 _columncount = SqlReader.FieldCount;
			_colnames = new string[_columncount];
			_url1 = new string[_columncount];

			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> ColCount: " + _columncount.ToString() + " <br/>";


			bool[] _colvisible = new bool[_columncount];

			#region Loop Through Columns and Format Based on ColumnName/VariableName
			for (int iCol = 0; iCol < _columncount; iCol++)
			{
				_colnames[iCol] = SqlReader.GetName(iCol).ToString();

				switch (SqlReader.GetName(iCol).ToString())
				{
					case "x":
						_colvisible[iCol] = false;
						break;
					case "actmeas":
						_colvisible[iCol] = false;
						break;
					case "groupname":
						_colvisible[iCol] = false;
						break;
					case "timepointID":
						_colvisible[iCol] = false;
						break;

					case "sortorder_A":
						_colvisible[iCol] = false;
						break;
					case "sortorder_C":
						_colvisible[iCol] = false;
						break;
					case "sortorder_M":
						_colvisible[iCol] = false;
						break;
					case "entityID":
						_colvisible[iCol] = false;
						break;
					case "link_byentity":
						{
							_colvisible[iCol] = false;
							_url1[iCol] = SqlReader.GetName(iCol).ToString();
							break;
						}
					default:
						_colvisible[iCol] = true;
						break;
				}

			}
			#endregion


			//Fill the data table
			DataTable dt = new DataTable();
			dt.Load(SqlReader);


			Int32 _rowcount = dt.Rows.Count;

			//build the Gridview & columns
			GridView mygridview ;

			if (use_scroll)
			{
				mygridview = (GridView)Panel_Consents.FindControl("gvScroll");

				mygridview.Columns.Clear();

			}
			else
			{
				mygridview = new GridView();
				mygridview.ID = "Details_GridView";
				mygridview.AutoGenerateColumns = false;  //Check here - DO NOT AUTO GENERATE THE COLUMNS, Add based on visibility assigned above

				mygridview.CssClass = "tblinputsmall_blue";

				mygridview.RowDataBound += new GridViewRowEventHandler(mygridview_RowDataBound);

			}


			//Loop through columns and add ItemTemplates
			TemplateField tf = null;
			for (int c = 0; c < _columncount; c++)
			{
				tf = new TemplateField();
				if (_colnames[c] == "StudyMeasName")
				{
					tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.Header);
					tf.ItemTemplate = new DynamicGridViewURLTemplate(_colnames[c], "url1", DataControlRowType.DataRow);
				}
				else if (_colnames[c] == "TimePoint")
				{
					tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.Header);
					tf.ItemTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.DataRow);
					
				}
				else
				{

					//get the ID, the first characters prior to the " <br" in the column header
					string theID = "-1";
					if (_colnames[c].ToString().IndexOf("</p") > 0 && _colnames[c].ToString().IndexOf("fs14") > 0)
					{
						string IDstring = _colnames[c].ToString();
						int start_col = IDstring.IndexOf("fs14\">");
						int end_col = IDstring.IndexOf("</p");
						try { theID = IDstring.Substring(start_col + 6, (end_col - (start_col + 6))); }
						catch { theID = "-2"; }

						//lblCheckSql.Text += "<br/>start_col=" +  start_col.ToString() + "  end_col=" + end_col.ToString() + "  theID = [" + theID + "]" +
						//    "<br/>" + IDstring + "  length=" + IDstring.Length.ToString();

					}

					int subjID = oDBLookup.GetSubjIDFromID(theID, _content_studyID);
					//int subjID = 0;
					int householdID = oDBLookup.GetHouseholdIDBySubjID(subjID);

					//12324567890123245678901232456789012324567890
					//SPD<br/>Active<br/><p class="fs14">test1</p>

					string myurl = "";
					if (data_to_return == "A")
					{
						myurl = @"~/Measures/ActionsBySubject.aspx?subjectID=" + subjID.ToString();
					}
					else if (use_scroll)
					{

						if (_colnames[c] == "ItemName")
						{
							//tf.HeaderStyle.Width = Unit.Pixel(220);
							//tf.ItemStyle.Width = Unit.Pixel(220);
						}

						if(data_to_return ==  "C" ) myurl = @"~/Measures/ConsentsBySubject.aspx?subjectID=" + subjID.ToString();
						if (data_to_return == "MD") myurl = @"~/Measures/MeasuresBySubject.aspx?subjectID=" + subjID.ToString();

					}
					else
					{
						myurl = @"~/Measures/MeasuresBySubject.aspx?subjectID=" + subjID.ToString();
					}


					//Here the URL is precalcuated for the header
					tf.HeaderTemplate = new DynamicGridViewURLTemplate(_colnames[c], myurl, DataControlRowType.Header);


					//For the item, the URL is embedded in the data itself following a pipe
					tf.ItemTemplate = new DynamicGridViewURLTemplate(_colnames[c], @"~", DataControlRowType.DataRow);
				}
				tf.Visible = _colvisible[c];

				// label controls in the cells to have a 100% width and overflow:hidden.
				//tf.ItemStyle.Width = Unit.Percentage(100);
				//tf.ItemStyle.Wrap = false;
				
				mygridview.Columns.Add(tf);
			}

			
			//Bind the data
			mygridview.DataSource = dt;
			mygridview.DataBind();

			if (use_scroll)
			{
				Panel_Consents.Visible = true;
				PlaceHolder1.Visible = false;
			}
			else
			{
				PlaceHolder1.Controls.Add(mygridview);
				PlaceHolder1.Visible = true;
			}
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





	protected void mygridview_RowDataBound(Object sender, GridViewRowEventArgs e)
	{
		string cellval_full = "";


		if (e.Row.RowType == DataControlRowType.DataRow)  //if a data row
		{

			string consentformname = "";  // Get the consent form name so we can put a think top border for each new consent form
			if (mydatasource == "C")
			{
				consentformname = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "itemname"));
			}

			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==> e.Row.Cells.Count = " + e.Row.Cells.Count.ToString() + "  <br/>";
			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==>   _colnames.length = " + _colnames.Length.ToString() + "  <br/>";

			for (int c = 0; c < e.Row.Cells.Count; c++)
			{

				//Get the control  - NOT CLEAR WHY .Text DOES NOT GIVE THE LABEL TEXT??
				DataControlFieldCell celllabel = (DataControlFieldCell)e.Row.Controls[c];

				//if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========> c: " + c.ToString() + " <br/>";

				if (c <= _colnames.Length)  //This prevents an out of range error
				{

					try
					{
						cellval_full = Convert.ToString(DataBinder.Eval(e.Row.DataItem, _colnames[c]));
					}
					catch
					{
						cellval_full = "";
					}
					string cellval = "";

					if (cellval_full.IndexOf("|") >= 1) cellval = cellval_full.Substring(0, cellval_full.IndexOf("|"));

					if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "<br/> cellval=" + cellval;

					switch (cellval)
					{
						//to fix with a query to return a data table and loop through it

						// /* Run the following query to create this syntax from the meta data in the DB */
						//select distinct('        case "' + sms_dd_status + '": celllabel.BackColor = SystemDrawing.Color.' + sms_dd_color + '; break;' )
						//from tblSMS_DD_lkup order by verified, flag_sqldatatable_is_NA desc, SM_in_DatData, measstatusID

						case "": if (_colnames[c] != "TimePoint") celllabel.BackColor = System.Drawing.Color.Gray; break;
						case "CK_e": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
						case "CK_g": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
						case "CK_h": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
						case "D_ND": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
						case "D0": celllabel.BackColor = System.Drawing.Color.DarkGreen; break;
						case "D1": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;
						case "D2": celllabel.BackColor = System.Drawing.Color.DarkGreen; break;
						case "NA": celllabel.BackColor = System.Drawing.Color.Gray; break;
						case "NA_D1": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
						case "NA_D2": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
						case "NA_ND": celllabel.BackColor = System.Drawing.Color.Red; break;
						case "ND": celllabel.BackColor = System.Drawing.Color.DarkRed; break;
						case "ND.": celllabel.BackColor = System.Drawing.Color.Red; break;
						case "ND_": celllabel.BackColor = System.Drawing.Color.Red; break;
						case "ND_D1": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
						case "ND_D2": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
						case "NDL": celllabel.BackColor = System.Drawing.Color.Red; break;
						case "TBC": celllabel.BackColor = System.Drawing.Color.CornflowerBlue; break;
						case @"TBC.": celllabel.BackColor = System.Drawing.Color.CornflowerBlue; break;
						case "TBC_D1": celllabel.BackColor = System.Drawing.Color.Yellow; break;
						case "TBC_D2": celllabel.BackColor = System.Drawing.Color.Yellow; break;
						case "TBC_ND": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
						case "TE": celllabel.BackColor = System.Drawing.Color.Lime; break;
						case "TE.": celllabel.BackColor = System.Drawing.Color.Lime; break;

						//Actions
						case "TBD": celllabel.BackColor = System.Drawing.Color.CornflowerBlue; break;
						case "Pass": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;
						case "COMP": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;
						case "Yes": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;
						case "MISSED": celllabel.BackColor = System.Drawing.Color.Red; break;
						case "No": celllabel.BackColor = System.Drawing.Color.Red; break;
						case "DC": celllabel.BackColor = System.Drawing.Color.Red; break;
						case "NOSHOW": celllabel.BackColor = System.Drawing.Color.Red; break;
						case "Fail": celllabel.BackColor = System.Drawing.Color.Red; break;
						case "Sched": celllabel.BackColor = System.Drawing.Color.Lime; break;
						case "Inc/Fup": celllabel.BackColor = System.Drawing.Color.Yellow; break;
						case "NA-ss": celllabel.BackColor = System.Drawing.Color.Gray; break;

						//CONSENTS
						case "Comp": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;


					}
				}

				string actmeas = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "actmeas"));

				switch (mydatasource)
				{
					case "AM":

						switch (actmeas)
						{
							case "action":
								celllabel.BackColor = System.Drawing.Color.Gainsboro;
								celllabel.Font.Bold = true;
								celllabel.Font.Italic = true;
								break;
							case "consent":
								celllabel.BackColor = System.Drawing.Color.Goldenrod;
								celllabel.Font.Bold = true;
								celllabel.Font.Italic = true;
								break;
							default:
								break;
						}
						break;

					case "C":
						if (actmeas == "meas") e.Row.Visible = false;
						else if (actmeas == "action") e.Row.Visible = false;

						// add a thick border between each different consent form
						if (consentformname.Contains("(#1)"))
						{
							celllabel.Style.Add("BORDER-TOP", "#51518E 5px solid");
						}

						//if (c == 6 | c == 7)
						//{
						//    e.Row.Cells[c].CssClass = "FrozenCell";
						//    //ItemStyle-CssClass="FrozenCell" HeaderStyle-CssClass="FrozenCell"/>
						//}


						break;
					case "M":
						if (actmeas == "action") e.Row.Visible = false;
						else if (actmeas == "consent") e.Row.Visible = false;
						break;
					case "A":
						if (actmeas == "meas") e.Row.Visible = false;
						else if (actmeas == "consent") e.Row.Visible = false;
						break;
					default:
						break;

				}
			}

			
			

		}
	}


	#region Utilities
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




