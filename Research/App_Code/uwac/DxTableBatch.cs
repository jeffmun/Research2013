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

		private List<DxTable> _tables;
		public List<DxTable> tables { get { return _tables; } set { _tables = value; } }
		
		public DxOutputtype outputtype { get; set; }

		private List<string> _vars;
		public List<string> vars { get { return _vars; } set { _vars = value; } }
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
			outputtype = DxOutputtype.Crosstabs;
			layout = mysettings.layout;

			if(mysettings.pivot_rows.Count > 0) vars.AddRange(mysettings.pivot_rows);
			if (mysettings.pivot_cols.Count > 0) vars.AddRange(mysettings.pivot_cols);
			if (mysettings.pivot_cells.Count > 0) vars.AddRange(mysettings.pivot_cells);

			DxCrosstab crosstab = new DxCrosstab(mysettings, dt);

			tables.Add(crosstab);

		}


		/*
		 * 
		 * More types of Table output can be added here.
		 * Like is done in DxChartBatch
		 * 
		 */


		public void Initialize()
		{
			tables = new List<DxTable>();
			vars = new List<string>();
		}

	}
}