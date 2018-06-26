using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Text;
using AutismCenterBase.Utilities;
using System.IO;


public partial class Info_StaffAccess: System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();


	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();


		if (oLogin.CheckGroupPermissions("Permissions group".Split(',')))
		{           //enable editing here 
			btnUpdateAD.Visible = true;
			btnNewStaff.Visible = true;
		}
		else
		{
			btnUpdateAD.Visible = false;
			btnNewStaff.Visible = false;
		}

		//BindTheData();
	}


	protected void BindTheData()
	{
		//Response.Write("<script>alert('Binding...')</script>");

	   // Gridview1.DataSource = SqlDataSource1;
		//Gridview1.DataBind();


		lblStaffName.Text = DropDownList1.SelectedItem.Text;
		Gridview2.DataSource = SqlDataSource2;
		Gridview2.DataBind();

		Gridview3.DataSource = SqlDataSource3;
		Gridview3.DataBind();
	
		Gridview4.DataSource = SqlDataSource4;
		Gridview4.DataBind();
	}



	protected void UpdateADinfo()
	{
		string sql_string = "exec  spUWAC_AD__populate_tables" ;
		   
		  SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
		  sqlCmd.ExecuteNonQuery();

	}



	protected void InsertNewStaff(Object sender, System.EventArgs e)
	{
		
		//DropDownList ddl = (DropDownList)this.Page.FindControl( "DropDownList1");

		string sql_string = "exec  spUWAC_AD__add_to_tblStaff  " + DropDownList1.SelectedItem.Value;  // ddl.SelectedItem.Value;
   
		SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
		sqlCmd.ExecuteNonQuery();

	}




	protected void btnBindTheData(Object sender, System.EventArgs e)
	{
		BindTheData();
	}


	protected void btnUpdateADinfo(Object sender, System.EventArgs e)
	{
		UpdateADinfo();
	}



	protected void OnDataBound(Object sender, System.EventArgs e)
	{
		//if (Gridview1.Rows.Count > 0)
		//{
		//    Response.Write("<script>alert('Gridview1.Rows.Count > 0')</script>");
		//}
		//else
		//{
		//    Response.Write("<script>alert('else')</script>");
		//}
	}


	protected void OnRowDataBound(Object sender, System.EventArgs e)
	{
	   //Response.Write("<script>alert('onRowDatabound')</script>");
		
	}



}