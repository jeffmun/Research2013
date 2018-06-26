using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;
using System.Text.RegularExpressions;

public partial class _test_tblparam : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private DBLookup oDBLookup;
	private ReadConfig oConfig = new ReadConfig();

	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
	}

	protected void foo(object sender, EventArgs e)
	{
		string category = "ALL_ABC,ALL_ADO2";
		string[] categories = category.Split(',');

		DataTable dt_Categories = new DataTable();
		dt_Categories.Columns.Add("id", typeof(int)); 
		dt_Categories.Columns.Add("tblname", typeof(String));

		DataRow workRow;
		int c = 0;
		foreach (string cat in categories)
		{
			c++;
			workRow = dt_Categories.NewRow();
			workRow["id"] = c;
			workRow["tblname"] = cat.Trim();
			dt_Categories.Rows.Add(workRow);
		}
		using (oConn)//assuming you have a connection here
		{
			SqlCommand cmd = new SqlCommand("_test_DoSomething", oConn);
			cmd.CommandType = CommandType.StoredProcedure;
			SqlParameter tvparam = cmd.Parameters.AddWithValue("@tbls", dt_Categories);
			tvparam.SqlDbType = SqlDbType.Structured;
			cmd.ExecuteNonQuery();
		}
	}




	protected void foo2(object sender, EventArgs e)
	{
		string category = "ALL_ABC,ALL_ADO2";
		string[] categories = category.Split(',');

		DataTable dt_Categories = new DataTable();
		dt_Categories.Columns.Add("id", typeof(int));
		dt_Categories.Columns.Add("tblname", typeof(String));

		DataRow workRow;
		int c = 0;
		for (int i=0; i < 10; i++ )
			{
				workRow = dt_Categories.NewRow();
				workRow["id"] = i;
				workRow["tblname"] = i.ToString();
				dt_Categories.Rows.Add(workRow);
			}
		using (oConn)//assuming you have a connection here
		{
			SqlCommand cmd = new SqlCommand("dbo.GetSomething", oConn);
			cmd.CommandType = CommandType.StoredProcedure;
			SqlParameter tvparam = cmd.Parameters.AddWithValue("@tbls", dt_Categories);
			tvparam.SqlDbType = SqlDbType.Structured;

			SqlDataReader SqlReader = cmd.ExecuteReader();


						//Fill the data table
		DataTable dt = new DataTable();
		dt.Load(SqlReader);

		gv1.DataSource = dt;
		gv1.DataBind();

		}
	}


}