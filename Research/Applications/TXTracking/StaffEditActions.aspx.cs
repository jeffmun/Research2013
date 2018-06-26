using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace EditableWeeklyCalendar
{
	/// <summary>
	/// Summary description for StaffEditActions.
	/// </summary>
	public partial class StaffEditActions : System.Web.UI.Page
	{
		protected Label lblTitle;

		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!this.IsPostBack)
			{
				//Setup completed by drop down
				SetupDDL();

				//refresh repeater
				Refresh();

				//default date done to today
				txtDateDone.Text = string.Format("{0:d}",DateTime.Today);
			}		
		}

		protected void chkShowCompleted_CheckedChanged(object sender, EventArgs e)
		{
			Refresh();
		}

		protected void ddlShowActionsFor_SelectedIndexChanged(object sender, EventArgs e)
		{
			Refresh();
		}

		
		
		protected void btnSetComplete_Click(object sender, EventArgs e)
		{
			//user must select a date and completed by
			string err = string.Empty;
			if (txtDateDone.Text.Trim() == string.Empty)
				err = "Enter a date done.";
			else if (!DateValid(txtDateDone.Text))
				err = "Date done not valid.";
			else if (ddlCompletedBy.SelectedValue == "-1")
				err = "Select completed by staff.";

			if (err != string.Empty)
			{
				lblError.Visible = true;
				lblError.Text = err;
			}
			else
			{
				//loop over selected and set to complete
				SqlConnection conn = new SqlConnection();
				
				try
				{
					conn.ConnectionString = ConfigurationManager.AppSettings["sqlBackendConnection.ConnectionString"];
					SqlCommand cmd = new SqlCommand();
					cmd.Connection = conn;
					cmd.CommandType = CommandType.Text;

					string sql = "update tblaction ";
					sql += "set actionstatusid=1, completedby=@completedby, datedone=@datedone where actionid=@actionid";
					
					cmd.CommandText = sql;

					cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@actionid", System.Data.SqlDbType.Int, 4));
					cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@completedby", System.Data.SqlDbType.Int, 4));
					cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datedone", SqlDbType.DateTime, 8));

					cmd.Parameters["@completedby"].Value = int.Parse(ddlCompletedBy.SelectedValue);
					cmd.Parameters["@datedone"].Value = DateTime.Parse(txtDateDone.Text);
					
					conn.Open();

					foreach(int actionid in actionIDs)
					{
						cmd.Parameters["@actionid"].Value = actionid;
						cmd.ExecuteNonQuery();
					}

					//refresh repeater
					Refresh();

				}
				catch (Exception ex)
				{
					Response.Write(ex.Message);
				}
				finally
				{
					if (conn != null) conn.Close();
				}
			}
		}

		//All of the CheckedChanged events fire before button click.
		private ArrayList actionIDs = new ArrayList();
		protected void chkEdit_CheckedChanged(object sender, EventArgs e)
		{
			//add checked actionid's to array list
			Control wc = (Control)((CheckBox)sender).NamingContainer;
			HtmlInputHidden t = (HtmlInputHidden)(wc.FindControl("txtActionID"));
			actionIDs.Add(int.Parse(t.Value));
		}

		bool DateValid(string s)
		{
			bool result = true;
			try
			{
				DateTime dt = DateTime.Parse(s);
			}
			catch
			{
				result = false;
			}
			return result;
		}

		void SetupDDL()
		{
			SqlConnection conn = new SqlConnection();
			try
			{
				conn.ConnectionString = ConfigurationManager.AppSettings["sqlBackendConnection.ConnectionString"];
				SqlCommand cmd = new SqlCommand();
				cmd.Connection = conn;
				cmd.CommandType = CommandType.Text;

				string sql = "select dbo.fnGetStaffIDByCurrentUser() ";
				cmd.CommandText = sql;
				
				conn.Open();
				Object result = cmd.ExecuteScalar();
				int staffid = -1;
				if (result != null) staffid = (int)result;
				
				sql = "select staffid, staffshortname ";
				sql += "from tblstaff ";
				sql += "union select -1, '--select staff--' ";
				sql += "order by staffshortname";

				cmd.CommandText = sql;
				SqlDataReader dr = cmd.ExecuteReader();

				ddlCompletedBy.DataTextField = "staffshortname";
				ddlCompletedBy.DataValueField = "staffid";
				ddlCompletedBy.DataSource = dr;
				ddlCompletedBy.DataBind();
				dr.Close();

				//default to current user
				ddlCompletedBy.SelectedValue = staffid.ToString();

				//hack: get staff shortname for title
				//lblTitle.Text = "Actions assigned to " + ddlCompletedBy.SelectedItem.Text;

				dr = cmd.ExecuteReader();
				ddlShowActionsFor.DataTextField = "staffshortname";
				ddlShowActionsFor.DataValueField = "staffid";
				ddlShowActionsFor.DataSource = dr;
				ddlShowActionsFor.DataBind();

				//default to current user
				ddlShowActionsFor.SelectedValue = staffid.ToString();
				dr.Close();

			}
			catch (Exception ex)
			{
				Response.Write(ex.Message);
			}
			finally
			{
				if (conn != null) conn.Close();
			}
		}
		
		void Refresh()
		{
			SqlConnection conn = new SqlConnection();
	
			try 
			{
				conn.ConnectionString = ConfigurationManager.AppSettings["sqlBackendConnection.ConnectionString"];
				SqlCommand cmd = new SqlCommand();
				cmd.Connection = conn;
				cmd.CommandText = "spGetWeeklyCalendar_Assigned";
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@showcompleted", System.Data.SqlDbType.Int, 4));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@staffid", System.Data.SqlDbType.Int, 4));
	
				cmd.Parameters["@studyid"].Value = 1012;
				cmd.Parameters["@showcompleted"].Value = (chkShowCompleted.Checked)?1:0;
				cmd.Parameters["@staffid"].Value = int.Parse(ddlShowActionsFor.SelectedValue);
				
				conn.Open();
				rpAssigned.DataSource = cmd.ExecuteReader();
				rpAssigned.DataBind();
			}
			catch (Exception ex)
			{
				Response.Write(ex.Message);
			}
			finally
			{
				if (conn != null) conn.Close();
			}
		}


		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion
	}
}
