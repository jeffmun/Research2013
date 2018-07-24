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

namespace all_vine
{
	/// <summary>
	/// Summary description for all_vine.
	/// </summary>
	public partial class all_vine : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlScoreVinelandGeneric;
	
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
			this.sqlScoreVinelandGeneric = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreVinelandGeneric
			// 
			this.sqlScoreVinelandGeneric.CommandText = "dbo.[spScoreVinelandGeneric]";
			this.sqlScoreVinelandGeneric.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreVinelandGeneric.Connection = this.sqlDataConnection;
			this.sqlScoreVinelandGeneric.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreVinelandGeneric.Parameters.Add(new System.Data.SqlClient.SqlParameter("@vine_pk", System.Data.SqlDbType.Int, 4));

		}
		#endregion



		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				this.sqlScoreVinelandGeneric.Parameters["@vine_pk"].Value =  DataEntryController1.PrimaryKeyVal;


				this.sqlDataConnection.Open();

				// this statement can throw an SqlException if any errors occur in spScoreMullen
				this.sqlScoreVinelandGeneric.ExecuteNonQuery();

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