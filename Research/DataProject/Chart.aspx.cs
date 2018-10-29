using Accord.Statistics.Analysis;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
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
using DevExpress.XtraCharts.Native;
using DevExpress.XtraCharts.Web;
using DevExpress.XtraCharts.Web.Designer;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraPrinting;
using DevExpress.XtraPrinting.Links;

using DevExpress.XtraReports;
using DevExpress.XtraReports.UI;
using NReco.PivotData;
using System.IO;
using NReco.PivotData.Output;
using DevExpress.XtraPrintingLinks;
using System.Xml;
using System.Xml.Serialization;
using DevExpress.XtraRichEdit.API.Native;

//public partial class PointSeries : ChartBasePage{
public partial class DataProject_Chart : BasePage
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
	string filename;
	string projTitle;
	//DxCharts dxchart;
	List<Color> colors;
	DxChartOrders orders;
	DPData dpdata;
	string selectedsheet;
	bool printDebug = true;
	List<string> dummydata;

	#region Page Setup
	protected void Page_Init(object sender, EventArgs e)
	{
		printDebug = true;
		this.Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = this.Master.Master_studyID.ToString();	
	}


	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("Chart.aspx");
	}



	#endregion

	#region Page Load

	protected void Page_Load(object sender, EventArgs e)
	{

		if (!IsPostBack)
		{
			PageLoad_Initial();

		}
		//Is PostBack
		else
		{
			PageLoad_PostBack();

		}

	}


	protected void PageLoad_Initial()
	{
		log(String.Format("Page_Load NOT PostBack - {0}", IsPostBack));
		orders = new DxChartOrders();
		Session["orders"] = orders;

		panel.ContentTemplateContainer.Controls.Clear();

		ProcessQueryStringParams();

		if (dataproj_pk > 0)
		{
			LoadFiles(dataproj_pk);
			gridFile.Enabled = true;
			gridFile.NullText = "Select Data File...";
			gridFile.ClientEnabled = true;

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


	protected void PageLoad_PostBack()
	{
		log(String.Format("Page_Load Is PostBack - {0}", IsPostBack));
		Int32.TryParse(trackWhist.Value.ToString(), out chartWhist);
		Int32.TryParse(trackHhist.Value.ToString(), out chartHhist);



		//DataSet is NULL
		if (Session["dset"] == null){
			log(String.Format("Page_Load Is PostBack - {0}   A1 Session[dset] IS NULL", IsPostBack));
		}
		//DataSet is NOT NULL
		else if (Session["dset"] != null)
		{
			log(String.Format("Page_Load Is PostBack - {0}   B1 Session[dset] IS NOT NULL", IsPostBack));
			DataSet dset = (DataSet)Session["dset"];

			//Set the selected sheet
			string source = "";

			//Selected sheet is NULL or Empty
			if (String.IsNullOrEmpty(gridDataSheets.Text))
			{
				if (Session["selectedsheet"] == null)
				{
					selectedsheet = "Data";
					source = "DEFAULT";
				}
				else
				{
					selectedsheet = Session["selectedsheet"].ToString();
					source = "Session";
				}
			}
			//Selected sheet is NOT NULL 
			else
			{
				selectedsheet = gridDataSheets.Text;
				source = "gridDataSheets";
			}

			Session["selectedsheet"] = selectedsheet;
			log(String.Format(" *** selectedsheet         ={0}   source={1}", selectedsheet, source));
			log(String.Format(" *** Session[selectedsheet]={0}   ", Session["selectedsheet"] ));



			//dpdata IS NOT NULL
			if (Session["dpdata"] != null)
			{
				log(String.Format(" !!!!!!!!!!!! dpdata IS NOT NULL !!!!!!!!!!!!"));
				dpdata = (DPData)Session["dpdata"];
				log(String.Format(" selectedsheet is {0}.", selectedsheet));
				LogDPDataInfo(dpdata);

				if (dpdata.dtstacked != null)
				{
					if (pivotMissing.Visible == true)
					{
						PopulatePivotMissing(dpdata.dtstacked);
					}
				}

				lblSelectedDataInfo2.Text = dpdata.Info();

			}
			//dpdata IS NULL
			else
			{
				log(String.Format(" ******** dpdata IS NULL ********"));
				log(String.Format(" ******** CREATING NEW dpdata **********"));
				log(String.Format(" selectedsheet is {0}.", selectedsheet));
				if (txtFilter.Text == "")
				{
					dpdata = new DPData(dset.Tables[selectedsheet], dset.Tables["DataDictionary"]);
				}
				else
				{
					string filter = txtFilter.Text;
					filter = filter.Replace("\"", "'");
					log(String.Format(" >>> applying filter = {0}", txtFilter.Text));
					dpdata = new DPData(dset.Tables[selectedsheet], dset.Tables["DataDictionary"], filter);
				}

				LogDPDataInfo(dpdata);
				Session["dpdata"] = dpdata;

				lblSelectedDataInfo2.Text = dpdata.Info();
			}


			log(String.Format(" - - heading to LoadVars from Page_Load IsPostBack"));

			log("thing1");
			LogDPDataInfo(dpdata);
			LoadVars(dset, selectedsheet);
			log("thing2");
			LogDPDataInfo(dpdata);


			gridDataSheets.Value = selectedsheet;

			lblSelectedDataInfo2.Text = dpdata.Info();

			BindVarGrids();

			if (Session["datasheets"] != null)
			{
				gridDataSheets.DataSource = (DataTable)Session["datasheets"];
				gridDataSheets.DataBind();
			}


			ReInitialize();


			//LoadColors();
			GetColors();
		}


		if (Session["orders"] != null)
		{
			orders = (DxChartOrders)Session["orders"];
		}
	}

	protected void ProcessQueryStringParams()
	{

		if (Request.QueryString["pk"] != null)
		{
			Int32.TryParse(Request.QueryString["pk"], out dataproj_pk);

			if(dataproj_pk > 0)
			{
				SQL_utils sql = new SQL_utils("data");
				gridDataProject.Visible = false;

				Session["dataproj_pk"] = dataproj_pk.ToString();

				projTitle = sql.StringScalar_from_SQLstring(String.Format("select projTitle from dp.DataProject where dataproj_pk={0}", dataproj_pk));
				Session["projTitle"] = projTitle;
				lblProjTitle.Visible = true;
				lblProjTitle.Text = String.Format("#{0} {1}", dataproj_pk, projTitle);

				sql.Close();

			}
		}

		if (Request.QueryString["fn"] != null)
		{
			filename = Request.QueryString["fn"];
		}

		//Int32.TryParse(Request.QueryString["MA"], out movavg);

	}

	protected void LogDPDataInfo(DPData dpdata)
	{
		if (dpdata.dt != null)
		{
			log(String.Format(" /// dpdata.dt has {0} rows.", dpdata.dt.Rows.Count));
			log(String.Format(" /// dpdata.dtdict has {0} rows.", dpdata.dtdict.Rows.Count));

			if (dpdata.dtstacked == null)
			{
				log(String.Format(" /// dpdata.dtstacked IS NULL"));
			}
			else
			{
				log(String.Format(" /// dpdata.dtstacked has {0}", dpdata.dtstacked.Rows.Count));
			}
		}

	}

	#endregion

	#region Initialize controls
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


		PopulateDropdownItems(cboXaxisvarBAR, new List<string> { "variable", "group", "sex" }, false, addtimept);
		PopulateDropdownItems(cboColorsvarBAR, new List<string> { "none", "variable", "group", "sex" }, addtxgrp, addtimept);
		PopulateDropdownItems(cboPanelvarBAR, new List<string> { "none", "group", "sex" }, addtxgrp, addtimept);

		//PopulateTokenboxItems(cboXaxisvarSCAT, new List<string> { "timept", "group", "txgrp", "sex" });
		//PopulateTokenboxItems(cboYaxisvarSCAT, new List<string> { "timept", "group", "txgrp", "sex" });
		PopulateDropdownItems(cboColorsvarSCAT, new List<string> { "none", "group", "sex" }, addtxgrp, addtimept);
		PopulateDropdownItems(cboPanelvarSCAT, new List<string> { "none", "group", "sex" }, addtxgrp, addtimept);


		PopulateDropdownItems(cboXaxisvarLINE, new List<string> { "variable" }, false, addtimept);
		PopulateDropdownItems(cboColorsvarLINE, new List<string> { "none", "variable", "group", "sex" }, addtxgrp, addtimept);
		PopulateDropdownItems(cboPanelvarLINE, new List<string> { "none", "variable", "group", "sex", "id" }, addtxgrp, addtimept);

		PopulateDropdownItems(cboSubgroupsvarPCA, new List<string> { "none", "group", "sex" }, addtxgrp, addtimept);


		cboColorsvarHIST.Value = "none";
		cboPanelvarHIST.Value = "none";

		cboXaxisvarBAR.Value = "variable";
		cboColorsvarBAR.Value = "none";
		cboPanelvarBAR.Value = "none";

		cboColorsvarSCAT.Value = "none";
		cboPanelvarSCAT.Value = "none";

		cboXaxisvarLINE.Value = "variable";
		cboColorsvarLINE.Value = "none";
		cboPanelvarLINE.Value = "none";
	}

	protected void InitializeTokenboxes(bool addtxgrp, bool addtimept)
	{
		PopulateTokenboxItems(tokXTrow, new List<string> { "variable", "group", "sex" }, addtxgrp, addtimept);
		PopulateTokenboxItems(tokXTcol, new List<string> { "variable", "group", "sex" }, addtxgrp, addtimept);
		PopulateTokenboxItems(tokXTpanel, new List<string> { "variable", "group", "sex" }, addtxgrp, addtimept);

		PopulateTokenboxItems(tokXTcell, new List<string> { "id" });
		PopulateTokenboxItems(tokXTstats, new List<string> { "N", "Mean", "SD" });


		tokXTrow.Value = "variable";
		tokXTcol.Value = "group";
		tokXTcell.Value = "id";
		tokXTstats.Value = "N";

	}


	protected void ReInitialize()
	{
		List<string> selected_numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		List<string> selected_textvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
		List<string> selected_datevars = dataops.GetListString(gridVarsDate.GridView.GetSelectedFieldValues("varname"));
		List<string> selected_agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));


		dpdata.numericvars = selected_numvars;
		dpdata.textvars = selected_textvars;
		dpdata.datevars = selected_datevars;

		//PopulateDropdownItems(cboXaxisvar, selected_textvars);


		PopulateDropdownItems(cboColorsvarHIST, selected_textvars);
		PopulateDropdownItems(cboPanelvarHIST, selected_textvars);

		PopulateDropdownItems(cboColorsvarBAR, selected_textvars);
		PopulateDropdownItems(cboPanelvarBAR, selected_textvars);
		PopulateDropdownItems(cboColorsvarSCAT, selected_textvars);
		PopulateDropdownItems(cboPanelvarSCAT, selected_textvars);




		List<string> vars_for_xaxis_lineplot = new List<string> { "variable", "timept " };
		if (selected_datevars.Count > 0) vars_for_xaxis_lineplot.AddRange(selected_datevars);
		if (selected_agevars.Count > 0) vars_for_xaxis_lineplot.AddRange(selected_agevars);

		PopulateDropdownItems(cboXaxisvarLINE, vars_for_xaxis_lineplot);


		PopulateTokenboxItems(tokXTrow, selected_textvars);
		PopulateTokenboxItems(tokXTcol, selected_textvars);
		PopulateTokenboxItems(tokXTpanel, selected_textvars);


		List<string> selected_num_text = new List<string>();
		selected_num_text.AddRange(selected_numvars);
		selected_num_text.AddRange(selected_textvars);


		PopulateTokenboxItems(tokXTcell, selected_num_text);

		//PopulateTokenboxItems(tokXaxisvarSCAT, selected_numvars);
		//PopulateTokenboxItems(tokYaxisvarSCAT, selected_numvars);
	}
	#endregion



	protected void BindVarGrids()
	{
		if (Session["datadict_num"] != null)
		{
			gridVarsNum.DataSource = (DataTable)Session["datadict_num"];
			gridVarsNum.DataBind();
			gridVarsNum.Visible = true;
		}
		if (Session["datadict_text"] != null)
		{
			gridVarsText.DataSource = (DataTable)Session["datadict_text"];
			gridVarsText.DataBind();
			gridVarsText.Visible = true;
		}
		if (Session["datadict_date"] != null)
		{
			gridVarsDate.DataSource = (DataTable)Session["datadict_date"];
			gridVarsDate.DataBind();
			gridVarsDate.Visible = true;
		}
		if (Session["datadict_age"] != null)
		{
			gridVarsAge.DataSource = (DataTable)Session["datadict_age"];
			gridVarsAge.DataBind();
			gridVarsAge.Visible = true;
		}
		if (Session["orders"] != null)
		{
			orders = (DxChartOrders)Session["orders"];
			if (orders.Count > 0)
			{
				//callbackCharts.Controls.Clear();
				//ASPxGridView gridOrders = new ASPxGridView();
				gridOrders.DataSource = orders.ToDataTable();
				gridOrders.DataBind();
				gridOrders.Visible = true;

				//callbackCharts.Controls.Add(gridOrders);
			}
			else
			{

			}

		}
	}



	#region Load Controls
	protected List<Color> GetColors()
	{
		List<Color> mycolors = new List<Color>();
		mycolors.Add((Color)Color1.Value );
		mycolors.Add((Color)Color2.Value );
		mycolors.Add((Color)Color3.Value );
		mycolors.Add((Color)Color4.Value );
		mycolors.Add((Color)Color5.Value );
		mycolors.Add((Color)Color6.Value );
		mycolors.Add((Color)Color7.Value );
		mycolors.Add((Color)Color8.Value );
		mycolors.Add((Color)Color9.Value );
		mycolors.Add((Color)Color10.Value);
		mycolors.Add((Color)Color11.Value);
		mycolors.Add((Color)Color12.Value);
		mycolors.Add((Color)Color13.Value);
		mycolors.Add((Color)Color14.Value);
		mycolors.Add((Color)Color15.Value);

		return mycolors;

	}



	protected void LoadFiles(int pk)
	{
		log(" === LoadFiles ===");
		log("************** CLEARING DSET ********************");
		Session["dset"] = null;
		Session["dpdata"] = null;

		log(String.Format("LoadFiles {0}", pk));

		SQL_utils sql = new SQL_utils("data");

		DataTable dt = sql.DataTable_from_SQLstring(String.Format("select *, dbo.fnElapTime_text(created, getdate()) elaptime " + 
			" from dp.Datafile where isdeleted=0 and dataproj_pk={0} order by created desc", pk));

		Session["datafiles"] = dt;

		gridFile.DataSource = dt;
		gridFile.DataBind();
		
		sql.Close();
	}

	
	protected void LoadExcelData(string xlfile)
	{
		log(String.Format(" === LoadExcelData {0} ===", xlfile));
		LoadExcelData(xlfile, "Data");
	}

	protected void LoadExcelData(string xlfile, string sheet)
	{
		log(String.Format(" === LoadExcelData {0} {1} ===", xlfile, sheet));

		Session["filename"] = xlfile;

		DataSet dset = SpreadsheetGearUtils.GetDataSet(xlfile);


		if (dset.Tables.Count > 0)
		{
			log("************** SETTING DSET ********************");
			Session["dset"] = dset;
			log(String.Format(" - - heading to LoadSheets from LoadExcelData"));
			LoadSheets(dset);
			//LoadVars(dset, sheet);
		}
		else { 
			//File not found
		}

	}

	protected void LoadSheets(DataSet dset)
	{
		log(String.Format(" === LoadSheets ==="));
		DataTable datasheets = new DataTable();
		datasheets.Columns.Add("sheetname", typeof(string));
		datasheets.Columns.Add("nrows", typeof(int));

		bool hasData = false;

		foreach (DataTable dt in dset.Tables)
		{
			string tblname = dt.TableName;
			if (tblname=="Subjects" | (tblname.StartsWith("Data") && tblname != "DataDictionary" && tblname != "Data_sqlcode"))
			{
				DataRow row = datasheets.NewRow();

				row["sheetname"] = tblname;
				row["nrows"] = dt.Rows.Count;

				datasheets.Rows.Add(row);
				if (tblname == "Data") hasData = true;
			}
		}

		if (datasheets.Rows.Count > 0)
		{
			//string selsheet = (Session["selectedsheet"] == null) ? "Data" : Session["selectedsheet"].ToString();
			

			//set selected sheet to Data if it exists, otherwise use the first data sheet
			string selectedsheet = (hasData) ? "Data" : datasheets.AsEnumerable().Select(f => f["sheetname"]).First().ToString();

			Session["datasheets"] = datasheets;

			gridDataSheets.DataSource = (DataTable)Session["datasheets"];
			gridDataSheets.DataBind();
			gridDataSheets.Visible = true;

			gridDataSheets.Value = selectedsheet;
			log(String.Format(" - - heading to LoadVars from LoadSheets"));
			LoadVars(dset, selectedsheet);

			Session[selectedsheet] = selectedsheet;
			txtFilter.Visible = true;
			btnFilter.Visible = true;
			lblFilterExample.Visible = true;
		}

	}


	protected List<string> GetDataSheetNames(DataSet dset)
	{

		DataTable dtsheets = (DataTable)Session["datasheets"];
		if(dset.Tables.Count > 0)
		{
			List<string> datasheetnames = new List<string>();
			foreach (DataTable dt in dset.Tables)
			{
				string tblname = dt.TableName;
				if (tblname=="Subjects" | (tblname.StartsWith("Data") && tblname != "DataDictionary" && tblname != "Data_sqlcode"))
				{
					datasheetnames.Add(dt.TableName);
				}
			}
			return datasheetnames;
		}
		else
		{
			return null;
		}

	}


	protected DataTable DataDictionaryForSheet(DataSet dset, string sheet)
	{
		List<string> datasheetnames = GetDataSheetNames(dset);
		List<string> measnames_on_othersheets = new List<string>();
		for (int i = 0; i < datasheetnames.Count; i++)
		{
			if (datasheetnames[i] != "Data") measnames_on_othersheets.Add(datasheetnames[i].Replace("Data_", ""));
		}


		DataTable dictorig = dset.Tables["DataDictionary"];

		if (sheet == "Data")
		{
			string measnames_on_othersheets_csv = String.Join("','", measnames_on_othersheets);
			DataView vw = dictorig.AsDataView();
			vw.RowFilter = String.Format("[measname] NOT IN ('{0}')", measnames_on_othersheets_csv);
			DataTable dt = vw.ToTable();
			return dt;
		}
		else if (sheet == "Subjects")
		{
			DataView vw = dictorig.AsDataView();
			vw.RowFilter = "[measname] = '!'";  //no records
			DataTable dt = vw.ToTable();

			int counter = 0;
			foreach(DataColumn subjcol in dset.Tables["Subjects"].Columns)
			{
				counter++;
				string dtype = subjcol.DataType.ToString().Replace("System.","");

				string sqldatatype = "";

				if (subjcol.ColumnName.Contains("date")) sqldatatype = "date";
				else if (subjcol.ColumnName == "studystart") sqldatatype = "date";
				else if (subjcol.ColumnName == "txstart") sqldatatype = "date";
				else if (dtype == "Double") sqldatatype = "float";
				else if (dtype.StartsWith("Int")) sqldatatype = "int";
				else if (dtype == "String") sqldatatype = "varchar";
				else sqldatatype = "varchar";


				DataRow row = dt.NewRow();
				row["pos"] = counter;
				row["measname"] = "Subjects";
				row["varname"] = subjcol.ColumnName;
				row["DataType"] = sqldatatype;
				row["FieldLabel"] = SubjectVarLabel(subjcol.ColumnName);
				row["InAnalysis"] = 0;
				dt.Rows.Add(row);
			}
			return dt;
		}
		else
		{
			DataView vw = dictorig.AsDataView();
			vw.RowFilter = String.Format("[measname] = '{0}'", sheet.Replace("Data_", ""));
			DataTable dt = vw.ToTable();
			return dt;
		}

	}

	public string SubjectVarLabel (string v)
	{
		string varlabel = "";

		switch (v)
		{
			case "subjstatus": varlabel = "Subject status"; break;
			case "subjstatusdetail": varlabel = "Subject status detail"; break;
			case "txstart": varlabel = "Date Treatment started"; break;
			case "txstart_agemos": varlabel = "Age when Treatment started"; break;
			case "studystart": varlabel = "Date subject started the study"; break;
			case "studystart_agemos": varlabel = "Age when subject started the study"; break;
			case "txstartnote": varlabel = "Notes regarding treatment start date"; break;
			case "subjnotes": varlabel = "Subject notes"; break;
			default: varlabel = v; break;
		}
		return varlabel;
	}

	protected void LoadVars(DataSet dset)
	{
		LoadVars(dset, "Data");
	}




	protected void LoadVars(DataSet dset, string sheet)
	{
		log(String.Format(" === LoadVars {0} ===", sheet));

		//DataTable datadict = dset.Tables["DataDictionary"];
		DataTable datadict = DataDictionaryForSheet(dset, sheet);  //Limit Vars To Correct Sheet
		DataTable compvars = dset.Tables["CompVars"];


		List<string> nums = new List<string>(new string[] { "int", "smallint", "tinyint", "float", "decimal", "bigint","numeric" });
		List<string> strings = new List<string>(new string[] { "char", "varchar", "nvarchar" });
		List<string> dates = new List<string>(new string[] { "date", "smalldatetime", "datetime" });

		DataView vwdatadict_num = datadict.AsDataView();
		vwdatadict_num.RowFilter = "(FieldLabel not like '% age (mo%' and FieldLabel not like '%age mos%')";
		DataTable tmpdatadict_num = vwdatadict_num.ToTable();


		var qry_num = tmpdatadict_num.AsEnumerable()
			.Where(f => f.Field<string>("DataType") == "int" ||
				f.Field<string>("DataType") == "bigint" ||
				f.Field<string>("DataType") == "smallint" ||
				f.Field<string>("DataType") == "tinyint" ||
				f.Field<string>("DataType") == "float" ||
				f.Field<string>("DataType") == "numeric" ||
				f.Field<string>("DataType") == "decimal")
			.Select(r => new
			{
				measname = r.Field<string>("measname"),
				varname = r.Field<string>("varname"),
				fieldlabel = r.Field<string>("FieldLabel"),
				datatype = r.Field<string>("DataType"),
				valuelabels = r.Field<string>("ValueLabels")
			});


		DataView vwdatadict_age = datadict.AsDataView();
		vwdatadict_age.RowFilter = "(FieldLabel like '%age in%' or FieldLabel like '%age (mo%' or FieldLabel like '%age mos%')";
		DataTable tmpdatadict_age = vwdatadict_age.ToTable();


		var qry_age = tmpdatadict_age.AsEnumerable()
			.Where(f => f.Field<string>("DataType") == "int" ||
				f.Field<string>("DataType") == "bigint" ||
				f.Field<string>("DataType") == "smallint" ||
				f.Field<string>("DataType") == "tinyint" ||
				f.Field<string>("DataType") == "float" ||
				f.Field<string>("DataType") == "numeric" ||
				f.Field<string>("DataType") == "decimal")
			.Select(r => new
			{
				measname = r.Field<string>("measname"),
				varname = r.Field<string>("varname"),
				fieldlabel = r.Field<string>("FieldLabel"),
				datatype = r.Field<string>("DataType"),
				valuelabels = r.Field<string>("ValueLabels")
			});


		var qry_text = datadict.AsEnumerable()
			.Where(f => f.Field<string>("DataType") == "char" ||
				f.Field<string>("DataType") == "varchar" ||
				f.Field<string>("DataType") == "nvarchar" || 
				f.Field<double>("InAnalysis") == 3)
			.Select(r => new
			{
				measname = r.Field<string>("measname"),
				varname = r.Field<string>("varname"),
				fieldlabel = r.Field<string>("FieldLabel"),
				datatype = r.Field<string>("DataType"),
				valuelabels = r.Field<string>("ValueLabels")
			});

		var qry_date = datadict.AsEnumerable()
			.Where(f => f.Field<string>("DataType") == "date" ||
				f.Field<string>("DataType") == "smalldatetime" ||
				f.Field<string>("DataType") == "datetime")
			.Select(r => new
			{
				measname = r.Field<string>("measname"),
				varname = r.Field<string>("varname"),
				fieldlabel = r.Field<string>("FieldLabel"),
				datatype = r.Field<string>("DataType"),
				valuelabels = r.Field<string>("ValueLabels")
			});



		//var qry_compvar = compvars.AsEnumerable()
		//	.Select(r => new
		//	{
		//		measname = "[COMP '" + r.Field<string>("compvarname") + "']",
		//		varname = r.Field<string>("compvarname"),
		//		fieldlabel = r.Field<string>("compvarlabel"),
		//		datatype = "float",
		//		valuelabels = ""
		//	})
		//	.Distinct();

		//var qry_compvarvar = compvars.AsEnumerable()
		//	.Select(r => new
		//	{
		//		measname = "[COMP '" + r.Field<string>("compvarname") + "'] " + r.Field<string>("measname"),
		//		varname = r.Field<string>("varname") + "_z",
		//		fieldlabel = r.Field<string>("FieldLabel"),
		//		datatype = "float",
		//		valuelabels = "ComponentVar"
		//	});



		DataTable datadict_num = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry_num);
		DataTable datadict_text = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry_text);
		DataTable datadict_date = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry_date);
		DataTable datadict_age = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry_age);


		//DataTable compvar = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry_compvar);
		//DataTable compvarvar = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry_compvarvar);


		//if (!sheet.Contains("IntHx"))
		//{

		//	if (compvar.Rows.Count > 0)
		//	{
		//		foreach (DataRow dr in compvar.Rows)
		//		{
		//			if (true /* some condition */)
		//				datadict_num.Rows.Add(dr.ItemArray);
		//		}
		//	}

		//	if (compvarvar.Rows.Count > 0)
		//	{
		//		foreach (DataRow dr in compvarvar.Rows)
		//		{
		//			if (true /* some condition */)
		//				datadict_num.Rows.Add(dr.ItemArray);
		//		}
		//	}
		//}


		Session["datadict"] = datadict;
		//Session["compvar"] = compvar;
		//Session["compvarvar"] = compvarvar;


		Session["datadict_num"] = null;
		Session["datadict_text"] = null;
		Session["datadict_date"] = null;
		Session["datadict_age"] = null;

		if (datadict_num.Rows.Count > 0)
		{
			Session["datadict_num"] = datadict_num;
			gridVarsNum.DataSource = datadict_num; 
			gridVarsNum.DataBind();
			gridVarsNum.Visible = true;
		}


		if (datadict_text.Rows.Count > 0)
		{
			Session["datadict_text"] = datadict_text;
			gridVarsText.DataSource = (DataTable)Session["datadict_text"];
			gridVarsText.DataBind();
			gridVarsText.Visible = true;
		}


		if (datadict_date.Rows.Count > 0)
		{
			Session["datadict_date"] = datadict_date;
			gridVarsDate.DataSource = (DataTable)Session["datadict_date"];
			gridVarsDate.DataBind();
			gridVarsDate.Visible = true;
		}

		if (datadict_age.Rows.Count > 0)
		{
			Session["datadict_age"] = datadict_age;
			gridVarsAge.DataSource = (DataTable)Session["datadict_age"];
			gridVarsAge.DataBind();
			gridVarsAge.Visible = true;
		}

	}



	protected void PopulatePivotMissing(DataTable dtstacked)
	{
		pivotMissing.DataSource = dtstacked;
		pivotMissing.DataBind();

		pivotMissing.Visible = true;
	}


	protected void DisplaySelectedVars()
	{

		List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		List<string> txtvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
		List<string> datevars = dataops.GetListString(gridVarsDate.GridView.GetSelectedFieldValues("varname"));
		List<string> agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));

		List<string> allvars = new List<string>();
		allvars.AddRange(numvars);
		allvars.AddRange(txtvars);
		allvars.AddRange(datevars);
		allvars.AddRange(agevars);

		DataTable dt_selvars = new DataTable();
		dt_selvars.Columns.Add(new DataColumn("varname"));


		if (allvars.Count > 0)
		{
			DataView dv = new DataView();

			//get the correct data dictionary
			if (selectedsheet == "Subjects")
			{
				DataTable dtdict_subj = DataDictionaryForSheet((DataSet)Session["dset"], "Subjects");
				dv = dtdict_subj.AsDataView();
			}
			else
			{
				dv = dpdata.dtdict.AsDataView();
			}

			string notDataSheet = (selectedsheet != "Data") ?
				String.Format(" and measname='{0}'", selectedsheet.Replace("Data_", "")) : "";

			string filter = String.Format("varname in ('{0}') {1}"
				, String.Join("','", allvars)
				, notDataSheet);
			dv.RowFilter = filter;
			DataTable dt = dv.ToTable();


			dt.Columns.Add(new DataColumn("vartype", typeof(string)));


			foreach (DataRow row in dt.Rows)
			{
				string v = row["varname"].ToString();
				string vt = "";
				if (numvars.Contains(v)) vt = "numeric";
				else if (txtvars.Contains(v)) vt = "categorical";
				else if (datevars.Contains(v)) vt = "date";
				else if (agevars.Contains(v)) vt = "age";
				row["vartype"] = vt;
			}


			gvSelectedVars.DataSource = dt;
			gvSelectedVars.DataBind();



			gvSelectedVars.Visible = true;
			lblVarLabels.Visible = true;
			btnVarLabelsHide.Visible = true;
			btnVarLabelsShow.Visible = true;
			//btnVarLabelsShow.Enabled = false;
		}
		else
		{
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



	//protected void AddTextVarToSelector(DataTable dt, string varname, string label)
	//{
	//	DataRow add_var = dt.NewRow();
	//	add_var["varname"] = varname;
	//	add_var["FieldLabel"] = label;
	//	dt.Rows.Add(add_var);
	//}


	#endregion



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

	protected void PopulateTokenboxItems(ASPxTokenBox cbo, List<string> defaultvals )
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
			List<string> exempt = new List<string> { "cboXaxisvarLINE", "tokXTcell", "tokXTstats" };
			if (!exempt.Contains(controlname) )
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



	//protected void tabSteps_OnCallback(object sender, CallbackEventArgsBase e)
	//{
	//	orders = (DxChartOrders)Session["orders"];
	//	string sets_text = String.Format("Chart Sets (N={0})", orders.Count);
	//	tabSteps.TabPages[3].Text = sets_text;

	//}

	protected void callbackSelectors_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format("callbackSelectors_OnCallback {0}", e.Parameter.ToString()));
	}

	protected void callbackSpecifics_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>> callbackControls_OnCallback {0}", e.Parameter.ToString()));

		List<string> selected_textvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));

		//PopulateDropdownItems(cboColorsvar, selected_textvars);
		//PopulateDropdownItems(cboPanelvar, selected_textvars);
		//PopulateDropdownItems(cboXaxisvar, selected_textvars);
	}

	protected void callbackFile_OnCallback(object source, CallbackEventArgsBase e)
	{
		log(String.Format(">>> callbackFile_OnCallback {0}", e.Parameter.ToString()));

		if (e.Parameter == "0")
		{
			//Process LIVE DATA here...
			string x = e.Parameter.ToString();
			
			
		}
		else if (e.Parameter.Contains(".xlsx"))
		{
			string x = e.Parameter.ToString();
			LoadExcelData(x.ToString());
		}
		else
		{
			int pk = Convert.ToInt32(e.Parameter);

			if (pk > 0)
			{			
				string url = String.Format("Chart.aspx?pk={0}", e.Parameter);
				DevExpress.Web.ASPxWebControl.RedirectOnCallback(url);
			}

		}

	}

	protected void callbackDataSheets_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>> callbackDataSheets_OnCallback {0}", e.Parameter.ToString()));

		string x = e.Parameter.ToString();

		if (x.Contains(".xlsx"))
		{
			Session["filename"] = x;
			if (Session["dset"] == null)
			{
				LoadExcelData(x.ToString());
				DataSet dset = (DataSet)Session["dset"];

				//???
				//string info = GetDataSheetInfo(dset, "Data");
				//Session["datasheetinfo"] = info;
			}
			else
			{
				Session["selectedsheet"] = "Data";
			}

		}
		else 
		{
			DataSet dset = (DataSet)Session["dset"];
			Session["selectedsheet"] = x;

			log(String.Format(" - - heading to LoadVars from callbackDataSheets_OnCallback"));
			LoadVars(dset, x);

			//??
			//Session["datasheetinfo"] = GetDataSheetInfo(dset, x);
		}
	}

	protected void callbackVars_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>> callbackVars_OnCallback {0}", e.Parameter.ToString()));

		string par = e.Parameter.ToString();


		if (par.StartsWith("Data"))
		{
			DataSet dset = (DataSet)Session["dset"];
			dpdata = new DPData(dset.Tables[selectedsheet], dset.Tables["DataDictionary"]);
			Session["dpdata"] = dpdata;
			lblSelectedDataInfo2.Text = dpdata.Info();


			log(" - - heading to LoadVars from callbackVars_OnCallback");
			LoadVars((DataSet)Session["dset"], par);

			//???
			//string info = GetDataSheetInfo((DataSet)Session["dset"], "Data");
			//Session["datasheetinfo"] = info;
		}
		else if (par == "Subjects")
		{
			DataSet dset = (DataSet)Session["dset"];
			dpdata = new DPData(dset.Tables["Subjects"], dset.Tables["DataDictionary"]);
			Session["dpdata"] = dpdata;
			lblSelectedDataInfo2.Text = dpdata.Info();


			log(" - - heading to LoadVars from callbackVars_OnCallback");
			LoadVars((DataSet)Session["dset"], par);

		}
		else if (par == "varstext")
		{


		}

		if(par.StartsWith("filter!"))
		{
			string filter = par.Replace("filter!", "");
			if (filter == "null")
			{
				if (Session["dset"] != null)
				{
					DataSet dset = (DataSet)Session["dset"];
					dpdata = new DPData(dset.Tables[selectedsheet], dset.Tables["DataDictionary"]);
					Session["dpdata"] = dpdata;
					lblSelectedDataInfo2.Text = dpdata.Info();
				}
			}
			else
			{
				log(String.Format(" BEFORE FILTER [{0}] dpdata.dt has {1} rows", filter, dpdata.dt.Rows.Count));
				dpdata.filter = filter;
				log(String.Format(" AFTER FILTER [{0}]  dpdata.dt has {1} rows", filter, dpdata.dt.Rows.Count));
				Session["dpdata"] = dpdata;

				lblSelectedDataInfo2.Text = dpdata.Info();
			}

		}

	}

	protected void callbackVarLabels_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>> callbackVarLabels_OnCallback {0}", e.Parameter.ToString()));

		DisplaySelectedVars();
	}


	protected void callbackMissing_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>> callbackMissing_OnCallback {0}", e.Parameter.ToString()));

		List<string> numvars = new List<string>();
		numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));


		//bool useall = (numvars.Count == 0) ? true: false; // chkMissing_AllVars.Checked;
		//if (useall)
		//{
		//	var x1 = gridVarsNum.GridView.VisibleRowCount;
		//	for (int i = 0; i < gridVarsNum.GridView.VisibleRowCount; i++)
		//	{
		//		string v = gridVarsNum.GridView.GetRowValues(i, "varname").ToString(); 
		//		numvars.Add(v);
		//	}
		//}

		if (numvars.Count > 0)
		{

			List<string> idvars = new List<string> { "ref_id", "group", "txgrp", "timept" };

			dpdata.Data_FullyStacked(idvars, numvars);

			Session["dtstacked"] = dpdata.dtstacked;

			log(String.Format(">>> numrows dtstacked = {0}", dpdata.dtstacked.Rows.Count.ToString()));

			//ASPxPivotGrid pivot = CreateMissingPivot();

			PopulatePivotMissing(dpdata.dtstacked);
		}

	}


	
	protected void callbackViewData_OnCallback(object sender, CallbackEventArgsBase e)
	{
		log(String.Format(">>> callbackVars_OnCallback {0}", e.Parameter.ToString()));

		List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		List<string> txtvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
		List<string> datevars = dataops.GetListString(gridVarsDate.GridView.GetSelectedFieldValues("varname"));
		List<string> agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));


		List<string> idetc = new List<string> { "id", "timept", "group", "txgrp", "txstyle","txintensity"  };

		List<string> keepvars = new List<string>();
		keepvars.AddRange(idetc);
		keepvars.AddRange(numvars);
		keepvars.AddRange(txtvars);
		keepvars.AddRange(datevars);
		keepvars.AddRange(agevars);

		for (int i=0; i < keepvars.Count; i++)
		{
			keepvars[i] = keepvars[i].ToLower();
		}

		DataTable dt = dpdata.Data_SelectColumns(keepvars);

		int x = (Request.Browser.ScreenPixelsWidth) * 2 - 100;

		ASPxGridView gv = new ASPxGridView();
		gv.Width = x;
		gv.SettingsPager.Mode = GridViewPagerMode.ShowAllRecords;
		gv.Settings.VerticalScrollableHeight = 400;
		gv.Settings.VerticalScrollBarMode = ScrollBarMode.Visible;
		gv.DataSource = dt;
		gv.DataBind();

		Label lbl = new Label();
		lbl.Text = String.Format("# records = {0}", dt.Rows.Count);
		callbackViewData.Controls.Clear();
		callbackViewData.Controls.Add(lbl);
		callbackViewData.Controls.Add(gv);


	}


	protected void callbackVarsText_OnCallback(object sender, CallbackEventArgsBase e)
	{

		List<string> txtvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
		int x = 0;
		
	}


	protected void callbackCharts_OnCallback(object source, CallbackEventArgsBase e)
	{
		log(String.Format(">>> callbackCharts_OnCallback {0}", e.Parameter.ToString()));
		//CreateCharts();
		bool isNewOrder = true; bool isNotNewOrder = false;

		var p = e.Parameter;
		
		if (p == "clear")
		{

		}
		else if (p.StartsWith( "OldOrder"))		
		{
			List<string> ps = p.Split('|').ToList();

			DxChartOrder order = orders[Convert.ToInt32(ps[1])-1];
			CreateCharts(order, isNotNewOrder);
		}
		else if (p == "NewOrder")
		{
			DxChartOrder order = GatherOrder();
			CreateCharts(order);
		}
		else if (p == "SaveNewOrder")
		{
			DxChartOrder order = GatherOrder();
			CreateCharts(order, true);
		}
		else if (p.StartsWith("DisplayAllOrders"))
		{
			CreateCharts(orders);
		}
		else if (p == "Docx")
		{
			CreateCharts(orders, "docx");
		}
	}



	protected void gridOrders_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
	{
		if (e.ButtonID == "OldOrder")
		{
			//display this order
			int ordernum = e.VisibleIndex;
			string p = String.Format("{0}|{1}", "OldOrder",ordernum);
			CallbackEventArgsBase arg = new CallbackEventArgsBase(p);
			callbackCharts_OnCallback(callbackCharts, arg);
		}
	}


	protected void callbackOrders_OnCallback(object source, CallbackEventArgsBase e)
	{
		var p = e.Parameter;

		if (p.StartsWith("RemoveOrder"))
		{
			List<string> ps = p.Split('|').ToList();
			int idx = Convert.ToInt32(ps[1]);

			orders.RemoveAt(idx - 1);

			Session["orders"] = orders;

			gridOrders.DataSource = orders.ToDataTable();
			gridOrders.DataBind();
			gridOrders.Visible = true;

		}
	}

	#endregion




	protected void CreateCharts(DxChartOrder myorder)
	{
		DxChartOrders myorders = new DxChartOrders() { myorder };
		CreateCharts(myorders, false, "");
	}
	protected void CreateCharts(DxChartOrder myorder, bool saveOrder)
	{
		DxChartOrders myorders = new DxChartOrders() { myorder };
		CreateCharts(myorders, saveOrder, "");
	}

	protected void CreateCharts(DxChartOrders myorders)
	{
		CreateCharts(myorders, false, "");
	}
	protected void CreateCharts(DxChartOrders myorders, string exportfiletype)
	{
		CreateCharts(myorders, false, exportfiletype);
	}

	protected void CreateCharts(DxChartOrders myorders, bool saveOrder, string exportfiletype)
	{
		log("----- CreateCharts -----");


		DxChartFactory factory = new DxChartFactory(dpdata.dt, myorders);

		if(saveOrder)
		{
			myorders[0].UpdateCounts(factory);
			orders.Add(myorders[0]);
			Session["orders"] = orders;
		}

		DeliverChartsToPage(factory);

		if (exportfiletype == "docx")
		{
			MakeDocx(factory);
			DeleteChartsOnDisk(factory, @"c:\_temp\factory\");
		}

		SerializeObject<DxChartOrders>(myorders, @"c:\_temp\factory\orders.xml");
	}



	protected DxChartOrder GatherOrder()
	{
		List<string> plotrequests = dataops.GetListString(chkPlots.SelectedValues);
		DxChartOrder order = new DxChartOrder();

		order.worksheet = gridDataSheets.Value.ToString();
		if (plotrequests.Contains("Barchart")) order.settingsbar = BarchartSettings();
		if (plotrequests.Contains("Histogram")) order.settingshist = HistogramSettings();
		if (plotrequests.Contains("Lineplot")) order.settingsline = LineplotSettings();
		if (plotrequests.Contains("Scatterplot")) order.settingsscat = ScatterplotSettings();
		order.PopulateVars();

		return order;
	}


	#region chart settings 
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


		settings.numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
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
		settings.numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
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
		settings.colorvar = cboColorsvarLINE.Value.ToString(); //colorsvar;
		settings.panelvar = cboPanelvarLINE.Value.ToString(); //panelvar;
		settings.legend_pos_h = cboLegendH_LINE.Value.ToString();
		settings.legend_pos_v = cboLegendV_LINE.Value.ToString();
		settings.matchYAxes = chkLineMatchYaxisRange.Checked;
		settings.showLegend = chkLineShowLegend.Checked;

		settings.colors = GetColors();
		settings.numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		settings.datevars = dataops.GetListString(gridVarsDate.GridView.GetSelectedFieldValues("varname"));
		settings.agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));

		if (settings.datevars.Contains(settings.xaxisvar)) settings.xaxis_is_date = true;
		if (settings.agevars.Contains(settings.xaxisvar)) settings.xaxis_is_age = true;
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

		settings.showhist = chkHist.Checked;
		settings.showregline = chkRegline.Checked;
		settings.useMovAvg = chkMovingAvg.Checked;
		settings.colors = GetColors();
		settings.colorvar = cboColorsvarSCAT.Value.ToString();
		settings.panelvar = cboPanelvarSCAT.Value.ToString();


		if (chkJitter.Checked)
		{
			settings.jitter = true;

			double amtx;
			if (Double.TryParse((txtJitterAmtX.Text), out amtx)) settings.jitteramtX = amtx;
			double amty;
			if (Double.TryParse((txtJitterAmtY.Text), out amty)) settings.jitteramtY = amty;

		}

		settings.numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		settings.maxCol = settings.numvars.Count;
		settings.maxRow = settings.numvars.Count;

		return settings;
	}
	#endregion

	protected void DeliverChartsToPage(DxChartFactory factory) 
	{
		callbackCharts.Controls.Clear();  // Always clear it now that the factory processes multiple orders 

		foreach (DxBatchOcharts batch in factory.batches)
		{
			System.Web.UI.WebControls.Table t = ChartOutput.LayoutBatch(batch);
			callbackCharts.Controls.Add(t);
		}
	}




	//protected ASPxGridView SelectedVars_GridView()
	//{
	//	ASPxGridView gv = new ASPxGridView();

	//	List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
	//	List<string> txtvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
	//	List<string> datevars = dataops.GetListString(gridVarsDate.GridView.GetSelectedFieldValues("varname"));
	//	List<string> agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));

	//	List<string> allvars = new List<string>();
	//	allvars.AddRange(numvars);
	//	allvars.AddRange(txtvars);
	//	allvars.AddRange(datevars);
	//	allvars.AddRange(agevars);


	//	if (allvars.Count > 0)
	//	{
	//		string notDataSheet = (selectedsheet != "Data") ? String.Format(" and measname='{0}'", selectedsheet.Replace("Data_", "")) : "";

	//		string filter = String.Format("varname in ('{0}') {1}", String.Join("','", allvars), notDataSheet);


	//		DataView dv = dpdata.dtdict.AsDataView();
	//		dv.RowFilter = filter;
	//		DataTable dt = dv.ToTable();

	//		gv.Columns.Add(new GridViewDataColumn() { FieldName = "measname" });
	//		gv.Columns.Add(new GridViewDataColumn() { FieldName = "varname" });
	//		gv.Columns.Add(new GridViewDataColumn() { FieldName = "FieldLabel" });
	//		gv.DataSource = dt;
	//		gv.DataBind();

	//		return gv;
	//	}
	//	else
	//	{
	//		return null;
	//	}
	//}


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





	//protected void LaunchHistograms(DxHistogramSettings settings) // string xaxisvar, string colorsvar, string panelvar)
	//{


	//	DxChartFactory chartfactory = new DxChartFactory(DxChartType.Histogram, settings, dpdata.dt);

	//	string layout = cboOutputStyleHIST.Value.ToString();

	//	if (layout == "Rows, Left to Right")
	//	{
	//		Table t = ChartOutput.HorizontalTable(chartfactory.charts, settings.W, settings.H, Convert.ToInt32(trkNumColsHIST.Value));
	//		callbackCharts.Controls.Add(t);
	//	}
	//	else if (layout == "Cols, Top to Bottom")
	//	{
	//		Table t = ChartOutput.VerticalTable(chartfactory.charts, settings.W, settings.H, Convert.ToInt32(trkNumRowsHIST.Value));
	//		callbackCharts.Controls.Add(t);
	//	}

	//	ChartsToDisk(chartfactory);

	//}

	//protected void LaunchLineplots() // string xaxisvar, string colorsvar, string panelvar)
	//{


	//	DxChartFactory chartfactory = new DxChartFactory(DxChartType.Lineplot, settings, dpdata.dt);

	//	string layout = cboOutputStyleLINE.Value.ToString();

	//	if(!settings.showLegend)
	//	{
	//		DxLineplot plot = (DxLineplot)chartfactory.charts[0];
	//		Table legend = plot.ManualColorLegend();
	//		callbackCharts.Controls.Add(legend);
	//	}


	//	if (layout == "Rows, Left to Right")
	//	{
	//		Table t = ChartOutput.HorizontalTable(chartfactory.charts, settings.W, settings.H, Convert.ToInt32(trkNumColsLINE.Value));
	//		callbackCharts.Controls.Add(t);
	//	}
	//	else if (layout == "Cols, Top to Bottom")
	//	{
	//		Table t = ChartOutput.VerticalTable(chartfactory.charts, settings.W, settings.H, Convert.ToInt32(trkNumRowsLINE.Value));
	//		callbackCharts.Controls.Add(t);
	//	}

	//	if (settings.matchYAxes)
	//	{
	//		chartfactory.MatchYAxes();
	//	}

	//	ChartsToDisk(chartfactory);
	//}

	//protected void LaunchCrosstabs() // string xaxisvar, string colorsvar, string panelvar)
	//{
	//	//protected Literal CreatePivot(DataTable dt, List<string> pivot_rows, List<string> pivot_cols, string v0)
	//	int x = 0;
	//	var row = tokXTrow.Value.ToString().Replace("Data: ","");
	//	var col = tokXTcol.Value.ToString().Replace("Data: ", "");
	//	var panel = tokXTpanel.Value.ToString().Replace("Data: ", "");
	//	var cell = tokXTcell.Value.ToString().Replace("Data: ", "");
	//	var stats = tokXTstats.Value.ToString().Replace("Data: ", "");



	//	List<string> rowvars = row.Split(',').ToList();
	//	List<string> colvars = col.Split(',').ToList();
	//	List<string> panelvars = panel.Split(',').ToList();
	//	List<string> cellvars = cell.Split(',').ToList();
	//	List<string> statsvars = stats.Split(',').ToList();


	//	var foo = gvSelectedVars.GetSelectedFieldValues("vartype");

	//	int number_cat_vars = (chkXTincludenumeric.Checked) ?
	//		gridVarsNum.GridView.GetSelectedFieldValues("varname").Count() :
	//		gridVarsText.GridView.GetSelectedFieldValues("varname").Count();

	//	int dec_places = Convert.ToInt32(trkDecPlaces.Value);

	//	if (number_cat_vars == 0)
	//	{
	//		//lblXTError.Text = "No categorical variables are selected.";
	//	}
	//	else
	//	{
	//		//lblXTError.Text = "ok.";

	//		List<Panel> crosstabs = new List<Panel>();

	//		if (panel != "")
	//		{
	//			List<string> allvars = new List<string>();
	//			allvars.AddRange(rowvars);
	//			allvars.AddRange(colvars);
	//			allvars.Add("id");

	//			DataSubsets subsets = new DataSubsets(dpdata.dt, allvars, panelvars);

	//			foreach (uwac.DataSubset sub in subsets.subsets)
	//			{
	//				Panel xtpanel = new DxCrosstab(sub.dt, rowvars, colvars, statsvars, cellvars[0], sub.Cols_and_Vals_ToString(), dec_places).AsPanel();
	//				crosstabs.Add(xtpanel);
	//			}
	//		}
	//		else
	//		{
	//			Panel xtpanel = new DxCrosstab(dpdata.dt, rowvars, colvars, statsvars, cellvars[0], "Crosstabs ", dec_places).AsPanel();
	//			//Panel xtpanel = CreatePivot(dpdata.dt, rowvars, colvars, statsvars, cellvars[0], "Crosstabs ", dec_places);
	//			crosstabs.Add(xtpanel);
	//		}

	//		string layout = cboOutputStyleXT.Value.ToString();

	//		if (layout == "Rows, Left to Right")
	//		{
	//			Table t = ChartOutput.HorizontalTable(crosstabs, Convert.ToInt32(trkNumColsXT.Value));
	//			callbackCharts.Controls.Add(t);

	//		}
	//		else if (layout == "Cols, Top to Bottom")
	//		{
	//			Table t = ChartOutput.HorizontalTable(crosstabs, Convert.ToInt32(trkNumRowsXT.Value));
	//			callbackCharts.Controls.Add(t);
	//		}

	//	}


	//}

	//protected void LaunchScatterplots() // string xaxisvar, string colorsvar, string panelvar)
	//{



	//	if (settings.panelvar == "none")
	//	{

	//		DxChartFactory chartfactory = new DxChartFactory(DxChartType.Scatterplot, settings, dpdata.dt);

	//		string temptitle = "foo";
	//		Table t = (settings.showhist) ?
	//			ChartOutput.UpperDiagTable(chartfactory.charts, chartfactory.altcharts, settings.W, settings.H, 1.0, .8, temptitle, settings.numvars) :
	//			ChartOutput.UpperDiagTable(chartfactory.charts, settings.W, settings.H, 1.0, temptitle, settings.numvars);

	//		callbackCharts.Controls.Add(t);

	//		ChartsToDisk(chartfactory);
	//	}
	//	else{

	//		List<string> keepvars = new List<string>();
	//		keepvars.AddRange(settings.numvars);
	//		keepvars.Add("id");
	//		if (settings.colorvar != "none" & settings.colorvar != "variable") keepvars.Add(settings.colorvar);

	//		DataSubsets subsets = new DataSubsets(dpdata.dt, keepvars, new List<string> { settings.panelvar });

	//		foreach (uwac.DataSubset subset in subsets.subsets)
	//		{

	//			DxChartFactory chartfactory = new DxChartFactory(DxChartType.Scatterplot, settings, subset.dt);

	//			string temptitle = "foo";
	//			Table t = (settings.showhist) ?
	//				ChartOutput.UpperDiagTable(chartfactory.charts, chartfactory.altcharts, settings.W, settings.H, 1.0, .8, temptitle, settings.numvars) :
	//				ChartOutput.UpperDiagTable(chartfactory.charts, settings.W, settings.H, 1.0, temptitle, settings.numvars);

	//			Label label = new Label();
	//			label.Text = String.Format("<br/><br/>{0}",subset.Cols_and_Vals_ToString());
	//			label.Font.Bold = true;
	//			label.Font.Size = 12;
	//			callbackCharts.Controls.Add(label);
	//			callbackCharts.Controls.Add(t);

	//			ChartsToDisk(chartfactory);
	//		}
	//	}

	//}

	//protected void LaunchBarcharts() //string xaxisvar, string colorsvar, string panelvar)
	//{


	//	DxChartFactory chartfactory = new DxChartFactory(DxChartType.Barchart, settings, dpdata.dt);


	//	string layout = cboOutputStyleBAR.Value.ToString();

	//	if (layout == "Rows, Left to Right")
	//	{
	//		Table t = ChartOutput.HorizontalTable(chartfactory.charts, settings.W, settings.H, Convert.ToInt32(trkNumColsBAR.Value));
	//		callbackCharts.Controls.Add(t);
	//	}
	//	else if (layout == "Cols, Top to Bottom")
	//	{
	//		Table t = ChartOutput.VerticalTable(chartfactory.charts, settings.W, settings.H, Convert.ToInt32(trkNumRowsBAR.Value));
	//		callbackCharts.Controls.Add(t);
	//	}

	//	//TODO stats tables
	//	//if (chkStatsTable.Checked)
	//	//{
	//	//	if (chart.statstable.dt.Rows.Count > 0)
	//	//	{
	//	//		ASPxGridView grid = new ASPxGridView();
	//	//		grid.SettingsPager.PageSize = 30;
	//	//		grid.DataSource = chart.statstable.dt;
	//	//		grid.DataBind();
	//	//		callbackCharts.Controls.Add(grid);
	//	//	}
	//	//}

	//	ChartsToDisk(chartfactory);
	//}




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
		List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
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
			callbackCharts.Controls.Add(t);
		}


	}



	protected void log(string s)
	{
		if (printDebug)
		{
			Debug.Print(s);
		}
	}


	protected void btnPDF_OnClick(object source, EventArgs e)
	{
		string path = @"c:\_temp\factory\";
		List<string> files = Directory.GetFiles(path, "*.xml", SearchOption.TopDirectoryOnly).ToList();

		for(int i=0; i < files.Count; i++)
		{
			string f = files[i];
			files[i] = f.Replace(path, "").Replace(".xml","");
		}

		MakePDF(files);
	}

	//protected void btnWord_OnClick(object source, EventArgs e)
	//{
	//	string path = @"c:\_temp\factory\";
	//	List<string> files = Directory.GetFiles(path, "*.xml", SearchOption.TopDirectoryOnly).ToList();

	//	for (int i = 0; i < files.Count; i++)
	//	{
	//		string f = files[i];
	//		files[i] = f.Replace(path, "").Replace(".xml", "");
	//	}

	//	MakeDocx(files);
	//}





	protected void DeleteChartFiles()
	{
		System.IO.DirectoryInfo di = new DirectoryInfo(@"c:\_temp\factory\");

		foreach (FileInfo file in di.GetFiles())
		{
			file.Delete();
		}
	}


	protected void ChartsToDisk(DxChartFactory factory, string path )
	{
		log("----- ChartsToDisk !!!!! -----");

		foreach (DxBatchOcharts batch in factory.batches)
		{
			foreach (DxChart chart in batch.charts)
			{
				try
				{
					//chartfiles.Add(chart.guid);
					//string xmlfile = String.Format("{0}{1}.{2}", path, chart.guid, "xml");
					//chart.chart.SaveToFile(xmlfile);
					chart.W = Convert.ToInt32(chart.W / 4);
					chart.H = Convert.ToInt32(chart.H / 2);

					chart.chart.ExportToImage(String.Format("{0}{1}.{2}", path, chart.guid, "png"), ImageFormat.Png);
				}
				catch (Exception ex) { }
			}
		}
	}

	protected void DeleteChartsOnDisk(DxChartFactory factory, string path)
	{
		log("----- DeleteChartsOnDisk  !!!!! -----");

		foreach (DxBatchOcharts batch in factory.batches)
		{
			foreach (DxChart chart in batch.charts)
			{
				//try
				//{
				//	File.Delete(String.Format("{0}{1}.{2}", path, chart.guid, "xml"));
				//}
				//catch (Exception ex) { }
				try
				{
					File.Delete(String.Format("{0}{1}.{2}", path, chart.guid, "png"));
				}
				catch (Exception ex) { }
			}
		}
	}


	//protected void SaveChartToImage(WebChartControl chart, string filepath, string filename )
	//{
	//	chart.ExportToImage(String.Format("{0}{1}.{2}", filepath, filename, "png"), ImageFormat.Png);
	//}



	#region Export to Word

	protected  void DocxHeader(DevExpress.XtraRichEdit.API.Native.Document doc, string s1, string s2)
	{
		DevExpress.XtraRichEdit.API.Native.Section firstSection = doc.Sections[0];
		// Create an empty header.
		SubDocument newHeader = firstSection.BeginUpdateHeader();
		firstSection.EndUpdateHeader(newHeader);
		// Check whether the document already has a header (the same header for all pages).
		if (firstSection.HasHeader(DevExpress.XtraRichEdit.API.Native.HeaderFooterType.Primary))
		{
			SubDocument myHeader = firstSection.BeginUpdateHeader();
			doc.ChangeActiveDocument(myHeader);
			doc.CaretPosition = myHeader.CreatePosition(0);

			string txt = String.Format("{0}     p.", s1);
			DocumentRange range = myHeader.InsertText(myHeader.CreatePosition(0), txt);
			Field fld = myHeader.Fields.Create(range.End, "PAGE"); //  "PAGE \\* ARABICDASH");
			myHeader.Fields.Update();

			myHeader.Paragraphs.Append();
			string user_time = String.Format("{0}     {1:MM/dd/yy H:mm}", Master.Master_netid, System.DateTime.Now);
			myHeader.AppendText(String.Format("{0}                             {1}",s2, user_time));


			firstSection.EndUpdateHeader(myHeader);
		}



	}

	protected void MakeDocx(DxChartFactory factory)
	{
		log(" ====== MakeDocx ======");
		const float imageLocationX = 40;
		const float imageLocationY = 40;
		int counter = 0;
		string path = @"C:\_temp\factory\";
		ChartsToDisk(factory, path);

		string fileName = String.Format(@"{0}{1}", path, "Test.docx");


		using (DevExpress.XtraRichEdit.RichEditDocumentServer srv = new DevExpress.XtraRichEdit.RichEditDocumentServer())
		{ 

			DevExpress.XtraRichEdit.API.Native.Document doc = srv.Document;

			DocxHeader(doc, lblProjTitle.Text, gridFile.Value.ToString());

			DocumentPosition pos = doc.Range.Start;
			//New Section

			foreach (DxBatchOcharts batch in factory.batches)
			{
				foreach (DxChart chart in batch.charts)
				{
					string chartfile = String.Format(@"{0}{1}.png", path, chart.guid);
					log(chartfile);
					//MemoryStream s = new MemoryStream();
					//chart.chart.ExportToImage(s, System.Drawing.Imaging.ImageFormat.Png);
					doc.Images.Insert(pos, DocumentImageSource.FromFile(chartfile));

				}

			}

			

			srv.SaveDocument(fileName, DevExpress.XtraRichEdit.DocumentFormat.OpenXml);
		}


		//System.Diagnostics.Process.Start(fileName);


		//MemoryStream ms = new MemoryStream();
		//srv.SaveDocument(ms, DevExpress.XtraRichEdit.DocumentFormat.OpenXml);
		////System.Diagnostics.Process.Start(fileName);

		//ms.Seek(0, SeekOrigin.Begin);
		//byte[] output = ms.ToArray();


		//Response.ContentType = "application/docx";
		//Response.AddHeader("content-disposition", String.Format("attachment;filename={0}", fileName));
		//Response.Cache.SetCacheability(HttpCacheability.NoCache);
		//Response.OutputStream.Write(output, 0, output.Length);
		//Response.End();


	}


	protected float DocxAddPageHeader(PdfGraphics g, int pagenumber)
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

	#endregion







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
			g.DrawString(page, font, black, x_right - (g.MeasureString(page, font).Width) , 10);
			//project title
			g.DrawString(s1, font16, black, x, y);
			y = y + g.MeasureString(s1, font16).Height - yoffset;
			//file, user, date
			g.DrawString(s2, font12, black, x, y);
			float x2 = x_right - g.MeasureString(user_time, font).Width ;
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
						string path = @"c:\_temp\factory\";


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
				catch(Exception ex)
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
			documentProcessor.SaveDocument(@"c:\_temp\foo.pdf");

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

	protected DxChartLayout ConvertChartLayout(string layout)
	{
		return ConvertChartLayout(layout, false);
	}

	protected DxChartLayout ConvertChartLayout(string layout, bool withDiag)
	{
		if (layout == "Upper" & !withDiag) return DxChartLayout.Upper;
		else if (layout == "Upper" & withDiag) return DxChartLayout.UpperDiag;
		else if (layout.StartsWith("Rows")) return DxChartLayout.Horizontal;
		else if (layout.StartsWith("Cols")) return DxChartLayout.Vertical;
		else return DxChartLayout.Horizontal;
	}

}

//TODO
//bar - stacked bar
//bar  - desc stats
//pca  - plot scree plot for eigenvalues and polar coords for loadings...

//PDF horizontal, vertical, and diag



