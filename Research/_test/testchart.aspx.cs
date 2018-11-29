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
using uwac;
using Accord;
using Accord.Compat;
using Accord.DataSets;
using Accord.Extensions;
using Accord.Math;
using Accord.Statistics.Analysis;
using Accord.Statistics.Filters;
using Accord.Statistics.Kernels;
using Accord.Statistics.Testing;


//public partial class PointSeries : ChartBasePage{
public partial class _test_testchart : BasePage
{

	protected void Page_Load(object sender, EventArgs e)
	{
		panel.Controls.Clear();

		DataTable dt = AccordUtils.Iris();


		//HistTest();
		//AnovaTest();


		//BarTest2(dt, "species", "variable", "group");
		//TestDescStats(dt);

		widen();

		//	BarTest2("group", "variable", "species");
		//BarTest2("variable", "group"  , "species");
		//BarTest2("variable", "species", "group");

	}


	#region DESC STATS
	protected void TestDescStats(DataTable dt)
	{

		//Get_DescStats(dt, new List<string> { "sepalwidth" }, new List<string> { "species" });
		//Get_DescStats(dt, new List<string> { "sepalwidth" }, new List<string> { "species", "group" });
		Get_DescStats(dt, new List<string> { "sepalwidth", "sepallength", "petallength" }, new List<string> { "species", "group" });
		//Get_DescStats(dt, new List<string> { "sepalwidth" }, new List<string> { "species", "group", "category" });

	}


	protected void Get_DescStats(DataTable dt, List<string> numericvars, List<string> groupingvars)
	{
		DescStats stats = new DescStats(dt, numericvars, groupingvars);



		ASPxGridView gv = new ASPxGridView();
		gv.SettingsText.Title = String.Format("Desc Stats: <b>{0}</b> by {1}", String.Join(",", numericvars), String.Join(",", groupingvars));
		gv.Settings.ShowTitlePanel = true;

		gv.SettingsPager.PageSize = 500;
		gv.DataSource = stats.dt;
		gv.DataBind();

		panel.Controls.Add(gv);

	}
	#endregion


	#region HIST
	protected void HistTest()
	{
		DataTable dt = AccordUtils.Iris();
		List<DxChartOrder> orders = new List<DxChartOrder>();


		List<string> vars = new List<string> { "sepallength", "sepalwidth" }; //, "petallength", "petalwidth" };

		DxHistogramSettings b1 = test_hist_settings("group", vars);

		orders.Add(new DxChartOrder(b1, b1.numvars));

		foreach (DxChartOrder order in orders)
		{
			MakeCharts(dt, order);
		}

	}

	public DxHistogramSettings test_hist_settings(string colorvar, List<string> vars)
	{

		DxHistogramSettings s = new DxHistogramSettings();
		s.colors = new List<Color> { Color.Purple, Color.MediumPurple, Color.Gray, Color.DarkGoldenrod, Color.Gold };
		s.numvars = vars;
		s.panesLayoutDirection = PaneLayoutDirection.Vertical;
		s.H = 800;
		//s.xaxisvar = xaxis;
		s.colorvar = colorvar;
		s.hideEmptyCharts = false;
		return s;
	}



	#endregion


	#region  BAR
	protected void BarTest2(DataTable dt, string s1, string s2, string s3)
	{
		List<DxChartOrder> orders = new List<DxChartOrder>();

		DxBarchartSettings b1 = test_bar_settings(s1, s2, s3);
		b1.W = 1000;
		b1.H = 200;
		b1.numvars = new List<string> { "sepalwidth", "sepallength", "petallength" };

		orders.Add(new DxChartOrder(b1, b1.numvars));
		foreach (DxChartOrder order in orders)
		{
			MakeCharts(dt, order);
		}
	}


	protected void BarTest()
	{
		DataTable dt = AccordUtils.Iris();
		List<DxChartOrder> orders = new List<DxChartOrder>();

		DxBarchartSettings b1 = test_bar_settings("species", "variable", "group");
		DxBarchartSettings b2 = test_bar_settings("variable", "species");
		DxBarchartSettings b3 = test_bar_settings("group", "variable");
		DxBarchartSettings b4 = test_bar_settings("variable", "group");
		DxBarchartSettings b5 = test_bar_settings("variable", "group");

		orders.Add(new DxChartOrder(b1, b1.numvars));
		orders.Add(new DxChartOrder(b2, b2.numvars));
		orders.Add(new DxChartOrder(b3, b3.numvars));
		orders.Add(new DxChartOrder(b4, b4.numvars));

		orders.Add(new DxChartOrder(b5, b5.numvars));


		orders[3].list_settings[0].H = 200;
		orders[3].list_settings[0].W = 600;
		orders[4].list_settings[0].H = 200;
		orders[4].list_settings[0].W = 600;


		foreach (DxChartOrder order in orders)
		{
			MakeCharts(dt, order);
		}

	}


