using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Testing_select2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       LoadLab();
    }


    protected void LoadLab()
    {
        SQL_utils sql = new SQL_utils("backend");
        DataTable dt = sql.DataTable_from_SQLstring("select top 20 labID, labname from tbllab");
        sql.Close();

        utilSelect2.loaditems(ddl, dt, "labID", "labname");

//        foreach(DataRow row in dt.Rows)
////        for (int i = 0; i < 10; i++)
//        {
//            ListItem l = new ListItem(row["labname"].ToString(), row["labID"].ToString());
//            ddl.Items.Add(l);
//        }

    }

    protected string  getitems()
    {
        string result="";
        // GET SELECTED ITEMS
        for (int i = 0; i <= ddl.Items.Count - 1; i++)
        {
            if (ddl.Items[i].Selected)
                result += "<br /> &nbsp;&nbsp" + ddl.Items[i].Text + " | " + ddl.Items[i].Value;
        }

        return result;
        //// SET SELECTED ITEMS
        //select1.Items[2].Selected = true;
        //select1.Items[4].Selected = true;
    }

    protected void btn_Click(object sender, EventArgs e)
    {

        string foo = ddl.Value.ToString();
        var foo2 = ddl.SelectedIndex;

        string csv_vals= utilSelect2.getselected_CSVval(ddl);
        string csv_txt = utilSelect2.getselected_CSVtxt(ddl);
        List<string> list_selected = utilSelect2.getselected_List(ddl);

        List<KeyValuePair<string, int>> kvp = utilSelect2.getselected_KVPList(ddl);

        DataTable dt_selected = utilSelect2.getselected_DataTable(ddl);


        lbl.Text = csv_vals + " - " + csv_txt;



    }
}