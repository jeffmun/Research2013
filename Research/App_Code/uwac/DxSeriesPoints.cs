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
		private string _xvarname;
		private string _yvarname;
		private string _colorvarname;
		private List<Color> _colors;
		private List<string> _color_levels;
		private int _colorindex;
		private SeriesPoint[] _seriesPoints;
		public SeriesPoint[] seriesPoints { get { return _seriesPoints; } set { _seriesPoints = value; } }

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
			_xvarname = xvarname;
			_yvarname = yvarname;
			_colorvarname = colorvarname;
			_color_levels = color_levels;
			_colors = colors;
			CreateDxSeriesPoints(dataxy);
		}

		public DxSeriesPoints(DataTable dataxy, string xvarname, string yvarname, List<Color> colors, int colorindex)
		{
			_xvarname = xvarname;
			_yvarname = yvarname;
			_colorvarname = "none";
			_colors = colors;
			CreateDxSeriesPoints(dataxy);
		}

		public void CreateDxSeriesPoints(DataTable dataxy)
		{
			SeriesPoint[] points = new SeriesPoint[dataxy.Rows.Count];
			
			//scat
			for (int i = 0; i < dataxy.Rows.Count; i++)
			{

				Type t = dataxy.Columns[_xvarname].DataType;

				var x = dataxy.Rows[i][_xvarname];
				var y = new double?[] { dataxy.Rows[i].Field<double?>(_yvarname) };

				if(y[0] == null)
				{
					points[i] = new SeriesPoint(x);
				} else {
					points[i] = new SeriesPoint(x, Convert.ToDouble(y[0]));
				}


				List<string> colnames = dataxy.ColumnNames();


				if (colnames.Contains("id"))
				{
					//points[i] = new SeriesPoint(dataxy.Rows[i].Field<double>(_xvarname), new double[] { dataxy.Rows[i].Field<double>(_yvarname) });
					string id = dataxy.Rows[i].Field<string>("id");
					//seriesPoints[i].Tag = id;
					points[i].ToolTipHint = String.Format("id: {0}", id);
				}

				//Assign color individually for each point
				if (_colorvarname != "none")
				{
					string pointcolorlevel = dataxy.Rows[i].Field<string>(_colorvarname);
					for (int c = 0; c < _color_levels.Count; c++)
					{
						if (pointcolorlevel == _color_levels[c]) _colorindex = c;
					}
				}
				
				points[i].Color = _colors[_colorindex];
			}

			_seriesPoints = points;

		}

		public void AssignPointColor(SeriesPoint p, int idx)
		{
			p.Color = _colors[idx];
		}


	}

}