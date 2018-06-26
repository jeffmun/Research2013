using System;
using System.Configuration;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using System.IO;
using System.Text;

public partial class Data_EditVarInfo : System.Web.UI.Page
{
	DataView dv;
	string CurrentStudyname;
	int numReq = 0;
	int numGrant = 0;

	private SqlConnection oConn = new SqlConnection();
	//protected System.Data.SqlClient.SqlConnection sqlConnection_Data;


	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();
	private DBLookup oDBLookup;
	private int nProjectID;



	protected void Page_Load(object sender, EventArgs e)
	{
		if (!oLogin.CheckGroupPermissions("IT Staff Group,Data Analysts Group,All Outside Labs Group,Autism Research Group".Split(',')))
		{
			tblMaster.Rows[1].Cells[0].Controls.Clear();
			tblMaster.Rows.RemoveAt(2);

			tblMaster.Rows[1].Cells[0].Attributes["style"] = "color: #ff0000;";
			tblMaster.Rows[1].Cells[0].InnerHtml = "You do not have permission to view this page.";
		}

		//open the connection that everything uses
		//this.sqlConnection_Data = new System.Data.SqlClient.SqlConnection(); 
		//this.sqlConnection_Data.Open();

		if (!IsPostBack)
		{

			oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
			oConn.Open();
			oDBLookup = new DBLookup(oConn);


			string tableID = Request.QueryString["tableID"];

			infocell.InnerHtml = tableID;

			//populate_ddlStudymeas();

		}
	}


	//protected void populate()
	//{
	//    //update ddlMeasure with measures from selected study
	//    SqlCommand cmd = new SqlCommand();
	//    cmd.Connection = this.oConn;

	//    cmd.CommandType = CommandType.StoredProcedure;
	//    cmd.CommandText = "spGetStudies_with_Data";

	//    SqlDataReader dr = cmd.ExecuteReader();

	//    ddlStudy.DataSource = dr;
	//    ddlStudy.DataTextField = "studyname_and_PI";
	//    ddlStudy.DataValueField = "studyid";
	//    ddlStudy.DataBind();
	//    dr.Close();

	//}


	protected void populate_gvVarInfo()
	{

		if (oConn.State == ConnectionState.Closed)
		{
			oConn.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();

			oConn.Open();
		}



		//string strSQL_Access;
		//strSQL_Access = "select * from vwdat FieldInfo_byTableID  " +
		// ",coalesce(cast([n_vars] as varchar),'NA') as [n_vars] " +
		// ",coalesce(cast(n_analysis_vars as varchar),'NA') as [n_analysis_vars] " +
		// ",coalesce([n_vars] ,999) as [sort_n_vars] " +
		// ",coalesce([n_analysis_vars],999) as [sort_n_analysis_vars] " +
		// ",coalesce([nrecs],999) as [sort_nrecs] " +
		// ",coalesce(cast([n_vars_with_missvals] as varchar),'NA') as [n_vars_with_missvals] " +
		// ",coalesce(cast([n_vars_with_validation] as varchar),'NA') as [n_vars_with_validation] " +
		// ",coalesce([n_vars_with_missvals],999) as [sort_n_vars_with_missvals] " +
		// ",coalesce([n_vars_with_validation],999) as [sort_n_vars_with_validation] " +
		// ",'https://uwac.autism.washington.edu/research/Documents/DataDictionary.aspx?tableID=' + cast(tableID as varchar) as [datadict_link] " +
		// ",'https://uwac.autism.washington.edu/research/Data/EditVarInfo.aspx?tableID=' + cast(tableID as varchar) as [editvarinfo_link] " +
		// ", nrecs , n_data, n_nodata, n_tbd, pct_entered, pct_with_data, pct_collected " +
		// ", auto_rename_label " +
		// "from vwStudyMeas_Access_by_USER " +
		// "where  cast(studyID as nvarchar)= " + ddlStudy.SelectedValue.ToString();


		//try
		//{

		//    SqlCommand oCmdSM = new SqlCommand();
		//    oCmdSM.Connection = oConn;
		//    oCmdSM.CommandTimeout = 90;
		//    oCmdSM.CommandType = CommandType.StoredProcedure;
		//    oCmdSM.CommandText = "spGetStudymeas_for_VRP";

		//    oCmdSM.Parameters.Add(new SqlParameter("@tableID", SqlDbType.VarChar, 10));
		//    oCmdSM.Parameters["@tableID"].Direction = ParameterDirection.Input;
		//    oCmdSM.Parameters["@tableID"].Value = ddlStudy.SelectedItem.Value;


		//    //SqlCommand cmd6 = new SqlCommand("select -1 as studymeasID, ' --Select a measure-- ' as studymeasname " +
		//    //    " union SELECT studymeasID, studymeasname " +
		//    //    " FROM tblstudymeas  where studyID = " + ddlStudy.SelectedItem.Value.ToString() + " order by 2", oConn);



		//    SqlDataAdapter da = new SqlDataAdapter(strSQL_Access, oConn);

		//    DataSet ds = new DataSet();

		//    da.Fill(ds);

		//    DataTable dt = ds.Tables[0];
		//    DataView dv = new DataView(dt);
		//    //DataView dv = new DataView(dt);

		//    dv.Sort = sortExp + direction;


		//    gvVarInfo.DataSource = dv;
		//    gvVarInfo.DataBind();
				


		//}

		//catch { }

	}



}
