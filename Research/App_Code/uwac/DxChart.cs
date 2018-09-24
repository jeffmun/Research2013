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
	/// Summary description for DxChart
	/// </summary>
	public abstract class DxChart
	{
		private WebChartControl _chart;
		private XYDiagram _xydiagram;
		private string _emptymsg;
		private ASPxCheckBox _chk;


		public WebChartControl chart { get { return _chart; } set { _chart = value; } }
		public XYDiagram xydiagram {  get { return _xydiagram; } set { _xydiagram = value; } }
		public ASPxCheckBox chk
		{
			get { return _chk; }
		}
		public string emptymsg { get { return _emptymsg; } set { _emptymsg = value; } }

		public DxChart()
		{
			_chart = new WebChartControl();
			_xydiagram = new XYDiagram();
			_chart.Diagram = _xydiagram;

			_xydiagram.AxisX.GridLines.Visible = true;
			_xydiagram.AxisY.GridLines.Visible = true;
			_xydiagram.AxisX.GridLines.MinorVisible = true;
			_xydiagram.AxisY.GridLines.MinorVisible = true;
		}

		public void AddPanes(int numpanes, PaneLayoutDirection layoutdirection)
		{
			//Panes
			for (int i = 0; i < numpanes; i++)
			{
				_xydiagram.Panes.Add(new XYDiagramPane(String.Format("pane{0}", i)));
			}
			_xydiagram.PaneLayoutDirection = layoutdirection;
		}



		#region Titles
		public void AddTitles( string main, string sub, string x, string y)
		{
			AddTitles( main, new List<string>() { sub }, x, y, 10f);
		}
		public void AddTitles(string main, string sub, string x, string y, float fontsize)
		{
			AddTitles( main, new List<string>() { sub }, x, y, fontsize);
		}
		public void AddTitles(string main, List<string> sub, string x, string y, float fontsize)
		{
			string mainTitle_subtitles = String.Join("; ", sub);

			Font fnt_main = new Font("Arial", fontsize);
			Font fnt_x = new Font("Arial", fontsize);
			Font fnt_y = new Font("Arial", fontsize);

			ChartTitle mainTitle = new ChartTitle()
			{
				Text = String.Format("{0} {1} {2}", main, Environment.NewLine, mainTitle_subtitles),
				Dock = ChartTitleDockStyle.Top
				//Indent = 20
			};

			ChartTitle xTitle = new ChartTitle() { Text = x, Dock = ChartTitleDockStyle.Bottom };
			ChartTitle yTitle = new ChartTitle() { Text = y, Dock = ChartTitleDockStyle.Left };

			mainTitle.Font = fnt_main;
			xTitle.Font = fnt_x;
			yTitle.Font = fnt_y;

			mainTitle.Alignment = StringAlignment.Near;

			_chart.Titles.Add(mainTitle);
			_chart.Titles.Add(xTitle);
			_chart.Titles.Add(yTitle);

		}
		#endregion


	}

}