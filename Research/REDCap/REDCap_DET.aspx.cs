using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text;
//using MySql.Data.MySqlClient;
using System.Collections.Specialized;
using System.Diagnostics;
using System.IO;
using System.Configuration;
using System.Net.Mail;
using System.Net;


public partial class REDCap_DET : System.Web.UI.Page
{
	string project_id = "";
	string record = "";
	string redcap_event_name = "";
	string redcap_data_access_group = "";
	string instrument = "";
	string complete_flag_key = "";
	string complete_flag_value = "";

	private void Page_Load(object sender, System.EventArgs e)
	{
        SendEmail("something happened 1"); 

		ArrayList arrayKeys;
		string strMessage = "";

		if ( !Page.IsPostBack)
		{
            SendEmail("something happened 2");
			try
			{
                arrayKeys = GetDETKeys();

				// get params
				project_id = GetDETValue ( arrayKeys, "project_id");
				record = GetDETValue ( arrayKeys, "record");
				redcap_event_name = GetDETValue ( arrayKeys, "redcap_event_name");
				redcap_data_access_group = GetDETValue ( arrayKeys, "redcap_data_access_group");
				instrument = GetDETValue ( arrayKeys, "instrument");

                // this should work, but have not tried yet (2014-07-29)
                complete_flag_key = instrument + "_complete";
                complete_flag_value = GetDETValue(arrayKeys, instrument + "_complete");

                strMessage += "project_id: " + project_id + "; ";
				strMessage += "record: " + record + "; ";
				strMessage += "redcap_event_name: " + redcap_event_name + "; ";
				strMessage += "redcap_data_access_group: " + redcap_data_access_group + "; ";
				strMessage += "instrument: " + instrument + "; ";
				strMessage += complete_flag_key + ": " + complete_flag_value + "; ";

				if ( project_id == "249")
				{
                    //get data and write to sql tables
				}

                SendEmail("something happened 3 " + Request.RawUrl.ToString()+"     "+strMessage);
					
			}
			catch ( Exception ex)
			{
				strMessage = ex.Message.ToString();

				//SetTest(strMessage);
			}

			ClientScript.RegisterClientScriptBlock(this.GetType(), "CloseWindow", "<script>window.open('','_self','');window.close();</script>");
        }
	}

    //public void UpdateSAE(string strSAEStudyID)
    //{
    //    DBAccess dbAccess = new DBAccess();
    //    DBStatusPENUT dbStatus;

    //    string strBirthDate = "";
    //    string strGestAge = "";
    //    string strSAEDate = "";
    //    string strSAEDays = "";
    //    string strStudyID = strSAEStudyID.Substring(0, 10);

    //    TimeSpan tsSAEDays;
    //    DateTime dtBirthDate;
    //    DateTime dtSAEDate;

    //    try
    //    {
    //        // get dbStatus info 
    //        dbStatus = dbAccess.GetStatusPENUT(strStudyID);
    //        strSAEDate = dbAccess.GetRCSAEDate(strSAEStudyID);

    //        // set BD and GestAge and SAEDays
    //        if (dbStatus.BirthDate.Length >= 10)
    //        {
    //            strBirthDate = dbStatus.BirthDate.Substring(0, 10);
    //            dtBirthDate = Convert.ToDateTime(strBirthDate);

    //            if (strSAEDate.Trim() != "")
    //            {
    //                dtSAEDate = Convert.ToDateTime(strSAEDate);

    //                tsSAEDays = dtSAEDate.Subtract(dtBirthDate);
    //                strSAEDays = tsSAEDays.Days.ToString();
    //            }
    //        }
    //        strGestAge = dbStatus.GestAgeWeeks.Trim() + "W" + dbStatus.GestAgeDays.Trim() + "D";

    //        string strResponse = dbAccess.SetRCSAEPENUT(strSAEStudyID, strBirthDate, strGestAge, strSAEDays);
    //        //SetTest("SAE: BirthDate: " + strBirthDate + "; GestAge: " + strGestAge + 
    //        //    "; strSAEDays: " + strSAEDays + "; Response: " + strResponse);

    //    }
    //    catch (Exception ex)
    //    {
    //        //SetTest("Error: " + ex.Message.ToString());
    //        throw new Exception("Error: " + ex.Message.ToString());
    //    }

