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
using System.Text;
using System.Drawing;




public partial class Data_GetData: System.Web.UI.Page
{
	DataView dv;
	string CurrentStudyname;
	int numReq = 0;
	int numGrant = 0;
	int numrows = 0;
	int jobpk = -1;
	int studyID = -1;
	int groupcounter = 0; 
	int ShowTimePoints = 0;
	string prevcategory = "";
	Color color_current = Color.FromName("#FFFFFF");
	int showDataAccessControls = 0;
	string[] tp = new string[10];

	bool Show_fin =true;
	bool Show_act = true;
	bool Show_tbs = true;
	bool Show_ina = true;
	bool Show_oos = true;
	bool Show_dq = true;
	bool Show_npt = true;
	bool Show_nis = true;
	bool Show_nen = true;


	int SSC_fin = 0;
	int SSC_act = 0;
	int SSC_tbs = 0;
	int SSC_ina = 0;
	int SSC_oos = 0;
	int SSC_dq = 0;
	int SSC_npt = 0;
	int SSC_nis = 0;
	int SSC_nen = 0;


	int section1_startcol;
	int section1_numcol;
	int section2_startcol;
	int section2_numcol;
	int section3_startcol;
	int section3_numcol;
	int section4_startcol;
	int section4_numcol;
	int section5_startcol;
	int section5_numcol;
	int section6_startcol;
	int section6_numcol;
	int section7_startcol;
	int section7_numcol;
	int section8_startcol;
	int section8_numcol;
	int section9_startcol;
	int section9_numcol;



		private SqlConnection oConn = new SqlConnection();
		private SqlConnection oConnData = new SqlConnection();

		//protected System.Data.SqlClient.SqlConnection sqlConnection_Data;


		private ReadConfig oConfig = new ReadConfig();
		private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();
		
		private DBLookup oDBLookup;
		private int nProjectID;

		private void Page_Load(object sender, System.EventArgs e)
		{
			//columns
			section1_numcol = 2;  //intro PK's
			section2_numcol = 4; //ID, subj status, etc.
			section3_numcol = 4;//demog
			section4_numcol = 4; //consents
			section5_numcol = 6;  // session timing
			section6_numcol = 0;  // session / phone status
			section7_numcol = 2;  //data entry
			section8_numcol = 5;  //validations
			section9_numcol = 4;  // tracking totals


			section1_startcol = 0;
			section2_startcol = section1_startcol + section1_numcol;
			section3_startcol = section2_startcol + section2_numcol;
			section4_startcol = section3_startcol + section3_numcol;
			section5_startcol = section4_startcol + section4_numcol;
			section6_startcol = section5_startcol + section5_numcol;
			section7_startcol = section6_startcol + section6_numcol;
			section8_startcol = section7_startcol + section7_numcol;
			section9_startcol = section8_startcol + section8_numcol;


			if (!oLogin.CheckGroupPermissions("AUTOdata_access,Data Analysts Group,Autism Research Group, All Outside Labs Group".Split(',')))
			{

				tblMaster.Rows[1].Cells[0].Controls.Clear();
				tblMaster.Rows.RemoveAt(2);

				tblMaster.Rows[1].Cells[0].Attributes["style"] = "color: #B22222;";
				tblMaster.Rows[1].Cells[0].InnerHtml = "You are not authorized to view this page.";



			}
		   
			//Oct27
				//string groups = oLogin.Groups;
				////errorLink1.InnerHtml += groups;

				//int index = groups.IndexOf("AUTOdata_access");
				//if (index > -1)
				//{ 
				//    tblMaster.Rows[1].Cells[0].Attributes["style"] = "color: #000099;";
				
				//    //show data access controls to only those in the AUTOdata_access group
				//    showDataAccessControls = 1;


				//}
				//else
				//{
				//    tblMaster.Rows[1].Cells[0].Attributes["style"] = "color: #000099;";
				//    //DO NOT SHOW data access controls to those NOT in the AUTOdata_access group
				//    showDataAccessControls = 0;                
				//}

				//panelddlStudy.Visible = true;

			
			if (!IsPostBack)
			{

				oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
				oConn.Open();
				oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
				oConnData.Open();

				oDBLookup = new DBLookup(oConn);
				populate_ddlStudy();

				
			}

			studyID = int.Parse(ddlStudy.SelectedItem.Value);


		}


	#region [A] Populate DropDown controls

		#region ddl Study
		protected void populate_ddlStudy()
		{
			//update ddlMeasure with measures from selected study

			if (oConn.State == ConnectionState.Closed)
			{
				oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
				oConn.Open();
			}

			SqlCommand cmd = new SqlCommand();
			cmd.Connection = this.oConn;



			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "spGetStudies_with_Data";

			SqlDataReader dr = cmd.ExecuteReader();

			ddlStudy.DataSource = dr;
			ddlStudy.DataTextField = "studyname_and_PI";
			ddlStudy.DataValueField = "studyid";
			ddlStudy.DataBind();
			dr.Close();

			studyID = 0;

			//LoadGridView_StudyMeas("","");

		}


		protected void Event_ddlStudyChange(object sender, System.EventArgs e)
		{
			//ddlJob.SelectedItem.Text = "-- Select Job--";
			//jobpk = 0;
			

		}
		#endregion


	#endregion



		#region [B]  _________Subjects_________

		#region  Step 1)  Load the main GridView with a Study or Previous Job
		protected void LoadMeasures(object sender, System.EventArgs e)
		{
			studyID = int.Parse(ddlStudy.SelectedItem.Value);
			jobpk = 0;
			DisplayObjects();
			LoadGridView_Subjects("", "", studyID);

			//process column visibility
			UpdateVisibility(sender, e);


			//btnRetrieve.Visible = true;
			//btnUpdate.Visible = false;
		}


		#endregion



		#region Step 2) Display Objects
		protected void DisplayObjects()
		{
			//initialize the comments cells to be blank
			errorLink1.InnerHtml = "";
			errorLink2.InnerHtml = "";
			zipLink.InnerHtml = "";
			debugInfo1.InnerHtml = "";

			btnShowDebug.Visible = true;

			if (showDataAccessControls == 1)
			{
				
				////show the buttons
				//lblHeader0.Visible = true;
				//lblHeader1.Visible = true;
				//lblHeader2.Visible = true;
				//lblHeader3.Visible = true;
				//lblHeader4.Visible = true;

				////DataAccessControls 
				//// show the buttons initially
				//panel_DataControls_container.Visible = true;



				
				//// but hide the panels
				//panelOutput.Visible = false;
				//panelVRP.Visible = false;
				//panelEdit.Visible = false;
				//panelGrant.Visible = false;

				
			}

			//show the visibility buttons
			panelToggleVisibiltyButtons.Visible = true;

			//show the main StudyMeas grid
			panelSubjects.Visible = true;

			
		}

		#endregion



