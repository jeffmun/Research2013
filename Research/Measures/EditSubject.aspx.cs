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

namespace Measures
{
	public partial class EditSubject : System.Web.UI.Page
	{
		private TextFormatter oFormatter = new TextFormatter();
		private DBLookup oDBLookup;
		private int nSubjectID = 0;
		private int nPersonID;
		private int nStudyID;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitSubjectStatus());";

			if (!IsPostBack)
			{
				oDBLookup = new DBLookup();

				nSubjectID = Convert.ToInt32(Request["SubjID"].ToString());
				nPersonID = oDBLookup.GetPersonIDBySubjID(nSubjectID);
				nStudyID = oDBLookup.GetStudyIDBySubjID(nSubjectID);

				SqlCommand oCmd = new SqlCommand();
				SqlDataReader oReader;

				oCmd.Connection = Master.SqlConn;
				oCmd.CommandText = "spGetSubjectDetailsBySubjectID";
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;

				oCmd.Parameters.AddWithValue("@SubjID", nSubjectID);

				oReader = oCmd.ExecuteReader();

				if (oReader.Read())
				{
					#region Set the Control Properties and Bind them to Data
					tdTitle.InnerHtml = "Edit Subject: " + oReader["ID"].ToString();

					txtNotes.Text = oReader["Notes"].ToString();
					hidSubjectID.Value = Request["SubjID"].ToString();

					oDBLookup.BindDropDownList(ref selSubjStatusID, "EXEC spGetAllSubjectStatuses", "SubjStatus", "SubjStatusID", oReader["SubjStatusID"].ToString(), "--Select Status--");

					if (oReader["SubjStatusID"].ToString() != "")
						oDBLookup.BindDropDownList(ref selSubjStatusDetailID, "EXEC spGetSubjectStatusDetailsBySubjStatusID @SubjStatusID = " + oReader["SubjStatusID"].ToString(), "SubjStatusDetail", "SubjStatusDetailID", oReader["SubjStatusDetailID"].ToString(), "--Select Status Detail--");
					else
						oDBLookup.BindDropDownList(ref selSubjStatusDetailID, "EXEC spGetSubjectStatusDetailsBySubjStatusID @SubjStatusID = NULL", "SubjStatusDetail", "SubjStatusDetailID", oReader["SubjStatusDetailID"].ToString(), "--Select Status Detail--");

					if (oReader["SubjStatusDetailID"].ToString() != "")
						selSubjStatusID.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, " + oReader["SubjStatusDetailID"].ToString() + ", 'subjectstatus', 'selSubjStatusDetailID');";
					else
						selSubjStatusID.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, -1, 'subjectstatus', 'selSubjStatusDetailID');";

