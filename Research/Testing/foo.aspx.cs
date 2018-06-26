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
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;
using uwac;
using uwac_controls;


public partial class Testing_foo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        HitDB1();
        HitDB2();

    }

    protected void HitDB1()
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = sql.DataTable_from_SQLstring("select * from tblstaff where actdirID='jeffmun'");

        gv1.DataSource = dt;
        gv1.DataBind();

    }

    protected void HitDB2()
    {
        SQL_utils sql = new SQL_utils("vbackend");

        DataTable dt = sql.DataTable_from_SQLstring("select * from tblstaff where actdirID='jeffmun'");

        if (dt.Rows.Count >= 1)
        {
            gv2.DataSource = dt;
            gv2.DataBind();
            lbl2.Text = "ok";

        }
        else
        {
            lbl2.Text = "dt was null.";
        }

    }


}