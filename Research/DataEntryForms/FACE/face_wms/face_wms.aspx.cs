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

namespace face_wms
{
	/// <summary>
	/// Summary description for face_wms.
	/// </summary>
	public partial class face_wms : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlCommand sqlScoreWMS;
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		protected System.Data.SqlClient.SqlDataAdapter sqlDataAdapter1;
	
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
			this.sqlScoreWMS = new System.Data.SqlClient.SqlCommand();
			this.sqlSelectCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter1 = new System.Data.SqlClient.SqlDataAdapter();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreWMS
			// 
			this.sqlScoreWMS.CommandText = "dbo.[spScoreWMS]";
			this.sqlScoreWMS.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreWMS.Connection = this.sqlDataConnection;
			this.sqlScoreWMS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreWMS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wms_pk", System.Data.SqlDbType.Int, 4));
			this.sqlScoreWMS.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "SELECT wms_pk, wmsf2nsn, faceid, wmsdate, wmsdob, wmsageyr, wmsclin, wmsraw1, wms" +
				"raw2, wmsss1, wmsss2, wmsf1sy, wmsf1sn, wmsf1nsy, wmsf1nsn, wmsf2sy, wmsf2sn, wm" +
				"sf2nsy FROM FACE_WMS";
			this.sqlSelectCommand1.Connection = this.sqlDataConnection;
			// 
			// sqlInsertCommand1
			// 
			this.sqlInsertCommand1.CommandText = @"INSERT INTO FACE_WMS(wmsf2nsn, faceid, wmsdate, wmsdob, wmsageyr, wmsclin, wmsraw1, wmsraw2, wmsss1, wmsss2, wmsf1sy, wmsf1sn, wmsf1nsy, wmsf1nsn, wmsf2sy, wmsf2sn, wmsf2nsy) VALUES (@wmsf2nsn, @faceid, @wmsdate, @wmsdob, @wmsageyr, @wmsclin, @wmsraw1, @wmsraw2, @wmsss1, @wmsss2, @wmsf1sy, @wmsf1sn, @wmsf1nsy, @wmsf1nsn, @wmsf2sy, @wmsf2sn, @wmsf2nsy); SELECT wms_pk, wmsf2nsn, faceid, wmsdate, wmsdob, wmsageyr, wmsclin, wmsraw1, wmsraw2, wmsss1, wmsss2, wmsf1sy, wmsf1sn, wmsf1nsy, wmsf1nsn, wmsf2sy, wmsf2sn, wmsf2nsy FROM FACE_WMS WHERE (wms_pk = @@IDENTITY)";
			this.sqlInsertCommand1.Connection = this.sqlDataConnection;
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf2nsn", System.Data.SqlDbType.Int, 4, "wmsf2nsn"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@faceid", System.Data.SqlDbType.VarChar, 7, "faceid"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsdate", System.Data.SqlDbType.DateTime, 8, "wmsdate"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsdob", System.Data.SqlDbType.DateTime, 8, "wmsdob"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsageyr", System.Data.SqlDbType.Int, 4, "wmsageyr"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsclin", System.Data.SqlDbType.NVarChar, 50, "wmsclin"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsraw1", System.Data.SqlDbType.SmallInt, 2, "wmsraw1"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsraw2", System.Data.SqlDbType.SmallInt, 2, "wmsraw2"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsss1", System.Data.SqlDbType.Int, 4, "wmsss1"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsss2", System.Data.SqlDbType.Int, 4, "wmsss2"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf1sy", System.Data.SqlDbType.Int, 4, "wmsf1sy"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf1sn", System.Data.SqlDbType.Int, 4, "wmsf1sn"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf1nsy", System.Data.SqlDbType.Int, 4, "wmsf1nsy"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf1nsn", System.Data.SqlDbType.Int, 4, "wmsf1nsn"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf2sy", System.Data.SqlDbType.Int, 4, "wmsf2sy"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf2sn", System.Data.SqlDbType.Int, 4, "wmsf2sn"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf2nsy", System.Data.SqlDbType.Int, 4, "wmsf2nsy"));
			// 
			// sqlUpdateCommand1
			// 
			this.sqlUpdateCommand1.CommandText = "UPDATE FACE_WMS SET wmsf2nsn = @wmsf2nsn, faceid = @faceid, wmsdate = @wmsdate, w" +
				"msdob = @wmsdob, wmsageyr = @wmsageyr, wmsclin = @wmsclin, wmsraw1 = @wmsraw1, w" +
				"msraw2 = @wmsraw2, wmsss1 = @wmsss1, wmsss2 = @wmsss2, wmsf1sy = @wmsf1sy, wmsf1" +
				"sn = @wmsf1sn, wmsf1nsy = @wmsf1nsy, wmsf1nsn = @wmsf1nsn, wmsf2sy = @wmsf2sy, w" +
				"msf2sn = @wmsf2sn, wmsf2nsy = @wmsf2nsy WHERE (wms_pk = @Original_wms_pk) AND (f" +
				"aceid = @Original_faceid) AND (wmsageyr = @Original_wmsageyr OR @Original_wmsage" +
				"yr IS NULL AND wmsageyr IS NULL) AND (wmsclin = @Original_wmsclin OR @Original_w" +
				"msclin IS NULL AND wmsclin IS NULL) AND (wmsdate = @Original_wmsdate OR @Origina" +
				"l_wmsdate IS NULL AND wmsdate IS NULL) AND (wmsdob = @Original_wmsdob OR @Origin" +
				"al_wmsdob IS NULL AND wmsdob IS NULL) AND (wmsf1nsn = @Original_wmsf1nsn OR @Ori" +
				"ginal_wmsf1nsn IS NULL AND wmsf1nsn IS NULL) AND (wmsf1nsy = @Original_wmsf1nsy " +
				"OR @Original_wmsf1nsy IS NULL AND wmsf1nsy IS NULL) AND (wmsf1sn = @Original_wms" +
				"f1sn OR @Original_wmsf1sn IS NULL AND wmsf1sn IS NULL) AND (wmsf1sy = @Original_" +
				"wmsf1sy OR @Original_wmsf1sy IS NULL AND wmsf1sy IS NULL) AND (wmsf2nsn = @Origi" +
				"nal_wmsf2nsn OR @Original_wmsf2nsn IS NULL AND wmsf2nsn IS NULL) AND (wmsf2nsy =" +
				" @Original_wmsf2nsy OR @Original_wmsf2nsy IS NULL AND wmsf2nsy IS NULL) AND (wms" +
				"f2sn = @Original_wmsf2sn OR @Original_wmsf2sn IS NULL AND wmsf2sn IS NULL) AND (" +
				"wmsf2sy = @Original_wmsf2sy OR @Original_wmsf2sy IS NULL AND wmsf2sy IS NULL) AN" +
				"D (wmsraw1 = @Original_wmsraw1 OR @Original_wmsraw1 IS NULL AND wmsraw1 IS NULL)" +
				" AND (wmsraw2 = @Original_wmsraw2 OR @Original_wmsraw2 IS NULL AND wmsraw2 IS NU" +
				"LL) AND (wmsss1 = @Original_wmsss1 OR @Original_wmsss1 IS NULL AND wmsss1 IS NUL" +
				"L) AND (wmsss2 = @Original_wmsss2 OR @Original_wmsss2 IS NULL AND wmsss2 IS NULL" +
				"); SELECT wms_pk, wmsf2nsn, faceid, wmsdate, wmsdob, wmsageyr, wmsclin, wmsraw1," +
				" wmsraw2, wmsss1, wmsss2, wmsf1sy, wmsf1sn, wmsf1nsy, wmsf1nsn, wmsf2sy, wmsf2sn" +
				", wmsf2nsy FROM FACE_WMS WHERE (wms_pk = @wms_pk)";
			this.sqlUpdateCommand1.Connection = this.sqlDataConnection;
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf2nsn", System.Data.SqlDbType.Int, 4, "wmsf2nsn"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@faceid", System.Data.SqlDbType.VarChar, 7, "faceid"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsdate", System.Data.SqlDbType.DateTime, 8, "wmsdate"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsdob", System.Data.SqlDbType.DateTime, 8, "wmsdob"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsageyr", System.Data.SqlDbType.Int, 4, "wmsageyr"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsclin", System.Data.SqlDbType.NVarChar, 50, "wmsclin"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsraw1", System.Data.SqlDbType.SmallInt, 2, "wmsraw1"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsraw2", System.Data.SqlDbType.SmallInt, 2, "wmsraw2"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsss1", System.Data.SqlDbType.Int, 4, "wmsss1"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsss2", System.Data.SqlDbType.Int, 4, "wmsss2"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf1sy", System.Data.SqlDbType.Int, 4, "wmsf1sy"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf1sn", System.Data.SqlDbType.Int, 4, "wmsf1sn"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf1nsy", System.Data.SqlDbType.Int, 4, "wmsf1nsy"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf1nsn", System.Data.SqlDbType.Int, 4, "wmsf1nsn"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf2sy", System.Data.SqlDbType.Int, 4, "wmsf2sy"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf2sn", System.Data.SqlDbType.Int, 4, "wmsf2sn"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wmsf2nsy", System.Data.SqlDbType.Int, 4, "wmsf2nsy"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wms_pk", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wms_pk", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_faceid", System.Data.SqlDbType.VarChar, 7, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "faceid", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsageyr", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsageyr", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsclin", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsclin", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsdate", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsdate", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsdob", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsdob", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf1nsn", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf1nsn", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf1nsy", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf1nsy", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf1sn", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf1sn", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf1sy", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf1sy", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf2nsn", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf2nsn", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf2nsy", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf2nsy", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf2sn", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf2sn", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf2sy", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf2sy", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsraw1", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsraw1", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsraw2", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsraw2", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsss1", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsss1", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsss2", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsss2", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@wms_pk", System.Data.SqlDbType.Int, 4, "wms_pk"));
			// 
			// sqlDeleteCommand1
			// 
			this.sqlDeleteCommand1.CommandText = @"DELETE FROM FACE_WMS WHERE (wms_pk = @Original_wms_pk) AND (faceid = @Original_faceid) AND (wmsageyr = @Original_wmsageyr OR @Original_wmsageyr IS NULL AND wmsageyr IS NULL) AND (wmsclin = @Original_wmsclin OR @Original_wmsclin IS NULL AND wmsclin IS NULL) AND (wmsdate = @Original_wmsdate OR @Original_wmsdate IS NULL AND wmsdate IS NULL) AND (wmsdob = @Original_wmsdob OR @Original_wmsdob IS NULL AND wmsdob IS NULL) AND (wmsf1nsn = @Original_wmsf1nsn OR @Original_wmsf1nsn IS NULL AND wmsf1nsn IS NULL) AND (wmsf1nsy = @Original_wmsf1nsy OR @Original_wmsf1nsy IS NULL AND wmsf1nsy IS NULL) AND (wmsf1sn = @Original_wmsf1sn OR @Original_wmsf1sn IS NULL AND wmsf1sn IS NULL) AND (wmsf1sy = @Original_wmsf1sy OR @Original_wmsf1sy IS NULL AND wmsf1sy IS NULL) AND (wmsf2nsn = @Original_wmsf2nsn OR @Original_wmsf2nsn IS NULL AND wmsf2nsn IS NULL) AND (wmsf2nsy = @Original_wmsf2nsy OR @Original_wmsf2nsy IS NULL AND wmsf2nsy IS NULL) AND (wmsf2sn = @Original_wmsf2sn OR @Original_wmsf2sn IS NULL AND wmsf2sn IS NULL) AND (wmsf2sy = @Original_wmsf2sy OR @Original_wmsf2sy IS NULL AND wmsf2sy IS NULL) AND (wmsraw1 = @Original_wmsraw1 OR @Original_wmsraw1 IS NULL AND wmsraw1 IS NULL) AND (wmsraw2 = @Original_wmsraw2 OR @Original_wmsraw2 IS NULL AND wmsraw2 IS NULL) AND (wmsss1 = @Original_wmsss1 OR @Original_wmsss1 IS NULL AND wmsss1 IS NULL) AND (wmsss2 = @Original_wmsss2 OR @Original_wmsss2 IS NULL AND wmsss2 IS NULL)";
			this.sqlDeleteCommand1.Connection = this.sqlDataConnection;
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wms_pk", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wms_pk", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_faceid", System.Data.SqlDbType.VarChar, 7, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "faceid", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsageyr", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsageyr", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsclin", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsclin", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsdate", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsdate", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsdob", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsdob", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf1nsn", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf1nsn", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf1nsy", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf1nsy", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf1sn", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf1sn", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf1sy", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf1sy", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf2nsn", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf2nsn", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf2nsy", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf2nsy", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf2sn", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf2sn", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsf2sy", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsf2sy", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsraw1", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsraw1", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsraw2", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsraw2", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsss1", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsss1", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_wmsss2", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "wmsss2", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter1
			// 
			this.sqlDataAdapter1.DeleteCommand = this.sqlDeleteCommand1;
			this.sqlDataAdapter1.InsertCommand = this.sqlInsertCommand1;
			this.sqlDataAdapter1.SelectCommand = this.sqlSelectCommand1;
			this.sqlDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "FACE_WMS", new System.Data.Common.DataColumnMapping[] {
																																																				  new System.Data.Common.DataColumnMapping("wms_pk", "wms_pk"),
																																																				  new System.Data.Common.DataColumnMapping("wmsf2nsn", "wmsf2nsn"),
																																																				  new System.Data.Common.DataColumnMapping("faceid", "faceid"),
																																																				  new System.Data.Common.DataColumnMapping("wmsdate", "wmsdate"),
																																																				  new System.Data.Common.DataColumnMapping("wmsdob", "wmsdob"),
																																																				  new System.Data.Common.DataColumnMapping("wmsageyr", "wmsageyr"),
																																																				  new System.Data.Common.DataColumnMapping("wmsclin", "wmsclin"),
																																																				  new System.Data.Common.DataColumnMapping("wmsraw1", "wmsraw1"),
																																																				  new System.Data.Common.DataColumnMapping("wmsraw2", "wmsraw2"),
																																																				  new System.Data.Common.DataColumnMapping("wmsss1", "wmsss1"),
																																																				  new System.Data.Common.DataColumnMapping("wmsss2", "wmsss2"),
																																																				  new System.Data.Common.DataColumnMapping("wmsf1sy", "wmsf1sy"),
																																																				  new System.Data.Common.DataColumnMapping("wmsf1sn", "wmsf1sn"),
																																																				  new System.Data.Common.DataColumnMapping("wmsf1nsy", "wmsf1nsy"),
																																																				  new System.Data.Common.DataColumnMapping("wmsf1nsn", "wmsf1nsn"),
																																																				  new System.Data.Common.DataColumnMapping("wmsf2sy", "wmsf2sy"),
																																																				  new System.Data.Common.DataColumnMapping("wmsf2sn", "wmsf2sn"),
																																																				  new System.Data.Common.DataColumnMapping("wmsf2nsy", "wmsf2nsy")})});
			this.sqlDataAdapter1.UpdateCommand = this.sqlUpdateCommand1;
			this.PreRender += new System.EventHandler(this.face_wms_PreRender);

		}
		#endregion

		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				this.sqlScoreWMS.Parameters["@wms_pk"].Value =  DataEntryController1.PrimaryKeyVal;
				this.sqlScoreWMS.Parameters["@studyid"].Value = 1010;

				this.sqlDataConnection.Open();

				// this statement can throw an SqlException if any errors occur in spScoreMullen
				this.sqlScoreWMS.ExecuteNonQuery();

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

		protected void face_wms_PreRender(object sender, System.EventArgs e)
		{
			if (!this.IsPostBack && this.Request.QueryString["id"] != null)
			{
				DataEntryController1.LookupTextBox1Text = this.Request.QueryString["id"];
				DataEntryController1.ParameterLookup();
			}
		}
	}
}
