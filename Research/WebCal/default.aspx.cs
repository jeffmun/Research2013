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

namespace WebCal
{
	public partial class _default : System.Web.UI.Page
	{
		private TextFormatter oFormatter = new TextFormatter();
		private ReadConfig oConfig = new ReadConfig();
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{

			Form.Attributes["onsubmit"] = "return(DoSubmitWebCal());";
			oDBLookup = new DBLookup(Master.SqlConn);

			DateTime dtStartDate = DateTime.Today;
			DateTime dtEndDateDate = DateTime.Today.AddDays(30);
			bool bDoDark = false;
			int nStaffID = -1;
			string sStudyID = "";
			int nLabID = -1;
			bool bShowCancelled = true;

			if (IsPostBack)
			{
				dtStartDate = Convert.ToDateTime(txtStartDate.Text);
				dtEndDateDate = Convert.ToDateTime(txtEndDate.Text);
				if (selLabID.SelectedValue != "") { nLabID = Convert.ToInt32(selLabID.SelectedValue); } else { nLabID = -1; }
				nStaffID = Convert.ToInt32(selStaffID.SelectedValue);
				bShowCancelled = chkShowCancelled.Checked;

				for (int i=0;i<selStudyID.Items.Count;i++)
					if (selStudyID.Items[i].Selected) { sStudyID += selStudyID.Items[i].Value + ","; }

				if (sStudyID != "") { sStudyID = sStudyID + "0"; }
			}
			else
			{

				txtStartDate.Text = dtStartDate.ToString("MM/dd/yyyy");
				txtEndDate.Text = dtEndDateDate.ToString("MM/dd/yyyy");

				oDBLookup.BindDropDownList(ref selStaffID, "EXEC spGetAllStaff", "StaffShortName", "StaffID", nStaffID.ToString(), "--Select Staff--");
				oDBLookup.BindDropDownList(ref selLabID, "EXEC spGetLabs", "LabName", "LabID", nLabID.ToString(), "--Select Lab--");
                oDBLookup.BindListBox(ref selStudyID, "EXEC spAuthUser_GetWebcalStudies 1,'" + Request.ServerVariables["AUTH_USER"] + "'", "StudyName", "StudyID", "");
			}

			if (bShowCancelled)
				chkShowCancelled.Checked = true;
			else
				chkShowCancelled.Checked = false;

			SqlDataReader oReader = GetCalendar(dtStartDate, dtEndDateDate, nLabID, sStudyID, nStaffID, bShowCancelled);

			string sActionID = "0";
			string sDateDone = "";
			string sLab = "";
			HtmlTableRow oTr;
			HtmlTableCell oTd;
			HtmlTableCell tdClinicians = new HtmlTableCell();

			while (oReader.Read())
			{
				#region Display Date Header
				if (sDateDone != Convert.ToDateTime(oReader["DateDone"].ToString()).ToString("MM/dd/yyyy"))
				{
					oTr = new HtmlTableRow();

                    //DF: Turn off viewstate to keep asp.net from restoring previous values
                    //of table cells
                    oTr.EnableViewState = false;


					oTr.Attributes["class"] = "trHeader";

					oTd = new HtmlTableCell();
					oTd.Style["border-left"] = "solid 1px #26044a";
					oTd.Style["border-right"] = "solid 1px #26044a";
					oTd.ColSpan = 5;
					oTd.InnerHtml = Convert.ToDateTime(oReader["DateDone"].ToString()).ToString("D");
					oTr.Cells.Add(oTd);

					tblMaster.Rows.Add(oTr);
					sDateDone = Convert.ToDateTime(oReader["DateDone"].ToString()).ToString("MM/dd/yyyy");

					#region Add Row Headers
					oTr = new HtmlTableRow();
                    oTr.EnableViewState = false;

					oTr.Attributes["class"] = "trHeaderAlt";

					oTd = new HtmlTableCell();
					oTd.Style["border-left"] = "solid 1px #26044a";
					oTd.InnerHtml = "Appt. Time";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Location/Status";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Staff";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Action Type";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["border-right"] = "solid 1px #26044a";
					oTd.InnerHtml = "Study/Subj. ID";
					oTr.Cells.Add(oTd);

					tblMaster.Rows.Add(oTr);
					#endregion

					sLab = "";
				}
				#endregion

				#region Display Lab Header
				if (sLab != oReader["LabName"].ToString())
				{
					oTr = new HtmlTableRow();
                    oTr.EnableViewState = false;

					oTr.Attributes["class"] = "trHeaderAlt";

					oTd = new HtmlTableCell();
					oTd.Style["border-left"] = "solid 1px #26044a";
					oTd.Style["border-right"] = "solid 1px #26044a";
					oTd.ColSpan = 5;
					oTd.InnerHtml = oReader["LabName"].ToString();
					oTr.Cells.Add(oTd);

					tblMaster.Rows.Add(oTr);
					sLab = oReader["LabName"].ToString();
				}
				#endregion

				#region Display Data Items
				if (sActionID != oReader["ActionID"].ToString())
				{
					sActionID = oReader["ActionID"].ToString();
					oTr = new HtmlTableRow();
                    oTr.EnableViewState = false;


					if (bDoDark) {oTr.Attributes["class"] = "trDark";}
					oTr.Attributes["id"] = "tr" + oReader["ActionID"].ToString() + "a";
					oTr.Attributes["onclick"] = "HighlightRow(this); HighlightRow(document.getElementById('tr" + oReader["ActionID"].ToString() + "b'));";

					tblMaster.Rows.Add(oTr);

					oTd = new HtmlTableCell();
					oTd.Style["border-left"] = "solid 1px #26044a";
					oTd.RowSpan = 2;

					if (oReader["ApptEndTime"].ToString() != "")
					{
						if (oReader["CanBeScheduled"].ToString() == "1")
                            //DF: 4/9 add app path
							oTd.InnerHtml += "<a href=\"" + Request.ApplicationPath + "/measures/ScheduleAction.aspx?ActionID=" + oReader["ActionID"].ToString() + "\">" + Convert.ToDateTime(oReader["ApptStartTime"].ToString()).ToString("hh:mm tt") + " - " + Convert.ToDateTime(oReader["ApptEndTime"].ToString()).ToString("hh:mm tt") + "</a>";
						else
							oTd.InnerHtml += Convert.ToDateTime(oReader["ApptStartTime"].ToString()).ToString("hh:mm tt") + " - " + Convert.ToDateTime(oReader["ApptEndTime"].ToString()).ToString("hh:mm tt");
					}
					else
						oTd.InnerHtml += Convert.ToDateTime(oReader["ApptStartTime"].ToString()).ToString("hh:mm tt");

					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["border-bottom"] = "solid 1px #bbbbbb";
					oTd.InnerHtml = oFormatter.FormatDBOutput(oReader["Location"].ToString());
					oTr.Cells.Add(oTd);

					tdClinicians = new HtmlTableCell();
					tdClinicians.Style["border-bottom"] = "solid 1px #bbbbbb";
					tdClinicians.Style["color"] = " #0000ff";
					oTr.Cells.Add(tdClinicians);
					tdClinicians.InnerHtml = oFormatter.FormatDBOutput(oReader["RespForName"].ToString());

					if (oReader["StaffShortName"].ToString() != "")
					{
						tdClinicians.InnerHtml += "<br/>" + oReader["StaffShortName"].ToString();

						if (oReader["ApptRole"].ToString() != "")
							tdClinicians.InnerHtml += " (" + oReader["ApptRole"].ToString() + ")";
					}

					oTd = new HtmlTableCell();
					oTd.Style["border-bottom"] = "solid 1px #bbbbbb";

                    //DF: 4/9 add app path
					oTd.InnerHtml = "<a href=\"" + Request.ApplicationPath + "/measures/EditAction.aspx?ActionID=" + oReader["ActionID"].ToString() + "\" style=\"color: #800080\">" + oFormatter.FormatDBOutput(oReader["ActionType"].ToString()) + "</a>";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["border-bottom"] = "solid 1px #bbbbbb";
					oTd.Style["border-right"] = "solid 1px #26044a";
					oTd.Style["color"] = " #800080";
					oTd.InnerHtml = oFormatter.FormatDBOutput(oReader["StudyName"].ToString());
					oTr.Cells.Add(oTd);

					oTr = new HtmlTableRow();
                    oTr.EnableViewState = false;

                    if (bDoDark) { oTr.Attributes["class"] = "trDark"; }
					oTr.Attributes["id"] = "tr" + oReader["ActionID"].ToString() + "b";
					oTr.Attributes["onclick"] = "HighlightRow(document.getElementById('tr" + oReader["ActionID"].ToString() + "a')); HighlightRow(this);";

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdWrap";
					if (oReader["ActionStatus"].ToString() == "Canceled") {oTd.Style["color"] = " #ff0000";}
					oTd.InnerHtml = oFormatter.FormatDBOutput(oReader["ActionStatus"].ToString());
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.ColSpan = 2;
					oTd.Style["color"] = " #800080";
					oTd.Attributes["class"] = "tdWrap";
					oTd.InnerHtml = oFormatter.FormatDBOutput(oReader["ActionNotes"].ToString());
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["border-right"] = "solid 1px #26044a";

                    //DF: 4/9 add app path
					oTd.InnerHtml = "<a href=\"" + Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + oReader["HouseholdID"].ToString() + "\">" + oFormatter.FormatDBOutput(oReader["ID"].ToString()) + "</a>";
					oTr.Cells.Add(oTd);

					tblMaster.Rows.Add(oTr);

					bDoDark = !bDoDark;
				}
				else
				{
					if (oReader["StaffShortName"].ToString() != "")
						tdClinicians.InnerHtml += "<br/>" + oFormatter.FormatDBOutput(oReader["StaffShortName"].ToString());

					if (oReader["ApptRole"].ToString() != "")
						tdClinicians.InnerHtml += " (" + oFormatter.FormatDBOutput(oReader["ApptRole"].ToString()) + ")";
				}
				#endregion

			}

			oReader.Close();
		}

