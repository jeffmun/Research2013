using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Intake_Intake : System.Web.UI.Page
{

   uwac.Login oLogin = new uwac.Login("authelpX","UW!Autism");


    protected void Page_Load(object sender, EventArgs e)
    {
        //getinfo();
    }

    protected void getinfo()
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = sql.DataTable_from_SQLstring("select * from tblstudy");

        GridView gv = new GridView();
        gv.DataSource = dt;
        gv.DataBind();

        panel.Controls.Add(gv);
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        getinfo();
    }
}