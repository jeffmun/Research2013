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
	public class DxChartOrder : DxOrder
	{

		private List<DxChartBatch> _batches;
		public List<DxChartBatch> batches { get { return _batches; } set { _batches = value; } }

		private List<DxChartSettings> _list_settings;
		public List<DxChartSettings> list_settings { get { return _list_settings; } private set { } }
			//set { 
			//_list_settings = value; 
			//} 
		


		private DxInvoice _invoice;
		public DxInvoice invoice { get { return _invoice; } set { _invoice = value; } }


		/// <summary>
		/// Summary description for DxChartOrders
		/// </summary>

		public DxChartOrder()
		{
			_list_settings = new List<DxChartSettings>();
			vars = new List<string>();
			Initialize();
		}
		public DxChartOrder(List<string> myvars)
		{
			_list_settings = new List<DxChartSettings>();
			vars = myvars; 
			Initialize();
		}
		public DxChartOrder(DxChartSettings settings, List<string> myvars)
		{
			_list_settings = new List<DxChartSettings>() { settings };
			vars = myvars;
			Initialize();
		}

		public void Initialize()
		{
			ordertype = OrderType.chart;
			_batches = new List<DxChartBatch>();
			isOrderFilled = false;
		}

		public void AddSettings(DxChartSettings mysettings)
		{
			_list_settings.Add(mysettings);

			if(mysettings.setup_errors != null)
			{
				this.errors.AddRange(mysettings.setup_errors);
			}
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



}