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

namespace Household
{
	public partial class ViewHousehold : System.Web.UI.Page
	{
		private TextFormatter oFormatter = new TextFormatter();
		private ReadConfig oConfig = new ReadConfig();
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			string ap = Request.ApplicationPath;

			oDBLookup = new DBLookup(Master.SqlConn);
			//lblConnString.Text = Master.SqlConn.ConnectionString;  //commented out to get it to compile locally JM DESC2015

			int nHouseholdID = Convert.ToInt32(Request["HouseholdID"].ToString());
			DataSet oDataSet = GetHouseholdInfo(nHouseholdID);
			DataTable tblPhoneNumbers = oDataSet.Tables["tblPhoneNumbers"];
			DataTable tblEmailAddresses = oDataSet.Tables["tblEmailAddresses"];
			DataTable tblSubjects = oDataSet.Tables["tblSubjects"];
			DataTable tblSecondaryContacts = oDataSet.Tables["tblSecondaryContact"];
			DataTable tblInfoLog = oDataSet.Tables["tblInfoLog"];
			DataTable tblContactLog = oDataSet.Tables["tblContactLog"];
			DataTable tblScreening = oDataSet.Tables["tblScreeningResults"];
			string sHouseholdName = oDBLookup.GetHouseholdName(nHouseholdID);
			bool bDoDark = false;
			HtmlTableRow oTr;
			HtmlTableCell oTd;

			if (tblSubjects.Rows.Count > 0)
			{
				tdTitle.Style["text-align"] = "right";

				//DF: add app path to href and img tags
				tdTitle.InnerHtml += "<span style=\"text-align: center; width: 90%;\">" + sHouseholdName.ToString() + " Household Information</span>";
				tdTitle.InnerHtml += "<a href=\"" + ap + "/Household/EditPedigree.aspx?HouseholdID=" + nHouseholdID.ToString() + "\"><img src=\"" + ap + "/images/pedigree.gif\" alt=\"Edit Pedigree for Household\" style=\"align: right;\" /></a>&nbsp;";
				tdTitle.InnerHtml += "<a href=\"" + ap + "/Measures/ActionsByHousehold.aspx?HouseholdID=" + nHouseholdID.ToString() + "\"><img src=\"" + ap + "/images/task.gif\" alt=\"View All Actions for Household\" style=\"align: right;\" /></a>&nbsp;";
				tdTitle.InnerHtml += "<a href=\"" + ap + "/WebCal/FutureHouseholdActions.aspx?HouseholdID=" + nHouseholdID.ToString() + "\"><img src=\"" + ap + "/images/dlcalendar_2.gif\" alt=\"View Upcoming Appointments\" style=\"align: right;\" /></a>&nbsp;";
				tdTitle.InnerHtml += "<a href=\"" + ap + "/Household/EditHousehold.aspx?HouseholdID=" + nHouseholdID.ToString() + "\"><img src=\"" + ap + "/images/edit.gif\" alt=\"Edit Household Info\" style=\"align: right;\" /></a>";

				#region Display Person/Subject Information
				HtmlTableCell tdAddress = new HtmlTableCell();
				HtmlTable tblPerson = new HtmlTable();
				tblPerson.Attributes["class"] = "tblPersons";
				tblPerson.CellSpacing = 0;
				tblPerson.Style["width"] = " 100%";
				tblPerson.Style["margin-left"] = " 0px";
				string sPersonID = "0";
				bool bDisplayedAddress = false;
				int nRowSpan = 0;
				string sMainContactAddressID = "";

				#region Display Table Headers
				oTr = new HtmlTableRow();
				oTr.Attributes["class"] = "trTitle";

				oTd = new HtmlTableCell();
				oTd.Style["width"] = " 30%";
				oTd.InnerHtml = "Name";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["width"] = "30%";
				oTd.ColSpan = 2;
				oTd.InnerHtml = "DOB";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["width"] = "15%";
				oTd.InnerHtml = "Age";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["width"] = "5%";
				oTd.InnerHtml = "Sex";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["width"] = "10%";
				oTd.InnerHtml = "Role";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["width"] = "10%";
				oTd.InnerHtml = "Race/Eth.";
				oTr.Cells.Add(oTd);

				tblPerson.Rows.Add(oTr);
				#endregion

				for (int i=0;i<tblSubjects.Rows.Count;i++)
				{
					if (sMainContactAddressID == "" && tblSubjects.Rows[i]["MainContact"].ToString() == "-1")
						sMainContactAddressID = tblSubjects.Rows[i]["AddressID"].ToString();

					if (sPersonID != tblSubjects.Rows[i]["PersonID"].ToString())
					{
						sPersonID = tblSubjects.Rows[i]["PersonID"].ToString();
						bDisplayedAddress = false;
						bDoDark = !bDoDark;

						if (i > 0 && nRowSpan > 1) {tdAddress.RowSpan = nRowSpan;}
						nRowSpan = 0;

						#region Display First, Visible Row
						oTr = new HtmlTableRow();
						if (bDoDark) {oTr.Attributes["class"] = "trDark";}

						oTd = new HtmlTableCell();
						oTd.Style["width"] = " 30%";
						if (tblSubjects.Rows[i]["MainContact"].ToString() == "-1" || tblSubjects.Rows[i]["MainContact"].ToString() == "1") {oTd.Style["font-weight"] = "bold";}
						oTd.InnerHtml += "<a href=\"" + ap + "/Household/CreateSubject.aspx?PersonID=" + sPersonID + "\"><img src=\"" + ap + "/images/book.gif\" alt=\"Enroll in New Study\" /></a>\n";
						oTd.InnerHtml += "<a href=\"javascript:ExpandRow('tr" + tblSubjects.Rows[i]["PersonID"].ToString() + "');\">" + oFormatter.FormatDBOutput(tblSubjects.Rows[i]["FullName"].ToString()) + "</a>";
						if (Convert.ToBoolean(tblSubjects.Rows[i]["IsDeceased"])) {oTd.InnerHtml += "<br/><span style=\"padding-left: 20px; color: #ff0000; font-weight: bold;\">THIS PERSON IS DECEASED</span>";}
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.ColSpan = 2;
						oTd.Style["width"] = "30%";
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSubjects.Rows[i]["DOB"].ToString());
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "15%";
						if (tblSubjects.Rows[i]["DOB"].ToString() != "")
							oTd.InnerHtml += oFormatter.AgeInYearsAndMonths(Convert.ToDateTime(tblSubjects.Rows[i]["DOB"].ToString()));
						else
							oTd.InnerHtml += "&nbsp;";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "5%";
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSubjects.Rows[i]["Sex"].ToString());
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "10%";
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSubjects.Rows[i]["PersonRole"].ToString());
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "10%";
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSubjects.Rows[i]["EthnicityDesc"].ToString());
						oTr.Cells.Add(oTd);

