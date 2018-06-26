using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NReco.PivotData;
using NReco.PivotData.Output;
using NReco.PivotData.File;
using uwac;
using System.Drawing;
using DotNet.Highcharts;
using DotNet.Highcharts.Options;
using DotNet.Highcharts.Helpers;
using DotNet.Highcharts.Enums;
using GoogleChartsNGraphsControls;

public partial class pivotBal : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	//private ReadConfig oConfig = new ReadConfig();

	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FinMart_ConnectionString"].ConnectionString;

		//GridView1.ControlStyle.Font.Size = 70

		if (!IsPostBack)
		{
			populate_DropDownList1();
			populate_DropDownList2();
		}

		updateData();
		if (BudgetDDL.SelectedValue == "653920")
		{
			showCPTBreakdown();
		}


		//showCPTBreakdown();
		//Render_Chart();
	}

	protected void populate_DropDownList1()
	{

		SQL_utils sql = new SQL_utils("FinMart");

		DataTable dt2 = sql.DataTable_from_SQLstring("SELECT distinct BudgetName, BudgetNbr, BudgetType FROM fin.tbl_EDWData");


		//SqlCommand sqlCmd2 = new SqlCommand();
		//sqlCmd2.Connection = oConn;
		//sqlCmd2.CommandType = System.Data.CommandType.Text;

		//sqlCmd2.CommandText =
		//	"SELECT distinct BudgetName, BudgetNbr, BudgetType FROM fin.tbl_EDWData";

		//DataTable dt2 = new DataTable();
		//SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlCmd2);
		//sqlAdapter2.Fill(dt2);

		if (dt2.Rows.Count > 0)
		{

			for (int i = 0; i < dt2.Rows.Count; i++)
			{
				decimal bn = getCell(dt2, i, "BudgetNbr");
				if (bn < 100000)
				{
					dt2.Rows[i][0] = "0" + getCell(dt2, i, "BudgetNbr") + ", " + dt2.Rows[i][0].ToString();
				}
				else
				{
					dt2.Rows[i][0] = getCell(dt2, i, "BudgetNbr") + ", " + dt2.Rows[i][0].ToString();
				}

			}
			dt2.DefaultView.Sort = "BudgetType ASC, BudgetNbr ASC, BudgetName ASC";

			DataView dvOptions = new DataView(dt2);

			DataRowView newRow = dvOptions.AddNew();
			newRow["BudgetNbr"] = "";
			newRow["BudgetType"] = 0;
			newRow["BudgetName"] = "~~~~~~~~~~~~UWAC~~~~~~~~~~~~";
			newRow.EndEdit();

			newRow = dvOptions.AddNew();
			newRow["BudgetNbr"] = "";
			newRow["BudgetType"] = 1;
			newRow["BudgetName"] = "~~~~~~~~~~~~GIFT~~~~~~~~~~~~";
			newRow.EndEdit();

			newRow = dvOptions.AddNew();
			newRow["BudgetNbr"] = "";
			newRow["BudgetType"] = 2;
			newRow["BudgetName"] = "~~~~~~~~~~RESEARCH~~~~~~~~~~";
			newRow.EndEdit();

			//dvOptions.Sort = "BudgetType ASC, BudgetNbr ASC";
			dvOptions.Sort = "BudgetType ASC, BudgetNbr ASC, BudgetName ASC";
			BudgetDDL.DataSource = dvOptions;
			BudgetDDL.DataTextField = "BudgetName";
			BudgetDDL.DataValueField = "BudgetNbr";
			BudgetDDL.DataBind();

			for (int i = 0; i < BudgetDDL.Items.Count; i++)
			{

				if (BudgetDDL.Items[i].Value.Equals(""))
				{
					BudgetDDL.Items[i].Attributes.Add("disabled", "disabled");
				}

			}

			BudgetDDL.SelectedIndex = 3;
		}

	}

	protected void populate_DropDownList2()
	{
		for (int i = DateTime.Now.Year; i > 2012; i--)
		{
			YearDDL.Items.Add(i.ToString());
		}
	}

	protected DataTable GetYear(DataTable dt, List<string> rows, List<string> cols, bool showCount)
	{
		// These are all the fields that are going to be used in the cube
		List<string> keepCols = new List<string>();
		keepCols.AddRange(rows);
		keepCols.AddRange(cols);

		// Create the cube
		PivotData cube;// = new PivotData(keepCols.ToArray(), compositeFactory);

		//Create the aggregators you want (Sum, Avg, Count, Min, Max, etc.) 
		SumAggregatorFactory sumAggr = new SumAggregatorFactory("sumTotal");
		LastAggregatorFactory balAggr = new LastAggregatorFactory("cumTot");

		if (false)
		{

			// Put them into a composite
			IAggregatorFactory[] aggs = new IAggregatorFactory[2];
			aggs[0] = sumAggr;
			aggs[1] = balAggr;

			CompositeAggregatorFactory compositeFactory = new CompositeAggregatorFactory(aggs);

			// Create the cube
			cube = new PivotData(keepCols.ToArray(), compositeFactory);

		}
		else
		{

			SumAggregatorFactory sumFactory = new SumAggregatorFactory("sumTotal");

			// Create the cube
			cube = new PivotData(keepCols.ToArray(), sumFactory);
		}

		cube.ProcessData(new DataTableReader(dt));

		//Create pivot table 
		PivotTable pivotTable = new PivotTable(rows.ToArray(), cols.ToArray(), cube);

		//Define how we are going to render the pivot table - here as HTML (could be Excel, CSV, etc.)
		var htmlResult = new StringWriter();
		//var pvtHtmlWr = new PivotTableHtmlWriter(htmlResult);

		var pvtHtmlWr = new MyHtmlWriter(htmlResult);

		// Define the labels for the dimensions
		//string[] aggr_labels = new string[] { "Sum", "Count" };
		string[] aggr_labels = new string[] { "Sum", "Cumulative" };

		// Various properties 
		pvtHtmlWr.SubtotalDimensions = new string[] { "Sum", "Cumulative" };
		pvtHtmlWr.SubtotalRows = true;

		pvtHtmlWr.AllowHtml = true;
		pvtHtmlWr.SubtotalColumns = true;
		pvtHtmlWr.TotalsColumn = true;
		pvtHtmlWr.TotalsRow = true;
		pvtHtmlWr.GrandTotal = false;

		//create the actual HTML code
		pvtHtmlWr.Write(pivotTable);

		//Place the HTML code into literal control and add it to a Panel so you can place it where you wish on the page.
		Literal lit = new Literal();
		lit.Text = htmlResult.ToString();
		//panel1.Controls.Add(lit);

		//The following assumes that there is a PivotTable object named "pivotTable" that has been created
		var pvtDataTableWr = new PivotTableDataTableWriter("out");
		DataTable dtpivot = pvtDataTableWr.Write(pivotTable);




		return FormatYear(dtpivot);


	}

	protected DataTable FormatYear(DataTable dtpivot)
	{
		RenameColumns(dtpivot);
		String[] colNames = { "Year", "Month", "Endow. Rev.", "RegOn. Rev.", "Other Rev.", "Total Rev.", "Sal. Exp.", "Other Exp.", "Total Exp.", "Rev.+Exp.", "Balance" };
		AddMissingColumns(dtpivot, colNames);
		dtpivot = resort(dtpivot, "Month");
		AddTotalsColumns(dtpivot);
		AddCumulativeColumn(dtpivot, "Rev.+Exp.", "Balance");
		AddMissingRows(dtpivot, Convert.ToInt32(YearDDL.Text));
		dtpivot.SetColumnsOrder(colNames);
		addOffsets(dtpivot, GetBalances(Convert.ToDouble(BudgetDDL.SelectedValue.ToString()), dtpivot));
		fillZeros(dtpivot);

		DataTable dt2 = dtpivot.Clone();

		foreach (DataRow dr in dtpivot.Rows)
		{
			dt2.ImportRow(dr);
		}
		dt2.AcceptChanges();

		DataView dv = dt2.DefaultView;
		DataTable dt3 = dv.ToTable();

		return dt3;
	}

	protected void ShowYear(DataTable dtpivot)
	{
		showDataTable(dtpivot);
		makehighchart(dtpivot);
		Line(dtpivot, "x", "y", "group");
	}

	public static GVLineChart Line(DataTable dt, string x, string y, string group)
	{
		GVLineChart l = new GVLineChart();

		l.DataSource = dt;
		l.GviHAxis = x;
		l.GviVAxis = y;
		l.DataBind();

		return l;
	}

	public static Double[,] GetBalances(Double budgetNumber, DataTable dt)
	{
		Double[,] bal =
		{
			 {0,0,95001,95002,653920,99877,655411,653977,656876,658823,680475,632408,633741,634583,634584,631196,632920               }
			,{2013,1,9031.74,13785.66,10274870.85,26144.41,76019.52,53232.46,0,142356.69,0  ,0,0,0,0,0,0}
			,{2013,2,-14566.65,11182.24,10318539.81,37069.02,81475.54,53387.24,0,142356.69,0,0,0,0,0,0,0}
			,{2013,3,19545.6,8578.81,10455690.19,31233.25,92917.59,50866.35,0,112356.69,0   ,0,0,0,0,0,0}
			,{2013,4,15188.41,5975.39,10486585.13,30415.98,82338.23,51421.93,0,112356.69,0  ,0,0,0,0,0,0}
			,{2013,5,10828.05,3371.96,10542983.51,31899.28,71758.93,41771.22,0,112356.69,0  ,0,0,0,0,0,0}
			,{2013,6,6409.49,768.52,10715153.57,28499.82,83289.84,22451.73,0,112356.69,0    ,0,0,0,0,0,0}
			,{2013,7,655115,49022,-33422,-3697,83290,5032,0,112356.69,0                     ,0,0,0,0,0,0}
			,{2013,8,652267,47133,-10665,25574,83287,3671,0,112356.69,0                     ,0,0,0,0,0,0}
			,{2013,9,661270,44524,28982,31555,89805,3243,0,112356.69,0                      ,0,0,0,0,0,0}
			,{2013,10,647744,41262,-7438,32250,79911,4116,0,112356.69,0                     ,0,0,0,0,0,0}
			,{2013,11,645911,38653,-53682,37811,60109,8340,0,112356.69,0                    ,0,0,0,0,0,0}
			,{2013,12,579130,36044,1800,41215,71172,7356,0,112356.69,0                      ,0,0,0,0,0,0}
			,{2014,1,573322,33372,-57908,40624,67719,3442,0,112356.69,0                     ,0,0,0,0,0,0}
			,{2014,2,564638,30701,-123597,41545,63014,5140,0,112356.69,0                    ,0,0,0,0,0,0}
			,{2014,3,555683,28029,-82788,44668,76851,10086,0,112356.69,0                    ,0,0,0,0,0,0}
			,{2014,4,411059,24794,11760,44525,46243,7417,0,112356.69,0                      ,0,0,0,0,0,0}
			,{2014,5,378505,23469,7992,49734,34529,6739,0,112356.69,0                       ,0,0,0,0,0,0}
			,{2014,6,345062,22122,181632,47950,44051,18664,0,112356.69,0                    ,0,0,0,0,0,0}
			,{2014,7,255262,21332,67140,48779,37656,17153,0,112356.69,0                     ,0,0,0,0,0,0}
			,{2014,8,214257,20010,17583,49784,32065,19728,0,112356.69,0                     ,0,0,0,0,0,0}
			,{2014,9,188871,18848,120874,48652,44901,239526,0,112356.69,0                   ,0,0,0,0,0,0}
			,{2014,10,161829,17312,69997,46706,41361,235166,0,112356.69,0                   ,0,0,0,0,0,0}
			,{2014,11,140272,15337,27364,47611,42021,232825,0,112356.69,0                   ,0,0,0,0,0,0}
			,{2014,12,119026,13139,115959,51724,56408,236501,0,112356.69,0                  ,0,0,0,0,0,0}
			,{2015,1,97998,11071,43400,50362,54025,228739,20000,112356.69,0                 ,0,0,0,0,0,0}
			,{2015,2,76469,9003,-8560,46246,45526,228739,20000,112356.69,0                  ,0,0,0,0,0,0}
			,{2015,3,56455,7033,66697,36922,61398,231023,20000,112356.69,0                  ,0,0,0,0,0,0}
			,{2015,4,38055,5553,49225,24338,60091,226550,20000,112356.69,0                  ,0,0,0,0,0,0}
			,{2015,5,19666,4073,24025,8545,51006,224506,20000,112356.69,0                   ,0,0,0,0,0,0}
			,{2015,6,0,0,245817,1859,63566,224521,20100,112356.69,0                         ,0,0,0,0,0,0}
			,{2015,7,642026,50513,155557,4905,58571,174889,20081,112356.69,0                ,0,0,0,0,0,0}
			,{2015,8,608637,48922,64029,12635,56985,137923,12391,112356.69,0                ,0,0,0,0,0,0}
			,{2015,9,592565,48409,75680,17407,73355,97712,6704,112356.69,0                  ,0,0,0,0,0,0}
			,{2015,10,562001,46792,-24761,1337,71945,83940,6704,112356.69,0                 ,0,0,0,0,0,0}
			,{2015,11,531389,43534,-100932,-7523,70520,32562,7968,112356.69,0               ,0,0,0,0,0,0}
			,{2015,12,500488,41565,-51587,-13980,80893,35863,1345,104009,0                  ,0,0,0,0,0,0}
			,{2016,1,458638,39888,-71748,-11485,60881,36109,50,39727,0                      ,0,0,0,0,0,0}
			,{2016,2,340310,31369,-28869,2567,41692,30257,2408,33954,0                      ,0,0,0,0,0,0}
			,{2016,3,281553,29207,62364,5528,52086,109635,2369,27708,0                      ,0,0,0,0,0,0}
			,{2016,4,217284,27007,64598,7061,47426,87512,22369,27505,0                      ,0,0,0,0,0,0}
			,{2016,5,167528,25560,116514,5034,44984,69823,22369,27496,0                     ,0,0,26796,61253,0,0}
			,{2016,6,152635,24552,330148,-400,58353,161238,22369,25599,0                    ,0,0,20603.42,50211.93,0,0}
			,{2016,7,152562,23522,208213,4853,55755,163049,18575,25591,0                    ,0,0,14349.02,40781.32,0,0}
			,{2016,8,141076,22585,226242,13716,51510,173023,288,25582,0                     ,0,0,-20600.54,-31841.58,0,0}
			,{2016,9,137131,21994,250503,14691,65823,175176,4931,23923,0                    ,0,0,24928.68,14178.33,0,0}
			,{2016,10,133107,19383,146394,7774,62409,205179,4931,20549,0                    ,0,0,19782.41,13874.91,54733,0}
			,{2016,11,119440,18280,53209,4548,57074,193671,6902,18198,0                     ,0,0,14807.94,11240.53,54733,0}
			,{2016,12,105684,17305,155071,9158,66891,146019,6902,16245,0                    ,0,0,11340.61,10230.83,54733,0}
			,{2017,1,91621,16452,66180,12508,59293,106151,6902,15591,0                      ,86238.74,0,7491.25,10141.53,54733,0}
			,{2017,2,72916,15477,28066,10696,50934,38320,6902,13411,0                       ,64107.81,426377.03,3842.51,9854.8,54733,66180}
			,{2017,3,49708,14502,92947,9251,63025,116701,12902,12953,0                      ,36796.47,346221.66,2772.67,7004.99,54733,66180}
			,{2017,4,26197,13163,52218,3384,57916,87676,12902,12770,0                       ,9074.66,266101.79,1702.81,3888.15,54733,66180}
			,{2017,5,16542,8475,224474,7244,55355,95727,12902,319,10056                     ,52231.33,219541.55,1167.89,2565.07,54733,66180}
			,{2017,6,-7860.53,-2572,227353.35,-1652.59,66413.09,85041.50,12902.47,382.63,10056  ,50841.48,54829.51,0,-71.08,25333.29,40269.73}
			,{2017,7,684220,48989,153761,1353,61324,91948,12902,383,10056                   ,53702.49,20655.79,0,-636.82,24812.14,59724.22}
			,{ 2017,8,667753,   47981,      177477,     7075,       57938,      93063,      7140,       383,    10496,      43417.68,   -12916,         0,          -636.82,    16544.07,   57921.93}
			,{ 2017,9,652723.98,    48460.15 ,  145366.50 , 12560.37,   69996.81 ,  89228.44 ,  1377.46 ,   377.59 ,12604.57 ,  13259.38,   -109369.65,     0.00 ,      1096.92 ,   5302.76 ,   16356.44}
			,{ 2017,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			};


		int colNo = 0;
		for (int i = 0; i < bal.GetLength(1); i++ )
		{
			if (bal[0, i] == budgetNumber)
			{
				colNo = i;
			}
		}

		Double [,] returnBal = new Double [bal.GetLength(0),3];
		for (int i = 0; i < bal.GetLength(0); i++)
		{
			returnBal[i, 0] = bal[i, 0];
			returnBal[i, 1] = bal[i, 1];
			returnBal[i, 2] = bal[i, colNo];

			int mo = Convert.ToInt32(bal[i, 1]);

			decimal re = getCell(dt, mo-1, "Rev.+Exp.");

			if ( bal[i,0] == Convert.ToDouble( DateTime.Now.Year) && bal[i,1] == Convert.ToDouble(DateTime.Now.Month) )
			{
				returnBal[i, 2] = bal[i-1, colNo] + Convert.ToDouble(re) ;
			}
		}

		//AddCumulativeColumn(dtpivot, "Rev.+Exp.", "Balance");


		return returnBal;
	}

	protected void GetCPT(DataTable dt, List<string> rows, List<string> cols, bool showCount)
	{

		// These are all the fields that are going to be used in the cube
		List<string> keepCols = new List<string>();
		keepCols.AddRange(rows);
		keepCols.AddRange(cols);

		// Create the cube
		PivotData cube;// = new PivotData(keepCols.ToArray(), compositeFactory);

		//Create the aggregators you want (Sum, Avg, Count, Min, Max, etc.) 
		SumAggregatorFactory sumAggr = new SumAggregatorFactory("TotalAmount");
		CountAggregatorFactory countAggr = new CountAggregatorFactory();

		if (showCount)
		{
			// Put them into a composite
			IAggregatorFactory[] aggs = new IAggregatorFactory[2];
			aggs[0] = sumAggr;
			aggs[1] = countAggr;

			CompositeAggregatorFactory compositeFactory = new CompositeAggregatorFactory(aggs);

			// Create the cube
			cube = new PivotData(keepCols.ToArray(), compositeFactory);

		}
		else
		{
			SumAggregatorFactory sumFactory = new SumAggregatorFactory("TotalAmount");

			// Create the cube
			cube = new PivotData(keepCols.ToArray(), sumFactory);
		}



		cube.ProcessData(new DataTableReader(dt));


		//Create pivot table 
		PivotTable pivotTable = new PivotTable(rows.ToArray(), cols.ToArray(), cube);

		//Define how we are going to render the pivot table - here as HTML (could be Excel, CSV, etc.)
		var htmlResult = new StringWriter();
		//var pvtHtmlWr = new PivotTableHtmlWriter(htmlResult);

		var pvtHtmlWr = new MyHtmlWriter(htmlResult);




		// Define the labels for the dimensions
		//string[] aggr_labels = new string[] { "Sum", "Count" };
		string[] aggr_labels = new string[] { "Sum" };


		// Various properties 
		pvtHtmlWr.SubtotalDimensions = new string[] { "PaymentOther" };
		pvtHtmlWr.SubtotalRows = true;

		pvtHtmlWr.AllowHtml = true;
		pvtHtmlWr.TotalsColumn = true;
		pvtHtmlWr.TotalsRow = true;
		pvtHtmlWr.GrandTotal = true;

		//create the actual HTML code
		pvtHtmlWr.Write(pivotTable);

		//Place the HTML code into literal control and add it to a Panel so you can place it where you wish on the page.
		Literal lit = new Literal();
		lit.Text = htmlResult.ToString();
		panel2.Controls.Add(lit);
	}

	protected void showCPTBreakdown()
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_SQLstring("select a.*, CPTgroup from vtj.vwValantTJ  a join vtj.CPTgroups b ON a.CPTcode = b.cpt" +
				" where a.Yr=" + YearDDL.Text + "");
		sql.Close();

		GetCPT(dt, new List<string> { "PaymentOther", "PatientType" }, new List<string> { "YrMo" }, chkCount.Checked);
		GetCPT(dt, new List<string> { "providerID" }, new List<string> { "YrMo" }, chkCount.Checked);
	}

	public class MyHtmlWriter : NReco.PivotData.Output.PivotTableHtmlWriter
	{

		public MyHtmlWriter(TextWriter writer)
			: base(writer)
		{

		}

		protected override void OnWriteValueCell(NReco.PivotData.Output.PivotTableHtmlWriter.ValueCellContext valueContext)
		{

			try
			{
				if (valueContext.ColumnKey.DimKeys[0].ToString() == "ABA")
				{
					valueContext.AddCssClass("cssForABA");
				}
				if (valueContext.RowKey.DimKeys.Contains("UWAC TACOMA CLINIC"))
				{
					valueContext.AddCssClass("cssForTacoma");

					valueContext.FormattedValue = "<a href='www.washington.edu'>" + valueContext.FormattedValue + "</a>";
				}
				if (valueContext.RowKey.DimKeys.Contains("No Shows"))
				{
					valueContext.AddCssClass("cssForNoShow");
				}

				if (valueContext.RowKey.DimKeys.Contains("UWAC HOME"))
				{
					if (valueContext.CssClass.StartsWith("subtotal"))
					{
						valueContext.AddCssClass("cssForNoShow");
					}
					valueContext.AddCssClass("cssForTacoma");

					valueContext.FormattedValue = "<a href='www.washington.edu'>" + valueContext.FormattedValue + "</a>";
				}


			}
			catch (Exception ex) { }
		}


		protected override void OnWriteKeyCell(NReco.PivotData.Output.PivotTableHtmlWriter.KeyCellContext keyContext)
		{
			if (keyContext.Dimension == "FacilityName")
			{
				if ("UWAC HOME Total".Equals(keyContext.FormattedKey))
					keyContext.CssClass = "cssForNoShow";
			}
		}

	}

	protected void makehighchart(DataTable dt)
	{
		decimal year = getCell(dt, 0, "Year");
		int numrows;

		if (year < DateTime.Now.Year)
		{
			numrows = dt.Rows.Count;
		}
		else
		{
			numrows = DateTime.Now.Month;
		}

		int numcols = dt.Columns.Count;
		//Labelyyz.Text = numrows.ToString();
		//object[] zerocol = { 0,0,0,0,0,0,0,0,0,0,0,0 };
		bool[] invertcol = { false, false, false, false, false, false, true, true, true, false, false, false, false, false };
		decimal inv = 1;

		object[][] datapoints = new object[numcols][];
		for (int i = 0; i < numcols; i++)
		{
			datapoints[i] = new object[numrows];
		}

		string colname;

		for (int i = 0; i < numcols; i++)
		{
			colname = dt.Columns[i].ColumnName;
			if (invertcol[i])
			{
				inv = (decimal)-1;
			}
			else
			{
				inv = (decimal)1;
			}
			for (int j = 0; j < numrows; j++)
			{
				datapoints[i][j] = inv * getCell(dt, j, colname);
			}
		}

		DotNet.Highcharts.Highcharts chart = new DotNet.Highcharts.Highcharts("chart")

		 .InitChart(new Chart { Width = 900, Height = 500 })
		

			.SetXAxis(new XAxis
			{
				Categories = new[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" },

			}
			)

			.SetYAxis(new YAxis
			{
				EndOnTick = false
			})

			.SetTitle(new Title
			{
				Text = ""
			})

		   

			 .SetSeries(new[]
				{
					new Series { Name = dt.Columns[2].ColumnName, Data = new Data( datapoints[2]) , Color = Color.FromName("green"), PlotOptionsLine = new PlotOptionsLine {Visible = false, Marker = new PlotOptionsLineMarker{ Enabled = false }, DashStyle=DashStyles.Dash } },
					new Series { Name = dt.Columns[3].ColumnName, Data = new Data( datapoints[3]) , Color = Color.FromName("green"), PlotOptionsLine = new PlotOptionsLine {Visible = false, Marker = new PlotOptionsLineMarker{ Enabled = false }, DashStyle=DashStyles.ShortDash } },
					new Series { Name = dt.Columns[4].ColumnName, Data = new Data( datapoints[4]) , Color = Color.FromName("green"), PlotOptionsLine = new PlotOptionsLine {Visible = false, Marker = new PlotOptionsLineMarker{ Enabled = false }, DashStyle=DashStyles.LongDash } },
					new Series { Name = dt.Columns[5].ColumnName, Data = new Data( datapoints[5]) , Color = Color.FromName("green"), PlotOptionsLine = new PlotOptionsLine {Visible = true , Marker = new PlotOptionsLineMarker{ Enabled = false }, DashStyle=DashStyles.Solid} },
					new Series { Name = dt.Columns[6].ColumnName, Data = new Data( datapoints[6]) , Color = Color.FromName("red")  , PlotOptionsLine = new PlotOptionsLine {Visible = false, Marker = new PlotOptionsLineMarker{ Enabled = false }, DashStyle=DashStyles.Dash } },
					new Series { Name = dt.Columns[7].ColumnName, Data = new Data( datapoints[7]) , Color = Color.FromName("red")  , PlotOptionsLine = new PlotOptionsLine {Visible = false, Marker = new PlotOptionsLineMarker{ Enabled = false }, DashStyle=DashStyles.ShortDash } },
					new Series { Name = dt.Columns[8].ColumnName, Data = new Data( datapoints[8]) , Color = Color.FromName("red")  , PlotOptionsLine = new PlotOptionsLine {Visible = true , Marker = new PlotOptionsLineMarker{ Enabled = false }, DashStyle=DashStyles.Solid} },
					new Series { Name = dt.Columns[9].ColumnName, Data = new Data( datapoints[9]) , Color = Color.FromName("blue") , PlotOptionsLine = new PlotOptionsLine {Visible = false, Marker = new PlotOptionsLineMarker{ Enabled = false }, DashStyle=DashStyles.Dash } },
					new Series { Name = dt.Columns[10].ColumnName, Data = new Data(datapoints[10]), Color = Color.FromName("blue") , PlotOptionsLine = new PlotOptionsLine {Visible = true , Marker = new PlotOptionsLineMarker{ Enabled = false }, DashStyle=DashStyles.Solid} }
					//new Series { Name = dt.Columns[11].ColumnName, Data = new Data(datapoints[11]), Color = Color.FromName("blue") , PlotOptionsLine = new PlotOptionsLine {Visible = false, Marker = new PlotOptionsLineMarker{ Enabled = false }, DashStyle=DashStyles.Dash } }
				}

				);



		ltrChart.Text = chart.ToHtmlString();
	}

	protected void makehighchart()
	{


		object[] londonData = { 3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8 };
		object[] BerlinData = { 3.9, 4.2, 5.7, 8.5, 13.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8 };


		DotNet.Highcharts.Highcharts chart = new DotNet.Highcharts.Highcharts("chart")
			.SetXAxis(new XAxis
			{
				Categories = new[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }
			})

			 .SetSeries(new[]
				{
					new Series { Name = "Berlin", Data = new Data(BerlinData) },
					new Series { Name = "London", Data = new Data(londonData) } 
					//object[] londonData = { 3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8 };
				}
				);



		ltrChart.Text = chart.ToHtmlString();
	}

	protected void showDataTable(DataTable dt)
	{
		GridView gv = new GridView();
		gv.RowDataBound += new GridViewRowEventHandler(grid_RowDataBound);
		gv.DataSource = dt;
		gv.DataBind();
		gv.ControlStyle.Font.Size = 11;
		panel1.Controls.Add(gv);
	}

	protected void AddMissingColumns(DataTable dt, String[] colNames)
	{
		for (int i = 0; i < colNames.Length; i++)
		{
			if (dt.Columns.Contains(colNames[i]).Equals(false))
			{
				DataColumn colToAdd = new DataColumn(colNames[i], typeof(decimal));
				dt.Columns.Add(colToAdd);
			}
		}
	}

	public static DataTable resort(DataTable dt, string colName)
	{

		//dt.DefaultView.Sort = colName + " ASC";
		//dt = dt.DefaultView.ToTable();
		//return dt;

		//DataView dv = dt.DefaultView;
		//dv.Sort = "Month asc";
		//DataTable dt2 = dv.ToTable();

		DataTable dt2 = dt.Clone();
		dt2.Columns[colName].DataType = Type.GetType("System.Int32");

		foreach (DataRow dr in dt.Rows)
		{
			dt2.ImportRow(dr);
		}
		dt2.AcceptChanges();
		dt2.DefaultView.Sort = colName + " ASC";

		DataView dv = dt2.DefaultView;
		dv.Sort = "Month asc";
		DataTable dt3 = dv.ToTable();

		return dt3;
	}

	protected void AddMissingRows(DataTable dt, int year)
	{
		for (int i = 1; i < 13; i++)
		{
			bool found = false;
			for (int j = 0; j < dt.Rows.Count; j++)
			{
				string val = dt.Rows[j][1].ToString();
				decimal d;
				if (decimal.TryParse(val, out d)) d = (d == null) ? 0 : d;
				if (d == i)
				{
					found = true;
				}
			}
			if (found == false)
			{
				DataRow newRow = dt.NewRow();
				newRow[0] = year;
				newRow[1] = i;
				newRow[10] = 0;
				//for (int k = 2; k < 12; k++)
				//{
				//    try
				//    {
				//        newRow[k] = 0;
				//    }

				//    catch
				//    {

				//    }
				//}
				dt.Rows.Add(newRow);
			}
		}
	}

	protected void fillZeros(DataTable dt)
	{
		for (int i = 0; i < dt.Columns.Count; i++)
		{
			for (int j = 0; j < dt.Rows.Count; j++)
			{
				string val = dt.Rows[j][i].ToString();
				decimal d;
				if (decimal.TryParse(val, out d)) d = (d == null) ? 0 : d;
				dt.Rows[j][i] = d.ToString();
			}
		}
	}

	protected void RenameColumns(DataTable dt)
	{
		dt.Columns["calyr"].ColumnName = "Year";
		dt.Columns["calmo"].ColumnName = "Month";
		for (int i = 0; i < dt.Columns.Count; i++)
		{
			if (dt.Columns[i].ColumnName.Contains("endowmentrevenue"))
			{
				dt.Columns[i].ColumnName = "Endow. Rev.";
			}
			else if (dt.Columns[i].ColumnName.Contains("otherrevenue"))
			{
				dt.Columns[i].ColumnName = "Other Rev.";
			}
			else if (dt.Columns[i].ColumnName.Contains("regonlinerevenue"))
			{
				dt.Columns[i].ColumnName = "RegOn. Rev.";
			}
			else if (dt.Columns[i].ColumnName.Contains("salaryexpenses"))
			{
				dt.Columns[i].ColumnName = "Sal. Exp.";
			}
			else if (dt.Columns[i].ColumnName.Contains("otherexpenses"))
			{
				dt.Columns[i].ColumnName = "Other Exp.";
			}
			else if (dt.Columns[i].ColumnName.Contains("balance"))
			{
				dt.Columns[i].ColumnName = "New";
			}
		}
	}

	protected void AddCumulativeColumn(DataTable dt, string rowToSum, string rowToAdd)
	{
		//DataColumn colcumsum = new DataColumn(rowToAdd, typeof(decimal));
		//dt.Columns.Add(colcumsum);

		List<decimal> cumsum = new List<decimal>();
		decimal runningtotal = 0;

		for (int i = 0; i < dt.Rows.Count; i++)
		{
			string val = dt.Rows[i][rowToSum].ToString();
			decimal d;
			if (decimal.TryParse(val, out d))
				d = (d == null) ? 0 : d;

			runningtotal += d;
			cumsum.Add(runningtotal);
			dt.Rows[i][rowToAdd] = runningtotal;
		}
	}

	protected void AddBalanceShiftsColumn(DataTable dt)
	{
		DataColumn balShift = new DataColumn("Bal. Offsets", typeof(decimal));
		dt.Columns.Add(balShift);

		for (int i = 0; i < dt.Rows.Count; i++)
		{
			if (i > 0)
			{
				dt.Rows[i][balShift] = getCell(dt, i, "Balance") - getCell(dt, i - 1, "Balance") - getCell(dt, i, "Rev.+Exp.");
			}
			else
			{
				dt.Rows[i][balShift] = getCell(dt, i, "Balance") - getCell(dt, i, "Rev.+Exp.");
			}
		}
	}

	protected void AddTotalsColumns(DataTable dt)
	{
		//DataColumn colRevSum = new DataColumn("Total Rev.", typeof(decimal));
		//dt.Columns.Add(colRevSum);

		//DataColumn colExpSum = new DataColumn("Total Exp.", typeof(decimal));
		//dt.Columns.Add(colExpSum);

		//DataColumn colTotSum = new DataColumn("Rev.+Exp.", typeof(decimal));
		//dt.Columns.Add(colTotSum);

		for (int i = 0; i < dt.Rows.Count; i++)
		{
			decimal dtotal = 0;
			decimal d = 0;
			for (int j = 0; j < dt.Columns.Count; j++)
			{
				if (dt.Columns[j].ColumnName.Contains("Rev"))
				{
					string val = dt.Rows[i][j].ToString();
					if (decimal.TryParse(val, out d)) d = (d == null) ? 0 : d;
					dtotal += d;
				}
			}
			dt.Rows[i]["Total Rev."] = dtotal;
		}

		for (int i = 0; i < dt.Rows.Count; i++)
		{
			decimal dtotal = 0;
			decimal d = 0;
			for (int j = 0; j < dt.Columns.Count; j++)
			{
				if (dt.Columns[j].ColumnName.Contains("Exp"))
				{
					string val = dt.Rows[i][j].ToString();
					if (decimal.TryParse(val, out d)) d = (d == null) ? 0 : d;
					dtotal += d;
				}
			}
			dt.Rows[i]["Total Exp."] = dtotal;
		}

		for (int i = 0; i < dt.Rows.Count; i++)
		{
			decimal dtotal = 0;
			decimal d = 0;
			for (int j = 0; j < dt.Columns.Count; j++)
			{
				if (dt.Columns[j].ColumnName.Contains("Total"))
				{
					string val = dt.Rows[i][j].ToString();
					if (decimal.TryParse(val, out d)) d = (d == null) ? 0 : d;
					dtotal += d;
				}
			}
			dt.Rows[i]["Rev.+Exp."] = dtotal;
		}
	}

	protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		//Label2.Text = "";

		//if e.Row.Cells[i]
		int m = 240;

		e.Row.Cells[0].BackColor = Color.FromArgb(m, m, m);
		e.Row.Cells[1].BackColor = Color.FromArgb(m, m, m);
		e.Row.Cells[5].BackColor = Color.FromArgb(m, 255, m);
		e.Row.Cells[8].BackColor = Color.FromArgb(255, m, m);
		e.Row.Cells[10].BackColor = Color.FromArgb(m, m, 255);



		for (int i = 2; i < 12; i++)
		{
			try
			{

				decimal d = Convert.ToDecimal(e.Row.Cells[i].Text);

				e.Row.Cells[i].Text = String.Format("{0:C0}", d);
				if (d < 0)
				{
					e.Row.Cells[i].ForeColor = System.Drawing.Color.Red;
				}

			}
			catch
			{

			}
		}

		//e.Row.Cells[0].BackColor = System.Drawing.Color.LightGreen;
		//e.Row.Cells[1].BackColor = System.Drawing.Color.LightGreen;
		//e.Row.Cells[0].Width = 30;
		//e.Row.Cells[1].Width = 30;
		//e.Row.Cells[2].Width = 30;
		//e.Row.Cells[3].Width = 30;
		//e.Row.Cells[4].Width = 30;
		//e.Row.Cells[5].Width = 30;
	}

	protected static decimal getCell(DataTable dt, int row, string colName)
	{
		decimal d = 0;
		string val;
		try
		{
			val = dt.Rows[row][colName].ToString();
		}
		catch
		{
			val = "";
		}
		if (decimal.TryParse(val, out d)) d = (d == null) ? 0 : d;
		return d;
	}

	protected DataTable getOffsets()
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dtOffsets =
			sql.DataTable_from_SQLstring("select * from fin.tblEDWOffsets where BudgetNbr = "
			+ BudgetDDL.SelectedValue.ToString() + ";");

		//for (int j = 0; j < dtOffsets.Columns.Count; j++)
		//{
		//    if (dtOffsets.Columns[j].ColumnName.Equals("calmo"))
		//    {
		//        for (int i = 0; i < dtOffsets.Rows.Count; i++)
		//        {
		//            decimal d = getCell(dtOffsets, i, "calmo");
		//            d += 1;
		//            if (d == 13)
		//            {
		//                d = 1;
		//                dtOffsets.Rows[i]["calyr"] = getCell(dtOffsets, i, "calyr") + 1;
		//            }
		//            dtOffsets.Rows[i]["calmo"] = d;
		//        }
		//    }
		//}
		sql.Close();
		return dtOffsets;
	}

	protected void addOffsets(DataTable dt, DataTable dtOffsets)
	{
		decimal m1, m2, y1, y2;
		for (int i = 0; i < dt.Rows.Count; i++)
		{
			m1 = getCell(dt, i, "Month");
			y1 = getCell(dt, i, "Year");
			for (int j = 0; j < dtOffsets.Rows.Count; j++)
			{
				m2 = getCell(dtOffsets, j, "calmo");
				y2 = getCell(dtOffsets, j, "calyr");
				if (m1 >= m2 && y1 == y2)
				{
					dt.Rows[i]["Balance"] = getCell(dt, i, "Balance") + getCell(dtOffsets, j, "Amount");
				}
			}
		}
	}

	protected void addOffsets(DataTable dt, Double [,] offsets)
	{
		decimal m1, m2, y1, y2;
		for (int i = 0; i < dt.Rows.Count; i++)
		{
			m1 = getCell(dt, i, "Month");
			y1 = getCell(dt, i, "Year");
			for (int j = 0; j < offsets.GetLength(0); j++)
			{
				m2 = (decimal)offsets[j, 1];
				y2 = (decimal)offsets[j, 0];
				if (m1 == m2 && y1 == y2)
				{
					dt.Rows[i]["Balance"] = offsets[j,2];
				}
			}
		}
	}

	protected void updateData()
	{
		SQL_utils sql = new SQL_utils("FinMart");
		DataTable dt =
			sql.DataTable_from_SQLstring("select * from fin.tbl_EDWData where BudgetNbr = "
			+ BudgetDDL.SelectedValue.ToString()
			+ " and calyr = " + YearDDL.Text
			//+ " and calyr > 2014 "
			+ ";");

		sql.Close();

		ShowYear(GetYear(dt, new List<string> { "calyr", "calmo" }, new List<string> { "BudgetNbr", "Category" }, chkCount.Checked));
	}

}

