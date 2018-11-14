using System;
using System.Collections.Generic;
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
using DevExpress.Utils;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using LinqStatistics;
using MathNet.Numerics.Statistics;
using uwac;
using uwac.trk;
using System.Text;

namespace uwac
{

	/// <summary>
	/// DxChartOrders represents the settings for various charts with
	/// a given set of variables.  Though this includes the variables it is
	/// independent of the specific data that will be used (e.g., filters may or may not be active)
	/// </summary>
	[Serializable]
	public class DxChartOrder
	{
		private DataTable _dt;
		private string _filter;
		private List<string> _vars;
		public List<string> vars { get { return _vars; } set { _vars = value; } }
		public string worksheet { get; set; }
		public bool isOrderFilled { get; set; }
		//public int numHist { get; set; }
		//public int numBar { get; set; }
		//public int numScat { get; set; }
		//public int numLine { get; set; }

		public DataTable dt { get; set; }
		public string filter { get; set; }

		private List<DxChartBatch> _batches;
		public List<DxChartBatch> batches { get { return _batches; } set { _batches = value; } }

		private List<DxChartSettings> _list_settings;
		public List<DxChartSettings> list_settings { get { return _list_settings; } set { _list_settings = value; } }


		private DxInvoice _invoice;
		public DxInvoice invoice { get { return _invoice; } set { _invoice = value; } }


		/// <summary>
		/// Summary description for DxChartOrders
		/// </summary>

		public DxChartOrder()
		{
			_list_settings = new List<DxChartSettings>();
			_vars = new List<string>();
			Initialize();
		}
		public DxChartOrder(List<string> vars)
		{
			_list_settings = new List<DxChartSettings>();
			_vars = vars; 
			Initialize();
		}
		public DxChartOrder(DxChartSettings settings, List<string> vars)
		{
			_list_settings = new List<DxChartSettings>() { settings };
			_vars = vars;
			Initialize();
		}

		public void Initialize()
		{
			_batches = new List<DxChartBatch>();
			isOrderFilled = false;
		}

		public void PrepareInvoice()
		{
			_invoice = new DxInvoice(_batches);

			if (_invoice.processedvars.Count > 0 
			& (_invoice.numHist + _invoice.numBar + _invoice.numLine + _invoice.numScat) > 0) isOrderFilled = true;

		}
		

		public string InvoiceToString()
		{
			if (_invoice != null)
			{

				string charts = String.Format("{0}{1}{2}{3}"
					, (_invoice.numHist > 0) ? String.Format("Hist({0})", _invoice.numHist) : ""
					, (_invoice.numBar > 0) ? String.Format(" Bar({0})", _invoice.numBar) : ""
					, (_invoice.numLine > 0) ? String.Format(" Line({0})", _invoice.numLine) : ""
					, (_invoice.numScat > 0) ? String.Format(" Scat({0})", _invoice.numScat) : ""
					);

				string myvars = (_invoice.processedvars != null) ? String.Join(",", _invoice.processedvars) : "NONE(?)";

				string filterinfo = (String.IsNullOrEmpty(this.filter)) ? "" : String.Format("Filter: {0}", this.filter);
				string invoiceinfo = String.Format("Worksheet: {0}    Charts: {1}    {2}", this.worksheet, charts, filterinfo);

				return invoiceinfo;
			}
			else{
				return "Invoice is null.";
			}
		}

	}


	[Serializable]
	public class DxInvoice
	{
		private List<string> _processedvars;
		public List<string> processedvars { get { return _processedvars; } set { _processedvars = value; } }

		private int _numHist;
		private int _numBar;
		private int _numScat;
		private int _numLine;

