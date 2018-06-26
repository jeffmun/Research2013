using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class DataEntryForms_GetNorms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            populateListBox();
        }
    }

    protected DataSet GetNormsTables()
    {
        SQL_utils sql = new SQL_utils();
        DataSet ds = new DataSet();

        // GetSelectedIndices
        foreach (int i in lstTables.GetSelectedIndices())
        {
            string tbl = lstTables.Items[i].Value.ToString();

            DataTable dt = sql.DataTable_from_SQLstring("select * from " + tbl);
            dt.TableName = tbl;

            ds.Tables.Add(dt);

        }
        sql.Close();
        return ds;
    }


    protected void populateListBox()
    {
        SQL_utils sql = new SQL_utils();


        DataTable dt = sql.DataTable_from_SQLstring("select table_name from vwNormsTables order by table_name");

        lstTables.DataSource = dt;
        lstTables.SelectionMode = ListSelectionMode.Multiple;
        lstTables.DataValueField = "table_name";
        lstTables.DataTextField = "table_name";

        lstTables.DataBind();
        sql.Close();
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        panelViewTables.Controls.Clear();
        DataSet ds = GetNormsTables();

        foreach(DataTable dt in ds.Tables)
        {
            GridView gv = new GridView();
            gv.DataSource = dt;
            gv.DataBind();

            Label l = new Label();
            l.Text = "<br/><br/>" + dt.TableName + "<br/>";
            l.Font.Bold = true;
            l.Font.Underline = true;

            panelViewTables.Controls.Add(l);
            panelViewTables.Controls.Add(gv);
        }

    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {
        DataSet ds = GetNormsTables();

        SpreadsheetGearUtils.SaveDataSetToExcel(ds, "norms_data", true, "xlsx");

    }
}