public static class DataTableExtensions
{
	public static void SetColumnsOrder(this DataTable table, params String[] columnNames)
	{
		int columnIndex = 0;
		foreach (var columnName in columnNames)
		{
			try
			{
				table.Columns[columnName].SetOrdinal(columnIndex);
				columnIndex++;
			}
			catch
			{

			}
		}
	}
}

public class MyHtmlWriter : NReco.PivotData.Output.PivotTableHtmlWriter
{
	public MyHtmlWriter(TextWriter writer)
		: base(writer)
	{

	}

	protected override void OnWriteValueCell(NReco.PivotData.Output.PivotTableHtmlWriter.ValueCellContext valueContext)
	{

		try
		{
			if (valueContext.ColumnKey.DimKeys[0].ToString() == "ABA")
			{
				valueContext.AddCssClass("cssForABA");
			}
			if (valueContext.RowKey.DimKeys.Contains("UWAC TACOMA CLINIC"))
			{
				valueContext.AddCssClass("cssForTacoma");

				valueContext.FormattedValue = "<a href='www.washington.edu'>" + valueContext.FormattedValue + "</a>";
			}
			if (valueContext.RowKey.DimKeys.Contains("No Shows"))
			{
				valueContext.AddCssClass("cssForNoShow");
			}

			if (valueContext.RowKey.DimKeys.Contains("UWAC HOME"))
			{
				if (valueContext.CssClass.StartsWith("subtotal"))
				{
					valueContext.AddCssClass("cssForNoShow");
				}
				valueContext.AddCssClass("cssForTacoma");

				valueContext.FormattedValue = "<a href='www.washington.edu'>" + valueContext.FormattedValue + "</a>";
			}


		}
		catch (Exception ex) { }
	}