		#region  Step 3)  Load the main GridView 
		protected void LoadGridView_Subjects(string sortExp, string direction, int studyID)
		{

			//            errorLink1.InnerHtml += "A** jobpk = " + jobpk.ToString();

			int isready = 0;
			groupcounter = 0;


			if (jobpk > 0 | studyID > 0)
			{
				isready = 1;

				//
				// SubjStatus
				//
				LoadSubjStatus(studyID, jobpk);
				LoadTimePoint(studyID, jobpk);
				

				//
				// JOB INFO
				//

				//Clear the Utilities output labels
				lblOutputRequest.Text = "";
				lblOutputGrant.Text = "";
				errorLink1.InnerHtml = "";


				/* populate the labels in the Download Data panel */
				oConn.Close();

				if (oConn.State == ConnectionState.Closed)
				{
					oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
					oConn.Open();

				}
				
				


				//lblHeader1.Text = dtJobInfo.Rows[0]["studyLabel"].ToString();
				//lblHeader2.Text = dtJobInfo.Rows[0]["studyPI"].ToString();
				//lblHeader3.Text = dtJobInfo.Rows[0]["job_label"].ToString();
				//lblHeader4.Text = " " + dtJobInfo.Rows[0]["elaptime"];

				//txtPath.Text = dtJobInfo.Rows[0]["path"].ToString();
				//txtTitle.Text = dtJobInfo.Rows[0]["DataJobTitle"].ToString();
				//txtNotes.Text = dtJobInfo.Rows[0]["DataAccess_notes"].ToString();
				//errorLink1.InnerHtml += " @@@@@ testing ->" + dtJobInfo.Rows[0]["elaptime"].ToString() ;

			}


			if (isready == 1)
			{

				try
				{

					//
					// Get the StudyMeas INFO
					//


					oConn.Close();

					if (oConn.State == ConnectionState.Closed)
					{
						oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
						oConn.Open();
				}
				SqlCommand oCmdDG = new SqlCommand();
					oCmdDG.CommandTimeout = 90;

					oCmdDG.CommandType = CommandType.StoredProcedure;
					oCmdDG.CommandText = "spAUTO_DATA__subjects_by_studyID";


					oCmdDG.Parameters.Add(new SqlParameter("@studyID", SqlDbType.Int));
					oCmdDG.Parameters["@studyID"].Direction = ParameterDirection.Input;
					oCmdDG.Parameters.Add(new SqlParameter("@sortExp", SqlDbType.VarChar, 200));
					oCmdDG.Parameters["@sortExp"].Direction = ParameterDirection.Input;


					oCmdDG.Parameters["@studyID"].Value = studyID;
					oCmdDG.Parameters["@sortExp"].Value = sortExp;

					//errorLink1.InnerHtml += " @@@@@ THESORTEXPIS->" + sortExp;

					/*
					string[] datakeynames = { "DATAaccess_status", "studymeasID", "timepoint_text", "studymeasname", "n_vars", "n_analysis_vars", 
											"n_vars_with_missvals","n_vars_with_validation", 
											"nrecs", "pct_dblent", "nrecs_ScrError", "nrecs_vio", "nrecs_missing", "nrecs_null", "nrecs_invalid",
											   "n_DATA_but_INVALID",
											"n_data","n_nodata","n_tbd","n_na",
											"n_data1","n_nodata1","n_tbd1","n_na1",
											"n_data2","n_nodata2","n_tbd2","n_na2",
											"n_data3","n_nodata3","n_tbd3","n_na3",
											"n_data4","n_nodata4","n_tbd4","n_na4",
											"n_data5","n_nodata5","n_tbd5","n_na5",
											"n_data6","n_nodata6","n_tbd6","n_na6",
												"pct_collected","pct_with_data","pct_entered", "auto_rename_label", 
												"fullset", "injob", "studyname" , "GetDataPage_colorcode"};
					GridView_Studymeas.DataKeyNames = datakeynames;
				  */





					//SqlDataReader drDG = oCmdDG.ExecuteReader();
					//drDG.Close();


					oCmdDG.Connection = this.oConn;
					SqlDataAdapter daDG = new SqlDataAdapter(oCmdDG);

					DataSet dsDG = new DataSet();

					daDG.Fill(dsDG);

					DataTable dt = dsDG.Tables[0];
					DataView dv = new DataView(dt);
					//DataView dv = new DataView(dt);

					// is this needed?   dv.Sort = sortExp + direction;

					//errorLink1.InnerHtml += "$$1$$ numgrant=" + numGrant.ToString();

					GridView_Subjects.DataSource = dv;
					GridView_Subjects.DataBind();

					//errorLink1.InnerHtml += "$$2$$ numgrant=" + numGrant.ToString();





				}
				catch (SqlException oException)
				{
					foreach (SqlError oErr in oException.Errors)
					{

						errorLink1.InnerHtml += oErr.Message;
					}
				}

				//Show GRANT and REQUEST buttons
				//  - the specifics for each studymeas are handles in the RowDataBound and reference the "delegate", "PI", etc. metadata
				//if (showDataAccessControls == 1)
				//{
				//    btnShowGrantAccessPanel.Visible = true;
				//    btnShowRequestAccessPanel.Visible = true;
				//}
				//else
				//{
				//    btnShowGrantAccessPanel.Visible = false;
				//    btnShowRequestAccessPanel.Visible = false;
				//}




			}



		}
		#endregion

 
		#region  StudyMeas: RowDataBound
	/*
		protected void GridView_Studymeas_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			// For each DataRow in the GridView

			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				CheckBox chkRequestAccess = (CheckBox)e.Row.FindControl("chkRequestAccess");
				CheckBox chkGetData = (CheckBox)e.Row.FindControl("chkGetData");
				CheckBox chkFullset = (CheckBox)e.Row.FindControl("chkFullset");

				CheckBox chkGrantAccess = (CheckBox)e.Row.FindControl("chkGrantAccess");


				Label lblfullset = (Label)e.Row.FindControl("lblfullset");
				Label lblinjob = (Label)e.Row.FindControl("lblinjob");
				Label lblGetDataPage_colorcode = (Label)e.Row.FindControl("lblGetDataPage_colorcode");
				Label lblDATAaccess_status = (Label)e.Row.FindControl("lblDATAaccess_status");
				Label lbln_vars = (Label)e.Row.FindControl("lbln_vars");


				//dv.RowFilter = "EmployeeID = " +
				//  ((DataRowView)e.Row.DataItem)["EmployeeID"].ToString();

				/////////////////////////////////////////////////////////////////
				//Assign the row value from the GridView to local variables
				string access_type = lblDATAaccess_status.Text;
				string numvars = lbln_vars.Text;
				string fullset = lblfullset.Text;
				string injob = lblinjob.Text;
				color_current = Color.FromName(lblGetDataPage_colorcode.Text);



				//Default starting point - All Checkboxes OFF

				chkGrantAccess.Enabled = false;     // NOT allowed
				chkGrantAccess.Visible = false;
						
				chkRequestAccess.Enabled = false;   // request access is not needed
				chkRequestAccess.Visible = false;

				chkGetData.Enabled = false;          // allowed
				chkGetData.Visible = false;

				chkFullset.Enabled = false;          // allowed
				chkFullset.Visible = false;


				//SHOW DATA ACCESS CONTROLS BASED ON StudyMeas specific permissions
				if (showDataAccessControls == 1)
				{

					//Enable and Show controls for each studymeas based on permissions


					if (access_type == "YES_PI" | access_type == "YES_PI_coremeas" ) //| access_type == "YES_Delegated") //| access_type == "YES_Admin")
					{
						chkGrantAccess.Enabled = true;  // allowed
						chkGrantAccess.Visible = true;
						numGrant = numGrant + 1;

						chkRequestAccess.Enabled = false;       // request access is not needed
						chkRequestAccess.Visible = false;

						chkGetData.Enabled = true;      // allowed
						chkGetData.Visible = true;

						chkFullset.Enabled = true;      // allowed
						chkFullset.Visible = true;
					}



					else if (access_type == "YES_Delegated") //| access_type == "YES_Admin")
					{
						chkGrantAccess.Enabled = false;     // NOT allowed
						chkGrantAccess.Visible = false;
						
						chkRequestAccess.Enabled = false;   // request access is not needed
						chkRequestAccess.Visible = false;

						chkGetData.Enabled = true;          // allowed
						chkGetData.Visible = true;

						chkFullset.Enabled = true;          // allowed
						chkFullset.Visible = true;
					}


					else if (access_type == "YES_Admin")
					{
						chkGrantAccess.Enabled = false;     // NOT allowed
						chkGrantAccess.Visible = false;
						
						chkRequestAccess.Enabled = false;   // request access is not needed
						chkRequestAccess.Visible = false;

						chkGetData.Enabled = true;          // allowed
						chkGetData.Visible = true;

						chkFullset.Enabled = true;          // allowed
						chkFullset.Visible = true;
					}


					
					else if (access_type == "Not_in_DB" | access_type == "NO_Pending")
					{
						   //everything remains off while pending or if NA
						chkGrantAccess.Enabled = false;     
						chkGrantAccess.Visible = false;
						
						chkRequestAccess.Enabled = false;   
						chkRequestAccess.Visible = false;

						chkGetData.Enabled = false;         
						chkGetData.Visible = false;

						chkFullset.Enabled = false;         
						chkFullset.Visible = false;
					}

					else if (access_type == "NO_ACCESS" )
					{
						//everything remains off while pending or if NA
						chkGrantAccess.Enabled = false;
						chkGrantAccess.Visible = false;

						chkRequestAccess.Enabled = true;
						chkRequestAccess.Visible = true;

						chkGetData.Enabled = false;
						chkGetData.Visible = false;

						chkFullset.Enabled = false;
						chkFullset.Visible = false;
					}

				}

  


				if (chkRequestAccess.Enabled == true)
				{
					//errorLink1.InnerHtml += "numReq increment = " + numReq.ToString(); 
					numReq = numReq + 1;
				}



				numrows += 1;


				// Format the row as desired
				e.Row.BackColor = color_current;
				//errorLink1.InnerHtml += numrows.ToString() +" - "+ prevcategory + " - "+ category +  "  -  " + color_current.Name.ToString() + "<br/>";


				// check whether this studymeasID was in the job & whether it was "all?"  checked = true
				if (injob == "1") { chkGetData.Checked = true; }
				if (fullset == "1") { chkFullset.Checked = true; }


				#region Navigation Links
				////////////////////////////////////////////////////
				//Build the NavigateUrl links 
				string baseURL = "https://uwac.autism.washington.edu/research/Data/StudymeasDetails.aspx";

				/////////////////////////////////////////////////////////////////
				//Assign the row value from the GridView to local variables for the links

				Label LBLstudymeasID = (Label)e.Row.FindControl("LBLstudymeasID");
				Label LBLmeasure = (Label)e.Row.FindControl("LBLmeasure");


				Label LBLn_DATA_but_INVALID = (Label)e.Row.FindControl("LBLn_DATA_but_INVALID");

				Label LBLn_vars_with_missvals = (Label)e.Row.FindControl("LBLn_vars_with_missvals");
				Label LBLn_vars_with_validation = (Label)e.Row.FindControl("LBLn_vars_with_validation");
				Label LBLauto_rename_label = (Label)e.Row.FindControl("LBLauto_rename_label");
				Label LBLnrecs = (Label)e.Row.FindControl("LBLnrecs");
				Label LBLpct_entered = (Label)e.Row.FindControl("LBLpct_entered");
				Label LBLpct_dblent = (Label)e.Row.FindControl("LBLpct_dblent");
				Label LBLnrecs_vio = (Label)e.Row.FindControl("LBLnrecs_vio");
				Label LBLnrecs_ScrError = (Label)e.Row.FindControl("LBLnrecs_ScrError");
				Label LBLnrecs_missing = (Label)e.Row.FindControl("LBLnrecs_missing");
				Label LBLnrecs_null = (Label)e.Row.FindControl("LBLnrecs_null");
				Label LBLnrecs_invalid = (Label)e.Row.FindControl("LBLnrecs_invalid");
				Label LBLpct_collected = (Label)e.Row.FindControl("LBLpct_collected");
				Label LBLpct_with_data = (Label)e.Row.FindControl("LBLpct_with_data");
				Label LBLn_data = (Label)e.Row.FindControl("LBLn_data");
				Label LBLn_nodata = (Label)e.Row.FindControl("LBLn_nodata");
				Label LBLn_tbd = (Label)e.Row.FindControl("LBLn_tbd");
				Label LBLn_na = (Label)e.Row.FindControl("LBLn_na");
				Label LBLn_data1 = (Label)e.Row.FindControl("LBLn_data1");
				Label LBLn_nodata1 = (Label)e.Row.FindControl("LBLn_nodata1");
				Label LBLn_tbd1 = (Label)e.Row.FindControl("LBLn_tbd1");
				Label LBLn_na1 = (Label)e.Row.FindControl("LBLn_na1");
				Label LBLn_data2 = (Label)e.Row.FindControl("LBLn_data2");
				Label LBLn_nodata2 = (Label)e.Row.FindControl("LBLn_nodata2");
				Label LBLn_tbd2 = (Label)e.Row.FindControl("LBLn_tbd2");
				Label LBLn_na2 = (Label)e.Row.FindControl("LBLn_na2");
				Label LBLn_data3 = (Label)e.Row.FindControl("LBLn_data3");
				Label LBLn_nodata3 = (Label)e.Row.FindControl("LBLn_nodata3");
				Label LBLn_tbd3 = (Label)e.Row.FindControl("LBLn_tbd3");
				Label LBLn_na3 = (Label)e.Row.FindControl("LBLn_na3");
				Label LBLn_data4 = (Label)e.Row.FindControl("LBLn_data4");
				Label LBLn_nodata4 = (Label)e.Row.FindControl("LBLn_nodata4");
				Label LBLn_tbd4 = (Label)e.Row.FindControl("LBLn_tbd4");
				Label LBLn_na4 = (Label)e.Row.FindControl("LBLn_na4");
				Label LBLn_data5 = (Label)e.Row.FindControl("LBLn_data5");
				Label LBLn_nodata5 = (Label)e.Row.FindControl("LBLn_nodata5");
				Label LBLn_tbd5 = (Label)e.Row.FindControl("LBLn_tbd5");
				Label LBLn_na5 = (Label)e.Row.FindControl("LBLn_na5");
				Label LBLn_data6 = (Label)e.Row.FindControl("LBLn_data6");
				Label LBLn_nodata6 = (Label)e.Row.FindControl("LBLn_nodata6");
				Label LBLn_tbd6 = (Label)e.Row.FindControl("LBLn_tbd6");
				Label LBLn_na6 = (Label)e.Row.FindControl("LBLn_na6");
				Label LBLn_data7 = (Label)e.Row.FindControl("LBLn_data7");
				Label LBLn_nodata7 = (Label)e.Row.FindControl("LBLn_nodata7");
				Label LBLn_tbd7 = (Label)e.Row.FindControl("LBLn_tbd7");
				Label LBLn_na7 = (Label)e.Row.FindControl("LBLn_na7");
				Label lblmeasureID = (Label)e.Row.FindControl("lblmeasureID");


				string smID = LBLstudymeasID.Text;
				string mID = lblmeasureID.Text;

				string n_DATA_but_INVALID = LBLn_DATA_but_INVALID.Text;

				string n_vars_with_missvals = LBLn_vars_with_missvals.Text;
				string n_vars_with_validation = LBLn_vars_with_validation.Text;
				string auto_rename_label = LBLauto_rename_label.Text;
				string nrecs = LBLnrecs.Text;
				string pct_entered = LBLpct_entered.Text;
				string pct_dblent = LBLpct_dblent.Text;
				string nrecs_vio = LBLnrecs_vio.Text;
				string nrecs_ScrError = LBLnrecs_ScrError.Text;
				string nrecs_missing = LBLnrecs_missing.Text;
				string nrecs_null = LBLnrecs_null.Text;
				string nrecs_invalid = LBLnrecs_invalid.Text;
				string pct_collected = LBLpct_collected.Text;
				string pct_with_data = LBLpct_with_data.Text;
				string n_data = LBLn_data.Text;
				string n_nodata = LBLn_nodata.Text;
				string n_tbd = LBLn_tbd.Text;
				string n_na = LBLn_na.Text;
				string n_data1 = LBLn_data1.Text;
				string n_nodata1 = LBLn_nodata1.Text;
				string n_tbd1 = LBLn_tbd1.Text;
				string n_na1 = LBLn_na1.Text;
				string n_data2 = LBLn_data2.Text;
				string n_nodata2 = LBLn_nodata2.Text;
				string n_tbd2 = LBLn_tbd2.Text;
				string n_na2 = LBLn_na2.Text;
				string n_data3 = LBLn_data3.Text;
				string n_nodata3 = LBLn_nodata3.Text;
				string n_tbd3 = LBLn_tbd3.Text;
				string n_na3 = LBLn_na3.Text;
				string n_data4 = LBLn_data4.Text;
				string n_nodata4 = LBLn_nodata4.Text;
				string n_tbd4 = LBLn_tbd4.Text;
				string n_na4 = LBLn_na4.Text;
				string n_data5 = LBLn_data5.Text;
				string n_nodata5 = LBLn_nodata5.Text;
				string n_tbd5 = LBLn_tbd5.Text;
				string n_na5 = LBLn_na5.Text;
				string n_data6 = LBLn_data6.Text;
				string n_nodata6 = LBLn_nodata6.Text;
				string n_tbd6 = LBLn_tbd6.Text;
				string n_na6 = LBLn_na6.Text;
				string n_data7 = LBLn_data7.Text;
				string n_nodata7 = LBLn_nodata7.Text;
				string n_tbd7 = LBLn_tbd7.Text;
				string n_na7 = LBLn_na7.Text;


				((HyperLink)e.Row.FindControl("LNKmeasure")).NavigateUrl = "https://uwac.autism.washington.edu/research/Documents/MeasureDocumentation.aspx?measureID=" + mID;

				//((HyperLink)e.Row.FindControl("lnk01")).NavigateUrl = baseURL + "?code=1&smID=" + smID;
				//((HyperLink)e.Row.FindControl("lnk02")).NavigateUrl = baseURL + "?code=2&smID=" + smID;
				//((HyperLink)e.Row.FindControl("lnk03")).NavigateUrl = baseURL + "?code=3&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk04")).NavigateUrl = baseURL + "?code=4&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk05")).NavigateUrl = baseURL + "?code=5&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk06")).NavigateUrl = baseURL + "?code=6&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk07")).NavigateUrl = baseURL + "?code=7&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk08")).NavigateUrl = baseURL + "?code=8&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk09")).NavigateUrl = baseURL + "?code=9&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk10")).NavigateUrl = baseURL + "?code=10&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk11")).NavigateUrl = baseURL + "?code=11&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk12")).NavigateUrl = baseURL + "?code=12&smID=" + smID;

				
				((HyperLink)e.Row.FindControl("lnk13")).NavigateUrl = baseURL + "?code=13&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk13a")).NavigateUrl = baseURL + "?code=130&smID=" + smID;
				
				
				((HyperLink)e.Row.FindControl("lnk14")).NavigateUrl = baseURL + "?code=14&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk15")).NavigateUrl = baseURL + "?code=15&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk16")).NavigateUrl = baseURL + "?code=16&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk17")).NavigateUrl = baseURL + "?code=17&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk18")).NavigateUrl = baseURL + "?code=18&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk19")).NavigateUrl = baseURL + "?code=19&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk20")).NavigateUrl = baseURL + "?code=20&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk21")).NavigateUrl = baseURL + "?code=21&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk22")).NavigateUrl = baseURL + "?code=22&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk23")).NavigateUrl = baseURL + "?code=23&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk24")).NavigateUrl = baseURL + "?code=24&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk25")).NavigateUrl = baseURL + "?code=25&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk26")).NavigateUrl = baseURL + "?code=26&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk27")).NavigateUrl = baseURL + "?code=27&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk28")).NavigateUrl = baseURL + "?code=28&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk29")).NavigateUrl = baseURL + "?code=29&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk30")).NavigateUrl = baseURL + "?code=30&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk31")).NavigateUrl = baseURL + "?code=31&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk32")).NavigateUrl = baseURL + "?code=32&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk33")).NavigateUrl = baseURL + "?code=33&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk34")).NavigateUrl = baseURL + "?code=34&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk35")).NavigateUrl = baseURL + "?code=35&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk36")).NavigateUrl = baseURL + "?code=36&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk37")).NavigateUrl = baseURL + "?code=37&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk38")).NavigateUrl = baseURL + "?code=38&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk39")).NavigateUrl = baseURL + "?code=39&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk40")).NavigateUrl = baseURL + "?code=40&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk41")).NavigateUrl = baseURL + "?code=41&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk42")).NavigateUrl = baseURL + "?code=42&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk43")).NavigateUrl = baseURL + "?code=43&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk44")).NavigateUrl = baseURL + "?code=44&smID=" + smID;
				((HyperLink)e.Row.FindControl("lnk45")).NavigateUrl = baseURL + "?code=45&smID=" + smID;


				((HyperLink)e.Row.FindControl("lnk04")).ForeColor = System.Drawing.Color.Indigo;
				((HyperLink)e.Row.FindControl("lnk05")).ForeColor = System.Drawing.Color.Indigo;
				((HyperLink)e.Row.FindControl("lnk06")).ForeColor = System.Drawing.Color.Indigo;

				((HyperLink)e.Row.FindControl("lnk07")).ForeColor = System.Drawing.Color.Maroon ;
				((HyperLink)e.Row.FindControl("lnk08")).ForeColor = System.Drawing.Color.Maroon;
				((HyperLink)e.Row.FindControl("lnk09")).ForeColor = System.Drawing.Color.Maroon;
				((HyperLink)e.Row.FindControl("lnk10")).ForeColor = System.Drawing.Color.Maroon;
				((HyperLink)e.Row.FindControl("lnk11")).ForeColor = System.Drawing.Color.Maroon;
				#endregion

			}


		}

*/



