using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.Linq;
using System.Diagnostics;
using System.Linq;
using System.Linq.Dynamic;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LinqStatistics;
using MathNet.Numerics.Statistics;
using uwac;
using uwac.trk;

namespace uwac
{

	/// <summary>
	/// Summary description for DPStatsTable
	/// </summary>
	public class StatsTable
	{
		private List<string> _numericvars;
		private List<string> _groupingvars;
		private DataTable _dt;

		public DataTable dt
		{
			get { return _dt; }
			set { _dt = value; }
		}


		public StatsTable(DataSubsets dataSubsets, List<string> numericvars, List<string> groupingvars)
		{
			_numericvars = numericvars;
			_groupingvars = groupingvars;
			BuildBaseTable();
			AddStatsColumns();
			CaclulateStats(dataSubsets.subsets);
		}

		public StatsTable(DataTable dt, List<string> numericvars, List<string> groupingvars)
		{
			DataSubsets dataSubsets = new DataSubsets(dt, numericvars, groupingvars);
			_numericvars = numericvars;
			_groupingvars = groupingvars;
			BuildBaseTable();
			AddStatsColumns();
			CaclulateStats(dataSubsets.subsets);
		}

		public void CreateStatsTable(DataSubsets dataSubsets)
		{
			BuildBaseTable();
			AddStatsColumns();
			CaclulateStats(dataSubsets.subsets);
		}

		public void BuildBaseTable()
		{
			_dt = new DataTable();
			_dt.Columns.Add("Variable", typeof(string));
			foreach (string s in _groupingvars)
			{
				_dt.Columns.Add(s, typeof(string));
			}
		}


		public void CaclulateStats(DataTable dt) //, List<string> requested_stats)
		{
			//LOGIC:
			//Loop through the vars in the dt_input adding one row for each variable
			//Assumes that missing values have been removed 


		}

			public void CaclulateStats(List<DataSubset> subsets) //, List<string> requested_stats)
		{
			//LOGIC:
			//Loop through the vars in the dt_input adding one row for each variable
			//Assumes that missing values have been removed 

			foreach (DataSubset subset in subsets)
			{
				DataTable dt = subset.dt;

				if (dt.Rows.Count == 0)
				{
					//statstable.AddBlankRow("data", subset.cols_and_vals);
				}
				else
				{
					foreach (string v in _numericvars)
					//foreach (DataColumn col in dt.Columns)
					{
						StatSet statset = new StatSet();

						DataColumn col = subset.dt.Columns[v];

						//bool skipThisCol = cols_to_skip.Any(s => col.ColumnName.Contains(s));
						bool isnumeric = col.IsNumeric();
						string str_label = "";

						if (isnumeric) // & !skipThisCol)
						{
							//Convert the numeric column to double and remove null
							var data = dt.AsEnumerable().Where(r => !r.IsNull(col.ColumnName))
								.Select(x => Convert.ToDouble(x[col.ColumnName]));

							#region Labels
							////Labels
							//if (_dtdict != null)
							//{
							//	try
							//	{
							//		str_label = _dtdict.AsEnumerable().Where(r => r.Field<string>("varname") == v).Select(r => r.Field<string>("FieldLabel")).Single();
							//	}
							//	catch (Exception ex)
							//	{
							//		string x = ex.Message;
							//		str_label = "x";
							//	}
							//}
							//else
							//{
							//	str_label = ".";
							//}
							#endregion

							if (data.Count() == 0)
							{
								//statstable.AddBlankRow(v, subset.cols_and_vals);
							}
							else if (data.Count() > 0)
							{
								StatSet stats = new StatSet();

								stats.N = data.Count();
								stats.Nunq = data.Distinct().Count();

								int numdigits = 4;
								stats.M = Math.Round(data.Average(), numdigits);
								stats.Median = Math.Round(LinqStatistics.EnumerableStats.Median(data), numdigits);
								stats.Min = Math.Round(data.Min(), numdigits);
								stats.Max = Math.Round(data.Max(), numdigits);
								stats.Sum = Math.Round(data.Sum(), numdigits);

								double? raw_mode = data.Mode();
								if(raw_mode != null) stats.Mode = Math.Round((double)raw_mode, numdigits);

								if (data.Count() > 1)
								{
									stats.SD = Math.Round(LinqStatistics.EnumerableStats.StandardDeviation(data), numdigits);
									//stats.plus1SD = stats.M + stats.SD;
									//stats.minus1SD = stats.M - stats.SD;
								}


								if (data.Count() > 4)
								{
									var data1 = data.Where(x => x < stats.Median);
									var data2 = data.Where(x => x > stats.Median);
									if (data1.Count() > 2 && data2.Count() > 2)
									{
										double pct25 = Math.Round(LinqStatistics.EnumerableStats.Median(data1), numdigits);
										double pct75 = Math.Round(LinqStatistics.EnumerableStats.Median(data2), numdigits);
										stats.pct25 = pct25;
										stats.pct75 = pct75;
										stats.IQR = Math.Round((pct75 - pct25), numdigits);
									}
								}

								if (stats.IQR > 0)
								{
									stats.Noutliers_hi = data.Where(x => x > (stats.pct75 + (1.5 * stats.IQR))).Count();
									stats.Noutliers_lo = data.Where(x => x < (stats.pct25 - (1.5 * stats.IQR))).Count();
								}


								AddRow(stats, v, subset.cols_and_vals);
							}

						}

					}
				}

			}
		}



