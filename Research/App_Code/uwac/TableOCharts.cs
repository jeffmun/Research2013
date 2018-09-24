using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Utils;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using uwac;

/// <summary>
/// Summary description for TableOCharts
/// </summary>


public enum LayoutMode : int
{
	Horizontal = 0,
	Vertical = 1,
	Rectangle = 2,
	Diagonal = 3
}


public class TableOCharts
{
	private Table _table;
	private List<DxCharts.Mychart> _charts;
	private LayoutMode _layoutmode = LayoutMode.Horizontal;
	private int _maxCol;
	private int _W = 300;
	private int _H = 300;
	private double _pctW = 1.0;
	private double _pctH = 1.0;
	private bool _hideEmptyCharts = false;


	public Table table { get { return _table; } }


	public TableOCharts(List<DxCharts.Mychart> chartslist, LayoutMode mode)
	{
		_charts = chartslist;
		_layoutmode = mode;
	}


	public TableOCharts(List<DxCharts.Mychart> charts, int W, int H, double pctW, double pctH, int maxCol, bool hideEmptyCharts, string title)
	{
		int newW = Convert.ToInt32(W * pctW);
		int newH = Convert.ToInt32(H * pctH);
		_W = W;
		_H = H;
		_pctW = pctW;
		_pctH = pctH;
		_maxCol = maxCol;
		_hideEmptyCharts = hideEmptyCharts;

		if (_layoutmode == LayoutMode.Horizontal)
		{
			_table = TableHelper.HorizontalTable(_charts, _W, _H, _pctW, _pctH, _maxCol, _hideEmptyCharts);
		}
		else if (_layoutmode == LayoutMode.Vertical)
		{
			_table = TableHelper.VerticalTable(_charts, _W, _H, _pctW, _pctH, _hideEmptyCharts);
		}
		else if (_layoutmode == LayoutMode.Rectangle)
		{
			_table = TableHelper.HorizontalTable(_charts, _W, _H, _pctW, _pctH, _maxCol, _hideEmptyCharts);
		}
		else if (_layoutmode == LayoutMode.Diagonal)
		{
			_table = TableHelper.UpperDiagTable(_charts, _W, _H, _pctW, title);

		}

	}





	#region Scatterplot Extras



	//public Table TableOfPairwiseScatterplots(DxCharts dxcharts, DataTable dt, List<string> numvars, string title, int W, int H, int colorindex, string colorsby)
	//{
	//	List<Table> mytables = new List<Table>();
	//	List<DxCharts.Mychart> scats = PairwiseScatterplots(dxcharts, dt, numvars, title, dxcharts.color(colorindex), colorsby);
	//	mytables.Add(TableHelper.UpperDiagTable(scats, W, H, 1, title));


	//	//foreach (DataSubset subset in subsets)
	//	//{
	//	//	List<WebChartControl> scats = PairwiseScatterplots(subset.dt, numvars);
	//	//	mytables.Add(UpperDiagTable(scats, 1));
	//	//};

	//	Table t = TableHelper.HorizontalTable(mytables);

	//	return t;
	//}

	//public Table TableOfPairwiseScatterplots(DxCharts dxcharts, List<DataSubset> subsets, List<string> numvars, string title, int W, int H, int colorindex, string colorsby)
	//{
	//	List<Table> mytables = new List<Table>();

	//	foreach (DataSubset subset in subsets)
	//	{
	//		List<DxCharts.Mychart> scats = PairwiseScatterplots(dxcharts, subset.dt, numvars, title, dxcharts.color(colorindex), colorsby);
	//		mytables.Add(TableHelper.UpperDiagTable(scats, W, H, 1, title));
	//	};

	//	Table t = TableHelper.HorizontalTable(mytables);

	//	return t;
	//}

	//public List<DxCharts.Mychart> PairwiseScatterplots(DxCharts dxcharts, DataTable dt, List<string> numvars, string title, Color mycolor, string colorsby)
	//{
	//	List<DxCharts.Mychart> charts = new List<DxCharts.Mychart>();

	//	numvars.Remove("id");

	//	int counter = 0;
	//	foreach (string v in numvars)
	//	{
	//		counter++;
	//		for (int i = counter; i < numvars.Count; i++)
	//		{
	//			Scatterplot scat = new Scatterplot(dxcharts, dt, numvars[i], v, title, mycolor, colorsby);//Swap the x,y order so it shows up right in the table
	//			charts.Add(scat);
	//		}
	//	}
	//	return charts;
	//}


	//public Table TableOfRectangleScatterplots(DxCharts dxcharts, DataTable dt, List<string> numvars_x, List<string> numvars_y, string title, int W, int H, int colorindex, string colorsby)
	//{
	//	List<DxCharts.Mychart> scats = RectangleScatterplots(dxcharts, dt, numvars_x, numvars_y, title, dxcharts.color(colorindex), colorsby);

	//	Table t = TableHelper.HorizontalTable(scats, W, H, 1, 1, numvars_x.Count, false);

	//	return t;
	//}


	//public List<DxCharts.Mychart> RectangleScatterplots(DxCharts dxcharts, DataTable dt, List<string> numvars_x, List<string> numvars_y, string title, Color mycolor, string colorsby)
	//{
	//	List<DxCharts.Mychart> charts = new List<DxCharts.Mychart>();

	//	numvars_x.Remove("id");
	//	numvars_y.Remove("id");

	//	int counter = 0;
	//	foreach (string vx in numvars_x)
	//	{
	//		counter++;
	//		for (int i = counter; i < numvars_y.Count; i++)
	//		{
	//			Scatterplot scat = new Scatterplot(dxcharts, dt, numvars_y[i], vx, title, mycolor, colorsby);//Swap the x,y order so it shows up right in the table
	//			charts.Add(scat);
	//		}
	//	}
	//	return charts;
	//}




	#endregion
}
