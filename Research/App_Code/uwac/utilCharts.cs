using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ImageResizer;
using LinqStatistics;
using GoogleChartsNGraphsControls;
using DotNet.Highcharts;
using DotNet.Highcharts.Options;
using DotNet.Highcharts.Helpers;
using DotNet.Highcharts.Enums;
using Newtonsoft.Json;
using uwac;

namespace uwac
{

	/// <summary>
	/// Summary description for utilCharts
	/// </summary>
	public class utilCharts
	{

		public utilCharts()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static int getDefaultWidth()
		{
			return 150;
		}
		public static int getDefaultHeight()
		{
			return 120;
		}

		#region Google Charts - Lines
		public static GVLineChart Line(DataTable dt, string x, string y, string group)
		{
			GVLineChart l = new GVLineChart();

			l.DataSource = dt;
			l.GviHAxis = x;
			l.GviVAxis = y;
			l.DataBind();

			return l;
		}
		#endregion 


		#region Google Charts - Scatterplots
		public static GVScatterChart ScatterPlots(DataTable dt, string x, string y)
		{


			GVScatterChart s = ScatterPlots(dt, x, y, getDefaultWidth(), getDefaultHeight());
			return s;
		}

		public static GVScatterChart ScatterPlots(DataTable dt_orig, string x, string y, int wd, int ht)
		{
			int pointsize = 4;
			GVScatterChart s = new GVScatterChart();
			DataTable dt = dt_orig.Copy();
			

			DataView dt_valid = dt.AsDataView();
			dt_valid.RowFilter = "Isnull(" + x + ", -99999) > -99999 AND Isnull(" + y + ",-99999) <> -99999";
			DataTable dtxy = dt_valid.ToTable(false, x, y);

			if (dtxy.Rows.Count > 0)
			{
				//CORRELATIONS 
				double[] dx = new double[dtxy.Rows.Count];
				double[] dy = new double[dtxy.Rows.Count];

				for (int index = 0; index < dtxy.Rows.Count; index++)
				{
					dx[index] = Convert.ToDouble(dtxy.Rows[index][x]);
					dy[index] = Convert.ToDouble(dtxy.Rows[index][y]);
				}

				double pearson = Math.Round(utilStats.Corr(dx, dy), 2);
				double spearman = Math.Round(utilStats.Corr(dx, dy, "Spearman"), 2);

				//Get the Min/Max in order to replace NULL with a  value -10% from Min.
				double min_x = dx.Min(); double max_x = dx.Max();
				double miss_x = min_x - ((max_x - min_x) / 10);
				double min_y = dy.Min(); double max_y = dy.Max();
				double miss_y = min_y - ((max_y - min_y) / 10);



				string basestyle = "point { size: " + pointsize.ToString() + "; shape-type: circle; opacity: 0.3; fill-color: #555555}";
				string nullif = "";


				foreach (DataRow row in dt.Rows)
				{
					string[] columnNames = dt.Columns.Cast<DataColumn>()
								 .Select(c => c.ColumnName)
								 .ToArray();

					if (columnNames.Contains("Group"))
					{

						if (row["Group"].ToString() == "MIND")
						{
							basestyle = "point { size: " + pointsize.ToString() + "; shape-type: circle; opacity: 0.5; fill-color:  #995555}";
						}
						else if (row["Group"].ToString() == "UW")
						{
							basestyle = "point { size: " + pointsize.ToString() + "; shape-type: star; opacity: 0.5; fill-color:  #555555}";
						}
						else if (row["Group"].ToString() == "VU")
						{
							basestyle = "point { size: " + pointsize.ToString() + "; shape-type: square; opacity: 0.5; fill-color:  #225555}";
						}
					}

					if (columnNames.Contains("style"))
					{
						row["style"] = basestyle;
					}

					if (columnNames.Contains("style") & columnNames.Contains("tooltip"))
					{
						if (row[x] == DBNull.Value | row[x] == null)
						{
							row["tooltip"] = row["tooltip"] + " MSNG " + x;
							row["style"] = "point { size: " + pointsize.ToString() + "; shape-type: star; fill-color: #a52714}";
							row[x] = miss_x;
							nullif += "X";
						}
						if (row[y] == DBNull.Value | row[y] == null)
						{
							row["tooltip"] = row["tooltip"] + " MSNG " + y;
							row["style"] = "point { size: " + pointsize.ToString() + "; shape-type: triangle; fill-color: #a52714}";
							row[y] = miss_y;
							nullif += "Y";
						}
					}



				}
				DataView dt_valid2 = dt.AsDataView();
				DataTable dtxy2 = dt_valid2.ToTable(false, x, y, "tooltip", "style");

				
				//s.GviTooltip = "tooltip";
				s.GviLegendPosition = LegendPostion.None;

				hAxis xaxis = new hAxis();
				xaxis.Title = x;

				s.GviHAxis = "{title: '" + x + "'}";
				s.GviVAxis = "==" + y + "==";

				string xleader = new String('.', (x.Length > 12) ? 2 : 14 - x.Length);
				string yleader = new String('.', (y.Length > 12) ? 2 : 14 - y.Length);

				s.Width = wd; s.Height = ht;
				s.GviTitle = "x: " + x + xleader + " r=" + pearson.ToString() + "\ny: " + y + yleader + "s=" + spearman.ToString();
				s.GVITitlePosition = TitlePosition.Out;


				TrendLine[] trend = new TrendLine[1];
				trend[0] = new TrendLine();
				trend[0].Opacity = 0.5f;
				trend[0].Type = TrendLineType.Linear;

				s.GviTrendLine = trend;

				s.DataSource = dtxy2;
				s.DataBind();

			}
			return s;

		}
		#endregion Google Charts - Scatterplots



		#region Google charts - Histogram

		public static GVHistogram Histogram(DataTable dt, string x)
		{
			GVHistogram h = Histogram(dt, x, getDefaultWidth(), getDefaultHeight(), Color.CadetBlue, "");
			return h;
		}

		public static GVHistogram Histogram(DataTable dt, string x, int wd, int ht)
		{
			GVHistogram h = Histogram(dt, x, wd, ht, "", "");
			return h;
		}

		public static GVHistogram Histogram(DataTable dt, string x, int wd, int ht, string colorvar, string lbl)
		{
			return Histogram(dt, x, wd, ht, colorvar, lbl, 0, 100);
		}
		public static GVHistogram Histogram(DataTable dt, string x, int wd, int ht, Color color, string lbl)
		{
			return Histogram(dt, x, wd, ht, color, lbl, 0, 100);
		}


		//Here, "colorvar" refers to a column in the datatable that contains color information
		public static GVHistogram Histogram(DataTable dt, string x, int wd, int ht, string colorvar, string lbl, int? min, int? max)
		{
			string str_color;
			if (colorvar == "") str_color = "Purple";
			else str_color = dt.AsEnumerable().Select(f => f.Field<string>(colorvar)).First().ToString();
			try
			{
				//Color color = System.Drawing.ColorTranslator.FromHtml("#" + str_color);
				Color color = Color.Purple;
				GVHistogram h = Histogram(dt, x, wd, ht, color, lbl, min, max);
				return h;
			}
			catch(Exception ex)
			{
				string x1 = ex.Message;
				GVHistogram h = Histogram(dt, x, wd, ht, Color.Purple, lbl, min, max);
				return h;
			}
			
		}


