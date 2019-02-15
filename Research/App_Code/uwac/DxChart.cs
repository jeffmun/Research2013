using System;
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
	public abstract class DxChart : DxOutputitem
	{
		//public string guid { get; set; }
		//public string emptymsg { get { return _emptymsg; } set { _emptymsg = value; } }
		//public string infomsg { get { return _infomsg; } set { _infomsg = value; } }

		//private string _emptymsg;
		//private string _infomsg;

		private WebChartControl _chart;
		private XYDiagram _xydiagram;
		private ASPxCheckBox _chk;
		private int _n;

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

		public List<string> _colorLevels { get; set; }


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
				XYDiagramPane pane = new XYDiagramPane(String.Format("pane{0}", i));
				pane.Title.Text = String.Format("foo {0}", i);
				pane.Title.Alignment = StringAlignment.Near;
				pane.Title.Visibility = DefaultBoolean.True;

				_xydiagram.Panes.Add(pane);
			}
			_xydiagram.PaneLayout.Direction = layoutdirection;
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
			if(sub != null) AddTitles( main, new List<string>() { sub }, x, y, 10f);
			else AddTitles(main, new List<string>() , x, y, 10f);
		}
		public void AddTitles(string main, string sub, string x, string y, float fontsize)
		{
			AddTitles( main, new List<string>() { sub }, x, y, fontsize);
		}
		public void AddTitles(string main, List<string> sub, string x, string y, float fontsize)
		{

			Font fnt_main = new Font("Arial", fontsize);
			Font fnt_x = new Font("Arial", fontsize);
			Font fnt_y = new Font("Arial", fontsize);
			ChartTitle mainTitle = new ChartTitle();
			if (sub != null)
			{
				if (sub.Count == 0)
				{
					mainTitle = new ChartTitle()
					{
						Text = main,
						Dock = ChartTitleDockStyle.Top
						//Indent = 20
					};
				}
				else
				{
					string mainTitle_subtitles = (sub == null) ? "" : String.Join(Environment.NewLine, sub);

					string title_to_use = (main == mainTitle_subtitles) ? main : String.Format("{0}{1}{2}", main, Environment.NewLine, mainTitle_subtitles);

					mainTitle = new ChartTitle()
					{
						Text = title_to_use,
						Dock = ChartTitleDockStyle.Top
						//Indent = 20
					};
				}
			}
			else
			{
				mainTitle.Text = main;
			}

			mainTitle.Font = fnt_main;
			mainTitle.Alignment = StringAlignment.Near;
			mainTitle.WordWrap = true;
			mainTitle.MaxLineCount = 8;

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


		public void SetMainTitle(string main)
		{
			SetMainTitle(main, 12f);
		}

		public void SetMainTitle(string main, float fontsize)
		{
			Font fnt_main = new Font("Arial", fontsize);
			_chart.Titles[0].Text = main;
			_chart.Titles[0].Font = fnt_main;
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

		public void LegendByColorLevels(List<Color> colors)
		{
			LegendByColorLevels(colors, _colorLevels);
		}


		public void LegendByColorLevels(List<Color> colors, List<string> levels)
		{
			for (int lev = 0; lev < levels.Count; lev++)
			{
				// Create a new custom item.
				CustomLegendItem item = new CustomLegendItem();
				chart.Legend.CustomItems.Add(item);
				// Specify its text and marker.
				item.Text = levels[lev];
				int coloridx = lev; //(_coloroverride >= 0) ? _coloroverride : lev;
				item.MarkerColor = colors[coloridx % colors.Count];
			}

		}

		public Table ManualColorLegend(List<Color> colors)
		{
			Table legend = new Table();
			for (int i = 0; i < this._colorLevels.Count; i++)
			{
				string s = this._colorLevels[i];
				System.Web.UI.WebControls.TableRow tr = new System.Web.UI.WebControls.TableRow();
				TableCell td1 = new TableCell();
				TableCell td2 = new TableCell();
				td1.BackColor = colors[i];
				td1.Width = 15;
				td1.Style.Add("padding", "4px");
				td2.Style.Add("padding", "4px");
				td2.Text = s;
				td1.BorderColor = Color.White;
				td2.BorderColor = Color.White;
				td1.BorderWidth = 2;
				td2.BorderWidth = 2;
				tr.Cells.Add(td1);
				tr.Cells.Add(td2);
				legend.Rows.Add(tr);
			}
			return legend;
		}



	}



	[Serializable]
	public class DxMarkerKinds :  List<MarkerKind>
	{
		//List<MarkerKind> _markers = new List<MarkerKind>();

		public DxMarkerKinds()
		{
			this.Add(MarkerKind.Circle);
			this.Add(MarkerKind.Square);
			this.Add(MarkerKind.Triangle);
			this.Add(MarkerKind.Cross);
			this.Add(MarkerKind.Diamond);
			this.Add(MarkerKind.Star);
			this.Add(MarkerKind.Pentagon);
			this.Add(MarkerKind.InvertedTriangle);

		}
	}

}