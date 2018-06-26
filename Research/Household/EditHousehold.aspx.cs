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
	public partial class EditHousehold : System.Web.UI.Page
	{
		private TextFormatter oFormatter = new TextFormatter();
		private ReadConfig oConfig = new ReadConfig();
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitEditHousehold());";
			oDBLookup = new DBLookup(Master.SqlConn);

			int nHouseholdID = Convert.ToInt32(Request["HouseholdID"].ToString());
			hidHouseholdID.Value = nHouseholdID.ToString();

			//DF: 4/9 add app path
			btnEditAddresses.Attributes["onclick"] = "document.location = '" + Request.ApplicationPath + "/Household/EditAddress.aspx?HouseholdID=" + nHouseholdID.ToString() + "';";
			btnMainHouseholdPage.Attributes["onclick"] = "window.location.href = '" + Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + nHouseholdID.ToString() + "';";
			string sError = "";
			HtmlTableRow oTr;
			HtmlTableCell oTd;
			int nEmerContactID = 0;
			string sEmerFirstName = "";
			string sEmerLastName = "";
			string sEmerContactType = "";
			string sPhone1 = "";
			string sPhone2 = "";
			string sAddress = "";
			string sCity = "";
			string sState = "";
			string sEmerNotes = "";
			string sZip = "";

			if (IsPostBack)
			{
				#region Get and Update Person and Household Information.
				string[] aPersonID = Request["hidPersonID"].Replace(", ", ",").Split(',');
				string[] aFirstName = Request["txtFirstName"].Replace(", ", ",").Split(',');
				string[] aLastName = Request["txtLastName"].Replace(", ", ",").Split(',');
				string[] aNickName = Request["txtNickName"].Replace(", ", ",").Split(',');
				string[] aMiddleName = Request["txtMiddleName"].Replace(", ", ",").Split(',');
				string[] aLastNameOnBC = Request["txtLastNameOnBC"].Replace(", ", ",").Split(',');
				string[] aCityOfBirth = Request["txtCityOfBirth"].Replace(", ", ",").Split(',');
				string[] aStateOfBirth = Request["txtStateOfBirth"].Replace(", ", ",").Split(',');
				string[] aSex = Request["selSex"].Replace(", ", ",").Split(',');
				string[] aDOB = Request["txtDOB"].Replace(", ", ",").Split(',');
				string[] aRaceID = Request["selRaceID"].Replace(", ", ",").Split(',');
				string[] aEthnicityID = Request["selEthnicityID"].Replace(", ", ",").Split(',');
				string[] aRoleID = Request["selPersonRoleID"].Replace(", ", ",").Split(',');
				string[] aIsDeceased = Request["hidIsDeceased"].Replace(", ", ",").Split(',');
				string[] aDoNotContact = Request["hidDoNotContact"].Replace(", ", ",").Split(',');
				string sMainContact = Request["radMainContact"].ToString();
				string[] aAddressIDs = Request["selAddressID"].Replace(", ", ",").Split(',');
				string[] aMotherIDs = Request["selMother"].Replace(", ", ",").Split(',');
				string[] aFatherIDs = Request["selFather"].Replace(", ", ",").Split(',');
				string[] aPersonNotes = Request["txtPersonNotes"].Replace(", ", ",").Split(',');

				if (sMainContact == "")
					sError += "Error: no Main Contact designated.<br/>";
				else
				{
					if (!UpdateHousehold(Convert.ToInt32(hidHouseholdID.Value), txtHouseholdName.Value))
						sError += "Error updating Household Name.<br/>";

					if (!UpdatePerson(nHouseholdID, aPersonID, aFirstName, aLastName, aNickName, aMiddleName, aLastNameOnBC, aCityOfBirth, aStateOfBirth, aSex, aDOB, aRaceID, aEthnicityID, aRoleID, aIsDeceased, sMainContact, aAddressIDs, aMotherIDs, aFatherIDs, aPersonNotes, aDoNotContact))
						sError += "Error updating Persons.<br/>";
				}
				#endregion

				#region Get and Update Phone Number Information.
				if (Request["hidPhoneNumberID"] != null)
				{
					string[] aPhoneNumberID = Request["hidPhoneNumberID"].Replace(", ", ",").Split(',');
					string[] aPhoneNumber = Request["txtPhoneNumber"].Replace(", ", ",").Split(',');
					string[] aPhoneType = Request["txtPhoneNumberType"].Replace(", ", ",").Split(',');
					string[] aPhoneNotes = Request["txtPhoneNumberNotes"].Replace(", ", ",").Split(',');

					if (!UpdatePhoneNumber(nHouseholdID, aPhoneNumberID, aPhoneNumber, aPhoneType, aPhoneNotes))
						sError += "Error updating Phone Numbers.<br/>";
				}
				#endregion

				#region Get and Update Email Information.
				if (Request["hidEmailID"] != null)
				{
					string[] aEmailAddressID = Request["hidEmailID"].Replace(", ", ",").Split(',');
					string[] aEmailAddress = Request["txtEmailAddress"].Replace(", ", ",").Split(',');
					string[] aEmailType = Request["txtEmailAddressType"].Replace(", ", ",").Split(',');
					string[] aEmailNotes = Request["txtEmailAddressNotes"].Replace(", ", ",").Split(',');

					if (!UpdateEmailAddress(nHouseholdID, aEmailAddressID, aEmailAddress, aEmailType, aEmailNotes))
						sError += "Error updating Email Addresses.<br/>";
				}
				#endregion

				#region Get and Update Emergency Contact Information.
				if (Request["hidEmerContactID"] != null)
				{
					nEmerContactID = Convert.ToInt32(Request["hidEmerContactID"].ToString());
					sEmerFirstName = Request["txtEmerFirstName"].ToString();
					sEmerLastName = Request["txtEmerLastName"].ToString();
					sEmerContactType = Request["txtRelationship"].ToString();
					sPhone1 = Request["txtPhone1"].ToString();
					sPhone2 = Request["txtPhone2"].ToString();
					sAddress = Request["txtAddress"].ToString();
					sCity = Request["txtCity"].ToString();
					sState = Request["selState"].ToString();
					sEmerNotes = Request["txtEmerNotes"].ToString();

					if (Request["txtZip"].ToString() != "")
						sZip = Request["txtZip"].ToString();
					else
						sZip = "0";

					if (!UpdateEmergencyContact(nEmerContactID, nHouseholdID, sEmerFirstName, sEmerLastName, sEmerContactType, sPhone1, sPhone2, sAddress, sCity, sState, sZip, sEmerNotes))
						sError += "Error updating Emergency Contact Info.<br/>";
				}
				#endregion

				if (sError != "")
				{
					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.Style["background-color"] = " #ffffff";
					oTd.InnerHtml = "<span class=\"error\">" + sError + "</span>";
					oTr.Cells.Add(oTd);
					tblMaster.Rows.Insert(0, oTr);
				}
			}

			DataSet oDataSet = GetHouseholdInfo(nHouseholdID);

			if (oDataSet.Tables["tblHousehold"].Rows.Count > 0)
			{
				DataTable tblHousehold = oDataSet.Tables["tblHousehold"];
				DataTable tblPersons = oDataSet.Tables["tblPersons"];
				DataTable tblPhoneNumbers = oDataSet.Tables["tblPhoneNumbers"];
				DataTable tblEmailAddresses = oDataSet.Tables["tblEmailAddresses"];
				DataTable tblEmergencyContacts = oDataSet.Tables["tblEmergencyContact"];

				tdTitle.InnerHtml = oFormatter.FormatDBOutput(tblHousehold.Rows[0]["HouseholdName"].ToString()) + " Household Information";
				txtHouseholdName.Value = tblHousehold.Rows[0]["HouseholdName"].ToString();

				#region Display Persons Table
				HtmlTable htblPersons = new HtmlTable();
				htblPersons.Attributes["class"] = "tblPersons";
				htblPersons.Style["width"] = " 100%";
				htblPersons.Attributes["id"] = "tblPersons";
				htblPersons.CellSpacing = 0;

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTr.Attributes["class"] = "trTitle";
				oTd.ColSpan = 6;
				oTd.InnerHtml = tblHousehold.Rows[0]["HouseholdName"].ToString() + " Household Members";
				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidIsDeceased\" id=\"hidIsDeceased\" />";
				oTd.InnerHtml += "<br /><input type=\"hidden\" name=\"hidDoNotContact\" id=\"hidDoNotContact\" />";

				oTr.Cells.Add(oTd);
				htblPersons.Rows.Add(oTr);

				for (int i=0;i<tblPersons.Rows.Count;i++)
				{
					oTr = new HtmlTableRow();
					oTr.Attributes["onclick"] = "GetPersonInfo(" + tblPersons.Rows[i]["PersonID"].ToString() + ", '" + tblPersons.Rows[i]["FirstName"].ToString() + "', 'trPerson" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trAddress" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trNDAR" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trDOB" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "');";
					oTr.Attributes["id"] = "trPerson" + tblPersons.Rows[i]["PersonID"].ToString();

					oTd = new HtmlTableCell();
					oTd.RowSpan = 5;
					oTd.Style["text-align"] = " center";
					oTd.InnerHtml += "<label for=\"radMainContact" + tblPersons.Rows[i]["PersonID"].ToString() + "\">Main</label><br/>";
					oTd.InnerHtml += "<input type=\"radio\" name=\"radMainContact\" value=\"" + tblPersons.Rows[i]["PersonID"].ToString() + "\" style=\"width: 20px;\"";
					if (tblPersons.Rows[i]["MainContact"].ToString() != "0" && tblPersons.Rows[i]["MainContact"].ToString() != "") {oTd.InnerHtml += " checked=\"True\"";}
					oTd.InnerHtml += " id=\"radMainContact" + tblPersons.Rows[i]["PersonID"].ToString() + "\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.InnerHtml += "<input type=\"hidden\" name=\"hidPersonID\" value=\"" + tblPersons.Rows[i]["PersonID"].ToString() + "\" />";
					oTd.InnerHtml += "<label for=\"txtFirstName" + tblPersons.Rows[i]["PersonID"].ToString() + "\">First Name</label><span style=\"color:Red\">*</span><br/>";
					oTd.InnerHtml += "<input type=\"text\" name=\"txtFirstName\" value=\"" + tblPersons.Rows[i]["FirstName"].ToString() + "\" id=\"txtFirstName" + tblPersons.Rows[i]["PersonID"].ToString() + "\" style=\"width: 100px;\" />";
					if (tblPersons.Rows[i]["PersonNotes"].ToString() != "") {oTd.InnerHtml += "*";}
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.InnerHtml += "<label for=\"txtLastName" + tblPersons.Rows[i]["PersonID"].ToString() + "\">Last Name</label><br/>";
					oTd.InnerHtml += "<input type=\"text\" name=\"txtLastName\" value=\"" + tblPersons.Rows[i]["LastName"].ToString() + "\" id=\"txtLastName" + tblPersons.Rows[i]["PersonID"].ToString() + "\" style=\"width: 100px;\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.InnerHtml += "<label for=\"txtNickName" + tblPersons.Rows[i]["PersonID"].ToString() + "\">Nickname</label><br/>";
					oTd.InnerHtml += "<input type=\"text\" name=\"txtNickName\" value=\"" + tblPersons.Rows[i]["NickName"].ToString() + "\" id=\"txtNickName" + tblPersons.Rows[i]["PersonID"].ToString() + "\" style=\"width: 100px;\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.InnerHtml += "<label for=\"selSex" + tblPersons.Rows[i]["PersonID"].ToString() + "\">Sex</label><span style=\"color:Red\">*</span><br/>";
					oTd.InnerHtml += "<select name=\"selSex\" style=\"width: 35px;\" id=\"selSex" + tblPersons.Rows[i]["PersonID"].ToString() + "\">";
					if (tblPersons.Rows[i]["Sex"].ToString().ToUpper() == "M")
						oTd.InnerHtml += "<option value=\"M\" selected=\"True\">M</option><option value=\"F\">F</option>";
					else
						oTd.InnerHtml += "<option value=\"M\">M</option><option value=\"F\" selected=\"True\">F</option>";
					oTd.InnerHtml += "</select>";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; vertical-align: bottom; padding-left: 0px;";
					oTd.InnerHtml += "<input type=\"checkbox\" name=\"chkDeceased" + tblPersons.Rows[i]["PersonID"].ToString() + "\" value=\"True\" id=\"chkDeceased" + tblPersons.Rows[i]["PersonID"].ToString() + "\"";
					if (Convert.ToBoolean(tblPersons.Rows[i]["IsDeceased"])) {oTd.InnerHtml += " checked=\"checked\"";}
					oTd.InnerHtml += " />";
					oTd.InnerHtml += "<label for=\"chkDeceased" + tblPersons.Rows[i]["PersonID"].ToString() + "\">Deceased?</label>";

					oTd.InnerHtml += "<br/><input style=\"width: 50px;\" type=\"checkbox\" name=\"chkDoNotContact" + tblPersons.Rows[i]["PersonID"].ToString() + "\" value=\"True\" id=\"chkDoNotContact" + tblPersons.Rows[i]["PersonID"].ToString() + "\"";
					if (Convert.ToBoolean(tblPersons.Rows[i]["DoNotContact"])) { oTd.InnerHtml += " checked=\"checked\""; }
					oTd.InnerHtml += " />";
					oTd.InnerHtml += "<label for=\"chkDoNotContact" + tblPersons.Rows[i]["PersonID"].ToString() + "\">Do Not Contact For Future Studies</label>";

					oTr.Cells.Add(oTd);

					htblPersons.Rows.Add(oTr);
					oTr = new HtmlTableRow();
					oTr.Attributes["onclick"] = "GetPersonInfo(" + tblPersons.Rows[i]["PersonID"].ToString() + ", '" + tblPersons.Rows[i]["FirstName"].ToString() + "', 'trPerson" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trAddress" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trNDAR" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trDOB" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "');";
					oTr.Attributes["id"] = "trNDAR" + tblPersons.Rows[i]["PersonID"].ToString();

					// Note NoMiddleName icon for NDAR use 7/16/2010 SC
					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.InnerHtml += "<label for=\"txtMiddleName" + tblPersons.Rows[i]["PersonID"].ToString() + "\">Middle Name</label><span style=\"color:Red\">*</span><br/>";
					oTd.InnerHtml += "<input type=\"text\" name=\"txtMiddleName\" value=\"" + tblPersons.Rows[i]["MiddleName"].ToString() + "\" id=\"txtMiddleName" + tblPersons.Rows[i]["PersonID"].ToString() + "\" style=\"width: 100px;\" />";
					oTd.InnerHtml += "&nbsp;<input type=\"image\" src=\"~/images/icon_no.png\" width=\"15\" height=\"15\" border=\"0\" title=\"Click here if no middle name on birth certificate.\" OnClick=\"this.form.txtMiddleName" + tblPersons.Rows[i]["PersonID"].ToString() + ".value='SUBJECTHASNOMIDDLENAME';\"/>";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.InnerHtml += "<label for=\"txtLastNameOnBC" + tblPersons.Rows[i]["PersonID"].ToString() + "\">Last Name on Birth Certificate</label><span style=\"color:Red\">*</span><br/>";
					oTd.InnerHtml += "<input type=\"text\" name=\"txtLastNameOnBC\" value=\"" + tblPersons.Rows[i]["LastNameOnBC"].ToString() + "\" id=\"txtLastNameOnBC" + tblPersons.Rows[i]["PersonID"].ToString() + "\" style=\"width: 100px;\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.InnerHtml += "<label for=\"txtCityOfBirth" + tblPersons.Rows[i]["PersonID"].ToString() + "\">City of Birth</label><span style=\"color:Red\">*</span><br/>";
					oTd.InnerHtml += "<input type=\"text\" name=\"txtCityOfBirth\" value=\"" + tblPersons.Rows[i]["CityOfBirth"].ToString() + "\" id=\"txtCityOfBirth" + tblPersons.Rows[i]["PersonID"].ToString() + "\" style=\"width: 100px;\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.ColSpan = 2;
					oTd.Attributes["style"] = "border-bottom: 0px";
					oTd.InnerHtml += "<label for=\"txtStateOfBirth" + tblPersons.Rows[i]["PersonID"].ToString() + "\">State of Birth</label><br/>";
					oTd.InnerHtml += "<input type=\"text\" name=\"txtStateOfBirth\" value=\"" + tblPersons.Rows[i]["StateOfBirth"].ToString() + "\" id=\"txtStateOfBirth" + tblPersons.Rows[i]["PersonID"].ToString() + "\" style=\"width: 100px;\" />";
					oTr.Cells.Add(oTd);

					htblPersons.Rows.Add(oTr);

					oTr = new HtmlTableRow();
					oTr.Attributes["onclick"] = "GetPersonInfo(" + tblPersons.Rows[i]["PersonID"].ToString() + ", '" + tblPersons.Rows[i]["FirstName"].ToString() + "', 'trPerson" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trAddress" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trNDAR" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trDOB" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "');";
					oTr.Attributes["id"] = "trDOB" + tblPersons.Rows[i]["PersonID"].ToString();

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.InnerHtml += "<label for=\"txtDOB" + i.ToString() + "\">DOB</label><span style=\"color:Red\">*</span><br/>";
					oTd.InnerHtml += "<input type=\"text\" name=\"txtDOB\" id=\"txtDOB" + i.ToString() + "\" value=\"" + tblPersons.Rows[i]["DOB"].ToString() + "\" style=\"width: 100px;\" />";

					//DF: add app path
					oTd.InnerHtml += "<img src=\"" + Request.ApplicationPath + "/images/dlcalendar_2.gif\" name=\"img" + i.ToString() + "\" style=\"margin-left: 4px;\" />";
					spnCalendar.InnerHtml += "<dlcalendar click_element_id=\"img" + i.ToString() + "\" input_element_id=\"txtDOB" + i.ToString() + "\"></dlcalendar>";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.InnerHtml += "<label for=\"selRaceID" + i.ToString() + "\">Race</label><br/>";
					oTd.InnerHtml += oDBLookup.BindDropDownList("selRaceID", "EXEC spGetEthnicities", "EthnicityDesc", "EthnicityID", tblPersons.Rows[i]["EthnicityID"].ToString(), "--Select Race--", "width: 175px;");
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.InnerHtml += "<label for=\"selEthnicityID" + i.ToString() + "\">Ethnicity</label><br/>";
					oTd.InnerHtml += oDBLookup.BindDropDownList("selEthnicityID", "EXEC spGetHispanicOptions", "HispanicDesc", "HispanicID", tblPersons.Rows[i]["HispanicID"].ToString(), "--Select Ethnicity--", "width: 150px;");
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.ColSpan = 2;
					oTd.Attributes["style"] = "border-bottom: 0px;";
					oTd.InnerHtml += "<label for=\"selPersonRoleID" + i.ToString() + "\">Role</label><br/>";
					oTd.InnerHtml += oDBLookup.BindDropDownList("selPersonRoleID", "EXEC spGetPersonRoles", "PersonRole", "PersonRoleID", tblPersons.Rows[i]["Role"].ToString(), "--Family Role--", "width: 150px;");
					oTr.Cells.Add(oTd);

					htblPersons.Rows.Add(oTr);
					oTr = new HtmlTableRow();
					oTr.Attributes["onclick"] = "GetPersonInfo(" + tblPersons.Rows[i]["PersonID"].ToString() + ", '" + tblPersons.Rows[i]["FirstName"].ToString() + "', 'trPerson" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trAddress" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trNDAR" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trDOB" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "');";
					oTr.Attributes["id"] = "trAddress" + tblPersons.Rows[i]["PersonID"].ToString();

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.ColSpan = 2;
					oTd.InnerHtml += "<label for=\"selAddressID\">Address:</label><br/>";
					oTd.InnerHtml += oDBLookup.BindDropDownList("selAddressID", "EXEC spGetAddressesByHouseholdID " + nHouseholdID, "FullAddress", "AddressID", tblPersons.Rows[i]["AddressID"].ToString(), "--Select an Address--", "width: 350px;");
					oTd.Style["padding-bottom"] = " 12px;";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px; border-right: 0px;";
					oTd.InnerHtml += "<label for=\"selMother\">Mother<br/>";
					oTd.InnerHtml += oDBLookup.BindDropDownList("selMother", "EXEC spGetOlderHouseholdMembersByPersonID " + tblPersons.Rows[i]["PersonID"].ToString() + ", 'F'", "FullName", "PersonID", tblPersons.Rows[i]["MotherPersonID"].ToString(), "--Select Mother--", "width: 175px;");
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "border-bottom: 0px;";
					oTd.ColSpan = 2;
					oTd.InnerHtml += "<label for=\"selFather\">Father<br/>";
					oTd.InnerHtml += oDBLookup.BindDropDownList("selFather", "EXEC spGetOlderHouseholdMembersByPersonID " + tblPersons.Rows[i]["PersonID"].ToString() + ", 'M'", "FullName", "PersonID", tblPersons.Rows[i]["FatherPersonID"].ToString(), "--Select Father--", "width: 175px;");
					oTr.Cells.Add(oTd);

					htblPersons.Rows.Add(oTr);

					oTr = new HtmlTableRow();
					oTr.Attributes["onclick"] = "GetPersonInfo(" + tblPersons.Rows[i]["PersonID"].ToString() + ", '" + tblPersons.Rows[i]["FirstName"].ToString() + "', 'trPerson" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trAddress" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trNDAR" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'trDOB" + tblPersons.Rows[i]["PersonID"].ToString() + "', 'txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "');";
					oTr.Attributes["id"] = "txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString();

					oTd = new HtmlTableCell();
					oTd.ColSpan = 5;
					oTd.InnerHtml += "<textarea name=\"txtPersonNotes\" rows=\"4\" style=\"width: 95%;\" id=\"txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "\">" + tblPersons.Rows[i]["PersonNotes"].ToString() + "</textarea>";
					oTr.Cells.Add(oTd);

					htblPersons.Rows.Add(oTr);

//					tdPersonNotes.InnerHtml += "<textarea name=\"txtPersonNotes\" rows=\"4\" style=\"width: 95%; display: none;\" id=\"txtPersonNotes" + tblPersons.Rows[i]["PersonID"].ToString() + "\">" + tblPersons.Rows[i]["PersonNotes"].ToString() + "</textarea>";
				}

				tdPersons.Controls.Add(htblPersons);
				#endregion

				#region Display Phone Number Table
				HtmlTable htblPhoneNumber = new HtmlTable();
				htblPhoneNumber.Attributes["class"] = "tblPersons";
				htblPhoneNumber.Style["width"] = " 100%";
				htblPhoneNumber.Attributes["id"] = "tblPhoneNumber";
				htblPhoneNumber.CellSpacing = 0;

				oTr = new HtmlTableRow();
				oTr.Attributes["class"] = "trHeader";

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "Phone #";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "Type";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "Notes";
				oTr.Cells.Add(oTd);

				htblPhoneNumber.Rows.Add(oTr);

				if (tblPhoneNumbers.Rows.Count > 0)
				{
					for (int i=0;i<tblPhoneNumbers.Rows.Count;i++)
					{
						oTr = new HtmlTableRow();

						oTd = new HtmlTableCell();
						oTd.Style["width"] = " 20%";
						oTd.InnerHtml += "<input type=\"hidden\" name=\"hidPhoneNumberID\" value=\"" + tblPhoneNumbers.Rows[i]["PhoneID"].ToString() + "\" />";
						oTd.InnerHtml += "<input type=\"text\" name=\"txtPhoneNumber\" value=\"" + tblPhoneNumbers.Rows[i]["PhoneNumber"].ToString() + "\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = " 20%";
						oTd.InnerHtml += "<input type=\"text\" name=\"txtPhoneNumberType\" value=\"" + tblPhoneNumbers.Rows[i]["PhoneType"].ToString() + "\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml += "<textarea rows=\"1\" name=\"txtPhoneNumberNotes\" style=\"width: 100%;\">" + tblPhoneNumbers.Rows[i]["PhoneNotes"].ToString() + "</textarea>";
						oTr.Cells.Add(oTd);

						htblPhoneNumber.Rows.Add(oTr);
					}
				}
				else
				{
					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.ColSpan = 3;
					oTd.InnerHtml = "No recorded Phone Number.";
					oTr.Cells.Add(oTd);
					htblPhoneNumber.Rows.Add(oTr);
					
				}

				tdPhoneNumber.Controls.Add(htblPhoneNumber);
				#endregion

				#region Display Email Address Table
				HtmlTable htblEmailAddress = new HtmlTable();
				htblEmailAddress.Attributes["class"] = "tblPersons";
				htblEmailAddress.Style["width"] = " 100%";
				htblEmailAddress.Attributes["id"] = "tblEmailAddress";
				htblEmailAddress.CellSpacing = 0;

				oTr = new HtmlTableRow();
				oTr.Attributes["class"] = "trHeader";

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "Email";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "Type";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "Notes";
				oTr.Cells.Add(oTd);

				htblEmailAddress.Rows.Add(oTr);

				if (tblEmailAddresses.Rows.Count > 0)
				{
					for (int i=0;i<tblEmailAddresses.Rows.Count;i++)
					{
						oTr = new HtmlTableRow();

						oTd = new HtmlTableCell();
						oTd.Style["width"] = " 20%";
						oTd.InnerHtml += "<input type=\"hidden\" name=\"hidEmailID\" value=\"" + tblEmailAddresses.Rows[i]["EmailID"].ToString() + "\" />";
						oTd.InnerHtml += "<input type=\"text\" name=\"txtEmailAddress\" value=\"" + tblEmailAddresses.Rows[i]["EmailAddress"].ToString() + "\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.Style["width"] = " 20%";
						oTd.InnerHtml += "<input type=\"text\" name=\"txtEmailAddressType\" value=\"" + tblEmailAddresses.Rows[i]["EmailType"].ToString() + "\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml += "<textarea rows=\"1\" name=\"txtEmailAddressNotes\" style=\"width: 100%;\">" + tblEmailAddresses.Rows[i]["EmailNotes"].ToString() + "</textarea>";
						oTr.Cells.Add(oTd);

						htblEmailAddress.Rows.Add(oTr);
					}
				}
				else
				{
					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.ColSpan = 3;
					oTd.InnerHtml = "No recorded Email Address.";
					oTr.Cells.Add(oTd);
					htblEmailAddress.Rows.Add(oTr);
					
				}

				tdPhoneNumber.Controls.Add(new HtmlGenericControl("br"));
				tdPhoneNumber.Controls.Add(htblEmailAddress);
				#endregion

				#region Display Emergency Contact Table
				HtmlTable tblEmergencyContact = new HtmlTable();
				tblEmergencyContact.Attributes["class"] = "tblPersons";
				tblEmergencyContact.Style["width"] = " 95%";
				tblEmergencyContact.Attributes["name"] = "tblAddress";
				tblEmergencyContact.Attributes["id"] = "tblEmergencyContact";
				tblEmergencyContact.CellSpacing = 0;

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTr.Attributes["class"] = "trHeader";
				oTd.ColSpan = 2;
				oTd.InnerHtml = "Emergency Contact Info.";
				oTr.Cells.Add(oTd);
				tblEmergencyContact.Rows.Add(oTr);

				if (tblEmergencyContacts.Rows.Count > 0)
				{
					nEmerContactID = Convert.ToInt32(tblEmergencyContacts.Rows[0]["EmerID"].ToString());
					sEmerFirstName = tblEmergencyContacts.Rows[0]["FirstName"].ToString();
					sEmerLastName = tblEmergencyContacts.Rows[0]["LastName"].ToString();
					sEmerContactType = tblEmergencyContacts.Rows[0]["EmerContactType"].ToString();
					sPhone1 = tblEmergencyContacts.Rows[0]["Phone1"].ToString();
					sPhone2 = tblEmergencyContacts.Rows[0]["Phone2"].ToString();
					sAddress = tblEmergencyContacts.Rows[0]["Address"].ToString();
					sCity = tblEmergencyContacts.Rows[0]["City"].ToString();
					sState = tblEmergencyContacts.Rows[0]["StateID"].ToString();
					sZip = tblEmergencyContacts.Rows[0]["Zip"].ToString();
					sEmerNotes = tblEmergencyContacts.Rows[0]["Notes"].ToString();
				}

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Style["text-align"] = " right";
				oTd.Style["font-weight"] = " bold";
				oTd.Style["width"] = " 35%";
				oTd.InnerHtml = "First Name";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidEmerContactID\" value=\"" + nEmerContactID.ToString() + "\" style=\"width: 100%;\" />";
				oTd.InnerHtml += "<input type=\"text\" name=\"txtEmerFirstName\" value=\"" + sEmerFirstName + "\" style=\"width: 100%;\" />";
				oTr.Cells.Add(oTd);
				tblEmergencyContact.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Style["text-align"] = " right";
				oTd.Style["font-weight"] = " bold";
				oTd.Style["width"] = " 35%";
				oTd.InnerHtml = "Last Name";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtEmerLastName\" value=\"" + sEmerLastName + "\" style=\"width: 100%;\" />";
				oTr.Cells.Add(oTd);
				tblEmergencyContact.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Style["text-align"] = " right";
				oTd.Style["font-weight"] = " bold";
				oTd.Style["width"] = " 35%";
				oTd.InnerHtml = "Relationship";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtRelationship\" value=\"" + sEmerContactType + "\" style=\"width: 100%;\" />";
				oTr.Cells.Add(oTd);
				tblEmergencyContact.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Style["text-align"] = " right";
				oTd.Style["font-weight"] = " bold";
				oTd.Style["width"] = " 35%";
				oTd.InnerHtml = "Phone 1";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtPhone1\" value=\"" + sPhone1 + "\" style=\"width: 100%;\" />";
				oTr.Cells.Add(oTd);
				tblEmergencyContact.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Style["text-align"] = " right";
				oTd.Style["font-weight"] = " bold";
				oTd.Style["width"] = " 35%";
				oTd.InnerHtml = "Phone 2";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtPhone2\" value=\"" + sPhone2 + "\" style=\"width: 100%;\" />";
				oTr.Cells.Add(oTd);
				tblEmergencyContact.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Style["text-align"] = " right";
				oTd.Style["font-weight"] = " bold";
				oTd.Style["width"] = " 35%";
				oTd.InnerHtml = "Address";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtAddress\" value=\"" + sAddress + "\" style=\"width: 100%;\" />";
				oTr.Cells.Add(oTd);
				tblEmergencyContact.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Style["text-align"] = " right";
				oTd.Style["font-weight"] = " bold";
				oTd.Style["width"] = " 35%";
				oTd.InnerHtml = "City";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtCity\" value=\"" + sCity + "\" style=\"width: 100%;\" />";
				oTr.Cells.Add(oTd);
				tblEmergencyContact.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Style["text-align"] = " right";
				oTd.Style["font-weight"] = " bold";
				oTd.Style["width"] = " 35%";
				oTd.InnerHtml = "State";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.InnerHtml = oDBLookup.BindDropDownList("selState", "SELECT StateID, StateName FROM tblState ORDER BY StateName ASC", "StateName", "StateID", sState, "--Select a State--", "width: 100%;");
				oTr.Cells.Add(oTd);
				tblEmergencyContact.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Style["text-align"] = " right";
				oTd.Style["font-weight"] = " bold";
				oTd.Style["width"] = " 35%";
				oTd.InnerHtml = "Postal Code";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtZip\" value=\"" + sZip + "\" style=\"width: 100%;\" />";
				oTr.Cells.Add(oTd);
				tblEmergencyContact.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Style["text-align"] = " right";
				oTd.Style["font-weight"] = " bold";
				oTd.Style["width"] = " 35%";
				oTd.InnerHtml = "Notes";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<textarea rows=\"1\" name=\"txtEmerNotes\" style=\"width: 100%;\">" + sEmerNotes + "</textarea>";
				oTr.Cells.Add(oTd);
				tblEmergencyContact.Rows.Add(oTr);

				tdAddress.Controls.Add(tblEmergencyContact);
				#endregion
			}
			else
			{
				tblMaster.Rows.Clear();
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<span class=\"error\">The Houshold ID that you supplied does not exist.</span>";
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

			//Add a table to the DataSet object for the household information.
			oCmd.CommandText = "spGetHouseholdByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblHousehold");

			//Add a table to the DataSet object for the person information.
			oCmd.CommandText = "spGetPersonsByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblPersons");

			//Add a table to the DataSet object for the phone number information.
			oCmd.CommandText = "spGetPhoneNumbersByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblPhoneNumbers");

			//Add a table to the DataSet object for the email address information.
			oCmd.CommandText = "spGetEmailAddressesByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblEmailAddresses");

			//Add a table to the DataSet object for the address information.
			oCmd.CommandText = "spGetEmergencyContactByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblEmergencyContact");

			return oDataSet;
		}
		#endregion

		#region Update Household
		private bool UpdateHousehold(int nHouseholdID, string sHouseholdName)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandText = "spUpdateHousehold";
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.InputOutput, false, 0, 0 , "", DataRowVersion.Current, nHouseholdID));
			oCmd.Parameters.Add(new SqlParameter("@HouseholdName", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sHouseholdName));

			try
			{
				oCmd.ExecuteNonQuery();
			}
			catch
			{
				return false;
			}

			return true;
		}
		#endregion

		#region Update Person
		private bool UpdatePerson(int nHouseholdID, string[] aPersonID, string[] aFirstName, string[] aLastName, string[] aNickName, string[] aMiddleName, string[] aLastNameOnBC, string[] aCityOfBirth, string[] aStateOfBirth, string[] aSex, string[] aDOB, string[] aRace, string[] aEthnicity, string[] aPersonRoleID, string[] aIsDeceased, string sMainContact, string[] aAddressID, string[] aMotherID, string[] aFatherID, string[] aPersonNotes, string[] aDoNotContact)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandText = "spUpdatePerson";
			oCmd.CommandType = CommandType.StoredProcedure;

			for (int i=0;i<aPersonID.Length;i++)
			{
				oCmd.Parameters.Clear();

				oCmd.Parameters.AddWithValue("@HouseholdID", nHouseholdID);
				oCmd.Parameters.AddWithValue("@PersonID", aPersonID[i]);
				oCmd.Parameters.AddWithValue("@FirstName", aFirstName[i]);
				oCmd.Parameters.AddWithValue("@LastName", aLastName[i]);
				oCmd.Parameters.AddWithValue("@NickName", aNickName[i]);
				oCmd.Parameters.AddWithValue("@MiddleName", aMiddleName[i]);
				oCmd.Parameters.AddWithValue("@LastNameOnBC", aLastNameOnBC[i]);
				oCmd.Parameters.AddWithValue("@CityOfBirth", aCityOfBirth[i]);
				oCmd.Parameters.AddWithValue("@StateOfBirth", aStateOfBirth[i]);
				oCmd.Parameters.AddWithValue("@Sex", aSex[i]);
				oCmd.Parameters.AddWithValue("@DOB", aDOB[i]);
				oCmd.Parameters.AddWithValue("@EthnicityID", aRace[i]);
				oCmd.Parameters.AddWithValue("@HispanicID", aEthnicity[i]);
				oCmd.Parameters.AddWithValue("@PersonRoleID", aPersonRoleID[i]);

				if (Request["chkDeceased" + aPersonID[i]] != null)
					oCmd.Parameters.AddWithValue("@IsDeceased", true);
				else
					oCmd.Parameters.AddWithValue("@IsDeceased", false);

				if (Request["chkDoNotContact" + aPersonID[i]] != null)
					oCmd.Parameters.AddWithValue("@DoNotContact", true);
				else
					oCmd.Parameters.AddWithValue("@DoNotContact", false);                
				
				oCmd.Parameters.AddWithValue("@AddressID", aAddressID[i]);
				oCmd.Parameters.AddWithValue("@MotherPersonID", aMotherID[i]);
				oCmd.Parameters.AddWithValue("@FatherPersonID", aFatherID[i]);

				if (aPersonNotes.Length <= i)
					oCmd.Parameters.AddWithValue("@PersonNotes", DBNull.Value);
				else
					oCmd.Parameters.AddWithValue("@PersonNotes", aPersonNotes[i]);

				if (sMainContact == aPersonID[i])
					oCmd.Parameters.AddWithValue("@MainContact", true);
				else
					oCmd.Parameters.AddWithValue("@MainContact", false);

				if (oCmd.Parameters["@FirstName"].Value.ToString() == "") {oCmd.Parameters["@FirstName"].Value = DBNull.Value;}
				if (oCmd.Parameters["@LastName"].Value.ToString() == "") {oCmd.Parameters["@LastName"].Value = DBNull.Value;}
				if (oCmd.Parameters["@NickName"].Value.ToString() == "") {oCmd.Parameters["@NickName"].Value = DBNull.Value;}
				if (oCmd.Parameters["@MiddleName"].Value.ToString() == "") { oCmd.Parameters["@MiddleName"].Value = DBNull.Value; }
				if (oCmd.Parameters["@LastNameOnBC"].Value.ToString() == "") { oCmd.Parameters["@LastNameOnBC"].Value = DBNull.Value; }
				if (oCmd.Parameters["@CityOfBirth"].Value.ToString() == "") { oCmd.Parameters["@CityOfBirth"].Value = DBNull.Value; }
				if (oCmd.Parameters["@StateOfBirth"].Value.ToString() == "") { oCmd.Parameters["@StateOfBirth"].Value = DBNull.Value; }
				if (oCmd.Parameters["@Sex"].Value.ToString() == "") { oCmd.Parameters["@Sex"].Value = DBNull.Value; }
				if (oCmd.Parameters["@DOB"].Value.ToString() == "") {oCmd.Parameters["@DOB"].Value = DBNull.Value;}
				if (oCmd.Parameters["@EthnicityID"].Value.ToString() == "" || oCmd.Parameters["@EthnicityID"].Value.ToString() == "-1") {oCmd.Parameters["@EthnicityID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@HispanicID"].Value.ToString() == "" || oCmd.Parameters["@HispanicID"].Value.ToString() == "-1") {oCmd.Parameters["@HispanicID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@PersonRoleID"].Value.ToString() == "" || oCmd.Parameters["@PersonRoleID"].Value.ToString() == "-1") {oCmd.Parameters["@PersonRoleID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@AddressID"].Value.ToString() == "" || oCmd.Parameters["@AddressID"].Value.ToString() == "-1") {oCmd.Parameters["@AddressID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@MotherPersonID"].Value.ToString() == "" || oCmd.Parameters["@MotherPersonID"].Value.ToString() == "-1") {oCmd.Parameters["@MotherPersonID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@FatherPersonID"].Value.ToString() == "" || oCmd.Parameters["@FatherPersonID"].Value.ToString() == "-1") {oCmd.Parameters["@FatherPersonID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@PersonNotes"].Value.ToString() == "" || oCmd.Parameters["@PersonNotes"].Value.ToString() == "-1") {oCmd.Parameters["@PersonNotes"].Value = DBNull.Value;}

				try
				{
					if (oCmd.Parameters["@FirstName"].Value.ToString() != "" && oCmd.Parameters["@LastName"].Value.ToString() != "")
						oCmd.ExecuteNonQuery();
				}
				catch
				{
					return false;
				}
			}

			return true;
		}
		#endregion

		#region Update Phone Number
		private bool UpdatePhoneNumber(int nHouseholdID, string[] aPhoneNumberID, string[] aPhoneNumber, string[] sPhoneType, string[] aPhoneNotes)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandText = "spUpdatePhoneNumber";
			oCmd.CommandType = CommandType.StoredProcedure;

			for (int i=0;i<aPhoneNumberID.Length;i++)
			{
				oCmd.Parameters.Clear();

				oCmd.Parameters.Add(new SqlParameter("@PhoneNumberID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, aPhoneNumberID[i]));
				oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nHouseholdID));
				oCmd.Parameters.Add(new SqlParameter("@PhoneNumber", SqlDbType.VarChar, 25, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, aPhoneNumber[i]));
				oCmd.Parameters.Add(new SqlParameter("@PhoneType", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sPhoneType[i]));
				oCmd.Parameters.Add(new SqlParameter("@PhoneNotes", SqlDbType.VarChar, 500, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, aPhoneNotes[i]));

				if (oCmd.Parameters["@PhoneNumberID"].Value.ToString() == "") {oCmd.Parameters["@PhoneNumberID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@PhoneType"].Value.ToString() == "") {oCmd.Parameters["@PhoneType"].Value = DBNull.Value;}
				if (oCmd.Parameters["@PhoneNotes"].Value.ToString() == "") {oCmd.Parameters["@PhoneNotes"].Value = DBNull.Value;}

				try
				{
					oCmd.ExecuteNonQuery();
				}
				catch
				{
					return false;
				}
			}

			return true;
		}
		#endregion

		#region Update Email Address
		private bool UpdateEmailAddress(int nHouseholdID, string[] aEmailAddressID, string[] aEmailAddress, string[] sEmailType, string[] aEmailNotes)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandText = "spUpdateEmailAddress";
			oCmd.CommandType = CommandType.StoredProcedure;

			for (int i=0;i<aEmailAddressID.Length;i++)
			{
				oCmd.Parameters.Clear();

				oCmd.Parameters.Add(new SqlParameter("@EmailAddressID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, aEmailAddressID[i]));
				oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nHouseholdID));
				oCmd.Parameters.Add(new SqlParameter("@EmailAddress", SqlDbType.VarChar, 500, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, aEmailAddress[i]));
				oCmd.Parameters.Add(new SqlParameter("@EmailType", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sEmailType[i]));
				oCmd.Parameters.Add(new SqlParameter("@EmailNotes", SqlDbType.VarChar, 500, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, aEmailNotes[i]));

				if (oCmd.Parameters["@EmailAddressID"].Value.ToString() == "") {oCmd.Parameters["@EmailAddressID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@EmailAddress"].Value.ToString() == "") {oCmd.Parameters["@EmailAddress"].Value = DBNull.Value;}
				if (oCmd.Parameters["@EmailType"].Value.ToString() == "") {oCmd.Parameters["@EmailType"].Value = DBNull.Value;}
				if (oCmd.Parameters["@EmailNotes"].Value.ToString() == "") {oCmd.Parameters["@EmailNotes"].Value = DBNull.Value;}

				try
				{
					oCmd.ExecuteNonQuery();
				}
				catch
				{
					return false;
				}
			}

			return true;
		}
		#endregion

		#region Update Emergency Contact
		private bool UpdateEmergencyContact(int nEmerContactID, int nHouseholdID, string sFirstName, string sLastName, string sEmerContactType, string sPhone1, string sPhone2, string sAddress, string sCity, string sState, string sZip, string sNotes)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandText = "spUpdateEmergencyContact";
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@EmergencyContactID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, nEmerContactID));
			oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nHouseholdID));
			oCmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sFirstName));
			oCmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sLastName));
			oCmd.Parameters.Add(new SqlParameter("@EmergencyContactType", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sEmerContactType));
			oCmd.Parameters.Add(new SqlParameter("@Phone1", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sPhone1));
			oCmd.Parameters.Add(new SqlParameter("@Phone2", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sPhone2));
			oCmd.Parameters.Add(new SqlParameter("@Address", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sAddress));
			oCmd.Parameters.Add(new SqlParameter("@City", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sCity));
			oCmd.Parameters.Add(new SqlParameter("@StateID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sState));
			oCmd.Parameters.Add(new SqlParameter("@Zip", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sZip));
			oCmd.Parameters.Add(new SqlParameter("@Notes", SqlDbType.Text, 16, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sNotes));

			if (oCmd.Parameters["@Phone2"].Value.ToString() == "") {oCmd.Parameters["@Phone2"].Value = DBNull.Value;}
			if (oCmd.Parameters["@Address"].Value.ToString() == "") {oCmd.Parameters["@Address"].Value = DBNull.Value;}
			if (oCmd.Parameters["@City"].Value.ToString() == "") {oCmd.Parameters["@Zip"].Value = DBNull.Value;}
			if (oCmd.Parameters["@StateID"].Value.ToString() == "" || oCmd.Parameters["@StateID"].Value.ToString() == "-1") {oCmd.Parameters["@Address"].Value = DBNull.Value;}
			if (oCmd.Parameters["@Zip"].Value.ToString() == "" || oCmd.Parameters["@Zip"].Value.ToString() == "0") {oCmd.Parameters["@Zip"].Value = DBNull.Value;}
			if (oCmd.Parameters["@Notes"].Value.ToString() == "") {oCmd.Parameters["@Notes"].Value = DBNull.Value;}

			try
			{
				oCmd.ExecuteNonQuery();
			}
			catch
			{
				return false;
			}

			return true;		
		}
		#endregion
	}
}