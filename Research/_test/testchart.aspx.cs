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

	

		AnovaTest();

		BarTest();
	}


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
		PlaceAnovaTable(anova4, "petalwidth", "species",4);


			   
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
		gv.SettingsText.Title = String.Format("One-way ANOVA: <b>{0}</b> by {1}",dv, iv);
		gv.Settings.ShowTitlePanel = true;

		gv.DataSource = anova.Table;
		gv.DataBind();
		

		List<string> keepAsInt = new List<string> { "DegreesOfFreedom" };
		foreach(GridViewDataColumn col in gv.Columns)
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


	protected void BarTest()
	{
		DataTable dt = AccordUtils.Iris();
		List<DxChartOrder> orders = new List<DxChartOrder>();

		DxBarchartSettings b1 = test_bar("species", "variable");
		DxBarchartSettings b2 = test_bar("variable", "species");
		DxBarchartSettings b3 = test_bar("group", "variable");
		DxBarchartSettings b4 = test_bar("variable", "group");
		DxBarchartSettings b5 = test_bar("variable", "group");

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

	protected void MakeCharts(DataTable dt, DxChartOrder order)
	{
		DxChartFactory factory = new DxChartFactory(dt, order);

		foreach (DxChartOrder myorder in factory.orders)
		{
			foreach (DxChartBatch batch in myorder.batches)
			{
				System.Web.UI.WebControls.Table t = ChartOutput.LayoutBatch(batch);
				panel.Controls.Add(t);
			}
		}

	}




	public DxBarchartSettings test_bar(string xaxis, string colorvar, string value)
	{
		return test_bar(xaxis, colorvar, new List<string> { value } );
	}

	public DxBarchartSettings test_bar(string xaxis, string colorvar)
	{
		List<string> vars = new List<string> { "sepallength", "sepalwidth", "petallength", "petalwidth" };
		return test_bar( xaxis, colorvar, vars);
	}

	public DxBarchartSettings test_bar(string xaxis, string colorvar, List<string> vars)
	{

	DxBarchartSettings s = new DxBarchartSettings();
		s.colors = Actigraph.colors;
		s.numvars = vars;
		s.xaxisvar = xaxis;
		s.colorvar = colorvar;
		s.hideEmptyCharts = false;
		return s;
	}




}
