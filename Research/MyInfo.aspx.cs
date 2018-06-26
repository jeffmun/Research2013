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

public partial class MyInfo : System.Web.UI.Page
{
	private DBLookup oDBLookup;

	private int nStaffID = 0;
	private int nDefaultStudyID = 0;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			oDBLookup = new DBLookup(Master.SqlConn);

			tdTitle.EnableViewState = false;

			if (Request.Cookies["UserProfile"] != null)
				nStaffID = Convert.ToInt32(Request.Cookies["UserProfile"].Values["StaffID"].ToString());
			else if (Request.ServerVariables["AUTH_USER"].ToString() != "")
				nStaffID = oDBLookup.GetStaffIDByActiveDirectoryID(Request.ServerVariables["AUTH_USER"].ToString());

            //DF 4/9: Add nStaffID to viewstate so it's available when saving
            this.ViewState["nStaffID"] = nStaffID;

			if (nStaffID != 0)
			{
				SqlCommand oCmd = new SqlCommand();
				SqlDataReader oReader;

				oCmd.Connection = Master.SqlConn;
				oCmd.CommandText = "spGetStaffByID";
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;

				oCmd.Parameters.Add(new SqlParameter("@StaffID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStaffID));

				oReader = oCmd.ExecuteReader();

				if (oReader.Read())
				{
					#region Set the Values of the Form Controls
					tdTitle.InnerHtml += " - " + oReader["FirstName"].ToString() + " " + oReader["LastName"].ToString();
					txtEmail.Text = oReader["Email"].ToString();
					txtWorkPhone.Text = oReader["Phone_Work"].ToString();
					txtHomePhone.Text = oReader["Phone_Home"].ToString();
					txtOtherPhone.Text = oReader["Phone_Other"].ToString();
					txtOffice.Text = oReader["OfficeLocation"].ToString();
					if (oReader["DefaultStudyID"].ToString() != "") { nDefaultStudyID = Convert.ToInt32(oReader["DefaultStudyID"].ToString()); } else { nDefaultStudyID = -1; }
					#endregion
				}

				oReader.Close();

				oDBLookup.BindDropDownList(ref selDefaultStudyID, "EXEC spGetActiveStudies", "StudyName", "StudyID", nDefaultStudyID.ToString(), "--Select a Study--");
			}
		}
	}

	#region Update Staff Details
	protected void SaveChanges(object sender, EventArgs e)
	{


        //DF 4/9: get nStaffID from viewstate
        object oStaffID = this.ViewState["nStaffID"];
        if (oStaffID != null) nStaffID = (int)oStaffID;

        //DF 4/9: set nDefaultStudyID from selected value in list
        nDefaultStudyID = int.Parse(selDefaultStudyID.SelectedValue);

        SqlCommand oCmd = new SqlCommand();

		oCmd.Connection = Master.SqlConn;
		oCmd.CommandText = "spUpdateStaffInfo";
		oCmd.CommandTimeout = 90;
		oCmd.CommandType = CommandType.StoredProcedure;

		oCmd.Parameters.AddWithValue("@StaffID", nStaffID);
		oCmd.Parameters.AddWithValue("@Email", txtEmail.Text);
		oCmd.Parameters.AddWithValue("@WorkPhone", txtWorkPhone.Text);
		oCmd.Parameters.AddWithValue("@HomePhone", txtHomePhone.Text);
		oCmd.Parameters.AddWithValue("@OtherPhone", txtOtherPhone.Text);
		oCmd.Parameters.AddWithValue("@OfficeLocation", txtOffice.Text);
		oCmd.Parameters.AddWithValue("@DefaultStudyID", nDefaultStudyID);

		if (oCmd.Parameters["@DefaultStudyID"].Value.ToString() == "-1") { oCmd.Parameters["@DefaultStudyID"].Value = DBNull.Value; }
		if (oCmd.Parameters["@Email"].Value.ToString().Trim() == "") { oCmd.Parameters["@Email"].Value = DBNull.Value; }
		if (oCmd.Parameters["@HomePhone"].Value.ToString().Trim() == "") { oCmd.Parameters["@HomePhone"].Value = DBNull.Value; }
		if (oCmd.Parameters["@OtherPhone"].Value.ToString().Trim() == "") { oCmd.Parameters["@OtherPhone"].Value = DBNull.Value; }
		if (oCmd.Parameters["@OfficeLocation"].Value.ToString().Trim() == "") { oCmd.Parameters["@OfficeLocation"].Value = DBNull.Value; }

		oCmd.ExecuteNonQuery();
	}
	#endregion
}