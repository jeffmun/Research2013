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
using uwac.data;

namespace uwac
{

	/// <summary>
	/// DxChartFactory will produce a list of DxCharts
	/// </summary>
	[Serializable]
	public class DxChartFactory
	{
		private Dataproject _dataproject;
		private DPData _dpdata;
		private List<DxChartOrder> _orders;
		public List<DxChartOrder> orders { get { return _orders; } set { _orders = value; } }


		private DataTable _dt;

		public int numHist { get { return CountCharts(DxOutputtype.Histogram); } }
		public int numBar {  get { return CountCharts(DxOutputtype.Barchart); } }
		public int numScat { get { return CountCharts(DxOutputtype.Scatterplot); } }
		public int numLine { get { return CountCharts(DxOutputtype.Lineplot); } }



		public DataTable dt { get { return _dt; } set { _dt = value; } }

		public DxChartFactory(DataTable mydata, List<DxChartOrder> myorders)
		{
			_orders = myorders;
			_dt = mydata;

			ProcessOrders();

		}

		public DxChartFactory(Dataproject mydataproject, DPData mydpdata, List<DxChartOrder> myorders)
		{
			_orders = myorders;
			_dpdata = mydpdata;
			_dataproject = mydataproject;

			ProcessOrders();

		}

		public void ProcessOrders()
		{
			if (_dpdata != null)
			{
				foreach (DxChartOrder order in orders)
				{
					ProcessOrder(order);

				}
			}
			else
			{
				if(_dt != null)
				{
					foreach (DxChartOrder order in orders)
					{
						ProcessOrder(order);

					}
				}
			}
		}



