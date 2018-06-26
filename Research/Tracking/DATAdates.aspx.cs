using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
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



public partial class Tracking_DATAdates : System.Web.UI.Page
{
	public float progress;
	public bool inProcess = false;
	public bool processComplete = false;
	public int tickcounter;


	#region Page Events
	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);

		if (!IsPostBack)
		{
			//LoadTimepoints();
		}

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

		btnUpdateDataChk.Visible = false;
		ddlDataChk.Visible = false;
		panelGrid.Visible = false;
		lblStudyName.Text = Master.Master_studyname;

	}


	protected void Page_Load(object sender, EventArgs e)
	{
		//THIS??? ClientScript.GetPostBackEventReference(this, string.Empty);

		lblStudyName.Text = Master.Master_studyname;


		if (!IsPostBack)
		{

			PopulateNewIDDDL();
			//getTimepointSubj();
		}

	}
	#endregion




	protected void ddlNewID_SelectedIndexChanged(object sender, EventArgs e)
	{
		string id = ddlNewID.SelectedValue.ToString();

		ViewState["id"] = id;

		//getDATADates_by_Subject(id);

		getDATADates_for_subjects("single");


		getTimepointDates_by_Subject(id);

		SetDataChk(id);

	}

	protected void SetDataChk(string subjID)
	{
		SQL_utils sql = new SQL_utils("backend");

		int datachkID = sql.IntScalar_from_SQLstring("select datachkID from uwautism_research_backend..tblSubject where subjID= " + subjID);

		string str_datachkID = datachkID.ToString();
		//foreach(ListItem itm in ddlDataChk.Items)
		//{
		//    if(datachkID == itm.Value) itm.Selected=true;
		//}

		//        ddlDataChk.SelectedValue = ddlDataChk.Items.FindByValue(datachkID.ToString()).ToString();

		ddlDataChk.DataBind();

		//ddlDataChk.ClearSelection();
		ddlDataChk.Items.FindByValue(str_datachkID).Selected = true;

		btnUpdateDataChk.Visible = true;
		ddlDataChk.Visible = true;
		panelGrid.Visible = true;

		sql.Close();
	}

	protected void PopulateNewIDDDL()
	{
		SQL_utils sql = new SQL_utils("data");
		string s;

		s = "select 0 as subjID, ' --Select New ID--' IDtxt union select subjID, '[' + datachk  + '] ' + ID + " +
			" ' ' + groupname + ' ' + (case when studyID=1065 then coalesce('('+txgrp + ') ','  ') else ' ' end) + subjstatus + ' ' + coalesce(subjstatusdetail, '')  " + 
			" from uwautism_research_backend..vwMasterStatus_S_txgrp  where studyID = " + Master.Master_studyID.ToString() + " order by 2";

		DataTable dtIDs = sql.DataTable_from_SQLstring(s);

		ddlNewID.DataSource = dtIDs;
		ddlNewID.DataBind();

		//ddlDataChk.Items.FindByValue("-1").Selected = true;


		//DataTable dtChk = sql.DataTable_from_SQLstring("select -1 datachkID,
		//'--Select DataCheck Status--' datachk, -1 sortorder " +
		//    " union select datachkID, datachk, sortorder from uwautism_research_backend..tblDataChk_lkup order by sortorder");
		//ddlDataChk.DataSource = dtChk;
		//ddlDataChk.DataBind();


		sql.Close();
	}



	protected void getTimepointDates_by_Subject(string subjID)
	{
		SQL_utils sql = new SQL_utils();

		string IDtxt = ddlNewID.SelectedItem.Text;

		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studyIDfull", Master.Master_studyIDfull.ToString(), "int"));
		ps.Add(sql.CreateParam("subjID", subjID, "int"));

		DataTable dt = sql.DataTable_from_ProcName("def.spTimepointDates_by_Subject", ps);

		if (dt.Rows.Count > 0)
		{
			ogrid.DataSource = dt;
			ogrid.DataBind();
			panelGrid.Visible = true;
		}


		//if (ds.Tables[1].Rows.Count > 0) {
		//    ogrid2.DataSource = ds.Tables[1];
		//    ogrid2.DataBind();
		//    ogrid2.Visible = true;
		//}

		sql.Close();
	}




	protected void getDATADates_by_Subject(string subjID )
	{
		getDATADates_by_Subject(subjID, true, "");
	}

	protected void getDATADates_by_Subject(string subjID, string title)
	{
		getDATADates_by_Subject(subjID, true, title);
	}

	protected void getDATADates_by_Subject(string subjID, bool showIntHx, string title)
	{
		SQL_utils sql = new SQL_utils();


		string IDtxt = ddlNewID.SelectedItem.Text;

		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studyIDfull", Master.Master_studyIDfull.ToString(), "int"));
		ps.Add(sql.CreateParam("subjID", subjID, "int"));

		DataTable dt = sql.DataTable_from_ProcName("def.spDATADates_by_Subject", ps);

	   
		//see this for why it wasn't working in production:
		//http://stackoverflow.com/questions/7933830/asp-net-charting-control-not-working-on-production-server
		//I set the ChartImageHandler value in ISS to:
		//storage=memory;timeout=20;deleteAfterServicing=true;

		//System.Web.UI.DataVisualization.Charting.Chart chart =
		//utilMSCharts.MSGeom("point", dt, "datedone", "rnk", "measname",
		//"date", "numeric",
		//             "chartname", "Subject DATA Dates: " + IDtxt, "Date", "Measure", -999, -999, -999, -999, 1100, 800, "mytooltip");
		//if (chart != null)
		//{
		//    panelCharts.Controls.Add(chart);
		//}
		//else
		//{
		//    //there was an error
		//}


		
		string chartname = "chart" + subjID.ToString();
		string lchart = "";

		lchart = utilCharts.Highcharts_Line(chartname, dt, "datedone", "rnk", "measname", "date", "Subject DATA Dates: " + title,
					"Admin Date", "Measure", 900, 500, "delink");

		Literal lit = new Literal();
		lit.Text = lchart;
		panelCharts.Controls.Add(lit);


		string ID = sql.StringScalar_from_SQLstring("select ID from uwautism_research_backend..tblSubject where subjID=" + subjID);

		if (showIntHx)
		{
			DisplayIntHxCharts(Master.Master_studyID, ID);
		}

		sql.Close();

	}



	protected void getDATADates_for_subjects_with_PROGRESS(object sender, EO.Web.ProgressTaskEventArgs e)
	{
		string mode = rblMode.SelectedValue;

		DataTable dt_subj = new DataTable();
		SQL_utils sql = new SQL_utils("backend");
		int ddl_subjID = Convert.ToInt32(ddlNewID.SelectedValue);
		string ID = sql.StringScalar_from_SQLstring("select ID from uwautism_research_backend..tblSubject where subjID=" + ddl_subjID.ToString());



		if (mode == "single")
		{
			if (ddl_subjID > 0)
			{
				dt_subj = sql.DataTable_from_SQLstring("select  subjID, ID + ' ' + groupname +  ' ' + (case when studyID=1065 then coalesce('('+txgrp + ') ','  ') else ' ' end) + subjstatus + ' ' + coalesce(subjstatusdetail, '') as IDtxt " +
						" from vwMasterStatus_S_txgrp where studyID=" + Master.Master_studyID.ToString() + " and subjID=" + ddl_subjID.ToString());
			}

		}
		else if (mode == "ToDo" | mode == "Complete" | mode == "NeedFUP")
		{
			string s;

			s = "select subjID, '[' + datachk  + '] ' + ID + " +
				" ' ' + groupname + ' ' + (case when studyID=1065 then coalesce('('+txgrp + ') ','  ') else ' ' end) + subjstatus + ' ' + coalesce(subjstatusdetail, '') as IDtxt " +
				" from uwautism_research_backend..vwMasterStatus_S_txgrp  where studyID = " + Master.Master_studyID.ToString() + " and datachk='" + mode + "' order by 2";

			dt_subj = sql.DataTable_from_SQLstring(s);

		}
		else if (mode == "Active,Finished")
		{
			string s;

			s = "select subjID, '[' + datachk  + '] ' + ID + " +
				" ' ' + groupname + ' ' + (case when studyID=1065 then coalesce('('+txgrp + ') ','  ') else ' ' end) + subjstatus + ' ' + coalesce(subjstatusdetail, '') as IDtxt " +
				" from uwautism_research_backend..vwMasterStatus_S_txgrp  where studyID = " + Master.Master_studyID.ToString() + " and subjstatus in ('Active','Finished') order by 2";

			dt_subj = sql.DataTable_from_SQLstring(s);

		}
		else if (mode == "NOT Active,Finished")
		{
			string s;

			s = "select subjID, '[' + datachk  + '] ' + ID + " +
				" ' ' + groupname + ' ' + (case when studyID=1065 then coalesce('('+txgrp + ') ','  ') else ' ' end) + subjstatus + ' ' + coalesce(subjstatusdetail, '') as IDtxt " +
				" from uwautism_research_backend..vwMasterStatus_S_txgrp  where studyID = " + Master.Master_studyID.ToString() + " and subjstatus NOT in ('Active','Finished') order by 2";

			dt_subj = sql.DataTable_from_SQLstring(s);

		}



		sql.Close();

		panelProgressBar.Visible = true;


		int counter = 0;
		float max = (float)dt_subj.Rows.Count;
		foreach (DataRow row in dt_subj.Rows)
		{
			if (counter < 100)
			{
				string subjID = row["subjID"].ToString();
				string title = row["IDtxt"].ToString();
				getDATADates_by_Subject(subjID, false, title);

				
				float pct = (float)counter / (float)max * 100;

				e.UpdateProgress((int)pct);

			}
			counter++;
		}

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
		}
	}


	protected void getDATADates_for_subjects(string mode)
	{
		DataTable dt_subj = new DataTable();
		SQL_utils sql = new SQL_utils("backend");
		int ddl_subjID = Convert.ToInt32(ddlNewID.SelectedValue);
		string ID = sql.StringScalar_from_SQLstring("select ID from uwautism_research_backend..tblSubject where subjID=" + ddl_subjID.ToString());

		

		if (mode == "single")
		{

			if (ddl_subjID > 0)
			{
				dt_subj = sql.DataTable_from_SQLstring("select  subjID, ID + ' ' + groupname +  ' ' + (case when studyID=1065 then coalesce('('+txgrp + ') ','  ') else ' ' end) + subjstatus + ' ' + coalesce(subjstatusdetail, '') as IDtxt " +
						" from vwMasterStatus_S_txgrp where studyID=" + Master.Master_studyID.ToString() + " and subjID=" + ddl_subjID.ToString());
			}
			
		}
		else if (mode == "ToDo" | mode=="Complete" | mode=="NeedFUP")
		{   string s;

			s = "select subjID, '[' + datachk  + '] ' + ID + " +
				" ' ' + groupname + ' ' + (case when studyID=1065 then coalesce('('+txgrp + ') ','  ') else ' ' end) + subjstatus + ' ' + coalesce(subjstatusdetail, '') as IDtxt " +
				" from uwautism_research_backend..vwMasterStatus_S_txgrp  where studyID = " + Master.Master_studyID.ToString() + " and datachk='" + mode + "' order by 2";

			dt_subj = sql.DataTable_from_SQLstring(s);

		}
		else if (mode == "Active,Finished" )
		{
			string s;

			s = "select subjID, '[' + datachk  + '] ' + ID + " +
				" ' ' + groupname + ' ' + (case when studyID=1065 then coalesce('('+txgrp + ') ','  ') else ' ' end) + subjstatus + ' ' + coalesce(subjstatusdetail, '') as IDtxt " +
				" from uwautism_research_backend..vwMasterStatus_S_txgrp  where studyID = " + Master.Master_studyID.ToString() + " and subjstatus in ('Active','Finished') order by 2";

			dt_subj = sql.DataTable_from_SQLstring(s);

		}
		else if (mode == "NOT Active,Finished")
		{
			string s;

			s = "select subjID, '[' + datachk  + '] ' + ID + " +
				" ' ' + groupname + ' ' + (case when studyID=1065 then coalesce('('+txgrp + ') ','  ') else ' ' end) + subjstatus + ' ' + coalesce(subjstatusdetail, '') as IDtxt " +
				" from uwautism_research_backend..vwMasterStatus_S_txgrp  where studyID = " + Master.Master_studyID.ToString() + " and subjstatus NOT in ('Active','Finished') order by 2";

			dt_subj = sql.DataTable_from_SQLstring(s);

		}



		sql.Close();


		int counter = 0;
		foreach(DataRow row in dt_subj.Rows)
		{
			if (counter < 100)
			{
				string subjID = row["subjID"].ToString();
				string title = row["IDtxt"].ToString();
				getDATADates_by_Subject(subjID, false, title);
			}
			counter++;
		}



	}






	protected void DisplayIntHxCharts(int studyID, string id)
	{
		//string path = Server.MapPath("~/stats/charts/");

		//Table t = new Table();
		//TableRow r = new TableRow();



		//string chartfile = @"~/stats/Charts/ih" + studyID.ToString().ToLower() + id + "_type_wk.png";

		//System.Web.UI.WebControls.Image img = GetIntHxChart(chartfile);

		//TableCell cell = new TableCell();
		//cell.Controls.Add(img);
		//r.Cells.Add(cell);
		//t.Rows.Add(r);

		//panelCharts.Controls.Add(t);


		string path = Server.MapPath("~/stats/charts/");

	   
		if (studyID == 1065 | studyID == 1072)
		{
			utilIntHx.DisplayIntHxCharts(path, studyID, id, new List<string>{"_type_wk.png"}, "TxStart", panelCharts);
		}
		else        
		{
			utilIntHx.DisplayIntHxCharts(path, studyID, id, new List<string>{"_type_wk.png"}, "Timepoint", panelCharts);
		}








	}


	protected System.Web.UI.WebControls.Image GetIntHxChart(string chartfile)
	{
		int rand = new Random().Next(99999999);

		System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();
		img.ImageUrl = string.Concat(chartfile, '?', rand);

		return img;
	}




	protected void btnUpdateDataChk_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils("backend");


		sql.NonQuery_from_SQLstring("update tblsubject set datachkID = " + ddlDataChk.SelectedValue.ToString() + " where subjID = " +
			ddlNewID.SelectedValue.ToString());

		sql.Close();

		btnUpdateDataChk.Visible = false;
		ddlDataChk.Visible = false;
		panelGrid.Visible = false;

		PopulateNewIDDDL();

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


	protected void ogrid_UpdateCommand(object sender, GridRecordEventArgs e)
	{
		try
		{
			string x = "";
			oboutGrid_utils o = new oboutGrid_utils();
			x = o.oGrid_UpdateData(e.Record, "tbltimepointsubj", "backend", "dbo", "tpsID");

			getTimepointDates_by_Subject(ddlNewID.SelectedValue.ToString());

		}
		catch (Exception ) { }


	}
	protected void ogrid_Rebind(object sender, EventArgs e)
	{
		getTimepointDates_by_Subject(ddlNewID.SelectedValue.ToString());

	}

	protected void btnRefreshChart_Click(object sender, EventArgs e)
	{
		getDATADates_by_Subject(ddlNewID.SelectedValue.ToString());
	}

	protected void ogrid_RowDataBound(object sender, GridRowEventArgs e)
	{
		if(e.Row.RowType== GridRowType.DataRow)
		{
			if(e.Row.Cells[4].Text == "" )
			{
				e.Row.Cells[4].BackColor = Color.Red;
			}

		}
	}
	protected void btnALL_Click(object sender, EventArgs e)
	{
		getDATADates_for_subjects(rblMode.SelectedValue);
	}





	protected void Button_Command(object sender, CommandEventArgs e)
	{
		if (e.CommandName == "ShowALL_withPROGRESS")
		{
			//getDATADates_for_subjects_with_ (rblMode.SelectedValue);

			//DisplayIntHxCharts_for_study(Master.Master_studyID);
			panelProgressBar.Visible = true;
		}
	}
}


