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
	public class DescStats
	{
		private List<string> _numericvars;
		private List<string> _groupingvars;
		public string emptystats { get; set; }
		private DescStatsTable _dt;

		public DataTable dt
		{
			get { return (DataTable)_dt;  }
			//set { _descstatstable = value; }
		}
		public List<string> numericvars { get { return _numericvars; } }
		public List<string> groupingvars {  get { return _groupingvars;  } }

		public DescStats(DataTable dt, List<string> numericvars)
		{
			_numericvars = numericvars;
			_groupingvars = null;
			_dt = new DescStatsTable();

			//Loop through each var
			foreach (string v in _numericvars)
			{
				DataRow datarow = GetRowOfStats(dt, v);
				_dt.Rows.Add(datarow);
			}

			AddConstantCol();

			RemoveEmptyRows();
		}

		public DescStats(DataTable dt, List<string> numericvars, List<string> groupingvars)
		{
			_numericvars = numericvars;
			_groupingvars = groupingvars;
			_dt = new DescStatsTable(_groupingvars);

			DataSubsets dataSubsets = new DataSubsets(dt, _numericvars, _groupingvars);

			foreach (DataSubset subset in dataSubsets.subsets)
			{
				//Loop through each var
				foreach (string v in _numericvars)
				{
					DataRow datarow = GetRowOfStats(subset.dt, v);

					//Assign the grouping vars to the row
					foreach(ColumnValue colval in subset.cols_and_vals)
					{
						string colname = colval.Colname;
						string colvalue = colval.Colvalue;
						datarow[colname] = colvalue;
					}

					_dt.Rows.Add(datarow);

				}


			}

			AddConstantCol();

			RemoveEmptyRows();
		}

		public DataRow GetRowOfStats(DataTable dt, string v)
		{
			//Calculate the set of stats
			DescStatsSet statSet = new DescStatsSet(dt, v);

			//Properties of the DescStatSet
			Type t = typeof(DescStatsSet);
			PropertyInfo[] propInfos = t.GetProperties(); // BindingFlags.Public | BindingFlags.Instance);


			//Assign them to a new data row
			DataRow datarow = _dt.NewRow();

			//Loop through the columns
			for (int c = 0; c < _dt.Columns.Count; c++)
			{
				var item = datarow.ItemArray[c];
				string itemname = _dt.Columns[c].ColumnName;

				if (itemname == "variable") { datarow[itemname] = v; }
				else
				{
					double? statval = statSet.GetStat(itemname);
					if (statval == null) { datarow[itemname] = DBNull.Value; ; }
					else { datarow[itemname] = statval; }

				}

			}
			return datarow;
		}

		public void AddConstantCol()
		{
			//Add a column for the constant
			DataColumn col = new DataColumn("All", typeof(string));
			col.DefaultValue = "All records";
			_dt.Columns.Add(col);
		}



		public void RemoveEmptyRows()
		{
			List<DataRow> rows_to_remove = new List<DataRow>();
			string empty = "";
			for(int i=0; i < _dt.Rows.Count; i++)
			{
				DataRow row = _dt.Rows[i];
				if (String.IsNullOrEmpty(row["N"].ToString()))
				{
					string tmp = String.Format("{0}: ", row["variable"]);
					
					for(int gvidx=0; gvidx < _groupingvars.Count; gvidx++)
					{
						string grpvar = _groupingvars[gvidx];
						tmp += String.Format("{0}={1},"
							, grpvar
							, row[grpvar]);
					}
					empty += tmp + " has no records<br/>";
					rows_to_remove.Add(row);
					
				}
			}

			foreach(DataRow r in rows_to_remove)
			{
				_dt.Rows.Remove(r);
			}

			emptystats = empty;
		}

		public class DescStatsTable : DataTable
		{

			public DescStatsTable()
			{
				AddStatsCols();
			}
			public DescStatsTable(List<string> groupingvars)
			{
				foreach (string s in groupingvars)
				{
					this.Columns.Add(s, typeof(string));
				}
				AddStatsCols();
			}
			public void AddStatsCols() 
			{
				this.Columns.Add("variable", Nullable.GetUnderlyingType(typeof(string)) ?? typeof(string));
				this.Columns.Add("N", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("M", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("SD", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("Min", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("Max", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("Sum", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("Nunq", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("Mode", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("Median", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("pct25", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("pct75", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("IQR", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("Noutliers_hi", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				this.Columns.Add("Noutliers_lo", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			}
		}
	}
}