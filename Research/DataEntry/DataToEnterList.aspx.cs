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

namespace DataEntry
{
	public partial class DataToEnterList : System.Web.UI.Page
	{
		private SqlCommand oCmd;
		private SqlDataAdapter oAdapter;
		private DataTable oTable;
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return (DoSubmitDataToEnter(event));";
			selStudyID.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, null, 'studymeasures', 'selMeasure');";

			oDBLookup = new DBLookup(Master.SqlConn);

			if (!IsPostBack)
			{
				oDBLookup.BindDropDownList(ref selStudyID, "EXEC spGetActiveStudies", "StudyName", "StudyID", "", "--Select Study--");
				oDBLookup.BindDropDownList(ref selActionToTake, "EXEC spGetActionsToTake", "ActionToTake", "ActionToTake", "", "--Select Action To Take--");
				oDBLookup.BindDropDownList(ref selMeasStatus, "EXEC spGetMeasureStatuses", "MeasStatus", "MeasStatusID", "", "--Select Measure Status--");
				oDBLookup.BindListBox(ref selSubjStatus, "EXEC spGetAllSubjectStatuses", "SubjStatus", "SubjStatusID", "");
				oDBLookup.BindListBox(ref selMeasure, "SELECT StudyMeasName, StudyMeasID FROM tblStudyMeas WHERE StudyID = " + selStudyID.SelectedValue, "StudyMeasName", "StudyMeasID", "");
			}
		}

		protected void GetDataToEnter(object sender, EventArgs e)
		{
			BindData("");
		}

		protected void SortData(object sender, DataGridSortCommandEventArgs e)
		{
			BindData(e.SortExpression);
		}

		protected void Item_Bound(object sender, DataGridItemEventArgs e)
		{
			if (e.Item.DataSetIndex >= 0)
			{
				e.Item.Attributes["onclick"] = "HighlightRow(this);";

				if (oTable.Rows[e.Item.DataSetIndex]["FormURL"].ToString() == "")
					e.Item.Cells[5].Controls.Clear();
			}
		}

		private void BindData(string sSortExpression)
		{
			oCmd = new SqlCommand();
			oAdapter = new SqlDataAdapter(oCmd);
			oTable = new DataTable();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetDataToEnterReport";
			oCmd.CommandTimeout = 90;

			oCmd.Parameters.AddWithValue("@StudyID", selStudyID.SelectedValue);
			oCmd.Parameters.AddWithValue("@SubjID", txtSubjID.Text);
			oCmd.Parameters.Add("@StudyMeasIDs", SqlDbType.VarChar, 500);
			oCmd.Parameters.Add("@SubjStatusIDs", SqlDbType.VarChar, 500);
			oCmd.Parameters.AddWithValue("@ActionToTake", selActionToTake.SelectedValue);
			oCmd.Parameters.AddWithValue("@MeasStatusID", selMeasStatus.SelectedValue);
			oCmd.Parameters.AddWithValue("@SortOrder", sSortExpression);

			if (Request[selMeasure.ClientID.Replace("_", "$")] != null)
				oCmd.Parameters["@StudyMeasIDs"].Value = Request[selMeasure.ClientID.Replace("_", "$")].ToString();
			else
				oCmd.Parameters["@StudyMeasIDs"].Value = DBNull.Value;

			if (Request[selSubjStatus.ClientID.Replace("_", "$")] != null)
				oCmd.Parameters["@SubjStatusIDs"].Value = Request[selSubjStatus.ClientID.Replace("_", "$")].ToString();
			else
				oCmd.Parameters["@SubjStatusIDs"].Value = DBNull.Value;

			if (oCmd.Parameters["@SubjID"].Value.ToString() == "") { oCmd.Parameters["@SubjID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@StudyMeasIDs"].Value.ToString() == "" || oCmd.Parameters["@StudyMeasIDs"].Value.ToString() == "-1") { oCmd.Parameters["@StudyMeasIDs"].Value = DBNull.Value; }
			if (oCmd.Parameters["@SubjStatusIDs"].Value.ToString() == "" || oCmd.Parameters["@SubjStatusIDs"].Value.ToString() == "-1") { oCmd.Parameters["@SubjStatusIDs"].Value = DBNull.Value; }
			if (oCmd.Parameters["@ActionToTake"].Value.ToString() == "" || oCmd.Parameters["@ActionToTake"].Value.ToString() == "-1") { oCmd.Parameters["@ActionToTake"].Value = DBNull.Value; }
			if (oCmd.Parameters["@MeasStatusID"].Value.ToString() == "" || oCmd.Parameters["@MeasStatusID"].Value.ToString() == "-1") { oCmd.Parameters["@MeasStatusID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@SortOrder"].Value.ToString() == "") { oCmd.Parameters["@SortOrder"].Value = DBNull.Value; }

			oAdapter.Fill(oTable);

			if (oTable.Rows.Count > 0)
			{
				tblReport.DataSource = oTable;
				tblReport.DataBind();

				tblInput.Style["display"] = "none";
				tblReport.Style["display"] = "inline";
			}
		}
	}
}
