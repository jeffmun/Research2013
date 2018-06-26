using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Web.Services;
using System.Media;
//using DotNet.Highcharts;
//using DotNet.Highcharts.Options;
//using DotNet.Highcharts.Helpers;
//using DotNet.Highcharts.Enums;
//using Newtonsoft.Json;
//using SelectPdf;
//using System.IO;
//using Svg;
//using Tek4.Highcharts.Exporting;
using Obout.Grid;
using uwac;

public partial class DataEntryForms_Common_IntHxCat : System.Web.UI.Page
{

    //raise events on content page for the buttons on master page
    protected void Page_Init(object sender, EventArgs e)
    {
        Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
    }

    //If the master page default study is changed, update the Measure DDL
    protected void Master_Study_Changed(object sender, EventArgs e)
    {

    }


    protected void Page_Load(object sender, EventArgs e)
    {
        //Grid1.FolderStyle = "App_Obout/grid/styles/black_glass";
        //Grid1.FolderLocalization = "App_Obout/grid/localization";

        LoadTxType();
        //LoadTxCat();
    }



    protected void LoadTxAll()
    {
    }

    protected void LoadTxCat()
    {
        //SQL_utils sql = new SQL_utils("data");

        //DataTable dt = sql.DataTable_from_SQLstring("select * from const_MIND_IntHXv2_TxCat ");

        //DataSet ds = new DataSet();
        //ds.Tables.Add(dt);


        //GridTxCat.DataSource = ds.Tables[0];
        //GridTxCat.DataBind();
    }



    protected void LoadTxType()
    {
        SQL_utils sql = new SQL_utils("data");

        DataTable dt = sql.DataTable_from_SQLstring("select a.*, txcat from const_MIND_IntHXv2_TxType a join const_MIND_IntHxv2_TxCat b ON a.txcatID=b.txcatID");

        DataSet ds = new DataSet();
        ds.Tables.Add( dt);


        GridTxType.DataSource = ds.Tables[0];
        GridTxType.DataBind();
    }




    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            //string hexcolor = e.Row.Cells[3].Text;
            ////string color = "00DD00";

