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
	/// Summary description for DxHistogram
	/// </summary>

	#region Histogram


	[Serializable]
	public class DxHistogram : DxChart
	{
		private DxHistogramSettings _settings;


		public DxHistogram(DxHistogramSettings settings, DataTable mydt, string var, int colorindex)
		{
			_settings = settings;

			//Based on the settings create the histogram
			if (_settings.colorvar != "none")
			{
				DataSubsets subsets = new DataSubsets(mydt, new List<string> { var }, new List<string> { _settings.colorvar });

				CreateHistogram_withPanes(subsets.subsets, "", var );
			}
			else
			{
				//subtitle is empty string by default
				CreateHistogram(mydt); //, "", var, dxcharts.color(colorindex), dxcharts.numbins, dxcharts.histIsRotated);
			}
		}


		public void CreateHistogram(DataTable mydt) 
		{
			HistBinsData histdata = new HistBinsData(mydt, _settings.xaxisvar, _settings.numbins);

			if (histdata.N > 0)
			{
				Color colortouse = _settings.colors[0];

				Series s = CreateHistogramSeries(histdata.bins, colortouse, false);
				AreaSeriesView vw = (AreaSeriesView)s.View;
				chart.Series.Add(s);

				//Normal curve
				if (_settings.shownormalcurve & histdata.normalX != null)
				{
					Series s_nc = CreateNormalCurveSeries(histdata.normalX, histdata.normalY, colortouse, false);
					PointSeriesView vw_nc = (PointSeriesView)s_nc.View;
					chart.Series.Add(s_nc);
				}
				//M SD
				if (_settings.histMSD)
				{
					Series s_msd = CreateMSDSeries(histdata.mean, histdata.sd, 0, colortouse, false);
					PointSeriesView vw_msd = (PointSeriesView)s_msd.View;
					chart.Series.Add(s_msd);
				}


				string newline = Environment.NewLine;

				string subtitle_text = String.Format("<color={0}> N={1} M={2} SD={3}</color>",
					ColorTranslator.ToHtml(colortouse)
					, histdata.N
					, Math.Round(histdata.mean, 2)
					, Math.Round(histdata.sd, 2));

				this.AddTitles(String.Format("Histogram <b>{0}</b>", _settings.xaxisvar), subtitle_text, "", "Count");

				chart.Width = _settings.W;
				chart.Height = _settings.H;

				chart.BorderOptions.Color = Color.White;
				chart.Legend.Visibility = DevExpress.Utils.DefaultBoolean.True;

			}
			else
			{
				//_emptymsg = String.Format("0 cases for {0} {1}", subtitle, var);
				//return null;
			}


		}


		//Given a list of subsets are passed in, these are displayed in a panes
		public void CreateHistogram_withPanes(List<DataSubset> subsets, string mysubtitle, string var) //, Color mycolor)
		{

			List<HistBinsData> list_o_histdata = new List<HistBinsData>();
			List<string> subtitle1 = new List<string>();
			string panelvar = "";

			//Create a series for each subset
			for (int i = 0; i < subsets.Count; i++)
			{
				DataSubset subset = subsets[i];
				HistBinsData histdata = new HistBinsData(subset.dt, var, _settings.numbins);
				if (histdata.N > 0)
				{
					if (panelvar == "") panelvar = subset.Cols_ToString();
					list_o_histdata.Add(histdata);
					subtitle1.Add(subset.Vals_ToString());

				}
			}

			//Panes
			this.AddPanes((list_o_histdata.Count - 1), _settings.panesLayoutDirection);

			List<string> subtitles = new List<string>();

			//Create a series for each subset
			for (int i = 0; i < list_o_histdata.Count; i++)
			{
				HistBinsData histdata = list_o_histdata[i];

				if (histdata.N > 0)
				{
					Color mypanelcolor = _settings.color(i);
					Series s = CreateHistogramSeries(histdata.bins, mypanelcolor, false);
					AreaSeriesView vw = (AreaSeriesView)s.View;

					if (i >= 1)
					{
						vw.Pane = this.xydiagram.Panes[(i - 1)];  //Panes collection starts at index 0, but first series goes into default pane
					}
					chart.Series.Add(s);

					//Normal Curve
					if (_settings.shownormalcurve & histdata.normalX != null)
					{
						Series s_nc = CreateNormalCurveSeries(histdata.normalX, histdata.normalY, mypanelcolor, false);
						PointSeriesView vw_nc = (PointSeriesView)s_nc.View;
						if (i >= 1)
						{
							vw_nc.Pane = this.xydiagram.Panes[(i - 1)];
						}
						chart.Series.Add(s_nc);
					}
					//M SD
					if (_settings.histMSD)
					{
						Series s_msd = CreateMSDSeries(histdata.mean, histdata.sd, 0, mypanelcolor, false);
						PointSeriesView vw_msd = (PointSeriesView)s_msd.View;
						if (i >= 1)
						{
							vw_msd.Pane = this.xydiagram.Panes[(i - 1)];
						}
						chart.Series.Add(s_msd);
					}

					string newline = Environment.NewLine;

					string subtitle_text = String.Format("<color={0}><b>{1}</b> N={2} M={3} SD={4}</color>{5}",
						ColorTranslator.ToHtml(mypanelcolor)
						, subtitle1[i]
						, histdata.N, Math.Round(histdata.mean, 2), Math.Round(histdata.sd, 2), newline);


					subtitles.Add(subtitle_text);
				}
			}

			string subtitles_merged = String.Join(" ", subtitles);

			//this.AddTitles(String.Format("Histogram <b>{0}{1}* by {2} *</b>"
			//	, var
			//	, Environment.NewLine
			//	, panelvar), subtitles_merged, "", "Count");


			string maintitle = String.Format("Histogram <b>{0}{1}* by {2} *</b>"
				, var
				, Environment.NewLine
				, panelvar);

			this.AddTitles(maintitle);

			XYDiagramDefaultPane defpane = xydiagram.DefaultPane;
			defpane.Title.Text =  subtitles[0];
			defpane.Title.Visibility = DefaultBoolean.True;

			for (int p=0; p < xydiagram.Panes.Count; p++)
			{
				XYDiagramPane pane = xydiagram.Panes[p];
				pane.Title.Text = subtitles[p+1];
			}

			chart.Width = _settings.W;
			chart.Height = _settings.H;

			chart.BorderOptions.Color = Color.White;
			chart.Legend.Visibility = DevExpress.Utils.DefaultBoolean.True;

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

				if (Double.IsInfinity(max))
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

	[Serializable]
	public class DxHistogramSettings : DxChartSettings
	{
		private bool _shownormalcurve = false;
		private bool _histMSD = true;
		private int _numbins = 15;
		public bool shownormalcurve { get { return _shownormalcurve; } set { _shownormalcurve = value; } }
		public bool histMSD { get { return _histMSD; } set { _histMSD = value; } }
		public int numbins { get { return _numbins; } set { _numbins = value; } }
		public DxHistogramSettings()
		{
			SetOutputtype(DxOutputtype.Histogram);
		}
		public DxHistogramSettings(DxChartSettings settings)
		{
			W = settings.W;
			H = settings.H;
			numvars = settings.numvars;
			agevars = settings.agevars;
			if (settings.agevars.Count > 0) numvars.AddRange(settings.agevars);
			colors = settings.colors;

			SetOutputtype(DxOutputtype.Histogram);
		}

		
	}

}