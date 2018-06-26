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
	public partial class SubjectsByStudy : System.Web.UI.Page
	{
		private int nStudyID;

		private void Page_Load(object sender, System.EventArgs e)
		{
			nStudyID = Convert.ToInt32(Request["StudyID"].ToString());

			if (!IsPostBack) { BindData(""); }
		}

		private void BindData(string sSortExpression)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spGetSubjectsByStudyID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@StudyID", nStudyID);
			if (sSortExpression != "") { oCmd.Parameters.AddWithValue("@SortField", sSortExpression); }

			SqlDataAdapter oAdapter = new SqlDataAdapter(oCmd);
			DataTable oTable = new DataTable();

			oAdapter.Fill(oTable);

			tblReport.DataSource = oTable;
			tblReport.DataBind();
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
	}
}
