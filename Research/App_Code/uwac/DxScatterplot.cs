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
/// Summary description for DxScatterplot
/// </summary>

namespace uwac
{

	#region Scatterplot


	public class DxScatterplot : DxChart
	{
		private DxScatterplotSettings _settings;
		
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

		public DxScatterplot(DxScatterplotSettings settings,  DataTable mydt) //, string xvar, string yvar, string titleinput, string colorsby)
		{
			_settings = settings;
			Color col = _settings.color(0);

			CreateScatterplot(mydt);
		}
		public DxScatterplot(DataTable mydt, string xvar, string yvar, string titleinput, Color mycolor, string colorsby)
		{
			_settings.xaxisvar = xvar;
			_settings.yaxisvar = yvar;
			_settings.title = titleinput;
			_settings.colorvar = colorsby;
			Color col = _settings.color(0);
			
		}


		public void CreateScatterplot(DataTable mydt) //, string xvar, string yvar, string mytitle, Color mycolor, string colorsby)
		{
			
			DataTable dataxy = (_settings.colorvar != "none") ?
				DataTableExtensions.Data_SelectColumnXY(mydt, _settings.xaxisvar, _settings.yaxisvar, _settings.colorvar) :
				DataTableExtensions.Data_SelectColumnXY(mydt, _settings.xaxisvar, _settings.yaxisvar);

			//note colors stored in the "seriesby" column as this is how SelectColumnXY works with just a single string overload
			List<string> color_levels = (_settings.colorvar == "none") ? 
				null : 
				dataxy.AsEnumerable().Select(x => x.Field<string>("seriesby")).Distinct().ToList();

			int colorindex = 0;

			if (dataxy.Rows.Count > 0)
			{
				//HACK!
				_settings.xaxisvar = "x";
				_settings.yaxisvar = "y";


				SeriesPoint[] seriesPoints = new DxSeriesPoints(dataxy, _settings.xaxisvar, _settings.yaxisvar
					, _settings.colorvar, _settings.colors, color_levels).seriesPoints;




				double[] x = dataxy.AsEnumerable().Select(o => o.Field<double>(_settings.xaxisvar)).ToArray();
				double[] y = dataxy.AsEnumerable().Select(o => o.Field<double>(_settings.yaxisvar)).ToArray();


				_pearson = Math.Round(uwac.utilStats.Corr(x, y, "pearson"), 3);
				_spearman = Math.Round(uwac.utilStats.Corr(x, y, "Spearman"), 3);
				//consider adding metanumerics or alglib to get p-values
				//https://github.com/dcwuser/metanumerics 



				Series series = new Series();
				PointSeriesView pointSeriesView = new PointSeriesView();

				chart.SaveStateOnCallbacks = true;
				chart.Legend.MarkerMode = LegendMarkerMode.CheckBoxAndMarker;


				if (_settings.colorvar != "none")
				{
					for (int lev = 0; lev < color_levels.Count; lev++)
					{
						// Create a new custom item.
						CustomLegendItem item = new CustomLegendItem();
						chart.Legend.CustomItems.Add(item);
						// Specify its text and marker.
						item.Text = color_levels[lev];
						int coloridx = lev; //(_coloroverride >= 0) ? _coloroverride : lev;
						item.MarkerColor = _settings.colors[coloridx % 15];
					}
				}

				if (_settings.useMovAvg)
				{
					SimpleMovingAverage sma = new SimpleMovingAverage();
					sma.PointsCount = _settings._movavgNumPts; ; // Convert.ToInt32(txtPtsCount.Text);
					pointSeriesView.Indicators.Add(sma);
				}

				if (_settings.showregline)
				{
					RegressionLine regline = new RegressionLine();
					pointSeriesView.Indicators.Add(regline);
				}


				series.ToolTipPointPattern = "x={A:F2} y={V:F2} {HINT}";


				ToolTipRelativePosition pos = new ToolTipRelativePosition();
				pos.OffsetX = -10;
				pos.OffsetY = -10;
				chart.ToolTipOptions.ToolTipPosition = pos;


				series.View = pointSeriesView;
				chart.Series.Add(series);
				chart.Series[0].Points.AddRange(seriesPoints);


				string mainTitleText = String.Format("{0}{1}N={2}, rp={3}, rs={4}", _settings.title, Environment.NewLine, seriesPoints.Count(), _pearson, _spearman);

				chart.Width = _settings.W;
				chart.Height = _settings.H;

				AddTitles(mainTitleText, "", _settings.xaxisvar, _settings.yaxisvar);

				chart.BorderOptions.Color = Color.White;

				chart.CustomDrawSeriesPoint += Scatterplot_TransparentPoint;
				//chart.CustomCallback += _dxcharts.Mychart_CustomCallback;

				chart.ToolTipEnabled = DevExpress.Utils.DefaultBoolean.True;
				chart.ToolTipOptions.ShowForPoints = true;

				chart.CrosshairEnabled = DevExpress.Utils.DefaultBoolean.False;

			}
			else
			{
				emptymsg = String.Format("0 cases for{3}{0}{3}{1} by {2}", _settings.title, _settings.xaxisvar, _settings.yaxisvar, Environment.NewLine);
			}
		}



		protected void Scatterplot_TransparentPoint(object sender, CustomDrawSeriesPointEventArgs e)
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

	}


	#endregion

	public class DxScatterplotSettings : DxChartSettings
	{
		public bool _useMovAvg = false;
		public int _movavgNumPts = 15;
		public bool _showregline = false;

		public DxScatterplotSettings() {
			SetChartType(DxChartType.Scatterplot);
		}
		public DxScatterplotSettings(DxChartSettings settings) {
			SetChartType(DxChartType.Scatterplot);
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
		public bool showregline
		{
			get { return _showregline; }
			set { _showregline = value; }
		}
	}


}







