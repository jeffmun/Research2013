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
	public partial class AddAssistantsToAction : System.Web.UI.Page
	{
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitAddAssistants());";

			oDBLookup = new DBLookup(Master.SqlConn);

			int nActionID = Convert.ToInt32(Request["ActionID"].ToString());
			DataSet oDataSet;
			DataTable oTable;
			string sStaffDDString = "";
			string sRoleDDString = "";
			HtmlTableRow oTr;
			HtmlTableCell oTd;
			int nCount = 0;
			string sError = "";

			hidActionID.Value = nActionID.ToString();

			if (IsPostBack)
			{
				nActionID = Convert.ToInt32(hidActionID.Value);
				string[] aStaffIDs = Request["selStaffID"].Replace(", ", ",").Split(',');
				string[] aStaffRoles = Request["selStaffRole"].Replace(", ", ",").Split(',');
				string[] aStaffNotes = Request["txtStaffNotes"].Replace(", ", ",").Split(',');

				sError = UpdateAssistants(nActionID, aStaffIDs, aStaffRoles, aStaffNotes);

				if (sError != "")
				{
					tdError.InnerHtml = sError;
					tdError.Style["display"] = "inline";
					tdError.Style["color"] = "#ff0000";
				}
			}

			oDataSet = GetAssistants(nActionID);
			oTable = oDataSet.Tables["tblData"];

			if (oTable.Rows.Count > 0)
			{
				for (int i=0;i<oTable.Rows.Count;i++)
				{
					#region Display Each Existing Assistant
					sStaffDDString = oDBLookup.BindDropDownList("selStaffID", "EXEC spGetAllStaff", "StaffShortName", "StaffID", oTable.Rows[i]["StaffID"].ToString(), "--Staff Member--", "width: 100%;");
					sRoleDDString = oDBLookup.BindDropDownList("selStaffRole", "EXEC spGetStaffApptRoles", "ApptRole", "ApptRoleID", oTable.Rows[i]["ApptRoleID"].ToString(), "--Staff Member--", "width: 100%;");

					oTr = new HtmlTableRow();

					oTd = new HtmlTableCell();
					oTd.InnerHtml = sStaffDDString;
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = sRoleDDString;
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "<textarea rows=\"1\" name=\"txtStaffNotes\" style=\"width: 100%;\">" + oTable.Rows[i]["ApptStaffNotes"].ToString() + "</textarea>";
					oTr.Cells.Add(oTd);

					tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);

					nCount++;
					#endregion
				}
			}
			else
			{
				#region Display Empty Form
				sStaffDDString = oDBLookup.BindDropDownList("selStaffID", "EXEC spGetAllStaff", "StaffShortName", "StaffID", "", "--Staff Member--", "width: 100%;");
				sRoleDDString = oDBLookup.BindDropDownList("selStaffRole", "EXEC spGetStaffApptRoles", "ApptRole", "ApptRoleID", "", "--Staff Role--", "width: 100%;");

				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
				oTd.Style["width"] = "25%";
				oTd.InnerHtml = sStaffDDString;
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["width"] = "25%";
				oTd.InnerHtml = sRoleDDString;
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<textarea rows=\"1\" name=\"txtStaffNotes\" style=\"width: 100%;\"></textarea>";
				oTr.Cells.Add(oTd);

				tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);

				nCount = 1;
				#endregion
			}

			btnAddStaff.Attributes["onclick"] = "AddAssistants(" + nCount.ToString() + ");";
			btnGoBack.Attributes["onclick"] = "document.location = '" + Request.ApplicationPath + "/Measures/EditAction.aspx?ActionID=" + nActionID.ToString() + "';";
		}

		#region Update the Assistants
		private string UpdateAssistants(int nActionID, string[] aStaffIDs, string[] aStaffRoles, string[] aStaffNotes)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.CommandText = "spDeleteApptStaffAssignmentsByActionID";
			oCmd.Parameters.AddWithValue("@ActionID", nActionID);
			oCmd.ExecuteNonQuery();

			oCmd.CommandText = "spInsertApptStaffAssignment";

			for (int i=0;i<aStaffIDs.Length;i++)
			{
				if (aStaffIDs[i] != "-1")
				{
					oCmd.Parameters.Clear();

					oCmd.Parameters.AddWithValue("@ActionID", nActionID);
					oCmd.Parameters.AddWithValue("@StaffID", aStaffIDs[i]);
					oCmd.Parameters.AddWithValue("@StaffRoleID", aStaffRoles[i]);
					oCmd.Parameters.AddWithValue("@StaffNotes", aStaffNotes[i].Replace("|", ","));
					oCmd.Parameters.AddWithValue("@ReturnValue", DBNull.Value);

					oCmd.Parameters["@ReturnValue"].Direction = ParameterDirection.ReturnValue;

					if (oCmd.Parameters["@StaffNotes"].Value.ToString() == "") {oCmd.Parameters["@StaffNotes"].Value = DBNull.Value;}

					oCmd.ExecuteNonQuery();

					if (oCmd.Parameters["@ReturnValue"].Value.ToString() != "0")
						sReturn += oDBLookup.GetStaffNameByStaffID(Convert.ToInt32(aStaffIDs[i])) + " is already scheduled for an appointment at this time.<br/>";
				}
			}

			return sReturn;
		}
		#endregion

		#region Get Assistants from db
		private DataSet GetAssistants(int nActionID)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataAdapter oAdapter;
			DataSet oDataSet;

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spGetAssistantsByActionID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nActionID));

			oAdapter = new SqlDataAdapter(oCmd);
			oDataSet = new DataSet();
			oAdapter.Fill(oDataSet, "tblData");

			return oDataSet;
		}
		#endregion
	}
}
