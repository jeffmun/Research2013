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

namespace gen_bpas
{
	/// <summary>
	/// Summary description for gen_bpas.
	/// </summary>
	public partial class gen_bpas : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlCommand sqlReliabilityAdd;
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
			this.sqlReliabilityAdd = new System.Data.SqlClient.SqlCommand();
			this.sqlDataConnection = new System.Data.SqlClient.SqlConnection();
			// 
			// sqlReliabilityAdd
			// 
			this.sqlReliabilityAdd.CommandText = "dbo.[spReliabilityAdd]";
			this.sqlReliabilityAdd.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlReliabilityAdd.Connection = this.sqlDataConnection;
			this.sqlReliabilityAdd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlReliabilityAdd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@orig_PK", System.Data.SqlDbType.Int, 4));
			this.sqlReliabilityAdd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@orig_studymeasid", System.Data.SqlDbType.Int, 4));
			this.sqlReliabilityAdd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@specialHandling", System.Data.SqlDbType.VarChar, 15));
			this.sqlReliabilityAdd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@relPK", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlReliabilityAdd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@relID", System.Data.SqlDbType.VarChar, 15, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlReliabilityAdd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@relIndexnum", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlReliabilityAdd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@relStudyMeasID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlReliabilityAdd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@relFormURL", System.Data.SqlDbType.VarChar, 255, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			this.PreRender += new System.EventHandler(this.gen_bpas_PreRender);

		}
		#endregion

		protected void gen_bpas_PreRender(object sender, System.EventArgs e)
		{
			if (!this.IsPostBack && this.Request.QueryString["id"] != null)
			{
				DataEntryController1.LookupTextBox1Text = this.Request.QueryString["id"];
				DataEntryController1.ParameterLookup();
			}	
		}

		private void DataEntryController1_DoReliability(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				sqlReliabilityAdd.Parameters["@orig_pk"].Value = DataEntryController1.PrimaryKeyVal;
				sqlReliabilityAdd.Parameters["@orig_studymeasid"].Value = 127;

				this.sqlDataConnection.Open();
				this.sqlReliabilityAdd.ExecuteNonQuery();

				string relID, relIndexnum, relStudyMeasID, relFormURL;

				relID = sqlReliabilityAdd.Parameters["@relID"].Value.ToString();
				relIndexnum = sqlReliabilityAdd.Parameters["@relIndexnum"].Value.ToString();
				relStudyMeasID = sqlReliabilityAdd.Parameters["@relStudyMeasID"].Value.ToString();
				relFormURL = sqlReliabilityAdd.Parameters["@relFormURL"].Value.ToString();

				Response.Redirect(relFormURL + "?ID=" + relID + "&indexnum=" + relIndexnum + "&studymeasid=" + relStudyMeasID, true);

				
			}
			catch (Exception ex)
			{
				DataEntryController1.AddNotification(string.Format("An exception ocurred while inserting reliability: {0}", ex.Message));
				DataEntryController1.FormError = true;
			}
			finally 
			{
				this.sqlDataConnection.Close();
			}

		}
	}
}
