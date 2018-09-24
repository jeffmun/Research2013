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

namespace uwac
{
	/// <summary>
	/// Summary description for DxCharts
	/// </summary>
	public class DxCharts
	{
		public DxHistogramSettings histogramSettings;
		public DxBarchartSettings barchartSettings;
		public DxStackedBarchartSettings stackedbarchartSettings;
		public DxScatterplotSettings scatterplotSettings;
		public DxLineplotSettings lineplotSettings;

		private bool printDebug = true;

		private int _numtablecols;

		private List<MarkerKind> _markers;

		private DPData _data;

		private List<Color> _color;


		public DxCharts(DPData dpdata) {
			_numtablecols = 4;
			_data = dpdata;
			LoadMarkerKinds();
		}

		#region Accessors - Chart sizes
		//public int chartWhist
		//{
		//	get { return _chartWhist; }
		//	set { _chartWhist = value; }
		//}
		//public int chartHhist
		//{
		//	get { return _chartHhist; }
		//	set { _chartHhist = value; }
		//}
		//public int chartWscat
		//{
		//	get { return _chartWscat; }
		//	set { _chartWscat = value; }
		//}
		//public int chartHscat
		//{
		//	get { return _chartHscat; }
		//	set { _chartHscat = value; }
		//}
		//public int chartWbar
		//{
		//	get { return _chartWbar; }
		//	set { _chartWbar = value; }
		//}
		//public int chartHbar
		//{
		//	get { return _chartHbar; }
		//	set { _chartHbar = value; }
		//}
		#endregion

		#region Accessors 
		public int numtablecols
		{
			get { return _numtablecols; }
			set { _numtablecols = value; }
		}


		public DPData data
		{
			get { return _data; }
			set { _data = value; }
		}

		public List<Color> colors
		{
			get { return _color; }
		}

		public Color color (int idx)
		{
			int x = idx % _color.Count;
			return _color[x]; 
		}

		public void SetColor(Color c, int index)
		{
			if (index >= _color.Count)
			{
				_color.Add(c);
			}
			else
			{
				_color[index] = c;
			}
		}
		#endregion


		public class MyChartSettings
		{
			private MyChartType _charttype;
			private int _W = 300; //width
			private int _H = 300; //height
			private string _title;
			private string _subtitle;
			private string _xaxisvar;
			private string _colorvar;
			private string _panelvar;

			public MyChartType charttype { get { return _charttype; } set { _charttype = value; } }
			public int W { get { return _W; } set { _W = value; } }
			public int H { get { return _H; } set { _H = value; } }
			public string title { get { return _title; } set { _title = value; } }
			public string subtitle { get { return _subtitle; } set { _subtitle = value; } }
			public string xaxisvar { get { return _xaxisvar; } set { _xaxisvar = value; } }
			public string colorvar { get { return _colorvar; } set { _colorvar = value; } }
			public string panelvar { get { return _panelvar; } set { _panelvar = value; } }
		}


		public class DxBarchartSettings : MyChartSettings
		{
			public DxBarchartSettings() { }
		}
		public class DxStackedBarchartSettings : MyChartSettings
		{
			public DxStackedBarchartSettings() { }
		}

		public class DxHistogramSettings : MyChartSettings
		{
			private bool _histIsRotated = false;
			private bool _usenumbins = true;
			private int _numbins = 15;
			private bool _usepanes = false;
			private PaneLayoutDirection _paneLayoutDirection = PaneLayoutDirection.Horizontal;
			private bool _shownormalcurve = true;
			private bool _histMSD = true;

			public DxHistogramSettings() { }

			public bool usenumbins
			{
				get { return _usenumbins; }
				set { _usenumbins = value; }
			}
			public int numbins
			{
				get { return _numbins; }
				set { _numbins = value; }
			}
			public bool histIsRotated
			{
				get { return _histIsRotated; }
				set { _histIsRotated = value; }
			}
			public bool shownormalcurve
			{
				get { return _shownormalcurve; }
				set { _shownormalcurve = value; }
			}
			public bool histMSD
			{
				get { return _histMSD; }
				set { _histMSD = value; }
			}
			public bool usepanes
			{
				get { return _usepanes; }
				set { _usepanes = value; }
			}
			public PaneLayoutDirection paneLayoutDirection
			{
				get { return _paneLayoutDirection; }
				set { _paneLayoutDirection = value; }
			}

			public void SetLayoutDirection(string layoutdirection)
			{
				_paneLayoutDirection = (layoutdirection == "vertical") ? PaneLayoutDirection.Vertical : PaneLayoutDirection.Horizontal;
			}

		}


		public class DxLineplotSettings : MyChartSettings
		{

			public DxLineplotSettings() { }
		}


		public enum MyChartType : int
		{
			Histogram = 0,
			Barchart = 1,
			StackedBarchart = 2,
			Scatterplot = 3,
			Lineplot = 4,
			PCA = 5
		}


		#region Generic Chart

