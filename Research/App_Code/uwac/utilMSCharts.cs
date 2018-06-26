using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI.DataVisualization.Charting;

using uwac;

namespace uwac
{
	/// <summary>
	/// Summary description for utilMSCharts
	/// </summary>
	public class utilMSCharts
	{
		public utilMSCharts()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static void SaveChartImage(Chart chart, string filepath, string ChartType, string ChartDetails, int studyID, string id)
		{
			string filename = filepath + ChartType + ChartDetails + studyID.ToString() + id + ".png";
			chart.SaveImage(filename);

			Debug.WriteLine("Saving..." + filename);

			//Log this chart
			SQL_utils sql = new SQL_utils();

			List<SqlParameter> ps = new List<SqlParameter>();

			ps.Add(sql.CreateParam("ChartType", ChartType, "text"));
			ps.Add(sql.CreateParam("ChartDetail", ChartDetails, "text"));
			ps.Add(sql.CreateParam("studyID", studyID.ToString(), "int"));
			ps.Add(sql.CreateParam("id", id, "text"));


			sql.NonQuery_from_ProcName("dp.spChartLog_BySubject_INSERT", ps);

		}


		public static System.Web.UI.DataVisualization.Charting.Chart MSStackedColumn(
	DataTable dt_rawdata,
	string x_var,
	string y_var,
	string series_var,
	string x_vartype,
	DataTable colors,
	string chartname,
	string charttitle,
	string xaxistitle,
	string yaxistitle,
	double xaxismin,
	double xaxismax,
	double yaxismin,
	double yaxismax,
	int wd,
	int ht)
		{
			return MSStackedColumn(
			 dt_rawdata,
			 x_var,
			 y_var,
			 series_var,
			 x_vartype,
			 colors,
			 chartname,
			 charttitle,
			 xaxistitle,
			 yaxistitle,
			 xaxismin,
			 xaxismax,
			 yaxismin,
			 yaxismax,
			wd,
			ht,
			null,
			null);
		}


