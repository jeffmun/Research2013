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

using AutismCenterBase.Utilities;

public partial class StaffList : System.Web.UI.Page
{
	private ReadConfig oConfig = new ReadConfig();
	private SqlConnection oConn = new SqlConnection();

	protected void Page_Load(object sender, EventArgs e)
	{
		SqlCommand oCmd = new SqlCommand();
		SqlDataReader oReader;
//		HtmlTableRow oTr;
//		HtmlTableCell oTd;
//		bool bDoDark = false;

		oCmd.Connection = Master.SqlConn;
		oCmd.CommandText = "spGetStaffList";
		oCmd.CommandTimeout = 90;
		oCmd.CommandType = CommandType.StoredProcedure;

		oCmd.Parameters.Add(new SqlParameter("@ApptStaffOnly", SqlDbType.Bit, 1, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, false));

		oReader = oCmd.ExecuteReader(CommandBehavior.CloseConnection);
		tblStaffList.DataSource = oReader;
		tblStaffList.DataBind();
		oReader.Close();
	}

	protected void Item_Bound(object sender, DataGridItemEventArgs e)
	{
		e.Item.Attributes["onclick"] = "HighlightRow(this);";
	}
}
