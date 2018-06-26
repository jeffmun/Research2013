using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

using AutismCenterBase.Utilities;

namespace Help.ServiceRequest
{
	public partial class RequestList : System.Web.UI.Page
	{
		const int REQUESTID_COLUMN_IDX = 1;
		const int STATUS_COLUMN_IDX = 9;
		const int STATUS_EDIT_COLUMN_IDX = 10;
		const int ASSIGNEDTO_COLUMN_IDX = 11;
		const int ASSIGNEDTO_EDIT_COLUMN_IDX = 12;
		const int ITPRIORITY_COLUMN_IDX = 2;
		const int ITPRIORITY_EDIT_COLUMN_IDX = 3;

		protected SqlCommand sqlFeatureType;
		protected SqlCommand sqlStatus;
		protected SqlCommand sqlAssignedTo;
		protected SqlCommand sqlITPriority;
		protected SqlCommand sqlPriority;

		private DataSet ds = new DataSet();

		private void Page_Load(object sender, System.EventArgs e)
		{
			if (!IsPostBack)
			{
				FillGrid();
			}
		}


		protected void List_SelectedIndexChanged(object sender, EventArgs e)
		{
			
			DropDownList list = (DropDownList)sender;
			TableCell cell = list.Parent as TableCell;
			DataGridItem item = cell.Parent as DataGridItem;

			if (list.ID == "ddlPriority")
			{
				sqlPriority.Parameters["@priorityid"].Value = list.SelectedValue;
				sqlPriority.Parameters["@requestid"].Value = item.Cells[REQUESTID_COLUMN_IDX].Text;
				sqlPriority.ExecuteNonQuery();
			}
 
			else if (list.ID == "ddlFeatureType")
			{
				sqlFeatureType.Parameters["@featuretypeid"].Value = list.SelectedValue;
				sqlFeatureType.Parameters["@requestid"].Value = item.Cells[REQUESTID_COLUMN_IDX].Text;
				sqlFeatureType.ExecuteNonQuery();
			}

			else if (list.ID == "ddlStatus")
			{
				sqlStatus.Parameters["@statusid"].Value = list.SelectedValue;
				sqlStatus.Parameters["@requestid"].Value = item.Cells[REQUESTID_COLUMN_IDX].Text;
				sqlStatus.ExecuteNonQuery();
			}
			else if (list.ID == "ddlAssignedTo")
			{
				sqlAssignedTo.Parameters["@assignedtostaffid"].Value = list.SelectedValue;
				sqlAssignedTo.Parameters["@requestid"].Value = item.Cells[REQUESTID_COLUMN_IDX].Text;
				sqlAssignedTo.ExecuteNonQuery();
			}
			else if (list.ID == "ddlITPriority")
			{
				if (list.SelectedValue == "-1")
					sqlITPriority.Parameters["@itpriority"].Value = DBNull.Value;
				else
					sqlITPriority.Parameters["@itpriority"].Value = list.SelectedValue;


				sqlITPriority.Parameters["@requestid"].Value = item.Cells[REQUESTID_COLUMN_IDX].Text;
				sqlITPriority.ExecuteNonQuery();
			}

			FillGrid();
		}


		private void SetupDatasource()
		{
			SqlDataAdapter da = new SqlDataAdapter();
			string sql = "select staffid, staffshortname from tblstaff order by staffshortname; " +
				"select staffid, staffshortname from tblstaff where staffid in (56,8,23,78, 90) " + 
				"union select -1, '<none>' as staffshortname order by staffshortname;" +
				"select * from REQ_Priority; " +
				 "select * from REQ_FeatureType; " + 
				"select * from REQ_Status; ";

			da.SelectCommand = new SqlCommand(sql,Master.SqlConn);
			da.Fill(ds);
		}

		protected DataTable GetListDataSource(string id)
		{

			DataTable dt = null;
			if (id == "ddlAssignedTo")
				dt = ds.Tables[1];
			else if (id == "ddlPriority")
				dt = ds.Tables[2];
			else if (id == "ddlFeatureType")
				dt = ds.Tables[3];
			else if (id == "ddlStatus")
				dt = ds.Tables[4];
				
			return dt;
		}


