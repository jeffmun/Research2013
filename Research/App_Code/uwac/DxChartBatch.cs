using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using uwac;
using uwac.trk;
using System.Text;

namespace uwac
{
	/// <summary>
	/// Summary description for DxBatchOcharts
	/// A batch is created for each instance of DxChartSettings in a DxChartOrder
	/// </summary>
	[Serializable]
	public class DxChartBatch
	{

		private DxChartSettings _settings;
		public DxChartSettings settings { get { return _settings; } set { _settings = value; } }

		private List<DxChart> _charts = new List<DxChart>();
		public List<DxChart> charts { get { return _charts; } set { _charts = value; } }

		private List<DataTable> _datatables = new List<DataTable>();
		public List<DataTable> datatables { get { return _datatables; } set { _datatables = value; } }

		public DxOutputtype outputtype { get; set; }

		private List<string> _vars;
		public List<string> vars { get { return _vars; } set { _vars = value; } }
		public DxLayout layout { get; set; }
		public int maxRow { get; set; }
		public int maxCol { get; set; }
		public string batchtitle { get; set; }




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

		public DxChartBatch(DxOutputtype mycharttype, DxChartSettings mysettings)
		{
			Initialize();
			//outputtype = mycharttype;
			_settings = mysettings;
		}


		//Histogram
		public DxChartBatch(DxHistogramSettings mysettings, DataTable dt)
		{
			Initialize();
			_settings = (DxChartSettings)mysettings;
			outputtype = DxOutputtype.Histogram;
			layout = mysettings.chartlayout;
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

		//Actogram
		public DxChartBatch(DxActogramSettings mysettings, DataTable dt, string title)
		{
			Initialize();

			_settings = (DxChartSettings)mysettings;

			outputtype = DxOutputtype.Actogram;
			layout = mysettings.chartlayout;
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

		//Lineplot
		public DxChartBatch(DxLineplotSettings mysettings, DataTable dt, string title)
		{
			Initialize();

			_settings = (DxChartSettings)mysettings;

			outputtype = DxOutputtype.Lineplot;
			layout = mysettings.chartlayout;
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
						if (mysettings.xaxisvar != v) //If y is not the same as x, then continue
						{
							mysettings.yaxisvar = v;
							mysettings.seriesby = "id";
							DxChart chart = new DxLineplot(mysettings, dt);
							chart.AddTitles(String.Format("{0} {1}", v, title));
							charts.Add(chart);
						}
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


		//Barchart
		//need to get stats first!
		public DxChartBatch(DxBarchartSettings mysettings, DataTable dt)
		{
			Initialize();

			_settings = (DxChartSettings)mysettings;

			outputtype = DxOutputtype.Barchart;
			layout = mysettings.chartlayout;
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

	
		//Scatterplot
		public DxChartBatch(DxScatterplotSettings mysettings, DataTable dt)
		{
			Initialize();

			_settings = (DxChartSettings)mysettings;

			outputtype = DxOutputtype.Scatterplot;
			layout = mysettings.chartlayout;

			_vars = mysettings.analysisvars();
			

			//Define the sets of scatterplots to create.

		

		
			//// **** NO REPEATED MEASURES ****
			////Square matrix
			//if (mysettings.repeatedmeasVarname == "none" & mysettings.analysisvarsX() == mysettings.analysisvarsY())
			//{
			//	XYpairs pairs = new XYpairs(mysettings.analysisvarsX()); //, mysettings.colors[0]);

			//	foreach (XYpair pair in pairs.pairs)
			//	{
			//		DxChart chart = new DxScatterplot(mysettings, dt, pair);
			//		if(chart.n > 1) charts.Add(chart);
			//	}
			//}
			////Rectangle matrix
			//else if (mysettings.repeatedmeasVarname == "none" & mysettings.analysisvarsX() != mysettings.analysisvarsY())
			//{
			//	XYpairs pairs = new XYpairs(mysettings.analysisvarsX(), mysettings.analysisvarsY()); //, mysettings.colors[0]);

			//	if(mysettings.chartlayout == DxLayout.Horizontal)
			//	{
			//		mysettings.chartlayout = DxLayout.Vertical;
			//		mysettings.maxRow = mysettings.analysisvarsY().Count;
			//	}
			//	else if (mysettings.chartlayout == DxLayout.Vertical)
			//	{
			//		mysettings.chartlayout = DxLayout.Horizontal; 
			//		mysettings.maxCol = mysettings.analysisvarsX().Count;
			//	}

			//	foreach (XYpair pair in pairs.pairs)
			//	{
			//		DxChart chart = new DxScatterplot(mysettings, dt, pair);
			//		if (chart.n > 1) charts.Add(chart);
			//	}
			//}
			//// **** YES REPEATED MEASURES ****
			//else
			if(true)
			{
				//List<string> repeatedmeas_levels = mysettings.rptmeasLevels(dt); //.AsEnumerable().Select(f => f.Field<string>(mysettings.repeatedmeasVarname)).Distinct().ToList();
				//List<string> analysisvars = mysettings.analysisvars();
				List<string> idvars = new List<string> { "id" };

				if (mysettings.colorvar != "none") idvars.Add(mysettings.colorvar);
				if (mysettings.panelvar != "none") idvars.Add(mysettings.panelvar);

				idvars.Remove(mysettings.repeatedmeasVarname);



				List<string> keepvars = new List<string>();
				keepvars.Add(mysettings.repeatedmeasVarname);
				keepvars.AddRange(mysettings.analysisvars());
				keepvars.AddRange(idvars);

				// Widen the data using the repeated measure value
				DataSubsets subsets = new DataSubsets(dt, keepvars, new List<string> { mysettings.repeatedmeasVarname });
				DataTable dtwide = subsets.FullOuterJoinDataTables(idvars);

				List<string> colnames = dtwide.ColumnNames();

				XYpairs pairs = new XYpairs(mysettings.analysisvars(), mysettings.rptmeasLevels(dt), mysettings.current_xypairtype);

				//pairs.RemoveInverse();

				foreach (XYpair pair in pairs.pairs)
				{
					DxChart chart = new DxScatterplot(mysettings, dtwide, pair);
					if (chart.n > 1) charts.Add(chart);
					//new RowColIndex( )
					//chart.rowcolIndex(new  
				}

				
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
			if (outputtype == DxOutputtype.Actogram)
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
