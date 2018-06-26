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

namespace StudyDesign
{
	public partial class EditConsents : System.Web.UI.Page
	{
		private HtmlTable tblVersionsForm;
		private DBLookup oDBLookup;
		private int nStudyID;

		private void Page_Load(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup();

			if (!Master.AutismLogin.CheckGroupPermissions("IT Staff Group".Split(',')))
			{
				tblMaster.Rows.Clear();
				tblMaster.Attributes["class"] = "";

				HtmlTableRow oTr = new HtmlTableRow();
				HtmlTableCell oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "error";
				oTd.InnerHtml = "You do not have permission to view this page.";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
			}
			else if (!IsPostBack)
			{
				Form.Attributes["onsubmit"] = "return(DoSubmitEditConsentForms(event));";

				nStudyID = Convert.ToInt32(Request["StudyID"].ToString());
				string sStudyName = oDBLookup.GetStudyName(nStudyID, false);

				oDBLookup.BindDropDownList(ref selConsentFormID, "EXEC spGetConsentFormsByStudyID " + nStudyID.ToString() + ", 0", "ConsentFormName", "ConsentFormID", "", "--Select a Consent Form--");
				oDBLookup.BindListBox(ref selGroupIDs, "EXEC spGetGroupsByStudyID " + nStudyID.ToString(), "GroupName", "GroupID", "");

				tdTitle.InnerHtml += " - " + sStudyName;
			}
			else
				nStudyID = Convert.ToInt32(hidStudyID.Value.ToString());

			hidStudyID.Value = nStudyID.ToString();
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			string sConsentFormID = selConsentFormID.SelectedValue;
			string[] aGroupIDs = Request[selGroupIDs.ClientID.Replace("_", "$")].ToString().Replace(", ", ",").Split(',');
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.CommandText = "spUpdateConsentForms";
			if (sConsentFormID == "-1")
				oCmd.Parameters.Add(new SqlParameter("@ConsentFormID", SqlDbType.Int, 4, ParameterDirection.InputOutput, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));
			else
				oCmd.Parameters.Add(new SqlParameter("@ConsentFormID", SqlDbType.Int, 4, ParameterDirection.InputOutput, true, 0, 0, "", DataRowVersion.Default, sConsentFormID));

			oCmd.Parameters.AddWithValue("@ConsentFormName", txtConsentFormName.Text);
			oCmd.Parameters.AddWithValue("@ConsentFormNameShort", txtConsentFormNameShort.Text);
			oCmd.Parameters.AddWithValue("@StudyID", hidStudyID.Value);
			oCmd.Parameters.AddWithValue("@IsActive", chkIsActive.Checked);
			oCmd.Parameters.AddWithValue("@AssignOnEntry", chkAssignOnEntry.Checked);

			oCmd.ExecuteNonQuery();

			sConsentFormID = oCmd.Parameters["@ConsentFormID"].Value.ToString();

			oCmd.CommandText = "spDeleteConsentFormGroupsRelationshipByConsentFormID";
			oCmd.Parameters.Clear();
			oCmd.Parameters.AddWithValue("@ConsentFormID", sConsentFormID);
			oCmd.ExecuteNonQuery();

			oCmd.CommandText = "spInsertConsentFormGroupRelationship";
			oCmd.Parameters.Add("@GroupID", SqlDbType.Int, 4);

			for (int i=0;i<aGroupIDs.Length;i++)
			{
				oCmd.Parameters["@GroupID"].Value = aGroupIDs[i];
				oCmd.ExecuteNonQuery();
			}

			if (Request["hidConsentFormVersionID"] != null)
			{
				string[] aConsentFormVersionIDs = Request["hidConsentFormVersionID"].ToString().Replace(", ", ",").Split(',');
				string[] aVersions = Request["txtVersion"].ToString().Replace(", ", ",").Split(',');
				string[] aConsentFormVersionNames = Request["txtConsentFormVersionName"].ToString().Replace(", ", ",").Split(',');
				string[] aApprovedDates = Request["txtApprovedDate"].ToString().Replace(", ", ",").Split(',');
				string[] aEffectiveDates = Request["txtEffectiveDate"].ToString().Replace(", ", ",").Split(',');
				string[] aEndingDates = Request["txtEndingDate"].ToString().Replace(", ", ",").Split(',');
				string[] aReasonsForChange = Request["txtReasonForChange"].ToString().Replace(", ", ",").Split(',');
				string[] aDataSharingNotes = Request["txtDataSharingNotes"].ToString().Replace(", ", ",").Split(',');

				oCmd.CommandText = "spUpdateConsentFormVersion";

				oCmd.Parameters.Clear();
				oCmd.Parameters.AddWithValue("@ConsentFormID", sConsentFormID);
				oCmd.Parameters.Add("@ConsentFormVersionID", SqlDbType.Int, 4);
				oCmd.Parameters.Add("@Version", SqlDbType.TinyInt, 1);
				oCmd.Parameters.Add("@ApprovedDate", SqlDbType.DateTime, 8);
				oCmd.Parameters.Add("@EffectiveDate", SqlDbType.DateTime, 8);
				oCmd.Parameters.Add("@EndingDate", SqlDbType.DateTime, 8);
				oCmd.Parameters.Add("@ConsentFormVersionName", SqlDbType.VarChar, 250);
				oCmd.Parameters.Add("@ReasonForChange", SqlDbType.VarChar, 500);
				oCmd.Parameters.Add("@DataSharingNotes", SqlDbType.VarChar, 500);

				for (int i=0;i<aConsentFormVersionIDs.Length;i++)
				{
					oCmd.Parameters["@ConsentFormVersionID"].Value = aConsentFormVersionIDs[i];
					oCmd.Parameters["@Version"].Value = aVersions[i];
					oCmd.Parameters["@ApprovedDate"].Value = aApprovedDates[i];
					oCmd.Parameters["@EffectiveDate"].Value = aEffectiveDates[i];
					oCmd.Parameters["@EndingDate"].Value = aEndingDates[i];
					oCmd.Parameters["@ConsentFormVersionName"].Value = aConsentFormVersionNames[i];
					oCmd.Parameters["@ReasonForChange"].Value = aReasonsForChange[i];
					oCmd.Parameters["@DataSharingNotes"].Value = aDataSharingNotes[i];

					if (oCmd.Parameters["@ConsentFormVersionID"].Value.ToString() == "-1" || oCmd.Parameters["@ConsentFormVersionID"].Value.ToString() == "") {oCmd.Parameters["@ConsentFormVersionID"].Value = DBNull.Value;}
					if (oCmd.Parameters["@ApprovedDate"].Value.ToString() == "") {oCmd.Parameters["@ApprovedDate"].Value = DBNull.Value;}
                    //if (oCmd.Parameters["@EffectiveDate"].Value.ToString() == "") { oCmd.Parameters["@EffectiveDate"].Value = DBNull.Value; }
                    if (oCmd.Parameters["@EndingDate"].Value.ToString() == "") { oCmd.Parameters["@EndingDate"].Value = DBNull.Value; }
					if (oCmd.Parameters["@ConsentFormVersionName"].Value.ToString() == "") {oCmd.Parameters["@ConsentFormVersionName"].Value = DBNull.Value;}
					if (oCmd.Parameters["@ReasonForChange"].Value.ToString() == "") {oCmd.Parameters["@ReasonForChange"].Value = DBNull.Value;}
					if (oCmd.Parameters["@DataSharingNotes"].Value.ToString() == "") {oCmd.Parameters["@DataSharingNotes"].Value = DBNull.Value;}

					oCmd.ExecuteNonQuery();
				}
			}

			selConsentFormID.Items.Clear();
			oDBLookup.BindDropDownList(ref selConsentFormID, "EXEC spGetConsentFormsByStudyID " + hidStudyID.Value + ", 0", "ConsentFormName", "ConsentFormID", sConsentFormID, "--Select a Consent Form--");
			ShowEditConsentForm(sender, e);
		}
		#endregion