    //}

	public void SendEmailDET ( string strStudyID, string strDomain)
	{
		string strURI = "";
        string strEmailSite = ConfigurationManager.AppSettings["EmailSite"];

		try
		{
			//strURI = strStudyID + " (SAE): " + DateTime.Now.ToString("yyyy-MM-dd HH:mm");
			//DBAccess dbAccess = new DBAccess();
			//dbAccess.SetTest ( strURI);

			//  take these out and remove message above when putting back after power outage ... 2014-04-18
				 
			System.Net.WebClient wcEmailer = new System.Net.WebClient();
		
			// next two lines ... try on mono site
			//ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3;
			//strURI = "https://penut-trial.org/EmailService/Service1.asmx/Emailer?ScreenID=" + strStudyID + "&Domain=SAE";
			//strURI = "https://penut-trial.org/PENUTEmail/Default.aspx?ScreenID=" + strStudyID + "&Domain=SAE";

			// this currently works, but want to move to production, so try above
			// 1st on is when in my office.  2nd one on my dev. 3nd one in Patrick's office ... 2014-04-18
			//strURI = "http://172.22.36.247/WebService/Service1.asmx/Emailer?ScreenID=" + strStudyID + "&Domain=SAE";
			//strURI = "http://128.95.113.111/WebService/Service1.asmx/Emailer?ScreenID=" + strStudyID + "&Domain=SAE";
			//strURI = "http://140.142.36.228/WebService/Service1.asmx/Emailer?ScreenID=" + strStudyID + "&Domain=SAE";
			//strURI = "http://140.142.36.229/WebService/Service1.asmx/Emailer?ScreenID=" + strStudyID + "&Domain=" + strDomain;
            strURI = strEmailSite + "?ScreenID=" + strStudyID + "&Domain=" + strDomain;


			//strURI = "http://172.22.36.247/PENUTEmailNew/Default.aspx?ScreenID=" + strStudyID + "&Domain=SAE";
			//strURI = "http://140.142.36.228/WebService/Service1.asmx/Emailer?ScreenID=" + strStudyID + "&Domain=SAE";
			//strURI = "https://penut-trial.org/PENUTEmail/Service1.asmx/Emailer?ScreenID=" + strStudyID + "&Domain=SAE";

			Stream stmEmailer = wcEmailer.OpenRead(strURI);
			stmEmailer.Close();
			//  put in end of comment when needed
		}
		catch ( Exception ex)
		{
			throw new Exception ( "RC Error: " +  ex.Message.ToString());
		}
	}

    //public void CheckCompletionStatus ( string strStudyID)
    //{
    //    DBAccess dbAccess = new DBAccess();
    //    ArrayList arrayCompletion;
    //    DBStatusPENUT dbStatus;

    //    string strCompleteStatus = "";
    //    bool boolCompleteChanged = false;

    //    try
    //    {
    //        // get dbStatus info 
    //        dbStatus = dbAccess.GetStatusPENUT (strStudyID);

    //        // get completion
    //        arrayCompletion = dbAccess.GetRCCompletionPENUTMain( strStudyID);

    //        // if don't find, do nothing
    //        if ( dbStatus.StudyID.Trim() == "")
    //        {
    //            //SetTest ( "StudyID not found in DB: " + strStudyID + "; " + dbStatus.StudyID);
    //            return;
    //        }
    //        if ( arrayCompletion.Count < 1)
    //        {
    //            //SetTest ( "StudyID not found in RC: " + strStudyID + "; " + dbStatus.StudyID + "; Count=" + arrayCompletion.Count);
    //            return;
    //        }

    //        foreach ( DBRCCompletion dbRCCompletion in arrayCompletion)
    //        {
    //            // based on event, set completion status

    //            // baseline
    //            if ( dbRCCompletion.redcap_event_name == "baseline_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.BaselineComplete;

    //                // reset status
    //                dbStatus.BaselineComplete = "0";

    //                // if any completed, then set to 1
    //                if ( dbRCCompletion.form_information_complete == "2" || dbRCCompletion.maternal_demographics_complete == "2" || 
    //                    dbRCCompletion.maternal_health_complete == "2" || dbRCCompletion.neonatal_data_at_enrollment_complete == "2" || 
    //                    dbRCCompletion.paternal_information_complete == "2" || dbRCCompletion.physical_exam_complete == "2")
    //                {
    //                    dbStatus.BaselineComplete = "1";
    //                }

