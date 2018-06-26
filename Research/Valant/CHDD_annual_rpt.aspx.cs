using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;
using Obout.Grid;

public partial class Valant_CHDD_annual_rpt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        
        //GetRptData(2014, panel1);
        //GetRptData(2015, panel2);
    }


    protected void GetRptData(string d1, string d2, Panel panel)
    {
            
        panel.Controls.Clear();
        SQL_utils sql = new SQL_utils("backend");
 

        List<SqlParameter> ps = new List<SqlParameter>();
        ps.Add(sql.CreateParam("d1", d1, "date"));
        ps.Add(sql.CreateParam("d2", d2, "date"));



        DataSet ds = sql.DataSet_from_ProcName("ac.spValant_CHDD_annual_report", ps);

        foreach(DataTable dt in ds.Tables)
        {
            GridView gv = new GridView();
            //Grid gv = new Grid();


            gv.RowDataBound += new GridViewRowEventHandler( gv_RowDataBound) ;

            gv.DataSource = dt;
            gv.DataBind();
            panel.Controls.Add(gv);

            Literal lit = new Literal();
            lit.Text = "<br/><br/>";
            panel.Controls.Add(lit);

        }
        
    }

    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType== DataControlRowType.DataRow)
        {
            if(e.Row.Cells[1].Text.Contains("**TOTAL"))
            {
                e.Row.BackColor = Color.LightSkyBlue;
            }
        }
    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {

        if (txtD1.Text != "" & txtD2.Text != "")
        {
            GetRptData(txtD1.Text, txtD2.Text, panel1);

        }

        if(txtD1_B.Text!="" & txtD2_B.Text != "")
        {
            GetRptData(txtD1_B.Text, txtD2_B.Text, panel2);

        }

    }
}