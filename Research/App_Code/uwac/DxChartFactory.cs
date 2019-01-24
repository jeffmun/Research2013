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
using System.Drawing.Imaging;
using System.IO;

namespace uwac
{

	/// <summary>
	/// DxChartFactory will produce a list of DxCharts
	/// </summary>
	[Serializable]
	public class DxChartFactory
	{
		//private DxChartOrders _orders;
		private List<DxChartOrder> _orders;
		public List<DxChartOrder> orders { get { return _orders; } set { _orders = value; } }

		//private List<DxBatchOcharts> _batches;
		//public List<DxBatchOcharts> batches { get { return _batches; } set { _batches = value; } }

		private DataTable _dt;

		public int numHist { get { return CountCharts(DxChartType.Histogram); } }
		public int numBar { get { return CountCharts(DxChartType.Barchart); } }
		public int numScat { get { return CountCharts(DxChartType.Scatterplot); } }
		public int numLine { get { return CountCharts(DxChartType.Lineplot); } }



		public DataTable dt { get { return _dt; } set { _dt = value; } }

		public DxChartFactory(DataTable dt, DxChartOrder order)
		{
			//_batches = new List<DxBatchOcharts>();
			_orders = new List<DxChartOrder> { order };
			_dt = dt;
			ProcessOrders();
		}
		public DxChartFactory(DataTable dt, List<DxChartOrder> orders)
		{
			//_batches = new List<DxBatchOcharts> ();
			_orders = orders;
			_dt = dt;
			ProcessOrders();
		}
		public void ProcessOrders()
		{
			foreach(DxChartOrder order in orders)
			{
				ProcessOrder(order);

				//if (order.HasVars())
				//{
				//	ProcessOrder(order);
				//}
				//else{
				//	Debug.WriteLine(" !!!!!!!!!!!! This order has no Vars !!!!!!!!!! ");
				//}

			}
		}


