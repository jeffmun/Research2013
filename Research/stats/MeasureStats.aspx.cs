using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.XtraPivotGrid;
using uwac;


public partial class stats_MeasureStats : System.Web.UI.Page
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
        Response.Redirect("~/info/MeasureList.aspx");
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

            PopulateDescByOptions();
            PopulateTokens();
        }

    }
    #endregion


    protected void PopulateDescByOptions()
    {


        SQL_utils sql = new SQL_utils("backend");

        int num_timepoints = sql.IntScalar_from_SQLstring("select count(*) as n from tblTimePoint where studyID = " + Master.Master_studyID.ToString());

        List<int> tx_studies = new List<int>() { 1011,1015,1022,1030,1039,1065,1072,1076,1077};

        if (num_timepoints > 0 & tx_studies.Contains( Master.Master_studyID))
        {
            DescByTokenBox.Items.Add("TimePoint");
            DescByTokenBox.Items.Add("TimePoint,Group");
            DescByTokenBox.Items.Add("TimePoint,TxGrp");
            DescByTokenBox.Tokens.Add("TimePoint");
            DescByTokenBox.Tokens.Add("TimePoint,Group");
            DescByTokenBox.Tokens.Add("TimePoint,TxGrp");
        }
        else if (num_timepoints > 0)
        {
            DescByTokenBox.Items.Add("TimePoint");
            DescByTokenBox.Items.Add("TimePoint,Group");
            DescByTokenBox.Tokens.Add("TimePoint");
            DescByTokenBox.Tokens.Add("TimePoint,Group");
        }
        else
        {
            DescByTokenBox.Items.Add("Group");
            DescByTokenBox.Items.Add("Subject Status");
            DescByTokenBox.Tokens.Add("Group");
            DescByTokenBox.Tokens.Add("Subject Status");
        }

        if (Master.Master_studyID == 1076)
        {
            DescByTokenBox.Items.Add("TimePoint,TxType");
            DescByTokenBox.Items.Add("TimePoint,TxIntensity"); 
            DescByTokenBox.Items.Add("TimePoint,TxType,TxIntensity");
        }



        sql.Close();

    }

    protected void PopulateTokens()
    {
        string sqlcode = "select measname, measureID from tblMeasure where measureID in (select measureID from tblstudymeas where studyid = " + Master.Master_studyID.ToString() + ") order by measname";
        PopulateTokenBox(MeasTokenBox, sqlcode, "measname", "measureID", false);

        sqlcode = "select timepoint_text, timepointID from tblTimepoint where studyid = " + Master.Master_studyID.ToString() + " order by timepoint";
        PopulateTokenBox(TimepointTokenBox, sqlcode, "timepoint_text", "timepointID", true);

        sqlcode = "select groupname, groupID from tblGroup where studyid = " + Master.Master_studyID.ToString();
        PopulateTokenBox(GroupTokenBox, sqlcode, "groupname", "groupID", true);

        sqlcode = "select subjstatusID, subjstatus from vwMasterStatus_S where studyid = " + Master.Master_studyID.ToString() + " group by  subjstatusID, subjstatus";
        PopulateTokenBox(SubjstatusTokenBox, sqlcode, "subjstatus", "subjstatusID", true);


    }


    protected ASPxTokenBox  PopulateTokenBox(ASPxTokenBox tokenbox, string sqlcode, string textfield, string valuefield, bool preselected)
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = sql.DataTable_from_SQLstring(sqlcode );

        foreach (DataRow row in dt.Rows)
        {
            ListEditItem lei = new ListEditItem();
            lei.Value = row[valuefield];
            lei.Text = row[textfield].ToString();
            tokenbox.Items.Add(lei);
            if (preselected)
            {
                //Do not preselect
                List<string> donotpreselect = new List<string> {"DQ", "Not Enrolled"};
                if(!donotpreselect.Contains (row[textfield]) ) tokenbox.Tokens.Add(row[textfield].ToString());
            }
        }

        sql.Close();


        return tokenbox;
    }




    protected void LoadMeasures(DataSet ds)
    {

        GridView gv = new GridView();
        gv.DataSource = ds.Tables["Measures"];
        gv.DataBind();

        panelMeasures.Controls.Add(gv);

        GridView gv2 = new GridView();
        gv2.DataSource = ds.Tables["DataDict"];
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
            catch (Exception )
            {
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

                gv.CssClass = "GridViewClass";


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
            int varnameIndex = 1;
            GridView gv = (GridView) sender;


            if (e.Row.DataItemIndex == 0)
            {
                e.Row.Cells[varnameIndex].BackColor = System.Drawing.Color.White;
            }
            else
            {
                var thisRow = e.Row;
                var prevRow = gv.Rows[e.Row.DataItemIndex - 1];

                Color prevcolor = prevRow.Cells[varnameIndex].BackColor;
                Color altcolor = (prevcolor == Color.White) ? Color.Gainsboro : Color.White;

                Color usecolor = (thisRow.Cells[varnameIndex].Text == prevRow.Cells[varnameIndex].Text) ? prevcolor : altcolor;
                thisRow.Cells[varnameIndex].BackColor = (thisRow.Cells[varnameIndex].Text == prevRow.Cells[varnameIndex].Text) ? prevcolor : altcolor;
                e.Row.BackColor = usecolor;

            }
            


            #region format the cells
            List<string> roundit = new List<string> { "M", "SD", "Median", "Pctile25", "Pctile75","IQR","MinZ","MaxZ", "Mode", "Min", "Max", "Sum", "Skewness", "Kurtosis" };

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
                    cell.Font.Italic = true;
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
                else if (field.HeaderText == "N_LT1pt5IQR" | field.HeaderText == "N_GT1pt5IQR")
                {
                    if (cell.Text != "" & cell.Text != "&nbsp;")
                    {
                        //String.Format("{0:F2}", 
                        int x = Convert.ToInt32(cell.Text);
                        if (x > 0)
                        {
                            cell.Font.Bold = true;
                            cell.ForeColor = System.Drawing.Color.Red;
                        }
                    }

                }
                else if (hidecols.Contains(field.HeaderText))
                {
                    cell.Visible = false;
                }
            }
            #endregion


        }
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {


    }


    protected void btnGetDescstats_Click(object sender, EventArgs e)
    {
        lblMode.Text = "Descriptive Statistics";


        DataSet dset = GetSelectedData();

        List<IVset> ivs = GetSelectedIVsets();

        DataSet dset_descstats = utilDataProject.DataProject_Descstats( dset, ivs);  // by default: TP, Group, txgrp


        if (dset_descstats != null)
        {
            LoadMeasures(dset);
            Display_DescStats(dset_descstats);

        }
        
    }

    protected void btnGetNs_Click(object sender, EventArgs e)
    {
        lblMode.Text = "N's";

        DataSet dset = GetSelectedData();

        List<IVset> ivs = GetSelectedIVsets();

        DataSet dset_descstats = utilDataProject.DataProject_Descstats(dset, ivs);  // by default: TP, Group, txgrp


        if (dset_descstats != null)
        {
            LoadMeasures(dset);
            DisplayNs(dset_descstats);

        }

    }




    protected List<IVset> GetSelectedIVsets() 
    {
        //Define the IVsets (set of vars over which to calculate descriptive stats)
        List<string> DescBy = DescByTokenBox.Tokens.ToList();
        List<IVset> ivs = new List<IVset>();

        foreach (string s in DescByTokenBox.Tokens.ToList())
        {
            if (s.Contains(","))
            {
                List<string> ss = s.Split(',').ToList();
                ivs.Add(new IVset() { IVs = ss });
            }
            else
            {
                ivs.Add(new IVset() { IVs = new List<string> { s } });
            }
        }

        return ivs;
    }


    protected DataSet GetSelectedData()
    {

        List<string> measures = MeasTokenBox.Tokens.ToList();
        List<string> timepoints = TimepointTokenBox.Tokens.ToList();
        List<string> groups = GroupTokenBox.Tokens.ToList();
        List<string> subjstatuses = SubjstatusTokenBox.Tokens.ToList();


        DataSet dset = utilDataProject.DataProject_Populate(Master.Master_studyID
            , MeasTokenBox.Value.ToString()
            , TimepointTokenBox.Value.ToString()
            , GroupTokenBox.Value.ToString()
            , SubjstatusTokenBox.Value.ToString());

        return dset;
    }



    protected void DisplayNs(DataSet dset_descstats )
    {

        foreach (DataTable dt in dset_descstats.Tables)
        {
            ASPxPivotGrid pivot = new ASPxPivotGrid();
            pivot.OptionsView.ShowColumnTotals = false;
            pivot.OptionsView.ShowColumnGrandTotals = false;
            pivot.OptionsView.ShowRowTotals = false;
            pivot.OptionsView.ShowRowGrandTotals = false;
            pivot.OptionsView.ShowFilterHeaders = false;
            pivot.OptionsPager.RowsPerPage = 0;


            pivot.DataSource = dt;
            panel1.Controls.Add(pivot);

            pivot.RetrieveFields();

            pivot.Fields["Measure"].Area = PivotArea.RowArea;
            pivot.Fields["Varname"].Area = PivotArea.RowArea;
            pivot.Fields["N"].Area = PivotArea.DataArea;


            List<string> ivs = dt.TableName.Split(',').ToList();

            foreach(string s in ivs)
            {
                pivot.Fields[s].Area = PivotArea.ColumnArea;
            }

            Literal lit = new Literal();
            lit.Text = "<br/><br/>";

            panel1.Controls.Add(lit);
        }


    }


    protected void Display_DescStats(DataSet dset_descstats)
    {
        if (dset_descstats != null & dset_descstats.Tables.Count > 0)
        {

            foreach (DataTable dt in dset_descstats.Tables)
            {
                if (dt.TableName == "fileinfo")
                {
                    GridView gv = new GridView();
                    gv.DataSource = dt;
                    gv.DataBind();
                    panel0.Controls.Add(gv);
                }
                else
                {
                    string tblname = dt.TableName;

                    List<string> sortby = tblname.Split(',').ToList();

                    var dtSorted = new DataTable();

                    if (sortby.Count == 1)
                    {
                        dtSorted = dt.AsEnumerable()
                           .OrderBy(r => r.Field<string>("Measure"))
                           .ThenBy(r => r.Field<string>("Varname"))
                           .ThenBy(r => r.Field<string>(sortby[0]))
                           .CopyToDataTable();
                    }
                    else if (sortby.Count == 2)
                    {
                        dtSorted = dt.AsEnumerable()
                           .OrderBy(r => r.Field<string>("Measure"))
                           .ThenBy(r => r.Field<string>("Varname"))
                           .ThenBy(r => r.Field<string>(sortby[0]))
                           .ThenBy(r => r.Field<string>(sortby[1]))
                           .CopyToDataTable();
                    }
                    else if (sortby.Count == 3)
                    {
                        dtSorted = dt.AsEnumerable()
                           .OrderBy(r => r.Field<string>("Measure"))
                           .ThenBy(r => r.Field<string>("Varname"))
                           .ThenBy(r => r.Field<string>(sortby[0]))
                           .ThenBy(r => r.Field<string>(sortby[1]))
                           .ThenBy(r => r.Field<string>(sortby[2]))
                           .CopyToDataTable();
                    }


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

     
}