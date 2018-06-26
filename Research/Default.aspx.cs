using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
	protected void Page_Load(object sender, EventArgs e)
	{
	
	}

	protected void LoadInfo()
	{
		SqlCommand oCmd = new SqlCommand();
		SqlDataAdapter oAdapter = new SqlDataAdapter(oCmd);
		DataTable oTable = new DataTable();

		oCmd.Connection = Master.SqlConn;
		oCmd.CommandTimeout = 90;
		oCmd.CommandType = CommandType.StoredProcedure;

		#region Get Today's Calendar
		oTable.Clear();
		oCmd.CommandText = "spGetTodaysCalendarByCurrentUser";
		oAdapter.Fill(oTable);

		if (oTable.Rows.Count > 0)
		{
			tblMyCalendar.DataSource = oTable;
			tblMyCalendar.DataBind();
		}
		#endregion

		#region Get Recently Updated Actions
		oTable.Clear();
		oCmd.CommandText = "spGetRecentActionByCurrentUser";
		oAdapter.Fill(oTable);

		if (oTable.Rows.Count > 0)
		{
			tblMyActions.DataSource = oTable;
			tblMyActions.DataBind();
		}
		#endregion

		#region Get Recently Updated Measures
		oTable.Clear();
		oCmd.CommandText = "spGetRecentMeasuresByCurrentUser";
		oAdapter.Fill(oTable);

		if (oTable.Rows.Count > 0)
		{
			tblMyMeasures.DataSource = oTable;
			tblMyMeasures.DataBind();
		}
		#endregion

		#region Get News
		oTable.Clear();
		oCmd.CommandText = "spGetNews";
		oAdapter.Fill(oTable);

		// We want the header and footer to always display
		//		- no "if" clause for the News.
		tblNews.DataSource = oTable;
		tblNews.DataBind();

		#endregion
	}
}
