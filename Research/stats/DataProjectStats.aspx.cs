using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class stats_DataProjectStats : System.Web.UI.Page
{
    public int dataproj_pk = 0;
    public string filename;

    #region PAGE SETUP
    //raise events on content page for the buttons on master page
    protected void Page_Init(object sender, EventArgs e)
    {
        Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
    }

    //If the master page default study is changed, update the Measure DDL
    protected void Master_Study_Changed(object sender, EventArgs e)
    {
        Response.Redirect("~/stats/DataProject.aspx");
    }

    //public override void VerifyRenderingInServerForm(Control control)
    //{
    //    /* Verifies that the control is rendered */
    //}



    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack)
        {

        }

        if (!IsPostBack)
        {

            filename = Request.QueryString["filename"].ToString();
            dataproj_pk = Convert.ToInt32(Request.QueryString["pk"].ToString());


            if (filename != "")
            {
                LoadDescstats(filename);
            }
            if(dataproj_pk > 0)
            {
                LoadMeasures(dataproj_pk);
                btnReturn.PostBackUrl = "~/stats/DataProject.aspx?pk=" + dataproj_pk.ToString();
            }

        }

    }
    #endregion


    protected void LoadMeasures(int pk)
    {
        SQL_utils sql = new SQL_utils();

        string sqlcode = "select Measname, fldname as VarName, fieldlabel as Label, FieldDataType as DataType   " + 
                   " from dp.Var a                                                                              " + 
                   " join def.fld b ON a.fldpk = b.fldpk                                                        " + 
                   " join def.tbl c ON b.tblpk = c.tblpk                                                        " + 
                   " join uwautism_research_backend..tblmeasure d ON c.measureID = d.measureID                  " + 
                   " where dataproj_pk = " + dataproj_pk.ToString();


        DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

        DataSet ds = sql.DataSet_from_ProcName("spDescstats_1", sql.CreateParam("pk", dataproj_pk.ToString(), "int"));

        GridView gv = new GridView();
        gv.DataSource = ds.Tables[0];
        gv.DataBind();

        panelMeasures.Controls.Add(gv);

        GridView gv2 = new GridView();
        gv2.DataSource = ds.Tables[1];
        gv2.DataBind();
        panelVariables.Controls.Add(gv2);

    }

    
    
    protected void LoadDescstats(string filename)
    {
        DataSet dset_descstats = new DataSet();

        if (File.Exists(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + filename)))
        {
            //convert to .xls here
            try
            {
                dset_descstats = SpreadsheetGearUtils.GetDataSet(filename);

                int g = 0;

            }
            catch (Exception ex)
            {
				string x = ex.Message;
				string result = "Sorry, the file [" + filename + "] was unable to load.  Create a new Excel file to generate the latest descriptive stats.";
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);

            }
        }
        else
        {

            string data_filename = filename.Replace("DescStats", "Data");

            DataSet dset = SpreadsheetGearUtils.GetDataSet(data_filename);
            int dataproj_pk = Convert.ToInt32(Request.QueryString["pk"]);
            if (dataproj_pk > 0 & dset != null & dset.Tables.Count > 0)
            {

                dset_descstats = utilDataProject.DataProject_Descstats(dataproj_pk, dset);

                SpreadsheetGearUtils.SaveDataSetToExcel(dset_descstats, filename, false, "xlsx");

                int g = 0;
            }
            else
            {
                string result = "Sorry, the file [" + filename + "] was not found.";
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);

            }

        }

        if (dset_descstats != null & dset_descstats.Tables.Count > 0)
        {

            foreach (DataTable dt in dset_descstats.Tables)
            {
                if(dt.TableName == "fileinfo")
                {
                    GridView gv = new GridView();
                    gv.DataSource = dt;
                    gv.DataBind();
                    panel0.Controls.Add(gv);
                }
                else {
                var dtSorted = dt.AsEnumerable()
                   .OrderBy(r => r.Field<string>("Measure"))
                   .ThenBy(r => r.Field<string>("Varname"))
                   .ThenBy(r => r.Field<string>("TimePoint"))
                   .CopyToDataTable();


                GridView gv = new GridView();
                gv.RowDataBound += gv_RowDataBound;
                gv.AllowSorting = true;
                gv.DataSource = dtSorted;
                gv.DataBind();


                Label lbl = new Label();
                lbl.Text = " By " + dt.TableName;
                lbl.Font.Bold = true;
                lbl.Font.Size = 12;
                Literal lit = new Literal();
                lit.Text = "<br/><br/>";

                panel1.Controls.Add(lbl);
                panel1.Controls.Add(gv);
                panel1.Controls.Add(lit);
                }
            }
        }


    }

    void gv_DataBinding(object sender, EventArgs e)
    {
        throw new NotImplementedException();
    }

    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        List<string> hidecols = new List<string> { "IVs", "Mode", "Sum" };


        if(e.Row.RowType == DataControlRowType.Header)
        {
            foreach (DataControlFieldCell cell in e.Row.Cells)
            {
                BoundField field = (BoundField)(cell.ContainingField);
                if (hidecols.Contains(field.HeaderText))
                {
                    cell.Visible = false;
                }
            }
        }
        else if(e.Row.RowType == DataControlRowType.DataRow)
        {

            GridView gv = (GridView) sender;
            List<string> roundit = new List<string> {"M","SD","Median","Mode","Min","Max","Sum","Skewness","Kurtosis"};


                foreach (DataControlFieldCell cell in e.Row.Cells)
                {
                    BoundField field = (BoundField)(cell.ContainingField);
                    if (roundit.Contains(field.HeaderText))
                    {
                        if (cell.Text != "" & cell.Text !="&nbsp;")
                        {
                            //String.Format("{0:F2}", 
                            string x =  Math.Round(Convert.ToDouble(cell.Text), 2).ToString(); 
                            cell.Text = x;
                        }
                    }


                    if (field.HeaderText == "M")
                    {
                        cell.Font.Bold = true;
                    }
                    else if (field.HeaderText == "SD")
                    {
                        cell.Font.Bold = true;
                    }
                    else if (field.HeaderText == "N")
                    {
                        cell.Font.Bold = true;
                        cell.ForeColor = System.Drawing.Color.DodgerBlue;
                    }
                    else if (field.HeaderText == "Nunq")
                    {
                        cell.ForeColor = System.Drawing.Color.Gray;
                    }
                    else if (field.HeaderText == "Min" | field.HeaderText == "Max")
                    {
                        cell.ForeColor = System.Drawing.Color.ForestGreen;
                    }
                    else if (field.HeaderText == "Skewness" | field.HeaderText == "Kurtosis")
                    {
                        cell.Font.Italic = true;
                        cell.ForeColor = System.Drawing.Color.Gray;
                    }
                    else if (hidecols.Contains(field.HeaderText))
                    {
                        cell.Visible = false;
                    }
                }



        }
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {


    }
}