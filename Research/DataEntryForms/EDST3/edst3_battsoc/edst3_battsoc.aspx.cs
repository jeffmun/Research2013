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

namespace edst3_battsoc
{
	/// <summary>
	/// Summary description for edst3_battsoc.
	/// </summary>
	public partial class edst3_battsoc : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlScoreBattelle;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
		
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
			this.sqlScoreBattelle = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreBattelle
			// 
			this.sqlScoreBattelle.CommandText = "dbo.[spScoreBattelle]";
			this.sqlScoreBattelle.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreBattelle.Connection = this.sqlDataConnection;
			this.sqlScoreBattelle.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreBattelle.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			this.sqlScoreBattelle.Parameters.Add(new System.Data.SqlClient.SqlParameter("@batt_pk", System.Data.SqlDbType.Int, 4));
			this.sqlScoreBattelle.Parameters.Add(new System.Data.SqlClient.SqlParameter("@error_mode", System.Data.SqlDbType.VarChar, 15));
			this.PreRender += new System.EventHandler(this.edst3_battsoc_PreRender);

		}
		#endregion

		protected void edst3_battsoc_PreRender(object sender, System.EventArgs e)
		{
			if (!this.IsPostBack && this.Request.QueryString["id"] != null)
			{
				DataEntryController1.LookupTextBox1Text = this.Request.QueryString["id"];
				DataEntryController1.ParameterLookup();
			}
		}

		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				this.sqlScoreBattelle.Parameters["@batt_pk"].Value =  DataEntryController1.PrimaryKeyVal;
				this.sqlScoreBattelle.Parameters["@studyid"].Value = 3;
				this.sqlScoreBattelle.Parameters["@error_mode"].Value = "SCORE_MSG";

				this.sqlDataConnection.Open();

				// this statement can throw an SqlException if any errors occur in spScoreMullen
				this.sqlScoreBattelle.ExecuteNonQuery();

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
	}
}
