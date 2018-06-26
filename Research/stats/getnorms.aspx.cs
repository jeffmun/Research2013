using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class stats_getnorms : System.Web.UI.Page
{
    private SQL_utils sql = new SQL_utils();
    private DataSet dset = new DataSet();

    protected void Page_Init(object sender, EventArgs e)
    {
 
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadNormsTables();
        }
    }


    protected void LoadNormsTables()
    {
        DataTable dt = sql.DataTable_from_SQLstring("select table_name from uwautism_research_data.information_schema.tables where table_name like 'norm%' order by table_name");

        gvTables.DataSource = dt;
        gvTables.DataBind();

    }


    //protected List<subjectSubset> GetSelectedSubjects(GridView gv)
    protected List<string> GetSelectedTables()
    {
        List<string> tables_csv = new List<string>();

        //Loop though each row of the grid and collect the checked ones into a SQL where clause for group and subjstatus
        foreach (GridViewRow row in gvTables.Rows)
            {

                CheckBox chk = (CheckBox)row.FindControlRecursive("chk");        
                if(chk.Checked) tables_csv.Add(row.Cells[1].Text );
        }

        return tables_csv;
    }



    protected void btnView_Click(object sender, EventArgs e)
    {
        //List<string> x = GetSelectedTables();

        //lblInfo.Text += x;

        LoadDset();
        Panel.Controls.Clear();
        Panel.Visible = true;

        foreach (DataTable dt in dset.Tables)
        {
            Label lbl = new Label();
            lbl.Font.Bold = true;
            lbl.Text = "<br/><br/>" + dt.TableName + " (Number of rows = " + dt.Rows.Count.ToString() + ") <br/>";
            Panel.Controls.Add(lbl);

            GridView gv = new GridView();
            int n = Convert.ToInt32(txtN.Text);
            if (n > 0)
            {
                var qryN = dt.AsEnumerable().Take(n);
                DataTable dtN = qryN.CopyToDataTable();
                gv.DataSource = dtN;
                gv.DataBind();
                Panel.Controls.Add(gv);
            }
        }
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        LoadDset();
        SpreadsheetGearUtils.SaveDataSetToExcel(dset, "norms_tables");

    }

    protected void LoadDset()
    {
        dset.Tables.Clear();

        List<string> t = GetTableNames(gvTables, "chk", 1);

        foreach(string s in t)
        {
            DataTable dt = sql.DataTable_from_SQLstring("select * from uwautism_research_data.." + s);

            dt.TableName = s ;
            dset.Tables.Add(dt);

        }

    }

    protected List<string> GetTableNames(GridView myGV, string chkboxName, int colNumber)
    {
        List<string> tblnames = new List<string>();

        foreach (GridViewRow row in gvTables.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControlRecursive(chkboxName);

            if (chk != null)
            {
                if (chk.Checked)
                {
                    string tblname = row.Cells[colNumber].Text;
                    tblnames.Add(tblname); 
                }
            }

        }
        return tblnames;
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        LoadNormsTables();
        Panel.Visible = false;
    }
}