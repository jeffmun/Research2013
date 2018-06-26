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
	public partial class ConsentsBySubject : System.Web.UI.Page
	{
		private TextFormatter oFormat = new TextFormatter();
		private SqlCommand oCmd;
		private SqlDataAdapter oAdapter;
		private DataTable oTable;
		private DBLookup oDBLookup;
		private int nSubjectID = 0;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitConsentsBySubject(event));";
			oDBLookup = new DBLookup();

			int nSubjID;
			int nStudyID;
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;
			HtmlTableRow oTr;
			HtmlTableCell oTd;
			HtmlTableCell tdConsentItems = new HtmlTableCell();
			bool bDoDark = false;
			string sCFVID = "";
			int nCount = 0;
            DateTime itemdate = new DateTime();
            string n = "";

			if (IsPostBack)
				nSubjID = Convert.ToInt32(oDBLookup.GetSubjIDFromID(Request["txtID"].ToString(), Convert.ToInt32(Request["selStudyID"].ToString())));
			else
				nSubjID = Convert.ToInt32(Request["SubjectID"].ToString());

			nStudyID = oDBLookup.GetStudyIDBySubjID(nSubjID);
			hidSubjID.Value = nSubjID.ToString();
			hidStudyID.Value = nStudyID.ToString();
			tdTitle.InnerHtml = "Consent Forms for " + oDBLookup.GetIDBySubjID(nSubjID, true);

			#region Get Info From db
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetConsentFormsBySubjID2";

			oCmd.Parameters.Add(new SqlParameter("@SubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nSubjID));

			oReader = oCmd.ExecuteReader();
			#endregion

			while (oReader.Read())
			{
				#region Display Data Items
				if (sCFVID != oReader["ConsentFormVersionID"].ToString())
				{
					oTr = new HtmlTableRow();
					oTr.Attributes["onclick"] = "HighlightRow(this); HighlightRow(document.getElementById('tr" + oReader["SubjConsentID"].ToString() + "'));";
					if (bDoDark) {oTr.Attributes["class"] = "trDark";}

					oTd = new HtmlTableCell();
					oTd.EnableViewState = false;
					oTd.InnerHtml = "<input type=\"checkbox\" name=\"chkConsentToEdit\" id=\"chkConsentToEdit" + oReader["SubjConsentID"].ToString() + "\" value=\"" + oReader["SubjConsentID"].ToString() + "\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.EnableViewState = false;
					oTd.InnerHtml = "<a href=\"" + Request.ApplicationPath + "/Measures/EditConsentForm.aspx?SubjConsentID=" + oReader["SubjConsentID"].ToString() + "\">" + oFormat.FormatDBOutput(oReader["ConsentFormName"].ToString()) + "</a>";
					if (oReader["Notes"].ToString() != "")
					{
						oTd.InnerHtml += " <a href=\"javascript:ShowTableRow('tr" + oReader["SubjConsentID"].ToString() + "');\" class=\"smalltext\">(Notes)</a>";
					}
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.EnableViewState = false;
					oTd.InnerHtml = oFormat.FormatDBOutput(oReader["Version"].ToString());
					oTr.Cells.Add(oTd);

                    oTd = new HtmlTableCell();
                    oTd.EnableViewState = false;
                    oTd.InnerHtml = oFormat.FormatDBOutput(oReader["ConsentApproved"].ToString());
                    oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.EnableViewState = false;
					oTd.InnerHtml = oFormat.FormatDBOutput(oReader["DateSigned"].ToString()) + " " + oFormat.FormatDBOutput(oReader["TimeSigned"].ToString());
					oTr.Cells.Add(oTd);

                    oTd = new HtmlTableCell();
                    oTd.EnableViewState = false;
                    oTd.InnerHtml = oFormat.FormatDBOutput(oReader["ConsentStatusShort"].ToString());
                    oTr.Cells.Add(oTd);

					tdConsentItems = new HtmlTableCell();
					tdConsentItems.EnableViewState = false;

                    //if (oReader["IsConsented"].ToString() == "1")
                    //    tdConsentItems.InnerHtml = "<span style=\"color: #008800;\">" + oFormat.FormatDBOutput(oReader["ConsentItemText"].ToString()) + "</span>";
                    //else
                    //    tdConsentItems.InnerHtml = "<span style=\"color: #ff0000;\">" + oFormat.FormatDBOutput(oReader["ConsentItemText"].ToString()) + "</span>";

                    string s = oReader["ConsentItemText"].ToString() + " " + oReader["optiontext"].ToString() + " ";
                    if (DateTime.TryParse(oReader["ItemDateSigned"].ToString(), out itemdate))
                        s = s + itemdate.ToString("MM/dd/yyyy");
                    s = s + " " + oReader["ItemTimeSigned"].ToString();
                    n = oReader["SubjConsentItemNotes"].ToString();
                    if (n.Trim() != "") s = s + "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + n;
                    if (s.Trim() == "") s = "&nbsp;"; //hack to fix missing border around empty table cell
                    tdConsentItems.InnerHtml = s;

					oTr.Cells.Add(tdConsentItems);

					tblMaster.Rows.Insert(tblMaster.Rows.Count-2, oTr);

					if (oReader["Notes"].ToString() != "")
					{
						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTd.EnableViewState = false;
						if (bDoDark) {oTr.Attributes["class"] = "trDark";}
						oTr.Style["display"] = "none";
						oTr.Attributes["id"] = "tr" + oReader["SubjConsentID"].ToString();
						oTd.ColSpan = 7;
						oTd.InnerHtml = oReader["Notes"].ToString();
						oTr.Cells.Add(oTd);
						tblMaster.Rows.Insert(tblMaster.Rows.Count-2, oTr);
					}

					bDoDark = !bDoDark;
					nCount++;
					sCFVID = oReader["ConsentFormVersionID"].ToString();
				}
				else
				{
                    tdConsentItems.InnerHtml += "<br/>" + oReader["ConsentItemText"].ToString() + " " + oReader["optiontext"].ToString() + " ";
                    if (DateTime.TryParse(oReader["ItemDateSigned"].ToString(), out itemdate))
                        tdConsentItems.InnerHtml += itemdate.ToString("MM/dd/yyyy");
                    tdConsentItems.InnerHtml += " " + oReader["ItemTimeSigned"].ToString();
                    n = oReader["SubjConsentItemNotes"].ToString();
                    if (n.Trim() != "") tdConsentItems.InnerHtml += "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + n;
				}
				#endregion
			}

			oReader.Close();

			tdTitle.InnerHtml += "<br/><div class=\"DoNotPrint\" style=\"font-size: 8pt;\">";
			tdTitle.InnerHtml += "<a href=\"" + Request.ApplicationPath + "/Measures/ActionsBySubject.aspx?SubjectID=" + nSubjID.ToString() + "\">View Actions</a>";
			tdTitle.InnerHtml += " | <a href=\"" + Request.ApplicationPath + "/Measures/MeasuresBySubject.aspx?SubjectID=" + nSubjID.ToString() + "\">View Measures</a>";
			tdTitle.InnerHtml += " | <a href=\"" + Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + oDBLookup.GetHouseholdIDBySubjID(nSubjID) + "\">View Household</a><br/>";
			tdTitle.InnerHtml += oDBLookup.BindDropDownList("selStudyID", "EXEC spGetActiveStudies", "StudyName", "StudyID", oDBLookup.GetStudyIDBySubjID(nSubjID).ToString(), "--Study--", "font-size: 7pt;");
			tdTitle.InnerHtml += "<input type=\"text\" name=\"txtID\" value=\"" + oDBLookup.GetIDBySubjID(nSubjID) + "\" style=\"font-size: 7pt; width: 50px;\" />";
			tdTitle.InnerHtml += "<input type=\"submit\" name=\"btnSubmit\" value=\"Update\" style=\"font-size: 7pt;\" />";
			tdTitle.InnerHtml += "</div>";

			tdTitle.InnerHtml += "<span class=\"verysmalltext\">" + DateTime.Now.ToString("MM/dd/yyyy hh:mm tt") + " - " + nCount.ToString() + " Records</span>";
		}
	}
}