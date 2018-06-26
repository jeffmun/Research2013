using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;


public partial class Tracking_IDlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if(!IsPostBack)
        {

            SQL_utils sql = new SQL_utils("backend");

            DataTable dt = sql.DataTable_from_SQLstring("select labID, labname from vwLabGroup_staff where staffID = dbo.fnGetStaffIDByCurrentUser() group by labID, labname");

            ddlLab.DataTextField = "labname";
            ddlLab.DataValueField = "labID";
            ddlLab.DataSource = dt;
            ddlLab.DataBind();
        }

    }
}