		public class StatSet
		{
			public string Variable { get; set; }
			public double? N { get; set; }
			public double? M { get; set; }
			public double? SD { get; set; }
			public double? Min { get; set; }
			public double? Max { get; set; }
			public double? Sum { get; set; }
			public double? Nunq { get; set; }
			public double? Mode { get; set; }
			public double? Median { get; set; }
			public double? pct25 { get; set; }
			public double? pct75 { get; set; }
			public double? Noutliers_hi { get; set; }
			public double? Noutliers_lo { get; set; }
			public double? IQR { get; set; }
			//public double? plus1SD { get; set; }
			//public double? minus1SD { get; set; }

		}

		private void AddStatsColumns()
		{
			//dtOut.Columns.Add("statvalue", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));

			_dt.Columns.Add("N", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("M", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("SD", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("Min", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("Max", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("Sum", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("Nunq", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("Mode", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("Median", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("pct25", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("pct75", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("IQR", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("Noutliers_hi", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			_dt.Columns.Add("Noutliers_lo", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			//_dt.Columns.Add("plus1SD", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			//_dt.Columns.Add("minus1SD", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
		}

		public void AddRow(StatSet stats, string varname, List<ColumnValue> addtl_col_values)
		{
			DataRow row = this._dt.NewRow();
			row["Variable"] = varname;
			foreach (ColumnValue cv in addtl_col_values)
			{
				row[cv.Colname] = cv.Colvalue;
			}
			row["N"] = stats.N;
			row["M"] = stats.M;
			row["SD"] = (stats.SD == null) ? (object)DBNull.Value : stats.SD;
			row["Min"] = stats.Min;
			row["Max"] = stats.Max;
			row["Sum"] = stats.Sum;
			row["Nunq"] = stats.Nunq;
			row["Mode"] = (stats.Mode == null) ? (object)DBNull.Value : stats.Mode;
			row["Median"] = (stats.Median == null) ? (object)DBNull.Value : stats.Median;
			row["pct25"] = (stats.pct25 == null) ? (object)DBNull.Value : stats.pct25;
			row["pct75"] = (stats.pct75 == null) ? (object)DBNull.Value : stats.pct75;
			row["IQR"] = (stats.IQR == null) ? (object)DBNull.Value : stats.IQR;
			row["Noutliers_hi"] = (stats.Noutliers_hi == null) ? (object)DBNull.Value : stats.Noutliers_hi;
			row["Noutliers_lo"] = (stats.Noutliers_lo == null) ? (object)DBNull.Value : stats.Noutliers_lo;
			//row["plus1SD"] = (stats.plus1SD == null) ? (object)DBNull.Value : stats.plus1SD;
			//row["minus1SD"] = (stats.minus1SD == null) ? (object)DBNull.Value : stats.minus1SD;

			_dt.Rows.Add(row);
		}

		public void AddBlankRow(string varname, List<ColumnValue> addtl_col_values)
		{
			DataRow row = _dt.NewRow();
			row["Variable"] = varname;
			row["N"] = 0;
			_dt.Rows.Add(row);
		}


	}
}