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
	public partial class ActionsByActionStatus : System.Web.UI.Page
	{
		private int nStudyID;
		private int nStudyActionID;
		private int nActionStatusID;
		private bool bExclude;
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if (!IsPostBack) { BindData(""); }
		}

		protected void Item_Bound(object sender, DataGridItemEventArgs e)
		{
			if (e.Item.DataSetIndex >= 0)
				e.Item.Attributes["onclick"] = "HighlightRow(this);";
		}

		protected void SortResults(object sender, DataGridSortCommandEventArgs e)
		{
			BindData(e.SortExpression);
		}

		private void BindData(string sSortExpression)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataAdapter oAdapter = new SqlDataAdapter(oCmd);
			DataTable oTable = new DataTable();

			nStudyID = Convert.ToInt32(Request["StudyID"]);
			nStudyActionID = Convert.ToInt32(Request["StudyActionID"].ToString());
			nActionStatusID = Convert.ToInt32(Request["ActionStatusID"].ToString());
			bExclude = Convert.ToBoolean(Request["ExcludeStudyAction"]);

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spSearchActions";

			oCmd.Parameters.AddWithValue("@StudyID", nStudyID);
			oCmd.Parameters.AddWithValue("@StudyActionID", nStudyActionID);
			oCmd.Parameters.AddWithValue("@SortField", DBNull.Value);
			oCmd.Parameters.AddWithValue("@ActionStatusID", nActionStatusID);

			if (Request["GroupID"] != null)
				oCmd.Parameters.Add(new SqlParameter("@GroupID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, Request["GroupID"].ToString()));

			if (bExclude)
			{
				oCmd.Parameters["@ActionStatusID"].Value = DBNull.Value;
				oCmd.Parameters.Add(new SqlParameter("@ActionStatusExcluded", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nActionStatusID));
			}

			oAdapter.Fill(oTable);
			tblReport.DataSource = oTable;
			tblReport.DataBind();
		}
	}
}
