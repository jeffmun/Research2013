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

	[Serializable]
	public class DxScatterplot : DxChart
	{
		private DxScatterplotSettings _settings;

		private Corrs _corrs;
		public Corrs corrs { get { return _corrs; } set{ _corrs = value; } }
		private List<string> subtitles { get; set; }


		public DxScatterplot(DxScatterplotSettings settings,  DataTable mydt, XYpair pair) //, string xvar, string yvar, string titleinput, string colorsby)
		{
			_settings = settings; 
			_settings.xaxisvar = pair.xvar;
			_settings.yaxisvar = pair.yvar;
			_settings.paneLevels = new List<string>();

			DataTable dataxy = GetXYData(mydt);

			ConstructScatterplot(dataxy);
			FormatChart();

			if (corrs != null)
			{
				this.n = corrs.n;
			}
		}

		public DxScatterplot(DxScatterplotSettings settings, DataTable mydt) //, string xvar, string yvar, string titleinput, string colorsby)
		{
			_settings = settings;
			_settings.paneLevels = new List<string>();

			DataTable dataxy = GetXYData(mydt);

			ConstructScatterplot(dataxy);
			FormatChart();

			if (corrs != null)
			{
				this.n = corrs.n;
			}
		}

		public DataTable GetXYData(DataTable mydt) //, string xvar, string yvar, string mytitle, Color mycolor, string colorsby)
		{

			List<string> othervars = new List<string>();

			if (_settings.colorvar != "none") othervars.Add(_settings.colorvar);
			if (_settings.panevar != "none") othervars.Add(_settings.panevar);

			othervars = othervars.Distinct().ToList();
			othervars.Remove(null);

			DataTable dataxy = DataTableExtensions.SelectColumnXY(mydt, _settings.xaxisvar, _settings.yaxisvar, othervars);

			if (dataxy.Rows.Count > 0)
			{
				_corrs = new Corrs(dataxy, _settings.xaxisvar, _settings.yaxisvar, _settings.digits_corr);
				Jitter(dataxy, _settings.xaxisvar, _settings.yaxisvar);
			}
			return dataxy;
		}




		protected void ConstructScatterplot(DataTable dataxy)
		{

			if (_settings.colorvar != "none")
			{
				_settings.colorLevels = dataxy.AsEnumerable().Select(x => x.Field<string>(_settings.colorvar)).Distinct().ToList();
			}
			if (_settings.panevar != "none")
			{
				_settings.paneLevels = dataxy.AsEnumerable().Select(x => x.Field<string>(_settings.panevar)).Distinct().ToList();
			}


			ScatterplotSeries scatseries = new ScatterplotSeries(dataxy, _settings); //.xaxisvar, _settings.yaxisvar, _settings.colorvar, _settings.panevar, _settings.colors, _colorLevels);

			subtitles = scatseries.Subtitles();

			foreach (string s in subtitles) { Debug.WriteLine(s); }

			int regcounter = 0;
			foreach (DxSeriesPoints sp in scatseries.list_dxseriespoints)
			{
				Series s = new Series();
				PointSeriesView pointSeriesView = new PointSeriesView();

				s.Points.AddRange(sp.seriesPoints);
				s.View = pointSeriesView;
				s.ToolTipPointPattern = "{HINT} x={A:F2} y={V:F2}";


				if (_settings.useMovAvg)
				{
					SimpleMovingAverage sma = new SimpleMovingAverage();
					sma.PointsCount = _settings._movavgNumPts; ; // Convert.ToInt32(txtPtsCount.Text);
					sma.Color = sp.seriesPoints[0].Color;
					sma.LineStyle.DashStyle = DashStyle.Dash;
					HSLColor hsl = new HSLColor();
					sma.Color = hsl.Darken(sp.seriesPoints[0].Color, .9, _settings.reglineAlpha);
					((PointSeriesView)s.View).Indicators.Add(sma);
				}

				
				if (_settings.showregline)
				{
					RegressionLine regline = new RegressionLine();
					HSLColor hsl = new HSLColor();
					regline.LineStyle.Thickness = 4;
					regline.Color = hsl.Darken(sp.seriesPoints[0].Color, .9, _settings.reglineAlpha);
					regline.CrosshairTextOptions.TextColor = Color.Lime;
					//regline.CrosshairTextOptions.

					((PointSeriesView)s.View).Indicators.Add(regline);
				}
				regcounter++;

				chart.Series.Add(s);

			}



			//Legend
			if (_settings.colorvar != "none" & dataxy.ContainsColumnName(_settings.colorvar))
			{
				LegendByColorLevels(_settings.colors, _settings.colorLevels);
			}


			if (_settings.colorvar != "none"  & _settings.panevar != "none")
			{
				xydiagram.Panes.Clear();
				Debug.WriteLine(String.Format("***************************** After CLEAR # of Panes: {0}", xydiagram.Panes.Count));

				MakePanes(_settings.paneLevels, subtitles);
				AssignSeriesToPane(scatseries, _settings.paneLevels);
			}
			else if (_settings.colorvar == "none" & _settings.panevar != "none")
			{
				xydiagram.Panes.Clear();
				Debug.WriteLine(String.Format("***************************** After CLEAR # of Panes: {0}", xydiagram.Panes.Count));

				MakePanes(_settings.paneLevels, subtitles);
				AssignSeriesToPane(scatseries, _settings.paneLevels);
			}
			else if (_settings.colorvar != "none")
			{
				//xydiagram.Panes.Clear();
				//Debug.WriteLine(String.Format("***************************** After CLEAR # of Panes: {0}", xydiagram.Panes.Count));
				//MakePanes(_settings.colorLevels, subtitles);
				//AssignSeriesToPane(scatseries, _settings.colorLevels);
			}
			




			//No Additional Panes
			else
			{
				//for (int i = 0; i < chart.Series.Count; i++)
				//{
				//	XYDiagramSeriesViewBase view = (XYDiagramSeriesViewBase)chart.Series[i].View;
				//	view.Pane = xydiagram.DefaultPane;
				//}
			}


		}

		public void MakePanes(List<string> panenames)
		{
			MakePanes(panenames, panenames);
		}
		public void MakePanes(List<string> panenames, List<string> panesubtitles)
		{

		for(int i=0; i < panenames.Count; i++)
			{
				string p = panenames[i];
				string psubtitle = "";
				if (panesubtitles.Count > panenames.Count)
				{
					foreach (string psub in panesubtitles)
					{
						if (psub.StartsWith(String.Format("{0} : ", p))) psubtitle += String.Format("{0}{1}", psub, Environment.NewLine);
					}
				}
				else
				{
					psubtitle = panesubtitles[i];
				}
				// Obtain a diagram and clear its collection of panes.
				XYDiagramPane pane = new XYDiagramPane(p);
				xydiagram.Panes.Add(pane);

				string paneltitle = (p != psubtitle) ? String.Format("{0}{1}{2}", p, Environment.NewLine, psubtitle) : p;
				pane.Title.Text = paneltitle;
				pane.Title.Visibility = DefaultBoolean.True;
				xydiagram.PaneLayout.Direction = _settings.panesLayoutDirection; // PaneLayoutDirection.Horizontal;
				Debug.WriteLine(String.Format("**********************************   # of Panes: {0} {1}", xydiagram.Panes.Count, p));
			}
		}

		public void AssignSeriesToPane(ScatterplotSeries scatseries, List<string> panenames)
		{
			foreach (string p in panenames)
			{
				// check whether series should be added to this pane.
				for (int i = 0; i < chart.Series.Count; i++)
				{
					if (scatseries.list_dxseriespoints[i].panename == p)
					{
						XYDiagramSeriesViewBase view = (XYDiagramSeriesViewBase)chart.Series[i].View;
						view.Pane = xydiagram.Panes[p];
					}
				}
				xydiagram.DefaultPane.Visibility = ChartElementVisibility.Hidden;
			}
		}




		public void FormatChart()
		{
			

			ToolTipRelativePosition pos = new ToolTipRelativePosition();
			pos.OffsetX = -10;
			pos.OffsetY = -10;
			chart.ToolTipOptions.ToolTipPosition = pos;

			string mainTitleText = "";
			try
			{
				//mainTitleText = String.Format("{0}{1}{2} (N={3})"
				//		, _settings.title, Environment.NewLine, corrs.results(CorrPValueMode.CorrWithStars), corrs.n);
				mainTitleText = String.Format("{0} (N={1})"
						, corrs.results(CorrPValueMode.CorrWithStars), corrs.n);
			}
			catch (Exception ex) { }
			//string mainTitleText = ((Math.Abs(corrs.pearson - corrs.spearman)) > .2 ) ?
			//	String.Format("{0}{1} r={3:.00} s={4:.00} N={2}"
			//		, _settings.title, Environment.NewLine, corrs.n, corrs.pearson, corrs.spearman)
			//	: String.Format("{0}{1} r={3:.00} N={2}"
			//		, _settings.title, Environment.NewLine, corrs.n, corrs.pearson, corrs.spearman);

			chart.Width = _settings.W;
			chart.Height = _settings.H;


			//AddTitles(mainTitleText, subtitles, _settings.xaxisvar, _settings.yaxisvar, 10);
			if (subtitles == null )
			{
				AddTitles(mainTitleText, "", _settings.xaxisvar, _settings.yaxisvar, 10);
			}
			else
			{
				if (subtitles.Count > 0 & _settings.panevar == "none")
				{
					AddTitles(mainTitleText, subtitles, _settings.xaxisvar, _settings.yaxisvar, 10);
				}
				else
				{
					AddTitles(mainTitleText, "", _settings.xaxisvar, _settings.yaxisvar, 10);
				}
			}

			chart.BorderOptions.Color = Color.White;

			chart.CustomDrawSeriesPoint += Scatterplot_TransparentPoint;
			//chart.CustomCallback += _dxcharts.Mychart_CustomCallback;

			chart.ToolTipEnabled = DevExpress.Utils.DefaultBoolean.True;
			chart.ToolTipOptions.ShowForPoints = true;

			chart.CrosshairEnabled = DevExpress.Utils.DefaultBoolean.False;
			chart.SaveStateOnCallbacks = true;
			chart.Legend.MarkerMode = LegendMarkerMode.CheckBoxAndMarker;


		}


		#region extras
		public void Jitter(DataTable dataxy, string xvar, string yvar)
		{
			if (_settings.jitter)
			{
				dataxy.JitterColumn(xvar, _settings.jitteramtX);
				dataxy.JitterColumn(yvar, _settings.jitteramtY);
			}
		}



		protected void Scatterplot_TransparentPoint(object sender, CustomDrawSeriesPointEventArgs e)
		{

			(e.SeriesDrawOptions as PointDrawOptions).Color =
				e.SeriesDrawOptions.Color = Color.FromArgb(80, e.SeriesDrawOptions.Color);
			(e.SeriesDrawOptions as PointDrawOptions).Marker.FillStyle.FillMode = FillMode.Solid;

			(e.SeriesDrawOptions as PointDrawOptions).Marker.BorderVisible = false;


			//from https://www.devexpress.com/Support/Center/Question/Details/Q102193/how-to-show-custom-data-in-the-chart-tooltip
			//var dataPoint = (e.SeriesPoint.Tag);
			////The trick is to hide adittional info by html tags
			////e.SeriesPoint.ToolTipHint = e.SeriesPoint.ToolTipHint + "<FONT SIZE=\"1\" COLOR=\"#FFFFFF\">~" + dataPoint + "~</FONT>";
			////e.SeriesPoint.ToolTipHint = e.SeriesPoint.ToolTipHint + " BONUS ID: " + dataPoint + "";
			//e.LabelText = dataPoint.ToString();

		}
		#endregion 
	}





	//public void CreateScatterplot(DataTable mydt) //, string xvar, string yvar, string mytitle, Color mycolor, string colorsby)
	//{

	//	//DataTable dataxy = (_settings.colorvar != "none") ?
	//	//	DataTableExtensions.Data_SelectColumnXY(mydt, _settings.xaxisvar, _settings.yaxisvar, _settings.colorvar) :
	//	//	DataTableExtensions.Data_SelectColumnXY(mydt, _settings.xaxisvar, _settings.yaxisvar);

	//	List<string> othervars = new List<string>();
	//	if (_settings.colorvar != "none") othervars.Add(_settings.colorvar);
	//	if (_settings.panelvar != "none") othervars.Add(_settings.panelvar);

	//	if (_settings.repeatedmeasVarname != null) othervars.Remove(_settings.repeatedmeasVarname);

	//	DataTable dataxy = DataTableExtensions.SelectColumnXY(mydt, _settings.xaxisvar, _settings.yaxisvar, othervars);


	//	List<string> color_levels = (_settings.colorvar == "none") ? 
	//		null : 
	//		dataxy.AsEnumerable().Select(x => x.Field<string>(_settings.colorvar)).Distinct().ToList();
	//	List<string> panel_levels = (_settings.panelvar == "none"
	//		| _settings.panelvar == _settings.repeatedmeasVarname) ?
	//		null :
	//		dataxy.AsEnumerable().Select(x => x.Field<string>(_settings.panelvar)).Distinct().ToList();



	//	//int colorindex = 0;

	//	if (dataxy.Rows.Count > 0)
	//	{

	//		Correlate(dataxy, _settings.xaxisvar, _settings.yaxisvar);
	//		Jitter(dataxy, _settings.xaxisvar, _settings.yaxisvar);


	//	}
	//	else
	//	{
	//		emptymsg = String.Format("0 cases for{3}{0}{3}{1} by {2}", _settings.title, _settings.xaxisvar, _settings.yaxisvar, Environment.NewLine);
	//	}
	//}





	[Serializable]
	public class ScatterplotSeries
	{
		private List<DxSeriesPoints> _list_dxseriespoints;
		private List<Corrs> _list_corrs;

		public List<DxSeriesPoints> list_dxseriespoints { get { return _list_dxseriespoints; } set { _list_dxseriespoints = value; } }
		public List<Corrs> list_corrs { get { return _list_corrs; } set { _list_corrs = value; } }



		public ScatterplotSeries(DataTable dt, DxScatterplotSettings settings)
		{
			CreateSeries(dt, settings);

		}

		//public ScatterplotSeries(DataTable dt, string xvar, string yvar, string colorvar, string panelvar, List<Color> colors, List<string> color_levels)
		//{
		//	CreateSeries(dt, xvar, yvar, colorvar, panelvar, colors, color_levels);
		//}


		private void CreateSeries(DataTable dt, DxScatterplotSettings settings) //, string xvar, string yvar, string colorvar, string panelvar, List<Color> colors, List<string> color_levels)
		{
			_list_corrs = new List<Corrs>();
			_list_dxseriespoints = new List<DxSeriesPoints>();

			//, settings.xaxisvar, settings.yaxisvar, settings.colorvar, settings.panevar, settings.colors, settings.colorLevels);

			List<string> groupvars = new List<string>();
			int panename_idx = -1;
			if (settings.panevar == "none" & settings.colorvar != "none")    //This is different than for Bar
			{
				groupvars = new List<string>() { settings.colorvar };
				panename_idx = 0;
			}
			else if (settings.panevar != "none" & settings.colorvar == "none")
			{
				groupvars = new List<string>() { settings.panevar };
				panename_idx = 0;
			}
			else if (settings.panevar != "none" & settings.colorvar != "none")
			{
				groupvars = new List<string>() { settings.panevar , settings.colorvar};
				panename_idx = 0;
			}

			groupvars = groupvars.Distinct().ToList();

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

					Corrs tmpcorrs = new Corrs(dtSub, settings.xaxisvar, settings.yaxisvar, 2);

					

					_list_corrs.Add(tmpcorrs);

					//List<string> keyvalues = group.Key.Values[0].ToString();
					List<string> keyvalues = new List<string>();
					foreach (var s in group.Key.Values)
					{
						keyvalues.Add(s.ToString());
					}


					DxSeriesPoints pts = new DxSeriesPoints(dtSub, settings.xaxisvar, settings.yaxisvar, settings.colorvar, settings.colors, settings.colorLevels );

					pts.label = String.Join(" : ", keyvalues);

					pts.panename = (panename_idx >= 0) ? keyvalues[panename_idx] : "none";

					_list_dxseriespoints.Add(pts);
				}

			}
			catch (Exception ex)
			{
				throw new Exception("ERROR! qryGroupBy  Msg:" + ex.Message + "............." + ex.StackTrace.ToString());
			}


			//return list_series;
		}


		public List<string> Subtitles()
		{
			List<string> subtitles = new List<string>();
			int counter = 0;
			foreach(Corrs corr in _list_corrs)
			{
				string sub = "";
				string label = _list_dxseriespoints[counter].label;
				if (label != "")
				{
					sub = String.Format("{0}: {1} (N={2})", label, corr.results(CorrPValueMode.CorrWithStars), corr.n);
				}
				else{
					sub = String.Format("{0} (N={1})", corr.results(CorrPValueMode.CorrWithStars), corr.n);
				}
				if(sub != "") subtitles.Add(sub);

				counter++;
			}

			return subtitles;
		}
	}


	public class Corrs
	{
		public string xvar { get; set; }
		public string yvar { get; set; }
		private double _pearson;
		private double _spearman;
		private double _pearson_pvalue;
		private double _spearman_pvalue;
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
		public double pearson_pvalue
		{
			get { return _pearson_pvalue; }
			set { _pearson_pvalue = value; }
		}
		public double spearman_pvalue
		{
			get { return _spearman_pvalue; }
			set { _spearman_pvalue = value; }
		}
		public int n
		{
			get { return _n; }
			set { _n = value; }
		}

		public Corrs(DataTable dataxy, string thexvar, string theyvar, int digits)
		{
			xvar = thexvar;
			yvar = theyvar;

			double[] x = dataxy.AsEnumerable().Select(o => o.Field<double>(xvar)).ToArray();
			double[] y = dataxy.AsEnumerable().Select(o => o.Field<double>(yvar)).ToArray();

			_pearson = Math.Round(uwac.utilStats.Corr(x, y, "pearson"), digits);
			_spearman = Math.Round(uwac.utilStats.Corr(x, y, "Spearman"), digits);

			_n = (x.Length > y.Length) ? y.Length : x.Length;
			//consider adding metanumerics or alglib to get p-values
			//https://github.com/dcwuser/metanumerics 

			double pearson_bothtails = 1;
			double pearson_lefttail = 1;
			double pearson_righttail = 1;
			double spearman_bothtails = 1;
			double spearman_lefttail = 1;
			double spearman_righttail = 1;

			double a1 = alglib.pearsoncorr2(x, y);
			alglib.correlationtests.pearsoncorrelationsignificance(_pearson, _n, ref pearson_bothtails, ref pearson_lefttail, ref pearson_righttail, null);
			alglib.correlationtests.pearsoncorrelationsignificance(_spearman, _n, ref spearman_bothtails, ref spearman_lefttail, ref spearman_righttail, null);

			_pearson_pvalue = pearson_bothtails;
			_spearman_pvalue = spearman_bothtails;

		}

		public string results(CorrPValueMode mode)
		{
			bool OnlyNonparametricIsSig = this.nonparametricEffect();

			if (OnlyNonparametricIsSig)
			{

				string pstars1 = pstars(CorrPValueMode.CorrWithPValue);
				string sstars1 = sstars(CorrPValueMode.CorrWithPValue);

				string tmp = String.Format("{0}, {1}", pstars1, sstars1);
				return tmp;
			}
			else
			{
				return pstars(mode);
			}

			
		}

			public string pstars(CorrPValueMode mode)
		{
			string stars = "";
			if (pearson_pvalue < .001) stars = "***";
			else if (pearson_pvalue < .01) stars = "** ";
			else if (pearson_pvalue < .05) stars = "*  ";

			string output = "";
			if (mode == CorrPValueMode.StarsOnly) output = stars;
			else if (mode == CorrPValueMode.CorrWithStars) output = String.Format("r={0:.00}{1}", pearson, stars);
			else if (mode == CorrPValueMode.CorrWithPValue) output = String.Format("r={0:.00} p={1:.0000}", pearson, pearson_pvalue);
			return output;
		}

		public string sstars(CorrPValueMode mode)
		{
			string stars = "";
			if (spearman_pvalue < .001) stars = "***";
			else if (spearman_pvalue < .01) stars = "** ";
			else if (spearman_pvalue < .05) stars = "*  ";

			string output = "";
			if (mode == CorrPValueMode.StarsOnly) output = stars;
			else if (mode == CorrPValueMode.CorrWithStars) output = String.Format("rho={0:.00}{1}", spearman, stars);
			else if (mode == CorrPValueMode.CorrWithPValue) output = String.Format("rho={0:.00} p={1:.0000}", spearman, spearman_pvalue);
			return output;
		}


		public bool nonparametricEffect()
		{
			return (this.pstars(CorrPValueMode.StarsOnly) == "" &
			this.pstars(CorrPValueMode.StarsOnly) != this.sstars(CorrPValueMode.StarsOnly)) ? true : false;
		}

	}

	public enum CorrPValueMode : int
	{
		StarsOnly = 0,
		CorrWithStars = 1,
		CorrWithPValue = 2
	}

	public class DxScatterplotSettings : DxChartSettings, ICloneable
	{
		private List<string> _xvars;
		private List<string> _yvars;
		private string _repeatedmeasVarname = "none";
		public bool manualXandYvars = false;
		public bool _useMovAvg = false;
		public int _movavgNumPts = 15;
		//public bool _modeA { get; set; }  // Same vars ACROSS time
		//public bool _modeB { get; set; }  // Diff vars WITHIN timept
		//public bool _modeC { get; set; }  // Diff vars ACROSS timept
		public bool _showregline = false;
		public bool _showhist = false;
		public bool _jitter = false;
		public bool _colorsByPane = false;
		public double _jitteramtX = 0;
		public double _jitteramtY = 0;
		public List<string> xvars { get { return _xvars; } set { _xvars = value; } }
		public List<string> yvars { get { return _yvars; } set { _yvars = value; } }
		public string repeatedmeasVarname { get { return _repeatedmeasVarname; } set { _repeatedmeasVarname = value; } }
		public int digits_corr { get; set; }
		public int digits_pvalue { get; set; }
		public DxWideMode widemode { get; set; }
		private double _reglineAlpha = 0.25;
		public double reglineAlpha { get { return _reglineAlpha; } set { _reglineAlpha = value; } }
		public string panevar { get; set; }
		private List<string> _colorLevels;
		public List<string> colorLevels { get { return _colorLevels; } set { _colorLevels = value; } }
		private List<string> _paneLevels;
		public List<string> paneLevels { get { return _paneLevels; } set { _paneLevels = value; } }
		public List<XYpairType> xypairtypes { get; set; }
		public XYpairType current_xypairtype { get; set; }





		public DxScatterplotSettings() {
			digits_corr = 2;
			digits_pvalue = 3;
			panevar = "none";
			SetOutputtype(DxOutputtype.Scatterplot);
		}
		
		public DxScatterplotSettings(DxChartSettings settings) {
			digits_corr = 2;
			digits_pvalue = 3;
			panevar = "none";
			SetOutputtype(DxOutputtype.Scatterplot);
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
		public bool showhist
		{
			get { return _showhist; }
			set { _showhist = value; }
		}
		public bool colorsByPane
		{
			get { return _colorsByPane; }
			set { _colorsByPane = value; }
		}
		public bool showregline
		{
			get { return _showregline; }
			set { _showregline = value; }
		}
		public bool jitter
		{
			get { return _jitter; }
			set { _jitter = value; }
		}
		public double jitteramtX
		{
			get { return _jitteramtX; }
			set { _jitteramtX = value; }
		}
		public double jitteramtY
		{
			get { return (_jitteramtY == 0 ) ? _jitteramtX : _jitteramtY; }
			set { _jitteramtY = value; }
		}

		public object Clone()
		{
			return this.MemberwiseClone();
		}

		public List<string> rptmeasLevels(DataTable dt)
		{
			if (repeatedmeasVarname == "none") return null;
			List<string> levels = dt.AsEnumerable().Select(f => f.Field<string>(repeatedmeasVarname)).Distinct().ToList();
			return levels;
		}


		public List<string> analysisvars()
		{
			List<string> vars = new List<string>();

			if(this.analysisvarsX() == this.analysisvarsY())
			{
				return analysisvarsX();
			}
			else
			{
				vars.AddRange(this.analysisvarsX());
				vars.AddRange(this.analysisvarsY());
				vars = vars.Distinct().ToList();
				return vars;
			}

		}

		public List<string> analysisvarsX()
		{
			List<string> vars = new List<string>();
			if (manualXandYvars & _xvars != null)
			{
				return _xvars;
			}
			else 
			{
				if (numvars != null) vars.AddRange(numvars);
				if (agevars != null) vars.AddRange(agevars);
				return vars;
			}
		}

		public List<string> analysisvarsY()
		{
			List<string> vars = new List<string>();
			if (manualXandYvars & _yvars != null)
			{
				return _yvars;
			}
			else
			{
				if (numvars != null) vars.AddRange(numvars);
				if (agevars != null) vars.AddRange(agevars);
				return vars;
			}
		}


		//public enum  ScatterplotMode
		//{
		//	SameVar_AcrossLevelsOfRptMeas = 0,
		//	DiffVar_WithinLevelsOfRptMeas = 1,
		//	DiffVar_AcrossLevelsOfRptMeas = 2
		//}

	}


	public enum XYpairType : int
	{
		SameVar_AcrossLevelsOfRptMeas = 0,
		DiffVar_WithinLevelsOfRptMeas = 1,
		DiffVar_AcrossLevelsOfRptMeas = 2
	}

}







