using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Web.Configuration;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.xml;
using iTextSharp.text.pdf;
using iTextSharp.text.factories;

//using Research_Webforms;
using uwac;
using uwac.trk;

public partial class stats_IntHxCharts : System.Web.UI.Page
{
	public DataTable dt = new DataTable();
	public string _sortDirection;
	//public string id;
	//public string ids_processed;

	public  float progress;
	public  bool inProcess = false;
	public bool processComplete = false;
	public int tickcounter;
	public List<int> yrs; //These are the years of IntHx data, used to loop through and hide years for which there is no data  

	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		//Response.Redirect("https://uwac.autism.washington.edu/research/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack_all.aspx");
		Response.Redirect(Request.RawUrl);
		if (Master.Master_studyIDfull == 90000) rblPeriodType.Visible = true;
		else rblPeriodType.Visible = false;

	}


	protected void Page_Load(object sender, EventArgs e)
	{

		if (Master.Master_studyIDfull == 90000) rblPeriodType.Visible = true;
		else rblPeriodType.Visible = false;

		if (!IsPostBack)
		{


			DataTable dt = GetIDs(Master.Master_studyID);

			int n = dt.Rows.Count;

			//ProgressBar1.Visible = false;

			btnSaveAllPNG.Text = "Recreate All Charts (N=" + n.ToString() + ")";

			//if(n>0)
			//{
			//    btnSaveAllPNG.Text = "Recreate All Charts (N=" + n.ToString() + ")";

			//    //panelProgressBar.Visible = true;
				
			//}
			//else
			//{
			//    panelProgressBar.Visible = false;
			//}

			DisplaySummaryTable();
		}
	}



	protected void DisplaySummaryTable()
	{

		////TODO
		string sqlcode;

		if(Master.Master_studyID == 1076)
		{
			sqlcode = "select a1.ID, Groupname, subjstatus, '~/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx?id=' + a1.ID as link, " +
				" sms1, sms2, sms3, sms3_5, sms4, sms4_5, sms5,  " + 
				"b.*  " +
				"from vwTadpole_IntHx_Tracking_Summary a1 " + 
				" left join " + 
				"(select * from uwautism_research_backend..vwmasterstatus_S where studyID = " + Master.Master_studyID.ToString() + ") a ON a1.ID = a.ID " +
				"left join vwIntHx_weeks_by_year b ON a.personID = b.personID order by Groupname, subjstatus, ID";

		}
		else
		{
			sqlcode = "select ID, Groupname, subjstatus, '~/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx?id=' + ID as link, " +
				"b.*  " +
				"from " +
				"(select * from uwautism_research_backend..vwmasterstatus_S where studyID = " + Master.Master_studyID.ToString() + ") a " +
				"left join vwIntHx_weeks_by_year b ON a.personID = b.personID order by Groupname, subjstatus, ID";
		}

		SQL_utils sql = new SQL_utils();

		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		//Get the years to show or hide
		DataTable dtTOTALS = sql.DataTable_from_SQLstring("exec spIntHx_weeks_by_year_TOTALS " + Master.Master_studyID.ToString());
		yrs = dtTOTALS.AsEnumerable().Select(f => f.Field<int>("yr")).ToList();


		if(Master.Master_studyID == 1076)
		{
			gvByYearTadpole.DataSource = dt;
			gvByYearTadpole.DataBind();
			gvByYearTadpole.Visible = true;
			gvByYear.Visible = false;
		}
		else 
		{
			gvByYear.DataSource = dt;
			gvByYear.DataBind();
			gvByYearTadpole.Visible = false;
			gvByYear.Visible = true;

		}



		//string sqlSMS = "select * from vwTadpole_IntHx_Tracking_Summary order by ID";
		//DataTable dtSMS = sql.DataTable_from_SQLstring(sqlSMS);
		//gvSMS.DataSource = dtSMS;
		//gvSMS.DataBind();


		sql.Close();
	}


		

		protected void gvByYear_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		GridView gv = (GridView)sender;

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			e.Row.Cells[3].BackColor = color.GetStatus_Color(color.StatusType.Measure, e.Row.Cells[3].Text);
			e.Row.Cells[4].BackColor = color.GetStatus_Color(color.StatusType.Measure, e.Row.Cells[4].Text);
			e.Row.Cells[5].BackColor = color.GetStatus_Color(color.StatusType.Measure, e.Row.Cells[5].Text);
			e.Row.Cells[6].BackColor = color.GetStatus_Color(color.StatusType.Measure, e.Row.Cells[6].Text);
			e.Row.Cells[7].BackColor = color.GetStatus_Color(color.StatusType.Measure, e.Row.Cells[7].Text);
			e.Row.Cells[8].BackColor = color.GetStatus_Color(color.StatusType.Measure, e.Row.Cells[8].Text);
			e.Row.Cells[9].BackColor = color.GetStatus_Color(color.StatusType.Measure, e.Row.Cells[9].Text);

		}


		int leading_cols = (Master.Master_studyID==1076) ? 12 : 5;

		//if (Master.Master_studyID == 1076)
		//{

		//}


		gv.Columns[leading_cols + 1].Visible = (yrs.Contains(2000)) ? true : false;
		gv.Columns[leading_cols + 2].Visible = (yrs.Contains(2001)) ? true : false;
		gv.Columns[leading_cols + 3].Visible = (yrs.Contains(2002)) ? true : false;
		gv.Columns[leading_cols + 4].Visible = (yrs.Contains(2003)) ? true : false;
		gv.Columns[leading_cols + 5].Visible = (yrs.Contains(2004)) ? true : false;
		gv.Columns[leading_cols + 6].Visible = (yrs.Contains(2005)) ? true : false;
		gv.Columns[leading_cols + 7].Visible = (yrs.Contains(2006)) ? true : false;
		gv.Columns[leading_cols + 8].Visible = (yrs.Contains(2007)) ? true : false;
		gv.Columns[leading_cols + 9].Visible = (yrs.Contains(2008)) ? true : false;
		gv.Columns[leading_cols + 10].Visible = (yrs.Contains(2009)) ? true : false;
		gv.Columns[leading_cols + 11].Visible = (yrs.Contains(2010)) ? true : false;
		gv.Columns[leading_cols + 12].Visible = (yrs.Contains(2011)) ? true : false;
		gv.Columns[leading_cols + 13].Visible = (yrs.Contains(2012)) ? true : false;
		gv.Columns[leading_cols + 14].Visible = (yrs.Contains(2013)) ? true : false;
		gv.Columns[leading_cols + 15].Visible = (yrs.Contains(2014)) ? true : false;
		gv.Columns[leading_cols + 16].Visible = (yrs.Contains(2015)) ? true : false;
		gv.Columns[leading_cols + 17].Visible = (yrs.Contains(2016)) ? true : false;
		gv.Columns[leading_cols + 18].Visible = (yrs.Contains(2017)) ? true : false;
		gv.Columns[leading_cols + 19].Visible = (yrs.Contains(2018)) ? true : false;
		gv.Columns[leading_cols + 20].Visible = (yrs.Contains(2019)) ? true : false;
		gv.Columns[leading_cols + 21].Visible = (yrs.Contains(2020)) ? true : false;

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			e.Row.Cells[leading_cols + 1].BackColor = GetCellColor(e.Row.Cells[leading_cols + 1].Text);
			e.Row.Cells[leading_cols + 2].BackColor = GetCellColor(e.Row.Cells[leading_cols + 2].Text);
			e.Row.Cells[leading_cols + 3].BackColor = GetCellColor(e.Row.Cells[leading_cols + 3].Text);
			e.Row.Cells[leading_cols + 4].BackColor = GetCellColor(e.Row.Cells[leading_cols + 4].Text);
			e.Row.Cells[leading_cols + 5].BackColor = GetCellColor(e.Row.Cells[leading_cols + 5].Text);
			e.Row.Cells[leading_cols + 6].BackColor = GetCellColor(e.Row.Cells[leading_cols + 6].Text);
			e.Row.Cells[leading_cols + 7].BackColor = GetCellColor(e.Row.Cells[leading_cols + 7].Text);
			e.Row.Cells[leading_cols + 8].BackColor = GetCellColor(e.Row.Cells[leading_cols + 8].Text);
			e.Row.Cells[leading_cols + 9].BackColor = GetCellColor(e.Row.Cells[leading_cols + 9].Text);
			e.Row.Cells[leading_cols + 10].BackColor = GetCellColor(e.Row.Cells[leading_cols + 10].Text);
			e.Row.Cells[leading_cols + 11].BackColor = GetCellColor(e.Row.Cells[leading_cols + 11].Text);
			e.Row.Cells[leading_cols + 12].BackColor = GetCellColor(e.Row.Cells[leading_cols + 12].Text);
			e.Row.Cells[leading_cols + 13].BackColor = GetCellColor(e.Row.Cells[leading_cols + 13].Text);
			e.Row.Cells[leading_cols + 14].BackColor = GetCellColor(e.Row.Cells[leading_cols + 14].Text);
			e.Row.Cells[leading_cols + 15].BackColor = GetCellColor(e.Row.Cells[leading_cols + 15].Text);
			e.Row.Cells[leading_cols + 16].BackColor = GetCellColor(e.Row.Cells[leading_cols + 16].Text);
			e.Row.Cells[leading_cols + 17].BackColor = GetCellColor(e.Row.Cells[leading_cols + 17].Text);
			e.Row.Cells[leading_cols + 18].BackColor = GetCellColor(e.Row.Cells[leading_cols + 18].Text);
			e.Row.Cells[leading_cols + 19].BackColor = GetCellColor(e.Row.Cells[leading_cols + 19].Text);
			e.Row.Cells[leading_cols + 20].BackColor = GetCellColor(e.Row.Cells[leading_cols + 20].Text);
			e.Row.Cells[leading_cols + 21].BackColor = GetCellColor(e.Row.Cells[leading_cols + 21].Text);
		}

	}

		public Color GetCellColor(string s)
		{
			Color c = Color.White;
			if (s != "" & s!="&nbsp;")
			{ 
			int x = Convert.ToInt16(s);

			if (x > 0 & x < 10) c = System.Drawing.ColorTranslator.FromHtml("#edf8fb");
				 else if (x > 0 & x < 20) c = System.Drawing.ColorTranslator.FromHtml("#ccece6");
				 else if (x >= 20 & x < 30) c = System.Drawing.ColorTranslator.FromHtml("#99d8c9");
				 else if (x >= 30 & x < 40) c = System.Drawing.ColorTranslator.FromHtml("#66c2a4");
				 else if (x >= 40 & x < 50) c = System.Drawing.ColorTranslator.FromHtml("#2ca25f");
				 else if (x >= 50) c = System.Drawing.ColorTranslator.FromHtml("#006d2c");

			}
			return (c);
		}

	void gv_RowDataBound(object sender, GridViewRowEventArgs e)
	{

		//Loop through these to find the years to show or hide


		GridView gv = (GridView)sender;


	}




	#region RECREATE CHARTS
	protected void SaveIntHxCharts_for_study(object sender, EO.Web.ProgressTaskEventArgs e)
	{
		SQL_utils sql = new SQL_utils();
		Debug.WriteLine(" here in SaveIntHxCharts_for_study");

		panelProgressBar.Visible = true;

		DataTable dt = GetIDs(Master.Master_studyID);

		int max =  dt.Rows.Count;

		int counter = 0;
		foreach (DataRow row in dt.Rows)
		{
			string id = row["id"].ToString();


			if (counter <= max + 1)
			{
				if (e.IsStopped)
					break;

				float pct = (float)counter / (float)max * 100 ;

				e.UpdateProgress((int)pct, id);

				if (counter >= 0)
				{
					int maxy = -999;
					if (string.IsNullOrWhiteSpace(txtMaxY.Text))
					{
						maxy = -999;
					}
					else
					{
						maxy = Convert.ToInt16(txtMaxY.Text);
					}
					Debug.WriteLine("MAKE CHART " + counter.ToString());
					//utilIntHx.SaveIntHxCharts(sql, Master.Master_studyID, id, Server.MapPath("~/stats/charts/"), rblPeriodType.SelectedValue, maxy);

					utilIntHx.SaveIntHxCharts(sql, Master.Master_studyID, id, Server.MapPath("~/stats/charts/"), "Timepoint", maxy);
					if(Master.Master_studyIDfull==90000)
					{
						utilIntHx.SaveIntHxCharts(sql, Master.Master_studyID, id, Server.MapPath("~/stats/charts/"), "TxStart", maxy);
					}

				}

			}
			counter++;

		}

		e.UpdateProgress(100, "Complete.");
		panelChart.Visible = true;

		sql.Close();
	}


	protected void CallbackPanel1_Execute(object sender, EO.Web.CallbackEventArgs e)
	{
		if (e.Parameter == "start")
		{
			e.Data = "start";
			ProgressBar1.Visible = true;

			//Perform additional action before RunTask e.g., Label1.Text =
			//"Performed additional action before RunTask starts!";
		}
		else if (e.Parameter == "done")
		{
			e.Data = "done";

			//Perform additional action after RunTask

			panelProgressBar.Visible = false;
			btnRecreate.Visible = true;
		}
	}
	#endregion RECREATE CHARTS



	#region DISPLAY CHARTS
	protected void DisplayIntHxCharts_for_study(int studyID)
	{
		panelChart.Controls.Clear();
		DataTable dt = GetIDs(studyID);

		string periodtype = rblPeriodType.SelectedValue;

		if (dt == null | dt.Rows.Count == 0 )
		{
			lblNORECS.Text = "No IntHx records for this study.";    
		}
		else
		{
			lblNORECS.Text = "";    

			foreach (DataRow row in dt.Rows)
			{
				string id = row["id"].ToString();


				List<string> selectedCharts = cblCHARTS.Items.Cast<System.Web.UI.WebControls.ListItem>()
					   .Where(li => li.Selected)
					   .Select(li => li.Value)
					   .ToList();

				//string path = Server.MapPath("~/stats/charts/");
				string path = ("~/stats/Charts/");

				//Literal lit = new Literal();
				//lit.Text = Server.MapPath("~/stats/Charts/");
				//panelChart.Controls.Add(lit);


				if (periodtype == "Timepoint" | periodtype == "Both")
				{
					utilIntHx.DisplayIntHxCharts( path, studyID, id, selectedCharts, "Timepoint", panelChart);
				}
				if (periodtype == "TxStart" | periodtype == "Both")
				{
					utilIntHx.DisplayIntHxCharts( path, studyID, id, selectedCharts, "TxStart", panelChart2);
				}

			}
		}
	}



	#endregion DISPLAY CHARTS

	protected DataTable GetIDs(int studyID)
	{
		DataTable dt = new DataTable();
		SQL_utils sql = new SQL_utils();


		if (studyID == 1011 | studyID == 1015 | studyID == 1022 | studyID == 1030)
		{
			dt = sql.DataTable_from_SQLstring("select  ID,   txgrp + '...' + ID + '...' + subjstatus as details " +
				" from uwautism_research_backend..vwmasterstatus_S_txgrp  where txgrp<>'' and ID in " +
					" (select tap_id from uwautism_research_backend..tbl_TxRandomAssign where tap_id not like '%x') and studyID=" +
					studyID.ToString() + " order by txgrp, ID");
		}
		else
		{
			dt = sql.DataTable_from_SQLstring("select   ID,   txgrp + '...' + ID + '...' + subjstatus as details " +
				" from uwautism_research_backend..vwmasterstatus_S_txgrp  where txgrp<>'' and studyID=" +
				studyID.ToString() + " order by txgrp, ID");
		}

		sql.Close();

		return dt;
	}



	protected void DisplaySummaryStats()
	{

		SQL_utils sql = new SQL_utils();

		DataSet ds = sql.DataSet_from_ProcName("spSCORE_ALL_MIND_IntHx_vers2_STACKED__getdata_for_DESCSTATS", sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));

		sql.Close();

		int dt_to_use = 0;

		if (rblLevel.SelectedValue == "txall") dt_to_use = 1;


		List<string> vars = new List<string> { rblLevel.SelectedValue, "period", "txgrp"  };

		DataTable dtout = utilStats.DataTable_DescStats_ByGroup(ds.Tables[dt_to_use], "ALL_MIND_IntHx_vers2_STACKED_by_PERIOD_CAT", vars, "stacked", true);

		GridView gv = new GridView();
		gv.DataSource = dtout;
		gv.DataBind();

		panelStats.Controls.Add(gv);

		//GVHistogram h = utilCharts.Histogram(ds.Tables[1], "avgPER_ihhrsperwk", 250, 250);
		//h.ID = "foo";
		//panelMS2.Controls.Add(h);
		
		panelMS2.Visible = true;


		Table t2 = utilCharts.Histograms_byRowLevel_byColLevel_Facet (ds.Tables[dt_to_use], "avgPER_ihhrsperwk", "txgrp","period",rblLevel.SelectedValue, 150, 150, "color", "");


		panelMS2.Controls.Add(t2);

		//foreach(DataTable dt in ds.Tables)
		//{

		//    DataTable dtout = utilStats.DataTable_DescStats(dt, false);

		//    GridView gv = new GridView();
		//    gv.DataSource = dtout;
		//    gv.DataBind();

		//    panelStats.Controls.Add(gv);
		//}

	}


	//public static DataTable NullToZero(DataTable dt)
	//{

	//    for (int i = 0; i < dt.Rows.Count; i++)
	//    {
	//        for (int j = 0; j < dt.Columns.Count; j++)
	//        {
	//            if (string.IsNullOrEmpty(dt.Rows[i][j].ToString()))
	//            {

	//                dt.Rows[i][j] = 0;
	//            }
	//        }
	//    }
	//    return dt;
	//}





	protected void savepdf(DataTable dt)
	{

		////using (HighChartsRenderServer server = new HighChartsRenderServer())
		////{
		////    var response = server.ProcessHighChartsRequest(highChartsData);
		////    return File(response, "image.png");
		////}


		MemoryStream ms = new MemoryStream();


		string filename = "IntHx_graphs.pdf";

		// Send the data and the appropriate headers to the browser
		Response.Clear();
		Response.AddHeader("content-disposition", "attachment;filename=" + filename);
		Response.ContentType = "application/pdf";

		Response.Cache.SetCacheability(HttpCacheability.NoCache);
		StringWriter sw = new StringWriter();
		HtmlTextWriter hw = new HtmlTextWriter(sw);
		panelChart.RenderControl(hw);
		StringReader sr = new StringReader(sw.ToString());

		iTextSharp.text.Rectangle page_rect = new iTextSharp.text.Rectangle(850f, 612f);
		Document pdfDoc = new Document(page_rect, 10f, 10f, 20f, 20f);
		//Document pdfDoc = new Document(PageSize.LETTER_LANDSCAPE, 10f, 10f, 20f, 20f);


		HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
		PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
		pdfDoc.Open();

		//List<string> list_svg = JsonConvert.DeserializeObject<List<string>>(hidSVG.Value).ToList<string>();   //.DeserializeObject<name>(jsonData);
		//for (int i = 0; i < list_svg.Count; i++)
		//{
		//    Server.HtmlDecode(list_svg[i], hw);  
		//}

		//htmlparser.Parse(sr);
		foreach (DataRow row in dt.Rows)
		{

			string id = row["id"].ToString();
			PdfPTable table = AddIntHxCharts(id);

			pdfDoc.Add(table);
		}



		pdfDoc.Close();
		Response.Write(pdfDoc);
		Response.End();

	}


	protected void testpdf(DataTable dt)
	{

		////using (HighChartsRenderServer server = new HighChartsRenderServer())
		////{
		////    var response = server.ProcessHighChartsRequest(highChartsData);
		////    return File(response, "image.png");
		////}


		MemoryStream ms = new MemoryStream();


		string filename = "IntHx_graphs.pdf";

		// Send the data and the appropriate headers to the browser
		Response.Clear();
		Response.AddHeader("content-disposition", "attachment;filename=" + filename);
		Response.ContentType = "application/pdf";

		Response.Cache.SetCacheability(HttpCacheability.NoCache);
		StringWriter sw = new StringWriter();
		HtmlTextWriter hw = new HtmlTextWriter(sw);
		panelChart.RenderControl(hw);
		StringReader sr = new StringReader(sw.ToString());

		iTextSharp.text.Rectangle page_rect = new iTextSharp.text.Rectangle(850f, 612f); 
		Document pdfDoc = new Document(page_rect, 10f, 10f, 20f, 20f);
		//Document pdfDoc = new Document(PageSize.LETTER_LANDSCAPE, 10f, 10f, 20f, 20f);

		
		HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
		PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
		pdfDoc.Open();

		//List<string> list_svg = JsonConvert.DeserializeObject<List<string>>(hidSVG.Value).ToList<string>();   //.DeserializeObject<name>(jsonData);
		//for (int i = 0; i < list_svg.Count; i++)
		//{
		//    Server.HtmlDecode(list_svg[i], hw);  
		//}
		
		//htmlparser.Parse(sr);
		foreach  (DataRow row in dt.Rows)
		{

			string id = row["id"].ToString();
			PdfPTable table = AddIntHxCharts(id);

			pdfDoc.Add(table);
		}

	

		pdfDoc.Close();
		Response.Write(pdfDoc);
		Response.End();

	}

	protected static PdfPTable AddIntHxCharts(string id)
	{

		string f0 = id + "c0.png";
		string f2 = id + "c2.png";
		string f3 = id + "c3.png";
		string f4 = id + "c4.png";

		string g0 = @"c:/code/Source/research/stats/Charts/" + f0;
		string g2 = @"c:/code/Source/research/stats/Charts/" + f2;
		string g3 = @"c:/code/Source/research/stats/Charts/" + f3;
		string g4 = @"c:/code/Source/research/stats/Charts/" + f4;

		float resize = 30f;

		iTextSharp.text.Image png0 = iTextSharp.text.Image.GetInstance(g0);
		png0.ScalePercent(resize);
		iTextSharp.text.Image png2 = iTextSharp.text.Image.GetInstance(g2);
		png2.ScalePercent(resize);
		iTextSharp.text.Image png3 = iTextSharp.text.Image.GetInstance(g3);
		png3.ScalePercent(resize);
		iTextSharp.text.Image png4 = iTextSharp.text.Image.GetInstance(g4);
		png4.ScalePercent(resize);

		float[] cellwidths = new float[] { 40f, 20f, 20f, 20f };

		PdfPTable table = new PdfPTable(cellwidths);
		table.DefaultCell.Border = iTextSharp.text.Rectangle.NO_BORDER;
		PdfPCell cell0 = new PdfPCell(png0);
		PdfPCell cell2 = new PdfPCell(png2);
		PdfPCell cell3 = new PdfPCell(png3);
		PdfPCell cell4 = new PdfPCell(png4);


		cell0.Border = iTextSharp.text.Rectangle.NO_BORDER;
		cell2.Border = iTextSharp.text.Rectangle.NO_BORDER;
		cell3.Border = iTextSharp.text.Rectangle.NO_BORDER;
		cell4.Border = iTextSharp.text.Rectangle.NO_BORDER;

		table.AddCell(cell0);
		table.AddCell(cell2);
		table.AddCell(cell3);
		table.AddCell(cell4);

		return table;

	}






	protected void Button_Command(object sender, CommandEventArgs e)
	{
		if (e.CommandName == "DisplayAll")
		{
			DisplayIntHxCharts_for_study(Master.Master_studyID);

			panelChart.Visible = true;

			panelProgressBar.Visible = false;
			btnRecreate.Visible = true;
		}

		else if (e.CommandName == "SaveAllPNG")
		{
			int studyID = Master.Master_studyID;

			
			//SaveIntHxCharts_for_study(studyID);

		}

		else if (e.CommandName == "RescoreAll")
		{

			SQL_utils sql = new SQL_utils();

			//For reference, when IntHx data is edited for individual cases, the
			//following is run:
			//

			// spSCORE_All_Mind_IntHx_vers2_STACKED ... 
			// spSCORE_All_Mind_IntHx_vers2_STACKED__Process ... 
			// spSCORE_All_Mind_IntHx_vers2_STACKED__Process_step0_by_wk ... 
			// spSCORE_ALL_MIND_IntHx_vers2_STACKED__Process_step1_AGGREGATE/_TxStart

			//Here. the last step is called directly to redo the aggregation.
			// For PATH this is done also based on the TxStart periods.
			string periodtype = rblPeriodType.SelectedValue;

			sql.NonQuery_from_SQLstring("exec spSCORE_ALL_MIND_IntHx_vers2_STACKED__Process_step1_AGGREGATE " + Master.Master_studyIDfull.ToString() + ", 0, '', 0, 'WHOLESTUDY'");


			if (Master.Master_studyIDfull == 90000 )
			{
				sql.NonQuery_from_SQLstring("exec spSCORE_ALL_MIND_IntHx_vers2_STACKED__Process_step1_AGGREGATE_TxStart " + Master.Master_studyIDfull.ToString() + ", 0, '', 0, 'WHOLESTUDY'");
			}


			sql.Close();

		}


		else if (e.CommandName == "Stats")
		{

			DisplaySummaryStats();
			panelChart.Visible = false;
			panelStats.Visible = true;
		}

		

	  

	}








	protected void btnRecreate_Click(object sender, EventArgs e)
	{
		btnRecreate.Visible = false;
		panelProgressBar.Visible = true;
	}


}