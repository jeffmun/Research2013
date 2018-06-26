using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class AC_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        SQL_utils sql = new SQL_utils("publicweb");

        DataTable dt = sql.DataTable_from_SQLstring("select * from flds");

        GridView gv = new GridView();
        gv.DataSource = dt;
        gv.DataBind();

        panel.Controls.Add(gv);

    }
}