		#endregion

  

	
		#region StudyMeas Utilities:  Select All Columns 
	 
	  
		//protected void chkGetAll_CheckedChanged(object sender, EventArgs e)
		//{
		//    CheckBox chk;
		//    foreach (GridViewRow rowItem in GridView_Studymeas.Rows)
		//    {
		//        chk = (CheckBox)(rowItem.Cells[0].FindControl("chkGetData"));

		//        if (chk.Enabled)
		//        { chk.Checked = ((CheckBox)sender).Checked; }
		//    }
		//}


		//protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
		//{
		//    CheckBox chk;
		//    foreach (GridViewRow rowItem in GridView_Studymeas.Rows)
		//    {
		//        chk = (CheckBox)(rowItem.Cells[0].FindControl("chkGrantAccess"));
		//        if (chk.Enabled)
		//        { chk.Checked = ((CheckBox)sender).Checked; }
		//    }
		//}

		//protected void chkRequestAll_CheckedChanged(object sender, EventArgs e)
		//{
		//    CheckBox chk;
		//    foreach (GridViewRow rowItem in GridView_Studymeas.Rows)
		//    {
		//        chk = (CheckBox)(rowItem.Cells[0].FindControl("chkRequestAccess"));
		//        if (chk.Enabled)
		//        { chk.Checked = ((CheckBox)sender).Checked; }
		//    }
		//}

