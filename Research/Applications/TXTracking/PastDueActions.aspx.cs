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
	/// Summary description for PastDueActions.
	/// </summary>
	public partial class PastDueActions : System.Web.UI.Page
	{

		protected void Page_Load(object sender, System.EventArgs e)
		{
			rpPastDue.ItemDataBound += new RepeaterItemEventHandler(rpPastDue_ItemDataBound);

			if (!IsPostBack)
			{
				Setup();
			}
		}


		void Setup()
		{
			//setup drop downs
			SetupDDL();

			Refresh();
		}

		void Refresh()
		{
			SqlConnection conn = new SqlConnection();
	
			try 
			{
				conn.ConnectionString = ConfigurationManager.AppSettings["sqlBackendConnection.ConnectionString"];
				SqlCommand cmd = new SqlCommand();
				cmd.Connection = conn;
				cmd.CommandText = "spGetWeeklyCalendar_PastDue";
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sortweekby", System.Data.SqlDbType.VarChar, 15));
	
				cmd.Parameters["@studyid"].Value = 1012;
				cmd.Parameters["@sortweekby"].Value = "subject";
	
				conn.Open();
				rpPastDue.DataSource = cmd.ExecuteReader();
				rpPastDue.DataBind();
	
			}
			catch(Exception ex)
			{
				Response.Write(ex.Message);
			}
			finally
			{
				if (conn != null) conn.Close();
			}
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

				dr = cmd.ExecuteReader();
				ddlRespFor.DataTextField = "staffshortname";
				ddlRespFor.DataValueField = "staffid";
				ddlRespFor.DataSource = dr;
				ddlRespFor.DataBind();
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


		protected void btnAssign_Click(object sender, EventArgs e)
		{
			string err = string.Empty;
			if (ddlRespFor.SelectedValue == "-1")
				err = "Select Responsible For Staff Member.";

			if (err != string.Empty)
			{
				lblError.Text = err;
				lblError.Visible = true;
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
					sql += "set respforid=@respforid where actionid=@actionid";
					
					cmd.CommandText = sql;

					cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@actionid", System.Data.SqlDbType.Int, 4));
					cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@respforid", System.Data.SqlDbType.Int, 4));

					cmd.Parameters["@respforid"].Value = int.Parse(ddlRespFor.SelectedValue);
					
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


		private string prevWeekOfPastDue = string.Empty;
		private void rpPastDue_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				System.Data.Common.DbDataRecord dr = (System.Data.Common.DbDataRecord)e.Item.DataItem;
	
				string curWeekOf = dr["weekof"].ToString();
				if ( curWeekOf != prevWeekOfPastDue)
				{
					prevWeekOfPastDue =  curWeekOf;
					((PlaceHolder)e.Item.FindControl("phNewWeekOfPastDue")).Visible = true;
				}
				else
					((PlaceHolder)e.Item.FindControl("phNewWeekOfPastDue")).Visible = false;
					
			}
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


		//All of the CheckedChanged events fire before button click.
		private ArrayList actionIDs = new ArrayList();
		protected void chkEdit_CheckedChanged(object sender, EventArgs e)
		{
			//add checked actionid's to array list
			Control wc = (Control)((CheckBox)sender).NamingContainer;
			HtmlInputHidden t = (HtmlInputHidden)(wc.FindControl("txtActionID"));
			actionIDs.Add(int.Parse(t.Value));
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
