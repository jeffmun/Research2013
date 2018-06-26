using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;

namespace Household
{
	public partial class AppendLog : System.Web.UI.Page
	{
		private ReadConfig oConfig = new ReadConfig();
		private DBLookup oDBLookup;
		private string sStaffID;
        
		private void Page_Load(object sender, System.EventArgs e)
		{
            
			oDBLookup = new DBLookup(Master.SqlConn);

			Form.Attributes["onsubmit"] = "return(DoSubmitAppendLog());";

			HttpCookie oCookie = Request.Cookies["UserProfile"];
			string sHouseholdID = Request["HouseholdID"].ToString();
			string sHouseholdName = oDBLookup.GetHouseholdName(Convert.ToInt32(sHouseholdID));
			string sContactPriorityID = "";
			string sContactLogNotes = "";
			string sContactTypeID = "";
			string sContactPurposeID = "";
			string sContactDate = DateTime.Today.ToString("MM/dd/yyyy");
			int nContactHour = DateTime.Now.Hour;
			int nContactMinute = DateTime.Now.Minute;
			string sStudyID = "";
			string sHouseholdLogNotes = "";
			string sCategoryID = "";
			string sHouseholdInfoPriorityID = "";
            
			tdContactLog.InnerHtml = "Append " + sHouseholdName + " Contact Log";
			tdHouseholdInfoLog.InnerHtml = "Append " + sHouseholdName + " Household Info Log";

			if (oCookie != null)
				sStaffID = oCookie.Values["StaffID"].ToString();
			else
				sStaffID = "";

			if (!IsPostBack)
			{
				hidHouseholdID_Contact.Value = sHouseholdID;

				if (Request["LogInfoID"] != null)
				{
					GetHouseholdInfoLog(Request["LogInfoID"].ToString(), ref sCategoryID, ref sHouseholdInfoPriorityID, ref sStaffID, ref sHouseholdLogNotes);
					hidLogInfoID.Value = Request["LogInfoID"].ToString();
					txtaHouseholdNotes.Text = sHouseholdLogNotes;
				}
				else if (Request["LogContactID"] != null)
				{
					GetContactLogInfo(Request["LogContactID"].ToString(), ref sContactLogNotes, ref sContactPriorityID, ref sContactTypeID, ref sContactPurposeID, ref sStudyID, ref sStaffID, ref sContactDate, ref nContactHour, ref nContactMinute);
					hidLogContactID.Value = Request["LogContactID"].ToString();
				}

				hidHouseholdID_Contact.Value = sHouseholdID;
				txtaContactLogNotes.Text = sContactLogNotes;
				oDBLookup.BindDropDownList(ref selContactPriority, "EXEC spGetLogPriorities", "LogPriority", "LogPriorityID", sContactPriorityID, "--Select Priority--");
				oDBLookup.BindDropDownList(ref selContactType, "EXEC spGetLogContactTypes", "LogContactType", "LogContactTypeID", sContactTypeID, "--Select Contact Type--");
				oDBLookup.BindDropDownList(ref selContactPurpose, "EXEC spGetLogContactPurposes", "LogContactPurpose", "LogContactPurposeID", sContactPurposeID, "--Select Purpose--");
				oDBLookup.BindDropDownList(ref selStudy, "EXEC spGetActiveStudies", "StudyName", "StudyID", sStudyID, "--Select Study--");
				oDBLookup.BindDropDownList(ref selContactStaff, "EXEC spGetAllStaff", "StaffShortName", "StaffID", sStaffID, "--Select Staff--");
				txtContactDate.Text = sContactDate;
                                
				if (!nContactMinute.ToString().EndsWith("5") && !nContactMinute.ToString().EndsWith("0"))
				{
					for (int i = 1; i < 5; i++)
					{
						nContactMinute = (nContactMinute - 1);

						if (nContactMinute.ToString().EndsWith("5") || nContactMinute.ToString().EndsWith("0"))
							break;
					}
				}

				if (nContactHour < 10)
					selHour.SelectedValue = "0" + nContactHour.ToString();
				else
					selHour.SelectedValue = nContactHour.ToString();

				if (nContactMinute < 10)
					selMinute.SelectedValue = "0" + nContactMinute.ToString();
				else
					selMinute.SelectedValue = nContactMinute.ToString();

				hidHouseholdID_Info.Value = sHouseholdID;
				oDBLookup.BindDropDownList(ref selHouseholdInfoPriority, "EXEC spGetLogPriorities", "LogPriority", "LogPriorityID", sHouseholdInfoPriorityID, "--Select Priority--");
				oDBLookup.BindDropDownList(ref selCategory, "EXEC spGetLogCategories", "LogInfoCat", "LogInfoCatID", sCategoryID, "--Select Category--");
				oDBLookup.BindDropDownList(ref selHouseholdInfoStaff, "EXEC spGetAllStaff", "StaffShortName", "StaffID", sStaffID, "--Select Staff--");
			}
		}

