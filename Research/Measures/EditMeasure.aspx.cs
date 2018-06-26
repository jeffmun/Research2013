using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;
using uwac;

namespace Measures
{
	public partial class EditMeasure : System.Web.UI.Page
	{
		private TextFormatter oFormatter = new TextFormatter();
		private ReadConfig oConfig = new ReadConfig();
		private DBLookup oDBLookup;
		private int nStudyMeasSubjID = 0;
		private int nSubjID;
		private int nStudyID;
		private int nPersonID;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitMeasureStatus());";

			if (!IsPostBack)
			{
				oDBLookup = new DBLookup();

				nStudyMeasSubjID = Convert.ToInt32(Request["StudyMeasSubjID"]);
				nSubjID = oDBLookup.GetSubjectIDFromStudyMeasSubjID(nStudyMeasSubjID);
				nPersonID = oDBLookup.GetPersonIDBySubjID(nSubjID);
				nStudyID = oDBLookup.GetStudyIDByStudyMeasSubjID(nStudyMeasSubjID);

				SqlCommand oCmd = new SqlCommand();
				SqlDataReader oReader;

				oCmd.Connection = Master.SqlConn;
				oCmd.CommandText = "spGetStudyMeasSubjDetails";
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;

				oCmd.Parameters.AddWithValue("@StudyMeasSubjID", nStudyMeasSubjID);

				oReader = oCmd.ExecuteReader();

				if (oReader.HasRows)
				{
					oReader.Read();

					#region Set the Control Properties and Bind them to Data
					tdTitle.InnerHtml = "Edit Measure: " + oReader["MeasName"].ToString() + " for Subject " + oReader["ID"].ToString();

					oDBLookup.BindDropDownList(ref selCompByID, "EXEC spGetAllStaff", "StaffShortName", "StaffID", oReader["StaffID_MeasCompBy"].ToString(), "--Select Staff--");
					oDBLookup.BindDropDownList(ref selMeasStatusID, "EXEC spGetAllMeasureStatuses", "MeasStatus", "MeasStatusID", oReader["MeasStatusID"].ToString(), "--Select Status--");

					if (oReader["MeasStatusID"].ToString() != "")
						oDBLookup.BindDropDownList(ref selMeasStatusDetailID, "EXEC spGetMeasureStatusDetailsByMeasStatusID @MeasStatusID = " + oReader["MeasStatusID"].ToString(), "MeasStatusDetail", "MeasStatusDetailID", oReader["MeasStatusDetailID"].ToString(), "--Select Status Detail--");
					else
						oDBLookup.BindDropDownList(ref selMeasStatusDetailID, "EXEC spGetMeasureStatusDetailsByMeasStatusID @MeasStatusID = NULL", "MeasStatusDetail", "MeasStatusDetailID", oReader["MeasStatusDetailID"].ToString(), "--Select Status Detail--");

					if (oReader["MeasStatusDetailID"].ToString() != "")
						selMeasStatusID.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, " + oReader["MeasStatusDetailID"].ToString() + ", 'measurestatus', 'selMeasStatusDetailID');";
					else
						selMeasStatusID.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, -1, 'measurestatus', 'selMeasStatusDetailID');";

					txtDateDone.Text = oReader["MeasureDateDone"].ToString();
					txtNotes.Text = oReader["StudyMeasSubjNotes"].ToString();
					hidStudyMeasSubjID.Value = nStudyMeasSubjID.ToString();

