using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;

using AutismCenterBase.Utilities;
using AutismCenterBase.Security;
using AutismCenterBase.Reports;

namespace AutismCenterBase.Reports
{
	public class FormWriter
	{
		private SqlConnection oConn;
		private DBLookup oDBLookup;
		private Report oReport;

		public FormWriter(SqlConnection SqlConn)
		{
            oConn = SqlConn;
		}

		public FormWriter(Report oReport, SqlConnection SqlConn)
		{
			this.oReport = oReport;
            oConn = SqlConn;
		}

		public FormWriter(Guid gReportID, SqlConnection oConn)
		{
			this.oReport = new Report(gReportID, oConn);
		}

		public Report Report
		{
			get {return oReport;}
			set {oReport = value;}
		}

		//The RenderForm method will accept an HtmlTable control and build the form
		//into which the user enters the parameters necessary to build the report.
		public void RenderForm(ref HtmlTable tblMaster)
		{
			oDBLookup = new DBLookup(oConn);

			int i = 0;
			HtmlTableRow oTr;
			HtmlTableCell oTd;
            string sLabel;

			oTr = new HtmlTableRow();
			oTd = new HtmlTableCell();
			oTd.ColSpan = 2;
			oTr.Attributes["class"] = "trTitle";
			oTd.InnerHtml = oReport.Name + "";
			oTr.Cells.Add(oTd);
			tblMaster.Rows.Add(oTr);

			//Loop over each parameter in the Report's Parameters collection and display
			//the appropriate form element for each Parameter.
			foreach (Parameter oParam in oReport.Parameters)
			{
				if (i == 0 || (i%2) == 0)
					oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
				oTd.Attributes["style"] = "width: 50%;";

				//Set the control's label text to the FriendlyName of the parameter and
				//add the label to the table cell.
				if (oParam.IsRequired)
                    sLabel = "<label for=\"elm" + oParam.Name.Replace("@", "") + "\">" + oParam.FriendlyName + "</label><sup class=\"error\" style=\"font-size: 7pt; font-weight: bold;\">*</sup><br/>";
				else
                    sLabel = "<label for=\"elm" + oParam.Name.Replace("@", "") + "\">" + oParam.FriendlyName + "</label><br/>";
				
				//If the source of the data comes from a SQL string, stored procedure, or XML file,
				//we need to look up the data to populate a DropDownList control. Otherwise, render
				//a text box to manually type in information.
                if (oParam.DataSourceType == Parameter.DataSourceTypes.SQLString || oParam.DataSourceType == Parameter.DataSourceTypes.StoredProc)
                {
                    //If there is a @StudyID parameter, and a value for the paramater has not been set,
                    //and the user has a StudyID in his/her session, automatically select the study in the
                    //user's session.
                    if (oParam.Name == "@StudyID" && (oParam.Value == "" || oParam.Value == null))
                    {
                        if (HttpContext.Current.Session["StudyID"] != null)
                            oTd.InnerHtml = sLabel + oDBLookup.BindDropDownList("elm" + oParam.Name.Replace("@", ""), oParam.DataSource, oParam.DataSourceTextField, oParam.DataSourceIDField, HttpContext.Current.Session["StudyID"].ToString(), "--Select " + oParam.FriendlyName + "--", "width: 400px;"); 
                        else
                            oTd.InnerHtml = sLabel + oDBLookup.BindDropDownList("elm" + oParam.Name.Replace("@", ""), oParam.DataSource, oParam.DataSourceTextField, oParam.DataSourceIDField, oParam.Value, "--Select " + oParam.FriendlyName + "--", "width: 400px;");
                    }
                    else
                        oTd.InnerHtml = sLabel + oDBLookup.BindDropDownList("elm" + oParam.Name.Replace("@", ""), oParam.DataSource, oParam.DataSourceTextField, oParam.DataSourceIDField, oParam.Value, "--Select " + oParam.FriendlyName + "--", "width: 400px;");
                }
                else if (oParam.DataSourceType == Parameter.DataSourceTypes.XMLFile)
                    oTd.InnerHtml = sLabel + "";
                else
                {
                    #region If there is No Data Source Defined
                    string sTextBox = sLabel + "<input type=\"text\" id=\"elm" + oParam.Name.Replace("@", "") + "\" name=\"elm" + oParam.Name.Replace("@", "") + "\" value=\"" + oParam.Value + "\" class=\"SmallFont\"";

                    if (oParam.DataType == "datetime")
                    {
                        if (oParam.Value == "")
                            sTextBox += " value=\"" + DateTime.Today.ToString("MM/dd/yyyy") + "\"";
                        else
                            sTextBox += " value=\"" + oParam.Value + "\"";

                        sTextBox += " />&nbsp;";
                        sTextBox += "<img src=\"" + ConfigurationManager.AppSettings["IMAGES_FOLDER"] + "dlcalendar_2.gif\" alt=\"\" id=\"img" + oParam.Name.Replace("@", "") + "\" />";

                        HttpContext.Current.Response.Write("<dlcalendar click_element_id=\"img" + oParam.Name.Replace("@", "") + "\" input_element_id=\"elm" + oParam.Name.Replace("@", "") + "\"></dlcalendar>");
                    }
                    else
                        sTextBox += " />";

                    oTd.InnerHtml = sTextBox;
                    #endregion
                }

				oTr.Cells.Add(oTd);
				tblMaster.Rows.Insert(i+1, oTr);

				i = i + 1;
			}

			if (i == 0 || (i%2) != 0)
			{
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "&nbsp;";
				oTr.Cells.Add(oTd);
			}

			oTr = new HtmlTableRow();
			oTd = new HtmlTableCell();
			oTd.ColSpan = 2;
			oTd.InnerHtml = "<input type=\"submit\" name=\"btnSubmit\" value=\"Submit\" />";
			oTr.Cells.Add(oTd);
			tblMaster.Rows.Add(oTr);
		}
	}
}