            //e.Row.BackColor = (Color)System.Drawing.ColorTranslator.FromHtml(@"#" + hexcolor);
        }
    }


    protected void Grid1_RowDataBound(object sender, Obout.Grid.GridRowEventArgs e)
    {
        if(e.Row.RowType == Obout.Grid.GridRowType.DataRow)
        {


            #region color stuff
            Hashtable hash = e.Row.ToHashtable();

            if (hash["txtypecolor"].ToString().Length == 6)
            {
                Color c = (Color)System.Drawing.ColorTranslator.FromHtml(@"#" + hash["txtypecolor"].ToString());
                //for (int i = 1; i < e.Row.Cells.Count; i++)
                for (int i = 1; i < 4; i++)
                {
                    if (i == 3)
                    {
                        e.Row.Cells[i].BackColor = c;
                    }
                    else
                    {
                        e.Row.Cells[i].BackColor = utilCharts.LightenColor(c, .4);
                    }
                }

                //e.Row.BackColor = (Color)System.Drawing.ColorTranslator.FromHtml(@"#" + hexcolor);
            }
            #endregion

        }
    }

    protected void GridTxAll_RowDataBound(object sender, Obout.Grid.GridRowEventArgs e)
    {
        if (e.Row.RowType == Obout.Grid.GridRowType.DataRow)
        {


            #region color stuff
            Hashtable hash = e.Row.ToHashtable();

            if (hash["txallcolor"].ToString().Length == 6)
            {
                Color call = (Color)System.Drawing.ColorTranslator.FromHtml(@"#" + hash["txallcolor"].ToString());

                e.Row.Cells[2].BackColor = call;

            }
            #endregion

        }
    }

    protected void GridTxCat_RowDataBound(object sender, Obout.Grid.GridRowEventArgs e)
    {
        if (e.Row.RowType == Obout.Grid.GridRowType.DataRow)
        {


            #region color stuff
            Hashtable hash = e.Row.ToHashtable();

            if (hash["txcatcolor"].ToString().Length == 6)
            {
                Color c = (Color)System.Drawing.ColorTranslator.FromHtml(@"#" + hash["txcatcolor"].ToString());
                Color call = (Color)System.Drawing.ColorTranslator.FromHtml(@"#" + hash["txallcolor"].ToString());
                //for (int i = 1; i < e.Row.Cells.Count; i++)

                e.Row.Cells[2].BackColor = utilCharts.LightenColor(c, .4);
                e.Row.Cells[3].BackColor = utilCharts.LightenColor(c, .4);
                e.Row.Cells[4].BackColor = c;

                e.Row.Cells[6].BackColor = call;

            }
            #endregion

        }
    }

    protected void color_postback(object sender, Obout.Ajax.UI.ColorPicker.ColorPostBackEventArgs e)
    {
        textbox.Style[HtmlTextWriterStyle.BackgroundColor] = e.Color;

        lblInfo.Text = e.Color.ToString();


        Color c = (Color)System.Drawing.ColorTranslator.FromHtml(e.Color);


        //lblInfo.Text += cc1.ToString() + " " + cc2.ToString() + " " + cc3.ToString() ; 

        l1.BackColor = utilCharts.LightenColor(c, .1);
        l2.BackColor = utilCharts.LightenColor(c, .2);
        l3.BackColor = utilCharts.LightenColor(c, .3);
        l4.BackColor = utilCharts.LightenColor(c, .4);
        l5.BackColor = utilCharts.LightenColor(c, .5);
        l6.BackColor = utilCharts.LightenColor(c, .6);
        l7.BackColor = utilCharts.LightenColor(c, .7);
        l8.BackColor = utilCharts.LightenColor(c, .8);
        l9.BackColor = utilCharts.LightenColor(c, .9);

        l1.Text = ColorTranslator.ToHtml(utilCharts.LightenColor(c, .1)).ToString();
        l2.Text = ColorTranslator.ToHtml(utilCharts.LightenColor(c, .2)).ToString();
        l3.Text = ColorTranslator.ToHtml(utilCharts.LightenColor(c, .3)).ToString();
        l4.Text = ColorTranslator.ToHtml(utilCharts.LightenColor(c, .4)).ToString();
        l5.Text = ColorTranslator.ToHtml(utilCharts.LightenColor(c, .5)).ToString();
        l6.Text = ColorTranslator.ToHtml(utilCharts.LightenColor(c, .6)).ToString();
        l7.Text = ColorTranslator.ToHtml(utilCharts.LightenColor(c, .7)).ToString();
        l8.Text = ColorTranslator.ToHtml(utilCharts.LightenColor(c, .8)).ToString();
        l9.Text = ColorTranslator.ToHtml(utilCharts.LightenColor(c, .9)).ToString();

    }




    protected void GridTxType_UpdateCommand(object sender, Obout.Grid.GridRecordEventArgs e)
    {

        string x = "";

        if (e.RecordsCollection != null)
        {
            foreach (Hashtable rec in e.RecordsCollection)
            {
                oboutGrid_utils o = new oboutGrid_utils();
                x = o.oGrid_UpdateData(rec, "const_MIND_IntHXv2_TxType", "data", "dbo", "txtypeID");
            }
        }
        else if (e.Record != null)
        {
            oboutGrid_utils o = new oboutGrid_utils();
            x = o.oGrid_UpdateData(e.Record, "const_MIND_IntHXv2_TxType", "data", "dbo", "txtypeID");

        }

        lblInfo.Text = x;
    }

    protected void GridTxAll_Rebind(object sender, EventArgs e)
    {
        LoadTxAll();
    }

    protected void GridTxType_Rebind(object sender, EventArgs e)
    {
        LoadTxType();
    }

    protected void GridTxCat_Rebind(object sender, EventArgs e)
    {
        LoadTxCat();
    }


    protected void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        //SQL_utils sql = new SQL_utils();

        oboutGrid_utils o = new oboutGrid_utils();

        o.oGrid_UpdateData(e.Record, "const_MIND_IntHXv2_TxCat", "data", "dbo", "txcatID");

        //sql.Close();

    }


    protected void UpdateRecordAll(object sender, GridRecordEventArgs e)
    {
        //SQL_utils sql = new SQL_utils();

        oboutGrid_utils o = new oboutGrid_utils();

        o.oGrid_UpdateData(e.Record, "const_MIND_IntHXv2_TxAll", "data", "dbo", "txallID");

        //sql.Close();

    }


}