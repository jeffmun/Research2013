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
	/// A batch is created for each instance of DxChartSettings in a DxChartOrder
	/// </summary>
	public class DxChartBatch
	{

		private DxChartSettings _settings;
		private List<DxChart> _charts = new List<DxChart>();
		private List<string> _vars;

		public List<DxChart> charts { get { return _charts; } set { _charts = value; } }
		public List<string> vars { get { return _vars; } set { _vars = value; } }
		public DxChartType charttype { get; set; }
		public DxChartLayout chartlayout { get; set; }
		public int maxRow { get; set; }
		public int maxCol { get; set; }
		public DxChartSettings settings { get { return _settings; } set { _settings = value; } }

		public DxChartBatch()
		{
			_vars = new List<string>();
			maxCol = 1;
			_charts = new List<DxChart>();
		}

		public DxChartBatch(DxChartType mycharttype, DxChartSettings mysettings)
		{
			_vars = new List<string>();
			maxCol = 1;
			_charts = new List<DxChart>();
			charttype = mycharttype;
			_settings = mysettings;
		}


		public DxChartBatch(DxHistogramSettings mysettings, DataTable dt)
		{
			_settings = (DxChartSettings)mysettings;
			charttype = DxChartType.Histogram;
			chartlayout = mysettings.chartlayout;
			_vars = mysettings.numvars;
			if (mysettings.agevars != null) _vars.AddRange(mysettings.agevars);

			mysettings.numvars.Remove("id");


			if (mysettings.panelvar == "none")
			{
				foreach (string v in _vars)
				{
					mysettings.xaxisvar = v;
					DxChart chart = new DxHistogram(mysettings, dt, v, 0);
					charts.Add(chart);
				}
			}
			else  //Yes panels
			{
				List<string> varnames = new List<string>();
				varnames.AddRange(_vars);
				varnames.Add(mysettings.xaxisvar);
				varnames.Add(mysettings.colorvar);
				varnames.RemoveAll(item => item == "variable");
				varnames.RemoveAll(item => item == "none");


				DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { mysettings.panelvar });

				foreach (DataSubset subset in subsets.subsets)
				{
					foreach (string v in mysettings.numvars)
					{
						settings.xaxisvar = v;
						DxChart chart = new DxHistogram(mysettings, subset.dt, v, 0);
						chart.AddTitles(subset.Cols_and_Vals_ToString());
						charts.Add(chart);
					}

				}

			}

		}


		public DxChartBatch(DxLineplotSettings mysettings, DataTable dt, string title)
		{
			_settings = (DxChartSettings)mysettings;

			charttype = DxChartType.Lineplot;
			chartlayout = mysettings.chartlayout;
			_vars = mysettings.numvars;
			if (mysettings.agevars != null) _vars.AddRange(mysettings.agevars);

			if (mysettings.xaxisvar == "variable") //This is just one plot
			{
				DxChart chart = new DxLineplot(mysettings, dt);
				chart.AddTitles(title);
				charts.Add(chart);
			}
			else
			{
				//Check to see if "variable" is used in color, if not then loop through all the numvars and create a plot for each
				if (mysettings.colorvar != "variable" & mysettings.panelvar != "variable")
				{
					foreach (string v in _vars)
					{
						mysettings.yaxisvar = v;
						mysettings.seriesby = "id";
						DxChart chart = new DxLineplot(mysettings, dt);
						chart.AddTitles(String.Format("{0} {1}", v, title));
						charts.Add(chart);

					}
				}
				// if variable is used as a color
				else
				{
					DxChart chart = new DxLineplot(mysettings, dt);
					chart.AddTitles(title);
					charts.Add(chart);
				}

			}
		}

		public DxChartBatch(DxActogramSettings mysettings, DataTable dt, string title, Actigraph.ActogramStats mystats)
		{
			_settings = (DxChartSettings)mysettings;

			charttype = DxChartType.Actogram;
			chartlayout = mysettings.chartlayout;
			vars = mysettings.numvars;

			if (mysettings.xaxisvar == "variable") //This is just one plot
			{
				DxChart chart = new DxActogram(mysettings, dt, mystats); //, mystats);
				chart.AddTitles(title);
				charts.Add(chart);
			}
			else
			{
				//Check to see if "variable" is used in color, if not then loop through all the numvars and create a plot for each
				if (mysettings.colorvar != "variable" & mysettings.panelvar != "variable")
				{
					foreach (string v in settings.numvars)
					{
						mysettings.yaxisvar = v;
						mysettings.seriesby = "id";
						DxChart chart = new DxActogram(mysettings, dt, mystats);
						chart.AddTitles(String.Format("{0} {1}", v, title));
						charts.Add(chart);

					}


				}
				// if variable is used as a color
				else
				{
					DxChart chart = new DxActogram(mysettings, dt, mystats);
					chart.AddTitles(title);
					charts.Add(chart);
				}

			}

		}

		public DxChartBatch(DxBarchartSettings mysettings, DataTable dt)
		{
			_settings = (DxChartSettings)mysettings;

			charttype = DxChartType.Barchart;
			chartlayout = mysettings.chartlayout;
			_vars = mysettings.numvars;
			if (mysettings.agevars != null) _vars.AddRange(mysettings.agevars);

			mysettings.numvars.Remove("id");


			if (mysettings.panelvar == "none")
			{
				DxChart chart = new DxBarchart(mysettings, dt);
				charts.Add(chart);
			}
			else
			{
				List<string> varnames = new List<string>();
				varnames.AddRange(_vars);
				varnames.Add(mysettings.xaxisvar);
				varnames.Add(mysettings.colorvar);
				varnames.RemoveAll(item => item == "variable");
				varnames.RemoveAll(item => item == "none");


				DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { mysettings.panelvar });

				foreach (DataSubset subset in subsets.subsets)
				{
					DxChart chart = new DxBarchart(mysettings, subset.dt);
					chart.AddTitles(subset.Cols_and_Vals_ToString());
					charts.Add(chart);
				}

			}
		}

		public DxChartBatch(DxScatterplotSettings mysettings, DataTable dt)
		{
			_settings = (DxChartSettings)mysettings;

			charttype = DxChartType.Scatterplot;
			chartlayout = mysettings.chartlayout;

			List<string> tempvars = new List<string>();
			tempvars.AddRange(mysettings.numvars);
			if (mysettings.agevars.Count > 0) tempvars.AddRange(mysettings.agevars);

			//pairwise
			tempvars.Remove("id");

			this._vars = tempvars;

			bool issquare = true;

			if (issquare)
			{

				for (int i = 0; i < tempvars.Count; i++)
				//for (int i = 0; i < settings.numvars.Count; i++)
				{
					string x = tempvars[i];
					for (int j = i; j < tempvars.Count; j++)
					//for (int i = counter; i < settings.numvars.Count; i++)
					{
						string y = tempvars[j];
						settings.xaxisvar = y; // x;  //test swap
						settings.yaxisvar = x; // y;

						if (x == y & mysettings.showhist)
						{
							DxHistogramSettings local_settingshist = new DxHistogramSettings(mysettings);


							local_settingshist.xaxisvar = x;
							if (mysettings.colorvar != "none")
							{
								local_settingshist.colorvar = mysettings.colorvar;
							}
							local_settingshist.shownormalcurve = true;
							local_settingshist.numbins = 15;
							local_settingshist.colors = mysettings.colors;
							local_settingshist.title = x;

							DxChart chart = new DxHistogram(local_settingshist, dt, x, 0);
							chart.isdiag = true;
							charts.Add(chart);
						}
						else if (x != y)
						{
							DxChart chart = new DxScatterplot(mysettings, dt);
							charts.Add(chart);
						}
						else
						{
							//Consider adding a histogram here?
						}
					}
				}
			}
			else  //NOT square - TODO
			{

			}

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


		//public void CustomFormatting()
		//{
		//	//if (charttype == DxChartType.Actogram)
		//	//{
		//	//	SetXAxisRange_1day();
		//	//	SetYAxisRange();


		//	//	foreach (DxChart ch in charts)
		//	//	{
		//	//		XYDiagram xy = ch.xydiagram;
		//	//		xy.AxisX.DateTimeScaleOptions.MeasureUnit = DateTimeMeasureUnit.Hour;
		//	//		xy.AxisX.DateTimeScaleOptions.GridAlignment = DateTimeGridAlignment.Hour;
		//	//		xy.AxisX.Label.TextPattern = "{A:t}";

		//	//		DataRow row = ds.Tables[1].Rows[counter];

		//	//		Actigraph.ActogramStats stats = new Actigraph.ActogramStats(row);

		//	//		ch.AnnotateActogram(stats);

		//	//		counter++;
		//	//	}
		//	//}
		//}

		//public DxBatchOcharts(DataTable dt, DxLineplotSettings settings, DataTable dt, string title)
		//{

		//	charttype = DxChartType.Lineplot;
		//	vars = settings.numvars;

		//	//NO Panels
		//	if (settings.panelvar == "none" | settings.panelvar == "variable")
		//	{
		//		batch = BuildLineplots(settings, dt, " ");
		//	}
		//	else
		//	{
		//		List<string> varnames = new List<string>() { "id" };
		//		varnames.AddRange(settings.numvars);
		//		varnames.Add(settings.xaxisvar);
		//		varnames.Add(settings.colorvar);
		//		varnames.RemoveAll(item => item == "variable");
		//		varnames.RemoveAll(item => item == "none");


		//		DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { settings.panelvar });

		//		foreach (DataSubset subset in subsets.subsets)
		//		{
		//			DxBatchOcharts subbatch = BuildLineplots(settings, subset.dt, subset.Cols_and_Vals_ToString());

		//			foreach (DxChart sub in subbatch.charts)
		//			{
		//				batch.charts.Add(sub);
		//			}
		//		}

		//	}

		//	return batch;
		//}

	}



}