		public void ProcessOrder(DxChartOrder order)
		{
			if (order.isOrderFilled) //Already have batches
			{
				order.batches.Clear();
			}

			//Skip the_dpdata stuff if _dt is already populated
			if (_dt == null)
			{
				bool hassameworksheet = order.HasSameWorksheet(_dpdata);

				if (!hassameworksheet)
				{
					//Need new DPData
					_dataproject.selectedsheet = order.worksheet;
					_dpdata = new DPData(_dataproject, order.filter);
				}


				bool hassamefilter = order.HasSameFilter(_dpdata);

				if (!hassamefilter)
				{
					_dpdata.filter = order.filter;
				}

				_dt = _dpdata.dt;
			}

			//Each order will result in a list of batches
			//List<DxBatchOcharts> batchlist = new List<DxBatchOcharts>();
			List<DxChartBatch> batchlist = new List<DxChartBatch>();

			if (order.list_settings != null)
			{
				foreach (DxChartSettings settings in order.list_settings)
				{

					#region Histogram
					if (settings.outputtype == DxOutputtype.Histogram)
					{
						DxHistogramSettings mysettings = (DxHistogramSettings)settings;
						DxChartBatch batch = new DxChartBatch(mysettings, dt);
						PrepareBatch(batch, settings);
						batchlist.Add(batch);
					}
					#endregion

					#region Barchart
					else if (settings.outputtype == DxOutputtype.Barchart)
					{
						DxBarchartSettings mysettings = (DxBarchartSettings)settings;
						DxChartBatch batch = new DxChartBatch(mysettings, dt);
						PrepareBatch(batch, settings);
						batchlist.Add(batch);
					}
					#endregion

					#region Scatterplot
					else if (settings.outputtype == DxOutputtype.Scatterplot)
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

							int ncol1 = utilStats.TriangleNumber(n_rptmeas);


							List<string> tmpvars = mysettings.analysisvars();
							List<string> tmpvarsX = mysettings.analysisvarsX();
							List<string> tmpvarsY = mysettings.analysisvarsY();

							#region Process By Mode
							foreach (XYpairType mode in mysettings.xypairtypes)
							{
								if (mode == XYpairType.SameVar_AcrossLevelsOfRptMeas)
								{

									mysettings.current_xypairtype = mode;
									mysettings.maxCol = ncol1;
									//mysettings.maxRow = tmpvars.Count;
									mysettings.chartlayout = DxLayout.Horizontal;

									//Loop over vars, make a batch for each one
									foreach (string v in tmpvars)
									{
										mysettings.manualXandYvars = true;
										mysettings.xvars = new List<string> { v };
										mysettings.yvars = new List<string> { v };
										DxChartBatch batch1 = new DxChartBatch(mysettings, dt);
										PrepareBatch(batch1, (DxChartSettings)mysettings);
										batch1.batchtitle = String.Format("{0} ACROSS levels of {1}", v, mysettings.repeatedmeasVarname);
										batch1.maxCol = batch1.charts.Count;
										batchlist.Add(batch1);
									}

								}

								if (mode == XYpairType.DiffVar_WithinLevelsOfRptMeas)
								{
									//#2 - treat it as square
									mysettings.current_xypairtype = mode;
									//mysettings.numvars = tmpvars;
									mysettings.xvars = null;
									mysettings.yvars = null;

									mysettings.chartlayout = DxLayout.Upper;
									mysettings.maxRow = tmpvars.Count;

									List<string> rptmeasLevels = dt.AsEnumerable().Select(f => f.Field<string>(mysettings.repeatedmeasVarname)).Distinct().ToList();

									List<string> tmpvars_with_id = new List<string>();
									tmpvars_with_id.AddRange(tmpvars);
									tmpvars_with_id.Add("id");

									DataSubsets dt_rptmeas = new DataSubsets(dt, tmpvars_with_id, mysettings.repeatedmeasVarname);

									//Loop across levels of the RptMeas
									foreach (DataSubset subset in dt_rptmeas.subsets)
									{

										DxChartBatch batch2 = new DxChartBatch(mysettings, subset.dt);
										PrepareBatch(batch2, (DxChartSettings)mysettings);
										batch2.batchtitle = String.Format("Variables WITHIN {0}: {1}", mysettings.repeatedmeasVarname, subset.Vals_ToString());
										batch2.maxCol = batch2.charts.Count;
										batchlist.Add(batch2);
									}
								}

								if (mode == XYpairType.DiffVar_AcrossLevelsOfRptMeas)
								{
									//#2 - back to original
									mysettings.current_xypairtype = mode;
									//mysettings.numvars = tmpvars;
									mysettings.xvars = tmpvarsX;
									mysettings.yvars = tmpvarsY;
									mysettings.manualXandYvars = true;
									mysettings.chartlayout = DxLayout.Horizontal;

									List<string> rptmeasLevels = dt.AsEnumerable().Select(f => f.Field<string>(mysettings.repeatedmeasVarname))
										.Distinct().ToList();
									//HERE!!!!

									for (int i = 0; i < (rptmeasLevels.Count - 1); i++)
									{
										for (int j = i + 1; j < rptmeasLevels.Count; j++)
										{
											DataView dv = new DataView(dt); // dt.AsDataView();
											dv.RowFilter = String.Format("{0} IN ('{1}','{2}')", mysettings.repeatedmeasVarname, rptmeasLevels[i], rptmeasLevels[j]);
											DataTable dt_sub = dv.ToTable();

											if (dt_sub.Rows.Count > 1)
											{
												DxChartBatch batch3 = new DxChartBatch(mysettings, dt_sub);
												PrepareBatch(batch3, (DxChartSettings)mysettings);
												batch3.batchtitle = String.Format("Variables ACROSS {0}:{1} & {2}", mysettings.repeatedmeasVarname, rptmeasLevels[i], rptmeasLevels[j]);
												batch3.maxCol = batch3.charts.Count;
												batchlist.Add(batch3);
											}
										}
									}



								}
							}
							#endregion
						}
					}
					#endregion

					#region Actogram
					else if (settings.outputtype == DxOutputtype.Actogram)
					{
						DxActogramSettings mysettings = (DxActogramSettings)settings;
						mysettings.outputtype = DxOutputtype.Actogram;

						List<string> varnames = new List<string>() { "id" };
						varnames.AddRange(mysettings.numvars);
						varnames.Add(mysettings.xaxisvar);
						varnames.Add(mysettings.colorvar);
						varnames.RemoveAll(item => item == "variable");
						varnames.RemoveAll(item => item == "none");


						DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { mysettings.panelvar });

						DxChartBatch batch2 = new DxChartBatch(DxOutputtype.Actogram, mysettings);

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
					#endregion

					#region Lineplot
					else if (settings.outputtype == DxOutputtype.Lineplot)
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

							DxChartBatch batch2 = new DxChartBatch(DxOutputtype.Lineplot, mysettings);

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
					#endregion
				}
			}

			order.batches.AddRange(batchlist);
			
			//The invoice serves as a table of contents for what was actually created
			order.PrepareInvoice();

		}

		public void RefreshData(List<DxChartOrder> orders, DataTable dt)
		{
			foreach (DxChartOrder order in orders)
			{
				foreach (DxChartBatch batch in order.batches)
				{
					foreach (DxChart dxchart in batch.charts)
					{
						dxchart.chart.RefreshData();
					}
				}
			}
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


		public int CountCharts(DxOutputtype type)
		{
			int n = 0;
			foreach (DxChartOrder order in orders)
			{
				foreach (DxChartBatch batch in order.batches)
				{
					if (batch.outputtype == type)
					{
						n += batch.charts.Count;
					}
				}
			}
			return n;
		}


	}



}