						tblPerson.Rows.Add(oTr);
						#endregion
					}

					#region Add Items to Hidden Inner Table
					if (!bDisplayedAddress)
					{
						if (tblSubjects.Rows[i]["PersonNotes"].ToString().Trim() != "")
						{
							oTr = new HtmlTableRow();
							if (bDoDark) {oTr.Attributes["class"] = "trDark";}

							oTd = new HtmlTableCell();
							oTr.Attributes["name"] = "tr" + tblSubjects.Rows[i]["PersonID"].ToString();
							oTd.ColSpan = 7;  // Col_add: orig 6
							oTd.InnerHtml = "<b>Notes:</b> " + tblSubjects.Rows[i]["PersonNotes"].ToString();

							oTr.Cells.Add(oTd);
							tblPerson.Rows.Add(oTr);
						}

						oTr = new HtmlTableRow();
						if (bDoDark) {oTr.Attributes["class"] = "trDark";}
						oTr.Attributes["id"] = "tr" + tblSubjects.Rows[i]["PersonID"].ToString();

						tdAddress = new HtmlTableCell();

						if (tblSubjects.Rows[i]["MainContact"].ToString() == "-1" || tblSubjects.Rows[i]["AddressID"].ToString() != sMainContactAddressID && tblSubjects.Rows[i]["AddressID"].ToString() != "")
						{
							tdAddress.InnerHtml += tblSubjects.Rows[i]["Address1"].ToString() + "<br/>";
							if (tblSubjects.Rows[i]["Address2"].ToString() != "") {tdAddress.InnerHtml += tblSubjects.Rows[i]["Address2"].ToString() + "<br/>";}
							tdAddress.InnerHtml += tblSubjects.Rows[i]["City"].ToString();
							if (tblSubjects.Rows[i]["State"].ToString() != "") {tdAddress.InnerHtml += ", " + tblSubjects.Rows[i]["State"].ToString() + " ";}
							if (tblSubjects.Rows[i]["Region"].ToString() != "") {tdAddress.InnerHtml += tblSubjects.Rows[i]["Region"].ToString() + " ";}
							if (tblSubjects.Rows[i]["Zip"].ToString() != "") {tdAddress.InnerHtml += tblSubjects.Rows[i]["Zip"].ToString();}
							if (tblSubjects.Rows[i]["Country"].ToString() != "") {tdAddress.InnerHtml += "<br/>" + tblSubjects.Rows[i]["Country"].ToString();}
							tdAddress.InnerHtml += "<br/><a href=\"" + ap + "/Household/EditAddress.aspx?HouseholdID=" + nHouseholdID.ToString() + "\" class=\"smalltext\">Edit Address</a>";
						}
						else
							tdAddress.InnerHtml = "&nbsp;";

						oTr.Cells.Add(tdAddress);

						tblPerson.Rows.Add(oTr);

						bDisplayedAddress = true;

						oTd = new HtmlTableCell();

						if (tblSubjects.Rows[i]["ID"].ToString() != "")
						{
							oTd.InnerHtml = tblSubjects.Rows[i]["StudyName"].ToString() + " - " + tblSubjects.Rows[i]["ID"].ToString();
							oTr.Cells.Add(oTd);   // Col_add

							oTd = new HtmlTableCell();   // Col_add
							oTd.InnerHtml = " <a href=\"" + ap + "/Measures/ActionsBySubject.aspx?SubjectID=" + tblSubjects.Rows[i]["SubjID"].ToString() + "\"><img src=\"/research/images/icon_action.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"14\" alt=\"Actions\"></a>" +
											" <a href=\"" + ap + "/Measures/MeasuresBySubject.aspx?SubjectID=" + tblSubjects.Rows[i]["SubjID"].ToString() + "\"><img src=\"/research/images/icon_measure.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"19\" alt=\"Measures\"></a>" +
											" <a href=\"" + ap + "/Measures/ConsentsBySubject.aspx?SubjectID=" + tblSubjects.Rows[i]["SubjID"].ToString() + "\"><img src=\"/research/images/icon_consent.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"13\" alt=\"Consents\"></a>" +
											" <a href=\"" + ap + "/Tracking/Subject.aspx?subjID=" + tblSubjects.Rows[i]["SubjID"].ToString() + "\"><img src=\"/research/images/icon_ALL.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"40\" alt=\"New!\"></a>" ;
							if (tblSubjects.Rows[i]["StudyName"].ToString() == "PTP")
								oTd.InnerHtml += " <a href=\"" + ap + "/dataentryforms/common/UW_PTP_screen/UW_PTP_screen.aspx?studymeasID=1331&ID=" + tblSubjects.Rows[i]["ID"].ToString() + "&IndexNum=1\"><img src=\"/research/images/icon_screening.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"14\" alt=\"Screening\"></a>";
							if (tblSubjects.Rows[i]["StudyName"].ToString() == "IBIS Network")
								oTd.InnerHtml += " <a href=\"" + ap + "/dataentryforms/common/SI_UW/TSI_UW.aspx?studymeasID=1822&ID=" + tblSubjects.Rows[i]["ID"].ToString() + "&IndexNum=1\"><img src=\"/research/images/icon_screening.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"14\" alt=\"Screening\"></a>";
							if (tblSubjects.Rows[i]["StudyName"].ToString() == "EarlyConnections")
								oTd.InnerHtml += " <a href=\"" + ap + "/dataentryforms/common/TSI_UW/TSI_UW.aspx?studymeasID=1721&ID=" + tblSubjects.Rows[i]["ID"].ToString() + "&IndexNum=1\"><img src=\"/research/images/icon_screening.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"14\" alt=\"Screening\"></a>";
							if (tblSubjects.Rows[i]["StudyName"].ToString() == "Simons")
								oTd.InnerHtml += " <a href=\"" + ap + "/dataentryforms/common/SSC_Screen/SSC_Screen.aspx?studymeasID=1321&ID=" + tblSubjects.Rows[i]["ID"].ToString() + "&IndexNum=1\"><img src=\"/research/images/icon_screening.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"14\" alt=\"Screening\"></a>";
						}
						else
						{
							oTd.ColSpan = 2; // Col_add
							oTd.InnerHtml = "&nbsp;";
						}

						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.ColSpan = 2;

						if (tblSubjects.Rows[i]["ID"].ToString() != "")
							oTd.InnerHtml = "<a href=\"" + ap + "/Measures/EditSubject.aspx?SubjID=" + tblSubjects.Rows[i]["SubjID"].ToString() + "\">" + tblSubjects.Rows[i]["SubjStatus"].ToString() + "</a>";
						else
							oTd.InnerHtml = "&nbsp;";

						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.ColSpan = 2;
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSubjects.Rows[i]["GroupName"].ToString());
						oTr.Cells.Add(oTd);

						tblPerson.Rows.Add(oTr);
					}
					else
					{
						oTr = new HtmlTableRow();
						oTr.Attributes["name"] = "tr" + tblSubjects.Rows[i]["PersonID"].ToString();
						if (bDoDark) {oTr.Attributes["class"] = "trDark";}

						oTd = new HtmlTableCell();

						if (tblSubjects.Rows[i]["ID"].ToString() != "")
						{
							oTd.InnerHtml = tblSubjects.Rows[i]["StudyName"].ToString() + " - " + tblSubjects.Rows[i]["ID"].ToString();
							oTr.Cells.Add(oTd);  // Col_add
							oTd = new HtmlTableCell();  // Col_add
							oTd.InnerHtml = " <a href=\"" + ap + "/Measures/ActionsBySubject.aspx?SubjectID=" + tblSubjects.Rows[i]["SubjID"].ToString() + "\"><img src=\"/research/images/icon_action.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"14\" alt=\"Actions\"></a>" +
											" <a href=\"" + ap + "/Measures/MeasuresBySubject.aspx?SubjectID=" + tblSubjects.Rows[i]["SubjID"].ToString() + "\"><img src=\"/research/images/icon_measure.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"19\" alt=\"Measures\"></a>" +
											" <a href=\"" + ap + "/Measures/ConsentsBySubject.aspx?SubjectID=" + tblSubjects.Rows[i]["SubjID"].ToString() + "\"><img src=\"/research/images/icon_consent.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"13\" alt=\"Consents\"></a>";
							if (tblSubjects.Rows[i]["StudyName"].ToString() == "PTP")
								oTd.InnerHtml += " <a href=\"" + ap + "/dataentryforms/common/UW_PTP_screen/UW_PTP_screen.aspx?studymeasID=1331&ID=" + tblSubjects.Rows[i]["ID"].ToString() + "&IndexNum=1\"><img src=\"/research/images/icon_screening.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"14\" alt=\"Screening\"></a>";
							if (tblSubjects.Rows[i]["StudyName"].ToString() == "IBIS Network")
								oTd.InnerHtml += " <a href=\"" + ap + "/dataentryforms/common/TSI_UW/TSI_UW.aspx?studymeasID=1822&ID=" + tblSubjects.Rows[i]["ID"].ToString() + "&IndexNum=1\"><img src=\"/research/images/icon_screening.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"14\" alt=\"Screening\"></a>";
							if (tblSubjects.Rows[i]["StudyName"].ToString() == "EarlyConnections")
								oTd.InnerHtml += " <a href=\"" + ap + "/dataentryforms/common/TSI_UW/TSI_UW.aspx?studymeasID=1721&ID=" + tblSubjects.Rows[i]["ID"].ToString() + "&IndexNum=1\"><img src=\"/research/images/icon_screening.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"14\" alt=\"Screening\"></a>";
							if (tblSubjects.Rows[i]["StudyName"].ToString() == "Simons")
								oTd.InnerHtml += " <a href=\"" + ap + "/dataentryforms/common/SSC_Screen/SSC_Screen.aspx?studymeasID=1321&ID=" + tblSubjects.Rows[i]["ID"].ToString() + "&IndexNum=1\"><img src=\"/research/images/icon_screening.png\" style=\"vertical-align: middle\" border=\"0\" height=\"14\" width=\"14\" alt=\"Screening\"></a>";
						}
						else
						{
							oTd.ColSpan = 2; // Col_add
							oTd.InnerHtml = "&nbsp;";
						}

						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.ColSpan = 2;

						if (tblSubjects.Rows[i]["ID"].ToString() != "")
							oTd.InnerHtml = "<a href=\"" + ap + "/Measures/EditSubject.aspx?SubjID=" + tblSubjects.Rows[i]["SubjID"].ToString() + "\">" + tblSubjects.Rows[i]["SubjStatus"].ToString() + "</a>";
						else
							oTd.InnerHtml = "&nbsp;";

						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.ColSpan = 2;
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSubjects.Rows[i]["GroupName"].ToString());
						oTr.Cells.Add(oTd);

						tblPerson.Rows.Add(oTr);
					}

					nRowSpan = nRowSpan + 1;
					#endregion
				}

				tdAddress.RowSpan = nRowSpan;

				tdPersonInfo.Controls.Add(tblPerson);
				bDoDark = false;
				#endregion

				#region Display Phone Numbers
				HtmlTable tblPhone = new HtmlTable();
				tblPhone.CellSpacing = 0;
				tblPhone.Attributes["class"] = "tblPersons";
				tblPhone.Style["width"] = " 100%";

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTr.Attributes["class"] = "trTitle";
				oTd.ColSpan = 3;
				oTd.Style["text-align"] = "right";
				oTd.InnerHtml = "<span style=\"width: 90%; text-align: center;\">Household Phone Info.</span>";
				oTd.InnerHtml += "<a href=\"" + ap + "/Household/EditHousehold.aspx?HouseholdID=" + nHouseholdID.ToString() + "\"><img src=\"" + ap + "/images/edit.gif\" alt=\"Edit Household Info\" style=\"align: right;\" /></a>";
				oTr.Cells.Add(oTd);
				tblPhone.Rows.Add(oTr);
				string sPhoneType;

				if (tblPhoneNumbers.Rows.Count > 0)
				{
					for (int i=0;i<tblPhoneNumbers.Rows.Count;i++)
					{
						if (tblPhoneNumbers.Rows[i]["PhoneType"].ToString().Trim() == "")
							sPhoneType = "Unknown";
						else
							sPhoneType = oFormatter.FormatDBOutput(tblPhoneNumbers.Rows[i]["PhoneType"].ToString());

						oTr = new HtmlTableRow();

						oTd = new HtmlTableCell();
						oTd.Attributes["style"] = "white-space: nowrap; font-weight: bold; text-align: right;";
						oTd.InnerHtml = sPhoneType;
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Attributes["style"] = "white-space: nowrap;";
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblPhoneNumbers.Rows[i]["PhoneNumber"].ToString());
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblPhoneNumbers.Rows[i]["PhoneNotes"].ToString());
						oTr.Cells.Add(oTd);

						tblPhone.Rows.Add(oTr);
					}
				}
				else
				{
					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.ColSpan = 2;
					oTd.InnerHtml = "No recorded Phone Numbers.";
					oTr.Cells.Add(oTd);
					tblPhone.Rows.Add(oTr);
				}

				tdPhoneInfo.Controls.Add(tblPhone);
				#endregion

				#region Display Email Addresses
				HtmlTable tblEmail = new HtmlTable();
				tblEmail.CellSpacing = 0;
				tblEmail.Attributes["class"] = "tblPersons";
				tblEmail.Style["width"] = " 100%";

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTr.Attributes["class"] = "trTitle";
				oTd.ColSpan = 3;
				oTd.Style["text-align"] = "right";
				oTd.InnerHtml = "<span style=\"width: 90%; text-align: center;\">Household Email Info.</span>";
				oTd.InnerHtml += "<a href=\"" + ap + "/Household/EditHousehold.aspx?HouseholdID=" + nHouseholdID.ToString() + "\"><img src=\"" + ap + "/images/edit.gif\" alt=\"Edit Household Info\" style=\"align: right;\" /></a>";
				oTr.Cells.Add(oTd);
				tblEmail.Rows.Add(oTr);
				string sEmailType;

				if (tblEmailAddresses.Rows.Count > 0)
				{
					for (int i=0;i<tblEmailAddresses.Rows.Count;i++)
					{
						if (tblEmailAddresses.Rows[i]["EmailType"].ToString().Trim() == "")
							sEmailType = "Unknown";
						else
							sEmailType = oFormatter.FormatDBOutput(tblEmailAddresses.Rows[i]["EmailType"].ToString());

						oTr = new HtmlTableRow();

						oTd = new HtmlTableCell();
						oTd.Attributes["style"] = "white-space: nowrap; font-weight: bold; text-align: right;";
						oTd.InnerHtml = sEmailType;
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Attributes["style"] = "white-space: nowrap;";
						oTd.InnerHtml = "<a href=\"" + tblEmailAddresses.Rows[i]["EmailAddress"].ToString() + "\">" + oFormatter.FormatDBOutput(tblEmailAddresses.Rows[i]["EmailAddress"].ToString()) + "</a>";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblEmailAddresses.Rows[i]["EmailNotes"].ToString());
						oTr.Cells.Add(oTd);

						tblEmail.Rows.Add(oTr);
					}
				}
				else
				{
					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.ColSpan = 2;
					oTd.InnerHtml = "No recorded Email Addresses.";
					oTr.Cells.Add(oTd);
					tblEmail.Rows.Add(oTr);
				}

				tdEmailInfo.Controls.Add(tblEmail);
				tdEmailInfo.Style["page-break-after"] = "always";
				#endregion

				#region Display Info Log
				if (tblInfoLog.Rows.Count > 0)
				{
					#region Display Header Info.
					HtmlTable tblLogInfo = new HtmlTable();
					tblLogInfo.Attributes["class"] = "tblPersons";
					tblLogInfo.Style["width"] = " 100%";
					tblLogInfo.Attributes["name"] = "tblLogInfo";
					tblLogInfo.Attributes["id"] = "tblLogInfo";
					tblLogInfo.CellSpacing = 0;

					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTr.Attributes["class"] = "trTitle";
					oTd.ColSpan = 5;
					oTd.Style["text-align"] = "right";
					oTd.InnerHtml += "<span style=\"text-align: center; width: 90%;\">" + sHouseholdName + " Household Info. Log</span>";
					oTd.InnerHtml += "<a href=\"" + ap + "/Household/AppendLog.aspx?HouseholdID=" + nHouseholdID.ToString() + "\"><img src=\"" + ap + "/images/edit.gif\" alt=\"Append Log\" style=\"align: right;\" /></a>";
					oTr.Cells.Add(oTd);
					tblLogInfo.Rows.Add(oTr);

					oTr = new HtmlTableRow();
					oTr.Attributes["class"] = "trHeader";

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Date";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Priority";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Category";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Staff";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "&nbsp;";
					oTr.Cells.Add(oTd);

					tblLogInfo.Rows.Add(oTr);
					#endregion

					for (int i=0;i<tblInfoLog.Rows.Count;i++)
					{
						oTr = new HtmlTableRow();
						oTr.Attributes["onclick"] = "HighlightRow(this); HighlightRow(document.getElementById('trInfo" + oFormatter.FormatDBOutput(tblInfoLog.Rows[i]["LogInfoID"].ToString()) + "'));";
						if (bDoDark) {oTr.Attributes["class"] = "trDark";}

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "25%";
						oTd.InnerHtml = "<a href=\"javascript:ExpandRow('trInfo" + oFormatter.FormatDBOutput(tblInfoLog.Rows[i]["LogInfoID"].ToString()) + "');\">" + oFormatter.FormatDBOutput(tblInfoLog.Rows[i]["LogInfoDate"].ToString()) + "</a>";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "25%";

						if (tblInfoLog.Rows[i]["LogPriority"].ToString().ToLower() == "urgent")
						{
							oTd.Style["color"] = "#ff0000";
							oTd.Style["font-weight"] = "bold";
						}

						oTd.InnerHtml = oFormatter.FormatDBOutput(tblInfoLog.Rows[i]["LogPriority"].ToString());
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "25%";
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblInfoLog.Rows[i]["LogInfoCat"].ToString());
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "20%";
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblInfoLog.Rows[i]["StaffShortName"].ToString());
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "5%";
						oTd.InnerHtml = "<a href=\"" + ap + "/Household/AppendLog.aspx?HouseholdID=" + nHouseholdID.ToString() + "&amp;LogInfoID=" + oFormatter.FormatDBOutput(tblInfoLog.Rows[i]["LogInfoID"].ToString()) + "\"><img src=\"" + ap + "/images/edit.gif\" alt=\"Edit this Log Entry\" /></a>";
						oTr.Cells.Add(oTd);

						tblLogInfo.Rows.Add(oTr);

						oTr = new HtmlTableRow();
						oTr.Style["display"] = "none";
						oTr.Attributes["id"] = "trInfo" + oFormatter.FormatDBOutput(tblInfoLog.Rows[i]["LogInfoID"].ToString());
						if (bDoDark) {oTr.Style["background-color"] = "#efefef";}

						oTd = new HtmlTableCell();
						oTd.ColSpan = 5;
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblInfoLog.Rows[i]["LogInfoNotes"].ToString());
						oTr.Cells.Add(oTd);

						tblLogInfo.Rows.Add(oTr);

						bDoDark = !bDoDark;
					}

					tdInfoLog.Controls.Add(tblLogInfo);
				}
				else
					tdInfoLog.InnerHtml = "<a href=\"" + ap + "/Household/AppendLog.aspx?HouseholdID=" + nHouseholdID.ToString() + "\" class=\"DoNotPrint\">Add Household Log Entry</a>";

				bDoDark = false;
				#endregion

				#region Display Contact Log
				if (tblContactLog.Rows.Count > 0)
				{
					HtmlTable tblLogContact = new HtmlTable();
					tblLogContact.Attributes["class"] = "tblPersons";
					tblLogContact.Style["width"] = " 100%";
					tblLogContact.Attributes["name"] = "tblLogContact";
					tblLogContact.Attributes["id"] = "tblLogInfo";
					tblLogContact.CellSpacing = 0;

					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTr.Attributes["class"] = "trTitle";
					oTd.ColSpan = 5;
					oTd.Style["text-align"] = "right";
					oTd.InnerHtml += "<span style=\"text-align: center; width: 90%;\">" + sHouseholdName + " Household Contact Log</span>";
					oTd.InnerHtml += "<a href=\"" + ap + "/Household/AppendLog.aspx?HouseholdID=" + nHouseholdID.ToString() + "\"><img src=\"" + ap + "/images/edit.gif\" alt=\"Append Log\" style=\"align: right;\" /></a>";
					oTr.Cells.Add(oTd);
					tblLogContact.Rows.Add(oTr);

					oTr = new HtmlTableRow();
					oTr.Attributes["class"] = "trHeader";

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Date";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Priority";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Contact Type";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Staff";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "&nbsp;";
					oTr.Cells.Add(oTd);

					tblLogContact.Rows.Add(oTr);

					for (int i=0;i<tblContactLog.Rows.Count;i++)
					{
						oTr = new HtmlTableRow();
						oTr.Attributes["onclick"] = "HighlightRow(this); HighlightRow(document.getElementById('trContact" + oFormatter.FormatDBOutput(tblContactLog.Rows[i]["LogContactID"].ToString()) + "'));";
						if (bDoDark) {oTr.Attributes["class"] = "trDark";}
						if (bDoDark) {oTr.Attributes["class"] = "trDark";}

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "25%";
						oTd.InnerHtml = "<a href=\"javascript:ExpandRow('trContact" + oFormatter.FormatDBOutput(tblContactLog.Rows[i]["LogContactID"].ToString()) + "');\">" + oFormatter.FormatDBOutput(tblContactLog.Rows[i]["LogDate"].ToString()) + "</a>";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "25%";

						if (tblContactLog.Rows[i]["LogPriority"].ToString().ToLower() == "urgent")
						{
							oTd.Style["color"] = "#ff0000";
							oTd.Style["font-weight"] = "bold";
						}

						oTd.InnerHtml = oFormatter.FormatDBOutput(tblContactLog.Rows[i]["LogPriority"].ToString());
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "25%";
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblContactLog.Rows[i]["LogContactType"].ToString());
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "20%";
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblContactLog.Rows[i]["StaffShortName"].ToString());
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = "5%";
						oTd.InnerHtml = "<a href=\"" + ap + "/Household/AppendLog.aspx?HouseholdID=" + nHouseholdID.ToString() + "&amp;LogContactID=" + oFormatter.FormatDBOutput(tblContactLog.Rows[i]["LogContactID"].ToString()) + "\"><img src=\"" + ap + "/images/edit.gif\" alt=\"Edit this Log Entry\" /></a>";
						oTr.Cells.Add(oTd);

						tblLogContact.Rows.Add(oTr);

						oTr = new HtmlTableRow();
						oTr.Style["display"] = "none";
						oTr.Attributes["id"] = "trContact" + oFormatter.FormatDBOutput(tblContactLog.Rows[i]["LogContactID"].ToString());
						if (bDoDark) {oTr.Style["background-color"] = "#efefef";}

						oTd = new HtmlTableCell();
						oTd.ColSpan = 5;
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblContactLog.Rows[i]["LogNotes"].ToString());
						oTr.Cells.Add(oTd);

						tblLogContact.Rows.Add(oTr);

						bDoDark = !bDoDark;
					}
					
					tdContactLog.Controls.Add(tblLogContact);
				}
				else
					tdContactLog.InnerHtml = "<a href=\"" + ap + "/Household/AppendLog.aspx?HouseholdID=" + nHouseholdID.ToString() + "\" class=\"DoNotPrint\">Add Contact Log Entry</a>";

				bDoDark = false;
				#endregion

				#region Display Secondary Contact Info
				if (tblSecondaryContacts.Rows.Count > 0)
				{
					HtmlTable tblSecondaryContact = new HtmlTable();
					tblSecondaryContact.Attributes["class"] = "tblPersons";
					tblSecondaryContact.Style["width"] = " 100%";
					tblSecondaryContact.Attributes["name"] = "tblAddress";
					tblSecondaryContact.Attributes["id"] = "tblSecondaryContact";
					tblSecondaryContact.CellSpacing = 0;

					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTr.Attributes["class"] = "trTitle";
					oTd.ColSpan = 2;
					oTd.InnerHtml = "Secondary Contact Info.";
					oTr.Cells.Add(oTd);
					tblSecondaryContact.Rows.Add(oTr);

					if (tblSecondaryContacts.Rows.Count > 0)
					{
						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTd.Style["text-align"] = " right";
						oTd.Style["font-weight"] = " bold";
						oTd.Style["width"] = " 35%";
						oTd.InnerHtml = "First Name";
						oTr.Cells.Add(oTd);
						oTd = new HtmlTableCell();
						oTd.InnerHtml += oFormatter.FormatDBOutput(tblSecondaryContacts.Rows[0]["FirstName"].ToString());
						oTr.Cells.Add(oTd);
						tblSecondaryContact.Rows.Add(oTr);

						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTd.Style["text-align"] = " right";
						oTd.Style["font-weight"] = " bold";
						oTd.Style["width"] = " 35%";
						oTd.InnerHtml = "Last Name";
						oTr.Cells.Add(oTd);
						oTd = new HtmlTableCell();
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSecondaryContacts.Rows[0]["LastName"].ToString());
						oTr.Cells.Add(oTd);
						tblSecondaryContact.Rows.Add(oTr);

						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTd.Style["text-align"] = " right";
						oTd.Style["font-weight"] = " bold";
						oTd.Style["width"] = " 35%";
						oTd.InnerHtml = "Relationship";
						oTr.Cells.Add(oTd);
						oTd = new HtmlTableCell();
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSecondaryContacts.Rows[0]["EmerContactType"].ToString());
						oTr.Cells.Add(oTd);
						tblSecondaryContact.Rows.Add(oTr);

						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTd.Style["text-align"] = " right";
						oTd.Style["font-weight"] = " bold";
						oTd.Style["width"] = " 35%";
						oTd.InnerHtml = "Phone 1";
						oTr.Cells.Add(oTd);
						oTd = new HtmlTableCell();
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSecondaryContacts.Rows[0]["Phone1"].ToString());
						oTr.Cells.Add(oTd);
						tblSecondaryContact.Rows.Add(oTr);

						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTd.Style["text-align"] = " right";
						oTd.Style["font-weight"] = " bold";
						oTd.Style["width"] = " 35%";
						oTd.InnerHtml = "Phone 2";
						oTr.Cells.Add(oTd);
						oTd = new HtmlTableCell();
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSecondaryContacts.Rows[0]["Phone2"].ToString());
						oTr.Cells.Add(oTd);
						tblSecondaryContact.Rows.Add(oTr);

						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTd.Style["text-align"] = " right";
						oTd.Style["font-weight"] = " bold";
						oTd.Style["width"] = " 35%";
						oTd.InnerHtml = "Address";
						oTr.Cells.Add(oTd);
						oTd = new HtmlTableCell();
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSecondaryContacts.Rows[0]["Address"].ToString());
						oTr.Cells.Add(oTd);
						tblSecondaryContact.Rows.Add(oTr);

						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTd.Style["text-align"] = " right";
						oTd.Style["font-weight"] = " bold";
						oTd.Style["width"] = " 35%";
						oTd.InnerHtml = "City";
						oTr.Cells.Add(oTd);
						oTd = new HtmlTableCell();
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSecondaryContacts.Rows[0]["City"].ToString());
						oTr.Cells.Add(oTd);
						tblSecondaryContact.Rows.Add(oTr);

						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTd.Style["text-align"] = " right";
						oTd.Style["font-weight"] = " bold";
						oTd.Style["width"] = " 35%";
						oTd.InnerHtml = "State";
						oTr.Cells.Add(oTd);
						oTd = new HtmlTableCell();
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSecondaryContacts.Rows[0]["StateName"].ToString());
						oTr.Cells.Add(oTd);
						tblSecondaryContact.Rows.Add(oTr);

						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTd.Style["text-align"] = " right";
						oTd.Style["font-weight"] = " bold";
						oTd.Style["width"] = " 35%";
						oTd.InnerHtml = "Postal Code";
						oTr.Cells.Add(oTd);
						oTd = new HtmlTableCell();
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSecondaryContacts.Rows[0]["Zip"].ToString());
						oTr.Cells.Add(oTd);
						tblSecondaryContact.Rows.Add(oTr);

						oTr = new HtmlTableRow();
						oTd = new HtmlTableCell();
						oTd.Style["text-align"] = " right";
						oTd.Style["font-weight"] = " bold";
						oTd.Style["width"] = " 35%";
						oTd.InnerHtml = "Notes";
						oTr.Cells.Add(oTd);
						oTd = new HtmlTableCell();
						oTd.InnerHtml = oFormatter.FormatDBOutput(tblSecondaryContacts.Rows[0]["Notes"].ToString());
						oTr.Cells.Add(oTd);
						tblSecondaryContact.Rows.Add(oTr);
					}

					tdSecondaryContact.Controls.Add(tblSecondaryContact);
				}
				else
					tdSecondaryContact.InnerHtml = "&nbsp;";
				#endregion

				#region Display Screening Information
				//FIX: since the "SSS" objects have been removed from the "backend" db this section will no longer work.  -JM  May 22, 2017
				if(1==2)