    //                // if all completed, then set to 2
    //                if ( dbRCCompletion.form_information_complete == "2" && dbRCCompletion.maternal_demographics_complete == "2" && 
    //                    dbRCCompletion.maternal_health_complete == "2" && dbRCCompletion.neonatal_data_at_enrollment_complete == "2" && 
    //                    dbRCCompletion.paternal_information_complete == "2" && dbRCCompletion.physical_exam_complete == "2")
    //                {
    //                    dbStatus.BaselineComplete = "2";
    //                }

    //                // if status changed, then store it
    //                if ( strCompleteStatus != dbStatus.BaselineComplete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.BaselineDate = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }

    //            if ( dbRCCompletion.redcap_event_name == "baseline_hus_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.HeadUltraComplete;

    //                // reset status
    //                dbStatus.HeadUltraComplete = "0";

    //                // if any completed, then set to 1
    //                if ( dbRCCompletion.cranial_hus_complete_complete == "2")
    //                {
    //                    dbStatus.HeadUltraComplete = "1";
    //                }

    //                // if all completed, then set to 2
    //                if ( dbRCCompletion.cranial_hus_complete_complete == "2")
    //                {
    //                    dbStatus.HeadUltraComplete = "2";
    //                }

    //                // if status changed, then store it
    //                if ( strCompleteStatus != dbStatus.HeadUltraComplete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.HeadUltraDate = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }

    //            if ( dbRCCompletion.redcap_event_name == "day_7_hus_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.HeadUltraDay7Complete;

    //                // reset status
    //                dbStatus.HeadUltraDay7Complete = "0";

    //                // if any completed, then set to 1
    //                if ( dbRCCompletion.cranial_hus_complete_complete == "2")
    //                {
    //                    dbStatus.HeadUltraDay7Complete = "1";
    //                }

    //                // if all completed, then set to 2
    //                if ( dbRCCompletion.cranial_hus_complete_complete == "2")
    //                {
    //                    dbStatus.HeadUltraDay7Complete = "2";
    //                }

    //                // if status changed, then store it
    //                if ( strCompleteStatus != dbStatus.HeadUltraDay7Complete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.HeadUltraDay7Date = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }

    //            if ( dbRCCompletion.redcap_event_name == "high_dose_phase_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.HighDoseComplete;

    //                // reset status
    //                dbStatus.HighDoseComplete = "0";

    //                // if any completed, then set to 1
    //                if ( dbRCCompletion.form_information_complete == "2" || dbRCCompletion.study_drug_administration_high_dose_phase_complete == "2" || 
    //                    dbRCCompletion.hematology_complete == "2" || 
    //                    dbRCCompletion.physical_exam_complete == "2" || dbRCCompletion.tables_complete == "2")
    //                {
    //                    dbStatus.HighDoseComplete = "1";
    //                }

    //                // if all completed, then set to 2
    //                if ( dbRCCompletion.form_information_complete == "2" && dbRCCompletion.study_drug_administration_high_dose_phase_complete == "2" && 
    //                    dbRCCompletion.hematology_complete == "2" && 
    //                    dbRCCompletion.physical_exam_complete == "2" && dbRCCompletion.tables_complete == "2")
    //                {
    //                    dbStatus.HighDoseComplete = "2";
    //                }

    //                // if status changed, then store it
    //                if ( strCompleteStatus != dbStatus.HighDoseComplete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.HighDoseDate = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }
				
    //            if ( dbRCCompletion.redcap_event_name == "week_36_pma_mri_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.PMAMRIWeek36Complete;

    //                // reset status
    //                dbStatus.PMAMRIWeek36Complete = "0";

    //                // if any completed, then set to 1
    //                if ( dbRCCompletion.mri_scan_complete_complete == "2")
    //                {
    //                    dbStatus.PMAMRIWeek36Complete = "1";
    //                }

    //                // if all completed, then set to 2
    //                if ( dbRCCompletion.mri_scan_complete_complete == "2")
    //                {
    //                    dbStatus.PMAMRIWeek36Complete = "2";
    //                }

