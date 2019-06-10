using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
////using DotNet.Highcharts;
//using DotNet.Highcharts.Options;
//using DotNet.Highcharts.Helpers;
//using DotNet.Highcharts.Enums;
//using SelectPdf;
using System.IO;
using uwac;

namespace uwac
{


	/// <summary>
	/// Summary description for utilIntHx
	/// </summary>
	public class utilIntHx
	{
		public utilIntHx()
		{
			//
			// TODO: Add constructor logic here
			//
		}


		#region Get IntHx Data from the SQL DB
		


		public static DataSet Get_MIND_IntHx_v2_Data_by_ID(SQL_utils sql, int studyID, string id)
		{
			DataSet ds = Get_MIND_IntHx_v2_Data_by_ID(sql, studyID, id, "Timepoint");
			return ds;
		}

		public static DataSet Get_MIND_IntHx_v2_Data_by_ID(SQL_utils sql, int studyID, string id, string periodtype)
		{
			//SQL_utils sql = new SQL_utils();

			List<SqlParameter> ps = new List<SqlParameter>();

			ps.Add(sql.CreateParam("studyID", studyID.ToString(), "int"));
			ps.Add(sql.CreateParam("ID", id, "text"));
			ps.Add(sql.CreateParam("periodtype", periodtype, "text"));


			DataSet ds = sql.DataSet_from_ProcName("spSCORE_ALL_MIND_IntHx_vers2_STACKED__getdata_for_CHARTS_2018", ps);
			

			List<string> tblnames = new List<string> {"Weekly by TYPE",
					"Weekly by CAT",
					"Weekly by ALL",
					"Period by TYPE",
					"Period By CAT", 
					"Period by ALL" ,
					 "dt_admindates",
					 "dt_colors0",
					 "dt_colors1",
					 "dt_colors2"};


			int counter = 0;
			foreach (DataTable dt in ds.Tables)
			{
				dt.TableName = tblnames[counter];
				counter++;
			}

			return ds;

		}
		#endregion 


		#region Save IntHx Charts 
		public static void SaveIntHxCharts(SQL_utils sql, int studyID, string id, string path, string periodtype)
		{
			SaveIntHxCharts(sql, studyID, id, path, periodtype, -999);
		}