		public static GVHistogram Histogram(DataTable dt, string x, int wd, int ht, Color color, string lbl, int? min, int? max)
		{
			try
			{

				//int n = dt.Rows.Count.Where(f => Is.DBNull(f(x))

				int n = dt.Rows.Count;
				var rows = dt.AsEnumerable().Where(r => !r.IsNull(x));
				int n2 = rows.Count();

				string title = String.Format("{0} (N = {1}) {2}", x, n2, lbl); 
				GVHistogram h = new GVHistogram();

				DataView vw = dt.AsDataView();
				DataTable dt2 = vw.ToTable(false, x);
				h.GviColors = new Color?[] { color };
				h.DataSource = dt2;
				h.DataBind();
				h.GviMin = min;
				h.GviMax = max;
				h.GviTitle = title;
				h.Width = wd;
				h.Height = ht;
				h.GviLegendPosition = LegendPostion.None;
				return h;
			}
			catch(Exception)
			{
				return null;
			}
		}


		public static Table Histograms_byRowLevel_byColLevel_Facet(DataTable dt, string x, string facet, string rowlevels, string collevels, int wd, int ht, string colorvar, string lbl)
		{
			Table t = new Table();

			List<DataTable> dt_facets = utilStats.qryGroupBy(dt, "inthx", new List<string> { facet });

			TableRow row_header = new TableRow();
			TableRow row_of_facets = new TableRow();

			foreach (DataTable d in dt_facets)
			{
				TableCell cell = new TableCell();
				Table t2 = utilCharts.Histograms_byRowLevel_byColLevel(d, x, rowlevels, collevels, wd, ht, colorvar, lbl);

				cell.Controls.Add(t2);
				cell.VerticalAlign = VerticalAlign.Top;
				row_of_facets.Cells.Add(cell);

				string facet_header_text = "**NULL**";
				try
				{
					facet_header_text = d.AsEnumerable().Select(f => f.Field<string>(facet)).First().ToString();
				}
				catch(Exception ex)
				{
					string x1 = ex.Message;
				}
				TableCell header_cell = new TableCell();
				Label lit = new Label();
				lit.Font.Size = 14;
				lit.Font.Bold = true;
				lit.Text = facet_header_text ;
				header_cell.HorizontalAlign = HorizontalAlign.Center;
				header_cell.Controls.Add(lit);
				row_header.Cells.Add(header_cell);

			}

			t.Rows.Add(row_header);
			t.Rows.Add(row_of_facets);

			return t;

		}



		public static Table Histograms_byRowLevel_byColLevel (DataTable dt, string x, string rowlevels, string collevels, int wd, int ht, string colorvar, string lbl)
		{
			Table t = new Table();


			if(collevels=="none")
			{
				string rowlabel = "All Cases";
				TableRow tRow = tRow_Histograms_by_varlevel(dt, x, rowlabel, rowlevels, wd, ht, colorvar, lbl);
				t.Rows.Add(tRow);
			}
			//Both rows and columns
			else
			{
				List<DataTable> dt_rowlevs = utilStats.qryGroupBy(dt, "inthx", new List<string> { rowlevels });  // <- FIX?? not sure why 'inthx'

				foreach (DataTable d in dt_rowlevs)
				{
					string rowlabel = d.AsEnumerable().Select(f => f.Field<string>(rowlevels)).First().ToString();
					TableRow tRow = tRow_Histograms_by_varlevel(d, x, rowlabel, collevels, wd, ht, colorvar, lbl);
					t.Rows.Add(tRow);
				}
			}

			return t;

		}


		public static Table Histograms_by_varlevel_inCols (DataTable dt, string x, string var_with_levels, int wd, int ht, string colorvar, string lbl)
		{
			Table t = new Table();

			TableRow tRow = tRow_Histograms_by_varlevel(dt, x, "Count", var_with_levels, wd, ht, colorvar, lbl);

			t.Rows.Add(tRow);
			return t;

		}


		public static TableRow tRow_Histograms_by_varlevel(DataTable dt, string x, string rowlabel, string var_with_levels, int wd, int ht, string colorvar, string lbl)
		{

			//returns a table with a single row, each cell containing a
			//histogram of "x" for specific levels of "var_with_levels"

			TableRow tRow = new TableRow();

			//List<string> levs = dt.AsEnumerable().Select<s
			List<string> levs = dt.AsEnumerable().Select(r => r.Field<string>(var_with_levels)).Distinct().ToList<string>();

			List<DataTable> dt_levs = utilStats.qryGroupBy(dt, "inthx", new List<string> { var_with_levels });


			string fldtype = dt.Columns[x].DataType.ToString().ToLower();



			int? minX = 0; // Convert.ToInt32(Math.Round(dminX - buffer, 0));
			int? maxX = 100; // Convert.ToInt32(Math.Round(dmaxX + buffer, 0));

			double pctbuffer = .05;

			switch (fldtype)
			{
				case "system.int16":
					double? minX1 = dt.AsEnumerable().Select(row => row.Field<Int16?>(x)).Min();
					double? maxX1 = dt.AsEnumerable().Select(row => row.Field<Int16?>(x)).Max();
					double? buffer1 = (maxX1 - minX1) * pctbuffer;
					minX = Convert.ToInt32(minX1 - buffer1);
					maxX = Convert.ToInt32(maxX1 + buffer1);
					break;
				case "system.int32":
					double? minX2 = dt.AsEnumerable().Select(row => row.Field<Int32?>(x)).Min();
					double? maxX2 = dt.AsEnumerable().Select(row => row.Field<Int32?>(x)).Max();
					double? buffer2 = ((maxX2 - minX2) * pctbuffer);
					minX = Convert.ToInt32(minX2 - buffer2);
					maxX = Convert.ToInt32(maxX2 + buffer2);
					break;
				case "system.double":
					double? minX3 = dt.AsEnumerable().Select(row => row.Field<double?>(x)).Min();
					double? maxX3 = dt.AsEnumerable().Select(row => row.Field<double?>(x)).Max();
					double? buffer3 = (maxX3 - minX3) * pctbuffer;
					minX = Convert.ToInt32(minX3 - buffer3);
					maxX = Convert.ToInt32(maxX3 + buffer3);
					break;
			}




			TableCell firstcell = new TableCell();
			firstcell.Text = rowlabel;
			tRow.Cells.Add(firstcell);

			int counter = 0;
			//foreach (string d in levs)
			foreach (DataTable d in dt_levs)
			{

				Literal lit = new Literal();
				lit.Text = "<u><b>" + levs[counter] + "</b></u>";
				// Create a new cell and add it to the row.
				TableCell tCell = new TableCell();
				tCell.HorizontalAlign = HorizontalAlign.Center;
				tCell.Text = levs[counter];
				tCell.Controls.Add(lit);


				int count = 0;
				switch (fldtype)
				{
					case "system.int16":
						count = d.AsEnumerable().Count(row => row.Field<Int16?>(x) != null);
						break;
					case "system.int32":
						count = d.AsEnumerable().Count(row => row.Field<Int32?>(x) != null);
						break;
					case "system.double":
						count = d.AsEnumerable().Count(row => row.Field<double?>(x) != null);
						break;
					case "system.decimal":
						count = d.AsEnumerable().Count(row => row.Field<decimal?>(x) != null);
						break;
				}


				if (count > 0)
				{
					try
					{
						GVHistogram h = Histogram(d, x, wd, ht, colorvar, lbl, minX, maxX);
						tCell.Controls.Add(h);
					}
					catch (Exception) { }
				}
				else {
					tCell.Text += "<br/>0 records.<br/><br/>";
				}
				tRow.Cells.Add(tCell);
				counter++;
			}

			return tRow;
		}

		


		#endregion Google charts - Histogram


