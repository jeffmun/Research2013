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
using DataEntryFramework;

namespace tap_adi_toddler
{
	/// <summary>
	/// Summary description for tap_adi_toddler.
	/// </summary>
	public partial class tap_adi_toddler : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlScoreTAPADI_toddler;
		protected System.Web.UI.HtmlControls.HtmlTable table47;
	


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
			this.sqlScoreTAPADI_toddler = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreTAPADI_toddler
			// 
			this.sqlScoreTAPADI_toddler.CommandText = "dbo.[spScoreTAPADI_toddler]";
			this.sqlScoreTAPADI_toddler.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreTAPADI_toddler.Connection = this.sqlDataConnection;
			this.sqlScoreTAPADI_toddler.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreTAPADI_toddler.Parameters.Add(new System.Data.SqlClient.SqlParameter("@adi_toddler_pk", System.Data.SqlDbType.Int, 4));
			this.PreRender += new System.EventHandler(this.tap_adi_toddler_PreRender);

		}
		#endregion





		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				this.sqlScoreTAPADI_toddler.Parameters["@" + DataEntryController1.PrimaryKeyField].Value = DataEntryController1.PrimaryKeyVal;

				this.sqlDataConnection.Open();
				this.sqlScoreTAPADI_toddler.ExecuteNonQuery();

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

		protected void tap_adi_toddler_PreRender(object sender, System.EventArgs e)
		{
			// lookup if id is passed
			if (!this.IsPostBack && this.Request.QueryString["id"] != null)
			{
				DataEntryController1.LookupTextBox1Text = this.Request.QueryString["id"];
				DataEntryController1.ParameterLookup();
			}

		}



	}
}