		public int numHist { get { return _numHist; } set { _numHist = value; } }
		public int numBar { get { return _numBar; } set { _numBar = value; } }
		public int numScat { get { return _numScat; } set { _numScat = value; } }
		public int numLine { get { return _numLine; } set { _numLine = value; } }
		

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
					if (batch.charttype == DxChartType.Histogram) _numHist++;
					if (batch.charttype == DxChartType.Scatterplot) _numScat++;
					if (batch.charttype == DxChartType.Barchart) _numBar++;
					if (batch.charttype == DxChartType.Lineplot) _numLine++;
				}
			}

			_processedvars = _processedvars.Distinct().ToList();

		}
	}


	[Serializable]
	public class InvoiceSummary : DataTable 
	{

		public InvoiceSummary(List<DxChartOrder> orders)
		{
			//DataTable dt = new DataTable();
			DataColumn c0 = new DataColumn("order_number", typeof(int));
			DataColumn c1 = new DataColumn("worksheet", typeof(string));
			DataColumn c2 = new DataColumn("vars", typeof(string));
			DataColumn c3 = new DataColumn("charts", typeof(string));

			this.Columns.Add(c0);
			this.Columns.Add(c1);
			this.Columns.Add(c2);
			this.Columns.Add(c3);

			int counter = 1;
			foreach (DxChartOrder order in orders)
			{
				if (order.invoice != null)
				{

					string charts = String.Format("{0}{1}{2}{3}"
						, (order.invoice.numHist > 0) ? String.Format("Hist({0})", order.invoice.numHist) : ""
						, (order.invoice.numBar > 0) ? String.Format(" Bar({0})", order.invoice.numBar) : ""
						, (order.invoice.numLine > 0) ? String.Format(" Line({0})", order.invoice.numLine) : ""
						, (order.invoice.numScat > 0) ? String.Format(" Scat({0})", order.invoice.numScat) : ""
						);

					string myvars = (order.invoice.processedvars != null) ? String.Join(",", order.invoice.processedvars) : "NONE(?)";

					DataRow row = this.NewRow();
					row["order_number"] = counter;
					row["worksheet"] = order.worksheet;
					row["vars"] = myvars;
					row["charts"] = charts;
					this.Rows.Add(row);
					counter++;
				}
			}
		}
	}


	//[Serializable]
	//public class DxChartOrders : List<DxChartOrder>
	//{


	//	/// <summary>
	//	/// Summary description for DxChartOrders
	//	/// </summary>

	//	public DxChartOrders()
	//	{
	//		List<DxChartOrder> orders = new List<DxChartOrder>();
	//	}

		

	//	//public DataTable ToDataTable()
	//	//{
	//	//	DataTable dt = new DataTable();
	//	//	DataColumn c0 = new DataColumn("order_number", typeof(int));
	//	//	DataColumn c1 = new DataColumn("worksheet", typeof(string));
	//	//	DataColumn c2 = new DataColumn("vars", typeof(string));
	//	//	DataColumn c3 = new DataColumn("charts", typeof(string));

	//	//	dt.Columns.Add(c0);
	//	//	dt.Columns.Add(c1);
	//	//	dt.Columns.Add(c2);
	//	//	dt.Columns.Add(c3);

	//	//	int counter = 1;
	//	//	foreach(DxChartOrder order in this)
	//	//	{
	//	//		string scat_text1 = "";
	//	//		string scat_text2 = "";



	//	//		//if (order.settingsscat != null)
	//	//		foreach (DxChartSettings settings in order.list_settings)
	//	//		{
	//	//			//if (order.settingsscat != null)
	//	//			//{
	//	//			//	scat_text1 = (order.numScat > 0 & !order.settingsscat.showhist) ? String.Format(" Scat({0})", order.numScat) : "";
	//	//			//	scat_text2 = (order.numScat > 0 & order.settingsscat.showhist) ? String.Format(" Scat({0})", order.numScat) : "";
	//	//			//}
	//	//			if (settings.ChartType == DxChartType.Scatterplot)
	//	//			{
	//	//				DxScatterplotSettings settingsscat = (DxScatterplotSettings)settings; 
	//	//				scat_text1 = (order.numScat > 0 & !settingsscat.showhist) ? String.Format(" Scat({0})", order.numScat) : "";
	//	//				scat_text2 = (order.numScat > 0 & settingsscat.showhist) ? String.Format(" Scat({0})", order.numScat) : "";
	//	//			}

	//	//		}

	//	//		string charts = String.Format("{0}{1}{2}{3}{4}"
	//	//			, (order.numHist > 0) ? String.Format("Hist({0})", order.numHist) : ""
	//	//			, (order.numBar > 0) ? String.Format(" Bar({0})", order.numBar) : ""
	//	//			, (order.numLine > 0) ? String.Format(" Line({0})", order.numLine) : ""
	//	//			, scat_text1
	//	//			, scat_text2);

	//	//		string myvars = (order.vars != null) ? String.Join(",", order.vars) : "NONE(?)";

	//	//		DataRow row = dt.NewRow();
	//	//		row["order_number"] = counter;
	//	//		row["worksheet"] = order.worksheet;
	//	//		row["vars"] = myvars;
	//	//		row["charts"] = charts;
	//	//		dt.Rows.Add(row);
	//	//		counter++;
	//	//	}

	//	//	return dt;
	//	//}
	//}


}