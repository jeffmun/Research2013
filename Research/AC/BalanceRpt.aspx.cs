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

public partial class AC_BalanceRpt : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

		if (!Page.IsPostBack)
		{
			// Bind Charts  
			//Chart1.Series[0].Color = Color.Red;
			Chart1.ChartAreas[0].AxisY.LabelStyle.Format = "{0:0,}K";
			Chart2.ChartAreas[0].AxisY.LabelStyle.Format = "{0:0,}K";
			Chart3.ChartAreas[0].AxisY.LabelStyle.Format = "{0:0,}K";
			Chart4.ChartAreas[0].AxisY.LabelStyle.Format = "{0:0,}K";
			Chart5.ChartAreas[0].AxisY.LabelStyle.Format = "{0:0,}K";
			Chart6.ChartAreas[0].AxisY.LabelStyle.Format = "{0:0,}K";

		}
	




		int idx = ddlMonth.SelectedIndex;

		//Label1.Text =  idx.ToString();

		if (idx < 0)
		{
			ddlMonth.DataBind();
			ddlMonth.SelectedIndex = 0;
		}


		string mo = ddlMonth.SelectedValue.ToString();

		mo = mo.Replace('/', '_');

		//GetData(mo);


		List<string> mos = new List<string> {

			 "2016_06"
			,"2016_05" 
			,"2016_04" 
			,"2016_03" 
			,"2016_02" 
			,"2016_01" 
			,"2015_12" 
			,"2015_11" 
			,"2015_10" 
			,"2015_09" 
			,"2015_08"
			,"2015_07"
			,"2015_06"
			,"2015_05" 
			,"2015_04"
			,"2015_03" 
			,"2015_02" 
			,"2015_01" 
			,"2014_12" 
			,"2014_11" 
			,"2014_10" 
			,"2014_09" 
			,"2014_08"
			,"2014_07"
			,"2014_06"
			,"2014_05" 
			,"2014_04" 
			,"2014_03" 
			,"2014_02" 
			,"2014_01" 
			,"2013_12" 
			,"2013_11" 
			,"2013_10" 
			,"2013_09" 
			,"2013_08"
			,"2013_07"    
		
		};

		foreach(string s in mos)
		{
			GetData(s, "core");
			GetData(s, "gift");
		}





	}




	protected void GetData(string mo, string mode)
	{

		SQL_utils sql = new SQL_utils("backend");

		List<SqlParameter> ps = new List<SqlParameter>();

		ps.Add(sql.CreateParam("yrmo", mo, "text"));
		ps.Add(sql.CreateParam("mode", mode, "text"));


		DataTable dt = sql.DataTable_from_ProcName("ac.spCurrentBal_with_endowment", ps);


		if (mo == "2016_05")
		{
			List<string> series = new List<string> { "Revenue", "Expenses", "Balance" };
			Literal lit = new Literal();
			lit.Text = utilCharts.Highcharts2("May_2016", dt, "BudgetName", series, ChartTypes.Line, 500, 400);

			panelCharts.Controls.Add(lit);
		}

		else if (mo == "2016_04")
		{
			List<string> series = new List<string> { "Revenue", "Expenses", "Balance" };
			Literal lit2 = new Literal();
			lit2.Text = utilCharts.Highcharts2("April_2016", dt, "BudgetName", series, ChartTypes.Column, 500, 400);

			panelCharts2.Controls.Add(lit2);
		}

		//DataTable dt = sql.DataTable_from_SQLstring("select * from  ac.tbl_vwfin_data_MONTHLY_TOT_CUM " +
		//    " where yrmo = '"+ mo + "' and budgetnbr in ('095001', '095002','099877','653920', '655411', 'Sum') Order by BudgetNbr, caldate");

		GridView gv = new GridView();
		gv.RowDataBound += new GridViewRowEventHandler(grid_RowDataBound);
		gv.DataSource = dt;
		gv.DataBind();






		Label l = new Label();
		l.Text = "<br/><br/>" + mo;
		l.Font.Size = 12;


		if(mode=="core")
		{
			panel1.Controls.Add(l);
			panel1.Controls.Add(gv);
		}
		else if (mode=="gift")
		{
			panel2.Controls.Add(l);
			panel2.Controls.Add(gv);
		}






		//DataTable dt2 = sql.DataTable_from_SQLstring("select * from  ac.tbl_vwfin_data_MONTHLY_TOT_CUM " +
		//" where yrmo = '" + mo + "' and budgetnbr  in ('656876') Order by BudgetNbr, caldate");

		//grid2.DataSource = dt2;
		//grid2.DataBind();

		//DataTable dt3 = sql.DataTable_from_SQLstring("select * from  ac.tbl_vwfin_data_MONTHLY_TOT_CUM " +
		//    " where yrmo = '" + mo + "' and budgetnbr not in ('095001', '095002','099877','653920', '655411', '656876') Order by BudgetNbr, caldate");

		//grid3.DataSource = dt3;
		//grid3.DataBind();



	}
	
	
	protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
	{

		if (e.Row.RowType == DataControlRowType.DataRow)
		{

			try
			{

				double RemainingBal = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Balance"));
				string budgetname = DataBinder.Eval(e.Row.DataItem, "BudgetName").ToString();

				if (RemainingBal < 0)
				{
					e.Row.Cells[8].ForeColor = Color.Red;
				}

				if (budgetname == "TOTAL")
				{
					e.Row.BackColor = Color.Yellow;

				}

				if (budgetname != "TOTAL")
				{
					e.Row.Cells[8].BackColor = Color.Lavender;
				}

				for (int i = 2; i < 9; i++)
				{
					e.Row.Cells[i].Text = Convert.ToDecimal(e.Row.Cells[i].Text).ToString("c0");

				}
			}
			catch
			{ }

		}

	}




	protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
	{

	}
}