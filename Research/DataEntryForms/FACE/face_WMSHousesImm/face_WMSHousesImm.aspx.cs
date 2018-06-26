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

namespace face_WMSHousesImm
{
	/// <summary>
	/// Summary description for face_WMSHousesImm.
	/// </summary>
	public partial class face_WMSHousesImm : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlCommand sqlScoreWMSDetail;
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
			this.sqlScoreWMSDetail = new System.Data.SqlClient.SqlCommand();
			this.sqlDataConnection = new System.Data.SqlClient.SqlConnection();
			// 
			// sqlScoreWMSDetail
			// 
			this.sqlScoreWMSDetail.CommandText = "dbo.[spScoreWMSDetail]";
			this.sqlScoreWMSDetail.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreWMSDetail.Connection = this.sqlDataConnection;
			this.sqlScoreWMSDetail.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreWMSDetail.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pk", System.Data.SqlDbType.Int, 4));
			this.sqlScoreWMSDetail.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			this.sqlScoreWMSDetail.Parameters.Add(new System.Data.SqlClient.SqlParameter("@test", System.Data.SqlDbType.VarChar, 15));
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			this.PreRender += new System.EventHandler(this.face_WMSHousesImm_PreRender);

		}
		#endregion

		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				this.sqlScoreWMSDetail.Parameters["@pk"].Value =  DataEntryController1.PrimaryKeyVal;
				this.sqlScoreWMSDetail.Parameters["@studyid"].Value = 1010;
				this.sqlScoreWMSDetail.Parameters["@test"].Value = "HOUSES_IMM";

				this.sqlDataConnection.Open();

				// this statement can throw an SqlException if any errors occur in spScoreMullen
				this.sqlScoreWMSDetail.ExecuteNonQuery();

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

		protected void face_WMSHousesImm_PreRender(object sender, System.EventArgs e)
		{
			if (!this.IsPostBack && this.Request.QueryString["id"] != null)
			{
				DataEntryController1.LookupTextBox1Text = this.Request.QueryString["id"];
				DataEntryController1.ParameterLookup();
			}
		}
	}
}
