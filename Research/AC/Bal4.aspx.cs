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

public partial class AC_Bal : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{

		if (!Page.IsPostBack)
		{

		}



		string endMo = DateTime.Now.ToString("yyyy_MM");
		List<string> lmos = new List<string> { };
		List<string> mos = new List<string> { };
		string toAdd = "";
		bool loop = true;

		int yr = 2013;
		while (loop)
		{
			int mm = 1;
			while (mm <= 12)
			{
				if (mm < 10)
				{
					toAdd = yr.ToString() + "_0" + mm.ToString();
				}
				else
				{
					toAdd = yr.ToString() + "_" + mm.ToString();
				}
				if (String.Compare(toAdd, endMo, true) <= 0)
				{
					lmos.Add(toAdd);
					mm++;
				}
				else
				{
					mm = 13;
					loop = false;
				}
			}
			yr++;
		}

		int n = lmos.Count;
		for (int i = 0; i < n; i++)
		{
			mos.Add(lmos[n - i - 1]);
		}



		foreach (string s in mos)
		{
			GetData(s, "core");
			GetData(s, "research");
			GetData(s, "gift");
		}



	}



	protected void GetData(string mo, string mode)
	{

		SQL_utils sql = new SQL_utils("FinMart");
		string txtimportDate = sql.StringScalar_from_SQLstring("select convert(varchar,min(imported_from_EDW),0)  from fin.tblEDWData ");

		importDate.Text = String.Format("Imported on {0}", txtimportDate);


		List<SqlParameter> ps = new List<SqlParameter>();

		ps.Add(sql.CreateParam("yrmo", mo, "text"));
		ps.Add(sql.CreateParam("mode", mode, "text"));


		DataTable dt = sql.DataTable_from_ProcName("fin.spGetTabularMonth", ps);

		string tblinfo = (dt.HasRows()) ? "" : " - No data returned.";

		Label l = new Label();
		l.Text = String.Format("<br/><br/>{0} {1}", mo, tblinfo);
		l.Font.Size = 12;


		if (dt == null)
		{
			if (mode == "core")
			{
				panel1.Controls.Add(l);
			}
			else if (mode == "gift")
			{
				panel2.Controls.Add(l);
			}
		}
		else
		{
			GridView gv = new GridView();
			gv.RowCreated += new GridViewRowEventHandler(grid_RowCreated);
			gv.RowDataBound += new GridViewRowEventHandler(grid_RowDataBound);
			gv.DataSource = dt;
			gv.DataBind();

			if (mode == "core")
			{
				panel1.Controls.Add(l);
				panel1.Controls.Add(gv);
			}
			else if (mode == "gift")
			{
				panel2.Controls.Add(l);
				panel2.Controls.Add(gv);
			}
		}



		sql.Close();






	}

	protected void grid_RowCreated(object sender, GridViewRowEventArgs e)
	{
		e.Row.Cells[10].Visible = false;
		e.Row.Cells[11].Visible = false;
	}



	protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		int ratioCol = 8;
		int totalCol = 9;

		if (e.Row.RowType == DataControlRowType.DataRow)
		{

			try
			{

				double RemainingBal = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Balance"));
				string budgetname = DataBinder.Eval(e.Row.DataItem, "name").ToString();

				string importDateTime = DataBinder.Eval(e.Row.DataItem, "imported_from_EDW").ToString();

				if (importDateTime.Length > 0)
				{
					importDate.Text = "Imported from EDW on " + importDateTime;
				}

				if (RemainingBal < 0)
				{
					e.Row.Cells[totalCol].ForeColor = Color.Red;
				}

				if (budgetname == "TOTAL")
				{
					e.Row.BackColor = Color.Yellow;

				}

				if (budgetname != "TOTAL")
				{
					e.Row.Cells[totalCol].BackColor = Color.Lavender;
				}

				for (int i = 2; i < 10; i++)
				{
					if (i != ratioCol)
					{


						e.Row.Cells[i].Text = Convert.ToDecimal(e.Row.Cells[i].Text).ToString("c0");
					}
					else
					{
						e.Row.Cells[i].Text = Convert.ToDecimal(e.Row.Cells[i].Text).ToString("P0");
					}
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