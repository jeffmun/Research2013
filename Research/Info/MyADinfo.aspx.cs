using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Text;
using AutismCenterBase.Utilities;
using System.IO;


public partial class Info_MyADinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindTheData();
    }


    protected void BindTheData()
    {
        //Response.Write("<script>alert('Binding...')</script>");

       // Gridview1.DataSource = SqlDataSource1;
        //Gridview1.DataBind();

        Gridview2.DataSource = SqlDataSource2;
        Gridview2.DataBind();

        Gridview3.DataSource = SqlDataSource3;
        Gridview3.DataBind();
    
        Gridview4.DataSource = SqlDataSource4;
        Gridview4.DataBind();
    }

    protected void OnDataBound(Object sender, System.EventArgs e)
    {
        //if (Gridview1.Rows.Count > 0)
        //{
        //    Response.Write("<script>alert('Gridview1.Rows.Count > 0')</script>");
        //}
        //else
        //{
        //    Response.Write("<script>alert('else')</script>");
        //}
    }


    protected void OnRowDataBound(Object sender, System.EventArgs e)
    {
       //Response.Write("<script>alert('onRowDatabound')</script>");
        
    }



}