			// Main MSStackedColumn
			public static System.Web.UI.DataVisualization.Charting.Chart MSStackedColumn(
			DataTable dt_rawdata,
			string x_var,
			string y_var,
			string series_var,
			string x_vartype,
			DataTable colors,
			string chartname,
			string charttitle,
			string xaxistitle,
			string yaxistitle,
			double xaxismin,
			double xaxismax,
			double yaxismin,
			double yaxismax,
			int wd,
			int ht,
			DateTime? xaxismin_date,
			DateTime? xaxismax_date)
		{
			if (dt_rawdata != null)
			{
				//SQL_utils sql = new SQL_utils();

				if (x_vartype == "numeric")
				{
					SpreadsheetGearUtils.ChangeColumnDataType(dt_rawdata, x_var, typeof(double));
				}

				//CREATE THE CHART
				System.Web.UI.DataVisualization.Charting.Chart chart = new System.Web.UI.DataVisualization.Charting.Chart();

				foreach (DataColumn col in dt_rawdata.Columns)
				{
					if (col.ColumnName == x_var)
					{
						if (x_vartype == "date")
						{
							col.DataType = typeof(DateTime);
						}
						else if (x_vartype == "numeric")
						{
							col.DataType = typeof(Double);
						}
						else if (x_vartype == "string")
						{
							col.DataType = typeof(string);
						}
					}

				}

				try
				{
					chart.DataBindCrossTable(dt_rawdata.Rows, series_var, x_var, y_var, "", PointSortOrder.Descending);

					List<string> series_names = new List<string>();
					foreach (Series s in chart.Series)
					{
						series_names.Add(s.Name);
					}

					List<string> random_colors = new List<string> { "123245", "76AD23", "E40011", "7D2138", "ABCD33", "4561AA", "9C3872", "ED4421", "8921DD"
						,"341951","ADED21","5599DB"};


					int series_counter = 0;
					//Assign the correct colors
					foreach (Series s in chart.Series)
					{
						s.ChartType = SeriesChartType.StackedColumn;
						switch (x_vartype)
						{
							case "numeric":
								s.XValueType = ChartValueType.Double;
								break;
							case "date":
								s.XValueType = ChartValueType.Date;
								break;
							case "string":
								s.XValueType = ChartValueType.String;
								break;
						}

						//not helpful --> s.IsXValueIndexed = true;

						//s.Sort(PointSortOrder.Ascending, sortBy: ("Y"));
						string str_color;
						try
						{
							str_color = colors.AsEnumerable().Where(r => r.Field<string>("group_var") == s.Name).Select(r => r.Field<string>("group_color")).First();
						}
						catch (Exception ex)
						{
							string x = ex.Message;
							str_color = random_colors[series_counter];
						}
						s.Color = System.Drawing.ColorTranslator.FromHtml("#" + str_color);

						s.ToolTip = s.Name;
						series_counter++;
					}

					DataSet ds_series1 = chart.DataManipulator.ExportSeriesValues();

					//Insert empty points as need so stacking is correct
					if (series_names.Count > 0)
					{
						if (x_vartype == "numeric")
						{
							chart.DataManipulator.InsertEmptyPoints(1, IntervalType.Number, string.Join(",", series_names));
						}
						else if (x_vartype == "date")
						{
							chart.DataManipulator.InsertEmptyPoints(1, IntervalType.Months, string.Join(",", series_names));

						}
						else if (x_vartype == "string")
						{
							chart.DataManipulator.InsertEmptyPoints(1, IntervalType.Number, string.Join(",", series_names));

						}

						DataSet ds_series2 = chart.DataManipulator.ExportSeriesValues();
						

					}

					chart.ImageType = System.Web.UI.DataVisualization.Charting.ChartImageType.Png;
					chart.Width = wd;
					chart.Height = ht;

					//ADD A PLACE HOLDER CHART AREA TO THE CHART
					chart.ChartAreas.Add(new ChartArea());

					if (x_vartype == "numeric")
					{
						if (xaxismin != -999) { chart.ChartAreas[0].AxisX.Minimum = xaxismin; }
						if (xaxismax != -999) { chart.ChartAreas[0].AxisX.Maximum = xaxismax; }
					}
					else if (x_vartype == "date")
					{
						if (xaxismin_date != null) { 
							DateTime mydate = Convert.ToDateTime(xaxismin_date);
							chart.ChartAreas[0].AxisX.Minimum = mydate.ToOADate(); }
						if (xaxismax_date != null) {
							DateTime mydate = Convert.ToDateTime(xaxismax_date);
							chart.ChartAreas[0].AxisX.Maximum = mydate.ToOADate(); }
					}

					if (yaxismin != -999) { chart.ChartAreas[0].AxisY.Minimum = yaxismin; }
					if (yaxismax != -999) { chart.ChartAreas[0].AxisY.Maximum = yaxismax; }

					chart.ChartAreas[0].RecalculateAxesScale();

					//here not helpgful --> chart.AlignDataPointsByAxisLabel();

					chart.ChartAreas["ChartArea1"].AxisX.MajorGrid.LineColor = Color.Gainsboro;
					chart.ChartAreas["ChartArea1"].AxisY.MajorGrid.LineColor = Color.Gainsboro;
					chart.ChartAreas["ChartArea1"].AxisX.Title = xaxistitle;
					chart.ChartAreas["ChartArea1"].AxisY.Title = yaxistitle;

					//if (YAxisType == "free")
					//{
					//ADD A PLACE HOLDER LEGEND TO THE CHART
					chart.Legends.Add("Default");

					chart.Legends["Default"].LegendStyle = LegendStyle.Table;
					chart.Legends["Default"].TableStyle = LegendTableStyle.Auto;
					chart.Legends["Default"].Docking = Docking.Right;
					//}
					//else if (YAxisType == "fixed")
					//{
					//    //chart.Legends.Clear();
					//}

					Title t = new Title();
					t.Text = charttitle + "\n(created " + System.DateTime.Now.ToShortDateString() + " " + System.DateTime.Now.ToShortTimeString() + ")";

					if (dt_rawdata.Rows.Count == 0)
					{
						t.Text += "\n** 0 records entered **";
					}

					t.Alignment = ContentAlignment.TopLeft;
					t.Font = new System.Drawing.Font("Arial", 12, GraphicsUnit.Point);

					chart.Titles.Add(t);


					return (chart);
				}
				catch (Exception ex)
				{
					string x = ex.Message;
					return null;
				}
			}
			else
			{
				return (null);
			}
		}

		



	   
		// Geom:  this can be either Point or Line
		public static System.Web.UI.DataVisualization.Charting.Chart MSGeom(string geom,
			DataTable dt_rawdata,
			string x_var,
			string y_var,
			string series_var,
			string x_vartype,
			string y_vartype,
			string chartname,
			string charttitle,
			string xaxistitle,
			string yaxistitle,
			double xaxismin,
			double xaxismax,
			double yaxismin,
			double yaxismax,
			int wd,
			int ht,
			string customProps)
		{
			if (dt_rawdata != null)
			{
				//SQL_utils sql = new SQL_utils();

				if (x_vartype == "numeric")
				{
					SpreadsheetGearUtils.ChangeColumnDataType(dt_rawdata, x_var, typeof(double));
				}

				//CREATE THE CHART
				System.Web.UI.DataVisualization.Charting.Chart chart = new System.Web.UI.DataVisualization.Charting.Chart();


				//Define axis data types
				foreach (DataColumn col in dt_rawdata.Columns)
				{
					if (col.ColumnName == x_var)
					{
						if (x_vartype == "date")
						{
							col.DataType = typeof(DateTime);
						}
						else if (x_vartype == "numeric")
						{
							col.DataType = typeof(Double);
						}
						else if (x_vartype == "string")
						{
							col.DataType = typeof(string);
						}
					}
				}

				try
				{
					//Pass in the custom properties in the ToolTip and then
					//parse later.  THis is a hack that could/should be better. 
					//Though I wasn't able to get this "otherFields" parameter
					//to work for anything but the ToolTip.
					if (customProps != "")
					{
						//chart.DataBindCrossTable(dt_rawdata.Rows, series_var, x_var, y_var, "ToolTip=" + customProps, PointSortOrder.Descending);

						chart.DataBindCrossTable(dt_rawdata.Rows, series_var, x_var, y_var, "ToolTip=" + customProps, PointSortOrder.Descending);

					}
					else
					{
						chart.DataBindCrossTable(dt_rawdata.Rows, series_var, x_var, y_var, "", PointSortOrder.Descending);
					}
					
					List<string> series_names = new List<string>();
					foreach (Series s in chart.Series)
					{
						series_names.Add(s.Name);
					}

					List<string> random_colors = new List<string> { "123245", "76AD23", "E40011", "7D2138", "ABCD33", "4561AA", "9C3872", "ED4421", "8921DD"
						,"341951","ADED21","5599DB"};


					int series_counter = 0;
					//Assign the correct colors
					foreach (Series s in chart.Series)
					{
						switch (geom)
						{
							case "point":
								s.ChartType = SeriesChartType.Point;
								//s.CustomProperties = "MarkerSize=markerSize";
								break;
							case "line":
								s.ChartType = SeriesChartType.Line;
								s.BorderColor = Color.Red;
								break;
						}
						switch (x_vartype)
						{
							case "numeric":
								s.XValueType = ChartValueType.Double;
								break;
							case "date":
								s.XValueType = ChartValueType.Date;
								break;
							case "string":
								s.XValueType = ChartValueType.String;
								break;
						}
						switch (y_vartype)
						{
							case "numeric":
								s.YValueType = ChartValueType.Double;
								break;
							case "date":
								s.YValueType = ChartValueType.Date;
								break;
							case "string":
								s.YValueType = ChartValueType.String;
								break;
						}


						s.IsValueShownAsLabel = false;
						//s.LabelForeColor = System.Drawing.ColorTranslator.FromHtml("#" + random_colors[series_counter]);
						//s.MarkerColor = System.Drawing.ColorTranslator.FromHtml("#" + random_colors[series_counter]);
						//s.LabelForeColor = ColorTranslator.FromHtml( random_colors[series_counter]);
						//s.LabelBackColor = s.MarkerColor;




						int counter = 2; 
						foreach (var point in s.Points)
						{
							if (geom == "line")
							{
								//point.MarkerStyle = MarkerStyle.Diamond;
								//point.MarkerColor = Color.Lime;

							}
							else
							{
								//point.ToolTip = s.Name + ": " + counter.ToString();
								//point.MarkerSize = counter;
								if (point.ToolTip.Contains("|"))
								{

									string[] props = point.ToolTip.Split('|');

									point.MarkerSize = Convert.ToInt16(props[0]);

									if (props[0] == "12")
									{
										point.MarkerBorderColor = Color.Black;
									}
									else if (props[0] == "20")
									{
										point.MarkerBorderColor = Color.Black;

										if(props.Length>=3)
										{
											point.Label = props[3].ToString();
										}
									}

									if(props.Length>=3)
										{
										point.Url = props[2];
									}
									point.ToolTip = props[1];
									counter++;
								}
								else
								{
									//
								}
							}

						}

						s.MapAreaAttributes = "target=\"_blank\"";

						s.ToolTip = s.Name;
						series_counter++;
					}

					DataSet ds_series1 = chart.DataManipulator.ExportSeriesValues();

					//Insert empty points as need so stacking is correct
					if (series_names.Count > 0)
					{
						if (x_vartype == "numeric")
						{
							chart.DataManipulator.InsertEmptyPoints(1, IntervalType.Number, string.Join(",", series_names));
						}
						else if (x_vartype == "date")
						{
							chart.DataManipulator.InsertEmptyPoints(1, IntervalType.Months, string.Join(",", series_names));
						}
						else if (x_vartype == "string")
						{
							chart.DataManipulator.InsertEmptyPoints(1, IntervalType.Number, string.Join(",", series_names));
						}

						//DataSet ds_series2 = chart.DataManipulator.ExportSeriesValues();

					}

					chart.ImageType = System.Web.UI.DataVisualization.Charting.ChartImageType.Png;
					chart.Width = wd;
					chart.Height = ht;

					//ADD A PLACE HOLDER CHART AREA TO THE CHART
					chart.ChartAreas.Add(new ChartArea());

					if (x_vartype == "numeric")
					{
						if (xaxismin != -999) { chart.ChartAreas[0].AxisX.Minimum = xaxismin; }
						if (xaxismax != -999) { chart.ChartAreas[0].AxisX.Maximum = xaxismax; }
					}

					if (yaxismin != -999) { chart.ChartAreas[0].AxisY.Minimum = yaxismin; }
					if (yaxismax != -999) { chart.ChartAreas[0].AxisY.Maximum = yaxismax; }

					chart.ChartAreas[0].RecalculateAxesScale();

					//here not helpgful --> chart.AlignDataPointsByAxisLabel();

					chart.ChartAreas["ChartArea1"].AxisX.MajorGrid.LineColor = Color.Gainsboro;
					chart.ChartAreas["ChartArea1"].AxisY.MajorGrid.LineColor = Color.Gainsboro;
					chart.ChartAreas["ChartArea1"].AxisX.Title = xaxistitle;
					chart.ChartAreas["ChartArea1"].AxisY.Title = yaxistitle;


					chart.ChartAreas[0].AxisX.LabelStyle.Angle = -90; // Can vary from -90 to 90.
					chart.ChartAreas[0].AxisX.LabelStyle.Interval = 1;

					//if (YAxisType == "free")
					//{
					//ADD A PLACE HOLDER LEGEND TO THE CHART
					chart.Legends.Add("Default");

					chart.Legends["Default"].LegendStyle = LegendStyle.Column;  //.Table;
					chart.Legends["Default"].TableStyle = LegendTableStyle.Auto;
					chart.Legends["Default"].Docking = Docking.Right;
					//chart.Legends["Default"].MarkerSize = new Size(15, 15);


					chart.CustomizeLegend += new EventHandler<CustomizeLegendEventArgs>(utilMSCharts.chart_CustomizeLegend);

					//LegendCellColumnCollection legendcells = chart.Legends["Default"].CellColumns;

					//foreach(LegendCellColumn lcc in legendcells)
					//{
					//    lcc.SeriesSymbolSize = new System.Drawing.Size(20,20);
					//}





					//}
					//else if (YAxisType == "fixed")
					//{
					//    //chart.Legends.Clear();
					//}

					Title t = new Title();
					t.Text = charttitle + "\n(created " + System.DateTime.Now.ToShortDateString() + " " + System.DateTime.Now.ToShortTimeString() + ")";

					if (dt_rawdata.Rows.Count == 0)
					{
						t.Text += "\n** 0 records entered **";
					}

					t.Alignment = ContentAlignment.TopLeft;
					t.Font = new System.Drawing.Font("Arial", 12, GraphicsUnit.Point);

					chart.Titles.Add(t);


					return (chart);
				}
				catch (Exception ex)
				{
					string x = ex.Message;
					return null;
				}
			}
			else
			{
				return (null);
			}
		}


