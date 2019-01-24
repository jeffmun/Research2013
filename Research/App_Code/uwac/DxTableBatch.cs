using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for DxTableBatch
	/// </summary>
	public class DxTableBatch
	{
		private DxTableSettings _tblsettings;
		public DxTableSettings tblsettings { get { return _tblsettings; } set { _tblsettings = value; } }
		private List<string> _vars;

		private List<DxTable> _tables;
		public List<DxTable> tables { get { return _tables; } set { _tables = value; } }
		public List<string> vars { get { return _vars; } set { _vars = value; } }
		public DxTableType tabletype { get; set; }
		public DxLayout layout { get; set; }
		public int maxRow { get; set; }
		public int maxCol { get; set; }
		public string batchtitle { get; set; }

		public DxTableBatch()
		{
			//
			// TODO: Add constructor logic here
			//
		}


		public DxTableBatch(DxCrosstabsSettings mysettings, DataTable dt)
		{
			Initialize();
			_tblsettings = (DxTableSettings)mysettings;
			tabletype = DxTableType.Crosstabs;
			layout = mysettings.layout;

			if(mysettings.pivot_rows.Count > 0) vars.AddRange(mysettings.pivot_rows);
			if (mysettings.pivot_cols.Count > 0) vars.AddRange(mysettings.pivot_cols);
			if (mysettings.pivot_cells.Count > 0) vars.AddRange(mysettings.pivot_cells);

			DxCrosstab crosstab = new DxCrosstab(mysettings, dt);

			tables.Add(crosstab);


			//_vars = mysettings.numvars;
			//if (mysettings.agevars != null) _vars.AddRange(mysettings.agevars);

			//mysettings.numvars.Remove("id");


			//if (mysettings.panelvar == "none")
			//{
			//	foreach (string v in _vars)
			//	{
			//		mysettings.xaxisvar = v;
			//		DxChart chart = new DxHistogram(mysettings, dt, v, 0);
			//		charts.Add(chart);
			//	}
			//}
			//else  //Yes panels
			//{
			//	List<string> varnames = new List<string>();
			//	varnames.AddRange(_vars);
			//	varnames.Add(mysettings.xaxisvar);
			//	varnames.Add(mysettings.colorvar);
			//	varnames.RemoveAll(item => item == "variable");
			//	varnames.RemoveAll(item => item == "none");


			//	DataSubsets subsets = new DataSubsets(dt, varnames, new List<string> { mysettings.panelvar });

			//	foreach (DataSubset subset in subsets.subsets)
			//	{
			//		foreach (string v in mysettings.numvars)
			//		{
			//			settings.xaxisvar = v;
			//			DxChart chart = new DxHistogram(mysettings, subset.dt, v, 0);
			//			chart.AddTitles(subset.Cols_and_Vals_ToString());
			//			charts.Add(chart);
			//		}

			//	}

			//}

		}

		public void Initialize()
		{
			tables = new List<DxTable>();
			vars = new List<string>();
		}

	}
}