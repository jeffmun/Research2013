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
		private List<string> _vars;
		public List<string> vars { get { return _vars; } set { _vars = value; } }
		public string worksheet { get; set; }
		public int numHist { get; set; }
		public int numBar { get; set; }
		public int numScat { get; set; }
		public int numLine { get; set; }
		public DxBarchartSettings settingsbar { get; set; }
		public DxScatterplotSettings settingsscat { get; set; }
		public DxHistogramSettings settingshist { get; set; }
		public DxLineplotSettings settingsline { get; set; }

		/// <summary>
		/// Summary description for DxChartOrders
		/// </summary>

		public DxChartOrder()
		{
			_vars = new List<string>();
			//settingshist = new DxHistogramSettings();
			//settingsbar = new DxBarchartSettings();
			//settingsline = new DxLineplotSettings();
			//settingsscat = new DxScatterplotSettings();
		}

		public void PopulateVars()
		{

			if (settingshist != null) _vars.AddRange(settingshist.numvars.Except(_vars));
			if (settingsbar != null) _vars.AddRange(settingsbar.numvars.Except(_vars));
			if (settingsscat != null) _vars.AddRange(settingsscat.numvars.Except(_vars));
			if (settingsline != null) _vars.AddRange(settingsline.numvars.Except(_vars));
		}

		public void UpdateCounts(DxChartFactory factory)
		{
			numHist = factory.CountCharts(DxChartType.Histogram);
			numBar = factory.CountCharts(DxChartType.Barchart);
			numLine = factory.CountCharts(DxChartType.Lineplot);
			numScat = factory.CountCharts(DxChartType.Scatterplot);

		}

	}


	[Serializable]
	public class DxChartOrders : List<DxChartOrder>
	{
		//private List<DxChartOrder> _orders;
		//public List<DxChartOrder> orders { get { return _orders; } set { _orders = value; } }

		/// <summary>
		/// Summary description for DxChartOrders
		/// </summary>

		public DxChartOrders()
		{
			List<DxChartOrder> orders = new List<DxChartOrder>();
		}

		public DataTable ToDataTable()
		{
			DataTable dt = new DataTable();
			DataColumn c0 = new DataColumn("order_number", typeof(int));
			DataColumn c1 = new DataColumn("worksheet", typeof(string));
			DataColumn c2 = new DataColumn("vars", typeof(string));
			DataColumn c3 = new DataColumn("charts", typeof(string));

			dt.Columns.Add(c0);
			dt.Columns.Add(c1);
			dt.Columns.Add(c2);
			dt.Columns.Add(c3);

			int counter = 1;
			foreach(DxChartOrder order in this)
			{
				string scat_text1 = "";
				string scat_text2 = "";
				if (order.settingsscat != null) {
					scat_text1 = (order.numScat > 0 & !order.settingsscat.showhist) ? String.Format(" Scat({0})", order.numScat) : "";
					scat_text2 = (order.numScat > 0 &  order.settingsscat.showhist) ? String.Format(" Scat({0})", order.numScat) : "";
				}

				string charts = String.Format("{0}{1}{2}{3}{4}"
					, (order.numHist > 0) ? String.Format("Hist({0})", order.numHist) : ""
					, (order.numBar > 0) ? String.Format(" Bar({0})", order.numBar) : ""
					, (order.numLine > 0) ? String.Format(" Line({0})", order.numLine) : ""
					, scat_text1
					, scat_text2);

				string myvars = (order.vars != null) ? String.Join(",", order.vars) : "NONE(?)";

				DataRow row = dt.NewRow();
				row["order_number"] = counter;
				row["worksheet"] = order.worksheet;
				row["vars"] = myvars;
				row["charts"] = charts;
				dt.Rows.Add(row);
				counter++;
			}

			return dt;
		}
	}
}