		#region Get Calendar from db
		private SqlDataReader GetCalendar(DateTime dtStartDate, DateTime dtEndDate, int nLabID, string sStudyID, int nStaffID, bool bShowCancelled)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = Master.SqlConn;
            oCmd.CommandText = "spAuthUser_GetCalendar";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@StartDate", SqlDbType.DateTime, 8, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, dtStartDate));
			oCmd.Parameters.Add(new SqlParameter("@EndDate", SqlDbType.DateTime, 8, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, dtEndDate));
			oCmd.Parameters.Add(new SqlParameter("@LabID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nLabID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.VarChar, 500, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sStudyID));
			oCmd.Parameters.Add(new SqlParameter("@StaffID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nStaffID));
			oCmd.Parameters.Add(new SqlParameter("@ShowCancelled", SqlDbType.Bit, 1, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, bShowCancelled));
            oCmd.Parameters.Add(new SqlParameter("@auth_user", SqlDbType.VarChar, 200, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Request.ServerVariables["AUTH_USER"]));

			if (oCmd.Parameters["@LabID"].Value.ToString() == "-1") { oCmd.Parameters["@LabID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@StudyID"].Value.ToString() == "") { oCmd.Parameters["@StudyID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@StaffID"].Value.ToString() == "-1") { oCmd.Parameters["@StaffID"].Value = DBNull.Value; }

			oReader = oCmd.ExecuteReader();

			return oReader;
		}
		#endregion
	}
}
