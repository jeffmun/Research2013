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
	[Serializable]
	public class DxChartFactory
	{
		private DxChartOrders _orders;
		private List<DxBatchOcharts> _batches;
		private DataTable _dt;


		public DxChartOrders orders { get { return _orders; } set { _orders = value; } }
		public List<DxBatchOcharts> batches { get { return _batches; } set { _batches = value; } }

		public DataTable dt { get { return _dt; } set { _dt = value; } }

		public DxChartFactory(DataTable dt, DxChartOrder order)
		{
			_batches = new List<DxBatchOcharts>();
			_orders = new DxChartOrders() { order };
			_dt = dt;
			ProcessOrders();
		}
		public DxChartFactory(DataTable dt, DxChartOrders orders)
		{
			_batches = new List<DxBatchOcharts> ();
			_orders = orders;
			_dt = dt;
			ProcessOrders();
		}
		public void ProcessOrders()
		{
			foreach(DxChartOrder order in orders)
			{
				ProcessOrder(order);
			}
		}
			public void ProcessOrder(DxChartOrder order)
		{

			if (order.settingshist != null)
			{
				DxBatchOcharts batch = BuildHistograms(order.settingshist);
				AddBatch(batch, order.settingshist);
			}
			if (order.settingsbar != null)
			{
				DxBatchOcharts batch = BuildBarcharts(order.settingsbar);
				
				AddBatch(batch, order.settingsbar);
			}

			if (order.settingsline != null)
			{
				DxBatchOcharts batch = BuildLineplots(order.settingsline);
				AddBatch(batch, order.settingsline);
			}

			if (order.settingsscat != null)
			{
				DxBatchOcharts batch = BuildScatterplots(order.settingsscat);
				AddBatch(batch, order.settingsscat);
			}
		}

		public DxBatchOcharts BuildHistograms(DxHistogramSettings settings)
		{
			DxBatchOcharts batch = new DxBatchOcharts();
			batch.charttype = DxChartType.Histogram;
			batch.chartlayout = settings.chartlayout;
			batch.vars = settings.numvars;

			settings.numvars.Remove("id");


			if (settings.panelvar == "none")
			{
				foreach(string v in settings.numvars)
				{
					settings.xaxisvar = v;
					DxChart chart = new DxHistogram(settings, dt, v, 0);
					batch.charts.Add(chart);
				}
			}
			else  //Yes panels
			{
				List<string> varnames = new List<string>();
				varnames.AddRange(settings.numvars);
				varnames.Add(settings.xaxisvar);
				varnames.Add(settings.colorvar);
				varnames.RemoveAll(item => item == "variable");
				varnames.RemoveAll(item => item == "none");


				DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { settings.panelvar });

				foreach (DataSubset subset in subsets.subsets)
				{
					foreach (string v in settings.numvars)
					{
						settings.xaxisvar = v;
						DxChart chart = new DxHistogram(settings, subset.dt, v, 0);
						chart.AddTitles(subset.Cols_and_Vals_ToString());
						batch.charts.Add(chart);
					}

				}

			}

			return batch;

		}

		public DxBatchOcharts BuildLineplots(DxLineplotSettings settings)
		{

			DxBatchOcharts batch = new DxBatchOcharts();
			batch.charttype = DxChartType.Lineplot;
			batch.vars = settings.numvars;

			//NO Panels
			if (settings.panelvar == "none" | settings.panelvar == "variable")
			{
				batch = BuildLineplots(settings, dt, " ");
			}
			else 
			{
				List<string> varnames = new List<string>() { "id" };
				varnames.AddRange(settings.numvars);
				varnames.Add(settings.xaxisvar);
				varnames.Add(settings.colorvar);
				varnames.RemoveAll(item => item == "variable");
				varnames.RemoveAll(item => item == "none");

				
				DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { settings.panelvar });

				foreach (DataSubset subset in subsets.subsets)
				{
					DxBatchOcharts subbatch = BuildLineplots(settings, subset.dt, subset.Cols_and_Vals_ToString());

					foreach(DxChart sub in subbatch.charts)
					{
						batch.charts.Add(sub);
					}
				}

			}

			return batch;
		}

		public DxBatchOcharts BuildLineplots(DxLineplotSettings settings, DataTable dt, string title)
		{
			DxBatchOcharts batch = new DxBatchOcharts();
			batch.charttype = DxChartType.Lineplot;
			batch.chartlayout = settings.chartlayout;
			batch.vars = settings.numvars;

			if (settings.xaxisvar == "variable") //This is just one plot
			{
				DxChart chart = new DxLineplot(settings, dt);
				chart.AddTitles(title);
				batch.charts.Add(chart);
			}
			else
			{
				//Check to see if "variable" is used in color, if not then loop through all the numvars and create a plot for each
				if (settings.colorvar != "variable" & settings.panelvar != "variable")
				{
					foreach (string v in settings.numvars)
					{
						settings.yaxisvar = v;
						settings.seriesby = "id";
						DxChart chart = new DxLineplot(settings, dt);
						chart.AddTitles(String.Format("{0} {1}",v,title));
						batch.charts.Add(chart);

					}
				}
				// if variable is used as a color
				else 
				{
					DxChart chart = new DxLineplot(settings, dt);
					chart.AddTitles(title);
					batch.charts.Add(chart);
				}

			}

			return batch;

		}

		public DxBatchOcharts BuildActograms(DxLineplotSettings settings, DataTable dt, string title, Actigraph.ActogramStats mystats)
		{
			DxBatchOcharts batch = new DxBatchOcharts();
			batch.charttype = DxChartType.Lineplot;
			batch.chartlayout = settings.chartlayout;
			batch.vars = settings.numvars;

			if (settings.xaxisvar == "variable") //This is just one plot
			{
				DxChart chart = new DxLineplot(settings, dt); //, mystats);
				chart.AddTitles(title);
				batch.charts.Add(chart);
			}
			else
			{
				//Check to see if "variable" is used in color, if not then loop through all the numvars and create a plot for each
				if (settings.colorvar != "variable" & settings.panelvar != "variable")
				{
					foreach (string v in settings.numvars)
					{
						settings.yaxisvar = v;
						settings.seriesby = "id";
						DxChart chart = new DxLineplot(settings, dt);
						chart.AddTitles(String.Format("{0} {1}", v, title));
						batch.charts.Add(chart);

					}


				}
				// if variable is used as a color
				else
				{
					DxChart chart = new DxLineplot(settings, dt);
					chart.AddTitles(title);
					batch.charts.Add(chart);
				}

			}

			return batch;

		}

		public DxBatchOcharts BuildBarcharts(DxBarchartSettings settings)
		{
			DxBatchOcharts batch = new DxBatchOcharts();
			batch.charttype = DxChartType.Barchart;
			batch.chartlayout = settings.chartlayout;
			batch.vars = settings.numvars;

			settings.numvars.Remove("id");


			if (settings.panelvar == "none")
			{
				DxChart chart = new DxBarchart(settings, dt);
				batch.charts.Add(chart);
			}
			else
			{
				List<string> varnames = new List<string>();
				varnames.AddRange(settings.numvars);
				varnames.Add(settings.xaxisvar);
				varnames.Add(settings.colorvar);
				varnames.RemoveAll(item => item == "variable");
				varnames.RemoveAll(item => item == "none");


				DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { settings.panelvar });

				foreach (DataSubset subset in subsets.subsets)
				{
					DxChart chart = new DxBarchart(settings, subset.dt);
					chart.AddTitles(subset.Cols_and_Vals_ToString());
					batch.charts.Add(chart);
				}

			}

			return batch;

		}

		public DxBatchOcharts BuildScatterplots(DxScatterplotSettings settings)
		{
			DxBatchOcharts batch = new DxBatchOcharts();
			batch.charttype = DxChartType.Scatterplot;
			batch.chartlayout = settings.chartlayout;
			batch.vars = settings.numvars;


			//pairwise
			settings.numvars.Remove("id");


			bool issquare = true;

			if (issquare)
			{
				for (int i = 0; i < settings.numvars.Count; i++)
				{
					string x = settings.numvars[i];
					for (int j = i ; j < settings.numvars.Count; j++)
					//for (int i = counter; i < settings.numvars.Count; i++)
					{
						string y = settings.numvars[j];
						settings.xaxisvar = y; // x;  //test swap
						settings.yaxisvar = x; // y;

						if(x==y & settings.showhist)
						{
							DxHistogramSettings local_settingshist = new DxHistogramSettings(settings);
							local_settingshist.xaxisvar = x;
							if (settings.colorvar != "none")
							{
								local_settingshist.colorvar = settings.colorvar;
							}
							local_settingshist.shownormalcurve = true;
							local_settingshist.numbins = 15;
							local_settingshist.colors = settings.colors;
							local_settingshist.title = x;

							DxChart chart = new DxHistogram(local_settingshist, dt, x, 0);
							chart.isdiag = true;
							batch.charts.Add(chart);
						}
						else if (x != y)
						{
							DxChart chart = new DxScatterplot(settings, dt);
							batch.charts.Add(chart);
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

			return batch;
		}

		public void AddBatch(DxBatchOcharts batch, DxChartSettings settings)
		{
			if (batch.charts.Count > 0)
			{
				batch.maxCol = settings.maxCol;
				batch.maxRow = settings.maxRow;
				batch.chartlayout = settings.chartlayout;
				foreach (DxChart chart in batch.charts)
				{
					chart.W = settings.W;
					chart.H = settings.H;
				}
				_batches.Add(batch);
			}

		}


		//public void SetYAxisRange(DxBatchOcharts batch, DxChartSettings settings)
		//{
		//	foreach (DxChart mychart in batch.charts)
		//	{
		//		if (mychart.chart != null & mychart.isdiag == false)
		//		{
		//			mychart.xydiagram.AxisY.WholeRange.SetMinMaxValues(settings.miny, settings.maxy);
		//			mychart.xydiagram.AxisY.VisualRange.SetMinMaxValues(settings.miny, settings.maxy);
		//		}
		//	}
		//}


		//public void SetXAxisRange_1day(DxBatchOcharts batch)
		//{
		//	DateTime minx = Convert.ToDateTime("1900-01-01 12:00:00.000");
		//	DateTime maxx = Convert.ToDateTime("1900-01-02 11:59:30.000");

		//	foreach (DxChart mychart in batch.charts)
		//	{
		//		if (mychart.chart != null & mychart.isdiag == false)
		//		{
		//			mychart.xydiagram.AxisX.WholeRange.SetMinMaxValues(minx, maxx);
		//			mychart.xydiagram.AxisX.VisualRange.SetMinMaxValues(minx, maxx);
		//		}
		//	}
		//}


		//public void MatchYAxes(DxBatchOcharts batch)
		//{

		//	double miny = 0;
		//	double maxy = 0;

		//	foreach (DxChart mychart in batch.charts)
		//	{
		//		if (mychart.chart != null & mychart.isdiag == false)
		//		{



		//			double? tmp_miny_who = (double?)(mychart.xydiagram.AxisY.WholeRange.MinValue);
		//			double? tmp_maxy_who = (double?)(mychart.xydiagram.AxisY.WholeRange.MaxValue);
		//			double? tmp_miny_vis = (double?)(mychart.xydiagram.AxisY.VisualRange.MinValue);
		//			double? tmp_maxy_vis = (double?)(mychart.xydiagram.AxisY.VisualRange.MaxValue);

		//			if(tmp_miny_who != null)
		//			{
		//				if (miny > tmp_miny_who) miny = (double)tmp_miny_who;
		//			}
		//			if (tmp_maxy_who != null)
		//			{
		//				if (maxy < tmp_maxy_who) maxy = (double)tmp_maxy_who;
		//			}
		//		}
		//	}

		//	foreach (DxChart mychart in batch.charts)
		//	{
		//		if (mychart.chart != null & mychart.isdiag==false)
		//		{
		//			mychart.xydiagram.AxisY.WholeRange.SetMinMaxValues(miny, maxy);
		//			mychart.xydiagram.AxisY.VisualRange.SetMinMaxValues(miny, maxy);
		//		}
		//	}

		//}


		//public void MatchXAxes_time(DxBatchOcharts batch)
		//{

		//	//DateTime minx = System.DateTime.Now;
		//	//DateTime maxx = System.DateTime.Now;
		//	DateTime? minx = null;
		//	DateTime? maxx = null;

		//	foreach (DxChart mychart in batch.charts)
		//	{
		//		if (mychart.chart != null & mychart.isdiag == false)
		//		{

		//			DateTime? tmp_minx_who = (DateTime?)(mychart.xydiagram.AxisX.WholeRange.MinValue);
		//			DateTime? tmp_maxx_who = (DateTime?)(mychart.xydiagram.AxisX.WholeRange.MaxValue);
		//			DateTime? tmp_minx_vis = (DateTime?)(mychart.xydiagram.AxisX.VisualRange.MinValue);
		//			DateTime? tmp_maxx_vis = (DateTime?)(mychart.xydiagram.AxisX.VisualRange.MaxValue);

		//			if (tmp_minx_who != null)
		//			{
		//				if (minx > tmp_minx_who) minx = (DateTime)tmp_minx_who;
		//			}
		//			if (tmp_maxx_who != null)
		//			{
		//				if (maxx < tmp_maxx_who) maxx = (DateTime)tmp_maxx_who;
		//			}
		//		}
		//	}

		//	foreach (DxChart mychart in batch.charts)
		//	{
		//		if (mychart.chart != null & mychart.isdiag == false)
		//		{
		//			mychart.xydiagram.AxisX.WholeRange.SetMinMaxValues(minx, maxx);
		//			mychart.xydiagram.AxisX.VisualRange.SetMinMaxValues(minx, maxx);
		//		}
		//	}

		//}




		public int CountCharts(DxChartType type)
		{
			int n = 0;
			foreach (DxBatchOcharts batch in _batches)
			{
				if (batch.charttype == type)
				{
					n = batch.charts.Count;
				}
			}
			return n;
		}

	}
}