		protected Table CreateTable(int rowCnt, int colCnt)
		{
			Table tbl = new Table();
			// Current row count.
			int rowCtr;
			// Current cell counter
			int cellCtr;

			for (rowCtr = 1; rowCtr <= rowCnt; rowCtr++)
			{
				// Create new row and add it to the table.
				TableRow tRow = new TableRow();
				tbl.Rows.Add(tRow);
				for (cellCtr = 1; cellCtr <= colCnt; cellCtr++)
				{
					// Create a new cell and add it to the row.
					TableCell tCell = new TableCell();
					tCell.Text = "Row " + rowCtr + ", Cell " + cellCtr;
					tRow.Cells.Add(tCell);
				}
			}

			return tbl;
		}


		public static GVLineChart BoxPlot(DataTable dt, string label, string value, string interval)
		{
			GVLineChart h = BoxPlot(dt, label, value, interval, getDefaultWidth(), getDefaultHeight());
			return h;
		}

		public static GVLineChart BoxPlot(DataTable dt, string label, string value, string interval, int wd, int ht)
		{
			GVLineChart h = new GVLineChart();

			dt.Columns.Add("label2", typeof(string), "Label");
			dt.Columns.Add("SDm1", typeof(float), "(M-SD)");
			dt.Columns.Add("SDp1", typeof(float), "(M+SD)");
			dt.Columns.Add("SD2m1", typeof(float), "((M*1.5)-SD)");
			dt.Columns.Add("SD2p1", typeof(float), "((M*1.5)+SD)");
			dt.Columns.Add("M2", typeof(float), "(M*1.5)");


			DataView vw = dt.AsDataView();
			
			DataTable dt2 = vw.ToTable(false, new string[9] {label,value, "Min", "Max", "SDm1","SDp1",  "M2", "SD2m1","SD2p1" } );

			dt2.Columns[2].Caption = "interval"; dt2.Columns[2].ColumnName = "id2";
			dt2.Columns[3].Caption = "interval"; dt2.Columns[3].ColumnName = "id3";
			dt2.Columns[4].Caption = "interval"; dt2.Columns[4].ColumnName = "id4";
			dt2.Columns[5].Caption = "interval"; dt2.Columns[5].ColumnName = "id5";
			dt2.Columns[7].Caption = "interval"; dt2.Columns[7].ColumnName = "id7";
			dt2.Columns[8].Caption = "interval"; dt2.Columns[8].ColumnName = "id8";

			h.DataSource = dt2;
			h.DataBind();
			h.GviTitle = label;
			h.Width = wd;
			h.Height = ht;
			
			h.GviLegendPosition = LegendPostion.None;
			//h.GviOptionsOverride

			//h.GviOptionsOverride = "{\"intervals\":true,\"title\":\"Where I Spend My Time\",\"legend\":{position: 'left', textStyle: {color: 'blue', fontSize: 16}}}";

			h.GviOptionsOverride = "{ lineWidth: 0, intervals: { " +
				" 'id2': {'style':'points', 'pointSize': 2 }, " +
				" 'id3': {'style':'points', 'pointSize': 2 }, " +
				" 'id4': {'lineWidth':2, 'barWidth': 0.5 }, " + 
				" 'id5': {'lineWidth':2, 'barWidth': 0.5 }, " + 
				" 'id7': {'lineWidth':2, 'barWidth': 0.5 }, " + 
				" 'id8': {'lineWidth':2, 'barWidth': 0.5 }, " + 
				"}}";

			return h;
		}


		public static GVColumnChart ColumnChart(DataTable dt, string label, string value, string interval, int wd, int ht)
		{
			GVColumnChart h = new GVColumnChart();

			dt.Columns.Add("SDm1", typeof(float), "(M-SD)");
			dt.Columns.Add("SDp1", typeof(float), "(M+SD)");
			dt.Columns.Add("SD2m1", typeof(float), "((M*1.5)-SD)");
			dt.Columns.Add("SD2p1", typeof(float), "((M*1.5)+SD)");
			dt.Columns.Add("M2", typeof(float), "(M*1.5)");


			DataView vw = dt.AsDataView();

			DataTable dt2 = vw.ToTable(false, new string[9] { label, value, "Min", "Max", "SDm1", "SDp1", "M2", "SD2m1", "SD2p1" });

			dt2.Columns[2].Caption = "interval"; dt2.Columns[2].ColumnName = "id2";
			dt2.Columns[3].Caption = "interval"; dt2.Columns[3].ColumnName = "id3";
			dt2.Columns[4].Caption = "interval"; dt2.Columns[4].ColumnName = "id4";
			dt2.Columns[5].Caption = "interval"; dt2.Columns[5].ColumnName = "id5";
			dt2.Columns[7].Caption = "interval"; dt2.Columns[7].ColumnName = "id7";
			dt2.Columns[8].Caption = "interval"; dt2.Columns[8].ColumnName = "id8";

			h.DataSource = dt2;
			h.DataBind();
			h.GviTitle = label;
			h.Width = wd;
			h.Height = ht;

			h.GviLegendPosition = LegendPostion.None;
			//h.GviOptionsOverride

			//h.GviOptionsOverride = "{\"intervals\":true,\"title\":\"Where I Spend My Time\",\"legend\":{position: 'left', textStyle: {color: 'blue', fontSize: 16}}}";

			h.GviOptionsOverride = "{ lineWidth: 0, intervals: { " +
				" 'id2': {'style':'points', 'pointSize': 2 }, " +
				" 'id3': {'style':'points', 'pointSize': 2 }, " +
				" 'id4': {'lineWidth':2, 'barWidth': 0.5 }, " +
				" 'id5': {'lineWidth':2, 'barWidth': 0.5 }, " +
				" 'id7': {'lineWidth':2, 'barWidth': 0.5 }, " +
				" 'id8': {'lineWidth':2, 'barWidth': 0.5 }, " +
				"}}";

			return h;
		}



		
		#region DotNet.HighCharts


		public static DataTable loaddata()
		{
			DataTable dt = new DataTable();
			dt.Columns.Add("Var", typeof(string));
			dt.Columns.Add("M", typeof(double));
			dt.Columns.Add("SD", typeof(double));

			DataRow r1 = dt.NewRow(); r1["Var"] = "varA"; r1["M"] = 12.0; r1["SD"] = 1.8; dt.Rows.Add(r1);
			DataRow r2 = dt.NewRow(); r2["Var"] = "varB"; r2["M"] = 14.3; r2["SD"] = 0.7; dt.Rows.Add(r2);
			DataRow r3 = dt.NewRow(); r3["Var"] = "varC"; r3["M"] = 16.6; r3["SD"] = 1.3; dt.Rows.Add(r3);
			DataRow r4 = dt.NewRow(); r4["Var"] = "varD"; r4["M"] = 10.4; r4["SD"] = 2.3; dt.Rows.Add(r4);

			return dt;
		}




