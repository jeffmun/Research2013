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
	public partial class EditAction2 : System.Web.UI.Page
	{
		private SqlCommand oCmd = new SqlCommand();
		private SqlDataAdapter oAdapter;
		private DataTable oTable;
		private DBLookup oDBLookup;
		private int nActionID;
		private string sActionText;
		private int nSubjID;
		private int nPersonID;
		private int nStudyID;
		private string sID;

		private void Page_Load(object sender, System.EventArgs e)
		{
			bool bActionExists = false;
			oCmd = new SqlCommand();
			oAdapter = new SqlDataAdapter(oCmd);
			oDBLookup = new DBLookup(Master.SqlConn);

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetActionDetailsByActionID";

			Form.Attributes["onsubmit"] = "return(DoSubmitActionStatus());";

			if (!IsPostBack)
			{
				nActionID = Convert.ToInt32(Request["ActionID"].ToString());
				sActionText = oDBLookup.GetActionText(nActionID);
				nSubjID = Convert.ToInt32(oDBLookup.GetSubjectIDFromActionID(nActionID));
				nPersonID = oDBLookup.GetPersonIDBySubjID(nSubjID);
				nStudyID = oDBLookup.GetStudyIDByActionID(nActionID);
				sID = oDBLookup.GetIDBySubjID(nSubjID);

				hidActionID.Value = nActionID.ToString();
				tdTitle.InnerHtml = "Edit Action: " + sActionText + " for Subject " + sID;

				oCmd.Parameters.AddWithValue("@ActionID", nActionID);

				oTable = new DataTable();
				oAdapter.Fill(oTable);

				if (oTable.Rows.Count > 0)
				{
					bActionExists = true;

					#region Set the Form Values
					txtDateDone.Text = oTable.Rows[0]["DateDone"].ToString();
					txtDueDateStart.Text = oTable.Rows[0]["DateDueStart"].ToString();
					txtDueDateEnd.Text = oTable.Rows[0]["DateDueEnd"].ToString();
					txtNotes.Text = oTable.Rows[0]["ActionNotes"].ToString();

					oDBLookup.BindDropDownList(ref selRespForID, "EXEC spGetAllStaff", "StaffShortName", "StaffID", oTable.Rows[0]["StaffID_RespFor"].ToString(), "--Select Staff--");
					oDBLookup.BindDropDownList(ref selCompByID, "EXEC spGetAllStaff", "StaffShortName", "StaffID", oTable.Rows[0]["StaffID_CompBy"].ToString(), "--Select Staff--");
					oDBLookup.BindDropDownList(ref selActionStatusID, "EXEC spGetActionStatusesByActionID @ActionID = " + nActionID.ToString(), "ActionStatus", "ActionStatusID", oTable.Rows[0]["ActionStatusID"].ToString(), "--Select Status--");

					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/EditSubject.aspx?SubjID=" + oTable.Rows[0]["SubjID"].ToString() + "\" class=\"smalltext\">Edit Subject - " + oTable.Rows[0]["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/ActionsBySubject.aspx?SubjectID=" + oTable.Rows[0]["SubjID"].ToString() + "\" class=\"smalltext\">Action Summary - " + oTable.Rows[0]["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/MeasuresBySubject.aspx?SubjectID=" + oTable.Rows[0]["SubjID"].ToString() + "\" class=\"smalltext\">Measure Summary - " + oTable.Rows[0]["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/ConsentsBySubject.aspx?SubjectID=" + oTable.Rows[0]["SubjID"].ToString() + "\" class=\"smalltext\">Consent Form Summary - " + oTable.Rows[0]["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + oTable.Rows[0]["HouseholdID"].ToString() + "\" class=\"smalltext\">View Household - " + oTable.Rows[0]["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Household/EditHousehold.aspx?HouseholdID=" + oTable.Rows[0]["HouseholdID"].ToString() + "\" class=\"smalltext\">Edit Household - " + oTable.Rows[0]["ID"].ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/SubjectsByAction.aspx?StudyActionID=" + oTable.Rows[0]["StudyActionID"].ToString() + "\" class=\"smalltext\">Subject Summary - " + oTable.Rows[0]["ActionText"].ToString() + "</a></div>";

					btnEditMeasures.Attributes["onclick"] = "EditMultipleMeasures(" + nActionID.ToString() + ");";
					btnMoveMeasures.Attributes["onclick"] = "MoveMeasuresToNewAction(" + nActionID.ToString() + ");";
					btnEditConsents.Attributes["onclick"] = "EditMultipleConsents(" + nActionID.ToString() + ");";
					btnMoveConsents.Attributes["onclick"] = "MoveConsentsToNewAction(" + nActionID.ToString() + ");";

					DataTable tblSurveys = oDBLookup.GetScreeningSurveysByStudyIDAndPersonID(nStudyID, nPersonID);

					for (int i = 0; i < tblSurveys.Rows.Count; i++)
						tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Screening/Results/individual_results.asp?selPersonID=" + nPersonID.ToString() + "&amp;selSurveyID=" + tblSurveys.Rows[i]["Survey_ID"].ToString() + "\" class=\"smalltext\">" + tblSurveys.Rows[i]["Survey_Name"].ToString() + " - " + oTable.Rows[0]["ID"].ToString() + "</a></div>";

					if (oTable.Rows[0]["CanBeScheduled"].ToString() == "0")
					{
						btnScheduleAction.Style["display"] = "none";
						btnAddAssistants.Style["display"] = "none";
					}

					if (oTable.Rows[0]["CanBeCopied"].ToString() == "0")
						btnCopyAction.Style["display"] = "none";

					DataTable tblDocs = oDBLookup.GetDocsByEntityIDAndEntityTypeID(4, Convert.ToInt32(oTable.Rows[0]["SubjID"].ToString()));

					if (tblDocs.Rows.Count > 0)
					{
						for (int i = 0; i < tblDocs.Rows.Count; i++)
							tdDocuments.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Documents/UploadDocument.aspx?DocID=" + tblDocs.Rows[i]["DocID"].ToString() + "&amp;DocVersID=" + tblDocs.Rows[i]["DocVersID"].ToString() + "&amp;EntityTypeID=" + tblDocs.Rows[i]["EntityTypeID"].ToString() + "&amp;EntityID=" + tblDocs.Rows[i]["EntityID"].ToString() + "\"><img src=\"" + Request.ApplicationPath + "/images/edit_small.gif\" alt=\"Edit Document\" /></a><a href=\"" + Request.ApplicationPath + "/WebDocs/" + tblDocs.Rows[i]["DocFileName"].ToString() + "\" class=\"smalltext\">" + tblDocs.Rows[i]["DocTitle"].ToString() + "</a></div>";
					}
					else
						tdDocuments.InnerHtml = "&nbsp;";
					#endregion
				}
			}
			else
			{
				nActionID = Convert.ToInt32(hidActionID.Value);
				sActionText = oDBLookup.GetActionText(nActionID);
				nSubjID = Convert.ToInt32(oDBLookup.GetSubjectIDFromActionID(nActionID));
				nPersonID = oDBLookup.GetPersonIDBySubjID(nSubjID);
				nStudyID = oDBLookup.GetStudyIDByActionID(nActionID);
				sID = oDBLookup.GetIDBySubjID(nSubjID);
				bActionExists = true;

				oCmd.Parameters.AddWithValue("@ActionID", nActionID);
			}

			if (bActionExists)
			{
				oCmd.CommandText = "spGetStudyMeasSubjsByActionID2";
				oTable = new DataTable();
				oAdapter.Fill(oTable);
				tblMeasures.DataSource = oTable;
				tblMeasures.DataBind();

				tblMeasures.Caption = "Measures Assigned to " + sActionText + " for Subj. " + sID;

				if (oTable.Rows.Count <= 0)
				{
					tblMeasures.Style["display"] = "none";
					tblMeasControl.Style["display"] = "none";
				}
				else
				{
					tblMeasures.Style["display"] = "inline";
					tblMeasControl.Style["display"] = "inline";
				}

				oCmd.CommandText = "spGetConsentsByActionID";
				oTable = new DataTable();
				oAdapter.Fill(oTable);
				tblConsents.DataSource = oTable;
				tblConsents.DataBind();

				tblConsents.Caption = "Consents Assigned to " + sActionText + " for Subj. " + sID;

				if (oTable.Rows.Count <= 0)
				{
					tblConsents.Style["display"] = "none";
					tblConsentControl.Style["display"] = "none";
				}
				else
				{
					tblConsents.Style["display"] = "inline";
					tblConsentControl.Style["display"] = "inline";
				}
			}
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spUpdateAction";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, hidActionID.Value));
			oCmd.Parameters.Add(new SqlParameter("@Reschedule", SqlDbType.SmallInt, 2, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
			oCmd.Parameters.Add(new SqlParameter("@RescheduleRespForID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
			oCmd.Parameters.Add(new SqlParameter("@ActionStatusID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, selActionStatusID.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@DateDone", SqlDbType.DateTime, 8, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, txtDateDone.Text));
			oCmd.Parameters.Add(new SqlParameter("@CompletedBy", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, selCompByID.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@RespForID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, selRespForID.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@DateDueStart", SqlDbType.DateTime, 8, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, txtDueDateStart.Text));
			oCmd.Parameters.Add(new SqlParameter("@DateDueEnd", SqlDbType.DateTime, 8, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, txtDueDateEnd.Text));
			oCmd.Parameters.Add(new SqlParameter("@Notes", SqlDbType.VarChar, 8000, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, txtNotes.Text));
			oCmd.Parameters.Add(new SqlParameter("@Location", SqlDbType.VarChar, 30, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
			oCmd.Parameters.Add(new SqlParameter("@ApptStartTime", SqlDbType.DateTime, 8, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
			oCmd.Parameters.Add(new SqlParameter("@ApptEndTime", SqlDbType.DateTime, 8, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
			oCmd.Parameters.Add(new SqlParameter("@AsstStatusID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
			oCmd.Parameters.Add(new SqlParameter("@AsstNotes", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));

			if (oCmd.Parameters["@RespForID"].Value.ToString() == "-1") {oCmd.Parameters["@RespForID"].Value = DBNull.Value;}
			if (oCmd.Parameters["@CompletedBy"].Value.ToString() == "-1") {oCmd.Parameters["@CompletedBy"].Value = DBNull.Value;}
			if (oCmd.Parameters["@DateDone"].Value.ToString() == "") {oCmd.Parameters["@DateDone"].Value = DBNull.Value;}
			if (oCmd.Parameters["@DateDueStart"].Value.ToString() == "") {oCmd.Parameters["@DateDueStart"].Value = DBNull.Value;}
			if (oCmd.Parameters["@DateDueEnd"].Value.ToString() == "") {oCmd.Parameters["@DateDueEnd"].Value = DBNull.Value;}
			if (oCmd.Parameters["@ApptStartTime"].Value.ToString() == "") {oCmd.Parameters["@ApptStartTime"].Value = DBNull.Value;}
			if (oCmd.Parameters["@ApptEndTime"].Value.ToString() == "") {oCmd.Parameters["@ApptEndTime"].Value = DBNull.Value;}
			if (oCmd.Parameters["@Location"].Value.ToString() == "") {oCmd.Parameters["@Location"].Value = DBNull.Value;}
			if (oCmd.Parameters["@AsstStatusID"].Value.ToString() == "") {oCmd.Parameters["@AsstStatusID"].Value = DBNull.Value;}
			if (oCmd.Parameters["@Notes"].Value.ToString() == "") {oCmd.Parameters["@Notes"].Value = DBNull.Value;}

			oCmd.ExecuteNonQuery();

			oDBLookup = new DBLookup(Master.SqlConn);

			if (oDBLookup.CanActionBeScheduled(Convert.ToInt32(hidActionID.Value)))
			{
				btnScheduleAction.Style["display"] = "inline";
				btnAddAssistants.Style["display"] = "inline";
			}
			else
			{
				btnScheduleAction.Style["display"] = "none";
				btnAddAssistants.Style["display"] = "none";
			}

			if (oDBLookup.CanActionBeCopied(Convert.ToInt32(hidActionID.Value)))
				btnCopyAction.Style["display"] = "inline";
			else
				btnCopyAction.Style["display"] = "none";
		}
		#endregion

		#region Redirections for Other Buttons
		protected void ScheduleAction(object sender, System.EventArgs e)
		{
			Response.Redirect(Request.ApplicationPath + "/Measures/ScheduleAction.aspx?ActionID=" + hidActionID.Value.ToString(), true);
		}

		protected void AddAssistants(object sender, System.EventArgs e)
		{
			Response.Redirect(Request.ApplicationPath + "/Measures/AddAssistantsToAction.aspx?ActionID=" + hidActionID.Value.ToString(), true);
		}

		protected void CopyAction(object sender, System.EventArgs e)
		{
			Response.Redirect(Request.ApplicationPath + "/Measures/CopyAction.aspx?ActionID=" + hidActionID.Value.ToString(), true);
		}

		protected void UploadDocument(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup();
			Response.Redirect(Request.ApplicationPath + "/Documents/UploadDocument.aspx?EntityTypeID=4&EntityID=" + oDBLookup.GetSubjectIDFromActionID(Convert.ToInt32(hidActionID.Value.ToString())), true);
		}
		#endregion


		protected void Meas_Item_Bound(object sender, DataGridItemEventArgs e)
		{
			if (e.Item.DataSetIndex >= 0)
			{
				e.Item.Cells[0].Controls.Add(new LiteralControl("<input type=\"checkbox\" name=\"chkMeasToEdit\" value=\"" + oTable.Rows[e.Item.DataSetIndex]["StudyMeasSubjID"].ToString() + "\" id=\"chkMeasToEdit" + oTable.Rows[e.Item.DataSetIndex]["StudyMeasSubjID"].ToString() + "\" />"));
				e.Item.Cells[0].Style["text-align"] = "center";
				e.Item.Attributes["onclick"] = "HighlightRow(this);";

				if (oTable.Rows[e.Item.DataSetIndex]["FormURL"].ToString() == "")
					e.Item.Cells[5].Controls.Clear();

				e.Item.Cells[6].BackColor = System.Drawing.Color.FromName(oTable.Rows[e.Item.DataSetIndex]["sms_dd_color"].ToString());			

			}
		}

		protected void Consent_Item_Bound(object sender, DataGridItemEventArgs e)
		{
			if (e.Item.DataSetIndex >= 0)
			{
				e.Item.Cells[0].Controls.Add(new LiteralControl("<input type=\"checkbox\" name=\"chkConsentToEdit\" value=\"" + oTable.Rows[e.Item.DataSetIndex]["SubjConsentID"].ToString() + "\" id=\"chkConsentToEdit" + oTable.Rows[e.Item.DataSetIndex]["SubjConsentID"].ToString() + "\" />"));
				e.Item.Cells[0].Style["text-align"] = "center";
				e.Item.Attributes["onclick"] = "HighlightRow(this);";
			}
		}
	}
}