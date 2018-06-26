using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using NReco.PivotData;
using NReco.PivotData.Output;
using System.IO;
using System.Drawing;
using System.Text;
using uwac;


public partial class Reliability_Rel_Pairs : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private ReadConfig oConfig = new ReadConfig();
	private int _content_studyID;
	private string _content_studyname;
	private string version;
	private bool print_jminfo = false;
	private DataTable dt_coder_pairs_list;

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		GetCurrentDefaultStudyID();
		//UpdatePanel_Overview.ContentTemplateContainer.Controls.Clear();
		UpdatePanel_coderpairs_list.ContentTemplateContainer.Controls.Clear();
		LoadOverview_by_study();
	 

	}


	protected void GetCurrentDefaultStudyID()
	{

		SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("exec spSEC_Get_Default_StudyID_for_User", oConn);
		DataTable dt = new DataTable();
		SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
		sqlAdapter.Fill(dt);

		foreach (DataRow row in dt.Rows)
		{
			_content_studyID = Convert.ToInt16(row["defaultstudyID"]);
			_content_studyname = Convert.ToString(row["studyname"]);
		}


	}


	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
		oConnData.Open();

		// version = "1";
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		if (print_jminfo) jminfo.Text += "##Init##<br/>";

		// Create a new table.
		DataTable dt_coder_pairs_list = new DataTable("dt_coder_pairs_list");


		SQL_utils sql = new SQL_utils("backend");
		DataTable dt_grps = sql.DataTable_from_SQLstring("select groupID , groupname from tblGroup where studyID = " + Master.Master_studyID.ToString());
		sql.Close();

		utilSelect2.loaditems(selGroups, dt_grps, "groupID", "groupname", true);


	}


	protected void Page_PreRender(object sender, EventArgs e)
	{

		LoadOverview_by_study();

		if (print_jminfo) jminfo.Text += "##PreRender##<br/>";

	}

	protected void Page_Load(object sender, EventArgs e)
	{
		//HtmlMeta meta = new HtmlMeta();
		//meta.HttpEquiv = "X-UA-Compatible";
		//meta.Content = "IE=edge";
		//HtmlHead head = Page.Header;
		//head.Controls.Add(meta);


		GetCurrentDefaultStudyID();
		if (print_jminfo) jminfo.Text += "**Load**..IsPostBack=" + IsPostBack.ToString() + "<br/>";

		if (!IsPostBack)
		{


			if (Request.QueryString["coderpair"] != null & Request.QueryString["measureID"] != null)
			{
				int measureID = Convert.ToInt32(Request.QueryString["measureID"].ToString());
				Load_coderpair_list(measureID);
				
				string coderpair = Request.QueryString["coderpair"];
				LoadCoderPairDetails(coderpair);

			}
			else if (Request.QueryString["measureID"] != null)
			{
				int measureID = Convert.ToInt32(Request.QueryString["measureID"].ToString());
				Load_coderpair_list(measureID);

				UpdatePanel_coderpair_single.Visible = false;
			}

		}


	}

	protected void LoadOverview_by_study()
	{
		if (print_jminfo) jminfo.Text += "LoadOverview_by_study..<br/>";
		
		lbl_StudyName.Text = _content_studyname;

		SqlCommand cmd2 = new SqlCommand();
		cmd2.Connection = oConnData;
		cmd2.CommandType = CommandType.Text;
		cmd2.CommandText = "exec spRELv2_GET_RelTracking_Overview_by_study " + _content_studyID.ToString();

		DataTable dt2 = new DataTable();
		SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(cmd2);
		sqlAdapter2.Fill(dt2);

		GridView gv_measures = (GridView)UpdatePanel_Overview.FindControl("gv_measures");
		gv_measures.DataSource = dt2;
		gv_measures.DataBind();


		UpdatePanel_Overview.Update();

	}


	
	protected void gv_measures_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		GridViewRow row = e.Row;
		if (row.RowType == DataControlRowType.DataRow)
		{
			Button btn = (Button)e.Row.FindControl("btnGetMeasureDetails");
			if (btn != null)
			{
				ScriptManager1.RegisterPostBackControl(btn);
			}
			Button btn2 = (Button)e.Row.FindControl("btnUpdateMeasureStats");
			if (btn2 != null)
			{
				string needupdate = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "data_lastupdated"));

				ScriptManager1.RegisterPostBackControl(btn2);                
				btn2.Visible = (needupdate.Contains("Update") ? true : false);
			}

		}
	}

	protected void gv_measures_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (print_jminfo) jminfo.Text += " (btn)gv_measures_RowCommand..<br/>";

		if (e.CommandName == "update_measure_stats")
		{
			int measureID = Convert.ToInt16(e.CommandArgument.ToString());

			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oConnData;
			cmd.CommandTimeout = 180;
			cmd.CommandType = CommandType.Text;
			cmd.CommandText = "exec spRELv2_step_0__loop_thru_meas_byStudy " + _content_studyID.ToString() + ", " + measureID.ToString();
			cmd.ExecuteNonQuery();

			gv_measures.DataBind();

		}

		if (e.CommandName == "measure_details")
		{
			GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
			int rowIndex = gvr.RowIndex;

			int measureID = Convert.ToInt16(e.CommandArgument.ToString());


			Response.Redirect("Rel_Tracking.aspx?measureID=" + measureID.ToString());

		}

		if (e.CommandName == "coder_pairs")
		{
			GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
			int rowIndex = gvr.RowIndex;

			int measureID = Convert.ToInt16(e.CommandArgument.ToString());


			//Load_coderpair_list(measureID);


			Response.Redirect("Rel_Pairs.aspx?measureID=" + measureID.ToString());

		}

	}

	


	#region ################ Coderpairs_list ################


	protected void Load_coderpair_list(int measureID)
	{
		if (print_jminfo) jminfo.Text += " ==>Load_coderpair_list..<br/>";
		
		
		//Show the Measure Name
		SQL_utils sql = new SQL_utils();


		string sqlcode_measname = "select measname from uwautism_research_backend..tblMeasure where measureID =  " + measureID.ToString();

		string measname = sql.StringScalar_from_SQLstring(sqlcode_measname);

		//lblPctCoded.Text = ddl.SelectedItem + "<br/>" + x;
		lblMeasName.Text = measname;


		int mode = 1;
		if (chk_ShowNA.Checked) mode=0;


		string grps_csv = utilSelect2.getselected_CSVval(selGroups);

		//DropDownList ddl = (DropDownList)UpdatePanel1.FindControl("ddlMeasure");
		//string sqlcode = "exec spRELv2_GET_RelTracking_by_measure " + _content_studyID.ToString() + ", " + ddl.SelectedValue.ToString();
		string sqlcode = "";

		if (Request.QueryString["coderpair"] != null)
		{
			sqlcode = "exec spRELv2_GET_RelTracking_CoderPairs_by_measure  " + _content_studyID.ToString() + ", " + measureID.ToString() + ", " + mode.ToString() + "," + Request.QueryString["coderpair"] + ",'" + grps_csv + "'";
		}
		else
		{
			sqlcode = "exec spRELv2_GET_RelTracking_CoderPairs_by_measure  " + _content_studyID.ToString() + ", " + measureID.ToString() + ", " + mode.ToString() + ",0,0,0,'" + grps_csv + "'";
		}


		//Coder pairs 
		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConnData;
		cmd.CommandType = CommandType.Text;
		cmd.CommandText = sqlcode;

		SqlDataAdapter da = new SqlDataAdapter(cmd);
		DataTable dt = new DataTable();
		da.Fill(dt);

		//Persist the table in the Session object.
		Session["dt_coder_pairs_list"] = dt;

		//Bind the GridView control to the data source.
		GridView gv_coderpairs_list = (GridView)UpdatePanel_coderpairs_list.FindControl("gv_coderpairs_list");

		gv_coderpairs_list.DataSource = Session["dt_coder_pairs_list"];
		//gv_coderpairs_list.DataSource = dt_coder_pairs_list;
		gv_coderpairs_list.DataBind();

		UpdatePanel_coderpairs_list.Visible = true;
		UpdatePanel_coderpairs_list.Update();

	}


	protected void gv_coderpairs_list_Sorting(object sender, GridViewSortEventArgs e)
	{

		//Retrieve the table from the session object.
		DataTable dt = Session["dt_coder_pairs_list"] as DataTable;

		

		if (dt != null)
		{

			//jminfo.Text += e.SortExpression + "..." + e.SortDirection;

			//Sort the data.
			dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
			gv_coderpairs_list.DataSource = Session["dt_coder_pairs_list"];
			gv_coderpairs_list.DataBind();


		}



	}



	private string GetSortDirection(string column)
	{

		// By default, set the sort direction to ascending.
		string sortDirection = "ASC";

		// Retrieve the last column that was sorted.
		string sortExpression = ViewState["SortExpression"] as string;

		if (sortExpression != null)
		{
			// Check if the same column is being sorted.
			// Otherwise, the default value can be returned.
			if (sortExpression == column)
			{
				string lastDirection = ViewState["SortDirection"] as string;
				if ((lastDirection != null) && (lastDirection == "ASC"))
				{
					sortDirection = "DESC";
				}
			}
		}

		// Save new values in ViewState.
		ViewState["SortDirection"] = sortDirection;
		ViewState["SortExpression"] = column;

		return sortDirection;
	}



	protected void gv_coderpairs_list_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		GridViewRow row = e.Row;
		if (row.RowType == DataControlRowType.DataRow)
		{
			Button btn = (Button)e.Row.FindControl("btnGetCoderDetails");
			if (btn != null)
			{
				ScriptManager1.RegisterPostBackControl(btn);
			}
			btn.Visible = false;
			string mycolor = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sms_dd_color"));
			row.Cells[19].BackColor = Color.FromName(mycolor);

			string mycolor_REL = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sms_dd_color_REL"));
			row.Cells[26].BackColor = Color.FromName(mycolor_REL);

			string relDone = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sms_dd_status_REL"));

			int n_adminerr = Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "n_adminerr"));
			if(n_adminerr > 0)
			{
				row.Cells[7].BackColor = Color.FromArgb(255,207,0);
			}

			double pct1 = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "pctagree_items1"));
			double pctalg = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "pctagree_alg"));
