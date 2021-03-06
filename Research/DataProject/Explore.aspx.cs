﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Serialization;
using uwac;
using uwac.trk;
using DevExpress.Web;
using DevExpress.Web.WebClientUIControl;
using DevExpress.Docs;
using DevExpress.Office.API;
using DevExpress.Pdf;
using DevExpress.Pdf.Interop;
using DevExpress.Xpf.Printing;
using DevExpress.XtraCharts;
using DevExpress.XtraPrintingLinks;
using DevExpress.XtraRichEdit.API.Native;

using NReco.PivotData.Output;
using uwac.data;
using System.Runtime.Serialization.Formatters.Binary;

//public partial class PointSeries : ChartBasePage{
public partial class DataProject_Explore : BasePage
{

	int chartWhist;
	int chartHhist;
	int chartWscat;
	int chartHscat;
	int chartWbar;
	int chartHbar;
	int chartWline;
	int chartHline;
	int movavg;
	int dataproj_pk;
	int rptpk;
	string filename;
	string projTitle;
	//DxCharts dxchart;
	List<Color> colors;
	//List<DxChartOrder> orders;
	Dataproject dataproject;
	DPData dpdata;
	//TEST REMOVING THIS SessionOrders sessionorders;
	string selectedsheet;
	bool printDebug = true;
	List<string> dummydata;
	DxReport dataproject_rpt;

