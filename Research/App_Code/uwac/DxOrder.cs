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
		private DataTable _dt;
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

		public DataTable dt { get { return _dt; } set { _dt = value; } }

		public DxOrder()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public void SetFilter(string myfilter, List<string> groups, List<string> timepts)
		{
			string groups_sqlcode = (groups == null) ? "" : String.Format(" and group in ('{0}') ", String.Join("','", groups));
			string timepts_sqlcode = (timepts == null) ? "" : String.Format(" and timept in ('{0}') ", String.Join("','", timepts));
			filter = String.Format("{0}{1}{2}", myfilter, groups_sqlcode, timepts_sqlcode);

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
}