		private void FillGrid()
		{
			// set up datasource for list boxes
			SetupDatasource();

//			sqlConnection1.Open();
			SqlCommand sqlc = new SqlCommand("spGetRequests", Master.SqlConn);
			SqlDataReader r = sqlc.ExecuteReader();
			dgRequests.DataSource = r;
			dgRequests.DataBind();

			// hide rank adjustment links from non-it viewers
			if (Page.User.IsInRole(@"AUTISM\IT Staff Group") == true)
			{
				dgRequests.Columns[ITPRIORITY_COLUMN_IDX].Visible = false;
				dgRequests.Columns[ITPRIORITY_EDIT_COLUMN_IDX].Visible = true;

				dgRequests.Columns[ASSIGNEDTO_COLUMN_IDX].Visible = false;
				dgRequests.Columns[ASSIGNEDTO_EDIT_COLUMN_IDX].Visible = true;
				
				dgRequests.Columns[STATUS_COLUMN_IDX].Visible = false;
				dgRequests.Columns[STATUS_EDIT_COLUMN_IDX].Visible = true;
			}
			else 
			{
				dgRequests.Columns[ITPRIORITY_COLUMN_IDX].Visible = true;
				dgRequests.Columns[ITPRIORITY_EDIT_COLUMN_IDX].Visible = false;
				
				dgRequests.Columns[ASSIGNEDTO_COLUMN_IDX].Visible = true;
				dgRequests.Columns[ASSIGNEDTO_EDIT_COLUMN_IDX].Visible = false;
				
				dgRequests.Columns[STATUS_COLUMN_IDX].Visible = true;
				dgRequests.Columns[STATUS_EDIT_COLUMN_IDX].Visible = false;
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
			sqlITPriority = new System.Data.SqlClient.SqlCommand();
			sqlFeatureType = new System.Data.SqlClient.SqlCommand();
			sqlStatus = new System.Data.SqlClient.SqlCommand();
			sqlAssignedTo = new System.Data.SqlClient.SqlCommand();
			sqlPriority = new System.Data.SqlClient.SqlCommand();
			btnAddNew.Click += new System.EventHandler(btnAddNew_Click);
			// 
			// sqlITPriority
			// 
			sqlITPriority.CommandText = "UPDATE REQ_Request SET ITPriority = @itpriority WHERE (requestID = @requestid)";
			sqlITPriority.Connection = Master.SqlConn;
			sqlITPriority.Parameters.Add(new System.Data.SqlClient.SqlParameter("@itpriority", System.Data.SqlDbType.Int, 4, "ITPriority"));
			sqlITPriority.Parameters.Add(new System.Data.SqlClient.SqlParameter("@requestid", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "requestID", System.Data.DataRowVersion.Original, null));
			// 
			// sqlFeatureType
			// 
			sqlFeatureType.CommandText = "UPDATE REQ_Request SET featureTypeID = @featuretypeid WHERE (requestID = @request" +
				"id)";
			sqlFeatureType.Connection = Master.SqlConn;
			sqlFeatureType.Parameters.Add(new System.Data.SqlClient.SqlParameter("@featuretypeid", System.Data.SqlDbType.Int, 4, "featureTypeID"));
			sqlFeatureType.Parameters.Add(new System.Data.SqlClient.SqlParameter("@requestid", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "requestID", System.Data.DataRowVersion.Original, null));
			// 
			// sqlStatus
			// 
			sqlStatus.CommandText = "UPDATE REQ_Request SET statusID = @statusid WHERE (requestID = @requestid)";
			sqlStatus.Connection = Master.SqlConn;
			sqlStatus.Parameters.Add(new System.Data.SqlClient.SqlParameter("@statusid", System.Data.SqlDbType.Int, 4, "statusID"));
			sqlStatus.Parameters.Add(new System.Data.SqlClient.SqlParameter("@requestid", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "requestID", System.Data.DataRowVersion.Original, null));
			// 
			// sqlAssignedTo
			// 
			sqlAssignedTo.CommandText = "UPDATE REQ_Request SET AssignedToStaffID = @assignedtostaffid WHERE (requestID = " +
				"@requestid)";
			sqlAssignedTo.Connection = Master.SqlConn;
			sqlAssignedTo.Parameters.Add(new System.Data.SqlClient.SqlParameter("@assignedtostaffid", System.Data.SqlDbType.Int, 4, "AssignedToStaffID"));
			sqlAssignedTo.Parameters.Add(new System.Data.SqlClient.SqlParameter("@requestid", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "requestID", System.Data.DataRowVersion.Original, null));
			// 
			// sqlPriority
			// 
			sqlPriority.CommandText = "UPDATE REQ_Request SET priorityID = @priorityid WHERE (requestID = @requestid)";
			sqlPriority.Connection = Master.SqlConn;
			sqlPriority.Parameters.Add(new System.Data.SqlClient.SqlParameter("@priorityid", System.Data.SqlDbType.Int, 4, "priorityID"));
			sqlPriority.Parameters.Add(new System.Data.SqlClient.SqlParameter("@requestid", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "requestID", System.Data.DataRowVersion.Original, null));
			btnNewRequestTop.Click += new System.EventHandler(btnNewRequestTop_Click);
			Load += new System.EventHandler(Page_Load);

		}
		#endregion



		private void btnAddNew_Click(object sender, System.EventArgs e)
		{
			Response.Redirect(Request.ApplicationPath + "/Help/ServiceRequest/Request.aspx",true);
		}

		private void btnNewRequestTop_Click(object sender, System.EventArgs e)
		{
			Response.Redirect(Request.ApplicationPath + "/Help/ServiceRequest/Request.aspx", true);		
		}
	}
}
