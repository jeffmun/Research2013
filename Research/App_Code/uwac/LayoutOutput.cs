using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using uwac;

namespace uwac
{
	/// <summary>
	/// Summary description for ChartOutput
	/// </summary>
	public static class LayoutOutput
	{
		//public ChartOutput()
		//{
		//	//
		//	// TODO: Add constructor logic here
		//	//
		//}

		public static Table LayoutBatch(DxChartBatch batch)
		{
			Table t = new Table();
			if (batch.layout == DxLayout.Horizontal) t = HorizontalTable(batch);
			else if (batch.layout == DxLayout.Vertical) t = VerticalTable(batch);
			else if (batch.layout == DxLayout.Upper) return UpperTable(batch);
			else if (batch.layout == DxLayout.UpperDiag) return UpperDiagTable(batch);

			return t;
		}

		public static Table LayoutBatch(DxChartBatch batch, string obj)
		{
			if (obj == "datatable")
			{
				Table t = new Table();
				if (batch.layout == DxLayout.Horizontal) t = HorizontalTable(batch, obj);
				//else if (batch.chartlayout == DxChartLayout.Vertical) t = VerticalTable(batch);
				//else if (batch.chartlayout == DxChartLayout.Upper) return UpperTable(batch);
				//else if (batch.chartlayout == DxChartLayout.UpperDiag) return UpperDiagTable(batch);

				return t;
			}
			else return null;
		}


		public static Table LayoutBatch(DxTableBatch batch)
		{
			Table t = new Table();
			if (batch.layout == DxLayout.Horizontal) t = HorizontalTable(batch);
			//else if (batch.layout == DxLayout.Vertical) t = VerticalTable(batch);
			//else if (batch.layout == DxLayout.Upper) return UpperTable(batch);
			//else if (batch.layout == DxLayout.UpperDiag) return UpperDiagTable(batch);

			return t;
		}


		#region UpperDiag
		public static Table UpperDiagTable(List<DxChart> charts, int W, int H, double pct, string title, List<string> vars)
		{
			Table t = new Table();

			int chartnum = 0;
			int ncols = NCols(charts.Count);

			//TableRow headerrow = CreateHeaderRow(title, ncols);
			//t.Rows.Add(headerrow);
			t.Rows.Add(CreateHeaderRow(vars, ncols));


			for (int rows = 0; rows < ncols; rows++)
			{
				TableRow r = new TableRow();
				//add the first column

				TableCell c0 = new TableCell();
				PlaceTextInCell(c0, vars[rows], true, 12, Color.Gray);
				r.Cells.Add(c0);


				for (int cols = 0; cols < ncols; cols++)  
				{
					TableCell c = new TableCell();
					if(cols==rows)
					{
						//if(hasAlternateDiag)
						//{
						//	PlaceChartInCell(charts[chartnum], c, W, H, pct);
						//	chartnum++;
						//}
					}
					else if (cols > rows)
					{
						PlaceChartInCell(charts[chartnum], c, W, H, pct);
						chartnum++;
					}
					r.Cells.Add(c);
				}
				t.Rows.Add(r);
			}

			return t;
		}

		public static Table UpperDiagTable(List<DxChart> charts, List<DxChart> altcharts, int W, int H, double pct, double altpct, string title, List<string> vars)
		{
			Table t = new Table();

			int chartnum = 0;
			int ncols = NCols(charts.Count);

			//TableRow headerrow = CreateHeaderRow(title, ncols);
			//t.Rows.Add(headerrow);
			t.Rows.Add(CreateHeaderRow(vars, ncols));


			for (int rows = 0; rows < ncols; rows++)
			{
				TableRow r = new TableRow();
				//add the first column

				TableCell c0 = new TableCell();
				PlaceTextInCell(c0, vars[rows], true, 12, Color.Gray);
				r.Cells.Add(c0);


				for (int cols = 0; cols < ncols; cols++)
				{
					TableCell c = new TableCell();
					if (cols == rows)
					{
						c.HorizontalAlign = HorizontalAlign.Center;
						PlaceChartInCell(altcharts[rows], c, W, H, altpct);
					}
					else if (cols > rows)
					{
						PlaceChartInCell(charts[chartnum], c, W, H, pct);
						chartnum++;
					}
					r.Cells.Add(c);
				}
				t.Rows.Add(r);
			}

			return t;
		}


