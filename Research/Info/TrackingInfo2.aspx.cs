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


public partial class Info_TrackingInfo2 : System.Web.UI.Page
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
	private string where_cols;

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
	}


	protected void Page_Load(object sender, EventArgs e)
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "--> Page_Load <br/>";


		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

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


	//protected void DDL_SelectStudyID_SelectedIndexChanged(object sender, EventArgs e)
	//{
	//    if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-------> DDL_SelectStudyID_SelectedIndexChanged <br/>";

	//    studyID = Convert.ToInt16(DDL_SelectStudyID.SelectedValue);

	//    PopulateWhereClauseControls_forStudy();
	//    CreateWhereClause();
	//}


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
				case "Not in Study":
					EnableThisCheckbox(chkSS_NOTIN);
					break;
				case "Not Enrolled":
					EnableThisCheckbox(chkSS_NOTENR);
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

		Control ctl1 = FindControlRecursive(this.Page, "PlaceHolder_WhereClauseControls_Groups");
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
		SqlCommand sqlCmd_GetTimePoints = new System.Data.SqlClient.SqlCommand("select timepoint_text from tblTimePoint where studyID = " + _content_studyID.ToString(), oConn);
		DataTable dt_GetTimePoints = new DataTable();
		SqlDataAdapter sqlAdapter_GetTimePoints = new SqlDataAdapter(sqlCmd_GetTimePoints);
		sqlAdapter_GetTimePoints.Fill(dt_GetTimePoints);
		int num_timepoints = dt_GetTimePoints.Rows.Count;

		Control ctl2 = FindControlRecursive(this.Page, "PlaceHolder_WhereClauseControls_Timepoints");
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



	}



	// Builds the dynamic WHERE clause to filter the results
	protected void CreateWhereClause()
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> CreateWhereClause <br/>";


		string str_sex = "";
		string str_subjstatus = "";


		Control ctl1 = FindControlRecursive(this.Page, "PlaceHolder_WhereClauseControls");
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
					case "M":
						str_sex += chk.Checked ? "M" : "";
						break;
					case "F":
						str_sex += chk.Checked ? "F" : "";
						break;

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
					case "NotInStudy":
						str_subjstatus += chk.Checked ? " ''Not In Study'', " : "";
						break;
					case "NotPartic":
						str_subjstatus += chk.Checked ? " ''Not Participating'', " : "";
						break;
					case "NotEnroll":
						str_subjstatus += chk.Checked ? " ''Not Enrolled'', " : "";
						break;
				}
			}

		}

		string str_groups = "";
		foreach (Control c in PlaceHolder_WhereClauseControls_Groups.Controls)
		{
			if (c is CheckBox)
			{
				CheckBox chkgrp = (CheckBox)c;
				string grpname = chkgrp.Text;
				str_groups += chkgrp.Checked ? " ''" + grpname + "'', " : "";

			}
		}

		string str_timepoints = "";
		foreach (Control c in PlaceHolder_WhereClauseControls_Timepoints.Controls)
		{
			if (c is CheckBox)
			{
				CheckBox chktp = (CheckBox)c;
				string timepointname = chktp.Text;
				str_timepoints += chktp.Checked ? " ''" + timepointname + "'', " : "";

			}

		}


		if (str_sex == "M") str_sex = "' and Sex = ''M'' ";
		else if (str_sex == "F") str_sex = "' and Sex = ''F'' ";
		else str_sex = "";

		where_cols = " ' " + str_sex + "  and subjstatus in (" + str_subjstatus + " ''.'') and groupname in (" + str_groups + " ''.'')  '";
		where_rows = "' and timepoint_text in (" + str_timepoints + " ''.'') '";

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========> where_cols:  " + where_cols + " <br/>";
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========> where_rows:  " + where_rows + " <br/>";


	}



	#region  Show/hide Buttons
	protected void setdata_AM(object sender, EventArgs e)
	{
		// studyID = Convert.ToInt16(DDL_SelectStudyID.SelectedValue);
		// datasource = "exec spSEC_PIVOT__RowEQ_AMstacked_ColEQ_Subject " + studyID.ToString() + ", 'link_cell'";
		mydatasource = "AM";

		LabelAM.Visible = true;
		LabelM.Visible = false;
		LabelA.Visible = false;
		LabelC.Visible = false;
		LabelS.Visible = false;
		//tblmyinfo.Rows[0].Cells[0].InnerHtml += "sender  " + sender.ToString() + "<br/>";
		//tblmyinfo.Rows[0].Cells[0].InnerHtml += "e       " + e.ToString() + "<br/>";

		Populate_MyGridView("AMCD");
	}

	protected void setdata_M(object sender, EventArgs e)
	{
		mydatasource = "M";

		Populate_MyGridView("MD");

		LabelAM.Visible = false;
		LabelM.Visible = true;
		LabelA.Visible = false;
		LabelC.Visible = false;
		LabelS.Visible = false;
	}


	protected void setdata_A(object sender, EventArgs e)
	{
		mydatasource = "A";

		LabelAM.Visible = false;
		LabelM.Visible = false;
		LabelA.Visible = true;
		LabelC.Visible = false;
		LabelS.Visible = false;

		Populate_MyGridView("A");
	}

	protected void setdata_C(object sender, EventArgs e)
	{
		mydatasource = "C";

		LabelAM.Visible = false;
		LabelM.Visible = false;
		LabelA.Visible = false;
		LabelC.Visible = true;
		LabelS.Visible = false;

		Populate_MyGridView("C");
	}


	protected void setdata_S(object sender, EventArgs e)
	{
		mydatasource = "M";

		Populate_SubjectDetails_Gridview();

		LabelAM.Visible = false;
		LabelM.Visible = false;
		LabelA.Visible = false;
		LabelC.Visible = false;
		LabelS.Visible = true;

	}


	#endregion




	//Populate the Subjects Gridview
	protected void Populate_SubjectDetails_Gridview()
	{

		Panel_SubjectDetails.Controls.Clear();
		PlaceHolder1.Visible = false;
		Panel_SubjectDetails.Visible = true;

		try
		{


			SqlCommand sqlCmd_GetSubj = new System.Data.SqlClient.SqlCommand("exec spSEC_PIVOT__RowEQ_Subject__Dynamic_Where", oConn);
			DataTable dt_GetSubj = new DataTable();

			SqlDataReader SqlReader_GetSubj = sqlCmd_GetSubj.ExecuteReader();
			dt_GetSubj.Load(SqlReader_GetSubj);

			//SqlDataAdapter sqlAdapter_GetSubj = new SqlDataAdapter(sqlCmd_GetSubj);
			//sqlAdapter_GetSubj.Fill(dt_GetSubj);
			int num_subjects = dt_GetSubj.Rows.Count;


			//build the Gridview & columns
			GridView SubjectDetails_gridview = new GridView();
			SubjectDetails_gridview.ID = "SubjectDetails_gridview";
			SubjectDetails_gridview.AutoGenerateColumns = true;
			SubjectDetails_gridview.CssClass = "tblinputsmall_blue";
			//SubjectDetails_gridview.RowDataBound += new GridViewRowEventHandler(SubjStatus_Totals_gridview_RowDataBound);


			//Bind the data
			SubjectDetails_gridview.DataSource = dt_GetSubj;
			SubjectDetails_gridview.DataBind();
			Panel_SubjectDetails.Controls.Add(SubjectDetails_gridview);

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

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Populate_MyGridView <br/>";

		//studyID = Convert.ToInt16(DDL_SelectStudyID.SelectedValue);
		//studyID = Convert.ToInt16(this.Master.Master_studyID);

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> PRE  CreateWhereClause _content_studyID=" + _content_studyID.ToString() + "<br/>";
		CreateWhereClause();
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
		//hide the subject details gridview
		Panel_SubjectDetails.Visible = false;
		PlaceHolder1.Visible = true;

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Populate_MyGridView <br/>";

		//studyID = Convert.ToInt16(DDL_SelectStudyID.SelectedValue);
		//studyID = Convert.ToInt16(this.Master.Master_studyID);

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> PRE  CreateWhereClause _content_studyID=" + _content_studyID.ToString() + "<br/>";
		CreateWhereClause();
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> POST CreateWhereClause _content_studyID=" + _content_studyID.ToString() + "<br/>";

		datasource = "exec spSEC_PIVOT__RowEQ_AMCDstacked_ColEQ_Subject__Dynamic_WhereNEW " + _content_studyID.ToString() + ",'" + data_to_return + "', 'link_cell'," + where_cols + "," + where_rows;

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> datasource: " + datasource + " <br/>";


		try
		{

			SqlCommand SqlCmd = new System.Data.SqlClient.SqlCommand(datasource, oConn);
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
			GridView mygridview = new GridView();
			mygridview.ID = "SubjStatus_Totals_gridview";
			mygridview.AutoGenerateColumns = false;  //Check here - DO NOT AUTO GENERATE THE COLUMNS, Add based on visibility assigned above
			mygridview.CssClass = "tblinputsmall_blue";
			mygridview.RowDataBound += new GridViewRowEventHandler(mygridview_RowDataBound);

			TemplateField tf = null;
			//Loop through columns and add ItemTemplates
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
					int subjID = oDBLookup.GetSubjIDFromID(_colnames[c], _content_studyID);  //TO DO: get the subjID

					string myurl = @"~/Measures/MeasuresBySubject.aspx?subjectID=" + subjID.ToString();

					tf.HeaderTemplate = new DynamicGridViewURLTemplate(_colnames[c], myurl, DataControlRowType.Header);
					tf.ItemTemplate = new DynamicGridViewURLTemplate(_colnames[c], @"~", DataControlRowType.DataRow);
				}
				tf.Visible = _colvisible[c];
				//footer
				mygridview.Columns.Add(tf);
			}

//            tf.HeaderTemplate = new DynamicGridViewButtonTemplate("myButton", DataControlRowType.Header);
//            tf.ItemTemplate = new DynamicGridViewButtonTemplate("studyactionID", DataControlRowType.DataRow);
//            mygridview.Columns.Add(tf);


			//Bind the data
			mygridview.DataSource = dt;
			mygridview.DataBind();
			PlaceHolder1.Controls.Add(mygridview);

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

		if (e.Row.RowType == DataControlRowType.DataRow)  //if a data row


			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========> e.Row.Cells.Count = " + e.Row.Cells.Count.ToString() + "  <br/>";
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========>   _colnames.length = " + _colnames.Length.ToString() + "  <br/>";

		for (int c = 0; c < e.Row.Cells.Count; c++)
		{

			//Get the control  - NOT CLEAR WHY .Text DOES NOT GIVE THE LABEL TEXT??
			DataControlFieldCell celllabel = (DataControlFieldCell)e.Row.Controls[c];

			//if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========> c: " + c.ToString() + " <br/>";

			if (c <= _colnames.Length)  //This prevents an out of range error
			{
				string cellval_full = "";
				try
				{
					cellval_full = Convert.ToString(DataBinder.Eval(e.Row.DataItem, _colnames[c]));
				}
				catch
				{
					cellval_full = "";
				}
				string cellval = "";

				if (cellval_full.IndexOf("|") > 1) cellval = cellval_full.Substring(0, cellval_full.IndexOf("|"));

				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "<br/> cellval=" + cellval;

				switch (cellval)
				{
					case "ND4": celllabel.BackColor = System.Drawing.Color.Brown; break;
					case "TBD": celllabel.BackColor = System.Drawing.Color.CornflowerBlue; break;
					case "TBC": celllabel.BackColor = System.Drawing.Color.CornflowerBlue; break;
					case "TBC?": celllabel.BackColor = System.Drawing.Color.CornflowerBlue; break;
					case "D2": celllabel.BackColor = System.Drawing.Color.DarkGreen; break;
					case "D1": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;
					case "DC": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;
					case "NA": celllabel.BackColor = System.Drawing.Color.Gray; break;
					case "NA?": celllabel.BackColor = System.Drawing.Color.Gray; break;
					case "NA-ss": celllabel.BackColor = System.Drawing.Color.Gray; break;
					case "Sched": celllabel.BackColor = System.Drawing.Color.Lime; break;
					case "TE": celllabel.BackColor = System.Drawing.Color.Lime; break;
					case "TE?": celllabel.BackColor = System.Drawing.Color.Lime; break;
					case "CK_b": celllabel.BackColor = System.Drawing.Color.Orange; break;
					case "CK_d": celllabel.BackColor = System.Drawing.Color.Orange; break;
					case "CK_a": celllabel.BackColor = System.Drawing.Color.Red; break;
					case "ND": celllabel.BackColor = System.Drawing.Color.Red; break;
					case "ND1": celllabel.BackColor = System.Drawing.Color.Red; break;
					case "ND2": celllabel.BackColor = System.Drawing.Color.Red; break;
					case "ND?": celllabel.BackColor = System.Drawing.Color.SaddleBrown; break;
					case "ND_": celllabel.BackColor = System.Drawing.Color.SaddleBrown; break;

					case "COMP": celllabel.BackColor = System.Drawing.Color.DarkGreen; break;
					case "Comp": celllabel.BackColor = System.Drawing.Color.DarkGreen; break;


					//case "TBD":
					//    celllabel.CssClass += "styleTBD";
					//    celllabel.BackColor = System.Drawing.Color.LightSteelBlue;
					//    break;
					//case "Data":
					//    celllabel.BackColor = System.Drawing.Color.SteelBlue;
					//    celllabel.CssClass += "styleData";
					//    break;
					//case "COMP":
					//    celllabel.CssClass += "styleData";
					//    break;
					//case "NA":
					//    celllabel.CssClass += "styleNA";
					//    celllabel.BackColor = System.Drawing.Color.Gray;
					//    break;
					//case "NA-ss":
					//    celllabel.CssClass += "styleNA";
					//    celllabel.BackColor = System.Drawing.Color.Gray;
					//    break;

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





}