		//protected void chkAllVars_CheckedChanged(object sender, EventArgs e)
		//{
		//    CheckBox chk;
		//    foreach (GridViewRow rowItem in GridView_Studymeas.Rows)
		//    {
		//        chk = (CheckBox)(rowItem.Cells[0].FindControl("chkFullSet"));
		//        if (chk.Enabled)
		//        { chk.Checked = ((CheckBox)sender).Checked; }
		//    }
		//}
		
	   
		#endregion
	

   
		#region  StudyMeas  Utilities:  Sorting


		protected void GridView_Subjects_Sorting(object sender, GridViewSortEventArgs e)
		{
			string sortExp = e.SortExpression;

			if (GridViewSortDirection == SortDirection.Ascending)
			{
				GridViewSortDirection = SortDirection.Descending;
				LoadGridView_Subjects(sortExp, " DESC", studyID);
			}
			else
			{
				GridViewSortDirection = SortDirection.Ascending;
				LoadGridView_Subjects(sortExp, " ASC", studyID);
			}
		}


		public SortDirection GridViewSortDirection
		{
			get
			{
				if (ViewState["sortDirection"] == null)
					ViewState["sortDirection"] = SortDirection.Ascending;
				return (SortDirection)ViewState["sortDirection"];
			}
			set { ViewState["sortDirection"] = value; }
		}
	