		public static Table UpperTable(DxChartBatch batch)
		{
			Table t = new Table();

			int counter = 0;
			int ncols = NCols(batch.charts.Count);

			//TableRow headerrow = CreateHeaderRow(title, ncols);
			//t.Rows.Add(headerrow);
			t.Rows.Add(CreateHeaderRow(batch.vars, ncols));


			for (int rows = 0; rows < ncols; rows++)
			{
				TableRow r = new TableRow();
				//add the first column

				TableCell c0 = new TableCell();
				PlaceTextInCell(c0, batch.vars[rows], true, 12, Color.Gray);
				r.Cells.Add(c0);


				for (int cols = 0; cols < ncols; cols++)
				{
					TableCell c = new TableCell();
					if (cols == rows)
					{
						//if(hasAlternateDiag)
						//{
						//	PlaceChartInCell(charts[chartnum], c, W, H, pct);
						//	chartnum++;
						//}
					}
					else if (cols > rows)
					{
						PlaceChartInCell(batch.charts[counter], c, batch.charts[counter].W, batch.charts[counter].H, 1.0);
						counter++;
					}
					r.Cells.Add(c);
				}
				t.Rows.Add(r);
			}

			return t;
		}

		public static Table UpperDiagTable(DxChartBatch batch)
		{
			Table t = new Table();

			int counter = 0;
			int ncols = batch.maxCol;//NCols(batch.charts.Count);

			//TableRow headerrow = CreateHeaderRow(title, ncols);
			//t.Rows.Add(headerrow);
			t.Rows.Add(CreateHeaderRow(batch.vars, ncols));


			for (int rows = 0; rows < ncols; rows++)
			{
				TableRow r = new TableRow();
				//add the first column

				TableCell c0 = new TableCell();
				PlaceTextInCell(c0, batch.vars[rows], true, 12, Color.Gray);
				r.Cells.Add(c0);


				for (int cols = 0; cols < ncols; cols++)
				{
					TableCell c = new TableCell();
					if (cols >= rows)
					{

						PlaceChartInCell(batch.charts[counter], c, batch.charts[counter].W, batch.charts[counter].H, 1.0);
						counter++;
					}
					r.Cells.Add(c);
				}
				t.Rows.Add(r);
			}

			return t;
		}



		#endregion

		#region Horizontal

		public static Table HorizontalTable(List<DxChart> charts, int W, int H, int maxCol)
		{
			return HorizontalTable(charts, W, H, 1.0, 1.0, maxCol, false);
		}

		public static Table HorizontalTable(List<DxChart> charts, int W, int H, double pctW, double pctH, int maxCol)
		{
			return HorizontalTable(charts, W, H, pctW, pctH, maxCol, false);
		}

		public static Table HorizontalTable(List<DxChart> charts, int W, int H, double pctW, double pctH, int maxCol, bool hideEmptyCharts)
		{
			Table t = new Table();

			int numrow = (int)(charts.Count / maxCol) + 1;
			int counter = 0;

			for (int i = 0; i < numrow; i++)
			{
				TableRow r = new TableRow();
				for (int j = 0; j < maxCol; j++)
				{
					TableCell c = new TableCell();
					bool addcell = true;
					if (counter < charts.Count)
					{
						int newW = Convert.ToInt32(W * pctW);
						int newH = Convert.ToInt32(H * pctH);

						if (charts[counter].chart == null & hideEmptyCharts)
						{
							//do nothing, the missing chart and emptymsg is not displayed
							addcell = false;
						}
						else
						{
							PlaceChartInCell(charts[counter], c, newW, newH);
						}
						counter++;
					}
					if (addcell) r.Cells.Add(c);
				}
				t.Rows.Add(r);
			}

			return t;
		}




		public static Table HorizontalTable(DxChartBatch batch)
		{

			return HorizontalTable(batch, "chart");
		}

