﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Linq;
using System.Diagnostics;
using System.IO;
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
	[Serializable]
	public abstract class DxChart
	{
		private WebChartControl _chart;
		private XYDiagram _xydiagram;
		private string _emptymsg;
		private string _infomsg;
		private ASPxCheckBox _chk;
		private int _n;
		public string guid { get; set; }
		public int W { get; set; }
		public int H { get; set; }
		public bool isdiag { get; set; }
		public bool isempty { get; set; }
		public int n
		{
			get { return _n; }
			set { _n = value; }
		}

		public WebChartControl chart { get { return _chart; } set { _chart = value; } }
		public XYDiagram xydiagram {  get { return _xydiagram; } set { _xydiagram = value; } }
		public ASPxCheckBox chk
		{
			get { return _chk; }
		}
		public string emptymsg { get { return _emptymsg; } set { _emptymsg = value; } }
		public string infomsg { get { return _infomsg; } set { _infomsg = value; } }


		public DxChart()
		{
			Guid newguid = Guid.NewGuid();
			guid = newguid.ToString();
			isdiag = false;
			isempty = false;
			_chart = new WebChartControl();
			_xydiagram = new XYDiagram();
			_chart.Diagram = _xydiagram;
			_chart.EnableViewState = true;

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
		public void AddTitles(string main)
		{
			List<string> subs = new List<string>();
			subs = null;
			AddTitles(main, subs, null, null , 10f);
		}
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
			string mainTitle_subtitles = (sub == null) ? "" :  String.Join("; ", sub);

			Font fnt_main = new Font("Arial", fontsize);
			Font fnt_x = new Font("Arial", fontsize);
			Font fnt_y = new Font("Arial", fontsize);

			ChartTitle mainTitle = new ChartTitle()
			{
				Text = String.Format("{0} {1} {2}", main, Environment.NewLine, mainTitle_subtitles),
				Dock = ChartTitleDockStyle.Top
				//Indent = 20
			};

			mainTitle.Font = fnt_main;
			mainTitle.Alignment = StringAlignment.Near;
			_chart.Titles.Add(mainTitle);

			if (x != null)
			{
				ChartTitle xTitle = new ChartTitle() { Text = x, Dock = ChartTitleDockStyle.Bottom };
				xTitle.Font = fnt_x;
				_chart.Titles.Add(xTitle);
			}
			if (y != null)
			{
				ChartTitle yTitle = new ChartTitle() { Text = y, Dock = ChartTitleDockStyle.Left };
				yTitle.Font = fnt_y;
				_chart.Titles.Add(yTitle);
			}

		}
		#endregion



		public void AddStrip_date(string striplabel, Color color, DateTime t1, DateTime t2)
		{
			Strip strip1 = new Strip(striplabel, t1, t2);
			strip1.Color = color;
			_xydiagram.AxisX.Strips.Add(strip1);

		}




		public void AddTextAnnotation(string txt, DateTime x, Double y)
		{
			AddTextAnnotation(txt, x, y, 12f, 0, Color.Black);
		}
		public void AddTextAnnotation(string txt, DateTime x, Double y, float fontsize)
		{
			AddTextAnnotation(txt, x, y, fontsize, 0, Color.Black);
		}
		public void AddTextAnnotation(string txt, DateTime x, Double y, float fontsize, Color textcolor)
		{
			AddTextAnnotation(txt, x, y, fontsize, 0, textcolor);
		}


		public void AddTextAnnotation(string txt, DateTime x, Double y, float fontsize, int angle, Color textcolor)
		{

			string annotationname = String.Format("a{0}", this.chart.Annotations.Count);
			TextAnnotation myTextAnnotation = this.chart.Annotations.AddTextAnnotation(annotationname, txt);

			Font font = new Font("Arial", fontsize);

			RelativePosition position = new RelativePosition();
			myTextAnnotation.ShapePosition = position;

			PaneAnchorPoint anchorPoint = new PaneAnchorPoint();
			myTextAnnotation.AnchorPoint = anchorPoint;

			position.ConnectorLength = 0;
			anchorPoint.AxisXCoordinate.AxisValue = x;
			anchorPoint.AxisYCoordinate.AxisValue = y;

			myTextAnnotation.TextAlignment = StringAlignment.Near;
			myTextAnnotation.Angle = angle;
			myTextAnnotation.Font = font;
			myTextAnnotation.TextColor = textcolor;
			myTextAnnotation.BackColor = Color.Transparent;
			myTextAnnotation.ShapeKind = ShapeKind.RoundedRectangle;
			myTextAnnotation.Border.Color = Color.Transparent;
			myTextAnnotation.ConnectorStyle = AnnotationConnectorStyle.None;

		}


	}

}