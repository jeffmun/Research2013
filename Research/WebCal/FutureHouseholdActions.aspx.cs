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

namespace WebCal
{
	public partial class FutureHouseholdActions : System.Web.UI.Page
	{
		private TextFormatter oFormat = new TextFormatter();
		private ReadConfig oConfig = new ReadConfig();

		private void Page_Load(object sender, System.EventArgs e)
		{
			int nHouseholdID = Convert.ToInt32(Request["HouseholdID"].ToString());
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;
//			HtmlTableRow oTr;
//			HtmlTableCell oTd;
//			bool bDoDark = false;

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spRPTScheduledActionsByHouseholdID";

			oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nHouseholdID));

			oReader = oCmd.ExecuteReader();

			tblActions.DataSource = oReader;
			tblActions.DataBind();
			oReader.Close();
		}

		protected void Item_Bound(object sender, DataGridItemEventArgs e)
		{
			e.Item.Attributes["onclick"] = "HighlightRow(this);";
		}
	}
}
