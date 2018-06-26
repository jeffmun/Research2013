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
	public partial class ScheduleAction : System.Web.UI.Page
	{
		private DBLookup oDBLookup;
		private int nActionID;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitScheduleAction());";

			if (!IsPostBack)
			{
				oDBLookup = new DBLookup(Master.SqlConn);

				nActionID = Convert.ToInt32(Request["ActionID"].ToString());
				tdTitle.InnerHtml += ": " + oDBLookup.GetActionTextByActionID(nActionID) + " for " + oDBLookup.GetIDFromActionID(nActionID);

				oDBLookup.BindDropDownList(ref selLocation, "EXEC spGetLocations", "ApptLocation", "ApptLocation", "", "--Select Location--");
				oDBLookup.BindDropDownList(ref selAsstStatus, "EXEC spGetAssistantStatuses", "AsstStatus", "AsstStatusID", "", "--Select Asst. Status--");

				GetScheduleInfo();
			}
		}

		#region Get Schedule Info.
		private void GetScheduleInfo()
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spGetActionDetailsByActionID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@ActionID", nActionID);

			oReader = oCmd.ExecuteReader();

			if (oReader.HasRows)
			{
				oReader.Read();

				selStartTime.SelectedIndex = -1;
				selEndTime.SelectedIndex = -1;
				selLocation.SelectedIndex = -1;
				selAsstStatus.SelectedIndex = -1;

				txtDateDone.Text = oReader["DateDone"].ToString();
				txtAsstNotes.Text = oReader["AsstNotes"].ToString();
				hidActionID.Value = oReader["ActionID"].ToString();

				if (oReader["ApptStartTime"].ToString() != "") {selStartTime.SelectedValue = oReader["ApptStartTime"].ToString();}
				if (oReader["ApptEndTime"].ToString() != "") {selEndTime.SelectedValue = oReader["ApptEndTime"].ToString();}
				if (oReader["Location"].ToString() != "") {selLocation.SelectedValue = oReader["Location"].ToString();}
				if (oReader["AsstStatusID"].ToString() != "") {selAsstStatus.SelectedValue = oReader["AsstStatusID"].ToString();}
			}

			oReader.Close();
		}
		#endregion

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			int nErrorCode = 0;

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spScheduleAction";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@ActionID", hidActionID.Value);
			oCmd.Parameters.AddWithValue("@DateDone", txtDateDone.Text);
			oCmd.Parameters.AddWithValue("@ApptStartTime", selStartTime.SelectedValue);
			oCmd.Parameters.AddWithValue("@ApptEndTime", selEndTime.SelectedValue);
			oCmd.Parameters.AddWithValue("@Location", selLocation.SelectedValue);
			oCmd.Parameters.AddWithValue("@AsstStatusID", selAsstStatus.SelectedValue);
			oCmd.Parameters.AddWithValue("@AsstNotes", txtAsstNotes.Text);
			oCmd.Parameters.AddWithValue("@ReturnValue", DBNull.Value);

			oCmd.Parameters["@ReturnValue"].Direction = ParameterDirection.ReturnValue;

			if (oCmd.Parameters["@Location"].Value.ToString() == "-1") {oCmd.Parameters["@Location"].Value = DBNull.Value;}
			if (oCmd.Parameters["@AsstStatusID"].Value.ToString() == "-1") {oCmd.Parameters["@AsstStatusID"].Value = DBNull.Value;}
			if (oCmd.Parameters["@AsstNotes"].Value.ToString() == "-1") {oCmd.Parameters["@AsstNotes"].Value = DBNull.Value;}

			oCmd.ExecuteNonQuery();
			nActionID = Convert.ToInt32(oCmd.Parameters["@ActionID"].Value.ToString());
			nErrorCode = Convert.ToInt32(oCmd.Parameters["@ReturnValue"].Value.ToString());

			if (nErrorCode == 1)
			{
				tdError.Style["display"] = "inline";
				tdError.Style["color"] = "#ff0000";
				tdError.InnerHtml = "This Subject is already scheduled for an appointment at this time. Please select a new time and/or date.";
			}
			else if (nErrorCode == 2)
			{
				tdError.Style["display"] = "inline";
				tdError.Style["color"] = "#ff0000";
				tdError.InnerHtml = "The Staff Member who is responsible for this Action is already scheduled for another appointment at this time. Please select a new time and/or date.";
			}
			else if (nErrorCode == 3)
			{
				tdError.Style["display"] = "inline";
				tdError.Style["color"] = "#ff0000";
				tdError.InnerHtml = "The Location you selected is not available at this time. Please select a new location, time, and/or date.";
			}
			else
				Response.Redirect(Request.ApplicationPath + "/measures/EditAction.aspx?ActionID=" + nActionID.ToString());
		}
		#endregion

		#region Cancel Changes
		protected void CancelChanges(object sender, System.EventArgs e)
		{
			nActionID = Convert.ToInt32(Request["hidActionID"].ToString());
			Response.Redirect(Request.ApplicationPath + "/Measures/EditAction.aspx?ActionID=" + nActionID.ToString());
		}
		#endregion
	}
}
