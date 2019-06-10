using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using DotNet.Highcharts;
//using DotNet.Highcharts.Options;
//using DotNet.Highcharts.Helpers;
//using DotNet.Highcharts.Enums;
using uwac;
using DevExpress.XtraCharts.Web;
using DevExpress.XtraCharts;

public partial class AC_Bal4charts : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{

		if (!Page.IsPostBack)
		{

		}


		MakeDxChart();
	}


	protected void MakeDxChart()
	{
		SQL_utils sql = new SQL_utils("FinMart");

		string importDate = sql.StringScalar_from_SQLstring("select convert(varchar,min(imported_from_EDW),0)  from fin.tblEDWData ");

		lblImportDate.Text = String.Format("Imported on {0}", importDate);

		DataTable dt_bnums = sql.DataTable_from_SQLstring(

			"select 'a' orderer, budgetNumber,  " +
			"[name] budgetName from fin.tblEDWData " +
			"where bienniumYear >= 2013 and budgetNumber in " +
			"(095001, 095002, 099877, 653920, 655411) " +
			"group by budgetNumber,  [name] " +
			"union select 'b' orderer, budgetNumber,  " +
			"[name] budgetName from fin.tblEDWData " +
			"where bienniumYear >= 2013 and budgetNumber in " +
			"(640259, 653977, 656876, 658823, 680475)" +
			"group by budgetNumber,  [name] " +
			"union select 'c' orderer, 'Core Clinic' as budgetNumber,  " +
			"'Sum' as budgetName " +
			"union select 'd' orderer, 'Gifts' as budgetNumber,  " +
			"'Sum' as budgetName order by orderer" );


		if (dt_bnums.Columns[0].ColumnName == "err")
		{
			DataRow row = dt_bnums.Rows[0];

			lblN.Text = row["err"].ToString();

			lblN.Text += sql.Errormsg;
		}

		else
		{

			List<DxChartOrder> orders = new List<DxChartOrder>();

			foreach (DataRow row in dt_bnums.Rows)
			{
				string bname = row["budgetName"].ToString();
				string bnum = row["budgetNumber"].ToString();

				string mo = DateTime.Now.Month.ToString();
				if (mo.Length < 2) { mo = "0" + mo; }
				string yrmo_now = DateTime.Now.Year.ToString() + "_" + mo;

				string code = String.Format(
					"select * from(select '1' id, budgetNumber, [name] budgetName, bienniumYear, " +
					"yrmo, RevenueAmount, REV_Endowment, REV_Other, -ExpenseAmount as ExpenseAmount, " +
					"-EXP_SALARY as EXP_SALARY, -EXP_Non_SALARY as EXP_Non_SALARY, balance from fin.tblEDWData " +
					"where bienniumYear >= 2013 and budgetNumber in " +
					"(095001, 095002, 099877, 653920, 655411, 640259, 653977, 656876, 658823, 680475) " +
					"and yrmo <= (select substring(replace(CONVERT(VARCHAR, GETDATE(), 21), '-', '_'), 1, 7)) " +
					"union select '1' id, 'Core Clinic' as budgetNumber, 'Sum' as budgetName, bienniumYear, " +
					"yrmo, sum(RevenueAmount) as RevenueAmount, sum(REV_Endowment) as REV_Endowment, " +
					"sum(REV_Other) as REV_Other, sum(-ExpenseAmount) as ExpenseAmount, sum(-EXP_SALARY) as EXP_SALARY, " +
					"sum(-EXP_Non_SALARY) as EXP_Non_SALARY, sum(balance) from fin.tblEDWData where bienniumYear >= 2013 " +
					"and budgetNumber in (095001, 095002, 099877, 653920, 655411) " +
					"and yrmo <= (select substring(replace(CONVERT(VARCHAR, GETDATE(), 21), '-', '_'), 1, 7)) " +
					"group by bienniumYear , yrmo " +
					"union select '1' id ,'Gifts' as budgetNumber ,'Sum' as budgetName , bienniumYear , yrmo ," +
					"sum(RevenueAmount) as RevenueAmount ,sum(REV_Endowment) as REV_Endowment ,sum(REV_Other) " +
					"as REV_Other ,sum(-ExpenseAmount) as ExpenseAmount ,sum(-EXP_SALARY) as EXP_SALARY ," +
					"sum(-EXP_Non_SALARY) as EXP_Non_SALARY ,sum(balance) as balance from fin.tblEDWData " +
					"where bienniumYear >= 2013 and budgetNumber in (640259, 653977, 656876, 658823, 680475) " +
					"and yrmo <= (select substring(replace(CONVERT(VARCHAR, GETDATE(), 21), '-', '_'), 1, 7)) " +
					"group by bienniumYear , yrmo ) a where budgetNumber = '{0}'", bnum);

				DataTable dt = sql.DataTable_from_SQLstring(code);


				decimal maxbal = dt.AsEnumerable().Select(f => f.Field<decimal>("balance")).Max();

				if (maxbal != 0)
				{
					DxLineplotSettings settings = new DxLineplotSettings();

					List<string> yvars = new List<string> { 
						  "RevenueAmount"
						, "REV_Endowment"
						, "REV_Other"
						, "ExpenseAmount"
						, "EXP_SALARY"
						, "EXP_Non_SALARY"
						, "balance" 
					};

					List<Color> mycolors = new List<Color> { 
						 Color.DarkBlue //balance
						,Color.Red //exp non-sal
						,Color.Red //exp sal
						,Color.Red //exp tot
						,Color.Green //rev endow
						,Color.Green //rev other
						,Color.Green //rev tot

						// Color.Red //balance
						//,Color.Orange //exp non-sal
						//,Color.Yellow //exp sal
						//,Color.Green //exp tot
						//,Color.Blue //rev endow
						//,Color.Purple //rev other
						//,Color.Cyan //rev tot

						//,Color.Pink
						//,Color.Peru
						//,Color.Wheat
						//,Color.SkyBlue
						//,Color.SpringGreen
						//,Color.AliceBlue
						//,Color.Orange
						//,Color.DarkOrange
						//,Color.Olive
					};

					List<DashStyle> mydashstyles = new List<DashStyle> {
						 DashStyle.Solid
						,DashStyle.Dash
						,DashStyle.Dot
						,DashStyle.Solid
						,DashStyle.Dot
						,DashStyle.Dash
						,DashStyle.Solid
					};

					settings.maxCol = 2;
					settings.W = 1100;
					settings.H = 400;
					settings.colors = mycolors;
					settings.AddVarsFromList(yvars);
					//settings.numvars = yvars;
					settings.seriesby = "id";
					settings.xaxisvar = "yrmo";
					settings.colorvar = "variable";
					settings.title = String.Format("{0} {1}", bnum, bname);
					settings.legend_pos_h = "RightOutside";
					settings.legend_pos_v = "Top";
					//settings.ChartType = DxChartType.Lineplot;
					

					DxChartOrder order = new DxChartOrder();
					order.list_settings.Add(settings);
					///orders.Add(order);

					DxChartFactory factory = new DxChartFactory(dt, new List<DxChartOrder> { order });


					foreach (DxChartOrder myorder in factory.orders)
					{
						foreach (DxChartBatch batch in myorder.batches)
						{
							WebChartControl c = batch.charts[0].chart;

							c.Legend.MarkerMode = LegendMarkerMode.CheckBoxAndMarker;

							DevExpress.XtraCharts.Series s0 = c.Series[0];
							DevExpress.XtraCharts.Series s1 = c.Series[1];
							DevExpress.XtraCharts.Series s2 = c.Series[2];
							DevExpress.XtraCharts.Series s3 = c.Series[3];
							DevExpress.XtraCharts.Series s4 = c.Series[4];
							DevExpress.XtraCharts.Series s5 = c.Series[5];
							DevExpress.XtraCharts.Series s6 = c.Series[6];

							s0.View.Color = mycolors[0];
							s1.View.Color = mycolors[1];
							s2.View.Color = mycolors[2];
							s3.View.Color = mycolors[3];
							s4.View.Color = mycolors[4];
							s5.View.Color = mycolors[5];
							s6.View.Color = mycolors[6];

							((LineSeriesView)s0.View).LineStyle.DashStyle = mydashstyles[0];
							((LineSeriesView)s1.View).LineStyle.DashStyle = mydashstyles[1];
							((LineSeriesView)s2.View).LineStyle.DashStyle = mydashstyles[2];
							((LineSeriesView)s3.View).LineStyle.DashStyle = mydashstyles[3];
							((LineSeriesView)s4.View).LineStyle.DashStyle = mydashstyles[4];
							((LineSeriesView)s5.View).LineStyle.DashStyle = mydashstyles[5];
							((LineSeriesView)s6.View).LineStyle.DashStyle = mydashstyles[6];

							System.Web.UI.WebControls.Table t = LayoutOutput.LayoutBatch(batch);
							Literal lit = new Literal();
							lit.Text = String.Format("<b>{0} {1}</b>", bnum, bname);
							panel.Controls.Add(lit);
							panel.Controls.Add(t);
						}

					}

				}
			}


		}


	}





}