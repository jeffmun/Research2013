using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Info_netid_request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckInfo();
    }

    protected void CheckInfo()
    {
        SQL_utils sql = new SQL_utils("backend");

        GridView gv = new GridView();
        DataTable dt = sql.DataTable_from_SQLstring("exec spNETIDinfo_SELECT");

        if (dt.Rows.Count > 0)
        {
            gv.DataSource = dt;
            gv.DataBind();
            panel_submitted.Controls.Add(gv);
            panel_submitted.Visible = true;


            string UWregID = dt.Rows[0].ItemArray[10].ToString();

            if(UWregID.Length>1)
            {
                panel_ready.Visible = true;

            }
            else
            {
                panel_notready.Visible = true;

            }

            panel_input.Visible = false;
        }
    }



    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        SQL_utils sql = new SQL_utils("backend");

        List<SqlParameter> ps = new List<SqlParameter>();

        ps.Add(sql.CreateParam("idtype", ddlIDtype.SelectedValue , "text"));
        ps.Add(sql.CreateParam("idissuedby", txtIssuedBy.Text , "text"));
        ps.Add(sql.CreateParam("idnumber", txtIDnumber.Text , "text"));
        ps.Add(sql.CreateParam("idexpiredate", txtIDexpiredate.Text , "text"));
        ps.Add(sql.CreateParam("fname", txtfirst.Text , "text"));
        ps.Add(sql.CreateParam("mname", txtmiddle.Text , "text"));
        ps.Add(sql.CreateParam("lname", txtlast.Text  , "text"));
        ps.Add(sql.CreateParam("dob", txtdob.Text  , "text"));
        ps.Add(sql.CreateParam("currentemail", txtemail.Text, "text"));

        sql.NonQuery_from_ProcName("spNETIDinfo_INSERT", ps);

        


        GridView gv = new GridView();
        DataTable dt = sql.DataTable_from_SQLstring("exec spNETIDinfo_SELECT");
        
        if(dt.Rows.Count > 0)
        {
            panel_input.Visible = false;

            gv.DataSource = dt;
            gv.DataBind();
            panel_submitted.Controls.Add(gv);
            panel_submitted.Visible = true;
        }
        else
        {
            lblVerify.Text = "The may have been a problem saving your info.  Contact Jeff at 425-478-0920.";
            panel_submitted.Visible = true;
        }
    }
}