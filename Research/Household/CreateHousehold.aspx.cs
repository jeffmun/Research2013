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

namespace Household
{
	public partial class CreateHousehold : System.Web.UI.Page
	{
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup(Master.SqlConn);

			Form.Attributes["onsubmit"] = "return(DoSubmitCreateHousehold());";

			if (IsPostBack)
			{
				string sHouseholdName = Request["txtHouseholdName"].ToString();
				string sFirstName = Request["txtFirstName"].ToString();
				string sLastName = Request["txtLastName"].ToString();
				string sNickName = Request["txtNickName"].ToString();
                string sMiddleName = Request["txtMiddleName"].ToString();
                string sLastNameOnBC = Request["txtLastNameOnBC"].ToString();
                string sCityOfBirth = Request["txtCityOfBirth"].ToString();
                string sStateOfBirth = Request["txtStateOfBirth"].ToString();
                string sSex = Request["selSex"].ToString();
				string sDOB = Request["txtDOB"].ToString();
				int nRaceID = Convert.ToInt32(selRace.SelectedValue.ToString());
				int nEthnicityID = Convert.ToInt32(selEthnicity.SelectedValue.ToString());
				int nRoleID = Convert.ToInt32(selRole.SelectedValue.ToString());
				string sPhoneNumber = Request["txtPhoneNumber"].ToString();
				string sPhoneType = Request["txtPhoneNumberType"].ToString();
				string sPhoneNotes = Request["txtPhoneNumberNotes"].ToString();
				string sEmailAddress = Request["txtEmailAddress"].ToString();
				string sEmailType = Request["txtEmailAddressType"].ToString();
				string sEmailNotes = Request["txtEmailAddressNotes"].ToString();
				string sEmerFirstName = Request["txtEmerFirstName"].ToString();
				string sEmerLastName = Request["txtEmerLastName"].ToString();
				string sRelationship = Request["txtRelationship"].ToString();
				string sPhone1 = Request["txtPhone1"].ToString();
				string sPhone2 = Request["txtPhone2"].ToString();
				string sAddress = Request["txtAddress"].ToString();
				string sCity = Request["txtCity"].ToString();
				string sState = selState.SelectedValue.ToString();
				string sZip = Request["txtZip"].ToString();
				string sEmergencyNotes = Request["txtEmergencyNotes"].ToString();
				int nHouseholdID = 0;

				SqlCommand oCmd = new SqlCommand();

				oCmd.Connection = Master.SqlConn;
				oCmd.CommandTimeout = 90;
				oCmd.CommandText = "spUpdateHousehold";
				oCmd.CommandType = CommandType.StoredProcedure;

				oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.InputOutput, false, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
				oCmd.Parameters.Add(new SqlParameter("@HouseholdName", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sHouseholdName));

				oCmd.ExecuteNonQuery();
				nHouseholdID = Convert.ToInt32(oCmd.Parameters["@HouseholdID"].Value);

				oCmd.Parameters.Clear();
				oCmd.CommandText = "spUpdatePerson";
				oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nHouseholdID));
				oCmd.Parameters.Add(new SqlParameter("@PersonID", SqlDbType.Int, 4, ParameterDirection.InputOutput, false, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
				oCmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sFirstName));
				oCmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sLastName));
				oCmd.Parameters.Add(new SqlParameter("@NickName", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sNickName));
                oCmd.Parameters.Add(new SqlParameter("@MiddleName", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sMiddleName));
                oCmd.Parameters.Add(new SqlParameter("@LastNameOnBC", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sLastNameOnBC));
                oCmd.Parameters.Add(new SqlParameter("@CityOfBirth", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sCityOfBirth));
                oCmd.Parameters.Add(new SqlParameter("@StateOfBirth", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sStateOfBirth));
                oCmd.Parameters.Add(new SqlParameter("@Sex", SqlDbType.Char, 1, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sSex));
				oCmd.Parameters.Add(new SqlParameter("@DOB", SqlDbType.DateTime, 100, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sDOB));
				oCmd.Parameters.Add(new SqlParameter("@EthnicityID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nRaceID));
				oCmd.Parameters.Add(new SqlParameter("@HispanicID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nEthnicityID));
				oCmd.Parameters.Add(new SqlParameter("@PersonRoleID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nRoleID));
				oCmd.Parameters.Add(new SqlParameter("@MainContact", SqlDbType.SmallInt, 2, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, -1));
				oCmd.Parameters.Add(new SqlParameter("@AddressID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, DBNull.Value));

				if (oCmd.Parameters["@NickName"].Value.ToString() == "") {oCmd.Parameters["@NickName"].Value = DBNull.Value;}
                if (oCmd.Parameters["@MiddleName"].Value.ToString() == "") { oCmd.Parameters["@MiddleName"].Value = DBNull.Value; }
                if (oCmd.Parameters["@LastNameOnBC"].Value.ToString() == "") { oCmd.Parameters["@LastNameOnBC"].Value = DBNull.Value; }
                if (oCmd.Parameters["@CityOfBirth"].Value.ToString() == "") { oCmd.Parameters["@CityOfBirth"].Value = DBNull.Value; }
                if (oCmd.Parameters["@StateOfBirth"].Value.ToString() == "") { oCmd.Parameters["@StateOfBirth"].Value = DBNull.Value; }
                if (oCmd.Parameters["@Sex"].Value.ToString() == "") {oCmd.Parameters["@Sex"].Value = DBNull.Value;}
				if (oCmd.Parameters["@DOB"].Value.ToString() == "") {oCmd.Parameters["@DOB"].Value = DBNull.Value;}
				if (oCmd.Parameters["@EthnicityID"].Value.ToString() == "" || oCmd.Parameters["@EthnicityID"].Value.ToString() == "-1") {oCmd.Parameters["@EthnicityID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@HispanicID"].Value.ToString() == "" || oCmd.Parameters["@HispanicID"].Value.ToString() == "-1") {oCmd.Parameters["@HispanicID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@PersonRoleID"].Value.ToString() == "" || oCmd.Parameters["@PersonRoleID"].Value.ToString() == "-1") {oCmd.Parameters["@PersonRoleID"].Value = DBNull.Value;}

				oCmd.ExecuteNonQuery();

				if (sPhoneNumber != "")
				{
					oCmd.Parameters.Clear();
					oCmd.CommandText = "spUpdatePhoneNumber";
					oCmd.Parameters.Add(new SqlParameter("@PhoneNumberID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
					oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nHouseholdID));
					oCmd.Parameters.Add(new SqlParameter("@PhoneNumber", SqlDbType.VarChar, 25, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sPhoneNumber));
					oCmd.Parameters.Add(new SqlParameter("@PhoneType", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sPhoneType));
					oCmd.Parameters.Add(new SqlParameter("@PhoneNotes", SqlDbType.VarChar, 500, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sPhoneNotes));

					if (oCmd.Parameters["@PhoneType"].Value.ToString() == "") {oCmd.Parameters["@PhoneType"].Value = DBNull.Value;}
					if (oCmd.Parameters["@PhoneNotes"].Value.ToString() == "") {oCmd.Parameters["@PhoneNotes"].Value = DBNull.Value;}

					oCmd.ExecuteNonQuery();
				}

				if (sEmailAddress != "")
				{
					oCmd.Parameters.Clear();
					oCmd.CommandText = "spUpdateEmailAddress";
					oCmd.Parameters.Add(new SqlParameter("@EmailAddressID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
					oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nHouseholdID));
					oCmd.Parameters.Add(new SqlParameter("@EmailAddress", SqlDbType.VarChar, 25, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sEmailAddress));
					oCmd.Parameters.Add(new SqlParameter("@EmailType", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sEmailType));
					oCmd.Parameters.Add(new SqlParameter("@EmailNotes", SqlDbType.VarChar, 500, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sEmailNotes));

					if (oCmd.Parameters["@EmailType"].Value.ToString() == "") {oCmd.Parameters["@EmailType"].Value = DBNull.Value;}
					if (oCmd.Parameters["@EmailNotes"].Value.ToString() == "") {oCmd.Parameters["@EmailNotes"].Value = DBNull.Value;}

					oCmd.ExecuteNonQuery();
				}

				if (sEmerFirstName != "" && sEmerLastName != "")
				{
					oCmd.Parameters.Clear();
					oCmd.CommandText = "spUpdateEmergencyContact";
					oCmd.Parameters.Add(new SqlParameter("@EmergencyContactID", SqlDbType.Int, 4, ParameterDirection.InputOutput, false, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
					oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nHouseholdID));
					oCmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sEmerFirstName));
					oCmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sEmerLastName));
					oCmd.Parameters.Add(new SqlParameter("@EmergencyContactType", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sRelationship));
					oCmd.Parameters.Add(new SqlParameter("@Phone1", SqlDbType.VarChar, 30, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sPhone1));
					oCmd.Parameters.Add(new SqlParameter("@Phone2", SqlDbType.VarChar, 30, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sPhone2));
					oCmd.Parameters.Add(new SqlParameter("@Address", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sAddress));
					oCmd.Parameters.Add(new SqlParameter("@City", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sCity));
					oCmd.Parameters.Add(new SqlParameter("@StateID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sState));
					oCmd.Parameters.Add(new SqlParameter("@Zip", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sZip));
					oCmd.Parameters.Add(new SqlParameter("@Notes", SqlDbType.Text, 16, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sEmergencyNotes));

					if (oCmd.Parameters["@Phone2"].Value.ToString() == "") {oCmd.Parameters["@Phone2"].Value = DBNull.Value;}
					if (oCmd.Parameters["@Address"].Value.ToString() == "") {oCmd.Parameters["@Address"].Value = DBNull.Value;}
					if (oCmd.Parameters["@City"].Value.ToString() == "") {oCmd.Parameters["@City"].Value = DBNull.Value;}
					if (oCmd.Parameters["@StateID"].Value.ToString() == "") {oCmd.Parameters["@StateID"].Value = DBNull.Value;}
					if (oCmd.Parameters["@Zip"].Value.ToString() == "") {oCmd.Parameters["@Zip"].Value = DBNull.Value;}
					if (oCmd.Parameters["@Notes"].Value.ToString() == "") {oCmd.Parameters["@Notes"].Value = DBNull.Value;}

					oCmd.ExecuteNonQuery();
				}

                //DF: 4/9 added ~
				Response.Redirect("~/Household/EditHousehold.aspx?HouseholdID=" + nHouseholdID.ToString(), true);
			}
			else
			{
				oDBLookup.BindDropDownList(ref selRace, "EXEC spGetEthnicities", "EthnicityDesc", "EthnicityID", "", "--Select Race--");
				oDBLookup.BindDropDownList(ref selEthnicity, "EXEC spGetHispanicOptions", "HispanicDesc", "HispanicID", "", "--Select Ethnicity--");
				oDBLookup.BindDropDownList(ref selRole, "EXEC spGetPersonRoles", "PersonRole", "PersonRoleID", "", "--Select Role--");
				oDBLookup.BindDropDownList(ref selState, "SELECT StateID, StateName FROM tblState ORDER BY StateName ASC", "StateName", "StateID", "", "--Select a State--");
			}
		}
	}
}
