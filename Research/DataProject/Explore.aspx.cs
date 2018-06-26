using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using LinqStatistics;
using uwac;
using uwac.trk;

public partial class DataProject_Explore : System.Web.UI.Page
{

	private bool dataproject_initialized = false;
	private List<int> selected_measlist;
	private List<int> selected_varslist;
	private List<int> selected_subjlist;

	DataTable tbl_selsubj;
	DataTable tbl_selmeas;
	DataTable tbl_selvars;

	private int selected_subjset_pk;



	#region Page Setup
	protected void Page_Init(object sender, EventArgs e)
	{
		Debug.Print("&&&&&&&&&&&&&&&&&&&&& Page_Init " + System.DateTime.Now.ToString() + "&&&&&&&&&&&&&&&&&&&&&");

		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = Master.Master_studyID.ToString();
		ViewState["measNeedBind"] = "true";
		ViewState["varsNeedBind"] = "false";
		ViewState["subjNeedBind"] = "true";

	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("Index.aspx");
	}

	protected void Page_Unload(object sender, EventArgs e)
	{
		PrintStatus();
		Debug.Print(" ===================   Page_Unload " + System.DateTime.Now.ToString() + " ==================");
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		Debug.Print("*********************  Page_Load " + System.DateTime.Now.ToString() + " **************************");



		if (!IsPostBack)
		{
			Debug.Print("--- is NOT Postback " + System.DateTime.Now.ToString());
			PrintStatus();
			InitializeSessionVars();
			PrintStatus();


			// Not a postback and there is a defined DataProject - preload the selected Measures and Variables
			if (Request.QueryString["pk"] != null)
			{

				LoadDataproject_SelectedItems(Convert.ToInt32(Request.QueryString["pk"].ToString()));

				btnLoad.Visible = true;
			}
			else
			{
				//Always start fresh if it is not a PostBack and there is no pk
				Debug.Print("   **** Start Fresh - NO PK ****" + System.DateTime.Now.ToString());

				Response.Redirect("Index.aspx");
			}

			//chkOptions.UnselectAll();

			//Set default FilterRowMenu to 'Contains'
			SetRowFilterMenuToContains(gridSelSubj);
			SetRowFilterMenuToContains(gridSelMeas);
			SetRowFilterMenuToContains(gridSelVars);
		}

		// IS PostBack
		else
		{
			Debug.Print("--- is Postback " + System.DateTime.Now.ToString());
			PrintStatus();

			if (Session["proj_subj"] != null)
			{
				gridSelSubj.DataSource = Session["proj_subj"];
				gridSelSubj.DataBind();
			}

			if (Session["proj_meas"] != null)
			{
				Debug.Print("");
				Debug.Print("   BINDING MEAS GRID 1 " + System.DateTime.Now.ToString());
				Debug.Print("");
				gridSelMeas.DataSource = Session["proj_meas"];
				gridSelMeas.DataBind();
			}
			else
			{
				Debug.Print("   **** Not Binding VARS yet - no meas selected ****" + System.DateTime.Now.ToString());
				Debug.Print("");
				Session["vars_count"] = "No measures selected yet";
			}

			if (Session["proj_vars"] != null)
			{
				gridSelVars.DataSource = Session["proj_vars"];
				gridSelVars.DataBind();
			}


			if (Session["proj_infomsg"] != null)
			{
				gridInfoMsg.DataSource = (DataTable)Session["proj_infomsg"];
				gridInfoMsg.DataBind();
			}


			if (Session["proj_data"] != null)
			{

			}

			if (Session["proj_data_stack"] != null)
			{
				if (chkOpt_desc.Checked)
				{
					pivotDescStats.DataSource = (DataTable)Session["proj_data_stack"];
					pivotDescStats.DataBind();
				}
				if (chkOpt_miss.Checked)
				{
					pivotMissing.DataSource = (DataTable)Session["proj_data_stack"];
					pivotMissing.DataBind();
				}
				if (chkOpt_data.Checked)
				{
					gridStackedData.DataSource = (DataTable)Session["proj_data_stack"];
					gridStackedData.DataBind();
				}
				if (chkOpt_data_wide1.Checked)
				{
					gridWide1Data.DataSource = (DataTable)Session["proj_data"];
					gridWide1Data.DataBind();
				}

			}


		}


		int n_proj_subj = (Session["proj_subj"] != null) ? ((DataTable)Session["proj_subj"]).Rows.Count : 0;
		int n_proj_meas = (Session["proj_meas"] != null) ? ((DataTable)Session["proj_meas"]).Rows.Count : 0;
		int n_proj_vars = (Session["proj_vars"] != null) ? ((DataTable)Session["proj_vars"]).Rows.Count : 0;
		int n_proj_data = (Session["proj_data"] != null) ? ((DataTable)Session["proj_data"]).Rows.Count : 0;

		lblStatus.Text = String.Format("This project has {0} subjects, {1} measures, {2} vars available.", n_proj_subj.ToString(), n_proj_meas.ToString(), n_proj_vars.ToString());

		Debug.Print("   --- Page_Load complete " + System.DateTime.Now.ToString());


		selsubj_n.Text = String.Format("({0} selected)", gridSelSubj.GetSelectedFieldValues("subjID").Count);
		selmeas_n.Text = String.Format("({0} selected)", gridSelMeas.GetSelectedFieldValues("studymeasID").Count);
		selvars_n.Text = String.Format("({0} selected)", gridSelVars.GetSelectedFieldValues("fldpk").Count);

		lblLoaded.Text = String.Format("Data for {0} subjects, {1} measures, {2} vars are loaded."
		, gridSelSubj.GetSelectedFieldValues("subjID").Count
		, gridSelMeas.GetSelectedFieldValues("studymeasID").Count
		, gridSelVars.GetSelectedFieldValues("fldpk").Count);

		//Set visibility of the selectors


		bool showselected = chkShowSelected.Checked;
		if (chkShowSelected.Checked)
			gridSelSubj.ClientVisible = showselected;
		gridSelMeas.ClientVisible = showselected;
		gridSelVars.ClientVisible = showselected;
		//btnHideSelected.ClientVisible = showselected;
		//btnShowSelected.ClientVisible = showselected;


	}
	#endregion