		public static Table HorizontalTable(DxChartBatch batch, string obj)
		{
			Table t = new Table();

			int numrow = (int)(batch.charts.Count / batch.maxCol) + 1;
			int counter = 0;

			for (int i = 0; i < numrow; i++)
			{
				TableRow r = new TableRow();
				for (int j = 0; j < batch.maxCol; j++)
				{
					TableCell c = new TableCell();
					bool addcell = true;
					if (counter < batch.charts.Count)
					{
						int newW = Convert.ToInt32(batch.charts[counter].W);
						int newH = Convert.ToInt32(batch.charts[counter].H);

						DxChart thisdxchart = batch.charts[counter];
						if (thisdxchart.chart == null  | thisdxchart.chart.Series.Count == 0)
						{
							addcell = !batch.batchsettings.hideEmptyCharts;
							//if we want to hideEmptyCharts (=T, that is Not Show It) then we don't want to add the cell.
							//if we don't want to hideEmptyCharts (=F, that is Show It) then we do want to add the cell.
							string thisdxchart_info = String.Format("# series={0}   # vars={1}   emptymsg={2} "
								, thisdxchart.chart.Series.Count, batch.batchsettings.numvars.Count, thisdxchart.emptymsg);

							PlaceTextInCell(c, thisdxchart_info);
						}
						else
						{
							if (obj == "chart")
							{
								PlaceChartInCell(batch.charts[counter], c, newW, newH);
							}
							else if (obj == "datatable")
							{
								PlaceTableInCell(batch.datatables[counter], c );
							}
							counter++;
						}
					}
					if (addcell) r.Cells.Add(c);
				}
				t.Rows.Add(r);
			}

			return t;
		}




		public static Table HorizontalTable(List<Panel> charts, int maxCol)
		{
			Table t = new Table();

			int numrow = (int)(charts.Count / maxCol) + 1;
			int counter = 0;

			for (int i = 0; i < numrow; i++)
			{
				TableRow r = new TableRow();
				for (int j = 0; j < maxCol; j++)
				{
					TableCell c = new TableCell();
					c.VerticalAlign = VerticalAlign.Top;
					c.Style.Add("padding", "5px");
					bool addcell = true;
					if (counter < charts.Count)
					{
						if (charts[counter] == null )
						{
							//do nothing, the missing chart and emptymsg is not displayed
							addcell = false;
						}
						else
						{
							c.Controls.Add(charts[counter]);
						}
						counter++;
					}
					if (addcell) r.Cells.Add(c);
				}
				t.Rows.Add(r);
			}

			return t;
		}




		public static Table HorizontalTable(DxTableBatch batch)
		{

			return HorizontalTable(batch, "string");
		}

		public static Table HorizontalTable(DxTableBatch batch, string obj)
		{
			Table t = new Table();

			int numrow = (int)(batch.tables.Count / batch.maxCol) + 1;
			int counter = 0;

			for (int i = 0; i < numrow; i++)
			{
				TableRow r = new TableRow();
				for (int j = 0; j < batch.maxCol; j++)
				{
					TableCell c = new TableCell();
					bool addcell = true;
					if (counter < batch.tables.Count)
					{


						DxTable thisdxtable = batch.tables[counter];
						string output = thisdxtable.output;

						if (thisdxtable.output == "" | thisdxtable.output== null)

						//if (String.IsNullOrEmpty(thisdxtable.table))
						{
							string thisdxtable_info = String.Format("emptymsg={0} "
								, thisdxtable.emptymsg);

							PlaceTextInCell(c, thisdxtable_info);
						}
						else
						{
							if (obj == "string")
							{
								PlaceStringInCell(thisdxtable.output, c);
							}
							counter++;
						}
					
						if (addcell) r.Cells.Add(c);
					}
					
				}
				t.Rows.Add(r);
			}

			return t;
		}


		#endregion


		#region Vertical

		public static Table VerticalTable(List<DxChart> charts, int W, int H, int maxRow)
		{
			return VerticalTable(charts, W, H, 1.0, 1.0, maxRow, false);
		}

		public static Table VerticalTable(List<DxChart> charts, int W, int H, double pctW, double pctH, int maxRow)
		{
			return VerticalTable(charts, W, H, pctW, pctH, maxRow, false);
		}

