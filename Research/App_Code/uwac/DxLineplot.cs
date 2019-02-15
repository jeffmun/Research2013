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
	/// Summary description for DxLineplot
	/// </summary>

	[Serializable]
	public class DxLineplot : DxChart
	{
		private DxLineplotSettings _settings;
		private List<MarkerKind> _markers;
		private double _slope;
		private double _intercept;
		private int _coloroverride;

		public double slope
		{
			get { return _slope; }
			set { _slope = value; }
		}
		public double intercept
		{
			get { return _intercept; }
			set { _intercept = value; }
		}


		public DxLineplot(DxLineplotSettings settings, DataTable mydt) //, string xvar, string yvar, string titleinput, string colorsby)
		{
			_settings = settings;
			Color col = _settings.color(0);
			_markers = new DxMarkerKinds();


			//Need to stack the data because variable is within the plot 
			if ((_settings.xaxisvar == "variable" || _settings.colorvar == "variable") &
				_settings.xaxisvar != _settings.colorvar)
			{
				List<string> idvars = new List<string>() { "id" };
				if (_settings.xaxisvar!= "none" & _settings.xaxisvar != "variable" & !idvars.Contains(_settings.xaxisvar)) idvars.Add(_settings.xaxisvar);
				if (_settings.colorvar != "none" & _settings.colorvar != "variable" & !idvars.Contains(_settings.colorvar)) idvars.Add(_settings.colorvar);
				if (_settings.panelvar != "none" & _settings.panelvar != "variable" & !idvars.Contains(_settings.panelvar)) idvars.Add(_settings.panelvar);

				DataTable dt_stacked = DataTableExtensions.StackData(mydt, idvars, _settings.numvars);

				_settings.seriesby = "id";
				//_settings.xaxisvar = "variable";
				_settings.yaxisvar = "value";

				CreateLineplot(dt_stacked);
			}
			else 
			{
				CreateLineplot(mydt);
			}


		}

		
		public void CreateLineplot(DataTable mydt) 
		{
			_coloroverride = -1;
			string seriesby = _settings.seriesby;
			string colorsby = _settings.colorvar;
			Color myseriescolor;

			DataTable dataxy_all = DataTableExtensions.Data_SelectColumnXY(mydt, _settings.xaxisvar, _settings.yaxisvar, seriesby, colorsby);
			

			List<string> series_levels = dataxy_all.AsEnumerable().Select(x => x.Field<string>("seriesby")).Distinct().ToList();
			List<string> colors_levels = dataxy_all.AsEnumerable().Select(x => x.Field<string>("colorsby")).Distinct().ToList();
			colors_levels.Sort();

			_colorLevels = colors_levels; //use this to create a manual legend later if needed


			List<string> seriesIDs = new List<string>();
			if (seriesby == "id")
			{
				seriesIDs = dataxy_all.AsEnumerable().Select(x => x.Field<string>("id")).Distinct().ToList();
			}
			else
			{
				seriesIDs = dataxy_all.AsEnumerable().Select(x => x.Field<string>("seriesby")).Distinct().ToList();
			}


			int _nall = dataxy_all.Rows.Count;

			if (_nall > 0)
			{
				List<Series> list_o_series = new List<Series>();

				//foreach (string s in seriesIDs)
				for (int s = 0; s < seriesIDs.Count; s++)
				{
					for (int s_color = 0; s_color < colors_levels.Count; s_color++)
					{
						dataxy_all.DefaultView.Sort = "seriesby ASC, colorsby ASC, x ASC";
						dataxy_all.DefaultView.ApplyDefaultSort = true;
						DataView vw = dataxy_all.AsDataView();

						string rowfilter = (seriesby == "id") ?
									String.Format("{0}='{1}' and colorsby='{2}'", seriesby, seriesIDs[s], colors_levels[s_color]) :
									String.Format("{0}='{1}' and colorsby='{2}'", "seriesby", seriesIDs[s], colors_levels[s_color]);

						//string rowfilter = (seriesby == "id") ?
						//			String.Format("{0}='{1}'", seriesby, seriesIDs[s]) :
						//			String.Format("{0}='{1}'", "seriesby", seriesIDs[s]);

						vw.RowFilter = rowfilter;
						//vw.Sort = String.Format("{0} {1}", "x", "ASC");  //sort by the x variable
						//vw.ApplyDefaultSort = true;

						DataTable dataxy = vw.ToTable();

						dataxy.DefaultView.Sort = "x ASC";
						dataxy.DefaultView.ApplyDefaultSort = true;

						n = dataxy.Rows.Count;

						if (n > 0)
						{

							string current_colorlevel = dataxy.AsEnumerable().Select(f => f.Field<string>("colorsby")).Min().ToString();
							List<string> series_colors = dataxy.AsEnumerable().Select(f => f.Field<string>("colorsby")).ToList();


							//Switch to alternate geom if needed
							if(_settings.vars_for_altgeom.Contains(current_colorlevel)) 
							{
								_settings.activegeom = _settings.altgeom;
							}
							else 
							{
								_settings.activegeom = _settings.geom;
							}


							int colorindex = 0;

							//Get the correct color
							if (colorsby != "none")
							{
								for (int c = 0; c < colors_levels.Count; c++)
								{
									if (current_colorlevel == colors_levels[c]) colorindex = c;
								}
							}
							myseriescolor = _settings.color(colorindex % 15);

							if (_coloroverride >= 0) myseriescolor = _settings.color(_coloroverride % 15);


							SeriesPoint[] seriesPoints = CreateSeriesPoints(dataxy, colorsby, colors_levels, series_colors, colorindex, myseriescolor);
							//TOFIX SeriesPoint[] seriesPoints = new DxSeriesPoints(dataxy, "x", "y", colorsby, colors_levels, series_colors, colorindex, myseriescolor);


							Series series = new Series();

							SideBySideBarSeriesView barSeriesView = new SideBySideBarSeriesView();
							LineSeriesView lineSeriesView = new LineSeriesView();
							PointSeriesView pointSeriesView = new PointSeriesView();

							if (_settings.activegeom == LineplotGeom.Bar)
							{
								//barSeriesView = new SideBySideBarSeriesView() ;
							}
							else if (_settings.activegeom == LineplotGeom.Line)
							{
								//lineSeriesView = new LineSeriesView();
								lineSeriesView.LineMarkerOptions.FillStyle.FillMode = FillMode.Solid;
								lineSeriesView.LineMarkerOptions.Kind = _markers[s % _markers.Count];
							}
							else 
							{
								pointSeriesView.PointMarkerOptions.FillStyle.FillMode = FillMode.Solid;
								MarkerKind mymarker = new MarkerKind();

								if (_settings.activegeom == LineplotGeom.Circle) mymarker = MarkerKind.Circle;
								if (_settings.activegeom == LineplotGeom.Square) mymarker = MarkerKind.Square;
								if (_settings.activegeom == LineplotGeom.Cross) mymarker = MarkerKind.Cross;
								if (_settings.activegeom == LineplotGeom.Star) mymarker = MarkerKind.Star;
								
								pointSeriesView.PointMarkerOptions.Kind = mymarker;
								pointSeriesView.PointMarkerOptions.Size = _settings.markersize;

								if (_settings.activegeom == LineplotGeom.Star) pointSeriesView.PointMarkerOptions.StarPointCount = 6;
							}




							if (_settings.xaxis_is_date)
							{
								this.xydiagram.AxisX.DateTimeScaleOptions.ScaleMode = ScaleMode.Continuous;
								this.xydiagram.AxisX.DateTimeScaleOptions.MeasureUnit = DateTimeMeasureUnit.Month;
								this.xydiagram.AxisX.Label.TextPattern = "{A:dd-MMM-yy}";
								series.ToolTipPointPattern = "x={A:dd-MMM-yy} y={V:F2} {HINT}";
							}
							else
							{
								series.ToolTipPointPattern = "x={A:F2} y={V:F2} {HINT}";
							}


							ToolTipRelativePosition pos = new ToolTipRelativePosition();
							pos.OffsetX = -10;
							pos.OffsetY = -10;
							chart.ToolTipOptions.ToolTipPosition = pos;

							if (_settings.activegeom == LineplotGeom.Bar)
							{
								series.View = barSeriesView;
							}
							else if (_settings.activegeom == LineplotGeom.Line )
							{
								series.View = lineSeriesView;
							}
							else
							{
								series.View = pointSeriesView;
							}

							series.Points.AddRange(seriesPoints);
							
							list_o_series.Add(series);
						}
					}
				}

				//Add the series to the chart
				int max_pts = list_o_series.Select(s => s.Points.Count).Max();
				
				foreach(Series s in list_o_series)
				{
					//first add those with the max number of points
					if(s.Points.Count == max_pts) chart.Series.Add(s);
				}
				foreach (Series s in list_o_series)
				{
					//then add those with fewer points
					if (s.Points.Count != max_pts) chart.Series.Add(s);
				}


				// consider adding N=??, intrcpt=, slope=
				string mytitle = "";
				string mainTitleText = String.Format("{0}", mytitle); //, seriesPoints.Count());

				chart.Width = _settings.W;
				chart.Height = _settings.H;

				this.AddTitles(mainTitleText, "", _settings.xaxisvar, _settings.yaxisvar);

				chart.BorderOptions.Color = Color.White;

				chart.CustomDrawSeriesPoint += Lineplot_TransparentPoint;
				chart.CustomDrawSeries += Lineplot_TransparentLine;

				//chart.CustomCallback += _dxcharts.Mychart_CustomCallback;

				chart.ToolTipEnabled = DevExpress.Utils.DefaultBoolean.True;
				chart.ToolTipOptions.ShowForSeries = true;

				chart.CrosshairEnabled = DevExpress.Utils.DefaultBoolean.False;

				if (colorsby != "none")
				{
					for (int lev = 0; lev < colors_levels.Count; lev++)
					{
						// Create a new custom item.
						CustomLegendItem item = new CustomLegendItem();
						chart.Legend.CustomItems.Add(item);
						// Specify its text and marker.
						item.Text = colors_levels[lev];
						int coloridx = (_coloroverride >= 0) ? _coloroverride : lev;
						item.MarkerColor = _settings.colors[coloridx % _settings.colors.Count];
					}
				}



				chart.Legend.Visibility = (_settings.showLegend) ? DevExpress.Utils.DefaultBoolean.True : DevExpress.Utils.DefaultBoolean.False;

				LegendAlignmentHorizontal legend_h = new LegendAlignmentHorizontal();
				LegendAlignmentVertical legend_v = new LegendAlignmentVertical();

				if (_settings.legend_pos_h == "Right") legend_h = LegendAlignmentHorizontal.Right;
				else if (_settings.legend_pos_h == "RightOutside") legend_h = LegendAlignmentHorizontal.RightOutside;
				else if (_settings.legend_pos_h == "Left") legend_h = LegendAlignmentHorizontal.Left;
				else if (_settings.legend_pos_h == "LeftOutside") legend_h = LegendAlignmentHorizontal.LeftOutside;
				else if (_settings.legend_pos_h == "Center") legend_h = LegendAlignmentHorizontal.Center;

				if (_settings.legend_pos_v == "Top") legend_v = LegendAlignmentVertical.Top;
				else if (_settings.legend_pos_v == "TopOutside") legend_v = LegendAlignmentVertical.TopOutside;
				else if (_settings.legend_pos_v == "Bottom") legend_v = LegendAlignmentVertical.Bottom;
				else if (_settings.legend_pos_v == "BottomOutside") legend_v = LegendAlignmentVertical.BottomOutside;
				else if (_settings.legend_pos_v == "Center") legend_v = LegendAlignmentVertical.Center;



				chart.Legend.AlignmentHorizontal = legend_h;
				chart.Legend.AlignmentVertical = legend_v;

				// Set a value indicating that both autogenerated and custom items are displayed.
				chart.Legend.ItemVisibilityMode = LegendItemVisibilityMode.AutoGeneratedAndCustom;

			}
			else
			{
				//_emptymsg = String.Format("0 cases for{3}{0}{3}{1} by {2}", mytitle, xvar, yvar, Environment.NewLine);
				//return null;
			}
		}

		//public Table ManualColorLegend()
		//{
		//	Table legend = new Table();
		//	for (int i = 0; i < this.colorLevels.Count; i++)
		//	{
		//		string s = this.colorLevels[i];
		//		System.Web.UI.WebControls.TableRow tr = new System.Web.UI.WebControls.TableRow();
		//		TableCell td1 = new TableCell();
		//		TableCell td2 = new TableCell();
		//		td1.BackColor = _settings.colors[i];
		//		td1.Width = 15;
		//		td1.Style.Add("padding", "4px");
		//		td2.Style.Add("padding", "4px");
		//		td2.Text = s;
		//		td1.BorderColor = Color.White;
		//		td2.BorderColor = Color.White;
		//		td1.BorderWidth = 2;
		//		td2.BorderWidth = 2;
		//		tr.Cells.Add(td1);
		//		tr.Cells.Add(td2);
		//		legend.Rows.Add(tr);
		//	}
		//	return legend;
		//}

		public SeriesPoint[] CreateSeriesPoints(DataTable dataxy, string colorsby, List<string> colors_levels, List<string> series_colors, int colorindex, Color myseriescolor)
		{
			#region create array of SeriesPoint
			SeriesPoint[] seriesPoints = new SeriesPoint[n];
			for (int i = 0; i < n; i++)
			{
				if (_settings.xaxis_is_date)
				{
					seriesPoints[i] = new SeriesPoint(dataxy.Rows[i].Field<DateTime>("x"), new double[] { dataxy.Rows[i].Field<double>("y") });
				}
				else if (_settings.xaxis_is_age)
				{
					seriesPoints[i] = new SeriesPoint(dataxy.Rows[i].Field<double>("x"), new double[] { dataxy.Rows[i].Field<double>("y") });
				}
				else
				{
					seriesPoints[i] = new SeriesPoint(dataxy.Rows[i].Field<string>("x"), new double[] { dataxy.Rows[i].Field<double>("y") });
				}
				var rowvals = dataxy.Rows[i].ItemArray;
				string id = dataxy.Rows[i].Field<string>("id");
				//seriesPoints[i].Tag = id;
				seriesPoints[i].ToolTipHint = String.Format("id: {0}", id);

				//Assign color individually for each point
				if (colorsby != "none")
				{
					for (int c = 0; c < colors_levels.Count; c++)
					{
						if (series_colors[i] == colors_levels[c]) colorindex = c;
					}
					myseriescolor = _settings.color(colorindex % 15);
					seriesPoints[i].Color = myseriescolor;
				}
			}


			if (_settings.xaxis_is_date)
			{
				DateTime[] x = dataxy.AsEnumerable().Select(o => o.Field<DateTime>("x")).ToArray();
			}
			else if (_settings.xaxis_is_age)
			{
				double[] x = dataxy.AsEnumerable().Select(o => o.Field<double>("x")).ToArray();
			}
			else
			{
				string[] x = dataxy.AsEnumerable().Select(o => o.Field<string>("x")).ToArray();
			}

			double[] y = dataxy.AsEnumerable().Select(o => o.Field<double>("y")).ToArray();

			return seriesPoints;
			#endregion
		}

		

		protected void Lineplot_TransparentLine(object sender, CustomDrawSeriesEventArgs e)
		{
			var t = e.Series.View;

			if (t.ToString() == "Line")
			{
				(e.SeriesDrawOptions as LineDrawOptions).Color =
						e.SeriesDrawOptions.Color = Color.FromArgb(80, e.SeriesDrawOptions.Color);
			}
		}

		//protected void Lineplot_TransparentBar(object sender, CustomDrawSeriesPointEventArgs e)
		//{

		//	(e.SeriesDrawOptions as BarDrawOptions).Color =
		//	e.SeriesDrawOptions.Color = Color.FromArgb(80, e.SeriesDrawOptions.Color);
		//	(e.SeriesDrawOptions as BarDrawOptions).FillStyle.FillMode = FillMode.Solid;
		//}


		protected void Lineplot_TransparentPoint(object sender, CustomDrawSeriesPointEventArgs e)
		{
			var t = e.Series.View;

			if (t.ToString() != "Bar")
			{
				(e.SeriesDrawOptions as PointDrawOptions).Color =
			e.SeriesDrawOptions.Color = Color.FromArgb(80, e.SeriesDrawOptions.Color);
				(e.SeriesDrawOptions as PointDrawOptions).Marker.FillStyle.FillMode = FillMode.Solid;

				(e.SeriesDrawOptions as PointDrawOptions).Marker.BorderVisible = false;
			}

			//e.SeriesDrawOptions.Color = Color.FromArgb(50, Color.Yellow);


			//(e.SeriesDrawOptions as PointDrawOptions).Color =
			//	e.SeriesDrawOptions.Color = Color.FromArgb(50, e.SeriesDrawOptions.Color);

			//(e.SeriesDrawOptions as BarDrawOptions).FillStyle.FillMode = FillMode.Solid;
			//e.SeriesDrawOptions.Color = Color.FromArgb(50, e.SeriesDrawOptions.Color);



			//from https://www.devexpress.com/Support/Center/Question/Details/Q102193/how-to-show-custom-data-in-the-chart-tooltip
			//var dataPoint = (e.SeriesPoint.Tag);
			////The trick is to hide adittional info by html tags
			////e.SeriesPoint.ToolTipHint = e.SeriesPoint.ToolTipHint + "<FONT SIZE=\"1\" COLOR=\"#FFFFFF\">~" + dataPoint + "~</FONT>";
			////e.SeriesPoint.ToolTipHint = e.SeriesPoint.ToolTipHint + " BONUS ID: " + dataPoint + "";
			//e.LabelText = dataPoint.ToString();

		}


	}

	public enum LineplotGeom
	{
		Line = 0,
		Bar = 1,
		Circle = 2,
		Square = 3,
		Cross = 4,
		Star = 5,
		Triangle = 6
	}

	[Serializable]
	public class DxLineplotSettings : DxChartSettings
	{
		private List<string> _xvars;
		private List<string> _yvars;
		private string _seriesby;
		private bool _xaxis_is_date = false;
		private bool _xaxis_is_age = false;
		private bool _showLegend = true;
		private bool _matchYAxes = true;
		private bool _isActogram = false;
		private LineplotGeom _geom = LineplotGeom.Line;
		private LineplotGeom _altgeom = LineplotGeom.Circle;
		private List<string> _vars_for_altgeom = new List<string>();

		private LineplotGeom _activegeom;

		private string _legend_pos_h;
		private string _legend_pos_v;

		public string seriesby { get { return _seriesby; } set { _seriesby = value;} }
		public List<string> xvars { get { return _xvars; } set { _xvars = value; } }
		public List<string> yvars { get { return _yvars; } set { _yvars = value; } }
		public bool xaxis_is_date { get { return _xaxis_is_date; } set { _xaxis_is_date = value; } }
		public bool xaxis_is_age { get { return _xaxis_is_age; } set { _xaxis_is_age = value; } }
		public bool showLegend { get { return _showLegend; } set { _showLegend = value; } }
		public string legend_pos_h { get { return _legend_pos_h; } set { _legend_pos_h = value; } }
		public string legend_pos_v { get { return _legend_pos_v; } set { _legend_pos_v = value; } }
		public bool matchYAxes { get { return _matchYAxes; } set { _matchYAxes = value; } }
		public bool isActogram {  get{ return _isActogram; }  set { _isActogram = value; } }
		public LineplotGeom geom { get { return _geom; } set { _geom = value; } }
		public LineplotGeom altgeom { get { return _altgeom; } set { _altgeom = value; } }
		public LineplotGeom activegeom { get { return _activegeom; } set { _activegeom = value; } }
		public List<string> vars_for_altgeom { get { return _vars_for_altgeom; } set { _vars_for_altgeom = value; } }
		


		public DxLineplotSettings()
		{
			SetOutputtype(DxOutputtype.Lineplot);
		}

		public DxLineplotSettings(bool isActogram)
		{
			_isActogram = isActogram;
			if (_isActogram)
			{
				SetOutputtype(DxOutputtype.Actogram);
			}
			else
			{
				SetOutputtype(DxOutputtype.Lineplot);
			}
		}

		public DxLineplotSettings(DxChartSettings settings)
		{
			SetOutputtype(DxOutputtype.Lineplot);
		}
		public DxLineplotSettings(DxChartSettings settings, DxOutputtype myoutputtype)
		{
			SetOutputtype(myoutputtype);
		}
		
	}



}