		public void ProcessOrder(DxChartOrder order)
		{
			//Clear any existing batches.
			//It doesn't seem like a WebChartControl can perist in a Session var, so I just recreate them when asked for.
			if (order.batches.Count > 0) order.batches.Clear();   

			//Each order will result in a list of batches
			//List<DxBatchOcharts> batchlist = new List<DxBatchOcharts>();
			List<DxChartBatch> batchlist = new List<DxChartBatch>();

			foreach (DxChartSettings settings in order.list_settings)
			{
				if (settings.ChartType == DxChartType.Histogram)
				{
					DxHistogramSettings mysettings = (DxHistogramSettings)settings;
					DxChartBatch batch = new DxChartBatch(mysettings, dt);
					PrepareBatch(batch, settings);
					batchlist.Add(batch);
				}
				else if (settings.ChartType == DxChartType.Barchart)
				{
					DxBarchartSettings mysettings = (DxBarchartSettings)settings;
					DxChartBatch batch = new DxChartBatch(mysettings, dt);
					PrepareBatch(batch, settings);
					batchlist.Add(batch);
				}
				else if (settings.ChartType == DxChartType.Scatterplot)
				{
					DxScatterplotSettings mysettings = (DxScatterplotSettings)settings;

					if (mysettings.repeatedmeasVarname == "none")
					{
						DxChartBatch batch = new DxChartBatch(mysettings, dt);
						PrepareBatch(batch, settings);
						batchlist.Add(batch);
					}
					else if (mysettings.repeatedmeasVarname != "none")
					{
						List<string> repeatedmeas_levels = dt.AsEnumerable().Select(f => f.Field<string>(mysettings.repeatedmeasVarname)).Distinct().ToList();

						List<string> analysisvars = new List<string>();
						analysisvars.AddRange(mysettings.numvars);
						if (mysettings.agevars != null) analysisvars.AddRange(mysettings.agevars);

						int n_rptmeas = repeatedmeas_levels.Count;
						int n_analysisvars = analysisvars.Count;

						int ncol1 = utilStats.TriangleNumber(n_rptmeas );
						

						List<string> tmpvars = mysettings.analysisvars();
						List<string> tmpvarsX = mysettings.analysisvarsX();
						List<string> tmpvarsY = mysettings.analysisvarsY();


						if (mysettings._modeA)
						{

							mysettings.xypairtype = XYpairType.SameVar_AcrossLevelsOfRptMeas;
							mysettings.maxCol = ncol1;
							//mysettings.maxRow = tmpvars.Count;
							mysettings.chartlayout = DxLayout.Horizontal;
							DxChartBatch batch1 = new DxChartBatch(mysettings, dt);
							PrepareBatch(batch1, (DxChartSettings)mysettings);
							batch1.batchtitle = "Same Variable ACROSS levels of " + mysettings.repeatedmeasVarname;
							batchlist.Add(batch1);
						}

						if (mysettings._modeB)
						{
							//#2 - treat it as square
							mysettings.xypairtype = XYpairType.DiffVar_WithinLevelsOfRptMeas;
							mysettings.numvars = tmpvars;
							mysettings.xvars = null;
							mysettings.yvars = null;

							mysettings.chartlayout = DxLayout.Vertical;
							mysettings.maxRow = tmpvars.Count;
							DxChartBatch batch2 = new DxChartBatch(mysettings, dt);
							PrepareBatch(batch2, (DxChartSettings)mysettings);
							batch2.batchtitle = "Different Variables WITHIN levels of " + mysettings.repeatedmeasVarname;
							batchlist.Add(batch2);

						}

						if (mysettings._modeC)
						{
							//#2 - back to original
							mysettings.xypairtype = XYpairType.DiffVar_AcrossLevelsOfRptMeas;
							mysettings.numvars = tmpvars;
							mysettings.xvars = tmpvarsX;
							mysettings.yvars = tmpvarsY;
							mysettings.manualXandYvars = true;
							DxChartBatch batch3 = new DxChartBatch(mysettings, dt);
							PrepareBatch(batch3, (DxChartSettings)mysettings);
							batch3.batchtitle = "Different Variables ACROSS levels of " + mysettings.repeatedmeasVarname;
							batchlist.Add(batch3);
						}
					}
				}
				else if (settings.ChartType == DxChartType.Actogram )
				{
					DxActogramSettings mysettings = (DxActogramSettings)settings;
					mysettings.ChartType = DxChartType.Actogram;

					List<string> varnames = new List<string>() { "id" };
					varnames.AddRange(mysettings.numvars);
					varnames.Add(mysettings.xaxisvar);
					varnames.Add(mysettings.colorvar);
					varnames.RemoveAll(item => item == "variable");
					varnames.RemoveAll(item => item == "none");


					DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { mysettings.panelvar });

					DxChartBatch batch2 = new DxChartBatch(DxChartType.Actogram, mysettings);

					foreach (DataSubset subset in subsets.subsets)
					{
						mysettings.date_txt = subset.dt.AsEnumerable().Min(f => f.Field<string>("report_date"));

						DxChartBatch subbatch = new DxChartBatch(mysettings, subset.dt, subset.Cols_and_Vals_ToString());

						foreach (DxChart sub in subbatch.charts)
						{
							batch2.charts.Add(sub);
						}
					}
					PrepareBatch(batch2, mysettings);
					batchlist.Add(batch2);


				}
				else if (settings.ChartType == DxChartType.Lineplot)
				{
					DxLineplotSettings mysettings = (DxLineplotSettings)settings;

					//NO Panels
					if (mysettings.panelvar == "none" | mysettings.panelvar == "variable")
					{
						DxChartBatch batch1 = new DxChartBatch(mysettings, dt, " ");
						PrepareBatch(batch1, settings);
						batchlist.Add(batch1);
					}
					else
					{
						List<string> varnames = new List<string>() { "id" };
						varnames.AddRange(mysettings.numvars);
						varnames.Add(mysettings.xaxisvar);
						varnames.Add(mysettings.colorvar);
						varnames.RemoveAll(item => item == "variable");
						varnames.RemoveAll(item => item == "none");


						DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { mysettings.panelvar });

						DxChartBatch batch2 = new DxChartBatch(DxChartType.Lineplot, mysettings);

						foreach (DataSubset subset in subsets.subsets)
						{
							DxChartBatch subbatch = new DxChartBatch(mysettings, subset.dt, subset.Cols_and_Vals_ToString());

							foreach (DxChart sub in subbatch.charts)
							{
								batch2.charts.Add(sub);
							}
						}
						PrepareBatch(batch2, mysettings);
						batchlist.Add(batch2);

					}

				}

			}

			order.batches.AddRange(batchlist);

