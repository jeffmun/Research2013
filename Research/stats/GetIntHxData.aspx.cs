using System;
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
using DotNet.Highcharts;
using DotNet.Highcharts.Options;
using DotNet.Highcharts.Helpers;
using DotNet.Highcharts.Enums;
using SelectPdf;
using System.IO;
using uwac;


public partial class stats_GetIntHxData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GetData()
    {
        int studyID = Master.Master_studyID;

        SQL_utils sql = new SQL_utils();

        List<SqlParameter> ps = new List<SqlParameter>();

        int getall = (chkGetAll.Checked) ? 1 : 0; // if checked then get data from all associated studies

        ps.Add( sql.CreateParam("studyID", studyID.ToString(), "int"));
        ps.Add( sql.CreateParam("getall", getall.ToString(), "int"));


        DataSet ds = sql.DataSet_from_ProcName("spMIND_IntHx_vers2_EXTRACT", ps);

        List<string> tblnames = new List<string> {"byTxCat_Period", "byTxCat_Month", "byTxType_Period", "byTxType_Month"};

        string datainfo = "";
        int counter=0;
        foreach(DataTable dt in ds.Tables)
        {

            datainfo += "Worksheet " + tblnames[counter]  + " has " + dt.Rows.Count.ToString() + " rows.<br/>";
            dt.TableName = tblnames[counter];
            counter++;

        }

        Literal lit = new Literal();
        lit.Text = datainfo;
        Panel1.Controls.Add(lit);

        string studyname = Master.Master_studyname;
        SpreadsheetGearUtils.SaveDataSetToExcel(ds, "IntHxData_" + studyname + "", true, "xlsx");


    }

    protected void btnGetData_Click(object sender, EventArgs e)
    {
        GetData();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
}