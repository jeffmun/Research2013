using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Linq;
using System.Diagnostics;
using System.Linq;
using System.Linq.Dynamic;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using DevExpress.Web;
using DevExpress.Utils;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using LinqStatistics;
using MathNet.Numerics.Statistics;
using uwac;
using uwac.trk;
using System.Text;

/// <summary>
/// Summary description for DxBarchart
/// </summary>


#region Barchart

public class DxBarchart : DxChart
{
	StatsTable _statstable;
	AxesRange _axesrange;
	private DxChartSettings _settings;


	public AxesRange axesrange
	{
		get { return _axesrange; }
		set { _axesrange = value; }
	}
	public StatsTable statstable
	{
		get { return _statstable; }
		set { _statstable = value; }
	}

	//public DxBarchart(DxCharts dxcharts, StatsTable statstable_input, string xaxisvar, string colorsvar, string maintitle = "", string subtitle = "")
	//{
	//	_dxcharts = dxcharts;
	//	_statstable = statstable_input;
	//	_chart = CreateBarchart(_statstable, -999, -999, xaxisvar, colorsvar, maintitle, subtitle);
	//	//if (_axesrange == null) ExtractAxesRange(_chart);
	//}

	//public DxBarchart(DxCharts dxcharts, StatsTable statstable_input, double miny, double maxy, string xaxisvar, string colorsvar, string maintitle = "", string subtitle = "")
	//{
	//	_dxcharts = dxcharts;
	//	_statstable = statstable_input;
	//	_chart = CreateBarchart(_statstable, miny, maxy, xaxisvar, colorsvar, maintitle, subtitle);
	//}

	public DxBarchart(DxChartSettings settings, DataTable mydt) //, string xvar, string yvar, string titleinput, string colorsby)
	{
		_settings = settings;
		Color col = _settings.color(0);

		CreateBarchart(mydt);
	}
	public DxBarchart(DataTable mydt, string xvar, string yvar, string titleinput, Color mycolor, string colorsby)
	{
		_settings.xaxisvar = xvar;
		_settings.yaxisvar = yvar;
		_settings.title = titleinput;
		_settings.colorvar = colorsby;
		Color col = _settings.color(0);

	}

	

	public void CreateBarchart(DataTable mydt) //, string xvar, string yvar, string mytitle, Color mycolor, string colorsby)
	{

	}

	public void CreateBarchart(StatsTable statstable, double miny, double maxy, string xaxisvar, string colorsvar, string maintitle, string subtitle)
	{
		//DevExpress.XtraCharts.Web.WebChartControl chart = new DevExpress.XtraCharts.Web.WebChartControl();


		//XYDiagram diag = new XYDiagram();

		//diag.AxisX.GridLines.Visible = true;
		//diag.AxisY.GridLines.Visible = true;
		//diag.AxisX.GridLines.MinorVisible = true;
		//diag.AxisY.GridLines.MinorVisible = true;
		////diag.Rotated = _dxcharts.histIsRotated;
		//chart.Diagram = diag;

		//chart.BoundDataChanged += _dxcharts.ColorSeries;
		//chart.BoundDataChanged += GetAxesRange;
		chart.AxisWholeRangeChanged += LogAxesRangeWhole;
		//chart.AxisVisualRangeChanged += LogAxesRangeVisual;


		chart.DataSource = statstable.dt;
		chart.SeriesDataMember = colorsvar; //Colors - dimension in the Legend
		chart.SeriesTemplate.ArgumentDataMember = xaxisvar; //X axis dimention
		chart.SeriesTemplate.ValueDataMembers.AddRange("M"); // _numvars.ToArray());


		SideBySideBarSeriesView vw = new SideBySideBarSeriesView();
		//PointSeriesView barview = new PointSeriesView();

		vw.Indicators.Add(new DataSourceBasedErrorBars
		{
			Direction = ErrorBarDirection.Both,
			Name = "SD",
			Color = Color.Black,
			PositiveErrorDataMember = "SD",
			NegativeErrorDataMember = "SD"
		});

		chart.SeriesTemplate.View = vw;

		//AddPanes(diag, 1);
		//vw.Pane = diag.Panes[0];
		//if (i >= 1) vw.Pane = diag.Panes[(i - 1)];  //Panes collection starts at index 0, but first series goes into default pane

		//var miny1 = diag.AxisY.WholeRange.MinValue.ToString() ?? "";

		chart.DataBind();


		if (miny != -999 && maxy != -999)
		{
			double y1 = miny;
			double y2 = maxy;
			//diag.AxisY.VisualRange.SetMinMaxValues(y1, y2);
			xydiagram.AxisY.WholeRange.SetMinMaxValues(y1, y2);
			xydiagram.AxisY.VisualRange.SetMinMaxValues(y1, y2);
		}


		chart.Width = _settings.W;
		chart.Height = _settings.H;

		AddTitles(maintitle, subtitle, "", "Mean (SD)");



		////Create panes
		//if (_usepanes)
		//{
		//	for (int i = 0; i < (list_o_data.Count - 1); i++)
		//	{

		//		diag.Panes.Add(new XYDiagramPane(String.Format("pane{0}", i)));
		//	}
		//	diag.PaneLayoutDirection = _panesLayoutDirection;
		//}



		chart.BorderOptions.Color = Color.White;
		chart.Legend.Visibility = DevExpress.Utils.DefaultBoolean.True;

	}


	private void LogAxesRangeWhole(object sender, DevExpress.XtraCharts.AxisRangeChangedEventArgs e)  //EventArgs e)
	{
		this.axesrange = new AxesRange();

		#region X axis
		//double dminx; double dmaxx;
		//var minx = xydiagram.AxisX.VisualRange.MinValue.ToString();
		//var maxx = xydiagram.AxisX.VisualRange.MaxValue.ToString();
		//bool bminx = Double.TryParse(minx, out dminx);
		//bool bmaxx = Double.TryParse(maxx, out dmaxx);
		//if (bminx || bmaxx)
		//{
		//	if (bminx) axes.minx = dminx;
		//	if (bmaxx) axes.maxx = dmaxx;
		//}
		#endregion

		if (e.Axis.Name == "Primary AxisY")
		{
			double dminy; double dmaxy;

			var miny = xydiagram.AxisY.WholeRange.MinValue.ToString();
			var maxy = xydiagram.AxisY.WholeRange.MaxValue.ToString();

			bool bminy = Double.TryParse(miny, out dminy);
			bool bmaxy = Double.TryParse(maxy, out dmaxy);

			if (bminy || bmaxy)
			{
				if (bminy) this.axesrange.miny = dminy;
				if (bmaxy) this.axesrange.maxy = dmaxy;
			}

		}
	}


}

public class AxesRange
{
	private double _minx;
	private double _maxx;
	private double _miny;
	private double _maxy;

	public AxesRange() { }

	public double minx { get { return _minx; } set { _minx = value; } }
	public double maxx { get { return _maxx; } set { _maxx = value; } }
	public double miny { get { return _miny; } set { _miny = value; } }
	public double maxy { get { return _maxy; } set { _maxy = value; } }
}



#endregion