		#region Add Consent Version
		protected void AddConsentVersion(object sender, System.EventArgs e)
		{
			ShowEditConsentForm(sender, e);

			btnAddConsentVersion.Style["display"] = "none";
			HtmlTableRow oTr;
			HtmlTableCell oTd;

			oTr = new HtmlTableRow();
			if (tblVersionsForm.Rows[tblVersionsForm.Rows.Count-1].Attributes["class"] != "trDark") {oTr.Attributes["class"] = "trDark";}

			oTd = new HtmlTableCell();
			oTd.Style["vertical-align"] = "top";
			oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
			oTd.InnerHtml = "<input type=\"text\" name=\"txtVersion\" value=\"\" style=\"width: 30px;\" />";
			oTd.InnerHtml += "<input type=\"hidden\" name=\"hidConsentFormVersionID\" value=\"\" />";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.Style["vertical-align"] = "top";
			oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
			oTd.InnerHtml = "<input type=\"text\" name=\"txtConsentFormVersionName\" value=\"\" style=\"width: 50px;\" />";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.Style["vertical-align"] = "top";
			oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
			oTd.InnerHtml = "<input type=\"text\" name=\"txtApprovedDate\" value=\"\" style=\"width: 65px;\" />";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.Style["vertical-align"] = "top";
			oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
			oTd.InnerHtml = "<input type=\"text\" name=\"txtEffectiveDate\" value=\"\" style=\"width: 65px;\" />";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.Style["vertical-align"] = "top";
			oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
			oTd.InnerHtml = "<input type=\"text\" name=\"txtEndingDate\" value=\"\" style=\"width: 65px;\" />";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.Style["vertical-align"] = "top";
			oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
			oTd.InnerHtml = "<textarea name=\"txtReasonForChange\" style=\"width: 240px;\" rows=\"2\"></textarea>";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.Style["vertical-align"] = "top";
			oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
			oTd.InnerHtml = "<textarea name=\"txtDataSharingNotes\" style=\"width: 240px;\" rows=\"2\"></textarea>";
			oTr.Cells.Add(oTd);

			tblVersionsForm.Rows.Add(oTr);
		}
		#endregion

