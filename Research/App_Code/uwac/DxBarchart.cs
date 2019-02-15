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
	/// Summary description for DxBarchart
	/// </summary>



	[Serializable]
	public class DxBarchart : DxChart
	{
		DescStats _statstable;
		AxesRange _axesrange;
		private List<string> _levels1;
		private List<string> _levels2;

		private DxChartSettings _settings;


		public AxesRange axesrange
		{
			get { return _axesrange; }
			set { _axesrange = value; }
		}
		public DescStats statstable
		{
			get { return _statstable; }
			set { _statstable = value; }
		}
		public List<string> levels1
		{
			get { return _levels1; }
			set { _levels1 = value; }
		}
		public List<string> levels2
		{
			get { return _levels2; }
			set { _levels2 = value; }
		}

		public DxBarchart(DxChartSettings settings, DataTable mydt) //, string xvar, string yvar, string titleinput, string colorsby)
		{
			_settings = settings;
			//Color col = _settings.color(0);

			CreateBarchart(mydt);
		}
		public DxBarchart(DxChartSettings settings, DescStats mystats) //, string xvar, string yvar, string titleinput, string colorsby)
		{
			_settings = settings;
			//Color col = _settings.color(0);

			CreateBarchart(mystats);
		}


		//public DxBarchart(DataTable mydt, string xvar, string yvar, string titleinput, Color mycolor, string colorsby)
		//{
		//	_settings.xaxisvar = xvar;
		//	_settings.yaxisvar = yvar;
		//	_settings.title = titleinput;
		//	_settings.colorvar = colorsby;
		//	Color col = _settings.color(0);
		//}



		public void CreateBarchart(DataTable mydt) //, string xvar, string yvar, string mytitle, Color mycolor, string colorsby)
		{

			List<string> grouping_vars = new List<string>();
			grouping_vars.Add(_settings.xaxisvar);
			grouping_vars.Add(_settings.colorvar);

			if (_settings.panelvar != null & _settings.panelvar != "variable") grouping_vars.Add(_settings.panelvar);

			grouping_vars.RemoveAll(item => item == "variable");
			grouping_vars.RemoveAll(item => item == "none");


			_statstable = (grouping_vars.Count > 0)
					? new DescStats(mydt, _settings.numvars, grouping_vars)
					: new DescStats(mydt, _settings.numvars);

			if (_settings.panelvar == "variable") grouping_vars.Add(_settings.panelvar);


			CreateBarchart(_statstable);


			if (_statstable.dt.Rows.Count == 0)
			{
				this.isempty = true;
				this.emptymsg = _statstable.emptystats;
			}


		}



		public void CreateBarchart(DescStats statstable) //, string xaxisvar, string colorsvar, string maintitle )
		{
			chart.AxisWholeRangeChanged += LogAxesRangeWhole;
			//chart.AxisVisualRangeChanged += LogAxesRangeVisual;


			string mycolorvar;

			if (_settings.colorvar == "none")
			{
				mycolorvar = (statstable.dt.ColumnNames().Contains("All")) ? "All" : _settings.xaxisvar;
			}
			else
			{
				mycolorvar = _settings.colorvar;
			}



			List<string> colors_levels = statstable.dt.AsEnumerable().Select(x => x.Field<string>(mycolorvar)).Distinct().ToList();
			List<string> xaxis_levels = statstable.dt.AsEnumerable().Select(x => x.Field<string>(_settings.xaxisvar)).Distinct().ToList();
			List<string> panes_levels = new List<string>();

			if (_settings.panelvar != "none")
			{
				panes_levels = statstable.dt.AsEnumerable().Select(x => x.Field<string>(_settings.panelvar)).Distinct().ToList();
				panes_levels.Sort();
			}


			//for (int i = 0; i < colors_levels.Count; i++)
			//{
			//	string current_color_lev = colors_levels[i];
			//}

		
			foreach (Series ser in chart.Series)
			{
				Debug.WriteLine(String.Format("arg data member:[{0}] color data member:[{1}]", ser.ArgumentDataMember, ser.ColorDataMember));
			}


			BarchartSeries barseries = new BarchartSeries(statstable.dt, _settings.xaxisvar, _settings.colorvar, _settings.panelvar, _settings.colors, colors_levels);

			foreach (DxSeriesPoints sp in barseries.list_dxseriespoints)
			{
				Series s = new Series();
				s.Points.AddRange(sp.seriesPoints);
				SideBySideBarSeriesView vw = new SideBySideBarSeriesView();
				s.View = vw;

				var thesd = sp.seriesPointsSD[0].Values[0];

				vw.Indicators.Add(new FixedValueErrorBars
				{
					Direction = ErrorBarDirection.Both,
					Name = "SD",
					Color = Color.Black,
					PositiveError = thesd ,
					NegativeError = thesd
				});

				chart.Series.Add(s);
			}

			Debug.WriteLine(String.Format("***************************** INIT   # of Panes: {0}", xydiagram.Panes.Count));


			//Additional Panes 
			if (panes_levels.Count > 0)
			{
				xydiagram.Panes.Clear();
				Debug.WriteLine(String.Format("***************************** After CLEAR # of Panes: {0}", xydiagram.Panes.Count));
				foreach (string p in panes_levels)
				{
					// Obtain a diagram and clear its collection of panes.
					XYDiagramPane pane = new XYDiagramPane(p);
					xydiagram.Panes.Add(pane);
					pane.Title.Text = p;
					pane.Title.Visibility = DefaultBoolean.True;
					xydiagram.PaneLayout.Direction = _settings.panesLayoutDirection; // PaneLayoutDirection.Horizontal;
					Debug.WriteLine(String.Format("**********************************   # of Panes: {0} {1}", xydiagram.Panes.Count, p));

					// check whether series should be added to this pane.
					for (int i = 0; i < chart.Series.Count; i++)
					{
						// if (sps[i].panename == p)
						if (barseries.list_dxseriespoints[i].panename == p)
						{
							XYDiagramSeriesViewBase view = (XYDiagramSeriesViewBase)chart.Series[i].View;
							view.Pane = xydiagram.Panes[p];
						}
					}

					xydiagram.DefaultPane.Visibility = ChartElementVisibility.Hidden;

				}
			}
			//No Additional Panes
			else {
				for (int i = 0; i < chart.Series.Count; i++)
				{
					XYDiagramSeriesViewBase view = (XYDiagramSeriesViewBase)chart.Series[i].View;
					view.Pane = xydiagram.DefaultPane;

				}
			}

			chart.DataBind();


			//Adjust axis range if needed
			if (_settings.miny != -999 && _settings.maxy != -999)
			{
				double y1 = _settings.miny;
				double y2 = _settings.maxy;
				//diag.AxisY.VisualRange.SetMinMaxValues(y1, y2);
				xydiagram.AxisY.WholeRange.SetMinMaxValues(y1, y2);
				xydiagram.AxisY.VisualRange.SetMinMaxValues(y1, y2);
			}


			chart.Width = _settings.W;
			chart.Height = _settings.H;

			#region Titles
			if (_settings.numvars.Count == 1)
			{
				AddTitles(_settings.title, _settings.subtitle, "", String.Format("{0} Mean (SD)", _settings.numvars[0]));
			}
			else
			{
				AddTitles(_settings.title, _settings.subtitle, "", "Mean (SD)");
			}
			#endregion

			chart.BorderOptions.Color = Color.White;


			this.LegendByColorLevels(_settings.colors, colors_levels);

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


		public void barchart_BoundDataChanged(object sender, EventArgs e)
		{
			var chart = (WebChartControl)sender;


			for (int i = 0; i < chart.Series.Count(); i++)
			{
				var x = chart.Series[i];
				var sname = x.Name;

				Debug.WriteLine(String.Format("sname={0}", sname));

				//Color mycolor = _settings.colors[i % _settings.colors.Count];

				//((SideBySideBarSeriesView)chart.Series[i].View).Color = mycolor;
				//((SideBySideBarSeriesView)chart.Series[i].View).FillStyle.FillMode = FillMode.Solid;
			}

			//https://documentation.devexpress.com/WindowsForms/4942/Controls-and-Libraries/Chart-Control/Examples/Chart-Elements/How-to-Display-Automatically-Created-Series-in-Separate-Panes 


			if (chart.Series.Count > 0)
			{
				// Obtain a diagram and clear its collection of panes.
				XYDiagram diagram = (XYDiagram)chart.Diagram;
				diagram.Panes.Clear();
				// Create a pane for each series.
				for (int i = 1; i < chart.Series.Count; i++)
				{
					XYDiagramPane pane = new XYDiagramPane("The Pane's Name");
					diagram.Panes.Add(pane);
					XYDiagramSeriesViewBase view = (XYDiagramSeriesViewBase)chart.Series[i].View;

					//view.Indicators.Add(new DataSourceBasedErrorBars
					//{
					//	Direction = ErrorBarDirection.Both,
					//	Name = "SD",
					//	Color = Color.Black,
					//	PositiveErrorDataMember = "SD",
					//	NegativeErrorDataMember = "SD"
					//});

					view.Pane = pane;

					diagram.PaneLayout.Direction = PaneLayoutDirection.Horizontal;
				}
			}
		}

	}

	[Serializable]
	public class BarchartSeries
	{
		private List<DxSeriesPoints> _list_dxseriespoints;
		public List<DxSeriesPoints> list_dxseriespoints {  get{ return _list_dxseriespoints; } set { _list_dxseriespoints = value; } }

		public BarchartSeries(DataTable dt, string xvar, string colorvar, string panelvar, List<Color> colors, List<string> color_levels)
		{
			//List<DxSeriesPoints> _list_dxseriespoints = new List<DxSeriesPoints>();


			_list_dxseriespoints = CreateSeries(dt, xvar, colorvar, panelvar, colors, color_levels);


		}


		private List<DxSeriesPoints> CreateSeries(DataTable dt, string xvar, string colorvar, string panelvar, List<Color> colors, List<string> color_levels)
		{
			List<string> groupvars = new List<string>();
			int panename_idx = -1;
			if (panelvar == "none" & colorvar != "none")
			{
				groupvars = new List<string>() { xvar, colorvar };
				panename_idx = -1;
			}
			else if (panelvar != "none" & colorvar == "none")
			{
				groupvars = new List<string>() { xvar, panelvar };
				panename_idx = 1;
			}
			else if (panelvar != "none" & colorvar != "none")
			{
				groupvars = new List<string>() { xvar, colorvar, panelvar };
				panename_idx = 2;
			}

			List<DxSeriesPoints> list_series = new List<DxSeriesPoints>();
			try
			{

				// from: http://www.scriptscoop.net/t/7516b362c821/c-c-linq-how-to-build-group-by-clause-dynamically.html
				IEnumerable<string> columnsToGroupBy = groupvars;
				var groups = dt.AsEnumerable()
							.GroupBy(r => new NTuple<object>(from column in columnsToGroupBy select r[column]));

				int n_groups = groups.Count();
				foreach (var group in groups)
				{
					DataTable dtSub = group.CopyToDataTable();

					//List<string> keyvalues = group.Key.Values[0].ToString();
					List<string> keyvalues = new List<string>();
					foreach (var s in group.Key.Values)
					{
						keyvalues.Add(s.ToString());
					}


					DxSeriesPoints pts = new DxSeriesPoints(dtSub, xvar, "M", colorvar, colors, color_levels);

					pts.label = String.Join(" : ", keyvalues);

					pts.panename = (panename_idx >= 0) ? keyvalues[panename_idx] : "none";

					list_series.Add(pts);
				}

			}
			catch (Exception ex)
			{
				throw new Exception("ERROR! qryGroupBy  Msg:" + ex.Message + "............." + ex.StackTrace.ToString());
			}

			return list_series;
		}

	}



	[Serializable]
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



	[Serializable]
	public class DxBarchartSettings : DxChartSettings
	{
		public bool showEmptyCategories { get; set; }

		public DxBarchartSettings() {
			SetOutputtype(DxOutputtype.Barchart);
		}

	}

}





