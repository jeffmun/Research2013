using System;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AutismCenterBase.Utilities;

public partial class Info_WorkOrders : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private ReadConfig oConfig = new ReadConfig();

	protected void Page_Load(object sender, EventArgs e)
	{

		//LinkButton lbInsert = new LinkButton();
		//lbInsert.Click += new EventHandler(lbInsert_Click);

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

		if (!IsPostBack)
		{
			populate_ddlRequester();

		}
	}

	protected void populate_ddlRequester()
	{
		//this functionality is already in DBlookup but I don't use it :( 
		SqlCommand sqlCmd = new SqlCommand();
		sqlCmd.Connection = oConn;
		sqlCmd.CommandType = System.Data.CommandType.Text;
		sqlCmd.CommandText = "select 0 requesterID, '  Select...' requester " + 
				" union select requesterID, requester from Workorders_requester order by requester ";

		DataTable dt = new DataTable();
		SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
		sqlAdapter.Fill(dt);

		ddlRequester.DataTextField = "requester";
		ddlRequester.DataValueField = "requesterID"; 
		ddlRequester.DataSource = dt;
		ddlRequester.DataBind();
	}

	protected void btnInsert_Click (object sender, EventArgs e)
	{
		insert();
	}

	protected void insert()
	{         //Retrieve values from controls
		TextBox t1 = (TextBox)FindControl("txt1");

		////validate the input
		//if (t1.Text == "")
		//{

		//}
		//else
		//{

			//        SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			SqlCommand sqlCmd = new SqlCommand();
			sqlCmd.Connection = oConn;
			sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
			sqlCmd.CommandText = "spWorkOrders_INSERT";

			//define parameters
			sqlCmd.Parameters.Add("TaskDescription", System.Data.SqlDbType.NVarChar, 50);
			sqlCmd.Parameters.Add("TaskType", System.Data.SqlDbType.Int);
			sqlCmd.Parameters.Add("RequesterID", System.Data.SqlDbType.Int);
			sqlCmd.Parameters.Add("RequestDate", System.Data.SqlDbType.DateTime);
			sqlCmd.Parameters.Add("ResponseDate", System.Data.SqlDbType.DateTime);
			sqlCmd.Parameters.Add("DateClosed", System.Data.SqlDbType.DateTime);
			sqlCmd.Parameters.Add("AppxHoursTaken", System.Data.SqlDbType.Float);
			sqlCmd.Parameters.Add("BudgetNumber", System.Data.SqlDbType.NVarChar, 50);
			sqlCmd.Parameters.Add("BudgetName", System.Data.SqlDbType.NVarChar, 50);
			sqlCmd.Parameters.Add("Comments", System.Data.SqlDbType.NVarChar, 1000);

			float hrs = 0.0F;
			float tt = 0.0F;
			//set params

			if (txt9.Text != "")
			{
				hrs = float.Parse(txt9.Text);
			}

			if (txt13.Text != "")
			{
				tt = float.Parse(txt13.Text);
			}


			sqlCmd.Parameters["TaskDescription"].Value = txt1.Text;
			sqlCmd.Parameters["TaskType"].Value = tt;
			sqlCmd.Parameters["RequesterID"].Value = ddlRequester.SelectedValue;
			sqlCmd.Parameters["RequestDate"].Value = txt3.Text;
			sqlCmd.Parameters["ResponseDate"].Value = txt4.Text;
			sqlCmd.Parameters["DateClosed"].Value = txt5.Text;
			sqlCmd.Parameters["AppxHoursTaken"].Value = hrs;
			sqlCmd.Parameters["BudgetNumber"].Value = txt10.Text;
			sqlCmd.Parameters["BudgetName"].Value = txt11.Text;
			sqlCmd.Parameters["Comments"].Value = txt12.Text;

			sqlCmd.ExecuteNonQuery();

			//try
			//{
			//    sqlCmd.ExecuteNonQuery();
			//}
			//catch(SqlException exc)
			//{
			//    //handle the error msg
			//    lblInfo.Text = exc.Message;
			//}

			txt1.Text = "";
			ddlRequester.SelectedValue = "0";

			GridView1.DataBind();

		//}
	}

}
