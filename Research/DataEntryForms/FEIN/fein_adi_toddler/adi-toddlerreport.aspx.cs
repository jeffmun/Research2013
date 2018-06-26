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

namespace GenericDataEntryForms.adi_sh
{

	public partial class adi_shreport : System.Web.UI.Page
	{


		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (Request["id"] != null && Request["id"] != string.Empty)
				RenderADIToddlerReport(Request["id"]);
			

	}

		private string ConvertToYesNo(string sVal)
		{
			string sRetval = string.Empty;
			if (sVal == "-1" || sVal == "1" )
				sRetval = "Yes";
			else if (sVal == "0")
				sRetval = "No";
			return sRetval;
		}


		public void RenderADIToddlerReport(string id)
		{
			SqlConnection conn = null;
			try
			{
				conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"]);
				SqlCommand cmd = new SqlCommand();
				cmd.Connection = conn;
				string sql = "select adi.* from fein_adi_toddler adi ";
				sql += "where adi.[id]=@id ";
				cmd.CommandText = sql;
				cmd.CommandType = CommandType.Text;
				cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.VarChar, 15));
				cmd.Parameters["@id"].Value = id;
				conn.Open();

				SqlDataReader oReader = cmd.ExecuteReader();


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
					tdInner.InnerHtml = "FEIN Toddler ADI";
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
					tdInner.InnerHtml = Convert.ToDateTime(oReader["AdDOB"].ToString()).ToShortDateString();
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
					tdInner.InnerHtml = "52. Direct gaze";
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
					tdInner.InnerHtml = "53. Social smiling";
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
					tdInner.InnerHtml = "67. Range of facial expression";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["67use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();


					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>b2: " + oReader["b2"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "89. Interest in children";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["89use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "90. Response to other children's approaches";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["90use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>b3: " + oReader["b3"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "57. Showing and directing attention";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["57use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "58. Offering to share";
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
					tdInner.InnerHtml = "60. Seeking to share own enjoyment with others";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["60use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>b4: " + oReader["b4"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "14. Use of other's body (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["14use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);


					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "62. Offers comfort";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["62use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "66. Quality of social overtures";
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
					tdInner.InnerHtml = "68. Inappropriate facial expression (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["68use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "79. Appropriateness of social responses";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["79use"].ToString() + "</b></u>";
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
					tdInner.InnerHtml = "34. Pointing to express interest";
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
					tdInner.InnerHtml = "35. Conventional instrumental gesture";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["35use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "36. Nodding";
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
					tdInner.InnerHtml = "37. Head shaking";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["37use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>c2: " + oReader["c2"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "32. Spontaneous imitation of actions";
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
					tdInner.InnerHtml = "87. Imaginitive play";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["87use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "88. Imitative social play";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["88use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>c2v: " + oReader["c2v"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "21. Social vocalization / chat (current)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["21use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "25. Reciprocal conversation (current)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["25use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>c3v: " + oReader["c3v"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "23. Stereotyped utterances (ever)";
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
					tdInner.InnerHtml = "26. Pronominal reversal (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["26use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "27. Neologisms/Idiosyncratic language (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["27use"].ToString() + "</b></u>";
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
					tdInner.InnerHtml = "91. Unusual preoccupations (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["91use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>d2: " + oReader["d2"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "28. Verbal rituals (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["28use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "95. Compulsions/Rituals (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["95use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["vertical-align"] = "top";
					tdInner.InnerHtml = "<b>d3: " + oReader["d3"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "100. Hand and finger movements <br/><br/><b>OR (score higher)</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["100use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "101. Complex mannerisms (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["101use"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["vertical-align"] = "top";
					tdInner.InnerHtml = "<b>d4: " + oReader["d4"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "92. Repetitive use of objects (ever) <br/><br/><b>OR (score higher)</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["92use"].ToString() + "</b></u>";
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
					tdInner.InnerHtml = oReader["AD001"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(1):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["1r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Age when abnormally 1st evident (if 3 or 4, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD004"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(4):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["4r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Intvwr's judgement on age manifest (if < 36 mos, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD006"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(6):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["6r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Age at 1st single words (if > 24 mos, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD017desc"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(17):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["17r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Age 1st phases (if > 33 mos, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD019desc"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(19):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["19r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);


					oTd.Controls.Add(tblInner);
					//End Right Side Cell
					#endregion

					oTr.Cells.Add(oTd);
					tblMaster.Rows.Add(oTr);
					#endregion

				}
			}
			catch(Exception ex)
			{
				lblError.Text = ex.Message;
				lblError.Visible = true;
			}
			finally
			{
				if (conn != null) conn.Close();
			}
		}



		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion
	}
}
