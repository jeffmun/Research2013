using System;
using System.Collections.Generic;
using System.Data;
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
	/// Summary description for DxBatchOcharts
	/// </summary>
	public class DxBatchOcharts
	{

		private DxChartSettings _settings;
		private List<DxChart> _charts;
		private List<string> _vars;

		public List<DxChart> charts { get { return _charts; } set { _charts = value; } }
		public List<string> vars { get { return _vars; } set { _vars = value; } }
		public DxChartType charttype { get; set; }
		public DxChartLayout chartlayout { get; set; }
		public int maxRow { get; set; }
		public int maxCol { get; set; }
		public DxChartSettings settings { get; set; }

		public DxBatchOcharts()
		{
			maxCol = 1;
			_charts = new List<DxChart>();
		}


		public void CustomFormatting()
		{
			//if (charttype == DxChartType.Actogram)
			//{
			//	SetXAxisRange_1day();
			//	SetYAxisRange();


			//	foreach (DxChart ch in charts)
			//	{
			//		XYDiagram xy = ch.xydiagram;
			//		xy.AxisX.DateTimeScaleOptions.MeasureUnit = DateTimeMeasureUnit.Hour;
			//		xy.AxisX.DateTimeScaleOptions.GridAlignment = DateTimeGridAlignment.Hour;
			//		xy.AxisX.Label.TextPattern = "{A:t}";

			//		DataRow row = ds.Tables[1].Rows[counter];

			//		Actigraph.ActogramStats stats = new Actigraph.ActogramStats(row);

			//		ch.AnnotateActogram(stats);

			//		counter++;
			//	}
			//}
		}


		public void SetYAxisRange()
		{
			foreach (DxChart mychart in charts)
			{
				if (mychart.chart != null & mychart.isdiag == false)
				{
					mychart.xydiagram.AxisY.WholeRange.SetMinMaxValues(_settings.miny, _settings.maxy);
					mychart.xydiagram.AxisY.VisualRange.SetMinMaxValues(_settings.miny, _settings.maxy);
				}
			}
		}


		public void SetXAxisRange_1day()
		{
			if (charttype == DxChartType.Actogram)
			{
				DateTime minx = Convert.ToDateTime("1900-01-01 12:00:00.000");
				DateTime maxx = Convert.ToDateTime("1900-01-02 11:59:30.000");

				foreach (DxChart mychart in charts)
				{
					if (mychart.chart != null & mychart.isdiag == false)
					{
						mychart.xydiagram.AxisX.WholeRange.SetMinMaxValues(minx, maxx);
						mychart.xydiagram.AxisX.VisualRange.SetMinMaxValues(minx, maxx);
					}
				}
			}
		}


		public void MatchYAxes()
		{

			double miny = 0;
			double maxy = 0;

			foreach (DxChart mychart in charts)
			{
				if (mychart.chart != null & mychart.isdiag == false)
				{



					double? tmp_miny_who = (double?)(mychart.xydiagram.AxisY.WholeRange.MinValue);
					double? tmp_maxy_who = (double?)(mychart.xydiagram.AxisY.WholeRange.MaxValue);
					double? tmp_miny_vis = (double?)(mychart.xydiagram.AxisY.VisualRange.MinValue);
					double? tmp_maxy_vis = (double?)(mychart.xydiagram.AxisY.VisualRange.MaxValue);

					if (tmp_miny_who != null)
					{
						if (miny > tmp_miny_who) miny = (double)tmp_miny_who;
					}
					if (tmp_maxy_who != null)
					{
						if (maxy < tmp_maxy_who) maxy = (double)tmp_maxy_who;
					}
				}
			}

			foreach (DxChart mychart in charts)
			{
				if (mychart.chart != null & mychart.isdiag == false)
				{
					mychart.xydiagram.AxisY.WholeRange.SetMinMaxValues(miny, maxy);
					mychart.xydiagram.AxisY.VisualRange.SetMinMaxValues(miny, maxy);
				}
			}

		}


		public void MatchXAxes_time()
		{

			//DateTime minx = System.DateTime.Now;
			//DateTime maxx = System.DateTime.Now;
			DateTime? minx = null;
			DateTime? maxx = null;

			foreach (DxChart mychart in charts)
			{
				if (mychart.chart != null & mychart.isdiag == false)
				{

					DateTime? tmp_minx_who = (DateTime?)(mychart.xydiagram.AxisX.WholeRange.MinValue);
					DateTime? tmp_maxx_who = (DateTime?)(mychart.xydiagram.AxisX.WholeRange.MaxValue);
					DateTime? tmp_minx_vis = (DateTime?)(mychart.xydiagram.AxisX.VisualRange.MinValue);
					DateTime? tmp_maxx_vis = (DateTime?)(mychart.xydiagram.AxisX.VisualRange.MaxValue);

					if (tmp_minx_who != null)
					{
						if (minx > tmp_minx_who) minx = (DateTime)tmp_minx_who;
					}
					if (tmp_maxx_who != null)
					{
						if (maxx < tmp_maxx_who) maxx = (DateTime)tmp_maxx_who;
					}
				}
			}

			foreach (DxChart mychart in charts)
			{
				if (mychart.chart != null & mychart.isdiag == false)
				{
					mychart.xydiagram.AxisX.WholeRange.SetMinMaxValues(minx, maxx);
					mychart.xydiagram.AxisX.VisualRange.SetMinMaxValues(minx, maxx);
				}
			}

		}



	}



}