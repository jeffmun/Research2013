using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace uwac
{


	/// <summary>
	/// Summary description for DxTableOrder
	/// </summary>


	[Serializable]
	public class DxTableOrder : DxOrder
	{


		private List<DxTableBatch> _batches;
		public List<DxTableBatch> batches { get { return _batches; } set { _batches = value; } }

		private List<DxTableSettings> _list_settings;
		public List<DxTableSettings> list_settings { get { return _list_settings; } set { _list_settings = value; } }


		private DxInvoice _invoice;
		public DxInvoice invoice { get { return _invoice; } set { _invoice = value; } }


		/// <summary>
		/// Summary description for DxChartOrders
		/// </summary>

		public DxTableOrder()
		{
			list_settings = new List<DxTableSettings>();
			vars = new List<string>();
			Initialize();
		}
		public DxTableOrder(List<string> myvars)
		{
			list_settings = new List<DxTableSettings>();
			vars = myvars;
			Initialize();
		}
		public DxTableOrder(DxTableSettings settings, List<string> myvars)
		{
			list_settings = new List<DxTableSettings>() { settings };
			vars = myvars;
			Initialize();
		}

		public void Initialize()
		{
			ordertype = OrderType.table;
			_batches = new List<DxTableBatch>();
			isOrderFilled = false;
		}

		public void PrepareInvoice()
		{
			_invoice = new DxInvoice(_batches);

			if (_invoice.processedvars.Count > 0
			& (_invoice.numCrosstabs ) > 0) isOrderFilled = true;

		}


		public string InvoiceToString()
		{
			if (_invoice != null)
			{

				string charts = String.Format("{0}"
					, (_invoice.numCrosstabs > 0) ? String.Format("Crosstabs({0})", _invoice.numCrosstabs) : ""
					);

				string myvars = (_invoice.processedvars != null) ? String.Join(",", _invoice.processedvars) : "NONE(?)";

				string filterinfo = (String.IsNullOrEmpty(this.filter)) ? "" : String.Format("Filter: {0}", this.filter);
				string invoiceinfo = String.Format("Worksheet: {0}    Charts: {1}    {2}", this.worksheet, charts, filterinfo);

				return invoiceinfo;
			}
			else
			{
				return "Invoice is null.";
			}
		}

	}
}