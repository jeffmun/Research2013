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
	public partial class ActionsBySubject : System.Web.UI.Page
	{
		private SqlCommand oCmd;
		private SqlDataAdapter oAdapter;
		private DataTable oTable;
		private DBLookup oDBLookup;
		private int nSubjectID = 0;
		private int nActionID = 0;
		private int nActionStatusID = 0;
		private bool bHideNA = false;

		private void Page_Load(object sender, EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitActionsBySubject(event));";
			oDBLookup = new DBLookup(Master.SqlConn);

			if (!IsPostBack)
			{
				nSubjectID = Convert.ToInt32(Request["SubjectID"]);

				divTitle.InnerHtml = "Action Summary for " + oDBLookup.GetIDBySubjID(nSubjectID, true);

				aViewMeasures.HRef = Request.ApplicationPath + "/Measures/MeasuresBySubject.aspx?SubjectID=" + nSubjectID.ToString();
				aViewConsents.HRef = Request.ApplicationPath + "/Measures/ConsentsBySubject.aspx?SubjectID=" + nSubjectID.ToString();
				aViewHousehold.HRef = Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + oDBLookup.GetHouseholdIDBySubjID(nSubjectID).ToString();

				oDBLookup.BindDropDownList(ref selStudyID, "EXEC spGetActiveStudies", "StudyName", "StudyID", oDBLookup.GetStudyIDBySubjID(nSubjectID).ToString(), "--Study--");
				txtID.Text = oDBLookup.GetIDBySubjID(nSubjectID);

				BindData("");

				btnEditActions.Attributes["onclick"] = "EditMultipleActions(" + nSubjectID.ToString() + ", 'Complete');";
			}
		}

		private void BindData(string sSortExpression)
		{
			oCmd = new SqlCommand();
			oAdapter = new SqlDataAdapter(oCmd);
			oTable = new DataTable();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spGetAllActionsBySubjectID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@SubjectID", nSubjectID);
			oCmd.Parameters.AddWithValue("@SortField", sSortExpression);
			oCmd.Parameters.AddWithValue("@ActionStatusID", nActionStatusID);
			oCmd.Parameters.AddWithValue("@HideNA", bHideNA);

			if (nActionStatusID <= 0) { oCmd.Parameters["@ActionStatusID"].Value = DBNull.Value; }

			oAdapter.Fill(oTable);
			tblReport.DataSource = oTable;
			tblReport.DataBind();
		}

		protected void Item_Bound(object sender, DataGridItemEventArgs e)
		{
			if (e.Item.DataSetIndex >= 0)
			{
				if (oTable.Rows[e.Item.DataSetIndex]["CanBeScheduled"].ToString() == "1")
				{
					HtmlAnchor oLink = new HtmlAnchor();
					oLink.InnerText = oTable.Rows[e.Item.DataSetIndex]["ActionStatus"].ToString();
					oLink.HRef = Request.ApplicationPath + "/Measures/ScheduleAction.aspx?ActionID=" + oTable.Rows[e.Item.DataSetIndex]["ActionID"].ToString();
					e.Item.Cells[3].Controls.Add(oLink);
				}

				if (Convert.ToBoolean(oTable.Rows[e.Item.DataSetIndex]["ShowCheckBox"].ToString()))
				{
					e.Item.Cells[0].Controls.Add(new LiteralControl("<input type=\"checkbox\" name=\"chkActionIDs\" value=\"" + oTable.Rows[e.Item.DataSetIndex]["ActionID"].ToString() + "\" id=\"chkActionIDs" + oTable.Rows[e.Item.DataSetIndex]["ActionID"].ToString() + "\" />"));
				}
			}

			if (e.Item.DataSetIndex >= 0)
				e.Item.Attributes["onclick"] = "HighlightRow(this);";
		}

		protected void SortResults(object sender, DataGridSortCommandEventArgs e)
		{
			bHideNA = Convert.ToBoolean(hidHideNA.Value);
			nSubjectID = oDBLookup.GetSubjIDFromID(txtID.Text, Convert.ToInt32(selStudyID.SelectedValue));
			BindData(e.SortExpression);
		}

		protected void ChangeSubject(object sender, EventArgs e)
		{
			bHideNA = true;
			nSubjectID = oDBLookup.GetSubjIDFromID(txtID.Text, Convert.ToInt32(selStudyID.SelectedValue));
			divTitle.InnerHtml = "Action Summary for " + oDBLookup.GetIDBySubjID(nSubjectID, true);

            aViewMeasures.HRef = Request.ApplicationPath + "/Measures/MeasuresBySubject.aspx?SubjectID=" + nSubjectID.ToString();
            aViewConsents.HRef = Request.ApplicationPath + "/Measures/ConsentsBySubject.aspx?SubjectID=" + nSubjectID.ToString();
            aViewHousehold.HRef = Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + oDBLookup.GetHouseholdIDBySubjID(nSubjectID).ToString();

			BindData("");

			aHideNAActions.InnerHtml = "Hide NA Actions";
			hidHideNA.Value = bHideNA.ToString();
		}

		protected void HideNAActions(object sender, EventArgs e)
		{
			bHideNA = !Convert.ToBoolean(hidHideNA.Value);
			nSubjectID = oDBLookup.GetSubjIDFromID(txtID.Text, Convert.ToInt32(selStudyID.SelectedValue));
			hidHideNA.Value = bHideNA.ToString();

			BindData("");

			if (bHideNA)
				aHideNAActions.InnerHtml = "Show NA Actions";
			else
				aHideNAActions.InnerHtml = "Hide NA Actions";
		}
	}
}