		public static string Highcharts()
		{

			DotNet.Highcharts.Highcharts chart = new DotNet.Highcharts.Highcharts("chart");
			//chart.InitChart(new DotNet.Highcharts.Highcharts.Chart {Width=300, Height=200});

			chart.InitChart(new DotNet.Highcharts.Options.Chart { Width = 300, Height = 200 });


			chart.SetXAxis(new DotNet.Highcharts.Options.XAxis { Categories = new[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" } });
			chart.SetSeries(new Series { Data = new Data(new object[] { 29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4 }) });

			string htmlout = chart.ToHtmlString();

			return (htmlout);
		}


		public static string Highcharts2()
		{
			DataTable dt2 = loaddata();
			string htmlout = Highcharts2("chart", dt2, "Var", "M");

			return (htmlout);

		}

		public static string Highcharts2(string title, DataTable dt2, string categories, string data)
		{
			ChartTypes charttype = ChartTypes.Line;
			int width = 400; int height = 300;
			List<string> series_data = new List<string> { data };
			string htmlout = Highcharts2(title, dt2, categories, series_data, charttype, width, height);
			return (htmlout);
		}


		public static string Highcharts2(string title, DataTable dt2, string categories, string data, int width, int height)
		{
			ChartTypes charttype = ChartTypes.Line;
			List<string> series_data = new List<string> { data };
			string htmlout = Highcharts2(title, dt2, categories, series_data, charttype, width, height);
			return (htmlout);
		}



		public static string Highcharts2(string title, DataTable dt2, string categories, List<string> series_list, ChartTypes charttype, int width, int height)
		{

			List<string> list_cat = dt2.AsEnumerable().Select(f => f.Field<string>(categories)).ToList();

			DotNet.Highcharts.Highcharts chart2 = new DotNet.Highcharts.Highcharts(title)
			.SetXAxis(new DotNet.Highcharts.Options.XAxis { Categories = list_cat.ToArray() });
			

			Series[] myseries = new Series[series_list.Count];

			List<Series> allSeries = new List<Series>();

			foreach(string s in series_list)
			{
				List<decimal> list_data = dt2.AsEnumerable().Select(f => f.Field<decimal>(s)).ToList();

				allSeries.Add(new Series { Type = charttype, Name = s, Data = new Data(list_data.Cast<object>().ToArray()) });

			}

			
			chart2.SetSeries(allSeries.Select(s => new Series {Type = s.Type, Name = s.Name, Data = s.Data }).ToArray());


			//, DefaultSeriesType = ChartTypes.Column
			chart2.InitChart(new DotNet.Highcharts.Options.Chart { Width = width, Height = height});
			chart2.SetExporting(new DotNet.Highcharts.Options.Exporting { Enabled = true });

			chart2.SetCredits(new DotNet.Highcharts.Options.Credits { Enabled = false });
			chart2.SetTitle(new DotNet.Highcharts.Options.Title { Text = title} );

			//here
			//chart2.SetPlotOptions(new DotNet.Highcharts.Options.PlotOptions { Column = true});

			string htmlout = chart2.ToHtmlString();

			return (htmlout);

		}






		#region Line charts
		public static string Highcharts_Line(  
			string chartname,
			DataTable dt_rawdata, 
			string x_var, 
			string y_var, 
			string series_var_name,
			string x_var_type,
			string charttitle,
			string xaxislabel,
			string yaxislabel,
			int wd,
			int ht)
		{

			string chart = Highcharts_Line(chartname, dt_rawdata, x_var, y_var, series_var_name, x_var_type, charttitle, xaxislabel, yaxislabel, wd, ht, "", "", "Horizontal");

			return (chart);
		
		}



		public static string Highcharts_Line(
			string chartname,
			DataTable dt_rawdata,
			string x_var,
			string y_var,
			string series_var_name,
			string x_var_type,
			string charttitle,
			string xaxislabel,
			string yaxislabel,
			int wd,
			int ht,
			string pointurl)
		{

			string chart = Highcharts_Line(chartname, dt_rawdata, x_var, y_var, series_var_name, x_var_type, charttitle, xaxislabel, yaxislabel, wd, ht, pointurl, "", "Horizontal");

			return (chart);

		}

		public static string Highcharts_Line(
	string chartname,
	DataTable dt_rawdata,
	string x_var,
	string y_var,
	string series_var_name,
	string x_var_type,
	string charttitle,
	string xaxislabel,
	string yaxislabel,
	int wd,
	int ht,
	string pointurl,
	string legendOpts,
	string legendDirection)
		{
			string chart = Highcharts_Line(chartname, dt_rawdata, x_var, y_var, series_var_name, x_var_type, charttitle, xaxislabel, yaxislabel, wd, ht, pointurl, legendOpts, legendDirection, 0,0,0,0);

			return (chart);

		}
		
		public static string Highcharts_Line(  
			string chartname,
			DataTable dt_rawdata, 
			string x_var, string y_var,  string series_var_name,
			string x_var_type,
			string charttitle, string xaxislabel,  string yaxislabel,
			int wd, int ht,
			string pointurl,
			string legendOpts,
			string legendDirection,
			int xmin, int xmax, int ymin, int ymax)
		{
			bool reverseYaxis = false;

			if(charttitle.StartsWith("Subject DATA Dates"))
			{
				reverseYaxis = false;
			}

			DotNet.Highcharts.Highcharts chart;

			if (ymin == 0 & ymax == 0)
			{
				chart = new DotNet.Highcharts.Highcharts(chartname)
					.InitChart(new Chart { DefaultSeriesType = ChartTypes.Line, Width = wd, Height = ht, ZoomType = ZoomTypes.X })
					.SetYAxis(new YAxis { Title = new YAxisTitle { Text = yaxislabel }, Reversed = reverseYaxis })
					;
			}
			else  //specify range of Y axis if provided
			{
				chart = new DotNet.Highcharts.Highcharts(chartname)
					.InitChart(new Chart { DefaultSeriesType = ChartTypes.Line, Width = wd, Height = ht, ZoomType = ZoomTypes.X })
					.SetYAxis(new YAxis { Title = new YAxisTitle { Text = yaxislabel }, Reversed = reverseYaxis, Min=ymin, Max=ymax })
					;
			}


			chart.SetPlotOptions(new PlotOptions
			{
				Series = new PlotOptionsSeries
				{
					Point = new PlotOptionsSeriesPoint
					{
						Events = new PlotOptionsSeriesPointEvents
						{
							Click = "function() {var newWindow = window.open( this.options.uRL, '_blank'); newWindow.focus(); return false;}"
							//Click = "function() {location.href =
							//this.options.uRL;}"
						}
					},
					
					Marker = new PlotOptionsSeriesMarker {  Enabled = true }  
				}
			});


		
			if (x_var_type == "date")
			{
				chart.SetTitle(new Title { Text = charttitle })
				.SetXAxis(new DotNet.Highcharts.Options.XAxis
				{
					Type = AxisTypes.Datetime,
					Title = new XAxisTitle { Text = xaxislabel }
				});
			}
			else if (x_var_type == "numeric")
			{
				if (xmin== 0 & xmax==0)
				{
					chart.SetTitle(new Title { Text = charttitle })
					.SetXAxis(new DotNet.Highcharts.Options.XAxis
					{
						Type = AxisTypes.Linear,
						Title = new XAxisTitle { Text = xaxislabel }
					}
					);
				}
				else
				{
					chart.SetTitle(new Title { Text = charttitle })
					.SetXAxis(new DotNet.Highcharts.Options.XAxis
					{
						Type = AxisTypes.Linear,
						Title = new XAxisTitle { Text = xaxislabel },
						Min = xmin,
						Max = xmax

					});
				}
			}


			List<string> list_series = dt_rawdata.AsEnumerable().Select(f => f.Field<string>(series_var_name)).Distinct().ToList();


			//Loop through the unique values in the series_var_name to create the various data series
			if (list_series != null)
			{

				int numseries = list_series.Count;
				Series[] s = new Series[numseries];

				for (int i = 0; i < list_series.Count; i++)
				{
					var x = from f in dt_rawdata.AsEnumerable()
							where f.Field<string>(series_var_name) == list_series[i]
							select f;
					List<double> yval = new List<double>();

					try
					{
						yval = x.Select(f => Convert.ToDouble(f.Field<string>(y_var))).ToList();
					}
					catch(Exception ex)
					{
						string x1 = ex.Message;
						try
						{
							yval = x.Select(f => Convert.ToDouble(f.Field<double>(y_var))).ToList();
						}
						catch (Exception ex2)
						{
							string x2 = ex2.Message;
							yval = x.Select(f => Convert.ToDouble(f.Field<Int64>(y_var))).ToList();
						}
					}


					List<string> delink = new List<string>();
					if (pointurl != "")
					{
						 delink = x.Select(f => f.Field<string>(pointurl)).ToList();
					}



					List<double> xval_dbl = new List<double>();
					if (x_var_type == "date")
					{
						//List<DateTime> xval_date = x.Select(f => f.Field<DateTime>(x_var)).ToList();

						xval_dbl = x.Select(f => Tools.GetTotalMilliseconds(f.Field<DateTime>(x_var))).ToList();
					}

					else if (x_var_type == "numeric")
					{

						try
						{
							xval_dbl = x.Select(f => f.Field<double>(x_var)).ToList();
						}
						catch (Exception ex)
						{
							string x1 = ex.Message;
							xval_dbl = x.Select(f => Convert.ToDouble(f.Field<int>(x_var))).ToList();
						}

					}


					////Example 2.  from   http://techbrij.com/linq-combine-multiple-lists-parallel-c

					//var datatriple = xval_date.ZipThree(yval.AsEnumerable(), delink, (first, second, third) => new { X = first, Y = second, URL = third });

					SeriesData[] seriesdata = new SeriesData[xval_dbl.Count()];

					for (int j = 0; j < xval_dbl.Count(); j++)
					{
						if (xval_dbl[j] != -999 & yval[j] != -999)
						{

							SeriesData_wURL sdata = new SeriesData_wURL();
							
							//double dbl_x =
							//DotNet.Highcharts.Helpers.Tools.GetTotalMilliseconds(xval_date[j]);

							sdata.X = xval_dbl[j];  //xval_date[j].ToShortDateString();
							sdata.Y = yval[j];

							if (delink.Count > 0)
							{
								if (delink[j] != null & pointurl != "")
								{
									sdata.URL = delink[j];
								}
							}

							seriesdata[j] = sdata;
						}
					}
					//jsondata += JsonConvert.SerializeObject(datapair);
					s[i] = new Series();
					s[i].Name = list_series[i];

					s[i].Data = new Data(seriesdata);

					//s[i].Color = (Color)System.Drawing.ColorTranslator.FromHtml(@"#" + list_color[i]);

				}

				#region Legend formatting
				//Layouts layout;

				//if(legendDirection.StartsWith("H"))
				//{
				//    layout = Layouts.Horizontal;
				//}
				//else
				//{
				//    layout = Layouts.Vertical;
				//}

				
				if(legendOpts=="None")
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
					{
						Layout = Layouts.Vertical,
						Align = HorizontalAligns.Right,
						VerticalAlign = VerticalAligns.Top,
						X = -10,
						Y = 60,
						BorderWidth = 0,
						Enabled = false
					});

				}
				else if (legendOpts == "Top")
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
					{
						Layout = Layouts.Horizontal,
						Align = HorizontalAligns.Center,
						VerticalAlign = VerticalAligns.Top,
						X = 0,
						Y = 10,
						BorderWidth = 0
					});
				}
				else if (legendOpts == "Bottom")
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
					{
						Layout = Layouts.Vertical,
						Align = HorizontalAligns.Center,
						VerticalAlign = VerticalAligns.Bottom,
						X = 0,
						Y = 0,
						BorderWidth = 0
					});
				}
				else if (legendOpts == "Floating")
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
						{
							Layout = Layouts.Vertical,
							Align = HorizontalAligns.Right,
							VerticalAlign = VerticalAligns.Top,
							//X = -10,
							//Y = 60,
							BorderWidth = 0,
							Floating = true
						});
				}
				else if (legendOpts == "Right")
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
					{
						Layout = Layouts.Vertical,
						Align = HorizontalAligns.Right,
						VerticalAlign = VerticalAligns.Top,
						X = -10,
						Y = 60,
						BorderWidth = 0
					});

				}
				else
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
					{
						Layout = Layouts.Vertical,
						Align = HorizontalAligns.Right,
						VerticalAlign = VerticalAligns.Top,
						X = -10,
						Y = 60,
						BorderWidth = 0
					});

				}
				#endregion Legend formatting


				//chart.SetLegend(new DotNet.Highcharts.Options.Legend {Pl}  )

				chart.SetSeries(s);
				chart.SetExporting(new DotNet.Highcharts.Options.Exporting { Enabled = true });
				chart.SetCredits(new DotNet.Highcharts.Options.Credits { Enabled = false });

				chart.SetExporting(new DotNet.Highcharts.Options.Exporting { Type = "image/png", SourceWidth = wd, SourceHeight = ht });



				string htmlout = chart.ToHtmlString();

				return (htmlout);
			}
			else
			{
				return ("error in Highcharts_Line().");
			}
		

		}

		#endregion Line Charts




		#region Scatter


		public static string Highcharts_Scatter(
			string chartname,
			DataTable dt_rawdata,
			string x_var, string y_var, string series_var_name,
			string x_var_type,
			string charttitle, string xaxislabel, string yaxislabel,
			int wd, int ht,
			string pointurl,
			string legendOpts,
			string legendDirection,
			int xmin, int xmax, int ymin, int ymax , bool addRefLine, string RefLineType
			)
		{
			bool reverseYaxis = false;

			if (charttitle.StartsWith("Subject DATA Dates"))
			{
				reverseYaxis = false;
			}

			DotNet.Highcharts.Highcharts chart;

			if (ymin == 0 & ymax == 0)
			{
				chart = new DotNet.Highcharts.Highcharts(chartname)
					.InitChart(new Chart { DefaultSeriesType = ChartTypes.Scatter, Width = wd, Height = ht, ZoomType = ZoomTypes.Xy })
					.SetYAxis(new YAxis { Title = new YAxisTitle { Text = yaxislabel }, Reversed = reverseYaxis })
					;
			}
			else
			{
				chart = new DotNet.Highcharts.Highcharts(chartname)
					.InitChart(new Chart
					{
						DefaultSeriesType = ChartTypes.Scatter,
						Width = wd,
						Height = ht,
						ZoomType = ZoomTypes.Xy  
					})
					.SetYAxis(new YAxis { Title = new YAxisTitle { Text = yaxislabel }, Reversed = reverseYaxis, Min = ymin, Max = ymax });

				;

//                chart = new DotNet.Highcharts.Highcharts(chartname)
//                    .InitChart(new Chart { DefaultSeriesType = ChartTypes.Scatter, Width = wd, Height = ht, ZoomType = ZoomTypes.Xy
//                        , Events = new ChartEvents {  Load = "AddDiag", AddSeries = "DiagSeries" } })
//                    .SetYAxis(new YAxis { Title = new YAxisTitle { Text = yaxislabel }, Reversed = reverseYaxis, Min = ymin, Max = ymax })
//                    .AddJavascripFunction("AddDiag", @"this.renderer.path(['M', 0, 0, 'L', 50,50]).attr({'stroke-width': 2,stroke: 'lightgrey'}).add();")
//                    .AddJavascripFunction("DiagSeries", @"// set up series for a diag line, x=y
//                         var series = this.series[0];
//                        series.addPoint([0, 0], true, true);
//                        series.addPoint([5, 5], true, true);");
//                    ;
			}


   
			chart.SetPlotOptions(new PlotOptions
			{
				Series = new PlotOptionsSeries
				{
					Point = new PlotOptionsSeriesPoint
					{
						Events = new PlotOptionsSeriesPointEvents
						{
							Click = "function() {var newWindow = window.open( this.options.uRL, '_blank'); newWindow.focus(); return false;}"
							//Click = "function() {location.href =
							//this.options.uRL;}"
						}
					},

					Marker = new PlotOptionsSeriesMarker { Enabled = true }

				}


			});



			if (x_var_type == "date")
			{
				chart.SetTitle(new Title { Text = charttitle })
				.SetXAxis(new DotNet.Highcharts.Options.XAxis
				{
					Type = AxisTypes.Datetime,
					Title = new XAxisTitle { Text = xaxislabel }
				});
			}
			else if (x_var_type == "numeric")
			{
				if (xmin == 0 & xmax == 0)
				{
					chart.SetTitle(new Title { Text = charttitle })
					.SetXAxis(new DotNet.Highcharts.Options.XAxis
					{
						Type = AxisTypes.Linear,
						Title = new XAxisTitle { Text = xaxislabel }
					}
					);
				}
				else
				{
					chart.SetTitle(new Title { Text = charttitle })
					.SetXAxis(new DotNet.Highcharts.Options.XAxis
					{
						Type = AxisTypes.Linear,
						Title = new XAxisTitle { Text = xaxislabel },
						Min = xmin,
						Max = xmax

					});

				}




			}


			List<string> list_series = dt_rawdata.AsEnumerable().Select(f => f.Field<string>(series_var_name)).Distinct().ToList();

			if (list_series != null)
			{

				int numseries = list_series.Count;
				Series[] s = new Series[numseries + 1];

				for (int i = 0; i < list_series.Count; i++)
				{
					var x = from f in dt_rawdata.AsEnumerable()
							where f.Field<string>(series_var_name) == list_series[i]
							select f;
					List<double> yval = new List<double>();

					try
					{
						yval = x.Select(f => Convert.ToDouble(f.Field<Double>(y_var))).ToList();
					}
					catch (Exception ex)
					{
						string x1 = ex.Message;
						yval = x.Select(f => Convert.ToDouble(f.Field<Int64>(y_var)) ).ToList();

					}


					string[] columnNames = dt_rawdata.Columns.Cast<DataColumn>()
								 .Select(c => c.ColumnName)
								 .ToArray();

					List<string> delink = new List<string>();

					if (columnNames.Contains(pointurl))
					{
						delink = x.Select(f => f.Field<string>(pointurl)).ToList();
					}


					List<double> xval_dbl = new List<double>();
					if (x_var_type == "date")
					{
						//List<DateTime> xval_date = x.Select(f => f.Field<DateTime>(x_var)).ToList();

						xval_dbl = x.Select(f => Tools.GetTotalMilliseconds(f.Field<DateTime>(x_var))).ToList();
					}

					else if (x_var_type == "numeric")
					{

						try
						{
							xval_dbl = x.Select(f => f.Field<double>(x_var)).ToList();
						}
						catch (Exception ex)
						{
							string x1 = ex.Message;
							xval_dbl = x.Select(f => Convert.ToDouble(f.Field<int>(x_var))).ToList();
						}

					}


					////Example 2.  from   http://techbrij.com/linq-combine-multiple-lists-parallel-c

					//var datatriple = xval_date.ZipThree(yval.AsEnumerable(), delink, (first, second, third) => new { X = first, Y = second, URL = third });

					SeriesData[] seriesdata = new SeriesData[xval_dbl.Count()];

					List<string> datalabels_for_tooltip = x.Select(f => f.Field<string>("tooltip")).ToList();


					for (int j = 0; j < xval_dbl.Count(); j++)
					{
						if (xval_dbl[j] != -999 & yval[j] != -999)
						{

							SeriesData_wURL sdata = new SeriesData_wURL();

							//double dbl_x =
							//DotNet.Highcharts.Helpers.Tools.GetTotalMilliseconds(xval_date[j]);

							sdata.X = xval_dbl[j];  //xval_date[j].ToShortDateString();
							sdata.Y = yval[j];

							if (delink.Count > 0)
							{
								if (delink[j] != null & pointurl != "")
								{
									sdata.URL = delink[j];
								}
							}


							sdata.DataLabels = datalabels_for_tooltip[j];

							seriesdata[j] = sdata;
						}
					}

					
					//jsondata += JsonConvert.SerializeObject(datapair);
					s[i] = new Series();
					s[i].Name = list_series[i];

					s[i].Data = new Data(seriesdata);

					//s[i].PlotOptionsScatter.DataLabels.Enabled = true;

					//s[i].PlotOptionsScatter.Tooltip = 

					//s[i].Color = (Color)System.Drawing.ColorTranslator.FromHtml(@"#" + list_color[i]);

				}


				#region Reference Line
				if (addRefLine)
				{
					if (RefLineType == "x=y")
					{
						s[numseries] = new Series();
						s[numseries].Name = "RefLine";
						SeriesData[] reflinedata = new SeriesData[5];


						SeriesData reflinedatapoint_min = new SeriesData();
						SeriesData reflinedatapoint_max = new SeriesData();

						reflinedatapoint_min.X = ymin;
						reflinedatapoint_min.Y = ymin;

						reflinedatapoint_max.X = ymax;
						reflinedatapoint_max.Y = ymax;


						reflinedata[0] = reflinedatapoint_min;
						reflinedata[1] = reflinedatapoint_max;

						s[numseries].Data = new Data(reflinedata);
						s[numseries].Type = ChartTypes.Line;
						s[numseries].Color = Color.LightGray;
						s[numseries].PlotOptionsSeries = new PlotOptionsSeries { Marker = new PlotOptionsSeriesMarker { Enabled = false } };

					}
				}
				
				#endregion



				#region Legend formatting
				//Layouts layout;

				//if (legendDirection.StartsWith("H"))
				//{
				//    layout = Layouts.Horizontal;
				//}
				//else
				//{
				//    layout = Layouts.Vertical;
				//}


				if (legendOpts == "None")
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
					{
						Layout = Layouts.Vertical,
						Align = HorizontalAligns.Right,
						VerticalAlign = VerticalAligns.Top,
						X = -10,
						Y = 60,
						BorderWidth = 0,
						Enabled = false
					});

				}
				else if (legendOpts == "Top")
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
					{
						Layout = Layouts.Horizontal,
						Align = HorizontalAligns.Center,
						VerticalAlign = VerticalAligns.Top,
						X = 0,
						Y = 10,
						BorderWidth = 0
					});
				}
				else if (legendOpts == "Bottom")
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
					{
						Layout = Layouts.Vertical,
						Align = HorizontalAligns.Center,
						VerticalAlign = VerticalAligns.Bottom,
						X = 0,
						Y = 0,
						BorderWidth = 0
					});
				}
				else if (legendOpts == "Floating")
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
					{
						Layout = Layouts.Vertical,
						Align = HorizontalAligns.Right,
						VerticalAlign = VerticalAligns.Top,
						//X = -10,
						//Y = 60,
						BorderWidth = 0,
						Floating = true
					});
				}
				else if (legendOpts == "Right")
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
					{
						Layout = Layouts.Vertical,
						Align = HorizontalAligns.Right,
						VerticalAlign = VerticalAligns.Top,
						X = -10,
						Y = 60,
						BorderWidth = 0
					});

				}
				else
				{
					chart.SetLegend(new DotNet.Highcharts.Options.Legend
					{
						Layout = Layouts.Vertical,
						Align = HorizontalAligns.Right,
						VerticalAlign = VerticalAligns.Top,
						X = -10,
						Y = 60,
						BorderWidth = 0
					});

				}
				#endregion Legend formatting


				//chart.SetLegend(new DotNet.Highcharts.Options.Legend {Pl}  )

				chart.SetSeries(s);
				chart.SetExporting(new DotNet.Highcharts.Options.Exporting { Enabled = true });
				chart.SetCredits(new DotNet.Highcharts.Options.Credits { Enabled = false });

				chart.SetExporting(new DotNet.Highcharts.Options.Exporting { Type = "image/png", SourceWidth = wd, SourceHeight = ht });

				//chart.AddJavascripFunction()


				string htmlout = chart.ToHtmlString();

				return (htmlout);
			}
			else
			{
				return ("error in Highcharts_Scatter().");
			}


		}

		#endregion





		#region Stacked Column
		public static string Highcharts_StackedColumn(
			DataTable dt_series, 
			DataTable dt_rawdata, 
			string x_var, 
			string y_var, 
			string series_var_name, 
			string series_color_var_name, 
			string chartname, 
			string charttitle,
			string xaxistitle,
			string yaxislabel,
			double xaxismin,
			double xaxismax,
			double yaxismin,
			double yaxismax,
			int wd, 
			int ht, 
			DataTable dt_vertlines,
			string line_x_var, 
			string line_text_var,
			string line_xtype)
		{
			if (dt_rawdata != null)
			{

				string jsondata = "";

				List<string> list_series = dt_series.AsEnumerable().Select(f => f.Field<string>(series_var_name)).ToList();
				List<string> list_color = dt_series.AsEnumerable().Select(f => f.Field<string>(series_color_var_name)).ToList();

				DotNet.Highcharts.Highcharts chart = new DotNet.Highcharts.Highcharts(chartname)
				.InitChart(new Chart { DefaultSeriesType = ChartTypes.Column, Width = wd, Height = ht });


				#region Vertical PlotLines

				XAxisPlotLines[] lines = new XAxisPlotLines[dt_vertlines.Rows.Count];
				if (dt_vertlines != null)
				{
					//Plot vertical lines for the TP for all studies in the fullstudy

					for (int i = 0; i < dt_vertlines.Rows.Count; i++)
					{
						DataRow row = dt_vertlines.Rows[i];
						//string datelabel = Convert.ToString(row.ItemArray[1]);
						//DateTime date = Convert.ToDateTime(row.ItemArray[2]);
						string vertlabel = Convert.ToString(row[line_text_var]);

						if (line_xtype == "date")
						{
							DateTime vert_xval_date = Convert.ToDateTime(row[line_x_var]);
							lines[i] = new XAxisPlotLines
							{
								Value = DotNet.Highcharts.Helpers.Tools.GetTotalMilliseconds(vert_xval_date),
								Color = Color.DimGray,
								Width = 2,
								ZIndex = 5,
								Label = new XAxisPlotLinesLabel
								{
									Text = vertlabel,
									VerticalAlign = DotNet.Highcharts.Enums.VerticalAligns.Top,
									TextAlign = DotNet.Highcharts.Enums.HorizontalAligns.Left
								}
							};
						}
						else if (line_xtype == "numeric")
						{
							decimal vert_xval = Convert.ToDecimal(row[line_x_var]);
							lines[i] = new XAxisPlotLines
							{
								Value = (DotNet.Highcharts.Helpers.Number)vert_xval,
								Color = Color.DimGray,
								Width = 2,
								ZIndex = 5,
								Label = new XAxisPlotLinesLabel
								{
									Text = vertlabel,
									VerticalAlign = DotNet.Highcharts.Enums.VerticalAligns.Top,
									TextAlign = DotNet.Highcharts.Enums.HorizontalAligns.Left
								}
							};
						}
					}
				}
				#endregion Vertical PlotLines

				//TO DO: NEED TO SET IT UP FOR NUMERIC X AXIS ALSO
				chart.SetTitle(new Title { Text = charttitle })
				.SetXAxis(new DotNet.Highcharts.Options.XAxis
				{
					PlotLines = lines,
					Type = AxisTypes.Datetime
				})
				.SetYAxis(new YAxis { Title = new YAxisTitle { Text = yaxislabel } })
				.SetPlotOptions(new PlotOptions { Column = new PlotOptionsColumn { Stacking = Stackings.Normal } });


				int numseries = list_series.Count;
				Series[] s = new Series[numseries];

				for (int i = 0; i < list_series.Count; i++)
				{
					var x = from f in dt_rawdata.AsEnumerable()
							where f.Field<string>(series_var_name) == list_series[i]
							select f;

					List<DateTime> xval = x.Select(f => f.Field<DateTime>(x_var)).ToList();
					List<double> yval = new List<double>();

					yval = x.Select(f => f.Field<double>(y_var)).ToList();

					////Example 2.  from   http://techbrij.com/linq-combine-multiple-lists-parallel-c
					//var datapair = d.Zip(yval, (first, second) => new { Week = first, Hrs = second });
					var datapair = xval.Zip(yval, (first, second) => new { X = first, Y = second });

					object[,] datapairs = new object[datapair.Count(), 2];

					for (int j = 0; j < datapair.Count(); j++)
					{
						datapairs[j, 0] = xval[j];
						datapairs[j, 1] = yval[j];
					}

					jsondata += JsonConvert.SerializeObject(datapair);
					s[i] = new Series();
					s[i].Name = list_series[i];
					s[i].Data = new Data(datapairs);


					//Handle where there is no variable that explicitly holds color
					try
					{
						s[i].Color = (Color)System.Drawing.ColorTranslator.FromHtml(@"#" + list_color[i]);
					}
					catch (Exception ex) {
						string x1 = ex.Message;
					}


				}

				chart.SetSeries(s);
				chart.SetExporting(new DotNet.Highcharts.Options.Exporting { Enabled = true });
				chart.SetCredits(new DotNet.Highcharts.Options.Credits { Enabled = false });

				chart.SetExporting(new DotNet.Highcharts.Options.Exporting { Type = "image/png", SourceWidth = 500, SourceHeight = 400 });

				string htmlout = chart.ToHtmlString();

				return (htmlout);
			}
			else
			{
				return ("error in Highcharts_StackedColumn().");
			}
		}




		public static string Highcharts_StackedColumn(
			DataTable dt_series,
			DataTable dt_rawdata,
			string x_var,
			string y_var,
			string series_var_name,
			string series_color_var_name,
			string chartname,
			string charttitle,
			string xaxistitle,
			string yaxislabel,
			double xaxismin,
			double xaxismax,
			double yaxismin,
			double yaxismax,
			int wd,
			int ht
			//DataTable dt_vertlines,
			//string line_x_var,
			//string line_text_var, string line_xtype
			)
		{
			if (dt_rawdata != null)
			{

				string jsondata = "";

				List<string> list_series = dt_series.AsEnumerable().Select(f => f.Field<string>(series_var_name)).ToList();
				List<string> list_color = dt_series.AsEnumerable().Select(f => f.Field<string>(series_color_var_name)).ToList();

				DotNet.Highcharts.Highcharts chart = new DotNet.Highcharts.Highcharts(chartname)
				.InitChart(new Chart { DefaultSeriesType = ChartTypes.Column, Width = wd, Height = ht });



				//TO DO: NEED TO SET IT UP FOR NUMERIC X AXIS ALSO
				chart.SetTitle(new Title { Text = charttitle })
				.SetXAxis(new DotNet.Highcharts.Options.XAxis
				{
					//PlotLines = lines,
					Type = AxisTypes.Datetime
				})
				.SetYAxis(new YAxis { Title = new YAxisTitle { Text = yaxislabel } })
				.SetPlotOptions(new PlotOptions { Column = new PlotOptionsColumn { Stacking = Stackings.Normal } });


				int numseries = list_series.Count;
				Series[] s = new Series[numseries];

				for (int i = 0; i < list_series.Count; i++)
				{
					var x = from f in dt_rawdata.AsEnumerable()
							where f.Field<string>(series_var_name) == list_series[i]
							select f;

					List<DateTime> xval = x.Select(f => f.Field<DateTime>(x_var)).ToList();
					
					//List<double> yval = new List<double>();
					//yval = x.Select(f => f.Field<double>(y_var)).ToList();
					List<decimal?> yval = new List<decimal?>();
					yval = x.Select(f => f.Field<decimal?>(y_var)).ToList();


					////Example 2.  from   http://techbrij.com/linq-combine-multiple-lists-parallel-c
					//var datapair = d.Zip(yval, (first, second) => new { Week = first, Hrs = second });
					var datapair = xval.Zip(yval, (first, second) => new { X = first, Y = second });

					object[,] datapairs = new object[datapair.Count(), 2];

					for (int j = 0; j < datapair.Count(); j++)
					{
						datapairs[j, 0] = xval[j];
						datapairs[j, 1] = yval[j];
					}

					jsondata += JsonConvert.SerializeObject(datapair);
					s[i] = new Series();
					s[i].Name = list_series[i];
					s[i].Data = new Data(datapairs);


					//Handle where there is no variable that explicitly holds color
					try
					{
						s[i].Color = (Color)System.Drawing.ColorTranslator.FromHtml(@"#" + list_color[i]);
					}
					catch (Exception ex) {
						string x1 = ex.Message;
					}


				}

				chart.SetSeries(s);
				chart.SetExporting(new DotNet.Highcharts.Options.Exporting { Enabled = true });
				chart.SetCredits(new DotNet.Highcharts.Options.Credits { Enabled = false });

				chart.SetExporting(new DotNet.Highcharts.Options.Exporting { Type = "image/png", SourceWidth = 500, SourceHeight = 400 });

				string htmlout = chart.ToHtmlString();

				return (htmlout);
			}
			else
			{
				return ("error in Highcharts_StackedColumn().");
			}
		}





		//public static string Highcharts_StackedColumn(
		//    DataTable dt_rows_as_series,
		//    string series_var_name,
		//    string chartname,
		//    string charttitle,
		//    string xaxistitle,
		//    string yaxislabel,
		//    int wd,
		//    int ht
		//    )
		//{
		//    if (dt_rows_as_series != null)
		//    {

		//        string jsondata = "";

		//        //List<string> list_series = dt_series.AsEnumerable().Select(f => f.Field<string>(series_var_name)).ToList();
		//        //List<string> list_color = dt_series.AsEnumerable().Select(f => f.Field<string>(series_color_var_name)).ToList();

		//        DotNet.Highcharts.Highcharts chart = new DotNet.Highcharts.Highcharts(chartname)
		//        .InitChart(new Chart { DefaultSeriesType = ChartTypes.Column, Width = wd, Height = ht });



		//        //TO DO: NEED TO SET IT UP FOR NUMERIC X AXIS ALSO
		//        chart.SetTitle(new Title { Text = charttitle })
		//        .SetXAxis(new DotNet.Highcharts.Options.XAxis
		//        {
		//            //PlotLines = lines,
		//            Type = AxisTypes.Datetime
		//        })
		//        .SetYAxis(new YAxis { Title = new YAxisTitle { Text = yaxislabel } })
		//        .SetPlotOptions(new PlotOptions { Column = new PlotOptionsColumn { Stacking = Stackings.Normal } });


		//        int numseries = dt_rows_as_series.Rows.Count;
		//        Series[] s = new Series[numseries];

		//        for (int i = 0; i < numseries; i++)
		//        {
		//            var x = from f in dt_rows_as_series.AsEnumerable()
		//                    where f.Field<string>(series_var_name) == dt_rows_as_series.Rows[i].Field<string>(series_var_name).ToString()
		//                    select f;

		//            List<DateTime> xval = x.Select(f => f.Field<DateTime>(x_var)).ToList();
		//            List<double> yval = new List<double>();

		//            yval = x.Select(f => f.Field<double>(y_var)).ToList();

		//            ////Example 2.  from   http://techbrij.com/linq-combine-multiple-lists-parallel-c
		//            //var datapair = d.Zip(yval, (first, second) => new { Week = first, Hrs = second });
		//            var datapair = xval.Zip(yval, (first, second) => new { X = first, Y = second });

		//            object[,] datapairs = new object[datapair.Count(), 2];

		//            for (int j = 0; j < datapair.Count(); j++)
		//            {
		//                datapairs[j, 0] = xval[j];
		//                datapairs[j, 1] = yval[j];
		//            }

		//            jsondata += JsonConvert.SerializeObject(datapair);
		//            s[i] = new Series();
		//            s[i].Name = list_series[i];
		//            s[i].Data = new Data(datapairs);


		//            //Handle where there is no variable that explicitly holds color
		//            try
		//            {
		//                s[i].Color = (Color)System.Drawing.ColorTranslator.FromHtml(@"#" + list_color[i]);
		//            }
		//            catch (Exception) { }


		//        }

		//        chart.SetSeries(s);
		//        chart.SetExporting(new DotNet.Highcharts.Options.Exporting { Enabled = true });
		//        chart.SetCredits(new DotNet.Highcharts.Options.Credits { Enabled = false });

		//        chart.SetExporting(new DotNet.Highcharts.Options.Exporting { Type = "image/png", SourceWidth = 500, SourceHeight = 400 });

		//        string htmlout = chart.ToHtmlString();

		//        return (htmlout);
		//    }
		//    else
		//    {
		//        return ("error in Highcharts_StackedColumn().");
		//    }
		//}




		#endregion Stacked Column




		#endregion DotNet.HighCharts



		#region Color utilities
		public static Color LightenColor(Color inColor, double inAmount)
		{
			return Color.FromArgb(
			  inColor.A,
			  (int)Math.Min(255, inColor.R + 255 * inAmount),
			  (int)Math.Min(255, inColor.G + 255 * inAmount),
			  (int)Math.Min(255, inColor.B + 255 * inAmount));
		}

		public static Color DarkenColor(Color inColor, double inAmount)
		{
			return Color.FromArgb(
			  inColor.A,
			  (int)Math.Max(0, inColor.R - 255 * inAmount),
			  (int)Math.Max(0, inColor.G - 255 * inAmount),
			  (int)Math.Max(0, inColor.B - 255 * inAmount));
		}

		#endregion

		//public static DataTable Side(DataTable dt, List<string> splitvars)
		//{
		//    ////List<DataTable> x = new List<DataTable>();

		//    //DataTable x = dt.DefaultView.ToTable(true, splitvar);


		//    //DataRow[] result = dt.Select("Size >= 230 AND Sex = 'm'");


		//    //var JoinResult = (from p in dt.AsEnumerable()
		//    //                  join t in dtTax.AsEnumerable()
		//    //                  on p.Field<int>("Tax Id") equals t.Field<int>("Tax Id")
		//    //                  select new
		//    //                  {
		//    //                      ProductName = p.Field<string>("Product Name"),
		//    //                      BrandName = p.Field<string>("Brand Name"),
		//    //                      ProductCategory = t.Field<string>("Product Category"),
		//    //                      TaxCharge = t.Field<int>("Charge")


		//    //                  }).ToList();  

		//}



	}




	//http://stackoverflow.com/questions/10297124/how-to-combine-more-than-two-generic-lists-in-c-sharp-zip
	public static class MyFunkyExtensions
	{
		public static IEnumerable<TResult> ZipThree<T1, T2, T3, TResult>(
			this IEnumerable<T1> source,
			IEnumerable<T2> second,
			IEnumerable<T3> third,
			Func<T1, T2, T3, TResult> func)
		{
			using (var e1 = source.GetEnumerator())
			using (var e2 = second.GetEnumerator())
			using (var e3 = third.GetEnumerator())
			{
				while (e1.MoveNext() && e2.MoveNext() && e3.MoveNext())
					yield return func(e1.Current, e2.Current, e3.Current);
			}
		}




	   
	}

	 //Extend DotNet.Highcharts.Options.SeriesData
	public class SeriesData_wURL : DotNet.Highcharts.Options.SeriesData
	{
		public string URL { get; set; }


	}


}