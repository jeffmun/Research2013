using System;
using System.Collections.Generic;
using System.Data;
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
	/// Summary description for DxBatchOcharts
	/// </summary>
	public class DxBatchOcharts
	{

		private List<DxChart> _charts;

		public List<DxChart> charts { get { return _charts; } set { _charts = value; } }
		public DxChartType charttype { get; set; }
		public DxChartLayout chartlayout { get; set; }
		public int maxRow { get; set; }
		public int maxCol { get; set; }


		public DxBatchOcharts()
		{
			_charts = new List<DxChart>();
		}
	}



}