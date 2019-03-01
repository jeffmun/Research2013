using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// Imports needed for R
using System.Threading;
using System.IO;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
//using RDotNet;
//using RDotNet.NativeLibrary;
using RedcapLibrary;
using uwac;
using uwac_REDCap;
using DevExpress.Web;
using DevExpress.XtraCharts.Web;
using DevExpress.XtraCharts;
using System.Data.SqlClient;
//using uwac_REDCap;

public partial class Reports_SleepSummary : BasePage
{

	protected void Page_Load(object sender, EventArgs e)
	{

		if (Master.Master_studyID > 0)
		{
			LoadSubjects();
			LoadStudymeas();
		}

		
	}


	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("SleepSummary.aspx");
	}


	protected void LoadSubjects()
	{
		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = String.Format("select subjID, ID from trk.vwMasterStatus_S where studyID={1}"
			, Master.Master_studyname, Master.Master_studyID.ToString());
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		cboSubject.DataSource = dt;
		cboSubject.ValueField = "ID";
		cboSubject.TextField = "ID";
		cboSubject.DataBind();
		sql.Close();
	}



	protected void LoadStudymeas()
	{
		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = String.Format("select studymeasID, studymeasname from tblStudymeas where measureID=4853 and studyID={1}"
			, Master.Master_studyname, Master.Master_studyID.ToString());
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		cboStudymeas.DataSource = dt;
		cboStudymeas.ValueField = "studymeasID";
		cboStudymeas.TextField = "studymeasname";
		cboStudymeas.DataBind();
		sql.Close();
	}


	protected void ActigraphPlots()
	{
		panel.Controls.Clear();

		SQL_utils sql = new SQL_utils("data");

		int iswake_negvalue = -15;
		int cap_activity = 2000;
		int cap_whitelight = 300;
		int scaleto_activity = 100;
		int scaleto_whitelight = 100;


		lblSetupInfo.Text = String.Format("Activity capped at {0}, White light capped at {1}<br/>Activity scaled 0:{2}, White light scaled 0:{3}"
			, cap_activity, cap_whitelight, scaleto_activity, scaleto_whitelight);

		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("id", cboSubject.Value.ToString(), "text"));
		ps.Add(sql.CreateParam("smID_epoch", cboStudymeas.Value.ToString(), "int"));
		ps.Add(sql.CreateParam("cap_activity", cap_activity.ToString(), "int"));
		ps.Add(sql.CreateParam("cap_whitelight", cap_whitelight.ToString(), "int"));
		ps.Add(sql.CreateParam("iswake_neg_value", iswake_negvalue.ToString(), "int"));

		

		DataSet ds = sql.DataSet_from_ProcName("spActigraphData" , ps);
		ds.Tables[0].TableName = "epoch";
		ds.Tables[1].TableName = "stats";



		DxActogramSettings s = new DxActogramSettings();
		s.W = 1200;
		s.H = 300;
		s.seriesby = "id";
		s.xaxisvar = "time_of_day";
		s.xaxis_is_date = true;

		s.AddVarsFromList(new List<string>() { "activity", "is_wake", "white_light" });
		//Changed Feb 2019
		//s.numvars = new List<string>() { "activity", "is_wake", "white_light"};
		s.colorvar = "variable";
		s.panelvar = "report_date";
		s.colors = Actigraph.colors;
		s.legend_pos_h = "RightOutside";
		s.legend_pos_v = "Top";
		s.maxy = scaleto_whitelight;
		s.miny = iswake_negvalue;
		s.maxCol = 1;
		s.geom = LineplotGeom.Bar;
		s.altgeom = LineplotGeom.Star;
		s.vars_for_altgeom = new List<string> { "white_light" };
		s.markersize = 8;
		
	

		DxHistogramSettings hist = new DxHistogramSettings((DxChartSettings)s);
		hist.AddVarsFromList(new List<string>() { "activity", "white_light" });
		//Changed Feb 2019
		//hist.numvars = new List<string>() { "activity", "white_light" };
		hist.W = 400; hist.H = 200;
		hist.colors = Actigraph.colors;

		DxChartOrder order = new DxChartOrder();
		order.list_settings.Add(s);
		order.list_settings.Add(hist);

		
		DataTable stats1 = utilStats.DataTable_DescStats(ds.Tables["epoch"], true);

		ds.Tables["epoch"].RescaleColumn("activity", 0, scaleto_activity);
		ds.Tables["epoch"].RescaleColumn("white_light", 0, scaleto_whitelight);

		DataTable stats2 = utilStats.DataTable_DescStats(ds.Tables["epoch"], true);


		DxChartFactory factory = new DxChartFactory(ds.Tables["epoch"], new List<DxChartOrder> { order });


		int counter = 0;

		foreach (DxChartOrder myorder in factory.orders)
		{
			foreach (DxChartBatch batch in myorder.batches)
			{
				if (batch.settings.outputtype == DxOutputtype.Actogram)
				{


					foreach (DxActogram ch in batch.charts)
					{
						XYDiagram xy = ch.xydiagram;
						xy.AxisX.DateTimeScaleOptions.MeasureUnit = DateTimeMeasureUnit.Hour;
						xy.AxisX.DateTimeScaleOptions.GridAlignment = DateTimeGridAlignment.Hour;
						xy.AxisX.Label.TextPattern = "{A:t}";

						DataTable dt = ds.Tables[1];
						 

						string date_txt = String.Format("{0}, {1}", ch.date_txt, Convert.ToDateTime(ch.date_txt).DayOfWeek.ToString());
						ch.SetMainTitle(date_txt);  //Place date in the title
						

						foreach (DataRow row in dt.Rows)
						{
							DateTime rpt_date = Convert.ToDateTime(row["report_date"].ToString());
							if (rpt_date ==  Convert.ToDateTime(date_txt))
							{
								Actigraph.ActogramStats stats = new Actigraph.ActogramStats(row);
								ch.AnnotateActogram(stats);
								counter++;
							}
						}

					}

					batch.SetYAxisRange();
					batch.SetXAxisRange_1day();

				}
				else
				{
					foreach (DxChart ch in batch.charts)
					{
						XYDiagram xy = ch.xydiagram;
						xy.AxisX.Label.TextPattern = "{A:n}";
					}
				}

				System.Web.UI.WebControls.Table t = LayoutOutput.LayoutBatch(batch);
				panel.Controls.Add(t);
			}
		}


		gridDaily.DataSource = ds.Tables[1];
		gridDaily.DataBind();
		gridDaily.Visible = true;


		//DxChartOrder order2 = LinePlot_BedTimes();
		//DxChartFactory fatory2 = new DxChartFactory(ds.Tables["stats"], order2);


	}


	

	//protected DxChartOrder LinePlot_BedTimes()
	//{


	//	DxLineplotSettings s = new DxLineplotSettings();
	//	s.W = 1200;
	//	s.H = 300;
	//	s.seriesby = "id";
	//	s.xaxisvar = "report_date";
	//	s.xaxis_is_date = true;
	//	s.numvars = new List<string>() { "rest_starttime", "rest_endtime", "sleep_starttime", "sleep_endtime" };
	//	s.colorvar = "variable";
	//	s.colors = new List<Color>() { Color.Green, Color.Blue };
	//	s.legend_pos_h = "RightOutside";
	//	s.legend_pos_v = "Top";
	//	s.maxCol = 1;
	//	s.geom = LineplotGeom.Line;
	//	s.altgeom = LineplotGeom.Square;
	//	s.vars_for_altgeom = new List<string> { "rest_starttime", "rest_endtime" };
	//	s.markersize = 8;

	//	DxChartOrder order = new DxChartOrder() { settingsline = s };
	//	return order;
	//}



	protected void btnLoad_Click(object sender, EventArgs e)
	{

		if (cboSubject.Value != null & cboStudymeas.Value != null)
		{
			ActigraphPlots();
		}
		
	}
}