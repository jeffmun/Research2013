using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNet.Highcharts;
using DotNet.Highcharts.Options;
using DotNet.Highcharts.Helpers;
using DotNet.Highcharts.Enums;
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

		DataTable dt_bnums = sql.DataTable_from_SQLstring("select budgetNumber,  [name] budgetName from fin.tblEDWData where bienniumYear = 2017 group by budgetNumber,  [name]");

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


				string code = String.Format("select '1' id, budgetNumber, [name] budgetName, bienniumYear, yrmo, RevenueAmount, REV_Endowment, REV_Other, ExpenseAmount, EXP_SALARY, EXP_Non_SALARY, balance from fin.tblEDWData where bienniumYear = 2017 and budgetNumber = '{0}'"
					, bnum);

				DataTable dt = sql.DataTable_from_SQLstring(code);


				decimal maxbal = dt.AsEnumerable().Select(f => f.Field<decimal>("balance")).Max();

				if (maxbal != 0)
				{
					DxLineplotSettings settings = new DxLineplotSettings();

					List<string> yvars = new List<string> { "RevenueAmount", "REV_Endowment", "REV_Other", "ExpenseAmount", "EXP_SALARY", "EXP_Non_SALARY", "balance" };


					List<Color> mycolors = new List<Color> { Color.Lime, Color.Red, Color.Green, Color.Purple, Color.Yellow
							, Color.Cyan , Color.Pink, Color.Peru, Color.Wheat, Color.SkyBlue
							, Color.SpringGreen, Color.AliceBlue, Color.Orange, Color.DarkOrange, Color.Olive};

					settings.maxCol = 2;
					settings.W = 800;
					settings.H = 600;
					settings.colors = mycolors;
					settings.numvars = yvars;
					settings.seriesby = "id";
					settings.xaxisvar = "yrmo";
					settings.colorvar = "variable";
					settings.title = String.Format("{0} {1}", bnum, bname);
					settings.legend_pos_h = "RightOutside";
					settings.legend_pos_v = "Top";


					DxChartOrder order = new DxChartOrder();
					order.list_settings.Add(settings);
					///orders.Add(order);

					DxChartFactory factory = new DxChartFactory(dt, order);


					foreach (DxChartOrder myorder in factory.orders)
					{
						foreach (DxChartBatch batch in myorder.batches)
						{
							WebChartControl c = batch.charts[0].chart;

							DevExpress.XtraCharts.Series s0 = c.Series[0];
							DevExpress.XtraCharts.Series s1 = c.Series[1];

							((LineSeriesView)s0.View).LineStyle.DashStyle = DashStyle.DashDotDot;
							((LineSeriesView)s1.View).LineStyle.DashStyle = DashStyle.Dash;




							System.Web.UI.WebControls.Table t = ChartOutput.LayoutBatch(batch);
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