		#endregion

   

  

	#region  StudyMeas Utilities:  Show/Hide Columns 
   

	 #region Update specific sections
	 protected void UpdateVisibility(object sender, EventArgs e)
	{
		 // Executes when the "Update Visibility" button is clicked
		 // and after the data is bound to the GridView_StudyMeas

		RefreshSubjStatus_Checks();

		UpdateSubjStatus(sender, e);
		UpdateTimePoints(sender, e);

		ShowDemog(sender, e);
		ShowConsents(sender, e);
		ShowActionTime(sender, e);
		
		ShowDataEntryInfo(sender, e);
		ShowValidationInfo(sender, e);
		ShowLinks(sender, e);
		HideFinalCols(sender, e);


		 //hide first 2 columns
		SetColumnsVisibility(0, 2, 0); 
	}


	 protected void RefreshSubjStatus_Checks()
	 {
		 CheckBox chkSSC_fin = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_fin") as CheckBox;
		 CheckBox chkSSC_act = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_act") as CheckBox;
		 CheckBox chkSSC_tbs = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_tbs") as CheckBox;
		 CheckBox chkSSC_ina = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_ina") as CheckBox;
		 CheckBox chkSSC_oos = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_oos") as CheckBox;
		 CheckBox chkSSC_dq = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_dq") as CheckBox;
		 CheckBox chkSSC_npt = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_npt") as CheckBox;
		 CheckBox chkSSC_nis = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_nis") as CheckBox;
		 CheckBox chkSSC_nen = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_nen") as CheckBox;



		 Show_fin = chkSSC_fin.Checked; 
		Show_act   = chkSSC_act.Checked; 
		Show_tbs   = chkSSC_tbs.Checked; 
		Show_ina   = chkSSC_ina.Checked; 
		Show_oos   = chkSSC_oos.Checked; 
		Show_dq    = chkSSC_dq.Checked; 
		Show_npt   = chkSSC_npt.Checked;
		Show_nis   = chkSSC_nis.Checked; 
		Show_nen   = chkSSC_nen.Checked; 


	 }


	 protected void UpdateTimePoints (object sender, EventArgs e)
	{

		//Keep the totals visible but hide the timepoints initially - thus start loop at 2
		for (int i = 2; i <= 8; i++)
		{
			SetTimePointsVisibility(i, 0);
		}

		//check to see if there is more than one timepoint
		int n_timepoints = GridView_TimePoint.Rows.Count;

		panelTimePoint.Visible = false;

		if (n_timepoints > 2)  // 1 TP plus the ALL TPs
		{
			panelTimePoint.Visible = true;
			//build an array of the rows to show
			foreach (GridViewRow grprow in GridView_TimePoint.Rows)
			{
				int grrowindex = grprow.RowIndex;
				CheckBox cb = (CheckBox)grprow.FindControl("chkShowTimePoint");
				if (cb.Checked)
				{
					SetTimePointsVisibility(grrowindex + 1, 1);
				}
				else
				{
					SetTimePointsVisibility(grrowindex + 1, 0);
				}
			}
		}
	}