		public class Mychart
		{
			public DxCharts _dxcharts;
			public WebChartControl _chart;
			public string _emptymsg;

			public MyChartSettings settings;

			//public Dictionary<string, KeyValuePair<string, string>> _pointTooltips;
			//public string ChartTooltipJSONContainer;
			public ASPxCheckBox _chk;


			public WebChartControl chart
			{
				get { return _chart; }
			}
			public ASPxCheckBox chk
			{
				get { return _chk; }
			}

			public Mychart()
			{
				_chk = new ASPxCheckBox();
				settings = new MyChartSettings();
			}
		}
		#endregion


		private void LoadMarkerKinds()
		{
			_markers = new List<MarkerKind>();

			_markers.Add(MarkerKind.Circle);
			_markers.Add(MarkerKind.Square);
			_markers.Add(MarkerKind.Triangle);
			_markers.Add(MarkerKind.Cross);
			_markers.Add(MarkerKind.Diamond);
			_markers.Add(MarkerKind.Star);
			_markers.Add(MarkerKind.Pentagon);
			_markers.Add(MarkerKind.InvertedTriangle);
		}


		#region Line plot


		#endregion



		#region Panes
		//List defined by default subsets, Same var, not in panes
		public void AddPanes(XYDiagram diagram, int numpanes, PaneLayoutDirection layoutdirection)
		{
			//Panes
			for (int i = 0; i < numpanes; i++)
			{
				diagram.Panes.Add(new XYDiagramPane(String.Format("pane{0}", i)));
			}
			diagram.PaneLayoutDirection = layoutdirection;
		}

		#endregion


		#region Titles
		public void AddTitles(WebChartControl chart, string main, string sub, string x, string y)
		{
			AddTitles(chart, main, new List<string>() { sub }, x, y, 10f);
		}
		public void AddTitles(WebChartControl chart, string main, string sub, string x, string y, float fontsize)
		{
			AddTitles(chart, main, new List<string>() { sub }, x, y, fontsize);
		}
		public void AddTitles(WebChartControl chart, string main, List<string> sub, string x, string y, float fontsize)
		{
			string mainTitle_subtitles = String.Join("; ", sub);

			Font fnt_main = new Font("Arial", fontsize);
			Font fnt_x = new Font("Arial", fontsize);
			Font fnt_y = new Font("Arial", fontsize);

			ChartTitle mainTitle = new ChartTitle()
			{
				Text = String.Format("{0} {1} {2}", main, Environment.NewLine, mainTitle_subtitles),
				Dock = ChartTitleDockStyle.Top,
				Indent = 20
			};

			ChartTitle xTitle = new ChartTitle() { Text = x, Dock = ChartTitleDockStyle.Bottom };
			ChartTitle yTitle = new ChartTitle() { Text = y, Dock = ChartTitleDockStyle.Left };

			mainTitle.Font = fnt_main;
			xTitle.Font = fnt_x;
			yTitle.Font = fnt_y;

			mainTitle.Alignment = StringAlignment.Near;

			chart.Titles.Add(mainTitle);
			chart.Titles.Add(xTitle);
			chart.Titles.Add(yTitle);

		}
		#endregion



		#region Tables of Charts



		public Table TableOfCharts(List<Mychart> charts)
		{
			return TableOfCharts(charts, 300, 300, 1.0);
		}
		public Table TableOfCharts(List<Mychart> charts, int W, int H, double pct)
		{
			return TableOfCharts(charts, W, H, pct, pct, _numtablecols);
		}
		public Table TableOfCharts(List<Mychart> charts, int W, int H, double pct, bool hideEmptyCharts)
		{
			return TableOfCharts(charts, W, H, pct, pct, _numtablecols, hideEmptyCharts);
		}
		public Table TableOfCharts(List<Mychart> charts, int W, int H, double pct, int maxCol)
		{
			return TableOfCharts(charts, W, H, pct, pct, maxCol);
		}
		public Table TableOfCharts(List<Mychart> charts, int W, int H, double pct, int maxCol, bool hideEmptyCharts)
		{
			return TableOfCharts(charts, W, H, pct, pct, maxCol, hideEmptyCharts);
		}

		public Table TableOfCharts(List<Mychart> charts, int W, int H, double pctW, double pctH, int maxCol)
		{
			return TableOfCharts(charts, W, H, pctW, pctH, maxCol, false);
		}
		
		public Table TableOfCharts(List<Mychart> charts, int W, int H, double pctW, double pctH, int maxCol, bool hideEmptyCharts)
		{
			int newW = Convert.ToInt32(W * pctW);
			int newH = Convert.ToInt32(H * pctH);

			Table t = TableHelper.HorizontalTable(charts, newW, newH, 1, 1, maxCol, hideEmptyCharts);
			return t;
		}



		#endregion





		#region Custom paint when charts are rendered


		protected void Mychart_TransparentLine(object sender, CustomDrawSeriesEventArgs e)
		{

			(e.SeriesDrawOptions as LineDrawOptions).Color =
				e.SeriesDrawOptions.Color = Color.FromArgb(80, e.SeriesDrawOptions.Color);

		}


