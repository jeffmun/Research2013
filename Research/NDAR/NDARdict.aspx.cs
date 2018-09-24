using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
//using Newtonsoft.Json.Schema;
using uwac;


public partial class NDAR_NDARdict : BasePage 
{
    string shortName;

    protected void Page_Init(object sender, EventArgs e)
    {
        shortName = Request.QueryString["shortName"];
        Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);

    }

    //If the master page default study is changed, update the Measure DDL
    protected void Master_Study_Changed(object sender, EventArgs e)
    {
        LoadDataStructure(shortName);
    }


    protected void Page_Load(object sender, EventArgs e)
    {

        if(!IsPostBack)
        {
            //Only load when it is not a postback
            LoadDataStructure(shortName);
            LoadUWtable_names();
        }
        else
        {
            //if (ViewState["uwfldpos"] != null)
            //{
            //    DataTable dt = (DataTable)ViewState["uwfldpos"];
            //    gvTest.DataSource = dt;
            //    gvTest.DataBind();

            //}

        }

    }

 

    protected void LoadUWtable_names()
    {
        SQL_utils sql = new SQL_utils("data");

        DataTable tbls = sql.DataTable_from_SQLstring("Select name from datTable where name like 'ALL_%' order by name");

        ddlUWtables.DataSource = tbls;
        ddlUWtables.DataTextField = "name";
        ddlUWtables.DataValueField = "name";
        ddlUWtables.DataBind();

    }

    protected void LoadDataStructure(string shortName)
    {
        SQL_utils sql = new SQL_utils("data");

        string source = "UWAC DB";
        NDAR.NDAR_DataStructure ds = NDAR.GetNDARDataStructure(shortName);
        DataTable dt = NDAR.NDAR_DSE_from_DB(shortName);

        //Get the associated table
        string uwtable = sql.StringScalar_from_SQLstring("select coalesce(uwtable, 'NONE') uwtable from NDAR_DS where shortname = '" + shortName + "'");

        if(dt.Rows.Count==0)
        {
            dt = NDAR.NDARDataStructureElements_to_DataTable(ds);
            source = "NDAR";
        }

        v1.Text = ds.shortName;
        v2.Text = ds.title;
        v3.Text = ds.dataElements.Count.ToString();
        v4.Text = source ;

        string ndar_datadict_string = @"https://ndar.nih.gov/ndar_data_dictionary.html?short_name=" + shortName;

        //linkNDAR_DataDict.PostBackUrl = ndar_datadict_string;
        //linkNDAR_DataDict.Text = shortName;

        dynLink.NavigateUrl = ndar_datadict_string;
        dynLink.Text = shortName;


        gv_dataElements.DataSource = dt;
        gv_dataElements.DataBind();

        Panel_dataElements.Visible = true;

        if(uwtable!="NONE")
        {
            LoadUWfields(uwtable);
            ddlUWtables.Visible = false;
            btnShowUWtable.Visible = false;
            btnLinkUWtable.Visible = false;
        }
        else
        {
            Panel_UWtable.Visible = false;
        }

        List<SqlParameter> ps = new List<SqlParameter>();
        ps.Add(sql.CreateParam("shortname", shortName, "text"));
        ps.Add(sql.CreateParam("mode", "count", "text"));

        DataTable dt_uwflds = sql.DataTable_from_ProcName("def.spNDAR_matching_UWflds", ps);
        GridView gv = new GridView();
        gv.DataSource = dt_uwflds;
        gv.DataBind();
        panel_UWfldsinfo.Controls.Add(gv);


        sql.Close();

    }


    protected DataTable GetUWfields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("shortName", typeof(string));
        dt.Columns.Add("name", typeof(string));
        dt.Columns.Add("uword_pos", typeof(string));
        dt.Columns.Add("fx", typeof(string));
        dt.Columns.Add("param1", typeof(string));
        dt.Columns.Add("param2", typeof(string));


        string uwtable = lblUWtable.Text;
        string shortname = v1.Text;
        SQL_utils sql = new SQL_utils("data");

        int counter = 100;
        foreach (GridViewRow row in gv_dataElements.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                TextBox uwfldpos = (TextBox)row.FindControlRecursive("txtUWfld");
                string strpos = (uwfldpos != null) ? uwfldpos.Text : "0";
                decimal pos;

                bool haspos = decimal.TryParse(strpos, out pos);

                if (haspos & pos > 0)
                {
                    string uwfld = "";
                    //name of UWfld at this pos
                    foreach (GridViewRow uwrow in gvUWtable.Rows)
                    {
                        if (uwrow.Cells[0].Text == pos.ToString())
                        {
                            uwfld = uwrow.Cells[1].Text;  //get the name of the UWfld
                        }
                    }


                    DataRow newrow = dt.NewRow();

                    newrow["shortName"] = shortname;
                    newrow["name"] = row.Cells[2].Text;
                    newrow["uword_pos"] = uwfld;

                    

                    dt.Rows.Add(newrow);

                    //string sqlstring = "update NDAR_DSE set uwfield = b.databasefield " + 
                    //    " from dat FieldInfo b where b.databasetable = '" + uwtable + "' " +
                    //    " and b.ord_pos = " + uwfldpos.ToString() + 
                    //    " and NDAR_DSE.shortname = '" + shortname + "' " +
                    //    " and NDAR_DSE.name = '" + row.Cells[2] + "'" ;

                    ////sql.NonQuery_from_SQLstring(sqlstring);

                    //lblInfo.Text = sqlstring;
                }
            }
        }

        return dt;


    }

    protected void SaveFx(string shortName)
    {
        SQL_utils sql = new SQL_utils("data");

        string fromtopos = txtFromToPos.Text;
        int from = 0; int to = 0;

        if(fromtopos.Contains('-'))
        {
            string[] pos = fromtopos.Split('-');
            from = Convert.ToInt16(pos[0]);
            to = Convert.ToInt16(pos[1]);
        }
        else
        {
            from = Convert.ToInt16(fromtopos);
        }

        if(from > 0)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            p.Add(sql.CreateParam("shortName", shortName, "text"));
            p.Add(sql.CreateParam("fx", txtFx.Text, "text"));
            p.Add(sql.CreateParam("params", txtParams.Text, "text"));
            p.Add(sql.CreateParam("from", from.ToString(), "int"));
            p.Add(sql.CreateParam("to", to.ToString(), "int"));

            sql.NonQuery_from_ProcName("spNDAR_AddFx", p);
        }
        else
        {
            lblInfo.Text = "Enter valid From-To positions.";
        }

    }


    protected void ClearUWinfo(string shortName)
    {
        SQL_utils sql = new SQL_utils("data");

        string fromtopos = txtFromToPos.Text;
        int from = 0; int to = 0;

        if (fromtopos.Contains('-'))
        {
            string[] pos = fromtopos.Split('-');
            from = Convert.ToInt16(pos[0]);
            to = Convert.ToInt16(pos[1]);
        }
        else
        {
            from = Convert.ToInt16(fromtopos);
        }

        if (from > 0 & to > 0)
        {
            sql.NonQuery_from_SQLstring("update NDAR_DSE set uwfld=null, fx=null, param1=null, param2=null where shortname='" + shortName + "' " + 
                " and position >= " + from.ToString() + " and position <= " + to.ToString() );
        }
        else if (from > 0 )
        {
            sql.NonQuery_from_SQLstring("update NDAR_DSE set uwfld=null, fx=null, param1=null, param2=null where shortname='" + shortName + "' " +
                    " and position = " + from.ToString() );
        }
        else
        {
            lblInfo.Text = "Enter valid From-To positions.";
        }

    }





    protected void LoadUWfields(string uwtable)
    {
        SQL_utils sql = new SQL_utils("data");

        //// use the NDAR_hybrid_view to preempt the actual table name with the hybrid view that uses info from 2 tables 
        //string sql_code = "select a.*, b.uwfld as matchedname, b.required from
        //" +
        //        " ( Select a1.*, NDAR_hybrid_view from dat FieldInfo a1 " +
        //        "    join datTable a2 ON a1.databasetable = a2.name  " + 
        //        "    where coalesce(NDAR_hybrid_view, databasetable) = '" + uwtable + "') a " + 
        //        " left join " +
        //        " (select b2.name, uwfld, b2.required from NDAR_DS  b1" + 
        //        "  join NDAR_DSE b2 ON b1.shortName = b2.shortname " +
        //        "  where b1.uwtable = '" + uwtable +"') b ON a.databasefield = b.uwfld " + 
        //        "  order by ord_pos";

        string sql_code = "exec def.spUWflds '" + uwtable + "'";

        DataTable dt = sql.DataTable_from_SQLstring(sql_code);

        lblUWtable.Text = uwtable;
        gvUWtable.DataSource = dt;
        gvUWtable.DataBind();
        Panel_UWtable.Visible = true;

    }


    protected void btnSaveCSV_Click(object sender, EventArgs e)
    {
        string shortName = Request.QueryString["shortName"];
        NDAR.NDAR_DataStructure ds = NDAR.GetNDARDataStructure(shortName);
        DataTable dt = NDAR.NDARDataStructureElements_to_DataTable(ds);
        dt.TableName = "csv";

        SpreadsheetGearUtils.SaveDataTableToFile(dt, "testit", "csv");
    }

    protected void btnShowUWtable_Click(object sender, EventArgs e)
    {
        LoadUWfields(ddlUWtables.SelectedValue.ToString());

    }
    protected void btnSaveUWfields_Click(object sender, EventArgs e)
    {
        DataTable dt = GetUWfields();

        ViewState["uwfldpos"] = dt;
        gvTest.DataSource = dt;
        gvTest.DataBind();


        SQL_utils sql = new SQL_utils("data");

        SqlParameter p = sql.CreateParam("tbl", dt);

        sql.NonQuery_from_ProcName("spNDAR_DSE_updateUWfld", p);


        LoadDataStructure(shortName);
    }

    



    protected void btnSaveUWfields_Command(object sender, CommandEventArgs e)
    {

        DataTable dt = GetUWfields();

        ViewState["uwfldpos"] = dt;
    }
    protected void gv_dataElements_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType ==  DataControlRowType.DataRow)
        {
            TextBox uwfldpos = (TextBox)e.Row.FindControlRecursive("txtUWfld");


            var data = e.Row.DataItem as DataRowView;

            // if required highlight the row
            if (data["required"].ToString() == "Required")
            {
                if(!string.IsNullOrEmpty(data["uwfld"].ToString()))
                {
                    e.Row.BackColor = Color.LightSkyBlue;
                }
                else 
                {
                    List<string> skip = new List<string> { "subjectkey", "src_subject_id", "gender" };
                    if(skip.Contains(data["name"]))
                    {
                        e.Row.BackColor = Color.LightSkyBlue;
                    }
                    else if (!string.IsNullOrEmpty(data["fx"].ToString()) & !string.IsNullOrEmpty(data["params"].ToString()))
                    {
                        e.Row.BackColor = Color.Lavender;
                    }
                    else
                    {
                        e.Row.BackColor = Color.Red;
                    }
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(data["uwfld"].ToString()))
                {
                    e.Row.BackColor = Color.PowderBlue;
                }
            }

            // replace request name with a link
            if (data.DataView.Table.Columns["uwfld"] != null)
            {
                // get the request name
                string uwfld = data["uwfld"].ToString();
                // get the column index
                //int idx = data.Row.Table.Columns["Request Name"].Ordinal;

                if (uwfld == "" | uwfld == null)
                {
                    uwfldpos.Visible = true;
                }
                else
                {
                    uwfldpos.Visible = false;
                }

                string ndar_name = data["name"].ToString();
                if (ndar_name == "subjectkey" | ndar_name == "src_subject_id" | ndar_name == "gender")
                {
                    uwfldpos.Visible = false;
                }


            }
        }
    }


    protected void btnSaveFx_Click(object sender, EventArgs e)
    {

        SaveFx(v1.Text);
        LoadDataStructure(v1.Text);
    }
    protected void btnClearUWinfo_Click(object sender, EventArgs e)
    {
        ClearUWinfo(v1.Text);
        LoadDataStructure(v1.Text);
    }
    protected void btnLinkUWtable_Click(object sender, EventArgs e)
    {
        SQL_utils sql = new SQL_utils();
        sql.NonQuery_from_SQLstring("update NDAR_DS set uwtable='" + ddlUWtables.SelectedValue + "' where shortname='" + Request.QueryString["shortName"] + "'");
        sql.Close();

        LoadUWfields(ddlUWtables.SelectedValue);
    }
    protected void gvUWtable_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var data = e.Row.DataItem as DataRowView;

            // if field is already matched highlight the row
            if (!string.IsNullOrEmpty(data["matchedname"].ToString()))
            {
                if (data["required"].ToString() == "Required")
                {
                    e.Row.BackColor = Color.LightSkyBlue;
                }
                else
                {
                    e.Row.BackColor = Color.PowderBlue;
                }
            }
        }
    }
    protected void btnLinkMatched_Click(object sender, EventArgs e)
    {
        shortName = Request.QueryString["shortName"];

        SQL_utils sql = new SQL_utils();

        List<SqlParameter> ps = new List<SqlParameter>();
        ps.Add(sql.CreateParam("shortname", shortName, "text"));
        ps.Add(sql.CreateParam("mode", "link", "text"));

        sql.NonQuery_from_ProcName("def.spNDAR_matching_UWflds", ps);

        sql.Close();

        LoadDataStructure(shortName);

    }
}