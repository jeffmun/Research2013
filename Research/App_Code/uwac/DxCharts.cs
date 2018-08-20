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
		private bool printDebug = true;
		private int _chartWhist;
		private int _chartHhist;
		private int _chartWscat;
		private int _chartHscat;
		private int _chartWbar;
		private int _chartHbar;
		private int _numtablecols;
		private bool _useMovAvg;
		private int _movavgNumPts;
		private bool _usenumbins;
		private int _numbins;
		private bool _usepanes;
		private bool _shownormalcurve;
		private bool _histMSD;
		private List<MarkerKind> _markers;

		private PaneLayoutDirection _panesLayoutDirection;

		private DPData _data;

		private List<Color> _color;
		private bool _histIsRotated;
		private string _xaxisvar;
		private string _colorsvar;
		private string _panelvar;


		public DxCharts(DPData dpdata) {
			_numtablecols = 4;
			_useMovAvg = false;
			_usenumbins = true;
			_numbins = 15;
			_movavgNumPts = 0;
			_color = new List<Color>();
			_usepanes = false;
			_panesLayoutDirection = PaneLayoutDirection.Horizontal;
			_data = dpdata;
			LoadMarkerKinds();
		}

		#region Accessors - Chart sizes
		public int chartWhist
		{
			get { return _chartWhist; }
			set { _chartWhist = value; }
		}
		public int chartHhist
		{
			get { return _chartHhist; }
			set { _chartHhist = value; }
		}
		public int chartWscat
		{
			get { return _chartWscat; }
			set { _chartWscat = value; }
		}
		public int chartHscat
		{
			get { return _chartHscat; }
			set { _chartHscat = value; }
		}
		public int chartWbar
		{
			get { return _chartWbar; }
			set { _chartWbar = value; }
		}
		public int chartHbar
		{
			get { return _chartHbar; }
			set { _chartHbar = value; }
		}
		#endregion

		#region Accessors 
		public int numtablecols
		{
			get { return _numtablecols; }
			set { _numtablecols = value; }
		}
		public bool useMovAvg
		{
			get { return _useMovAvg; }
			set { _useMovAvg = value; }
		}
		public int movavgNumPts
		{
			get { return _movavgNumPts; }
			set { _movavgNumPts = value; }
		}
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
		public void SetLayoutDirection(string layoutdirection)
		{
			_panesLayoutDirection = (layoutdirection == "vertical") ? PaneLayoutDirection.Vertical : PaneLayoutDirection.Horizontal;
		}


		public string xaxisvar
		{
			get { return _xaxisvar; }
			set { _xaxisvar = value; }
		}
		public string colorsvar
		{
			get { return _colorsvar; }
			set { _colorsvar = value; }
		}
		public string panelvar
		{
			get { return _panelvar; }
			set { _panelvar = value; }
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


		#region Generic Chart

		public class Mychart
		{
			public DxCharts _dxcharts;
			public WebChartControl _chart;
			public string _emptymsg;
			//public Dictionary<string, KeyValuePair<string, string>> _pointTooltips;
			//public string ChartTooltipJSONContainer;

			public WebChartControl chart
			{
				get { return _chart; }
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


		#region Scatterplot

		//public Table CreateScatterplots()
		//{
		//	if(data.groupingvars.Count == 1)
		//	{	
		//	}
		//}


		//public Table TableOfPairwiseScatterplots()
		//{
		//	List<WebChartControl> scats = PairwiseScatterplots();
		//	Table t = UpperDiagTable(scats, 1);
		//	return t;
		//}

		//public List<WebChartControl> PairwiseScatterplots()
		//{
		//	return PairwiseScatterplots(data.dt);
		//}


		//public List<WebChartControl> PairwiseScatterplots(List<DataSubset> subsets)
		//{
		//	List<WebChartControl> charts = new List<WebChartControl>();

		//	foreach (DataSubset subset in subsets)
		//	{
		//		int counter = 0;
		//		foreach (string v in data.numericvars)
		//		{
		//			counter++;
		//			for (int i = counter; i < data.numericvars.Count; i++)
		//			{
		//				charts.Add(new Scatterplot(data.numericvars[i], v)); //Swap the x,y order so it shows up right in the table
		//			}
		//		}
		//	}
		//	return charts;
		//}



		//public DevExpress.XtraCharts.Web.WebChartControl Scatterplot(string xvar, string yvar)
		//{
		//	DevExpress.XtraCharts.Web.WebChartControl chart = Scatterplot(data.dt, xvar, yvar, 0, 0);
		//	return chart;
		//}

		public class Scatterplot : Mychart
		{
			private double _pearson;
			private double _spearman;
			private int _n;

			public double pearson
			{
				get { return _pearson; }
				set { _pearson = value; }
			}
			public double spearman
			{
				get { return _spearman; }
				set { _spearman = value; }
			}
			public int n
			{
				get { return _n; }
				set { _n = value; }
			}

			public Scatterplot(DxCharts dxcharts, DataTable mydt, string xvar, string yvar, string title)
			{
				_dxcharts = dxcharts;
				_chart = CreateScatterplot(mydt, xvar, yvar, title, _dxcharts.color(0));
			}
			public Scatterplot(DxCharts dxcharts, DataTable mydt, string xvar, string yvar, string title, Color mycolor)
			{
				_dxcharts = dxcharts;
				_chart = CreateScatterplot(mydt, xvar, yvar, title, mycolor);
			}

			//public WebChartControl CreateScatterplot(DataTable mydt, string xvar, string yvar)
			//{
			//	DevExpress.XtraCharts.Web.WebChartControl chart = Scatterplot(mydt, xvar, yvar, 0, 0);
			//	return chart;
			//}

			public WebChartControl CreateScatterplot(DataTable mydt, string xvar, string yvar, string mytitle, Color mycolor)
			{
				WebChartControl chart = new WebChartControl();
				XYDiagram scat = new XYDiagram();

				scat.AxisX.GridLines.Visible = true;
				scat.AxisY.GridLines.Visible = true;
				scat.AxisX.GridLines.MinorVisible = true;
				scat.AxisY.GridLines.MinorVisible = true;
				chart.Diagram = scat;

				DataTable dataxy =_dxcharts.data.Data_SelectColumnXY(mydt, xvar, yvar);



				_n = dataxy.Rows.Count;

				if (_n > 0)
				{
					SeriesPoint[] seriesPoints = new SeriesPoint[n];
					for (int i = 0; i < n; i++)
					{
						seriesPoints[i] = new SeriesPoint(dataxy.Rows[i].Field<double>("X"), new double[] { dataxy.Rows[i].Field<double>("Y") });
						var rowvals = dataxy.Rows[i].ItemArray;
						string id = dataxy.Rows[i].Field<string>("id");
						//seriesPoints[i].Tag = id;
						seriesPoints[i].ToolTipHint = String.Format("id: {0}", id);
					}

					double[] x = dataxy.AsEnumerable().Select(o => o.Field<double>("X")).ToArray();
					double[] y = dataxy.AsEnumerable().Select(o => o.Field<double>("Y")).ToArray();


					_pearson = Math.Round(uwac.utilStats.Corr(x, y, "pearson"), 3);
					_spearman = Math.Round(uwac.utilStats.Corr(x, y, "Spearman"), 3);
					//consider adding metanumerics or alglib to get p-values
					//https://github.com/dcwuser/metanumerics 



					Series series = new Series();
					PointSeriesView pointSeriesView = new PointSeriesView();

					if (_dxcharts.useMovAvg)
					{
						SimpleMovingAverage sma = new SimpleMovingAverage();
						sma.PointsCount = _dxcharts._movavgNumPts; ; // Convert.ToInt32(txtPtsCount.Text);
						pointSeriesView.Indicators.Add(sma);
					}

					pointSeriesView.Color = mycolor;

					series.ToolTipPointPattern = "x={A:F2} y={V:F2} {HINT}";
					

					ToolTipRelativePosition pos = new ToolTipRelativePosition();
					pos.OffsetX = -10;
					pos.OffsetY = -10;
					chart.ToolTipOptions.ToolTipPosition = pos;
					

					series.View = pointSeriesView;
					chart.Series.Add(series);
					chart.Series[0].Points.AddRange(seriesPoints);


					string mainTitleText = String.Format("{0}{1}N={2}, rp={3}, rs={4}", mytitle, Environment.NewLine, seriesPoints.Count(), _pearson, _spearman);

					chart.Width = _dxcharts._chartWscat;
					chart.Height = _dxcharts._chartHscat;

					_dxcharts.AddTitles(chart, mainTitleText, "", xvar, yvar);

					chart.BorderOptions.Color = Color.White;

					chart.CustomDrawSeriesPoint += _dxcharts.Mychart_TransparentPoint;
					//chart.CustomCallback += _dxcharts.Mychart_CustomCallback;

					chart.ToolTipEnabled = DevExpress.Utils.DefaultBoolean.True;
					chart.ToolTipOptions.ShowForPoints = true;
					
					chart.CrosshairEnabled = DevExpress.Utils.DefaultBoolean.False;

					return chart;
				}
				else {
					_emptymsg = String.Format("0 cases for{3}{0}{3}{1} by {2}", mytitle, xvar, yvar, Environment.NewLine);
					return null;
				}
			}

		}


		#endregion


		#region Scatterplot Extras

		public Table TableOfPairwiseScatterplots(DxCharts dxcharts, DataTable dt, List<string> numvars, string title, int W, int H, int colorindex)
		{
			List<Table> mytables = new List<Table>();
			List<Mychart> scats = PairwiseScatterplots(dxcharts, dt, numvars, title, dxcharts.color(colorindex));
			mytables.Add(TableHelper.UpperDiagTable(scats, W, H, 1, title));


			//foreach (DataSubset subset in subsets)
			//{
			//	List<WebChartControl> scats = PairwiseScatterplots(subset.dt, numvars);
			//	mytables.Add(UpperDiagTable(scats, 1));
			//};

			Table t = TableHelper.HorizontalTable(mytables);

			return t;
		}

		public Table TableOfPairwiseScatterplots(DxCharts dxcharts, List<DataSubset> subsets, List<string> numvars, string title, int W, int H, int colorindex)
		{
			List<Table> mytables = new List<Table>();

			foreach (DataSubset subset in subsets)
			{
				List<Mychart> scats = PairwiseScatterplots(dxcharts, subset.dt, numvars, title, dxcharts.color(colorindex));
				mytables.Add(TableHelper.UpperDiagTable(scats, W, H, 1, title));
			};

			Table t = TableHelper.HorizontalTable(mytables);

			return t;
		}

		public List<Mychart> PairwiseScatterplots(DxCharts dxcharts, DataTable dt, List<string> numvars, string title, Color mycolor)
		{
			List<Mychart> charts = new List<Mychart>();

			numvars.Remove("id");

			int counter = 0;
			foreach (string v in numvars)
			{
				counter++;
				for (int i = counter; i < numvars.Count; i++)
				{
					Scatterplot scat = new Scatterplot(dxcharts, dt, numvars[i], v, title, mycolor);//Swap the x,y order so it shows up right in the table
					charts.Add(scat);
				}
			}
			return charts;
		}


		#endregion

		#region Line plot


		public class Lineplot : Mychart
		{
			private double _slope;
			private double _intercept;
			private int _n;
			private int _coloroverride;

			public double slope
			{
				get { return _slope; }
				set { _slope = value; }
			}
			public double intercept
			{
				get { return _intercept; }
				set { _intercept = value; }
			}
			public int n
			{
				get { return _n; }
				set { _n = value; }
			}

			public Lineplot(DxCharts dxcharts, DataTable mydt, string xvar, string yvar, string seriesby, string colorsby, string title, bool xaxis_is_date, bool xaxis_is_age)
			{
				_coloroverride = -1;
				_dxcharts = dxcharts;
				_chart = CreateLineplot(mydt, xvar, yvar, seriesby, colorsby, title, xaxis_is_date, xaxis_is_age);
			}

			public Lineplot(DxCharts dxcharts, DataTable mydt, string xvar, string yvar, string seriesby, string colorsby, string title
				, bool xaxis_is_date, bool xaxis_is_age, int colorindex_override)
			{
				_coloroverride = colorindex_override;
				_dxcharts = dxcharts;
				_chart = CreateLineplot(mydt, xvar, yvar, seriesby, colorsby, title, xaxis_is_date, xaxis_is_age);
			}


			public WebChartControl CreateLineplot(DataTable mydt, string xvar, string yvar, string seriesby, string colorsby, string mytitle,  bool xaxis_is_date, bool xaxis_is_age)
			{
				WebChartControl chart = new WebChartControl();
				XYDiagram line = new XYDiagram();

				line.AxisX.GridLines.Visible = true;
				line.AxisY.GridLines.Visible = true;
				line.AxisX.GridLines.MinorVisible = true;
				line.AxisY.GridLines.MinorVisible = true;
				chart.Diagram = line;

				Color myseriescolor;

				DataTable dataxy_all = _dxcharts.data.Data_SelectColumnXY(mydt, xvar, yvar, seriesby, colorsby);

				List<string> series_levels = dataxy_all.AsEnumerable().Select(x => x.Field<string>("seriesby")).Distinct().ToList();
				List<string> colors_levels = dataxy_all.AsEnumerable().Select(x => x.Field<string>("colorsby")).Distinct().ToList();


				List<string> seriesIDs = dataxy_all.AsEnumerable().Select(x => x.Field<string>("Id")).Distinct().ToList();

				int _nall = dataxy_all.Rows.Count;

				if (_nall > 0)
				{ 

					//foreach (string s in seriesIDs)
					for(int s=0; s < seriesIDs.Count; s++)
					{

						
						DataView vw = dataxy_all.AsDataView();
						vw.RowFilter = String.Format("{0}='{1}'", seriesby, seriesIDs[s]);
						DataTable dataxy = vw.ToTable();

						string current_colorlevel = dataxy.AsEnumerable().Select(f => f.Field<string>("colorsby")).Min().ToString();

						int colorindex = 0;

						//Get the correct color
						if (colorsby != "none")
						{
							for (int c = 0; c < colors_levels.Count; c++)
							{
								if (current_colorlevel == colors_levels[c]) colorindex = c;
							}
						}
						myseriescolor = _dxcharts.color(colorindex % 15);

						if(_coloroverride >= 0) myseriescolor = _dxcharts.color(_coloroverride % 15);


						_n = dataxy.Rows.Count;

						if (_n > 0)
						{
							SeriesPoint[] seriesPoints = new SeriesPoint[n];
							for (int i = 0; i < n; i++)
							{
								if (xaxis_is_date)
								{
									seriesPoints[i] = new SeriesPoint(dataxy.Rows[i].Field<DateTime>("x"), new double[] { dataxy.Rows[i].Field<double>("y") });
								}
								else if (xaxis_is_age)
								{
									seriesPoints[i] = new SeriesPoint(dataxy.Rows[i].Field<double>("x"), new double[] { dataxy.Rows[i].Field<double>("y") });
								}
								else 
								{
									seriesPoints[i] = new SeriesPoint(dataxy.Rows[i].Field<string>("x"), new double[] { dataxy.Rows[i].Field<double>("y") });
								}
								var rowvals = dataxy.Rows[i].ItemArray;
								string id = dataxy.Rows[i].Field<string>("id");
								//seriesPoints[i].Tag = id;
								seriesPoints[i].ToolTipHint = String.Format("id: {0}", id);
							}


							if (xaxis_is_date)
							{
								DateTime[] x = dataxy.AsEnumerable().Select(o => o.Field<DateTime>("x")).ToArray();
							}
							else if(xaxis_is_age)
							{
								double[] x = dataxy.AsEnumerable().Select(o => o.Field<double>("x")).ToArray();
							}
							else 
							{
								string[] x = dataxy.AsEnumerable().Select(o => o.Field<string>("x")).ToArray();
							}

							double[] y = dataxy.AsEnumerable().Select(o => o.Field<double>("y")).ToArray();


							//_slope = Math.Round(uwac.utilStats.Corr(x, y, "pearson"), 3);
							//_intercept = Math.Round(uwac.utilStats.Corr(x, y, "Spearman"), 3);
							//consider adding metanumerics or alglib to get p-values
							//https://github.com/dcwuser/metanumerics 



							Series series = new Series();
							LineSeriesView lineSeriesView = new LineSeriesView();

							

							lineSeriesView.Color = myseriescolor;
							lineSeriesView.LineMarkerOptions.FillStyle.FillMode = FillMode.Solid;
							lineSeriesView.LineMarkerOptions.Kind = _dxcharts._markers[s % _dxcharts._markers.Count];

							if (xaxis_is_date)
							{
								line.AxisX.DateTimeScaleOptions.ScaleMode = ScaleMode.Continuous;
								line.AxisX.DateTimeScaleOptions.MeasureUnit = DateTimeMeasureUnit.Month;
								line.AxisX.Label.TextPattern = "{A:dd-MMM-yy}";
								series.ToolTipPointPattern = "x={A:dd-MMM-yy} y={V:F2} {HINT}";
							}
							else
							{
								series.ToolTipPointPattern = "x={A:F2} y={V:F2} {HINT}";
							}


							ToolTipRelativePosition pos = new ToolTipRelativePosition();
							pos.OffsetX = -10;
							pos.OffsetY = -10;
							chart.ToolTipOptions.ToolTipPosition = pos;


							series.View = lineSeriesView;
							series.Points.AddRange(seriesPoints);
							chart.Series.Add(series);



						}
					}

					// consider adding N=??, intrcpt=, slope=
					string mainTitleText = String.Format("{0}{1}", mytitle, Environment.NewLine); //, seriesPoints.Count());

					chart.Width = _dxcharts._chartWscat;
					chart.Height = _dxcharts._chartHscat;

					_dxcharts.AddTitles(chart, mainTitleText, "", xvar, yvar);

					chart.BorderOptions.Color = Color.White;

					chart.CustomDrawSeriesPoint += _dxcharts.Mychart_TransparentPoint;

					chart.CustomDrawSeries += _dxcharts.Mychart_TransparentLine;

					//chart.CustomCallback += _dxcharts.Mychart_CustomCallback;

					chart.ToolTipEnabled = DevExpress.Utils.DefaultBoolean.True;
					chart.ToolTipOptions.ShowForPoints = true;

					chart.CrosshairEnabled = DevExpress.Utils.DefaultBoolean.False;

					if (colorsby != "none")
					{
						for (int lev = 0; lev < colors_levels.Count; lev++)
						{
							// Create a new custom item.
							CustomLegendItem item = new CustomLegendItem();
							chart.Legend.CustomItems.Add(item);
							// Specify its text and marker.
							item.Text = colors_levels[lev];
							int coloridx = (_coloroverride >= 0) ? _coloroverride : lev;
							item.MarkerColor = _dxcharts.colors[coloridx % 15];
						}
					}



					chart.Legend.Visibility = DevExpress.Utils.DefaultBoolean.True;

					// Set a value indicating that both autogenerated and custom items are displayed.
					chart.Legend.ItemVisibilityMode = LegendItemVisibilityMode.AutoGeneratedAndCustom;



					return chart;
				}
				else
				{
					_emptymsg = String.Format("0 cases for{3}{0}{3}{1} by {2}", mytitle, xvar, yvar, Environment.NewLine);
					//_emptymsg = String.Format("0 cases for{3}{0}{3}{1} by {2}", mytitle, xvar, yvar, Environment.NewLine);
					return null;
				}
			}

		}



		#endregion


		#region Stacked Barchart

		public class StackedBarchart : Mychart
		{
			StatsTable _statstable;
			AxesRange _axesrange;

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

			public StackedBarchart(DxCharts dxcharts, StatsTable statstable_input, string xaxisvar, string colorsvar, string maintitle = "", string subtitle = "")
			{
				_dxcharts = dxcharts;
				_statstable = statstable_input;
				_chart = CreateBarchart(_statstable, -999, -999, xaxisvar, colorsvar, maintitle, subtitle);
				//if (_axesrange == null) ExtractAxesRange(_chart);
			}

			public StackedBarchart(DxCharts dxcharts, StatsTable statstable_input, double miny, double maxy, string xaxisvar, string colorsvar, string maintitle = "", string subtitle = "")
			{
				_dxcharts = dxcharts;
				_statstable = statstable_input;
				_chart = CreateBarchart(_statstable, miny, maxy, xaxisvar, colorsvar, maintitle, subtitle);
			}

			

			private void LogAxesRangeWhole(object sender, DevExpress.XtraCharts.AxisRangeChangedEventArgs e)  //EventArgs e)
			{
				this.axesrange = new AxesRange();

				#region X axis
				//double dminx; double dmaxx;
				//var minx = ((XYDiagram)this._chart.Diagram).AxisX.VisualRange.MinValue.ToString();
				//var maxx = ((XYDiagram)this._chart.Diagram).AxisX.VisualRange.MaxValue.ToString();
				//bool bminx = Double.TryParse(minx, out dminx);
				//bool bmaxx = Double.TryParse(maxx, out dmaxx);
				//if (bminx || bmaxx)
				//{
				//if (bminx) axes.minx = dminx;
				//if (bmaxx) axes.maxx = dmaxx;
				//}
				#endregion

				if (e.Axis.Name == "Primary AxisY")
				{
					double dminy; double dmaxy;

					var miny = ((XYDiagram)this._chart.Diagram).AxisY.WholeRange.MinValue.ToString();
					var maxy = ((XYDiagram)this._chart.Diagram).AxisY.WholeRange.MaxValue.ToString();

					bool bminy = Double.TryParse(miny, out dminy);
					bool bmaxy = Double.TryParse(maxy, out dmaxy);

					if (bminy || bmaxy)
					{
						if (bminy) this.axesrange.miny = dminy;
						if (bmaxy) this.axesrange.maxy = dmaxy;
					}

				}
			}



			public WebChartControl CreateBarchart(StatsTable statstable, string xaxisvar, string colorsvar, string maintitle, string subtitle)
			{
				AxesRange axes = null;
				double x1 = -999;
				double x2 = -999;

				return CreateBarchart(statstable, x1, x2, xaxisvar, colorsvar, maintitle, subtitle);
			}

			public WebChartControl CreateBarchart(StatsTable statstable, double miny, double maxy, string xaxisvar, string colorsvar, string maintitle, string subtitle)
			{
				DevExpress.XtraCharts.Web.WebChartControl chart = new DevExpress.XtraCharts.Web.WebChartControl();
				XYDiagram diag = new XYDiagram();

				diag.AxisX.GridLines.Visible = true;
				diag.AxisY.GridLines.Visible = true;
				diag.AxisX.GridLines.MinorVisible = true;
				diag.AxisY.GridLines.MinorVisible = true;
				//diag.Rotated = _dxcharts.histIsRotated;
				chart.Diagram = diag;

				chart.BoundDataChanged += _dxcharts.ColorSeries;
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
					diag.AxisY.WholeRange.SetMinMaxValues(y1, y2);
					diag.AxisY.VisualRange.SetMinMaxValues(y1, y2);
				}

				int barW = _dxcharts._chartWbar;
				int barH = _dxcharts._chartHbar;

				chart.Width = barW;
				chart.Height = barH;

				_dxcharts.AddTitles(chart, maintitle, subtitle, "", "Mean (SD)");



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

				return chart;
			}

		}


		#endregion


		#region Barchart

		public class Barchart : Mychart
		{
			StatsTable _statstable;
			AxesRange _axesrange;

			public AxesRange axesrange {
				get{ return _axesrange; }
				set { _axesrange = value; }
			}
			public StatsTable statstable
			{
				get { return _statstable; }
				set { _statstable = value; }
			}

			public Barchart(DxCharts dxcharts,  StatsTable statstable_input, string xaxisvar, string colorsvar, string maintitle = "", string subtitle = "") 
			{
				_dxcharts = dxcharts;
				_statstable = statstable_input;
				_chart = CreateBarchart(_statstable, -999, -999, xaxisvar, colorsvar, maintitle, subtitle);
				//if (_axesrange == null) ExtractAxesRange(_chart);
			}

			public Barchart(DxCharts dxcharts, StatsTable statstable_input, double miny, double maxy, string xaxisvar, string colorsvar, string maintitle = "", string subtitle = "")
			{
				_dxcharts = dxcharts;
				_statstable = statstable_input;
				_chart = CreateBarchart(_statstable, miny, maxy, xaxisvar, colorsvar, maintitle, subtitle);
			}

			#region delete?
			//private void ExtractAxesRange(WebChartControl chart)
			//{
			//	AxesRange axes = new AxesRange();

			//	double dminx; double dmaxx; double dminy; double dmaxy;

			//	XYDiagram diag = (XYDiagram)chart.Diagram;

			//	var minx = diag.AxisX.WholeRange.MinValue.ToString() ?? "";
			//	var maxx = diag.AxisX.WholeRange.MaxValue.ToString() ?? "";
			//	var miny = diag.AxisY.WholeRange.MinValue.ToString() ?? "";
			//	var maxy = diag.AxisY.WholeRange.MaxValue.ToString() ?? "";

			//	bool bminx = Double.TryParse(minx, out dminx);
			//	bool bmaxx = Double.TryParse(maxx, out dmaxx);
			//	bool bminy = Double.TryParse(miny, out dminy);
			//	bool bmaxy = Double.TryParse(maxy, out dmaxy);

			//	if (bminx || bmaxx || bminy || bmaxy)
			//	{
			//		if (bminx) axes.minx = dminx;
			//		if (bmaxx) axes.maxx = dmaxx;
			//		if (bminy) axes.miny = dminy;
			//		if (bmaxy) axes.maxy = dmaxy;
			//	}
			//	this.axesrange = axes;
			//}

			//private void LogAxesRangeVisual(object sender, DevExpress.XtraCharts.AxisRangeChangedEventArgs e)  //EventArgs e)
			//{
			//this.axesrange = new AxesRange();

			//#region X axis
			////double dminx; double dmaxx;
			////var minx = ((XYDiagram)this._chart.Diagram).AxisX.VisualRange.MinValue.ToString();
			////var maxx = ((XYDiagram)this._chart.Diagram).AxisX.VisualRange.MaxValue.ToString();
			////bool bminx = Double.TryParse(minx, out dminx);
			////bool bmaxx = Double.TryParse(maxx, out dmaxx);
			////if (bminx || bmaxx)
			////{
			////if (bminx) axes.minx = dminx;
			////if (bmaxx) axes.maxx = dmaxx;
			////}
			//#endregion

			//if (e.Axis.Name == "Primary AxisY")
			//{
			//	double dminy; double dmaxy;

			//	var miny = ((XYDiagram)this._chart.Diagram).AxisY.VisualRange.MinValue.ToString();
			//	var maxy = ((XYDiagram)this._chart.Diagram).AxisY.VisualRange.MaxValue.ToString();

			//	bool bminy = Double.TryParse(miny, out dminy);
			//	bool bmaxy = Double.TryParse(maxy, out dmaxy);

			//	if (bminy || bmaxy)
			//	{
			//		if (bminy) this.axesrange.miny = dminy;
			//		if (bmaxy) this.axesrange.maxy = dmaxy;
			//	}

			//}
			//}



			//public void SetAxesRange(AxesRange axes)
			//{
			//	//if (_axesrange.minx != null) ((XYDiagram)this._chart.Diagram).AxisX.VisualRange.MinValue = _axesrange.minx;
			//	//if (_axesrange.maxx != null) ((XYDiagram)this._chart.Diagram).AxisX.VisualRange.MaxValue = _axesrange.maxx;
			//	if (axes.miny != null) ((XYDiagram)this._chart.Diagram).AxisY.VisualRange.MinValue = axes.miny;
			//	if (axes.maxy != null) ((XYDiagram)this._chart.Diagram).AxisY.VisualRange.MaxValue = axes.maxy;
			//}

			#endregion

			private void LogAxesRangeWhole(object sender, DevExpress.XtraCharts.AxisRangeChangedEventArgs e)  //EventArgs e)
			{
				this.axesrange = new AxesRange();

				#region X axis
				//double dminx; double dmaxx;
				//var minx = ((XYDiagram)this._chart.Diagram).AxisX.VisualRange.MinValue.ToString();
				//var maxx = ((XYDiagram)this._chart.Diagram).AxisX.VisualRange.MaxValue.ToString();
				//bool bminx = Double.TryParse(minx, out dminx);
				//bool bmaxx = Double.TryParse(maxx, out dmaxx);
				//if (bminx || bmaxx)
				//{
				//if (bminx) axes.minx = dminx;
				//if (bmaxx) axes.maxx = dmaxx;
				//}
				#endregion

				if (e.Axis.Name == "Primary AxisY")
				{
					double dminy; double dmaxy;

					var miny = ((XYDiagram)this._chart.Diagram).AxisY.WholeRange.MinValue.ToString();
					var maxy = ((XYDiagram)this._chart.Diagram).AxisY.WholeRange.MaxValue.ToString();

					bool bminy = Double.TryParse(miny, out dminy);
					bool bmaxy = Double.TryParse(maxy, out dmaxy);

					if (bminy || bmaxy)
					{
						if (bminy) this.axesrange.miny = dminy;
						if (bmaxy) this.axesrange.maxy = dmaxy;
					}

				}
			}



			public WebChartControl CreateBarchart(StatsTable statstable, string xaxisvar, string colorsvar, string maintitle, string subtitle)
			{
				AxesRange axes = null;
				double x1 = -999;
				double x2 = -999;

				return CreateBarchart(statstable, x1, x2, xaxisvar,  colorsvar, maintitle, subtitle);
			}

			public WebChartControl CreateBarchart(StatsTable statstable, double miny, double maxy, string xaxisvar, string colorsvar, string maintitle, string subtitle)
			{
				DevExpress.XtraCharts.Web.WebChartControl chart = new DevExpress.XtraCharts.Web.WebChartControl();
				

				XYDiagram diag = new XYDiagram();

				diag.AxisX.GridLines.Visible = true;
				diag.AxisY.GridLines.Visible = true;
				diag.AxisX.GridLines.MinorVisible = true;
				diag.AxisY.GridLines.MinorVisible = true;
				//diag.Rotated = _dxcharts.histIsRotated;
				chart.Diagram = diag;

				chart.BoundDataChanged += _dxcharts.ColorSeries;
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
					diag.AxisY.WholeRange.SetMinMaxValues(y1, y2);
					diag.AxisY.VisualRange.SetMinMaxValues(y1, y2);
				}

				int barW = _dxcharts._chartWbar;
				int barH = _dxcharts._chartHbar;

				chart.Width = barW;
				chart.Height = barH;

				_dxcharts.AddTitles(chart, maintitle, subtitle, "", "Mean (SD)");

			

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

				return chart;
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




		#region Histogram



		public class Histogram : Mychart
		{

			public Histogram(DxCharts dxcharts, DataTable mydt, string var, int colorindex)
			{
				_dxcharts = dxcharts;
				//subtitle is empty string by default
				_chart = CreateHistogram(mydt, "", var, dxcharts.color(colorindex), dxcharts.numbins, dxcharts.histIsRotated);
			}
			public Histogram(DxCharts dxcharts, DataSubset subset, string var, int colorindex)
			{
				_dxcharts = dxcharts;
				_chart = CreateHistogram(subset, var, dxcharts.color(colorindex), dxcharts.numbins, dxcharts.histIsRotated);
			}
			public Histogram(DxCharts dxcharts, DataSubsets subsets, string subtitle, string var, int colorindex)
			{
				_dxcharts = dxcharts;
				_chart = CreateHistogram_withPanes(subsets.subsets, subtitle, var, dxcharts.color(colorindex), dxcharts.numbins, dxcharts._panesLayoutDirection);
			}


			public WebChartControl CreateHistogram(DataSubset subset, string var, Color mycolor, int numbins, bool histIsRotated)
			{
				return CreateHistogram(subset.dt, subset.Cols_and_Vals_ToString(), var, mycolor, numbins, histIsRotated);
				
			}


			public WebChartControl CreateHistogram(DataTable mydt, string subtitle, string var, Color mycolor, int numbins, bool histIsRotated)
			{
				WebChartControl chart = new DevExpress.XtraCharts.Web.WebChartControl();
				XYDiagram hist = new XYDiagram();

				hist.AxisX.GridLines.Visible = true;
				hist.AxisY.GridLines.Visible = true;
				hist.AxisX.GridLines.MinorVisible = true;
				hist.AxisY.GridLines.MinorVisible = true;
				hist.Rotated = histIsRotated;
				chart.Diagram = hist;

				HistBinsData histdata = new HistBinsData(mydt, var, numbins);

				if (histdata.N > 0)
				{
					Color colortouse = mycolor;

					Series s = CreateHistogramSeries(histdata.bins, mycolor, false);
					AreaSeriesView vw = (AreaSeriesView)s.View;
					chart.Series.Add(s);

					//Normal curve
					if (_dxcharts._shownormalcurve & histdata.normalX != null)
					{
						Series s_nc = CreateNormalCurveSeries(histdata.normalX, histdata.normalY, mycolor, false);
						PointSeriesView vw_nc = (PointSeriesView)s_nc.View;
						chart.Series.Add(s_nc);
					}
					//M SD
					if (_dxcharts._histMSD)
					{
						Series s_msd = CreateMSDSeries(histdata.mean, histdata.sd, 0, mycolor, false);
						PointSeriesView vw_msd = (PointSeriesView)s_msd.View;
						chart.Series.Add(s_msd);
					}


					string newline = Environment.NewLine; 

					string subtitle_text = String.Format("<color={0}><b>{1}</b> N={2} M={3} SD={4}</color>{5}",
						ColorTranslator.ToHtml(colortouse), subtitle, histdata.N, Math.Round(histdata.mean,2), Math.Round(histdata.sd,2), newline);

					_dxcharts.AddTitles(chart, String.Format("Histogram <b>{0}</b>", var), subtitle_text, "", "Count");

					chart.Width = _dxcharts._chartWhist;
					chart.Height = _dxcharts._chartHhist;

					chart.BorderOptions.Color = Color.White;
					chart.Legend.Visibility = DevExpress.Utils.DefaultBoolean.True;

					return chart;
				}
				else
				{
					_emptymsg = String.Format("0 cases for {0} {1}", subtitle, var);
					return null;
				}

				
			}


			//Given a list of subsets are passed in, these are displayed in a panes
			public WebChartControl CreateHistogram_withPanes(List<DataSubset> subsets, string mysubtitle, string var, Color mycolor, int numbins
				, PaneLayoutDirection panesLayoutDirection )
			{
				WebChartControl chart = new DevExpress.XtraCharts.Web.WebChartControl();
				XYDiagram hist = new XYDiagram();

				hist.AxisX.GridLines.Visible = true;
				hist.AxisY.GridLines.Visible = true;
				hist.AxisX.GridLines.MinorVisible = true;
				hist.AxisY.GridLines.MinorVisible = true;
				//hist.Rotated = histIsRotated;
				chart.Diagram = hist;

				List<HistBinsData> list_o_histdata = new List<HistBinsData>();
				List<string> subtitle1 = new List<string>();
				string panelvar = "";

				//Create a series for each subset
				for (int i = 0; i < subsets.Count; i++)
				{
					DataSubset subset = subsets[i];
					HistBinsData histdata = new HistBinsData(subset.dt, var, numbins);
					if (histdata.N > 0)
					{
						if (panelvar == "") panelvar = subset.Cols_ToString();
						list_o_histdata.Add(histdata);
						subtitle1.Add(subset.Vals_ToString());

					}
				}

				//Panes
				_dxcharts.AddPanes(hist, (list_o_histdata.Count - 1));


				List<string> subtitles = new List<string>();

				//Create a series for each subset
				for (int i = 0; i < list_o_histdata.Count; i++)
				{
					//DataSubset subset = subsets[i];
					//HistBinsData histdata = new HistBinsData(subset.dt, var, _numbins);

					HistBinsData histdata = list_o_histdata[i];

					if (histdata.N > 0)
					{

						Color mypanelcolor = _dxcharts.color(i);
						Series s = CreateHistogramSeries(histdata.bins, mypanelcolor, false);
						AreaSeriesView vw = (AreaSeriesView)s.View;

						if (i >= 1)
						{
							vw.Pane = hist.Panes[(i - 1)];  //Panes collection starts at index 0, but first series goes into default pane
						}
						chart.Series.Add(s);

						//Normal Curve
						if (_dxcharts._shownormalcurve & histdata.normalX != null)
						{
							Series s_nc = CreateNormalCurveSeries(histdata.normalX, histdata.normalY, mypanelcolor, false);
							PointSeriesView vw_nc = (PointSeriesView)s_nc.View;
							if (i >= 1)
							{
								vw_nc.Pane = hist.Panes[(i - 1)];
							}
							chart.Series.Add(s_nc);
						}
						//M SD
						if (_dxcharts._histMSD)
						{
							Series s_msd = CreateMSDSeries(histdata.mean, histdata.sd, 0, mypanelcolor, false);
							PointSeriesView vw_msd = (PointSeriesView)s_msd.View;
							if (i >= 1)
							{
								vw_msd.Pane = hist.Panes[(i - 1)];
							}
							chart.Series.Add(s_msd);
						}



						//if (i >= 1) vw.Pane = hist.Panes[(i - 1)];  //Panes collection starts at index 0, but first series goes into default pane

						string newline = Environment.NewLine; 

						//string subtitle_text = String.Format("<color={0}><b>{1}</b> N={2}</color>",
						//	ColorTranslator.ToHtml(mypanelcolor), subtitle1[i], histdata.N);

						string subtitle_text = String.Format("<color={0}><b>{1}</b> N={2} M={3} SD={4}</color>{5}",
							ColorTranslator.ToHtml(mypanelcolor), subtitle1[i], histdata.N, Math.Round(histdata.mean, 2), Math.Round(histdata.sd, 2), newline);


						subtitles.Add(subtitle_text);
					}
				}

				//string subtitles_merged = (panesLayoutDirection == PaneLayoutDirection.Horizontal) ?
				//	 String.Join(" ", subtitles) : String.Join(Environment.NewLine, subtitles);
				string subtitles_merged = String.Join(" ", subtitles);


				_dxcharts.AddTitles(chart, String.Format("Histogram <b>{0}{1}* by {2} *{1}{3}</b>", var, Environment.NewLine, panelvar, mysubtitle), subtitles_merged, "", "Count");

				chart.Width = _dxcharts._chartWhist;
				chart.Height = _dxcharts._chartHhist;

				chart.BorderOptions.Color = Color.White;
				chart.Legend.Visibility = DevExpress.Utils.DefaultBoolean.True;

				return chart;
			}


			public class HistBinsData
			{
				List<LinqStatistics.Bin> _bins;
				List<double> _normalX;
				List<double> _normalY;
				double _minx;
				double _maxx;
				double _mean;
				double _sd;
				int _N;
				public List<double> normalY
				{
					get { return _normalY; }
				}
				public List<double> normalX
				{
					get { return _normalX; }
				}
				public List<LinqStatistics.Bin> bins
				{
					get { return _bins; }
				}
				public double minx
				{
					get { return _minx; }
				}
				public double maxx
				{
					get { return _maxx; }
				}
				public double N
				{
					get { return _N; }
				}
				public double mean
				{
					get { return _mean; }
				}
				public double sd
				{
					get { return _sd; }
				}
				public HistBinsData(DataTable data, string var, int numbins)
				{

					List<double> x = data.AsEnumerable().Where(r => !r.IsNull(var))
									.Select(y => Convert.ToDouble(y[var])).ToList();

					if (x.Count > 0)
					{

						// see http://www.statisticshowto.com/choose-bin-sizes-statistics/
						int auto_nbins = (int)Math.Round(1 + 3.322 * Math.Log(x.Count), 0);

						int n_bins = (numbins > 0) ? numbins : auto_nbins;

						_bins = LinqStatistics.EnumerableStats.Histogram(x, n_bins).ToList();

						double binwidth = _bins[0].Range.Max - _bins[0].Range.Min;

						double entirerange = x.Max() - x.Min();

						_minx = x.Min();// - (entirerange * 0.5);  //5% wider than the lowest value
						_maxx = x.Max();// + (entirerange * 0.5);
						_N = x.Count;

						if (x.Count >= 2)
						{
							_mean = x.Mean();
							_sd = LinqStatistics.EnumerableStats.StandardDeviation(x);
							//var normal = MathNet.Numerics.Distributions.Normal.WithMeanStdDev(_mean, _sd);
							double increment = (x.Max() - x.Min()) / 100;

							_normalX = new List<double>();
							_normalY = new List<double>();


							for (int i = 0; i < 100; i++)
							{
								double xval = x.Min() + (i * increment);
								double est = MathNet.Numerics.Distributions.Normal.PDF(_mean, _sd, xval) * _N * binwidth;
								_normalX.Add(xval);
								_normalY.Add(est);
							}
						}

					}
				}


			}

			private Series CreateMSDSeries(double mean, double sd, double maxy, Color c, bool reflect)
			{
				Series series = new Series();
				PointSeriesView pointSeriesView = new PointSeriesView();
				SeriesPoint p1 = new SeriesPoint(mean, maxy);
				SeriesPoint p2 = new SeriesPoint(mean - sd, maxy);
				SeriesPoint p3 = new SeriesPoint(mean + sd, maxy);

				series.Points.Add(p1);
				series.Points.Add(p2);
				series.Points.Add(p3);

				//areaSeriesView.Color = c;
				pointSeriesView.Color = Color.FromArgb(100, c);
				pointSeriesView.PointMarkerOptions.BorderVisible = false;
				pointSeriesView.PointMarkerOptions.FillStyle.FillMode = FillMode.Solid;
				pointSeriesView.PointMarkerOptions.Size = 10;
				pointSeriesView.PointMarkerOptions.Kind = MarkerKind.Diamond;
				//pointSeriesView.Transparency = 200;
				series.View = pointSeriesView;
				return series;
			}

			private Series CreateNormalCurveSeries(List<double> x, List<double> y, Color c, bool reflect)
			{
				Series series = new Series();
				PointSeriesView pointSeriesView = new PointSeriesView();

				for (int i = 0; i < x.Count(); i++)
				{
					SeriesPoint p1 = new SeriesPoint(x[i], y[i]);
					series.Points.Add(p1);
				}

				//areaSeriesView.Color = c;
				pointSeriesView.Color = Color.FromArgb(30, c);
				pointSeriesView.PointMarkerOptions.BorderVisible = false;
				pointSeriesView.PointMarkerOptions.FillStyle.FillMode = FillMode.Solid;
				pointSeriesView.PointMarkerOptions.Size = 4;
				//pointSeriesView.Transparency = 200;
				series.View = pointSeriesView;
				return series;
			}


			private Series CreateHistogramSeries(List<LinqStatistics.Bin> bins, Color c, bool reflect)
			{
				Series series = new Series();
				AreaSeriesView areaSeriesView = new AreaSeriesView();
				areaSeriesView.MarkerVisibility = DevExpress.Utils.DefaultBoolean.False;

				for (int i = 0; i < bins.Count(); i++)
				{
					LinqStatistics.Bin bin = bins[i];

					double min = bin.Range.Min;
					double max = bin.Range.Max;
					double count = bin.Count;

					if(Double.IsInfinity(max))
					{
						double binwidth = bins[1].Range.Max - bins[1].Range.Min;
						max = min + binwidth;
					}

					int reflection_multiplier = (reflect) ? -1 : 1;
					SeriesPoint p1 = new SeriesPoint(min, count * reflection_multiplier);
					SeriesPoint p2 = new SeriesPoint(max, count * reflection_multiplier);

					series.Points.Add(p1);
					series.Points.Add(p2);
				}


				//areaSeriesView.Color = c;
				areaSeriesView.Color = Color.FromArgb(50, c);
				areaSeriesView.Transparency = 180;
				series.View = areaSeriesView;



				return series;
			}


		}



		#endregion


		#region Panes
		//List defined by default subsets, Same var, not in panes
		public void AddPanes(XYDiagram diagram, int numpanes)
		{
			//Panes
			for (int i = 0; i < numpanes; i++)
			{
				diagram.Panes.Add(new XYDiagramPane(String.Format("pane{0}", i)));
			}
			diagram.PaneLayoutDirection = _panesLayoutDirection;
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
			int newW = Convert.ToInt32(W * pct);
			int newH = Convert.ToInt32(H * pct);
			Table t = TableHelper.HorizontalTable(charts, newW, newH, 1, 1, _numtablecols);
			return t;
		}
		public Table TableOfCharts(List<Mychart> charts, int W, int H, double pctW, double pctH, int maxCol)
		{
			int newW = Convert.ToInt32(W * pctW);
			int newH = Convert.ToInt32(H * pctH);
			Table t = TableHelper.HorizontalTable(charts, newW, newH, 1, 1, maxCol);
			return t;
		}
		public Table TableOfCharts(List<Mychart> charts, int W, int H, double pct, int maxCol)
		{
			int newW = Convert.ToInt32(W * pct);
			int newH = Convert.ToInt32(H * pct);
			Table t = TableHelper.HorizontalTable(charts, newW, newH, 1, 1, maxCol);
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