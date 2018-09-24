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


/// <summary>
/// Summary description for DataSubset
/// </summary>
public class DataSubset
{
	public DataSubset()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}

namespace uwac
{

	public class DataSubset
	{

		public DataTable dt { get; set; }
		public List<ColumnValue> cols_and_vals { get; set; }

		public DataSubset() { }

		public DataSubset(DataTable dtorig, List<string> additional_cols, List<string> additional_vals)
		{
			if (additional_cols.Count == additional_vals.Count)
			{
				cols_and_vals = new List<ColumnValue>();

				for (int i = 0; i < additional_cols.Count; i++)
				{
					ColumnValue cv = new ColumnValue(additional_cols[i], additional_vals[i]);
					cols_and_vals.Add(cv);

				}
				dt = dtorig;
			}

		}

		public string Cols_and_Vals_ToString()
		{
			string output = "";
			foreach (ColumnValue cv in cols_and_vals)
			{
				output += String.Format("{0}={1} ", cv.Colname, cv.Colvalue);
			}
			return output;
		}

		public string Cols_ToString()
		{
			string output = "";
			foreach (ColumnValue cv in cols_and_vals)
			{
				output += String.Format("{0} ", cv.Colname);
			}
			return output;
		}

		public string Vals_ToString()
		{
			string output = "";
			foreach (ColumnValue cv in cols_and_vals)
			{
				output += String.Format("{0} ", cv.Colvalue);
			}
			return output;
		}
	}

}