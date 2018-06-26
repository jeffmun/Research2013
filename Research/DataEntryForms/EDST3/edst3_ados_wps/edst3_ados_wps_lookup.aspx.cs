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

namespace edst3_ados_wps
{
    public class Util
    {
        public const string ADOS_MODULE1_FORM = "edst3_ados_wps_mod1.aspx";
        public const string ADOS_MODULE2_FORM = "edst3_ados_wps_mod2.aspx";
        public const string ADOS_MODULE3_FORM = "edst3_ados_wps_mod3.aspx";
        public const string ADOS_MODULE4_FORM = "edst3_ados_wps_mod4.aspx";



    }

	public partial class edst3_ados_wps_lookup : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlCommand sqlGetADOSMod;
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{

			try 
			{
				if (!this.IsPostBack)
				{
					// process request for form
					int edsid = -1;
					try 
					{
						edsid = int.Parse(this.Request.QueryString["id"]);
					}
					catch {}

					if (edsid != -1)
						Lookup(edsid);					
				}

				else
				{
					// process lookup button click
					int edsid = -1;
					try 
					{
						edsid = int.Parse(this.txtEDSID.Text);
					}
					catch 
					{
						throw new Exception("EDSID is required and must be an integer.");
					}

					Lookup(edsid);

				}

			}
			catch (Exception e1)
			{
				this.lblErrors.Text = e1.Message;
				this.lblErrors.Visible = true;
			}
			
		}

		private void Lookup(int edsid)
		{
			
			try 
			{

				this.sqlDataConnection.Open();
				this.sqlGetADOSMod.Parameters["@intid"].Value = edsid;
				this.sqlGetADOSMod.Parameters["@studyid"].Value = 3;

				this.sqlGetADOSMod.ExecuteNonQuery();

				// ADOSmod is returned by sp or NULL if not found
				if (sqlGetADOSMod.Parameters["@ADOSMod"].Value == DBNull.Value)
					throw new Exception(string.Format("ADOS with EDSID={0} not found.", edsid));
				else
				{	
					// redirect user to correct form
					string f = string.Empty;
					switch ((int)sqlGetADOSMod.Parameters["@ADOSMod"].Value)
					{
						case 1:
							f = Util.ADOS_MODULE1_FORM;
							break;
						case 2:
							f = Util.ADOS_MODULE2_FORM;
							break;
						case 3:
							f = Util.ADOS_MODULE3_FORM;
							break;
						case 4:
							f = Util.ADOS_MODULE4_FORM;
							break;
					}

					// redirect user to correct form
					this.Response.Redirect(string.Format(f + "?id={0}", edsid));

				}	
			}
			catch (Exception e1)
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
			this.sqlGetADOSMod = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlGetADOSMod
			// 
			this.sqlGetADOSMod.CommandText = "dbo.[spGetADOSMod]";
			this.sqlGetADOSMod.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlGetADOSMod.Connection = this.sqlDataConnection;
			this.sqlGetADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlGetADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@intid", System.Data.SqlDbType.Int, 4));
			this.sqlGetADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@textid", System.Data.SqlDbType.VarChar, 10));
			this.sqlGetADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			this.sqlGetADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOSMod", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));

		}
		#endregion


	}
}
