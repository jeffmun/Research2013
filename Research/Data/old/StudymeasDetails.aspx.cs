using System;
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
using System.Drawing;




public partial class Data_StudymeasDetails : System.Web.UI.Page
{
	int studymeasID = 0;
	int code = 0;

	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();

	//protected System.Data.SqlClient.SqlConnection sqlConnection_Data;


	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();

	private DBLookup oDBLookup;
	private int nProjectID;

	private void Page_Load(object sender, System.EventArgs e)
	{

		if (!oLogin.CheckGroupPermissions("Autism Research Group, All Outside Labs Group".Split(',')))
		{

			tblMaster.Rows[1].Cells[0].Controls.Clear();
			tblMaster.Rows.RemoveAt(2);

			tblMaster.Rows[1].Cells[0].Attributes["style"] = "color: #B22222;";
			tblMaster.Rows[1].Cells[0].InnerHtml = "You are not authorized to view this page.";

		}

		// check that the input parameters are sent
		if (Request.Params["smID"] != null & Request.Params["code"] != null)
		{
			studymeasID = Int16.Parse(Request.Params["smID"]);
			code = Int16.Parse(Request.Params["code"]);

		}

		else
		{

			tblMaster.Rows[1].Cells[0].Attributes["style"] = "color: #B22222;";
			tblMaster.Rows[1].Cells[0].InnerHtml = "This page must be linked to from the <asp:HyperLink NavigationUrl=\"https://uwac.autism.washington.edu/research/Data/GetData.aspx\"> Data Summary page</asp:HyperLink>.";

		}


		//open the connection that everything uses
		//this.sqlConnection_Data = new System.Data.SqlClient.SqlConnection(); 
		//this.sqlConnection_Data.Open();

		if (!IsPostBack)
		{
			ViewState["sortOrder"] = "";

			oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
			oConn.Open();
			oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
			oConnData.Open();
			oDBLookup = new DBLookup(oConn);

		}

		LoadStudymeas_Active("", "", sender, e);

	}


//    protected void Page_PreRender(Object o, EventArgs e)
//    {
//    }


	protected void LoadStudymeas_Active(string sortExp, string sortDir, object sender, System.EventArgs e)
	{

		try
		{


		if (oConn.State == ConnectionState.Closed)
		{
			oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
			oConn.Open();
		}

		SqlCommand cmd = new SqlCommand();
		cmd.Connection = this.oConn;



		cmd.CommandType = CommandType.StoredProcedure;
		cmd.CommandText = "spAUTO__Studymeas_Details";


		cmd.Parameters.Add(new SqlParameter("@studymeasID", SqlDbType.Int));
		cmd.Parameters["@studymeasID"].Direction = ParameterDirection.Input;
		cmd.Parameters["@studymeasID"].Value = studymeasID;

		cmd.Parameters.Add(new SqlParameter("@code", SqlDbType.Int));
		cmd.Parameters["@code"].Direction = ParameterDirection.Input;
		cmd.Parameters["@code"].Value = code;


		SqlDataAdapter daDG = new SqlDataAdapter(cmd);

		DataSet dsDG = new DataSet();

		daDG.Fill(dsDG);

		DataTable dt = dsDG.Tables[0];
		DataView dv = new DataView(dt);



		if (sortExp != string.Empty)
		{
			dv.Sort = string.Format("{0} {1}", sortExp, sortDir);
		}

	

		GridView_active_cases.DataSource = dv;
		GridView_active_cases.DataBind();
   

		 }
				catch (SqlException oException)
				{
					errorLink1.InnerHtml += "catch";

					foreach (SqlError oErr in oException.Errors)
					{

						errorLink1.InnerHtml += oErr.Message;
					}
				}


	}



  



	protected void ShowRows(object sender, EventArgs e)
	{
		//CheckBox cb = (CheckBox)FindControl("chkShowRows");
		bool showrows = false;

		if (chkShowRows.Checked)
			{showrows= true; } 
		


		//build an array of the rows to show
		foreach (GridViewRow row in GridView_active_cases.Rows)
		{

			if (row.RowType == DataControlRowType.DataRow)
			{

				Label lbl_code = (Label)row.FindControl("lbl_code");
				string code = lbl_code.Text;

				if (code == "2) NOT 1)")
				{
					row.Visible = showrows;
				}


				//format cells
				HyperLink link_dataentry = (HyperLink)row.FindControl("link_dataentry");
				string strlink_dataentry = link_dataentry.Text;
				int index = strlink_dataentry.IndexOf("?");
				if (index > -1) { link_dataentry.ForeColor = System.Drawing.Color.Red; }

				int indexTODO = strlink_dataentry.IndexOf("*");
				if (indexTODO > -1) { link_dataentry.ForeColor = System.Drawing.Color.Green; }

				Label lbl_scoremsg = (Label)row.FindControl("lbl_scoremsg");
				int index2 = lbl_scoremsg.Text.IndexOf("WARNING");
				if (index2 > -1) 
					{ lbl_scoremsg.ForeColor = System.Drawing.Color.Maroon;
					lbl_scoremsg.Font.Bold = true;
					}

				int index3 = lbl_scoremsg.Text.IndexOf("ERROR");
				if (index3 > -1) { lbl_scoremsg.ForeColor = System.Drawing.Color.Red; }

			}

		}

		ShowActions(sender, e);  //update the visibility of the Actions columns
	}


	protected void GridView_active_cases_RowDataBound(object sender, EventArgs e)
	{
		ShowRows(sender, e);
	}



	protected void GridView_Sorting(object sender, GridViewSortEventArgs e)
	{
		string sortExp = e.SortExpression;
		string sortOrder;

		if (GridViewSortDirection == SortDirection.Ascending)
		{
			GridViewSortDirection = SortDirection.Descending;
			sortOrder = "DESC";
			//LoadDataGrid_Access(sortExp, " DESC", studyID, jobpk);
		}
		else
		{
			GridViewSortDirection = SortDirection.Ascending;
			sortOrder = "ASC";

			//LoadDataGrid_Access(sortExp, " ASC", studyID, jobpk);
		}

		LoadStudymeas_Active(e.SortExpression, sortOrder, sender, e);


	}






	public SortDirection GridViewSortDirection
	{
		get
		{
			if (ViewState["sortDirection"] == null)
				ViewState["sortDirection"] = SortDirection.Ascending;
			return (SortDirection)ViewState["sortDirection"];
		}
		set { ViewState["sortDirection"] = value; }
	}



	protected void UpdateVisibility(object sender, EventArgs e)
	{

		// if (chkHideMetaInfo.Checked) { HideMetaInfo(sender, e);}
		// if (chkHideDataEntryInfo.Checked) {  HideDataEntryInfo(sender, e);}
		// if (chkHideCompareInfo.Checked) {  HideCompareInfo(sender, e);}
		// if (chkHideLinks.Checked) {   HideLinks(sender, e);}

		ShowRows(sender, e);
		ShowActions(sender, e);
	}




	protected void ShowActions(object sender, System.EventArgs e)
	{

		if (chkShowActions.Checked == true)
		{
		SetColumnsVisibility(5, 4, 1);
		}
		else
		{
		SetColumnsVisibility(5, 4, 0);
		}
		

	}




	protected void SetColumnsVisibility(int startcol, int numcol, int vis)
	{
		for (int i = startcol; i <= startcol + numcol - 1; i++)
		{

			if (vis == 1)
			{
				GridView_active_cases.Columns[i].Visible = true;
			}
			else
			{
				GridView_active_cases.Columns[i].Visible = false;
			}
		}
	}




}