	 protected void UpdateSubjStatus(object sender, EventArgs e)
	{
		int numrows = GridView_SubjStatus.Rows.Count;

		string[] tp = new string[numrows];

		//build an array of the rows to show based on GROUP (the rows)
		foreach (GridViewRow tprow in GridView_SubjStatus.Rows)
		{

			int tprowindex = tprow.RowIndex;

			CheckBox cb = (CheckBox)tprow.FindControl("chkShowGroup");
			Label lblgroupname = (Label)tprow.FindControl("lblGroup");
			//CheckBox cbNoRename = (CheckBox)FindControl("chkNoRename");

			if (cb.Checked)
			{
				string temp = lblgroupname.Text;
				tp[tprowindex] = temp.Substring(3, temp.Length-3);  //remove the numbering from the lable text

				//errorLink1.InnerHtml += temp + "<>" + temp.Substring(3, temp.Length-3);
			}


		}



		 foreach (GridViewRow smrow in GridView_Subjects.Rows)
		{
			Label lblgroupname = (Label)smrow.FindControl("lblgroupname");
			Label lblsubjstatusshort = (Label)smrow.FindControl("lblsubjstatusshort");

			bool showrow = false;
			for (int i = 0; i < tp.Length; i++)
			{
				   // group is selected
					if (lblgroupname.Text.ToString() == tp[i])
				
					{ 
						//check that Subject status is selected

						if (lblsubjstatusshort.Text=="FINISH" && Show_fin) { showrow = true; }
						else if (lblsubjstatusshort.Text=="ACT" && Show_act) { showrow = true; }
						else if (lblsubjstatusshort.Text == "TBS" && Show_tbs) { showrow = true; }
						else if (lblsubjstatusshort.Text == "INACT" && Show_ina) { showrow = true; }
						else if (lblsubjstatusshort.Text=="OUT" && Show_oos) { showrow = true; }
						else if (lblsubjstatusshort.Text=="DQ" && Show_dq) { showrow = true; }
						else if (lblsubjstatusshort.Text=="NPART" && Show_npt) { showrow = true; }
						else if (lblsubjstatusshort.Text=="NinS" && Show_nis) { showrow = true; }
						else if (lblsubjstatusshort.Text=="NE" && Show_nen) { showrow = true; }
					
					}
				
			}


			smrow.Visible = showrow;
		}






		//turn on the check for visibility based on timepoint
		ShowTimePoints = 1;




	}
	 #endregion


	#region Hide specific groups of columns

	protected void ShowDemog(object sender, System.EventArgs e)
	{
		if (chkShowDemog.Checked)
		{ SetColumnsVisibility(section3_startcol, section3_numcol, 1); }
		else
		{ SetColumnsVisibility(section3_startcol, section3_numcol, 0); }
	}

	protected void ShowConsents(object sender, System.EventArgs e)
	{
		if (chkShowConsents.Checked)
		{ SetColumnsVisibility(section4_startcol, section4_numcol, 1); }
		else
		{ SetColumnsVisibility(section4_startcol, section4_numcol, 0); }
	}


	protected void ShowActionTime(object sender, System.EventArgs e)
	{
		if (chkShowActionTime.Checked)
		{ SetColumnsVisibility(section5_startcol, section5_numcol, 1); }
		else
		{ SetColumnsVisibility(section5_startcol, section5_numcol, 0); }
	}


	protected void ShowDataEntryInfo(object sender, System.EventArgs e)
	{
		if (chkShowDataEntryInfo.Checked)
		{
			SetColumnsVisibility(section7_startcol, section7_numcol, 1);
		}
		else
		{
			SetColumnsVisibility(section7_startcol, section7_numcol, 0);
		}
	}

	protected void ShowValidationInfo(object sender, System.EventArgs e)
	{
		if (chkShowValidationInfo.Checked)
		{
			SetColumnsVisibility(section8_startcol, section8_numcol, 1);
		}
		else
		{
			SetColumnsVisibility(section8_startcol, section8_numcol, 0);
		}
	}

	protected void ShowLinks(object sender, System.EventArgs e)
	{
		//if (chkShowLinks.Checked)
		//{
		//    SetColumnsVisibility(57, 1, 1);
		//}
		//else
		//{
		//    SetColumnsVisibility(57, 1, 0);
		//}
	}



	protected void HideFinalCols(object sender, System.EventArgs e)
	{  
		//SetColumnsVisibility(58, 5, 0);
	}
	 
	#endregion


	#region Show/Hide the columns for specific Time Points
	  
	protected void InitColumnVisibility(object sender, System.EventArgs e)
	{
		//resets all columns so that with a new study everything starts out the same.
		ShowAllColumns(sender, e);


		//Keep the totals visible but hide the groups - thus start loop at 2
		for (int i = 2; i <= 8; i++)
		{
			SetTimePointsVisibility( i, 0);
		}


		//initially hide these sections
		chkShowDemog.Checked = false;
		chkShowDataEntryInfo.Checked = false;
		chkShowValidationInfo.Checked = false;
		chkShowLinks.Checked = false;

		ShowDemog(sender, e);
		ShowDataEntryInfo(sender, e);
		ShowValidationInfo(sender, e);
		ShowLinks(sender, e);

		//SetTimePointsVisibility(sender, e);

		//Hide the remaining 4 columns that should never be shown
		//HideFinalCols(sender, e);

		//hide the first 2 columns - studyID, groupID
		SetColumnsVisibility(0, 2, 0);


	}


	protected void SetTimePointsVisibility(int groupcounter, int vis)
	{
		int coltohide = section9_startcol + ((groupcounter - 1) * 4);
		SetColumnsVisibility(coltohide, section9_numcol, vis);
	}

/*
   protected void HideTimePoints(int groupcounter)
	{
		int coltohide = 24 + ((groupcounter - 1) * 4) ;
		HideColumns(coltohide, 4);

	   // use for some overall percentages
	   // if (groupcounter == 1)
	   // { HideColumns(16, 3); }
	}

	
	protected void ShowGroup(object sender, System.EventArgs e)
	{
		CheckBox chk1 = (CheckBox)sender;
		GridViewRow GridRow1 = (GridViewRow)chk1.NamingContainer;

		HideGroups(GridRow1.RowIndex + 1);

	}
	*/

	#endregion


	#region  Generic / Not column-specific methods
	
	protected void ShowAllColumns(object sender, System.EventArgs e)
	{
		int numcols = GridView_Subjects.Columns.Count;
		//errorLink1.InnerHtml += numcols.ToString();


		for (int i = 1; i <= numcols; i++)
		{
			GridView_Subjects.Columns[i - 1].Visible = true;
		}

	}


	protected void DataBound_GridView_SubjStatus(object sender, EventArgs e)
 
