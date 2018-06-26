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
using DataEntryFramework;
using System.Data.SqlClient;

namespace tap_vineseec
{
	/// <summary>
	/// Summary description for tap_vineseec.
	/// </summary>
	public partial class tap_vineseec : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlScoreVineSEEC;
	
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
			this.sqlScoreVineSEEC = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreVineSEEC
			// 
			this.sqlScoreVineSEEC.CommandText = "dbo.[spScoreVineSEEC]";
			this.sqlScoreVineSEEC.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreVineSEEC.Connection = this.sqlDataConnection;
			this.sqlScoreVineSEEC.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreVineSEEC.Parameters.Add(new System.Data.SqlClient.SqlParameter("@vineseec_pk", System.Data.SqlDbType.Int, 4));
			this.sqlScoreVineSEEC.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			this.PreRender += new System.EventHandler(this.tap_vineseec_PreRender);

		}
		#endregion


		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
				try 
			{
				//set parameters for score sp call
				this.sqlScoreVineSEEC.Parameters["@vineseec_pk"].Value = DataEntryController1.PrimaryKeyVal;
				this.sqlScoreVineSEEC.Parameters["@studyid"].Value = 1011;

				this.sqlDataConnection.Open();

				// this statement can throw an SqlException if any errors occur in spScoreMullen
				this.sqlScoreVineSEEC.ExecuteNonQuery();

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

		protected void tap_vineseec_PreRender(object sender, System.EventArgs e)
		{
			if (!this.IsPostBack && this.Request.QueryString["id"] != null)
			{
				DataEntryController1.LookupTextBox1Text = this.Request.QueryString["id"];
				DataEntryController1.ParameterLookup();
			}
		}
	}
}