	public DxBarchartSettings test_bar_settings(string xaxis, string colorvar, string panelvar)
	{
		List<string> vars = new List<string> { "sepallength", "sepalwidth", "petallength", "petalwidth" };
		return test_bar_settings(xaxis, colorvar, panelvar, vars);
	}

	public DxBarchartSettings test_bar_settings(string xaxis, string colorvar)
	{
		List<string> vars = new List<string> { "sepallength", "sepalwidth", "petallength", "petalwidth" };
		return test_bar_settings(xaxis, colorvar, vars);
	}

	public DxBarchartSettings test_bar_settings(string xaxis, string colorvar, List<string> vars)
	{

		DxBarchartSettings s = new DxBarchartSettings();
		s.colors = Actigraph.colors;
		s.numvars = vars;
		s.xaxisvar = xaxis;
		s.colorvar = colorvar;
		s.hideEmptyCharts = false;
		return s;
	}

	public DxBarchartSettings test_bar_settings(string xaxis, string colorvar, string panelvar, List<string> vars)
	{

		DxBarchartSettings s = new DxBarchartSettings();
		s.colors = Actigraph.colors;
		s.numvars = vars;
		s.xaxisvar = xaxis;
		s.colorvar = colorvar;
		s.panelvar = panelvar;
		s.hideEmptyCharts = false;
		return s;
	}

	#endregion



	#region Oneway ANOVA
	protected void AnovaTest()
	{
		string[] vars = new string[] { "species", "petalwidth" };

		DataTable dt = AccordUtils.Iris();

		double[] x = dt.AsEnumerable().Select(f => f.Field<double>("petalwidth")).ToArray();



		OneWayAnova anova1 = new OneWayAnova(getjag(dt, "species", "sepallength"));
		PlaceAnovaTable(anova1, "sepallength", "species", 4);

		OneWayAnova anova2 = new OneWayAnova(getjag(dt, "species", "sepalwidth"));
		PlaceAnovaTable(anova2, "sepalwidth", "species", 4);


		OneWayAnova anova3 = new OneWayAnova(getjag(dt, "species", "petallength"));
		PlaceAnovaTable(anova3, "petallength", "species", 4);


		OneWayAnova anova4 = new OneWayAnova(getjag(dt, "species", "petalwidth"));
		PlaceAnovaTable(anova4, "petalwidth", "species", 4);



	}

	public double[][] getjag(DataTable dt, string ivname, string dvname)
	{
		// Create a new data projection (column) filter
		var filter = new Codification(dt, new string[] { ivname });
		// Apply the filter and get the result
		DataTable result = filter.Apply(dt, new string[] { ivname, dvname });

		var iv = filter.Columns[ivname];

		//int ivlevels = iv.Mapping.Values.Count;

		int rowCount = result.Rows.Count;

		double[][] data = new double[iv.Mapping.Values.Count][];

		for (int current_ivlevel = 0; current_ivlevel < iv.Mapping.Values.Count; current_ivlevel++)
		{

			data[current_ivlevel] = result.AsEnumerable()
				.Where(f => f.Field<int>(ivname) == current_ivlevel)
				.Select(f => f.Field<double>(dvname)).ToArray();

		}

		return data;

	}


	protected void PlaceAnovaTable(OneWayAnova anova, string dv, string iv)
	{
		PlaceAnovaTable(anova, dv, iv, 4);
	}


	protected void PlaceAnovaTable(OneWayAnova anova, string dv, string iv, int numdigits)
	{
		var t = anova.Table;

		ASPxGridView gv = new ASPxGridView();
		gv.SettingsText.Title = String.Format("One-way ANOVA: <b>{0}</b> by {1}", dv, iv);
		gv.Settings.ShowTitlePanel = true;

		gv.DataSource = anova.Table;
		gv.DataBind();


		List<string> keepAsInt = new List<string> { "DegreesOfFreedom" };
		foreach (GridViewDataColumn col in gv.Columns)
		{
			string name = col.FieldName;


			if (keepAsInt.Contains(name))
			{
				col.PropertiesEdit.DisplayFormatString = String.Format("F0");
			}
			else
			{
				col.PropertiesEdit.DisplayFormatString = String.Format("F{0}", numdigits);
			}

			string caption = name;
			if (name == "DegreesOfFreedom") caption = "DF";
			else if (name == "SumOfSquares") caption = "SS";
			else if (name == "MeanSquares") caption = "MS";
			else if (name == "Significance") caption = "p-value";
			else if (name == "Statistic") caption = "F";

			col.Caption = caption;
		}

		panel.Controls.Add(gv);
	}

