using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for DxInvoice
	/// </summary>


	[Serializable]
	public class DxInvoice
	{
		private List<string> _processedvars;
		public List<string> processedvars { get { return _processedvars; } set { _processedvars = value; } }

		private int _numHist;
		private int _numBar;
		private int _numScat;
		private int _numLine;
		private int _numCrosstabs;


		public int numHist { get { return _numHist; } set { _numHist = value; } }
		public int numBar { get { return _numBar; } set { _numBar = value; } }
		public int numScat { get { return _numScat; } set { _numScat = value; } }
		public int numLine { get { return _numLine; } set { _numLine = value; } }
		public int numCrosstabs { get { return _numCrosstabs; } set { _numCrosstabs = value; } }


		public DxInvoice(List<DxChartBatch> batchlist)
		{
			_processedvars = new List<string>();
			_numHist = 0;
			_numBar = 0;
			_numScat = 0;
			_numLine = 0;

			foreach (DxChartBatch batch in batchlist)
			{
				_processedvars.AddRange(batch.vars);
				foreach (DxChart dxchart in batch.charts)
				{
					if (batch.outputtype == DxOutputtype.Histogram) _numHist++;
					if (batch.outputtype == DxOutputtype.Scatterplot) _numScat++;
					if (batch.outputtype == DxOutputtype.Barchart) _numBar++;
					if (batch.outputtype == DxOutputtype.Lineplot) _numLine++;
				}
			}

			_processedvars = _processedvars.Distinct().ToList();

		}


		public DxInvoice(List<DxTableBatch> batchlist)
		{
			_processedvars = new List<string>();
			_numCrosstabs = 0;

			foreach (DxTableBatch batch in batchlist)
			{
				_processedvars.AddRange(batch.vars);
				foreach (DxTable dxtable in batch.tables)
				{
					if (batch.outputtype == DxOutputtype.Crosstabs) _numCrosstabs++;
				}
			}

			_processedvars = _processedvars.Distinct().ToList();

		}

		public string ObjectsFromInvoice()
		{
			string charts = String.Format("{0}{1}{2}{3}"
				, (this.numHist > 0) ? String.Format("Hist({0})",  this.numHist) : ""
				, (this.numBar > 0)  ? String.Format(" Bar({0})",  this.numBar) : ""
				, (this.numLine > 0) ? String.Format(" Line({0})", this.numLine) : ""
				, (this.numScat > 0) ? String.Format(" Scat({0})", this.numScat) : ""
				);

			return charts;
		}


	}


	[Serializable]
	public class InvoiceSummary : DataTable
	{

		public InvoiceSummary() { }

		public InvoiceSummary(List<DxChartOrder> orders)
		{
			CreateTable();
			AddCharts(orders);
		}
		public InvoiceSummary(List<DxTableOrder> orders)
		{
			CreateTable();
			AddTables(orders);
		}
		public InvoiceSummary(List<DxChartOrder> chartorders, List<DxTableOrder> tableorders)
		{
			CreateTable();
			AddCharts(chartorders);
			AddTables(tableorders);
		}

		public InvoiceSummary(SessionOrders orders)
		{
			CreateTable();
			AddCharts(orders.chartorders);
			AddTables(orders.tableorders);
		}

		public void AddCharts(List<DxChartOrder> orders)
		{
			if (orders != null)
			{

				int counter = 1;
				foreach (DxChartOrder order in orders)
				{
					if (order.invoice != null)
					{

						string charts = order.invoice.ObjectsFromInvoice();
						
						string myvars = (order.invoice.processedvars != null) ? String.Join(",", order.invoice.processedvars) : "NONE(?)";

						DataRow row = this.NewRow();
						row["order_number"] = order.ordernum;
						row["worksheet"] = order.worksheet;
						row["vars"] = myvars;
						row["objects"] = charts;
						row["filter"] = (order.filter == "") ? "---" : order.filter;
						this.Rows.Add(row);
						counter++;
					}
				}
			}
		}





		public void AddTables(List<DxTableOrder> orders)
		{
			if (orders != null)
			{
				int counter = 1;
				foreach (DxTableOrder order in orders)
				{
					if (order.invoice != null)
					{

						string charts = String.Format("{0}"
							, (order.invoice.numCrosstabs > 0) ? String.Format("Crosstab({0})", order.invoice.numCrosstabs) : ""
							//, (order.invoice.numBar > 0) ? String.Format(" Bar({0})", order.invoice.numBar) : ""
							//, (order.invoice.numLine > 0) ? String.Format(" Line({0})", order.invoice.numLine) : ""
							//, (order.invoice.numScat > 0) ? String.Format(" Scat({0})", order.invoice.numScat) : ""
							);

						string myvars = (order.invoice.processedvars != null) ? String.Join(",", order.invoice.processedvars) : "NONE(?)";

						DataRow row = this.NewRow();
						row["order_number"] = order.ordernum;
						row["worksheet"] = order.worksheet;
						row["vars"] = myvars;
						row["objects"] = charts;
						row["filter"] = (order.filter=="") ? "---" : order.filter;
						this.Rows.Add(row);
						counter++;
					}
				}
			}
		}
		

		public void CreateTable()
		{
			DataColumn c0 = new DataColumn("order_number", typeof(int));
			DataColumn c1 = new DataColumn("worksheet", typeof(string));
			DataColumn c2 = new DataColumn("vars", typeof(string));
			DataColumn c3 = new DataColumn("objects", typeof(string));
			DataColumn c4 = new DataColumn("filter", typeof(string));

			this.Columns.Add(c0);
			this.Columns.Add(c1);
			this.Columns.Add(c2);
			this.Columns.Add(c3);
			this.Columns.Add(c4);
		}

	}
}

