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
	public partial class ActionSubjectDetail : System.Web.UI.Page
	{
		private SqlCommand oCmd;
		private SqlDataAdapter oAdapter;
		private DataTable oTable;
		private DBLookup oDBLookup;
		private int nStudyActonID = 0;
		private int nActionID = 0;
		private bool bHideNA = false;

		private void Page_Load(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup(Master.SqlConn);

			nStudyActonID = Convert.ToInt32(Request["StudyActionID"].ToString());

			divTitle.InnerHtml = "Subject Summary for " + oDBLookup.GetActionTextByStudyActionID(nStudyActonID);

			if (!IsPostBack) { BindData(""); }
		}

		private void BindData(string sSortExpression)
		{
			oCmd = new SqlCommand();
			oAdapter = new SqlDataAdapter(oCmd);
			oTable = new DataTable();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spGetAllSubjectsByStudyActionID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@StudyActionID", nStudyActonID);
			oCmd.Parameters.AddWithValue("@SortField", sSortExpression);
			oCmd.Parameters.AddWithValue("@HideNA", bHideNA);

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
					oLink.InnerText = "Schedule";
					oLink.HRef = Request.ApplicationPath + "/Measures/ScheduleAction.aspx?ActionID=" + oTable.Rows[e.Item.DataSetIndex]["ActionID"].ToString();
					e.Item.Cells[5].Controls.Add(oLink);
				}
			}

			if (e.Item.DataSetIndex >= 0)
				e.Item.Attributes["onclick"] = "HighlightRow(this);";
		}

		protected void SortResults(object sender, DataGridSortCommandEventArgs e)
		{
			bHideNA = Convert.ToBoolean(hidHideNA.Value);
			BindData(e.SortExpression);
		}

		protected void HideNAActions(object sender, EventArgs e)
		{
			bHideNA = !Convert.ToBoolean(hidHideNA.Value);
			hidHideNA.Value = bHideNA.ToString();

			BindData("");

			if (bHideNA)
				aHideNAActions.InnerHtml = "Show NA Actions";
			else
				aHideNAActions.InnerHtml = "Hide NA Actions";
		}
	}
}