	#endregion


	#region WIDEN data

	protected void widen()
	{
		SQL_utils sql = new SQL_utils("data");

		DataTable dt = sql.DataTable_from_SQLstring("select timepoint_text as timept, sex, groupname, c.timepoint, b.timepointID, a.studymeasID, a.id, muagem, mucoiq, mucss, muvragee, mufmagee, murlagee, muelagee " +
			", muelagee * muelagee muelagee2, mullen_pk " + 
			", (case when muagem > 30 then 'GT30' else 'LT30' end) as gtlt30 " +
			", (case when muagem > 35 then 'GT35' when muagem > 25 then 'GT25' else ' LT25' end) as cat3 " +
			" from all_mullen_items a " +
			" join  (select * from uwautism_research_backend.trk.vwMasterStatus_S where studyID=1076) s ON a.ID = s.ID " +
			" join  uwautism_research_backend..tblstudymeas b ON a.studymeasID = b.studymeasID " +
			" join  uwautism_research_backend..tbltimepoint c ON b.timepointID = c.timepointID " +
			" where mucss > 0 and a.studymeasID in (select studymeasID from uwautism_research_backend..tblstudymeas where studyID=1076)");

		List<string> vars = new List<string> { "id", "mullen_pk", "muagem", "mucoiq", "mucss", "muvragee", "mufmagee", "murlagee", "muelagee", "muelagee2" };

		DataSubsets subsets = new DataSubsets(dt, vars, new List<string> { "timept" });


		//DataTable dtwide = subsets.FullOuterJoinDataTables();
		//ASPxGridView gv = new ASPxGridView();
		//gv.DataSource = dtwide;
		//gv.DataBind();
		//gv.SettingsPager.PageSize = 200;
		//panel.Controls.Add(gv);


		DxScatterplotSettings settings = new DxScatterplotSettings();
		settings.colors = new List<Color> { Color.Navy, Color.Magenta, Color.Lime, Color.Orange };
		settings.chartlayout = DxChartLayout.Horizontal;
		settings.showregline = true;
		settings.maxCol = 4;
		settings.W = 300;
		settings.H = 300;
		settings.panesLayoutDirection = PaneLayoutDirection.Vertical;
		settings.colorvar = "none";
		settings.panevar = "none";
		settings.panelvar = "none";
		settings.repeatedmeasVarname = "timept";
		settings.numvars = new List<string> { "muvragee", "murlagee", "muelagee" };
		settings.manualXandYvars = false;
		//settings.yvars = new List<string> {  "muvragee" };
		//settings.xvars = new List<string> { "muelagee",  "murlagee"  };


		DxChartOrder order = new DxChartOrder();
		order.list_settings.Add(settings);

		//DxScatterplotSettings settings2 = (DxScatterplotSettings)settings.Clone();
		//settings2.colorvar = "groupname";
		//settings2.panevar = "timept";
		//settings2.W = 600;
		//settings2.H = 250;
		//settings2.reglineAlpha = 0.15;
		//settings2.panesLayoutDirection = PaneLayoutDirection.Horizontal;
		//order.list_settings.Add(settings2);


		//DxScatterplotSettings settings3 = (DxScatterplotSettings)settings.Clone();
		//settings3.W = 300;
		//settings3.H = 600;
		//settings3.colorsByPane = true;
		//settings3.panesLayoutDirection = PaneLayoutDirection.Vertical;
		//order.list_settings.Add(settings3);


		MakeCharts(dt, order);

		

	}



	protected void MakeCharts(DataTable dt, DxChartOrder order)
	{
		DxChartFactory factory = new DxChartFactory(dt, order);

		foreach (DxChartOrder myorder in factory.orders)
		{
			foreach (DxChartBatch batch in myorder.batches)
			{

				System.Web.UI.WebControls.Table t = ChartOutput.LayoutBatch(batch);
				if (t != null)
				{
					Debug.WriteLine(String.Format("{0} {1}", batch.batchtitle, batch.charts.Count));
					Label batchlabel = new Label();
					batchlabel.Text = batch.batchtitle;
					batchlabel.Font.Bold = true;
					batchlabel.Font.Size = 12;

					panel.Controls.Add(batchlabel);
					panel.Controls.Add(t);
					panel.Controls.Add(new Literal() { Text = "<br/>" });
				}
			}
		}

	}


	#endregion



}
