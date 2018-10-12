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
	/// DxChartFactory will produce a list of DxCharts
	/// </summary>
	[Serializable]
	public class DxChartOrders
	{

		public DxBarchartSettings settingsbar { get; set; }
		public DxScatterplotSettings settingsscat { get; set; }
		public DxHistogramSettings settingshist { get; set; }
		public DxLineplotSettings settingsline { get; set; }

		/// <summary>
		/// Summary description for DxChartOrders
		/// </summary>

		public DxChartOrders()
		{
			//settingshist = new DxHistogramSettings();
			//settingsbar = new DxBarchartSettings();
			//settingsline = new DxLineplotSettings();
			//settingsscat = new DxScatterplotSettings();
		}
	}
}