//				if (tblScreening.Rows.Count > 0)
				{
					HtmlTable tblScreeningInfo = new HtmlTable();
					tblScreeningInfo.Attributes["class"] = "tblPersons";
					tblScreeningInfo.Style["width"] = " 100%";
					tblScreeningInfo.Attributes["name"] = "tblScreeningInfo";
					tblScreeningInfo.Attributes["id"] = "tblScreeningInfo";
					tblScreeningInfo.CellSpacing = 0;

					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTr.Attributes["class"] = "trTitle";
					oTd.ColSpan = 2;
					oTd.InnerHtml = "Screening Information";
					oTr.Cells.Add(oTd);
					tblScreeningInfo.Rows.Add(oTr);

					for (int i=0;i<tblScreening.Rows.Count;i++)
					{
						oTr = new HtmlTableRow();

						oTd = new HtmlTableCell();
						oTd.InnerHtml = tblScreening.Rows[i]["FullName"].ToString();
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = "<a href=\"" + ap + "/screening/results/individual_results.asp?selSurveyID=" + tblScreening.Rows[i]["SurveyID"].ToString() + "&amp;selPersonID=" + tblScreening.Rows[i]["PersonID"].ToString() + "\">" + tblScreening.Rows[i]["SurveyName"].ToString() + "</a>";
						oTr.Cells.Add(oTd);

						tblScreeningInfo.Rows.Add(oTr);
					}

					tdScreening.Controls.Add(tblScreeningInfo);
				}
				else
					tdScreening.InnerHtml = "&nbsp;";
				#endregion
			}
			else
			{
				tblMaster.Rows.Clear();
				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "The Household you selected does not exist or there are no persons within the Household.<br/><a href=\"" + ap + "/Household/EditHousehold.aspx?HouseholdID=" + nHouseholdID.ToString() + "\">Click here to try to edit the Household.</a>";
				oTr.Cells.Add(oTd);

				tblMaster.Rows.Add(oTr);
			}
		}

		#region Get Household Info
		private DataSet GetHouseholdInfo(int nHouseholdID)
		{
			SqlCommand oCmd = new SqlCommand();
			DataSet oDataSet = new DataSet();
			SqlDataAdapter oDataAdapter;

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nHouseholdID));

			//Add a table to the DataSet object for the phone number information.
			oCmd.CommandText = "spGetPhoneNumbersByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblPhoneNumbers");

			//Add a table to the DataSet object for the email address information.
			oCmd.CommandText = "spGetEmailAddressesByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblEmailAddresses");

			//Get Subjects was here

			//Add a table to the DataSet object for the emrgency contact information.
			oCmd.CommandText = "spGetEmergencyContactByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblSecondaryContact");

			//Add a table to the DataSet object for the information log.
			oCmd.CommandText = "spGetInfoLogByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblInfoLog");

			//Add a table to the DataSet object for the information log.
			oCmd.CommandText = "spGetContactLogByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblContactLog");

			//Add a table to the DataSet object for the screening information.
			oCmd.CommandText = "usp_SSS_Get_All_Surveys_By_Household_ID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblScreeningResults");

			oCmd.Parameters.Add(new SqlParameter("@auth_user", SqlDbType.VarChar, 200, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Request.ServerVariables["AUTH_USER"]));

			//Add a table to the DataSet object for the subject information.
			oCmd.CommandText = "spAuthUser_GetSubjectsByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblSubjects");

			return oDataSet;
		}
		#endregion
		protected void btnNew_Click(object sender, EventArgs e)
		{

			int hhID = Convert.ToInt32(Request.QueryString["HouseholdID"].ToString());
			if(hhID > 0)
			{
				Response.Redirect("~/Tracking/Household.aspx?hhID=" + hhID.ToString());
			}

		}
}
}
