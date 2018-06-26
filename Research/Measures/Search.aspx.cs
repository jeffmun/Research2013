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
	public partial class Search : System.Web.UI.Page
	{
		private SqlCommand oCmd = new SqlCommand();
		private SqlDataAdapter oAdapter;
		private DataTable oTable;
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitAdvancedSearch());";
			HtmlGenericControl oBody = (HtmlGenericControl)Master.FindControl("oBody");
			oBody.Attributes["onload"] = "CheckStatus(true); GiveFocus();";

			if (!IsPostBack)
			{
				oDBLookup = new DBLookup(Master.SqlConn);

				oDBLookup.BindDropDownList(ref selStudyID, "EXEC spGetActiveStudies 1", "StudyFullName", "StudyID", "", "--Select a Study--");
				oDBLookup.BindListBox(ref selSubjectStatusID, "EXEC spGetAllSubjectStatuses", "SubjStatus", "SubjStatusID", "");
				oDBLookup.BindDropDownList(ref selLabID, "EXEC spGetLabs", "LabName", "LabID", "", "--Select a Lab--");
				oDBLookup.BindDropDownList(ref selActionStatusID, "EXEC spGetAllActionStatuses", "ActionStatus", "ActionStatusID", "", "--Select a Status--");
				oDBLookup.BindDropDownList(ref selActionType, "SELECT ActionType, ActionTypeID FROM tblActionType_Lkup ORDER BY ActionType", "ActionType", "ActionTypeID", "", "--Select an Action Type--");
				oDBLookup.BindDropDownList(ref selMeasureStatusID, "EXEC spGetAllMeasureStatuses", "MeasStatus", "MeasStatusID", "", "--Select a Status--");
				oDBLookup.BindDropDownList(ref selRespForID, "EXEC spGetAllStaff", "StaffShortName", "StaffID", "", "--Select a Staff Member--");
				oDBLookup.BindDropDownList(ref selCompByID, "EXEC spGetAllStaff", "StaffShortName", "StaffID", "", "--Select a Staff Member--");

                selMeasureStatusID.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, null, 'measurestatus', '" + selMeasureStatusDetailID.ClientID.Replace("_", "$") + "')";

				selStudyID.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, null, 'studyactions', '" + selStudyActionID.ClientID.Replace("_", "$") + "');";
				selStudyID.Attributes["onchange"] += "DoSyncDropDowns(this.options[this.selectedIndex].value, null, 'studymeasures', '" + selStudyMeasureID.ClientID.Replace("_", "$") + "');";
				selStudyID.Attributes["onchange"] += "DoSyncDropDowns(this.options[this.selectedIndex].value, null, 'group', '" + selGroupID.ClientID.Replace("_", "$") + "');";
			}
		}
		
		#region Do Search
		protected void DoSearch(object sender, EventArgs e)
		{
			oCmd = new SqlCommand();
			oAdapter = new SqlDataAdapter(oCmd);
			oTable = new DataTable();
			tblSearchResults.DataSource = oTable;

			string sSubjectStatusID = "";
			string sStudyActions = "";
			string sStudyMeasures = "";

			if (Request[selSubjectStatusID.ClientID.Replace("_", "$")] != null) { sSubjectStatusID = Request[selSubjectStatusID.ClientID.Replace("_", "$")].ToString(); }
			if (Request[selStudyActionID.ClientID.Replace("_", "$")] != null) { sStudyActions = Request[selStudyActionID.ClientID.Replace("_", "$")].ToString(); }
			if (Request[selStudyMeasureID.ClientID.Replace("_", "$")] != null) { sStudyMeasures = Request[selStudyMeasureID.ClientID.Replace("_", "$")].ToString(); }

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			if (radSearchTypeSubj.Checked)
			{
				#region Subject Search
				oCmd.CommandText = "spSearchSubjects";

				oCmd.Parameters.AddWithValue("@SubjID", txtSubjID.Text);
				oCmd.Parameters.AddWithValue("@StudyID", selStudyID.SelectedValue);
				oCmd.Parameters.AddWithValue("@SubjectStatusID", sSubjectStatusID);
				oCmd.Parameters.AddWithValue("@GroupID", Request[selGroupID.ClientID.Replace("_", "$")].ToString());
				oCmd.Parameters.AddWithValue("@SortField", DBNull.Value);

				if (oCmd.Parameters["@SubjID"].Value.ToString().Trim() == "") { oCmd.Parameters["@SubjID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@SubjectStatusID"].Value.ToString() == "") { oCmd.Parameters["@SubjectStatusID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@GroupID"].Value.ToString() == "-1") { oCmd.Parameters["@GroupID"].Value = DBNull.Value; }

				tblSearchResults.Columns.Add(GetColumn("Subj. ID", "ID", "[ID] ASC", Request.ApplicationPath + "/Measures/ActionsBySubject.aspx?SubjectID={0}", "SubjID"));
				tblSearchResults.Columns.Add(GetColumn("Group", "GroupName", "[GroupName] ASC"));
                tblSearchResults.Columns.Add(GetColumn("Subj. Status", "SubjStatus", "[SubjStatus] ASC", Request.ApplicationPath + "/Measures/EditSubject.aspx?SubjID={0}", "SubjID"));
				tblSearchResults.Columns.Add(GetColumn("Age", "Age", "[Age] ASC"));
				tblSearchResults.Columns.Add(GetColumn("DOB", "DOB", "[DOB] ASC"));
				tblSearchResults.Columns.Add(GetColumn("Gender", "Sex", "[Sex] ASC"));
				tblSearchResults.Columns.Add(GetColumn("Ethnicity", "EthnicityDesc", "[EthnicityDesc] ASC"));

				oAdapter.Fill(oTable);

				if (oTable.Rows.Count > 0)
				{
					tblSearchResults.DataBind();
					tblSearchResults.Style["display"] = "inline";
					tblMaster.Style["display"] = "none";
					tdMsg.Style["display"] = "none";
				}
				else
				{
					tdMsg.InnerHtml = "There were no results that matched your search.";
					tdMsg.Style["display"] = "inline";
					tblSearchResults.Style["display"] = "none";
					tblMaster.Style["display"] = "inline";
				}
				#endregion
			}
			else if (radSearchTypeAction.Checked)
			{
				#region Action Search
				oCmd.CommandText = "spSearchActions";

				oCmd.Parameters.AddWithValue("@StudyID", selStudyID.SelectedValue);
				oCmd.Parameters.AddWithValue("@RespForID", selRespForID.SelectedValue);
				oCmd.Parameters.AddWithValue("@CompByID", selCompByID.SelectedValue);
				oCmd.Parameters.AddWithValue("@ActionStatusID", selActionStatusID.SelectedValue);
				oCmd.Parameters.AddWithValue("@StudyActionID", sStudyActions);
				oCmd.Parameters.AddWithValue("@ActionTypeID", selActionType.SelectedValue);
				oCmd.Parameters.AddWithValue("@SubjectID", txtSubjID.Text);
				oCmd.Parameters.AddWithValue("@LabID", selLabID.SelectedValue);
				oCmd.Parameters.AddWithValue("@SortField", DBNull.Value);
				oCmd.Parameters.AddWithValue("@SubjStatusID", selSubjectStatusID.SelectedValue);
				oCmd.Parameters.AddWithValue("@GroupID", Request[selGroupID.ClientID.Replace("_", "$")].ToString());
				oCmd.Parameters.AddWithValue("@StartDate", txtStartDate.Text);
				oCmd.Parameters.AddWithValue("@EndDate", txtEndDate.Text);

				if (oCmd.Parameters["@StudyID"].Value.ToString() == "-1" || oCmd.Parameters["@StudyID"].Value.ToString().Trim() == "") { oCmd.Parameters["@StudyID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@RespForID"].Value.ToString() == "-1" || oCmd.Parameters["@RespForID"].Value.ToString().Trim() == "") { oCmd.Parameters["@RespForID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@CompByID"].Value.ToString() == "-1" || oCmd.Parameters["@CompByID"].Value.ToString().Trim() == "") { oCmd.Parameters["@CompByID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@ActionStatusID"].Value.ToString() == "-1" || oCmd.Parameters["@ActionStatusID"].Value.ToString().Trim() == "") { oCmd.Parameters["@ActionStatusID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@StudyActionID"].Value.ToString().Trim() == "") { oCmd.Parameters["@StudyActionID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@ActionTypeID"].Value.ToString() == "-1" || oCmd.Parameters["@ActionTypeID"].Value.ToString().Trim() == "") { oCmd.Parameters["@ActionTypeID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@SubjectID"].Value.ToString() == "") { oCmd.Parameters["@SubjectID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@LabID"].Value.ToString() == "-1" || oCmd.Parameters["@LabID"].Value.ToString().Trim() == "") { oCmd.Parameters["@LabID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@SubjStatusID"].Value.ToString() == "-1" || oCmd.Parameters["@SubjStatusID"].Value.ToString().Trim() == "") { oCmd.Parameters["@SubjStatusID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@GroupID"].Value.ToString() == "-1" || oCmd.Parameters["@GroupID"].Value.ToString().Trim() == "") { oCmd.Parameters["@GroupID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@StartDate"].Value.ToString().Trim() == "") { oCmd.Parameters["@StartDate"].Value = DBNull.Value; }
				if (oCmd.Parameters["@EndDate"].Value.ToString().Trim() == "") { oCmd.Parameters["@EndDate"].Value = DBNull.Value; }

                tblSearchResults.Columns.Add(GetColumn("Subj. ID", "ID", "[ID] ASC", Request.ApplicationPath + "/Measures/ActionsBySubject.aspx?SubjectID={0}", "SubjID"));
				tblSearchResults.Columns.Add(GetColumn("Group", "GroupName", "[GroupName] ASC"));
                tblSearchResults.Columns.Add(GetColumn("Subj. Status", "SubjStatus", "[SubjStatus] ASC", Request.ApplicationPath + "/Measures/EditSubject.aspx?SubjID={0}", "SubjID"));
                tblSearchResults.Columns.Add(GetColumn("Action", "Action_ActionText", "[Action_ActionText] ASC", Request.ApplicationPath + "/Measures/EditAction.aspx?ActionID={0}", "ActionID"));
				tblSearchResults.Columns.Add(GetColumn("Action Status", "ActionStatus", "[ActionStatus] ASC"));
				tblSearchResults.Columns.Add(GetColumn("Resp. For", "Staff_RespFor", "[Staff_RespFor] ASC"));
				tblSearchResults.Columns.Add(GetColumn("Comp. By", "Staff_CompBy", "[Staff_CompBy] ASC"));
				tblSearchResults.Columns.Add(GetColumn("Date Done", "DateDone", "[DateDone] ASC"));

				oAdapter.Fill(oTable);

				if (oTable.Rows.Count > 0)
				{
					tblSearchResults.DataBind();
					tblSearchResults.Style["display"] = "inline";
					tblMaster.Style["display"] = "none";
					tdMsg.Style["display"] = "none";
				}
				else
				{
					tdMsg.InnerHtml = "There were no results that matched your search.";
					tdMsg.Style["display"] = "inline";
					tblSearchResults.Style["display"] = "none";
					tblMaster.Style["display"] = "inline";
				}
				#endregion
			}
			else if (radSearchTypeMeas.Checked)
			{
				#region Measure Search
				oCmd.CommandText = "spSearchMeasures";
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;

				oCmd.Parameters.AddWithValue("@StudyID", selStudyID.SelectedValue);
				oCmd.Parameters.AddWithValue("@MeasStatusID", selMeasureStatusID.SelectedValue);
				oCmd.Parameters.AddWithValue("@MeasStatusDetailID", selMeasureStatusDetailID.SelectedValue);
				oCmd.Parameters.AddWithValue("@StudyMeasID", sStudyMeasures);
				oCmd.Parameters.AddWithValue("@SubjectID", txtSubjID.Text);
				oCmd.Parameters.AddWithValue("@LabID", selLabID.SelectedValue);
				oCmd.Parameters.AddWithValue("@SortField", DBNull.Value);
				oCmd.Parameters.AddWithValue("@SubjStatusID", selSubjectStatusID.SelectedValue);
				oCmd.Parameters.AddWithValue("@GroupID", Request[selGroupID.ClientID.Replace("_", "$")].ToString());
				oCmd.Parameters.AddWithValue("@ActionStatusID", selActionStatusID.SelectedValue);
				oCmd.Parameters.AddWithValue("@StartDate", txtStartDate.Text);
				oCmd.Parameters.AddWithValue("@EndDate", txtEndDate.Text);

				if (oCmd.Parameters["@StudyID"].Value.ToString() == "-1" || oCmd.Parameters["@StudyID"].Value.ToString().Trim() == "") { oCmd.Parameters["@StudyID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@MeasStatusID"].Value.ToString() == "-1" || oCmd.Parameters["@MeasStatusID"].Value.ToString().Trim() == "") { oCmd.Parameters["@MeasStatusID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@MeasStatusDetailID"].Value.ToString() == "-1" || oCmd.Parameters["@MeasStatusDetailID"].Value.ToString().Trim() == "") { oCmd.Parameters["@MeasStatusDetailID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@StudyMeasID"].Value.ToString() == "") { oCmd.Parameters["@StudyMeasID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@SubjectID"].Value.ToString() == "") { oCmd.Parameters["@SubjectID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@LabID"].Value.ToString() == "-1" || oCmd.Parameters["@LabID"].Value.ToString().Trim() == "") { oCmd.Parameters["@LabID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@SubjStatusID"].Value.ToString() == "-1" || oCmd.Parameters["@SubjStatusID"].Value.ToString().Trim() == "") { oCmd.Parameters["@SubjStatusID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@GroupID"].Value.ToString() == "-1" || oCmd.Parameters["@GroupID"].Value.ToString().Trim() == "") { oCmd.Parameters["@GroupID"].Value = DBNull.Value; }
				if (oCmd.Parameters["@StartDate"].Value.ToString().Trim() == "") { oCmd.Parameters["@StartDate"].Value = DBNull.Value; }
				if (oCmd.Parameters["@EndDate"].Value.ToString().Trim() == "") { oCmd.Parameters["@EndDate"].Value = DBNull.Value; }
				if (oCmd.Parameters["@ActionStatusID"].Value.ToString() == "-1" || oCmd.Parameters["@ActionStatusID"].Value.ToString().Trim() == "") { oCmd.Parameters["@ActionStatusID"].Value = DBNull.Value; }

                tblSearchResults.Columns.Add(GetColumn("Subj. ID", "ID", "[ID] ASC", Request.ApplicationPath + "/Measures/ActionsBySubject.aspx?SubjectID={0}", "SubjID"));
				tblSearchResults.Columns.Add(GetColumn("Group", "GroupName", "[GroupName] ASC"));
                tblSearchResults.Columns.Add(GetColumn("Subj. Status", "SubjStatus", "[SubjStatus] ASC", Request.ApplicationPath + "/Measures/EditSubject.aspx?SubjID={0}", "SubjID"));
                tblSearchResults.Columns.Add(GetColumn("Measure", "MeasName", "[MeasName] ASC", Request.ApplicationPath + "/Measures/EditMeasure.aspx?StudyMeasSubjID={0}", "StudyMeasSubjID"));
                tblSearchResults.Columns.Add(GetColumn("Action", "ActionText", "[ActionText] ASC", Request.ApplicationPath + "/Measures/EditAction.aspx?ActionID={0}", "ActionID"));
				tblSearchResults.Columns.Add(GetColumn("Action Status", "ActionStatus", "[ActionStatus] ASC"));
				tblSearchResults.Columns.Add(GetColumn("Resp. For", "Staff_RespFor", "[Staff_RespFor] ASC"));
				tblSearchResults.Columns.Add(GetColumn("Comp. By", "Staff_CompBy", "[Staff_CompBy] ASC"));
				tblSearchResults.Columns.Add(GetColumn("Date Done", "DateDone", "[DateDone] ASC"));
				tblSearchResults.Columns.Add(GetColumn("Action to Take", "ActionToTake", "[ActionToTake] ASC"));

				oAdapter.Fill(oTable);

				if (oTable.Rows.Count > 0)
				{
					tblSearchResults.DataBind();
					tblSearchResults.Style["display"] = "inline";
					tblMaster.Style["display"] = "none";
					tdMsg.Style["display"] = "none";
				}
				else
				{
					tdMsg.InnerHtml = "There were no results that matched your search.";
					tdMsg.Style["display"] = "inline";
					tblSearchResults.Style["display"] = "none";
					tblMaster.Style["display"] = "inline";
				}
				#endregion
			}
				
		}
		#endregion

		protected void Item_Bound(object sender, DataGridItemEventArgs e)
		{
			if (e.Item.DataSetIndex >= 0)
			{
				if (radSearchTypeMeas.Checked)
				{
					if (oTable.Rows[e.Item.DataSetIndex]["FormURL"].ToString() != "")
					{
						HtmlAnchor oLink = new HtmlAnchor();
						oLink.InnerText = oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString() + ": " + oTable.Rows[e.Item.DataSetIndex]["ActionText"].ToString();
						oLink.HRef = "javascript:PopUpWindow('" + oTable.Rows[e.Item.DataSetIndex]["FormURL"].ToString() + "', 'wdwDEForm', 'scrollbars=yes,toolbar=no,status=no,menubar=no,height=750,width=750');";

						if (oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString().StartsWith("To Check") || oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString().StartsWith("ERROR")) { oLink.Style["color"] = " #ff0000"; }

						e.Item.Cells[9].Controls.Add(oLink);
						e.Item.Cells[9].Style["white-space"] = "normal";
					}
					else
					{
						e.Item.Cells[9].Text = oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString() + ": " + oTable.Rows[e.Item.DataSetIndex]["ActionText"].ToString();
						if (oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString().StartsWith("To Check") || oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString().StartsWith("ERROR")) { e.Item.Cells[9].Style["color"] = " #ff0000"; }
					}
				}

				e.Item.Attributes["onclick"] = "HighlightRow(this);";
			}
		}

		private DataGridColumn GetColumn(string sHeaderText, string sDataField, string sSortExpression)
		{
			BoundColumn oReturn = new BoundColumn();

			oReturn.DataField = sDataField;
			oReturn.HeaderText = sHeaderText;
			oReturn.SortExpression = sSortExpression;

			return oReturn;
		}

		private DataGridColumn GetColumn(string sHeaderText, string sDataField, string sSortExpression, string sURL, string sURLData)
		{
			HyperLinkColumn oReturn = new HyperLinkColumn();

			oReturn.DataNavigateUrlField = sURLData;
			oReturn.DataNavigateUrlFormatString = sURL;
			oReturn.DataTextField = sDataField;
			oReturn.HeaderText = sHeaderText;
			oReturn.SortExpression = sSortExpression;

			return oReturn;
		}
	}
}
