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
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;

public partial class Info_DEhistory : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private DBLookup oDBLookup;

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();

	protected void Page_Load(object sender, EventArgs e)
	{

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();

		oConn.Open();

		oDBLookup = new DBLookup(oConn);
	}

	protected void     btnLoad_Click(object sender, EventArgs e)
	{
		SqlCommand sqlCmd = new  SqlCommand();
	 
		sqlCmd.Connection = oConn;
		sqlCmd.CommandType = CommandType.StoredProcedure;
		sqlCmd.CommandText = "sp_DEhistory_by_staffID";

		sqlCmd.Parameters.Add("@staffID", SqlDbType.Int, 4);
		sqlCmd.Parameters["@staffID"].Value = Convert.ToInt32(ddlStaff.SelectedValue) ;

		DataTable dt = new DataTable();
		SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
		sqlAdapter.Fill(dt);

		gv.DataSource = dt;
		gv.DataBind();

	}

}