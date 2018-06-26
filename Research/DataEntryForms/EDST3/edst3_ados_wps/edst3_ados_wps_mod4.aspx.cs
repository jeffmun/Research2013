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
using DataEntryFramework.Old;
using System.Data.SqlClient;

namespace edst3_ados_wps
{
	/// <summary>
	/// Summary description for edst3_ados_wps_mod4.
	/// </summary>
	public partial class edst3_ados_wps_mod4 : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlScoreADOS_WPS;
	
		// what ados module is this form designed to show?
		private const int ADOS_MODULE = 4;


		protected void Page_Load(object sender, System.EventArgs e)
		{
			// create event handler object so I can set insert, lookup sql commands
			DefaultFormEventHandler evtHandler = new DefaultFormEventHandler();
			evtHandler.InsertSqlCommandText = "INSERT INTO edst3_ados_wps (edsid, ADOSdate, ADOSclin, ADOSmod, verified) VALUES (@edsid, @ADOSdate, @ADOSclin, 4, @verified); SELECT * FROM edst3_ados_wps WHERE adoswps_pk = @@IDENTITY;";
			evtHandler.LookupSqlCommandText = "SELECT EDST3_ADOS_WPS.* FROM EDST3_ADOS_WPS WHERE (edsid = @edsid) AND (ADOSmod = 4)";
			DataEntryController1.FormEventHandler = evtHandler;


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
			this.sqlScoreADOS_WPS = new System.Data.SqlClient.SqlCommand();
			this.DataEntryController1.DoLookup += new DataEntryFramework.Old.LookupEventHandler(this.DataEntryController1_DoLookup);
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreADOS_WPS
			// 
			this.sqlScoreADOS_WPS.CommandText = "dbo.[spScoreADOS_WPS]";
			this.sqlScoreADOS_WPS.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreADOS_WPS.Connection = this.sqlDataConnection;
			this.sqlScoreADOS_WPS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreADOS_WPS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@adoswps_pk", System.Data.SqlDbType.Int, 4));
			this.sqlScoreADOS_WPS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			this.PreRender += new System.EventHandler(this.edst3_ados_wps_mod4_PreRender);

		}
		#endregion

		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				sqlScoreADOS_WPS.Parameters["@" + DataEntryController1.PrimaryKeyField].Value = DataEntryController1.PrimaryKeyVal;
				sqlScoreADOS_WPS.Parameters["@studyid"].Value = 3;

				this.sqlDataConnection.Open();
				this.sqlScoreADOS_WPS.ExecuteNonQuery();

			}
			catch (Exception ex)
			{
				DataEntryController1.AddNotification(string.Format("An exception ocurred while scoring: {0}", ex.Message));
				DataEntryController1.FormError = true;
			}
			finally 
			{
				this.sqlDataConnection.Close();
			}


		
		}

		private void DataEntryController1_DoLookup(object sender, DataEntryFramework.Old.LookupEventArgs e)
		{
			/* 
			 * Lookup the requested ADOS and examine it's ADOSmod.  If it matches this form
			 * then let default handler perform lookup.
			 * 
			 * If ADOSmod doesn't match then open the correct ADOS module form passing
			 * the edsid as a parameter on the querystring.
			 * 
			 */
			try 
			{
				// make sure specified edsid is valid
				int edsid = -1;
				try 
				{
					edsid = int.Parse(DataEntryController1.LookupTextBox1Text);
				}
				catch 
				{
					throw new Exception("EDS ID is required and must be an integer.");
				}

				// redirect user to lookup form
				this.Response.Redirect(string.Format("edst3_ados_wps_lookup.aspx" + "?id={0}", edsid));
			}
			catch (Exception e2)
			{

				DataEntryController1.AddNotification(e2.Message);
				DataEntryController1.FormError = true;
				
				// Skip default processing
				DataEntryController1.FormEventHandled = true;
			}	
		}

		protected void edst3_ados_wps_mod4_PreRender(object sender, System.EventArgs e)
		{
			/*
			 * check if edsid is passed in query string.
			 * If it is then attempt to load form with 
			 * matching ados.  The module of the found ados
			 * must match this form this is enforced in the sqlLookup sqlcommand
			 * which hardcodes the ADOSMod
			 * 
			 */
			int edsid = -1;
			try 
			{
				edsid = int.Parse(this.Request.QueryString["id"]);
			}
			catch {}
			if (!this.IsPostBack && edsid != -1)
			{
				DataEntryController1.LookupTextBox1Text = edsid.ToString();
				DataEntryController1.ParameterLookup();
			}
		}
	}
}
