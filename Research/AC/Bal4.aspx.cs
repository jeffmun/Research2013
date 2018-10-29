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

public partial class AC_Bal : System.Web.UI.Page
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