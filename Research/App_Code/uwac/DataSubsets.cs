using Accord.Statistics.Analysis;
using Accord.Statistics.Testing;

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
using System.Drawing;
using DevExpress.Web;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using LinqStatistics;
using MathNet.Numerics.Statistics;
using uwac;
using uwac.trk;
using Accord.Statistics.Models.Regression.Linear;
using Accord.Statistics.Testing;

namespace uwac
{

	/// <summary>
	/// Summary description for DataSubsets
	/// </summary>


	public class DataSubsets
	{
		private List<DataSubset> _subsets;
		private List<Groupingvar> _groupingvars;

		public List<DataSubset> subsets { get { return _subsets; } }
		public List<Groupingvar> groupingvars { get { return _groupingvars; } }

		public DataSubsets(List<DataSubset> subsets_value, List<Groupingvar> groupingvars_value) //, List<int> numlevels_value)
		{
			_subsets = subsets_value;
			_groupingvars = groupingvars_value;
			//numlevels = numlevels_value;
		}

		public DataSubsets(DataTable dt_input, List<string> varnames, string groupingvar)
		{
			//just selected vars
			List<string> allvars = new List<string>();
			allvars.AddRange(varnames);
			allvars.Add(groupingvar);
			DataTable dt = SelectColumns(dt_input, allvars);

			_subsets = CreateSubsets(dt, varnames, new List<string> { groupingvar });
		}


		public DataSubsets(DataTable dt_input, List<string> varnames, List<string> groupingvarnames)
		{
			//just selected vars
			List<string> allvars = new List<string>();
			allvars.AddRange(varnames);
			allvars.AddRange(groupingvarnames);

			allvars.RemoveAll(string.IsNullOrWhiteSpace);


			for (int i = 0; i < allvars.Count;  i++)
			{
				allvars[i] = allvars[i].ToLower();
			}

			DataTable dt = SelectColumns(dt_input, allvars);

			_subsets = CreateSubsets(dt, varnames, groupingvarnames);
		}

		public List<DataSubset> CreateSubsets(DataTable dt, List<string> varnames, List<string> groupingvarnames)
		{

			bool boo1 = (groupingvarnames[0] == "none") ? false : true;
			bool boo2 = (groupingvarnames.Count >= 1) ? true : false;

			bool hasgroupingvars = (groupingvarnames[0] != "none" && groupingvarnames.Count >= 1) ? true : false;
			_groupingvars = new List<Groupingvar>();
			List<DataSubset> mysubsets = new List<DataSubset>();

			if (hasgroupingvars)
			{
				try
				{

					//Create the list of GroupingVars
					for (int g = 0; g < groupingvarnames.Count; g++)
					{
						string vtype = dt.Columns[groupingvarnames[g]].DataType.ToString().ToLower();

						if (!vtype.Contains( "string"))
						{
							dt.ConvertColumnType(groupingvarnames[g], typeof(string));
						}


						List<string> unsorted_levels = dt.AsEnumerable().Select(f => f.Field<string>(groupingvarnames[g].ToString())).Distinct().ToList();
						List<string> levels = unsorted_levels.OrderBy(x => x).ToList();

						Groupingvar gv = new Groupingvar(groupingvarnames[g], levels);
						_groupingvars.Add(gv);
					}


					// from: http://www.scriptscoop.net/t/7516b362c821/c-c-linq-how-to-build-group-by-clause-dynamically.html
					IEnumerable<string> columnsToGroupBy = groupingvarnames;
					var groups = dt.AsEnumerable()
								.GroupBy(r => new NTuple<object>(from column in columnsToGroupBy select r[column]))
								.OrderBy(p => p.Key);

					//var groups = dt.AsEnumerable()
					//	.GroupBy(r => new NTuple<object>(from column in columnsToGroupBy select r[column]));


					foreach (var group in groups)
					{
						DataTable dtSub = group.CopyToDataTable();

						List<string> keyvalues = new List<string>();
						foreach (var s in group.Key.Values)
						{
							keyvalues.Add(s.ToString());
						}


						DataSubset subset = new DataSubset(dtSub, groupingvarnames, keyvalues);
						mysubsets.Add(subset);
					}
				}
				catch (Exception ex)
				{
					throw new Exception("ERROR! instantiating DataSubsets  Msg:" + ex.Message); // + "............." + ex.StackTrace.ToString());
				}
			}
			return mysubsets;
		}


		public DataTable SelectColumns(DataTable dtin, List<string> allvars)
		{

			DataTable dtout = dtin.Copy();

			foreach (DataColumn dc in dtin.Columns)
			{
				string colname = dc.ColumnName.ToLower();

				if (allvars.Contains(colname)) { /*keep it*/ }
				else
				{
					dtout.Columns.Remove(colname);
				}
			}
			return dtout;
		}

	}



}