		public static Table VerticalTable(List<DxChart> charts, int W, int H, double pctW, double pctH, int maxRow, bool hideEmptyCharts)
		{
			Table t = new Table();

			double dbl_numcol = charts.Count / (maxRow * 1.0);
			int numcol = Convert.ToInt32(Math.Ceiling(dbl_numcol));

			int counter = 0;

			for (int i = 0; i < maxRow; i++)
			{
				TableRow r = new TableRow();
				for (int j = 0; j < numcol; j++)
				{
					TableCell c = new TableCell();
					bool addcell = true;
					int idx = i + (j * maxRow);
					if (idx < charts.Count)
					{
						int newW = Convert.ToInt32(W * pctW);
						int newH = Convert.ToInt32(H * pctH);

						if (charts[idx].chart == null & hideEmptyCharts)
						{
							//do nothing, the missing chart and emptymsg is not displayed
							addcell = false;
						}
						else
						{
							PlaceChartInCell(charts[idx], c, newW, newH);
						}
						counter++;
					}
					if (addcell) r.Cells.Add(c);
				}
				t.Rows.Add(r);
			}

			return t;
		}


		public static Table VerticalTable(DxChartBatch batch)
		{
			Table t = new Table();

			double dbl_numcol = batch.charts.Count / (batch.maxRow * 1.0);
			if (dbl_numcol > 0)
			{
				int numcol = Convert.ToInt32(Math.Ceiling(dbl_numcol));

				int counter = 0;

				for (int i = 0; i < batch.maxRow; i++)
				{
					TableRow r = new TableRow();
					for (int j = 0; j < numcol; j++)
					{
						TableCell c = new TableCell();
						bool addcell = true;
						int idx = i + (j * batch.maxRow);
						if (idx < batch.charts.Count)
						{
							int newW = Convert.ToInt32(batch.charts[idx].W);
							int newH = Convert.ToInt32(batch.charts[idx].H);

							if (batch.charts[idx].chart == null | batch.charts[idx].chart.Series.Count == 0)
							{
								//do nothing, the missing chart and emptymsg is not displayed
								addcell = false;
							}
							else
							{
								PlaceChartInCell(batch.charts[idx], c, newW, newH);
							}
							counter++;
						}
						if (addcell) r.Cells.Add(c);
					}
					t.Rows.Add(r);
				}

				return t;
			}
			else return null;
		}




		public static Table VerticalTable(List<Panel> charts, int maxCol)
		{
			Table t = new Table();

			int numrow = (int)(charts.Count / maxCol) + 1;
			int counter = 0;

			for (int i = 0; i < numrow; i++)
			{
				TableRow r = new TableRow();
				for (int j = 0; j < maxCol; j++)
				{
					TableCell c = new TableCell();
					c.VerticalAlign = VerticalAlign.Top;
					c.Style.Add("padding", "5px");
					bool addcell = true;
					if (counter < charts.Count)
					{
						if (charts[counter] == null)
						{
							//do nothing, the missing chart and emptymsg is not displayed
							addcell = false;
						}
						else
						{
							c.Controls.Add(charts[counter]);
						}
						counter++;
					}
					if (addcell) r.Cells.Add(c);
				}
				t.Rows.Add(r);
			}

			return t;
		}


		#endregion
 




		public static TableRow CreateHeaderRow(string title, int ncols)
		{
			TableRow headerrow = new TableRow();
			TableCell headercell = new TableCell();
			Label lblheader = new Label();
			lblheader.Text = title;
			lblheader.Font.Bold = true;
			headercell.ColumnSpan = ncols;
			headercell.Controls.Add(lblheader);
			return headerrow;
		}

		public static TableRow CreateHeaderRow(List<string> headers, int ncols)
		{
			TableRow headerrow = new TableRow();
			for (int cols = 0; cols < ncols + 1 ; cols++)
			{
				TableCell headercell = new TableCell();
				if (cols>0) PlaceTextInCell(headercell, headers[cols-1], true, 12, Color.Gray);
				headercell.HorizontalAlign = HorizontalAlign.Center;
				headerrow.Cells.Add(headercell);
			}

			return headerrow;
		}




