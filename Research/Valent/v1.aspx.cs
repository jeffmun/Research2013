using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using uwac;


public partial class Valent_v1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (gridCPT.SelectedRecords != null)
            {
                string pk = "";
                foreach (Hashtable oRecord in gridCPT.SelectedRecords)
                {
                    foreach (DictionaryEntry d in oRecord)
                    {
                        if (d.Key.ToString() == "CPTcode")
                        {
                            pk = d.Value.ToString();
                        }
                    }
                }
            }


            LoadCPT();

        }

    }
        

    protected void LoadCPT()
    {
        SQL_utils sql = new SQL_utils("backend");
        DataTable dt = sql.DataTable_from_SQLstring("select a.*, ServiceType from ac.enumCPT a left join ac.enumServiceType b ON a.servicetypeID=b.servicetypeID");
        gridCPT.DataSource = dt;
        gridCPT.DataBind();
    }


    protected void gridCPT_InsertCommand(object sender, Obout.Grid.GridRecordEventArgs e)
    {

        SQL_utils sql = new SQL_utils();
        sql.NonQuery_from_SQLstring("insert into ac.enumCPT(CPTcode, servicetypeID, isVisit)" +
            " values('" + e.Record["CPTcode"].ToString() + "'," + e.Record["ServiceTypeID"].ToString() + "," + e.Record["isVisit"].ToString() + ")");

        sql.Close();

    }

    protected void gridCPT_UpdateCommand(object sender, Obout.Grid.GridRecordEventArgs e)
    {
        string x = "";
        if (e.RecordsCollection != null)
        {
            foreach (Hashtable rec in e.RecordsCollection)
            {
                oboutGrid_utils o = new oboutGrid_utils();
                x = o.oGrid_UpdateData(rec, "enumCPT", "backend", "ac", "pk");
            }
        }
        else if (e.Record != null)
        {
            oboutGrid_utils o = new oboutGrid_utils();
            x = o.oGrid_UpdateData(e.Record, "enumCPT", "backend", "ac", "pk");
        }
    }



    protected void gridServiceType_InsertCommand(object sender, Obout.Grid.GridRecordEventArgs e)
    {

    }



    protected void gridCPT_Rebind(object sender, EventArgs e)
    {
        LoadCPT();

    }
}