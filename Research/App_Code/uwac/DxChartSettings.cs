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


	public abstract class DxChartSettings : IOutputtype
	{
		private DxOutputtype _outputtype;
		private int _W = 300; //width
		private int _H = 300; //height
		private int _minx = -999;
		private int _maxx = -999;
		private int _miny = -999;
		private int _maxy = -999;
		private int _maxRow = 4;
		private int _maxCol = 2;
		private int _markersize = 8;
		private bool _hideEmptyCharts = true;

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
		private DxLayout _chartlayout = DxLayout.Horizontal;
		private ScaleMode _ScaleMode = ScaleMode.Continuous;
		public int maxRow { get { return _maxRow; } set { _maxRow = value; } }
		public int maxCol { get { return _maxCol; } set { _maxCol = value; } }
		public bool hideEmptyCharts {  get { return _hideEmptyCharts; } set { _hideEmptyCharts = value; } }

		public DxOutputtype outputtype { get { return _outputtype; } set { _outputtype = value; } }
		public int W { get { return _W; } set { _W = value; } }
		public int H { get { return _H; } set { _H = value; } }
		public int minx { get { return _minx; } set { _minx = value; } }
		public int maxx { get { return _maxx; } set { _maxx = value; } }
		public int miny { get { return _miny; } set { _miny = value; } }
		public int maxy { get { return _maxy; } set { _maxy = value; } }
		public int markersize { get { return _markersize; } set { _markersize = value; } }

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
		public DxLayout chartlayout { get { return _chartlayout; } set { _chartlayout = value; } }
		public ScaleMode ScaleMode { get { return _ScaleMode; } set { _ScaleMode = value; } }
		public List<string> setup_errors { get; set; }

		public bool HasVars {
			get{
				int n_num = (_numvars == null) ? 0 : _numvars.Count;
				int n_date = (_datevars == null) ? 0 : _datevars.Count;
				int n_age = (_agevars == null) ? 0 : _agevars.Count;
				bool hasvars =  (n_num + n_date + n_age == 0) ? false : true;
				return hasvars;
			}
		}

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
			Initialize();
		}

		public DxChartSettings(DxOutputtype mydxOutputType)
		{
			SetOutputtype(mydxOutputType);
			Initialize();
		}

		public void Initialize()
		{
			_numvars = new List<string>();
			_datevars = new List<string>();
			_agevars = new List<string>();
			_colors = DefaultColors();
			setup_errors = new List<string>();
		}

		public void SetOutputtype(DxOutputtype mydxOutputtype)
		{
			_outputtype = mydxOutputtype;
			_colors = DefaultColors();
		}

		protected List<Color> DefaultColors()
		{
			List<Color> mycolors = new List<Color>();

			mycolors.Add(Color.Red);
			mycolors.Add(Color.Green);
			mycolors.Add(Color.Blue);
			mycolors.Add(Color.Yellow);


			mycolors.Add((Color)ColorTranslator.FromHtml("#377eb8"));
			mycolors.Add((Color)ColorTranslator.FromHtml("#e41a1c"));
			mycolors.Add((Color)ColorTranslator.FromHtml("#4daf4a"));
			mycolors.Add((Color)ColorTranslator.FromHtml("#984ea3"));
			mycolors.Add((Color)ColorTranslator.FromHtml("#626567"));


			return mycolors;

		}
	}



	public enum DxWideMode : int
	{
		OnlyWithinTimept = 0,
		OnlyAutoCorrAcrossTimept = 1,
		PoolAcrossTimept = 2
	}
}


