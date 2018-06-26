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

namespace KTDissDataEntryForms.kt_cts2
{
	/// <summary>
	/// Summary description for kt_cts2.
	/// </summary>
	public partial class kt_cts2 : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlScoreCTS_BSQ;
	
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
			this.sqlScoreCTS_BSQ = new System.Data.SqlClient.SqlCommand();
			this.DataEntryController1.DoLookup += new DataEntryFramework.LookupEventHandler(this.DataEntryController1_DoLookup);
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreCTS_BSQ
			// 
			this.sqlScoreCTS_BSQ.CommandText = "dbo.[spScoreCTS_BSQ]";
			this.sqlScoreCTS_BSQ.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreCTS_BSQ.Connection = this.sqlDataConnection;
			this.sqlScoreCTS_BSQ.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreCTS_BSQ.Parameters.Add(new System.Data.SqlClient.SqlParameter("@cts_pk", System.Data.SqlDbType.Int, 4));

		}
		#endregion



		private void DataEntryController1_DoLookup(object sender, DataEntryFramework.LookupEventArgs e)
		{
			try 
			{
				// user must select a study measure to lookup
				if (DataEntryController1.LookupStudyMeasID == -1)
				{
					throw new Exception("Select a study measure to lookup.");
				}
				else if (DataEntryController1.LookupTextBox1Text.Trim() == string.Empty)
				{
					throw new Exception("Enter a Subject ID to lookup.");
				}

				// redirect user to lookup form.
				this.Response.Redirect(string.Format("cts_lookup.aspx" + "?id={0}&studymeasid={1}", DataEntryController1.LookupTextBox1Text.Trim(), DataEntryController1.LookupStudyMeasID));
			}
			catch (Exception e2)
			{

				DataEntryController1.AddNotification(e2.Message);
				DataEntryController1.FormError = true;
				
				// Skip default processing
				DataEntryController1.FormEventHandled = true;
			}
		}

		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				this.sqlScoreCTS_BSQ.Parameters["@cts_pk"].Value =  DataEntryController1.PrimaryKeyVal;


				this.sqlDataConnection.Open();

				// this statement can throw an SqlException if any errors occur in spScoreMullen
				this.sqlScoreCTS_BSQ.ExecuteNonQuery();

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