//            double pct3 = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "pctagree_items3"));

			int n_items1 = Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "n_items1"));
			int n_items2 = Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "n_items2"));
			int n_items3 = Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "n_items3"));
			int n_items_alg = Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "n_items_alg"));

			

			string id = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "id"));

			if (n_items1 >= 0 | n_items2 >= 0 | n_items3 >= 0) btn.Visible = true;


			//color the cells with the ORIG and REL data entry status 
			if (n_items2 == -999) { row.Cells[3].Text = ""; }  // no scores
			if (n_items3 == -999) { row.Cells[4].Text = ""; }  // no discrete
			if (n_items1 == -999) { row.Cells[5].Text = ""; row.Cells[6].Text = ""; row.Cells[7].Text = ""; }  // no items

			if (pct1 >= 80) { row.Cells[8].BackColor = Color.SkyBlue; }
			else if (pct1 >= 0) {row.Cells[8].BackColor = Color.Cornsilk;}
			else if (pct1 == -999 & n_items1==0) { row.Cells[8].ForeColor = Color.LightGray; row.Cells[7].Text = "na"; }
			else if (pct1 == -999 & n_items1 == -999) { row.Cells[8].Text = ""; }


			if (pctalg >= 80) { row.Cells[11].BackColor = Color.SkyBlue; }
			else if (pctalg >= 0) { row.Cells[11].BackColor = Color.Cornsilk; }
			else if (pctalg == -999 & n_items_alg == 0) { row.Cells[11].ForeColor = Color.LightGray; row.Cells[11].Text = "na"; }
			else if (pctalg == -999 & n_items_alg == -999) { row.Cells[11].Text = ""; row.Cells[11].Text = ""; row.Cells[12].Text = ""; row.Cells[12].Text = ""; }



			//To Do
			//Hide Alg columns if all missing


		}
	}


			//    create proc spdatRELv2_items__for_coderpair 
			//(@id varchar(15), @orig_studymeasID int, @rel_studymeasID int, @rel_pkval int, @type int)
	protected void gv_coderpairs_list_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		//  tblmyinfo.Rows[0].Cells[0].InnerHtml += e.CommandSource.ToString();
		//  tblmyinfo.Rows[0].Cells[0].InnerHtml += e.CommandName.ToString() + "<br/>";

		//UpdatePanel UpdatePanel_coderpair_single = (UpdatePanel)FindControl("UpdatePanel_coderpair_single");


		if (e.CommandName == "coderpair_details")
		{
			GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
			int rowIndex = gvr.RowIndex;

			// The sql_getdetails field is contained in this proc:
			//spRELv2_GET_RelTracking_CoderPairs_by_measure

			if (print_jminfo) jminfo.Text += " (btn)gv_coderpairs_list_RowCommand [coderpair_details]..<br/>";

			//Note that the SQL command text is present in the originating datasource:  
			string sql_params = e.CommandArgument.ToString();

			///////////////////////////////
			// Items = 1
			// Scores = 2
			// Text vars = 3

			LoadCoderPairDetails(sql_params);


			//////////////////////////////////////////////////
			//Hide other rows in the main gridview 
			int counter=0;
			foreach (GridViewRow row in gv_coderpairs_list.Rows)
			{
				
				if(counter==rowIndex)
				{row.Visible=true;}
				else
				{row.Visible=false;}
				counter++;
			}

			UpdatePanel_coderpair_single.Visible = true;
			UpdatePanel_coderpair_single.Update();

		}
	}

	#endregion



	#region ################ Coderpair Details ################
	protected void LoadCoderPairDetails(string sql_params)
	{

		string[] str_ps = sql_params.Split(',');


		SQL_utils sql = new SQL_utils();
		List<SqlParameter> ps = new List<SqlParameter>();

		ps.Add(sql.CreateParam("orig_studymeasID", str_ps[0], "int"));
		ps.Add(sql.CreateParam("rel_studymeasID", str_ps[1], "int"));
		ps.Add(sql.CreateParam("rel_pkval", str_ps[2], "int"));


		DataSet ds = sql.DataSet_from_ProcName("spRELv2_GET_items__for_coderpair", ps);


		for (int i = 0; i < 3; i++)  //3 datatables to process
		{

			GridView gv_coderpair_details = (GridView)UpdatePanel_coderpair_single.ContentTemplateContainer.FindControl("gv_coderpair_details" + i.ToString());
			gv_coderpair_details.DataSource = ds.Tables[i]; //dt;
			gv_coderpair_details.DataBind();

		}

		sql.Close();

		UpdatePanel_coderpair_single.Visible = true;

	}





	protected void gv_coderpair_detail_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		GridViewRow row = e.Row;

		if (row.RowType == DataControlRowType.DataRow)
		{
			string match_text = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "match_text"));

			if (match_text == "")
			{
				row.BackColor = Color.Gainsboro;
				row.Font.Bold = true;
				row.Font.Size = 12;
			}
			else if (match_text == " ")
			{
				row.BackColor = Color.AliceBlue;
				row.Font.Bold = true;
				row.Font.Size = 12;
			}

			else if (match_text == "admin err")
			{

				row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFCC00");
				row.Font.Bold = true;
			}
			else if (match_text == "mismatch")
			{

				row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFD0D0");
				row.Font.Bold = true;
			}
			else 
			{
				row.ForeColor = Color.Black;
				row.Font.Bold = false;
			}

		}
	}


	protected void btnShowAll_Click(object sender, EventArgs e)
	{


		if (print_jminfo) jminfo.Text += "btnShowAll_Click..<br/>";

		UpdatePanel_coderpair_single.Visible = false;
		UpdatePanel_coderpair_single.Update();

		
		//////////////////////////////////////////////////
		//Show all rows in the main gridview 

		foreach (GridViewRow row in gv_coderpairs_list.Rows)
		{
			row.Visible = true;
		}

		UpdatePanel_coderpairs_list.Update();

		

	}

	#endregion



	public static System.Text.StringBuilder ReadHtmlFile(string htmlFileNameWithPath)
	{
		System.Text.StringBuilder htmlContent = new System.Text.StringBuilder();
		System.Text.StringBuilder htmlContent_toreturn = new System.Text.StringBuilder();
		string line;

		try
		{
			System.IO.StreamReader htmlReader = new System.IO.StreamReader(htmlFileNameWithPath);

			using (htmlReader)
			{

				while ((line = htmlReader.ReadLine()) != null)
				{
					htmlContent.Append(line);
				}
			}

			htmlContent_toreturn = htmlContent;
		}
		catch (Exception objError)
		{
			htmlContent_toreturn.Append(objError.Message);
			//throw objError;
		}

		return htmlContent_toreturn;
	}


	protected void btnRefresh_Click(object sender, EventArgs e)
	{
		int measureID = Convert.ToInt32(Request.QueryString["measureID"].ToString());
		Load_coderpair_list(measureID);
	}
}




