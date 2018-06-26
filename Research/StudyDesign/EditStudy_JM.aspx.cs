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

namespace StudyDesign
{
	public partial class EditStudy_JM : System.Web.UI.Page
	{
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if (!Master.AutismLogin.CheckGroupPermissions("IT Staff Group".Split(',')))
			{
				tblMaster.Rows.Clear();
				tblMaster.Attributes["class"] = "";

				HtmlTableRow oTr = new HtmlTableRow();
				HtmlTableCell oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "error";
				oTd.InnerHtml = "You do not have permission to view this page.";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
			}
			else if (!IsPostBack)
			{
				Form.Attributes["onsubmit"] = "return DoSubmitEditStudy(event);";
				oDBLookup = new DBLookup(Master.SqlConn);

				oDBLookup.BindDropDownList(ref selStudyID, "EXEC spGetAllStudies", "StudyFullName", "StudyID", "", "--Select a Study--");
				oDBLookup.BindDropDownList(ref selFullStudyID, "EXEC spGetFullStudies", "FullStudyName", "FullStudyID", "", "--Full Study--");
				oDBLookup.BindDropDownList(ref selGrantID, "EXEC spGetGrants", "GrantName", "GrantID", "", "--Grant--");
				oDBLookup.BindDropDownList(ref selStaffContact, "EXEC spGetAllStaff", "StaffShortName", "StaffID", "", "--Select Staff--");
				oDBLookup.BindDropDownList(ref selStaffPI, "EXEC spGetAllStaff", "StaffShortName", "StaffID", "", "--Select Staff--");

				btnSaveChanges.Text = "Add New Study";
			}
			else
				btnSaveChanges.Text = "Save Changes";
		}

		#region Get Study Information
		protected void GetStudyInfo(object sender, System.EventArgs e)
		{
			if (selStudyID.SelectedValue != "-1")
			{
				oIFrame.Attributes["src"] = "EditStudyActions.aspx?StudyID=" + selStudyID.SelectedValue;

				SqlCommand oCmd = new SqlCommand();
				oCmd.Connection = Master.SqlConn;
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;
				oCmd.CommandText = "spGetStudyByStudyID";
				oCmd.Parameters.Add(new SqlParameter("@StudyID", selStudyID.SelectedValue.ToString()));

				SqlDataReader oReader = oCmd.ExecuteReader();

				oReader.Read();

				if (oReader["FullStudyID"].ToString() != "") {selFullStudyID.SelectedValue = oReader["FullStudyID"].ToString();} else {selFullStudyID.SelectedValue = "-1";}
				if (oReader["GrantID"].ToString() != "") {selGrantID.SelectedValue = oReader["GrantID"].ToString();} else {selGrantID.SelectedValue = "-1";}
				if (oReader["Design_ContactPerson"].ToString() != "") {selStaffContact.SelectedValue = oReader["Design_ContactPerson"].ToString();} else {selStaffContact.SelectedValue = "-1";}
				if (oReader["PI"].ToString() != "") {selStaffPI.SelectedValue = oReader["PI"].ToString();} else {selStaffPI.SelectedValue = "-1";}

				txtStudyName.Text = oReader["StudyName"].ToString();
				txtStudyFullName.Text = oReader["StudyFullName"].ToString();
				txtStartDate.Text = oReader["StartDate"].ToString();
				txtEndDate.Text = oReader["EndDate"].ToString();

				if (Convert.ToInt32(oReader["Active"].ToString()) == 1) {chkIsActive.Checked = true;} else {chkIsActive.Checked = false;}
				if (Convert.ToBoolean(oReader["IsFamilyStudy"].ToString())) {chkIsFamilyStudy.Checked = true;} else {chkIsFamilyStudy.Checked = false;}
				if (Convert.ToBoolean(oReader["CanAppearInReports"].ToString())) {chkCanAppearInReports.Checked = true;} else {chkCanAppearInReports.Checked = false;}
				if (Convert.ToBoolean(oReader["Counterbalanced"].ToString())) {chkIsCounterBalanced.Checked = true;} else {chkIsCounterBalanced.Checked = false;}

				oReader.Close();
			}
			else
			{
				oIFrame.Attributes["src"] = "/";

				selFullStudyID.SelectedIndex = 0;
				selGrantID.SelectedIndex = 0;
				selStaffContact.SelectedIndex = 0;
				selStaffPI.SelectedIndex = 0;

				txtStudyName.Text = "";
				txtStudyFullName.Text = "";
				txtStartDate.Text = "";
				txtEndDate.Text = "";

				chkIsActive.Checked = true;
				chkIsFamilyStudy.Checked = false;
				chkCanAppearInReports.Checked = true;
				chkIsCounterBalanced.Checked = false;

				btnSaveChanges.Text = "Add New Study";
			}
		}
		#endregion

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup(Master.SqlConn);

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spUpdateStudy";

			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.InputOutput, true, 0, 0, "", DataRowVersion.Default, selStudyID.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@FullStudyID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, selFullStudyID.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@StudyName", SqlDbType.VarChar, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, txtStudyName.Text));
			oCmd.Parameters.Add(new SqlParameter("@StudyFullName", SqlDbType.VarChar, 150, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, txtStudyFullName.Text));
			oCmd.Parameters.Add(new SqlParameter("@GrantID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, selGrantID.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@StartDate", SqlDbType.DateTime, 8, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtStartDate.Text));
			oCmd.Parameters.Add(new SqlParameter("@EndDate", SqlDbType.DateTime, 8, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtEndDate.Text));
			oCmd.Parameters.Add(new SqlParameter("@StaffContact", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, selStaffContact.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@PI", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, selStaffPI.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@IsActive", SqlDbType.Bit, 1, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, chkIsActive.Checked));
			oCmd.Parameters.Add(new SqlParameter("@IsFamilyStudy", SqlDbType.Bit, 1, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, chkIsFamilyStudy.Checked));
			oCmd.Parameters.Add(new SqlParameter("@CanAppearInReports", SqlDbType.Bit, 1, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, chkCanAppearInReports.Checked));
			oCmd.Parameters.Add(new SqlParameter("@IsCounterbalanced", SqlDbType.Bit, 1, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, chkIsCounterBalanced.Checked));

			if (oCmd.Parameters["@StudyID"].Value.ToString() == "-1") {oCmd.Parameters["@StudyID"].Value = DBNull.Value;}
			if (oCmd.Parameters["@FullStudyID"].Value.ToString() == "-1") {oCmd.Parameters["@FullStudyID"].Value = DBNull.Value;}
			if (oCmd.Parameters["@StartDate"].Value.ToString() == "") {oCmd.Parameters["@StartDate"].Value = DBNull.Value;}
			if (oCmd.Parameters["@EndDate"].Value.ToString() == "") {oCmd.Parameters["@EndDate"].Value = DBNull.Value;}

			oCmd.ExecuteNonQuery();

			selStudyID.Items.Clear();
			oDBLookup.BindDropDownList(ref selStudyID, "EXEC spGetActiveStudies", "StudyFullName", "StudyID", oCmd.Parameters["@StudyID"].Value.ToString(), "--Select a Study--");
		}
		#endregion



	}
}