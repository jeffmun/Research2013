using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using uwac;

public partial class IBIS2_Vinelands : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private ReadConfig oConfig = new ReadConfig();


	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
		oConnData.Open();

		load_DDLStudymeasID();


	}


	protected void UpdateDCCID(object sender, EventArgs e)
	{

		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConn;
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spInsertOtherID_for_IBIS";
		cmd.Parameters.Add("subjID", System.Data.SqlDbType.Int);
		cmd.Parameters.Add("OtherID", System.Data.SqlDbType.VarChar, 15);
		cmd.Parameters["subjID"].Value = Convert.ToInt32(ddlID.SelectedValue.ToString());
		cmd.Parameters["OtherID"].Value = txtDCCID.Text;

		//cmd.Parameters.Add("result", System.Data.SqlDbType.VarChar, 100);
		//cmd.Parameters["result"].Direction = System.Data.ParameterDirection.ReturnValue

		try
		{
			cmd.ExecuteNonQuery();

			lblSqlInfo.Text = "This ID has been added.";

		}
		catch (SqlException exc)
		{
			lblSqlInfo.Text = exc.Message;
		}

		GridView1.DataBind();
		ddlID.DataBind();

		txtDCCID.Text = "";
	}


	protected void load_DDLStudymeasID()
	{
		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring("select studymeasID, studymeasname +' ('+ cast(studymeasID as varchar)+')' as studymeasname from tblStudymeas where studyID=1071 and measureID=427");

		DDLstudymeasID.DataSource = dt;
		DDLstudymeasID.DataBind();

		DataTable dt2 = sql.DataTable_from_SQLstring("select distinct(ID) ID from uwautism_research_data..ALL_VineII where studymeasID in " + 
			" (select studymeasID from tblStudymeas where studyID=1071 and measureID=427) order by 1");


		DDL_ID.DataSource = dt2;
		DDL_ID.DataBind();


		sql.Close();
		
	}

	protected void btnSaveToText_Click(object sender, EventArgs e)
	{
		string ID = DDL_ID.SelectedValue.ToString();
		int studymeasID = int.Parse(DDLstudymeasID.SelectedValue.ToString());
		
		SaveTextFileForIBIS (ID, studymeasID);
	}



	protected void btnSaveAll_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils();


		DataTable dt_ids = sql.DataTable_from_SQLstring("select ID, studymeasID from ALL_VineII where studymeasID in " +
			" (select studymeasID from uwautism_research_backend..tblstudymeas where studyID=1071 and measureID=427) and verified = 1");

		foreach (DataRow row in dt_ids.Rows)
		{
			string ID = row.Field<string>("ID");
			int studymeasID = row.Field<int>("studymeasID");
			

			SaveTextFileForIBIS (ID, studymeasID);
		}
	}



	protected void SaveTextFileForIBIS (string ID, int studymeasID)
	{
		string tp_text = "";
		int tp = 0;

		string filepath = @"\\autism-fs03\shared files\R drive\IBIS-2\Vineland_Uploads\";

		SQL_utils sql = new SQL_utils();

		DataTable dt = sql.DataTable_from_SQLstring("select * from uwautism_research_backend..tblStaff");

		//SqlParameter p = sql.CreateParam("name", "8", "int");
		//DataSet ds = sql.DataSet_from_ProcName("spMyProc", p);


		int studyID = sql.IntScalar_from_SQLstring("select    max( studyid) from  uwautism_research_backend.dbo.vwmasterstatus_s where id = '" + ID + "'");
		string dccID_1 = sql.StringScalar_from_SQLstring("select dbo.fnGetIBIS_DCC_ID('" + ID + "') ");
		string subjecttype = sql.StringScalar_from_SQLstring("select dbo.fnGetIBIS_DCC_subjecttype('" + ID + "') ");

		
		if (studymeasID == 2671) tp = 3;    //  2671	IBIS: 03_Vineland-II (surv intvw)	 
		if (studymeasID == 1811) tp = 6;	  //  1811	IBIS: 06_Vineland-II (intvw)	 
		if (studymeasID == 1837) tp = 12;	  //  1837	IBIS: 12_Vineland-II (intvw)	 
		if (studymeasID == 2037) tp = 18;	  //  2037	IBIS: 18_Vineland-II (surv intvw)	 
		if (studymeasID == 1863) tp = 24;	  //  1863	IBIS: 24_Vineland-II (intvw)	 
		if (studymeasID == 2293) tp = 36;	  //  2293	IBIS: 36_Vineland-II (surv intvw)	 
		if (studymeasID == 2750) tp = 3;	  //  2750	IBIS-2: 03_Vineland-II (surv intvw)	 
		if (studymeasID == 2740) tp = 3;	  //  2740	IBIS-2: 03_Vineland-II (surv intvw)_Proband	 
		if (studymeasID == 2760) tp = 6;	  //  2760	IBIS-2: 06_Vineland-II (surv intvw)	 
		if (studymeasID == 2755) tp = 6;	  //  2755	IBIS-2: 06_Vineland-II (surv intvw)_Proband	 
		if (studymeasID == 2773) tp = 9;	  //  2773	IBIS-2: 09_Vineland-II (surv intvw)	 
		if (studymeasID == 2784) tp = 12;	  //  2784	IBIS-2: 12_Vineland-II (surv intvw)	 
		if (studymeasID == 2798) tp = 15;	  //  2798	IBIS-2: 15_Vineland-II (surv intvw)	 
		if (studymeasID == 2810) tp = 24;	  //  2810	IBIS-2: 24_Vineland-II (surv intvw)	 
		if (studymeasID == 2827) tp = 36;	  //  2827	IBIS-2: 36_Vineland-II (surv intvw)	 


		if (tp == 3) tp_text = "v03";
		if (tp == 6) tp_text = "v06";
		if (tp == 9) tp_text = "v09";
		if (tp == 12) tp_text = "v12";
		if (tp == 15) tp_text = "v15";
		if (tp == 18) tp_text = "v18";
		if (tp == 24) tp_text = "v24";
		if (tp == 36) tp_text = "v36";

		string leadingzero = (tp == 3 | tp == 6 | tp == 9) ? "0" : "";

		string dccIDqry = dccID_1 + "-" + ID.Replace("SEA", "") + "-" + leadingzero + tp.ToString();

		if (subjecttype == "PROBAND") tp_text = "screening";

		if (subjecttype == "CANDIDATE") subjecttype = "SUBJECT";

		string filename = "vineland_" + subjecttype + "_" + dccID_1 + "_" + ID.Replace("PR", "") + "_" + tp_text;


		DataTable vin = sql.DataTable_from_SQLstring("exec spIBIS2_VineII_Recode_for_IBIS_DCC_upload '" + ID + "'," + studymeasID.ToString());


		SpreadsheetGearUtils.SaveDataTableToFile(vin, filename, "IBISVine");



		//string @makefile =  'BCP "exec uwautism_research_data.dbo.spIBIS2_VineII_Recode_for_IBIS_DCC_upload ''' + @ID + ''', ' +
		//  cast(@studymeasID as varchar) + '" queryout "' + @filepath + 'DATAvineland_' +   
		//    @subjecttype + '_' + @dccID_1 + '_' + replace(@ID, 'PR','') + '_' + @tp_text + '.txt" -c -T -S' + @@servername   



		//exec uwautism_research_data.dbo.spAUTO_SQLAgentJob_addstep @sqlagentjobname, 'query' ,  @makefile , 'cmdexec'  , 3 /*3=goto next step, 1=quit with success  */ , 1 /* run as proxy */                                       



		///****************************************/        
		///******      Merge the two        *******/                     
		///****************************************/           
		//print '-- .... prepare to add step 3 .... --'                          
		//declare @joinvarsdata nvarchar(1000)        
		//set @joinvarsdata = 'copy "' + @filepath + 'IBIS_Vineland_columns.txt" + ' +   
		//                        ' "' + @filepath + 'DATAvineland_' + @subjecttype + '_' + @dccID_1 + '_' + @ID + '_' + @tp_text + '.txt"' +  
		//                        ' "' + @filepath + 'vineland_' + @subjecttype + '_' + @dccID_1 + '_' + @ID + '_' + @tp_text + '.txt"  /Y'        

		//exec uwautism_research_data.dbo.spAUTO_SQLAgentJob_addstep @sqlagentjobname, 'add varnames' , @joinvarsdata , 'cmdexec'   , 3 /*3=goto next step, 1=quit with success  */ , 1 /* run as proxy */                                     

		//print @joinvarsdata  


		///****************************************/        
		///******      Delete the data        *******/                     
		///****************************************/           
		//print '-- .... prepare to add step 4 .... --'                          
		//declare @deldata nvarchar(1000)        
		//set @deldata = 'del  "' + @filepath + 'DATAvineland_' + @subjecttype + '_' + @dccID_1 + '_' + @ID + '_' + @tp_text + '.txt"'        

		//exec uwautism_research_data.dbo.spAUTO_SQLAgentJob_addstep @sqlagentjobname, 'del data file' , @deldata , 'cmdexec'   , 3 /*3=goto next step, 1=quit with success  */ , 1 /* run as proxy */                                     

		//print @deldata  



		//print '-- ... prepare to start job ... --'                
		//exec uwautism_research_data.dbo.spAUTO_SQLAgentJob_addstep @sqlagentjobname, 'finish', '/*  finish job. */', 'tsql', 1                
		//exec uwautism_research_data.dbo.spAUTO_SQLAgentJob_start @sqlagentjobname                


		//--exec sp_executesql @select_sql_varnames  



		sql.Close();

	}

	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if(e.Row.RowType == DataControlRowType.DataRow)
		{
			DataRowView row = (DataRowView) e.Row.DataItem;


			e.Row.Cells[4].BackColor = System.Drawing.Color.FromName(row["color_Proband_03"].ToString());
			e.Row.Cells[5].BackColor = System.Drawing.Color.FromName(row["color_Proband_06"].ToString());
			e.Row.Cells[6].BackColor = System.Drawing.Color.FromName(row["color_Subj_03"].ToString());

			e.Row.Cells[7].BackColor = System.Drawing.Color.FromName(row["color_Subj_06"].ToString());
			e.Row.Cells[8].BackColor = System.Drawing.Color.FromName(row["color_Subj_09"].ToString());
			e.Row.Cells[9].BackColor = System.Drawing.Color.FromName(row["color_Subj_12"].ToString());
			e.Row.Cells[10].BackColor = System.Drawing.Color.FromName(row["color_Subj_15"].ToString());
			e.Row.Cells[11].BackColor = System.Drawing.Color.FromName(row["color_Subj_24"].ToString());
			e.Row.Cells[12].BackColor = System.Drawing.Color.FromName(row["color_Subj_36"].ToString());

		}
	}

}