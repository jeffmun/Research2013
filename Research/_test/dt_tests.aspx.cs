using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;
using uwac.data;
using DevExpress.Web;
using System.IO;
using System.Xml.Linq;
using System.Diagnostics;

public partial class _test_dt_tests : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		WidenTable();
		//ShowWinSat();
	}

	protected void WidenTable()
	{
		SQL_utils sql = new SQL_utils("data");

		string sqlcode = "  select val pk, val, upper as up, '' isREL from const_INTs where val between 1 and 10 " +
			" union select val - 10 pk, val, upper as up, 'REL' isREL from const_INTs where val between  11 and 20";

		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
		List<string> vars_to_move = new List<string> { "val", "up" };
		//dt.WidenRelData(vars_to_move, "pk", "isREL", "", "REL", "REL_", "");

		//ASPxGridView g1 = new ASPxGridView();
		//g1.DataSource = dt;
		//g1.DataBind();
		//g1.SettingsPager.PageSize = 50;
		//panel1.Controls.Add(g1);

		
		//DataTable dt2 = dt.Wi


	}


	protected void ShowWinSat()
	{
		//Run this to show a table of the Benchmarks

		DataTable dt =  getFilesRecursive(@"C:\_batch\Benchmarks");
		ASPxGridView g1 = new ASPxGridView();
		g1.DataSource = dt;
		g1.DataBind();
		g1.SettingsPager.PageSize = 100;
		panel1.Controls.Add(g1);


	}


	protected DataRow GetWinSat(DataTable dt, string path)
	{
		DataRow row = dt.NewRow();

		var doc = XDocument.Load(path);


		List<string> info = new List<string>();

		try
		{
			row["machine"] = path.Replace(@"\winstatresults.xml", "").Replace(@"C:\_batch\Benchmarks\","");
			row["processor"] = Convert.ToDouble(doc.Descendants("CpuScore").First().Value);

			row["memory"] = Convert.ToDouble(doc.Descendants("MemoryScore").First().Value);
			row["graphics"] = Convert.ToDouble(doc.Descendants("GraphicsScore").First().Value);
			row["gaming_graphics"] = Convert.ToDouble(doc.Descendants("GamingScore").First().Value);
			row["hard_disk"] = Convert.ToDouble(doc.Descendants("DiskScore").First().Value);
			row["base_score"] = Convert.ToDouble(doc.Descendants("SystemScore").First().Value);
		}
		catch(Exception ex)
		{ }
		return row;
	}

	private DataTable getFilesRecursive(string sDir)
	{
		DataTable dt = dtWinSat();

		List<string> results = new List<string>();
		try
		{
			foreach (string d in Directory.GetDirectories(sDir))
			{

				foreach (var file in Directory.GetFiles(d))
				{
					//This is where you would manipulate each file found, e.g.:
					DataRow myrow = GetWinSat(dt, file);
					dt.Rows.Add(myrow);
				}
			}
		}
		catch (System.Exception e)
		{
			Debug.WriteLine(e.Message);
		}

		return dt;
	}

	protected DataTable dtWinSat()
	{
		DataTable dt = new DataTable();

		dt.Columns.Add(new DataColumn("machine", typeof(string)));
		dt.Columns.Add(new DataColumn("processor", typeof(double)));
		dt.Columns.Add(new DataColumn("memory", typeof(double)));
		dt.Columns.Add(new DataColumn("graphics", typeof(double)));
		dt.Columns.Add(new DataColumn("gaming_graphics", typeof(double)));
		dt.Columns.Add(new DataColumn("hard_disk", typeof(double)));
		dt.Columns.Add(new DataColumn("base_score", typeof(double)));

		return dt;
	}



}
