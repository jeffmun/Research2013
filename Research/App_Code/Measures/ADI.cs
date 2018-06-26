using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;

namespace AutismCenterBase.Measures
{
	public class ADI
	{
		private string sSubjID;
		private Studies nStudy;
		private TextFormatter oFormatter = new TextFormatter();

		private string ConvertToYesNo(string sVal)
		{
			string sRetval = string.Empty;
			if (sVal == "-1" || sVal == "1" )
				sRetval = "Yes";
			else if (sVal == "0")
				sRetval = "No";
			return sRetval;
		}

		public bool RenderADIToddlerReport(ref HtmlTable tblMaster)
		{
			if (this.sSubjID == null)
				return false;

			SqlDataReader oReader = GetData(this.sSubjID);

			if (oReader.HasRows)
			{
				oReader.Read();
				HtmlTableRow oTr;
				HtmlTableCell oTd;
				HtmlTable tblInner;
				HtmlTableRow trInner;
				HtmlTableCell tdInner;

				tblMaster.Rows.Clear();
				tblMaster.Attributes["class"] = "tblNonTableReport";

				#region First Major Row of Report
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.ColSpan = 2;

				tblInner = new HtmlTable();
				tblInner.Style["width"] = " 100%";
				tblInner.CellSpacing = 0;
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.Attributes["class"] = "tdTitle";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				tdInner.Style["border-right"] = " solid 1px #000000";
				tdInner.InnerHtml = "ADI (Toddler Version)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Subject ID:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["ID"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Date of ADI:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = Convert.ToDateTime(oReader["Addate"].ToString()).ToShortDateString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Age (y:m):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["ADageym"].ToString() + " (" + oReader["ADagemos"].ToString() + ")";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Verified:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["verified"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Study:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["ADStudy"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Interviewer:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["ADint"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Subject DOB:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				if (oReader["AdDOB"].ToString() != "") {tdInner.InnerHtml = Convert.ToDateTime(oReader["AdDOB"].ToString()).ToShortDateString();} else {tdInner.InnerHtml = "&nbsp;";}
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 3;
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Date Algorithm report printed:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = DateTime.Today.ToString("MM/dd/yyyy");
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				oTd.Controls.Add(tblInner);
				oTd.Style["border-bottom"] = " solid 3px #000000";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
				#endregion

				#region Second Major Row of Report
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.ColSpan = 2;

				tblInner = new HtmlTable();
				tblInner.Style["width"] = " 100%";
				tblInner.CellSpacing = 0;
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 15%";
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Scoring Errors:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				//tdInner.InnerHtml = oReader["scorcmnt"].ToString();
				tdInner.InnerText = oReader["scorcmnt"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				oTd.Controls.Add(tblInner);
				oTd.Style["border-bottom"] = " solid 3px #000000";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
				#endregion

				#region Third Major Row of Report
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.ColSpan = 2;

				tblInner = new HtmlTable();
				tblInner.Style["width"] = " 100%";
				tblInner.CellSpacing = 0;
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.Style["border"] = " solid 1px #000000";
				tdInner.Style["font-size"] = " 12pt";
				tdInner.Style["font-weight"] = " bold";
				tdInner.Style["padding"] = " 8px";
				tdInner.InnerHtml = "ADI Dx: " + oReader["adidx"];
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["font-size"] = " 12pt";
				tdInner.Style["font-weight"] = " bold";
				tdInner.Style["padding"] = " 8px";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "&nbsp;"; //"UW ADI Dx: ";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["font-size"] = " 12pt";
				tdInner.Style["font-weight"] = " bold";
				tdInner.Style["padding"] = " 8px";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "&nbsp;"; //oReader["prelimdx"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["font-weight"] = "bold";
				tdInner.Style["vertical-align"] = "middle";
				tdInner.InnerHtml = "Section:<br/>Total:<br/>Cutoff met?:<br/>";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml = "<b>Social</b><br/>";
				tdInner.InnerHtml += "<u>" + oReader["SocialSum"].ToString() + "</u><br/>";
				tdInner.InnerHtml += ConvertToYesNo(oReader["autSocialCutoff"].ToString()) + "<br/>";
				tdInner.InnerHtml += "(>=10)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml = "<b>Communication</b><br/>";
				tdInner.InnerHtml += "<u>" + oReader["CommLevel"].ToString() + " " + oReader["CommSum"].ToString() + "</u><br/>";
				tdInner.InnerHtml += ConvertToYesNo(oReader["autCommCutoff"].ToString()) + "<br/>";
				tdInner.InnerHtml += "(V>=8, NV >=7)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml = "<b>Repetitive Bx</b><br/>";
				tdInner.InnerHtml += "<u>" + oReader["RepetSum"].ToString() + "</u><br/>";
				tdInner.InnerHtml += ConvertToYesNo(oReader["autRepetCutoff"].ToString()) + "<br/>";
				tdInner.InnerHtml += "(>=3)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml = "<b>Abnormality evident before 36 mos?</b><br/>";
				tdInner.InnerHtml += "<u>" + oReader["autabdevsum"].ToString() + "</u><br/>";
				tdInner.InnerHtml += ConvertToYesNo(oReader["autabdev"].ToString()) + "<br/>(>=1)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);


				tblInner.Rows.Add(trInner);


				oTd.Controls.Add(tblInner);
				oTd.Style["border-bottom"] = " solid 3px #000000";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
				#endregion

				#region Fourth Major Row of Report
				oTr = new HtmlTableRow();

				#region Left Side Cell
				//Begin Left Side Cell
				oTd = new HtmlTableCell();
				oTd.Style["width"] = " 50%";

				tblInner = new HtmlTable();
				tblInner.Style["width"] = " 100%";
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b><u>Social</u></b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.Style["border"] = " solid 1px #000000";
				tdInner.InnerHtml = "*Items not labeled use the " + oReader["itemsused"] + " scores.";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>b1: " + oReader["b1"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "66. Direct gaze";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["66use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "67. Social smiling";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["67use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "76. Range of facial expr used to comm";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["76use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();


				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>b2: " + oReader["b2"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "91. Interest in children";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["91use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "92. Response to other children's approaches";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["92use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>b3: " + oReader["b3"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "69. Showing and directing attention";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["69use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "70. Offering to share";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["70use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "71. Seeking to share own enjoyment with others";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["71use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>b4: " + oReader["b4"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "12. Use of other's body to commun. (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["12use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);


				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "73. Offers comfort";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["73use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "75. Quality of social overtures";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["75use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "77. Inappropriate facial expression (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["77use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "80. Appropriateness of social responses";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["80use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 3;
				tdInner.InnerHtml = "<b><u>Communication</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>c1: " + oReader["c1"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "50. Pointing to express interest";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["50use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "53. Conventional instrumental gesture";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["53use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "51. Nodding";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["51use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "52. Head shaking";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["52use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>c2: " + oReader["c2"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "56. Spontaneous imitation of actions";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["56use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "88. Imaginitive play";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["88use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "90. Imitative social play";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["90use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>c2v: " + oReader["c2v"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "13. Social vocalization / chat (current)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["13use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "65. Reciprocal conversation (current)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["65use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>c3v: " + oReader["c3v"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "59. Stereotyped utterances (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["59use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "61. Pronominal reversal (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["61use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "62. Neologisms/Idiosyncratic language (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["62use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				oTd.Controls.Add(tblInner);
				oTr.Cells.Add(oTd);
				//End Left Side Cell
				#endregion

				#region Right Side Cell
				//Begin Right Side Cell
				oTd = new HtmlTableCell();
				oTd.Style["width"] = " 50%";
				oTd.InnerHtml = "&nbsp;<br/>";
				oTr.Controls.Add(oTd);

				tblInner = new HtmlTable();
				tblInner.Style["width"] = " 100%";

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 5;
				tdInner.InnerHtml = "<b><u>Repetitive Behavior</u></b>";

				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 20%";
				tdInner.InnerHtml = "<b>d1: " + oReader["d1"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "93. Unusual preoccupations (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>" + oReader["93use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>d2: " + oReader["d2"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "63. Verbal rituals (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>" + oReader["63use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "96. Compulsions/Rituals (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>" + oReader["96use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["vertical-align"] = "top";
				tdInner.InnerHtml = "<b>d3: " + oReader["d3"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "104. Hand and finger mannerisms <br/><br/><b>OR (score higher)</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>" + oReader["104use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "106. Other complex mannerisms (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>" + oReader["106use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["vertical-align"] = "top";
				tdInner.InnerHtml = "<b>d4: " + oReader["d4"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "95. Repetitive use of objects (ever) <br/><br/><b>OR (score higher)</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["95use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "97. Unusual sensory interests (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["97use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 5;
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 5;
				tdInner.InnerHtml = "<b><u>Abnormality of development evident at or before 36 months</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "Age parents 1st noticed (if < 36 mos, score 1)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["AD002"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = "(2):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["2r"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "Age when abnormally 1st evident (if 3 or 4, score 1)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["AD121"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = "(121):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["121r"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "Intvwr's judgement on age manifest (if < 36 mos, score 1)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["AD122mo"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = "(122):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["122r"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "Age at 1st single words (if > 24 mos, score 1)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["AD016desc"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = "(16):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["16r"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "Age 1st phases (if > 33 mos, score 1)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["AD020desc"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = "(20):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["20r"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);


				/*

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 5;
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b><u>Loss of Skills</b></u>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b><u>Before 5</b></u>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>After 5</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of skills?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD095be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD095af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of skills due to illness?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD096be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD096af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of skills in communication?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD097be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD097af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of social interest/responsiveness?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD098be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD098af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of play and imagination?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD099be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD099af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of adaptive skills?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD100be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD100af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of preacad, acad, or voc. skills?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD101be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD101af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of motor skills?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD102be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD102af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Age when main loss of skills apparent";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 3;
				tdInner.InnerHtml = oReader["AD103"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				
				*/

				oTd.Controls.Add(tblInner);
				//End Right Side Cell
				#endregion

				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
				#endregion

				return true;
			}
			else
				return false;
		}




		public bool RenderADIWPSReport(ref HtmlTable tblMaster)
		{
			if (this.sSubjID == null)
				return false;

			SqlDataReader oReader = GetData(this.sSubjID);

			if (oReader.HasRows)
			{
				oReader.Read();
				HtmlTableRow oTr;
				HtmlTableCell oTd;
				HtmlTable tblInner;
				HtmlTableRow trInner;
				HtmlTableCell tdInner;

				tblMaster.Rows.Clear();
				tblMaster.Attributes["class"] = "tblNonTableReport";

				#region First Major Row of Report
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.ColSpan = 2;

				tblInner = new HtmlTable();
				tblInner.Style["width"] = " 100%";
				tblInner.CellSpacing = 0;
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.Attributes["class"] = "tdTitle";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				tdInner.Style["border-right"] = " solid 1px #000000";
				tdInner.InnerHtml = "ADI-R (WPS Version)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Subject ID:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["ID"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Date of ADI:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = Convert.ToDateTime(oReader["Addate"].ToString()).ToShortDateString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Age (y:m):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["ADageym"].ToString() + " (" + oReader["ADagemos"].ToString() + ")";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Verified:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["verified"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Study:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["ADStudy"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Interviewer:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["ADint"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Subject DOB:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				if (oReader["AdDOB"].ToString() != "") {tdInner.InnerHtml = Convert.ToDateTime(oReader["AdDOB"].ToString()).ToShortDateString();} else {tdInner.InnerHtml = "&nbsp;";}
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 3;
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Date Algorithm report printed:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = DateTime.Today.ToString("MM/dd/yyyy");
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				oTd.Controls.Add(tblInner);
				oTd.Style["border-bottom"] = " solid 3px #000000";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
				#endregion

				#region Second Major Row of Report
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.ColSpan = 2;

				tblInner = new HtmlTable();
				tblInner.Style["width"] = " 100%";
				tblInner.CellSpacing = 0;
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 15%";
				tdInner.Attributes["class"] = "tdHeader";
				tdInner.InnerHtml = "Scoring Errors:";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				//tdInner.InnerHtml = oReader["scorcmnt"].ToString();
				tdInner.InnerText = oReader["scorcmnt"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				oTd.Controls.Add(tblInner);
				oTd.Style["border-bottom"] = " solid 3px #000000";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
				#endregion

				#region Third Major Row of Report
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.ColSpan = 2;

				tblInner = new HtmlTable();
				tblInner.Style["width"] = " 100%";
				tblInner.CellSpacing = 0;
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.Style["border"] = " solid 1px #000000";
				tdInner.Style["font-size"] = " 12pt";
				tdInner.Style["font-weight"] = " bold";
				tdInner.Style["padding"] = " 8px";
				tdInner.InnerHtml = "ADI Dx: " + oReader["adidx"];
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["font-size"] = " 12pt";
				tdInner.Style["font-weight"] = " bold";
				tdInner.Style["padding"] = " 8px";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["font-size"] = " 12pt";
				tdInner.Style["font-weight"] = " bold";
				tdInner.Style["padding"] = " 8px";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["font-weight"] = "bold";
				tdInner.Style["vertical-align"] = "top";
				tdInner.InnerHtml = "Section:<br/>Total:<br/>Cutoff met?:<br/>";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml = "<b>A. Social</b><br/>";
				tdInner.InnerHtml += "<u>" + oReader["SocialSum"].ToString() + "</u><br/>";
				tdInner.InnerHtml += ConvertToYesNo(oReader["autSocialCutoff"].ToString()) + "<br/>";
				tdInner.InnerHtml += "(>=10)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml = "<b>B. Communication</b><br/>";
				tdInner.InnerHtml += "<u>" + oReader["CommLevel"].ToString() + " " + oReader["CommSum"].ToString() + "</u><br/>";
				tdInner.InnerHtml += ConvertToYesNo(oReader["autCommCutoff"].ToString()) + "<br/>";
				tdInner.InnerHtml += "(V>=8, NV >=7)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml = "<b>C. Repetitive Bx</b><br/>";
				tdInner.InnerHtml += "<u>" + oReader["RepetSum"].ToString() + "</u><br/>";
				tdInner.InnerHtml += ConvertToYesNo(oReader["autRepetCutoff"].ToString()) + "<br/>";
				tdInner.InnerHtml += "(>=3)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml = "<b>D. Abnormality evident before 36 mos?</b><br/>";
				tdInner.InnerHtml += "<u>" + oReader["autabdevsum"].ToString() + "</u><br/>";
				tdInner.InnerHtml += ConvertToYesNo(oReader["autabdev"].ToString()) + "<br/>(>=1)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				/*
				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml = "<b>Meets Criteria?</b><br/>";
				tdInner.InnerHtml += "<u><b>" + ConvertToYesNo(oReader["autCriteria"].ToString()) + "</b></u><br/>";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);
				*/

				tblInner.Rows.Add(trInner);


				/*
				 
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["font-weight"] = "bold";
				tdInner.Style["vertical-align"] = "middle";
				tdInner.InnerHtml = "Asperger's";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml += ConvertToYesNo(oReader["aspSocialCutoff"].ToString()) + "<br/>";
				tdInner.InnerHtml += "(>=10)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml += "(no cutoff for<br/>communication)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml += ConvertToYesNo(oReader["aspRepetCutoff"].ToString()) + "<br/>";
				tdInner.InnerHtml += "(>=3)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml += "<u><b>" + ConvertToYesNo(oReader["aspCriteria"].ToString()) + "</b></u><br/>";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml += "IQ >= 85?<br/>";
				tdInner.InnerHtml += "Evident before 36 mos? (see below) <b><u>" + ConvertToYesNo(oReader["aspabdev"].ToString()) + "</b></u><br/>";
				tdInner.InnerHtml += "1st words < 24 mos? <b><u>" + ConvertToYesNo(oReader["12yn"].ToString()) + " " + oReader["AD012desc"].ToString() + "</b></u><br/>";
				tdInner.InnerHtml += "1st phrases < 33 mos? <b><u>" + ConvertToYesNo(oReader["13yn"].ToString()) + " " + oReader["AD013desc"].ToString() + "</b></u><br/>";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["vertical-align"] = "middle";
				tdInner.InnerHtml = "<b>PPD</b><br/>[Soc & (Com or Rep)]";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml += ConvertToYesNo(oReader["pddSocialCutoff"].ToString()) + "<br/>";
				tdInner.InnerHtml += "(>=7)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml += ConvertToYesNo(oReader["pddCommCutoff"].ToString()) + "<br/>";
				tdInner.InnerHtml += "(V>=6, NV >=5)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml += ConvertToYesNo(oReader["pddRepetCutoff"].ToString()) + "<br/>";
				tdInner.InnerHtml += "(>=2)";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "center";
				tdInner.InnerHtml += "<u><b>" + ConvertToYesNo(oReader["pddCriteria"].ToString()) + "</b></u><br/>";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml += "&nbsp;";
				tdInner.Style["border-bottom"] = " solid 1px #000000";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				*/


				oTd.Controls.Add(tblInner);
				oTd.Style["border-bottom"] = " solid 3px #000000";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
				#endregion

				#region Fourth Major Row of Report
				oTr = new HtmlTableRow();

				#region Left Side Cell
				//Begin Left Side Cell
				oTd = new HtmlTableCell();
				oTd.Style["width"] = " 50%";

				tblInner = new HtmlTable();
				tblInner.Style["width"] = " 100%";
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b><u>A: Social</u></b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.Style["border"] = " solid 1px #000000";
				tdInner.InnerHtml = "*Items not labeled use the " + oReader["itemsused"] + " scores.";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				// Social

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>A1: " + oReader["a1"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "50. Direct gaze";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["50use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "51. Social smiling";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["51use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "57. Range of facial expr used to comm";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["57use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>A2: " + oReader["a2"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "49. Imaginitive play with peers (OVER 4yo only)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["49use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "62. Interest in children";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["62use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "63. Response to other children's approaches";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["63use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "64. Group play with peers (4-10yo) <br/><br/><b>OR (score either 64 or 65 based on age)</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["64use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "65. Friendships (10-15yo)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["65use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>A3: " + oReader["a3"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "52. Showing and directing attention";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["52use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "53. Offering to share";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["53use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "54. Seeking to share own enjoyment with others";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["54use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>A4: " + oReader["a4"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "31. Use of other's body to commun. (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["31use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "55. Offers comfort";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["55use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "56. Quality of social overtures";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["56use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "58. Inappropriate facial expression (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["58use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "59. Appropriateness of social responses";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["59use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);


				// communication
				
				
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 3;
				tdInner.InnerHtml = "<b><u>B: Communication</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>B1: " + oReader["b1"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "42. Pointing to express interest";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["42use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				//
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "43. Nodding";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["43use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				//
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "44. Head shaking";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["44use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				
				//
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "45. Conventional/instrumental gestures";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["45use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);


				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>B4: " + oReader["b4"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "47. Spontaneous imitation of actions";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["47use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "48. Imaginitive play";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["48use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "61. Imitative social play";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["61use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>B2(V): " + oReader["b2v"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "34. Social verbalization/chat (current)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["34use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);


				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "35. Reciprocal conversation (current)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["35use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				
				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>B3(V): " + oReader["b3v"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "33. Stereotyped utterances (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["33use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "36. Inappropriate questions (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["36use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "37. Pronominal reversal (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["37use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "38. Neologisms/Idiosyncratic language (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["38use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				oTd.Controls.Add(tblInner);
				oTr.Cells.Add(oTd);
				//End Left Side Cell
				#endregion

				#region Right Side Cell
				//Begin Right Side Cell
				oTd = new HtmlTableCell();
				oTd.Style["width"] = " 50%";
				oTd.InnerHtml = "&nbsp;<br/>";
				oTr.Controls.Add(oTd);

				tblInner = new HtmlTable();
				tblInner.Style["width"] = " 100%";

				
				
				// Repetitive
				
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 5;
				tdInner.InnerHtml = "<b><u>C: Repetitive Behavior</u></b>";

				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 20%";
				tdInner.InnerHtml = "<b>C1: " + oReader["c1"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "67. Unusual preoccupations (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>" + oReader["67use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "68. Circumscribed interests (ever) OVER 4yo ONLY";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>" + oReader["68use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b>C2: " + oReader["c2"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "39. Verbal rituals (ever) (score if Item 30 = 0)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>" + oReader["39use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "70. Compulsions/Rituals (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>" + oReader["70use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["vertical-align"] = "top";
				tdInner.InnerHtml = "<b>C3: " + oReader["c3"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "77. Hand and finger mannerisms <br/><br/><b>OR (score higher)</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>" + oReader["77use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "78. Other complex mannerisms (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["text-align"] = "left";
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>" + oReader["78use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.Style["vertical-align"] = "top";
				tdInner.InnerHtml = "<b>C4: " + oReader["c4"].ToString() + "</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "69. Repetitive use of objects (ever) <br/><br/><b>OR (score higher)</b>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["69use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "71. Unusual sensory interests (ever)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.Style["text-align"] = "left";
				tdInner.InnerHtml = "<b><u>" + oReader["71use"].ToString() + "</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 5;
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);


				// Abnormality


				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 5;
				tdInner.InnerHtml = "<b><u>D: Abnormality of development evident at or before 36 months</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "Age parents 1st noticed (if < 36 mos, score 1)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["AD002"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = "(2):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["2r"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);


				//
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "Age at 1st single words (if > 24 mos, score 1)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["AD009desc"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = "(9):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["9r"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);


				//
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "Age 1st phases (if > 33 mos, score 1)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["AD010desc"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = "(10):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["10r"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				
				//
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "Age when abnormally 1st evident (if 3 or 4, score 1)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["AD086"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = "(86):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["86r"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				//
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "Intvwr's judgement on age manifest (if < 36 mos, score 1)";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["AD087"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = "(87):";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.Style["width"] = " 10%";
				tdInner.InnerHtml = oReader["87r"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);


				/*
				
				//
				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 5;
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				
				// loss of skills
				

				
				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b><u>Loss of Skills</b></u>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "<b><u>Before 5</b></u>";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = "<b><u>After 5</b></u>";
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of skills?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD095be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD095af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of skills due to illness?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD096be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD096af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of skills in communication?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD097be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD097af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of social interest/responsiveness?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD098be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD098af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of play and imagination?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD099be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD099af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of adaptive skills?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD100be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD100af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of preacad, acad, or voc. skills?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD101be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD101af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Loss of motor skills?";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = oReader["AD102be"].ToString();
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 2;
				tdInner.InnerHtml = oReader["AD102af"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				trInner = new HtmlTableRow();

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "&nbsp;";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.InnerHtml = "Age when main loss of skills apparent";
				trInner.Cells.Add(tdInner);

				tdInner = new HtmlTableCell();
				tdInner.ColSpan = 3;
				tdInner.InnerHtml = oReader["AD103"].ToString();
				trInner.Cells.Add(tdInner);

				tblInner.Rows.Add(trInner);

				
				*/


				oTd.Controls.Add(tblInner);
				//End Right Side Cell
				#endregion

				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
				#endregion

				return true;
			}
			else
				return false;

		}
		
		public bool RenderADIReport(ref HtmlTable tblMaster)
		{
			if (this.sSubjID == null)
				return false;

			SqlDataReader oReader = GetData(this.sSubjID);

			if (oReader.HasRows)
			{
				oReader.Read();
				HtmlTableRow oTr;
				HtmlTableCell oTd;
				HtmlTable tblInner;
				HtmlTableRow trInner;
				HtmlTableCell tdInner;

				tblMaster.Rows.Clear();
				tblMaster.Attributes["class"] = "tblNonTableReport";

				try
				{
					#region First Major Row of Report
					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.ColSpan = 2;

					tblInner = new HtmlTable();
					tblInner.Style["width"] = " 100%";
					tblInner.CellSpacing = 0;
					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.Attributes["class"] = "tdTitle";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					tdInner.Style["border-right"] = " solid 1px #000000";
					tdInner.InnerHtml = "ADI (Short Form Version)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Subject ID:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["ID"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Date of ADI:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = Convert.ToDateTime(oReader["Addate"].ToString()).ToShortDateString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Age (y:m):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["ADageym"].ToString() + " (" + oReader["ADagemos"].ToString() + ")";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Verified:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["verified"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Study:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["ADStudy"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Interviewer:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["ADint"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Subject DOB:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					if (oReader["AdDOB"].ToString() != "") { tdInner.InnerHtml = Convert.ToDateTime(oReader["AdDOB"].ToString()).ToShortDateString(); } else { tdInner.InnerHtml = "&nbsp;"; }
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 3;
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Date Algorithm report printed:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = DateTime.Today.ToString("MM/dd/yyyy");
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					oTd.Controls.Add(tblInner);
					oTd.Style["border-bottom"] = " solid 3px #000000";
					oTr.Cells.Add(oTd);
					tblMaster.Rows.Add(oTr);
					#endregion

					#region Second Major Row of Report
					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.ColSpan = 2;

					tblInner = new HtmlTable();
					tblInner.Style["width"] = " 100%";
					tblInner.CellSpacing = 0;
					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 15%";
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Scoring Errors:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					//tdInner.InnerHtml = oReader["scorcmnt"].ToString();
					tdInner.InnerText = oReader["scorcmnt"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					oTd.Controls.Add(tblInner);
					oTd.Style["border-bottom"] = " solid 3px #000000";
					oTr.Cells.Add(oTd);
					tblMaster.Rows.Add(oTr);
					#endregion

					#region Third Major Row of Report
					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.ColSpan = 2;

					tblInner = new HtmlTable();
					tblInner.Style["width"] = " 100%";
					tblInner.CellSpacing = 0;
					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.Style["border"] = " solid 1px #000000";
					tdInner.Style["font-size"] = " 12pt";
					tdInner.Style["font-weight"] = " bold";
					tdInner.Style["padding"] = " 8px";
					tdInner.InnerHtml = "ADI Dx: " + oReader["adidx"];
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["font-size"] = " 12pt";
					tdInner.Style["font-weight"] = " bold";
					tdInner.Style["padding"] = " 8px";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "&nbsp;"; //"UW ADI Dx: ";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["font-size"] = " 12pt";
					tdInner.Style["font-weight"] = " bold";
					tdInner.Style["padding"] = " 8px";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "&nbsp;"; //oReader["prelimdx"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["font-weight"] = "bold";
					tdInner.Style["vertical-align"] = "middle";
					tdInner.InnerHtml = "Section:<br/>Total:<br/>Cutoff met?:<br/>";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml = "<b>Social</b><br/>";
					tdInner.InnerHtml += "<u>" + oReader["SocialSum"].ToString() + "</u><br/>";
					tdInner.InnerHtml += ConvertToYesNo(oReader["autSocialCutoff"].ToString()) + "<br/>";
					tdInner.InnerHtml += "(>=10)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml = "<b>Communication</b><br/>";
					tdInner.InnerHtml += "<u>" + oReader["CommLevel"].ToString() + " " + oReader["CommSum"].ToString() + "</u><br/>";
					tdInner.InnerHtml += ConvertToYesNo(oReader["autCommCutoff"].ToString()) + "<br/>";
					tdInner.InnerHtml += "(V>=8, NV >=7)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml = "<b>Repetitive Bx</b><br/>";
					tdInner.InnerHtml += "<u>" + oReader["RepetSum"].ToString() + "</u><br/>";
					tdInner.InnerHtml += ConvertToYesNo(oReader["autRepetCutoff"].ToString()) + "<br/>";
					tdInner.InnerHtml += "(>=3)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					/*
					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml = "<b>Meets Criteria?</b><br/>";
					tdInner.InnerHtml += "<u><b>" + ConvertToYesNo(oReader["autCriteria"].ToString()) + "</b></u><br/>";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);
					*/

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml = "<b>Abnormality evident before 36 mos?</b><br/>";
					tdInner.InnerHtml += "<u>" + oReader["autabdevsum"].ToString() + "</u><br/>";
					tdInner.InnerHtml += ConvertToYesNo(oReader["autabdev"].ToString()) + "<br/>(>=1)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);


					tblInner.Rows.Add(trInner);

					/* 
					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["font-weight"] = "bold";
					tdInner.Style["vertical-align"] = "middle";
					tdInner.InnerHtml = "Asperger's";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml += ConvertToYesNo(oReader["aspSocialCutoff"].ToString()) + "<br/>";
					tdInner.InnerHtml += "(>=10)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml += "(no cutoff for<br/>communication)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml += ConvertToYesNo(oReader["aspRepetCutoff"].ToString()) + "<br/>";
					tdInner.InnerHtml += "(>=3)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml += "<u><b>" + ConvertToYesNo(oReader["aspCriteria"].ToString()) + "</b></u><br/>";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml += "IQ >= 85?<br/>";
					tdInner.InnerHtml += "Evident before 36 mos? (see below) <b><u>" + ConvertToYesNo(oReader["aspabdev"].ToString()) + "</b></u><br/>";
					tdInner.InnerHtml += "1st words < 24 mos? <b><u>" + ConvertToYesNo(oReader["12yn"].ToString()) + " " + oReader["AD012desc"].ToString() + "</b></u><br/>";
					tdInner.InnerHtml += "1st phrases < 33 mos? <b><u>" + ConvertToYesNo(oReader["13yn"].ToString()) + " " + oReader["AD013desc"].ToString() + "</b></u><br/>";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["vertical-align"] = "middle";
					tdInner.InnerHtml = "<b>PPD</b><br/>[Soc & (Com or Rep)]";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml += ConvertToYesNo(oReader["pddSocialCutoff"].ToString()) + "<br/>";
					tdInner.InnerHtml += "(>=7)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml += ConvertToYesNo(oReader["pddCommCutoff"].ToString()) + "<br/>";
					tdInner.InnerHtml += "(V>=6, NV >=5)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml += ConvertToYesNo(oReader["pddRepetCutoff"].ToString()) + "<br/>";
					tdInner.InnerHtml += "(>=2)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml += "<u><b>" + ConvertToYesNo(oReader["pddCriteria"].ToString()) + "</b></u><br/>";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml += "&nbsp;";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					*/

					oTd.Controls.Add(tblInner);
					oTd.Style["border-bottom"] = " solid 3px #000000";
					oTr.Cells.Add(oTd);
					tblMaster.Rows.Add(oTr);
					#endregion

					#region Fourth Major Row of Report
					oTr = new HtmlTableRow();

					#region Left Side Cell
					//Begin Left Side Cell
					oTd = new HtmlTableCell();
					oTd.Style["width"] = " 50%";

					tblInner = new HtmlTable();
					tblInner.Style["width"] = " 100%";
					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b><u>Social</u></b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.Style["border"] = " solid 1px #000000";
					tdInner.InnerHtml = "*Items not labeled use the " + oReader["itemsused"] + " scores.";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>b1: " + oReader["b1"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "42. Direct gaze";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["42use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "43. Social smiling";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["43use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "52. Range of facial expr used to comm";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["52use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>b2: " + oReader["b2"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "64. Imaginitive play with peers (OVER 4yo only)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["64use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "66. Interest in children";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["66use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					//tblInner.Rows.Add(trInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "67. Response to other children's approaches";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["66use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					//tblInner.Rows.Add(trInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "68. Group play with peers (4-10yo) <br/><br/><b>OR (score either 68 or 69 based on age)</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["68use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					//tblInner.Rows.Add(trInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "69. Friendships (10-15yo)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["69use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>b3: " + oReader["b3"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "45. Showing and directing attention";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["45use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "46. Offering to share";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["46use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "47. Seeking to share own enjoyment with others";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["47use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>b4: " + oReader["b4"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "49. Offers support";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["49use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "11. Use of other's body to commun. (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["11use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "51. Quality of social overtures";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["51use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "53. Inappropriate facial expression (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["53use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "57. Appropriateness of social responses";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["57use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 3;
					tdInner.InnerHtml = "<b><u>Communication</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>c1: " + oReader["c1"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "30. Pointing to express interest";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["30use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "31. Conversational insturmental gestures";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["31use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "32. Nodding";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["32use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "33. Head shaking";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["33use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>c4: " + oReader["c4"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "29. Spontaneous imitation of actions";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["29use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "63. Imaginitive play";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["63use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "65. Imitative social play";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["65use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>c2v: " + oReader["c2v"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "20. Reciprocal conversation (current)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["20use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "16. Social vocalization / chat (current)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["16use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>c3v: " + oReader["c3v"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "18. Stereotyped utterances (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["18use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "22. Inappropriate questions (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["22use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "23. Pronomial reversal (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["23use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "24. Neologisms/Idiosyncratic language (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["24use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					oTd.Controls.Add(tblInner);
					oTr.Cells.Add(oTd);
					//End Left Side Cell
					#endregion

					#region Right Side Cell
					//Begin Right Side Cell
					oTd = new HtmlTableCell();
					oTd.Style["width"] = " 50%";
					oTd.InnerHtml = "&nbsp;<br/>";
					oTr.Controls.Add(oTd);

					tblInner = new HtmlTable();
					tblInner.Style["width"] = " 100%";

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 5;
					tdInner.InnerHtml = "<b><u>Repetitive Behavior</u></b>";

					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 20%";
					tdInner.InnerHtml = "<b>d1: " + oReader["d1"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "70. Circumscribed interests (ever) OVER 4yo ONLY";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["70use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "71. Unusual preoccupations (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["71use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>d2: " + oReader["d2"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "25. Verbal rituals (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["25use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "75. Compulsions/Rituals (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["75use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["vertical-align"] = "top";
					tdInner.InnerHtml = "<b>d3: " + oReader["d3"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "81. Hand and finger mannerisms <br/><br/><b>OR (score higher)</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["81use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "84. Other complex mannerisms (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["84use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["vertical-align"] = "top";
					tdInner.InnerHtml = "<b>d4: " + oReader["d4"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "72. Repetitive use of objects (ever) <br/><br/><b>OR (score higher)</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["72use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "77. Unusual sesory interests (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["77use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 5;
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 5;
					tdInner.InnerHtml = "<b><u>Abnormality of development evident at or before 36 months</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Age parents 1st noticed (if < 36 mos, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD002"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(2):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["2r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Age when abnormally 1st evident (if 3 or 4, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD093"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(93):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["93r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Intvwr's judgement on age manifest (if < 36 mos, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD094"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(94):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["94r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Age at 1st single words (if > 24 mos, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD012desc"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(12):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["12r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Age 1st phases (if > 33 mos, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD013desc"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(13):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["13r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 5;
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b><u>Loss of Skills</b></u>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b><u>Before 5</b></u>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>After 5</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of skills?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD095be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD095af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of skills due to illness?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD096be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD096af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of skills in communication?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD097be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD097af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of social interest/responsiveness?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD098be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD098af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of play and imagination?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD099be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD099af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of adaptive skills?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD100be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD100af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of preacad, acad, or voc. skills?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD101be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD101af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of motor skills?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD102be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD102af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Age when main loss of skills apparent";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 3;
					tdInner.InnerHtml = oReader["AD103"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					oTd.Controls.Add(tblInner);
					//End Right Side Cell
					#endregion

					oTr.Cells.Add(oTd);
					tblMaster.Rows.Add(oTr);
					#endregion
				}
				catch
				{ }

				return true;
			}
			else
				return false;
		}

		public string SubjectID
		{
			set {sSubjID = value;}
			get {return sSubjID;}
		}

		public Studies Study
		{
			set {nStudy = value;}
			get {return nStudy;}
		}

		#region Study Enumeration
		public enum Studies
		{
			EearlyDevelopmentStudyTime1		= 1,
			EearlyDevelopmentStudyTime2		= 2,
			EearlyDevelopmentStudyTime3		= 3,
			FamilyStudyOfAutism				= 4,
			FamilyStudyOfVisualProcessing	= 5,
			SecretinStudy					= 6,
			FeatureProcessingInAutism		= 7,
			Fein							= 8,
			MaternalDepression				= 9,
			FacePerceptionTraining			= 10,
			Fein2							= 11,
			AutismImitationStudy			= 12,
			Miscellaneous					= 13,
			BasicScreening					= 1000,
			PilotSubject					= 1001,
			ClinicalAppointment				= 1002,
			TestStudy						= 1003,
			EDSparentAssessment				= 1004,
			EDSFollowUp						= 1005,
			EDSMidPoint						= 1007,
			BlindBPASS						= 1008,
			NIHBlood						= 1009,
			COEProject4FACE					= 1010,
			COEProject1TAP					= 1011,
			COEIntervention					= 1012,
			KTDiss							= 1013
		}
		#endregion

		#region Get the Data for the Subject ID that was passed in.
		private SqlDataReader GetData(string sSubjID)
		{
			ReadConfig oConfig = new ReadConfig();
			SqlConnection oConnData = new SqlConnection();

			oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
			oConnData.Open();

			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = oConnData;
			oCmd.CommandText = "spGetGeneticsADIBySubjectID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@SubjID", SqlDbType.VarChar, 12, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sSubjID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, this.Study));

			oReader = oCmd.ExecuteReader(CommandBehavior.CloseConnection);

			return oReader;
		}
		#endregion
	}
}
