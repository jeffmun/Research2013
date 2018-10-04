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
		private DxBarchartSettings _settingsbar;	//TOFIX - can this be more generic? use EXTENDS? maybe a decorator on DxChartSettings?
		private DxScatterplotSettings _settingsscat;

		public DataTable dt { get { return _dt; } set { _dt = value; } }
		public DxScatterplotSettings settingsscat { get { return _settingsscat; } set { _settingsscat = value; } }
		public List<DxChart> charts {  get { return _charts; }  }

		public DxChartFactory()
		{ }

		public DxChartFactory(DxChartType charttype, DxScatterplotSettings settings, DataTable dt)
		{
			_charts = new List<DxChart>();
			_charttype = charttype;
			_settingsscat = settings;
			_dt = dt;
			BuildCharts();
		}
		public DxChartFactory(DxChartType charttype, DxBarchartSettings settings, DataTable dt)
		{
			_charts = new List<DxChart>();
			_charttype = charttype;
			_settingsbar = settings;
			_dt = dt;
			BuildCharts();
		}


		public void BuildCharts()
		{


			//List<DxChart> charts = new List<DxChart>();
			if (_charttype == DxChartType.Scatterplot)
			{
				//pairwise
				_settingsscat.numvars.Remove("id");

				_settingsscat.xvars = _settingsscat.numvars.ToList();
				_settingsscat.yvars = _settingsscat.numvars.ToList();

				//_settingsscat.xvars.AddRange(_settingsscat.numvars);
				//_settingsscat.yvars.AddRange(_settingsscat.numvars);

				//_settingsscat.xvars.RemoveAt(_settingsscat.xvars.Count - 1);
				//_settingsscat.yvars.RemoveAt(0);

				int counter = 0;
				foreach (string x in _settingsscat.xvars)
				{
					counter++;
					foreach(string y in _settingsscat.yvars)
					//for (int i = counter; i < _settingsscat.numvars.Count; i++)
					{
						_settingsscat.xaxisvar = x;
						_settingsscat.yaxisvar = y;

						if (x != y)
						{
							DxChart chart = new DxScatterplot(_settingsscat, dt);
							_charts.Add(chart);
						} else {
							//Consider adding a histogram here?
						}
					}
				}
			}
			if (_charttype == DxChartType.Barchart)
			{

				//if (_settingsbar.colorvar == "variable" || _settingsbar.panelvar=="variable")
				//{
				//	List<string> vars_to_keep = new List<string>();
				//	vars_to_keep.Add(_settingsbar.colorvar);
				//	vars_to_keep.Add(_settingsbar.panelvar);
				//	vars_to_keep.Add("id");
				//	vars_to_keep.Remove("variable");
				//	vars_to_keep.Remove("none");
				//	dt = DataTableExtensions.StackData(dt, vars_to_keep, _settingsbar.numvars);
				//}
				_settingsbar.numvars.Remove("id");


				if (_settingsbar.panelvar == "none")
				{
					DxChart chart = new DxBarchart(_settingsbar, dt);
					_charts.Add(chart);
				}
				else
				{
					List<string> varnames = new List<string>();
					varnames.AddRange(_settingsbar.numvars);
					varnames.Add(_settingsbar.xaxisvar);
					varnames.Add(_settingsbar.colorvar);
					varnames.RemoveAll(item => item == "variable");
					varnames.RemoveAll(item => item == "none");


					DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { _settingsbar.panelvar });	

					foreach(DataSubset subset in subsets.subsets)
					{
						DxChart chart = new DxBarchart(_settingsbar, subset.dt);
						chart.AddTitles(subset.Cols_and_Vals_ToString());
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
