using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for DxOrder
	/// </summary>
	
	[Serializable]
	public abstract class DxOrder
	{
		private DataTable _dt_selectedvars;
		private string _filter;
		public OrderType ordertype { get; set; }
		public List<string> include_timepts { get; set; }
		public List<string> include_groups { get; set; }
		public string filter { get { return _filter; } set { _filter= value; } }
		private List<string> _vars;
		public List<string> vars { get { return _vars; } set { _vars = value; } }
		public string worksheet { get; set; }
		public bool isOrderFilled { get; set; }
		public int ordernum { get; set; }
		private List<string> _errors;
		public List<string> errors { get { return _errors; }  }
		public OrderSaveState orderSaveState { get; set; }


		public DataTable dt_selectedvars { get { return _dt_selectedvars; } set { _dt_selectedvars = value; } }

		public DxOrder()
		{
			//
			// TODO: Add constructor logic here
			//
			_errors = new List<string>();
		}

		//public void SetFilter(string myfilter, List<string> groups, List<string> timepts)
		//{
		//	string groups_sqlcode = (groups == null) ? "" : String.Format(" and group in ('{0}') ", String.Join("','", groups));
		//	string timepts_sqlcode = (timepts == null) ? "" : String.Format(" and timept in ('{0}') ", String.Join("','", timepts));
		//	filter = String.Format("{0}{1}{2}", myfilter, groups_sqlcode, timepts_sqlcode);

		//}


		public bool HasSameFilter(DPData dpdata)
		{
			bool hassamefilter = (this.filter == dpdata.filter) ? true : false;
			return hassamefilter;
		}
		public bool HasSameWorksheet(DPData dpdata)
		{
			bool hassameworksheet = (this.worksheet == dpdata.selectedsheet) ? true : false;
			return hassameworksheet;
		}

	}

	[Serializable]
	public class SessionOrders
	{
		public List<DxOrder> orders { get; set; }
		public List<DxChartOrder> chartorders { get; set; }
		public List<DxTableOrder> tableorders { get; set; }

		public SessionOrders()
		{
			orders = new List<DxOrder>();
			chartorders = new List<DxChartOrder>();
			tableorders = new List<DxTableOrder>();
		}

		public bool HasSameWkshtFilterVars(int idx1, string type, int offset)
		{
			if (type == "chart") return HasSameCharts(idx1, idx1 + offset);
			else return true;

		}

		public bool HasSameCharts(int idx1, int idx2)
		{
			if (idx1 == 0 & idx2 < idx1) return false; //first one needs to be printed so false
			if (chartorders.Count > idx1 & chartorders.Count > idx2)
			{
				DxChartOrder o1 = chartorders[idx1];
				DxChartOrder o2 = chartorders[idx2];

				bool b_vars = (o1.dt_selectedvars == o2.dt_selectedvars) ? true : false;
				bool b_worksheet = (o1.worksheet == o2.worksheet) ? true : false;
				bool b_filter = (o1.filter == o2.filter) ? true : false;
				bool hassame = (b_vars & b_worksheet & b_filter) ? true : false;
				return hassame;
			}
			else return false;
		}


		public void SaveOrder(DxChartOrder order)
		{
			order.ordernum = orders.Count + 1;
			orders.Add(order);
			chartorders.Add(order);
		}
		public void SaveOrder(DxTableOrder order)
		{
			order.ordernum = orders.Count + 1;
			orders.Add(order);
			tableorders.Add(order);
		}

		public void DeleteOrder(int ordernum_todelete)
		{

			DxOrder order_to_del = null;
			try
			{
				order_to_del = this.orders.Where(o => o.ordernum == ordernum_todelete).First();
			}
			catch (Exception ex) { }


			if (order_to_del != null)
			{
				OrderType otype = order_to_del.ordertype;
				this.orders.Remove(order_to_del);

				if (otype == OrderType.chart)
				{
					DxChartOrder chartorder_to_del = null;
					try
					{
						chartorder_to_del = this.chartorders.Where(o => o.ordernum == ordernum_todelete).First();
					}
					catch (Exception ex) { }
					if (order_to_del != null)
					{
						this.chartorders.Remove(chartorder_to_del);
					}
				}
				else if (otype == OrderType.table)
				{
					DxTableOrder tableorder_to_del = null;
					try
					{
						tableorder_to_del = this.tableorders.Where(o => o.ordernum == ordernum_todelete).First();
					}
					catch (Exception ex) { }
					if (order_to_del != null)
					{
						this.tableorders.Remove(tableorder_to_del);
					}
				}

			}



		}

		public int NumSavedOrders()
		{
			return orders.Count;
		}
	}

	public enum OrderType
	{
		chart = 0,
		table = 1
	}

	public enum OrderSaveState
	{
		NotSaved = 0,
		ReadyToSave = 1,
		Saved = 2,
		ReadyToDelete = 3
	}
}