using Accord.Statistics.Analysis;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using uwac;
using uwac.trk;
using DevExpress.Pdf;
using DevExpress.Pdf.Interop;
using DevExpress.XtraPrinting;
using DevExpress.Xpf.Printing;
using DevExpress.XtraPrinting.Links;
using DevExpress.XtraCharts.Native;
using DevExpress.XtraReports;
using DevExpress.XtraReports.UI;
using DevExpress.XtraPivotGrid;
using NReco.PivotData;
using System.IO;
using NReco.PivotData.Output;

//public partial class PointSeries : ChartBasePage{
public partial class DataProject_Chart : System.Web.UI.Page
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
	DxCharts dxchart;
	List<Color> colors;
	DPData dpdata;
	string selectedsheet;
	bool printDebug = true;
	List<string> dummydata;

	#region Page Setup
	protected void Page_Init(object sender, EventArgs e)
	{
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

		panel.ContentTemplateContainer.Controls.Clear();

		ProcessQueryStringParams();

		if (dataproj_pk > 0)
		{
			LoadFiles(dataproj_pk);
			gridFile.Enabled = true;
			gridFile.NullText = "Select Data File...";
			gridFile.ClientEnabled = true;

		}



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
		lblWbar.Text  = chartWbar.ToString();
		lblHbar.Text  = chartHbar.ToString();
		lblWline.Text = chartWline.ToString();
		lblHline.Text = chartHline.ToString();

		trackWhist.Value = chartWhist;
		trackHhist.Value = chartHhist;
		trackWscat.Value = chartWscat;
		trackHscat.Value = chartHscat;
		trackWbar.Value = chartWbar ;
		trackHbar.Value = chartHbar;

		List<string> defaultvals = new List<string> { "variable", "timept", "group", "txgrp", "sex" };

		PopulateDropdownItems(cboColorsvarHIST, new List<string> { "timept", "group", "txgrp", "sex" });
		PopulateDropdownItems(cboPanelvarHIST, new List<string> { "timept", "group", "txgrp", "sex" });


		PopulateDropdownItems(cboXaxisvarBAR, defaultvals);
		PopulateDropdownItems(cboColorsvarBAR, new List<string> { "none", "timept", "group", "txgrp", "sex" });
		PopulateDropdownItems(cboPanelvarBAR, new List<string> { "none", "timept", "group", "txgrp", "sex" });

		PopulateDropdownItems(cboXaxisvarSCAT, new List<string> { "timept", "group", "txgrp", "sex" });
		PopulateDropdownItems(cboColorsvarSCAT, new List<string> { "none", "timept", "group", "txgrp", "sex" });
		PopulateDropdownItems(cboPanelvarSCAT, new List<string> { "none", "timept", "group", "txgrp", "sex" });


		PopulateDropdownItems(cboXaxisvarLINE,   new List<string> { "variable", "timept" });
		PopulateDropdownItems(cboColorsvarLINE, new List<string> { "none", "variable", "timept", "group", "txgrp", "sex" });
		PopulateDropdownItems(cboPanelvarLINE, new List<string> { "none","variable", "timept", "group", "txgrp", "sex", "id" });

		PopulateDropdownItems(cboColorsvarPCA, defaultvals);


		cboColorsvarHIST.Value = "none";
		cboPanelvarHIST.Value = "none";
		cboColorsvarBAR.Value = "none";
		cboPanelvarBAR.Value = "none";
		cboColorsvarSCAT.Value = "none";
		cboPanelvarSCAT.Value = "none";

		cboColorsvarLINE.Value = "none";
		cboPanelvarLINE.Value = "none";

		PopulateTokenboxItems(cboXTrow, defaultvals);
		PopulateTokenboxItems(cboXTcol, defaultvals);
		PopulateTokenboxItems(cboXTpanel, defaultvals);

		cboXTrow.Value = "variable";
		cboXTcol.Value = "group";

		//ToggleTabVisible("tabVars", false);
		ToggleTabVisible("tabPlots", false);
		ToggleTabVisible("tabTables", false);


	}


	protected void ToggleTabVisible(string name, bool makeVisible)
	{
		int idx = tabSteps.TabPages.IndexOfName(name);
		tabSteps.TabPages[idx].ClientVisible = makeVisible;
	}



	protected void PageLoad_PostBack()
	{
		log(String.Format("Page_Load Is PostBack - {0}", IsPostBack));

		Int32.TryParse(trackWhist.Value.ToString(), out chartWhist);
		Int32.TryParse(trackHhist.Value.ToString(), out chartHhist);


		if (Session["dset"] == null){
			log(String.Format("Page_Load Is PostBack - {0}   A1 Session[dset] IS NULL", IsPostBack));
		}
		else if (Session["dset"] != null)
		{
			log(String.Format("Page_Load Is PostBack - {0}   B1 Session[dset] IS NOT NULL", IsPostBack));
			DataSet dset = (DataSet)Session["dset"];

			//Set the selected sheet
			string source = "";
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
			else
			{
				selectedsheet = gridDataSheets.Text;
				source = "gridDataSheets";
			}

			Session["selectedsheet"] = selectedsheet;
			log(String.Format(" *** selectedsheet         ={0}   source={1}", selectedsheet, source));
			log(String.Format(" *** Session[selectedsheet]={0}   ", Session["selectedsheet"] ));



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


			if (Session["dxchart"] != null)
			{
				dxchart = (DxCharts)Session["dxchart"];
			}
			else
			{
				dxchart = new DxCharts(dpdata);
				Session["dxchart"] = dxchart;
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

			
			List<string> selected_numvars  = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
			List<string> selected_textvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
			List<string> selected_datevars = dataops.GetListString(gridVarsDate.GridView.GetSelectedFieldValues("varname"));
			List<string> selected_agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));


			dpdata.numericvars = selected_numvars;
			dpdata.textvars = selected_textvars;
			dpdata.datevars = selected_datevars;

			PopulateDropdownItems(cboXaxisvar, selected_textvars);


			PopulateDropdownItems(cboColorsvarHIST, selected_textvars);
			PopulateDropdownItems(cboPanelvarHIST, selected_textvars);

			PopulateDropdownItems(cboColorsvarBAR, selected_textvars);
			PopulateDropdownItems(cboPanelvarBAR, selected_textvars);
			PopulateDropdownItems(cboColorsvarSCAT, selected_textvars);
			PopulateDropdownItems(cboPanelvarSCAT, selected_textvars);




			List<string> vars_for_xaxis_lineplot = new List<string> { "variable", "timept " };
			if (selected_datevars.Count > 0) vars_for_xaxis_lineplot.AddRange(selected_datevars);
			if (selected_agevars.Count > 0) vars_for_xaxis_lineplot.AddRange(selected_agevars);

			PopulateDropdownItems(cboXaxisvarLINE,  vars_for_xaxis_lineplot);


			PopulateTokenboxItems(cboXTrow, selected_textvars);
			PopulateTokenboxItems(cboXTcol, selected_textvars);
			PopulateTokenboxItems(cboXTpanel, selected_textvars);



			//LoadDxChartSettings(dxchart);
			//LoadColors();
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

	//protected void LoadDxChartSettings(DxCharts chart)
	//{
	//	log(" === LoadDxChartSettings === ");
	//	chart.chartWhist = chartWhist;
	//	chart.chartHhist = chartHhist;

	//	chart.numtablecols = Convert.ToInt32(trkNumCols.Position);
	//	chart.numbins = Convert.ToInt32(trkNumBins.Position);


	//	chart.SetColor((Color)Color1.Value, 0);
	//	chart.SetColor((Color)Color2.Value, 1);
	//	chart.SetColor((Color)Color3.Value, 2);
	//	chart.SetColor((Color)Color4.Value, 3);
	//	chart.SetColor((Color)Color5.Value, 4);
	//	chart.SetColor((Color)Color6.Value, 5);
	//	chart.SetColor((Color)Color7.Value, 6);
	//	chart.SetColor((Color)Color8.Value, 7);
	//	chart.SetColor((Color)Color9.Value, 8);
	//	chart.SetColor((Color)Color10.Value, 9);
	//	chart.SetColor((Color)Color11.Value, 10);
	//	chart.SetColor((Color)Color12.Value, 11);
	//	chart.SetColor((Color)Color13.Value, 12);
	//	chart.SetColor((Color)Color14.Value, 13);
	//	chart.SetColor((Color)Color15.Value, 14);


	//	if (cboPanes.SelectedItem.Value.ToString() == "none")
	//	{
	//		chart.usepanes = false;
	//	}
	//	else
	//	{
	//		chart.usepanes = true;
	//		chart.SetLayoutDirection(cboPanes.SelectedItem.Value.ToString());
	//	}
	//}


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


	//DataTable dtv = uwac.trk.dataops.GetVarsForDataproject(pk, smID_csv);

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
			if (tblname.StartsWith("Data") && tblname != "DataDictionary" && tblname != "Data_sqlcode")
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
				if (tblname.StartsWith("Data") && tblname != "DataDictionary" && tblname != "Data_sqlcode")
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
		else
		{
			DataView vw = dictorig.AsDataView();
			vw.RowFilter = String.Format("[measname] = '{0}'", sheet.Replace("Data_", ""));
			DataTable dt = vw.ToTable();
			return dt;
		}

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
		vwdatadict_age.RowFilter = "(FieldLabel like '% age (mo%' or FieldLabel like '%age mos%')";
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


	//protected void AddTextVarToSelector(DataTable dt, string varname, string label)
	//{
	//	DataRow add_var = dt.NewRow();
	//	add_var["varname"] = varname;
	//	add_var["FieldLabel"] = label;
	//	dt.Rows.Add(add_var);
	//}


	#endregion

	#region Populate Dropdowns


	//protected void PopulateDropdownItems(ASPxComboBox cbo)
	//{
	//	//defaults
	//	cbo.Items.Clear();
	//	string cboname = cbo.ID;

	//	cbo.Items.AddRange(PopulateItems(cbo.ClientInstanceName
	//		, new List<string> { "none", "variable", "timept", "group", "txgrp", "sex" }
	//		, null));
	//}

	protected void PopulateDropdownItems(ASPxComboBox cbo, List<string> defaultvals)
	{
		cbo.Items.Clear();
		string cboname = cbo.ID;

		cbo.Items.AddRange(PopulateItems(cbo.ClientInstanceName
			, defaultvals
			, null));

	}


	protected void PopulateDropdownItems(ASPxComboBox cbo, List<string> defaultvals, List<string> datavals)
	{
		cbo.Items.Clear();
		string cboname = cbo.ID;
		cbo.Items.AddRange(PopulateItems(cbo.ClientInstanceName, defaultvals, datavals));
	}



	//protected void PopulateTokenboxItems(ASPxTokenBox cbo)
	//{
	//	List<string> defaultvals = new List<string> { "variable", "timept", "group", "txgrp", "sex" };
	//	cbo.Items.Clear();
	//	string cboname = cbo.ID;
	//	cbo.Items.AddRange(PopulateItems(cbo.ClientInstanceName, defaultvals, null));
	//}

	protected void PopulateTokenboxItems(ASPxTokenBox cbo, List<string> defaultvals )
	{
		cbo.Items.Clear();
		string cboname = cbo.ID;
		cbo.Items.AddRange(PopulateItems(cbo.ClientInstanceName, defaultvals, null));
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
			defaultvals.Add("txstyle");
			defaultvals.Add("txintensity");
		}
		if (controlname == "cboColorsvar" || controlname == "cboPanelvar")
		{
			defaultvals.Add("id");
			defaultvals.Add("ref_id");
		}

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


	//	protected void cboPanelvar_DataBound(object sender, EventArgs e)
	//{
	//	//List<string> txtvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
	//	//int x = 0;

	//	//foreach (string s in txtvars)
	//	//{
	//	//	bool alreadyinlist = false;
	//	//	foreach (ListEditItem itm in cboPanelvar.Items)
	//	//	{
	//	//		if (itm.Value.ToString() == s) alreadyinlist = true;
	//	//	}
	//	//	if (!alreadyinlist)
	//	//	{
	//	//		ListEditItem newitm = new ListEditItem() { Value = s, Text = s };
	//	//		cboPanelvar.Items.Insert(0, newitm);
	//	//	}
	//	//}

	//}

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

	protected void PopulatePivotMissing(DataTable dtstacked)
	{
		pivotMissing.DataSource = dtstacked;
		pivotMissing.DataBind();

		pivotMissing.Visible = true;
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

		var p = e.Parameter;
		List<string> chart_vars = p.Split(',').ToList();

		string colorsvarHIST = chart_vars[0];
		string panelvarHIST = chart_vars[1];

		string xaxisvarBAR = chart_vars[2];
		string colorsvarBAR = chart_vars[3];
		string panelvarBAR = chart_vars[4];

		string xaxisvarSCAT = chart_vars[5];
		string colorsvarSCAT = chart_vars[6];
		string panelvarSCAT = chart_vars[7];

		string xaxisvarLINE = chart_vars[8];
		string colorsvarLINE = chart_vars[9];
		string panelvarLINE = chart_vars[10];

		string xtrowvar = chart_vars[11];
		string xtcolvar = chart_vars[12];
		string xtpanelvar = chart_vars[13];

		string colorsvarPCA = chart_vars[14];

		callbackCharts.Controls.Clear();

		CreateCharts( colorsvarHIST, panelvarHIST
			, xaxisvarBAR, colorsvarBAR, panelvarBAR
			, xaxisvarSCAT, colorsvarSCAT, panelvarSCAT
			, xaxisvarLINE, colorsvarLINE, panelvarLINE
			, xtrowvar, xtcolvar, xtpanelvar
			, colorsvarPCA
			);

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
			string notDataSheet = (selectedsheet != "Data") ? String.Format(" and measname='{0}'" , selectedsheet.Replace("Data_", "")) : "";

			string filter = String.Format("varname in ('{0}') {1}", String.Join("','", allvars), notDataSheet);




			DataView dv = dpdata.dtdict.AsDataView();
			
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
		else {
			gvSelectedVars.Visible = false;
			lblVarLabels.Visible = false;
			btnVarLabelsHide.Visible = false;
			btnVarLabelsShow.Visible = false;
		}
	}


	protected ASPxGridView SelectedVars_GridView()
	{
		ASPxGridView gv = new ASPxGridView();

		List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
		List<string> txtvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
		List<string> datevars = dataops.GetListString(gridVarsDate.GridView.GetSelectedFieldValues("varname"));
		List<string> agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));

		List<string> allvars = new List<string>();
		allvars.AddRange(numvars);
		allvars.AddRange(txtvars);
		allvars.AddRange(datevars);
		allvars.AddRange(agevars);


		if (allvars.Count > 0)
		{
			string notDataSheet = (selectedsheet != "Data") ? String.Format(" and measname='{0}'", selectedsheet.Replace("Data_", "")) : "";

			string filter = String.Format("varname in ('{0}') {1}", String.Join("','", allvars), notDataSheet);


			DataView dv = dpdata.dtdict.AsDataView();
			dv.RowFilter = filter;
			DataTable dt = dv.ToTable();

			gv.Columns.Add(new GridViewDataColumn() { FieldName = "measname" });
			gv.Columns.Add(new GridViewDataColumn() { FieldName = "varname" });
			gv.Columns.Add(new GridViewDataColumn() { FieldName = "FieldLabel" });
			gv.DataSource = dt;
			gv.DataBind();

			return gv;
		}
		else
		{
			return null;
		}
	}

	#endregion


	#region Create Charts


	protected void UpdateGroupingvars()
	{

		List<string> groupingvars = new List<string>();
		if (cboXaxisvar.Value.ToString() != "Variable" && cboXaxisvar.Value != null) groupingvars.Add(cboXaxisvar.Value.ToString());
		if (cboColorsvar.Value.ToString() != "Variable" && cboColorsvar.Value.ToString() != "none" && cboColorsvar.Value != null) groupingvars.Add(cboColorsvar.Value.ToString());
		if (cboPanelvar.Value.ToString() != "Variable" && cboPanelvar.Value.ToString() != "none" && cboPanelvar.Value != null) groupingvars.Add(cboPanelvar.Value.ToString());

		List<string> txtvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));

		if (txtvars.Count > 0) groupingvars.AddRange(txtvars);

		groupingvars = groupingvars.Distinct().ToList();

		//Always create DataSubsets
		//dpdata.groupingvars = groupingvars;
		//dpdata.CreateDataSubsets();

	}


	protected void CreateCharts(string colorsvarHIST, string panelvarHIST
			, string xaxisvarBAR, string colorsvarBAR, string panelvarBAR
			, string xaxisvarSCAT, string colorsvarSCAT, string panelvarSCAT
			, string xaxisvarLINE, string colorsvarLINE, string panelvarLINE
			, string xtrowvar, string xtcolvar, string xtpanelvar
			, string colorsvarPCA)
	{
		callbackCharts.Controls.Clear();
		//CreateSubsets();
		//UpdateGroupingvars();
		//dpdata.CreateDataSubsets();

		List<string> plots = dataops.GetListString(chkPlots.SelectedValues);

		DevExpress.XtraPrintingLinks.CompositeLink complink = initializePDF();

		//addtoPDF(complink, String.Format("{0} {1}   file={2}", Request.QueryString["pk"], Session["projTitle"].ToString(), gridFile.Value), true);
		//addtoPDF(complink, "Selected variables:", true);
		//addtoPDF(complink, SelectedVars_GridView());


		//Then depending on what is selected create the specific charts
		if (plots.Contains("Scatterplot")) //&& plots.Count == 1)
		{
			DxScatterplotSettings settings = new DxScatterplotSettings();
			settings.W = Convert.ToInt32(trackWscat.Position);
			settings.H = Convert.ToInt32(trackHscat.Position);

			int movavgNumPts = Convert.ToInt32(txtPtsCount.Text);
			if (movavgNumPts > 0)
			{
				settings.movavgNumPts = movavgNumPts;
			}

			settings.showregline = chkRegline.Checked;
			settings.useMovAvg = chkMovingAvg.Checked;
			settings.colors = GetColors();

			settings.numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
			

			//	numvars = numvars.ConvertAll(x => x.ToLower());
			//	numvars.Add("id"); //Add ID so that points can be identified

			DxChartFactory chartfactory = new DxChartFactory(DxChartType.Scatterplot, settings, dpdata.dt);

			//CreateScatterplots(xaxisvarSCAT, colorsvarSCAT, panelvarSCAT);

			foreach(DxChart chart in chartfactory.charts)
			{
				callbackCharts.Controls.Add(chart.chart);
			}


		}
		//if (plots.Contains("PCA")) //&& plots.Count == 1)
		//{
		//	CreatePCA(colorsvarPCA,  complink);
		//}
		//if (plots.Contains("Histogram")) //&& plots.Count == 1)
		//{
		//	CreateHistograms( colorsvarHIST, panelvarHIST, complink);
		//}

		//if(plots.Contains("Barchart")) //&& plots.Count == 1)
		//{
		//	CreateBarcharts(xaxisvarBAR, colorsvarBAR, panelvarBAR, complink);
		//}
		//if (plots.Contains("Lineplot")) //&& plots.Count == 1)
		//{
		//	CreateLineplots(xaxisvarLINE, colorsvarLINE, panelvarLINE);
		//}
		//if (plots.Contains("Crosstabs")) //&& plots.Count == 1)
		//{
		//	CreateCrosstabs( xtpanelvar, xtrowvar, xtcolvar);
		//}



	}

	//protected void CreateCrosstabs(string panelvar, string rowvar, string colvar)
	//{
	//	DevExpress.XtraPrintingLinks.CompositeLink complink = new DevExpress.XtraPrintingLinks.CompositeLink();
	//	CreateCrosstabs(panelvar, rowvar, colvar, complink);
	//}

	//protected void CreateCrosstabs(string panelvar, string rowvar, string colvar, DevExpress.XtraPrintingLinks.CompositeLink complink)
	//{
	//	var includenumeric = chkXTincludenumeric.Checked;
	//	//var pairwise = chkXTpairwise.Checked;
	//	List<string> vars = new List<string>();
	//	List<string> pivot_rows = new List<string>();
	//	List<string> pivot_cols = new List<string>();

	//	//Get the list of vars to process
	//	if (includenumeric)
	//	{
	//		List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
	//		numvars = numvars.ConvertAll(x => x.ToLower());

	//		List<string> catvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
	//		catvars = catvars.ConvertAll(x => x.ToLower());

	//		if (numvars.Count > 0) vars.AddRange(numvars);
	//		if (catvars.Count > 0) vars.AddRange(catvars);
	//	}
	//	else
	//	{
	//		List<string> catvars = dataops.GetListString(gridVarsText.GridView.GetSelectedFieldValues("varname"));
	//		catvars = catvars.ConvertAll(x => x.ToLower());

	//		if (catvars.Count > 0) vars.AddRange(catvars);
	//	}



	//	//Build the Crosstabs tables
	//	var XTmode = cboXTmode.Value.ToString();

	//	List<string> row_vars_list = cboXTrow.Value.ToString().Replace("Data: ", "").Split(',').ToList();
	//	List<string> col_vars_list = cboXTcol.Value.ToString().Replace("Data: ", "").Split(',').ToList();

	//	bool var_in_rows = row_vars_list.Contains("variable");
	//	bool var_in_cols = col_vars_list.Contains("variable");

	//	//Validate the selections to ensure a crosstab table can be created
	//	bool isMissingRowsAndCols = (cboXTrow.Value.ToString() == "" && cboXTcol.Value.ToString() == "") ? true : false;

	//	bool isMissingSelectedVars = ((var_in_rows || var_in_cols) && vars.Count == 0) ? true : false;




	//	List<string> panel_vars_list = cboXTpanel.Value.ToString().Replace("Data: ", "").Split(',').ToList();


	//	//Make sure we're not missing anything
	//	if (!isMissingRowsAndCols && !isMissingSelectedVars)
	//	{
	//		List<DataTable> dts = new List<DataTable>();
	//		bool useSubsets = false;
	//		int n = 1;

	//		//Setup a list of datatables is there is a panel var selected
	//		if (panel_vars_list[0] != "")
	//		{
	//			List<string> allvars = new List<string>();
	//			allvars.AddRange(vars);
	//			allvars.AddRange(row_vars_list);
	//			allvars.AddRange(col_vars_list);
	//			allvars.Add(panel_vars_list[0]);
	//			allvars.Add("id");

	//			DataSubsets datasubsets = new DataSubsets(dpdata.dt, allvars, panel_vars_list[0]);

	//			useSubsets = true;

	//			n = datasubsets.subsets.Count;

	//			for (int s = 0; s < n; s++)
	//			{
	//				if (datasubsets.subsets[s].dt.Rows.Count > 1)
	//				{
	//					DataTable foo = datasubsets.subsets[s].dt;
	//					foo.TableName = datasubsets.subsets[s].Cols_and_Vals_ToString();
	//					dts.Add(foo);
	//				}
	//			}

	//		}
	//		else
	//		{
	//			dts.Add(dpdata.dt);
	//		}

	//		Literal head = new Literal();
	//		head.Text = "<b>Crosstabs</b></br>";
	//		callbackCharts.Controls.Add(head);


	//		int foof = dts.Count;
	//		//Loop through panel var if there is one
	//		for (int a = 0; a < dts.Count; a++)
	//		{
	//			List<Table> xtabs = new List<Table>();
	//			DataTable pivot_dt = dts[a];
	//			pivot_rows.Clear();
	//			pivot_cols.Clear();

				
	//			if (useSubsets)
	//			{
	//				Literal subhead = new Literal(); 
	//				subhead.Text = String.Format("<b>{0}</b></br>", dts[a].TableName);
	//				callbackCharts.Controls.Add(subhead);
	//			}



	//			//Selected var in both rows and columns
	//			if (var_in_rows && var_in_cols)
	//			{
	//				int foo = 1;
	//			}
	//			//Selected var in rows
	//			else if (var_in_rows || var_in_cols)
	//			{
	//				List<string> vars_list = (var_in_rows) ? row_vars_list : col_vars_list;

	//				if (XTmode == "1")  // each fixed var as a separate table
	//				{
	//					List<string> fixed_vars = (var_in_rows) ? col_vars_list : row_vars_list;
	//					List<Literal> row_of_lits = new List<Literal>();
	//					for (int h = 0; h < fixed_vars.Count(); h++)
	//					{
	//						pivot_rows.Clear();
	//						pivot_cols.Clear();
	//						if (var_in_rows) {pivot_cols.Add(fixed_vars[h]); } else { pivot_rows.Add(fixed_vars[h]); }
	//						for (int i = 0; i < vars.Count(); i++)
	//						{
	//							for (int j = 0; j < vars_list.Count; j++)
	//							{
	//								if(j==0 && var_in_rows) { pivot_rows.Clear(); } else { pivot_cols.Clear(); }
	//								string var_to_add = (vars_list[j] == "variable") ? vars[i] : vars_list[j];
	//								if (var_in_rows) { pivot_rows.Add(var_to_add); } else { pivot_cols.Add(var_to_add); }
	//							}
	//							Literal lit0 = CreatePivot(pivot_dt, pivot_rows, pivot_cols, "id");
	//							row_of_lits.Add(lit0); // callbackCharts.Controls.Add(lit0);
	//						}
	//					}
	//					Table t = TableHelper.HorizontalTable(row_of_lits);
	//					xtabs.Add(t);

	//				}
	//				else if (XTmode == "2")  // all fixed vars in same table
	//				{
	//					if (var_in_rows) { pivot_cols.AddRange(col_vars_list); } else { pivot_rows.AddRange(row_vars_list); }
	//					for (int i = 0; i < vars.Count(); i++)
	//					{
	//						for (int j = 0; j < vars_list.Count; j++)
	//						{
	//							string var_to_add = (vars_list[j] == "variable") ? vars[i] : vars_list[j];
	//							if (var_in_rows) { pivot_rows.Add(var_to_add); } else { pivot_cols.Add(var_to_add); }
	//						}
	//						Literal lit0 = CreatePivot(pivot_dt, pivot_rows, pivot_cols, "id");

	//						xtabs.Add(TableHelper.HorizontalTable(lit0)); // callbackCharts.Controls.Add(lit0);
	//					}
	//				}
	//			}
	//			else //not using selected vars, thus no need to loop through selected vars
	//			{
	//				pivot_rows.AddRange(row_vars_list);
	//				pivot_cols.AddRange(col_vars_list);

	//				Literal lit0 = CreatePivot(pivot_dt, pivot_rows, pivot_cols, "id");
	//				xtabs.Add(TableHelper.HorizontalTable(lit0)); // callbackCharts.Controls.Add(lit0);

	//			}

	//			foreach (Table tbl in xtabs)
	//			{
	//				tbl.CellPadding = 10;
	//				tbl.CellSpacing = 10;
	//				callbackCharts.Controls.Add(tbl);
	//			}

	//		}
	//	}
	//	else
	//	{
	//		//Missing a selection for row or col
	//	}

		
	//}


	//protected Literal CreatePivot(DataTable dt, List<string> pivot_rows, List<string> pivot_cols, string v0)
	//{
	//	List<utilPivotTable.AggrFx> fx = new List<utilPivotTable.AggrFx>();
	//	fx.Add(utilPivotTable.AggrFx.N);

	//	PivotTable pivot = utilPivotTable.DataTable_to_PivotTable(dt, pivot_rows, pivot_cols, v0, fx);


	//	var strHtmlWr = new StringWriter();
	//	var pvtHtmlWr = new PivotTableHtmlWriter(strHtmlWr);
	//	pvtHtmlWr.TableClass = "table table-bordered table-condensed pvtTable";
	//	pvtHtmlWr.Write(pivot);
	//	var htmlContent = strHtmlWr.ToString();


	//	Literal lit = new Literal();

	//	string headerRow = String.Join(" > ", pivot_rows);
	//	string headerCol = String.Join(" > ", pivot_cols);

	//	lit.Text = String.Format("<b>{0}</b> by <b>{1}</b><br/><br/>{2}<br/><br/>", headerRow, headerCol, htmlContent);

	//	return lit;
	//}



	//protected DevExpress.Web.ASPxPivotGrid.PivotGridField AddPivotGridField(string v, DevExpress.XtraPivotGrid.PivotArea area)
	//{
	//	DevExpress.Web.ASPxPivotGrid.PivotGridField fld = new DevExpress.Web.ASPxPivotGrid.PivotGridField();
	//	fld.ID = String.Format("fld{0}", v);
	//	fld.FieldName = v;
	//	fld.Area = area;
	//	return fld;
	//}



	//protected void CreatePCA(string colorsvar,   DevExpress.XtraPrintingLinks.CompositeLink complink)
	//{
	//	List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
	//	string method = rblMethod.SelectedItem.Value.ToString();
	//	List<Table> tables = new List<Table>();

	//	if (colorsvar == "group" || 
	//		colorsvar == "timept" ||
	//		colorsvar == "txgrp" ) 
	//	{
	//		List<PCA> pcas = new List_O_PCA(dpdata, numvars, method, colorsvar).pcas;
	//		for(int a=0; a < pcas.Count; a++)
	//		{
	//			tables.Add(pcas[a].OutputTable);
	//		}

	//		if (tables.Count > 0)
	//		{
	//			//addtoPDF(complink, pcas);
	//		}

	//	}
	//	else //no subsets
	//	{			
	//		PCA pca = new PCA(dpdata, numvars, method,"");
	//		if (pca.OutputTable != null)
	//		{
	//			//addtoPDF(complink, pca);
	//			tables.Add(pca.OutputTable);
	//		}

	//	}

	//	foreach(Table t in tables)
	//	{
	//		callbackCharts.Controls.Add(t);
	//	}


	//}

	//protected void CreateHistograms(string colorsvar, string panelvar, DevExpress.XtraPrintingLinks.CompositeLink complink)
	//{
	//	List<DxCharts.Mychart> charts = new List<DxCharts.Mychart>();
	//	dxchart.shownormalcurve = chkNormalcurve.Checked;
	//	dxchart.histMSD= chkHistMSD.Checked;
	//	int chartW = Convert.ToInt32(trackWhist.Position);
	//	int chartH = Convert.ToInt32(trackHhist.Position);

	//	dxchart.chartWhist = chartW;
	//	dxchart.chartHhist = chartH;


	//	var numcols = trkNumCols.Position;
	//	var numbins = trkNumBins.Position;
	//	List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
	//	numvars = numvars.ConvertAll(x => x.ToLower());

	//	//Just vars
	//	if (panelvar == "none" & colorsvar == "none" )
	//	{
	//		foreach (string v in numvars)
	//		{
	//			DxCharts.Histogram hist = new DxCharts.Histogram(dxchart, dpdata.dt, v, 0);
	//			charts.Add(hist);
	//		}
	//		Table t = dxchart.TableOfCharts(charts, Convert.ToInt32(trackWhist.Position), Convert.ToInt32(trackHhist.Position), 1, Convert.ToInt32(numcols));
	//		callbackCharts.Controls.Add(t);
	//	}
	//	//Just a color var
	//	else if (panelvar == "none" & (colorsvar != "none" & colorsvar != "Variable"))
	//	{
	//		DataSubsets dataSubsets1 = new DataSubsets(dpdata.dt, numvars, colorsvar);
	//		foreach (string v in numvars)
	//		{
	//			DxCharts.Histogram hist = new DxCharts.Histogram(dxchart, dataSubsets1, "", v, 0);
	//			charts.Add(hist);
	//		}
	//		Table t = dxchart.TableOfCharts(charts, Convert.ToInt32(trackWhist.Position), Convert.ToInt32(trackHhist.Position), 1, Convert.ToInt32(numcols));
	//		callbackCharts.Controls.Add(t);
	//	}
	//	//With a color and panel var
	//	if ((panelvar != "none" & panelvar != "Variable") & (colorsvar != "none" & colorsvar != "Variable"))
	//	{
	//		//Get first set of DataSubsets based on the Panels selection
	//		List<string> allvars = new List<string> { colorsvar };
	//		allvars.AddRange(numvars);
	//		DataSubsets dataSubsets1 = new DataSubsets(dpdata.dt, allvars, panelvar);


	//		//Loop through these and make another set of DataSubsets
	//		foreach (DataSubset subset1 in dataSubsets1.subsets)
	//		{
	//			string subtitle = subset1.Cols_and_Vals_ToString();
	//			List<string> grpvars = new List<string> { colorsvar };

	//			int chkN = subset1.dt.Rows.Count;

	//			////Get first set of DataSubsets based on the Panels selection 
	//			DataSubsets dataSubsets2 = new DataSubsets(subset1.dt, numvars, grpvars);

	//			foreach (string v in numvars)
	//			{
	//				DxCharts.Histogram hist = new DxCharts.Histogram(dxchart, dataSubsets2, subtitle, v, 0);
	//				charts.Add(hist);
	//			}
	//			Table t = dxchart.TableOfCharts(charts, Convert.ToInt32(trackWhist.Position), Convert.ToInt32(trackHhist.Position), 1, Convert.ToInt32(numcols));

	//			callbackCharts.Controls.Add(t);

	//		}
	//	}


	//	//addtoPDF(complink, charts);


	//}



	//protected void CreateScatterplots(string xaxisvar, string colorsvar, string panelvar)
	//{
	//	List<WebChartControl> charts = new List<WebChartControl>();


	//	var numcols = trkNumCols.Position;
	//	var numbins = trkNumBins.Position;
	//	List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
	//	numvars = numvars.ConvertAll(x => x.ToLower());
	//	numvars.Add("id"); //Add ID so that points can be identified

	//	//Just vars
	//	if (panelvar == "none" & colorsvar == "none")
	//	{
	//		int nrows = dpdata.dt.Rows.Count;
	//		Table t = dxchart.TableOfPairwiseScatterplots(dxchart, dpdata.dt, numvars, "Scatterplot", chartW, chartH, 0, colorsvar);
	//		callbackCharts.Controls.Add(t);
	//	}
	//	//Just a color var
	//	else if ( colorsvar != "none" & panelvar == "none" )
	//	{
	//		//DataSubsets dataSubsets1 = new DataSubsets(dpdata.dt, numvars, colorsvar);

	//		//for(int i=0; i < dataSubsets1.subsets.Count; i++)
	//		//{
	//		//	DataSubset subset = dataSubsets1.subsets[i];
	//		//	int nrows = subset.dt.Rows.Count;
	//		//	string title = subset.Cols_and_Vals_ToString();
	//		//	Table t = dxchart.TableOfPairwiseScatterplots(dxchart, dpdata.dt, numvars, title, chartW, chartH, i, colorsvar);
	//		//	callbackCharts.Controls.Add(t);
	//		//}

	//		Table t = dxchart.TableOfPairwiseScatterplots(dxchart, dpdata.dt, numvars, String.Format("Scatterplot: colors by {0}", colorsvar)
	//			, chartW, chartH, 0, colorsvar);
	//		callbackCharts.Controls.Add(t);
	//	}

	//	else if ( panelvar != "none")
	//	{
	//		DataSubsets dataSubsets1 = new DataSubsets(dpdata.dt, numvars, panelvar);

	//		for (int i = 0; i < dataSubsets1.subsets.Count; i++)
	//		{
	//			DataSubset subset = dataSubsets1.subsets[i];
	//			int nrows = subset.dt.Rows.Count;
	//			string title = subset.Cols_and_Vals_ToString();
	//			Table t = dxchart.TableOfPairwiseScatterplots(dxchart, subset.dt, numvars, title, chartW, chartH, i, colorsvar);
	//			callbackCharts.Controls.Add(t);
	//		}
	//		//Table t = dxchart.TableOfCharts(charts, 1, Convert.ToInt32(numcols));
	//		//callbackCharts.Controls.Add(t);
	//	}

	//}



	//protected void CreateLineplots(string xaxisvar, string colorsvar, string panelvar)
	//{
	//	List<WebChartControl> charts = new List<WebChartControl>();

	//	bool hideblanks = (chkLineHideBlank.Checked) ? true : false;
	//	bool showlegend = (chkLineShowLegend.Checked) ? true : false;
	//	string legend_h = cboLegendH_LINE.Value.ToString();
	//	string legend_v = cboLegendV_LINE.Value.ToString();

	//	int chartW = Convert.ToInt32(trackWline.Position);
	//	int chartH = Convert.ToInt32(trackHline.Position);

	//	dxchart.chartWscat = chartW;
	//	dxchart.chartHscat = chartH;


	//	var numcols = trkNumCols.Position;
	//	var numbins = trkNumBins.Position;
	//	List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
	//	numvars = numvars.ConvertAll(x => x.ToLower());
	//	//numvars.Add("id"); //Add ID so that points can be identified

	//	List<string> datevars = dataops.GetListString(gridVarsDate.GridView.GetSelectedFieldValues("varname"));
	//	List<string> agevars = dataops.GetListString(gridVarsAge.GridView.GetSelectedFieldValues("varname"));

	//	bool isdate = (datevars.Contains(xaxisvar)) ? true : false;
	//	bool isage = (agevars.Contains(xaxisvar)) ? true : false;

	//	//NOTE all line plots add series as a function of ID.
	//	List<DxCharts.Mychart> lineplots = new List<DxCharts.Mychart>();


	//	// =========== Variables within the Plots ===========
	//	if ((xaxisvar == "variable" || colorsvar == "variable") & xaxisvar != colorsvar)
	//		{
	//			//lblLineplotError.ClientVisible = false;

	//			//Need to stack the data because variable is within the plot 
	//			List<string> idvars = new List<string>() { "id", "timept", "group" };
	//			if (colorsvar != "none" & colorsvar != "variable" & !idvars.Contains(colorsvar)) idvars.Add(colorsvar);
	//			if (panelvar != "none" & panelvar != "variable" & !idvars.Contains(panelvar)) idvars.Add(panelvar);

	//			dpdata.Data_FullyStacked(idvars, numvars);


	//			//No Panels
	//			if (panelvar == "none")
	//			{

	//				//Variables on X-axis
	//				if (xaxisvar == "variable")
	//				{
	//					DxCharts.Lineplot lineplot = new DxCharts.Lineplot(dxchart, dpdata.dtstacked, "varname", "value", "id", colorsvar
	//						, String.Format("Lineplot {0}", String.Join(", ", numvars)), isdate, isage, showlegend, legend_h, legend_v);
	//					lineplots.Add(lineplot);

	//				//Table t = dxchart.TableOfCharts(lineplots, chartW, chartH, 1, Convert.ToInt32(numcols));

	//				Table t = new TableOCharts(lineplots, LayoutMode.Horizontal).table;

	//					callbackCharts.Controls.Add(t);
	//				}
	//				//Variables as Colors
	//				if (colorsvar == "variable")
	//				{
	//					DxCharts.Lineplot lineplot = new DxCharts.Lineplot(dxchart, dpdata.dtstacked, xaxisvar, "value", "id", "varname"
	//						, String.Format("Lineplot {0}", String.Join(", ", numvars)), isdate, isage, showlegend, legend_h, legend_v);
	//					lineplots.Add(lineplot);

	//					Table t = dxchart.TableOfCharts(lineplots, chartW, chartH, 1, Convert.ToInt32(numcols));
	//					callbackCharts.Controls.Add(t);
	//				}
	//			}

	//			//Yes Panels
	//			else
	//			{


	//				////Stack the data and create a new "variable" variable
	//				//List<string> idvars = new List<string>() { "id", "timept", "group" };
	//				//if (colorsvar != "none" & !idvars.Contains(colorsvar)) idvars.Add(colorsvar);

	//				//dpdata.Data_FullyStacked(idvars, numvars);


	//				//
	//				//Get first set of DataSubsets based on the Panels selection
	//				List<string> allvars = new List<string> { xaxisvar, colorsvar, panelvar, "id", "varname", "value" };
	//				allvars.Remove("variable");

	//				List<string> allvars_with_id = new List<string>();
	//				allvars_with_id.AddRange(allvars.Distinct());

	//				DataSubsets dataSubsets1 = new DataSubsets(dpdata.dtstacked, allvars_with_id, panelvar);

	//				int colorcounter = 0;
	//				//Loop through these and make a lineplot
	//				foreach (DataSubset subset1 in dataSubsets1.subsets)
	//				{

	//					//Ensure that there is data to plot
	//					int n = subset1.dt.AsEnumerable().Where(f => f.Field<double?>("value") != null).Count();

	//					if (n > 2)
	//					{
	//						string title = subset1.Cols_and_Vals_ToString();

	//					//Variables on X-axis  with Panel
	//					if (xaxisvar == "variable")
	//					{

	//						if (colorsvar == panelvar) //Manually set the color based on the current panelvar iteration
	//						{
	//							DxCharts.Lineplot lineplot = new DxCharts.Lineplot(dxchart, subset1.dt, "varname", "value", "id", colorsvar
	//								, String.Format("Lineplot: {0}{1}{2}", title, Environment.NewLine, String.Join(", ", numvars))
	//								, isdate, isage, colorcounter, showlegend, legend_h, legend_v);
	//							lineplots.Add(lineplot);

	//						}
	//						else
	//						{
	//							DxCharts.Lineplot lineplot = new DxCharts.Lineplot(dxchart, subset1.dt, "varname", "value", "id", colorsvar
	//								, String.Format("Lineplot: {0}{1}{2}", title, Environment.NewLine, String.Join(", ", numvars))
	//								, isdate, isage, showlegend, legend_h, legend_v);
	//							lineplots.Add(lineplot);

	//						}
	//					}

	//					//Variables as color  with Panel
	//					else if (colorsvar == "variable")
	//					{
	//							DxCharts.Lineplot lineplot = new DxCharts.Lineplot(dxchart, subset1.dt, xaxisvar, "value", "varname", "varname"
	//										, String.Format("Lineplot: {0}{1}{2}", title, Environment.NewLine, String.Join(", ", numvars))
	//										, isdate, isage, showlegend, legend_h, legend_v);
	//							lineplots.Add(lineplot);

	//						}

	//					}
	//				}
	//				Table t = dxchart.TableOfCharts(lineplots, chartW, chartH, 1, Convert.ToInt32(numcols));
	//				callbackCharts.Controls.Add(t);

	//			}
				
	//		}

	//	// =========== Variables not within the Plots ===========
	//	else if (xaxisvar != "variable" & colorsvar != "variable")
	//	{
		
	//		//No Panels
	//		if (xaxisvar != "variable" & (panelvar == "variable" || panelvar=="none"))
	//		{


	//			for (int i = 0; i < numvars.Count; i++)
	//			{
	//				DxCharts.Lineplot lineplot = new DxCharts.Lineplot(dxchart, dpdata.dt, xaxisvar, numvars[i], "id", colorsvar
	//					, String.Format("Lineplot {0}", numvars[i]), isdate, isage, showlegend, legend_h, legend_v);
	//				lineplots.Add(lineplot);
	//			}
	//			Table t = dxchart.TableOfCharts(lineplots, chartW, chartH, 1, Convert.ToInt32(numcols));
	//			callbackCharts.Controls.Add(t);
	//		}
	//		//Panels
	//		else if ((xaxisvar != "variable" & panelvar != "none"))
	//		{
	//			//Get first set of DataSubsets based on the Panels selection
	//			List<string> allvars = new List<string> { xaxisvar, colorsvar, panelvar, "id" };
	//			allvars.AddRange(numvars);

	//			List<string> allvars_with_id = new List<string>();
	//			allvars_with_id.AddRange(allvars.Distinct());

	//			DataSubsets dataSubsets1 = new DataSubsets(dpdata.dt, allvars_with_id, panelvar);

	//			int colorcounter = 0;
	//			//Loop through these and make a lineplot
	//			foreach (DataSubset subset1 in dataSubsets1.subsets)
	//			{

	//				for (int i = 0; i < numvars.Count; i++)
	//				{
	//					string title = subset1.Cols_and_Vals_ToString();

	//					if (colorsvar == panelvar) //Manually set the color based on the current panelvar iteration
	//					{
	//						DxCharts.Lineplot lineplot = new DxCharts.Lineplot(dxchart, subset1.dt, xaxisvar, numvars[i], "id", colorsvar,
	//								String.Format("Lineplot {0}", title), isdate, isage, colorcounter, showlegend, legend_h, legend_v);
	//						lineplots.Add(lineplot);
	//					}
	//					else
	//					{
	//						DxCharts.Lineplot lineplot = new DxCharts.Lineplot(dxchart, subset1.dt, xaxisvar, numvars[i], "id", colorsvar,
	//								String.Format("Lineplot {0}", title), isdate, isage, showlegend, legend_h, legend_v);
	//						lineplots.Add(lineplot);
	//					}
	//				}
	//				colorcounter++;
	//			}

	//			Table t = dxchart.TableOfCharts(lineplots, chartW, chartH, 1, Convert.ToInt32(numcols), hideblanks);
	//			callbackCharts.Controls.Add(t);
	//		}

	//	}

	//	bool matchaxes = (chkLineMatchYaxisRange.Checked) ? true : false;
	//	if (matchaxes)
	//	{
	//		MatchYAxes(lineplots);
	//	}
	//	//}
	
	//}



	//protected void CreateBarcharts(string xaxisvar, string colorsvar, string panelvar, DevExpress.XtraPrintingLinks.CompositeLink complink)
	//{
	//	List<string> groupingvars = new List<string>();
	//	if (colorsvar != "Variable" && colorsvar != "none" && colorsvar != null) groupingvars.Add(colorsvar);
	//	if (panelvar != "Variable" && panelvar != "none" && panelvar != null) groupingvars.Add(panelvar);

	//	List<string> numvars = dataops.GetListString(gridVarsNum.GridView.GetSelectedFieldValues("varname"));
	//	numvars = numvars.ConvertAll(x => x.ToLower());

	//	int chartW = Convert.ToInt32(trackWbar.Position);
	//	int chartH = Convert.ToInt32(trackHbar.Position);

	//	dxchart.chartWbar = chartW;
	//	dxchart.chartHbar = chartH;

	//	//Calculate the stats needed
	//	//Use the Panels variable for a set of barcharts
	//	if (panelvar != "none" && panelvar != "Variable" && panelvar != null)
	//	{
	//		List<DxCharts.Mychart> barcharts = new List<DxCharts.Mychart>();
	//		List<ASPxGridView> grids = new List<ASPxGridView>();
	//		//Get first set of DataSubsets based on the Panels selection
	//		List<string> allvars = new List<string> { colorsvar };
	//		allvars.AddRange(numvars);
	//		DataSubsets dataSubsets1 = new DataSubsets(dpdata.dt, allvars, panelvar);

	//		//Loop through these and make another set of DataSubsets
	//		foreach(DataSubset subset1 in dataSubsets1.subsets)
	//		{
	//			string subtitle = subset1.Cols_and_Vals_ToString();
	//			List<string> grpvars = new List<string> { colorsvar };
	//			//List<string> grpvars = dpdata.groupingvars;
	//			//grpvars.Remove(panelvar);
	//			////Get first set of DataSubsets based on the Panels selection 
	//			DataSubsets dataSubsets2 = new DataSubsets(subset1.dt, numvars, grpvars);
	//			StatsTable stats = new StatsTable(dataSubsets2, numvars, grpvars);

	//			//Only add the chart and stats if there are rows
	//			if (stats.dt.Rows.Count > 0)
	//			{
	//				if (chkStatsTable.Checked)
	//				{
	//					ASPxGridView statsgrid = new DevExpress.Web.ASPxGridView();
	//					statsgrid.DataSource = stats.dt;
	//					statsgrid.DataBind();
	//					statsgrid.Caption = subset1.Cols_and_Vals_ToString();
	//					grids.Add(statsgrid);
	//				}

	//				DxCharts.Barchart barchart = new DxCharts.Barchart(dxchart, stats, xaxisvar, colorsvar,  "", subtitle);


	//				barcharts.Add(barchart);

	//			}
	//		}
						
	//		callbackCharts.Controls.Add(dxchart.TableOfCharts(barcharts, chartW, chartH, 1));

	//		//addtoPDF(complink, barcharts);
	//		//addtoPDF(complink, grids);


	//		bool matchaxes = true;
	//		if (matchaxes)
	//		{
	//			MatchYAxes(barcharts);
				
	//		}
			

	//		foreach (ASPxGridView gv in grids)
	//		{
	//			callbackCharts.Controls.Add(gv);
	//		}

	//	}

	//	else 
	//	{

	//		//First get the needed DataSubsets
	//		DataSubsets dataSubsets = new DataSubsets(dpdata.dt, numvars, groupingvars);
	//		StatsTable stats = new StatsTable(dataSubsets, numvars, groupingvars);

	//		colorsvar = (colorsvar == "none") ? "Variable" : colorsvar;

	//		DxCharts.Barchart barchart = new DxCharts.Barchart(dxchart, stats, xaxisvar, colorsvar);
			
			
	//		callbackCharts.Controls.Add(barchart.chart);
	//		//addtoPDF(complink, barchart);


	//		if (chkStatsTable.Checked)
	//		{
	//			ASPxGridView statsgrid = new ASPxGridView();
	//			statsgrid.DataSource = stats.dt;
	//			statsgrid.DataBind();
	//			callbackCharts.Controls.Add(statsgrid);

				
	//			//addtoPDF(complink, statsgrid);

	//		}

	//	}


	//}


	//protected void MatchYAxes (List<DxCharts.Mychart> mycharts)
	//{

	//	double miny = 0;
	//	double maxy = 0;

	//	foreach (DxCharts.Mychart mychart in mycharts)
	//	{
	//		if (mychart.chart != null)
	//		{
	//			double tmp_miny_who = (double)((XYDiagram)mychart.chart.Diagram).AxisY.WholeRange.MinValue;
	//			double tmp_maxy_who = (double)((XYDiagram)mychart.chart.Diagram).AxisY.WholeRange.MaxValue;

	//			double tmp_miny_vis = (double)((XYDiagram)mychart.chart.Diagram).AxisY.VisualRange.MinValue;
	//			double tmp_maxy_vis = (double)((XYDiagram)mychart.chart.Diagram).AxisY.VisualRange.MaxValue;


	//			if (miny > tmp_miny_who) miny = tmp_miny_who;
	//			if (maxy < tmp_maxy_who) maxy = tmp_maxy_who;
	//		}
	//	}

	//	foreach (DxCharts.Mychart mychart in mycharts)
	//	{
	//		if (mychart.chart != null)
	//		{
	//			((XYDiagram)mychart.chart.Diagram).AxisY.WholeRange.SetMinMaxValues(miny, maxy);
	//			((XYDiagram)mychart.chart.Diagram).AxisY.VisualRange.SetMinMaxValues(miny, maxy);
	//		}
	//	}

	//}

	#endregion


	#region Create PDF 
	protected void btnPDF_OnClick(object source, EventArgs e)
	{
		string filename = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/complink2.pdf");


		//Response.Redirect(filename);
		//WebClient User = new WebClient();
		//Byte[] FileBuffer = User.DownloadData(name);
		//if (FileBuffer != null)
		//{
		//	Response.ContentType = "application/pdf";
		//	Response.AddHeader("content-length", FileBuffer.Length.ToString());
		//	Response.BinaryWrite(FileBuffer);
		//}


	}




	protected DevExpress.XtraPrintingLinks.CompositeLink initializePDF()
	{

		DevExpress.XtraPrinting.PrintingSystem ps = new DevExpress.XtraPrinting.PrintingSystem();
		
		DevExpress.XtraPrintingLinks.CompositeLink compositeLink = new DevExpress.XtraPrintingLinks.CompositeLink();
		compositeLink.PrintingSystem = ps;

		ps.ExportOptions.Pdf.ConvertImagesToJpeg = true;
		ps.ExportOptions.Pdf.ImageQuality = PdfJpegImageQuality.Highest;
		ps.PageMargins.Top = 40;
		ps.PageMargins.Bottom = 40;
		ps.PageMargins.Left = 40;
		ps.PageMargins.Right = 40;


		return compositeLink;
	}



	protected void savePDF(DevExpress.XtraPrintingLinks.CompositeLink compositeLink)
	{
		for(int i=0; i < compositeLink.Links.Count; i++)
		{
			string x = String.Format("{0} {1}", i, compositeLink.Links[i].PrintableObjectType.GetType().ToString());
			log(x);
		}



		compositeLink.CreateDocument();
		string filepath = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/");

		string filename = String.Format("{0}{1}", filepath, txtOutputFilename.Text);

		try
		{
			
			compositeLink.ExportToPdf(String.Format("{0}.pdf",filename));
			compositeLink.ExportToDocx(String.Format("{0}.docx", filename));

		}
		catch (Exception ex)
		{ }
	}

	protected void addtoPDF(DevExpress.XtraPrintingLinks.CompositeLink compositeLink, string text, bool bold)
	{
		addtoPDF(compositeLink, text, bold, 0);
	}		

	protected void addtoPDF(DevExpress.XtraPrintingLinks.CompositeLink compositeLink, string text, bool bold, int numblanklines)
	{
		string blanklines = "";
		for(int i=0; i < numblanklines; i++)
		{
			blanklines += Environment.NewLine;
		}
		text = String.Format("{0}{1}", blanklines, text);
		ASPxGridView gv = new ASPxGridView();
		gv.DataSource = new List<string>() { text };
		gv.DataBind();
		gv.Settings.ShowColumnHeaders = false;
		gv.Columns[0].ExportCellStyle.BorderColor = Color.White;
		gv.Columns[0].ExportWidth = 700;
		gv.Columns[0].ExportCellStyle.Font.Size = 12;

		if (bold)
		{
			gv.Columns[0].ExportCellStyle.Font.Bold = true;
		}

		PrintableComponentLink link = new PrintableComponentLink();
		link.Component = gv;
		compositeLink.Links.Add(link);

	}


	protected void addtoPDF(DevExpress.XtraPrintingLinks.CompositeLink compositeLink, ASPxGridView grid)
	{
		PrintableComponentLink link = new PrintableComponentLink();
		link.Component = grid;
		compositeLink.Links.Add(link);
	}
	protected void addtoPDF(DevExpress.XtraPrintingLinks.CompositeLink compositeLink, List<ASPxGridView> grids)
	{
		foreach(ASPxGridView grid in grids)
		{
			PrintableComponentLink link = new PrintableComponentLink();
			link.Component = grid;
			compositeLink.Links.Add(link);
		}

	}


	protected void addtoPDF(DevExpress.XtraPrintingLinks.CompositeLink compositeLink, DxCharts.Mychart chart)
	{
		List<DxCharts.Mychart> charts = new List<DxCharts.Mychart>();
		charts.Add(chart);
		addtoPDF(compositeLink, charts);
	}
	protected void addtoPDF(DevExpress.XtraPrintingLinks.CompositeLink compositeLink, List<DxCharts.Mychart> charts)
	{

		foreach (DxCharts.Mychart mychart in charts)
		{

			mychart.chart.RenderFormat = RenderFormat.Png;
			

			mychart.chart.Width = (int)(mychart.chart.Width.Value * 1.0f);
			mychart.chart.Height = (int)(mychart.chart.Height.Value * 1.0f);

			WebChartControl c = mychart.chart;



			PrintableComponentLink link = new PrintableComponentLink();
			//link.Component = ((IChartContainer)mychart.chart).Chart;

			

			IChartContainer cc = ((IChartContainer)mychart.chart);
			

			link.Component = cc.Chart;


			compositeLink.Links.Add(link);
		}

	}

	protected void addtoPDF(DevExpress.XtraPrintingLinks.CompositeLink compositeLink, PCA pca)
	{
		addtoPDF(compositeLink, pca.OutputMainTitle, true, 1);
		foreach (OutputGridview ogv in pca.OutputGridviews)
		{
			addtoPDF(compositeLink, ogv.Title, false);
			addtoPDF(compositeLink, ogv.Grid);
		}
	}


	protected void addtoPDF(DevExpress.XtraPrintingLinks.CompositeLink compositeLink, List<PCA> pcas)
	{
		foreach (PCA pca in pcas )
		{
			addtoPDF(compositeLink, pca);
		}

	}


	#endregion




	protected void log(string s)
	{
		if (printDebug)
		{
			Debug.Print(s);
		}
	}


}

