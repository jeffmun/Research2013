using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SpreadsheetGear;
//using AutismCenterBase.Utilities;
using SpreadsheetGear.Data;
using SpreadsheetGear;
using uwac;

public partial class genetics_upload_gev : System.Web.UI.Page
{
    private DataSet dset = new DataSet();
    private string FileName;
    private string FolderPath = @"~\App_Data\GeneEvents\";
    private List<string> colNames = new List<string>();
    //private AutismCenterBase.Utilities.SpreadsheetGearUtils sgu = new AutismCenterBase.Utilities.SpreadsheetGearUtils();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

        }

        // retrieve from ViewState
        dset = (DataSet)ViewState["dset"];
        FileName = (string)ViewState["FileName"];

        if (FileUpload1.HasFile) btnUpload.Visible = true;

        ListGeneEventFiles();

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string message = "";
        //Upload the file
        if (Page.IsValid)
        {
            //string message = "File is Valid! " + System.Security.Principal.WindowsIdentity.GetCurrent().Name.ToString();
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);

            if (FileUpload1.HasFile)
            {
                FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                string FilePath = Server.MapPath(FolderPath + FileName);
                FileUpload1.SaveAs(FilePath);

                ViewState["FileName"] = FileName;

                //Show the Excel file contents
                ShowExcelContents(FilePath);
            }

        }
        else
        {
            message = "File is not a Valid type!";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
        }

        lblSubmitInfo.Text = "";
    }



    protected void gvSheets_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        GridViewRow row = e.Row;
        int rowidx = e.Row.RowIndex;
        if (row.RowType == DataControlRowType.DataRow)
        {

            for (int i = 0; i < 6; i++)
            {
                DropDownList ddl = (DropDownList)row.FindControlRecursive("ddl" + i.ToString());

                
                if (i == 1)
                {
                    DataTable methods = Master.SQL.DataTable_from_SQLstring("select method from gev.method");
                    ddl.DataSource = methods;
                    ddl.DataTextField = "method";
                    ddl.DataValueField = "method";

                }
                else
                {
                    string cols_csv = colNames[rowidx];
                    List<string> cols = cols_csv.Split('|').ToList();
                    ddl.DataSource = cols;

                }
                ddl.DataBind();

            }

        }
    }

    protected void AddMethod()
    {
        SQL_utils sql = new SQL_utils("backend");

        //string ouput = Master.DB.RunSQL("insert into gev.method(method) values('" + txtAddMethod.Text + "')");
        string ouput = sql.String_from_SQLstring("insert into gev.method(method) values('" + txtAddMethod.Text + "')");

    }


    protected void gvSheets_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ViewData")
        {
            ShowSheet(Convert.ToInt16(e.CommandArgument));
        }
        else if (e.CommandName == "SaveData")
        {
            SaveSheet(Convert.ToInt16(e.CommandArgument));
        }

    }


    protected void ShowExcelContents(string excelfile)
    {
        // Create a workbook from an Excel file
        //SpreadsheetGear.IWorkbook workbook = SpreadsheetGear.Factory.GetWorkbook(excelfile);


        try
        {
            //dset = SpreadsheetGearUtils.GetDataSet(excelfile);
            dset = SpreadsheetGear.Factory.GetWorkbook(excelfile).GetDataSet(SpreadsheetGear.Data.GetDataFlags.FormattedText);

        }
        catch (DuplicateNameException dup)
        {

            lblExcelError.Text += dup.Message + "<br/> Rename the column to avoid duplicates and try again.";
            //lblExcelError.Visible = true;
            //ViewState["ExcelError"] = dup.Message;
        }
        catch (Exception ex)
        {
            //ViewState["ExcelError"] = ex.Message;
            lblExcelError.Text = ex.Message;

        }
        finally
        {
            if (dset != null)
            {
                // store in ViewState
                ViewState["dset"] = dset; //Insert Data Set in View State

                ListSheetsInExcelFile(dset);

                lblSubmitInfo.Text = "# worksheets = " + dset.Tables.Count.ToString();
                lblSubmitInfo.Visible = true;
            }
        }
            



    }


    protected void ListGeneEventFiles ()
    {
        DataTable dt = Master.SQL.DataTable_from_SQLstring("select filepk, filename, sheetname, numrows, numcols, uploaded, uploadedBy from gev.Files");

        gvFiles.DataSource = dt;
        gvFiles.DataBind();
            

    }


    protected void ListSheetsInExcelFile(DataSet dset)
    {
        int sheetcounter = 0;

        DataTable dtSheets = new DataTable();
        dtSheets.Columns.Add("SheetNum", typeof(int));
        dtSheets.Columns.Add("SheetName", typeof(string));
        dtSheets.Columns.Add("NumRows", typeof(int));
        dtSheets.Columns.Add("cols", typeof(string));

        foreach (DataTable dt in dset.Tables)
        {
            sheetcounter++;

            int nrows = dt.Rows.Count;
            int numcols = dt.Columns.Count;

            //Use LINQ to create an array of column names
            List<string> columnNames = new List<string>();
            List<string> columnNames_data = (from dc in dt.Columns.Cast<DataColumn>() select dc.ColumnName).ToList();

            columnNames.Add("..select..");
            columnNames.Add("**NA**");
            columnNames.AddRange(columnNames_data);

            string cols = String.Join("|", columnNames); //in .NET 4.0
            colNames.Add(cols);

            dtSheets.Rows.Add(sheetcounter, dt.TableName, nrows, cols);
        }

        gvSheets.DataSource = dtSheets;
        gvSheets.DataBind();
        panelSheets.Visible = true;

    }


    protected void ShowSheet(int idx, bool showSummary = true)
    {
        Panel2.Controls.Clear();
        DataTable dt = dset.Tables[idx - 1];

        //try{
        
//        gvData.PageIndexChanged += new EventHandler(gvData_PageIndexChanged);

        DataTable dtTop = dt.Rows.Cast<DataRow>().Take(50).CopyToDataTable();


        gvData.DataSource = dtTop;
        gvData.DataBind();

        Label lbl2 = new Label();
        lbl2.Font.Bold = true;
        lbl2.Font.Size = 12;
        lbl2.Text = "<br/><br/>Data from " + dset.Tables[idx - 1].TableName;

        if (dt.Rows.Count > 50) lbl2.Text += " (first 50 rows displayed).";

        if (showSummary)
        {
            DataTable dtSummary = DataTable_utils.DataTable_Summary(dt);


            GridView gv = new GridView();
            gvSummary.DataSource = dtSummary;
            gvSummary.DataBind();

            Label lbl = new Label();
            lbl.Font.Bold = true;
            lbl.Font.Size = 12;
            lbl.Text = "<br/>Summary of " + dset.Tables[idx - 1].TableName;

            Panel2.Controls.Add(lbl);
            Panel2.Controls.Add(gvSummary);
        }

        Panel2.Controls.Add(lbl2);
        Panel2.Controls.Add(gvData);
        //}
        //catch(Exception ex)
        //{
        //  lblSubmitInfo.Text = ex.Message;
        //}
        Panel2.Visible = true;
        
    }



    protected void SaveSheet(int idx)
    {
        SQL_utils sql = new SQL_utils("backend");

        GridViewRow row = gvSheets.Rows[idx-1];

        bool validSelections = true;

        string[] ddl_values = new string[6];

        if (row.RowType == DataControlRowType.DataRow)
        {
            for (int i = 0; i < 6; i++)
            {
                DropDownList ddl = (DropDownList)row.FindControlRecursive("ddl" + i.ToString());
                ddl_values[i] =  ddl.SelectedValue;

                if(ddl.SelectedValue =="..select..")
                {
                    validSelections = false;
                }

            }

            if(!validSelections )
            {
                lblSubmitInfo.Text = "Select a value for each parameter. (Use **NA** if the parameter is not present in the data).";
                lblSubmitInfo.ForeColor = System.Drawing.Color.Red;
            }

            else
            {   //Proceed - no invalid selections
                lblSubmitInfo.Text = "";

                List<SqlParameter> p = new List<SqlParameter>();
            
                DataTable dt = dset.Tables[idx-1];

                int filepk = 0;
                filepk = sql.IntScalar_from_SQLstring("select coalesce(max(filepk) + 1,1) from gev.files");


                DataColumn methodCol = new System.Data.DataColumn("method", typeof(System.String));
                methodCol.DefaultValue = ddl_values[1];
                dt.Columns.Add(methodCol);


                p.Add(sql.CreateParam("filepk", filepk.ToString(), "int"));
                p.Add(sql.CreateParam("filename", FileName, "text"));
                p.Add(sql.CreateParam("sheetname", dt.TableName, "text"));
                p.Add(sql.CreateParam("numrows", dt.Rows.Count.ToString(), "int"));
                p.Add(sql.CreateParam("numcols", dt.Columns.Count.ToString(), "int"));
                p.Add(sql.CreateParam("col_id", ddl_values[0], "text"));
                p.Add(sql.CreateParam("col_method", "method", "text"));
                p.Add(sql.CreateParam("col_gene", ddl_values[2], "text"));
                p.Add(sql.CreateParam("col_region", ddl_values[3], "text"));
                p.Add(sql.CreateParam("col_eventtype", ddl_values[4], "text"));
                p.Add(sql.CreateParam("col_inheritance", ddl_values[5], "text"));

                //OUTPUT Parameter not working
                //p.Add(Master.SQL.CreateParam("output", "output", "int", "output"));

                string p_vals =
                    "filename " + FileName + "<br/>" +
                    "sheetname " + dt.TableName + "<br/>" +
                    "numrows " +  dt.Rows.Count.ToString()+ "<br/>" +
                    "numcols " + dt.Columns.Count.ToString()+ "<br/>" +
                    "col_id "  + ddl_values[0]+ "<br/>" +
                    "col_method " + ddl_values[1]+ "<br/>" +
                    "col_gene " + ddl_values[2]+ "<br/>" +
                    "col_region " + ddl_values[3] + "<br/>" +
                    "col_eventtype " + ddl_values[4] + "<br/>" +
                    "col_inheritance " + ddl_values[5]+ "<br/>" ;


                string sfilepk = "";

                try
                {
                    sfilepk = sql.StringScalar_from_ProcName("gev.spFiles_INSERT", p);
                    lblSubmitInfo.Text = "New filepk = " + filepk.ToString() + ".  ";

                    
                    //Hide this row
                    gvSheets.Rows[idx - 1].Visible = false;

                    int n_visible = 0;
                    for (int r = 0; r < gvSheets.Rows.Count; r++ )
                    {
                        if (gvSheets.Rows[r].Visible == true) n_visible++;
                    }
                    if (n_visible == 0) panelSheets.Visible = false;


                        if (filepk > 0) SaveDataTableToSQL(dt, filepk);


                }
                catch (Exception ex)
                {
                    lblSubmitInfo.Text += sfilepk + "<br/>" + ex.Message;
                }


            }


        }


    }

    protected void SaveDataTableToSQL (DataTable dt, int filepk)
    {

        dt.Columns.Add("filepk", typeof(int) );
        dt.Columns.Add("pk", typeof(int) );
        int counter=1;
        foreach(DataRow row in dt.Rows)
        {
            row["filepk"] = filepk;
            row["pk"] = counter;
            counter++;
        }

        DataColumn[] pkcol = new DataColumn[1];
        
        pkcol[0] = dt.Columns["pk"];
        pkcol[0].AutoIncrement = true;
        dt.PrimaryKey = pkcol;


        string DestinationTableName =  "file" + filepk.ToString("D3");

        SQL_utils sql = new SQL_utils("backend"); 

        string createSQL = sql.GetCreateTableSql(dt, "gev", DestinationTableName, false);


        string createTable = sql.StringScalar_from_SQLstring(createSQL);
        //If there is a max column, truncate data to left(2000)
        if (createSQL.Contains("/*TOOLONG*/"))
        {
            lblSubmitInfo.Text += "Warning: Some columns were truncated to 200 characters.<br/><br/>";
            lblSubmitInfo.ForeColor = System.Drawing.Color.DarkRed;
            foreach (DataRow row in dt.Rows)
            {
                foreach (DataColumn col in dt.Columns)
                {
                    if (row[col.ColumnName].ToString().Length > 200)
                    {
                        row[col.ColumnName] = row[col.ColumnName].ToString().PadRight(200).Substring(0, 200).Trim();
                    }
                }
            }
        }


        // Create the SqlBulkCopy object. 
        using (SqlBulkCopy bulkCopy = new SqlBulkCopy(sql.SqlConnection))
        {
            bulkCopy.DestinationTableName = "gev." + DestinationTableName;

            try
            {
                // Write from the source to the destination.
                bulkCopy.WriteToServer(dt);

                string nrows_inserted = sql.StringScalar_from_ProcName("gev.spEvents_EXTRACT",
                    sql.CreateParam("filepk", filepk.ToString(), "int"));

                string prefix = (filepk < 10) ? "00" : (filepk < 100) ? ")" : "";

                int n = sql.IntScalar_from_SQLstring("select count(*) from gev.file" + prefix + filepk.ToString());

                lblSubmitInfo.Text += n.ToString() + " rows inserted.";
                lblSubmitInfo.ForeColor = System.Drawing.Color.Blue;

            }
            catch (Exception ex)
            {
                lblSubmitInfo.Text += (ex.Message);

                //Delete this file as it was not successfully oploaded.
                string del = sql.StringScalar_from_ProcName("gev.spFiles_DELETE",
                        sql.CreateParam("filepk", filepk.ToString(), "int"));


            }
        }
        


        ListGeneEventFiles();
    }

      
    protected void gvFiles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        SQL_utils sql = new SQL_utils("backend"); 
        string param = e.CommandArgument.ToString();
        if (e.CommandName == "DeleteThisFile")
        {
            int filepk;

            bool isint = int.TryParse(param, out filepk);
            if (isint)
            {
                string del = sql.StringScalar_from_ProcName("gev.spFiles_DELETE",
                      sql.CreateParam("filepk", filepk.ToString(), "int")); 
            }

        }

        lblSubmitInfo.Text = "";
        ListGeneEventFiles();
    }




    /// <summary>
    /// consider using this
    /// http://stackoverflow.com/questions/2883149/viewstate-vs-session-maintaining-object-through-page-lifecycle
    /// </summary>
    //public object GetObject
    //{
    //    get
    //    {
    //        if (ViewState["MyObject"] != null)
    //        {
    //            return ViewState["MyObject"];
    //        }

    //        return null;
    //    }
    //    set
    //    {
    //        ViewState["MyObject"] = value;
    //    }
    //}



    protected void gvData_PageIndexChanged(object sender, GridViewPageEventArgs e)
    {
        gvData.PageIndex = e.NewPageIndex;
        gvData.DataBind();
    }



    protected void btnAddMethod_Click(object sender, EventArgs e)
    {
        AddMethod();
    }



}