    //                // if status changed, then store it
    //                if ( strCompleteStatus != dbStatus.PMAMRIWeek36Complete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.PMAMRIWeek36Date = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }
				
    //            if ( dbRCCompletion.redcap_event_name == "week_36_hus_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.HeadUltraWeek36Complete;

    //                // reset status
    //                dbStatus.HeadUltraWeek36Complete = "0";

    //                // if any completed, then set to 1
    //                if ( dbRCCompletion.cranial_hus_complete_complete == "2")
    //                {
    //                    dbStatus.HeadUltraWeek36Complete = "1";
    //                }

    //                // if all completed, then set to 2
    //                if ( dbRCCompletion.cranial_hus_complete_complete == "2")
    //                {
    //                    dbStatus.HeadUltraWeek36Complete = "2";
    //                }

    //                // if status changed, then store it
    //                if ( strCompleteStatus != dbStatus.HeadUltraWeek36Complete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.HeadUltraWeek36Date = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }
				
    //            if ( dbRCCompletion.redcap_event_name == "hospital_discharge_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.DischargeComplete;

    //                // reset status
    //                dbStatus.DischargeComplete = "0";

    //                // if any completed, then set to 1
    //                if ( dbRCCompletion.form_information_complete == "2" || dbRCCompletion.study_drug_administration_maintenance_phase_complete == "2" || 
    //                    dbRCCompletion.hospital_discharge_complete == "2" || dbRCCompletion.respiratory_complete == "2" || 
    //                    dbRCCompletion.gastrointestinal_complete == "2" || dbRCCompletion.cardiovascular_complete == "2" || 
    //                    dbRCCompletion.hematology_complete == "2" || dbRCCompletion.hepatic_complete == "2" || 
    //                    dbRCCompletion.renal_complete == "2" || dbRCCompletion.neuro_complete == "2" || 
    //                    dbRCCompletion.ophthalmologic_complete == "2" || dbRCCompletion.newborn_screen_complete == "2" ||
    //                    dbRCCompletion.serious_adverse_event_resolution_complete == "2" || dbRCCompletion.brain_imaging_complete == "2" ||
    //                    dbRCCompletion.physical_exam_complete == "2" || dbRCCompletion.tables_complete == "2")
    //                {
    //                    dbStatus.DischargeComplete = "1";
    //                }

    //                if ( dbRCCompletion.form_information_complete == "2" && dbRCCompletion.study_drug_administration_maintenance_phase_complete == "2" && 
    //                    dbRCCompletion.hospital_discharge_complete == "2" && dbRCCompletion.respiratory_complete == "2" && 
    //                    dbRCCompletion.gastrointestinal_complete == "2" && dbRCCompletion.cardiovascular_complete == "2" && 
    //                    dbRCCompletion.hematology_complete == "2" && dbRCCompletion.hepatic_complete == "2" && 
    //                    dbRCCompletion.renal_complete == "2" && dbRCCompletion.neuro_complete == "2" &&
    //                    dbRCCompletion.ophthalmologic_complete == "2" && dbRCCompletion.newborn_screen_complete == "2" &&
    //                    dbRCCompletion.serious_adverse_event_resolution_complete == "2" && dbRCCompletion.brain_imaging_complete == "2" &&
    //                    dbRCCompletion.physical_exam_complete == "2" && dbRCCompletion.tables_complete == "2")
    //                {
    //                    dbStatus.DischargeComplete = "2";
    //                }

    //                // if status changed, then store it
    //                if ( strCompleteStatus != dbStatus.DischargeComplete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.DischargeDate = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }

    //            if (dbRCCompletion.redcap_event_name == "discharge_question_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.DCQuestionComplete;

    //                // reset status
    //                dbStatus.DCQuestionComplete = "0";

    //                // if any completed, then set to 1
    //                if (dbRCCompletion.discharge_questionnaire_complete == "2")
    //                {
    //                    dbStatus.DCQuestionComplete = "1";
    //                }

    //                if (dbRCCompletion.discharge_questionnaire_complete == "2")
    //                {
    //                    dbStatus.DCQuestionComplete = "2";
    //                }

    //                // if status changed, then store it
    //                if (strCompleteStatus != dbStatus.DCQuestionComplete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.DCQuestionDate = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }

    //            if (dbRCCompletion.redcap_event_name == "biological_sample_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.SamplesComplete;

    //                // reset status
    //                dbStatus.SamplesComplete = "0";

    //                // if any completed, then set to 1
    //                if ( dbRCCompletion.urine_sample_collection_complete == "2" || dbRCCompletion.blood_samples_for_epo_complete == "2" ||
    //                    dbRCCompletion.biological_sample_tracking_complete == "2")
    //                {
    //                    dbStatus.SamplesComplete = "1";
    //                }

    //                if ( dbRCCompletion.urine_sample_collection_complete == "2" && dbRCCompletion.blood_samples_for_epo_complete == "2" && 
    //                    dbRCCompletion.biological_sample_tracking_complete == "2")
    //                {
    //                    dbStatus.SamplesComplete = "2";
    //                }

    //                // if status changed, then store it
    //                if ( strCompleteStatus != dbStatus.SamplesComplete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.SamplesDate = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }

    //            // added 2014-08-06
    //            if (dbRCCompletion.redcap_event_name == "4_month_pma_contac_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.PMAContactMonth4Complete;

    //                // reset status
    //                dbStatus.PMAContactMonth4Complete = "0";

    //                // if any completed, then set to 1 (only 1 here, so may change later so will leave it)
    //                if (dbRCCompletion.followup_complete == "2")
    //                {
    //                    dbStatus.PMAContactMonth4Complete = "1";
    //                }

    //                if (dbRCCompletion.followup_complete == "2")
    //                {
    //                    dbStatus.PMAContactMonth4Complete = "2";
    //                }

    //                // if status changed, then store it
    //                if (strCompleteStatus != dbStatus.PMAContactMonth4Complete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.PMAContactMonth4Date = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }

    //            // added 2014-12-22 (8, 12, 18, 24M)
    //            if (dbRCCompletion.redcap_event_name == "8_month_pma_contac_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.PMAContactMonth8Complete;

    //                // reset status
    //                dbStatus.PMAContactMonth8Complete = "0";

    //                // if any completed, then set to 1 (only 1 here, so may change later so will leave it)
    //                if (dbRCCompletion.followup_complete == "2")
    //                {
    //                    dbStatus.PMAContactMonth8Complete = "1";
    //                }

    //                if (dbRCCompletion.followup_complete == "2")
    //                {
    //                    dbStatus.PMAContactMonth8Complete = "2";
    //                }

    //                // if status changed, then store it
    //                if (strCompleteStatus != dbStatus.PMAContactMonth8Complete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.PMAContactMonth8Date = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }

    //            if (dbRCCompletion.redcap_event_name == "12_month_pma_conta_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.PMAContactMonth12Complete;

    //                // reset status
    //                dbStatus.PMAContactMonth12Complete = "0";

    //                // if any completed, then set to 1 (only 1 here, so may change later so will leave it)
    //                if (dbRCCompletion.followup_complete == "2")
    //                {
    //                    dbStatus.PMAContactMonth12Complete = "1";
    //                }

    //                if (dbRCCompletion.followup_complete == "2")
    //                {
    //                    dbStatus.PMAContactMonth12Complete = "2";
    //                }

    //                // if status changed, then store it
    //                if (strCompleteStatus != dbStatus.PMAContactMonth12Complete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.PMAContactMonth12Date = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }

    //            if (dbRCCompletion.redcap_event_name == "18_month_pma_conta_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.PMAContactMonth18Complete;

    //                // reset status
    //                dbStatus.PMAContactMonth18Complete = "0";

    //                // if any completed, then set to 1 (only 1 here, so may change later so will leave it)
    //                if (dbRCCompletion.followup_complete == "2")
    //                {
    //                    dbStatus.PMAContactMonth18Complete = "1";
    //                }

    //                if (dbRCCompletion.followup_complete == "2")
    //                {
    //                    dbStatus.PMAContactMonth18Complete = "2";
    //                }

    //                // if status changed, then store it
    //                if (strCompleteStatus != dbStatus.PMAContactMonth18Complete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.PMAContactMonth18Date = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }

    //            if (dbRCCompletion.redcap_event_name == "24_month_pma_conta_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.PMAContactMonth24Complete;

    //                // reset status
    //                dbStatus.PMAContactMonth24Complete = "0";

