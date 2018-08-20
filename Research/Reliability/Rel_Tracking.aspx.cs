using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading;
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


public partial class Reliability_Rel_Tracking : BasePage 
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
		UpdatePanel_ICC.ContentTemplateContainer.Controls.Clear();
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



	}


	protected void Page_PreRender(object sender, EventArgs e)
	{

		if (!IsPostBack)
		{
			LoadOverview_by_study();
		}

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

		if (Request.QueryString["measureID"] != null)
		{
			int measureID = Convert.ToInt32(Request.QueryString["measureID"].ToString());

			Load_ICC(measureID);
			Load_Kappa(measureID);
		}
	}

	protected void LoadOverview_by_study()
	{
		if (print_jminfo) jminfo.Text += "LoadOverview_by_study..<br/>";
		
		//lbl_StudyName.Text = _content_studyname;
		lbl_StudyName.Text = Master.Master_studyname;


		SQL_utils sql = new SQL_utils("data");
		string sqlcode = "exec spRELv2_GET_RelTracking_Overview_by_study " + Master.Master_studyID.ToString();
		DataTable dt2 = sql.DataTable_from_SQLstring(sqlcode);

		sql.Close();


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

				ScriptManager1.RegisterAsyncPostBackControl(btn2);                
				btn2.Visible = (needupdate.Contains("update") ? true : false);

				//Readd
				btn2.Visible = true;



			}

		}
	}


	//public void ProcessReliabilityData(string rel_smID, int counter, int nrows)
	//{
	//    SQL_utils sql = new SQL_utils("data");
	//    sql.NonQuery_from_SQLstring("exec spRELv2_step_0c__loop_thru_studymeas " + rel_smID);
	//    sql.Close();

	//    lblProgress.Text += "Processing " + counter.ToString() + " of " + nrows.ToString() + "<br/>";
	//    UpdatePanel_Progress.Update();

	//}


	protected void gv_measures_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (print_jminfo) jminfo.Text += " (btn)gv_measures_RowCommand..<br/>";

		if (e.CommandName == "update_measure_stats")
		{
			int measureID = Convert.ToInt16(e.CommandArgument.ToString());

			SQL_utils sql = new SQL_utils("backend");

			string code = "SELECT ReliabilityStudyMeasID from  uwautism_research_backend.dbo.tblstudymeas where measureid=" + measureID.ToString() +
				" and studyid = " + _content_studyID.ToString() + " and reliabilitystudymeasid is not null";

			DataTable dt_studymeas = sql.DataTable_from_SQLstring(code);

			if(dt_studymeas.Rows.Count > 0)
			{
				//Timer1.Enabled = true;


				int counter=0;
				int nrows = dt_studymeas.Rows.Count;
				foreach(DataRow row in dt_studymeas.Rows)
				{
					counter++;
					Debug.WriteLine("Processing " + counter.ToString() + " of " + nrows.ToString());
					string rel_smID = row["ReliabilityStudyMeasID"].ToString();

					lblProgress.Text += "Processing " + counter.ToString() + " of " + nrows.ToString() + "<br/>";
					UpdatePanel_Progress.Update();

					sql.NonQuery_from_SQLstring("exec spRELv2_step_0c__loop_thru_studymeas " + rel_smID);
					sql.Close();

					//Thread workerThread = new Thread(() => ProcessReliabilityData(rel_smID, counter, nrows));
					//workerThread.Start();


				}

				//gv_measures.DataBind();
			}

			//sql.NonQuery_from_SQLstring("exec spRELv2_step_0b__loop_thru_meas_byStudy " + _content_studyID.ToString() + ", " + measureID.ToString());
			sql.Close();

		

		}

		else if (e.CommandName == "measure_summary")
		{
			GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
			int rowIndex = gvr.RowIndex;

			int measureID = Convert.ToInt16(e.CommandArgument.ToString());



			//Load_ICC(measureID);
			//Load_Kappa(measureID);
			//Load_coderpair_list(measureID);    

			Response.Redirect("Rel_Tracking.aspx?measureID=" + measureID.ToString());

		}

		else if (e.CommandName == "coder_pairs")
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

		int mode = 1;
		if (chk_ShowNA.Checked) mode=0;

		//DropDownList ddl = (DropDownList)UpdatePanel1.FindControl("ddlMeasure");
		//string sqlcode = "exec spRELv2_GET_RelTracking_by_measure " + _content_studyID.ToString() + ", " + ddl.SelectedValue.ToString();
		string sqlcode = "exec spRELv2_GET_RelTracking_CoderPairs_by_measure  " + _content_studyID.ToString() + ", " + measureID.ToString() + ", " + mode.ToString();


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

	#endregion



	#region Kappa 
	protected void Load_Kappa(int measureID)
	{
		SQL_utils sql = new SQL_utils("data");

		DataTable dt_score_vars = sql.DataTable_from_SQLstring(" select fldname, minval, maxval from def.vwFld where measureID=" + measureID.ToString() + " and relitem in (1,3) ");

		List<string> vars = dt_score_vars.AsEnumerable().Select(f => f.Field<string>("fldname")).ToList();


		//foreach (string v in vars)
		foreach (DataRow var_row in dt_score_vars.Rows)
		{

			string v = var_row["fldname"].ToString();

			string x = "exec spRELv2_Get_Scores_for_var '" + v + "', " + Master.Master_studyID.ToString() + ", " + measureID.ToString() + ", 'exclude missing', 3";
			DataTable dt_kappa = sql.DataTable_from_SQLstring(x);



			var pivotData = new PivotData(
				new string[] {"orig_val","rel_val", "fldname"},
				new CountAggregatorFactory(),
				new DataTableReader(dt_kappa));

			var pivotTable = new PivotTable(
				new[] { "orig_val" }, // row dimension(s)
				new[] { "rel_val" }, // column dimension(s)
				pivotData);

			//var q = new SliceQuery(pivotData)
			//    .Dimension("orig_val")
			//    .Dimension("rel_val")
			//    .Measure(0);
			//var q2 = q.Execute(true);

			utilStats.Kappa_stats k = utilStats.CalculateKappa(pivotTable);


			var htmlResult = new StringWriter();
			var pvtHtmlWr = new PivotTableHtmlWriter(htmlResult);
			
			pvtHtmlWr.Write(pivotTable);

			Literal xtab = new Literal();
			xtab.Text = htmlResult.ToString();

			Literal kappa = new Literal();
			kappa.Text += utilStats.PrintKappa_stats(k);


			Table tbl = new Table();
			TableRow row = new TableRow();
			TableCell cell1 = new TableCell();
			TableCell cell2 = new TableCell();

			cell1.Controls.Add(xtab);
			cell2.Controls.Add(kappa);

			row.Cells.Add(cell1);
			row.Cells.Add(cell2);
			tbl.Rows.Add(row);


			Label v_title = new Label();
			v_title.Text = v;
			v_title.Font.Size = 10;
			v_title.Font.Bold = true;

			UpdatePanel_Kappa.ContentTemplateContainer.Controls.Add(v_title);
			UpdatePanel_Kappa.ContentTemplateContainer.Controls.Add(tbl);

			UpdatePanel_Kappa.Update();
			UpdatePanel_Kappa.Visible = true;

		}





		sql.Close();
	}

	protected void Load_Kappa_old(int measureID)
	{
		string path = Server.MapPath("/");
		string html_file = path + "/research/reliability/plots/kappa_" + _content_studyID.ToString() + "_" + measureID.ToString() + ".html";
		string html = Convert.ToString(ReadHtmlFile(html_file));

		SqlCommand cmd_k = new SqlCommand();
		cmd_k.Connection = oConnData;
		cmd_k.CommandType = CommandType.Text;
		cmd_k.CommandText = "select * from vwdatRELv2_Kappa where studyID = " + _content_studyID.ToString() + " and measureID = " + measureID.ToString();

		SqlDataAdapter da_k = new SqlDataAdapter(cmd_k);
		DataTable dt_k  = new DataTable();

		da_k.Fill(dt_k);
		GridView_Kappa.DataSource = dt_k;
		GridView_Kappa.DataBind();

		//if the html file with the crosstabs tables can be found display it
		if (html.StartsWith("Could not find"))
		{ html = ""; }
		else
		{
			LiteralControl lit = new LiteralControl();
			lit.Text = html;
			divKappa.Controls.Add(lit);
		}

		UpdatePanel_Kappa.Visible = true;
		UpdatePanel_Kappa.Update();

	}

	#endregion




	#region ICC
	protected void TestICC()
	{

		DataTable dt = utilStats.ShroutFleissTable2();

		GridView gv = new GridView();
		gv.DataSource = dt;
		gv.DataBind();

		

		Literal lit = new Literal();
		lit.Text += "<b><u>Reference</u></b><br/>";
		lit.Text += "ICC procedures used here are based on:<br/>Shrout, PE & Fleiss, JL (1979) Intraclass Correlations: Uses in Assessing Rater Reliability. Psychological Bulletin, 86(2), 420-428.<br/>";
		lit.Text += "<br/>From Shrout & Fleiss: <u>Models for Reliability Studies</u>";
		lit.Text += "<br/>In a typical interrater reliability study, each of a random sample of <i>n</i> targets is rated independently by <i>k</i> judges.";
		lit.Text += "<br/><br/>Three different cases of this kind of study can be defined:";
		lit.Text += "<br/>1. Each target is rated by a differest set of <i>k</i> judges, randomly selected from a larger population of judges.";
		lit.Text += "<br/>2. A random sample of <i>k</i> judges is selected from a larger population, and each judge rates each target, that is, each judge rates <i>n</i> targets altogether.";
		lit.Text += "<br/>3. Each target is rated by each of the same <i>k</i> judges, who are the only judges of interest.";
		lit.Text += "<br/><br/>The examples discussed in this paper are reproduced below and this format is used for the results above.<br/>";
		
		panel_testICC.Controls.Add(lit);
		


		Table t = new Table();
		TableRow r1 = new TableRow();
		TableCell c1 = new TableCell() { Width = 200} ;
		TableCell c2 = new TableCell();


		c1.Controls.Add(new Label() {Text = "Sample data from Table 2:"} );
		c1.Controls.Add(gv);
		c2.Controls.Add(utilStats.ICCstats_ToHTML(utilStats.testICC("a")));

		r1.Cells.Add(c1);
		r1.Cells.Add(c2);
		t.Rows.Add(r1);

		panel_testICC.Controls.Add(t);
	}



	protected void Load_ICC(int measureID )
	{
		SQL_utils sql = new SQL_utils();

		if (print_jminfo) jminfo.Text += " ==>Load_ICC..<br/>";

		TestICC();

		string sqlcode3 = "select measname from uwautism_research_backend..tblMeasure where measureID =  " + measureID.ToString();

		string measname = sql.StringScalar_from_SQLstring(sqlcode3);

		//lblPctCoded.Text = ddl.SelectedItem + "<br/>" + x;
		lblPctCoded.Text = measname;

		
		//Pct Agree
		string sqlcode_pctagree = "exec spRELv2_GET_PCTAgree_by_measure " + _content_studyID.ToString() + ", " + measureID.ToString();
		if (print_jminfo) jminfo.Text += " ==> " + sqlcode_pctagree + "<br/>"; 
		
		DataTable dt_pctagree = sql.DataTable_from_SQLstring(sqlcode_pctagree);

		GridView gv_PctAgree_by_subscale = (GridView)UpdatePanel_ICC.FindControl("gv_PctAgree_by_subscale");
		gv_PctAgree_by_subscale.DataSource = dt_pctagree ;
		gv_PctAgree_by_subscale.DataBind();
		

		//PLOTS
		//UpdatePanel_plots.ContentTemplateContainer.Controls.Clear();


		UpdatePanel_ICC.Visible = true;
		UpdatePanel_ICC.Update();



		#region Scatterplots & ICC
		DataTable dt_score_vars = sql.DataTable_from_SQLstring(" select fldname, minval, maxval, fieldlabel from def.vwFld where measureID=" + measureID.ToString() + " and relitem = 2 ");

		List<string> vars = dt_score_vars.AsEnumerable().Select(f => f.Field<string>("fldname")).ToList();


		//foreach (string v in vars)
		foreach (DataRow var_row in dt_score_vars.Rows)
		{
			
			string v = var_row["fldname"].ToString();

			int minval = utilStats.MakeInt(var_row["minval"].ToString(), 0) ;
			int maxval = utilStats.MakeInt(var_row["maxval"].ToString(), 999);


			Label lbl = new Label();
			lbl.Text = v + "</br>" + var_row["fieldlabel"].ToString(); ;
			lbl.Font.Bold = true;
			lbl.Font.Size = 12;
			//			UpdatePanel_plots.ContentTemplateContainer.Controls.Add(lbl);
			UpdatePanel_plots.Controls.Add(lbl);

			string x = "exec spRELv2_Get_Scores_for_var '" + v + "', " + Master.Master_studyID.ToString() + ", " + measureID.ToString() + ", 'exclude missing', 2";
			string x_missing = "exec spRELv2_Get_Scores_for_var '" + v + "', " + Master.Master_studyID.ToString() + ", " + measureID.ToString() + ", 'missing only', 2";
			DataTable dt_scatter = sql.DataTable_from_SQLstring(x);
			DataTable dt_scatter_missing = sql.DataTable_from_SQLstring(x_missing);


			if (dt_scatter_missing.Rows.Count > 0)
			{
				//show the missing cases here
			}

			if (dt_scatter.Rows.Count > 0)
			{
				foreach (DataColumn dc in dt_scatter.Columns)
				{
					dc.ReadOnly = false;
				}

				//var scat1 = utilCharts.ScatterPlots(dt_scatter, "orig_val_float", "rel_val_float", 400, 400);
				//UpdatePanel_plots.ContentTemplateContainer.Controls.Add(scat1);

				var data_minval_o = dt_scatter.AsEnumerable().Select(f => f.Field<double>("orig_val_float")).Min();
				var data_minval_r = dt_scatter.AsEnumerable().Select(f => f.Field<double>("rel_val_float")).Min();
				var data_maxval_o = dt_scatter.AsEnumerable().Select(f => f.Field<double>("orig_val_float")).Max();
				var data_maxval_r = dt_scatter.AsEnumerable().Select(f => f.Field<double>("rel_val_float")).Max();

				int data_minval = Convert.ToInt32((data_minval_o < data_minval_r) ? data_minval_o : data_minval_r);
				int data_maxval = Convert.ToInt32((data_maxval_o < data_maxval_r) ? data_maxval_o : data_maxval_r) + 1;


				//Scatterplot
				string scat = utilCharts.Highcharts_Scatter("scat2" + v, dt_scatter, "orig_val_float", "rel_val_float", "series_label", "numeric", "Scatterplot of " + v, "Original value", "REL value"
					, 500, 350, "pointurl", "", "", data_minval, data_maxval, data_minval, data_maxval, true, "x=y");
				Literal lit_scat = new Literal();
				lit_scat.Text = scat;


				//F statitics
				string datatype = dt_scatter.AsEnumerable().Select(f => f.Field<string>("data_type")).First();
				double[] orig = utilStats.DataColumn_to_ArrayDouble(dt_scatter, "orig_val", datatype);
				double[] rel = utilStats.DataColumn_to_ArrayDouble(dt_scatter, "rel_val", datatype);


				utilStats.ICCstats icc = utilStats.ShroutFleissICC(dt_scatter, "orig_val", "rel_val", datatype);
				Literal lit_data = new Literal();
				lit_data.Text += "<br/><br/><b><i>Reproduce this in R with the following code:</i></b><br/>";
				lit_data.Text += "library(psych)<br/>";
				lit_data.Text += "Orig <- c( " + String.Join(",", orig.Select(p => p.ToString()).ToArray()) + ")<br/>";
				lit_data.Text += "Rel <- c(" + String.Join(",", rel.Select(p => p.ToString()).ToArray()) + ")<br/>";
				lit_data.Text += "d <- data.frame(cbind(Orig, Rel))<br/>";
				lit_data.Text += "ICC(d, alpha=.05)";




				Table tbl = new Table();
				TableRow row = new TableRow();
				TableCell cell1 = new TableCell();
				cell1.VerticalAlign = VerticalAlign.Top;
				cell1.Controls.Add(lbl);
				cell1.Controls.Add(lit_scat);

				TableCell cell2 = new TableCell();
				cell2.VerticalAlign = VerticalAlign.Top;
				cell2.Controls.Add(utilStats.ICCstats_ToHTML(icc));
				cell2.Controls.Add(lit_data);

				row.Cells.Add(cell1);
				row.Cells.Add(cell2);

				tbl.Rows.Add(row);

				//UpdatePanel_plots.ContentTemplateContainer.Controls.Add(tbl);
				UpdatePanel_plots.Controls.Add(tbl);

			}
			else
			{
				//No rows returns
				Label l = new Label();
				l.Text = "<br/>No records returned from spRELv2_Get_Scores_for_var for measureID = " + measureID.ToString() +
					"<br/>Consider updating data via: exec spRELv2_step_0b__loop_thru_meas_byStudy " + Master.Master_studyID.ToString() + ", " + measureID.ToString() + " <br/><br/>";
				l.ForeColor = Color.DarkRed;
				//UpdatePanel_plots.ContentTemplateContainer.Controls.Add(l);

				UpdatePanel_plots.Controls.Add(l);

			}

		}


		//UpdatePanel_plots.Update(); 
		UpdatePanel_plots.Visible = true;

		#endregion Scatterplots & ICC

		sql.Close();
	}

	#endregion



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
			row.Cells[18].BackColor = Color.FromName(mycolor);

			string mycolor_REL = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sms_dd_color_REL"));
			row.Cells[25].BackColor = Color.FromName(mycolor_REL);

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

			if (n_items1 > 0 | n_items2 > 0 | n_items3>0) btn.Visible = true;


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


		if (e.CommandName == "coderpair_details")
		{
			GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
			int rowIndex = gvr.RowIndex;

			// The sql_getdetails field is contained in this proc:
			//spRELv2_GET_RelTracking_CoderPairs_by_measure

			if (print_jminfo) jminfo.Text += " (btn)gv_coderpairs_list_RowCommand [coderpair_details]..<br/>";

			//Note that the SQL command text is present in the originating datasource:  
			string sql = e.CommandArgument.ToString();

			///////////////////////////////
			// Items = 1
			// Scores = 2
			// Text vars = 3


			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oConnData;
			cmd.CommandType = CommandType.Text;
			DataTable dt = new DataTable();

			for (int i = 1; i < 4; i++)
			{
				string s = sql + ", " + i.ToString();
				
				cmd.CommandText = s;
				SqlDataReader dr = cmd.ExecuteReader();
				
				dt.Load(dr);

				GridView gv_coderpair_details = (GridView)UpdatePanel_coderpair_single.ContentTemplateContainer.FindControl("gv_coderpair_details" + i.ToString());
				gv_coderpair_details.DataSource = dt;
				gv_coderpair_details.DataBind();

				//dt.Dispose();
				dt.Clear();
				dr.Close();
			}



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




	#region ################ Coderpair Details ################
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
		//////////////////////////////////////////////////
		//Show all rows in the main gridview 

		foreach (GridViewRow row in gv_coderpairs_list.Rows)
		{
			row.Visible = true;
		}

		UpdatePanel_coderpairs_list.Update();

		UpdatePanel_coderpair_single.Visible = false;
		
		UpdatePanel_coderpair_single.Update();

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


}




