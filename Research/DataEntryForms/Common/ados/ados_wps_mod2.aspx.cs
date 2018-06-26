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
	/// Summary description for ados_wps_mod2.
	/// </summary>
	public partial class ados_wps_mod2 : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlCommand sqlSelect;
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlLookup;
		protected System.Data.SqlClient.SqlCommand sqlInsert;
		protected System.Data.SqlClient.SqlCommand sqlUpdateVerified;
		protected System.Data.SqlClient.SqlCommand sqlScoreADOS_WPS;
		protected System.Data.SqlClient.SqlCommand sqlUpdate;
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
			this.sqlSelect = new System.Data.SqlClient.SqlCommand();
			this.sqlDataConnection = new System.Data.SqlClient.SqlConnection();
			this.sqlLookup = new System.Data.SqlClient.SqlCommand();
			this.sqlInsert = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateVerified = new System.Data.SqlClient.SqlCommand();
			this.sqlScoreADOS_WPS = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdate = new System.Data.SqlClient.SqlCommand();
			this.sqlScoreADOSGeneric = new System.Data.SqlClient.SqlCommand();
			this.DataEntryController1.DoLookup += new DataEntryFramework.LookupEventHandler(this.DataEntryController1_DoLookup);
			// 
			// sqlSelect
			// 
			this.sqlSelect.CommandText = "SELECT GEN_ADOS.* FROM GEN_ADOS WHERE (ados_pk = @ados_pk)";
			this.sqlSelect.Connection = this.sqlDataConnection;
			this.sqlSelect.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ados_pk", System.Data.SqlDbType.Int, 4, "ados_pk"));
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlLookup
			// 
			this.sqlLookup.CommandText = "SELECT GEN_ADOS.* FROM GEN_ADOS WHERE (ADOSmod = 2) AND (indid = @indid) AND (ADO" +
				"Sver = \'WPS\')";
			this.sqlLookup.Connection = this.sqlDataConnection;
			this.sqlLookup.Parameters.Add(new System.Data.SqlClient.SqlParameter("@indid", System.Data.SqlDbType.Int, 4, "indid"));
			// 
			// sqlInsert
			// 
			this.sqlInsert.CommandText = "INSERT INTO gen_ados (indid, ADOSdate, ADOSclin, ADOSmod, ADOSver, verified) VALU" +
				"ES (@indid, @ADOSdate, @ADOSclin, 2, \'WPS\', @verified); SELECT * FROM gen_ados W" +
				"HERE ados_pk = @@IDENTITY;";
			this.sqlInsert.Connection = this.sqlDataConnection;
			this.sqlInsert.Parameters.Add(new System.Data.SqlClient.SqlParameter("@indid", System.Data.SqlDbType.Int, 4, "indid"));
			this.sqlInsert.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOSdate", System.Data.SqlDbType.DateTime, 8, "ADOSdate"));
			this.sqlInsert.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOSclin", System.Data.SqlDbType.NVarChar, 8, "ADOSclin"));
			this.sqlInsert.Parameters.Add(new System.Data.SqlClient.SqlParameter("@verified", System.Data.SqlDbType.SmallInt, 2, "ADOSmod"));
			// 
			// sqlUpdateVerified
			// 
			this.sqlUpdateVerified.CommandText = "UPDATE gen_ados SET verified = @verified WHERE (ados_pk = @ados_pk); SELECT * FRO" +
				"M gen_ados WHERE ados_pk = @ados_pk;";
			this.sqlUpdateVerified.Connection = this.sqlDataConnection;
			this.sqlUpdateVerified.Parameters.Add(new System.Data.SqlClient.SqlParameter("@verified", System.Data.SqlDbType.Int, 4, "verified"));
			this.sqlUpdateVerified.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ados_pk", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "ados_pk", System.Data.DataRowVersion.Original, null));
			// 
			// sqlScoreADOS_WPS
			// 
			this.sqlScoreADOS_WPS.CommandText = "dbo.[spScoreADOS_WPS]";
			this.sqlScoreADOS_WPS.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreADOS_WPS.Connection = this.sqlDataConnection;
			this.sqlScoreADOS_WPS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreADOS_WPS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@adoswps_pk", System.Data.SqlDbType.Int, 4));
			this.sqlScoreADOS_WPS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			// 
			// sqlUpdate
			// 
			this.sqlUpdate.CommandText = @"UPDATE gen_ados SET indid = @indid, ADOSdate = @ADOSdate, ADOSclin = @ADOSclin, ADOS01 = @ADOS01, ADOS02 = @ADOS02, ADOS03 = @ADOS03, ADOS04 = @ADOS04, ADOS05 = @ADOS05, ADOS06 = @ADOS06, ADOS07 = @ADOS07, ADOS08 = @ADOS08, ADOS09 = @ADOS09, ADOS10 = @ADOS10, ADOS11 = @ADOS11, ADOS12 = @ADOS12, ADOS13 = @ADOS13, ADOS14 = @ADOS14, ADOS15 = @ADOS15, ADOS16 = @ADOS16, ADOS17 = @ADOS17, ADOS18 = @ADOS18, ADOS19 = @ADOS19, ADOS20 = @ADOS20, ADOS21 = @ADOS21, ADOS22 = @ADOS22, ADOS23 = @ADOS23, ADOS24 = @ADOS24, ADOS25 = @ADOS25, ADOS26 = @ADOS26, ADOS27 = @ADOS27, ADOS28 = @ADOS28, verified = @verified WHERE ados_pk = @ados_pk; SELECT * FROM gen_ados WHERE ados_pk = @ados_pk;";
			this.sqlUpdate.Connection = this.sqlDataConnection;
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@indid", System.Data.SqlDbType.Int, 4, "indid"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOSdate", System.Data.SqlDbType.DateTime, 8, "ADOSdate"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOSclin", System.Data.SqlDbType.NVarChar, 8, "ADOSclin"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS01", System.Data.SqlDbType.SmallInt, 2, "ADOS01"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS02", System.Data.SqlDbType.SmallInt, 2, "ADOS02"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS03", System.Data.SqlDbType.SmallInt, 2, "ADOS03"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS04", System.Data.SqlDbType.SmallInt, 2, "ADOS04"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS05", System.Data.SqlDbType.SmallInt, 2, "ADOS05"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS06", System.Data.SqlDbType.SmallInt, 2, "ADOS06"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS07", System.Data.SqlDbType.SmallInt, 2, "ADOS07"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS08", System.Data.SqlDbType.SmallInt, 2, "ADOS08"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS09", System.Data.SqlDbType.SmallInt, 2, "ADOS09"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS10", System.Data.SqlDbType.SmallInt, 2, "ADOS10"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS11", System.Data.SqlDbType.SmallInt, 2, "ADOS11"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS12", System.Data.SqlDbType.SmallInt, 2, "ADOS12"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS13", System.Data.SqlDbType.SmallInt, 2, "ADOS13"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS14", System.Data.SqlDbType.SmallInt, 2, "ADOS14"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS15", System.Data.SqlDbType.SmallInt, 2, "ADOS15"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS16", System.Data.SqlDbType.SmallInt, 2, "ADOS16"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS17", System.Data.SqlDbType.SmallInt, 2, "ADOS17"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS18", System.Data.SqlDbType.SmallInt, 2, "ADOS18"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS19", System.Data.SqlDbType.SmallInt, 2, "ADOS19"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS20", System.Data.SqlDbType.SmallInt, 2, "ADOS20"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS21", System.Data.SqlDbType.SmallInt, 2, "ADOS21"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS22", System.Data.SqlDbType.SmallInt, 2, "ADOS22"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS23", System.Data.SqlDbType.SmallInt, 2, "ADOS23"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS24", System.Data.SqlDbType.SmallInt, 2, "ADOS24"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS25", System.Data.SqlDbType.SmallInt, 2, "ADOS25"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS26", System.Data.SqlDbType.SmallInt, 2, "ADOS26"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS27", System.Data.SqlDbType.SmallInt, 2, "ADOS27"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOS28", System.Data.SqlDbType.SmallInt, 2, "ADOS28"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@verified", System.Data.SqlDbType.Int, 4, "verified"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ados_pk", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "ados_pk", System.Data.DataRowVersion.Original, null));
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