	protected void InitializeSessionVars()
	{

		Session["proj_subj"] = null;
		Session["proj_meas"] = null;
		Session["proj_vars"] = null;
		Session["proj_data"] = null;
		Session["proj_data_stack"] = null;
		Session["proj_infomsg"] = null;


		Session["selected_subjlist"] = null;
		Session["selected_varslist"] = null;
		Session["selected_measlist"] = null;

	}




	protected void SetRowFilterMenuToContains(ASPxGridView g)
	{
		foreach (var col in g.Columns)
		{
			if (col is GridViewDataColumn)
			{
				((GridViewDataColumn)col).Settings.AutoFilterCondition = AutoFilterCondition.Contains;
			}
		}
	}


	protected void PrintStatus()
	{
		int n_projsubj = (Session["proj_subj"] != null) ? ((DataTable)Session["proj_subj"]).Rows.Count : 0;
		int n_projmeas = (Session["proj_meas"] != null) ? ((DataTable)Session["proj_meas"]).Rows.Count : 0;
		int n_projvars = (Session["proj_vars"] != null) ? ((DataTable)Session["proj_vars"]).Rows.Count : 0;
		int n_projdata = (Session["proj_data"] != null) ? ((DataTable)Session["proj_data"]).Rows.Count : 0;

		//int n_subj = (Session["subj"] != null) ? ((DataTable)Session["subj"]).Rows.Count : 0;
		int n_meas = (Session["meas"] != null) ? ((DataTable)Session["meas"]).Rows.Count : 0;
		int n_vars = (Session["vars"] != null) ? ((DataTable)Session["vars"]).Rows.Count : 0;


		Debug.Print("");
		Debug.Print("Session proj_subj = " + n_projsubj.ToString() + "   " + System.DateTime.Now.ToString());
		Debug.Print("Session proj_meas = " + n_projmeas.ToString() + "   " + System.DateTime.Now.ToString());
		Debug.Print("Session proj_vars = " + n_projvars.ToString() + "   " + System.DateTime.Now.ToString());

		Debug.Print("Session proj_data = " + n_projdata.ToString() + "   " + System.DateTime.Now.ToString());
		Debug.Print("");


	}



	protected void LoadDataproject_SelectedItems(int pk)
	{
		SQL_utils sql = new SQL_utils("data");

		int studyID = sql.IntScalar_from_SQLstring("select studyID from dp.DataProject where dataproj_pk = " + pk.ToString());

		if (Master.Master_studyID != studyID)
		{
			Master.Master_studyID = studyID;
		}

		DataTable dtProj = sql.DataTable_from_SQLstring("select * from dp.DataProject where dataproj_pk = " + pk.ToString());
		txtTitle.Text = dtProj.Rows[0]["projTitle"].ToString();


		string subjset_pk_txt = dtProj.Rows[0]["subjset_pk"].ToString();
		int selected_subjset_pk;
		bool result = Int32.TryParse(subjset_pk_txt, out selected_subjset_pk);
		if (result)
		{
			GetSelectedSubjects(selected_subjset_pk);
		}

		string sqlm = "select a.StudyMeasName, a.studymeasID, MeasName, a.measureID, Category, timepoint_text TimePt, tblname " +
			" from uwautism_research_backend..vwStudyMeas a " +
			" left join def.tbl b ON a.measureID = b.measureID where a.studymeasID in " +
			" (select  studymeasID from dp.Meas where dataproj_pk = " + pk.ToString() + ")";

		DataTable dtm = sql.DataTable_from_SQLstring(sqlm);
		selected_measlist = dtm.AsEnumerable().Select(f => f.Field<int>("studymeasID")).ToList();


		DataTable dtv = GetVarsForDataproject(pk, "num");
		selected_varslist = dtv.AsEnumerable().Select(f => f.Field<int>("fldpk")).ToList();


		DataTable dts = sql.DataTable_from_SQLstring("select * from uwautism_research_backend..vwMasterStatus_S_txgrp a " +
			" join (select * from dp.Grp where dataproj_pk = " + pk.ToString() + " ) b ON a.groupID=b.groupID and a.subjstatusID=b.subjstatusID ");
		selected_subjlist = dts.AsEnumerable().Select(f => f.Field<int>("subjID")).ToList();

		sql.Close();


		Session["selected_subjlist"] = selected_subjlist;
		Session["selected_varslist"] = selected_varslist;
		Session["selected_measlist"] = selected_measlist;

		Session["proj_meas"] = dtm;


		gridSelSubj.DataSource = Session["proj_subj"];
		gridSelSubj.DataBind();

		gridSelMeas.DataSource = Session["proj_meas"];
		gridSelMeas.DataBind();


		DataTable dtv2 = (DataTable)Session["proj_vars"];
		int nvars = dtv.Rows.Count;
		int nvars2 = dtv2.Rows.Count;
		gridSelVars.DataSource = Session["proj_vars"];
		gridSelVars.DataBind();

	}



