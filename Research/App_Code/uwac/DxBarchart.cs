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
	/// Summary description for DxBarchart
	/// </summary>


	#region Barchart

	public class DxBarchart : DxChart
	{
		DescStats _statstable;
		AxesRange _axesrange;
		private List<string> _levels1;
		private List<string> _levels2;

		private DxChartSettings _settings;


		public AxesRange axesrange
		{
			get { return _axesrange; }
			set { _axesrange = value; }
		}
		public DescStats statstable
		{
			get { return _statstable; }
			set { _statstable = value; }
		}
		public List<string> levels1
		{
			get { return _levels1; }
			set { _levels1 = value; }
		}
		public List<string> levels2
		{
			get { return _levels2; }
			set { _levels2 = value; }
		}

		public DxBarchart(DxChartSettings settings, DataTable mydt) //, string xvar, string yvar, string titleinput, string colorsby)
		{
			_settings = settings;
			//Color col = _settings.color(0);

			CreateBarchart(mydt);
		}
		//public DxBarchart(DataTable mydt, string xvar, string yvar, string titleinput, Color mycolor, string colorsby)
		//{
		//	_settings.xaxisvar = xvar;
		//	_settings.yaxisvar = yvar;
		//	_settings.title = titleinput;
		//	_settings.colorvar = colorsby;
		//	Color col = _settings.color(0);
		//}



		public void CreateBarchart(DataTable mydt) //, string xvar, string yvar, string mytitle, Color mycolor, string colorsby)
		{

			List<string> grouping_vars = new List<string>();
			grouping_vars.Add(_settings.xaxisvar);
			grouping_vars.Add(_settings.colorvar);
			//grouping_vars.Add(_settings.panelvar);

			grouping_vars.RemoveAll(item => item == "variable");
			grouping_vars.RemoveAll(item => item == "none");


			_statstable = (grouping_vars.Count > 0) 
					? new DescStats(mydt, _settings.numvars, grouping_vars)
					: new DescStats(mydt, _settings.numvars);

			CreateBarchart(_statstable);


			if (_statstable.dt.Rows.Count==0)
			{
				this.isempty = true;
				this.emptymsg = _statstable.emptystats;
			}


		}



		public void CreateBarchart(DescStats statstable) //, string xaxisvar, string colorsvar, string maintitle )
		{
			chart.AxisWholeRangeChanged += LogAxesRangeWhole;
			//chart.AxisVisualRangeChanged += LogAxesRangeVisual;
			chart.BoundDataChanged += new BoundDataChangedEventHandler(barchart_BoundDataChanged);


			string mycolorvar;

			if (_settings.colorvar == "none")
			{
				mycolorvar = (statstable.dt.ColumnNames().Contains("All")) ? "All" : _settings.xaxisvar;
			}
			else
			{
				mycolorvar = _settings.colorvar;
			}



			List<string> colors_levels = statstable.dt.AsEnumerable().Select(x => x.Field<string>(mycolorvar)).Distinct().ToList();
			List<string> xaxis_levels = statstable.dt.AsEnumerable().Select(x => x.Field<string>(_settings.xaxisvar)).Distinct().ToList();



			chart.DataSource = statstable.dt;
			chart.SeriesDataMember = (_settings.colorvar == "none") ? "All" : _settings.colorvar; //Colors - dimension in the Legend
			chart.SeriesTemplate.ArgumentDataMember = _settings.xaxisvar; //X axis dimention
			chart.SeriesTemplate.ValueDataMembers.AddRange("M"); // _numvars.ToArray());


			SideBySideBarSeriesView vw = new SideBySideBarSeriesView();

			vw.Indicators.Add(new DataSourceBasedErrorBars
			{
				Direction = ErrorBarDirection.Both,
				Name = "SD",
				Color = Color.Black,
				PositiveErrorDataMember = "SD",
				NegativeErrorDataMember = "SD"
			});

			chart.SeriesTemplate.View = vw;

			//AddPanes(diag, 1);
			//vw.Pane = diag.Panes[0];
			//if (i >= 1) vw.Pane = diag.Panes[(i - 1)];  //Panes collection starts at index 0, but first series goes into default pane

			//var miny1 = diag.AxisY.WholeRange.MinValue.ToString() ?? "";

			chart.DataBind();


			foreach(Series ser in chart.Series)
			{
				Debug.WriteLine(String.Format("arg data member:[{0}] color data member:[{1}]", ser.ArgumentDataMember, ser.ColorDataMember));
			}


			////////Panes - didn't get working yet
			//////if(_settings.panelvar != "none")
			//////{
			//////	int numgroupingvars = statstable.groupingvars.Count;
			//////	this.AddPanes(numgroupingvars-1, _settings.panesLayoutDirection);
			//////}

			////chart.DataBind();

			////foreach (Series series in chart.Series)
			////{
			////	var x = series.ValueDataMembers;
			////	((SideBySideBarSeriesView)series.View).Pane = xydiagram.Panes[0];
			////}


			if (_settings.miny != -999 && _settings.maxy != -999)
			{
				double y1 = _settings.miny;
				double y2 = _settings.maxy;
				//diag.AxisY.VisualRange.SetMinMaxValues(y1, y2);
				xydiagram.AxisY.WholeRange.SetMinMaxValues(y1, y2);
				xydiagram.AxisY.VisualRange.SetMinMaxValues(y1, y2);
			}


			chart.Width = _settings.W;
			chart.Height = _settings.H;

			if (_settings.numvars.Count == 1)
			{
				AddTitles(_settings.title, _settings.subtitle, "", String.Format("{0} Mean (SD)", _settings.numvars[0]));
			}
			else
			{
				AddTitles(_settings.title, _settings.subtitle, "", "Mean (SD)");
			}
			chart.BorderOptions.Color = Color.White;
			chart.Legend.Visibility = DevExpress.Utils.DefaultBoolean.True;

		}


		private void LogAxesRangeWhole(object sender, DevExpress.XtraCharts.AxisRangeChangedEventArgs e)  //EventArgs e)
		{
			this.axesrange = new AxesRange();

			#region X axis
			//double dminx; double dmaxx;
			//var minx = xydiagram.AxisX.VisualRange.MinValue.ToString();
			//var maxx = xydiagram.AxisX.VisualRange.MaxValue.ToString();
			//bool bminx = Double.TryParse(minx, out dminx);
			//bool bmaxx = Double.TryParse(maxx, out dmaxx);
			//if (bminx || bmaxx)
			//{
			//	if (bminx) axes.minx = dminx;
			//	if (bmaxx) axes.maxx = dmaxx;
			//}
			#endregion

			if (e.Axis.Name == "Primary AxisY")
			{
				double dminy; double dmaxy;

				var miny = xydiagram.AxisY.WholeRange.MinValue.ToString();
				var maxy = xydiagram.AxisY.WholeRange.MaxValue.ToString();

				bool bminy = Double.TryParse(miny, out dminy);
				bool bmaxy = Double.TryParse(maxy, out dmaxy);

				if (bminy || bmaxy)
				{
					if (bminy) this.axesrange.miny = dminy;
					if (bmaxy) this.axesrange.maxy = dmaxy;
				}

			}
		}


		protected void barchart_BoundDataChanged(object sender, EventArgs  e)
		{
			var chart = (WebChartControl)sender;


			for (int i = 0; i < chart.Series.Count(); i++)
			{
				var x = chart.Series[i];
				var sname = x.Name;


				//Color mycolor = _settings.colors[i % _settings.colors.Count];
					
				//((SideBySideBarSeriesView)chart.Series[i].View).Color = mycolor;
				//((SideBySideBarSeriesView)chart.Series[i].View).FillStyle.FillMode = FillMode.Solid;
			}

			//https://documentation.devexpress.com/WindowsForms/4942/Controls-and-Libraries/Chart-Control/Examples/Chart-Elements/How-to-Display-Automatically-Created-Series-in-Separate-Panes 

		}

	}

	public class AxesRange
	{
		private double _minx;
		private double _maxx;
		private double _miny;
		private double _maxy;

		public AxesRange() { }

		public double minx { get { return _minx; } set { _minx = value; } }
		public double maxx { get { return _maxx; } set { _maxx = value; } }
		public double miny { get { return _miny; } set { _miny = value; } }
		public double maxy { get { return _maxy; } set { _maxy = value; } }
	}





	#endregion

	public class DxBarchartSettings : DxChartSettings
	{
		public bool showEmptyCategories { get; set; }

		public DxBarchartSettings() {
			SetChartType(DxChartType.Barchart);
		}

	}

}





