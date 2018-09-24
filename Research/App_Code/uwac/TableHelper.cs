using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Drawing;
using uwac;


/// <summary>
/// Summary description for TableHelpers
/// </summary>
public class TableHelper
{
	public TableHelper()
	{
		//
		// TODO: Add constructor logic here
		//
	}

	#region Tables

	public static Table VerticalTable(List<Table> tables)
	{
		Table t = new Table();

		foreach (Table myt in tables)
		{
			TableRow r = new TableRow();
			TableCell c = new TableCell();
			c.Controls.Add(myt);
			r.Cells.Add(c);
			t.Rows.Add(r);
		}

		return t;
	}

	public static Table VerticalTable(List<DxCharts.Mychart> charts, int W, int H, double pctW, double pctH, bool hideEmptyCharts)
	{
		Table t = new Table();

		int numrow = charts.Count ;
		int counter = 0;

		for (int i = 0; i < numrow; i++)
		{
			TableRow r = new TableRow();
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
			
			t.Rows.Add(r);
		}

		return t;
	}



	public static Table HorizontalTable(List<Table> tables)
	{
		Table t = new Table();
		TableRow r = new TableRow();

		foreach (Table myt in tables)
		{
			TableCell c = new TableCell();
			c.Controls.Add(myt);
			r.Cells.Add(c);
		}
		t.Rows.Add(r);

		return t;
	}

	public static Table HorizontalTable(List<DxCharts.Mychart> charts, double pct, int numtablecols)
	{
		return HorizontalTable(charts, 300, 300, pct, pct, numtablecols);

	}

	//	public Table HorizontalTable(List<WebChartControl> charts, int W, int H, double pct)
	//{
	//	Table t = new Table();
	//	TableRow r = new TableRow();

	//	foreach (WebChartControl chart in charts)
	//	{
	//		TableCell c = new TableCell();
	//		PlaceChartInCell(chart, c, W, H, pct, pct);
	//		r.Cells.Add(c);
	//	}
	//	t.Rows.Add(r);

	//	return t;
	//}
	public static Table HorizontalTable(List<DxCharts.Mychart> charts, int W, int H, double pctW, double pctH, int maxCol)
	{
		return HorizontalTable(charts, W, H, pctW, pctH, maxCol, false);
	}


	public static Table HorizontalTable(List<DxCharts.Mychart> charts, int W, int H, double pctW, double pctH, int maxCol, bool hideEmptyCharts)
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

					if ( charts[counter].chart == null & hideEmptyCharts)
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


	public static Table HorizontalTable(Literal literal)
	{
		List<Literal> literals = new List<Literal> { literal };
		return HorizontalTable(literals);
	}


	public static Table HorizontalTable(List<Literal> literals)
	{
		Table t = new Table();
		//t.CellPadding = 10;
		//t.CellSpacing = 10;
		//t.BorderStyle = BorderStyle.Solid;
		//t.BorderColor = Color.Blue;
		//t.BorderWidth = 1;
		int numcol = literals.Count;

		for (int i = 0; i < 1; i++) //just one row
		{
			TableRow r = new TableRow();
			for (int j = 0; j < numcol; j++)
			{
				TableCell c = new TableCell();
				c.Controls.Add(literals[j]);
				c.Attributes.Add("class", "pivotCell");
				r.Cells.Add(c);
			}
			t.Rows.Add(r);
		}


		return t;
	}




	public static Table UpperDiagTable(List<DxCharts.Mychart> charts, int W, int H, double pct, string title)
	{
		Table t = new Table();

		int chartnum = 0;
		int ncols = NCols(charts.Count);

		TableRow headerrow = CreateHeaderRow(title, ncols);
		t.Rows.Add(headerrow);


		for (int rows = 0; rows < ncols; rows++)
		{
			TableRow r = new TableRow();
			for (int cols = 0; cols < ncols; cols++)
			{
				TableCell c = new TableCell();
				if (cols > rows)
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


	public static Table UpperDiagTable(List<DxCharts.Mychart> charts, double pct, List<DxCharts.Mychart> chartsForDiag, string title, int chartW, int chartH)
	{
		Table t = new Table();

		int chartnum = 0;
		int ncols = NCols(charts.Count);

		TableRow headerrow = CreateHeaderRow(title, ncols);
		t.Rows.Add(headerrow);


		for (int rows = 0; rows < ncols; rows++)
		{
			TableRow r = new TableRow();
			for (int cols = 0; cols < ncols; cols++)
			{
				TableCell c = new TableCell();
				if (rows == cols)
				{
					PlaceChartInCell(chartsForDiag[rows], c, chartW, chartH, pct);
				}
				else if (cols > rows)
				{
					PlaceChartInCell(charts[chartnum], c, chartW, chartH, pct);
					chartnum++;
				}
				r.Cells.Add(c);
			}
			t.Rows.Add(r);
		}
		return t;
	}

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



	#region PlaceChartInCell

	public static void PlaceChartInCell(DxCharts.Mychart chart, TableCell container, string empty)
	{
		Label lbl = new Label();
		lbl.Text = empty;
		container.Controls.Add(lbl);
	}

	public static void PlaceChartInCell(DxCharts.Mychart chart, TableCell container, int chartW, int chartH, double pct)
	{
		int w = (int)(chartW * pct);
		int h = (int)(chartH * pct);
		PlaceChartInCell(chart, container, w, h);
	}
	public void PlaceChartInCell(DxCharts.Mychart chart, TableCell container, int chartW, int chartH, double pct_w, double pct_h)
	{
		int w = (int)(chartW * pct_w);
		int h = (int)(chartH * pct_h);
		PlaceChartInCell(chart, container, w, h);
	}


	public static void PlaceChartInCell(DxCharts.Mychart mychart, TableCell container, int width, int height)
	{
		if (mychart.chart != null)
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
			lbl.Text = (String.IsNullOrEmpty(mychart._emptymsg)) ? "empty chart" : mychart._emptymsg.Replace(Environment.NewLine, "<br/>");
			container.Controls.Add(lbl);
		}
	}

	#endregion


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


	#endregion

}