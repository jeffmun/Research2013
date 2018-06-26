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

public partial class Admin_EditEntity : OboutInc.oboutAJAXPage //System.Web.UI.Page
{
    private string schema;
    private string master_tbl;
    private string detail_tbl;
    private string master_pk;
    private string detail_pk;
    private bool usestudy;
    private int master_pkvalue;
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

        //if (nselected == 0) ogrid_detail.Visible = false;
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

        }

        if (Request.QueryString["detail"] != null)
        {
            detail_tbl = utilCrypt.Decrypt(Request.QueryString["detail"]);
            detail_pk = sql.GetPKForTable("uwautism_research_backend", detail_tbl, schema);


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
        SQL_utils sql = new SQL_utils("backend");


        string cols = sql.GetAllColumnsInTable("uwautism_research_backend", master_tbl, schema, true);
        cols = cols.Replace(master_pk + ",", "");

        string where_clause = " where 1=1 ";
        
        string study_clause = "";
        if (usestudy)
        {
            study_clause = " and studyID = " + Master.Master_studyID.ToString();
        }


        string sqlcode = "select " + master_pk + " as master_pk, " + cols + " from "  + schema + "." + master_tbl + where_clause + study_clause;


        DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

        ogrid.Columns.Clear();
        ogrid.DataSource = dt;
        ogrid.DataBind();

        lblEntity.Text = master_tbl;

        sql.Close();
    }


    protected void LoadDetail(string master_tbl, string master_pk, string detail_tbl, string detail_pk, int master_pkvalue, bool usestudy)
    {
        LoadDetail("dbo", master_tbl, master_pk, detail_tbl, detail_pk, master_pkvalue, usestudy);
    
    }

    protected void LoadDetail(string schema, string master_tbl, string master_pk, string detail_tbl, string detail_pk, int master_pkvalue, bool usestudy)
    {


        int nselected = 0;

        if(ogrid.SelectedRecords != null)
        {
            nselected = ogrid.SelectedRecords.Count;


        }



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

        if(master_pkvalue > 0)
        {
            where_clause += " and " + master_pk + " = " + master_pkvalue.ToString();
        }


        string sqlcode = "select " + master_pk + " as master_pk, " + detail_pk + " as detail_pk, " + cols + " from " + schema + "." + detail_tbl + where_clause + study_clause;



        DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

        ogrid_detail.Columns.Clear();
        ogrid_detail.DataSource = dt;
        ogrid_detail.DataBind();

        lblEntity_detail.Text = detail_tbl; // +"   master_pk = " + master_pkvalue.ToString();

        lblOutput_detail.Text = "items for: " + master_pkvalue.ToString();


        ogrid_detail.Visible = true;

        sql.Close();
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

            string detail_pkval = hash["detail_pk"].ToString();
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
            string output = o.oGrid_UpdateData(hash, detail_tbl, "uwautism_research_backend", schema, detail_pk);

            lblOutput_detail.Text = output;

            LoadDetail(schema, master_tbl, master_pk, detail_tbl, detail_pk, master_pkvalue, usestudy);
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

            if (column.DataField == "master_pk" | column.DataField == "detail_pk" | column.DataField == "studyID")
            {
                //column.Visible = false;
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
            column.TemplateSettings.TemplateId = "Template2";
            column.TemplateSettings.HeaderTemplateId = "Template2";

            if (column.DataField == "master_pk" | column.DataField == "detail_pk" | column.DataField == "studyID")
            {
                column.Visible = false;
            }
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
}