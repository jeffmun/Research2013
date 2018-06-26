using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
//using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;
using Obout.Grid;
using uwac;
using GoogleChartsNGraphsControls;


public partial class stats_DATAvalues : System.Web.UI.Page
{

	#region Page Events
	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);

		if (!IsPostBack)
		{
		 

			//LoadTimepoints();
		}

		//ogrid_Fld_numeric.OnClientSelect = "onClientSelect";
	}

	protected void Page_PreRender(object sender, EventArgs e)
	{
		//this.Page.ClientScript.GetPostBackEventReference(<a control>, string.Empty);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		//getTimepointSubj();
		PopulateNewIDDDL();

//		btnUpdateDataChk.Visible = false;
		panelGrid.Visible = false;
		lblStudyName.Text = Master.Master_studyname;
		Response.Redirect(Request.Url.ToString()); 
	}


	protected void Page_Load(object sender, EventArgs e)
	{
		//THIS??? ClientScript.GetPostBackEventReference(this, string.Empty);

		lblStudyName.Text = Master.Master_studyname;

		GridView gvSubjects = new gvSelector("gvSubjects", Convert.ToInt32(Master.Master_studyID));
		gvSubjects_container.Controls.Add(gvSubjects);

		ShowHide_based_on_PlotsBy();

		if (!IsPostBack)
		{
			PopulateNewIDDDL();
			//getTimepointSubj();

			LoadSelectedFields();
			LoadFields();
			//ViewState["fldpk_csv"] = default_flds;

			int personID;
			bool success = int.TryParse(Request.QueryString["personID"], out personID);
			if (success & personID > 0)
			{
				rblPlotsBy.SelectedIndex = 2;
				ddlNewID.SelectedValue = personID.ToString();
			}


		}
		

	}
	#endregion



	protected void ddlNewID_SelectedIndexChanged(object sender, EventArgs e)
	{
		string id = ddlNewID.SelectedValue.ToString();

		ViewState["id"] = id;


		//getDATAvalues_by_Subject(Convert.ToInt32(id), GetSelectedFields(grid_numeric_selected));
		//getTimepointDates_by_Subject(id);

		//SetDataChk(id);

	}



	protected void PopulateNewIDDDL()
	{
		SQL_utils sql = new SQL_utils("data");
		string s;

		s = "select 0 as personID, ' --Select New ID--' IDtxt union select personID, ID + " +
			" ' ' + groupname + ' ' + (case when studyID=1065 then coalesce('('+txgrp + ') ','  ') else ' ' end) + subjstatus + ' ' + coalesce(subjstatusdetail, '')  " + 
			" from uwautism_research_backend..vwMasterStatus_S_txgrp  where studyID = " + Master.Master_studyID.ToString() + " order by 2";

		DataTable dtIDs = sql.DataTable_from_SQLstring(s);

		ddlNewID.DataSource = dtIDs;
		ddlNewID.DataBind();

		sql.Close();
	}

	protected void LoadFields()
	{
		SQL_utils sql = new SQL_utils();

		DataTable dtnumeric = new DataTable();

		if (chkAllVars.Checked)
		{
			dtnumeric = sql.DataTable_from_SQLstring("exec  def.spFld_InAnalysis_by_studyIDfull " + Master.Master_studyIDfull.ToString() + ", 'numeric', 'ALL_with_0'");
		}
		else
		{
			dtnumeric = sql.DataTable_from_SQLstring("exec  def.spFld_InAnalysis_by_studyIDfull " + Master.Master_studyIDfull.ToString() + ", 'numeric', 'ALL'");
		}
		


		ogrid_Fld_numeric.DataSource = dtnumeric;
		ogrid_Fld_numeric.DataBind();

		sql.Close();

	}

	protected void LoadSelectedFields()
	{

		SQL_utils sql = new SQL_utils();

		DataTable dtselected = sql.DataTable_from_SQLstring("exec  def.spFld_InAnalysis_by_studyIDfull " + Master.Master_studyIDfull.ToString() + ", 'numeric', 'SELECTED'");


		if(dtselected.Rows.Count>0)
		{
			hidNumSelectedVars.Value = dtselected.Rows.Count.ToString();

			Grid1.DataSource = dtselected;
			Grid1.DataBind();

			panelChartControls.Visible = true;
			panelInstructions.Visible = false;
		}
		else
		{
			Grid1.Visible = false;
			panelChartControls.Visible = false;
			panelInstructions.Visible = true;

		}
	

		sql.Close();

	}






	protected void getDATAvalues_by_Subject(int personID, string mode, int ncols)
	{
		SQL_utils sql = new SQL_utils();

		string IDtxt = ddlNewID.SelectedItem.Text;
		int remove_missval = (chkRemoveMissval.Checked) ? 1 : 0;

		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("personID", personID.ToString(), "int"));
		ps.Add(sql.CreateParam("studyIDfull", Master.Master_studyIDfull.ToString(), "int"));
		ps.Add(sql.CreateParam("remove_missval", remove_missval.ToString(), "int"));



		DataTable dt_syntax = sql.DataTable_from_ProcName("def.spDATAvalues_by_Subject_get_SQLsyntax", ps);

		List<string> list_sqlsyntax = dt_syntax.AsEnumerable().Select(f => f.Field<string>("sqltxt")).ToList();
		string sqlsyntax = String.Join(" ", list_sqlsyntax);

		DataTable dt_values = sql.DataTable_from_SQLstring(sqlsyntax);
		DataView dv = dt_values.AsDataView();
		dv.RowFilter = "datatype='text'";
		DataTable dt_values_text = dv.ToTable();

		GridView gv = new GridView();
		gv.DataSource = dt_values_text;
		gv.DataBind();

		panelCharts.Controls.Add(gv);


		//see this for why it wasn't working in production:
		//http://stackoverflow.com/questions/7933830/asp-net-charting-control-not-working-on-production-server
		//I set the ChartImageHandler value in ISS to:
		//storage=memory;timeout=20;deleteAfterServicing=true;

		DataView dv2 = dt_values.AsDataView();
		dv2.RowFilter = "datatype='int' or datatype='int\r\n'  OR datatype='float' or datatype = 'float\r\n'";
		DataTable dt_values_numeric = dv2.ToTable();

		DataTable dt_values_numeric2 = new DataTable();
		if (rblDate_or_Age.SelectedValue == "Age Zero")
		{
			var minage = from s in dt_values_numeric.AsEnumerable()
						 group s by s.Field<string>("ID") into g
						 select new { ID = g.Key, minage = g.Min(s => s.Field<double>("AgeMos")) };


			DataTable dt_minage = utilStats.LINQResultToDataTable(minage);

			
			dt_values_numeric2.Columns.Add("ID", typeof(string));
			dt_values_numeric2.Columns.Add("studymeasID", typeof(int));
			dt_values_numeric2.Columns.Add("delink", typeof(string));
			dt_values_numeric2.Columns.Add("TimePoint", typeof(string));
			dt_values_numeric2.Columns.Add("Grp", typeof(string));
			dt_values_numeric2.Columns.Add("TxGrp", typeof(string));
			dt_values_numeric2.Columns.Add("datatype", typeof(string));
			dt_values_numeric2.Columns.Add("admindate", typeof(DateTime));
			dt_values_numeric2.Columns.Add("AgeMos", typeof(double));
			dt_values_numeric2.Columns.Add("score", typeof(string));
			dt_values_numeric2.Columns.Add("score_label", typeof(string));
			dt_values_numeric2.Columns.Add("mytooltip", typeof(string));
			dt_values_numeric2.Columns.Add("minage", typeof(double));
			dt_values_numeric2.Columns.Add("AgeZero", typeof(double));

			var result = from dataRows1 in dt_values_numeric.AsEnumerable()
						 join dataRows2 in dt_minage.AsEnumerable()
						 on dataRows1.Field<string>("ID") equals dataRows2.Field<string>("ID") into lj
						 from r in lj.DefaultIfEmpty()
						 select dt_values_numeric2.LoadDataRow(new object[]
			 {
				dataRows1.Field<string>("ID"),	
				dataRows1.Field<int>("studymeasID"),	
				dataRows1.Field<string>("delink"),	
				dataRows1.Field<string>("TimePoint"),	
				dataRows1.Field<string>("Grp"),	
				dataRows1.Field<string>("TxGrp"),	
				dataRows1.Field<string>("datatype"),	
				dataRows1.Field<DateTime>("admindate"),	
				dataRows1.Field<double>("AgeMos"),	
				dataRows1.Field<string>("score"),	
				dataRows1.Field<string>("score_label"),	
				dataRows1.Field<string>("mytooltip"),
				r.Field<double>("minage"),
				dataRows1.Field<double>("AgeMos") - r.Field<double>("minage")
				
			  }, false);

			if (result.Count() > 0)
			{
				dt_values_numeric2 = result.CopyToDataTable();
			}
		}



		int wd;
		
		int.TryParse(txtWd.Text, out wd);
		int ht;
		int.TryParse(txtHt.Text, out ht);


		string chartname = "chart" + personID.ToString();
		string lchart = "";

		List<Literal> list_lit = new List<Literal>();

		string legendOpts = ddlLegendOpts.SelectedValue;
		string legendDirection = ddlLegendDirection.SelectedValue;

		int xmin = Convert.ToInt32(txt_xmin.Text);
		int xmax = Convert.ToInt32(txt_xmax.Text);
		int ymin = Convert.ToInt32(txt_ymin.Text);
		int ymax = Convert.ToInt32(txt_ymax.Text);


		// For one specific person
		if (personID > 0)
		{
			if (rblDate_or_Age.SelectedValue == "Age (months)")
			{
				lchart = utilCharts.Highcharts_Line(chartname, dt_values_numeric, "AgeMos", "score", "score_label", "numeric", IDtxt,
					"Age (months)", "Score", wd, ht, "delink", legendOpts, legendDirection, xmin, xmax, ymin, ymax);
			}
			else if (rblDate_or_Age.SelectedValue == "Age Zero")
			{
				lchart = utilCharts.Highcharts_Line(chartname, dt_values_numeric2, "AgeZero", "score", "score_label", "numeric", IDtxt,
					"Age (subject min=0)", "Score", wd, ht, "delink", legendOpts, legendDirection, xmin, xmax, ymin, ymax);
			}
			else if (rblDate_or_Age.SelectedValue == "Admin Date")
			{
				lchart = utilCharts.Highcharts_Line(chartname, dt_values_numeric, "admindate", "score", "score_label", "date", IDtxt,
					"Admin Date", "Score", wd, ht, "delink", legendOpts, legendDirection);
			}

			if (lchart != "")
			{
				Literal lit = new Literal();
				lit.Text = "<td valign=\"bottom\">";
				lit.Text = lchart + "</td>";
				panelCharts.Controls.Add(lit);
			}
		}
		
		// For multiple persons
		else if (personID==0)
		{
			List<string> orderby = new List<string>();
			List<string> separate_plots_by = new List<string>();
			string series_in_plots_by ="";;
			if (mode == "Each Variable")
			{
				separate_plots_by.Add( "score_label");
				series_in_plots_by = "ID";
			}
			else if (mode == "Each Variable by Group")
			{
				separate_plots_by.Add( "score_label");
				separate_plots_by.Add("Grp");
				series_in_plots_by = "ID";

			}
			else if (mode == "Each Variable by TxGrp")
			{
				separate_plots_by.Add("score_label");
				separate_plots_by.Add("TxGrp");
				series_in_plots_by = "ID";

			}
			else if (mode == "Each Subject")
			{
				separate_plots_by.Add("ID");
				series_in_plots_by = "score_label";

			}



			//Create separate data tables for each unit that will be plotted
			List<DataTable> dt_vars = new List<DataTable>();

			if (rblDate_or_Age.SelectedValue == "Age Zero")
			{
				dt_vars = utilStats.qryGroupBy(dt_values_numeric2, "variable", separate_plots_by);
			}
			else
			{
				dt_vars = utilStats.qryGroupBy(dt_values_numeric, "variable", separate_plots_by);
			}


			//List<DataTable> dt_subsets = new List<DataTable>();
			//foreach(DataTable dt_v int dt_vars)
			//{
			//    utilStats.qryGroupBy(dt_values_numeric, "variable", separate_plots_by);
			//}

			//List<DataTable> dt_vars = utilStats.qryGroupBy(dt_values_numeric, "variable", new List<string> { separate_plots_by }, orderby);
			int counter = 0;
			foreach (DataTable dt_v in dt_vars)
			{
				if (ddlLegendOpts.SelectedValue == "None")
				{
					if (counter == 0)
					{
						int nvars = Convert.ToInt16(hidNumSelectedVars.Value);
						//legendOpts = "NoneFirst_" + nvars.ToString();
						legendOpts = "Floating";
					}
					else
					{
						legendOpts = "None";
					}
				}

				chartname = "chart" + counter.ToString();
				//string varname = dt_v.AsEnumerable().Select(f => f.Field<string>(separate_plots_by[0])).First().ToString();

				string varname = dt_v.TableName;

				string charttype = "Line";

				if (charttype == "Line")
				{
					if (rblDate_or_Age.SelectedValue == "Age (months)")
					{
						lchart = utilCharts.Highcharts_Line(chartname, dt_v, "AgeMos", "score", series_in_plots_by, "numeric", varname,
							"Age (months)", "Score", wd, ht, "delink", legendOpts, legendDirection, xmin, xmax, ymin, ymax);
					}
					else if (rblDate_or_Age.SelectedValue == "Age Zero")
					{
						lchart = utilCharts.Highcharts_Line(chartname, dt_v, "AgeZero", "score", series_in_plots_by, "numeric", varname,
							"Age (subject min=0)", "Score", wd, ht, "delink", legendOpts, legendDirection, xmin, xmax, ymin, ymax);
					}

					else if (rblDate_or_Age.SelectedValue == "Admin Date")
					{
						lchart = utilCharts.Highcharts_Line(chartname, dt_v, "admindate", "score", series_in_plots_by, "date", varname,
							"Admin Date", "Score", wd, ht, "delink", legendOpts, legendDirection);
					}
				}

				else if (charttype == "ErrorBar")
				{
					DataTable stats = utilStats.DataTable_DescStats(dt_v);

					int x = 0;



					//if (rblDate_or_Age.SelectedValue == "Age (months)")
					//{
					//    lchart = utilCharts.Highcharts_Line(chartname, dt_v, "AgeMos", "score", series_in_plots_by, "numeric", varname,
					//        "Age (months)", "Score", wd, ht, "delink", legendOpts, legendDirection, xmin, xmax, ymin, ymax);
					//}
					//else if (rblDate_or_Age.SelectedValue == "Age Zero")
					//{
					//    lchart = utilCharts.Highcharts_Line(chartname, dt_v, "AgeZero", "score", series_in_plots_by, "numeric", varname,
					//        "Age (subject min=0)", "Score", wd, ht, "delink", legendOpts, legendDirection, xmin, xmax, ymin, ymax);
					//}

					//else if (rblDate_or_Age.SelectedValue == "Admin Date")
					//{
					//    lchart = utilCharts.Highcharts_Line(chartname, dt_v, "admindate", "score", series_in_plots_by, "date", varname,
					//        "Admin Date", "Score", wd, ht, "delink", legendOpts, legendDirection);
					//}
				}



				if (lchart != "")
				{
					Literal lit = new Literal();
					lit.Text += lchart + "</td>";
					list_lit.Add(lit);

				}
				counter++;
			}

			Literal litclose = new Literal();
			litclose.Text = "</tr></table>";
			panelCharts.Controls.Add(litclose);

		}

		sql.Close();


		//Load them into a table 

		Literal litall = new Literal();

		litall.Text = "<table><tr>";

		for(int i=0; i < list_lit.Count; i++)
		{
			litall.Text += "<td valign='bottom'>" + list_lit[i].Text + "</td>";
			if ((i + 1) % ncols == 0) litall.Text += "</tr><tr>";

		}

		litall.Text += "</tr></table>";

		panelCharts.Controls.Add(litall);

		panelVars.Visible = false;
		btnReset.Visible = true;

	}



	protected void ogrid_ColumnsCreated(object sender, EventArgs e)
	{
		Grid grid = sender as Grid;

		foreach (Column column in grid.Columns)
		{
			column.TemplateSettings.TemplateId = "Template1";
			column.TemplateSettings.HeaderTemplateId = "Template1";
		}
	}



	protected void btnRefreshChart_Click(object sender, EventArgs e)
	{
		int ncols = Convert.ToInt32(txtNcolumns.Text);
		getDATAvalues_by_Subject(Convert.ToInt32(ddlNewID.SelectedValue.ToString()), rblPlotsBy.SelectedValue, ncols); //, GetSelectedFields(grid_numeric_selected));
	}





	protected void btnLoadCharts_Click(object sender, EventArgs e)
	{
		panelCharts.Controls.Clear();
		
		bool hasgrps = UpdateSelectedGroups();

		//string pks = GetSelectedFields(grid_numeric_selected);

		if (hasgrps)
		{

			int ncols = Convert.ToInt32(txtNcolumns.Text);
			int personID = Convert.ToInt32(ddlNewID.SelectedValue);

			if (rblPlotsBy.SelectedValue == "Single Subject")
			{
				if (personID <= 0)
				{
					lblSelectPersonError.Visible = true;
				}

				else // if (fldpk_csv != "" & fldpk_csv != null )
				{
					lblSelectPersonError.Visible = false;
					getDATAvalues_by_Subject(personID, rblPlotsBy.SelectedValue, ncols); //, pks);

				}
				panelSelectID.Update();
			}
			else
			{
				getDATAvalues_by_Subject(0, rblPlotsBy.SelectedValue, ncols); //, pks);
			}

			panelCharts.Visible = true;
		}

	}



	protected void btnLoadScatter_Click(object sender, EventArgs e)
	{
		panelCharts.Controls.Clear();

		bool hasgrps = UpdateSelectedGroups();

		//string pks = GetSelectedFields(grid_numeric_selected);

		if (hasgrps)
		{

			int ncols = Convert.ToInt32(txtNcolumns.Text);
			int personID = Convert.ToInt32(ddlNewID.SelectedValue);

			if (rblPlotsBy.SelectedValue == "Single Subject")
			{
				if (personID <= 0)
				{
					lblSelectPersonError.Visible = true;
				}

				else // if (fldpk_csv != "" & fldpk_csv != null )
				{
					lblSelectPersonError.Visible = false;
					getDATAvalues_by_Subject(personID, rblPlotsBy.SelectedValue, ncols); //, pks);

				}
				panelSelectID.Update();
			}
			else
			{
				getDATAvalues_by_Subject(0, rblPlotsBy.SelectedValue, ncols); //, pks);
			}

			panelCharts.Visible = true;
		}

	}



	protected void btnRefresh_Click(object sender, EventArgs e)
	{
		Response.Redirect(Request.Url.ToString());
	}




	[WebMethod]
	//public static void UpdateM(Mdata m)
	public static void AddFld(int fldpk)
	{
		SQL_utils sql = new SQL_utils();
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("fldpk", fldpk.ToString(), "int"));
		sql.NonQuery_from_ProcName("dp.spFld_select", ps);

		sql.Close();
	}


	[WebMethod]
	//public static void UpdateM(Mdata m)
	public static void RemoveFld(int fldpk)
	{
		SQL_utils sql = new SQL_utils();
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("fldpk", fldpk.ToString(), "int"));
		sql.NonQuery_from_ProcName("dp.spFld_remove", ps);

		sql.Close();
	}







	protected void rblPlotsBy_SelectedIndexChanged(object sender, EventArgs e)
	{
		ShowHide_based_on_PlotsBy();
	}


	protected void ShowHide_based_on_PlotsBy()
	{
		if (rblPlotsBy.SelectedValue == "Single Subject")
		{
			ddlNewID.Visible = true;
			gvSubjects_container.Visible = false;
		}
		else
		{
			ddlNewID.Visible = false;
			gvSubjects_container.Visible = true;
			lblSelectPersonError.Visible = false;
		}
		panelSelectID.Update();

	}


	protected bool UpdateSelectedGroups()
	{   
		if (rblPlotsBy.SelectedValue != "Single Subject")
		{

			bool hasgrps = true;
			gvSelector gv = (gvSelector)gvSubjects_container.FindControlRecursive("gvSubjects");

			//GridView gv = (GridView)gvSubjects_container.FindControlRecursive("gvSubjects");
			string csv = gvSelector.CSVpairs_GetSelectedSubjects(gv);


			if (csv == "")
			{
				lblSelectSubjects.Visible = true;
				hasgrps = false;
			}
			else
			{
				lblSelectSubjects.Visible = false;
				SQL_utils sql = new SQL_utils();
				sql.NonQuery_from_ProcName("dp.spGrp_select", sql.CreateParam("grpIDssID", csv, "text"));
				sql.Close();
			}

			return hasgrps;
		}
		else
		{
			return true;
		}
	}
	protected void btnReset_Click(object sender, EventArgs e)
	{

		Response.Redirect(Request.Url.ToString());
		
	}
}