	#region Page Setup
	protected void Page_Init(object sender, EventArgs e)
	{
		printDebug = true;
		this.Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = this.Master.Master_studyID.ToString();
	}


	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("Explore.aspx");
	}



	#endregion

	#region Page Load

	protected void Page_Load(object sender, EventArgs e)
	{

		string filename = Request.QueryString["filename"];

		if (!IsPostBack)
		{
			PageLoad_Initial();

		}
		//Is PostBack
		else
		{

			PageLoad_PostBack(e);

		}

	}

	protected void Page_Unload(object sender, EventArgs e)
	{
		bool on = false;
		if (on)
		{
			log("=UNLOAD=====================================================================");
			LogDataprojectInfo();
			LogOrdersInfo();
			log("============================================================================");
		}
	}

	protected void PageLoad_Initial()
	{
		log(String.Format("*** INITIAL ***"));

		InitializeSessionVars();

		panel.ContentTemplateContainer.Controls.Clear();

		ProcessQueryStringParams();

		if (dataproj_pk > 0 & rptpk > 0)
		{
			BIND_gridFiles();
			
			txtReportTitle.Text = dataproject_rpt.rpttitle;
			txtReportDesc.Text = dataproject_rpt.rptdesc;

			BIND_orders();

			Session["dataproject_rpt"] = dataproject_rpt;
		}
		else if (dataproj_pk > 0)
		{
			BIND_gridFiles();
			dataproject_rpt = new DxReport(dataproj_pk);

			txtReportTitle.Text = dataproject_rpt.rpttitle;
			txtReportDesc.Text = "";

			Session["dataproject_rpt"] = dataproject_rpt;
		}


		SQL_utils sql = new SQL_utils("backend");
		int n_txgrp_levels = sql.IntScalar_from_SQLstring("select count(distinct(txgrp)) from trk.vwMasterStatus_S where studyID=" + Master.Master_studyID.ToString());
		bool addtxgrp = (n_txgrp_levels > 1) ? true : false;
		int n_timept_levels = sql.IntScalar_from_SQLstring("select count(distinct(timepointID)) from tblTimePoint where studyID=" + Master.Master_studyID.ToString());
		bool addtimept = (n_timept_levels > 1) ? true : false;
		sql.Close();



		InitializeChartSizes();
		InitializeDropdowns(addtxgrp, addtimept);
		InitializeTokenboxes(addtxgrp, addtimept);

		//ToggleTabVisible("tabPlots", true);
		//ToggleTabVisible("tabTables", true);
	}


	protected void ProcessQueryStringParams()
	{


		if (Request.QueryString["pk"] != null)
		{
			Int32.TryParse(Request.QueryString["pk"], out dataproj_pk);

			if (dataproj_pk > 0)
			{

				log("** Instantiating dataproject - #" + dataproj_pk.ToString());
				dataproject = new Dataproject(dataproj_pk, true);
				Session["dataproject"] = dataproject;


				gridDataProject.Visible = false;

				Session["dataproj_pk"] = dataproj_pk.ToString();

				Session["projTitle"] = dataproject.projTitle;

				lblProjTitle.Visible = true;
				lblProjTitle.Text = String.Format("#{0} {1}", dataproj_pk, dataproject.projTitle);



				if (dataproject.studyID != Master.Master_studyID)
				{
					Master.Master_studyID = dataproject.studyID;
				}

			}
		}


		if(Request.QueryString["rptpk"] != null)
		{
			Int32.TryParse(Request.QueryString["rptpk"], out rptpk);

			if(rptpk > 0 & dataproj_pk > 0)
			{
				dataproject_rpt = new DxReport(dataproj_pk, rptpk);

				string rpttitle = String.Format(" & Report #{0}: {1}", dataproject_rpt.rptnum, dataproject_rpt.rpttitle);

				lblProjTitle.Text += rpttitle;
			}
		}
	}


	protected void PageLoad_PostBack(EventArgs e)
	{
		string state = String.Format("{0} {1}"
			, (IsCallback) ? " ((IsCallback))" : ""
			, (IsPostBack) ? " **IsPostBack**" : ""
			);
		log(state);
		
		if(Session["dataproject_rpt"] != null)
		{
			dataproject_rpt = (DxReport)Session["dataproject_rpt"];
		}

		if (Session["dataproject"] != null)
		{
			//load the dataproject
			dataproject = (Dataproject)Session["dataproject"];
		}


		if (Session["dpdata"] != null)
		{
			//load the dataproject
			dpdata = (DPData)Session["dpdata"];

			//lblSelectedDataInfo2.Text = dpdata.Info;
			//callbackSelectedDataInfo.ClientVisible = true;

			//Display the dpdata.Info
			//if (dpdata.Info == null | dpdata.Info == "")
			//{
			//	//lblDataInfo.Visible = false;
			//	//lblSelectedDataInfo2.Visible = false;

			//}
			//else
			//{
			//	//log(" $$$$$$$$$$$$$$");
			//	//log(String.Format(" $$$$$$$$$$$$ trying to set selected data info to [{0}]", dpdata.Info));
			//	//log(" $$$$$$$$$$$$$$");

			//	lblSelectedDataInfo2.Text = dpdata.Info;
			//	//lblDataInfo.Visible = true;
			//	//lblSelectedDataInfo2.Visible = true;

			//	callbackSelectedDataInfo.ClientVisible = true;
			//}

			//dpdata.TestFilterChange();
		}


		//if (Session["sessionorders"] != null)
		//{
		//	sessionorders = (SessionOrders)Session["sessionorders"];
		//	//BIND_orders();
		//}

		if (Session["allvars"] != null)
		{
			gridSelVars.DataSource = Session["allvars"];
			gridSelVars.DataBind();
		}
	}




	#endregion

	#region Initialize controls

	protected void InitializeSessionVars()
	{
		Session["dataproject"] = null;
		Session["dpdata"] = null;
		Session["datadict_num"] = null;
		Session["datadict_text"] = null;
		Session["datadict_date"] = null;
		Session["datadict_age"] = null;
		Session["datasheets"] = null;
		Session["selectedvars"] = null;
		Session["sessionorders"] = null;

		Session["datafilter"] = "";

		Session["dataproject_rpt"] = null;
	}


	protected void InitializeChartSizes()
	{

		chartWhist = 300;
		chartHhist = 300;
		chartWscat = 300;
		chartHscat = 300;
		chartWbar = 300;
		chartHbar = 300;
		chartWline = 300;
		chartHline = 300;

		lblWhist.Text = chartWhist.ToString();
		lblHhist.Text = chartHhist.ToString();
		lblWscat.Text = chartWscat.ToString();
		lblHscat.Text = chartHscat.ToString();
		lblWbar.Text = chartWbar.ToString();
		lblHbar.Text = chartHbar.ToString();
		lblWline.Text = chartWline.ToString();
		lblHline.Text = chartHline.ToString();

		trackWhist.Value = chartWhist;
		trackHhist.Value = chartHhist;
		trackWscat.Value = chartWscat;
		trackHscat.Value = chartHscat;
		trackWbar.Value = chartWbar;
		trackHbar.Value = chartHbar;
	}

	protected void InitializeDropdowns(bool addtxgrp, bool addtimept)
	{
		PopulateDropdownItems(cboColorsvarHIST, new List<string> { "none", "group", "sex" }, addtxgrp, addtimept);
		PopulateDropdownItems(cboPanelvarHIST, new List<string> { "none", "group", "sex" }, addtxgrp, addtimept);


		PopulateDropdownItems(cboXaxisvarBAR, new List<string> { "variable", "group", "sex" }, addtxgrp, addtimept);
		PopulateDropdownItems(cboColorsvarBAR, new List<string> { "none", "variable", "group", "sex" }, addtxgrp, addtimept);
		PopulateDropdownItems(cboPanelvarBAR, new List<string> { "none", "variable", "group", "sex" }, addtxgrp, addtimept);

		PopulateDropdownItems(cboColorsvarSCAT, new List<string> { "none", "group", "sex" }, addtxgrp, addtimept);
		PopulateDropdownItems(cboPanevarSCAT, new List<string> { "none", "group", "sex" }, addtxgrp, addtimept);
		PopulateDropdownItems(cboPanelvarSCAT, new List<string> { "none", "group", "sex" }, addtxgrp, addtimept);


		PopulateDropdownItems(cboXaxisvarLINE, new List<string> { "variable" }, false, addtimept);
		PopulateDropdownItems(cboYaxisvarLINE, new List<string> { "variable" }, false, addtimept);
		PopulateDropdownItems(cboColorsvarLINE, new List<string> { "none", "variable", "group", "sex" }, addtxgrp, addtimept);
		PopulateDropdownItems(cboPanelvarLINE, new List<string> { "none", "variable", "group", "sex", "id", "ref_id" }, addtxgrp, addtimept);

		PopulateDropdownItems(cboSubgroupsvarPCA, new List<string> { "none", "group", "sex" }, addtxgrp, addtimept);


		cboColorsvarHIST.Value = "none";
		cboPanelvarHIST.Value = "none";

		cboXaxisvarBAR.Value = "variable";
		cboColorsvarBAR.Value = "none";
		cboPanelvarBAR.Value = "none";

		cboColorsvarSCAT.Value = "none";
		cboPanevarSCAT.Value = "none";
		cboPanelvarSCAT.Value = "none";

		cboXaxisvarLINE.Value = "timept";
		cboYaxisvarLINE.Value = "variable";
		cboColorsvarLINE.Value = "none";
		cboPanelvarLINE.Value = "none";
	}

	protected void InitializeTokenboxes(bool addtxgrp, bool addtimept)
	{

		PopulateTokenboxItems(tokXTrow, new List<string> { "group", "sex" }, addtxgrp, addtimept);
		PopulateTokenboxItems(tokXTcol, new List<string> { "group", "sex" }, addtxgrp, addtimept);
		PopulateTokenboxItems(tokXTpanel, new List<string> { "group", "sex" }, addtxgrp, addtimept);


		PopulateTokenboxItems(tokXTcell, new List<string> { "id" });
		PopulateTokenboxItems(tokXTstats, new List<string> { "N", "Mean", "SD" });


		tokXTrow.Value = "timept";
		tokXTcol.Value = "group";
		tokXTcell.Value = "id";
		tokXTstats.Value = "N";

		InitializeTokenboxes_GrpsTimepts();
	}

	protected void InitializeTokenboxes_GrpsTimepts()
	{
		if (dataproject != null)
		{
			if (dataproject.Dataset != null)
			{
				log("~~~~~~~~~~~~~ get Group Timept tokens from dataproject.Dataset");
				List<string> groups = dataproject.ListGroups();
				PopulateTokenboxItems(tokGroups, groups);

				tokGroups.Enabled = true;
				tokGroups.Value = String.Join(",", groups);

				List<string> timepts = dataproject.ListTimepoints();
				PopulateTokenboxItems(tokGroups, timepts);

				tokTimepts.Enabled = true;
				tokTimepts.Value = String.Join(",", timepts);



			}



			else if (Request.QueryString["pk"] != null)
			{
				log("~~~~~~~~~~~~ get Group Timept tokens from DB");
				SQL_utils sql = new SQL_utils("data");

				string grp_code = String.Format("select distinct(groupname) groupname from uwautism_research_backend.trk.vwMasterStatus_S where subjID in " +
						" (select subjID from dp.subj where subjset_pk = (select subjset_pk from dp.DataProject where dataproj_pk =  {0}))", Request.QueryString["pk"]);


				string tp_code = String.Format("select distinct(timepoint_text) timepoint_text from uwautism_research_backend..tblstudymeas a " +
						" join uwautism_research_backend..tbltimepoint b ON a.timepointID = b.timepointID " +
						" where studymeasID in " +
						" (select studymeasID from uwautism_research_data.dp.Meas where dataproj_pk = {0})", Request.QueryString["pk"]);



				DataTable dt_grps = sql.DataTable_from_SQLstring(grp_code);
				DataTable dt_tps = sql.DataTable_from_SQLstring(tp_code);

				if (dt_grps.HasRows())
				{
					List<string> groups = dt_grps.AsEnumerable().Select(f => f.Field<string>("groupname")).ToList();
					PopulateTokenboxItems(tokGroups, groups);

					tokGroups.Enabled = true;
					tokGroups.Value = String.Join(",", groups);
				}

				if (dt_tps.HasRows())
				{
					List<string> timepts = dt_tps.AsEnumerable().Select(f => f.Field<string>("timepoint_text")).ToList();
					PopulateTokenboxItems(tokTimepts, timepts);
					tokTimepts.Enabled = true;
					tokTimepts.Value = String.Join(",", timepts);
				}
				sql.Close();
			}
		}

	}


	protected void ReInitialize()
	{
		Debug.WriteLine("****** !!!! ****** Here in ReInitialize()  ******** !!!!!!! ******* ");
		//List<string> selected_allvars = dataops.GetListString(gridSelVars.GetSelectedFieldValues("varname"));
		//List<string> selected_allvars = dataops.GetListString(gridSelVars.GridView.GetSelectedFieldValues("varname"));

		//List<string> selected_numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		//List<string> selected_textvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
		//List<string> selected_datevars = dataops.GetListString(gridVarsDate.GridView.GetSelectedFieldValues("varname"));
		//List<string> selected_agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));

		string varname = String.Empty;
		string datatype = String.Empty;

		List<string> selected_numvars = new List<string>();
		List<string> selected_textvars = new List<string>();
		List<string> selected_datevars = new List<string>();

		List<string> selected_allvars = new List<string>();

		for (int i = 0; i < gridSelVars.VisibleRowCount; i++)
		{
			if (gridSelVars.Selection.IsRowSelected(i))
			{
				varname = gridSelVars.GetRowValues(i, new string[] { "varname" }).ToString();
				datatype = gridSelVars.GetRowValues(i, new string[] { "datatype" }).ToString();

				selected_numvars.Add(varname);
			}
		}


		dpdata.numericvars = selected_numvars;
		dpdata.textvars = selected_textvars;
		dpdata.datevars = selected_datevars;

		//PopulateDropdownItems(cboXaxisvar, selected_textvars);


		PopulateDropdownItems(cboColorsvarHIST, selected_textvars);
		PopulateDropdownItems(cboPanelvarHIST, selected_textvars);

		PopulateDropdownItems(cboColorsvarBAR, selected_textvars);
		PopulateDropdownItems(cboPanelvarBAR, selected_textvars);
		PopulateDropdownItems(cboColorsvarSCAT, selected_textvars);
		PopulateDropdownItems(cboPanevarSCAT, selected_textvars);
		PopulateDropdownItems(cboPanelvarSCAT, selected_textvars);




		List<string> vars_for_xaxis_lineplot = new List<string> { "variable", "timept " };
		if (selected_datevars.Count > 0) vars_for_xaxis_lineplot.AddRange(selected_datevars);
		//FIXIT!!!  if (selected_agevars.Count > 0) vars_for_xaxis_lineplot.AddRange(selected_agevars);

		PopulateDropdownItems(cboXaxisvarLINE, vars_for_xaxis_lineplot);
		PopulateDropdownItems(cboYaxisvarLINE, vars_for_xaxis_lineplot);


		//Crosstabs 

		List<string> selected_num_text = new List<string>();
		selected_num_text.AddRange(selected_numvars);
		selected_num_text.AddRange(selected_textvars);

		PopulateTokenboxItems(tokXTrow, selected_num_text);
		PopulateTokenboxItems(tokXTcol, selected_num_text);
		PopulateTokenboxItems(tokXTpanel, selected_num_text);
		PopulateTokenboxItems(tokXTcell, selected_num_text);

		//PopulateTokenboxItems(tokXaxisvarSCAT, selected_numvars);
		//PopulateTokenboxItems(tokYaxisvarSCAT, selected_numvars);

		//InitializeTokenboxes_GrpsTimepts();
	}



	#endregion


	#region Custom Sorting and JS properties for vars grid (allows selected vars to stay at top of grid)

	protected void gridVarsAll_OnInit(object sender, EventArgs e)
	{
		var lookup = (ASPxGridLookup)sender;
		lookup.GridView.CustomColumnSort += Grid_CustomColumnSort_BySelected;
		lookup.GridView.CustomJSProperties += GridView_CustomJSProperties;
	}


	protected void gridVarsNum_OnInit(object sender, EventArgs e)
	{
		var lookup = (ASPxGridLookup)sender;
		lookup.GridView.CustomColumnSort += Grid_CustomColumnSort_BySelected;
		lookup.GridView.CustomJSProperties += GridView_CustomJSProperties;
	}

	protected void gridVarsText_OnInit(object sender, EventArgs e)
	{
		var lookup = (ASPxGridLookup)sender;
		lookup.GridView.CustomColumnSort += Grid_CustomColumnSort_BySelected;
		lookup.GridView.CustomJSProperties += GridView_CustomJSProperties;
	}

	protected void gridVarsDate_OnInit(object sender, EventArgs e)
	{
		var lookup = (ASPxGridLookup)sender;
		lookup.GridView.CustomColumnSort += Grid_CustomColumnSort_BySelected;
		lookup.GridView.CustomJSProperties += GridView_CustomJSProperties;
	}

	protected void gridVarsAge_OnInit(object sender, EventArgs e)
	{
		var lookup = (ASPxGridLookup)sender;
		lookup.GridView.CustomColumnSort += Grid_CustomColumnSort_BySelected;
		lookup.GridView.CustomJSProperties += GridView_CustomJSProperties;

	}

	private void Grid_CustomColumnSort_BySelected(object sender, CustomColumnSortEventArgs e)
	{
		ASPxGridView grid = sender as ASPxGridView;
		bool isRow1Selected = grid.Selection.IsRowSelectedByKey(e.GetRow1Value(grid.KeyFieldName));
		bool isRow2Selected = grid.Selection.IsRowSelectedByKey(e.GetRow2Value(grid.KeyFieldName));
		e.Handled = isRow1Selected != isRow2Selected;
		if (e.Handled)
		{
			if (e.SortOrder == DevExpress.Data.ColumnSortOrder.Descending)
				e.Result = isRow1Selected ? 1 : -1;
			else
				e.Result = isRow1Selected ? -1 : 1;
		}
	}


	void GridView_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
	{
		e.Properties["cpSelectedVars"] = (sender as ASPxGridView).GetSelectedFieldValues("varname").ToArray();
	}


	#endregion



	#region BIND controls


	protected void BIND_gridFiles()
	{
		log("@@@ BIND_gridFiles @@@");

		if (dataproject.HasFiles())
		{
			log(String.Format("dataproject does have files!!"));
			gridFile.DataSource = dataproject.dt_files;
			gridFile.DataBind();
			gridFile.Enabled = true;
			gridFile.NullText = "Select Data File...";
			gridFile.ClientEnabled = true;
		}
		else
		{
			log(String.Format("dataproject DOES NOT have files!!"));
		}
	}


	protected void BIND_gridDataSheets()
	{
		log("@@@ BIND_gridDataSheets @@@");
		DataTable dt_sheets = dataproject.DatasetSheets();
		if (dt_sheets.HasRows())
		{
			log("  -  has sheets");
			//gridDataSheets.DataSource = (DataTable)Session["datasheets"];
			gridDataSheets.DataSource = dt_sheets;
			gridDataSheets.DataBind();
			gridDataSheets.Visible = true;
			gridDataSheets.NullText = "Select a worksheet...";


			//Session[selectedsheet] = selectedsheet;


		}
		else
		{
			log("  -  has NO sheets!");

		}

	}


	protected void BIND_vars(string param)
	{
		log(String.Format("@@@ BIND_vars  sheet = {0} @@@", dataproject.selectedsheet));


		if (dataproject.selectedsheet != null && dataproject.selectedsheet != "")
		{

			if (param == "all")
			{
				BIND_vars_all();
				//BIND_vars_num();
				//BIND_vars_text();
				//BIND_vars_date();
				//BIND_vars_age();
			}
			//else if (param == "num")
			//{
			//	BIND_vars_num();
			//}
			//else if (param == "text")
			//{
			//	BIND_vars_text();
			//}
			//else if (param == "date")
			//{
			//	BIND_vars_date();
			//}
			//else if (param == "age")
			//{
			//	BIND_vars_age();
			//}
		}


	}

	protected void BIND_vars_all()
	{
		DataTable datadict_all = dataproject.datadict_subtype("all");

		//gridVarsAll.DataSource = datadict_all;
		//gridVarsAll.DataBind();

		Session["allvars"] = datadict_all;

		gridSelVars.DataSource = datadict_all;
		gridSelVars.DataBind();


	}

	//protected void BIND_vars_num()
	//{
	//	DataTable datadict_num = dataproject.datadict_subtype("num");

	//	gridVarsNum.DataSource = datadict_num;
	//	gridVarsNum.DataBind();

	//}
	//protected void BIND_vars_text()
	//{
	//	DataTable datadict_text = dataproject.datadict_subtype("text");

	//	gridVarsText.DataSource = datadict_text;
	//	gridVarsText.DataBind();
	//}
	//protected void BIND_vars_date()
	//{
	//	DataTable datadict_date = dataproject.datadict_subtype("date");

	//	gridVarsDate.DataSource = datadict_date;
	//	gridVarsDate.DataBind();
	//}
	//protected void BIND_vars_age()
	//{
	//	DataTable datadict_age = dataproject.datadict_subtype("age");

	//	gridVarsAge.DataSource = datadict_age;
	//	gridVarsAge.DataBind();
	//}





	protected void BIND_orders()
	{

		Debug.WriteLine("@@@ BIND_orders @@@");
		if (dataproject_rpt.orders != null)
		{

			DataTable orders = dataproject_rpt.InvoiceSummary();
				//DataTable orders = new InvoiceSummary(dataproject_rpt.orders);
				Debug.WriteLine("orders.Rows.Count={0}", orders.Rows.Count);

			if (orders.HasRows())
			{
				gridOrders.DataSource = orders;
				gridOrders.DataBind();
				gridOrders.Visible = true;
			}
			else
			{
				gridOrders.DataSource = null;
				gridOrders.DataBind();
				gridOrders.Visible = true;
			}

		}
	}
	#endregion




	#region (A) - load dataset from Excel
	protected void LoadExcelDataset(string xlfile)
	{
		log(String.Format(" === LoadExcelData {0} ===", xlfile));
		if (xlfile.Contains(".xlsx"))
		{
			LoadExcelDataset(xlfile, "Data");
		}
	}

	protected void LoadExcelDataset(string xlfile, string sheet)
	{
		log(String.Format(" === LoadExcelData {0} {1} ===", xlfile, sheet));

		if (xlfile.Contains(".xlsx"))
		{
			//Session["filename"] = xlfile;

			dataproject.PopulateDatasetFromExcelfile(xlfile);

			if (dataproject.Dataset.Tables.Count > 0)
			{
				//Session["dset"] = dataproject.Dataset;
				log("  -  now dataproject.Dataset is populated!");
				//log(String.Format(" - - heading to LoadSheets from LoadExcelData"));
				//LoadSheets(dataproject.Dataset);
				//LoadVars(dataproject.Dataset, sheet);
			}

		}

	}

	#endregion

	#region (B) - load Data 
	//This is only called from the callbackSelectedDataInfo
	protected void LoadDPData(string sheet)
	{
		log(String.Format("@@@ LoadDPData  sheet = {0} @@@", sheet));

		string filter = (Session["datafilter"] == null) ? "" : Session["datafilter"].ToString();

		if (Session["dpdata"] == null)
		{
			if (dataproject.selectedsheet != sheet)
			{
				dataproject.selectedsheet = sheet;
			}

			if (dataproject.selectedsheet != null & dataproject.selectedsheet != "")
			{
				log("  -  begin loading dpdata");
				ResetFilter();
				filter = Session["datafilter"].ToString();
				dpdata = new DPData(dataproject, filter);
				Session["dpdata"] = dpdata;
				
			}
		}

		else if (Session["dpdata"] != null)
		{
			//New Sheet
			// If the selected value on the page differ from the dataproject then
			//		1) update the dataproject.selectedsheet accordingly 
			//		2) update the dpdata accordingly
			if (dataproject.selectedsheet != gridDataSheets.Value.ToString())
			{
				log("************************************ SWITCHING SHEET ***************************************");
				ResetFilter();
				filter = Session["datafilter"].ToString();
				
				dataproject.selectedsheet = gridDataSheets.Value.ToString();
				dpdata = new DPData(dataproject, filter);
				
				Session["dpdata"] = dpdata;
			}
			//Same sheet
			else
			{
				dpdata = (DPData)Session["dpdata"];

				//Check for filter change
				if (dpdata.filter != filter)
				{
					dpdata.filter = filter;
					//here the Info should be updated.
					Session["dpdata"] = dpdata;
				}

			}
		}


	

	}

	protected void ResetFilter()
	{
		txtFilter.Text = "";
		//InitializeTokenboxes_GrpsTimepts();
		Session["datafilter"] = "";
	}

	protected string ConstructFilter()
	{
		var grps = dataproject.ListGroups();

		var tps = dataproject.ListTimepoints();

		List<string> sel_grps = tokGroups.Value.ToString().Split(',').ToList();
		List<string> sel_tps = tokTimepts.Value.ToString().Split(',').ToList();

		List<string> mis_grps = grps.Except(sel_grps).ToList();
		List<string> mis_tps = tps.Except(sel_tps).ToList();

		//If the SUBJECTS worksheet is selected then do not use the TIMEPTS filter
		if( dataproject.selectedsheet=="Subjects")
		{
			mis_tps = new List<string>();
		}

		string filter = "";

		if (mis_grps.Count > 0)
		{
			filter += String.Format(" group in ('{0}') ", String.Join("','", sel_grps));
		}
		if (mis_tps.Count > 0)
		{
			filter += (filter == "") ? "" : Environment.NewLine + " and ";
			filter += String.Format(" timept in ('{0}') ", String.Join("','", sel_tps));
		}

		if (txtFilter.Text != "")
		{
			filter += (filter == "") ? "" : Environment.NewLine + " and ";
			filter += txtFilter.Text;
		}
		return filter;
	}

	#endregion
	protected void DisplaySelectedDataInfo()
	{
		if (dpdata != null)
		{
			lblDataInfo.Visible = true;
			lblSelectedDataInfo2.Visible = true;
			lblSelectedDataInfo2.Text = dpdata.Info;
		}
		else
		{
			lblDataInfo.Visible = false;
			lblSelectedDataInfo2.Visible = false;

		}
	}


	protected void DisplaySelectedVarInfo()
	{
		log("  ======= DisplaySelectedVarInfo ======= ");

		List<string> allvars = dataops.GetListString(gridSelVars.GetSelectedFieldValues("varname"));


		DataTable dt_selvars = new DataTable();
		dt_selvars.Columns.Add(new DataColumn("varname"));


		if (allvars.Count > 0)
		{
			log("  ======= allvars.Count > 0 ======= ");

			if (dpdata != null)
			{
				string selectedsheet = dpdata.selectedsheet;

				DataView dv = new DataView();
				//DataTable dt_dict = dataproject.DataDictionaryForSheet(selectedsheet);
				DataTable dt_dict = dataproject.datadict_subtype("all");
				dv = dt_dict.AsDataView();


				string notDataSheet = (selectedsheet != "Data") ?
					String.Format(" and measname='{0}'", selectedsheet.Replace("Data_", "")) : "";


				string filter = String.Format("varname in ('{0}') {1}"
					, String.Join("','", allvars)
					, notDataSheet);
				dv.RowFilter = filter;
				DataTable dt = dv.ToTable();


				var x = from f in dt.AsEnumerable()
						select new
						{
							measname = f.Field<string>("measname"),
							varname = f.Field<string>("varname"),
							fldlabel = f.Field<string>("FieldLabel"),
							datatype = f.Field<string>("DataType"),
							vartype = f.Field<string>("vartype")

						};

				DataTable dtvars = x.CustomCopyToDataTable();


				Session["selectedvars"] = dtvars;
				gvSelectedVars.DataSource = dtvars;
				gvSelectedVars.DataBind();

				gvSelectedVars.Visible = true;
				lblVarLabels.Visible = true;
				btnVarLabelsHide.Visible = true;
				btnVarLabelsShow.Visible = true;
				//btnVarLabelsShow.Enabled = false;
			}
		}
		else
		{
			log("  ======= ** NOT ** allvars.Count > 0 ======= ");

			gvSelectedVars.Visible = false;
			lblVarLabels.Visible = false;
			btnVarLabelsHide.Visible = false;
			btnVarLabelsShow.Visible = false;
		}
	}


	protected void ToggleTabVisible(string name, bool makeVisible)
	{
		int idx = tabSteps.TabPages.IndexOfName(name);
		tabSteps.TabPages[idx].ClientVisible = makeVisible;
	}



	#region Populate Dropdowns


	protected void PopulateDropdownItems(ASPxComboBox cbo, List<string> defaultvals)
	{
		PopulateDropdownItems(cbo, defaultvals, false, false);
	}

	protected void PopulateDropdownItems(ASPxComboBox cbo, List<string> defaultvals, bool addtxgrp, bool addtimept)
	{
		cbo.Items.Clear();
		string cboname = cbo.ID;

		cbo.Items.AddRange(PopulateItems(cbo.ClientInstanceName
			, defaultvals
			, null));

		if (addtimept)
		{
			cbo.Items.Add("timept");
		}
		if (addtxgrp)
		{
			cbo.Items.Add("txgrp");
		}

	}


	protected void PopulateDropdownItems(ASPxComboBox cbo, List<string> defaultvals, List<string> datavals)
	{
		cbo.Items.Clear();
		string cboname = cbo.ID;
		cbo.Items.AddRange(PopulateItems(cbo.ClientInstanceName, defaultvals, datavals));
	}

	#endregion


	#region Populate Tokenboxes

	protected void PopulateTokenboxItems(ASPxTokenBox cbo, List<string> defaultvals)
	{
		PopulateTokenboxItems(cbo, defaultvals, false, false);
	}

	protected void PopulateTokenboxItems(ASPxTokenBox cbo, List<string> defaultvals, bool addtxgrp, bool addtimept)
	{
		cbo.Items.Clear();
		string cboname = cbo.ID;
		cbo.Items.AddRange(PopulateItems(cbo.ClientInstanceName, defaultvals, null));
		if (addtimept) cbo.Items.Add("timept");
		if (addtxgrp) cbo.Items.Add("txgrp");
	}


	protected void PopulateTokenboxItems(ASPxTokenBox cbo, List<string> defaultvals, List<string> datavals)
	{
		cbo.Items.Clear();
		string cboname = cbo.ID;

		cbo.Items.AddRange(PopulateItems(cbo.ClientInstanceName, defaultvals, datavals));
	}



	protected List<ListEditItem> PopulateItems(string controlname, List<string> defaultvals, List<string> xtravals)
	{
		List<ListEditItem> items = new List<ListEditItem>();

		if (Master.Master_studyID == 1076)
		{
			List<string> exempt = new List<string> { "cboXaxisvarLINE", "cboYaxisvarLINE", "tokXTcell", "tokXTstats" };
			if (!exempt.Contains(controlname))
			{
				defaultvals.Add("txstyle");
				defaultvals.Add("txintensity");
			}
		}
		//if (controlname == "cboColorsvar" || controlname == "cboPanelvar")
		//{
		//	defaultvals.Add("id");
		//	defaultvals.Add("ref_id");
		//}

		foreach (string v in defaultvals)
		{
			string txt = v;
			if (v == "none") txt = "*none*";
			else if (v == "variable") txt = "variables";
			ListEditItem itm = new ListEditItem();
			itm.Value = v; itm.Text = txt;

			if (controlname == "cboXaxisvar" & v == "variable") itm.Selected = true;
			else if (v == "none") itm.Selected = true;

			items.Add(itm);
		}
		if (xtravals != null)
		{
			foreach (string v in xtravals)
			{
				string txt = String.Format("Data: {0}", v);
				ListEditItem itm = new ListEditItem();
				itm.Value = v; itm.Text = txt;
				items.Add(itm);
			}
		}
		return items;
	}


	//protected void PopulateDropdownItems_default(ASPxComboBox cbo)
	//{
	//	//defaults
	//	cbo.Items.Clear();
	//	string cboname = cbo.ID;
	//	cbo.Items.AddRange(GetDefaultItems(cbo.ClientInstanceName));
	//}

	//protected List<ListEditItem> GetDefaultItems(string controlname)
	//{
	//	List<string> defaultvals = new List<string> { "none", "variable", "timept", "group", "txgrp", "sex" };
	//	return PopulateItems(controlname, defaultvals, null);
	//}


	#endregion


	#region Callbacks 


	protected void callbackSelectors_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>>>>>>>>>>> callbackSelectors_OnCallback [{0}]", e.Parameter.ToString()));
	}

	protected void callbackSpecifics_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>>>>>>>>>>> callbackSpecifics_OnCallback [{0}]", e.Parameter.ToString()));

		//FIX  List<string> selected_textvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));

		//PopulateDropdownItems(cboColorsvar, selected_textvars);
		//PopulateDropdownItems(cboPanelvar, selected_textvars);
		//PopulateDropdownItems(cboXaxisvar, selected_textvars);
	}

	//OK LoadExcelDataset
	protected void callbackFile_OnCallback(object source, CallbackEventArgsBase e)
	{
		log(String.Format(">>>>>>>>>>>> callbackFile_OnCallback [{0}]", e.Parameter.ToString()));

		if (e.Parameter == "0")
		{
			//Process LIVE DATA here...
			string x = e.Parameter.ToString();


		}
		else if (e.Parameter.Contains(".xlsx"))
		{
			LoadExcelDataset(e.Parameter.ToString());
		}
		else
		{
			int pk = Convert.ToInt32(e.Parameter);

			if (pk > 0)
			{
				string url = String.Format("Explore.aspx?pk={0}", e.Parameter); //Redirect to this page, now with a dataproject_pk
				DevExpress.Web.ASPxWebControl.RedirectOnCallback(url);
			}

		}

	}

	//OK LoadExcelDataset   BIND_gridDataSheets();
	protected void callbackDataSheets_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>>>>>>>>>>> callbackDataSheets_OnCallback [{0}]", e.Parameter.ToString()));
		log("      -- Sheet has been changed -- ");

		LoadExcelDataset(e.Parameter.ToString());

		BIND_gridDataSheets();

	}

	//OK BIND_vars
	protected void callbackVars_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>>>>>>>>>>> callbackVars_OnCallback  [{0}]", e.Parameter.ToString()));

		string param = e.Parameter.ToString();

		BIND_vars(param);

	}

	protected void callbackFilter_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>> callbackFilter_OnCallback {0}", e.Parameter.ToString()));
		//log(" HERE WE UPDATE THE SELECTED DATA INFO !!");

		string sheet = e.Parameter.ToString();

		Session["datafilter"] = ConstructFilter();

	}





	protected void callbackSelectedDataInfo_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>>>>>>>>>>> callbackSelectedDataInfo_OnCallback [{0}]", e.Parameter.ToString()));
		//log(" HERE WE UPDATE THE SELECTED DATA INFO !!");

		string sheet = e.Parameter.ToString();


		LoadDPData(sheet);
		DisplaySelectedDataInfo();
	}


	protected void callbackSelectVarInfo_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>>>>>>>>>>> callbackSelectVarInfo_OnCallback [{0}]", e.Parameter.ToString()));

		string p = e.Parameter.ToString();

		if (p == "clear")
		{
			Session["selectedvars"] = null;
			gvSelectedVars.Visible = false;
			lblVarLabels.Visible = false;
			btnVarLabelsHide.Visible = false;
			btnVarLabelsShow.Visible = false;

		}
		//BIND_vars(); // ??
		else
		{
			DisplaySelectedVarInfo();
		}
	}



	protected void callbackMissing_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>> callbackMissing_OnCallback {0}", e.Parameter.ToString()));

		List<string> numvars = new List<string>();
		
		////FIX numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));


		////bool useall = (numvars.Count == 0) ? true: false; // chkMissing_AllVars.Checked;
		////if (useall)
		////{
		////	var x1 = gridVarsNum.GridView.VisibleRowCount;
		////	for (int i = 0; i < gridVarsNum.GridView.VisibleRowCount; i++)
		////	{
		////		string v = gridVarsNum.GridView.GetRowValues(i, "varname").ToString(); 
		////		numvars.Add(v);
		////	}
		////}

		//if (numvars.Count > 0)
		//{
		//	//List<int> txstudies = new List<int> { }

		//	List<string> idvars = new List<string> { "ref_id", "group", "txgrp", "timept" };

		//	dpdata.Data_FullyStacked(idvars, numvars);

		//	Session["dtstacked"] = dpdata.dtstacked;

		//	log(String.Format(">>> numrows dtstacked = {0}", dpdata.dtstacked.Rows.Count.ToString()));

		//	//ASPxPivotGrid pivot = CreateMissingPivot();

		//	PopulatePivotMissing(dpdata.dtstacked);
		//}

	}



	protected void callbackViewData_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>> callbackViewData_OnCallback {0}", e.Parameter.ToString()));

		////FIX
		//List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		//List<string> txtvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
		//List<string> datevars = dataops.GetListString(gridVarsDate.GridView.GetSelectedFieldValues("varname"));
		//List<string> agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));


		//List<string> idetc = new List<string> { "id", "timept", "group", "txgrp", "txstyle", "txintensity" };

		//List<string> keepvars = new List<string>();
		//keepvars.AddRange(idetc);
		//keepvars.AddRange(numvars);
		//keepvars.AddRange(txtvars);
		//keepvars.AddRange(datevars);
		//keepvars.AddRange(agevars);

		//for (int i = 0; i < keepvars.Count; i++)
		//{
		//	keepvars[i] = keepvars[i].ToLower();
		//}

		//DataTable dt = dpdata.Data_SelectColumns(keepvars);

		//int x = (Request.Browser.ScreenPixelsWidth) * 2 - 100;

		//ASPxGridView gv = new ASPxGridView();
		//gv.Width = x;
		//gv.SettingsPager.Mode = GridViewPagerMode.ShowAllRecords;
		//gv.Settings.VerticalScrollableHeight = 400;
		//gv.Settings.VerticalScrollBarMode = ScrollBarMode.Visible;
		//gv.DataSource = dt;
		//gv.DataBind();

		//Label lbl = new Label();
		//lbl.Text = String.Format("# records = {0}", dt.Rows.Count);
		//callbackViewData.Controls.Clear();
		//callbackViewData.Controls.Add(lbl);
		//callbackViewData.Controls.Add(gv);


	}


	//protected void callbackVarsText_OnCallback(object sender, CallbackEventArgsBase e)
	//{
	//	log(String.Format(">>>>>>>>>>>> callbackVarsText_OnCallback [{0}]", e.Parameter.ToString()));
	//	List<string> txtvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
	//	int x = 0;

	//}



	protected void callbackOutput_OnCallback(object source, CallbackEventArgsBase e)
	{
		log(String.Format(">>>>>>>>>>>> callbackOutput_OnCallback [{0}]", e.Parameter.ToString()));

		string outputstatus = CreateOutput(e.Parameter);

		//if(outputstatus != "ok")
		//{
		//	AddErrorToOutput(outputstatus);
		//}
	}



	protected void callbackOrders_OnCallback(object source, CallbackEventArgsBase e)
	{
		log(String.Format(">>>>>>>>>>>> callbackOrders_OnCallback  [{0}]", e.Parameter));
		var p = e.Parameter;

		HandleOrders(p);

	}

	#endregion






	#region Step 1 - Gather Orders 
	protected DxTableOrder GatherTableOrder()
	{
		List<string> plotrequests = dataops.GetListString(chkPlots.SelectedValues);
		DxTableOrder order = new DxTableOrder();


		string worksheet = (gridDataSheets.Value == null) ? null : gridDataSheets.Value.ToString();

		if (worksheet == null)
		{
			return order;
		}
		else
		{

			order.worksheet = gridDataSheets.Value.ToString();

			if (plotrequests.Contains("Crosstabs"))
			{
				DxCrosstabsSettings mysettings = CrosstabsSettings();
				if (mysettings.HasVars()) order.list_settings.Add(mysettings);
			}

			string filter = (Session["datafilter"] == null) ? "" : Session["datafilter"].ToString();

			order.filter = filter;


			DataTable dt_selvars = (DataTable)Session["selectedvars"];
			order.dt_selectedvars = dt_selvars;

			return order;
		}
	}

	protected DxChartOrder GatherChartOrder()
	{
		log(String.Format("-------------------- GatherChartOrder --------------------"));

		DataTable dt_selvars = (DataTable)Session["selectedvars"];

		bool hasSelVars = dt_selvars.HasRows();



		List<string> plotrequests = dataops.GetListString(chkPlots.SelectedValues);
		DxChartOrder order = new DxChartOrder();


		string worksheet = (gridDataSheets.Value == null) ? null : gridDataSheets.Value.ToString();

		if (worksheet == null)
		{
			log(String.Format("  -  order IS NULL"));

			//Literal lit = new Literal();
			//lit.Text = "<b>Rats. No data was selected.</b>";
			//callbackOutput.Controls.Add(lit);


			order.errors.Add( "Rats. No data was selected.");

			return order;
		}
		else
		{
			if (!hasSelVars)
			{
				order.errors.Add( "Rats. No variables have been selected.");
			}
			else
			{
				order.worksheet = gridDataSheets.Value.ToString();

				if (plotrequests.Contains("Barchart"))
				{
					DxBarchartSettings mysettings = BarchartSettings();
					if (mysettings.HasVars) order.AddSettings(mysettings);
				}
				if (plotrequests.Contains("Histogram"))
				{
					DxHistogramSettings mysettings = HistogramSettings();
					if (mysettings.HasVars) order.AddSettings(mysettings);
				}

				if (plotrequests.Contains("Lineplot"))
				{
					DxLineplotSettings mysettings = LineplotSettings();
					if (mysettings.HasVars) order.AddSettings(mysettings);
				}
				if (plotrequests.Contains("Scatterplot"))
				{
					DxScatterplotSettings mysettings = ScatterplotSettings();
					if (mysettings.HasVars) order.AddSettings(mysettings);
				}

				string filter = (Session["datafilter"] == null) ? "" : Session["datafilter"].ToString();

				order.filter = filter;

				order.dt_selectedvars = (DataTable)Session["selectedvars"];
				log(String.Format("  -  order CREATED"));
			}
			return order;
		}

	}

	#endregion


	#region Step 2 - Create and Populate Chart and Table settings 


	protected DxHistogramSettings HistogramSettings()
	{
		DxHistogramSettings settings = new DxHistogramSettings();
		settings.maxRow = Convert.ToInt32(trkNumRowsHIST.Value);
		settings.maxCol = Convert.ToInt32(trkNumColsHIST.Value);
		settings.W = Convert.ToInt32(trackWhist.Position);
		settings.H = Convert.ToInt32(trackHhist.Position);
		settings.chartlayout = ConvertChartLayout(cboOutputStyleHIST.Value.ToString());


		int numbins = Convert.ToInt32(trkNumBins.Value);
		settings.numbins = (numbins == 0) ? 15 : numbins;


		settings.shownormalcurve = chkNormalcurve.Checked;
		settings.histMSD = chkHistMSD.Checked;

		settings.panesLayoutDirection = (cboPanes.Value.ToString() == "horizontal") ? PaneLayoutDirection.Horizontal : PaneLayoutDirection.Vertical;
		settings.colors = GetColors();
		settings.colorvar = cboColorsvarHIST.Value.ToString();
		settings.panelvar = cboPanelvarHIST.Value.ToString();

		settings.AddVars((DataTable)Session["selectedvars"]);

		//settings.numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		//List<string> agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));
		//settings.numvars.AddRange(agevars);

		return settings;
	}

	protected DxBarchartSettings BarchartSettings()
	{
		DxBarchartSettings settings = new DxBarchartSettings();
		settings.maxRow = Convert.ToInt32(trkNumRowsBAR.Value);
		settings.maxCol = Convert.ToInt32(trkNumColsBAR.Value);
		settings.W = Convert.ToInt32(trackWbar.Position);
		settings.H = Convert.ToInt32(trackHbar.Position);
		settings.chartlayout = ConvertChartLayout(cboOutputStyleBAR.Value.ToString());


		settings.xaxisvar = cboXaxisvarBAR.Value.ToString(); //xaxisvar;
		settings.colorvar = cboColorsvarBAR.Value.ToString(); //colorsvar;
		settings.panelvar = cboPanelvarBAR.Value.ToString(); //panelvar;

		settings.colors = GetColors();
		settings.AddVars((DataTable)Session["selectedvars"]);
		//settings.numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		//settings.agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));
		return settings;
	}

	protected DxLineplotSettings LineplotSettings()
	{
		DxLineplotSettings settings = new DxLineplotSettings();
		settings.maxRow = Convert.ToInt32(trkNumRowsLINE.Value);
		settings.maxCol = Convert.ToInt32(trkNumColsLINE.Value);
		settings.W = Convert.ToInt32(trackWline.Position);
		settings.H = Convert.ToInt32(trackHline.Position);
		settings.chartlayout = ConvertChartLayout(cboOutputStyleLINE.Value.ToString());

		settings.xaxisvar = cboXaxisvarLINE.Value.ToString(); //xaxisvar;
		settings.yaxisvar = cboYaxisvarLINE.Value.ToString(); //yaxisvar;
		settings.colorvar = cboColorsvarLINE.Value.ToString(); //colorsvar;
		settings.panelvar = cboPanelvarLINE.Value.ToString(); //panelvar;
		settings.legend_pos_h = cboLegendH_LINE.Value.ToString();
		settings.legend_pos_v = cboLegendV_LINE.Value.ToString();
		settings.matchYAxes = chkLineMatchYaxisRange.Checked;
		settings.showLegend = chkLineShowLegend.Checked;
		settings.hideEmptyCharts = chkLineHideBlank.Checked;

		settings.colors = GetColors();


		DataTable dt_selvars = (DataTable)Session["selectedvars"];
		settings.AddVars(dt_selvars);

		//if (settings.xaxisvar != "variable" && settings.yaxisvar != "variable")
		//{
		//	settings.numvars.Add(settings.xaxisvar);
		//	settings.numvars.Add(settings.yaxisvar);
		//}
		//else
		//{
		//	settings.numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		//}
		//settings.datevars = dataops.GetListString(gridVarsDate.GridView.GetSelectedFieldValues("varname"));
		//settings.agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));

		if (settings.datevars.Contains(settings.xaxisvar)) settings.xaxis_is_date = true;
		//if (settings.agevars.Contains(settings.xaxisvar)) settings.xaxis_is_age = true;
		if (settings.numvars.Contains(settings.xaxisvar)) settings.xaxis_is_num = true;
		return settings;
	}

	protected DxScatterplotSettings ScatterplotSettings()
	{
		DxScatterplotSettings settings = new DxScatterplotSettings();
		settings.W = Convert.ToInt32(trackWscat.Position);
		settings.H = Convert.ToInt32(trackHscat.Position);
		settings.chartlayout = ConvertChartLayout(cboOutputStyleSCAT.Value.ToString(), chkHist.Checked);

		int movavgNumPts = Convert.ToInt32(txtPtsCount.Text);
		if (movavgNumPts > 0)
		{
			settings.movavgNumPts = movavgNumPts;
		}

		List<XYpairType> modes = new List<XYpairType>();
		if (chkCorrModeA.Checked) modes.Add(XYpairType.SameVar_AcrossLevelsOfRptMeas);
		if (chkCorrModeB.Checked) modes.Add(XYpairType.DiffVar_WithinLevelsOfRptMeas);
		if (chkCorrModeC.Checked) modes.Add(XYpairType.DiffVar_AcrossLevelsOfRptMeas);
		if (chkCorrModeD.Checked) modes.Add(XYpairType.AllVars_IgnoreLevelsOfRptMeas);

		settings.xypairtypes = modes;
		
		settings.showhist = chkHist.Checked;
		settings.showregline = chkRegline.Checked;
		settings.useMovAvg = chkMovingAvg.Checked;
		settings.colors = GetColors();
		settings.colorvar = cboColorsvarSCAT.Value.ToString();
		settings.panevar = cboPanevarSCAT.Value.ToString();
		settings.panelvar = cboPanelvarSCAT.Value.ToString();

		settings.repeatedmeasVarname = dpdata.dt.ContainsColumnName("timept") ? "timept" : "none";

		//settings.widemode = (DxWideMode)Convert.ToInt32(cboWideMode.Value.ToString());

		//if(settings.widemode == DxWideMode.OnlyAutoCorrAcrossTimept | settings.widemode == DxWideMode.OnlyWithinTimept)
		//{
		//	if (settings.colorvar == "timept" | settings.panelvar == "timept") 
		//	{
		//		settings.repeatedmeasVarname = "timept";
		//	}
		//}


		if (chkJitter.Checked)
		{
			settings.jitter = true;

			double amtx;
			if (Double.TryParse((txtJitterAmtX.Text), out amtx)) settings.jitteramtX = amtx;
			double amty;
			if (Double.TryParse((txtJitterAmtY.Text), out amty)) settings.jitteramtY = amty;

		}

		settings.AddVars((DataTable)Session["selectedvars"]);

		//settings.numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		//settings.agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));
		settings.maxCol = settings.numvars.Count;
		settings.maxRow = settings.numvars.Count;

		if(settings.xypairtypes.Count == 0)
		{
			settings.setup_errors.Add("Scatterplot mode not set.");
		}

		return settings;
	}

	protected DxCrosstabsSettings CrosstabsSettings()
	{
		DxCrosstabsSettings settings = new DxCrosstabsSettings();
		settings.title = "Crosstabs!!";

		//protected Literal CreatePivot(DataTable dt, List<string> pivot_rows, List<string> pivot_cols, string v0)
		int x = 0;
		var row = tokXTrow.Value.ToString().Replace("Data: ", "");
		var col = tokXTcol.Value.ToString().Replace("Data: ", "");
		var panel = tokXTpanel.Value.ToString().Replace("Data: ", "");
		var cell = tokXTcell.Value.ToString().Replace("Data: ", "");
		var stats = tokXTstats.Value.ToString().Replace("Data: ", "");


		List<string> panelvars = panel.Split(',').ToList();


		settings.pivot_rows = row.Split(',').ToList();
		settings.pivot_cols = col.Split(',').ToList();
		settings.pivot_cells = cell.Split(',').ToList();
		settings.stats = stats.Split(',').ToList();
		settings.layout = DxLayout.Horizontal;

		var foo = gvSelectedVars.GetSelectedFieldValues("vartype");

		int number_cat_vars = 2;
		////FIX
		//int number_cat_vars = (chkXTincludenumeric.Checked) ?
		//	gridVarsNum.GridView.GetSelectedFieldValues("varname").Count() :
		//	gridVarsText.GridView.GetSelectedFieldValues("varname").Count();

		settings.decimal_places = Convert.ToInt32(trkDecPlaces.Value);


		return settings;
	}


	protected List<Color> GetColors()
	{
		List<Color> mycolors = new List<Color>();
		mycolors.Add((Color)Color1.Value);
		mycolors.Add((Color)Color2.Value);
		mycolors.Add((Color)Color3.Value);
		mycolors.Add((Color)Color4.Value);
		mycolors.Add((Color)Color5.Value);
		mycolors.Add((Color)Color6.Value);
		mycolors.Add((Color)Color7.Value);
		mycolors.Add((Color)Color8.Value);
		mycolors.Add((Color)Color9.Value);
		mycolors.Add((Color)Color10.Value);
		mycolors.Add((Color)Color11.Value);
		mycolors.Add((Color)Color12.Value);
		mycolors.Add((Color)Color13.Value);
		mycolors.Add((Color)Color14.Value);
		mycolors.Add((Color)Color15.Value);

		return mycolors;

	}

	#endregion

	#region Check Orders for setup_errors
	protected string CheckForSetupErrors(List<DxChartOrder> myorders)
	{
		log(String.Format("-------------------- CheckForSetupErrors [ourder.count={0}]--------------------", myorders.Count));

		string errors = "";
		foreach (DxChartOrder order in myorders)
		{
			foreach(DxChartSettings settings in  order.list_settings)
			{
				if(settings.setup_errors.Count > 0)
				{
					foreach(string e in settings.setup_errors)
					{
						if(e!="") errors += e + Environment.NewLine;
					}
				}
			}
		}
		return  errors;

	}

	#endregion



	#region Step 3 - Place Orders
	protected List<DxTableOrder> PlaceOrders(List<DxTableOrder> myorders)
	{
		log("-------------------- PlaceOrders : Tables --------------------");

		DxTableFactory factory = new DxTableFactory(dataproject, dpdata, myorders);

		return factory.orders;
	}


	protected List<DxChartOrder> PlaceOrders(List<DxChartOrder> myorders)
	{
		log("-------------------- PlaceOrders : Charts --------------------");

		DxChartFactory factory = new DxChartFactory(dataproject, dpdata, myorders);

		return factory.orders;
		
	}
	#endregion




	#region Step 4 - Deliver output to page


	protected void HandleOrders(string p)
	{
		log(String.Format("-------------------- HandleOrders [{0}]--------------------", p));
		//string path = @"c:\_temp\factory\";
		string path = Server.MapPath("~/App_Data/factory/");

		//if (sessionorders == null) sessionorders = new SessionOrders();

		if (p == "SaveNewOrder")
		{

			//HERE Thu Apr 11 2019!!
			// Serialize stuff now in 
			//DxChartOrder cloneneworderC = GatherChartOrder();

			//byte[] result;
			//using (var stream = new MemoryStream())
			//{
			//	var ser = new BinaryFormatter();
			//	ser.Serialize(stream, cloneneworderC);
			//	stream.Flush();
			//	result = stream.ToArray();

			//	SQL_utils sql = new SQL_utils("data");
			//	sql.SaveChartOrder(1, result);
			//}

			//Debug.WriteLine(String.Format("This order is {0} bytes long", result.Length));

			//DxChartOrder neworderC = new DxChartOrder();
			//using (MemoryStream ms = new MemoryStream(result))
			//{
			//	var ser2 = new BinaryFormatter();
			//	neworderC = (DxChartOrder)(ser2.Deserialize(ms));
			//}




			DxChartOrder neworderC = GatherChartOrder();

			if (neworderC.list_settings.Count > 0)
				{
					log(String.Format(" - yes there are orders with [{0}] list_settings ", neworderC.list_settings.Count));

					neworderC.orderSaveState = OrderSaveState.ReadyToSave;
					List<DxChartOrder> completedneworders = PlaceOrders(new List<DxChartOrder>() { neworderC });

					int numorders = dataproject_rpt.orders.NumSavedOrders();
					for (int i = 0; i < completedneworders.Count; i++)
					{
						completedneworders[i].ordernum = numorders + 1 + i;
						dataproject_rpt.orders.SaveOrder(completedneworders[i]);
					}

				}
				else
				{
					log("  - NO ORDERS!");
				}

			DxTableOrder neworderT = GatherTableOrder();
			if (neworderT.list_settings.Count > 0)
			{
				List<DxTableOrder> completedneworders = PlaceOrders(new List<DxTableOrder>() { neworderT });

				int numorders = dataproject_rpt.orders.NumSavedOrders();
				for (int i = 0; i < completedneworders.Count; i++)
				{
					completedneworders[i].ordernum = numorders + 1 + i;
					dataproject_rpt.orders.SaveOrder(completedneworders[i]);
				}

			}

			Session["sessionorders"] = dataproject_rpt.orders;

			BIND_orders();
		}

		else if (p.StartsWith("RemoveOrder"))
		{
			List<string> ps = p.Split('|').ToList();
			int idx = Convert.ToInt32(ps[1]);

			dataproject_rpt.orders.DeleteOrder(idx);

			//Delete from Disk
			foreach(DxChartOrder orderc in dataproject_rpt.orders.chartorders)
			{
				if(orderc.ordernum == idx)
				{
					orderc.DeleteChartsOnDisk(path);
				}
			}

			Session["sessionorders"] = dataproject_rpt.orders;
			
			BIND_orders();

		}

	}

	protected string CreateOutput(string p)
	{
		log(String.Format("-------------------- CreateOutput [{0}]--------------------", p));
		//if (sessionorders == null) sessionorders = new SessionOrders();

		string path = Server.MapPath("~/App_Data/factory/");
		string rptpath = Server.MapPath("~/App_Data/DataReports/");
		string outputstatus = "ok";
		if (p == "clear")
		{

		}
		//else if (p.StartsWith("OldOrder") | p == "NewOrder" | p == "SaveNewOrder")
		else if (p.Contains("Order") | p == "Docx")
		{
			List<DxChartOrder> ordersC = new List<DxChartOrder>();
			List<DxTableOrder> ordersT = new List<DxTableOrder>();

			if (p == "NewOrder" | p == "SaveNewOrder")
			{
				DxChartOrder neworderC = GatherChartOrder();
				DxTableOrder neworderT = GatherTableOrder();
				ordersT = PlaceOrders(new List<DxTableOrder>() { neworderT });
				ordersC = PlaceOrders(new List<DxChartOrder>() { neworderC });

				if (p == "SaveNewOrder")
				{
					foreach (DxChartOrder order in ordersC)
					{
						order.orderSaveState = OrderSaveState.ReadyToSave;
					}
				}

			}

			else if (p.StartsWith("OldOrder"))
			{
				List<string> ps = p.Split('|').ToList();

				int idx = Convert.ToInt32(ps[1]);

				var orders = dataproject_rpt.orders;

				DxOrder oldorder = dataproject_rpt.orders.orders.AsEnumerable().Where(o => o.ordernum == idx).First();

				if (oldorder.ordertype == OrderType.chart)
				{
					ordersC = PlaceOrders(new List<DxChartOrder> { (DxChartOrder)oldorder });
				}
				else if (oldorder.ordertype == OrderType.table)
				{
					ordersT = PlaceOrders(new List<DxTableOrder> { (DxTableOrder)oldorder });
				}

			}
			
			else if (p.StartsWith("DisplayAllOrders") | p == "Docx")
			{
				dataproject_rpt.rpttitle = txtReportTitle.Text;
				dataproject_rpt.rptdesc = txtReportDesc.Text;

				ordersC = PlaceOrders(dataproject_rpt.orders.chartorders);
				ordersT = PlaceOrders(dataproject_rpt.orders.tableorders);
			}

			List<string> outputerrors = new List<string>();
			bool delivertopage = true;
			//Check for errors
			foreach(DxChartOrder orderC in ordersC)
			{				
				if(orderC.errors.Count > 0)
				{
					outputerrors.AddRange(orderC.errors);
					delivertopage = false;
				}
			}


			if (delivertopage)
			{
				DeliverOutputToPage(ordersC, ordersT);
			}
			else
			{
				DeliverOutputToPage(outputerrors);
			}

			if(p=="Docx")
			{
				foreach (DxChartOrder order in ordersC)
				{
					order.ChartsToDisk(path);
				}

				DxDoc doc = new DxDoc(dataproject_rpt, rptpath, path, lblProjTitle.Text, gridFile.Value.ToString(), Master.Master_netid);
				//DxDoc doc = new DxDoc(ordersC, path, lblProjTitle.Text, gridFile.Value.ToString(), Master.Master_netid);

				
				foreach (DxChartOrder order in ordersC)
				{
					order.DeleteChartsOnDisk(path);
				}

				dataproject_rpt.SaveToDB();

			}

		}
		
		return outputstatus;

	}


	protected void DeliverOutputToPage(DxChartFactory factory)
	{
		DeliverOutputToPage(factory.orders, null);
	}

	protected void DeliverOutputToPage(DxChartOrder order)
	{
		DeliverOutputToPage(new List<DxChartOrder> { order }, null);
	}
	protected void DeliverOutputToPage(DxTableFactory factory)
	{
		DeliverOutputToPage(null, factory.orders);
	}

	protected void DeliverOutputToPage(DxTableOrder order)
	{
		DeliverOutputToPage(null, new List<DxTableOrder> { order });
	}


	protected void DeliverOutputToPage(List<DxChartOrder> orders)
	{
		DeliverOutputToPage(orders, null);
	}
	protected void DeliverOutputToPage(List<DxTableOrder> orders)
	{
		DeliverOutputToPage(null, orders);
	}


	protected void DeliverOutputToPage(List<DxChartOrder> chartorders, List<DxTableOrder> tableorders)
	{
		log(" ========= DeliverOutputToPage ========");
		callbackOutput.Controls.Clear();

		//callbackCharts.Controls.Clear();  // Always clear it now that the factory processes multiple orders 

		if (chartorders != null)
		{
			foreach (DxChartOrder order in chartorders)
			{
				Debug.WriteLine(String.Format(" ********************* This CHART order has {0} batches", order.batches.Count));
				foreach (DxChartBatch batch in order.batches)
				{
					Debug.WriteLine(String.Format(" ********************* This CHART batch has {0} charts", batch.charts.Count));

					if (batch.charts.Count > 0)
					{
						System.Web.UI.WebControls.Table t = LayoutOutput.LayoutBatch(batch);

						if (t != null)
						{
							Debug.WriteLine(String.Format("{0} {1}", batch.batchtitle, batch.charts.Count));
							Label batchlabel = new Label();
							batchlabel.Text = batch.batchtitle;
							batchlabel.Font.Bold = true;
							batchlabel.Font.Size = 12;

							callbackOutput.Controls.Add(batchlabel);
							callbackOutput.Controls.Add(t);
							callbackOutput.Controls.Add(new Literal() { Text = "<br/>" });

						}
					}


					if (batch.datatables.Count > 0)
					{
						System.Web.UI.WebControls.Table t2 = LayoutOutput.LayoutBatch(batch, "datatable");
						callbackOutput.Controls.Add(t2);
					}

				}
			}
		}

		if (tableorders != null)
		{
			foreach (DxTableOrder order in tableorders)
			{
				Debug.WriteLine(String.Format(" ********************* This TABLE order has {0} batches", order.batches.Count));
				foreach (DxTableBatch batch in order.batches)
				{
					Debug.WriteLine(String.Format(" ********************* This TABLE batch has {0} tables", batch.tables.Count));
					System.Web.UI.WebControls.Table t = LayoutOutput.LayoutBatch(batch);

					if (t != null)
					{
						Debug.WriteLine(String.Format("{0} {1}", batch.batchtitle, batch.tables.Count));
						Label batchlabel = new Label();
						batchlabel.Text = String.Format("Crosstabs<br/><br/>");
						batchlabel.Font.Bold = true;
						batchlabel.Font.Size = 12;

						callbackOutput.Controls.Add(batchlabel);
						callbackOutput.Controls.Add(t);
						callbackOutput.Controls.Add(new Literal() { Text = "<br/>" });

					}


					//if (batch.tables.Count > 0)
					//{
					//	System.Web.UI.WebControls.Table t2 = LayoutOutput.LayoutBatch(batch);
					//	callbackTables.Controls.Add(t2);
					//}

				}
			}
		}
	}


	protected void DeliverOutputToPage(List<string> errors)
	{

		//protected void AddErrorToOutput(string e)
		foreach(string e in errors)
		{
			Literal lit = new Literal();
			string error = String.Format("<b>{0}</b></br>", e);
			lit.Text = error;
			callbackOutput.Controls.Add(lit);
		}
	}


	protected DxLayout ConvertChartLayout(string layout)
	{
		return ConvertChartLayout(layout, false);
	}

	protected DxLayout ConvertChartLayout(string layout, bool withDiag)
	{
		if (layout == "Upper" & !withDiag) return DxLayout.Upper;
		else if (layout == "Upper" & withDiag) return DxLayout.UpperDiag;
		else if (layout.StartsWith("Rows")) return DxLayout.Horizontal;
		else if (layout.StartsWith("Cols")) return DxLayout.Vertical;
		else return DxLayout.Horizontal;
	}
	#endregion



	#region Clicks to go to other pages
	protected void btnProjects_OnClick(object sender, EventArgs e)
	{
		Response.Redirect("DataProjects.aspx");
	}

	protected void btnEdit_OnClick(object sender, EventArgs e)
	{
		Response.Redirect("Edit.aspx?pk=" + Request.QueryString["pk"]);
	}

	protected void btnFiles_OnClick(object sender, EventArgs e)
	{
		Response.Redirect("Files.aspx?pk=" + Request.QueryString["pk"]);
	}

	#endregion


	protected void PopulatePivotMissing(DataTable dtstacked)
	{
		pivotMissing.DataSource = dtstacked;
		pivotMissing.DataBind();

		pivotMissing.Visible = true;
	}


	public void SerializeObject<T>(T serializableObject, string fileName)
	{
		if (serializableObject == null) { return; }

		try
		{
			XmlDocument xmlDocument = new XmlDocument();
			XmlSerializer serializer = new XmlSerializer(serializableObject.GetType());
			using (MemoryStream stream = new MemoryStream())
			{
				serializer.Serialize(stream, serializableObject);
				stream.Position = 0;
				xmlDocument.Load(stream);
				xmlDocument.Save(fileName);
			}
		}
		catch (Exception ex)
		{
			//Log exception here
		}
	}



	protected DevExpress.Web.ASPxPivotGrid.PivotGridField AddPivotGridField(string v, DevExpress.XtraPivotGrid.PivotArea area)
	{
		DevExpress.Web.ASPxPivotGrid.PivotGridField fld = new DevExpress.Web.ASPxPivotGrid.PivotGridField();
		fld.ID = String.Format("fld{0}", v);
		fld.FieldName = v;
		fld.Area = area;
		return fld;
	}



	protected void LaunchPCA()
	{
		string subgroupsvar = cboSubgroupsvarPCA.Value.ToString();

		List<string> numvars = new List<string>();
		//FIX
		//List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		string method = rblMethod.SelectedItem.Value.ToString();
		List<System.Web.UI.WebControls.Table> tables = new List<System.Web.UI.WebControls.Table>();

		if (subgroupsvar != "none")
		{
			List<PCA> pcas = new List_O_PCA(dpdata, numvars, method, subgroupsvar).pcas;
			for (int a = 0; a < pcas.Count; a++)
			{
				tables.Add(pcas[a].OutputTable);
			}

			if (tables.Count > 0)
			{
			}

		}
		else //no subsets
		{
			PCA pca = new PCA(dpdata, numvars, method, "");
			if (pca.OutputTable != null)
			{
				tables.Add(pca.OutputTable);
			}

		}

		foreach (System.Web.UI.WebControls.Table t in tables)
		{
			callbackOutput.Controls.Add(t);
		}


	}



	#region LOGGING
	protected void LogDataprojectInfo()
	{
		if (dataproject == null)
		{
			log("");
			log("      >>> datproject IS NULL >>>");
			log("");
		}
		else
		{
			log("");
			log("      >>> datproject INFO >>>");
			foreach (string s in dataproject.InfoList())
			{
				log(String.Format("              {0}", s));
			}
			log("      >>> datproject INFO >>>");
			log("");
		}

		LogDPDataInfo();
	}

	protected void LogOrdersInfo()
	{

	}

	protected void LogDPDataInfo()
	{
		if (dpdata != null)
		{
			if (dpdata.dt != null)
			{
				log(String.Format("    /// dpdata.dt has {0} rows.", dpdata.dt.Rows.Count));
				log(String.Format("    /// dpdata.filter = {0}", dpdata.filter));
				log(String.Format("    /// dpdata.dtdict has {0} rows.", dpdata.dtdict.Rows.Count));
				log(String.Format("    /// dpdata.Info =  {0}", dpdata.Info));

				log("");
				//if (dpdata.dtstacked == null)
				//{
				//	log(String.Format("    /// dpdata.dtstacked IS NULL"));
				//}
				//else
				//{
				//	log(String.Format("    /// dpdata.dtstacked has {0}", dpdata.dtstacked.Rows.Count));
				//}
			}
		}

	}

	protected void log(string s)
	{
		if (printDebug)
		{
			Debug.Print(s);
		}
	}

	#endregion

	protected void btnPDF_OnClick(object source, EventArgs e)
	{
		//string path = @"c:\_temp\factory\";
		string path = Server.MapPath("~/App_Data/factory/");
		List<string> files = Directory.GetFiles(path, "*.xml", SearchOption.TopDirectoryOnly).ToList();

		for (int i = 0; i < files.Count; i++)
		{
			string f = files[i];
			files[i] = f.Replace(path, "").Replace(".xml", "");
		}

		MakePDF(files);
	}






	protected float PDFAddPageHeader(PdfGraphics g, int pagenumber)
	{
		float y = 10f;
		float x = 10f;
		float x_right = 760f;
		float yoffset = 4f;
		SolidBrush black = (SolidBrush)Brushes.Black;
		using (Font font16 = new Font("Arial", 16, FontStyle.Bold | FontStyle.Underline))
		using (Font font12 = new Font("Segoe UI", 12))
		using (Font font = new Font("Segoe UI", 10))
		{

			string page = String.Format("pg. {0}", pagenumber.ToString());
			string s1 = lblProjTitle.Text;
			string s2 = gridFile.Value.ToString();
			string s3 = lblSelectedDataInfo2.Text;


			string user_time = String.Format("{0}     {1:MM/dd/yy H:mm}", Master.Master_netid, System.DateTime.Now);


			//page number
			g.DrawString(page, font, black, x_right - (g.MeasureString(page, font).Width), 10);
			//project title
			g.DrawString(s1, font16, black, x, y);
			y = y + g.MeasureString(s1, font16).Height - yoffset;
			//file, user, date
			g.DrawString(s2, font12, black, x, y);
			float x2 = x_right - g.MeasureString(user_time, font).Width;
			g.DrawString(user_time, font, black, x2, y);
			y = y + g.MeasureString(s2, font12).Height - yoffset;
			//Worksheet & filter
			g.DrawString(s3, font, black, x, y);
			y = y + g.MeasureString(s3, font).Height - yoffset;

		}


		return y;
	}




	protected void MakePDF(List<string> chartfiles)
	{
		const float imageLocationX = 40;
		const float imageLocationY = 40;
		int counter = 0;
		using (PdfDocumentProcessor documentProcessor = new PdfDocumentProcessor())
		{
			documentProcessor.CreateEmptyDocument();
			IList<PdfBookmark> bookmarks = documentProcessor.Document.Bookmarks;
			SolidBrush black = (SolidBrush)Brushes.Black;

			//using (Bitmap signatureImage = new Bitmap(HostingEnvironment.MapPath("~/App_Data/PdfDocumentCreationAPIDemoSignHere.emf")))
			using (Font employeeNameFont = new Font("Arial", 16, FontStyle.Bold | FontStyle.Underline))
			using (Font employeeTitleFont = new Font("Segoe UI", 14))
			using (Font defaultFont = new Font("Segoe UI", 10))
			//foreach (DxChart chart in factory.charts)
			//using (Pdf)
			using (PdfGraphics graphics = documentProcessor.CreateGraphics())
			{

				counter++;
				graphics.UseKerning = true;
				//int x = Convert.ToInt32(imageLocationX * counter);
				//int y = Convert.ToInt32(imageLocationY * counter);

				float x = imageLocationX;
				float y = PDFAddPageHeader(graphics, 1);

				//				float y = imageLocationY ;
				float scalex = 0.5f;
				float scaley = 0.8f;
				float yoffset = 4f;

				float tmpy = y;
				float ypos_last_chart = y;

				try
				{
					for (int i = 0; i < chartfiles.Count; i++)
					{
						scalex = 0.5f;
						x = imageLocationX;
						tmpy = ypos_last_chart;
						string path = Server.MapPath("~/App_Data/factory/");
						//string path = @"c:\_temp\factory\";


						//WebChartControl chart = new WebChartControl();
						//chart.LoadFromFile(String.Format("{0}{1}.xml", path, chartfiles[i]));
						//chart.RefreshData();
						//chart.DataBind();

						//callbackCharts.Controls.Add(chart);

						//Save image from the loaded data
						//SaveChartToImage(chart, path, String.Format("{0}{1}","X",chartfiles[i]));


						string file1 = String.Format("{0}{1}.{2}", path, chartfiles[i], "png");
						Bitmap bitmap1 = new Bitmap(file1);
						graphics.DrawImage(bitmap1, new RectangleF(x, tmpy, bitmap1.Width * scalex, bitmap1.Height * scalex));

						ypos_last_chart = tmpy + (bitmap1.Height * scalex) + yoffset;



					}
				}
				catch (Exception ex)
				{ }
				//PrintingSystemBase ps = new PrintingSystemBase();
				//PrintableComponentLinkBase gv1 = new PrintableComponentLinkBase(ps);
				//gv1.Component = gvSelectedVarsExporter;

				//PdfExportOptions options = new PdfExportOptions();
				//options.Compressed = false;
				//gvSelectedVars.ExportPdfToResponse(options);

				//gvSelectedVars.Export


				//MemoryStream chart_stream = (MemoryStream)Session["stream"];

				//WebChartControl chart = new WebChartControl();
				//chart.LoadFromStream(chart_stream);

				////(IChartContainer)chart.chart).Chart.LoadLayout(chart_stream);

				//graphics.DrawImage()

				//graphics.DrawImage(chart_stream
				//	, new Rectangle(x, y, 300, 300));

				//using (Bitmap photo = new Bitmap(HostingEnvironment.MapPath("~/App_Data/Photo" + employee.EmployeeID + ".jpeg")))
				//{
				//	graphics.DrawImage(photo, new RectangleF(x, y, photo.Width, photo.Height));
				//	x = x + photo.Width + 75;
				//}


				//y = y - 16.5f;
				//string text = "Hi there";
				//graphics.DrawString(text, employeeNameFont, black, x - 4.5f, y);
				//y = y + graphics.MeasureString(text, employeeNameFont).Height - 7;
				//text = "here is the title";
				//graphics.DrawString(text, employeeTitleFont, black, x, y);
				//y = y + graphics.MeasureString(text, employeeTitleFont).Height + 25;
				//text = " and the phone 555-1212";
				//graphics.DrawString(text, defaultFont, black, x, y);
				//y = y + graphics.MeasureString(text, defaultFont).Height + 2.5f;
				//text = employee.FirstName.ToLower() + "." + employee.LastName.ToLower()[0] + "@example.com";
				//graphics.DrawString(text, defaultFont, black, x, y);
				//y = y + graphics.MeasureString(text, defaultFont).Height + 3;
				//RectangleF rectangle = new RectangleF(816 - signatureImage.Width - imageLocationX, y + 31, signatureImage.Width, signatureImage.Height);
				//graphics.AddFormField(new PdfGraphicsAcroFormSignatureField("Signature" + employee.EmployeeID, rectangle) { ContentImage = signatureImage });
				int pageNumber = documentProcessor.RenderNewPage(PdfPaperSize.Letter, graphics);
				PdfDestination destination = documentProcessor.CreateDestination(pageNumber, imageLocationX, imageLocationY);
				//bookmarks.Add(new PdfBookmark() { Title = employee.FirstName + " " + employee.LastName, Destination = destination });
			}
			//DevExpress.Web.Demos.
			documentProcessor.SaveDocument(Server.MapPath("~/App_Data/factoryoutput/huzzah.pdf"));

			MemoryStream ms = new MemoryStream();
			documentProcessor.SaveDocument(ms);

			ms.Seek(0, SeekOrigin.Begin);
			byte[] report = ms.ToArray();

			Response.ContentType = "application/pdf";
			Response.AddHeader("content-disposition", "attachment;filename=huzzah.pdf");
			Response.Cache.SetCacheability(HttpCacheability.NoCache);
			Response.OutputStream.Write(report, 0, report.Length);
			Response.End();

			//PdfDocumentReponse.SendDocument(Response, documentProcessor, "PDF Document Processor - Document Creation API Demo", "PDF Document Creation API");
		}
	}





}

//TODO
//bar - stacked bar
//bar  - desc stats
//pca  - plot scree plot for eigenvalues and polar coords for loadings...

//PDF horizontal, vertical, and diag

