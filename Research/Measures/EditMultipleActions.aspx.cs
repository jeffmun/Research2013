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
	public partial class EditMultipleActions : System.Web.UI.Page
	{
		private string sActionStatus;
		private string sActionIDs;
		private bool bDoRefresh;
		private int nStaffID;
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitMultipleActionStatus());";

			oDBLookup = new DBLookup(Master.SqlConn);

			sActionStatus = Request["ActionStatus"].ToString();
			sActionIDs = Request["ActionIDs"].ToString().Replace(", ", ",");
			bDoRefresh = Convert.ToBoolean(Request["DoRefresh"]);
			nStaffID = 0;

			if (Request.ServerVariables["AUTH_USER"].ToString() != "")
				nStaffID = oDBLookup.GetStaffIDByActiveDirectoryID(Request.ServerVariables["AUTH_USER"].ToString());
			else
				nStaffID = oDBLookup.GetStaffIDByActiveDirectoryID(Request.Cookies["UserProfile"].Values["ActiveDirID"]);

			if (IsPostBack)
			{
				if (bDoRefresh)
					Response.Write("<script type=\"text/javascript\">window.opener.location.reload(true); window.close();</script>");
				else
					Response.Write("<script type=\"text/javascript\">window.close();</script>");
			}

			tdTitle.InnerHtml = "Mark Actions as " + sActionStatus;

			if (selCompBy.Items.Count == 0)
				oDBLookup.BindDropDownList(ref selCompBy, "EXEC spGetAllStaff", "StaffShortName", "StaffID", nStaffID.ToString(), "--Select Staff Member--");

			if (txtDateDone.Text == "")
				txtDateDone.Text = DateTime.Today.ToString("MM/dd/yyyy");

			if (hidActionIDs.Value == "")
				hidActionIDs.Value = sActionIDs;

			if (hidActionStatus.Value == "")
				hidActionStatus.Value = sActionStatus;
		}

		#region Update Actions
		protected void SaveChanges(object sender, EventArgs e)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spUpdateMultipleActions";

			oCmd.Parameters.AddWithValue("@ActionIDs", hidActionIDs.Value);
			oCmd.Parameters.AddWithValue("@ActionStatus", hidActionStatus.Value);
			oCmd.Parameters.AddWithValue("@DateDone", txtDateDone.Text);
			oCmd.Parameters.AddWithValue("@CompBy", selCompBy.SelectedValue);
			oCmd.Parameters.AddWithValue("@Notes", txtNotes.Text);

			if (oCmd.Parameters["@Notes"].Value.ToString() == "") {oCmd.Parameters["@Notes"].Value = DBNull.Value;}

			oReader = oCmd.ExecuteReader();

			if (oReader.HasRows)
			{
				tdErrors.Style["display"] = "";
				tdErrors.Style["color"] = "#ff0000";
				tdErrors.InnerHtml = "Some of the Actions you updated were not updated because &quot;" + sActionStatus + "&quot; is not a valid Action Status for those Actions. The following Actions were not updated.<ul>";

				while (oReader.Read())
					tdErrors.InnerHtml += "<li>" + oReader["ActionText"].ToString() + "</li>";

				tdErrors.InnerHtml += "</ul>";
			}
		}
		#endregion
	}
}