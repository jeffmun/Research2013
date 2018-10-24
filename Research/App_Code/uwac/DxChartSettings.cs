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
	/// Summary description for DxChartSettings
	/// </summary>


	public abstract class DxChartSettings : IChartType
	{
		private DxChartType _charttype;
		private int _W = 300; //width
		private int _H = 300; //height
		private int _minx = -999;
		private int _maxx = -999;
		private int _miny = -999;
		private int _maxy = -999;

		private string _title;
		private string _subtitle;
		private string _xaxisvar;
		private string _yaxisvar;
		private string _colorvar = "none";
		private string _panelvar = "none";
		private List<string> _numvars;
		private List<string> _datevars;
		private List<string> _agevars;
		private PaneLayoutDirection _panesLayoutDirection = PaneLayoutDirection.Horizontal;
		private DxChartLayout _chartlayout = DxChartLayout.Horizontal;
		public int maxRow { get; set; }
		public int maxCol { get; set; }

		public DxChartType DxChartType { get { return _charttype; } set { _charttype = value; } }
		public int W { get { return _W; } set { _W = value; } }
		public int H { get { return _H; } set { _H = value; } }
		public int minx { get { return _minx; } set { _minx = value; } }
		public int maxx { get { return _maxx; } set { _maxx = value; } }
		public int miny { get { return _miny; } set { _miny = value; } }
		public int maxy { get { return _maxy; } set { _maxy = value; } }
		public string title { get { return _title; } set { _title = value; } }
		public string subtitle { get { return _subtitle; } set { _subtitle = value; } }
		public string xaxisvar { get { return _xaxisvar; } set { _xaxisvar = value; } }
		public string yaxisvar { get { return _yaxisvar; } set { _yaxisvar = value; } }
		public string colorvar { get { return _colorvar; } set { _colorvar = value; } }
		public string panelvar { get { return _panelvar; } set { _panelvar = value; } }
		public List<string> numvars { get { return _numvars; } set { _numvars = value; } }
		public List<string> datevars { get { return _datevars; } set { _datevars = value; } }
		public List<string> agevars { get { return _agevars; } set { _agevars = value; } }
		public PaneLayoutDirection panesLayoutDirection { get { return _panesLayoutDirection; } set { _panesLayoutDirection = value; } }
		public DxChartLayout chartlayout { get { return _chartlayout; } set { _chartlayout = value; } }

		private List<Color> _colors;

		public List<Color> colors
		{
			get { return _colors; }
			set { _colors = value; }
		}

		public Color color(int idx)
		{
			int x = idx % _colors.Count;
			return _colors[x];
		}

		public void SetColor(Color c, int index)
		{
			if (index >= _colors.Count)
			{
				_colors.Add(c);
			}
			else
			{
				_colors[index] = c;
			}
		}

		public DxChartSettings()
		{
		}

		public DxChartSettings(DxChartType dxChartType)
		{
			SetChartType(dxChartType);
		}

		public void SetChartType(DxChartType dxChartType)
		{
			_charttype = dxChartType;
		}
	}


	public interface IChartType
	{
		void SetChartType(DxChartType dxChartType);

	}

	public enum DxChartType : int
	{
		Histogram = 0,
		Barchart = 1,
		StackedBarchart = 2,
		Scatterplot = 3,
		Lineplot = 4,
		PCA = 5
	}

	public enum DxChartLayout
	{
		Horizontal = 1,
		Vertical = 2,
		Upper = 3,
		UpperDiag = 4,
		Lower = 5,
		LowerDiag = 6
	}


}