					if (oReader["Missing_Form_Flag"].ToString() == "1")
						chkMissingFormFlag.Checked = true;
					else
						chkMissingFormFlag.Checked = false;

					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/EditSubject.aspx?SubjID=" + oReader["SubjID"].ToString() + "\" class=\"smalltext\">Edit Subject - " + oReader["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/ActionsBySubject.aspx?SubjectID=" + oReader["SubjID"].ToString() + "\" class=\"smalltext\">Action Summary - " + oReader["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/MeasuresBySubject.aspx?SubjectID=" + oReader["SubjID"].ToString() + "\" class=\"smalltext\">Measure Summary - " + oReader["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/ConsentsBySubject.aspx?SubjectID=" + oReader["SubjID"].ToString() + "\" class=\"smalltext\">Consent Form Summary - " + oReader["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + oReader["HouseholdID"].ToString() + "\" class=\"smalltext\">View Household - " + oReader["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Household/EditHousehold.aspx?HouseholdID=" + oReader["HouseholdID"].ToString() + "\" class=\"smalltext\">Edit Household - " + oReader["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/SubjectsByMeasure.aspx?StudyMeasID=" + oReader["StudyMeasID"].ToString() + "\" class=\"smalltext\">Subject Summary - " + oReader["MeasName"].ToString() + "</a></div>";

					DataTable tblSurveys = oDBLookup.GetScreeningSurveysByStudyIDAndPersonID(nStudyID, nPersonID);

					for (int i=0;i<tblSurveys.Rows.Count;i++)
						tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Screening/Results/individual_results.asp?selPersonID=" + nPersonID.ToString() + "&amp;selSurveyID=" + tblSurveys.Rows[i]["Survey_ID"].ToString() + "\" class=\"smalltext\">" + tblSurveys.Rows[i]["Survey_Name"].ToString() + " - " + oReader["ID"].ToString() + "</a></div>";

					DataTable tblDocs = oDBLookup.GetDocsByEntityIDAndEntityTypeID(4, Convert.ToInt32(oReader["SubjID"].ToString()));

					if (tblDocs.Rows.Count > 0)
					{
						for (int i=0;i<tblDocs.Rows.Count;i++)
							tdDocuments.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Documents/UploadDocument.aspx?DocID=" + tblDocs.Rows[i]["DocID"].ToString() + "&amp;DocVersID=" + tblDocs.Rows[i]["DocVersID"].ToString() + "&amp;EntityTypeID=" + tblDocs.Rows[i]["EntityTypeID"].ToString() + "&amp;EntityID=" + tblDocs.Rows[i]["EntityID"].ToString() + "\"><img src=\"" + Request.ApplicationPath + "/images/edit_small.gif\" alt=\"Edit Document\" /></a><a href=\"" + Request.ApplicationPath + "/WebDocs/" + tblDocs.Rows[i]["DocFileName"].ToString() + "\" class=\"smalltext\">" + tblDocs.Rows[i]["DocTitle"].ToString() + "</a></div>";
					}
					else
						tdDocuments.InnerHtml = "&nbsp;";
					#endregion
				}

				oReader.Close();
			}
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup(Master.SqlConn);

			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spUpdateStudyMeasSubjStatus";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@StudyMeasSubjID", hidStudyMeasSubjID.Value);
			oCmd.Parameters.AddWithValue("@CompByStaffID", selCompByID.SelectedValue);
			oCmd.Parameters.AddWithValue("@MeasStatusID", selMeasStatusID.SelectedValue);
			oCmd.Parameters.AddWithValue("@MeasStatusDetailID", selMeasStatusDetailID.SelectedValue);

			//oCmd.Parameters.AddWithValue("@MeasStatusDetailID",
			//Request[selMeasStatusDetailID.ClientID.Replace("_",
			//"$")].ToString());

			//if (Request[selMeasStatusDetailID.ClientID.Replace("_", "$")] != null)
			//    oCmd.Parameters.AddWithValue("@MeasStatusDetailID", Request[selMeasStatusDetailID.ClientID.Replace("_", "$")].ToString());
			//else
			//    oCmd.Parameters.AddWithValue("@MeasStatusDetailID", "-1");

			oCmd.Parameters.AddWithValue("@DateDone", txtDateDone.Text);
			oCmd.Parameters.AddWithValue("@MissingFormFlag", chkMissingFormFlag.Checked);
			oCmd.Parameters.AddWithValue("@Notes", txtNotes.Text);
			oCmd.Parameters.AddWithValue("@NoDataFlag", null);

			if (oCmd.Parameters["@CompByStaffID"].Value.ToString() == "-1") {oCmd.Parameters["@CompByStaffID"].Value = DBNull.Value;}
			if (oCmd.Parameters["@MeasStatusDetailID"].Value.ToString() == "-1") {oCmd.Parameters["@MeasStatusDetailID"].Value = DBNull.Value;}
			if (oCmd.Parameters["@DateDone"].Value.ToString().Trim() == "") {oCmd.Parameters["@DateDone"].Value = DBNull.Value;}
			if (oCmd.Parameters["@Notes"].Value.ToString().Trim() == "") {oCmd.Parameters["@Notes"].Value = DBNull.Value;}

			oCmd.ExecuteNonQuery();
			
			selMeasStatusDetailID.Items.Clear();

			oDBLookup.BindDropDownList(ref selMeasStatusDetailID, "EXEC spGetMeasureStatusDetailsByMeasStatusID @MeasStatusID = " + oCmd.Parameters["@MeasStatusID"].Value.ToString(), "MeasStatusDetail", "MeasStatusDetailID", oCmd.Parameters["@MeasStatusDetailID"].Value.ToString(), "--Select Status Detail--");

		}
		#endregion

		#region Redirections for Other Buttons
		protected void ChangeAction(object sender, System.EventArgs e)
		{
			Response.Redirect(Request.ApplicationPath + "/Measures/ChangeMeasActionAssignments.aspx?StudyMeasSubjID=" + hidStudyMeasSubjID.Value, true);
		}

		protected void UploadDocument(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup();
			Response.Redirect(Request.ApplicationPath + "/Documents/UploadDocument.aspx?EntityTypeID=4&EntityID=" + oDBLookup.GetSubjectIDFromStudyMeasSubjID(Convert.ToInt32(hidStudyMeasSubjID.Value.ToString())), true);
		}
		#endregion

		
		
		
}
}
