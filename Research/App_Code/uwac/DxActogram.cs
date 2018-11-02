using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using uwac;


namespace uwac
{
	/// <summary>
	/// Summary description for DxActogram
	/// </summary>
	public class DxActogram : DxLineplot
	{

		private Actigraph.ActogramStats _stats;
		public Actigraph.ActogramStats stats { get { return _stats; } set { _stats = value; } }

		//public DxLineplotSettings settings { get; set; }
		//public DataTable dt { get; set; }

		public DxActogram(DxLineplotSettings settings, DataTable dt, Actigraph.ActogramStats mystats) : base(settings, dt)
		{
			_stats = mystats;

			//
			// TODO: Add constructor logic here
			//
		}




		public void AnnotateActogram()
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


	public class DxActogramSettings : DxLineplotSettings
	{

		public DxActogramSettings(DxChartSettings settings) : base(settings, DxChartType.Actogram)
		{
		}


	}
}