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
	public partial class EditStudyActions : System.Web.UI.Page
	{
		private TextFormatter oFormat = new TextFormatter();
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
			else
			{
				Form.Attributes["onsubmit"] = "return(DoSubmitEditStudyActions(event));";

				if (!IsPostBack)
					GetStudyActions();
			}
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			int nStudyID = Convert.ToInt32(hidStudyID.Value.ToString());

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spUpdateStudyAction";

			oCmd.Parameters.Add("@StudyActionID", SqlDbType.Int);
			oCmd.Parameters.Add("@StudyID", SqlDbType.Int);
			oCmd.Parameters.Add("@ActionTypeID", SqlDbType.Int);
			oCmd.Parameters.Add("@LabID", SqlDbType.Int);
			oCmd.Parameters.Add("@AssignOnEntry", SqlDbType.SmallInt);
			oCmd.Parameters.Add("@ActionText", SqlDbType.VarChar, 50);
			oCmd.Parameters.Add("@StaffPosID", SqlDbType.Int);
			oCmd.Parameters.Add("@SortOrder", SqlDbType.Float, 8);
			oCmd.Parameters.Add("@AllowDuplicate", SqlDbType.SmallInt);
			oCmd.Parameters.Add("@Notes", SqlDbType.VarChar, 250);
			oCmd.Parameters.Add("@GroupIDs", SqlDbType.VarChar, 4000);

			if (Request["hidStudyActionID"] != null)
			{
				string[] sStudyActionID = Request["hidStudyActionID"].ToString().Replace(", ", ",").Split(',');
				string sGroups;

				for (int i=0;i<sStudyActionID.Length;i++)
				{
					sGroups = Request["selGroupIDs" + sStudyActionID[i]];

					oCmd.Parameters["@StudyActionID"].Value = sStudyActionID[i].ToString();
					oCmd.Parameters["@StudyID"].Value = nStudyID.ToString();
					oCmd.Parameters["@ActionTypeID"].Value = Request["selActionTypeID" + sStudyActionID[i]].ToString();
					oCmd.Parameters["@LabID"].Value = Request["selLabID" + sStudyActionID[i]].ToString();
					oCmd.Parameters["@AssignOnEntry"].Value = Request["selAssignOnEntry" + sStudyActionID[i]].ToString();
					oCmd.Parameters["@ActionText"].Value = Request["txtActionText" + sStudyActionID[i]].ToString();
					oCmd.Parameters["@StaffPosID"].Value = Request["selStaffPosID" + sStudyActionID[i]].ToString();
					oCmd.Parameters["@SortOrder"].Value = Request["txtSortOrder" + sStudyActionID[i]].ToString();
					oCmd.Parameters["@AllowDuplicate"].Value = Request["selAllowDuplicate" + sStudyActionID[i]].ToString();
					oCmd.Parameters["@Notes"].Value = DBNull.Value;
					oCmd.Parameters["@GroupIDs"].Value = sGroups;

					if (oCmd.Parameters["@StudyActionID"].Value.ToString() == "") {oCmd.Parameters["@StudyActionID"].Value = DBNull.Value;}
					if (oCmd.Parameters["@StaffPosID"].Value.ToString() == "" || oCmd.Parameters["@StaffPosID"].Value.ToString() == "-1") {oCmd.Parameters["@StaffPosID"].Value = DBNull.Value;}

					oCmd.ExecuteNonQuery();
				}
			}

			if (Request["selActionTypeIDNEW"] != null)
			{
				oCmd.Parameters["@StudyActionID"].Value = DBNull.Value;
				oCmd.Parameters["@StudyID"].Value = nStudyID.ToString();
				oCmd.Parameters["@ActionTypeID"].Value = Request["selActionTypeIDNEW"].ToString();
				oCmd.Parameters["@LabID"].Value = Request["selLabIDNEW"].ToString();
				oCmd.Parameters["@AssignOnEntry"].Value = Request["selAssignOnEntryNEW"].ToString();
				oCmd.Parameters["@ActionText"].Value = Request["txtActionTextNEW"].ToString();
				oCmd.Parameters["@StaffPosID"].Value = Request["selStaffPosIDNEW"].ToString();
				oCmd.Parameters["@SortOrder"].Value = Request["txtSortOrderNEW"].ToString();
				oCmd.Parameters["@AllowDuplicate"].Value = Request["selAllowDuplicateNEW"].ToString();
				oCmd.Parameters["@Notes"].Value = DBNull.Value;
				oCmd.Parameters["@GroupIDs"].Value = DBNull.Value;

				if (oCmd.Parameters["@StaffPosID"].Value.ToString() == "" || oCmd.Parameters["@StaffPosID"].Value.ToString() == "-1") {oCmd.Parameters["@StaffPosID"].Value = DBNull.Value;}

				oCmd.ExecuteNonQuery();
			}

			GetStudyActions();
		}
		#endregion

		#region Get Study Actions
		private void GetStudyActions()
		{
			int nStudyID;
			string sGroupIDs;

			if (IsPostBack)
				nStudyID = Convert.ToInt32(hidStudyID.Value.ToString());
			else
				nStudyID = Convert.ToInt32(Request["StudyID"].ToString());

			hidStudyID.Value = nStudyID.ToString();

			oDBLookup = new DBLookup();

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetStudyActionsByStudyIDSortOrder";
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nStudyID));

			SqlDataReader oReader = oCmd.ExecuteReader();

			HtmlTableRow oTr;
			HtmlTableCell oTd;
			int nRowCount = 0;
			bool bDisplayedHeader = false;

			while (oReader.Read())
			{
				if (!bDisplayedHeader)
				{
					#region Display Column Headers
					oTr = new HtmlTableRow();

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Order";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Action Text";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Action Type";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Lab";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Staff Position";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Auto-Assign";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Copyable";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Groups";
					oTr.Cells.Add(oTd);

					tblMaster.Rows.Insert(nRowCount+1, oTr);

					bDisplayedHeader = true;
					#endregion
				}

				sGroupIDs = oDBLookup.GetGroupsByStudyActionID(Convert.ToInt32(oReader["StudyActionID"].ToString()), true);

				oTr = new HtmlTableRow();

				#region Display Attributes For Each Study Action
				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml = "<input type=\"text\" name=\"txtSortOrder" + oReader["StudyActionID"].ToString() + "\" value=\"" + oReader["SortOrder"].ToString() + "\" style=\"width: 25px;\" maxlength=\"4\" id=\"txtSortOrder" + oReader["StudyActionID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml = "<input type=\"text\" name=\"txtActionText" + oReader["StudyActionID"].ToString() + "\" value=\"" + oReader["ActionText"].ToString() + "\" style=\"width: 150px;\" id=\"txtActionText" + oReader["StudyActionID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml = oDBLookup.BindDropDownList("selActionTypeID" + oReader["StudyActionID"].ToString() + "", Convert.ToInt32(oReader["StudyActionID"].ToString()), "EXEC spGetAllActionTypes", "ActionType", "ActionTypeID", oReader["ActionTypeID"].ToString(), "--Select Action Type--", "width: 110px;");
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml = oDBLookup.BindDropDownList("selLabID" + oReader["StudyActionID"].ToString() + "", Convert.ToInt32(oReader["StudyActionID"].ToString()), "EXEC spGetLabs", "LabName", "LabID", oReader["LabID"].ToString(), "--Select Lab--", "width: 90px;");
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml = oDBLookup.BindDropDownList("selStaffPosID" + oReader["StudyActionID"].ToString() + "", Convert.ToInt32(oReader["StudyActionID"].ToString()), "EXEC spGetStaffPositions", "PositionAndStaffName", "StaffPosID", oReader["StaffPosID"].ToString(), "--Select Staff Position--", "width: 165px;");
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml += "<select name=\"selAssignOnEntry" + oReader["StudyActionID"].ToString() + "\" id=\"selAssignOnEntry" + oReader["StudyActionID"].ToString() + "\">";

				if (oReader["AssignOnEntry"].ToString() == "1")
				{
					oTd.InnerHtml += "	<option value=\"1\" selected=\"selected\">Yes</option>";
					oTd.InnerHtml += "	<option value=\"0\">No</option>";
				}
				else
				{
					oTd.InnerHtml += "	<option value=\"1\">Yes</option>";
					oTd.InnerHtml += "	<option value=\"0\" selected=\"selected\">No</option>";
				}

				oTd.InnerHtml += "</select>";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml += "<select name=\"selAllowDuplicate" + oReader["StudyActionID"].ToString() + "\" id=\"selAllowDuplicate" + oReader["StudyActionID"].ToString() + "\">";

				if (oReader["AllowDuplicate"].ToString() == "1")
				{
					oTd.InnerHtml += "	<option value=\"1\" selected=\"selected\">Yes</option>";
					oTd.InnerHtml += "	<option value=\"0\">No</option>";
				}
				else
				{
					oTd.InnerHtml += "	<option value=\"1\">Yes</option>";
					oTd.InnerHtml += "	<option value=\"0\" selected=\"selected\">No</option>";
				}

				oTd.InnerHtml += "</select>";
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidStudyActionID\" id=\"hidStudyActionID" + oReader["StudyActionID"].ToString() + "\" value=\"" + oReader["StudyActionID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml = oDBLookup.BindListBox("selGroupIDs" + oReader["StudyActionID"].ToString(), 2, true, "EXEC spGetGroupsByStudyID " + nStudyID.ToString(), "GroupName", "GroupID", sGroupIDs, "width: 100px;");
				oTr.Cells.Add(oTd);
				#endregion

				tblMaster.Rows.Insert(nRowCount+2, oTr);
				nRowCount++;
			}

			oReader.Close();
		}
		#endregion

		#region Add New Study Action
		protected void AddNewStudyAction(object sender, System.EventArgs e)
		{
			GetStudyActions();

			oDBLookup = new DBLookup(Master.SqlConn);

			HtmlTableRow oTr;
			HtmlTableCell oTd;

			#region Display a Row for the New Study Action
			oTr = new HtmlTableRow();

			tblMaster.Rows.Insert(2, oTr);

			oTr = new HtmlTableRow();
			oTr.ID = "trNEW";

			oTd = new HtmlTableCell();
			oTd.InnerHtml = "<input type=\"text\" name=\"txtSortOrderNEW\" value=\"\" style=\"width: 25px;\" maxlength=\"4\" id=\"txtSortOrderNEW\" />";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += "<input type=\"text\" name=\"txtActionTextNEW\" value=\"\" style=\"width: 150px;\" id=\"txtActionTextNEW\" />";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += oDBLookup.BindDropDownList("selActionTypeIDNEW", "EXEC spGetAllActionTypes", "ActionType", "ActionTypeID", "", "--Select Action Type--", "width: 110px;");
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += oDBLookup.BindDropDownList("selLabIDNEW", "EXEC spGetLabs", "LabName", "LabID", "", "--Select Lab--", "width: 90px;");
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += oDBLookup.BindDropDownList("selStaffPosIDNEW", "EXEC spGetStaffPositions", "PositionAndStaffName", "StaffPosID", "", "--Select Staff Position--", "width: 165px;");
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += "<select name=\"selAssignOnEntryNEW\" id=\"selAssignOnEntryNEW\">";
			oTd.InnerHtml += "	<option value=\"1\" selected=\"selected\">Yes</option>";
			oTd.InnerHtml += "	<option value=\"0\">No</option>";
			oTd.InnerHtml += "</select>";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += "<select name=\"selAllowDuplicateNEW\" id=\"selAllowDuplicateNEW\">";
			oTd.InnerHtml += "	<option value=\"1\">Yes</option>";
			oTd.InnerHtml += "	<option value=\"0\" selected=\"selected\">No</option>";
			oTd.InnerHtml += "</select>";
			oTd.InnerHtml += "<input type=\"hidden\" name=\"hidStudyActionIDNEW\" id=\"hidStudyActionIDNEW\" value=\"\" />";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml = "&nbsp;";
			oTr.Cells.Add(oTd);

			tblMaster.Rows.Insert(3, oTr);
			#endregion
		}
		#endregion
	}
}