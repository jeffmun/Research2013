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
using DevExpress.Web.ASPxPivotGrid;
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
	/// Summary description for DxCharts
	/// </summary>

	public class DxPivot : ASPxPivotGrid
	{
		public DxPivot()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public DxPivot(DataTable dt, List<string> rowvars, List<string> colvars)
		{
			//this.DataSource = dt;
			



		}

	}

}