		{


				CheckBox chkSSC_fin = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_fin") as CheckBox;
				CheckBox chkSSC_act= GridView_SubjStatus.HeaderRow.FindControl("chkSSC_act") as CheckBox;
				CheckBox chkSSC_tbs= GridView_SubjStatus.HeaderRow.FindControl("chkSSC_tbs") as CheckBox;
				CheckBox chkSSC_ina= GridView_SubjStatus.HeaderRow.FindControl("chkSSC_ina") as CheckBox;
				CheckBox chkSSC_oos= GridView_SubjStatus.HeaderRow.FindControl("chkSSC_oos") as CheckBox;
				CheckBox chkSSC_dq = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_dq") as CheckBox;
				CheckBox chkSSC_npt= GridView_SubjStatus.HeaderRow.FindControl("chkSSC_npt") as CheckBox;
				CheckBox chkSSC_nis= GridView_SubjStatus.HeaderRow.FindControl("chkSSC_nis") as CheckBox;
				CheckBox chkSSC_nen = GridView_SubjStatus.HeaderRow.FindControl("chkSSC_nen") as CheckBox;

			// hide the columns for SubjStatus values that have 0 subjects.
			 if (SSC_fin == 0) { SetSubjStatusVisibility(4, 1, 0); chkSSC_fin.Checked = false; }
			 if (SSC_act == 0) { SetSubjStatusVisibility(5, 1, 0);  chkSSC_act.Checked = false; }
			 if (SSC_tbs == 0) {SetSubjStatusVisibility( 6, 1, 0);  chkSSC_tbs.Checked = false; }
			 if (SSC_ina == 0) {SetSubjStatusVisibility( 7, 1, 0);  chkSSC_ina.Checked = false; }
			 if (SSC_oos == 0) {SetSubjStatusVisibility( 8, 1, 0);  chkSSC_oos.Checked = false; }
			 if (SSC_dq  == 0) {SetSubjStatusVisibility( 9, 1, 0);  chkSSC_dq.Checked = false;  }
			 if (SSC_npt == 0) {SetSubjStatusVisibility(10, 1, 0);  chkSSC_npt.Checked = false; }
			 if (SSC_nis == 0) {SetSubjStatusVisibility(11, 1, 0);  chkSSC_nis.Checked = false; }
			 if (SSC_nen == 0) { SetSubjStatusVisibility(12, 1, 0); chkSSC_nen.Checked = false; }
  
		}



	 protected void SetSubjStatusVisibility(int startcol, int numcol, int vis)
		{
			for (int i = startcol; i <= startcol + numcol-1; i++)
			{

				if (vis == 1)
				{
					GridView_SubjStatus.Columns[i].Visible = true;
				}
				else
				{
					GridView_SubjStatus.Columns[i].Visible = false;
				}
			}
		}



	protected void SetColumnsVisibility(int startcol, int numcol, int vis)
		{
			for (int i = startcol; i <= startcol + numcol-1; i++)
			{

				if (vis == 1)
				{
					GridView_Subjects.Columns[i].Visible = true;
				}
				else
				{
					GridView_Subjects.Columns[i].Visible = false;
				}
			}
		}

		protected void HideColumns(int startcol, int numcol)
		{
			for (int i = startcol; i <= startcol + numcol - 1; i++)
			{

				if (GridView_Subjects.Columns[i].Visible == false)
				{
					GridView_Subjects.Columns[i].Visible = true;
				}
				else
				{
					GridView_Subjects.Columns[i].Visible = false;
				}
			}
		}
	  
	#endregion


	#endregion

	

		#endregion


		#region [C]  _______TimePoint_______  (which is based on what Study / Job was selected 

		#region  TimePoint Load
		protected void LoadTimePoint(int studyID, int jobpk)
		{

			//errorLink1.InnerHtml += "got here";

			try
			{
				//
				// TimePoint
				//

				oConn.Close();

				if (oConn.State == ConnectionState.Closed)
				{
					oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
					oConn.Open();
				}
				SqlCommand oCmdDG = new SqlCommand();
				oCmdDG.CommandTimeout = 90;

				oCmdDG.CommandType = CommandType.StoredProcedure;
				oCmdDG.CommandText = "spAUTOdata__TimePoint_withTotal";


				oCmdDG.Parameters.Add(new SqlParameter("@studyID", SqlDbType.Int));
				oCmdDG.Parameters["@studyID"].Direction = ParameterDirection.Input;
				oCmdDG.Parameters.Add(new SqlParameter("@jobpk", SqlDbType.Int));
				oCmdDG.Parameters["@jobpk"].Direction = ParameterDirection.Input;


				oCmdDG.Parameters["@studyID"].Value = studyID;
				oCmdDG.Parameters["@jobpk"].Value = jobpk;

				//errorLink1.InnerHtml += " @@@@@ THESORTEXPIS->" + sortExp;

				oCmdDG.Connection = this.oConn;
				SqlDataAdapter daDG = new SqlDataAdapter(oCmdDG);

				DataSet dsDG = new DataSet();

				daDG.Fill(dsDG);

				DataTable dt = dsDG.Tables[0];
				DataView dv = new DataView(dt);
				//DataView dv = new DataView(dt);

				// is this needed?   dv.Sort = sortExp + direction;

				//errorLink1.InnerHtml += "$$1$$ numgrant=" + numGrant.ToString();

				GridView_TimePoint.DataSource = dv;
				GridView_TimePoint.DataBind();

				panelTimePoint.Visible = true;

				//errorLink1.InnerHtml += "$$2$$ numgrant=" + numGrant.ToString();

			}
			catch (SqlException oException)
			{
				//errorLink1.InnerHtml += "foo";
				foreach (SqlError oErr in oException.Errors)
				{
					errorLink1.InnerHtml += oErr.Message;
				}
			}
		}
		#endregion




