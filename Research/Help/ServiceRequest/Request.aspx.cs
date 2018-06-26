using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;

namespace Help.ServiceRequest
{
	public enum Mode { EDIT, EDIT_ADMIN, NEW };

	public partial class Request : System.Web.UI.Page
	{
		private SqlDataAdapter sqlDataAdapter1;
		private SqlCommand sqlDeleteCommand1 = new SqlCommand();
		private SqlCommand sqlInsertCommand1 = new SqlCommand();
		private SqlCommand sqlSelectCommand1 = new SqlCommand();
		private SqlCommand sqlUpdateCommand1 = new SqlCommand();

		private ArrayList _errors = new ArrayList();

		protected void Page_Init(object sender, EventArgs e)
		{
			InitializeComponent();
		}

		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!IsPostBack)
			{
				SetupListBoxes();

				// set form mode.  

				// if ID passed in query string then mode is EDIT, unless user is
				// in IT group the mode is EDIT_ADMIN.
				//
				// If no ID or ID not valid then mode is NEW.
				int requestID = -1;
				try 
				{
					requestID = int.Parse(Request.QueryString["ID"]);
				}
				catch 
				{
				}
			
				if (requestID != -1)
				{
					if (!Master.AutismLogin.CheckGroupPermissions("IT Staff Group".Split(',')))
						FormMode = Mode.EDIT;
					else
						FormMode = Mode.EDIT_ADMIN;

					// lookup and display request
					try
					{
						LookupAndShow(requestID);
					}
					catch (Exception ex)
					{
						FormMode = Mode.NEW;
						_errors.Add(ex.Message);
						ShowErrors();
					}

				}
				else
					FormMode = Mode.NEW;
			}
		}

		private void LookupAndShow(int requestID)
		{
			SqlCommand sqlc = sqlDataAdapter1.SelectCommand;
			sqlc.Parameters["@requestID"].Value = requestID;
			SqlDataReader r = sqlc.ExecuteReader();
			r.Read();
			FillForm(r);
			r.Close();
		}

		private void SetupListBoxes()
		{
			// fill ddlRequestFrom drop down
			ddlRequestFrom.DataTextField = "staffshortname";
			ddlRequestFrom.DataValueField = "staffID";
			SqlCommand sc = new SqlCommand("select staffid, staffshortname from tblstaff order by staffshortname", Master.SqlConn);
			SqlDataReader r = sc.ExecuteReader();
			ddlRequestFrom.DataSource = r;
			ddlRequestFrom.DataBind();
			r.Close();

			// add option for blank and select it
			ddlRequestFrom.Items.Insert(0, new ListItem("--Select Staff--","-1"));
			ddlRequestFrom.SelectedValue = "-1";

			// priority
			ddlPriority.DataTextField = "priority";
			ddlPriority.DataValueField = "priorityID";
			sc.CommandText = "select * from REQ_Priority";
			r = sc.ExecuteReader();
			ddlPriority.DataSource = r;
			ddlPriority.DataBind();
			r.Close();

			// feature type
			ddlFeatureType.DataTextField = "featureType";
			ddlFeatureType.DataValueField = "featureTypeID";
			sc.CommandText = "select * from REQ_FeatureType";
			r = sc.ExecuteReader();
			ddlFeatureType.DataSource = r;
			ddlFeatureType.DataBind();
			r.Close();

			// status
			ddlStatus.DataTextField = "status";
			ddlStatus.DataValueField = "statusID";
			sc.CommandText = "select * from REQ_Status";
			r = sc.ExecuteReader();
			ddlStatus.DataSource = r;
			ddlStatus.DataBind();
			r.Close();

			//study
			ddlStudy.DataTextField = "studyname";
			ddlStudy.DataValueField = "studyid";
			sc.CommandText = "EXEC spGetActiveStudies";
			r = sc.ExecuteReader();
			ddlStudy.DataSource = r;
			ddlStudy.DataBind();
			r.Close();

			// add option for blank and select it
			ddlStudy.Items.Insert(0, new ListItem("--Select Study--", "-1"));
			ddlStudy.SelectedValue = "-1";

			// assigned to from
			ddlAssignedTo.DataTextField = "staffshortname";
			ddlAssignedTo.DataValueField = "staffID";
			sc.CommandText= "select staffid, staffshortname from tblstaff where staffid in (56,8,23,78) order by staffshortname";
			r = sc.ExecuteReader();
			ddlAssignedTo.DataSource = r;
			ddlAssignedTo.DataBind();
			r.Close();
			// add option for blank and select it
			ddlAssignedTo.Items.Insert(0, new ListItem("--Select Staff--", "-1"));
			ddlAssignedTo.SelectedValue = "-1";
		}

		private Mode _formMode;

		private Mode FormMode
		{
			get {return _formMode;}
			set 
			{
				_formMode = value;

				// setup ui
				SetupMode(value);
			}
		}

		private void SetupMode(Mode fm)
		{
			lblErrors.Visible = false;

			//set visibility/editability of form items based on mode
			if (fm == Mode.EDIT)
			{	//show everything but disable admin controls
				lblRequestID.Visible = true;
				txtRequestID.Visible = true;
				txtRequestID.Enabled = false;
				lblSubmitDate.Visible = true;
				txtSubmitDate.Visible = true;
				txtSubmitDate.Enabled = false;
				lblAssignedTo.Visible = true;
				ddlAssignedTo.Visible = true;
				ddlAssignedTo.Enabled = false;
				lblStatus.Visible = true;
				ddlStatus.Visible = true;
				ddlStatus.Enabled = false;
				lblComments.Visible = true;
				txtComments.Visible = true;
				txtComments.Enabled = false;
				lblEditITPriority.Visible=true;
				ddlEditITPriority.Visible = true;
				ddlEditITPriority.Enabled = false;
				lblEstHours.Visible = false;
				txtEstHours.Visible = false;

				btnSubmit.CommandName = "EDIT";

			}
			else if (fm == Mode.EDIT_ADMIN)
			{
				lblRequestID.Visible = true;
				txtRequestID.Visible = true;
				txtRequestID.Enabled = false;
				lblSubmitDate.Visible = true;
				txtSubmitDate.Visible = true;
				txtSubmitDate.Enabled = false;
				lblAssignedTo.Visible = true;
				ddlAssignedTo.Visible = true;
				ddlAssignedTo.Enabled = true;
				lblStatus.Visible = true;
				ddlStatus.Visible = true;
				ddlStatus.Enabled = true;
				lblComments.Visible = true;
				txtComments.Visible = true;
				txtComments.Enabled = true;
				lblEditITPriority.Visible=true;
				ddlEditITPriority.Visible = true;
				ddlEditITPriority.Enabled = true;
				lblEstHours.Visible = true;
				txtEstHours.Visible = true;

				btnSubmit.CommandName = "EDIT_ADMIN";
			}
			else if (fm == Mode.NEW)
			{
				lblRequestID.Visible = false;
				txtRequestID.Visible = false;
				lblSubmitDate.Visible = false;
				txtSubmitDate.Visible = false;
				lblAssignedTo.Visible = false;
				ddlAssignedTo.Visible = false;
				lblStatus.Visible = false;
				ddlStatus.Visible = false;
				lblComments.Visible = false;
				txtComments.Visible = false;
				lblEditITPriority.Visible=false;
				ddlEditITPriority.Visible = false;
				lblEstHours.Visible = false;
				txtEstHours.Visible = false;
			
				btnSubmit.CommandName = "NEW";
			}

		}
		
		#region Web Form Designer generated code
		private void InitializeComponent()
		{    
			sqlDataAdapter1 = new SqlDataAdapter();
			sqlDeleteCommand1 = new SqlCommand();
			sqlInsertCommand1 = new SqlCommand();
			sqlSelectCommand1 = new SqlCommand();
			sqlUpdateCommand1 = new SqlCommand();

			// sqlDataAdapter1
			// 
			sqlDataAdapter1.DeleteCommand = sqlDeleteCommand1;
			sqlDataAdapter1.InsertCommand = sqlInsertCommand1;
			sqlDataAdapter1.SelectCommand = sqlSelectCommand1;
			sqlDataAdapter1.UpdateCommand = sqlUpdateCommand1;

			sqlDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[]
			{
				new System.Data.Common.DataTableMapping("Table", "REQ_Request", new System.Data.Common.DataColumnMapping[] {
				new System.Data.Common.DataColumnMapping("requestID", "requestID"),
				new System.Data.Common.DataColumnMapping("requestStaffID", "requestStaffID"),
				new System.Data.Common.DataColumnMapping("priorityID", "priorityID"),
				new System.Data.Common.DataColumnMapping("featureTypeID", "featureTypeID"),
				new System.Data.Common.DataColumnMapping("description", "description"),
				new System.Data.Common.DataColumnMapping("submitDate", "submitDate"),
				new System.Data.Common.DataColumnMapping("replyDate", "replyDate"),
				new System.Data.Common.DataColumnMapping("replyStaffID", "replyStaffID"),
				new System.Data.Common.DataColumnMapping("statusID", "statusID"),
				new System.Data.Common.DataColumnMapping("dueDate", "dueDate"),
				new System.Data.Common.DataColumnMapping("comment", "comment")})
			}
			);
			// 
			// sqlDeleteCommand1
			// 
			sqlDeleteCommand1.CommandText = "DELETE FROM REQ_Request WHERE (requestID = @Original_requestID)";
			sqlDeleteCommand1.Connection = Master.SqlConn;
			sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_requestID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "requestID", System.Data.DataRowVersion.Original, null));
			// 
			// sqlInsertCommand1
			// 
			sqlInsertCommand1.CommandText = @"INSERT INTO REQ_Request (requestStaffID, studyid, priorityID, featureTypeID, description, submitDate, statusID) VALUES (@requestStaffID, @studyid, @priorityID, @featureTypeID, @description, getdate(), 5); SELECT * FROM REQ_Request WHERE (requestID = @@IDENTITY)";
			sqlInsertCommand1.Connection = Master.SqlConn;
			sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@requestStaffID", System.Data.SqlDbType.Int, 4, "requestStaffID"));
			sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4, "studyID"));
			sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@priorityID", System.Data.SqlDbType.Int, 4, "priorityID"));
			sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@featureTypeID", System.Data.SqlDbType.Int, 4, "featureTypeID"));
			sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@description", System.Data.SqlDbType.VarChar, 3500, "description"));
			// 
			// sqlSelectCommand1
			// 
			sqlSelectCommand1.CommandText = "SELECT * FROM REQ_Request WHERE (requestID = @requestID)";
			sqlSelectCommand1.Connection = Master.SqlConn;
			sqlSelectCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@requestID", System.Data.SqlDbType.Int, 4, "requestID"));
			// 
			// sqlUpdateCommand1
			// 
			sqlUpdateCommand1.CommandText = @"UPDATE REQ_Request SET requestStaffID = @requestStaffID, priorityID = @priorityID, featureTypeID = @featureTypeID, description = @description, AssignedToStaffID = @AssignedToStaffID, statusID = @statusID, comment = @comment, ITPriority = @ITPriority, studyid = @studyid, esthours = @esthours WHERE (requestID = @requestID); SELECT * FROM REQ_Request WHERE (requestID = @requestID)";
			sqlUpdateCommand1.Connection = Master.SqlConn;
			sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@requestStaffID", System.Data.SqlDbType.Int, 4, "requestStaffID"));
			sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@priorityID", System.Data.SqlDbType.Int, 4, "priorityID"));
			sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@featureTypeID", System.Data.SqlDbType.Int, 4, "featureTypeID"));
			sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@description", System.Data.SqlDbType.VarChar, 3500, "description"));
			sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@AssignedToStaffID", System.Data.SqlDbType.Int, 4, "AssignedToStaffID"));
			sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@statusID", System.Data.SqlDbType.Int, 4, "statusID"));
			sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@comment", System.Data.SqlDbType.VarChar, 3500, "comment"));
			sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ITPriority", System.Data.SqlDbType.Int, 4, "ITPriority"));
			sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4, "studyID"));
			sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@esthours", System.Data.SqlDbType.Int, 4, "EstHours"));
			sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@requestID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "requestID", System.Data.DataRowVersion.Original, null));
			btnSubmit.Click += new System.EventHandler(btnSubmit_Click);
			btnCancel.Click += new System.EventHandler(btnCancel_Click);
			btnViewList.Click += new System.EventHandler(btnViewList_Click);
		}
		#endregion

		private void DoUpdateEdit()
		{
			try 
			{
				if (ValidateEdit() == false)
					throw new Exception("Correct the following problems and submit again:");
				else
				{
					DoUpdate();
				}
			}
			catch (Exception e)
			{
				_errors.Insert(0, e.Message);
				ShowErrors();
			}
		}

		private void DoUpdateEditAdmin()
		{
			try 
			{
				if (ValidateEditAdmin() == false)
					throw new Exception("Correct the following problems and submit again:");
				else
				{
					DoUpdate();
				}
			}
			catch (Exception e)
			{
				_errors.Insert(0, e.Message);
				ShowErrors();
			}

		}

		private void DoUpdate()
		{
			SqlParameterCollection p = sqlDataAdapter1.UpdateCommand.Parameters;
			p["@requestStaffID"].Value = ddlRequestFrom.SelectedValue;
			p["@priorityID"].Value  = ddlPriority.SelectedValue;
			p["@featureTypeID"].Value  = ddlFeatureType.SelectedValue;
			p["@description"].Value  = txtDescription.Text.Trim();

			if (ddlAssignedTo.SelectedValue=="-1")
				p["@AssignedToStaffID"].Value = DBNull.Value;
			else
				p["@AssignedToStaffID"].Value = ddlAssignedTo.SelectedValue;

			p["@statusid"].Value = ddlStatus.SelectedValue;

			if (txtComments.Text.Trim()==string.Empty)
				p["@comment"].Value = DBNull.Value;
			else
				p["@comment"].Value = txtComments.Text;


			if (ddlEditITPriority.SelectedValue == "-1")
				p["@ITPriority"].Value = DBNull.Value;
			else
				p["@ITPriority"].Value = ddlEditITPriority.SelectedValue;


			if (ddlStudy.SelectedValue=="-1")
				p["@studyid"].Value = DBNull.Value;
			else
				p["@studyid"].Value = ddlStudy.SelectedValue;

			if (txtEstHours.Text.Trim() == string.Empty)
				p["@esthours"].Value = DBNull.Value;
			else
				p["@esthours"].Value = txtEstHours.Text;


			p["@requestID"].Value = txtRequestID.Text;

			SqlDataReader r = sqlDataAdapter1.UpdateCommand.ExecuteReader();
			r.Read();
			FillForm(r);
			r.Close();
		}
		
		private void ShowErrors()
		{
			lblErrors.Visible = true;
			string s = string.Empty;
			s = "<ul>";
			foreach (string se in _errors)
			{
				s += "<li>" + se + "</li>";
			}
			s += "</ul>";
			lblErrors.Text = s;
		}

		private void DoInsert()
		{
			try 
			{
				if (ValidateInsert() == false)
					throw new Exception("Correct the following problems and submit again:");
				else
				{
					sqlDataAdapter1 = new SqlDataAdapter(sqlSelectCommand1);
					sqlDataAdapter1.InsertCommand = sqlInsertCommand1;
					SqlParameterCollection p = sqlDataAdapter1.InsertCommand.Parameters;
					p["@requestStaffID"].Value = ddlRequestFrom.SelectedValue;
					p["@priorityID"].Value  = ddlPriority.SelectedValue;
					p["@featureTypeID"].Value  = ddlFeatureType.SelectedValue;
					p["@description"].Value  = txtDescription.Text.Trim();

					if (ddlStudy.SelectedValue=="-1")
						p["@studyid"].Value = DBNull.Value;
					else
						p["@studyid"].Value = ddlStudy.SelectedValue;

					sqlInsertCommand1.ExecuteNonQuery();
				}
			}
			catch (Exception e)
			{
				_errors.Insert(0, e.Message);
				ShowErrors();
			}
		}

		private void FillForm(SqlDataReader r)
		{
			txtRequestID.Text = r["requestID"].ToString();
			txtSubmitDate.Text = string.Format("{0:d}",r["submitDate"]);
//			ddlRequestFrom.SelectedValue = r["requestStaffID"].ToString();
			ddlFeatureType.SelectedValue = r["featureTypeID"].ToString();
			ddlPriority.SelectedValue = r["priorityID"].ToString();
			txtDescription.Text = r["description"].ToString();
			ddlStatus.SelectedValue = r["statusID"].ToString();
			ddlAssignedTo.SelectedValue = (r["AssignedToStaffID"] == DBNull.Value)?"-1": r["AssignedToStaffID"].ToString();
			txtComments.Text = r["comment"].ToString();
			ddlEditITPriority.SelectedValue = (r["ITPriority"]==DBNull.Value)?"-1":r["ITPriority"].ToString();
			ddlStudy.SelectedValue = (r["studyid"]==DBNull.Value)?"-1":r["studyid"].ToString();
			txtEstHours.Text = r["esthours"].ToString();
	}

		private bool ValidateInsert()
		{
			bool valid = true;
			if (ddlRequestFrom.SelectedValue == "-1")
			{
				_errors.Add("Request From is required.");
				valid = false;
			}
			
			if (txtDescription.Text.Trim() == string.Empty)
			{
				_errors.Add("A description is required.");
				valid = false;
			}

			return valid;
		}

		private bool ValidateEdit()
		{
			bool valid = true;
			if (ddlRequestFrom.SelectedValue == "-1")
			{
				_errors.Add("Request From is required.");
				valid = false;
			}
			
			if (txtDescription.Text.Trim() == string.Empty)
			{
				_errors.Add("A description is required.");
				valid = false;
			}

			return valid;
		}

		private bool ValidateEditAdmin()
		{
			bool valid = true;
			if (ddlRequestFrom.SelectedValue == "-1")
			{
				_errors.Add("Request From is required.");
				valid = false;
			}
			
			if (txtDescription.Text.Trim() == string.Empty)
			{
				_errors.Add("A description is required.");
				valid = false;
			}


			if (txtEstHours.Text.Trim() != string.Empty)
			{
				try
				{
					int hrs = int.Parse(txtEstHours.Text);
				}
				catch
				{
					_errors.Add("Estimated hours must be an integer.");
					valid=false;
				}
			}

			return valid;
		}

		private bool DateValid(string d)
		{
			bool valid = true;
			try 
			{
				DateTime dt = DateTime.Parse(d);
			}
			catch 
			{
				valid = false;
			}
			return valid;
		}

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			Button b = (Button)sender;
			if (b.CommandName == "EDIT")
				DoUpdateEdit();
			else if (b.CommandName == "EDIT_ADMIN")
				DoUpdateEditAdmin();
			else
				DoInsert();

			// redirect to list, unless there are errors
			if (_errors.Count == 0)
				Response.Redirect(Request.ApplicationPath + "/Help/ServiceRequest/RequestList.aspx");

		}

		protected void btnViewList_Click(object sender, System.EventArgs e)
		{
            Response.Redirect(Request.ApplicationPath + "/Help/ServiceRequest/RequestList.aspx");
		}

		protected void btnCancel_Click(object sender, System.EventArgs e)
		{
            Response.Redirect(Request.ApplicationPath + "/Help/ServiceRequest/RequestList.aspx");		
		}
	}
}