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

namespace gen_ados_wps
{

	public class gen_ados_lookup : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblErrors;
		protected System.Web.UI.WebControls.TextBox txtID;
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected AutismCenterBase.UI.Header uiHeader;
		protected AutismCenterBase.UI.LeftNavigation uiLeftNavigation;
		protected AutismCenterBase.UI.Footer uiFooter;
		protected System.Web.UI.HtmlControls.HtmlForm Form1;
		protected System.Data.SqlClient.SqlCommand sqlGetGenericADOSMod;
		protected System.Web.UI.WebControls.Button cmdLookup;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			try 
			{
				if (!this.IsPostBack)
				{

					// process request for form if id and studymeasid passed in querystring
					if (Request["id"] != null && Request["id"] != string.Empty && 
						Request["studymeasid"] != null && Request["studymeasid"] != string.Empty)
					{
						Lookup(Request["id"],int.Parse(Request["studymeasid"]));					
					}
				}

				else
				{

					/*
					// process lookup button click
					int id = -1;
					try 
					{
						id = int.Parse(this.txtID.Text);
					}
					catch 
					{
						throw new Exception("ID is required and must be an integer.");
					}

					Lookup(id);
*/
				}

			}
			catch (Exception e1)
			{
				this.lblErrors.Text = e1.Message;
				this.lblErrors.Visible = true;
			}
		}


		private void Lookup(string id, int studymeasid)
		{
			
			try 
			{
				this.sqlGetGenericADOSMod.Parameters["@id"].Value = id;
				this.sqlGetGenericADOSMod.Parameters["@studymeasid"].Value = studymeasid;

				this.sqlDataConnection.Open();

				this.sqlGetGenericADOSMod.ExecuteNonQuery();

				if (sqlGetGenericADOSMod.Parameters["@ADOSMod"].Value == DBNull.Value)
					throw new Exception(string.Format("ADOS with ID={0} and studymeasid={1} not found.", id, studymeasid));
				else
				{	
					string adosver = sqlGetGenericADOSMod.Parameters["@ADOSver"].Value.ToString();
					int adosmod = (int)sqlGetGenericADOSMod.Parameters["@ADOSMod"].Value;
					string form = string.Format("ADOS_{0}_MOD{1}.aspx", adosver, adosmod);

					// redirect user to correct form
					this.Response.Redirect(string.Format(form + "?id={0}&studymeasid={1}", id, studymeasid));
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
			this.sqlGetGenericADOSMod = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlGetGenericADOSMod
			// 
			this.sqlGetGenericADOSMod.CommandText = "dbo.[spGetGenericADOSMod]";
			this.sqlGetGenericADOSMod.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlGetGenericADOSMod.Connection = this.sqlDataConnection;
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@id", System.Data.SqlDbType.VarChar, 15));
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studymeasid", System.Data.SqlDbType.Int, 4));
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@indexnum", System.Data.SqlDbType.Int, 4));
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOSver", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOSMod", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
