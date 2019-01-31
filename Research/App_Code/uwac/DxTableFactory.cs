using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using uwac.data;

namespace uwac
{
	/// <summary>
	/// Summary description for DxTableFactory
	/// </summary>
	public class DxTableFactory
	{
		private Dataproject _dataproject;
		private DPData _dpdata;
		private List<DxTableOrder> _orders;
		public List<DxTableOrder> orders { get { return _orders; } set { _orders = value; } }

		//private List<DxBatchOcharts> _batches;
		//public List<DxBatchOcharts> batches { get { return _batches; } set { _batches = value; } }

		private DataTable _dt;

		public int numCrosstabs { get { return CountTables(DxOutputtype.Crosstabs); } }



		public DataTable dt { get { return _dt; } set { _dt = value; } }

		public DxTableFactory(Dataproject mydataproject, DPData mydpdata, List<DxTableOrder> myorders)
		{
			_orders = myorders;
			_dpdata = mydpdata;
			_dataproject = mydataproject;

			ProcessOrders();
		}


		//public DxTableFactory(DataTable mydt, DxTableOrder order)
		//{
		//	_orders = new List<DxTableOrder> { order };
		//	_dt = mydt;
		//	ProcessOrders();

		//}


		//public DxTableFactory(DataTable mydt, List<DxTableOrder> myorders)
		//{
		//	_orders = myorders ;
		//	_dt = mydt;
		//	ProcessOrders();
		//}

		//public DxTableFactory()
		//{
		//	//
		//	// TODO: Add constructor logic here
		//	//
		//}


		public void ProcessOrders()
		{
			if (_dpdata != null)
			{
				foreach (DxTableOrder order in orders)
				{
					ProcessOrder(order);
				}
			}
		}

		public void ProcessOrder(DxTableOrder order)
		{
			if (order.batches.Count > 0) order.batches.Clear();


			bool hassameworksheet = order.HasSameWorksheet(_dpdata);
			
			if(!hassameworksheet)
			{
				//Need new DPData
				_dataproject.selectedsheet = order.worksheet;
				_dpdata = new DPData(_dataproject, order.filter);
			}


			bool hassamefilter = order.HasSameFilter(_dpdata);

			if (!hassamefilter)
			{
				_dpdata.filter = order.filter;	
			}

			_dt = _dpdata.dt;


			//Each order will result in a list of batches
			//List<DxBatchOcharts> batchlist = new List<DxBatchOcharts>();
			List<DxTableBatch> batchlist = new List<DxTableBatch>();

			foreach (DxTableSettings settings in order.list_settings)
			{
				if (settings.outputtype == DxOutputtype.Crosstabs)
				{
					DxCrosstabsSettings mysettings = (DxCrosstabsSettings)settings;
					DxTableBatch batch = new DxTableBatch(mysettings, dt);
					PrepareBatch(batch, settings);
					batchlist.Add(batch);
				}
			}

			order.batches.AddRange(batchlist);

			//The invoice serves as a table of contents for what was actually created
			order.PrepareInvoice();

		}

		public void PrepareBatch(DxTableBatch batch, DxTableSettings settings)
		{
			if (batch.tables.Count > 0)
			{
				batch.maxCol = settings.maxCol;
				batch.maxRow = settings.maxRow;
				batch.layout = settings.layout;
				foreach (DxTable table in batch.tables)
				{
					//do anything?
				}
			}

		}

		public int CountTables(DxOutputtype type)
		{
			int n = 0;
			foreach (DxTableOrder order in orders)
			{
				foreach (DxTableBatch batch in order.batches)
				{
					if (batch.outputtype == type)
					{
						n += batch.tables.Count;
					}
				}
			}
			return n;
		}

	}

}