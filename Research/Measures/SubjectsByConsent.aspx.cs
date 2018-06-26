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
	public partial class SubjectsByConsent : System.Web.UI.Page
	{
		private TextFormatter oFormat = new TextFormatter();
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup(Master.SqlConn);

			int nConsentFormID = Convert.ToInt32(Request["ConsentFormID"].ToString());
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;
			HtmlTableRow oTr;
			HtmlTableCell oTd;
			HtmlTableCell tdConsentItems = new HtmlTableCell();
			bool bDoDark = false;
			string sSubjID = "";
			string sCFVID = "";

			tdTitle.InnerHtml = oDBLookup.GetConsentFormNameByConsentFormID(nConsentFormID);

			#region Get Info From db
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetSubjConsentsByConsentFormID2";

			oCmd.Parameters.Add(new SqlParameter("@ConsentFormID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nConsentFormID));
			#endregion

			oReader = oCmd.ExecuteReader();

			while (oReader.Read())
			{
				#region Display Data Items
				if (sSubjID != oReader["SubjID"].ToString() || sCFVID != oReader["ConsentFormVersionID"].ToString())
				{
					oTr = new HtmlTableRow();
					oTr.Attributes["onclick"] = "HighlightRow(this);";
					if (bDoDark) {oTr.Attributes["class"] = "trDark";}

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "<a href=\"" + Request.ApplicationPath + "/Measures/EditConsentForm.aspx?SubjConsentID=" + oReader["SubjConsentID"].ToString() + "\">" + oFormat.FormatDBOutput(oReader["ID"].ToString()) + "</a>";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = oFormat.FormatDBOutput(oReader["Version"].ToString());
					oTr.Cells.Add(oTd);

                    oTd = new HtmlTableCell();
                    oTd.InnerHtml = oFormat.FormatDBOutput(oReader["Status"].ToString());
                    oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = oFormat.FormatDBOutput(oReader["DateSigned"].ToString());
					oTr.Cells.Add(oTd);

					tdConsentItems = new HtmlTableCell();
                    //if (oReader["IsConsented"].ToString() == "1")
                    //    tdConsentItems.InnerHtml = "<span style=\"color: #008800;\">" + oFormat.FormatDBOutput(oReader["ConsentItemText"].ToString()) + "</span>";
                    //else
                    //    tdConsentItems.InnerHtml = "<span style=\"color: #ff0000;\">" + oFormat.FormatDBOutput(oReader["ConsentItemText"].ToString()) + "</span>";
                    string s = oReader["ConsentItemText"].ToString() + " " + oReader["optiontext"].ToString();
                    if (s.Trim() == "") s = "&nbsp;"; //hack to fix missing border around empty table cell
                    tdConsentItems.InnerHtml = s;

					oTr.Cells.Add(tdConsentItems);

					tblMaster.Rows.Add(oTr);

					bDoDark = !bDoDark;
					sSubjID = oReader["SubjID"].ToString();
					sCFVID = oReader["ConsentFormVersionID"].ToString();
				}
				else
				{
                    //if (oReader["IsConsented"].ToString() == "1")
                    //    tdConsentItems.InnerHtml += "<br/>\n<span style=\"color: #008800;\">" + oFormat.FormatDBOutput(oReader["ConsentItemText"].ToString()) + "</span>";
                    //else
                    //    tdConsentItems.InnerHtml += "<br/>\n<span style=\"color: #ff0000;\">" + oFormat.FormatDBOutput(oReader["ConsentItemText"].ToString()) + "</span>";
                    tdConsentItems.InnerHtml += "<br/>" + oReader["ConsentItemText"].ToString() + " " + oReader["optiontext"].ToString();
                }
				#endregion
			}

			oReader.Close();
		}
	}
}