	protected override void OnWriteKeyCell(NReco.PivotData.Output.PivotTableHtmlWriter.KeyCellContext keyContext)
	{
		if (keyContext.Dimension == "FacilityName")
		{
			if ("UWAC HOME Total".Equals(keyContext.FormattedKey))
				keyContext.CssClass = "cssForNoShow";
		}
	}

}

public class LastAggregator : IAggregator
{
	decimal last = 0; // default value for empty aggregator
	uint count = 0; // default value for empty aggregator
	string field;

	public LastAggregator(string f)
	{
		field = f;
	}
	public LastAggregator(string f, object state)
		: this(f)
	{
		// this constructor is used in LastAggregatorFactory.Create(object)
		var stateArr = state as object[];
		if (stateArr == null || stateArr.Length != 2)
			throw new InvalidOperationException("invalid state");
		count = Convert.ToUInt32(stateArr[0]);
		last = Convert.ToDecimal(stateArr[1]);
	}
	public void Push(object r, Func<object, string, object> getValue)
	{
		var v = ConvertHelper.ConvertToDecimal(getValue(r, field), Decimal.MinValue);
		if (v != Decimal.MinValue)
		{
			// accumulate new value
			last = v;
			count++;
		}
	}
	public object Value { get { return last; } }
	public uint Count { get { return count; } }
	public void Merge(IAggregator aggr)
	{
		var lastAggr = aggr as LastAggregator;
		if (lastAggr == null)
			throw new ArgumentException("aggr");
		// combine accumulated values from 2 aggregators
		count += lastAggr.count;
		last += lastAggr.last;
	}
	public object GetState()
	{
		// aggregator state: compact serializable structure
		return new object[] { count, last };
	}
}

public class LastAggregatorFactory : IAggregatorFactory
{
	public string Field { get; private set; }

	public LastAggregatorFactory(string field)
	{
		Field = field;
	}
	public IAggregator Create()
	{
		return new LastAggregator(Field);
	}
	public IAggregator Create(object state)
	{
		return new LastAggregator(Field, state);
	}
	//public override bool Equals(object obj) {
	//    var aggrFactory = obj as LastAggregatorFactory;
	//    if (aggrFactory==null)
	//        return false;
	//    return aggrFactory.fld==fld;
	//}
	public override string ToString()
	{
		return String.Format("Last of {0}", Field);
	}


}

