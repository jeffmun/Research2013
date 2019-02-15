using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

using NReco;
using NReco.PivotData;
using NReco.PivotData.Output;
using uwac;

namespace uwac
{
	/// <summary>
	/// Summary description for DxCrosstab
	/// </summary>
	/// 
	[Serializable] 
	public class DxCrosstab : DxTable
	{
		private string _title;
		private string _autotitle;
		private string _htmlContent;
		private PivotTable _pivot;
		private DxCrosstabsSettings _settings;
		public string title { get { return _title; } set { _title = value; } }
		public string autotitle { get { return _autotitle; } set { _autotitle = value; } }
		public string htmlContent { get { return _htmlContent; } set { _htmlContent = value; } }
		public PivotTable pivot { get { return _pivot; } set { _pivot = value; } }

		
		public DxCrosstab(DataTable dt, List<string> pivot_rows, List<string> pivot_cols, List<string> stats, string cellfield, string mytitle, int decimal_places)
		{
			//
			// TODO: Add constructor logic here
			//
			_title = mytitle;
			CreatePivot(dt, pivot_rows, pivot_cols, stats, cellfield, decimal_places);
		}

		public DxCrosstab(DxCrosstabsSettings settings, DataTable data)
		{
			_settings = settings;
			_title = settings.title;

			CreatePivot(data, _settings.pivot_rows, _settings.pivot_cols, _settings.stats, _settings.pivot_cells[0], _settings.decimal_places);
		}


		protected void CreatePivot(DataTable dt, List<string> pivot_rows, List<string> pivot_cols, List<string> stats, string cellfield, int decimal_places)
		{
			List<utilPivotTable.AggrFx> fx = new List<utilPivotTable.AggrFx>();

			if (stats.Contains("N")) fx.Add(utilPivotTable.AggrFx.N);
			if (stats.Contains("Mean")) fx.Add(utilPivotTable.AggrFx.M);
			if (stats.Contains("SD")) fx.Add(utilPivotTable.AggrFx.SD);


			_pivot = utilPivotTable.DataTable_to_PivotTable(dt, pivot_rows, pivot_cols, cellfield, fx);


			var strHtmlWr = new StringWriter();
			var pvtHtmlWr = new PivotTableHtmlWriter(strHtmlWr);
			pvtHtmlWr.TableClass = "table table-bordered table-condensed pvtTable";

			pvtHtmlWr.FormatValue = (aggr, measureIdx) =>
			{
				if (aggr.Count == 0)
					return "0";

				// apply default number format

				if (decimal_places == 0) return String.Format("{0:#}", aggr.Value);
				else if (decimal_places == 1) return String.Format("{0:0.#}", aggr.Value);
				else if (decimal_places == 2) return String.Format("{0:0.##}", aggr.Value);
				else if (decimal_places == 3) return String.Format("{0:0.###}", aggr.Value);
				else if (decimal_places == 4) return String.Format("{0:0.####}", aggr.Value);
				else if (decimal_places == 5) return String.Format("{0:0.#####}", aggr.Value);
				else return String.Format("{0:0.##}", aggr.Value);
			};

			pvtHtmlWr.Write(_pivot);
			_htmlContent = strHtmlWr.ToString();

			_htmlContent = _htmlContent.Replace("Average of", "Mean");
			_htmlContent = _htmlContent.Replace("Variance of", "SD");
			_htmlContent = _htmlContent.Replace("Count", "N");

			string headerRow = String.Join(" > ", pivot_rows);
			string headerCol = String.Join(" > ", pivot_cols);

			_autotitle = String.Format("<b>{0}</b> by <b>{1}</b>", headerRow, headerCol);

			output = String.Format("{0}{1}", _autotitle, _htmlContent);
		}


		public Panel AsPanel()
		{
			Panel panel = new Panel();

			Label label = new Label();
			label.Font.Bold = true;
			label.Font.Size = 12;
			label.Text = title;

			Literal lit = new Literal();
			lit.Text = _htmlContent;

			panel.Controls.Add(label);
			panel.Controls.Add(lit);

			return panel;
		}

		public bool HasVars()
		{
			bool hasvars = (_settings.pivot_rows.Count >= 1 &
				_settings.pivot_cols.Count >= 1 &
				_settings.pivot_cells.Count >= 1 &
				_settings.stats.Count >= 1) ? true : false;
			return hasvars;
		}
	}


	public class DxCrosstabsSettings : DxTableSettings, ICloneable
	{
		public DataTable dt { get; set; }
		public List<string> pivot_rows { get; set; }
		public List<string> pivot_cols { get; set; }
		public List<string> pivot_cells { get; set; }
		public List<string> stats { get; set; }
		public string cellfield { get; set; }
		public string title { get; set; }
		public int decimal_places { get; set; }

		public DxCrosstabsSettings() {
			SetOutputtype(DxOutputtype.Crosstabs);
		}

		public object Clone()
		{
			return this.MemberwiseClone();
		}

		public bool HasVars()
		{
			bool hasvars = (pivot_rows.Count >= 1 & pivot_cols.Count >= 1 & pivot_cells.Count >= 1 & stats.Count >= 1) ? true : false;
			return hasvars;
		}
	}

}