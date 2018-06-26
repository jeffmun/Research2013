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

public partial class Info_ScoreProc : System.Web.UI.Page
{

	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private DBLookup oDBLookup;
	private int tableID;
	private int tblpk;

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();


	protected void Page_Load(object sender, EventArgs e)
	{

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();


		oDBLookup = new DBLookup(oConn);

		//if (Page.Request.QueryString["tableID"] != null)
		//{
		//    tableID = Convert.ToInt32(Page.Request.QueryString["tableID"]);
		//    Load_gv_ScoreProc(tableID);
		//}
		if (Page.Request.QueryString["tblpk"] != null)
		{
			tblpk = Convert.ToInt32(Page.Request.QueryString["tblpk"]);
			Load_gv_ScoreProc(tblpk);
		}
	}


	protected void Load_gv_ScoreProc(int tblpk)
	{
		try
		{
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oConnData;
			if (oConnData.State == ConnectionState.Closed) oConnData.Open();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "spDEF__spScore_by_tblpk";

			cmd.Parameters.Add("@tblpk", SqlDbType.Int);
			cmd.Parameters["@tblpk"].Value = tblpk;

			SqlDataReader rdr = cmd.ExecuteReader();

			DataTable dt = new DataTable();
			dt.Load(rdr);

			int i =0;
			foreach (DataRow row in dt.Rows)
			{
				if (i==0) 
				{
				 lblTableName.Text =  Convert.ToString(row["tblname"]);
					lblspName.Text = Convert.ToString(row["spName"]);
					lblLength.Text = Convert.ToString(row["spTextHTML_Length"]); 
				}
				i++;
			}

			gv_ScoreProc.DataSource = dt;
			
			gv_ScoreProc.DataBind();



		}
		catch (SqlException )
		{

		}
	}
}