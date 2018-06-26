using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace GenericDataEntryForms.tap_adi_toddler
{
	public partial class adi_toddler_report : System.Web.UI.Page
	{

		protected System.Web.UI.WebControls.HyperLink HyperLink1;

		protected void Page_Load(object sender, System.EventArgs e)
		{

			if (Request["pk"] != null && Request["pk"] != string.Empty)
				RenderADIReport(Request["pk"]);		
		
		
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

		public void RenderADIReport(string pk)
		{
			SqlConnection conn = null;
			try
			{

				conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"]);
				SqlCommand cmd = new SqlCommand();
				cmd.Connection = conn;
				string sql = "select adi.*, s.studyname, sm.studymeasname from all_tap_adi_toddler adi ";
				sql += "join uwautism_research_backend..tblstudymeas sm on sm.studymeasid=adi.studymeasid ";
				sql += "join uwautism_research_backend..tblstudy s on s.studyid=sm.studyid ";
				//sql += "where adi.[id]=@id and adi.studymeasid=@studymeasid and adi.indexnum";
				sql += "where adi.adi_toddler_pk = @pk";
				cmd.CommandText = sql;
				cmd.CommandType = CommandType.Text;
				cmd.Parameters.Add(new SqlParameter("@pk", SqlDbType.Int, 4));
				cmd.Parameters["@pk"].Value = pk;
				
				//cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.VarChar, 15));
				//cmd.Parameters.Add(new SqlParameter("@studymeasid", SqlDbType.Int, 4));
				//cmd.Parameters["@id"].Value = id;
				//cmd.Parameters["@studymeasid"].Value = int.Parse(studymeasid);


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
					if (oReader["AdDOB"].ToString() != "") {tdInner.InnerHtml = Convert.ToDateTime(oReader["AdDOB"].ToString()).ToShortDateString();} 
					else {tdInner.InnerHtml = "&nbsp;";}
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
