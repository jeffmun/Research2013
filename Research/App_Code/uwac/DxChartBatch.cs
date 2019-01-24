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
		public DxLayout layout { get; set; }
		public int maxRow { get; set; }
		public int maxCol { get; set; }
		public string batchtitle { get; set; }
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

		public DxChartBatch(DxActogramSettings mysettings, DataTable dt, string title)
		{
			Initialize();

			_settings = (DxChartSettings)mysettings;

			charttype = DxChartType.Actogram;
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



		public DxChartBatch(DxLineplotSettings mysettings, DataTable dt, string title)
		{
			Initialize();

			_settings = (DxChartSettings)mysettings;

			charttype = DxChartType.Lineplot;
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

	

		public DxChartBatch(DxScatterplotSettings mysettings, DataTable dt)
		{
			Initialize();

			_settings = (DxChartSettings)mysettings;

			charttype = DxChartType.Scatterplot;
			layout = mysettings.chartlayout;

			_vars = mysettings.analysisvars();
			

			bool isnoo = true;
			if (isnoo)
			{
				// **** NO REPEATED MEASURES ****
				//Square matrix
				if (mysettings.repeatedmeasVarname == "none" & mysettings.analysisvarsX() == mysettings.analysisvarsY())
				{
					XYpairs pairs = new XYpairs(mysettings.analysisvarsX()); //, mysettings.colors[0]);

					foreach (XYpair pair in pairs.pairs)
					{
						DxChart chart = new DxScatterplot(mysettings, dt, pair);
						charts.Add(chart);
					}
				}
				//Rectangle matrix
				else if (mysettings.repeatedmeasVarname == "none" & mysettings.analysisvarsX() != mysettings.analysisvarsY())
				{
					XYpairs pairs = new XYpairs(mysettings.analysisvarsX(), mysettings.analysisvarsY()); //, mysettings.colors[0]);

					if(mysettings.chartlayout == DxLayout.Horizontal)
					{
						mysettings.chartlayout = DxLayout.Vertical;
						mysettings.maxRow = mysettings.analysisvarsY().Count;
					}
					else if (mysettings.chartlayout == DxLayout.Vertical)
					{
						mysettings.chartlayout = DxLayout.Horizontal; 
						mysettings.maxCol = mysettings.analysisvarsX().Count;
					}

					foreach (XYpair pair in pairs.pairs)
					{
						DxChart chart = new DxScatterplot(mysettings, dt, pair);
						charts.Add(chart);
					}
				}
				// **** YES REPEATED MEASURES ****
				else
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

					XYpairs pairs = new XYpairs(mysettings.analysisvars(), mysettings.rptmeasLevels(dt), mysettings.xypairtype);
					
					foreach (XYpair pair in pairs.pairs)
					{
						DxChart chart = new DxScatterplot(mysettings, dtwide, pair);
						charts.Add(chart);
					}

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

	public enum XYpairType : int
	{
		SameVar_AcrossLevelsOfRptMeas = 0,
		DiffVar_WithinLevelsOfRptMeas = 1,
		DiffVar_AcrossLevelsOfRptMeas = 2
	}

	public class XYpair
	{
		private string _xvar;
		private string _yvar;
		private Color _color;

		public string xvar { get { return _xvar; } set { _xvar = value; } }
		public string yvar { get { return _yvar; } set { _yvar = value; } }

		public Color color { get { return _color; } set { _color = value; } }


	}

	public class XYpairs
	{
		private List<XYpair> _pairs;
		public List<XYpair> pairs { get { return _pairs; } set { _pairs = value; } }

		public XYpairs(List<string> vars)
		{
			_pairs = new List<XYpair>();

			for (int i = 0; i < vars.Count; i++)
			{
				for (int j = i + 1; j < vars.Count; j++)
				{
					XYpair pair = new XYpair { xvar = vars[i], yvar = vars[j] };
					_pairs.Add(pair);
				}

			}
		}

		public XYpairs(List<string> vars, Color color)
		{
			_pairs = new List<XYpair>();

			for (int i = 0; i < vars.Count; i++)
			{
				for (int j = i + 1; j < vars.Count; j++)
				{
					XYpair pair = new XYpair { xvar = vars[i], yvar = vars[j], color = color };
					_pairs.Add(pair);
				}

			}
		}

		public XYpairs(List<string> xvars, List<string> yvars)
		{
			_pairs = new List<XYpair>();

			for (int i = 0; i < xvars.Count; i++)
			{
				for (int j = 0; j < yvars.Count; j++)
				{
					if (xvars[i] != yvars[j])
					{
						XYpair pair = new XYpair { xvar = xvars[i], yvar = yvars[j] };
						_pairs.Add(pair);
					}
				}

			}
		}

		public XYpairs(List<string> vars, List<string> rptmeas, XYpairType type)
		{
			_pairs = new List<XYpair>();
			string x = "";
			string y = "";
			if (type == XYpairType.DiffVar_WithinLevelsOfRptMeas)
			{
				for (int i = 0; i < rptmeas.Count; i++)
				{
					for (int j = 0; j < (vars.Count - 1); j++)
					{
						for (int k = j + 1; k < vars.Count; k++)
						{
							x = String.Format("{0}_{1}", rptmeas[i], vars[j]);
							y = String.Format("{0}_{1}", rptmeas[i], vars[k]);
							XYpair pair = new XYpair { xvar = x, yvar = y };
							_pairs.Add(pair);
						}
					}
				}
			}

			else if (type == XYpairType.DiffVar_AcrossLevelsOfRptMeas)
			{
				for (int i = 0; i < rptmeas.Count; i++)
				{
					for (int j = 0; j < rptmeas.Count; j++)
					{
						for (int k = 0; k < vars.Count; k++)
						{
							for (int l = 0; l < vars.Count; l++)
							{
								x = String.Format("{0}_{1}", rptmeas[i], vars[k]);
								y = String.Format("{0}_{1}", rptmeas[j], vars[l]);
								if ((i != j) & (k != l))
								{
									XYpair pair = new XYpair { xvar = x, yvar = y };
									_pairs.Add(pair);
								}
							}
						}
					}
				}
			}

			else if (type == XYpairType.SameVar_AcrossLevelsOfRptMeas)
			{
				for (int i = 0; i < vars.Count; i++)
				{
					for (int j = 0; j < (rptmeas.Count - 1); j++)
					{
						for (int k = j + 1; k < rptmeas.Count; k++)
						{
							x = String.Format("{0}_{1}", rptmeas[j], vars[i]);
							y = String.Format("{0}_{1}", rptmeas[k], vars[i]);
							XYpair pair = new XYpair { xvar = x, yvar = y };
							_pairs.Add(pair);
						}
					}
				}
			}

		}

	}
}
