using System;
using System.Collections.Generic;
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

public partial class Info_UW_NDARview : System.Web.UI.Page
{

	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private DBLookup oDBLookup;
	private string vwname;

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();
	

	protected void Page_Load(object sender, EventArgs e)
	{

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();


		oDBLookup = new DBLookup(oConn);

		if (Page.Request.QueryString["tableID"] != null)
		{
			vwname = Page.Request.QueryString["tableID"].ToString();
			Load_gv_UW_NDARview_by_ViewName(vwname);
		}
	}


	protected void Load_gv_UW_NDARview_by_ViewName(string vwname)
	{
		try
		{
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oConnData;
			if (oConnData.State == ConnectionState.Closed) oConnData.Open();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "spDEF__UW_NDARview_by_ViewName";

			cmd.Parameters.Add("@vwname", SqlDbType.VarChar, 200);
			cmd.Parameters["@vwname"].Value = vwname;

			SqlDataReader rdr = cmd.ExecuteReader();

			DataTable dt = new DataTable();
			dt.Load(rdr);

			int i =0;
			foreach (DataRow row in dt.Rows)
			{
				if (i==0) 
				{
				 lblTableName.Text =  Convert.ToString(row["TableName"]);
					lblspName.Text = Convert.ToString(row["spName"]);
				}
				i++;
			}

			gv_UW_NDARview.DataSource = dt;

			gv_UW_NDARview.DataBind();



		}
		catch (SqlException exc)
		{

		}
	}
}