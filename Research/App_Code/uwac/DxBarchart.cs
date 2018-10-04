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


	#region Barchart

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

			List<string> grouping_vars = new List<string>();
			grouping_vars.Add(_settings.xaxisvar);
			grouping_vars.Add(_settings.colorvar);
			//grouping_vars.Add(_settings.panelvar);

			grouping_vars.RemoveAll(item => item == "variable");
			grouping_vars.RemoveAll(item => item == "none");


			if (grouping_vars.Count > 0)
			{
//				DataSubsets dataSubsets = new DataSubsets(mydt, _settings.numvars, grouping_vars);
				_statstable = new DescStats(mydt, _settings.numvars, grouping_vars);
			}
			else
			{
				_statstable = new DescStats(mydt, _settings.numvars);
			}


			CreateBarchart(_statstable);

			//if (grouping_vars.Count <= 1)
			//{
			//	CreateBarchart(_statstable);
			//}
			//else
			//{
			//	DataSubsets subsets = new DataSubsets(_statstable.dt, new List<string> { "Variable", "M", "SD" }, _settings.panelvar);

			//	CreateBarchart2(_statstable);
			//}

		}
		public void CreateBarchart2(DescStats statstable) //, string xaxisvar, string colorsvar, string maintitle )
		{
			chart.AxisWholeRangeChanged += LogAxesRangeWhole;
			chart.BoundDataChanged += chart_BoundDataChanged;

			//chart.AxisVisualRangeChanged += LogAxesRangeVisual;


			//chart.DataSource = statstable.dt;
			//chart.SeriesDataMember = _settings.colorvar; //Colors - dimension in the Legend
			//chart.SeriesTemplate.ArgumentDataMember = _settings.xaxisvar; //X axis dimension
			//chart.SeriesTemplate.ValueDataMembers.AddRange("M"); // _numvars.ToArray());


			SideBySideBarSeriesView vw = new SideBySideBarSeriesView();

			vw.Indicators.Add(new DataSourceBasedErrorBars
			{
				Direction = ErrorBarDirection.Both,
				Name = "SD",
				Color = Color.Black,
				PositiveErrorDataMember = "SD",
				NegativeErrorDataMember = "SD"
			});


			//Build series by hand
			string lev1var = _settings.panelvar;
			string lev2var = _settings.colorvar;

			_levels1 = statstable.dt.AsEnumerable().Select(f => f.Field<string>(lev1var)).Distinct().ToList();
			_levels2 = statstable.dt.AsEnumerable().Select(f => f.Field<string>(lev2var)).Distinct().ToList();


			//foreach (string lev in panellevels)
			for (int l1 = 0; l1 < levels1.Count; l1++)
			{
				string lev1 = levels1[l1];

				DataTable dt_msd1 = (from f in statstable.dt.AsEnumerable()
									where f.Field<string>(lev1var) == lev1
									select new
									{
										Variable = f.Field<string>("Variable"),
										M = f.Field<double?>("M"),
										SD = f.Field<double?>("SD"),
										level1 = f.Field<string>(lev1var),
										level2 = f.Field<string>(lev2var)
									}).CustomCopyToDataTable();

				dt_msd1.Columns["level1"].ColumnName =lev1var;
				dt_msd1.Columns["level2"].ColumnName = lev2var;

				for (int l2 = 0; l2 < levels2.Count; l2++)
				{
					//string lev2 = panellevels[l2];
					//string lev2var = _settings.panelvar;
					string lev2 = levels2[l2];

					DataTable dt_msd2 = (from f in dt_msd1.AsEnumerable()
										where f.Field<string>(lev2var) == lev2
										select new
										{
											Variable = f.Field<string>("Variable"),
											M = f.Field<double?>("M"),
											SD = f.Field<double?>("SD")
										}).CustomCopyToDataTable();

					Series series = new Series();
					series.Name = String.Format("{0}_{1}", lev1, lev2);
					//panelseries.ArgumentDataMember = "Variable"; // _settings.xaxisvar; //X axis dimension
					//panelseries.ValueDataMembers[0] = "M";
					//panelseries.FilterString = String.Format("[{0}] == {1}", _settings.panelvar, lev);
					//panelseries.DataSource = dt_msd;


					//DxSeriesPoints pts = new DxSeriesPoints(dt_msd, "Variable", "M", _settings.colors, l);
					//panelseries.Points.AddRange(pts.seriesPoints);


					//foreach (SeriesPoint pt in series.Points)
					//{
					//	pt.Color = _settings.colors[l1];
					//}



					series.View = vw;
					series.BindToData(dt_msd2, "Variable", new string[] { "M", "SD" });

					vw.Indicators.Add(new DataSourceBasedErrorBars
					{
						Direction = ErrorBarDirection.Both,
						Name = "SD",
						Color = Color.Black,
						PositiveErrorDataMember = "SD",
						NegativeErrorDataMember = "SD"
					});

					chart.Series.Add(series);
				}
			}




			//SideBySideBarSeriesView vw = new SideBySideBarSeriesView();

			//vw.Indicators.Add(new DataSourceBasedErrorBars
			//{
			//	Direction = ErrorBarDirection.Both,
			//	Name = "SD",
			//	Color = Color.Black,
			//	PositiveErrorDataMember = "SD",
			//	NegativeErrorDataMember = "SD"
			//});

			//chart.SeriesTemplate.View = vw;

			//if (_settings.panelvar != "none")
			//{
			//	this.AddPanes(levels1.Count - 1, _settings.panesLayoutDirection);
			//}

			chart.DataBind();

			for (int s = 0; s < (chart.Series.Count - 1); s++)
			{
				Series series = chart.Series[s];

				DataTable foo = (DataTable)series.DataSource;

				Debug.Print(String.Format("** {0} *********", series.Name));
				foo.DebugTable();

				//var x = series.ValueDataMembers;
				//((SideBySideBarSeriesView)series.View).Pane = xydiagram.Panes[s % (panellevels.Count - 1)];
			}




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

			AddTitles(_settings.title, _settings.subtitle, "", "Mean (SD)");

			chart.BorderOptions.Color = Color.White;
			chart.Legend.Visibility = DevExpress.Utils.DefaultBoolean.True;

		}
		public void CreateBarchart(DescStats statstable) //, string xaxisvar, string colorsvar, string maintitle )
		{
			chart.AxisWholeRangeChanged += LogAxesRangeWhole;
			//chart.AxisVisualRangeChanged += LogAxesRangeVisual;


			chart.DataSource = statstable.dt;
			chart.SeriesDataMember = (_settings.colorvar == "none") ? "All" : _settings.colorvar; //Colors - dimension in the Legend
			chart.SeriesTemplate.ArgumentDataMember = _settings.xaxisvar; //X axis dimension
			chart.SeriesTemplate.ValueDataMembers.AddRange("M"); // _numvars.ToArray());


			chart.BoundDataChanged += chart_BoundDataChanged;

			SideBySideBarSeriesView vw = new SideBySideBarSeriesView();

			vw.Indicators.Add(new DataSourceBasedErrorBars
			{
				Direction = ErrorBarDirection.Both,
				Name = "SD",
				Color = Color.Black,
				PositiveErrorDataMember = "SD",
				NegativeErrorDataMember = "SD"
			});

			chart.SeriesTemplate.View = vw;

			////Panes - didn't get working yet
			//if(_settings.panelvar != "none")
			//{
			//	int numgroupingvars = statstable.groupingvars.Count;
			//	this.AddPanes(numgroupingvars-1, _settings.panesLayoutDirection);
			//}

			chart.DataBind();

			foreach (Series series in chart.Series)
			{
				var x = series.ValueDataMembers;
				((SideBySideBarSeriesView)series.View).Pane = xydiagram.Panes[0];
			}


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

			AddTitles(_settings.title, _settings.subtitle, "", "Mean (SD)");

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


		protected void chart_BoundDataChanged(object sender, EventArgs e)
		{
			var chart = (WebChartControl)sender;


			for (int i = 0; i < chart.Series.Count(); i++)
			{
				var x = chart.Series[i];
				var sname = x.Name;


				Color mycolor = _settings.colors[i % _settings.colors.Count];

				((SideBySideBarSeriesView)chart.Series[i].View).Color = mycolor;
				((SideBySideBarSeriesView)chart.Series[i].View).FillStyle.FillMode = FillMode.Solid;
			}

			//https://documentation.devexpress.com/WindowsForms/4942/Controls-and-Libraries/Chart-Control/Examples/Chart-Elements/How-to-Display-Automatically-Created-Series-in-Separate-Panes 

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

	public class DxBarchartSettings : DxChartSettings
	{

		public DxBarchartSettings() { }

	}

}