		public static void PlaceTextInCell(TableCell container, string text)
		{
			PlaceTextInCell(container, text, false, 12, Color.Black);
		}
		public static void PlaceTextInCell(TableCell container, string text, bool isbold, int size, Color color)
		{
			Label lbl = new Label();
			lbl.Font.Bold = isbold;
			lbl.Font.Size = size;
			lbl.Text = text;
			lbl.ForeColor = color;
			container.Controls.Add(lbl);
		}

		#region PlaceTableInCell

		public static void PlaceTableInCell(DataTable dt, TableCell container)
		{
			ASPxGridView gv = new ASPxGridView();
			gv.AutoGenerateColumns = true;
			gv.SettingsPager.PageSize = 50;
			gv.DataSource = dt;
			gv.DataBind();

			container.Controls.Add(gv);
		}


		public static void PlaceStringInCell(string s, TableCell container)
		{
			Literal lit = new Literal();
			lit.Text = s;
			container.Controls.Add(lit);
		}

		#endregion


		#region PlaceChartInCell

		public static void PlaceChartInCell(DxChart chart, TableCell container, string empty)
		{
			Label lbl = new Label();
			lbl.Text = empty;
			container.Controls.Add(lbl);
		}

		public static void PlaceChartInCell(DxChart chart, TableCell container, int chartW, int chartH, double pct)
		{
			int w = (int)(chartW * pct);
			int h = (int)(chartH * pct);
			PlaceChartInCell(chart, container, w, h);
		}
		public static void PlaceChartInCell(DxChart chart, TableCell container, int chartW, int chartH, double pct_w, double pct_h)
		{
			int w = (int)(chartW * pct_w);
			int h = (int)(chartH * pct_h);
			PlaceChartInCell(chart, container, w, h);
		}


		public static void PlaceChartInCell(DxChart mychart, TableCell container, int width, int height)
		{
			if (mychart.chart != null)
			{
				if (!mychart.isempty)
				{
					mychart.chart.Width = width;
					mychart.chart.Height = height;

					string chartname = String.Format("chart{0}", Guid.NewGuid()); //System.DateTime.Now.Ticks);
					mychart.chart.ClientInstanceName = chartname;
					mychart.chart.ID = chartname;

					//Render the Checkbox here for when selecting specific charts to save.
					//container.Controls.Add(mychart.chk);
					container.Controls.Add(mychart.chart);
				}
				else
				{
					Label lbl = new Label();
					lbl.Text = (String.IsNullOrEmpty(mychart.emptymsg)) ? "empty chart" : mychart.emptymsg.Replace(Environment.NewLine, "<br/>");
					container.Controls.Add(lbl);
				}
			}
		}

		#endregion


		public static int GetDiagIndex(int r, int c, int n)
		{
			//k = (n * (n - 1) / 2) - (n - r) * ((n - r) - 1) / 2 + c - r - 1
			int idx = (n * (n - 1) / 2) - (n - r) * ((n - r) - 1) / 2 + c - r - 1;
			return idx;

		}


		//Function that returns the number of cols/rows for a square table of all pairs
		public static int NCols(int x)
		{
			int y;

			if (x == 1) y = 2;
			else if (x == 3) y = 3;
			else if (x == 6) y = 4;
			else if (x == 10) y = 5;
			else if (x == 15) y = 6;
			else if (x == 21) y = 7;
			else if (x == 28) y = 8;
			else if (x == 36) y = 9;
			else if (x == 45) y = 10;
			else if (x == 55) y = 11;
			else if (x == 66) y = 12;
			else if (x == 78) y = 13;
			else if (x == 91) y = 14;
			else if (x == 105) y = 15;
			else if (x == 120) y = 16;
			else if (x == 136) y = 17;
			else if (x == 153) y = 18;
			else if (x == 171) y = 19;
			else if (x == 190) y = 20;
			else y = 0;
			return y;
		}

		public static IEnumerable<A> Slice<A>(int from, int to, IEnumerable<A> e)
		{
			return e.Take(to).Skip(from);
		}
	}


	public enum DxLayout
	{
		Horizontal = 1,
		Vertical = 2,
		Upper = 3,
		UpperDiag = 4,
		Lower = 5,
		LowerDiag = 6
	}

}