		protected void Mychart_TransparentPoint(object sender,CustomDrawSeriesPointEventArgs e)
		{
			//Color c = (e.SeriesPoint.Values[0] > 10) ? _color2 : _color1;
			//Color c = _color[0];

			(e.SeriesDrawOptions as PointDrawOptions).Color =
				e.SeriesDrawOptions.Color = Color.FromArgb(80, e.SeriesDrawOptions.Color);
			(e.SeriesDrawOptions as PointDrawOptions).Marker.FillStyle.FillMode = FillMode.Solid;

			(e.SeriesDrawOptions as PointDrawOptions).Marker.BorderVisible = false;

			//e.SeriesDrawOptions.Color = Color.FromArgb(50, Color.Yellow);


			//(e.SeriesDrawOptions as PointDrawOptions).Color =
			//	e.SeriesDrawOptions.Color = Color.FromArgb(50, e.SeriesDrawOptions.Color);

			//(e.SeriesDrawOptions as BarDrawOptions).FillStyle.FillMode = FillMode.Solid;
			//e.SeriesDrawOptions.Color = Color.FromArgb(50, e.SeriesDrawOptions.Color);



			//from https://www.devexpress.com/Support/Center/Question/Details/Q102193/how-to-show-custom-data-in-the-chart-tooltip
			//var dataPoint = (e.SeriesPoint.Tag);
			////The trick is to hide adittional info by html tags
			////e.SeriesPoint.ToolTipHint = e.SeriesPoint.ToolTipHint + "<FONT SIZE=\"1\" COLOR=\"#FFFFFF\">~" + dataPoint + "~</FONT>";
			////e.SeriesPoint.ToolTipHint = e.SeriesPoint.ToolTipHint + " BONUS ID: " + dataPoint + "";
			//e.LabelText = dataPoint.ToString();

		}


		protected void Mychart_CustomCallback(object sender, CustomCallbackEventArgs e)
		{
			WebChartControl chart = sender as WebChartControl;
			if (chart != null)
			{
				//chart.ToolTipController.OpenMode = GetToolTipOpenMode(toolTipOpenModes[cbOpenMode.SelectedIndex]);
				//chart.ToolTipOptions.ToolTipPosition = GetToolTipPosition(toolTipPositions[cbPosition.SelectedIndex]);
				chart.ToolTipOptions.ToolTipPosition = new ToolTipMousePosition();

			}
		}


		protected void Mychart_CustomCrosshairsPoint(object sender, CustomDrawCrosshairEventArgs  e)
		{
			e.CrosshairLineElement.Color = Color.Green;
			e.CrosshairLineElement.LineStyle.DashStyle = DashStyle.DashDot;
			e.CrosshairLineElement.LineStyle.Thickness = 3;

			// Specify  the back color for crosshair argument label. 
			foreach (CrosshairAxisLabelElement axisLabelElement in e.CrosshairAxisLabelElements)
				axisLabelElement.BackColor = Color.Blue;

			foreach (CrosshairElementGroup group in e.CrosshairElementGroups)
			{
				CrosshairElement element = group.CrosshairElements[0];

				// Specify the color, dash style and thickness for the crosshair value lines. 
				element.LineElement.Color = Color.DarkViolet;
				element.LineElement.LineStyle.DashStyle = DashStyle.Dash;
				element.LineElement.LineStyle.Thickness = 2;

				// Specify the  text color and back color for the crosshair value labels.
				element.AxisLabelElement.TextColor = Color.Red;
				element.AxisLabelElement.BackColor = Color.Yellow;

				// Specify the text color and marker size for the crosshair  cursor label that shows series. 
				element.LabelElement.TextColor = Color.Red;
				element.LabelElement.MarkerSize = new Size(15, 15);
			}

			foreach (CrosshairElementGroup group in e.CrosshairElementGroups)
			{
				CrosshairGroupHeaderElement groupHeaderElement = group.HeaderElement;

				// Specify the text, text color and font for the crosshair group header element. 
				groupHeaderElement.Text = "Custom draw";
				groupHeaderElement.TextColor = Color.Green;
				//groupHeaderElement.Font = new Font(this.Font, FontStyle.Bold);
			}

		}



		protected void ColorSeries(object sender, EventArgs e)
		{
			var chart = (WebChartControl)sender;


			for (int i = 0; i < chart.Series.Count(); i++)
			{
				var x = chart.Series[i];

				Color mycolor = _color[i % _color.Count];

				((SideBySideBarSeriesView)chart.Series[i].View).Color = mycolor;
				((SideBySideBarSeriesView)chart.Series[i].View).FillStyle.FillMode = FillMode.Solid;
			}

			//https://documentation.devexpress.com/WindowsForms/4942/Controls-and-Libraries/Chart-Control/Examples/Chart-Elements/How-to-Display-Automatically-Created-Series-in-Separate-Panes 

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







}