		public static void SaveIntHxCharts(SQL_utils sql, int studyID, string id, string path, string periodtype, int ymax)
		{

			DataSet ds = Get_MIND_IntHx_v2_Data_by_ID(sql, studyID, id, periodtype);

			string chartname = "chartname" + id;
			//int ymax = 80;

			string filenamebase = "ih" + studyID.ToString().ToLower() + id.ToLower() + periodtype;


			//Define the x axis min and max, so all the vertlines will fit
			DateTime? first = null;
			DateTime? last = null;
			try
			{
				first = ds.Tables["dt_admindates"].AsEnumerable()
				   .Min(r => r.Field<DateTime>("tpdatebeg_SUN"));

				last = ds.Tables["dt_admindates"].AsEnumerable()
					.Max(r => r.Field<DateTime>("next_tpdatebeg_SUN"));

				if (first != null & last != null)
				{
					TimeSpan padding = new TimeSpan(14, 0, 0, 0);
					first = first - padding;
					last = last + padding;
				}
				else
				{
					first = null;
					last = null;
				}
			}
			catch (Exception )
			{ 
			}





			// BY WEEK
			//DataTable dt_sorted0 = utilMSCharts.Sort(ds.Tables[0],
			//"wkdatebeg", "txtype");
			System.Web.UI.DataVisualization.Charting.Chart c0 = utilMSCharts.MSStackedColumn(ds.Tables[0], "wkdatebeg", "ihhrsperwk", "txtype", "date",
					ds.Tables["dt_colors0"], chartname, id + ": Week by TYPE(" + periodtype + ")", "Treatment Date", "Hrs per week", -999, -999, -999, ymax, 950, 400, first, last);

			if (c0 != null)
			{
				c0 = utilMSCharts.AddVertLines(c0, ds.Tables["dt_admindates"], "tpdatebeg_SUN", "period_age", "date", -999, -999, -999, ymax);
				string f0 = filenamebase + "_type_wk.png";
				c0.SaveImage(path + f0);
			}
			

			//DataTable dt_sorted1 = utilMSCharts.Sort(ds.Tables[1],
			//"wkdatebeg", "txcat");
			System.Web.UI.DataVisualization.Charting.Chart c1 = utilMSCharts.MSStackedColumn(ds.Tables[1], "wkdatebeg", "ihhrsperwk", "txcat", "date",
					ds.Tables["dt_colors1"], chartname, id + ": Week by CATEGORY(" + periodtype + ")", "Treatment Date", "Hrs per week", -999, -999, -999, ymax, 800, 400);

			if (c1 != null)
			{
				c1 = utilMSCharts.AddVertLines(c1, ds.Tables["dt_admindates"], "tpdatebeg_SUN", "period_age", "date", -999, -999, -999, ymax);
				string f1 = filenamebase + "_cat_wk.png";
				c1.SaveImage(path + f1);
			}

			
			//DataTable dt_sorted2 = utilMSCharts.Sort(ds.Tables[2], "wkdatebeg", "txall");
			System.Web.UI.DataVisualization.Charting.Chart c2 = utilMSCharts.MSStackedColumn(ds.Tables[2], "wkdatebeg", "ihhrsperwk", "txall", "date",
					ds.Tables["dt_colors2"], chartname, id + ": Week by ALL (" + periodtype + ")", "Treatment Date", "Hrs per week", -999, -999, -999, ymax, 800, 400);

			if (c2 != null)
			{
				c2 = utilMSCharts.AddVertLines(c2, ds.Tables["dt_admindates"], "tpdatebeg_SUN", "period_age", "date", -999, -999, -999, ymax);
				string f2 = filenamebase + "_all_wk.png";
				c2.SaveImage(path + f2);
			}

			


			// BY PERIOD
			System.Web.UI.DataVisualization.Charting.Chart c3 = utilMSCharts.MSStackedColumn(utilMSCharts.Sort(ds.Tables[3], "period", "txtype"), "period", "avgPER_ihhrsperwk", "txtype", "string",
				ds.Tables["dt_colors0"], ds.Tables[3].TableName + " " + id, id + ": " + periodtype + " by TYPE", "Period", "Avg Hrs/wk during period", -999, -999, -999, ymax, 400, 400);
			if (c3 != null)
			{
				string f3 = filenamebase + "_type_period.png";
				c3.SaveImage(path + f3);
			}
			
			System.Web.UI.DataVisualization.Charting.Chart c4 = utilMSCharts.MSStackedColumn(utilMSCharts.Sort(ds.Tables[4], "period", "txcat"), "period", "avgPER_ihhrsperwk", "txcat", "string",
					ds.Tables["dt_colors1"], ds.Tables[4].TableName + " " + id, id + ": " + periodtype + " by CATEGORY", "Period", "Avg Hrs/wk during period", -999, -999, -999, ymax, 400, 400);
			if (c4 != null)
			{
				string f4 = filenamebase + "_cat_period.png";
				c4.SaveImage(path + f4);
			}
			
			System.Web.UI.DataVisualization.Charting.Chart c5 = utilMSCharts.MSStackedColumn(utilMSCharts.Sort(ds.Tables[5], "period", "txall"), "period", "avgPER_ihhrsperwk", "txall", "string",
					ds.Tables["dt_colors2"], ds.Tables[5].TableName + " " + id, id + ": " + periodtype + " by ALL", "Period", "Avg Hrs/wk during period", -999, -999, -999, ymax, 400, 400);
			if (c5 != null)
			{
				string f5 = filenamebase + "_all_period.png";
				c5.SaveImage(path + f5);
			}

			// BY PERIOD - ACTIVE
			System.Web.UI.DataVisualization.Charting.Chart c3act = utilMSCharts.MSStackedColumn(utilMSCharts.Sort(ds.Tables[3], "period", "txtype"), "period", "avgACT_ihhrsperwk", "txtype", "string",
					ds.Tables["dt_colors0"], ds.Tables[3].TableName + " " + id, id + ": " + periodtype + " by TYPE *ACTIVE*", "Period", "Avg Hrs/wk during period ACTIVE", -999, -999, -999, ymax, 400, 400);
			if (c3act != null)
			{
				string f3act = filenamebase + "_type_periodACTIVE.png";
				c3act.SaveImage(path + f3act);
			}


			System.Web.UI.DataVisualization.Charting.Chart c4act = utilMSCharts.MSStackedColumn(utilMSCharts.Sort(ds.Tables[4], "period", "txcat"), "period", "avgACT_ihhrsperwk", "txcat", "string",
					ds.Tables["dt_colors1"], ds.Tables[4].TableName + " " + id, id + ": " + periodtype + " by CATEGORY *ACTIVE*", "Period", "Avg Hrs/wk during period ACTIVE", -999, -999, -999, ymax, 400, 400);
			if (c4act != null)
			{
				string f4act = filenamebase + "_cat_periodACTIVE.png";
				c4act.SaveImage(path + f4act);
			}

			System.Web.UI.DataVisualization.Charting.Chart c5act = utilMSCharts.MSStackedColumn(utilMSCharts.Sort(ds.Tables[5], "period", "txall"), "period", "avgACT_ihhrsperwk", "txall", "string",
					ds.Tables["dt_colors2"], ds.Tables[5].TableName + " " + id, id + ": " + periodtype + " by ALL *ACTIVE*", "Period", "Avg Hrs/wk during period ACTIVE", -999, -999, -999, ymax, 400, 400);
			if (c5act != null)
			{
				string f5act = filenamebase + "_all_periodACTIVE.png";
				c5act.SaveImage(path + f5act);
			}
			




			//Debug.WriteLine(id);

			//sql.Close();
		}
		#endregion 



