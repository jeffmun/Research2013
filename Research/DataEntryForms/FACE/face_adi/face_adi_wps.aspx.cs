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
using DataEntryFramework.Old;

namespace face_adi
{

    public class CustomFormatter : DataEntryFramework.Old.DefaultFormatter
    {

        public override void FormatEntering(DataEntryController dec)
        {
            base.FormatEntering(dec);
            DisableUnusedFields(dec);
        }

        public override void FormatSingleEntered(DataEntryController dec)
        {
            base.FormatSingleEntered(dec);
            DisableUnusedFields(dec);
        }

        public override void FormatDoubleEntered(DataEntryController dec)
        {
            base.FormatDoubleEntered(dec);
            DisableUnusedFields(dec);
        }

        public override void FormatCorrectingDoubleEntering(DataEntryController dec)
        {
            base.FormatCorrectingDoubleEntering(dec);
            DisableUnusedFields(dec);
        }

        public override void FormatDoubleEntering(DataEntryController dec)
        {
            base.FormatDoubleEntering(dec);
            DisableUnusedFields(dec);
        }

        private void DisableUnusedFields(DataEntryController dec)
        {
            foreach (DataFieldControl c in dec.AllDataFields)
            {
                if (
                        c.ID == "ad005" ||
                        c.ID == "ad006" ||
                        c.ID == "ad007" ||
                        c.ID == "ad008" ||
                        c.ID == "ad029cu" ||
                        c.ID == "ad029mo" ||
                        c.ID == "ad032cu" ||
                        c.ID == "ad032at" ||
                        c.ID == "ad040cu" ||
                        c.ID == "ad040ev" ||
                        c.ID == "ad041cu" ||
                        c.ID == "ad041at" ||
                        c.ID == "ad046cu" ||
                        c.ID == "ad046mo" ||
                        c.ID == "ad060cu" ||
                        c.ID == "ad060mo" ||
                        c.ID == "ad066cu" ||
                        c.ID == "ad066mo" ||
                        c.ID == "ad072cu" ||
                        c.ID == "ad072ev" ||
                        c.ID == "ad073cu" ||
                        c.ID == "ad073ev" ||
                        c.ID == "ad074cu" ||
                        c.ID == "ad074ev" ||
                        c.ID == "ad075cu" ||
                        c.ID == "ad075ev" ||
                        c.ID == "ad076cu" ||
                        c.ID == "ad076ev" ||
                        c.ID == "ad079cu" ||
                        c.ID == "ad079ev" ||
                        c.ID == "ad080cu" ||
                        c.ID == "ad080mo" ||
                        c.ID == "ad081cu" ||
                        c.ID == "ad081ev" ||
                        c.ID == "ad082cu" ||
                        c.ID == "ad082ev" ||
                        c.ID == "ad083cu" ||
                        c.ID == "ad083ev" ||
                        c.ID == "ad084cu" ||
                        c.ID == "ad084ev" ||
                        c.ID == "ad085cu" ||
                        c.ID == "ad085ev"

                    )
                    c.Enabled = false;

            }
        }

    }



	/// <summary>
	/// Summary description for face_adi_wps.
	/// </summary>
	public partial class face_adi_wps : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlScoreADI_WPS;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{

			CustomFormatter customFormatter = new CustomFormatter();
			DataEntryController1.Formatter = customFormatter;
		
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
			this.sqlScoreADI_WPS = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreADI_WPS
			// 
			this.sqlScoreADI_WPS.CommandText = "dbo.[spScoreADI_WPS]";
			this.sqlScoreADI_WPS.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreADI_WPS.Connection = this.sqlDataConnection;
			this.sqlScoreADI_WPS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreADI_WPS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@adi_pk", System.Data.SqlDbType.Int, 4));
			this.sqlScoreADI_WPS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			this.PreRender += new System.EventHandler(this.face_adi_wps_PreRender);

		}
		#endregion

		

		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{

				
				this.sqlScoreADI_WPS.Parameters["@adi_pk"].Value = DataEntryController1.PrimaryKeyVal;
				this.sqlScoreADI_WPS.Parameters["@studyid"].Value = 1010;

				this.sqlDataConnection.Open();

				// this statement can throw an SqlException if any errors occur
				this.sqlScoreADI_WPS.ExecuteNonQuery();
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

		protected void face_adi_wps_PreRender(object sender, System.EventArgs e)
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
