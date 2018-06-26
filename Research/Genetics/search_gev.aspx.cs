using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
//using AutismCenterBase.Utilities;
using uwac;
using System.IO;
using System.Drawing;
using System.Text;


public partial class genetics_search_gev : System.Web.UI.Page
{
    private DataSet dset_results = new DataSet();
    private DataTable dt_searchparams = new DataTable();
    private DataTable dt_searchresults = new DataTable();
    private SqlConnection oConn = new SqlConnection();
    //private SqlConnection oConnData = new SqlConnection();
    //private SqlConnection oConnGene = new SqlConnection();

    private Config_utils oConfig = new Config_utils();
    //private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();
   


    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            populate_ListBoxes();
            ListGeneEventFiles();
            
        }

        // retrieve from ViewState
        if (ViewState["dset_results"] != null) dset_results = (DataSet)ViewState["dset_results"];
        if (ViewState["dt_searchparams"] != null) dt_searchparams = (DataTable)ViewState["dt_searchparams"];
        if (ViewState["dt_searchresults"] != null) dt_searchresults = (DataTable)ViewState["dt_searchresults"];


    }


    protected void ListGeneEventFiles()
    {
        SQL_utils sql = new SQL_utils("backend");
        //DataTable dt = Master.DB.GetSQL("select filepk, filename, sheetname, numrows, numcols, uploaded, uploadedBy from gev.Files");
        DataTable dt = sql.DataTable_from_SQLstring("select filepk, filename, sheetname, numrows, numcols, uploaded, uploadedBy from gev.Files");



        gvFiles.DataSource = dt;
        gvFiles.DataBind();

        //int n = Master.DB.GetSQLScalar_int("select count(*) as n from gev.events");
        int n = sql.IntScalar_from_SQLstring("select count(*) as n from gev.events");
        lblNGeneEvents.Text = "Number of gene events in system: " + n.ToString();
    }



    protected void populate_ListBoxes()
    {

        populate_ListBox("select studyname, studyname + ' ..... N=' + cast(count(*) as varchar)   as txt from gev.vwEvents where studyname is not null group by studyname order by studyname", lstStudy, "studyname", "txt");
        populate_ListBox("select method, method + ' ..... N=' + cast(count(*) as varchar)   as txt from gev.vwEvents group by method", lstMethod, "method", "txt");
        populate_ListBox("select gene, gene+ '......N=' + cast(count(*) as varchar)   as txt from gev.vwEvents where gene is not null group by gene", lstGene, "gene", "txt");
        populate_ListBox("select region, region + ' ..... N=' + cast(count(*) as varchar)   as txt from gev.vwEvents where region is not null group by region", lstRegion, "region", "txt");
        populate_ListBox("select event_type, event_type + ' ..... N=' + cast(count(*) as varchar)   as txt from gev.vwEvents where event_type is not null group by event_type", lstEvent_type, "event_type", "txt");
        populate_ListBox("select inheritance, inheritance + ' ..... N=' + cast(count(*) as varchar)   as txt from gev.vwEvents where inheritance is not null group by inheritance", lstInheritance, "inheritance", "txt");


        //add study, gene, region 

    }

    protected void populate_ListBox(string sqltext, ListBox lst, string valuefld, string textfld)
    {

        DataTable dt = Master.SQL.DataTable_from_SQLstring(sqltext);

        lst.DataSource = dt;
        lst.DataValueField = valuefld;
        lst.DataTextField = textfld;

        lst.DataBind();
    }


    protected DataTable DataTable_from_ListBox(ListBox lst, string fld)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("fld", typeof(string));
        dt.Columns.Add("value", typeof(string));
        foreach(ListItem i in lst.Items)
        {
            if (i.Selected)
            {
                //lblInfo.Text += "foo";
                dt.Rows.Add(fld, i.Value.ToString());
            }
            else
            {
                //lblInfo.Text += "fum";
            }
        }

        return (dt);
    }


    //protected void btnFindID_Click(object sender, EventArgs e)
    //{
    //    FIND_GeneEvents_by_ID();
    //}

    //protected void FIND_GeneEvents_by_ID()
    //{
    //    if (txtIDToFind.Text.Length > 0)
    //    {
    //        SQL_utils sql = new SQL_utils("backend");


    //        string s = "select a.* from gev.vwSubjects_in_UW_studies_with_Names a " +
    //            "where personID in " +
    //            "(select personID from gev.vwSubjects_in_UW_studies where ID like '%" + txtIDToFind.Text + "%' )";

    //        DataTable dt = sql.DataTable_from_SQLstring(s);

    //        gv.DataSource = dt;
    //        gv.DataBind();

    //        lblInfo.Text = "";
    //    }
    //    else
    //    {
    //        lblInfo.Text = "";

    //        //Nothing to search
    //    }

    //}

    protected void FIND_GeneEvents()
    {
        SQL_utils sql = new SQL_utils("backend");
        lblResults.Text = "";

        #region perform the search in SQL
        DataTable dt1 = DataTable_from_ListBox(lstStudy, "studyname");
        DataTable dt2 = DataTable_from_ListBox(lstMethod, "method");
        DataTable dt3 = DataTable_from_ListBox(lstGene, "gene");
        DataTable dt4 = DataTable_from_ListBox(lstRegion, "region");
        DataTable dt5 = DataTable_from_ListBox(lstEvent_type, "event_type");
        DataTable dt6 = DataTable_from_ListBox(lstInheritance, "inheritance");

        SqlCommand sqlCmd = new SqlCommand("gev.spFIND_GeneEvents", sql.SqlConnection);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter param1 = sqlCmd.Parameters.AddWithValue("@studyname", dt1);
        SqlParameter param2 = sqlCmd.Parameters.AddWithValue("@method", dt2);       //Needed TVP
        SqlParameter param3 = sqlCmd.Parameters.AddWithValue("@gene", dt3);
        SqlParameter param4 = sqlCmd.Parameters.AddWithValue("@region", dt4);
        SqlParameter param5 = sqlCmd.Parameters.AddWithValue("@event_type", dt5);
        SqlParameter param6 = sqlCmd.Parameters.AddWithValue("@inheritance", dt6);

        param1.SqlDbType = SqlDbType.Structured; //tells ADO.NET we are passing TVP
        param2.SqlDbType = SqlDbType.Structured; 
        param3.SqlDbType = SqlDbType.Structured;
        param4.SqlDbType = SqlDbType.Structured;
        param5.SqlDbType = SqlDbType.Structured;
        param6.SqlDbType = SqlDbType.Structured;

        string txtparam3t = txtGene.Text ;
        string txtparam4t = txtRegion.Text;
        string txtparam5t = txtEvent_type.Text ;
        string txtparam6t = txtInheritance.Text ;
        string txtparamID = txtIDToFind.Text.Substring(0,15);

        SqlParameter param3t = sqlCmd.Parameters.AddWithValue("@txtgene"       ,  txtparam3t);
        SqlParameter param4t = sqlCmd.Parameters.AddWithValue("@txtregion"     ,  txtparam4t);
        SqlParameter param5t = sqlCmd.Parameters.AddWithValue("@txtevent_type" ,  txtparam5t);
        SqlParameter param6t = sqlCmd.Parameters.AddWithValue("@txtinheritance",  txtparam6t);
        SqlParameter param7t = sqlCmd.Parameters.AddWithValue("@IDsearch", txtparamID);

        param3t.SqlDbType = SqlDbType.VarChar;
        param4t.SqlDbType = SqlDbType.VarChar;
        param5t.SqlDbType = SqlDbType.VarChar;
        param6t.SqlDbType = SqlDbType.VarChar;
        param7t.SqlDbType = SqlDbType.VarChar;


        SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
        DataTable dt_searchresults = new DataTable();
        dt_searchresults.TableName = "Search_Results";
        da.Fill(dt_searchresults);
        #endregion

        #region Display the search parameters
        // Create a datatable that holds all the parameter settings so that it can be easily displayed in a gridview
        DataTable dt_searchparams = new DataTable();
        dt_searchparams.TableName = "Search_Params";

        dt_searchparams.Columns.Add("Parameter");
        dt_searchparams.Columns.Add("Search_for");

        string csv_dt1 =  GetCSV_from_DataColumn(dt1, "value")   ;
        string csv_dt2 =  GetCSV_from_DataColumn(dt2, "value")   ;
        string csv_dt3 =  GetCSV_from_DataColumn(dt3, "value")   ;
        string csv_dt4 =  GetCSV_from_DataColumn(dt4, "value")   ;
        string csv_dt5 =  GetCSV_from_DataColumn(dt5, "value")   ;
        string csv_dt6 =  GetCSV_from_DataColumn(dt6, "value")   ;


        DataRow r1 = dt_searchparams.NewRow();
        DataRow r2 = dt_searchparams.NewRow();
        DataRow r3 = dt_searchparams.NewRow();
        DataRow r4 = dt_searchparams.NewRow();
        DataRow r5 = dt_searchparams.NewRow();
        DataRow r6 = dt_searchparams.NewRow();
        DataRow r7 = dt_searchparams.NewRow();

        r1[0] = "Study"      ;  r1[1] = CombineSearchParamsForLabel( "", csv_dt1);
        r2[0] = "Method"     ; r2[1] = CombineSearchParamsForLabel( "", csv_dt2);
        r3[0] = "Gene";  r3[1] = CombineSearchParamsForLabel( txtparam3t, csv_dt3);
        r4[0] = "Region"; r4[1] = CombineSearchParamsForLabel(txtparam4t, csv_dt4);
        r5[0] = "Event_type"; r5[1] = CombineSearchParamsForLabel(txtparam5t, csv_dt5);
        r6[0] = "Inheritance"; r6[1] = CombineSearchParamsForLabel(txtparam6t, csv_dt6);
        r7[0] = "ID"; r7[1] = txtparamID;

        dt_searchparams.Rows.Add(r1);
        dt_searchparams.Rows.Add(r2);
        dt_searchparams.Rows.Add(r3);
        dt_searchparams.Rows.Add(r4);
        dt_searchparams.Rows.Add(r5);
        dt_searchparams.Rows.Add(r6);
        dt_searchparams.Rows.Add(r7);

        gvSearchParams.DataSource = dt_searchparams;
        gvSearchParams.DataBind();
        #endregion

        ViewState["dt_searchparams"] = dt_searchparams;
        ViewState["dt_searchresults"] = dt_searchresults;

        string results = "Query returned " + dt_searchresults.Rows.Count.ToString() + " records.";
        lblResults.Text = results;
        

        gvGeneEvents.DataSource = dt_searchresults;
        gvGeneEvents.DataBind();


        UpdatePanel1.Visible = true;
        UpdatePanel1.Update();

    }

    protected string CombineSearchParamsForLabel (string txt, string csv)
    {
        string comb = "";

        if (txt == "" & csv == "<none>") comb = "<not used>";
        else if (txt == "" & csv != "<none>") comb = "In [" + csv + "]";
        else if (txt != "" & csv == "<none>") comb = "Like '" + txt + "'";
        else if (txt != "" & csv != "<none>") comb = "Like '" + txt + "' OR In [" + csv + "]";

        return comb;
    }

    /// <summary>
    /// Move to Utilities
    /// </summary>
    /// <param name="dt"></param>
    /// <param name="col"></param>
    /// <returns></returns>
    protected string GetCSV_from_DataColumn(DataTable dt, string col )
    {
        string csv = "";
        List<string> list = dt.AsEnumerable()
              .Select(s => s.Field<string>(col))
              .Distinct()
              .ToList();

        csv = String.Join(", ", list);
        csv = (csv == "") ? "<none>" : csv;

        return csv;
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FIND_GeneEvents();
    }

    protected void btnDetails_Command(object sender, CommandEventArgs e)
    {
        Button b = (Button)sender;

        GridViewRow row = (GridViewRow)b.NamingContainer;

        int rowindex = row.RowIndex;

        HighlightRow(rowindex);

        if (e.CommandName == "details")
        {


        }

        else if (e.CommandName == "details_all")
        {


        }


    }

    protected void HighlightRow(int idx)
    {
        foreach (GridViewRow row in gvGeneEvents.Rows)
        {
            if(row.RowIndex==idx) row.BackColor = Color.YellowGreen;
            else row.BackColor = Color.White;
        }

    }



    protected void CreateXLS(DataSet mydset)
    {
        if (mydset.Tables.Count > 0)
        {
            SpreadsheetGearUtils.SaveDataSetToExcel(mydset, "gev", true, "xls");

        }
        else
        {
            lblInfo.Text = "No tables in dataset.";
        }
    }

    //protected void gvGeneEvents_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    //if (e.Row.RowType == DataControlRowType.DataRow) {

    //    //    Button btn = (Button)e.Row.FindControl("btnDetails");

    //    //    if (btn != null) ScriptManager.GetCurrent(this.Page).RegisterPostBackControl(btn);
  
    //    //}
    //}
    protected void btnCheckAll_Click(object sender, EventArgs e)
    {
        foreach(GridViewRow row in gvGeneEvents.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControlRecursive("chkView");
            chk.Checked = true;
            btnCheckAll.Visible = false;
            btnUncheckAll.Visible = true;

        }
    }

    protected void btnUncheckAll_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvGeneEvents.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControlRecursive("chkView");
            chk.Checked = false;
            btnCheckAll.Visible = true;
            btnUncheckAll.Visible = false;
        }
    }


    protected struct CheckBoxParam
    {
        public string fld_name;
        public string fld_datatype;
        public string ctl_name;
    }


    protected DataTable GetChecked(GridView gv, string CheckBoxName, List<CheckBoxParam> p)
    {
        //Default is to not hide the non-selected rows
        DataTable dt = GetChecked(gv, CheckBoxName, p, false);
        return dt;
    }
    


    /// <summary>
    /// Move to a new class
    /// This returns a datatable based on checked CheckBoxes in a GridView
    ///  - you can pass in a list of "CheckBoxParam" which contain a field name, data type, and control name
    ///  - NEED MORE EXPLANATION HERE
    /// </summary>
    /// <param name="gv"></param>
    /// <param name="CheckBoxName"></param>
    /// <param name="p"></param>
    /// <returns></returns>
    protected DataTable GetChecked(GridView gv, string CheckBoxName, List<CheckBoxParam> p, bool HideNonselectedRows)
    {
        DataTable dt = new DataTable();

        //create the number of values that will be collected by looping through the GridView
        for(int i=0; i < p.Count; i++)
        {
            System.Type coltype = System.Type.GetType(p[i].fld_datatype);
            dt.Columns.Add(p[i].fld_name, coltype );
        }

        

        foreach (GridViewRow row in gv.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControlRecursive(CheckBoxName);
            DataRow newrow = dt.NewRow();

            if(chk.Checked) 
            {
                for(int j=0; j < p.Count; j++)
                {
                    int idx = GetCellIndexByFieldHandle(row, p[j].ctl_name);
                    string value = row.Cells[idx].Text;
                    newrow[p[j].fld_name] = value;

                }
                dt.Rows.Add(newrow);
            }
            else
            {   //row is not checked
                if(HideNonselectedRows)
                {
                    row.Visible = false;
                }
            }
        }

        return dt;
    }






    protected void btnViewDetails_Click(object sender, EventArgs e)
    {
        ShowSelectedEventDetails();

    }



        /// <summary>
        /// Gets the ordinal index of a TableCell in a rendered GridViewRow, using a text fieldHandle (e.g. the corresponding column's DataFieldName/SortExpression/HeaderText)
        /// </summary>
        public static int GetCellIndexByFieldHandle(GridView grid, string fieldHandle)
        {
            int iCellIndex = -1;

            for (int iColIndex = 0; iColIndex < grid.Columns.Count; iColIndex++)
            {
                if (grid.Columns[iColIndex] is DataControlField)
                {
                    DataControlField col = (DataControlField)grid.Columns[iColIndex];
                    if ((col is BoundField && string.Compare(((BoundField)col).DataField, fieldHandle, true) == 0)
                        || string.Compare(col.SortExpression, fieldHandle, true) == 0
                        //|| col.HeaderText.Contains(fieldHandle)  //REMOVED AS "pk" is contained in "filepk"
                        )
                    {
                        iCellIndex = iColIndex;
                        break;
                    }
                }
            }
            return iCellIndex;
        }

        /// <summary>
        /// Gets the ordinal index of a TableCell in a rendered GridViewRow, using a text fieldHandle (e.g. the corresponding column's DataFieldName/SortExpression/HeaderText)
        /// 
        /// usage:  string value = row.Cells[GetCellIndexByFieldHandle(row, p[j].ctl_name)].Text;
        /// </summary>
        public static int GetCellIndexByFieldHandle(GridViewRow row, string fieldHandle)
        {
            return GetCellIndexByFieldHandle((GridView)row.Parent.Parent, fieldHandle);
        }
    

    protected void ShowSelectedEventDetails()
    {
        dset_results.Tables.Clear();
        Panel_Details.Controls.Clear();

        SQL_utils sql = new SQL_utils("backend");

        // Build the parameters for extracting GridView data to a DataTable which serves as an Table Valued Parameter in SQL
        List<CheckBoxParam> p = new List<CheckBoxParam>();

        CheckBoxParam p1 = new CheckBoxParam();
        p1.fld_name = "filepk"; p1.fld_datatype = "System.Int32"; p1.ctl_name = "filepk";

        CheckBoxParam p2 = new CheckBoxParam();
        p2.fld_name = "pk"; p2.fld_datatype = "System.Int32"; p2.ctl_name = "pk";

        p.Add(p1);
        p.Add(p2);


        // Get the Checked data
        DataTable dt = GetChecked(gvGeneEvents, "chkView", p, true);  //last parameter: true = HideNonselectedRows

        // Get distinct files to loop through 
        //WORKS but I dont' need a datatable:           DataTable dtfiles = dt.DefaultView.ToTable(true, "filepk");

        List<int> files = dt.AsEnumerable()
                .Select(s => s.Field<int>("filepk"))
                .Distinct()
                .ToList();

        // Loop through the results 
        for (int f = 0; f < files.Count; f++ )
        {
            DataView view = dt.AsDataView();
            view.RowFilter = "filepk=" + files[f].ToString();
            DataTable dtsubset = view.ToTable();

            //string fileinfo = Master.DB.GetSQLScalar_string("exec gev.spEvents_Details_FileInfo " + files[f].ToString());
            string fileinfo = sql.StringScalar_from_SQLstring("exec gev.spEvents_Details_FileInfo " + files[f].ToString());

            SqlCommand sqlCmd = new SqlCommand("gev.spEvents_Details", sql.SqlConnection);
            sqlCmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = sqlCmd.Parameters.AddWithValue("@filepk", files[f]);
            SqlParameter param2 = sqlCmd.Parameters.AddWithValue("@pk", dtsubset);
            param1.SqlDbType = SqlDbType.Int;
            param2.SqlDbType = SqlDbType.Structured; //tells ADO.NET we are passing TVP


            SqlDataReader dr = sqlCmd.ExecuteReader();
            DataTable dtdetails = new DataTable();
            dtdetails.TableName = "filepk" + files[f].ToString();
            dtdetails.Load(dr);






            GridView gvdet = new GridView();
            gvdet.AutoGenerateColumns = true;
            gvdet.DataSource = dtdetails;
            gvdet.DataBind();

            Label lbl = new Label();
            lbl.Text = "<br/><br/>" + fileinfo +  "    NUM RECORDS = " + dtdetails.Rows.Count.ToString() + "<br/>";


            Panel_Details.Controls.Add(lbl);
            Panel_Details.Controls.Add(gvdet);

            //Build the DataSet
            dset_results.Tables.Add(dtdetails); 
        }


        //Add the serach parameters to the dataset
        dset_results.Tables.Add(dt_searchparams);
        dset_results.Tables.Add(dt_searchresults); 


        ViewState["dset_results"] = dset_results;

    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        
        SpreadsheetGearUtils.SaveDataSetToExcel(dset_results, "gev_search", true, "xlsx");

    }
    protected void btnResetSearchParams_Click(object sender, EventArgs e)
    {
        UpdatePanel1.Visible = false;
        UpdatePanel1.Update();

        txtGene.Text = "";
        txtRegion.Text = "";
        txtEvent_type.Text = "";
        txtInheritance.Text = "";

        lstStudy.SelectedIndex = -1;
        lstMethod.SelectedIndex = -1;
        lstGene.SelectedIndex = -1;
        lstRegion.SelectedIndex = -1;
        lstEvent_type.SelectedIndex = -1;
        lstInheritance.SelectedIndex = -1;
    }

}