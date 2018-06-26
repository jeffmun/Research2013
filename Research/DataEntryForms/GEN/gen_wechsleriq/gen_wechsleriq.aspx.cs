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

namespace gen_wechsleriq
{

	



	/// <summary>
	/// Summary description for gen_wechsleriq.
	/// </summary>
	public partial class gen_wechsleriq : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlScoreWechslerIQ;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// use custom validator
			this.DataEntryController1.Validator = new WechslerValidator();

            //add load event handler
            ((HtmlControl)this.Master.FindControl("oBody")).Attributes["onload"] = "loading()";
		
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
			this.sqlScoreWechslerIQ = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreWechslerIQ
			// 
			this.sqlScoreWechslerIQ.CommandText = "dbo.[spScoreWechslerIQ]";
			this.sqlScoreWechslerIQ.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreWechslerIQ.Connection = this.sqlDataConnection;
			this.sqlScoreWechslerIQ.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreWechslerIQ.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wechsleriq_pk", System.Data.SqlDbType.Int, 4));
			this.sqlScoreWechslerIQ.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			this.PreRender += new System.EventHandler(this.gen_wechsleriq_PreRender);

		}
		#endregion

		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				this.sqlScoreWechslerIQ.Parameters["@wechsleriq_pk"].Value =  DataEntryController1.PrimaryKeyVal;
				this.sqlScoreWechslerIQ.Parameters["@studyid"].Value = 4;

				this.sqlDataConnection.Open();

				// this statement can throw an SqlException if any errors occur in spScoreMullen
				this.sqlScoreWechslerIQ.ExecuteNonQuery();

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

		protected void gen_wechsleriq_PreRender(object sender, System.EventArgs e)
		{
			if (!this.IsPostBack && this.Request.QueryString["id"] != null)
			{
				DataEntryController1.LookupTextBox1Text = this.Request.QueryString["id"];
				DataEntryController1.ParameterLookup();
			}
		}

		protected void DataEntryController1_DoCreateNew(object sender, System.EventArgs e)
		{
			//reset iq test listbox
			iqtestlist.SelectedIndex = 0;
		}
	}
}
