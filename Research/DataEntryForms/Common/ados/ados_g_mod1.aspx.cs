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

namespace gen_ados_wps
{
	/// <summary>
	/// Summary description for ados_g_mod1.
	/// </summary>
	public partial class ados_g_mod1 : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlScoreADOSGeneric;
	
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
			this.sqlScoreADOSGeneric = new System.Data.SqlClient.SqlCommand();
			this.DataEntryController1.DoLookup += new DataEntryFramework.LookupEventHandler(this.DataEntryController1_DoLookup_1);
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreADOSGeneric
			// 
			this.sqlScoreADOSGeneric.CommandText = "dbo.[spScoreADOSGeneric]";
			this.sqlScoreADOSGeneric.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreADOSGeneric.Connection = this.sqlDataConnection;
			this.sqlScoreADOSGeneric.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreADOSGeneric.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ados_pk", System.Data.SqlDbType.Int, 4));

		}
		#endregion





		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				sqlScoreADOSGeneric.Parameters["@ados_pk"].Value = DataEntryController1.PrimaryKeyVal;

				this.sqlDataConnection.Open();
				this.sqlScoreADOSGeneric.ExecuteNonQuery();

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

		private void DataEntryController1_DoLookup_1(object sender, DataEntryFramework.LookupEventArgs e)
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
				else if (DataEntryController1.LookupTextBox2Text.Trim() == string.Empty)
				{
					throw new Exception("Enter an indexnum to lookup.");
				}
				else
				{
					try 
					{
						int test = int.Parse(DataEntryController1.LookupTextBox2Text.Trim());
					}
					catch
					{
						throw new Exception("Indexnum must be an integer.");
					}
				}


				// redirect user to lookup form.
				this.Response.Redirect(string.Format("ados_lookup.aspx" + "?id={0}&indexnum={1}&studymeasid={2}", DataEntryController1.LookupTextBox1Text.Trim(),
					DataEntryController1.LookupTextBox2Text.Trim(), DataEntryController1.LookupStudyMeasID));
			}
			catch (Exception e2)
			{

				DataEntryController1.AddNotification(e2.Message);
				DataEntryController1.FormError = true;
				
				// Skip default processing
				DataEntryController1.FormEventHandled = true;
			}
			
		}
	}
}