		#region TimePoint  RowDataBound
		protected void GridView_TimePoint__RowDataBound(object sender, GridViewRowEventArgs e)
		{
			// For each DataRow in the GridView

			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				CheckBox chkShowTimePoint = (CheckBox)e.Row.FindControl("chkShowTimePoint");
				Label lblTP = (Label)e.Row.FindControl("lblTP");

				if (lblTP.Text == "ALL TPs") 
				{ chkShowTimePoint.Checked = true; }
				else { chkShowTimePoint.Checked = false; }
			}

		}
		#endregion


		#endregion




		#region  [D] ________SubjStatus________  (which is based on what Study was selected

		#region  SubjStatus Load
		protected void LoadSubjStatus(int studyID, int jobpk)
		{

			//errorLink1.InnerHtml += "got here";

			try
			{
				//
				// SubjStatus
				//

				oConn.Close();

				if (oConn.State == ConnectionState.Closed)
				{
					oConn.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
					oConn.Open();
			}
			SqlCommand oCmdDG = new SqlCommand();
				oCmdDG.CommandTimeout = 90;

				oCmdDG.CommandType = CommandType.StoredProcedure;
				oCmdDG.CommandText = "spAUTOdata__SubjStatus";


				oCmdDG.Parameters.Add(new SqlParameter("@studyID", SqlDbType.Int));
				oCmdDG.Parameters["@studyID"].Direction = ParameterDirection.Input;
				oCmdDG.Parameters.Add(new SqlParameter("@jobpk", SqlDbType.Int));
				oCmdDG.Parameters["@jobpk"].Direction = ParameterDirection.Input;
				

				oCmdDG.Parameters["@studyID"].Value = studyID;
				oCmdDG.Parameters["@jobpk"].Value = jobpk;
				
				//errorLink1.InnerHtml += " @@@@@ THESORTEXPIS->" + sortExp;



				oCmdDG.Connection = this.oConn;
				SqlDataAdapter daDG = new SqlDataAdapter(oCmdDG);

				DataSet dsDG = new DataSet();

				daDG.Fill(dsDG);

				DataTable dtDG = dsDG.Tables[0];
				DataView dvDG = new DataView(dtDG);
				//DataView dv = new DataView(dt);

				// is this needed?   dv.Sort = sortExp + direction;

				//errorLink1.InnerHtml += "$$1$$ numgrant=" + numGrant.ToString();

				GridView_SubjStatus.DataSource = dvDG;
				GridView_SubjStatus.DataBind();

				panelSubjStatus.Visible = true;

				//errorLink1.InnerHtml += "$$2$$ numgrant=" + numGrant.ToString();

			}
			catch (SqlException oException)
			{
				//errorLink1.InnerHtml += "foo";
				foreach (SqlError oErr in oException.Errors)
				{
					errorLink1.InnerHtml += oErr.Message;
				}
			}
		}
		#endregion

		#region Change SubjStatus Checkboxes
		protected void Change_chkSSC_fin(object sender, EventArgs e)
		{
			//CheckBox chk = (CheckBox)sender;
			//if (chk.Checked) 
			//     { Show_fin = true;} 
			//else { Show_fin = false;}
		}

		protected void Change_chkSSC_act(object sender, EventArgs e)
		{
			//CheckBox chk = (CheckBox)sender;
			//if (chk.Checked)
			//{ Show_act = true; }
			//else { Show_act = false; }
		}

		protected void Change_chkSSC_tbs(object sender, EventArgs e)
		{
			//CheckBox chk = (CheckBox)sender;
			//if (chk.Checked)
			//{ Show_tbs = true; }
			//else { Show_tbs = false; }
		}

		protected void Change_chkSSC_ina(object sender, EventArgs e)
		{
			//CheckBox chk = (CheckBox)sender;
			//if (chk.Checked)
			//{ Show_ina = true; }
			//else { Show_ina = false; }
		}

		protected void Change_chkSSC_dq(object sender, EventArgs e)
		{
			//CheckBox chk = (CheckBox)sender;
			//if (chk.Checked)
			//{ Show_fin = true; }
			//else { Show_fin = false; }
		}

		protected void Change_chkSSC_oos(object sender, EventArgs e)
		{
			//CheckBox chk = (CheckBox)sender;
			//if (chk.Checked)
			//{ Show_oos = true; }
			//else { Show_oos = false; }
		}


		protected void Change_chkSSC_npt(object sender, EventArgs e)
		{
			//CheckBox chk = (CheckBox)sender;
			//if (chk.Checked)
			//{ Show_npt = true; }
			//else { Show_npt = false; }
		}


		protected void Change_chkSSC_nis(object sender, EventArgs e)
		{
			//CheckBox chk = (CheckBox)sender;
			//if (chk.Checked)
			//{ Show_nis = true; }
			//else { Show_nis = false; }
		}


		protected void Change_chkSSC_nen(object sender, EventArgs e)
		{
			//CheckBox chk = (CheckBox)sender;
			//if (chk.Checked)
			//{ Show_nen = true; }
			//else { Show_nen = false; }
		}

		#endregion




		#region SubjStatus  RowDataBound
		protected void GridView_SubjStatus__RowDataBound(object sender, GridViewRowEventArgs e)
		{


			  if (e.Row.RowType == DataControlRowType.DataRow)
			{

				groupcounter = groupcounter + 1;

				CheckBox chkShowGroup = (CheckBox)e.Row.FindControl("chkShowGroup");

				/////////////////////////////////////////////////////////////////
				//Assign the row value from the GridView to local variables

				Label lblGroup = (Label)e.Row.FindControl("lblGroup");

				Label lblSSC_fin = (Label)e.Row.FindControl("lblSSC_fin");
				Label lblSSC_act = (Label)e.Row.FindControl("lblSSC_act");
				Label lblSSC_tbs = (Label)e.Row.FindControl("lblSSC_tbs");
				Label lblSSC_ina = (Label)e.Row.FindControl("lblSSC_ina");
				Label lblSSC_oos = (Label)e.Row.FindControl("lblSSC_oos");
				Label lblSSC_dq = (Label)e.Row.FindControl("lblSSC_dq");
				Label lblSSC_npt = (Label)e.Row.FindControl("lblSSC_npt");
				Label lblSSC_nis = (Label)e.Row.FindControl("lblSSC_nis");
				Label lblSSC_nen = (Label)e.Row.FindControl("lblSSC_nen");

				//string access_type = (e.Row.DataItem, "access_type");



				if (lblGroup.Text == "Total")
				{
					chkShowGroup.Enabled = false;
					chkShowGroup.Visible = false;
					chkShowGroup.Checked = false;

					SSC_fin = int.Parse(lblSSC_fin.Text);
					SSC_act = int.Parse(lblSSC_act.Text);
					SSC_tbs = int.Parse(lblSSC_tbs.Text);
					SSC_ina = int.Parse(lblSSC_ina.Text);
					SSC_oos = int.Parse(lblSSC_oos.Text);
					SSC_dq = int.Parse(lblSSC_dq.Text);
					SSC_npt = int.Parse(lblSSC_npt.Text);
					SSC_nis = int.Parse(lblSSC_nis.Text);
					SSC_nen = int.Parse(lblSSC_nen.Text);


					/*
					 SSC_fin = (lblSSC_fin.Text);
					 SSC_act = (lblSSC_act.Text);
					 SSC_tbs = (lblSSC_tbs.Text);
					 SSC_ina = (lblSSC_ina.Text);
					 SSC_oos = (lblSSC_oos.Text);
					 SSC_dq = (lblSSC_dq.Text);
					*/

					/*
					if (SSC_fin > 0) { chkSSC_fin.Enabled = true; chkSSC_fin.Checked = true; } else { chkSSC_fin.Enabled = false; chkSSC_fin.Checked = false; }
					if (SSC_act > 0) { chkSSC_act.Enabled = true; chkSSC_act.Checked = true; } else { chkSSC_act.Enabled = false; chkSSC_act.Checked = false; }
					if (SSC_tbs > 0) { chkSSC_tbs.Enabled = true; chkSSC_tbs.Checked = true; } else { chkSSC_tbs.Enabled = false; chkSSC_tbs.Checked = false; }
					if (SSC_ina > 0) { chkSSC_ina.Enabled = true; chkSSC_ina.Checked = true; } else { chkSSC_ina.Enabled = false; chkSSC_ina.Checked = false; }
					if (SSC_oos > 0) { chkSSC_oos.Enabled = true; chkSSC_oos.Checked = true; } else { chkSSC_oos.Enabled = false; chkSSC_oos.Checked = false; } 
					if (SSC_dq > 0)  {chkSSC_dq.Enabled = true; chkSSC_dq.Checked = true;} else {chkSSC_dq.Enabled = false; chkSSC_dq.Checked = false;} 

					*/

					 //errorLink1.InnerHtml += lblSSC_fin.Text + " - " + lblSSC_act.Text;
					
					}                            
				else                         
				{
					chkShowGroup.Enabled = true;
					chkShowGroup.Checked = true;
					chkShowGroup.Visible = true;
				}





			}

		}

		#endregion


		#endregion





	
		protected void Reset_from_GetData(object sender, System.EventArgs e)
		{
			panelOutput.Visible = false;
			//ShowDataAccessButtons();
		}
	


		protected void ShowDebug(object sender, System.EventArgs e)
		{
			if (panelDebug.Visible == true)
			{ panelDebug.Visible = false; }
			else
			{ panelDebug.Visible = true; }
		}



		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}

		private void InitializeComponent()
		{
			//this.Load += new System.EventHandler(this.Page_Load);
		}
		#endregion

}
