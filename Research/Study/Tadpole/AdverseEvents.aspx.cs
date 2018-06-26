using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Study_Tadpole_AdverseEvents : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);


    }

    protected void Master_Study_Changed(object sender, EventArgs e)
    {
        Response.Redirect("~/Study/Tadpole/AdverseEvents.aspx");

    }


    protected void Page_Load(object sender, EventArgs e)
    {
   
        LoadAdvEvents();

    }

    protected void LoadAdvEvents()
    {
         if (Master.Master_studyID == 1076)
        {
            lblStudyname.Text = Master.Master_studyname + " (select Tadpole_TX above to view these)";
        }
         else
         {
            lblStudyname.Text = Master.Master_studyname;
         }

        SQL_utils sql = new SQL_utils();


        DataTable dt = sql.DataTable_from_SQLstring("select * from vwALL_AdverseEvents where studyID = " + Master.Master_studyID.ToString() + " and isSerious='serious' order by event_date desc");

        gv.DataSource = dt;
        gv.DataBind();


        DataTable dt2 = sql.DataTable_from_SQLstring("select * from vwALL_AdverseEvents where studyID = " + Master.Master_studyID.ToString() + " and isSerious<>'serious'  order by event_date desc");

        gv2.DataSource = dt2;
        gv2.DataBind();


        sql.Close();

    }
}