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
	public partial class ActionsByHousehold : System.Web.UI.Page
	{
		private TextFormatter oFormatter = new TextFormatter();

		private void Page_Load(object sender, System.EventArgs e)
		{
			int nHouseholdID = Convert.ToInt32(Request["HouseholdID"].ToString());
			int nStudyID = -1;
			string sPersonID = "0";
			string sStudyID = "0";
			SqlDataReader oReader;
			HtmlTableRow oTr;
			HtmlTableCell oTd;
			bool bDoDark = false;

			if (Request["StudyID"] != null)
				nStudyID = Convert.ToInt32(Request["StudyID"].ToString());

			oReader = GetActionsByHousehold(nHouseholdID, nStudyID);

			if (oReader.HasRows)
			{
				while (oReader.Read())
				{
					if (sPersonID != oReader["PersonID"].ToString())
					{
						#region Display a Header for Each Person
						sPersonID = oReader["PersonID"].ToString();
						sStudyID = "";

						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTr.Attributes["class"] = "trHeader";
						oTd.ColSpan = 7;
						oTd.Style["font-size"] = "14pt";
						oTd.InnerHtml = oReader["FullName"].ToString();
						oTr.Cells.Add(oTd);
						tblMaster.Rows.Add(oTr);
						#endregion
					}

					if (sStudyID != oReader["StudyID"].ToString())
					{
						#region Display a Header for Each Study the Person is in
						sStudyID = oReader["StudyID"].ToString();

						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTr.Attributes["class"] = "trHeaderAlt";
						oTd.ColSpan = 7;
						oTd.Style["text-align"] = "center";
						oTd.InnerHtml = oReader["StudyName"].ToString() + " - " + oReader["ID"].ToString() + " (" + oReader["GroupName"].ToString() + " - " + oReader["SubjStatus"].ToString() + ")";
						oTr.Cells.Add(oTd);
						tblMaster.Rows.Add(oTr);
						#endregion

						#region Display a Header for Each Column
						oTr = new HtmlTableRow();

						oTd = new HtmlTableCell();
						oTd.Style["background-color"] = "#e6ecf5";
						oTd.InnerHtml = "&nbsp;";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["background-color"] = "#e6ecf5";
						oTd.Style["font-weight"] = "bold";
						oTd.InnerHtml = "Action";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["background-color"] = "#e6ecf5";
						oTd.Style["font-weight"] = "bold";
						oTd.InnerHtml = "Action Type";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["background-color"] = "#e6ecf5";
						oTd.Style["font-weight"] = "bold";
						oTd.InnerHtml = "Status";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["background-color"] = "#e6ecf5";
						oTd.Style["font-weight"] = "bold";
						oTd.InnerHtml = "Lab";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["background-color"] = "#e6ecf5";
						oTd.Style["font-weight"] = "bold";
						oTd.InnerHtml = "Date Done";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["background-color"] = "#e6ecf5";
						oTd.Style["font-weight"] = "bold";
						oTd.InnerHtml = "Staff";
						oTr.Cells.Add(oTd);

						tblMaster.Rows.Add(oTr);
						#endregion

						bDoDark = false;
					}

					#region Display the Actions
					oTr = new HtmlTableRow();
					if (bDoDark) {oTr.Attributes["class"] = "trDark";}
					oTr.Attributes["onclick"] = "HighlightRow(this);";

					oTd = new HtmlTableCell();
					oTd.Style["text-align"] = "center";

					if (Convert.ToBoolean(oReader["CanEditMultiple"]))
						oTd.InnerHtml = "<input type=\"checkbox\" name=\"chkActionIDs\" value=\"" + oReader["ActionID"].ToString() + "\" id=\"chkActionID" + oReader["ActionID"].ToString() + "\" />";
					else
						oTd.InnerHtml = "&nbsp;";

					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "<a href=\"" + Request.ApplicationPath + "/Measures/EditAction.aspx?ActionID=" + oReader["ActionID"].ToString() + "\">" + oFormatter.FormatDBOutput(oReader["ActionText"].ToString()) + "</a>";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = oFormatter.FormatDBOutput(oReader["ActionType"].ToString());
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = oFormatter.FormatDBOutput(oReader["ActionStatus"].ToString());
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = oFormatter.FormatDBOutput(oReader["LabName"].ToString());
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = oFormatter.FormatDBOutput(oReader["DateDone"].ToString());
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = oFormatter.FormatDBOutput(oReader["Staff"].ToString());
					oTr.Cells.Add(oTd);

					tblMaster.Rows.Add(oTr);
					#endregion

					bDoDark = !bDoDark;
				}
			}
			else
			{
				tblMaster.Attributes["class"] = "";
				btnCompleteAll.Style["display"] = "none";

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "There are no Actions for this Household. <a href=\"" + Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + nHouseholdID.ToString() + "\">Return to View Household page.</a>";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
			}
		}

		#region Get the Data from the db
		private SqlDataReader GetActionsByHousehold(int nHouseholdID, int nStudyID)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandTimeout = 90;
			oCmd.CommandText = "spGetActionsByHouseholdID";

			oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nHouseholdID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nStudyID));

			if (nStudyID <= 0) {oCmd.Parameters["@StudyID"].Value = DBNull.Value;}

			oReader = oCmd.ExecuteReader();
			return oReader;
		}
		#endregion
	}
}
