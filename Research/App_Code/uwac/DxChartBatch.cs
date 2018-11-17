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
		private List<DataTable> _datatables = new List<DataTable>();
		private List<string> _vars;

		public List<DxChart> charts { get { return _charts; } set { _charts = value; } }
		public List<DataTable> datatables { get { return _datatables; } set { _datatables = value; } }
		public List<string> vars { get { return _vars; } set { _vars = value; } }
		public DxChartType charttype { get; set; }
		public DxChartLayout chartlayout { get; set; }
		public int maxRow { get; set; }
		public int maxCol { get; set; }
		public DxChartSettings settings { get { return _settings; } set { _settings = value; } }

		public void Initialize()
		{
			_vars = new List<string>();
			_datatables = new List<DataTable>();
			_charts = new List<DxChart>();
			maxCol = 1;

		}

		public DxChartBatch()
		{
			Initialize();
		}

		public DxChartBatch(DxChartType mycharttype, DxChartSettings mysettings)
		{
			Initialize();
			charttype = mycharttype;
			_settings = mysettings;
		}


		public DxChartBatch(DxHistogramSettings mysettings, DataTable dt)
		{
			Initialize();
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

		public DxChartBatch(DxActogramSettings mysettings, DataTable dt, string title)
		{
			Initialize();

			_settings = (DxChartSettings)mysettings;

			charttype = DxChartType.Actogram;
			chartlayout = mysettings.chartlayout;
			_vars = mysettings.numvars;

			DxChart chart = new DxActogram(mysettings, dt);
			chart.AddTitles(title);
			charts.Add(chart);


			//if ( mysettings.panelvar != "variable")
			//{
			//	foreach (string v in _vars)
			//	{
			//		mysettings.yaxisvar = v;
			//		mysettings.seriesby = "id";
			//		DxChart chart = new DxActogram(mysettings, dt); //: new DxLineplot(mysettings, dt);
			//		chart.AddTitles(String.Format("{0} {1}", v, title));
			//		charts.Add(chart);

			//	}
			//}
			
		}



		public DxChartBatch(DxLineplotSettings mysettings, DataTable dt, string title)
		{
			Initialize();

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
						DxChart chart =  new DxLineplot(mysettings, dt);
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


		//public DxChartBatch(DxActogramSettings mysettings, DataTable dt, string title, Actigraph.ActogramStats mystats)
		//{
		//	Initialize();

		//	_settings = (DxChartSettings)mysettings;

		//	charttype = DxChartType.Actogram;
		//	chartlayout = mysettings.chartlayout;
		//	vars = mysettings.numvars;

		//	if (mysettings.xaxisvar == "variable") //This is just one plot
		//	{
		//		DxChart chart = new DxActogram(mysettings, dt, mystats); //, mystats);
		//		chart.AddTitles(title);
		//		charts.Add(chart);
		//	}
		//	else
		//	{
		//		//Check to see if "variable" is used in color, if not then loop through all the numvars and create a plot for each
		//		if (mysettings.colorvar != "variable" & mysettings.panelvar != "variable")
		//		{
		//			foreach (string v in settings.numvars)
		//			{
		//				mysettings.yaxisvar = v;
		//				mysettings.seriesby = "id";
		//				DxChart chart = new DxActogram(mysettings, dt, mystats);
		//				chart.AddTitles(String.Format("{0} {1}", v, title));
		//				charts.Add(chart);

		//			}


		//		}
		//		// if variable is used as a color
		//		else
		//		{
		//			DxChart chart = new DxActogram(mysettings, dt, mystats);
		//			chart.AddTitles(title);
		//			charts.Add(chart);
		//		}

		//	}

		//}

		//need to get stats first!
		public DxChartBatch(DxBarchartSettings mysettings, DataTable dt)
		{
			Initialize();

			_settings = (DxChartSettings)mysettings;

			charttype = DxChartType.Barchart;
			chartlayout = mysettings.chartlayout;
			_vars = mysettings.numvars;
			if (mysettings.agevars != null) _vars.AddRange(mysettings.agevars);

			mysettings.numvars.Remove("id");


			if (mysettings.panelvar == "none")
			{
				DxBarchart chart = new DxBarchart(mysettings, dt);
				charts.Add(chart);
				_datatables.Add(chart.statstable.dt);
			}
			else
			{
				List<string> grpvarnames = new List<string>();
				grpvarnames.Add(mysettings.xaxisvar);
				grpvarnames.Add(mysettings.colorvar);
				grpvarnames.Add(mysettings.panelvar);
				grpvarnames.RemoveAll(item => item == "variable");
				grpvarnames.RemoveAll(item => item == "none");


				DescStats stats = new DescStats(dt, _vars, grpvarnames);


				DxBarchart chart = new DxBarchart(mysettings, stats);

				//chart.AddTitles(subset.Cols_and_Vals_ToString());
				charts.Add(chart);

				//fix?
				//_datatables.Add(chart.statstable.dt);

			}
		}

		//WORKS but not for variable as a panel var
		//public DxChartBatch(DxBarchartSettings mysettings, DataTable dt)
		//{
		//	Initialize();

		//	_settings = (DxChartSettings)mysettings;

		//	charttype = DxChartType.Barchart;
		//	chartlayout = mysettings.chartlayout;
		//	_vars = mysettings.numvars;
		//	if (mysettings.agevars != null) _vars.AddRange(mysettings.agevars);

		//	mysettings.numvars.Remove("id");


		//	if (mysettings.panelvar == "none")
		//	{
		//		DxBarchart chart = new DxBarchart(mysettings, dt);
		//		charts.Add(chart);
		//		_datatables.Add(chart.statstable.dt);
		//	}
		//	else
		//	{
		//		List<string> varnames = new List<string>();
		//		varnames.AddRange(_vars);
		//		varnames.Add(mysettings.xaxisvar);
		//		varnames.Add(mysettings.colorvar);
		//		varnames.RemoveAll(item => item == "variable");
		//		varnames.RemoveAll(item => item == "none");

		//		DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { mysettings.panelvar });

		//		foreach (DataSubset subset in subsets.subsets)
		//		{
		//			DxBarchart chart = new DxBarchart(mysettings, subset.dt);

		//			//DxChart chart = new DxBarchart(mysettings, subset.dt);
		//			chart.AddTitles(subset.Cols_and_Vals_ToString());
		//			charts.Add(chart);

		//			_datatables.Add(chart.statstable.dt);
		//		}

		//	}
		//}

		public DxChartBatch(DxScatterplotSettings mysettings, DataTable dt)
		{
			Initialize();

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
							#region showhist
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
							#endregion
						}
						// Straight Scatterplot - no repeated measures to deal with
						else if (x != y & mysettings.repeatedmeasVarname == null)
						{
							DxChart chart = new DxScatterplot(mysettings, dt);
							charts.Add(chart);
						}
						// Repeated measures
						else if (/*x != y &*/ mysettings.repeatedmeasVarname != null)
						{
							List<string> repeatedmeas_levels = dt.AsEnumerable().Select(f => f.Field<string>(mysettings.repeatedmeasVarname)).Distinct().ToList();
							List<string> idvars = new List<string> { "id" };

							if (mysettings.colorvar != "none") idvars.Add(mysettings.colorvar);
							if (mysettings.panelvar != "none") idvars.Add(mysettings.panelvar);

							idvars.Remove(mysettings.repeatedmeasVarname);


							List<string> keepvars = new List<string>();
							keepvars.Add(mysettings.repeatedmeasVarname);
							keepvars.AddRange(mysettings.numvars);
							keepvars.AddRange(idvars);



							// Widen the data using the repeated measure value
							DataSubsets subsets = new DataSubsets(dt, keepvars, new List<string> { mysettings.repeatedmeasVarname });
							DataTable dtwide = subsets.FullOuterJoinDataTables(idvars);

							// log the original variable names, because we will be adding prefixes to these
							string origxvar = mysettings.xaxisvar;
							string origyvar = mysettings.yaxisvar;

							if (x != y)
							{
								//If use has selected OnlyAutoCorrAcrossTimept then skip when xvar != yvar
								if (mysettings.widemode != DxWideMode.OnlyAutoCorrAcrossTimept)
								{
									for (int k = 0; k < repeatedmeas_levels.Count; k++)
									{
										string newx = String.Format("{0}_{1}", repeatedmeas_levels[k], origxvar);
										string newy = String.Format("{0}_{1}", repeatedmeas_levels[k], origyvar);

										DxScatterplotSettings tmpsettings = (DxScatterplotSettings)mysettings.Clone();
										tmpsettings.xaxisvar = newx;
										tmpsettings.yaxisvar = newy;
										DxChart chart = new DxScatterplot(tmpsettings, dtwide);
										charts.Add(chart);
									}
								}
							}
							else if (x == y)
							{

								//If use has selected OnlyWithinTimept then skip when xvar == yvar, it is logically impossible 
								if (mysettings.widemode != DxWideMode.OnlyWithinTimept)
								{
									//adjacent
									for (int k = 0; k < (repeatedmeas_levels.Count - 1); k++)
									{
										string newx = String.Format("{0}_{1}", repeatedmeas_levels[k], origxvar);
										string newy = String.Format("{0}_{1}", repeatedmeas_levels[k + 1], origyvar);

										DxScatterplotSettings tmpsettings = (DxScatterplotSettings)mysettings.Clone();
										tmpsettings.xaxisvar = newx;
										tmpsettings.yaxisvar = newy;
										DxChart chart = new DxScatterplot(tmpsettings, dtwide);
										charts.Add(chart);
									}

									//then first and last
									DxScatterplotSettings tmpsettings2 = (DxScatterplotSettings)mysettings.Clone();
									tmpsettings2.xaxisvar = String.Format("{0}_{1}", repeatedmeas_levels[0], origxvar);
									tmpsettings2.yaxisvar = String.Format("{0}_{1}", repeatedmeas_levels[repeatedmeas_levels.Count - 1], origxvar);
									DxChart chart2 = new DxScatterplot(tmpsettings2, dtwide);
									charts.Add(chart2);
								}

							}



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
