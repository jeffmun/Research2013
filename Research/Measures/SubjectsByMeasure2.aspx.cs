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
	public partial class SubjectsByMeasure : System.Web.UI.Page
	{
		private SqlCommand oCmd;
		private SqlDataAdapter oAdapter;
		private DataTable oTable;
		private DBLookup oDBLookup;
		private int nStudyMeasureID = 0;
		private int nMeasureID = 0;
		private bool bHideNA = false;

		private void Page_Load(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup(Master.SqlConn);

			nStudyMeasureID = Convert.ToInt32(Request["StudyMeasID"].ToString());

			divTitle.InnerHtml = "Subject Summary for " + oDBLookup.GetStudyMeasureNameByStudyMeasID(nStudyMeasureID);

			if (!IsPostBack) { BindData(""); }
		}

		private void BindData(string sSortExpression)
		{
			oCmd = new SqlCommand();
			oAdapter = new SqlDataAdapter(oCmd);
			oTable = new DataTable();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spGetAllSubjectsByStudyMeasureID2";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@StudyMeasureID", nStudyMeasureID);
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
                e.Item.Cells[8].BackColor = System.Drawing.Color.FromName(oTable.Rows[e.Item.DataSetIndex]["sms_dd_color"].ToString());			

                //if (oTable.Rows[e.Item.DataSetIndex]["FormURL"].ToString() != "")
                //{
                //    HtmlAnchor oLink = new HtmlAnchor();
                //    oLink.InnerText = oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString() + ": " + oTable.Rows[e.Item.DataSetIndex]["ActionDesc"].ToString();
                //    oLink.HRef = "javascript:PopUpWindow('" + oTable.Rows[e.Item.DataSetIndex]["FormURL"].ToString() + "', 'wdwDEForm', 'scrollbars=yes,toolbar=no,status=no,menubar=no,height=750,width=750');";

                //    if (oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString().StartsWith("To Check") || oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString().StartsWith("ERROR")) { oLink.Style["color"] = " #ff0000"; }

                //    e.Item.Cells[8].Controls.Add(oLink);
                //}
                //else
                //{
                //    e.Item.Cells[8].Text = oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString() + ": " + oTable.Rows[e.Item.DataSetIndex]["ActionDesc"].ToString();
                //    if (oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString().StartsWith("To Check") || oTable.Rows[e.Item.DataSetIndex]["ActionToTake"].ToString().StartsWith("ERROR")) { e.Item.Cells[8].Style["color"] = " #ff0000"; }
                //}
			}

			if (e.Item.DataSetIndex >= 0)
				e.Item.Attributes["onclick"] = "HighlightRow(this);";

			e.Item.Cells[8].Style["white-space"] = "normal";
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