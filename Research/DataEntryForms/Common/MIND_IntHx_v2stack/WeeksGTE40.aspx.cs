﻿using System;
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
using System.Web.Services;
//using DotNet.Highcharts;
//using DotNet.Highcharts.Options;
//using DotNet.Highcharts.Helpers;
//using DotNet.Highcharts.Enums;
//using Newtonsoft.Json;
//using SelectPdf;
//using System.IO;
//using Svg;
//using Tek4.Highcharts.Exporting;
using uwac;

public partial class DataEntryForms_Common_MIND_IntHx_v2stack_WeeksGTE40 : System.Web.UI.Page
{

	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("~/dataentryforms/common/MIND_IntHx_v2stack/WeeksGTE40.aspx");
	}


	protected void Page_Load(object sender, EventArgs e)
	{

		LoadWeeksGTE40();
	}

	protected void LoadWeeksGTE40()
	{
		SQL_utils sql = new SQL_utils();

		string sqlcode = String.Format("select a.ID, b.*, 'https://uwac.autism.washington.edu/research/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx?id=' + id as link " +
			" from (select * from uwautism_research_backend.trk.vwMasterStatus_S where  studyID = {0} ) a " + 
			" left join (select * from vwALL_MIND_IntHx_vers2_STACKED_by_wk_WKLYTOTAL_40plus_2018 where NwksGTE40 > 0  ) b ON a.personID=b.personID  " +
			" where coalesce(NwksGTE40,0) > 0 order by NwksGTE40 desc ", Master.Master_studyID.ToString());

		DataTable dt = sql.DataTable_from_SQLstring(sqlcode );

		GridView1.DataSource = dt;
		GridView1.DataBind();

		string sqlcode2 = String.Format("select a.ID, b.*, 'https://uwac.autism.washington.edu/research/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx?id=' + id as link " +
			" from (select * from uwautism_research_backend.trk.vwMasterStatus_S where  studyID = {0} ) a " +
			" left join (select * from vwALL_MIND_IntHx_vers2_STACKED_by_wk_WKLYTOTAL_40plus_2018 where NwksGTE40 = 0  ) b ON a.personID=b.personID  " +
			" where coalesce(NwksGTE40,0) = 0 order by ID ", Master.Master_studyID.ToString());

		DataTable dt2 = sql.DataTable_from_SQLstring(sqlcode2);

		GridView2.DataSource = dt2;
		GridView2.DataBind();



	}
}