		#region Display IntHx Charts



		public static void DisplayIntHxCharts(string path, int studyID, string id, List<string> selectedCharts, string periodtype, Panel panel)
		{
			//string path = Server.MapPath("~/stats/charts/");


			Table t = new Table();
			TableRow r = new TableRow();

			foreach (string f in selectedCharts)
			{
				string chartfile = path + "ih" + studyID.ToString().ToLower() + id.ToLower() + periodtype + f;
				//string chartfile = @"~/stats/Charts/ih" + studyID.ToString().ToLower() + id + periodtype + f;

				System.Web.UI.WebControls.Image img = utilIntHx.GetIntHxChart(chartfile);
				img.AlternateText = "Missing chart for " + id;

				TableCell cell = new TableCell();
				cell.Controls.Add(img);
				r.Cells.Add(cell);
			}
			t.Rows.Add(r);

			HyperLink hyp = new HyperLink();
			hyp.NavigateUrl = "~/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx?id=" + id;
			hyp.Text = "(edit)";

			Literal lit = new Literal();
			lit.Text = "<br/><br/><font size=\"4\"><b>" + id + "</b></font>&nbsp;&nbsp;<a href=\"https://uwac.autism.washington.edu/research/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx?id=" + id + "\">edit</a><br/>";
			panel.Controls.Add(lit);
			panel.Controls.Add(t);

		}



		public static System.Web.UI.WebControls.Image GetIntHxChart(string chartfile)
		{
			int rand = new Random().Next(99999999);

			System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();
			img.ImageUrl = string.Concat(chartfile, '?', rand);

			return img;
		}



		#endregion

	}

}