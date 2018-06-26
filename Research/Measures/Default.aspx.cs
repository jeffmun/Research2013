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

namespace Measures
{
	public partial class _default : System.Web.UI.Page
	{
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
            //DF: 4/12 add app path
            string ap = Request.ApplicationPath;

			Form.Attributes["onsubmit"] = "return(DoSubmitSearch());";

			oDBLookup = new DBLookup(Master.SqlConn);

			int nStudyID = 0;
			int nStudyActionID = 0;
			int nStudyMeasureID = 0;
			int nConsentFormID = 0;
			int nActionID = 0;
			int nSubjectID = 0;
			int nStudyMeasSubjID = 0;
			int nSubjConsentID = 0;
			string sSearchType;
			string sSubjectID;
			string sSortField;

			if (!IsPostBack)
			{
				HtmlGenericControl oBody = (HtmlGenericControl)Master.FindControl("oBody");
				oBody.Attributes["onload"] = "CheckStatus(false);";
                oDBLookup.BindDropDownList(ref selStudyID, "EXEC spSEC_GetStudies_CanView_by_User__Short_and_FullName", "StudyName", "StudyID", "", "--Select a Study--");

				selStudyID.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, null, 'studyactions', 'selStudyActionID'); DoSyncDropDowns(this.options[this.selectedIndex].value, null, 'studymeasures', 'selStudyMeasureID'); DoSyncDropDowns(this.options[this.selectedIndex].value, null, 'consentformsnoversions', 'selConsentFormID'); ";
				tdActionID.InnerHtml = "<label for=\"selStudyActionID\">Action</label><br/><select name=\"selStudyActionID\" id=\"selStudyActionID\" style=\"width: 400px;\"></select>";
				tdMeasureID.InnerHtml = "<label for=\"selStudyMeasureID\">Measure</label><br/><select name=\"selStudyMeasureID\" id=\"selStudyMeasureID\" style=\"width: 400px;\"></select>";
				tdConsentFormID.InnerHtml = "<label for=\"selConsentFormID\">Consent Forms</label><br/><select name=\"selConsentFormID\" id=\"selConsentFormID\" style=\"width: 400px;\"><option value=\"-1\">--Select Item--</option></select>";
			}
			else
			{
				if (radSearchTypeSubject.Checked)
					sSearchType = "S";
				else if (radSearchTypeAction.Checked)
					sSearchType = "A";
				else if (radSearchTypeMeas.Checked)
					sSearchType = "M";
				else if (radSearchTypeConsent.Checked)
					sSearchType = "C";
				else
					sSearchType = "";

				sSubjectID = txtSubjID.Text;
				nStudyID = Convert.ToInt32(selStudyID.SelectedValue);

				if (Request["selStudyActionID"] != "") {nStudyActionID = Convert.ToInt32(Request["selStudyActionID"]);}
				if (Request["selStudyMeasureID"] != "") {nStudyMeasureID = Convert.ToInt32(Request["selStudyMeasureID"]);}
				if (Request["selConsentFormID"] != "") {nConsentFormID = Convert.ToInt32(Request["selConsentFormID"]);}

				nSubjectID = oDBLookup.GetSubjIDFromID(sSubjectID, nStudyID);
				nActionID = oDBLookup.GetActionIDFromIDAndStudyActionID(nStudyID, sSubjectID, nStudyActionID);
				nStudyMeasSubjID = oDBLookup.GetStudyMeasSubjIDFromStudyMeasIDAndSubjID(nStudyID, sSubjectID, nStudyMeasureID);
				nSubjConsentID = oDBLookup.GetSubjConsentIDFromSubjIDAndConsentFormID(sSubjectID, nStudyID, nConsentFormID);

				if (sSearchType == "S")
				{
					radSearchTypeSubject.Checked = true;

					if (sSubjectID.Trim() != "")
						Response.Redirect(ap + "/Measures/EditSubject.aspx?SubjID=" + oDBLookup.GetSubjIDFromID(sSubjectID, nStudyID), false);
					else
						Response.Redirect(ap + "/Measures/SubjectsByStudy.aspx?StudyID=" + nStudyID.ToString(), false);
				}
				else if (sSearchType == "A")
				{
					radSearchTypeAction.Checked = true;

					if (sSubjectID.Trim() != "" && nStudyActionID > 0)
					{
						if (nActionID > 0)
							Response.Redirect(ap + "/Measures/EditAction.aspx?ActionID=" + nActionID.ToString(), false);
						else
							InsertErrorMessage("The Action you selected was not found for the Subject you entered.");
					}
					else if (sSubjectID.Trim() != "")
					{
						if (nSubjectID > 0)
							Response.Redirect(ap + "/Measures/ActionsBySubject.aspx?SubjectID=" + nSubjectID.ToString(), false);
						else
							InsertErrorMessage("The Subject you entered was not found.");
					}
					else if (nStudyActionID > 0)
						Response.Redirect(ap + "/Measures/SubjectsByAction.aspx?StudyActionID=" + nStudyActionID.ToString(), false);
				}
				else if (sSearchType == "M")
				{
					radSearchTypeMeas.Checked = true;

					if (sSubjectID.Trim() != "" && nStudyMeasureID > 0)
					{
						if (nStudyMeasSubjID > 0)
							Response.Redirect(ap + "/Measures/EditMeasure.aspx?StudyMeasSubjID=" + nStudyMeasSubjID.ToString(), false);
						else
							InsertErrorMessage("The Measure you selected was not found for the Subject you entered.");
					}
					else if (sSubjectID.Trim() != "")
					{
						if (nSubjectID > 0)
							Response.Redirect(ap + "/Measures/MeasuresBySubject.aspx?SubjectID=" + nSubjectID.ToString(), false);
						else
							InsertErrorMessage("The Subject you entered was not found.");
					}
					else if (nStudyMeasureID > 0)
						Response.Redirect(ap + "/Measures/SubjectsByMeasure.aspx?StudyMeasID=" + nStudyMeasureID.ToString(), false);
				}
				else if (sSearchType == "C")
				{
					radSearchTypeConsent.Checked = true;

					if (sSubjectID.Trim() != "" && nSubjConsentID > 0)
					{
						if (nSubjConsentID > 0)
							Response.Redirect(ap + "/Measures/EditConsentForm.aspx?SubjConsentID=" + nSubjConsentID.ToString(), false);
						else
							InsertErrorMessage("The Measure you selected was not found for the Subject you entered.");
					}
					else if (sSubjectID.Trim() != "")
					{
						if (nSubjectID > 0)
							Response.Redirect(ap + "/Measures/ConsentsBySubject.aspx?SubjectID=" + nSubjectID.ToString(), false);
						else
							InsertErrorMessage("The Subject you entered was not found.");
					}
					else if (nConsentFormID > 0)
						Response.Redirect(ap + "/Measures/SubjectsByConsent.aspx?ConsentFormID=" + nConsentFormID.ToString(), false);
				}
			}
		}

		private void InsertErrorMessage(string sErrMsg)
		{
			HtmlTableRow oTr = new HtmlTableRow();
			HtmlTableCell oTd = new HtmlTableCell();

			oTd.InnerHtml = "<span class=\"error\">" + sErrMsg + "</span>";
			oTd.ColSpan = 2;

			oTr.Cells.Add(oTd);
			tblMaster.Rows.Insert(1, oTr);
		}
	}
}