		#region Lookup Household Log Info
		private void GetHouseholdInfoLog(string sLogInfoID, ref string sCategoryID, ref string sPriorityID, ref string sStaffID, ref string sHouseholdLogNotes)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetInfoLogEntryByLogInfoID";

			oCmd.Parameters.Add(new SqlParameter("@LogInfoID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, sLogInfoID));

			oReader = oCmd.ExecuteReader();

			if (oReader.Read())
			{
				sCategoryID = oReader["LogInfoCatID"].ToString();
				sPriorityID = oReader["LogPriorityID"].ToString();
				sStaffID = oReader["StaffID"].ToString();
				sHouseholdLogNotes = oReader["LogInfoNotes"].ToString();
			}

			oReader.Close();
		}
		#endregion

		#region Lookup Contact Log Info
		private void GetContactLogInfo(string sLogContactID, ref string sNotes, ref string sPriorityID, ref string sContactTypeID, ref string sPurposeID, ref string sStudyID, ref string sStaffID, ref string sDate, ref int nHour, ref int nMinute)
		{
			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetContactLogEntryByLogContactID";
			oCmd.Parameters.AddWithValue("@LogContactID", sLogContactID);

			SqlDataReader oReader = oCmd.ExecuteReader();

			if (oReader.Read())
			{
				sNotes = oReader["LogNotes"].ToString();
				sPriorityID = oReader["LogPriorityID"].ToString();
				sContactTypeID = oReader["LogContactTypeID"].ToString();
				sPurposeID = oReader["LogContactPurposeID"].ToString();
				sStudyID = oReader["StudyID"].ToString();
				sStaffID = oReader["StaffID"].ToString();
				sDate = Convert.ToDateTime(oReader["LogDate"].ToString()).ToString("MM/dd/yyyy");

				if (oReader["LogHour"].ToString() != "") {nHour = Convert.ToInt32(oReader["LogHour"].ToString());}
				if (oReader["LogMinute"].ToString() != "") {nMinute = Convert.ToInt32(oReader["LogMinute"].ToString());}
			}

			oReader.Close();
		}
		#endregion

		#region Save Contact Log
		protected void SaveContactLog(object sender, EventArgs e)
		{
            DateTime passDate = Convert.ToDateTime(txtContactDate.Text);
            passDate = passDate.AddHours(Double.Parse(selHour.SelectedValue));
            passDate = passDate.AddMinutes(Double.Parse(selMinute.SelectedValue));

            SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spAppendContactLog";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@LogContactID", hidLogContactID.Value);
			oCmd.Parameters.AddWithValue("@HouseholdID", hidHouseholdID_Contact.Value);
			oCmd.Parameters.AddWithValue("@PriorityID", selContactPriority.SelectedValue);
			oCmd.Parameters.AddWithValue("@ContactTypeID", selContactType.SelectedValue);
			oCmd.Parameters.AddWithValue("@ContactPurposeID", selContactPurpose.SelectedValue);
            oCmd.Parameters.AddWithValue("@ContactDate", passDate);
			oCmd.Parameters.AddWithValue("@StudyID", selStudy.SelectedValue);
			oCmd.Parameters.AddWithValue("@StaffID", sStaffID);
			oCmd.Parameters.AddWithValue("@LogNotes", txtaContactLogNotes.Text);

			if (oCmd.Parameters["@LogContactID"].Value.ToString() == "" || oCmd.Parameters["@LogContactID"].Value.ToString() == "-1") { oCmd.Parameters["@LogContactID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@PriorityID"].Value.ToString() == "" || oCmd.Parameters["@PriorityID"].Value.ToString() == "-1") { oCmd.Parameters["@PriorityID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@ContactPurposeID"].Value.ToString() == "" || oCmd.Parameters["@ContactPurposeID"].Value.ToString() == "-1") { oCmd.Parameters["@ContactPurposeID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@StudyID"].Value.ToString() == "" || oCmd.Parameters["@StudyID"].Value.ToString() == "-1") { oCmd.Parameters["@StudyID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@LogNotes"].Value.ToString() == "") { oCmd.Parameters["@LogNotes"].Value = DBNull.Value; }

			oCmd.ExecuteNonQuery();
		}
		#endregion

		#region Save Household Log
		protected void SaveInfoLog(object sender, EventArgs e)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spInsertHouseholdNotes";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@HouseholdID", hidHouseholdID_Info.Value);
			oCmd.Parameters.AddWithValue("@Notes", txtaHouseholdNotes.Text);
			oCmd.Parameters.AddWithValue("@PriorityID", selHouseholdInfoPriority.SelectedValue);
			oCmd.Parameters.AddWithValue("@CategoryID", selCategory.SelectedValue);
			oCmd.Parameters.AddWithValue("@StaffID", sStaffID);
			oCmd.Parameters.AddWithValue("@LogInfoID", hidLogInfoID.Value);

			if (oCmd.Parameters["@LogInfoID"].Value.ToString() == "") { oCmd.Parameters["@LogInfoID"].Value = DBNull.Value; }

			oCmd.ExecuteNonQuery();
		}
		#endregion
	}
}
