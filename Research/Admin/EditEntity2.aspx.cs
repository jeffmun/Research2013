using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using uwac;
using Obout.Grid;
using Obout.Interface;
using Obout.ComboBox;

public partial class Admin_EditEntity2 : OboutInc.oboutAJAXPage //System.Web.UI.Page
{
    /// <summary>
    ///  stuff to do:
    ///  
    /// add a "Title" Property above the grid
    /// add DropDownList when adding new options between linked tables
    /// make pk's readonly 
    /// 
    /// 
    /// </summary>


    private string schema;
    private string master_tbl;
    private string master_labelfld;
    private string detail_tbl;
    private string detail_labelfld;
    private string master_pk;
    private string detail_pk;
    private string linktable;
    private bool usestudy;
    private int master_pkvalue;
    private int detail_pkvalue;
    private int viewstate_pkvalue;

    //raise events on content page for the buttons on master page
    protected void Page_Init(object sender, EventArgs e)
    {
        Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
    }

    //If the master page default study is changed, update the Measure DDL
    protected void Master_Study_Changed(object sender, EventArgs e)
    {

        Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);

    }


    protected void Page_Load(object sender, EventArgs e)
    {

        bool bool_isPostback = IsPostBack;

        AddHyperlinks();
        ReadQueryStringParams();

        if(usestudy) lblStudy.Text = Master.Master_studyname;

        if(detail_tbl != null) DetailsVisible(true); 
        else DetailsVisible(false);

        if (!IsPostBack)
        {
            if (master_tbl != null) LoadMaster(schema, master_tbl, master_pk, usestudy);
        }

        if (ViewState["master_pkvalue"] != null)
        {
            //Only load the detail if we have logged the pkvalue needed to display the details     
            LoadDetail(schema, master_tbl, master_pk, detail_tbl, detail_pk, master_pkvalue, usestudy);
        }
        else if (linktable != null )
        {
            //Load the details via the linktable
            createRuntimeTemplate("master");
            LoadDetail(schema, master_tbl, master_pk, detail_tbl, detail_pk, linktable);
            //createRuntimeTemplate("detail");

        }

        //if (nselected == 0) ogrid_detail.Visible = false;
    }

    protected void AddHyperlinks()
    {


        //Single table
        AddHyperlink(acEntity.Entity.Service, panelHyperlinks1);
        AddHyperlink(acEntity.Entity.Doc, panelHyperlinks1);
        AddHyperlink(acEntity.Entity.Event, panelHyperlinks1);
        AddHyperlink(acEntity.Entity.Status, panelHyperlinks1);


        //Master and Detail
        AddHyperlink(acEntity.Entity.Service, acEntity.Entity.Doc, panelHyperlinks2);
        AddHyperlink(acEntity.Entity.Service, acEntity.Entity.Event, panelHyperlinks2);

        //??
        AddHyperlink(acEntity.Entity.Service_Doc, acEntity.Entity.Status, panelHyperlinks2);
        AddHyperlink(acEntity.Entity.Service_Event, acEntity.Entity.Status, panelHyperlinks2);

    }



    protected void AddHyperlink(acEntity.Entity ent1, acEntity.Entity ent2, Panel p)
    {
        HyperLink hyp1 = new HyperLink();

        hyp1.Text = ent1.ToString() + " - " + ent2.ToString();
        hyp1.NavigateUrl = "~/admin/editentity2.aspx?" + acEntity.CreateMasterDetailQueryString(ent1, ent2);

        Literal lit = new Literal();
        lit.Text = "<br/>";

        p.Controls.Add(hyp1);
        p.Controls.Add(lit);
    }

    protected void AddHyperlink(acEntity.Entity ent1, Panel p)
    {
        HyperLink hyp1 = new HyperLink();

        hyp1.Text = ent1.ToString();
        hyp1.NavigateUrl = "~/admin/editentity2.aspx?" + acEntity.CreateTblQueryString(ent1);

        Literal lit = new Literal();
        lit.Text = "<br/>";

        p.Controls.Add(hyp1);
        p.Controls.Add(lit);
    }




    protected void DetailsVisible(bool show)
    {
        if(show)
        {
            btnLoadDetails.Visible = true;
            ogrid_detail.Visible = true;
            lblEntity_detail.Visible = true;
            lblOutput_detail.Visible = true;
        }
        else
        {
            btnLoadDetails.Visible = false;
            ogrid_detail.Visible = false;
            lblEntity_detail.Visible = false;
            lblOutput_detail.Visible = false;
        }
    }


    protected void ReadQueryStringParams()
    {
        master_pkvalue = -1;
        viewstate_pkvalue = -2;
        usestudy = false;
        //if (Session["master_pkvalue"] != null)
        //{
        //    master_pkvalue = Int32.Parse(Session["master_pkvalue"].ToString());
        //}

        if (ViewState["master_pkvalue"] != null)
        {
            viewstate_pkvalue = Int32.Parse(ViewState["master_pkvalue"].ToString());
        }


        #region Get QueryString parameters
        SQL_utils sql = new SQL_utils("backend");

        if (Request.QueryString["usestudy"] != null)
        {
            string qs_usestudy = utilCrypt.Decrypt(Request.QueryString["usestudy"]);
            usestudy = (qs_usestudy == "y") ? true : false;
        }

        schema = "dbo";

        if (Request.QueryString["schema"] != null)
        {
            schema = utilCrypt.Decrypt(Request.QueryString["schema"]);

        }

        if (Request.QueryString["tbl"] != null)
        {
            master_tbl = utilCrypt.Decrypt(Request.QueryString["tbl"]);
            master_pk = sql.GetPKForTable("uwautism_research_backend", master_tbl, schema);
            master_labelfld = sql.GetLabelFieldForTable("uwautism_research_backend", master_tbl, schema);

        }

        if (Request.QueryString["detail"] != null)
        {
            detail_tbl = utilCrypt.Decrypt(Request.QueryString["detail"]);
            detail_pk = sql.GetPKForTable("uwautism_research_backend", detail_tbl, schema);
            detail_labelfld = sql.GetLabelFieldForTable("uwautism_research_backend", detail_tbl, schema);
        }

        if (Request.QueryString["linktable"] != null)
        {
            linktable = utilCrypt.Decrypt(Request.QueryString["linktable"]);
        }


        sql.Close();

        #endregion

    }




    //<a class="ob_gAL" href="javascript: //" onclick="ogrid.editRecord(this);return false;">Edit</a>



    public void Log_pkvalue(int pkvalue)
    {
        //string tblname = Request.QueryString["detail"];
        //Session["master_pkvalue"] = pkvalue;
        ViewState["master_pkvalue"] = pkvalue;

        //master_pkvalue = pkvalue;
    }


    protected void LoadMaster(string master_tbl, string master_pk, bool usestudy)
    {
            LoadMaster("dbo", master_tbl, master_pk, usestudy);

    }


    protected void LoadMaster(string schema, string master_tbl, string master_pk, bool usestudy)
    {

        DataTable dt = GetMasterDataTable(schema, master_tbl, master_pk, usestudy);

        ogrid.Columns.Clear();
        ogrid.DataSource = dt;
        ogrid.DataBind();

        lblEntity.Text = master_tbl;

    }

    protected DataTable GetMasterDataTable(string schema, string master_tbl, string master_pk, bool usestudy)
    {
        SQL_utils sql = new SQL_utils("backend");
        string cols = sql.GetAllColumnsInTable("uwautism_research_backend", master_tbl, schema, true);
        cols = cols.Replace(master_pk + ",", "");
        string where_clause = " where 1=1 ";
        string study_clause = "";
        if (usestudy)
        {
            study_clause = " and studyID = " + Master.Master_studyID.ToString();
        }
        string sqlcode = "select " + master_pk + " as master_pk, " + cols + " from " + schema + "." + master_tbl + where_clause + study_clause;
        DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
        sql.Close();
        return dt;
    }


    protected void LoadDetail(string master_tbl, string master_pk, string detail_tbl, string detail_pk, int master_pkvalue, bool usestudy)
    {
        LoadDetail("dbo", master_tbl, master_pk, detail_tbl, detail_pk, master_pkvalue, usestudy);
    
    }

    protected DataTable GetDetailDataTable(string schema, string master_tbl, string master_pk, string detail_tbl, string detail_pk, int master_pkvalue, bool usestudy)
    {
        SQL_utils sql = new SQL_utils("backend");
        string cols = sql.GetAllColumnsInTable("uwautism_research_backend", detail_tbl, schema, true);
        cols = cols.Replace(master_pk + ",", "");
        cols = cols.Replace(detail_pk + ",", "");

        string where_clause = " where 1=1 ";

        string study_clause = "";
        //if (usestudy)
        //{
        //    study_clause = " and studyID = " + Master.Master_studyID.ToString();
        //}

        if (master_pkvalue > 0)
        {
            where_clause += " and " + master_pk + " = " + master_pkvalue.ToString();
        }


        string sqlcode = "select " + master_pk + " as master_pk, " + detail_pk + " as detail_pk, " +  cols + 
            " from " + schema + "." + detail_tbl + where_clause + study_clause;

        DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
        sql.Close();
        return dt;
    }


    protected DataTable GetDetailDataTable(string schema, string master_tbl, string master_pk, string detail_tbl, string detail_pk, string linktable)
    {
        SQL_utils sql = new SQL_utils("backend");

        string cols0 = sql.GetAllColumnsInTable("uwautism_research_backend", master_tbl, schema, true);
        string cols1 = sql.GetAllColumnsInTable("uwautism_research_backend", detail_tbl, schema, true);
        string cols2 = sql.GetAllColumnsInTable("uwautism_research_backend", linktable, schema, true);

        string cols = cols0 + cols1 + cols2;
        cols = cols.Replace(master_pk, "");
        cols = cols.Replace(detail_pk, "");

        cols = cols.Replace(", ,", ",");
        cols = cols.Replace(",,", ",");


        string where_clause = " where 1=1 ";


        string sqlcode = "select a." + master_pk + " as master_pk, b." + detail_pk + " as detail_pk, " + cols + " from " + schema + "." + master_tbl + " a " +
            " join " + schema + "." + linktable + " b ON a." + master_pk + " = b." + master_pk +
            " join " + schema + "." + detail_tbl + " c ON b." + detail_pk + " = c." + detail_pk + where_clause;

        sqlcode = sqlcode.Replace(", ,", ",");
        sqlcode = sqlcode.Replace(",,", ",");


        DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
        sql.Close();
        return dt;
    }




    protected void LoadDetail(string schema, string master_tbl, string master_pk, string detail_tbl, string detail_pk, int master_pkvalue, bool usestudy)
    {
        int nselected = 0;

        if(ogrid.SelectedRecords != null)
        {
            nselected = ogrid.SelectedRecords.Count;
        }

        DataTable dt = GetDetailDataTable(schema, master_tbl, master_pk,  detail_tbl,  detail_pk,  master_pkvalue, usestudy);

        ogrid_detail.Columns.Clear();
        ogrid_detail.DataSource = dt;
        ogrid_detail.DataBind();

        lblEntity_detail.Text = detail_tbl; // +"   master_pk = " + master_pkvalue.ToString();

        lblOutput_detail.Text = "items for: " + master_pkvalue.ToString();

        ogrid_detail.Visible = true;
    }


    protected void LoadDetail(string schema, string master_tbl, string master_pk, string detail_tbl, string detail_pk, string linktable)
    {
        int nselected = 0;

        if (ogrid.SelectedRecords != null)
        {
            nselected = ogrid.SelectedRecords.Count;
        }

        DataTable dt = GetDetailDataTable( schema,  master_tbl,  master_pk,  detail_tbl,  detail_pk,  linktable);

        if (master_tbl == "enumService")
        {
            ogrid_detail.AllowGrouping = true;
            ogrid_detail.GroupBy = "service";
            ogrid_detail.HideColumnsWhenGrouping = false;
        }

        ogrid_detail.Columns.Clear();
        ogrid_detail.DataSource = dt;
        ogrid_detail.DataBind();

        lblEntity_detail.Text = detail_tbl; // +"   master_pk = " + master_pkvalue.ToString();

        lblOutput_detail.Text = "items for: " + master_pkvalue.ToString();

        ogrid_detail.Visible = true;

    }




    #region INSERT new data
    protected void ogrid_InsertCommand(object sender, GridRecordEventArgs e)
    {

        if (master_tbl != "")
        {
            Hashtable hash = e.Record;
            hash.Remove("master_pk");

            // Add studyID whether we need it or not.  Because the oGrid_InsertData will only 
            // process fields that are part of the underlying table, no harm in including it.
            if (hash.ContainsKey("studyID"))
            {
                hash["studyID"] = Master.Master_studyID.ToString();
            }
            else
            {
                hash.Add("studyID", Master.Master_studyID.ToString());
            }


            oboutGrid_utils o = new oboutGrid_utils();
            string output = o.oGrid_InsertData(hash, master_tbl, "uwautism_research_backend", schema, master_pk, 0);

            lblOutput.Text = output;


            LoadMaster(schema, master_tbl, master_pk, usestudy);
        }
    }



    protected void ogrid_detail_InsertCommand(object sender, GridRecordEventArgs e)
    {

        if (detail_tbl != "")
        {
            Hashtable hash = e.Record;

            hash.Remove("master_pk");
            hash.Add(master_pk, master_pkvalue.ToString());

            // Add studyID whether we need it or not.  Because the oGrid_InsertData will only 
            // process fields that are part of the underlying table, no harm in including it.
            if (hash.ContainsKey("studyID"))
            {
                hash["studyID"] = Master.Master_studyID.ToString();
            }
            else
            {
                hash.Add("studyID", Master.Master_studyID.ToString());
            }

            oboutGrid_utils o = new oboutGrid_utils();
            string output = o.oGrid_InsertData(hash, detail_tbl , "uwautism_research_backend", schema, detail_pk, 0);

            lblOutput.Text = output;

            LoadDetail(schema, master_tbl, master_pk, detail_tbl, detail_pk, master_pkvalue, usestudy);
        }
    }

    #endregion

    #region UPDATE existing data
    protected void ogrid_UpdateCommand(object sender, GridRecordEventArgs e)
    {
        Hashtable hash = e.Record;

        string pkval = hash["master_pk"].ToString();

        hash.Add(master_pk, pkval);

        // Add studyID whether we need it or not.  Because the oGrid_InsertData will only 
        // process fields that are part of the underlying table, no harm in including it.
        if (hash.ContainsKey("studyID"))
        {
            hash["studyID"] = Master.Master_studyID.ToString();
        }
        else
        {
            hash.Add("studyID", Master.Master_studyID.ToString());
        }

        oboutGrid_utils o = new oboutGrid_utils();
        string output = o.oGrid_UpdateData(hash, master_tbl, "uwautism_research_backend", schema, master_pk);

        lblOutput.Text = output;

        LoadMaster(schema, master_tbl, master_pk, usestudy);
    }

    
    protected void ogrid_detail_UpdateCommand(object sender, GridRecordEventArgs e)
    {
        if (detail_tbl != "")
        {
            Hashtable hash = e.Record;


            string master_pkval = hash["master_pk"].ToString();
            string detail_pkval = hash["detail_pk"].ToString();

            hash.Add(master_pk, master_pkval);
            hash.Add(detail_pk, detail_pkval);


            // Add studyID whether we need it or not.  Because the oGrid_InsertData will only 
            // process fields that are part of the underlying table, no harm in including it.
            if (hash.ContainsKey("studyID"))
            {
                hash["studyID"] = Master.Master_studyID.ToString();
            }
            else
            {
                hash.Add("studyID", Master.Master_studyID.ToString());
            }

            oboutGrid_utils o = new oboutGrid_utils();
            string output = "";
            if (linktable != null)
            {
                List<string> pks = new List<string> {master_pk,detail_pk};
                output = o.oGrid_UpdateData(hash, linktable, "uwautism_research_backend", schema, pks);
                LoadDetail(schema, master_tbl, master_pk, detail_tbl, detail_pk, linktable);
            }
            else {
                output = o.oGrid_UpdateData(hash, detail_tbl, "uwautism_research_backend", schema, detail_pk );
                LoadDetail(schema, master_tbl, master_pk, detail_tbl, detail_pk, master_pkvalue, usestudy);
            }


            lblOutput_detail.Text = output;

        }

    }


    #endregion



    #region obout Grid Columns Created
    protected void ogrid_ColumnsCreated(object sender, EventArgs e)
    {
        Grid grid = sender as Grid;


        foreach (Column column in ogrid.Columns)
        {
            column.TemplateSettings.TemplateId = "Template1";
            column.TemplateSettings.HeaderTemplateId = "Template1";

            if (column.DataField == "master_pk" | column.DataField == "detail_pk" | column.DataField == "master_labelfld" | column.DataField == "studyID")
            {
                //column.Visible = false;
            }

            if (column.DataField == "master_pk")
            {
                column.ReadOnly = true;
            }

        }

        Obout.Grid.Column editcol = new Column();
        editcol.AllowEdit = true;
        editcol.Width = "100";
        ogrid.Columns.Add(editcol);

    }


    protected void ogrid_detail_ColumnsCreated(object sender, EventArgs e)
    {
        Grid grid = sender as Grid;

        foreach (Column column in grid.Columns)
        {
            //assign the EditTemplateID that was created dynamically
            if (column.DataField == master_labelfld) column.TemplateSettings.EditTemplateId = "MasterTemplate";
            if (column.DataField == detail_labelfld) column.TemplateSettings.EditTemplateId = "DetailTemplate";

            if (column.DataField == "master_pk" | column.DataField == "detail_pk" | column.DataField == "studyID" ) // | column.DataField == "master_labelfld" | column.DataField == "detail_labelfld")
            {
                column.Visible = false;
            }

            //HERE: fix the col header for the labelfld's

        }

        Obout.Grid.Column editcol = new Column();
        editcol.AllowEdit = true;
        editcol.Width = "100";
        grid.Columns.Add(editcol);
    }
    #endregion 

    protected void ogrid_Rebind(object sender, EventArgs e)
    {
         
    }


    protected void ogrid_detail_Rebind(object sender, EventArgs e)
    {

    }


    #region Get Various ID's
    protected int GetColumnIndexByName(GridViewRow row, string columnName)  //GridView 
    {
        int columnIndex = 0;
        foreach (DataControlFieldCell cell in row.Cells)
        {
            if (cell.ContainingField is BoundField)
                if (((BoundField)cell.ContainingField).DataField.Equals(columnName))
                    break;
            columnIndex++; // keep adding 1 while we don't have the correct name
        }
        return columnIndex;
    }


    protected int GetColumnIndexByName(GridRow row, string columnName)  //obout Grid 
    {
        int columnIndex = 0;
        foreach (DataControlFieldCell cell in row.Cells)
        {
            if (cell.ContainingField is BoundField)
                if (((BoundField)cell.ContainingField).DataField.Equals(columnName))
                    break;
            columnIndex++; // keep adding 1 while we don't have the correct name
        }
        return columnIndex;
    }

    protected string GetControlIdFromTemplate(string gridname, string controlId, int templateIndex, string idtype)
    {
        Grid grid = (Grid)Page.FindControlRecursive( gridname);

        Control ctrl = grid.Templates[templateIndex].Container.FindControl(controlId);


        switch (idtype)
        {
            case "client":
                return ctrl.ClientID;
            case "unique":
                return ctrl.UniqueID;
            default:
                return ctrl.UniqueID;
        }

    }
    #endregion



    #region RowDataBound
    protected void ogrid_RowDataBound(object sender, GridRowEventArgs e)
    {
        if (e.Row.RowType == GridRowType.DataRow)
        {
            DataRowView vw = (DataRowView)e.Row.DataItem;
            DataTable dt = vw.Row.Table;

            var x = e.Row.DataItem;

            //DataRow dr = (DataRow)e.Row.DataItem;

            int idx = -1;
            string color="";

            foreach (DataColumn c in dt.Columns)
            {
                if (c.ColumnName.Contains("color"))
                {
                    idx = GetColumnIndexByName(e.Row, c.ColumnName);
                    color = e.Row.Cells[idx].Text;
                    //color = DataBinder.Eval(e.Row.DataItem[idx] ).ToString();
                    //color = e.Row.DataItem[idx].Value.ToString();
                }

            }

            try
            {
                if (color != "" & color.ToLower() != "white" ) e.Row.Cells[idx].BackColor = System.Drawing.Color.FromName(color);
            }
            catch (Exception )
            { }

        }
    }



    protected void ogrid_detail_RowDataBound(object sender, GridRowEventArgs e)
    {
        if(e.Row.RowType == GridRowType.DataRow)
        {
            DataRowView vw = (DataRowView)e.Row.DataItem;

            try
            {
                string color = DataBinder.Eval(e.Row.DataItem, "statuscolor").ToString();

                if (color != null) e.Row.Cells[4].BackColor = System.Drawing.Color.FromName(color);
            }
            catch(Exception )
            { }


            ComboBox ddl_master_pk = (ComboBox)ogrid_detail.FindControlRecursive("ddl_master_pk");

            string foo = DataBinder.Eval(e.Row.DataItem, "master_pk").ToString();


        }
    }

    #endregion





    protected void btnLoadDetails_Click(object sender, EventArgs e)
    {

        if(ogrid.SelectedRecords != null)
        {
            foreach (Hashtable oRecord in ogrid.SelectedRecords)
            {
                string str_master_pkvalue = oRecord["master_pk"].ToString();

                master_pkvalue = Convert.ToInt32(str_master_pkvalue);

                if (master_pkvalue > 0)
                {
                    LoadDetail(schema, master_tbl, master_pk, detail_tbl, detail_pk, master_pkvalue, usestudy);
                }

                //ViewState["master_pkvalue"] = master_pk;
                //Page_Load(this, e);
            }
        }

    }

    protected void createRuntimeTemplate(string x)
    {

        GridRuntimeTemplate tpl1 = new GridRuntimeTemplate();

        tpl1.ID = "MasterTemplate";
        tpl1.ControlID = "ddl_master_pk";
        tpl1.Template = new Obout.Grid.RuntimeTemplate();
        
        tpl1.ControlPropertyName = "value";
        tpl1.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateMasterPKTemplate);


        GridRuntimeTemplate tpl2 = new GridRuntimeTemplate();

        tpl2.ID = "DetailTemplate";
        tpl2.ControlID = "ddl_detail_pk";
        tpl2.Template = new Obout.Grid.RuntimeTemplate();
        tpl2.ControlPropertyName = "value";
        tpl2.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateDetailPKTemplate);


        ogrid_detail.Templates.Add(tpl1);
        ogrid_detail.Templates.Add(tpl2);

        //return tpl;
    }



    //protected void CreatePKTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    //{
    //    Column col = e.Container.Column;

    //    string colname = col.DataField;
    //    string headerText = col.HeaderText;


    //    ComboBox ddl = new ComboBox();

    //    ddl.ID = "masterCombo";
    //    ddl.Width = Unit.Percentage(100);
    //    ddl.Height = Unit.Pixel(200);
    //    ddl.DataTextField = "master_labelfld";
    //    ddl.DataValueField = "master_pk";
    //    ddl.EmptyText = "Select ...";

    //    ddl.DataBinding += new EventHandler(MasterPKComboBox_LoadingItems);

    //    //ddl.EnableLoadOnDemand = true;
    //    //ddl.LoadingItems += MasterPKComboBox_LoadingItems;
    //    //ddl.DataBinding += MasterPKComboBox_LoadingItems;

    //    e.Container.Controls.Add(ddl);

    //    //PlaceHolder ph1 = new PlaceHolder();
    //    //e.Container.Controls.Add(ph1);

    //    ComboBox ddl2 = new ComboBox();

    //    ddl2.ID = "detailCombo";
    //    ddl2.Width = Unit.Percentage(100);
    //    ddl2.Height = Unit.Pixel(200);
    //    ddl2.DataTextField = "detail_labelfld";
    //    ddl2.DataValueField = "detail_pk";
    //    ddl2.EmptyText = "Select ...";
    //    ddl2.DataBinding += new EventHandler(DetailPKComboBox_LoadingItems);

    //    //ddl.EnableLoadOnDemand = true;
    //    //ddl.LoadingItems += DetailPKComboBox_LoadingItems;

    //    e.Container.Controls.Add(ddl2);

    //    //ph1.Controls.Add(ddl);

    //}




    protected void CreateMasterPKTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {

        ComboBox ddl = new ComboBox();

        ddl.ID = "ddl_master_pk";
        ddl.Width = Unit.Percentage(100);
        ddl.Height = Unit.Pixel(200);
        ddl.DataTextField = "master_labelfld";
        ddl.DataValueField = "master_pk";
        ddl.EmptyText = "Select ...";


        DataTable data = GetMasterDataTable(schema, master_tbl, master_pk, usestudy);

        // Looping through the items and adding them to the "Items" collection of the ComboBox
        for (int i = 0; i < data.Rows.Count; i++)
        {
            ddl.Items.Add(new ComboBoxItem(data.Rows[i][master_labelfld].ToString(), data.Rows[i]["master_pk"].ToString()));
        }

        e.Container.Controls.Add(ddl);

    }


    protected void CreateDetailPKTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        ComboBox ddl = new ComboBox();

        ddl.ID = "ddl_detail_pk";
        ddl.Width = Unit.Percentage(100);
        ddl.Height = Unit.Pixel(200);
        ddl.DataTextField = "detail_labelfld";
        ddl.DataValueField = "detail_pk";
        ddl.EmptyText = "Select ...";


        DataTable data = GetMasterDataTable(schema, detail_tbl, detail_pk, usestudy);

        // Looping through the items and adding them to the "Items" collection of the ComboBox
        for (int i = 0; i < data.Rows.Count; i++)
        {
            ddl.Items.Add(new ComboBoxItem(data.Rows[i][detail_labelfld].ToString(), data.Rows[i]["master_pk"].ToString()));
        }

        e.Container.Controls.Add(ddl);

    }



    ////ComboBoxLoadingItemsEventArgs
    //protected void MasterPKComboBox_LoadingItems(Object sender, EventArgs e)
    //{
    //    ComboBox ddl = sender as ComboBox;
    //    //Getting the options
    //    DataTable data = GetMasterDataTable(schema, master_tbl, master_pk, usestudy);

    //    // Looping through the items and adding them to the "Items" collection of the ComboBox
    //    for (int i = 0; i < data.Rows.Count; i++)
    //    {
    //        ddl.Items.Add(new ComboBoxItem(data.Rows[i][master_labelfld].ToString(), data.Rows[i][master_pk].ToString()));
    //    }

    //    //e.ItemsLoadedCount = data.Rows.Count;
    //    //e.ItemsCount = data.Rows.Count;
    //}



    //protected void DetailPKComboBox_LoadingItems(Object sender, EventArgs e)
    //{
    //    // Getting the countries
    //    DataTable data = GetDetailDataTable(schema, master_tbl, master_pk, detail_tbl, detail_pk, linktable);

        
    //    // Looping through the items and adding them to the "Items" collection of the ComboBox
    //    for (int i = 0; i < data.Rows.Count; i++)
    //    {
    //        (sender as ComboBox).Items.Add(new ComboBoxItem(data.Rows[i]["detail_labelfld"].ToString(), data.Rows[i]["detail_pk"].ToString()));
    //    }

    //    //e.ItemsLoadedCount = data.Rows.Count;
    //    //e.ItemsCount = data.Rows.Count;
    //}




}