using System;
using System.Configuration;
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

namespace WebCal
{
	public partial class ScheduleMiscAction : System.Web.UI.Page
	{
		private ReadConfig oConfig = new ReadConfig();
		private SqlConnection oConn = new SqlConnection();
		private DBLookup oDBLookup;

		private void Page_Load(object sender, EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitSchedMiscItem());";

			if (!IsPostBack)
			{
				oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
				oConn.Open();
				oDBLookup = new DBLookup(oConn);

				oDBLookup.BindDropDownList(ref selActionID, "EXEC spGetMiscStudyActions", "ActionText", "StudyActionID", "", "--Select Action--");
				oDBLookup.BindDropDownList(ref selStaffID, "EXEC spGetAllStaff", "StaffShortName", "StaffID", "", "--Select Staff--");
				oDBLookup.BindListBox(ref selAdditionalStaffIDs, "EXEC spGetAllStaff", "StaffShortName", "StaffID", "");
				oDBLookup.BindDropDownList(ref selAsstRole, "EXEC spGetStaffApptRoles", "ApptRole", "ApptRoleID", "", "--Assistant Role--");

				oConn.Close();
			}
		}

		protected void SaveChanges(object sender, EventArgs e)
		{
			oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
			oConn.Open();
			oDBLookup = new DBLookup(oConn);

			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			#region Insert the Main Action
			oCmd.CommandText = "spInsertMiscAction";
			oCmd.Parameters.Add(new SqlParameter("@StudyActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, selActionID.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@ApptDate", SqlDbType.DateTime, 8, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, txtApptDate.Text));
			oCmd.Parameters.Add(new SqlParameter("@ApptStartTime", SqlDbType.DateTime, 8, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, txtApptDate.Text + " " + selStartTime.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@ApptEndTime", SqlDbType.DateTime, 8, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, txtApptDate.Text + " " + selEndTime.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@RespForID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, selStaffID.SelectedValue));
			oCmd.Parameters.Add(new SqlParameter("@Notes", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, txtNotes.Text));
			oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.InputOutput, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));
			oCmd.Parameters.Add(new SqlParameter("@ReturnCode", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));

			if (oCmd.Parameters["@Notes"].Value.ToString() == "") {oCmd.Parameters["@Notes"].Value = DBNull.Value;}

			oCmd.ExecuteNonQuery();
			#endregion

			if (oCmd.Parameters["@ReturnCode"].Value.ToString() == "0")
			{
				int nActionID = Convert.ToInt32(oCmd.Parameters["@ActionID"].Value.ToString());
				string sReturn = "";

				if (Request["selAdditionalStaffIDs"] != null && Request["selAdditionalStaffIDs"] != "")
				{
					string[] sStaffIDs = Request["selAdditionalStaffIDs"].ToString().Replace(", ", ",").Split(',');

					#region Delete Any Existing Assistants
					oCmd.Parameters.Clear();
					oCmd.CommandText = "spDeleteApptStaffAssignmentsByActionID";
					oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nActionID));
					oCmd.ExecuteNonQuery();
					#endregion

					#region Add Any New Assistants
					oCmd.CommandText = "spInsertApptStaffAssignment";
					oCmd.Parameters.Add(new SqlParameter("@StaffID", SqlDbType.Int, 4));
					oCmd.Parameters.Add(new SqlParameter("@StaffRoleID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, selAsstRole.SelectedValue));
					oCmd.Parameters.Add(new SqlParameter("@StaffNotes", SqlDbType.VarChar, 1, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));
					oCmd.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));

					for (int i=0;i<sStaffIDs.Length;i++)
					{
						oCmd.Parameters["@StaffID"].Value = sStaffIDs[i];

						if (oCmd.Parameters["@StaffID"].Value.ToString() == "") {oCmd.Parameters["@StaffID"].Value = DBNull.Value;}

						oCmd.ExecuteNonQuery();

						if (oCmd.Parameters["@ReturnValue"].Value.ToString() != "0")
						{
							oCmd.Parameters.Clear();
							oCmd.Parameters.AddWithValue("@ActionID", nActionID);
							oCmd.CommandText = "spDeleteMiscAction";
							oCmd.ExecuteNonQuery();

							sReturn += oDBLookup.GetStaffNameByStaffID(Convert.ToInt32(sStaffIDs[i])) + " is already scheduled for an appointment at this time. This Action was not created.<br/>";
						}
					}
					#endregion
				}

				if (sReturn == "")
					//DF: 4/9 add ~
					Response.Redirect("~/WebCal/", true);
				else
				{
					tdError.Style["display"] = "";
					tdError.Style["color"] = "#ff0000";
					tdError.InnerHtml = sReturn;
				}
			}
			else
			{
				tdError.Style["display"] = "";
				tdError.Style["color"] = "#ff0000";
				tdError.InnerHtml = "The staff member you entered is already scheduled for another appointment at the time and date you selected. Please select a different time and/or date.";
			}

			oConn.Close();
		}

		//DF: 4/9 removed--causing page_load to fire twice.  Maybe left over from upgrade from 2003???  
		//#region Web Form Designer generated code
		//override protected void OnInit(EventArgs e)
		//{
		//    InitializeComponent();
		//    base.OnInit(e);
		//}
		
		//private void InitializeComponent()
		//{    
		//    this.Load += new System.EventHandler(this.Page_Load);
		//}
		//#endregion
	}
}
