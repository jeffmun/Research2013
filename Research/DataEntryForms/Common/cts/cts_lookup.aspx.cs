using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace GenericDataEntryForms.cts
{
	/// <summary>
	/// Summary description for cts_lookup.
	/// </summary>
	public partial class cts_lookup : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlGetGenericCTSVer;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			try 
			{
				if (!this.IsPostBack)
				{

					//setup studymeas ddl
					SetupDDL(this.ddlStudyMeasID);


					// process request for form if id and studymeasid passed in querystring
					if (Request["id"] != null && Request["id"] != string.Empty && 
						Request["studymeasid"] != null && Request["studymeasid"] != string.Empty)
					{
						Lookup(Request["id"],int.Parse(Request["studymeasid"]));					
					}
				}

				else
				{

					// process lookup button click
					if (this.ddlStudyMeasID.SelectedValue == "-1")
						throw new Exception("Select a Study Measure to Lookup.");
					else if (this.txtID.Text.Trim() == string.Empty)
						throw new Exception("Enter Subject ID to Lookup.");
					else
						Lookup(txtID.Text, int.Parse(ddlStudyMeasID.SelectedValue));
				}

			}
			catch (Exception e1)
			{
				this.lblErrors.Text = e1.Message;
				this.lblErrors.Visible = true;
			}
		}

		private void SetupDDL(DropDownList ddl)
		{

			SqlConnection conn = null;
			SqlCommand cmd = null;

			try
			{
				conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"]);
				cmd = new SqlCommand();
				string sql = "select studymeasid,studyname + ': ' + studymeasname as studymeasure ";
				sql += "from uwautism_research_backend..tblstudy s join uwautism_research_backend..tblstudymeas sm on s.studyid=sm.studyid ";
				sql += "where studymeasid in (" + txtAllowedStudyMeasures.Text + ") ";
				sql += "union all ";
				sql += "select -1, '-Study Measures-' ";
				sql += "order by studymeasure";
				cmd.CommandText = sql;
				cmd.CommandType = System.Data.CommandType.Text;
				cmd.Connection = conn;
				
				ddl.DataTextField = "studymeasure";
				ddl.DataValueField = "studymeasid";
				conn.Open();
				SqlDataReader r = cmd.ExecuteReader();
				ddl.DataSource = r;
				ddl.DataBind();

			}
			catch{}
			finally
			{
				if (conn != null) conn.Close();
			}
			
		}

		private void Lookup(string id, int studymeasid)
		{
			
			try 
			{
				this.sqlGetGenericCTSVer.Parameters["@id"].Value = id;
				this.sqlGetGenericCTSVer.Parameters["@studymeasid"].Value = studymeasid;

				this.sqlDataConnection.Open();

				this.sqlGetGenericCTSVer.ExecuteNonQuery();

				if (sqlGetGenericCTSVer.Parameters["@ctsver"].Value == DBNull.Value)
					throw new Exception(string.Format("CTS with ID={0} and studymeasid={1} not found.", id, studymeasid));
				else
				{	
					int ctsver = (int)sqlGetGenericCTSVer.Parameters["@ctsver"].Value;
					string form = string.Format("cts{0}.aspx", ctsver);

					// redirect user to correct form
					this.Response.Redirect(string.Format(form + "?id={0}&studymeasid={1}&indexnum=1", id, studymeasid));
				}	
			}
			catch 
			{
				// re throw any exceptions
				throw;			
			}

			finally
			{
				this.sqlDataConnection.Close();
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
			System.Configuration.AppSettingsReader configurationAppSettings = new System.Configuration.AppSettingsReader();
			this.sqlDataConnection = new System.Data.SqlClient.SqlConnection();
			this.sqlGetGenericCTSVer = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlGetGenericCTSVer
			// 
			this.sqlGetGenericCTSVer.CommandText = "dbo.[spGetGenericCTSVer]";
			this.sqlGetGenericCTSVer.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlGetGenericCTSVer.Connection = this.sqlDataConnection;
			this.sqlGetGenericCTSVer.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlGetGenericCTSVer.Parameters.Add(new System.Data.SqlClient.SqlParameter("@id", System.Data.SqlDbType.VarChar, 15));
			this.sqlGetGenericCTSVer.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studymeasid", System.Data.SqlDbType.Int, 4));
			this.sqlGetGenericCTSVer.Parameters.Add(new System.Data.SqlClient.SqlParameter("@indexnum", System.Data.SqlDbType.Int, 4));
			this.sqlGetGenericCTSVer.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ctsver", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));

		}
		#endregion
	}
}
