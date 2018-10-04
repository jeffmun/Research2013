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
	/// Summary description for StatSet
	/// </summary>

	public class DescStatsSet
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

		public DescStatsSet(DataTable dt, string colname)
		{

			DataColumn col = dt.Columns[colname];

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

				if (data.Count() > 0)
				{
					//StatSet stats = new StatSet();
					this.Variable = colname;
					this.N = data.Count();
					this.Nunq = data.Distinct().Count();


					int numdigits = 4;
					this.M = Math.Round(data.Average(), numdigits);
					this.Median = Math.Round(LinqStatistics.EnumerableStats.Median(data), numdigits);
					this.Min = Math.Round(data.Min(), numdigits);
					this.Max = Math.Round(data.Max(), numdigits);
					this.Sum = Math.Round(data.Sum(), numdigits);

					double? raw_mode = data.Mode();
					if (raw_mode != null) this.Mode = Math.Round((double)raw_mode, numdigits);

					if (data.Count() > 1)
					{
						this.SD = Math.Round(LinqStatistics.EnumerableStats.StandardDeviation(data), numdigits);
						//stats.plus1SD = stats.M + stats.SD;
						//stats.minus1SD = stats.M - stats.SD;
					}


					if (data.Count() > 4)
					{
						var data1 = data.Where(x => x < this.Median);
						var data2 = data.Where(x => x > this.Median);
						if (data1.Count() > 2 && data2.Count() > 2)
						{
							double pct25 = Math.Round(LinqStatistics.EnumerableStats.Median(data1), numdigits);
							double pct75 = Math.Round(LinqStatistics.EnumerableStats.Median(data2), numdigits);
							this.pct25 = pct25;
							this.pct75 = pct75;
							this.IQR = Math.Round((pct75 - pct25), numdigits);
						}
					}

					if (this.IQR > 0)
					{
						this.Noutliers_hi = data.Where(x => x > (this.pct75 + (1.5 * this.IQR))).Count();
						this.Noutliers_lo = data.Where(x => x < (this.pct25 - (1.5 * this.IQR))).Count();
					}


					//return stats;
					//AddRow(stats, v, subset.cols_and_vals);
				}

			}
		}


		public double? GetStat(string statname)
		{
			if (statname == "N") return N;
			else if (statname == "M") return M;
			else if (statname == "SD") return SD;
			else if (statname == "Min") return Min;
			else if (statname == "Max") return Max;
			else if (statname == "Sum") return Sum;
			else if (statname == "Nunq") return Nunq;
			else if (statname == "Mode") return Mode;
			else if (statname == "Median") return Median;
			else if (statname == "pct25") return pct25;
			else if (statname == "pct75") return pct75;
			else if (statname == "Noutliers_hi") return Noutliers_hi;
			else if (statname == "Noutliers_lo") return Noutliers_lo;
			else if (statname == "IQR") return IQR;
			else return null;
		}

		public List<string> StatNames()
		{
			List<string> statnames = new List<string>   { "N", "M", "SD", "Min", "Max", "Sum", "Nunq", "Mode", "Median"
				, "pct25", "pct75", "Noutliers_hi", "Noutliers_lo", "IQR"};
			return statnames;
		}


	}
}
