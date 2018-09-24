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
	/// DxChartFactory will produce a list of DxCharts
	/// </summary>
	public class DxChartFactory
	{
		private List<DxChart> _charts;
		private DxChartType _charttype;
		private DataTable _dt;
		private DxScatterplotSettings _settings;

		public DataTable dt { get { return _dt; } set { _dt = value; } }
		public DxScatterplotSettings settings { get { return _settings; } set { _settings = value; } }
		public List<DxChart> charts {  get { return _charts; }  }

		public DxChartFactory()
		{ }
		public DxChartFactory(DxChartType charttype, DxScatterplotSettings settings, DataTable dt)
		{
			_charts = new List<DxChart>();
			_charttype = charttype;
			_settings = settings;
			_dt = dt;

			BuildCharts();

		}

		public void BuildCharts()
		{
			//List<DxChart> charts = new List<DxChart>();
			if (_charttype == DxChartType.Scatterplot)
			{
				//pairwise

				_settings.numvars.Remove("id");

				int counter = 0;
				foreach (string v in _settings.numvars)
				{
					counter++;
					for (int i = counter; i < _settings.numvars.Count; i++)
					{
						_settings.xaxisvar = v;
						_settings.yaxisvar = _settings.numvars[i];

						DxChart chart = new DxScatterplot(settings, dt);
						_charts.Add(chart);
					}
				}
			}

		}

		protected void MatchYAxes()
		{

			double miny = 0;
			double maxy = 0;

			foreach (DxChart mychart in _charts)
			{
				if (mychart.chart != null)
				{
					double tmp_miny_who = (double)((XYDiagram)mychart.chart.Diagram).AxisY.WholeRange.MinValue;
					double tmp_maxy_who = (double)((XYDiagram)mychart.chart.Diagram).AxisY.WholeRange.MaxValue;

					double tmp_miny_vis = (double)((XYDiagram)mychart.chart.Diagram).AxisY.VisualRange.MinValue;
					double tmp_maxy_vis = (double)((XYDiagram)mychart.chart.Diagram).AxisY.VisualRange.MaxValue;


					if (miny > tmp_miny_who) miny = tmp_miny_who;
					if (maxy < tmp_maxy_who) maxy = tmp_maxy_who;
				}
			}

			foreach (DxChart mychart in _charts)
			{
				if (mychart.chart != null)
				{
					((XYDiagram)mychart.chart.Diagram).AxisY.WholeRange.SetMinMaxValues(miny, maxy);
					((XYDiagram)mychart.chart.Diagram).AxisY.VisualRange.SetMinMaxValues(miny, maxy);
				}
			}

		}


	}
}
