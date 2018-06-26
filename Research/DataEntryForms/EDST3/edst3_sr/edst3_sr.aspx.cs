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

namespace edst3_sr
{
	/// <summary>
	/// Summary description for edst3_sr.
	/// </summary>
	public partial class edst3_sr : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlCommand sqlScoreSpatialReversal;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		protected System.Data.SqlClient.SqlDataAdapter sqlDataAdapter1;
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
			this.sqlDataConnection = new System.Data.SqlClient.SqlConnection();
			this.sqlScoreSpatialReversal = new System.Data.SqlClient.SqlCommand();
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
			// sqlScoreSpatialReversal
			// 
			this.sqlScoreSpatialReversal.CommandText = "dbo.[spScoreSpatialReversal]";
			this.sqlScoreSpatialReversal.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreSpatialReversal.Connection = this.sqlDataConnection;
			this.sqlScoreSpatialReversal.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreSpatialReversal.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr_pk", System.Data.SqlDbType.Int, 4));
			this.sqlScoreSpatialReversal.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = @"SELECT sr_pk, edsid, date, exprmtr, srp, sr01, sr02, sr03, sr04, sr05, sr06, sr07, sr08, sr09, sr10, sr11, sr12, sr13, sr14, sr15, sr16, sr17, sr18, sr19, sr20, srrev1, srrev2, srrev3, srrev4, srbeh, srvld, srcmt, verified, r01, r02, r03, r04, r05, r06, r07, r08, r09, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, srtotco, srrevco, srrevtr, srcfc, srcfe, srrever, srefe, srefc, sr#cri, srgere, srg2co, srscor, created, createdBy, updated, updatedBy FROM EDST3_SR";
			this.sqlSelectCommand1.Connection = this.sqlDataConnection;
			// 
			// sqlInsertCommand1
			// 
			this.sqlInsertCommand1.CommandText = @"INSERT INTO EDST3_SR(edsid, date, exprmtr, srp, sr01, sr02, sr03, sr04, sr05, sr06, sr07, sr08, sr09, sr10, sr11, sr12, sr13, sr14, sr15, sr16, sr17, sr18, sr19, sr20, srrev1, srrev2, srrev3, srrev4, srbeh, srvld, srcmt, verified, r01, r02, r03, r04, r05, r06, r07, r08, r09, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, srtotco, srrevco, srrevtr, srcfc, srcfe, srrever, srefe, srefc, sr#cri, srgere, srg2co, srscor, created, createdBy, updated, updatedBy) VALUES (@edsid, @date, @exprmtr, @srp, @sr01, @sr02, @sr03, @sr04, @sr05, @sr06, @sr07, @sr08, @sr09, @sr10, @sr11, @sr12, @sr13, @sr14, @sr15, @sr16, @sr17, @sr18, @sr19, @sr20, @srrev1, @srrev2, @srrev3, @srrev4, @srbeh, @srvld, @srcmt, @verified, @r01, @r02, @r03, @r04, @r05, @r06, @r07, @r08, @r09, @r10, @r11, @r12, @r13, @r14, @r15, @r16, @r17, @r18, @r19, @r20, @srtotco, @srrevco, @srrevtr, @srcfc, @srcfe, @srrever, @srefe, @srefc, @sr#cri, @srgere, @srg2co, @srscor, @created, @createdBy, @updated, @updatedBy); SELECT sr_pk, edsid, date, exprmtr, srp, sr01, sr02, sr03, sr04, sr05, sr06, sr07, sr08, sr09, sr10, sr11, sr12, sr13, sr14, sr15, sr16, sr17, sr18, sr19, sr20, srrev1, srrev2, srrev3, srrev4, srbeh, srvld, srcmt, verified, r01, r02, r03, r04, r05, r06, r07, r08, r09, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, srtotco, srrevco, srrevtr, srcfc, srcfe, srrever, srefe, srefc, sr#cri, srgere, srg2co, srscor, created, createdBy, updated, updatedBy FROM EDST3_SR WHERE (sr_pk = @@IDENTITY)";
			this.sqlInsertCommand1.Connection = this.sqlDataConnection;
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@edsid", System.Data.SqlDbType.Int, 4, "edsid"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@date", System.Data.SqlDbType.DateTime, 8, "date"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@exprmtr", System.Data.SqlDbType.NVarChar, 50, "exprmtr"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srp", System.Data.SqlDbType.SmallInt, 2, "srp"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr01", System.Data.SqlDbType.SmallInt, 2, "sr01"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr02", System.Data.SqlDbType.SmallInt, 2, "sr02"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr03", System.Data.SqlDbType.SmallInt, 2, "sr03"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr04", System.Data.SqlDbType.SmallInt, 2, "sr04"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr05", System.Data.SqlDbType.SmallInt, 2, "sr05"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr06", System.Data.SqlDbType.SmallInt, 2, "sr06"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr07", System.Data.SqlDbType.SmallInt, 2, "sr07"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr08", System.Data.SqlDbType.SmallInt, 2, "sr08"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr09", System.Data.SqlDbType.SmallInt, 2, "sr09"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr10", System.Data.SqlDbType.SmallInt, 2, "sr10"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr11", System.Data.SqlDbType.SmallInt, 2, "sr11"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr12", System.Data.SqlDbType.SmallInt, 2, "sr12"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr13", System.Data.SqlDbType.SmallInt, 2, "sr13"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr14", System.Data.SqlDbType.SmallInt, 2, "sr14"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr15", System.Data.SqlDbType.SmallInt, 2, "sr15"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr16", System.Data.SqlDbType.SmallInt, 2, "sr16"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr17", System.Data.SqlDbType.SmallInt, 2, "sr17"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr18", System.Data.SqlDbType.SmallInt, 2, "sr18"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr19", System.Data.SqlDbType.SmallInt, 2, "sr19"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr20", System.Data.SqlDbType.SmallInt, 2, "sr20"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrev1", System.Data.SqlDbType.SmallInt, 2, "srrev1"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrev2", System.Data.SqlDbType.SmallInt, 2, "srrev2"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrev3", System.Data.SqlDbType.SmallInt, 2, "srrev3"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrev4", System.Data.SqlDbType.SmallInt, 2, "srrev4"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srbeh", System.Data.SqlDbType.NVarChar, 50, "srbeh"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srvld", System.Data.SqlDbType.SmallInt, 2, "srvld"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srcmt", System.Data.SqlDbType.NVarChar, 50, "srcmt"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@verified", System.Data.SqlDbType.SmallInt, 2, "verified"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r01", System.Data.SqlDbType.SmallInt, 2, "r01"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r02", System.Data.SqlDbType.SmallInt, 2, "r02"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r03", System.Data.SqlDbType.SmallInt, 2, "r03"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r04", System.Data.SqlDbType.SmallInt, 2, "r04"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r05", System.Data.SqlDbType.SmallInt, 2, "r05"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r06", System.Data.SqlDbType.SmallInt, 2, "r06"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r07", System.Data.SqlDbType.SmallInt, 2, "r07"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r08", System.Data.SqlDbType.SmallInt, 2, "r08"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r09", System.Data.SqlDbType.SmallInt, 2, "r09"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r10", System.Data.SqlDbType.SmallInt, 2, "r10"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r11", System.Data.SqlDbType.SmallInt, 2, "r11"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r12", System.Data.SqlDbType.SmallInt, 2, "r12"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r13", System.Data.SqlDbType.SmallInt, 2, "r13"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r14", System.Data.SqlDbType.SmallInt, 2, "r14"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r15", System.Data.SqlDbType.SmallInt, 2, "r15"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r16", System.Data.SqlDbType.SmallInt, 2, "r16"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r17", System.Data.SqlDbType.SmallInt, 2, "r17"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r18", System.Data.SqlDbType.SmallInt, 2, "r18"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r19", System.Data.SqlDbType.SmallInt, 2, "r19"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r20", System.Data.SqlDbType.SmallInt, 2, "r20"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srtotco", System.Data.SqlDbType.Int, 4, "srtotco"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrevco", System.Data.SqlDbType.Int, 4, "srrevco"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrevtr", System.Data.SqlDbType.Int, 4, "srrevtr"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srcfc", System.Data.SqlDbType.Int, 4, "srcfc"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srcfe", System.Data.SqlDbType.Int, 4, "srcfe"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrever", System.Data.SqlDbType.Int, 4, "srrever"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srefe", System.Data.SqlDbType.Int, 4, "srefe"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srefc", System.Data.SqlDbType.Int, 4, "srefc"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr#cri", System.Data.SqlDbType.Int, 4, "sr#cri"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srgere", System.Data.SqlDbType.Int, 4, "srgere"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srg2co", System.Data.SqlDbType.Int, 4, "srg2co"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srscor", System.Data.SqlDbType.NVarChar, 12, "srscor"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@created", System.Data.SqlDbType.DateTime, 8, "created"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@createdBy", System.Data.SqlDbType.VarChar, 50, "createdBy"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@updated", System.Data.SqlDbType.DateTime, 8, "updated"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@updatedBy", System.Data.SqlDbType.VarChar, 50, "updatedBy"));
			// 
			// sqlUpdateCommand1
			// 
			this.sqlUpdateCommand1.CommandText = "UPDATE EDST3_SR SET edsid = @edsid, date = @date, exprmtr = @exprmtr, srp = @srp," +
				" sr01 = @sr01, sr02 = @sr02, sr03 = @sr03, sr04 = @sr04, sr05 = @sr05, sr06 = @s" +
				"r06, sr07 = @sr07, sr08 = @sr08, sr09 = @sr09, sr10 = @sr10, sr11 = @sr11, sr12 " +
				"= @sr12, sr13 = @sr13, sr14 = @sr14, sr15 = @sr15, sr16 = @sr16, sr17 = @sr17, s" +
				"r18 = @sr18, sr19 = @sr19, sr20 = @sr20, srrev1 = @srrev1, srrev2 = @srrev2, srr" +
				"ev3 = @srrev3, srrev4 = @srrev4, srbeh = @srbeh, srvld = @srvld, srcmt = @srcmt," +
				" verified = @verified, r01 = @r01, r02 = @r02, r03 = @r03, r04 = @r04, r05 = @r0" +
				"5, r06 = @r06, r07 = @r07, r08 = @r08, r09 = @r09, r10 = @r10, r11 = @r11, r12 =" +
				" @r12, r13 = @r13, r14 = @r14, r15 = @r15, r16 = @r16, r17 = @r17, r18 = @r18, r" +
				"19 = @r19, r20 = @r20, srtotco = @srtotco, srrevco = @srrevco, srrevtr = @srrevt" +
				"r, srcfc = @srcfc, srcfe = @srcfe, srrever = @srrever, srefe = @srefe, srefc = @" +
				"srefc, sr#cri = @sr#cri, srgere = @srgere, srg2co = @srg2co, srscor = @srscor, c" +
				"reated = @created, createdBy = @createdBy, updated = @updated, updatedBy = @upda" +
				"tedBy WHERE (sr_pk = @Original_sr_pk) AND (created = @Original_created OR @Origi" +
				"nal_created IS NULL AND created IS NULL) AND (createdBy = @Original_createdBy OR" +
				" @Original_createdBy IS NULL AND createdBy IS NULL) AND (date = @Original_date O" +
				"R @Original_date IS NULL AND date IS NULL) AND (edsid = @Original_edsid) AND (ex" +
				"prmtr = @Original_exprmtr OR @Original_exprmtr IS NULL AND exprmtr IS NULL) AND " +
				"(r01 = @Original_r01 OR @Original_r01 IS NULL AND r01 IS NULL) AND (r02 = @Origi" +
				"nal_r02 OR @Original_r02 IS NULL AND r02 IS NULL) AND (r03 = @Original_r03 OR @O" +
				"riginal_r03 IS NULL AND r03 IS NULL) AND (r04 = @Original_r04 OR @Original_r04 I" +
				"S NULL AND r04 IS NULL) AND (r05 = @Original_r05 OR @Original_r05 IS NULL AND r0" +
				"5 IS NULL) AND (r06 = @Original_r06 OR @Original_r06 IS NULL AND r06 IS NULL) AN" +
				"D (r07 = @Original_r07 OR @Original_r07 IS NULL AND r07 IS NULL) AND (r08 = @Ori" +
				"ginal_r08 OR @Original_r08 IS NULL AND r08 IS NULL) AND (r09 = @Original_r09 OR " +
				"@Original_r09 IS NULL AND r09 IS NULL) AND (r10 = @Original_r10 OR @Original_r10" +
				" IS NULL AND r10 IS NULL) AND (r11 = @Original_r11 OR @Original_r11 IS NULL AND " +
				"r11 IS NULL) AND (r12 = @Original_r12 OR @Original_r12 IS NULL AND r12 IS NULL) " +
				"AND (r13 = @Original_r13 OR @Original_r13 IS NULL AND r13 IS NULL) AND (r14 = @O" +
				"riginal_r14 OR @Original_r14 IS NULL AND r14 IS NULL) AND (r15 = @Original_r15 O" +
				"R @Original_r15 IS NULL AND r15 IS NULL) AND (r16 = @Original_r16 OR @Original_r" +
				"16 IS NULL AND r16 IS NULL) AND (r17 = @Original_r17 OR @Original_r17 IS NULL AN" +
				"D r17 IS NULL) AND (r18 = @Original_r18 OR @Original_r18 IS NULL AND r18 IS NULL" +
				") AND (r19 = @Original_r19 OR @Original_r19 IS NULL AND r19 IS NULL) AND (r20 = " +
				"@Original_r20 OR @Original_r20 IS NULL AND r20 IS NULL) AND (sr#cri = @Original_" +
				"sr_cri OR @Original_sr_cri IS NULL AND sr#cri IS NULL) AND (sr01 = @Original_sr0" +
				"1 OR @Original_sr01 IS NULL AND sr01 IS NULL) AND (sr02 = @Original_sr02 OR @Ori" +
				"ginal_sr02 IS NULL AND sr02 IS NULL) AND (sr03 = @Original_sr03 OR @Original_sr0" +
				"3 IS NULL AND sr03 IS NULL) AND (sr04 = @Original_sr04 OR @Original_sr04 IS NULL" +
				" AND sr04 IS NULL) AND (sr05 = @Original_sr05 OR @Original_sr05 IS NULL AND sr05" +
				" IS NULL) AND (sr06 = @Original_sr06 OR @Original_sr06 IS NULL AND sr06 IS NULL)" +
				" AND (sr07 = @Original_sr07 OR @Original_sr07 IS NULL AND sr07 IS NULL) AND (sr0" +
				"8 = @Original_sr08 OR @Original_sr08 IS NULL AND sr08 IS NULL) AND (sr09 = @Orig" +
				"inal_sr09 OR @Original_sr09 IS NULL AND sr09 IS NULL) AND (sr10 = @Original_sr10" +
				" OR @Original_sr10 IS NULL AND sr10 IS NULL) AND (sr11 = @Original_sr11 OR @Orig" +
				"inal_sr11 IS NULL AND sr11 IS NULL) AND (sr12 = @Original_sr12 OR @Original_sr12" +
				" IS NULL AND sr12 IS NULL) AND (sr13 = @Original_sr13 OR @Original_sr13 IS NULL " +
				"AND sr13 IS NULL) AND (sr14 = @Original_sr14 OR @Original_sr14 IS NULL AND sr14 " +
				"IS NULL) AND (sr15 = @Original_sr15 OR @Original_sr15 IS NULL AND sr15 IS NULL) " +
				"AND (sr16 = @Original_sr16 OR @Original_sr16 IS NULL AND sr16 IS NULL) AND (sr17" +
				" = @Original_sr17 OR @Original_sr17 IS NULL AND sr17 IS NULL) AND (sr18 = @Origi" +
				"nal_sr18 OR @Original_sr18 IS NULL AND sr18 IS NULL) AND (sr19 = @Original_sr19 " +
				"OR @Original_sr19 IS NULL AND sr19 IS NULL) AND (sr20 = @Original_sr20 OR @Origi" +
				"nal_sr20 IS NULL AND sr20 IS NULL) AND (srbeh = @Original_srbeh OR @Original_srb" +
				"eh IS NULL AND srbeh IS NULL) AND (srcfc = @Original_srcfc OR @Original_srcfc IS" +
				" NULL AND srcfc IS NULL) AND (srcfe = @Original_srcfe OR @Original_srcfe IS NULL" +
				" AND srcfe IS NULL) AND (srcmt = @Original_srcmt OR @Original_srcmt IS NULL AND " +
				"srcmt IS NULL) AND (srefc = @Original_srefc OR @Original_srefc IS NULL AND srefc" +
				" IS NULL) AND (srefe = @Original_srefe OR @Original_srefe IS NULL AND srefe IS N" +
				"ULL) AND (srg2co = @Original_srg2co OR @Original_srg2co IS NULL AND srg2co IS NU" +
				"LL) AND (srgere = @Original_srgere OR @Original_srgere IS NULL AND srgere IS NUL" +
				"L) AND (srp = @Original_srp OR @Original_srp IS NULL AND srp IS NULL) AND (srrev" +
				"1 = @Original_srrev1 OR @Original_srrev1 IS NULL AND srrev1 IS NULL) AND (srrev2" +
				" = @Original_srrev2 OR @Original_srrev2 IS NULL AND srrev2 IS NULL) AND (srrev3 " +
				"= @Original_srrev3 OR @Original_srrev3 IS NULL AND srrev3 IS NULL) AND (srrev4 =" +
				" @Original_srrev4 OR @Original_srrev4 IS NULL AND srrev4 IS NULL) AND (srrevco =" +
				" @Original_srrevco OR @Original_srrevco IS NULL AND srrevco IS NULL) AND (srreve" +
				"r = @Original_srrever OR @Original_srrever IS NULL AND srrever IS NULL) AND (srr" +
				"evtr = @Original_srrevtr OR @Original_srrevtr IS NULL AND srrevtr IS NULL) AND (" +
				"srscor = @Original_srscor OR @Original_srscor IS NULL AND srscor IS NULL) AND (s" +
				"rtotco = @Original_srtotco OR @Original_srtotco IS NULL AND srtotco IS NULL) AND" +
				" (srvld = @Original_srvld OR @Original_srvld IS NULL AND srvld IS NULL) AND (upd" +
				"ated = @Original_updated OR @Original_updated IS NULL AND updated IS NULL) AND (" +
				"updatedBy = @Original_updatedBy OR @Original_updatedBy IS NULL AND updatedBy IS " +
				"NULL) AND (verified = @Original_verified OR @Original_verified IS NULL AND verif" +
				"ied IS NULL); SELECT sr_pk, edsid, date, exprmtr, srp, sr01, sr02, sr03, sr04, s" +
				"r05, sr06, sr07, sr08, sr09, sr10, sr11, sr12, sr13, sr14, sr15, sr16, sr17, sr1" +
				"8, sr19, sr20, srrev1, srrev2, srrev3, srrev4, srbeh, srvld, srcmt, verified, r0" +
				"1, r02, r03, r04, r05, r06, r07, r08, r09, r10, r11, r12, r13, r14, r15, r16, r1" +
				"7, r18, r19, r20, srtotco, srrevco, srrevtr, srcfc, srcfe, srrever, srefe, srefc" +
				", sr#cri, srgere, srg2co, srscor, created, createdBy, updated, updatedBy FROM ED" +
				"ST3_SR WHERE (sr_pk = @sr_pk)";
			this.sqlUpdateCommand1.Connection = this.sqlDataConnection;
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@edsid", System.Data.SqlDbType.Int, 4, "edsid"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@date", System.Data.SqlDbType.DateTime, 8, "date"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@exprmtr", System.Data.SqlDbType.NVarChar, 50, "exprmtr"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srp", System.Data.SqlDbType.SmallInt, 2, "srp"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr01", System.Data.SqlDbType.SmallInt, 2, "sr01"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr02", System.Data.SqlDbType.SmallInt, 2, "sr02"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr03", System.Data.SqlDbType.SmallInt, 2, "sr03"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr04", System.Data.SqlDbType.SmallInt, 2, "sr04"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr05", System.Data.SqlDbType.SmallInt, 2, "sr05"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr06", System.Data.SqlDbType.SmallInt, 2, "sr06"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr07", System.Data.SqlDbType.SmallInt, 2, "sr07"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr08", System.Data.SqlDbType.SmallInt, 2, "sr08"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr09", System.Data.SqlDbType.SmallInt, 2, "sr09"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr10", System.Data.SqlDbType.SmallInt, 2, "sr10"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr11", System.Data.SqlDbType.SmallInt, 2, "sr11"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr12", System.Data.SqlDbType.SmallInt, 2, "sr12"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr13", System.Data.SqlDbType.SmallInt, 2, "sr13"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr14", System.Data.SqlDbType.SmallInt, 2, "sr14"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr15", System.Data.SqlDbType.SmallInt, 2, "sr15"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr16", System.Data.SqlDbType.SmallInt, 2, "sr16"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr17", System.Data.SqlDbType.SmallInt, 2, "sr17"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr18", System.Data.SqlDbType.SmallInt, 2, "sr18"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr19", System.Data.SqlDbType.SmallInt, 2, "sr19"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr20", System.Data.SqlDbType.SmallInt, 2, "sr20"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrev1", System.Data.SqlDbType.SmallInt, 2, "srrev1"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrev2", System.Data.SqlDbType.SmallInt, 2, "srrev2"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrev3", System.Data.SqlDbType.SmallInt, 2, "srrev3"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrev4", System.Data.SqlDbType.SmallInt, 2, "srrev4"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srbeh", System.Data.SqlDbType.NVarChar, 50, "srbeh"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srvld", System.Data.SqlDbType.SmallInt, 2, "srvld"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srcmt", System.Data.SqlDbType.NVarChar, 50, "srcmt"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@verified", System.Data.SqlDbType.SmallInt, 2, "verified"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r01", System.Data.SqlDbType.SmallInt, 2, "r01"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r02", System.Data.SqlDbType.SmallInt, 2, "r02"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r03", System.Data.SqlDbType.SmallInt, 2, "r03"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r04", System.Data.SqlDbType.SmallInt, 2, "r04"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r05", System.Data.SqlDbType.SmallInt, 2, "r05"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r06", System.Data.SqlDbType.SmallInt, 2, "r06"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r07", System.Data.SqlDbType.SmallInt, 2, "r07"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r08", System.Data.SqlDbType.SmallInt, 2, "r08"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r09", System.Data.SqlDbType.SmallInt, 2, "r09"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r10", System.Data.SqlDbType.SmallInt, 2, "r10"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r11", System.Data.SqlDbType.SmallInt, 2, "r11"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r12", System.Data.SqlDbType.SmallInt, 2, "r12"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r13", System.Data.SqlDbType.SmallInt, 2, "r13"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r14", System.Data.SqlDbType.SmallInt, 2, "r14"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r15", System.Data.SqlDbType.SmallInt, 2, "r15"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r16", System.Data.SqlDbType.SmallInt, 2, "r16"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r17", System.Data.SqlDbType.SmallInt, 2, "r17"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r18", System.Data.SqlDbType.SmallInt, 2, "r18"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r19", System.Data.SqlDbType.SmallInt, 2, "r19"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@r20", System.Data.SqlDbType.SmallInt, 2, "r20"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srtotco", System.Data.SqlDbType.Int, 4, "srtotco"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrevco", System.Data.SqlDbType.Int, 4, "srrevco"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrevtr", System.Data.SqlDbType.Int, 4, "srrevtr"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srcfc", System.Data.SqlDbType.Int, 4, "srcfc"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srcfe", System.Data.SqlDbType.Int, 4, "srcfe"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srrever", System.Data.SqlDbType.Int, 4, "srrever"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srefe", System.Data.SqlDbType.Int, 4, "srefe"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srefc", System.Data.SqlDbType.Int, 4, "srefc"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr#cri", System.Data.SqlDbType.Int, 4, "sr#cri"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srgere", System.Data.SqlDbType.Int, 4, "srgere"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srg2co", System.Data.SqlDbType.Int, 4, "srg2co"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@srscor", System.Data.SqlDbType.NVarChar, 12, "srscor"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@created", System.Data.SqlDbType.DateTime, 8, "created"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@createdBy", System.Data.SqlDbType.VarChar, 50, "createdBy"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@updated", System.Data.SqlDbType.DateTime, 8, "updated"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@updatedBy", System.Data.SqlDbType.VarChar, 50, "updatedBy"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr_pk", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr_pk", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_created", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "created", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_createdBy", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "createdBy", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_date", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "date", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_edsid", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "edsid", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_exprmtr", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "exprmtr", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r01", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r01", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r02", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r02", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r03", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r03", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r04", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r04", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r05", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r05", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r06", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r06", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r07", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r07", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r08", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r08", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r09", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r09", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r10", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r10", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r11", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r11", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r12", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r12", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r13", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r13", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r14", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r14", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r15", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r15", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r16", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r16", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r17", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r17", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r18", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r18", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r19", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r19", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r20", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r20", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr_cri", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr#cri", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr01", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr01", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr02", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr02", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr03", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr03", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr04", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr04", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr05", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr05", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr06", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr06", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr07", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr07", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr08", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr08", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr09", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr09", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr10", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr10", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr11", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr11", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr12", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr12", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr13", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr13", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr14", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr14", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr15", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr15", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr16", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr16", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr17", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr17", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr18", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr18", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr19", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr19", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr20", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr20", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srbeh", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srbeh", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srcfc", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srcfc", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srcfe", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srcfe", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srcmt", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srcmt", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srefc", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srefc", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srefe", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srefe", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srg2co", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srg2co", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srgere", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srgere", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srp", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srp", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrev1", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrev1", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrev2", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrev2", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrev3", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrev3", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrev4", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrev4", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrevco", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrevco", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrever", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrever", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrevtr", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrevtr", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srscor", System.Data.SqlDbType.NVarChar, 12, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srscor", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srtotco", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srtotco", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srvld", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srvld", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_updated", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "updated", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_updatedBy", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "updatedBy", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_verified", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "verified", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sr_pk", System.Data.SqlDbType.Int, 4, "sr_pk"));
			// 
			// sqlDeleteCommand1
			// 
			this.sqlDeleteCommand1.CommandText = "DELETE FROM EDST3_SR WHERE (sr_pk = @Original_sr_pk) AND (created = @Original_cre" +
				"ated OR @Original_created IS NULL AND created IS NULL) AND (createdBy = @Origina" +
				"l_createdBy OR @Original_createdBy IS NULL AND createdBy IS NULL) AND (date = @O" +
				"riginal_date OR @Original_date IS NULL AND date IS NULL) AND (edsid = @Original_" +
				"edsid) AND (exprmtr = @Original_exprmtr OR @Original_exprmtr IS NULL AND exprmtr" +
				" IS NULL) AND (r01 = @Original_r01 OR @Original_r01 IS NULL AND r01 IS NULL) AND" +
				" (r02 = @Original_r02 OR @Original_r02 IS NULL AND r02 IS NULL) AND (r03 = @Orig" +
				"inal_r03 OR @Original_r03 IS NULL AND r03 IS NULL) AND (r04 = @Original_r04 OR @" +
				"Original_r04 IS NULL AND r04 IS NULL) AND (r05 = @Original_r05 OR @Original_r05 " +
				"IS NULL AND r05 IS NULL) AND (r06 = @Original_r06 OR @Original_r06 IS NULL AND r" +
				"06 IS NULL) AND (r07 = @Original_r07 OR @Original_r07 IS NULL AND r07 IS NULL) A" +
				"ND (r08 = @Original_r08 OR @Original_r08 IS NULL AND r08 IS NULL) AND (r09 = @Or" +
				"iginal_r09 OR @Original_r09 IS NULL AND r09 IS NULL) AND (r10 = @Original_r10 OR" +
				" @Original_r10 IS NULL AND r10 IS NULL) AND (r11 = @Original_r11 OR @Original_r1" +
				"1 IS NULL AND r11 IS NULL) AND (r12 = @Original_r12 OR @Original_r12 IS NULL AND" +
				" r12 IS NULL) AND (r13 = @Original_r13 OR @Original_r13 IS NULL AND r13 IS NULL)" +
				" AND (r14 = @Original_r14 OR @Original_r14 IS NULL AND r14 IS NULL) AND (r15 = @" +
				"Original_r15 OR @Original_r15 IS NULL AND r15 IS NULL) AND (r16 = @Original_r16 " +
				"OR @Original_r16 IS NULL AND r16 IS NULL) AND (r17 = @Original_r17 OR @Original_" +
				"r17 IS NULL AND r17 IS NULL) AND (r18 = @Original_r18 OR @Original_r18 IS NULL A" +
				"ND r18 IS NULL) AND (r19 = @Original_r19 OR @Original_r19 IS NULL AND r19 IS NUL" +
				"L) AND (r20 = @Original_r20 OR @Original_r20 IS NULL AND r20 IS NULL) AND (sr#cr" +
				"i = @Original_sr_cri OR @Original_sr_cri IS NULL AND sr#cri IS NULL) AND (sr01 =" +
				" @Original_sr01 OR @Original_sr01 IS NULL AND sr01 IS NULL) AND (sr02 = @Origina" +
				"l_sr02 OR @Original_sr02 IS NULL AND sr02 IS NULL) AND (sr03 = @Original_sr03 OR" +
				" @Original_sr03 IS NULL AND sr03 IS NULL) AND (sr04 = @Original_sr04 OR @Origina" +
				"l_sr04 IS NULL AND sr04 IS NULL) AND (sr05 = @Original_sr05 OR @Original_sr05 IS" +
				" NULL AND sr05 IS NULL) AND (sr06 = @Original_sr06 OR @Original_sr06 IS NULL AND" +
				" sr06 IS NULL) AND (sr07 = @Original_sr07 OR @Original_sr07 IS NULL AND sr07 IS " +
				"NULL) AND (sr08 = @Original_sr08 OR @Original_sr08 IS NULL AND sr08 IS NULL) AND" +
				" (sr09 = @Original_sr09 OR @Original_sr09 IS NULL AND sr09 IS NULL) AND (sr10 = " +
				"@Original_sr10 OR @Original_sr10 IS NULL AND sr10 IS NULL) AND (sr11 = @Original" +
				"_sr11 OR @Original_sr11 IS NULL AND sr11 IS NULL) AND (sr12 = @Original_sr12 OR " +
				"@Original_sr12 IS NULL AND sr12 IS NULL) AND (sr13 = @Original_sr13 OR @Original" +
				"_sr13 IS NULL AND sr13 IS NULL) AND (sr14 = @Original_sr14 OR @Original_sr14 IS " +
				"NULL AND sr14 IS NULL) AND (sr15 = @Original_sr15 OR @Original_sr15 IS NULL AND " +
				"sr15 IS NULL) AND (sr16 = @Original_sr16 OR @Original_sr16 IS NULL AND sr16 IS N" +
				"ULL) AND (sr17 = @Original_sr17 OR @Original_sr17 IS NULL AND sr17 IS NULL) AND " +
				"(sr18 = @Original_sr18 OR @Original_sr18 IS NULL AND sr18 IS NULL) AND (sr19 = @" +
				"Original_sr19 OR @Original_sr19 IS NULL AND sr19 IS NULL) AND (sr20 = @Original_" +
				"sr20 OR @Original_sr20 IS NULL AND sr20 IS NULL) AND (srbeh = @Original_srbeh OR" +
				" @Original_srbeh IS NULL AND srbeh IS NULL) AND (srcfc = @Original_srcfc OR @Ori" +
				"ginal_srcfc IS NULL AND srcfc IS NULL) AND (srcfe = @Original_srcfe OR @Original" +
				"_srcfe IS NULL AND srcfe IS NULL) AND (srcmt = @Original_srcmt OR @Original_srcm" +
				"t IS NULL AND srcmt IS NULL) AND (srefc = @Original_srefc OR @Original_srefc IS " +
				"NULL AND srefc IS NULL) AND (srefe = @Original_srefe OR @Original_srefe IS NULL " +
				"AND srefe IS NULL) AND (srg2co = @Original_srg2co OR @Original_srg2co IS NULL AN" +
				"D srg2co IS NULL) AND (srgere = @Original_srgere OR @Original_srgere IS NULL AND" +
				" srgere IS NULL) AND (srp = @Original_srp OR @Original_srp IS NULL AND srp IS NU" +
				"LL) AND (srrev1 = @Original_srrev1 OR @Original_srrev1 IS NULL AND srrev1 IS NUL" +
				"L) AND (srrev2 = @Original_srrev2 OR @Original_srrev2 IS NULL AND srrev2 IS NULL" +
				") AND (srrev3 = @Original_srrev3 OR @Original_srrev3 IS NULL AND srrev3 IS NULL)" +
				" AND (srrev4 = @Original_srrev4 OR @Original_srrev4 IS NULL AND srrev4 IS NULL) " +
				"AND (srrevco = @Original_srrevco OR @Original_srrevco IS NULL AND srrevco IS NUL" +
				"L) AND (srrever = @Original_srrever OR @Original_srrever IS NULL AND srrever IS " +
				"NULL) AND (srrevtr = @Original_srrevtr OR @Original_srrevtr IS NULL AND srrevtr " +
				"IS NULL) AND (srscor = @Original_srscor OR @Original_srscor IS NULL AND srscor I" +
				"S NULL) AND (srtotco = @Original_srtotco OR @Original_srtotco IS NULL AND srtotc" +
				"o IS NULL) AND (srvld = @Original_srvld OR @Original_srvld IS NULL AND srvld IS " +
				"NULL) AND (updated = @Original_updated OR @Original_updated IS NULL AND updated " +
				"IS NULL) AND (updatedBy = @Original_updatedBy OR @Original_updatedBy IS NULL AND" +
				" updatedBy IS NULL) AND (verified = @Original_verified OR @Original_verified IS " +
				"NULL AND verified IS NULL)";
			this.sqlDeleteCommand1.Connection = this.sqlDataConnection;
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr_pk", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr_pk", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_created", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "created", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_createdBy", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "createdBy", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_date", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "date", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_edsid", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "edsid", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_exprmtr", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "exprmtr", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r01", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r01", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r02", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r02", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r03", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r03", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r04", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r04", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r05", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r05", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r06", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r06", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r07", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r07", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r08", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r08", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r09", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r09", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r10", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r10", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r11", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r11", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r12", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r12", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r13", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r13", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r14", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r14", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r15", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r15", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r16", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r16", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r17", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r17", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r18", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r18", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r19", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r19", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_r20", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "r20", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr_cri", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr#cri", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr01", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr01", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr02", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr02", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr03", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr03", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr04", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr04", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr05", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr05", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr06", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr06", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr07", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr07", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr08", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr08", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr09", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr09", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr10", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr10", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr11", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr11", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr12", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr12", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr13", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr13", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr14", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr14", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr15", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr15", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr16", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr16", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr17", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr17", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr18", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr18", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr19", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr19", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_sr20", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "sr20", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srbeh", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srbeh", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srcfc", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srcfc", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srcfe", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srcfe", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srcmt", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srcmt", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srefc", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srefc", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srefe", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srefe", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srg2co", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srg2co", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srgere", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srgere", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srp", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srp", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrev1", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrev1", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrev2", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrev2", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrev3", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrev3", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrev4", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrev4", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrevco", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrevco", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrever", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrever", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srrevtr", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srrevtr", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srscor", System.Data.SqlDbType.NVarChar, 12, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srscor", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srtotco", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srtotco", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_srvld", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "srvld", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_updated", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "updated", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_updatedBy", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "updatedBy", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_verified", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "verified", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter1
			// 
			this.sqlDataAdapter1.DeleteCommand = this.sqlDeleteCommand1;
			this.sqlDataAdapter1.InsertCommand = this.sqlInsertCommand1;
			this.sqlDataAdapter1.SelectCommand = this.sqlSelectCommand1;
			this.sqlDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "EDST3_SR", new System.Data.Common.DataColumnMapping[] {
																																																				  new System.Data.Common.DataColumnMapping("sr_pk", "sr_pk"),
																																																				  new System.Data.Common.DataColumnMapping("edsid", "edsid"),
																																																				  new System.Data.Common.DataColumnMapping("date", "date"),
																																																				  new System.Data.Common.DataColumnMapping("exprmtr", "exprmtr"),
																																																				  new System.Data.Common.DataColumnMapping("srp", "srp"),
																																																				  new System.Data.Common.DataColumnMapping("sr01", "sr01"),
																																																				  new System.Data.Common.DataColumnMapping("sr02", "sr02"),
																																																				  new System.Data.Common.DataColumnMapping("sr03", "sr03"),
																																																				  new System.Data.Common.DataColumnMapping("sr04", "sr04"),
																																																				  new System.Data.Common.DataColumnMapping("sr05", "sr05"),
																																																				  new System.Data.Common.DataColumnMapping("sr06", "sr06"),
																																																				  new System.Data.Common.DataColumnMapping("sr07", "sr07"),
																																																				  new System.Data.Common.DataColumnMapping("sr08", "sr08"),
																																																				  new System.Data.Common.DataColumnMapping("sr09", "sr09"),
																																																				  new System.Data.Common.DataColumnMapping("sr10", "sr10"),
																																																				  new System.Data.Common.DataColumnMapping("sr11", "sr11"),
																																																				  new System.Data.Common.DataColumnMapping("sr12", "sr12"),
																																																				  new System.Data.Common.DataColumnMapping("sr13", "sr13"),
																																																				  new System.Data.Common.DataColumnMapping("sr14", "sr14"),
																																																				  new System.Data.Common.DataColumnMapping("sr15", "sr15"),
																																																				  new System.Data.Common.DataColumnMapping("sr16", "sr16"),
																																																				  new System.Data.Common.DataColumnMapping("sr17", "sr17"),
																																																				  new System.Data.Common.DataColumnMapping("sr18", "sr18"),
																																																				  new System.Data.Common.DataColumnMapping("sr19", "sr19"),
																																																				  new System.Data.Common.DataColumnMapping("sr20", "sr20"),
																																																				  new System.Data.Common.DataColumnMapping("srrev1", "srrev1"),
																																																				  new System.Data.Common.DataColumnMapping("srrev2", "srrev2"),
																																																				  new System.Data.Common.DataColumnMapping("srrev3", "srrev3"),
																																																				  new System.Data.Common.DataColumnMapping("srrev4", "srrev4"),
																																																				  new System.Data.Common.DataColumnMapping("srbeh", "srbeh"),
																																																				  new System.Data.Common.DataColumnMapping("srvld", "srvld"),
																																																				  new System.Data.Common.DataColumnMapping("srcmt", "srcmt"),
																																																				  new System.Data.Common.DataColumnMapping("verified", "verified"),
																																																				  new System.Data.Common.DataColumnMapping("r01", "r01"),
																																																				  new System.Data.Common.DataColumnMapping("r02", "r02"),
																																																				  new System.Data.Common.DataColumnMapping("r03", "r03"),
																																																				  new System.Data.Common.DataColumnMapping("r04", "r04"),
																																																				  new System.Data.Common.DataColumnMapping("r05", "r05"),
																																																				  new System.Data.Common.DataColumnMapping("r06", "r06"),
																																																				  new System.Data.Common.DataColumnMapping("r07", "r07"),
																																																				  new System.Data.Common.DataColumnMapping("r08", "r08"),
																																																				  new System.Data.Common.DataColumnMapping("r09", "r09"),
																																																				  new System.Data.Common.DataColumnMapping("r10", "r10"),
																																																				  new System.Data.Common.DataColumnMapping("r11", "r11"),
																																																				  new System.Data.Common.DataColumnMapping("r12", "r12"),
																																																				  new System.Data.Common.DataColumnMapping("r13", "r13"),
																																																				  new System.Data.Common.DataColumnMapping("r14", "r14"),
																																																				  new System.Data.Common.DataColumnMapping("r15", "r15"),
																																																				  new System.Data.Common.DataColumnMapping("r16", "r16"),
																																																				  new System.Data.Common.DataColumnMapping("r17", "r17"),
																																																				  new System.Data.Common.DataColumnMapping("r18", "r18"),
																																																				  new System.Data.Common.DataColumnMapping("r19", "r19"),
																																																				  new System.Data.Common.DataColumnMapping("r20", "r20"),
																																																				  new System.Data.Common.DataColumnMapping("srtotco", "srtotco"),
																																																				  new System.Data.Common.DataColumnMapping("srrevco", "srrevco"),
																																																				  new System.Data.Common.DataColumnMapping("srrevtr", "srrevtr"),
																																																				  new System.Data.Common.DataColumnMapping("srcfc", "srcfc"),
																																																				  new System.Data.Common.DataColumnMapping("srcfe", "srcfe"),
																																																				  new System.Data.Common.DataColumnMapping("srrever", "srrever"),
																																																				  new System.Data.Common.DataColumnMapping("srefe", "srefe"),
																																																				  new System.Data.Common.DataColumnMapping("srefc", "srefc"),
																																																				  new System.Data.Common.DataColumnMapping("sr#cri", "sr#cri"),
																																																				  new System.Data.Common.DataColumnMapping("srgere", "srgere"),
																																																				  new System.Data.Common.DataColumnMapping("srg2co", "srg2co"),
																																																				  new System.Data.Common.DataColumnMapping("srscor", "srscor"),
																																																				  new System.Data.Common.DataColumnMapping("created", "created"),
																																																				  new System.Data.Common.DataColumnMapping("createdBy", "createdBy"),
																																																				  new System.Data.Common.DataColumnMapping("updated", "updated"),
																																																				  new System.Data.Common.DataColumnMapping("updatedBy", "updatedBy")})});
			this.sqlDataAdapter1.UpdateCommand = this.sqlUpdateCommand1;
			this.PreRender += new System.EventHandler(this.edst3_sr_PreRender);

		}
		#endregion

		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				this.sqlScoreSpatialReversal.Parameters["@sr_pk"].Value =  DataEntryController1.PrimaryKeyVal;
				this.sqlScoreSpatialReversal.Parameters["@studyid"].Value = 3;

				this.sqlDataConnection.Open();

				// this statement can throw an SqlException if any errors occur in spScoreMullen
				this.sqlScoreSpatialReversal.ExecuteNonQuery();

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

		protected void edst3_sr_PreRender(object sender, System.EventArgs e)
		{
			if (!this.IsPostBack && this.Request.QueryString["id"] != null)
			{
				DataEntryController1.LookupTextBox1Text = this.Request.QueryString["id"];
				DataEntryController1.ParameterLookup();
			}
		}
	}
}
