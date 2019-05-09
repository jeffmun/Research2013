using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class AC_ValantTracking : BasePage //System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		//LoadGrid();
	}

	protected void LoadGrid()
	{
		SQL_utils sql = new SQL_utils("vtj");

		DataTable dt = sql.DataTable_from_SQLstring("select num, payor, client, amount, dos, billed, cpt, status, notes from  InsuranceAging");

		grid.DataSource = dt;
		grid.DataBind();

	}

	protected void SortGrid()
	{
		//grid.GroupSummarySortInfo.Clear();
		//if (ddlGroupSummary.SelectedIndex > 0)
		//{
		//	ColumnSortOrder sortOrder = ddlGroupSummary.SelectedIndex == 1 ? ColumnSortOrder.Ascending : ColumnSortOrder.Descending;
		//	grid.GroupSummarySortInfo.AddRange(new ASPxGroupSummarySortInfo("client", grid.GroupSummary["amount"], sortOrder));
		//}
	}
}