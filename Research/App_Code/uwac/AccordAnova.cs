using Accord.Statistics.Filters;
using Accord.Statistics.Testing;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AccordAnova
/// </summary>
public class AccordAnova
{
	public AccordAnova()
	{
		//
		// TODO: Add constructor logic here
		//
	}


	public double[][] DataTable_to_JaggedArray(DataTable dt, string ivname, string dvname)
	{
		// Create a new data projection (column) filter
		var filter = new Codification(dt, new string[] { ivname });
		// Apply the filter and get the result
		DataTable result = filter.Apply(dt, new string[] { ivname, dvname });

		var iv = filter.Columns[ivname];

		//int ivlevels = iv.Mapping.Values.Count;

		int rowCount = result.Rows.Count;

		double[][] data = new double[iv.Mapping.Values.Count][];

		for (int current_ivlevel = 0; current_ivlevel < iv.Mapping.Values.Count; current_ivlevel++)
		{

			data[current_ivlevel] = result.AsEnumerable()
				.Where(f => f.Field<int>(ivname) == current_ivlevel)
				.Select(f => f.Field<double>(dvname)).ToArray();

		}

		return data;

	}
	protected void PlaceAnovaTable(OneWayAnova anova, string dv, string iv)
	{
		PlaceAnovaTable(anova, dv, iv, 4);
	}


	protected void PlaceAnovaTable(OneWayAnova anova, string dv, string iv, int numdigits)
	{
		var t = anova.Table;

		ASPxGridView gv = new ASPxGridView();
		gv.SettingsText.Title = String.Format("ANOVA: <b>{0}</b> by {1}", dv, iv);
		gv.Settings.ShowTitlePanel = true;

		gv.DataSource = anova.Table;
		gv.DataBind();


		List<string> keepAsInt = new List<string> { "DegreesOfFreedom" };
		foreach (GridViewDataColumn col in gv.Columns)
		{
			string name = col.FieldName;


			if (keepAsInt.Contains(name))
			{
				col.PropertiesEdit.DisplayFormatString = String.Format("F0");
			}
			else
			{
				col.PropertiesEdit.DisplayFormatString = String.Format("F{0}", numdigits);
			}

			string caption = name;
			if (name == "DegreesOfFreedom") caption = "DF";
			else if (name == "SumOfSquares") caption = "SS";
			else if (name == "MeanSquares") caption = "MS";
			else if (name == "Significance") caption = "p-value";
			else if (name == "Statistic") caption = "F";

			col.Caption = caption;
		}

		//panel.Controls.Add(gv);
	}

}