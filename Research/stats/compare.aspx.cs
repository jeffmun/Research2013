using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class stats_compare : System.Web.UI.Page
{
    private SQL_utils sql = new SQL_utils();
    private DataTable dt_tables = new DataTable();
    private DataTable dt_match = new DataTable();
    private DataTable dt_rows = new DataTable();
    private DataTable dt_cols = new DataTable();
    private DataSet dset = new DataSet();

    protected void Page_Init(object sender, EventArgs e)
    {
 
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //LoadDataTables();
        }
        else
        {
            if (ViewState["dt_tables"] != null) dt_tables = (DataTable)ViewState["dt_tables"] ;
            if (ViewState["dt_rows"] != null) dt_rows = (DataTable)ViewState["dt_rows"];
            if (ViewState["dt_cols"] != null) dt_cols = (DataTable)ViewState["dt_cols"];

        }
    }


    protected void btnView_Click(object sender, EventArgs e)
    {
        string sch = txtSchema.Text.ToString();
       
        LoadDataTables(GetDBfromSchema(sch), sch);
    }


    protected string GetDBfromSchema(string schema)
    {
        string db = "";
        switch (schema)
        {
            case "trk":
                db = "uwautism_research_backend";
                break;
            case "dat":
                db = "uwautism_research_data";
                break;
            case "ndar":
                db = "NDAR";
                break;

        }
        return db;
    }


    protected void LoadDataTables(string db, string schema)
    {

        string sql_list_o_tables = "select row_number() over(order by a.table_name) num, a.table_name " + 
            " from (select table_name from " + db + ".information_schema.tables ) a " +
            " join (select table_name from uwacdb.information_schema.tables where table_schema='" + schema + "') b ON a.table_name = b.table_name " + 
            " where a.table_name not like 'vw%' order by 2";

        dt_tables = sql.DataTable_from_SQLstring(sql_list_o_tables);

        gvTables.DataSource = dt_tables;
        gvTables.DataBind();

        ViewState["dt_tables"] = dt_tables;


        txtN2.Text = dt_tables.Rows.Count.ToString();
    }


    protected DataTable CompareTables(string tbl, string db, string schema)
    {
        string pk = sql.GetPKForTable("uwacdb", tbl, schema);
        string sql_comp = "select cast('" + tbl + "' as varchar(100)) tbl, n1, n2, cols1, cols2, dataDif, nrowsDif, cols1 - cols2 as colsDif " +
            " from " +
            "   ( select sum(row1) n1, sum(row2) n2, sum(row1) - sum(row2) as nrowsDif, sum(dif) dataDif    " +
            "      from                                                                                                              " +
            "      (select (case when pk1>0 then 1 else 0 end) as row1, (case when pk2>0 then 1 else 0 end) as row2                  " +
            "      , cast(checksum1 as bigint) - cast(checksum2  as bigint) as dif from                                              " +
            "      (select " + pk + " as pk1, checksum(*) checksum1 from " + db + ".." + tbl + ") a            " +
            "      full outer join                                                                                                   " +
            "      (select " + pk + " as pk2, checksum(*) checksum2 from uwacdb." + schema + "." + tbl + ") b ON a.pk1 = b.pk2 " +
            "   ) x " + 
            " ) y  " +
            " cross join (select count(*) cols1 from " + db + ".information_schema.columns where table_name = '" + tbl + "') c1 " +
            " cross join (select count(*) cols2 from uwacdb.information_schema.columns where table_name = '" + tbl + "' " + 
            "    and table_schema = '" + schema + "') c2  ";


        try
        {
            DataTable dt = sql.DataTable_from_SQLstring(sql_comp);
            return dt;
        }
        catch(Exception ex)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("tbl", typeof(string));
            dt.Columns.Add("n1", typeof(int));
            dt.Columns.Add("n2", typeof(int));
            dt.Columns.Add("cols1", typeof(int));
            dt.Columns.Add("cols2", typeof(int));
            dt.Columns.Add("dataDif", typeof(int));
            dt.Columns.Add("nrowsDif", typeof(int));
            dt.Columns.Add("colsDif", typeof(int));

            dt.Rows.Add(tbl, -111, -111, -111, -111, -111, -111, -111);

            lblInfo.Text += "ERROR: " + tbl + " : " + sql_comp + "  Msg: " + ex.Message;

            return dt;
        }
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
        //LoadDataTables();
        //Panel_results.Visible = false;
    }
    
    protected void btnCompare_Click(object sender, EventArgs e)
    {
        dt_match.Rows.Clear();
        dt_rows.Rows.Clear();
        dt_cols.Rows.Clear();


        int n1 = Convert.ToInt16(txtN1.Text.ToString());
        int n2 = Convert.ToInt16(txtN2.Text.ToString());

        for (int i = n1-1; i < n2; i++)
        {

            string tbl = dt_tables.Rows[i]["table_name"].ToString();
            //string tbl = local_dt.Rows[i][0].ToString();
            DataTable dt = CompareTables(tbl, GetDBfromSchema(txtSchema.Text), txtSchema.Text);


            //Mytable[0]["Field1"] = (myobject == null) ? DBNull.Value : myvalue;

            double s1 = (dt.Rows[0]["dataDif"] == DBNull.Value) ? -2 : Convert.ToDouble(dt.Rows[0]["dataDif"]);
            double s2 = (dt.Rows[0]["nrowsDif"] == DBNull.Value) ? -2 : Convert.ToDouble(dt.Rows[0]["nrowsDif"]);
            double s3 = (dt.Rows[0]["colsDif"] == DBNull.Value) ? -2 : Convert.ToDouble(dt.Rows[0]["colsDif"]);

            double sum = Math.Abs(s1) + Math.Abs(s2) + Math.Abs(s3); 
                
            if (sum == 0 & dt_match.Rows.Count == 0) dt_match = dt;
            else if (sum > 0 & s3 ==0 & dt_rows.Rows.Count == 0) dt_rows = dt;
            else if (sum > 0 & s3 > 0 & dt_rows.Rows.Count == 0) dt_cols = dt;
            else if (sum == 0)
            {
                var result = dt_match.AsEnumerable()
                            .Union(dt.AsEnumerable());
                dt_match = result.CopyToDataTable();
            }
            else if (sum > 0)
            {
                if (s3 != 0)
                {
                    var result = dt_cols.AsEnumerable()
                                .Union(dt.AsEnumerable());
                    dt_cols = result.CopyToDataTable();
                }
                else
                {
                    var result = dt_rows.AsEnumerable()
                                .Union(dt.AsEnumerable());
                    dt_rows = result.CopyToDataTable();

                }
            }
        }


        GridView gvMatch = new GridView();
        gvMatch.DataSource = dt_match;
        gvMatch.DataBind();
        Panel_match.Controls.Add(gvMatch);

        GridView gv_rows = new GridView();
        gv_rows.DataSource = dt_rows;
        gv_rows.DataBind();
        Panel_rows.Controls.Add(gv_rows);

        GridView gv_cols = new GridView();
        gv_cols.DataSource = dt_cols;
        gv_cols.DataBind();
        Panel_cols.Controls.Add(gv_cols);

        ViewState["dt_rows"] = dt_rows;
        ViewState["dt_cols"] = dt_cols;

    }
    protected void btnSave_Click1(object sender, EventArgs e)
    {
        DataSet dset = new DataSet();

        dt_rows.TableName = "rows_and_data";
        dt_cols.TableName = "cols";

        dset.Tables.Add(dt_rows);
        dset.Tables.Add(dt_cols);

        SpreadsheetGearUtils.SaveDataSetToExcel(dset, "DB_diffs" + txtSchema.Text, true, "xlsx");

    }


    protected void UpdateData(string db, string tbl, string schema)
    {
        string cols = sql.GetAllColumnsInTable(db, tbl, "dbo");
        string pk = sql.GetPKForTable(db, tbl, "dbo");
        
        string insSQL = "INSERT INTO uwacdb." + schema + "." + tbl + " (" + cols + ") " +
            " select " + cols + " from " + db + ".." + tbl + " where " + pk + " not in " +
            " (select " + pk + " from  uwacdb." + schema + "." + tbl + " )";


        string delSQL = "DELETE FROM uwacdb." + schema + "." + tbl + 
            "  where " + pk + " not in " +
            " (select " + pk + " from  " + db + ".dbo." + tbl + " )";


        string updateCols = sql.GetUpdateSQLForAllColumnsInTable(db, tbl, "dbo", pk);
        string updatePKs = sql.GetPKsOfUnequalRecords(db, tbl, schema);

        string updSQL = "UPDATE uwacdb." + schema + "." + tbl + " set " +
            updateCols + " from " + db + ".dbo." + tbl + " b" +
            " where uwacdb." + schema + "." + tbl + "." + pk + " = b." + pk + 
            " AND b." + pk + " IN (" + updatePKs + ")";


        sql.NonQuery_from_SQLstring("SET IDENTITY_INSERT uwacdb." + schema + "." + tbl + " ON");
        sql.NonQuery_from_SQLstring(insSQL);
        sql.NonQuery_from_SQLstring("SET IDENTITY_INSERT uwacdb." + schema + "." + tbl + " OFF");
        sql.NonQuery_from_SQLstring(delSQL);

        sql.NonQuery_from_SQLstring("DISABLE TRIGGER ALL ON " + schema + "." + tbl);
        sql.NonQuery_from_SQLstring(updSQL);
        sql.NonQuery_from_SQLstring("ENABLE TRIGGER ALL ON " + schema + "." + tbl);

       // lblInfo.Text = updateCols;

    }

    protected void btnUpdateData_Click(object sender, EventArgs e)
    {
        string db = GetDBfromSchema(txtSchema.Text);

        UpdateData(db, txtTbl.Text, txtSchema.Text);
    }
}