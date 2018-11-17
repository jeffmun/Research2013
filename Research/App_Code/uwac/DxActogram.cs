using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using DevExpress.XtraCharts;
using uwac;


namespace uwac
{
	/// <summary>
	/// Summary description for DxActogram
	/// </summary>
	public class DxActogram : DxLineplot
	{
		private List<MarkerKind> _markers;
		private DxActogramSettings _settings;
		//private DxLineplotSettings _settings;
		private Actigraph.ActogramStats _stats;
		public Actigraph.ActogramStats stats { get { return _stats; } set { _stats = value; } }

		//public DxLineplotSettings settings { get; set; }
		//public DataTable dt { get; set; }

		//public DxActogram(DxLineplotSettings settings, DataTable dt, Actigraph.ActogramStats mystats) : base(settings, dt)
		//{
		//	_stats = mystats;

		//	//
		//	// TODO: Add constructor logic here
		//	//
		//}

		public DxActogram(DxActogramSettings settings, DataTable dt) : base((DxLineplotSettings)settings, dt)
		{
			_settings = (DxActogramSettings)settings;
			_markers = new DxMarkerKinds();
		}

		public DxActogram(DxLineplotSettings settings, DataTable dt, Actigraph.ActogramStats mystats) : base((DxLineplotSettings)settings, dt)
		{
			_settings = (DxActogramSettings)settings; 
			_stats = mystats;
			_markers = new DxMarkerKinds();
		}


		public void AnnotateActogram(Actigraph.ActogramStats _stats)
		{
			int y_sun = 30;

			AddStrip_date("Rest", Color.Aquamarine, _stats.rest_starttime_chart, _stats.rest_endtime_chart);
			AddStrip_date("Sleep", Color.LightSkyBlue, _stats.sleep_starttime_chart, _stats.sleep_endtime_chart);

			AddSunsetSunrise(_stats.sunset, _stats.sunrise, y_sun);

			DateTime xpos1 = Convert.ToDateTime("1900-01-01 21:30:00");
			DateTime xpos2 = Convert.ToDateTime("1900-01-02 02:20:00");
			int ypos1 = 95;
			int yinterval = -12;

			AddTextAnnotation(String.Format("Hrs Sleep: {0}", _stats.hrssleep), xpos1, ypos1 + (0 * yinterval), 9, Color.Black);
			AddTextAnnotation(String.Format("Hrs In Bed: {0}", _stats.hrsinbed), xpos1, ypos1 + (1 * yinterval), 9, Color.Black);

			AddTextAnnotation(String.Format("Onset Latency: {0} mins", _stats.onsetlatency), xpos2, ypos1 + (0 * yinterval), 9, Color.Black);
			AddTextAnnotation(String.Format("WASO: {0} mins", _stats.waso), xpos2, ypos1 + (1 * yinterval), 9, Color.Black);
			AddTextAnnotation(String.Format("Effic: {0}%", _stats.efficiency), xpos2, ypos1 + (2 * yinterval), 9, Color.Black);

			AddTextAnnotation(String.Format("# Awakenings: {0}", _stats.numwakebouts), xpos2, ypos1 + (3 * yinterval), 9, Color.Black);

		}

		public void AddSunsetSunrise(DateTime sunset, DateTime sunrise, int y)
		{
			this.AddStrip_date("Sunset", Color.Magenta, sunset, sunset.AddMinutes(2));
			this.AddStrip_date("Sunrise", Color.DarkOrange, sunrise, sunrise.AddMinutes(2));

			AddTextAnnotation(String.Format("Sunset: {0}", sunset.ToShortTimeString()), sunset, y, 8, 270, Color.DarkMagenta);
			AddTextAnnotation(String.Format("Sunrise: {0}", sunrise.ToShortTimeString()), sunrise, y, 8, 270, Color.OrangeRed);
		}

	}


	//public class DxActogramSettings : DxLineplotSettings
	//{
	//	private List<string> _xvars;
	//	private List<string> _yvars;
	//	private string _seriesby;
	//	private bool _xaxis_is_date = false;
	//	private bool _xaxis_is_age = false;
	//	private bool _showLegend = true;
	//	private bool _matchYAxes = true;
	//	private LineplotGeom _geom = LineplotGeom.Line;
	//	private LineplotGeom _altgeom = LineplotGeom.Circle;
	//	private List<string> _vars_for_altgeom = new List<string>();

	//	private LineplotGeom _activegeom;

	//	private string _legend_pos_h;
	//	private string _legend_pos_v;

	//	public string seriesby { get { return _seriesby; } set { _seriesby = value; } }
	//	public List<string> xvars { get { return _xvars; } set { _xvars = value; } }
	//	public List<string> yvars { get { return _yvars; } set { _yvars = value; } }
	//	public bool xaxis_is_date { get { return _xaxis_is_date; } set { _xaxis_is_date = value; } }
	//	public bool xaxis_is_age { get { return _xaxis_is_age; } set { _xaxis_is_age = value; } }
	//	public bool showLegend { get { return _showLegend; } set { _showLegend = value; } }
	//	public string legend_pos_h { get { return _legend_pos_h; } set { _legend_pos_h = value; } }
	//	public string legend_pos_v { get { return _legend_pos_v; } set { _legend_pos_v = value; } }
	//	public bool matchYAxes { get { return _matchYAxes; } set { _matchYAxes = value; } }
	//	public LineplotGeom geom { get { return _geom; } set { _geom = value; } }
	//	public LineplotGeom altgeom { get { return _altgeom; } set { _altgeom = value; } }
	//	public LineplotGeom activegeom { get { return _activegeom; } set { _activegeom = value; } }
	//	public List<string> vars_for_altgeom { get { return _vars_for_altgeom; } set { _vars_for_altgeom = value; } }


	public class DxActogramSettings : DxLineplotSettings
	{
		public DxActogramSettings()
		{
			SetChartType(DxChartType.Actogram);
		}
		public DxActogramSettings(DxChartSettings settings)
		{
			SetChartType(DxChartType.Actogram);
		}
		public DxActogramSettings(DxChartSettings settings, DxChartType charttype)
		{
			SetChartType(charttype);
		}

	}


}