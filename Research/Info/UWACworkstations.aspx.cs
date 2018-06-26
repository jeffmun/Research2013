using System;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;

public partial class Info_UWACworkstations : System.Web.UI.Page
{

	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private ReadConfig oConfig = new ReadConfig();

	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

	}

	

	protected void ddlComp_SelectedIndexChanged (object sender, EventArgs e)
	{
		try
		{
			DropDownList ddl = (DropDownList)sender;
			GridViewRow gvrow = (GridViewRow)ddl.NamingContainer;

			Label lblwsID = (Label)gvrow.FindControl("lblwsID");
			HiddenField hidComp = (HiddenField)gvrow.FindControl("hidComp");

			//set up a SQLCommand to execute the change
			string sql_string;

			if (ddl.SelectedValue == "0")
			{
				sql_string = "update tblComputer set workstationID = null where computer_name = '" + hidComp.Value +"'";
			}
			else
			{
				sql_string = "update tblComputer set workstationID = " + lblwsID.Text + " where computer_pk = " + ddl.SelectedValue.ToString();
			}

			//write the SQL command string back to the page
			lblInfo.Text = sql_string;
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();

			// Change the row state
			gvrow.RowState = DataControlRowState.Selected;

		}
		catch(Exception exc)
		{ lblInfo.Text = exc.Message; }


		//rebind the data to the gv  

	}


	protected void ddlStaff_SelectedIndexChanged(object sender, EventArgs e)
	{


		try
		{
			DropDownList ddl = (DropDownList)sender;
			GridViewRow gvrow = (GridViewRow)ddl.NamingContainer;

			Label lblwsID = (Label)gvrow.FindControl("lblwsID");

			
			//set up a SQLCommand to execute the change
			string sql_string;

			if (Convert.ToInt16(ddl.SelectedValue) == 0)
			{
				sql_string = "update tblUWAC_workstation set primary_staffID = NULL  where workstationID = " + lblwsID.Text;
			}
			else
			{
				sql_string = "update tblUWAC_workstation set primary_staffID = " + ddl.SelectedValue.ToString() + " where workstationID = " + lblwsID.Text;
			}

		  

			//write the SQL command string back to the page
			lblInfo.Text = sql_string;
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();

			// Change the row state
			gvrow.RowState = DataControlRowState.Selected;



		}
		catch (SqlException exc)
		{
			lblInfo.Text = exc.Message;
			
		}


		//rebind the data to the gv  

	}





}