		public static void chart_CustomizeLegend(object sender, CustomizeLegendEventArgs e)
		{
			//foreach (LegendItem LI in e.LegendItems)
			//{
			//    LI.Cells[1].Text = LI.Cells[1].Text.Replace('%', ' ');
			//}

			foreach (LegendItem item in e.LegendItems)
			{
				item.MarkerSize = 50;
			}
		}


  

		public static System.Web.UI.DataVisualization.Charting.Chart AddVertLines(System.Web.UI.DataVisualization.Charting.Chart chart, DataTable dt_vertlines
			, string line_x_var, string line_text_var, string line_xtype)
		{

			chart = AddVertLines(chart, dt_vertlines
			, line_x_var, line_text_var, line_xtype, -999, -999, -999, -999);
			return chart;
		}

		public static System.Web.UI.DataVisualization.Charting.Chart AddVertLines(System.Web.UI.DataVisualization.Charting.Chart chart, DataTable dt_vertlines
			, string line_x_var, string line_text_var, string line_xtype, double xaxismin, double xaxismax, double yaxismin, double yaxismax) 
		{
			//Add the vertical plot lines to show the timepoints
			// Vertical PlotLines
			//Plot vertical lines for the TP for all studies in the fullstudy 

			string study1 = "";

			if (dt_vertlines != null)
			{

				for (int i = 0; i < dt_vertlines.Rows.Count; i++)
				{
					DataRow row = dt_vertlines.Rows[i];
					//string vertlabel = Convert.ToString(row.ItemArray[1]);
					string vertlabel = Convert.ToString(row[line_text_var].ToString());

					var vertLine = new VerticalLineAnnotation();

					if(i==0)
					{
						study1 = vertlabel.Split('|')[0];
					}
					string this_study = vertlabel.Split('|')[0];


					vertLine.AxisX = chart.ChartAreas[0].AxisX;
					vertLine.AxisY = chart.ChartAreas[0].AxisY;
					vertLine.LineColor = Color.Silver;
					vertLine.LineWidth = 2;
					vertLine.LineDashStyle = ChartDashStyle.Dash;
					vertLine.ClipToChartArea = "ChartArea1";
					vertLine.IsInfinitive = true;


					if (line_xtype == "date")
					{
						//DateTime vert_xvalue_date = Convert.ToDateTime(row.ItemArray[2]);
						try
						{
							DateTime vert_xvalue_date = Convert.ToDateTime(row[line_x_var]);
							vertLine.AnchorX = vert_xvalue_date.ToOADate();
						}
						catch(Exception ex)
						{
							string x = ex.Message;
						}
					}
					else if (line_xtype == "numeric")
					{
						try
						{
							//Double vert_xvalue_num = Convert.ToDouble(row.ItemArray[2]);
							Double vert_xvalue_num = Convert.ToDouble(row[line_x_var]);
							vertLine.AnchorX = vert_xvalue_num;
						}
						catch (Exception ex)
						{
							string x = ex.Message;
						}

					}
					//else if (line_xtype == "text") {
					//    string vert_xvalue_text = Convert.ToString(row.ItemArray[2]);
					//    vertLine.AnchorX = vert_xvalue_text;
					//}

					if (yaxismin == -999) yaxismin = chart.ChartAreas[0].AxisY.Minimum;
					if (yaxismax == -999) yaxismax = chart.ChartAreas[0].AxisY.Maximum;
					
					vertLine.AnchorY = yaxismin;

					chart.Annotations.Add(vertLine);

					var vertLineText = new TextAnnotation();
					vertLineText.AxisX = chart.ChartAreas[0].AxisX;
					vertLineText.AxisY = chart.ChartAreas[0].AxisY;

					



					vertLineText.AnchorOffsetX = -1;
					


					if (line_xtype == "date")
					{
						try
						{
							//DateTime vert_xvalue_date = Convert.ToDateTime(row.ItemArray[2]);
							DateTime vert_xvalue_date = Convert.ToDateTime(row[line_x_var]);
							vertLineText.AnchorX = vert_xvalue_date.ToOADate();
						}
						catch(Exception ex)
						{
							string x = ex.Message;
						}
					}
					else if (line_xtype == "numeric")
					{
						try
						{
							//Double vert_xvalue_num = Convert.ToDouble(row.ItemArray[2]);
							Double vert_xvalue_num = Convert.ToDouble(row[line_x_var]);
							vertLineText.AnchorX = vert_xvalue_num;
						}
						catch(Exception ex)
						{
							string x = ex.Message;
						}
					}

					vertlabel = vertlabel.Replace("_to_", System.Environment.NewLine + "to" + System.Environment.NewLine);
					vertlabel = vertlabel.Replace(" (", System.Environment.NewLine + "(" );
					vertlabel = vertlabel.Replace("||", System.Environment.NewLine );

					//vertLineText.Y = yaxismax - (((yaxismax - yaxismin) / 20) * (i % 2));
					vertLineText.ClipToChartArea = "ChartArea1";
					vertLineText.Text = vertlabel;
					vertLineText.Font = new System.Drawing.Font("Arial", 7);
					//vertLineText.ForeColor = Color.Black;

					if (this_study == study1)
					{
						vertLineText.Y = yaxismax - ((yaxismax - yaxismin) / 40);  // 1/40 down
						vertLineText.AnchorAlignment = ContentAlignment.TopLeft;
					}
					else
					{
						vertLineText.Y = yaxismax - ((yaxismax - yaxismin) / 5);   //  1/5 down
						vertLineText.AnchorAlignment = ContentAlignment.TopLeft;
						vertLineText.ForeColor = Color.Blue;
					}

					chart.Annotations.Add(vertLineText);

				}
			}
			 

			return chart;
		}


		public static DataTable Sort(DataTable dt, string x_var, string group_var)
		{
			DataTable dt_raw1 = dt;
			DataView dv1 = dt_raw1.AsDataView();
			dv1.Sort = x_var + " ASC, " + group_var + " ASC";

			DataTable dt_sorted = dv1.ToTable();
			return dt_sorted;
		}


	}
}