					if (oReader["SubjStatusDetailID"].ToString() != "")
						selSubjStatusID.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, " + oReader["SubjStatusDetailID"].ToString() + ", 'subjectstatus', 'selSubjStatusDetailID');";
					else
						selSubjStatusID.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, 0, 'subjectstatus', 'selSubjStatusDetailID');";

					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/ActionsBySubject.aspx?SubjectID=" + oReader["SubjID"].ToString() + "\" class=\"smalltext\">Action Summary - " + oReader["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/MeasuresBySubject.aspx?SubjectID=" + oReader["SubjID"].ToString() + "\" class=\"smalltext\">Measure Summary - " + oReader["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/ConsentsBySubject.aspx?SubjectID=" + oReader["SubjID"].ToString() + "\" class=\"smalltext\">Consent Form Summary - " + oReader["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + oReader["HouseholdID"].ToString() + "\" class=\"smalltext\">View Household - " + oReader["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Household/EditHousehold.aspx?HouseholdID=" + oReader["HouseholdID"].ToString() + "\" class=\"smalltext\">Edit Household - " + oReader["ID"].ToString() + "</a></div>";

					DataTable tblSurveys = oDBLookup.GetScreeningSurveysByStudyIDAndPersonID(nStudyID, nPersonID);

					for (int i=0;i<tblSurveys.Rows.Count;i++)
						tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Screening/Results/individual_results.asp?selPersonID=" + nPersonID.ToString() + "&amp;selSurveyID=" + tblSurveys.Rows[i]["Survey_ID"].ToString() + "\" class=\"smalltext\">" + tblSurveys.Rows[i]["Survey_Name"].ToString() + " - " + oReader["ID"].ToString() + "</a></div>";

					DataTable tblDocs = oDBLookup.GetDocsByEntityIDAndEntityTypeID(4, Convert.ToInt32(oReader["SubjID"].ToString()));

					if (tblDocs.Rows.Count > 0)
					{
						tdInfo.InnerHtml += "<div style=\"text-align: center; width: 100%; background-color: #a1b5cf; font-weight: bold; padding: 2px; margin-top: 20px;\">Subject Documents</div>";

						for (int i=0;i<tblDocs.Rows.Count;i++)
							tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Documents/UploadDocument.aspx?DocID=" + tblDocs.Rows[i]["DocID"].ToString() + "&amp;DocVersID=" + tblDocs.Rows[i]["DocVersID"].ToString() + "&amp;EntityTypeID=" + tblDocs.Rows[i]["EntityTypeID"].ToString() + "&amp;EntityID=" + tblDocs.Rows[i]["EntityID"].ToString() + "\"><img src=\"" + Request.ApplicationPath + "/images/edit_small.gif\" alt=\"Edit Document\" /></a><a href=\"" + Request.ApplicationPath + "/WebDocs/" + tblDocs.Rows[i]["DocFileName"].ToString() + "\" class=\"smalltext\">" + tblDocs.Rows[i]["DocTitle"].ToString() + "</a></div>";
					}
					#endregion

					oReader.Close();
				}
			}
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup(Master.SqlConn);
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spUpdateSubjectStatus";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@SubjectID", hidSubjectID.Value);
			oCmd.Parameters.AddWithValue("@SubjectStatusID", selSubjStatusID.SelectedValue);

            oCmd.Parameters.AddWithValue("@SubjectStatusDetailID", selSubjStatusDetailID.SelectedValue);


            //selSubjStatusDetailID control is disabled when subject status is set to 'FINISHED'
            //and isn't included in posted form data.  Test for this condition by checking 
            //Request[selSubjStatusDetailID.ClientID.Replace("_", "$")] for null
			//oCmd.Parameters.AddWithValue("@SubjectStatusDetailID", (Request[selSubjStatusDetailID.ClientID.Replace("_", "$")]==null)?"-1":Request[selSubjStatusDetailID.ClientID.Replace("_", "$")].ToString());
			oCmd.Parameters.AddWithValue("@GroupID", DBNull.Value);
			oCmd.Parameters.AddWithValue("@Notes", txtNotes.Text);

			if (oCmd.Parameters["@SubjectStatusDetailID"].Value.ToString() == "-1"){oCmd.Parameters["@SubjectStatusDetailID"].Value = DBNull.Value;}
			if (oCmd.Parameters["@Notes"].Value.ToString().Trim() == ""){oCmd.Parameters["@Notes"].Value = DBNull.Value;}

			selSubjStatusDetailID.Items.Clear();
			oDBLookup.BindDropDownList(ref selSubjStatusDetailID, "EXEC spGetSubjectStatusDetailsBySubjStatusID @SubjStatusID = " + oCmd.Parameters["@SubjectStatusID"].Value.ToString(), "SubjStatusDetail", "SubjStatusDetailID", oCmd.Parameters["@SubjectStatusDetailID"].Value.ToString(), "--Select Status Detail--");

			oCmd.ExecuteNonQuery();
		}
		#endregion

		#region Redirections for Other Buttons
		protected void UploadDocument(object sender, System.EventArgs e)
		{
			Response.Redirect(Request.ApplicationPath + "/Documents/UploadDocument.aspx?EntityTypeID=4&EntityID=" + hidSubjectID.Value.ToString(), true);
		}
		#endregion
	}
}