using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Study_Tadpole_LO : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["id"] != "")
        {
            btnNew.Text = "Add new row for " + Request.QueryString["id"]; 
            btnNew.Visible = true;
        }

        loadLO();

    }

    protected void loadLO()
    {
        SQL_utils sql = new SQL_utils();

        DataTable dt = sql.DataTable_from_SQLstring("select id, count(*) n_clips, sum(case when coded>=0 then 1 else 0 end) as n_coded " +
                ", sum(case when lo_date is null and coded>=0 then 1 else 0 end) as n_missing_dates " +
                ", avg(coded) as avg_coded_score " +
                ", min(coded) as min_coded_score " +
                ", max(coded) as max_coded_score " +
                ", 'https://uwac.autism.washington.edu/research/study/tadpole/lo.aspx?id=' + id as link " +
                "from all_lo_tadpole group by ID  " +
                "order by id");

        gv1.DataSource = dt;
        gv1.DataBind();

        sql.Close();
        //DataTable dt2 = sql.DataTable_from_SQLstring("select tadlo_pk, id, lo_date, Month, ClipName, DeidentifiedName, Activity, Codeable, " + 
        //    " TimesCoded, AssignedTo, Coded, ReliabilityChecked, LCRate, rownum  " + 
        //    " from all_lo_tadpole");

        //gv2.DataSource = dt2;
        //gv2.DataBind();

    }







    protected void sql2_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        loadLO();
    }


    protected void gv1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var id_cell = e.Row.Cells[0].Text;

            // Retrieve the underlying data item. In this example
            // the underlying data item is a DataRowView object. 
            DataRowView rowView = (DataRowView)e.Row.DataItem;

            // Retrieve the state value for the current row. 


            String id = rowView["id"].ToString();

            if (id.StartsWith("D")) e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#E3F2FD");
            else if (id.StartsWith("W")) e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#D1F2EB");
            else if (id.StartsWith("V")) e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#B3E5FC");

            var k = 0;
            //if (date_cell == "&nbsp;" & coded_cell != "&nbsp;") e.Row.Cells[3].BackColor = System.Drawing.Color.Red;

        }
    }



    protected void gv2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType == DataControlRowType.DataRow)
        {
            var date_cell = e.Row.Cells[3].Text;
            var coded_cell = e.Row.Cells[11].Text;

            if (date_cell == "&nbsp;" & coded_cell != "&nbsp;") e.Row.Cells[3].BackColor = System.Drawing.Color.Red;

        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {

        SQL_utils sql = new SQL_utils();

        sql.NonQuery_from_SQLstring("insert into all_lo_tadpole (studymeasID, indexnum, id, clipname) values (1,1, '" + Request.QueryString["id"] + "', 'ENTER CLIP NAME')");

        sql.Close();

        gv2.DataBind();

    }
}