	#region Callbacks
	protected void gridSubjCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  pivotSubjCallback_OnCallback " + System.DateTime.Now.ToString());
		ResetLoadedData();
	}
	protected void gridMeasCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  gridMeasCallback_OnCallback " + System.DateTime.Now.ToString());

		ResetLoadedData();
	}
	protected void gridVarsCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  gridVarsCallback_OnCallback " + System.DateTime.Now.ToString());
		GetVarsForDataproject(Convert.ToInt32(Request.QueryString["pk"]), "num");
		gridSelVars.DataSource = Session["proj_vars"];
		gridSelVars.DataBind();
		ResetLoadedData();
	}


	protected void ResetLoadedData()
	{
		panelCharts.Controls.Clear();
		Session["proj_data"] = null;
		Session["proj_data_stack"] = null;
		Session["proj_infomsg"] = null;
	}



	#endregion


	#region User Controls

	protected void btnXLSX_OnClick(object sender, EventArgs e)
	{

		//gridWide1Data.ExportToXlsx();
		string filename = String.Format("Proj{0}_");

		gridWide1Data.ExportXlsxToResponse(true);
	}
		

	protected void btnLoad_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnLoad_OnClick " + System.DateTime.Now.ToString());


		if (
			gridSelSubj.GetSelectedFieldValues("subjID").ToList().Count > 0 &
			gridSelMeas.GetSelectedFieldValues("measureID").ToList().Count > 0 &
			gridSelVars.GetSelectedFieldValues("fldpk").ToList().Count > 0
		)
		{
			panelCharts.Controls.Clear();

			LoadDataSet(Convert.ToInt32(Request.QueryString["pk"]));

			chkShowSelected.Checked = false;
			gridSelSubj.ClientVisible = false;
			gridSelMeas.ClientVisible = false;
			gridSelVars.ClientVisible = false;
		}

		gridSelVars.CollapseAll();
		gridSelMeas.CollapseAll();
		gridSelSubj.CollapseAll();

	}

	protected void btnEditProject_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnEditProject_OnClick " + System.DateTime.Now.ToString());
		Response.Redirect("Edit.aspx?pk=" + Request.QueryString["pk"]);
	}


	//protected void TitleTextBox_Validation(object sender, ValidationEventArgs e)
	//{
	//	if ((e.Value as string).Length < 2)
	//		e.IsValid = false;
	//}



	protected void btnProjects_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnSets_OnClick " + System.DateTime.Now.ToString());
		Response.Redirect("DataProjects.aspx");
	}

	protected void btnGetStats_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnGetStats_OnClick " + System.DateTime.Now.ToString());

		int nrecs_proj_data = ((DataTable)Session["proj_data"]).Rows.Count;

		panelInfo.ClientVisible = true;

		if (nrecs_proj_data > 0)
		{
			//var chk = chkOptions.SelectedValues;
			var chk = "0";

			DataTable dt = (DataTable)Session["proj_data"];
			List<string> flds = uwac.trk.dataops.GetListString(gridSelVars.GetSelectedFieldValues("fldname"));
			List<string> fldlabels = uwac.trk.dataops.GetListString(gridSelVars.GetSelectedFieldValues("fieldlabel"));

			string levels = cboHistLevels.Value.ToString();

			panelDescStatsCharts.Controls.Clear();

			//Histograms
			if (chkOpt_hist.Checked)
			//if (chk.Contains("Hist"))
			{
				Hist(dt, flds, fldlabels, "timept", levels);

				//panelDescStats.ClientVisible = false;
				splitter1.ClientVisible = true;
				panelCharts.ClientVisible = true;
			}
			else
			{
				panelCharts.ClientVisible = false;
			}

			//Desc Stats
			if (chkOpt_desc.Checked)
			{

				//Use the Combobox to populate the pivotgrid Column

				pivotDescStats.Fields["group"].Area = PivotArea.FilterArea;
				pivotDescStats.Fields["txgrp"].Area = PivotArea.FilterArea;
				pivotDescStats.Fields["sex"].Area = PivotArea.FilterArea;

				pivotDescStats.Fields[levels].Area = PivotArea.ColumnArea;


				pivotDescStats.DataSource = (DataTable)Session["proj_data_stack"];
				pivotDescStats.DataBind();

				panelDescStats.ClientVisible = true;
				panelDescStatsCharts.ClientVisible = true;
				//panelCharts.ClientVisible = false;


				DevExpress.XtraPivotGrid.PivotSummaryDataSource pivot_ds = pivotDescStats.CreateSummaryDataSource();
				DataTable dt_descstats = dxpivot.ConvertSummaryDataSourceToDataTable(pivot_ds);

				dt_descstats.Columns.Add("SDplus", typeof(double), "Value_Average + Value_StdDev");
				dt_descstats.Columns.Add("SDminus", typeof(double), "Value_Average - Value_StdDev");

				//DataTable dt2 = dt_descstats.Copy();

				List<DataTable> dts = utilStats.qryGroupBy(dt_descstats, "x", new List<string> { "Variable" });

				foreach (DataTable dt1 in dts)
				{
					WebChartControl WebChart = CreateChart(dt1);
					WebChart.Titles.Add(new ChartTitle() { Text = dt1.TableName.ToString() });
					panelDescStatsCharts.Controls.Add(WebChart);
				}


				splitter1.ClientVisible = true;

				//var ch = utilCharts.Highcharts()

			}
			else
			{
				splitter1.ClientVisible = false;

				panelDescStats.ClientVisible = false;
				panelDescStatsCharts.ClientVisible = false;
			}



			//Missing Data
			if (chkOpt_miss.Checked)
			{

				pivotMissing.DataSource = (DataTable)Session["proj_data_stack"];
				pivotMissing.DataBind();
				panelMissing.ClientVisible = true;
				//panelCharts.ClientVisible = false;

			}
			else
			{
				panelMissing.ClientVisible = false;
			}



			//Data Table
			if (chkOpt_data.Checked)
			{
				gridStackedData.DataSource = (DataTable)Session["proj_data_stack"];
				gridStackedData.DataBind();
				panelData.ClientVisible = true;
				//panelCharts.ClientVisible = false;

			}
			else
			{
				panelData.ClientVisible = false;
			}

			if (chkOpt_data_wide1.Checked)
			{
				gridStackedData.DataSource = (DataTable)Session["proj_data_stack"];
				gridStackedData.DataBind();
				panelDataWide1.ClientVisible = true;
				//panelCharts.ClientVisible = false;

			}
			else
			{
				panelDataWide1.ClientVisible = false;
			}



		}

	}

	protected WebChartControl CreateChart(DataTable dt_descstats)
	{
		WebChartControl WebChart = new WebChartControl();


		WebChart.DataSource = dt_descstats;
		WebChart.SeriesDataMember = "timept";

		SideBySideBarSeriesView view = new SideBySideBarSeriesView();
		DataSourceBasedErrorBars errbar = new DataSourceBasedErrorBars("sd");
		errbar.Name = "SD";
		errbar.NegativeErrorDataMember = "SDminus";
		errbar.PositiveErrorDataMember = "SDplus";
		errbar.Direction = ErrorBarDirection.Both;
		errbar.EndStyle = ErrorBarEndStyle.Cap;
		errbar.Color = Color.Black;
		errbar.LineStyle.Thickness = 1;

		view.Indicators.Add(errbar);

		//FixedValueErrorBars fixbar = new FixedValueErrorBars("fix");
		//fixbar.Name = "fix";
		//fixbar.NegativeError = 2;
		//fixbar.PositiveError = 10;
		//fixbar.Direction = ErrorBarDirection.Both;
		//fixbar.EndStyle = ErrorBarEndStyle.Cap;
		//fixbar.Color = Color.Red;
		//fixbar.LineStyle.Thickness = 3;

		//view.Indicators.Add(fixbar);

		WebChart.SeriesTemplate.ArgumentDataMember = cboHistLevels.Value.ToString();
		WebChart.SeriesTemplate.ValueDataMembers.AddRange(new string[] { "Value_Average" });
		WebChart.SeriesTemplate.View = view;

		WebChart.Width = 500;
		WebChart.Height = 200;
		WebChart.DataBind();
		WebChart.EnableViewState = true;

		return WebChart;
	}



	//protected void ASPxCheckBox1_CheckedChanged(object sender, EventArgs e)
	//{
	//	ASPxPivotGrid1.OptionsChartDataSource.ProvideDataByColumns = !ASPxCheckBox1.Checked;
	//}

	#endregion







	#region PivotTable of Selected Measures	

	protected void PivotSelMeas_OnDataBinding(object sender, EventArgs e)
	{
		int x = 0;

	}

	protected void PivotSelMeas_Concat(object sender, PivotGridCustomSummaryEventArgs e)
	{
		Debug.Print("ENTER PivotSelMeas_Concat");
		var x = e.DataField;
		//if (e.DataField != field_meas) return;
		if (e.DataField.Name != "field_meas") return;

		// Get the record set corresponding to the current cell.
		PivotDrillDownDataSource ds = e.CreateDrillDownDataSource();

		string concat = "";
		// Iterate through the records and count the orders.
		for (int i = 0; i < ds.RowCount; i++)
		{
			PivotDrillDownDataRow row = ds[i];
			string sep = (i == 0) ? "" : "<br>";

			string newtext = row["studymeasname"].ToString();
			string isREL = row["isREL"].ToString();

			if (isREL == "REL")
			{
				newtext = String.Format(@"<p style=""background-color: gold; display:inline; text-align: right;"">{0}</p>", newtext);
			}

			concat = String.Format("{0}{1}{2}", concat, sep, newtext);
			//// Get the order's total sum.
			//decimal orderSum = (decimal)row[fieldExtendedPrice];
			//if (orderSum >= minSum) order500Count++;
		}

		if (ds.RowCount > 0)
		{
			e.CustomValue = concat;
		}
		Debug.Print("EXIT PivotSelMeas_Concat");

	}

	#endregion



	protected void gridWide1Data_OnDataBound(object sender, EventArgs e)
	{
		if (gridWide1Data.Columns.Count > 1)
		{
			gridWide1Data.Columns[0].FixedStyle = GridViewColumnFixedStyle.Left;
			gridWide1Data.Columns[1].FixedStyle = GridViewColumnFixedStyle.Left;
			gridWide1Data.Columns[2].FixedStyle = GridViewColumnFixedStyle.Left;
			gridWide1Data.Columns[3].FixedStyle = GridViewColumnFixedStyle.Left;
			gridWide1Data.Columns[4].FixedStyle = GridViewColumnFixedStyle.Left;
		}
	}

	protected void pivotDescStats_OnCustomChartDataSourceData(object sender, EventArgs e)
	{
		int x = 0;
	}


	protected void WebChart_OnDataBinding(object sender, EventArgs e)
	{

		int x = 0;

	}


	protected void LoadDataSet(int pk)
	{

		DataSet dset = BuildDataSet();

		DataTable data = dset.Tables["Data"];
		int nrecs_data = 0;
		if (data != null)
		{
			nrecs_data = ((DataTable)dset.Tables["Data"]).Rows.Count;
			Session["proj_data"] = (DataTable)dset.Tables["Data"];
			Session["proj_data_stack"] = (DataTable)dset.Tables["Data_Stacked"];


			//Need to calculate Z-scores if needed
			SQL_utils sql = new SQL_utils("data");
			DataTable dtcompvars = sql.DataTable_from_ProcName("dp.spCompvars", sql.CreateParam("dataproj_pk", pk.ToString(), "int"));

			if (dtcompvars != null)
			{

				#region Z values

				//Get new values
				foreach (DataRow row in dtcompvars.Rows)
				{

					//Calculate Z
					string curr_Variable = row.Field<string>("varname").ToString();
					string ref_timept = row.Field<string>("ref_timept").ToString();

					
					double? ref_M = data.AsEnumerable().Where(r => r.Field<string>("timept") == ref_timept).Select(r => r.Field<double?>(curr_Variable)).Average();
					double? ref_SD = data.AsEnumerable().Where(r => r.Field<string>("timept") == ref_timept).Select(r => r.Field<double?>(curr_Variable)).StandardDeviation();
					int ref_N = data.AsEnumerable().Where(r => r.Field<string>("timept") == ref_timept).Select(r => r.Field<double?>(curr_Variable)).Count();

					row["ref_M"] = ref_M;
					row["ref_SD"] = ref_SD;
					row["ref_N"] = ref_N;
				}
				#endregion

			}
			sql.Close();


		}

		lblLoadedDataInfo.Text = String.Format("Loaded Data Information: {0} total records.", nrecs_data);
		Session["proj_infomsg"] = (DataTable)dset.Tables["InfoMsg"];


		gridInfoMsg.DataSource = (DataTable)Session["proj_infomsg"];
		gridInfoMsg.DataBind();

		btnLoad.ClientVisible = false;
		panelInfo.ClientVisible = true;

	}


	protected DataSet BuildDataSet()
	{
		var beg = DateTime.Now;
		Debug.Print("ENTER BuildDataSet" + System.DateTime.Now.ToString());
		DataSet dset = new DataSet();
		SQL_utils sql = new SQL_utils("data");


		string s = uwac.trk.dataops.GetCSV(gridSelSubj.GetSelectedFieldValues("subjID"));
		string sm = uwac.trk.dataops.GetCSV(gridSelMeas.GetSelectedFieldValues("studymeasID"));
		string ids = uwac.trk.dataops.GetCSV(gridSelSubj.GetSelectedFieldValues("id"));
		string fldpks = uwac.trk.dataops.GetCSV(gridSelVars.GetSelectedFieldValues("fldpk"));
		string tp_csv = uwac.trk.dataops.GetCSV(gridSelMeas.GetSelectedFieldValues("TimePt"));

		List<int> measid = uwac.trk.dataops.GetListInt(gridSelMeas.GetSelectedFieldValues("measureID")).Distinct().ToList();
		List<string> meas = uwac.trk.dataops.GetListString(gridSelMeas.GetSelectedFieldValues("MeasName")).Distinct().ToList();
		List<string> tbls = uwac.trk.dataops.GetListString(gridSelMeas.GetSelectedFieldValues("tblname")).Distinct().ToList();
		List<string> tps = uwac.trk.dataops.GetListString(gridSelMeas.GetSelectedFieldValues("TimePt")).Distinct().ToList();
		List<string> flds_list = uwac.trk.dataops.GetListString(gridSelVars.GetSelectedFieldValues("fldname"));


		string sqlcode_s = String.Format("select * from (select id, timepoint_text timept, groupname as [group], coalesce(txgrp, '**NA**') txgrp, subjstatus, subjstatusdetail, sex " +
			" , coalesce(ethnicitydesc, 'UNKNOWN') as race, coalesce(hispanicdesc, 'UNKNOWN') as ethnicity " +
			" , subjNotes, convert(VARCHAR, txstart, 101) txstart, txstartnote, subjID " +
			" from uwautism_research_backend..vwMasterStatus_S_txgrp a1 " +
			" CROSS JOIN (select timepoint_text from uwautism_research_backend..tbltimepoint where studyID = {0} and timepoint_text in ({2}) ) a2 " +
			" where studyID = {0} and subjID in ({1}) ) a "
			, Master.Master_studyID.ToString()
			, s
			, tp_csv);

		int NsSubjTp = sql.DataTable_from_SQLstring(sqlcode_s).Rows.Count;

		DataTable dtmsg = new DataTable();
		dtmsg.Columns.Add(new DataColumn("Measure", typeof(string)));
		dtmsg.Columns.Add(new DataColumn("N_Records", typeof(int)));
		dtmsg.Columns.Add(new DataColumn("N_IDs", typeof(int)));
		dtmsg.Columns.Add(new DataColumn("N_TimePts", typeof(int)));
		dtmsg.Columns.Add(new DataColumn("N_Vars", typeof(int)));
		dtmsg.Columns.Add(new DataColumn("Message", typeof(string)));
		dtmsg.TableName = "InfoMsg";
		string msg;

		List<string> tbls_to_process = new List<string>();
		List<string> messages = new List<string>();
		messages.Add("<b>Data Loading...</b>");
		List<string> sqlcode_t = new List<string>();
		List<string> sqlcode_t_dups = new List<string>();

		List<string> meas_to_skip = new List<string>();

		//Loop through tables/measures 
		for (int t = 0; t < tbls.Count; t++)
		{
			string check_N_vars = String.Format("select count(*) n from def.vwFld where measureID={0} and fldpk in ({1})", measid[t], fldpks);
			int N_vars = sql.IntScalar_from_SQLstring(check_N_vars);

			//Check the N's
			string check_Ns1 = String.Format(" select count(*) N, count(distinct(dbo.fnGetTimePoint_text_from_StudymeasID(studymeasID))) N_TimePts, count(distinct(id)) N_IDs  " +
				" from {0} where verified in (0,1) and studymeasID in ({1}) and ID in ({2} )", tbls[t], sm, ids);
			DataTable Ns = sql.DataTable_from_SQLstring(check_Ns1);
			int Ns1 = Ns.Rows[0].Field<int>("N");
			int N_TimePts = Ns.Rows[0].Field<int>("N_TimePts");
			int N_IDs = Ns.Rows[0].Field<int>("N_IDs");


			//Dups by ID within a single studymeas
			string check_Ns2 = String.Format(" select ID, studymeasID, count(*) n from {0} where verified in (0,1) and studymeasID in ({1}) and ID in ({2}) group by ID, studymeasID  having count(*) > 1 ", tbls[t], sm, ids);
			DataTable dups = sql.DataTable_from_SQLstring(check_Ns2);
			int Ns2 = dups.Rows.Count;
			string remove_dup_IDs = "";
			var dupsIDs_csv = "";
			if (Ns2 > 0)
			{	
				//IF there are ID's with dups in a studymeas, remove it when checking the next type of dups
				string plural = (Ns2 > 1) ? "s" : "";
				var dupsIDs = dups.AsEnumerable().Select(f => f.Field<string>("ID")).ToList();
				dupsIDs_csv = String.Join("','", dupsIDs);
				remove_dup_IDs = " and a.ID not in ('" + dupsIDs_csv + "') ";
			}


			//Dups by ID within a TimePoint and Measure.
			//If there are dups here, we don't want to join it with the other measures.
			//These will be skipped when creating the unified file.
			string check_Ns3 = String.Format(" select a.ID, measureID, b.timepointID, c.timepoint_text, count(*) n from {0} a " + 
			" join uwautism_research_backend..tblstudymeas b ON a.studymeasID=b.studymeasID " +
			" join uwautism_research_backend..tbltimepoint c ON b.timepointID=c.timepointID " +
			" where verified in (0,1) and a.studymeasID in ({1}) and a.ID in ({2}) {3} " + 
			" group by a.ID, measureID, b.timepointID, c.timepoint_text having count(*) > 1 ", tbls[t], sm, ids, remove_dup_IDs);

				
			DataTable dups3 = sql.DataTable_from_SQLstring(check_Ns3);
			int Ns3 = dups3.Rows.Count;

			Debug.Print(String.Format("tbl={0} Ns2={1} Ns3={2} sm={3}", tbls[t], Ns2, Ns3, sm));


			if (N_vars == 0)
			{
				//No Data so don't include
				msg = String.Format("No variables selected.", meas[t]);
			}
			else if (Ns1 == 0)
			{
				//No Data so don't include
				msg = String.Format("No records for these subjects.", meas[t]);
			}
			else if (Ns3 > 0)
			{
				//No Data so don't include
				int measureID = dups3.AsEnumerable().Select(f => f.Field<int>("measureID")).Min();
				meas_to_skip.Add(measureID.ToString());
				msg = String.Format("Skipped.  Multiple records for {0} within a timepoint. Not clear how to join.", meas[t]);
			}
			else if (Ns1 > 0 & Ns2 >= 0)
			{
				//Make sure some of these measures are selected


				//NEXT get the fieldnames
				string sqlcode_flds = String.Format("select fldname, fldname_miss2null  from def.vwFld where fldpk in ({0}) and tblpk=(select tblpk from def.tbl where measureID={1} ) " +
					" and (case when fielddatatype like '%char%' then 'text' when fielddatatype like '%date%' then 'date' else 'numeric' end) = 'numeric' "
					, fldpks, measid[t]);
				DataTable flds = sql.DataTable_from_SQLstring(sqlcode_flds);
				//List<string> vars_no_quote = flds.AsEnumerable().Select(f => f.Field<string>("fldname")).ToList();
				List<string> vars_no_quote = flds.AsEnumerable().Select(f => f.Field<string>("fldname_miss2null")).ToList();

				string tmp = "";
				msg = "";

				if (Ns2 == 0)
				{
					tmp = String.Format(" LEFT JOIN (select {2}, id as id{1}, studymeasID as smID{1} from {0} " +
						" where verified in (0,1) and studymeasID in ({3}) ) t{1} ON a.id=t{1}.id{1} and a.TimePt=dbo.fnGetTimePoint_text_from_StudymeasID(t{1}.smID{1})"
						, tbls[t], t, String.Join(",", vars_no_quote), sm);

					msg = String.Format("Yes - data loaded", Ns1);
				}
				else if (Ns2 > 0)
				{
					string plural = (Ns2 > 1) ? "s" : "";
					//var dupsIDs = dups.AsEnumerable().Select(f => f.Field<string>("ID")).ToList();
					//var dupsIDs_csv = String.Join("','", dupsIDs);

					tmp = String.Format(" LEFT JOIN (select {2}, id as id{1}, studymeasID as smID{1} from {0} " +
							" where verified in (0,1) and studymeasID in ({3}) and ID not in ('{4}') ) t{1} ON a.id=t{1}.id{1} and a.TimePt=dbo.fnGetTimePoint_text_from_StudymeasID(t{1}.smID{1})"
							, tbls[t], t, String.Join(",", vars_no_quote), sm, dupsIDs_csv);

					msg = String.Format("Yes data loaded. Duplicate recs for {0} subject{1} excluded. [{2}]", Ns2, plural, dupsIDs_csv);


					string tmp_dupdata = String.Format("select * from (select {2}, id as id{1}, studymeasID as smID{1} from {0} " +
					" where verified in (0,1) and studymeasID in ({3}) and ID not in ('{4}') ) t{1} "
					, tbls[t], t, String.Join(",", vars_no_quote), sm, dupsIDs_csv);

					sqlcode_t_dups.Add(tmp_dupdata);
				}

				sqlcode_t.Add(tmp);

				//Add this table to those to be processed
				tbls_to_process.Add(tbls[t]);


			}
			//else if (Ns2 > 0)
			//{
			//	string plural = (Ns2 > 1) ? "s" : "";
			//	msg = String.Format("X - Duplicate recs for {0} subject{1}. [{2}]", Ns2, plural, dupsIDs_csv);

			//	string tmp = String.Format(" LEFT JOIN (select {2}, id as id{1}, studymeasID as smID{1} from {0} " +
			//		" where verified in (0,1) and studymeasID in ({3}) and ID not in ({4}) ) t{1} ON a.id=t{1}.id{1} and a.TimePt=dbo.fnGetTimePoint_text_from_StudymeasID(t{1}.smID{1})"
			//		, tbls[t], t, String.Join(",", vars_no_quote), sm);
			//	sqlcode_t.Add(tmp);

			//	//Add this table to those to be processed
			//	tbls_to_process.Add(tbls[t]);

			//}
			else
			{
				msg = String.Format("{0} unprocessed.", meas[t]);
			}
			DataRow row = dtmsg.NewRow();
			row["Measure"] = meas[t];
			row["Message"] = msg;
			row["N_records"] = Ns1;
			row["N_IDs"] = N_IDs;
			row["N_TimePts"] = N_TimePts;
			row["N_Vars"] = N_vars;
			dtmsg.Rows.Add(row);
		}


		//Results from processing tables 
		if (sqlcode_t.Count == 0)
		{
			dset.Tables.Add(dtmsg);
		}
		else if (sqlcode_t.Count > 0)
		{
			string sqlcode = sqlcode_s + String.Join(" ", sqlcode_t);


			Debug.Print(String.Format("done building sqlcode  {0}", System.DateTime.Now.ToString() ));
			DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
			Debug.Print(String.Format("done retrieving dt  {0}       nrecs={1}", System.DateTime.Now.ToString(), dt.Rows.Count.ToString()));


			//Stack the data completely, so pivot table can calculate descriptives natively
			List<string> vars_to_keep = new List<string> { "id", "group", "timept", "txgrp", "subjstatus", "sex" };

			//Need to remove fields for the Skipped measures.
			string meas_to_skip_csv = String.Join(",", meas_to_skip);
			DataTable dt_flds_to_drop = sql.DataTable_from_SQLstring(
				String.Format("select fldname from def.vwFld where measureID in ({0})", meas_to_skip_csv));
			List<string> flds_to_drop = dt_flds_to_drop.AsEnumerable().Select(f => f.Field<string>("fldname")).ToList();

			List<string> flds_list_noskips = flds_list.Except(flds_to_drop).ToList();


			DataTable dt_stack = utilStats.StackData(dt, vars_to_keep, flds_list_noskips);
			dt_stack.TableName = "Data_Stacked";
			Debug.Print(String.Format("done stacking data  nrows={0}  {1}", dt_stack.Rows.Count.ToString(), System.DateTime.Now.ToString()));

			DataView dv = new DataView(dt_stack);
			dv.RowFilter = "Value IS NOT null";
			DataTable dt_new = dv.ToTable();

			Debug.Print(String.Format("done stacking data  nrows={0}  nrwos2={1} {2}", dt_stack.Rows.Count.ToString(), dt_new.Rows.Count.ToString(), System.DateTime.Now.ToString()));


			dt.TableName = "Data";
			//Add tables to dataset
			dset.Tables.Add(dt);
			dset.Tables.Add(dt_stack);
			dset.Tables.Add(dtmsg);


		}

		//NEED TO PROCESS THESE DUPS
		//if (sqlcode_t_dups.Count > 0)
		//{
		//	foreach(string s in sqlcode_t_dups)
		//	{
		//		string sqlcode = sqlcode_s + String.Join(" ", sqlcode_t);

		//		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);


		//		//Remove Missing Values
		//		string tbls_csv = String.Join("','", tbls_to_process);
		//		DataTable dt_missing_to_null = utilStats.DataTable_MissingToNULL(dt, tbls_csv, false, fldpks);
		//		dt_missing_to_null.TableName = "Data";

		//		//Stack the data completely, so pivot table can calculate descriptives natively
		//		List<string> vars_to_keep = new List<string> { "id", "group", "timept", "txgrp", "subjstatus", "sex" };
		//		DataTable dt_stack = utilStats.StackData(dt_missing_to_null, vars_to_keep, flds_list);
		//		dt_stack.TableName = "Data_Stacked";

		//		//Add tables to dataset
		//		dset.Tables.Add(dt_missing_to_null);
		//		dset.Tables.Add(dt_stack);
		//		dset.Tables.Add(dtmsg);
		//	}
		//}



		sql.Close();

		return dset;

	}



	#region Retrieve data from DB

	//We never need to get all the subjects, only those in the selected set
	protected DataTable GetSelectedSubjects(int subjset_pk)
	{
		Debug.Print("GetSelectedSubjects " + System.DateTime.Now.ToString());
		string sqlcode = "select subjID, id, groupname as [Group], coalesce(txgrp, '**NA**') txgrp, subjstatus, subjstatusdetail, sex,  " +
		" coalesce(ethnicitydesc, 'UNKNOWN') as race, coalesce(hispanicdesc, 'UNKNOWN') as ethnicity " +
		", subjNotes, convert(VARCHAR, txstart, 101) txstart, txstartnote " +
		"from uwautism_research_backend..vwMasterStatus_S_txgrp a where studyID = " + Master.Master_studyID.ToString() +
		" and subjID in (select subjID from dp.Subj  where subjset_pk = " + subjset_pk.ToString() + ") ";


		SQL_utils sql = new SQL_utils("data");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		Session["proj_subj"] = dt;
		sql.Close();
		return dt;

	}

	protected DataTable GetVarsForDataproject(int pk, string VarType)
	{

		var smID_csv = uwac.trk.dataops.GetCSV(gridSelMeas.GetSelectedFieldValues(gridSelMeas.KeyFieldName));

		SQL_utils sql = new SQL_utils("data");

		string sqlcode = "select * from (select fldpk, b.measureID, measname, fldname, fieldlabel " +
			", (case when fieldvaluesetid > 0  and InAnalysis > 0 then 'X-categ' " +
			"        when fielddatatype in ('smallint','numeric','int','float','bigint','decimal') and InAnalysis > 0 then 'X-contin' " +
			"        when fielddatatype in ('char','varchar','nvarchar') and InAnalysis>0 then 'X-categ' " +
			"        else '' end) CoreVar " +
			", (case when fielddatatype in ('char','varchar','nvarchar') then 'text' " +
			"        when fielddatatype in ('date','datetime','smalldatetime') then 'date' " +
			"        when fielddatatype in ('smallint','numeric','int','float','bigint','decimal') then ' num' else '' end) VarType" +
			" from def.fld a " +
			" join def.tbl b ON a.tblpk = b.tblpk " +
			" join uwautism_research_backend..tblMeasure c ON b.measureID = c.measureID " +
			" where a.fldpk in (select fldpk from dp.Var where dataproj_pk = " + pk.ToString() + " ) " +
			" and fldname not in ('id','indexnum','studymeasID','created','createdby','updated','updatedby','scored','scoredby','verified')" +
			" and b.measureID in (select measureID from uwautism_research_backend..tblStudyMeas where studymeasID in (" + smID_csv + ")) " +
			" ) x " +
			" where VarType like '%" + VarType + "%'" +
			"order by CoreVar desc, measname, VarType, fldname";
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
		sql.Close();

		Session["proj_vars"] = dt;

		int nvars = dt.Rows.Count;
		//int nmeas = gridLkupMeas.GridView.GetSelectedFieldValues(gridLkupMeas.KeyFieldName).ToList().Count;

		//Session["vars_info"] = 
		Debug.Print("");
		Debug.Print("   LOADING VARS INTO SESSION " + System.DateTime.Now.ToString());
		Debug.Print("");

		return dt;
	}


	#endregion



	protected void Hist(DataTable dt, List<string> flds, List<string> fldlabels, string facetrow_fld, string facetcol_fld)
	{

		for (int i = 0; i < flds.Count; i++)
		{
			string f = flds[i];
			string lbl = fldlabels[i];

			var hist = utilCharts.Histograms_byRowLevel_byColLevel(dt, f, facetrow_fld, facetcol_fld, 400, 300, "", lbl);

			if (hist != null)
			{
				Literal head = new Literal();
				head.Text = String.Format("<h3>{0} {1}</h3>", f, lbl);
				panelCharts.Controls.Add(head);
				panelCharts.Controls.Add(hist);
			}
		}

	}



	private void gridLkupMeas_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
	{
		if (e.Column.FieldName == "IsSelected")
		{
			ASPxGridView grid = (ASPxGridView)sender;
			e.Value = (grid.Selection.IsRowSelectedByKey(e.GetListSourceFieldValue("studymeasID"))) ? "X" : "";
		}
	}
	private void gridLkupVars_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
	{
		//Debug.Print("x");
		string col = e.Column.FieldName;
		int idx = e.ListSourceRowIndex;

		if (e.Column.FieldName == "IsSelected")
		{
			ASPxGridView grid = (ASPxGridView)sender;
			e.Value = (grid.Selection.IsRowSelectedByKey(e.GetListSourceFieldValue("fldpk"))) ? "X" : "";
		}
	}


}
