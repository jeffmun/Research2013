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



public partial class Tracking_TimepointSubj : System.Web.UI.Page
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

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        //this.Page.ClientScript.GetPostBackEventReference(<a control>, string.Empty);
    }

    //If the master page default study is changed, update the Measure DDL
    protected void Master_Study_Changed(object sender, EventArgs e)
    {
        getTimepointSubj();

    }


    protected void Page_Load(object sender, EventArgs e)
    {
        //THIS??? ClientScript.GetPostBackEventReference(this, string.Empty);
        

        if (!IsPostBack)
        {
            getTimepointSubj();
        }

    }
    #endregion


    protected void getTimepointSubj()
    {
        SQL_utils sql = new SQL_utils();


        DataTable dt = sql.DataTable_from_SQLstring("select * from vwPATH_session_dates_WIDE order by txgrp, daysT1T2 DESC, ID");

        DataTable dt_avg = sql.DataTable_from_SQLstring("select * from vwPATH_session_dates_WIDE_AVG");


        DataTable dtA = sql.DataTable_from_SQLstring("select * from vwPATH_session_dates where txgrp = 'A'");
        DataTable dtB = sql.DataTable_from_SQLstring("select * from vwPATH_session_dates where txgrp = 'B'");


        //see this for why it wasn't working in production:
        //http://stackoverflow.com/questions/7933830/asp-net-charting-control-not-working-on-production-server
        //I set the ChartImageHandler value in ISS to:
        //storage=memory;timeout=20;deleteAfterServicing=true;

        System.Web.UI.DataVisualization.Charting.Chart cA = utilMSCharts.MSGeom("point", dtA, "date", "rankID", "id_subjstatus", "date", "numeric",
                     "chartname", "PATH Dates: group A", "Date", "PATH ID", -999, -999, -999, -999, 1000, 1000, "mytooltip");
        panelCharts.Controls.Add(cA);

        System.Web.UI.DataVisualization.Charting.Chart cB = utilMSCharts.MSGeom("point", dtB, "date", "rankID", "id_subjstatus", "date", "numeric",
                     "chartname", "PATH Dates: group B", "Date", "PATH ID", -999, -999, -999, -999, 1000, 1000, "mytooltip");

        ogrid.DataSource = dt;
        ogrid.DataBind();

        panelCharts.Controls.Add(cB);

        GridView gv = new GridView();
        gv.DataSource = dt_avg;
        gv.DataBind();
        gv.Font.Size = 12;

        panel1.Controls.Add(gv);

        sql.Close();

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

}