    //                // if any completed, then set to 1 (only 1 here, so may change later so will leave it)
    //                if (dbRCCompletion.followup_complete == "2")
    //                {
    //                    dbStatus.PMAContactMonth24Complete = "1";
    //                }

    //                if (dbRCCompletion.followup_complete == "2")
    //                {
    //                    dbStatus.PMAContactMonth24Complete = "2";
    //                }

    //                // if status changed, then store it
    //                if (strCompleteStatus != dbStatus.PMAContactMonth24Complete)
    //                {
    //                    boolCompleteChanged = true;
    //                    dbStatus.PMAContactMonth24Date = DateTime.Now.ToString("yyyy-MM-dd");
    //                }
    //            }

    //            if (dbRCCompletion.redcap_event_name == "participant_status_arm_1")
    //            {
    //                // store current status
    //                strCompleteStatus = dbStatus.EnrollStatus;

    //                // reset status to enrolled
    //                dbStatus.EnrollStatus = "1";
    //                dbStatus.WithdrawDate = "";

    //                // check withdraw reasons
    //                if ( dbRCCompletion.withdraw_reason___0 == "1")
    //                {
    //                    dbStatus.EnrollStatus = "2";
    //                    dbStatus.WithdrawDate = dbRCCompletion.withdrawdate_drug;
    //                }
    //                if ( dbRCCompletion.withdraw_reason___1 == "1")
    //                {
    //                    dbStatus.EnrollStatus = "3";
    //                    dbStatus.WithdrawDate = dbRCCompletion.withdrawdate_study;
    //                }
    //                if ( dbRCCompletion.withdraw_reason___2 == "1")
    //                {
    //                    dbStatus.EnrollStatus = "4";
    //                    dbStatus.WithdrawDate = dbRCCompletion.death_time;
    //                }

    //                // if status changed, then store it
    //                if ( strCompleteStatus != dbStatus.EnrollStatus)
    //                {
    //                    boolCompleteChanged = true;
    //                }
    //            }

    //            // if any changes, then save status to db
    //            if ( boolCompleteChanged)
    //            {
    //                dbAccess.UpdateStatusPENUT ( dbStatus);
    //            }
    //        }
    //    }
    //    catch ( Exception ex)
    //    {
    //        throw new Exception ( "RC Error: " +  ex.Message.ToString());
    //    }

    //}

	public string GetDETValue ( ArrayList alDETKeys, string strKey)
	{
		string strValue = "";

		foreach ( DETKeys DETKey in alDETKeys)
		{
			if ( DETKey.strKey == strKey)
			{
				strValue = DETKey.strValue;
			}
		}

		return ( strValue);
	}

	public ArrayList GetDETKeys ()
	{
		ArrayList arrayResults = new ArrayList();

		DETKeys detKeys;

		NameValueCollection nvcKeys = Request.Form;

		foreach (string strKey in nvcKeys.AllKeys)
		{
			detKeys = new DETKeys();

			detKeys.strKey = strKey;
			detKeys.strValue = nvcKeys.Get(strKey);

			arrayResults.Add (detKeys);
		}

		return ( arrayResults);
	}
	
    //public void SetTest ( string strMessage)
    //{
    //    DBAccess dbAccess = new DBAccess();

    //    string strDateTimeNow = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

    //    try
    //    {
    //        dbAccess.SetTest("[" + strDateTimeNow + "] " + strMessage);
    //    }

    //    catch (Exception ex)
    //    {
    //        throw new Exception ( "DB Error. " + ex.Message.ToString(), ex);
    //    }
    //}
		
	public static void SendEmail(string bodyString)
	{
        SmtpClient sm = new SmtpClient("smtp.gmail.com");
        sm.Port = 587;
        sm.EnableSsl = true;
        MailAddress to = new MailAddress("tacet321@gmail.com");
        MailAddress from = new MailAddress("tacet321@gmail.com");
        sm.Credentials = new NetworkCredential("tacet321@gmail.com", "Fr1tz007");
        MailMessage m = new MailMessage(to, from);
        m.Subject = "DET";
        m.Body = bodyString;
		sm.Send(m); // SmtpException
	}
		
}

public class DETKeys
{
	public string strKey="";
	public string strValue="";
}
