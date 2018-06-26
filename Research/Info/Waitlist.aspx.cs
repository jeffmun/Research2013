using System;
using System.Configuration;
using System.Drawing;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AutismCenterBase.Utilities;

public partial class Info_Waitlist : System.Web.UI.Page
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
			//populate_ddlRequester();
			//populate_ddlBudget();

		}
	}

	//protected void populate_ddlRequester()
	//{
	//    //this functionality is already in DBlookup but I don't use it :( 
	//    SqlCommand sqlCmd = new SqlCommand();
	//    sqlCmd.Connection = oConn;
	//    sqlCmd.CommandType = System.Data.CommandType.Text;
	//    sqlCmd.CommandText = "select 0 requesterID, '  Select...' requester " + 
	//            " union select requesterID, requester from Workorders_requester order by requester ";

	//    DataTable dt = new DataTable();
	//    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
	//    sqlAdapter.Fill(dt);

	//    ddlRequester.DataTextField = "requester";
	//    ddlRequester.DataValueField = "requesterID"; 
	//    ddlRequester.DataSource = dt;
	//    ddlRequester.DataBind();
	//}

	//protected void populate_ddlBudget()
	//{
	//    SqlCommand sqlCmd2 = new SqlCommand();
	//    sqlCmd2.Connection = oConn;
	//    sqlCmd2.CommandType = System.Data.CommandType.Text;
	//    sqlCmd2.CommandText = "select BudgetNumber, BudgetName from Workorders_budget order by BudgetNumber ";

	//    DataTable dt2 = new DataTable();
	//    SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlCmd2);
	//    sqlAdapter2.Fill(dt2);

	//    ddlBudget.DataTextField = "BudgetName" ;
	//    ddlBudget.DataValueField = "BudgetNumber";
	//    ddlBudget.DataSource = dt2;
	//    ddlBudget.DataBind();
	//}

	protected void btnInsert_Click (object sender, EventArgs e)
	{
		insert();
	}

	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		//e.Row.Attributes.Add("style", "cursor:help;");
		//if (e.Row.RowType == DataControlRowType.DataRow /*&& e.Row.RowState == DataControlRowState.Alternate*/)
		//{
		//    if (e.Row.RowType == DataControlRowType.DataRow)
		//    {
		//        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='orange'");
		//        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#E56E94'");
		//        e.Row.BackColor = Color.FromName("#E56E94");
		//    }
		//}
		//else
		//{
		//    if (e.Row.RowType == DataControlRowType.DataRow)
		//    {
		//        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='orange'");
		//        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='gray'");
		//        e.Row.BackColor = Color.FromName("gray");
		//    }

		//    //e.Row.Cells[0].BackColor = Color.FromName("gray");
		//    //e.Row.Cells[1].BackColor = Color.FromName("gray");
		//    //e.Row.Cells[2].BackColor = Color.FromName("gray");
		//    //e.Row.Cells[3].BackColor = Color.FromName("gray");
		//    //e.Row.Cells[4].BackColor = Color.FromName("gray");
		//    //e.Row.BorderWidth = 2;
		//    //e.Row.BorderColor = Color.FromName("#43C6DB");
		//}
		if (e.Row.Cells[2].Text.Contains("Eval")) 
			{ 
				e.Row.BackColor = Color.FromName("#FFC0FF"); 
				if (e.Row.Cells[3].Text.Contains("Pre"))
				{
					e.Row.BackColor = Color.FromName("#FF40FF"); 
				}
			}
		if (e.Row.Cells[2].Text.Contains("BEC"))
		{
			e.Row.BackColor = Color.FromName("#FFD088");
			if (e.Row.Cells[3].Text.Contains("Pre"))
			{
				e.Row.BackColor = Color.FromName("#FF8000");
			}
		}
		if (e.Row.Cells[2].Text.Contains("Pediatric"))
		{
			e.Row.BackColor = Color.FromName("#C0FFC0");
			if (e.Row.Cells[3].Text.Contains("Pre"))
			{
				e.Row.BackColor = Color.FromName("#00FF00");
			}
		}
		if (e.Row.Cells[2].Text.Contains("SP"))
		{
			e.Row.BackColor = Color.FromName("#FFC0C0");
			if (e.Row.Cells[3].Text.Contains("Pre"))
			{
				e.Row.BackColor = Color.FromName("#FF8080");
			}
		}
		if (e.Row.Cells[2].Text.Contains("Sleep"))
		{
			e.Row.BackColor = Color.FromName("#C0C0FF");
			if (e.Row.Cells[3].Text.Contains("Pre"))
			{
				e.Row.BackColor = Color.FromName("#4040FF");
			}
		}
		if (e.Row.Cells[2].Text.Contains("Therapy"))
		{
			e.Row.BackColor = Color.FromName("#D0FFFF");
			if (e.Row.Cells[3].Text.Contains("Pre"))
			{
				e.Row.BackColor = Color.FromName("#00FFFF");
			}
		}
		if (e.Row.Cells[2].Text.Contains("Social"))
		{
			e.Row.BackColor = Color.FromName("#D0B080");
			if (e.Row.Cells[3].Text.Contains("Pre"))
			{
				e.Row.BackColor = Color.FromName("#b09060");
			}
		}
	}

	protected void insert()
	{         //Retrieve values from controls
		//TextBox t1 = (TextBox)FindControl("txt1");

		//////validate the input
		////if (t1.Text == "")
		////{

		////}
		////else
		////{

		//    //        SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
		//    SqlCommand sqlCmd = new SqlCommand();
		//    sqlCmd.Connection = oConn;
		//    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
		//    sqlCmd.CommandText = "spWorkOrders_INSERT";

		//    //define parameters
		//    sqlCmd.Parameters.Add("TaskDescription", System.Data.SqlDbType.NVarChar, 50);
		//    sqlCmd.Parameters.Add("TaskType", System.Data.SqlDbType.Int);
		//    sqlCmd.Parameters.Add("RequesterID", System.Data.SqlDbType.Int);
		//    sqlCmd.Parameters.Add("RequestDate", System.Data.SqlDbType.DateTime);
		//    sqlCmd.Parameters.Add("ResponseDate", System.Data.SqlDbType.DateTime);
		//    sqlCmd.Parameters.Add("DateClosed", System.Data.SqlDbType.DateTime);
		//    sqlCmd.Parameters.Add("AppxHoursTaken", System.Data.SqlDbType.Float);
		//    sqlCmd.Parameters.Add("BudgetNumber", System.Data.SqlDbType.NVarChar, 50);
		//    //sqlCmd.Parameters.Add("BudgetName", System.Data.SqlDbType.NVarChar, 50);
		//    sqlCmd.Parameters.Add("Comments", System.Data.SqlDbType.NVarChar, 1000);

		//    float hrs = 0.0F;
		//    float tt = 0.0F;
		//    //set params

		//    if (txt9.Text != "")
		//    {
		//        hrs = float.Parse(txt9.Text);
		//    }

		//    if (txt13.Text != "")
		//    {
		//        tt = float.Parse(txt13.Text);
		//    }


		//    sqlCmd.Parameters["TaskDescription"].Value = txt1.Text;
		//    sqlCmd.Parameters["TaskType"].Value = tt;
		//    sqlCmd.Parameters["RequesterID"].Value = ddlRequester.SelectedValue;
		//    sqlCmd.Parameters["RequestDate"].Value = txt3.Text;
		//    sqlCmd.Parameters["ResponseDate"].Value = txt4.Text;
		//    sqlCmd.Parameters["DateClosed"].Value = txt5.Text;
		//    sqlCmd.Parameters["AppxHoursTaken"].Value = hrs;
		//    //sqlCmd.Parameters["BudgetNumber"].Value = txt10.Text;
		//    sqlCmd.Parameters["BudgetNumber"].Value = ddlBudget.SelectedValue;
		//    //sqlCmd.Parameters["BudgetName"].Value = txt11.Text;
		//    sqlCmd.Parameters["Comments"].Value = txt12.Text;

		//    sqlCmd.ExecuteNonQuery();

		//    //try
		//    //{
		//    //    sqlCmd.ExecuteNonQuery();
		//    //}
		//    //catch(SqlException exc)
		//    //{
		//    //    //handle the error msg
		//    //    lblInfo.Text = exc.Message;
		//    //}

		//    txt1.Text = "";
		//    ddlRequester.SelectedValue = "0";
		//    ddlBudget.SelectedValue = "-";
		//    GridView1.DataBind();

		////}
	}

}
