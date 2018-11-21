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
	/// Summary description for DxSeriesPoints
	/// </summary>
	public class DxSeriesPoints 
	{
		private DataTable _dataxy;
		private string _xvarname;
		private string _yvarname;
		private string _colorvarname;
		private List<Color> _colors;
		private List<string> _color_levels;
		private int _colorindex;
		private SeriesPoint[] _seriesPoints;
		public SeriesPoint[] seriesPoints { get { return _seriesPoints; } set { _seriesPoints = value; } }
		private SeriesPoint[] _seriesPointsSD;
		public SeriesPoint[] seriesPointsSD { get { return _seriesPointsSD; } set { _seriesPointsSD = value; } }

		public string label { get; set; }
		public string panename { get; set; }

		//public DxSeriesPoints(DataTable dataxy, Color color)
		//{
		//	_xvarname = "X";
		//	_yvarname = "Y";
		//	_colorvarname = "none";
		//	_colorindex = 0;
		//	_colors.Add(color);
		//	CreateDxSeriesPoints(dataxy);
		//}
		//public DxSeriesPoints(DataTable dataxy, string colorvarname, List<Color> colors, List<string> color_levels)
		//{
		//	_xvarname = "X";
		//	_yvarname = "Y";
		//	_colorvarname = colorvarname;
		//	_color_levels = color_levels;
		//	_colors = colors;
		//	CreateDxSeriesPoints(dataxy);
		//}
		public DxSeriesPoints(DataTable dataxy, string xvarname, string yvarname, string colorvarname, List<Color> colors, List<string> color_levels)
		{
			_dataxy = dataxy;
			_xvarname = xvarname;
			_yvarname = yvarname;
			_colorvarname = colorvarname;
			_color_levels = color_levels;
			_colors = colors;
			bool addSD = (_yvarname == "M") ? true : false;
			CreateDxSeriesPoints(addSD);
		}

		public DxSeriesPoints(DataTable dataxy, string xvarname, string yvarname, List<Color> colors, int colorindex)
		{
			_dataxy = dataxy;
			_xvarname = xvarname;
			_yvarname = yvarname;
			_colorvarname = "none";
			_colors = colors;

			bool addSD = (_yvarname == "M") ? true : false;
			CreateDxSeriesPoints(addSD);
		}

		public void CreateDxSeriesPoints(bool addSD)
		{
			SeriesPoint[] points = new SeriesPoint[_dataxy.Rows.Count];
			SeriesPoint[] pointsSD = new SeriesPoint[_dataxy.Rows.Count];


			//scat
			for (int i = 0; i < _dataxy.Rows.Count; i++)
			{

				Type t = _dataxy.Columns[_xvarname].DataType;

				var x = _dataxy.Rows[i][_xvarname];
				var y = new double?[] { _dataxy.Rows[i].Field<double?>(_yvarname) };


				if (y[0] == null)
				{
					points[i] = new SeriesPoint(x);
				} else 
				{
					points[i] = new SeriesPoint(x, Convert.ToDouble(y[0]));
					if (addSD)
					{
						var sd = (addSD) ? new double?[] { _dataxy.Rows[i].Field<double?>("SD") } : null;
						pointsSD[i] = new SeriesPoint(x, Convert.ToDouble(sd[0]));
					}
				}


				//List<string> colnames = _dataxy.ColumnNames();


				//if (colnames.Contains("id"))
				//{
				//	//points[i] = new SeriesPoint(dataxy.Rows[i].Field<double>(_xvarname), new double[] { dataxy.Rows[i].Field<double>(_yvarname) });
				//	string id = _dataxy.Rows[i].Field<string>("id");
				//	//seriesPoints[i].Tag = id;
				//	points[i].ToolTipHint = String.Format("id: {0}", id);
				//}

				////Assign color individually for each point
				//if (_colorvarname != "none")
				//{
				//	string pointcolorlevel = _dataxy.Rows[i].Field<string>(_colorvarname);
				//	for (int c = 0; c < _color_levels.Count; c++)
				//	{
				//		if (pointcolorlevel == _color_levels[c]) _colorindex = c;
				//	}
				//}

				points[i].ToolTipHint = AssignTooltip(i);
				points[i].Color = ColorChooser(i);
			}

			_seriesPoints = points;
			_seriesPointsSD = pointsSD;
		}

		public string AssignTooltip(int i)
		{
			List<string> colnames = _dataxy.ColumnNames();
			string tip = "";

			if (colnames.Contains("id"))
			{
				//points[i] = new SeriesPoint(dataxy.Rows[i].Field<double>(_xvarname), new double[] { dataxy.Rows[i].Field<double>(_yvarname) });
				string id = _dataxy.Rows[i].Field<string>("id");
				//seriesPoints[i].Tag = id;
				tip = String.Format("id: {0}", id);
			}
			return tip;
		}

		public void AssignPointColor(SeriesPoint p, int idx)
		{
			p.Color = _colors[idx];
		}



		public Color ColorChooser(int i)
		{
			//Assign color individually for each point
			if (_colorvarname != "none" & _dataxy.ContainsColumnName(_colorvarname))
			{
				string pointcolorlevel = _dataxy.Rows[i].Field<string>(_colorvarname);
				for (int c = 0; c < _color_levels.Count; c++)
				{
					if (pointcolorlevel == _color_levels[c]) _colorindex = c;
				}
				int _idx = _colorindex % _colors.Count;
				return _colors[_idx];
			}
			else if (_colorvarname == "none" )
			{
				return _colors[0];
			}
			else
			{
				return _colors[i % _colors.Count];
			}


		}

	}

}