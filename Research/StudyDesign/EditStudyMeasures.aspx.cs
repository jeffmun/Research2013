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
	public partial class EditStudyMeasures : System.Web.UI.Page
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
				Form.Attributes["onsubmit"] = "return DoSubmitEditStudyMeasures(event);";

				if (!IsPostBack)
					GetStudyMeasures();
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
			oCmd.CommandText = "spUpdateStudyMeasure";

			oCmd.Parameters.Add("@StudyMeasID", SqlDbType.Int);
			oCmd.Parameters.Add("@StudyMeasName", SqlDbType.VarChar, 50);
			oCmd.Parameters.Add("@StudyID", SqlDbType.Int, 4);
			oCmd.Parameters.Add("@MeasureID", SqlDbType.Int, 4);
			oCmd.Parameters.Add("@LabID", SqlDbType.Int, 4);
			oCmd.Parameters.Add("@DateBegan", SqlDbType.DateTime, 8);
			oCmd.Parameters.Add("@DateEnd", SqlDbType.DateTime, 8);
			oCmd.Parameters.Add("@SortOrder", SqlDbType.Float, 8);
			oCmd.Parameters.Add("@CoreMeas", SqlDbType.SmallInt);
			oCmd.Parameters.AddWithValue("@Notes", DBNull.Value);
			oCmd.Parameters.Add("@GroupIDs", SqlDbType.VarChar, 4000);

			if (Request["hidStudyMeasID"] != null)
			{
				string[] sStudyMeasID = Request["hidStudyMeasID"].ToString().Replace(", ", ",").Split(',');
				string sGroups;

				for (int i=0;i<sStudyMeasID.Length;i++)
				{
					if (Request["selGroupIDs" + sStudyMeasID[i]] != null)
						sGroups = Request["selGroupIDs" + sStudyMeasID[i]].ToString();
					else
						sGroups = "";

					oCmd.Parameters["@StudyMeasID"].Value = sStudyMeasID[i].ToString();
					oCmd.Parameters["@StudyMeasName"].Value = Request["txtStudyMeasName" + sStudyMeasID[i]].ToString();
					oCmd.Parameters["@StudyID"].Value = nStudyID;
					oCmd.Parameters["@MeasureID"].Value = Request["selMeasureID" + sStudyMeasID[i]].ToString();
					oCmd.Parameters["@LabID"].Value = Request["selLabID" + sStudyMeasID[i]].ToString();
					oCmd.Parameters["@DateBegan"].Value = Request["txtDateBegan" + sStudyMeasID[i]].ToString();
					oCmd.Parameters["@DateEnd"].Value = Request["txtDateEnd" + sStudyMeasID[i]].ToString();
					oCmd.Parameters["@SortOrder"].Value = Request["txtSortOrder" + sStudyMeasID[i]].ToString();
					oCmd.Parameters["@CoreMeas"].Value = Request["selCoreMeasure" + sStudyMeasID[i]].ToString();
					oCmd.Parameters["@Notes"].Value = DBNull.Value;
					oCmd.Parameters["@GroupIDs"].Value = sGroups;

					if (oCmd.Parameters["@StudyMeasID"].Value.ToString() == "") {oCmd.Parameters["@StudyMeasID"].Value = DBNull.Value;}
					if (oCmd.Parameters["@DateBegan"].Value.ToString() == "") {oCmd.Parameters["@DateBegan"].Value = DBNull.Value;}
					if (oCmd.Parameters["@DateEnd"].Value.ToString() == "") {oCmd.Parameters["@DateEnd"].Value = DBNull.Value;}

					oCmd.ExecuteNonQuery();
				}
			}

			if (Request["selMeasureIDNEW"] != null)
			{
				oCmd.Parameters["@StudyMeasID"].Value = DBNull.Value;
				oCmd.Parameters["@StudyMeasName"].Value = Request["txtStudyMeasNameNEW"].ToString();
				oCmd.Parameters["@StudyID"].Value = nStudyID;
				oCmd.Parameters["@MeasureID"].Value = Request["selMeasureIDNEW"].ToString();
				oCmd.Parameters["@LabID"].Value = Request["selLabIDNEW"].ToString();
				oCmd.Parameters["@DateBegan"].Value = Request["txtDateBeganNEW"].ToString();
				oCmd.Parameters["@DateEnd"].Value = Request["txtDateEndNEW"].ToString();
				oCmd.Parameters["@SortOrder"].Value = Request["txtSortOrderNEW"].ToString();
				oCmd.Parameters["@CoreMeas"].Value = Request["selCoreMeasureNEW"].ToString();
				oCmd.Parameters["@Notes"].Value = DBNull.Value;
				oCmd.Parameters["@GroupIDs"].Value = DBNull.Value;

				if (oCmd.Parameters["@DateBegan"].Value.ToString() == "") {oCmd.Parameters["@DateBegan"].Value = DBNull.Value;}
				if (oCmd.Parameters["@DateEnd"].Value.ToString() == "") {oCmd.Parameters["@DateEnd"].Value = DBNull.Value;}

				oCmd.ExecuteNonQuery();
			}

			GetStudyMeasures();
		}
		#endregion

		#region Get Study Measures
		private void GetStudyMeasures()
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
			oCmd.CommandText = "spGetStudyMeasuresByStudyID";
			oCmd.Parameters.AddWithValue("@StudyID", nStudyID);

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
					oTr.Attributes["class"] = "trHeader";

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Order";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Study Meas Name";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Measure";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Lab";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Date Began";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Date End";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Core Meas";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Attributes["class"] = "tdHeaderAlt";
					oTd.InnerHtml = "Groups";
					oTr.Cells.Add(oTd);

					tblMaster.Rows.Insert(nRowCount+1, oTr);
					
					bDisplayedHeader = true;
					#endregion
				}

				sGroupIDs = oDBLookup.GetGroupsByStudyMeasureID(Convert.ToInt32(oReader["StudyMeasID"].ToString()), true);

				oTr = new HtmlTableRow();

				#region Display Attributes For Each Study Measure
				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml += "<input type=\"text\" name=\"txtSortOrder" + oReader["StudyMeasID"].ToString() + "\" value=\"" + oReader["SortOrder"].ToString() + "\" style=\"width: 25px;\" id=\"txtSortOrder" + oReader["StudyMeasID"].ToString() + "\" maxlength=\"4\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml += "<input type=\"text\" name=\"txtStudyMeasName" + oReader["StudyMeasID"].ToString() + "\" value=\"" + oReader["StudyMeasName"].ToString() + "\" style=\"width: 110px;\" id=\"txtStudyMeasName" + oReader["StudyMeasID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml += oDBLookup.BindDropDownList("selMeasureID" + oReader["StudyMeasID"].ToString(), Convert.ToInt32(oReader["StudyMeasID"].ToString()), "EXEC spGetMeasures", "MeasName", "MeasureID", oReader["MeasureID"].ToString(), "--Select Measure--", "width: 135px;");
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml += oDBLookup.BindDropDownList("selLabID" + oReader["StudyMeasID"].ToString(), Convert.ToInt32(oReader["StudyMeasID"].ToString()), "EXEC spGetLabs", "LabName", "LabID", oReader["LabID"].ToString(), "--Select Lab--", "width: 90px;");
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml += "<input type=\"text\" name=\"txtDateBegan" + oReader["StudyMeasID"].ToString() + "\" value=\"" + oReader["DateBegan"].ToString() + "\" style=\"width: 60px;\" id=\"txtDateBegan" + oReader["StudyMeasID"].ToString() + "\" />\n";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml += "<input type=\"text\" name=\"txtDateEnd" + oReader["StudyMeasID"].ToString() + "\" value=\"" + oReader["DateEnd"].ToString() + "\" style=\"width: 60px;\" id=\"txtDateEnd" + oReader["StudyMeasID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml += "<select name=\"selCoreMeasure" + oReader["StudyMeasID"].ToString() + "\" id=\"selCoreMeasure" + oReader["StudyMeasID"].ToString() + "\">";

				if (oReader["CoreMeas"].ToString() == "1")
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
				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidStudyMeasID\" value=\"" + oReader["StudyMeasID"].ToString() + "\" id=\"hidStudyMeasID" + oReader["StudyMeasID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["vertical-align"] = "top";
				oTd.InnerHtml += oDBLookup.BindListBox("selGroupIDs" + oReader["StudyMeasID"].ToString(), 2, true, "EXEC spGetGroupsByStudyID " + nStudyID.ToString(), "GroupName", "GroupID", sGroupIDs, "width: 100px;");
				oTr.Cells.Add(oTd);
				#endregion

				tblMaster.Rows.Insert(nRowCount+2, oTr);
				nRowCount++;
			}

			oReader.Close();
		}
		#endregion

		#region Add New Study Measure
		protected void AddNewStudyMeasure(object sender, System.EventArgs e)
		{
			GetStudyMeasures();

			oDBLookup = new DBLookup(Master.SqlConn);

			HtmlTableRow oTr;
			HtmlTableCell oTd;

			#region Display a Row For Each New Study Measure
			oTr = new HtmlTableRow();

			oTr = new HtmlTableRow();
			oTr.ID = "trNEW";

			oTd = new HtmlTableCell();
			oTd.InnerHtml += "<input type=\"text\" name=\"txtSortOrderNEW\" value=\"\" style=\"width: 25px;\" id=\"txtSortOrderNEW\" maxlength=\"4\" />";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += "<input type=\"text\" name=\"txtStudyMeasNameNEW\" value=\"\" style=\"width: 110px;\" id=\"txtStudyMeasNameNEW\" />";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += oDBLookup.BindDropDownList("selMeasureIDNEW", "EXEC spGetMeasures", "MeasName", "MeasureID", "", "--Select Measure--", "width: 135px;");
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += oDBLookup.BindDropDownList("selLabIDNEW", "EXEC spGetLabs", "LabName", "LabID", "", "--Select Lab--", "width: 90px;");
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += "<input type=\"text\" name=\"txtDateBeganNEW\" value=\"\" style=\"width: 60px;\" id=\"txtDateBeganNEW\" />\n";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += "<input type=\"text\" name=\"txtDateEndNEW\" value=\"\" style=\"width: 60px;\" id=\"txtDateEndNEW\" />";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml += "<select name=\"selCoreMeasureNEW\" id=\"selCoreMeasureNEW\">";
			oTd.InnerHtml += "	<option value=\"1\">Yes</option>";
			oTd.InnerHtml += "	<option value=\"0\">No</option>";
			oTd.InnerHtml += "</select>";
			oTr.Cells.Add(oTd);

			oTd = new HtmlTableCell();
			oTd.InnerHtml = "&nbsp;";
			oTr.Cells.Add(oTd);

			tblMaster.Rows.Insert(2, oTr);
			#endregion
		}
		#endregion

}
}