			//The invoice serves as a table of contents for what was actually created
			order.PrepareInvoice();

		}

		public void PrepareBatch(DxChartBatch batch, DxChartSettings settings)
		{
			if (batch.charts.Count > 0)
			{
				batch.maxCol = settings.maxCol;
				batch.maxRow = settings.maxRow;
				batch.layout = settings.chartlayout;
				foreach (DxChart chart in batch.charts)
				{
					chart.W = settings.W;
					chart.H = settings.H;
				}
			}

		}


		public int CountCharts(DxChartType type)
		{
			int n = 0;
			foreach (DxChartOrder order in orders)
			{
				foreach (DxChartBatch batch in order.batches)
				{
					if (batch.charttype == type)
					{
						n += batch.charts.Count;
					}
				}
			}
			return n;
		}

		public void ChartsToDisk(string path)
		{
			double scaleW = .25f;
			double scaleH = .25f;
			ChartsToDisk(path, scaleW, scaleH);
		}

		public void ChartsToDisk(string path, double scaleW, double scaleH)
		{
			Debug.WriteLine("----- ChartsToDisk !!!!! -----");

			foreach (DxChartOrder order in orders)
			{
				foreach (DxChartBatch batch in order.batches)
				{
					foreach (DxChart chart in batch.charts)
					{
						try
						{
							//chartfiles.Add(chart.guid);
							//string xmlfile = String.Format("{0}{1}.{2}", path, chart.guid, "xml");
							//chart.chart.SaveToFile(xmlfile);
							chart.W = Convert.ToInt32(chart.W * scaleW);
							chart.H = Convert.ToInt32(chart.H * scaleH);

							chart.chart.ExportToImage(String.Format("{0}{1}.{2}", path, chart.guid, "png"), ImageFormat.Png);
						}
						catch (Exception ex) { }
					}
				}
			}
		}


		public void DeleteChartsOnDisk(string path)
		{
			Debug.WriteLine("----- DeleteChartsOnDisk  !!!!! -----");

			foreach (DxChartOrder order in orders)
			{
				foreach (DxChartBatch batch in order.batches)
				{
					foreach (DxChart chart in batch.charts)
					{
						try
						{
							File.Delete(String.Format("{0}{1}.{2}", path, chart.guid, "png"));
						}
						catch (Exception ex) { }
					}
				}
			}
		}



		//public DxBatchOcharts BuildHistograms(DxHistogramSettings settings)
		//{
		//	DxBatchOcharts batch = new DxBatchOcharts();
		//	batch.charttype = DxChartType.Histogram;
		//	batch.chartlayout = settings.chartlayout;
		//	batch.vars = settings.numvars;

		//	settings.numvars.Remove("id");


		//	if (settings.panelvar == "none")
		//	{
		//		foreach(string v in settings.numvars)
		//		{
		//			settings.xaxisvar = v;
		//			DxChart chart = new DxHistogram(settings, dt, v, 0);
		//			batch.charts.Add(chart);
		//		}
		//	}
		//	else  //Yes panels
		//	{
		//		List<string> varnames = new List<string>();
		//		varnames.AddRange(settings.numvars);
		//		varnames.Add(settings.xaxisvar);
		//		varnames.Add(settings.colorvar);
		//		varnames.RemoveAll(item => item == "variable");
		//		varnames.RemoveAll(item => item == "none");


		//		DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { settings.panelvar });

		//		foreach (DataSubset subset in subsets.subsets)
		//		{
		//			foreach (string v in settings.numvars)
		//			{
		//				settings.xaxisvar = v;
		//				DxChart chart = new DxHistogram(settings, subset.dt, v, 0);
		//				chart.AddTitles(subset.Cols_and_Vals_ToString());
		//				batch.charts.Add(chart);
		//			}

		//		}

		//	}

		//	return batch;

		//}

		//public DxBatchOcharts BuildLineplots(DxLineplotSettings settings)
		//{

		//	DxBatchOcharts batch = new DxBatchOcharts();
		//	batch.charttype = DxChartType.Lineplot;
		//	batch.vars = settings.numvars;

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

		//			foreach(DxChart sub in subbatch.charts)
		//			{
		//				batch.charts.Add(sub);
		//			}
		//		}

		//	}

		//	return batch;
		//}

		//public DxBatchOcharts BuildLineplots(DxLineplotSettings settings, DataTable dt, string title)
		//{
		//	DxBatchOcharts batch = new DxBatchOcharts();
		//	batch.charttype = DxChartType.Lineplot;
		//	batch.chartlayout = settings.chartlayout;
		//	batch.vars = settings.numvars;

		//	if (settings.xaxisvar == "variable") //This is just one plot
		//	{
		//		DxChart chart = new DxLineplot(settings, dt);
		//		chart.AddTitles(title);
		//		batch.charts.Add(chart);
		//	}
		//	else
		//	{
		//		//Check to see if "variable" is used in color, if not then loop through all the numvars and create a plot for each
		//		if (settings.colorvar != "variable" & settings.panelvar != "variable")
		//		{
		//			foreach (string v in settings.numvars)
		//			{
		//				settings.yaxisvar = v;
		//				settings.seriesby = "id";
		//				DxChart chart = new DxLineplot(settings, dt);
		//				chart.AddTitles(String.Format("{0} {1}",v,title));
		//				batch.charts.Add(chart);

		//			}
		//		}
		//		// if variable is used as a color
		//		else 
		//		{
		//			DxChart chart = new DxLineplot(settings, dt);
		//			chart.AddTitles(title);
		//			batch.charts.Add(chart);
		//		}

		//	}

		//	return batch;

		//}

		//public DxBatchOcharts BuildActograms(DxLineplotSettings settings, DataTable dt, string title, Actigraph.ActogramStats mystats)
		//{
		//	DxBatchOcharts batch = new DxBatchOcharts();
		//	batch.charttype = DxChartType.Actogram;
		//	batch.chartlayout = settings.chartlayout;
		//	batch.vars = settings.numvars;

		//	if (settings.xaxisvar == "variable") //This is just one plot
		//	{
		//		DxChart chart = new DxActogram(settings, dt, mystats); //, mystats);
		//		chart.AddTitles(title);
		//		batch.charts.Add(chart);
		//	}
		//	else
		//	{
		//		//Check to see if "variable" is used in color, if not then loop through all the numvars and create a plot for each
		//		if (settings.colorvar != "variable" & settings.panelvar != "variable")
		//		{
		//			foreach (string v in settings.numvars)
		//			{
		//				settings.yaxisvar = v;
		//				settings.seriesby = "id";
		//				DxChart chart = new DxActogram(settings, dt, mystats);
		//				chart.AddTitles(String.Format("{0} {1}", v, title));
		//				batch.charts.Add(chart);

		//			}


		//		}
		//		// if variable is used as a color
		//		else
		//		{
		//			DxChart chart = new DxActogram(settings, dt, mystats);
		//			chart.AddTitles(title);
		//			batch.charts.Add(chart);
		//		}

		//	}

		//	return batch;

		//}

		//public DxBatchOcharts BuildBarcharts(DxBarchartSettings settings)
		//{
		//	DxBatchOcharts batch = new DxBatchOcharts();
		//	batch.charttype = DxChartType.Barchart;
		//	batch.chartlayout = settings.chartlayout;
		//	batch.vars = settings.numvars;

		//	settings.numvars.Remove("id");


		//	if (settings.panelvar == "none")
		//	{
		//		DxChart chart = new DxBarchart(settings, dt);
		//		batch.charts.Add(chart);
		//	}
		//	else
		//	{
		//		List<string> varnames = new List<string>();
		//		varnames.AddRange(settings.numvars);
		//		varnames.Add(settings.xaxisvar);
		//		varnames.Add(settings.colorvar);
		//		varnames.RemoveAll(item => item == "variable");
		//		varnames.RemoveAll(item => item == "none");


		//		DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { settings.panelvar });

		//		foreach (DataSubset subset in subsets.subsets)
		//		{
		//			DxChart chart = new DxBarchart(settings, subset.dt);
		//			chart.AddTitles(subset.Cols_and_Vals_ToString());
		//			batch.charts.Add(chart);
		//		}

		//	}

		//	return batch;

		//}

		//public DxBatchOcharts BuildScatterplots(DxScatterplotSettings settings)
		//{
		//	DxBatchOcharts batch = new DxBatchOcharts();
		//	batch.charttype = DxChartType.Scatterplot;
		//	batch.chartlayout = settings.chartlayout;
		//	batch.vars = settings.numvars;


		//	//pairwise
		//	settings.numvars.Remove("id");


		//	bool issquare = true;

		//	if (issquare)
		//	{
		//		for (int i = 0; i < settings.numvars.Count; i++)
		//		{
		//			string x = settings.numvars[i];
		//			for (int j = i ; j < settings.numvars.Count; j++)
		//			//for (int i = counter; i < settings.numvars.Count; i++)
		//			{
		//				string y = settings.numvars[j];
		//				settings.xaxisvar = y; // x;  //test swap
		//				settings.yaxisvar = x; // y;

		//				if(x==y & settings.showhist)
		//				{
		//					DxHistogramSettings local_settingshist = new DxHistogramSettings(settings);
		//					local_settingshist.xaxisvar = x;
		//					if (settings.colorvar != "none")
		//					{
		//						local_settingshist.colorvar = settings.colorvar;
		//					}
		//					local_settingshist.shownormalcurve = true;
		//					local_settingshist.numbins = 15;
		//					local_settingshist.colors = settings.colors;
		//					local_settingshist.title = x;

		//					DxChart chart = new DxHistogram(local_settingshist, dt, x, 0);
		//					chart.isdiag = true;
		//					batch.charts.Add(chart);
		//				}
		//				else if (x != y)
		//				{
		//					DxChart chart = new DxScatterplot(settings, dt);
		//					batch.charts.Add(chart);
		//				}
		//				else
		//				{
		//					//Consider adding a histogram here?
		//				}
		//			}
		//		}
		//	}
		//	else  //NOT square - TODO
		//	{

		//	}

		//	return batch;
		//}


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


	}



}