		#region Show Edit Consent Form
		protected void ShowEditConsentForm(object sender, System.EventArgs e)
		{
			if (selConsentFormID.SelectedValue != "-1")
			{
				tblVersionsForm = new HtmlTable();
				HtmlTableRow oTr;
				HtmlTableCell oTd;
				bool bDisplayedHeader = false;
				bool bDoDark = false;

				for (int i=0;i<selGroupIDs.Items.Count;i++)
					selGroupIDs.Items[i].Selected = false;

				oDBLookup = new DBLookup();

				SqlCommand oCmd = new SqlCommand();
				oCmd.Connection = Master.SqlConn;
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;
				oCmd.CommandText = "spGetConsentFormVersionsByConsentFormID";
				oCmd.Parameters.Add(new SqlParameter("@ConsentFormID", selConsentFormID.SelectedValue));

				SqlDataReader oReader = oCmd.ExecuteReader();

				while (oReader.Read())
				{
					if (!bDisplayedHeader)
					{
						#region Display Header
						txtConsentFormName.Text = oReader["ConsentFormName"].ToString();
						txtConsentFormNameShort.Text = oReader["ConsentFormNameShort"].ToString();
						if (Convert.ToBoolean(oReader["IsActive"].ToString())) {chkIsActive.Checked = true;} else {chkIsActive.Checked = false;}
						if (Convert.ToBoolean(oReader["AssignOnEntry"].ToString())) {chkAssignOnEntry.Checked = true;} else {chkAssignOnEntry.Checked = false;}
						btnAddConsentVersion.Style["display"] = "inline";
						SelectListBoxItems(ref selGroupIDs, oDBLookup.GetGroupIDsByConsentFormID(Convert.ToInt32(selConsentFormID.SelectedValue)).Split(','));

						oTr = new HtmlTableRow();

						oTd = new HtmlTableCell();
						oTr.Attributes["class"] = "trTitle";
						oTd.ColSpan = 7;
						oTd.InnerHtml = "Versions of " + oReader["ConsentFormName"].ToString();
						oTr.Cells.Add(oTd);
						
						tblVersionsForm.Rows.Add(oTr);

						tblVersionsForm.Attributes["class"] = "tblInput";
						tblVersionsForm.CellSpacing = 0;
						tblVersionsForm.Style["width"] = "100%";
						tblVersionsForm.Style["margin"] = "0px";

						oTr = new HtmlTableRow();

						oTd = new HtmlTableCell();
						oTd.Attributes["class"] = "tdHeaderAlt";
						oTd.InnerHtml = "Version";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Attributes["class"] = "tdHeaderAlt";
						oTd.InnerHtml = "Name";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Attributes["class"] = "tdHeaderAlt";
						oTd.InnerHtml = "Approved";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Attributes["class"] = "tdHeaderAlt";
						oTd.InnerHtml = "Effective";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Attributes["class"] = "tdHeaderAlt";
						oTd.InnerHtml = "End Date";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Attributes["class"] = "tdHeaderAlt";
						oTd.InnerHtml = "Reason for Change";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Attributes["class"] = "tdHeaderAlt";
						oTd.InnerHtml = "Data Sharing Notes";
						oTr.Cells.Add(oTd);

						tblVersionsForm.Rows.Add(oTr);

						bDisplayedHeader = true;
						#endregion
					}

					#region Display Consent Form Versions
					oTr = new HtmlTableRow();
					if (bDoDark) {oTr.Attributes["class"] = "trDark";}

					oTd = new HtmlTableCell();
					oTd.Style["vertical-align"] = "top";
					oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
					oTd.InnerHtml = "<input type=\"text\" name=\"txtVersion\" value=\"" + oReader["Version"].ToString() + "\" style=\"width: 30px;\" />";
					oTd.InnerHtml += "<input type=\"hidden\" name=\"hidConsentFormVersionID\" value=\"" + oReader["ConsentFormVersionID"].ToString() + "\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["vertical-align"] = "top";
					oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
					oTd.InnerHtml = "<input type=\"text\" name=\"txtConsentFormVersionName\" value=\"" + oReader["ConsentFormVersionName"].ToString() + "\" style=\"width: 50px;\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["vertical-align"] = "top";
					oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
					oTd.InnerHtml = "<input type=\"text\" name=\"txtApprovedDate\" value=\"" + oReader["ApprovedDate"].ToString() + "\" style=\"width: 65px;\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["vertical-align"] = "top";
					oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
					oTd.InnerHtml = "<input type=\"text\" name=\"txtEffectiveDate\" value=\"" + oReader["EffectiveDate"].ToString() + "\" style=\"width: 65px;\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["vertical-align"] = "top";
					oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
					oTd.InnerHtml = "<input type=\"text\" name=\"txtEndingDate\" value=\"" + oReader["EndingDate"].ToString() + "\" style=\"width: 65px;\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["vertical-align"] = "top";
					oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
					oTd.InnerHtml = "<textarea name=\"txtReasonForChange\" style=\"width: 240px;\" rows=\"2\">" + oReader["ReasonForChange"].ToString() + "</textarea>";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["vertical-align"] = "top";
					oTd.Style["border-bottom"] = "solid 1px #a1b5cf";
					oTd.InnerHtml = "<textarea name=\"txtDataSharingNotes\" style=\"width: 240px;\" rows=\"2\">" + oReader["DataSharing_Notes"].ToString() + "</textarea>";
					oTr.Cells.Add(oTd);

					tblVersionsForm.Rows.Add(oTr);

					bDoDark = !bDoDark;
					#endregion
				}
				
				tdVersionsForm.Controls.Add(tblVersionsForm);

				oReader.Close();
			}
			else
			{
				txtConsentFormName.Text = "";
				txtConsentFormNameShort.Text = "";
				btnAddConsentVersion.Style["display"] = "none";
			}
		}
		#endregion

		private void SelectListBoxItems(ref ListBox oListBox, string[] aItemIDs)
		{
			foreach (ListItem oItem in oListBox.Items)
			{
				for (int i=0;i<aItemIDs.Length;i++)
				{
					if (oItem.Value == aItemIDs[i])
					{
						oItem.Selected = true;
						break;
					}
				}
			}
		}
	}
}