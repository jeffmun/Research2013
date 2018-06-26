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

namespace tap_anotb
{
	/// <summary>
	/// Summary description for tap_anotb.
	/// </summary>
	public partial class tap_anotb : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlCommand sqlScoreANotB;
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
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
			this.sqlScoreANotB = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreANotB
			// 
			this.sqlScoreANotB.CommandText = "dbo.[spScoreANotB_2]";
			this.sqlScoreANotB.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreANotB.Connection = this.sqlDataConnection;
			this.sqlScoreANotB.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreANotB.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			this.sqlScoreANotB.Parameters.Add(new System.Data.SqlClient.SqlParameter("@anotb_pk", System.Data.SqlDbType.Int, 4));
			this.PreRender += new System.EventHandler(this.tap_anotb_PreRender);

		}
		#endregion

		protected void tap_anotb_PreRender(object sender, System.EventArgs e)
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
				this.sqlScoreANotB.Parameters["@anotb_pk"].Value =  DataEntryController1.PrimaryKeyVal;
				this.sqlScoreANotB.Parameters["@studyid"].Value = 1011;

				this.sqlDataConnection.Open();

				// this statement can throw an SqlException if any errors occur in spScoreMullen
				this.sqlScoreANotB.ExecuteNonQuery();

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
