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

namespace eds_catc
{


	public class WebForm1 : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlConn;
		protected System.Data.SqlClient.SqlCommand sqlInsert;
		protected DataEntryFramework.DataFieldControl edsid;
		protected DataEntryFramework.DataFieldControl indexnum;
		protected DataEntryFramework.DataFieldControl catcdate;
		protected DataEntryFramework.DataFieldControl catcclin;
		protected DataEntryFramework.DataFieldControl timepoint;
		protected DataEntryFramework.DataFieldControl created;
		protected DataEntryFramework.DataFieldControl updatedby;
		protected DataEntryFramework.DataFieldControl updated;
		protected DataEntryFramework.DataFieldControl createdby;
		protected DataEntryFramework.DataFieldControl catckey;
		protected System.Data.SqlClient.SqlCommand sqlSelect;
		protected DataEntryFramework.DataFieldControl catc01cu;
		protected DataEntryFramework.DataFieldControl catc01ev;
		protected System.Data.SqlClient.SqlCommand sqlUpdateVerified;
		protected System.Data.SqlClient.SqlCommand sqlLookup;
		protected DataEntryFramework.DataFieldControl catccmt;
		protected System.Data.SqlClient.SqlCommand sqlUpdate;
		protected DataEntryFramework.DataFieldControl DataFieldControl1;
		protected DataEntryFramework.DataFieldControl DataFieldControl2;
		protected DataEntryFramework.DataFieldControl DataFieldControl3;
		protected DataEntryFramework.DataFieldControl DataFieldControl4;
		protected DataEntryFramework.DataFieldControl DataFieldControl5;
		protected DataEntryFramework.DataFieldControl DataFieldControl6;
		protected DataEntryFramework.DataFieldControl DataFieldControl7;
		protected DataEntryFramework.DataFieldControl DataFieldControl8;
		protected DataEntryFramework.DataFieldControl DataFieldControl9;
		protected DataEntryFramework.DataFieldControl DataFieldControl10;
		protected DataEntryFramework.DataFieldControl DataFieldControl11;
		protected DataEntryFramework.DataFieldControl DataFieldControl12;
		protected DataEntryFramework.DataFieldControl DataFieldControl14;
		protected DataEntryFramework.DataFieldControl DataFieldControl15;
		protected DataEntryFramework.DataFieldControl DataFieldControl17;
		protected DataEntryFramework.DataFieldControl DataFieldControl18;
		protected DataEntryFramework.DataFieldControl DataFieldControl13;
		protected DataEntryFramework.DataFieldControl DataFieldControl19;
		protected DataEntryFramework.DataEntryController DataEntryController1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// set required controller properties
			DataEntryController1.SelectSqlCommand = sqlSelect;
			DataEntryController1.InsertSqlCommand = sqlInsert;
			DataEntryController1.UpdateVerifiedSqlCommand = sqlUpdateVerified;
			DataEntryController1.LookupSqlCommand = sqlLookup;
			DataEntryController1.UpdateSqlCommand = sqlUpdate;
			DataEntryController1.DBConnection = sqlConn;


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
			this.sqlConn = new System.Data.SqlClient.SqlConnection();
			this.sqlInsert = new System.Data.SqlClient.SqlCommand();
			this.sqlSelect = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdate = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateVerified = new System.Data.SqlClient.SqlCommand();
			this.sqlLookup = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlConn
			// 
			this.sqlConn.ConnectionString = "workstation id=DUBLIN;packet size=4096;integrated security=SSPI;data source=\"auti" +
				"sm-fs01\";persist security info=False;initial catalog=uwautism_research_data";
			// 
			// sqlInsert
			// 
			this.sqlInsert.CommandText = "INSERT INTO EDS_CatC (edsid, indexnum, catcdate, catcclin, timepoint, verified) V" +
				"ALUES (@edsid, @indexnum, @catcdate, @catcclin, @timepoint, @verified); SELECT *" +
				" FROM eds_catc WHERE catckey = @@IDENTITY;";
			this.sqlInsert.Connection = this.sqlConn;
			this.sqlInsert.Parameters.Add(new System.Data.SqlClient.SqlParameter("@edsid", System.Data.SqlDbType.Int, 4, "edsid"));
			this.sqlInsert.Parameters.Add(new System.Data.SqlClient.SqlParameter("@indexnum", System.Data.SqlDbType.Int, 4, "indexnum"));
			this.sqlInsert.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catcdate", System.Data.SqlDbType.DateTime, 8, "catcdate"));
			this.sqlInsert.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catcclin", System.Data.SqlDbType.NVarChar, 8, "catcclin"));
			this.sqlInsert.Parameters.Add(new System.Data.SqlClient.SqlParameter("@timepoint", System.Data.SqlDbType.VarChar, 15, "timepoint"));
			this.sqlInsert.Parameters.Add(new System.Data.SqlClient.SqlParameter("@verified", System.Data.SqlDbType.Int, 4, "verified"));
			// 
			// sqlSelect
			// 
			this.sqlSelect.CommandText = "SELECT EDS_CatC.* FROM EDS_CatC WHERE (CatCkey = @catckey)";
			this.sqlSelect.Connection = this.sqlConn;
			this.sqlSelect.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catckey", System.Data.SqlDbType.Int, 4, "CatCkey"));
			// 
			// sqlUpdate
			// 
			this.sqlUpdate.CommandText = @"UPDATE EDS_CatC SET timepoint = @timepoint, catcdate = @catcdate, catcclin = @catcclin, catc01cu = @catc01cu, catc01ev = @catc01ev, catc02cu = @catc02cu, catc02ev = @catc02ev, catc03cu = @catc03cu, catc03ev = @catc03ev, catc04cu = @catc04cu, catc04ev = @catc04ev, catc05cu = @catc05cu, catc05ev = @catc05ev, catc06cu = @catc06cu, catc06ev = @catc06ev, catc07cu = @catc07cu, catc07ev = @catc07ev, catc08cu = @catc08cu, catc08ev = @catc08ev, catc10 = @catc10, catc11 = @catc11, catc12 = @catc12, catc13 = @catc13, catccmt = @catccmt, verified = @verified WHERE (CatCkey = @CatCkey); SELECT * FROM eds_catc WHERE (CatCkey = @CatCkey);";
			this.sqlUpdate.Connection = this.sqlConn;
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@timepoint", System.Data.SqlDbType.VarChar, 15, "timepoint"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catcdate", System.Data.SqlDbType.DateTime, 8, "catcdate"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catcclin", System.Data.SqlDbType.NVarChar, 8, "catcclin"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc01cu", System.Data.SqlDbType.Decimal, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(3)), ((System.Byte)(1)), "catc01cu", System.Data.DataRowVersion.Current, null));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc01ev", System.Data.SqlDbType.Decimal, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(3)), ((System.Byte)(1)), "catc01ev", System.Data.DataRowVersion.Current, null));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc02cu", System.Data.SqlDbType.SmallInt, 2, "catc02cu"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc02ev", System.Data.SqlDbType.SmallInt, 2, "catc02ev"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc03cu", System.Data.SqlDbType.SmallInt, 2, "catc03cu"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc03ev", System.Data.SqlDbType.SmallInt, 2, "catc03ev"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc04cu", System.Data.SqlDbType.SmallInt, 2, "catc04cu"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc04ev", System.Data.SqlDbType.SmallInt, 2, "catc04ev"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc05cu", System.Data.SqlDbType.SmallInt, 2, "catc05cu"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc05ev", System.Data.SqlDbType.SmallInt, 2, "catc05ev"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc06cu", System.Data.SqlDbType.SmallInt, 2, "catc06cu"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc06ev", System.Data.SqlDbType.SmallInt, 2, "catc06ev"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc07cu", System.Data.SqlDbType.SmallInt, 2, "catc07cu"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc07ev", System.Data.SqlDbType.SmallInt, 2, "catc07ev"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc08cu", System.Data.SqlDbType.SmallInt, 2, "catc08cu"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc08ev", System.Data.SqlDbType.SmallInt, 2, "catc08ev"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc10", System.Data.SqlDbType.SmallInt, 2, "catc10"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc11", System.Data.SqlDbType.SmallInt, 2, "catc11"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc12", System.Data.SqlDbType.SmallInt, 2, "catc12"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catc13", System.Data.SqlDbType.SmallInt, 2, "catc13"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catccmt", System.Data.SqlDbType.NVarChar, 80, "catccmt"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@verified", System.Data.SqlDbType.Int, 4, "verified"));
			this.sqlUpdate.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CatCkey", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "CatCkey", System.Data.DataRowVersion.Original, null));
			// 
			// sqlUpdateVerified
			// 
			this.sqlUpdateVerified.CommandText = "UPDATE EDS_CatC SET verified = @verified WHERE (CatCkey = @catckey); SELECT * FRO" +
				"M eds_catc WHERE catckey = @catckey;";
			this.sqlUpdateVerified.Connection = this.sqlConn;
			this.sqlUpdateVerified.Parameters.Add(new System.Data.SqlClient.SqlParameter("@verified", System.Data.SqlDbType.Int, 4, "verified"));
			this.sqlUpdateVerified.Parameters.Add(new System.Data.SqlClient.SqlParameter("@catckey", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "CatCkey", System.Data.DataRowVersion.Original, null));
			// 
			// sqlLookup
			// 
			this.sqlLookup.CommandText = "SELECT EDS_CatC.* FROM EDS_CatC WHERE (edsid = @edsid) AND (indexnum = @indexnum " +
				"OR @indexnum IS NULL)";
			this.sqlLookup.Connection = this.sqlConn;
			this.sqlLookup.Parameters.Add(new System.Data.SqlClient.SqlParameter("@edsid", System.Data.SqlDbType.Int, 4, "edsid"));
			this.sqlLookup.Parameters.Add(new System.Data.SqlClient.SqlParameter("@indexnum", System.Data.SqlDbType.Int, 4, "indexnum"));
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		







	}
}
