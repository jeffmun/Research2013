using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using uwac;


public partial class IBIS_Vinelands : System.Web.UI.Page
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


	

	protected void Export_IBIS_Vineland()
	{
		SQL_utils sql = new SQL_utils("data");
   
		List<SqlParameter> ps = new List<SqlParameter>();

		string ID = ddlID2.SelectedValue.ToString();
		string studymeasID = ddlStudymeasID.SelectedValue.ToString();

		string dccID_1 = sql.StringScalar_from_SQLstring("select  dbo.fnGetIBIS_DCC_ID('" + ID + "')") ; 

		string subjecttype = sql.StringScalar_from_SQLstring("select  dbo.fnGetIBIS_DCC_subjecttype('" + ID + "')") ; 
 
		int tp=-1;
								  
		if (studymeasID == "2671")  tp =  3;  //  2671	IBIS: 03_Vineland-II (surv intvw)	 
		if (studymeasID == "1811")  tp =  6;  //  1811	IBIS: 06_Vineland-II (intvw)	 
		if (studymeasID == "1837")  tp = 12;  //  1837	IBIS: 12_Vineland-II (intvw)	 
		if (studymeasID == "2037")  tp = 18;  //  2037	IBIS: 18_Vineland-II (surv intvw)	 
		if (studymeasID == "1863")  tp = 24;  //  1863	IBIS: 24_Vineland-II (intvw)	 
		if (studymeasID == "2293")  tp = 36;  //  2293	IBIS: 36_Vineland-II (surv intvw)	 
		if (studymeasID == "2750")  tp =  3;  //  2750	IBIS-2: 03_Vineland-II (surv intvw)	 
		if (studymeasID == "2740")  tp =  3;  //  2740	IBIS-2: 03_Vineland-II (surv intvw)_Proband	 
		if (studymeasID == "2760")  tp =  6;  //  2760	IBIS-2: 06_Vineland-II (surv intvw)	 
		if (studymeasID == "2755")  tp =  6;  //  2755	IBIS-2: 06_Vineland-II (surv intvw)_Proband	 
		if (studymeasID == "2773")  tp =  9;  //  2773	IBIS-2: 09_Vineland-II (surv intvw)	 
		if (studymeasID == "2784")  tp = 12;  //  2784	IBIS-2: 12_Vineland-II (surv intvw)	 
		if (studymeasID == "2798")  tp = 15;  //  2798	IBIS-2: 15_Vineland-II (surv intvw)	 
		if (studymeasID == "2810")  tp = 24;  //  2810	IBIS-2: 24_Vineland-II (surv intvw)	 
		if (studymeasID == "2827")  tp = 36;  //  2827	IBIS-2: 36_Vineland-II (surv intvw)	 
		if (studymeasID == "3678")  tp =  0;  //  3678	IBIS-2: PROBAND_Vineland-II (surv intvw)	 
			
		string tp_text ="";
		if (tp ==  0 ) tp_text = "Screening" ; 
		if (tp ==  3 ) tp_text = "v03" ; 
		if (tp ==  6 ) tp_text = "v06" ; 
		if (tp ==  9 ) tp_text = "v09" ; 
		if (tp == 12 ) tp_text = "v12" ; 
		if (tp == 15 ) tp_text = "v15" ; 
		if (tp == 18 ) tp_text = "v18" ; 
		if (tp == 24 ) tp_text = "v24" ; 
		if (tp == 36 ) tp_text = "v36" ;


		if (tp_text != "")
		{
			ps.Add(sql.CreateParam("ID", ID, "text"));
			ps.Add(sql.CreateParam("studymeasID", studymeasID, "int"));


			DataTable dt = sql.DataTable_from_ProcName("spIBIS2_VinelandIISurvey_Recode_for_IBIS_DCC_upload", ps);

			string id_nopr = ID.Replace("pr", "").Replace("PR", "");
			
			if (dt.Rows.Count >= 1)
			{
				string filename = "vineland_" + subjecttype + "_" + dccID_1 + "_" + id_nopr + "_" + tp_text + ".txt";

				SpreadsheetGearUtils.SaveDataTableToFile(dt, filename, "IBISVine");

				lblNoData.Text = "Data saved to ???  R:\\IBIS-2\\Vineland_Uploads<br/>" + filename;
				lblNoData.ForeColor = Color.Blue;
			}
			else
			{
				lblNoData.Text = "No data returned";
				lblNoData.ForeColor = Color.Red;
			}
		}
		sql.Close();

	}

	protected void ddlID2_SelectedIndexChanged(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils("data");

		string ID = ddlID2.SelectedValue.ToString();

		DataTable dt = sql.DataTable_from_SQLstring("Select a.studymeasID, studymeasname from all_vineii a " + 
			" join uwautism_research_backend..tblstudymeas b ON a.studymeasID = b.studymeasID " + 
			" where ID = '" + ID +  "' and studyID=1071");

		ddlStudymeasID.DataTextField = "studymeasname";
		ddlStudymeasID.DataValueField = "studymeasID";
		ddlStudymeasID.DataSource = dt;
		ddlStudymeasID.DataBind();

		sql.Close();

		btnExport.Visible = true;

	}
	protected void btnExport_Click(object sender, EventArgs e)
	{
		Export_IBIS_Vineland();
	}


	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			DataRowView row = (DataRowView)e.Row.DataItem;




			e.Row.Cells[4].BackColor = System.Drawing.Color.FromName(row["color_Subj_06"].ToString());
			e.Row.Cells[5].BackColor = System.Drawing.Color.FromName(row["color_Subj_12"].ToString());
			e.Row.Cells[6].BackColor = System.Drawing.Color.FromName(row["color_Subj_18"].ToString());
			e.Row.Cells[7].BackColor = System.Drawing.Color.FromName(row["color_Subj_24"].ToString());
			e.Row.Cells[8].BackColor = System.Drawing.Color.FromName(row["color_Subj_36"].ToString());

		}
	}


	protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			DataRowView row = (DataRowView)e.Row.DataItem;


			e.Row.Cells[4].BackColor = System.Drawing.Color.FromName(row["color_Proband"].ToString());
			e.Row.Cells[5].BackColor = System.Drawing.Color.FromName(row["color_Proband_03"].ToString());
			e.Row.Cells[6].BackColor = System.Drawing.Color.FromName(row["color_Proband_06"].ToString());
			e.Row.Cells[7].BackColor = System.Drawing.Color.FromName(row["color_Subj_03"].ToString());

			e.Row.Cells[8].BackColor = System.Drawing.Color.FromName(row["color_Subj_06"].ToString());
			e.Row.Cells[9].BackColor = System.Drawing.Color.FromName(row["color_Subj_09"].ToString());
			e.Row.Cells[10].BackColor = System.Drawing.Color.FromName(row["color_Subj_12"].ToString());
			e.Row.Cells[11].BackColor = System.Drawing.Color.FromName(row["color_Subj_15"].ToString());
			e.Row.Cells[12].BackColor = System.Drawing.Color.FromName(row["color_Subj_24"].ToString());
			e.Row.Cells[13].BackColor = System.Drawing.Color.FromName(row["color_Subj_36"].ToString());

		}
	}

}