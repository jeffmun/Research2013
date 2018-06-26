using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.IO;

//using System.Reactive.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using SpreadsheetGear;
using Obout.Grid;
using NReco.PivotData;
using NReco.PivotData.File;
using NReco.PivotData.Output;

using uwac;
using uwac_controls;

/// <summary>
/// to do:
/// 1. import non-AE FTE for staff
/// 2. add the FTE data to the monthly budget import
/// </summary>



/*
 * query to populate the grids to edit the future projections:
 * ---------------------------------------------------------------
 *  FTE                                                 OBJ 
 * fin.vwFTE_FutureMo_with_TOTALS_by_staff              fin.vwOBJ_FutureMo_with_TOTALS_by_budgetNbr
 * fin.vwFTE_FutureMo_with_TOTALS_by_budgetNbr
 * 
 * 
 * proc to update a future projection:
 * ---------------------------------------------------------------
 * fin.spFTE_FutureMo_UPDATE                            fin.spOBJ_FutureMo_UPDATE
 * 
 * 
 * query to populate the Past/Projected Pivot Tables:
 * ---------------------------------------------------------------
 * fin.vwProjections
 * 
 * fin.vwFTE_Previous_and_Projections
 * 
 * 
 * 
 * NOTES:
 * del monthly avg in Oper pivot
 * check why match FTE & 01+07 don't match
 * 
 * need FY window  7/1  - 6/30  (12 mos)
 * 
 * need a budget YR  start - end (12 mos)
 * 
 * add edit REV futuremo
 * 
 * 
 */


public partial class Testing_FTE : System.Web.UI.Page
{
    private int num_cols_before_FTE = 5;
    private int num_cols_before_OBJ = 5;
    private int num_cols_before_REV = 3;


    //NReco.PivotData.License.SetLicenseKey(
    //"PivotDataToolkit_Bin_Pack_000426121678",
    //"Galv8kCqIiZYLGq5Qoc+ymn8Jo57iNuWgMqZ9vrpjfdSLkiqGpTC0AtpV7VHn1GyhoEorRfIEi27UOgJf28o+2KlKuOnrPlO/FxCV4+qUTTWL7LyP/HmhYZdeI4kox5pyThzUZb36ijxsfXzAMlFzpv3uDtPtu6ktwtiROwKG/c=");



    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        {
            LoadStaffDDL();
            Load_Select2_controls();


        }
    }


    #region Populate Controls on Page Load


    protected void LoadStaffDDL()
    {

        SQL_utils sql = new SQL_utils("backend");

        GridView gv = new GridView();
        DataTable dt_staff = new DataTable();

        string sql_staff_not_in_budget = "select idnbr, FirstMiddleLastName from fin.tempFTE_with_NETID " +
            " where idnbr not in (select idnbr from fin.tempFTE_with_NETID where budgetnbr in ('" + utilSelect2.getselected_CSVval(selBudgets, "','") + "')" + " ) " +
            " group by IdNbr, FirstMiddleLastName order by FirstMiddleLastName";

        dt_staff = sql.DataTable_from_SQLstring(sql_staff_not_in_budget);

        ddlStaff.DataSource = dt_staff;
        ddlStaff.DataValueField = "idnbr";
        ddlStaff.DataTextField = "FirstMiddleLastName";
        ddlStaff.DataBind();

        sql.Close();
    }

    protected void LoadAddStaffDDL()
    {

        SQL_utils sql = new SQL_utils("backend");

        GridView gv = new GridView();
        DataTable dt_staff = new DataTable();

        string sql_staff_not_in_budget = "select idnbr, FirstMiddleLastName from fin.tempFTE_with_NETID " +
            " where idnbr not in (select idnbr from fin.tempFTE_with_NETID where budgetnbr in ('" + utilSelect2.getselected_CSVval(selBudgets, "','") + "')" + " ) " +
            " group by IdNbr, FirstMiddleLastName order by FirstMiddleLastName";

        dt_staff = sql.DataTable_from_SQLstring(sql_staff_not_in_budget);


        DropDownList ddlAddStaff = (DropDownList)Grid2.Templates[1].Container.FindControl("ddlAddStaff");

        ddlAddStaff.DataSource = dt_staff;
        ddlAddStaff.DataValueField = "idnbr";
        ddlAddStaff.DataTextField = "FirstMiddleLastName";
        ddlAddStaff.DataBind();

        sql.Close();
    }



    protected void LoadMyBudgets()
    {

        SQL_utils sql = new SQL_utils("backend");

        GridView gv = new GridView();
        DataTable dt_stack = new DataTable();

        dt_stack = sql.DataTable_from_SQLstring("select * from fin.vwMyBudgets order by sortorder");

        Grid_MyBudgets.DataSource = dt_stack;
        Grid_MyBudgets.DataBind();

        Grid_MyBudgets.Visible = true;
        sql.Close();
    }



    protected void Load_Select2_controls()
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = sql.DataTable_from_SQLstring("select budgetNbr, budgetName + ' (' + budgetNbr + ')' as budgetName " +
                " from fin.vwMyBudgets where enddate > getdate() order by sortorder");
        utilSelect2.loaditems(selBudgets, dt, "budgetNbr", "budgetName");

        List<string> dims = new List<string> { "budgetNbr", "FY", "PastProj", "amttype", "caldate", "Direct","ObjDesc" };
        utilSelect2.loaditems(selRows, dims);
        utilSelect2.loaditems(selCols, dims);
        utilSelect2.loaditems(selFY, new List<string> { "BudgetPeriod","FY2014", "FY2015", "FY2016", "FY2017", "FY2018", "FY2019", "FY2020" });
        utilSelect2.loaditems(selFunctions, new List<string> { "Sum", "Monthly Avg", "N Months","Count" });


        utilSelect2.selectitems(selCols, new List<string> { "budgetNbr", "FY", "PastProj", "amttype" });
        utilSelect2.selectitems(selRows, new List<string> { "Direct","ObjDesc" });
        utilSelect2.selectitems(selFY, new List<string> { "FY2016", "FY2017" });
        utilSelect2.selectitems(selFunctions, new List<string> { "Sum", "N Months" });


        //UpdatePanel_O_CheckBoxes up1 = new UpdatePanel_O_CheckBoxes(dt, "up1", "Budgets", "budgetName", "budgetNbr", "text", "0");
        //up1.ID = "up1";
        //up1.Visible = false;
        //panelBudgets.Controls.Add(up1);


        sql.Close();
    }


    #endregion




    #region Show and Hide 
    protected void HideEditingGrids()
    {
        //Grid1.Visible = false;
        Grid2.Visible = false;
        Grid3.Visible = false;
        Grid4.Visible = false;
        GridMeta_Budget.Visible = false;

        lblError.Text = "";
        lblError.Visible = false;

        ddlStaff.SelectedIndex = -1;

        panelEditButtons.Visible = false;
        panelEditStaffButtons.Visible = false;

        rblObjectsToEdit.Visible = true;
        btnEditProjections.Visible = true;
    }


    protected void btnHideGrid2_Click(object sender, EventArgs e)
    {
        HideEditingGrids();
    }


    protected void ToggleVisibility(string usethis)
    {
        List<string> edits = new List<string> { "Single Staff FTE", "All Staff FTE", "Expenses", "Revenue", "none" };

        if (edits.Contains(usethis))
        {
            //Grid1.Visible = false;
            Grid2.Visible = false;
            Grid3.Visible = false;
            Grid4.Visible = false;

            panel_TOTAL.Visible = false;
            panelPlots_TOTAL.Visible = false;

            panel_FTE.Visible = false;
            panelPlots_FTE.Visible = false;


            switch (usethis)
            {
                case "Single Staff FTE":
                    Grid2.Visible = true;
                    break;
                case "All Staff FTE":
                    Grid2.Visible = true;
                    break;
                case "Expenses":
                    Grid3.Visible = true;
                    break;
                case "Revenue":
                    Grid4.Visible = true;
                    break;

            }
        }
        else
        {
            //Grid1.Visible = false;
            Grid2.Visible = false;
            Grid3.Visible = false;
            Grid4.Visible = false;

            switch (usethis)
            {
                case "Totals":
                    panel_TOTAL.Visible = true;
                    panelPlots_TOTAL.Visible = true;
                    break;
                case "Totals_FTE":
                    panel_FTE.Visible = true;
                    panelPlots_FTE.Visible = true;
                    break;
            }
        }



    }


    
    #endregion


    #region Pivot Table to display Totals and FTE
    protected void LoadProjections_TOTALS(List<string> list_budgetNbrs, List<string> list_fy, List<string> rows, List<string> cols, List<string> functions)
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = new DataTable();
        string sql_code;


        if (1==1)
        {
            sql_code = "select 1 as const, * from fin.vwProjections " +
                " where budgetNbr in ('" + String.Join("','", list_budgetNbrs) + "') and FY in ( '" + String.Join("','", list_fy) + "')" +
                " and amttype not in ('Endowment','Revenue','BalancePrior','NonEndowment')";

        }
        //else if (ddlFY.SelectedValue.ToString() == "Custom")
        //{
        //    sql_code = "select  1 as const, * from fin.vwOBJ_Previous_and_Projections " +
        //        " where budgetNbr in ('" + String.Join("','", list_budgetNbrs) + "') and mo >= '" + txtFrom.Text + "' and mo <= '" + txtTo.Text + "'";

        //}
        //else if (list_fy.Contains("Current Budget Yr"))
        //{
        //    sql_code = "select  1 as const,  * from fin.vwProjections " +
        //        " where budgetNbr in ('" + String.Join("','", list_budgetNbrs) + "') and BY='Current'";
        //}


        dt = sql.DataTable_from_SQLstring(sql_code);

        sql.Close();


        List<string> stats = new List<string> { "Sum", "N" };


        List<string> keepCols = new List<string>();
        keepCols.AddRange(rows);
        keepCols.AddRange(cols);


        //IAggregatorFactory[] aggs = new IAggregatorFactory[2];
        //SumAggregatorFactory sumAggr = new SumAggregatorFactory("amt");
        //CountAggregatorFactory countAggr = new CountAggregatorFactory();
        //aggs[0] = sumAggr;
        //aggs[1] = countAggr;

        PivotData cube;
        PivotTable pivotTable;
        string[] aggr_labels = new string[functions.Count];

        if(functions.Count > 1)
        {
            IAggregatorFactory[] aggs = new IAggregatorFactory[functions.Count];

            for (int f = 0; f < functions.Count; f++ )
            {
                if (functions[f] == "Sum") { 
                    aggs[f] = new SumAggregatorFactory("amt");
                    aggr_labels[f] = "Total";
                }
                else if (functions[f] == "Monthly Avg")
                {
                    aggs[f] = new AverageAggregatorFactory("amt");
                    aggr_labels[f] = "Monthly Avg";
                }
                else if (functions[f] == "N Months")
                {
                    aggs[f] = new CountUniqueAggregatorFactory("caldate");
                    aggr_labels[f] = "N Months";
                }
                else if (functions[f] == "Count")
                { 
                    aggs[f] = new CountAggregatorFactory();
                    aggr_labels[f] = "Count";
                }
            }

            CompositeAggregatorFactory compositeFactory = new CompositeAggregatorFactory(aggs);

            cube = new PivotData(keepCols.ToArray(), compositeFactory);
            cube.ProcessData(new DataTableReader(dt));
            pivotTable = new PivotTable(rows.ToArray(), cols.ToArray(), cube);

        }
        else
        {
            switch(functions[0])
            {
                case "Sum":
                    cube = new PivotData(keepCols.ToArray(), new SumAggregatorFactory("amt"));
                    break;
                case "Monthly Avg":
                    cube = new PivotData(keepCols.ToArray(), new AverageAggregatorFactory("amt"));
                    break;
                case "N Months":
                    cube = new PivotData(keepCols.ToArray(), new CountUniqueAggregatorFactory("caldate"));
                    break;
                default:
                    cube = new PivotData(keepCols.ToArray(), new CountAggregatorFactory());
                    
                    break;
            }
            cube.ProcessData(new DataTableReader(dt));
            pivotTable = new PivotTable(rows.ToArray(), cols.ToArray(), cube);

        }


        //The following assumes that there is a PivotTable object named "pivotTable" that has been created
        var pvtDataTableWr = new PivotTableDataTableWriter("out");
        DataTable dtpivot = pvtDataTableWr.Write(pivotTable);

        DataColumn colcumsum = new DataColumn("cumsum", typeof(decimal));
        dtpivot.Columns.Add(colcumsum);

        List<decimal> cumsum = new List<decimal>();
        decimal runningtotal = 0;

        for (int i = 0; i < dtpivot.Rows.Count; i++)
        {
            string val = dtpivot.Rows[i][2].ToString();
            decimal d;
            if (decimal.TryParse(val, out d))
                d = (d == 0) ? 0 : d;

            runningtotal += d;
            cumsum.Add(runningtotal);
            dtpivot.Rows[i]["cumsum"] = runningtotal;
        }

        




        var htmlResult = new StringWriter();

        var pvtHtmlWr = new MyHtmlWriter2(htmlResult);

        if (functions.Count >= 1)
        {
            pvtHtmlWr.FormatValue = (aggr, idx) =>
            {

                string newval = (Convert.ToDouble(aggr.Value.ToString()) >= 0) ? String.Format("{0:n0}", aggr.Value) : "<div class=\"negcell\">" + String.Format("{0:n0}", aggr.Value) + "</div>";
                return newval;
            };

            //pvtHtmlWr.FormatValue = (aggr, idx) => { return String.Format("{0:0}", aggr.Value); };
            pvtHtmlWr.FormatMeasureHeader = (aggr, idx) => { return aggr_labels[idx]; };

        }
        else 
        {
            //pvtHtmlWr.FormatValue(aggr, idx) =>
            //{

            //    string newval = (Convert.ToDouble(aggr.Value.ToString()) >= 0) ? String.Format("{0:n0}", aggr.Value) : "<div class=\"negcell\">" + String.Format("{0:n0}", aggr.Value) + "</div>";
            //    return newval;
            //};
        }
        

        pvtHtmlWr.RowHeaderClass = "row1";
        pvtHtmlWr.ColumnHeaderClass = "col1";
        pvtHtmlWr.MeasureHeaderClass = "meashead";


        pvtHtmlWr.SubtotalDimensions = new string[] {"Direct"};
        pvtHtmlWr.SubtotalRows = true;

        pvtHtmlWr.AllowHtml = true;
        pvtHtmlWr.TotalsColumn = true;
        pvtHtmlWr.TotalsRow = true;
        pvtHtmlWr.GrandTotal = true;

        pvtHtmlWr.Write(pivotTable);


        Label header = new Label();
        header.Text = "<br/>Budget Totals";
        header.Font.Size = 12;
        header.Font.Bold = true;

        Literal lit = new Literal();

        lit.Text = htmlResult.ToString();

        panel_TOTAL.Controls.Add(header);
        panel_TOTAL.Controls.Add(lit);

        ToggleVisibility("Totals");

        //plot
        if (chkPlot.Checked == true)
        {
            Literal totplot = PlotStackedCol_TOTAL_byBudgetNbr(dt);

            panelPlots_TOTAL.Controls.Add(totplot);
        }
    }




    protected void LoadProjections_FTE(List<string> list_budgetNbrs, List<string> list_fy)
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = new DataTable();
        string sql_code;


        if (1==1)
        {
            sql_code = "select * from fin.vwFTE_Previous_and_Projections " +
                " where budgetNbr in ('" + String.Join("','", list_budgetNbrs) + "') and FY in ( '" + String.Join("','", list_fy) + "')";
        }
        //else if (ddlFY.SelectedValue.ToString() == "Custom")
        //{
        //    sql_code = "select * from fin.vwFTE_Previous_and_Projections " +
        //        " where budgetNbr in ('" + String.Join("','", list_budgetNbrs) + "') and mo >= '" + txtFrom.Text + "' and mo <= '" + txtTo.Text + "'";

        //}
        //else if (list_fy.Contains("Current Budget Yr"))
        //{
        //    sql_code = "select * from fin.vwFTE_Previous_and_Projections " +
        //        " where budgetNbr in ('" + String.Join("','", list_budgetNbrs) + "') and mo >=  begdate and mo <= enddate ";
        //}


        dt = sql.DataTable_from_SQLstring(sql_code);

        sql.Close();

        if (dt.Rows.Count == 0)
        {

        }
        else
        {
            //Name, budget, a.budgetNbr, futuremo, Salary, FringeRate

            List<string> rows = new List<string> { "Name" };
            //List<string> cols = new List<string> { "budgetNbr", "budgetName", "BegDate", "EndDate", "PastProj" };
            List<string> cols = new List<string> { "budgetNbr", "budgetName", "FY", "PastProj" };
            List<string> stats = new List<string> { "Sum", "Concat" };

            #region by hand
            List<string> keepCols = new List<string>();
            keepCols.AddRange(rows);
            keepCols.AddRange(cols);

            SumAggregatorFactory sumAggr = new SumAggregatorFactory("Total_prev_mo");
            ConcatAggregatorFactory concatAggr = new ConcatAggregatorFactory("FTEcode");
            CountAggregatorFactory countAggr = new CountAggregatorFactory();

            IAggregatorFactory[] aggs = new IAggregatorFactory[3];
            aggs[0] = sumAggr;
            aggs[1] = concatAggr;
            aggs[2] = countAggr;

            CompositeAggregatorFactory compositeFactory = new CompositeAggregatorFactory(aggs);

            var cube = new PivotData(keepCols.ToArray(), compositeFactory);
            cube.ProcessData(new DataTableReader(dt));

            PivotTable pivotTable = new PivotTable(rows.ToArray(), cols.ToArray(), cube);

            #endregion


            var htmlResult = new StringWriter();
            var pvtHtmlWr = new MyHtmlWriter2(htmlResult);


            string[] aggr_labels = new string[] { "Sal + Bene", "FTE", "N mos" };

            //pvtHtmlWr.FormatValue = (aggr, idx) => { return String.Format("{0:0.##}", aggr.Value); };

            pvtHtmlWr.FormatValue = (aggr, idx) =>
            {


                if (aggr.GetType() == typeof(ConcatAggregator))
                {
                    int nchars = aggr.Value.ToString().Distinct().Count();
                    if (nchars > 1)
                    {
                        string newvalue = String.Format("<div class=\"FTEchange\">{0}</div>", aggr.Value);
                        return newvalue;
                    }
                    else
                    {
                        return String.Format("{0}", aggr.Value);
                    }
                }
                else
                {
                    return String.Format("{0:0.##}", aggr.Value);
                }
            };

            pvtHtmlWr.FormatMeasureHeader = (aggr, idx) => { return aggr_labels[idx]; };

            pvtHtmlWr.AllowHtml = true;

            pvtHtmlWr.TotalsColumn = true;
            pvtHtmlWr.TotalsRow = true;
            pvtHtmlWr.GrandTotal = true;

            pvtHtmlWr.Write(pivotTable);


            Label header = new Label();
            header.Text = "<br/><br/>Staff Expenses";
            header.Font.Size = 12;
            header.Font.Bold = true;

            Literal lit = new Literal();

            string processedHTML = htmlResult.ToString().Replace("&lt;", "<");
            processedHTML = processedHTML.Replace("&gt;", ">");
            processedHTML = processedHTML.Replace("<td class=\" pvtMeasure1\">", "<td class=\"foo2\">");

            lit.Text = processedHTML;

            panel_FTE.Controls.Add(header);
            panel_FTE.Controls.Add(lit);

            ToggleVisibility("Totals_FTE");
        }
    }
    #endregion 





    public string GetMonthName (int m)
    {
        string moname = "";
        switch(m)
        {
            case 1:
                moname = "Jan";
                break;
            case 2:
                moname = "Feb";
                break;
            case 3:
                moname = "Mar";
                break;
            case 4:
                moname = "Apr";
                break;
            case 5:
                moname = "May";
                break;
            case 6:
                moname = "Jun";
                break;
            case 7:
                moname = "Jul";
                break;
            case 8:
                moname = "Aug";
                break;
            case 9:
                moname = "Sep";
                break;
            case 10:
                moname = "Oct";
                break;
            case 11:
                moname = "Nov";
                break;
            case 12:
                moname = "Dec";
                break;
        }
        return moname;

    }

    #region Editing Future Months 
    protected void LoadFTEGrid(string mode)
    {
        SQL_utils sql = new SQL_utils("backend");

        GridView gv = new GridView();
        DataTable dt_stack = new DataTable();

        if (mode == "staff")
        {
            dt_stack = sql.DataTable_from_SQLstring("select * from fin.vwFTE_FutureMo_with_TOTALS_by_staff  where idnbr = '" + ddlStaff.SelectedValue + "' " +
                    " order by budgetNbr, mos_from_now");
        }
        else if (mode=="budget")
        {

            dt_stack = sql.DataTable_from_SQLstring("select * from fin.vwFTE_FutureMo_with_TOTALS_by_budgetNbr  where budgetNbr in ('" + utilSelect2.getselected_CSVval(selBudgets, "','") + "')" +
                    " order by budgetNbrName, Name, mos_from_now");
        }

//        DataTable dt_stack_pivot = utilsPivot.Pivot(dt_stack, new string[] { "FirstMiddleLastName", "futuremo" }, "budgetNbr", "calcFTE");

        if (dt_stack.Rows.Count >= 1)
        {

            //Get the maximum mos_from_now value
            int max_mos_from_now = dt_stack.AsEnumerable().Select(f => f.Field<int>("mos_from_now")).Max();


            DataTable dt_stack_pivot = utilsPivot.Pivot(dt_stack, new string[] { "idnbr","Name", "budgetNbrName", "budgetNbr", "EndDate" }, "mos_from_now", "calcFTE");
            string[] mos = new string[max_mos_from_now + 1];

            var myDate = DateTime.Now;
            var startOfMonth = new DateTime(myDate.Year, myDate.Month, 1);
            var endOfMonth = startOfMonth.AddMonths(1).AddDays(-1);

            for (int i = 0; i < max_mos_from_now + 1; i++)
            {
                //That should give you what you need. int lastDay = DateTime.DaysInMonth (2014, 2); and the first day is always 1.


                string prefix = (i < 9) ? "0" : "";
                //mos[i] = String.Format("{0:d}", startOfMonth.AddMonths(i));
                mos[i] = GetMonthName(startOfMonth.Month + i) + "_" + startOfMonth.Year.ToString();//String.Format("{0:d}", startOfMonth.AddMonths(i));
                string colname = "mo" + prefix + (i + 1).ToString();
                //            mos[i] = String.Format("{0:d}", dt_stack_pivot.Columns[i + 2].ColumnName);
                dt_stack_pivot.Columns[i + num_cols_before_FTE].ColumnName = colname;
            }

            //gv.DataSource = dt_stack_pivot;
            //gv.DataBind();
            //panel1.Controls.Add(gv);


            Grid2.DataSource = dt_stack_pivot;
            Grid2.DataBind();

            //Set the HeaderText to the month
            for (int m = 0; m < max_mos_from_now + 1; m++)
            {
                Grid2.Columns[num_cols_before_FTE + m].HeaderText = mos[m];
            }

            //Hide months not in the dataset
            for (int h = max_mos_from_now + num_cols_before_FTE + 1; h < 24 + num_cols_before_FTE ; h++)
            {

                Grid2.Columns[h].Visible = false;
            }

                lblError.Text = "";


            if(utilSelect2.numselected(selBudgets) > 1)
            {
                Grid2.AllowGrouping = true;
                Grid2.GroupBy = "budgetNbrName";
            }
            else
            {
                Grid2.GroupBy = "";
                Grid2.AllowGrouping = false;
            }


        }
        else
        {
            lblError.Text = "No records returned.";
            Grid2.Visible = false;
        }

    }


    protected void LoadObjGrid(string mode)
    {
        SQL_utils sql = new SQL_utils("backend");

        GridView gv = new GridView();
        DataTable dt_stack = new DataTable();

        dt_stack = sql.DataTable_from_SQLstring("select * from fin.vwOBJ_FutureMo_with_TOTALS_by_budgetNbr  where budgetNbr in ( '" + utilSelect2.getselected_CSVval(selBudgets,"','") + "') " +
        " order by budgetNbr, ObjCode, mos_from_now");


        if (dt_stack.Rows.Count >= 1)
        {


            DataTable dt_stack_pivot = utilsPivot.Pivot(dt_stack, new string[] { "ObjCode", "ObjDesc", "budgetNbrName", "budgetNbr", "EndDate" }, "mos_from_now", "calcOBJ");
            string[] mos = new string[12];

            for (int i = 0; i < 12; i++)
            {
                var myDate = DateTime.Now;
                var startOfMonth = new DateTime(myDate.Year, myDate.Month, 1);
                var endOfMonth = startOfMonth.AddMonths(1).AddDays(-1);
                //That should give you what you need. int lastDay = DateTime.DaysInMonth (2014, 2); and the first day is always 1.


                string prefix = (i < 9) ? "0" : "";
                mos[i] = String.Format("{0:d}", startOfMonth.AddMonths(i));
                //            mos[i] = String.Format("{0:d}", dt_stack_pivot.Columns[i + 2].ColumnName);
                dt_stack_pivot.Columns[i + num_cols_before_OBJ].ColumnName = "mo" + prefix + (i + 1).ToString();
            }


            Grid3.DataSource = dt_stack_pivot;
            Grid3.DataBind();

            //Set the HeaderText to the month
            for (int m = 0; m < 12; m++)
            {
                Grid3.Columns[num_cols_before_OBJ + m].HeaderText = mos[m];
            }
            lblError.Text = "";

        }
        else
        {
            lblError.Text = "No records returned.";
            Grid3.Visible = false;
        }

    }
    



    protected void LoadREVGrid(string mode)
    {
        SQL_utils sql = new SQL_utils("backend");

        GridView gv = new GridView();
        DataTable dt_stack = new DataTable();

        dt_stack = sql.DataTable_from_SQLstring("select * from fin.vwREV_FutureMo_with_TOTALS_by_budgetNbr  where budgetNbr in ( '" + utilSelect2.getselected_CSVval(selBudgets, "','") + "') " +
        " order by  budgetnbr, mos_from_now");


        if (dt_stack.Rows.Count >= 1)
        {


            DataTable dt_stack_pivot = utilsPivot.Pivot(dt_stack, new string[] {  "budgetName", "budgetNbr", "EndDate" }, "mos_from_now", "calcREV");
            string[] mos = new string[12];

            for (int i = 0; i < 12; i++)
            {
                var myDate = DateTime.Now;
                var startOfMonth = new DateTime(myDate.Year, myDate.Month, 1);
                var endOfMonth = startOfMonth.AddMonths(1).AddDays(-1);
                //That should give you what you need. int lastDay = DateTime.DaysInMonth (2014, 2); and the first day is always 1.


                string prefix = (i < 9) ? "0" : "";
                mos[i] = String.Format("{0:d}", startOfMonth.AddMonths(i));
                //            mos[i] = String.Format("{0:d}", dt_stack_pivot.Columns[i + 2].ColumnName);
                dt_stack_pivot.Columns[i + num_cols_before_REV].ColumnName = "mo" + prefix + (i + 1).ToString();
            }


            Grid4.DataSource = dt_stack_pivot;
            Grid4.DataBind();

            //Set the HeaderText to the month
            for (int m = 0; m < 12; m++)
            {
                Grid4.Columns[num_cols_before_REV + m].HeaderText = mos[m];
            }
            lblError.Text = "";

        }
        else
        {
            lblError.Text = "No records returned.";
            Grid4.Visible = false;
        }

    }
    #endregion





    #region Editing Grids - Row Data Bound
    //protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
    //{
    //    if (e.Row.RowType == GridRowType.DataRow)
    //    {
    //    }
    //}

    protected void Grid2_RowDataBound(object sender, GridRowEventArgs e)
    {


        if (e.Row.RowType == GridRowType.DataRow)
        {
            int numcols = Grid2.Columns.Count;

            for (int m = num_cols_before_FTE; m < numcols; m++)
            {
                double fte;

                if (Double.TryParse(e.Row.Cells[ m].Text, out fte))
                {
                    string rowlabel = e.Row.Cells[1].Text;
                    if (fte > 1.0 & rowlabel != "**TOTALS**")
                    {
                        e.Row.Cells[m].BackColor = System.Drawing.Color.Red;
                        //e.Row.Cells[m].CssClass = "excel-textbox-toobig";
                    }
                    if (rowlabel == "**TOTALS**")
                    {
                        e.Row.Cells[m].Font.Bold = true;
                    }

                }


            }

        }
    }



    protected void Grid3_RowDataBound(object sender, GridRowEventArgs e)
    {

    }

    protected void Grid4_RowDataBound(object sender, GridRowEventArgs e)
    {

    }
    #endregion



    #region WEB METHODS
    [WebMethod]
    public static void UpdateFTE(string p1, string p2, string p3, string p4)
    {

        double fte;

        Double.TryParse(p4, out fte);

        if (fte >= 0)
        {

            SQL_utils sql = new SQL_utils("backend");

            List<SqlParameter> ps = new List<SqlParameter>();

            ps.Add(sql.CreateParam("idnbr", p1, "text"));
            ps.Add(sql.CreateParam("budgetNbr", p2, "text"));
            ps.Add(sql.CreateParam("mo", p3, "text"));
            ps.Add(sql.CreateParam("calcFTE", p4, "float"));

            sql.NonQuery_from_ProcName("fin.spFTE_FutureMo_UPDATE", ps);

            sql.Close();
        }
    }
    [WebMethod]
    public static string UpdateFTEx(string p1, string p2, string p3, string p4, string colIndex, string mode)
    {
        double newsubtotal = 0;
        double fte;

        Double.TryParse(p4, out fte);

        if (fte >= 0)
        {

            SQL_utils sql = new SQL_utils("backend");

            List<SqlParameter> ps = new List<SqlParameter>();

            ps.Add(sql.CreateParam("idnbr", p1, "text"));
            ps.Add(sql.CreateParam("budgetNbr", p2, "text"));
            ps.Add(sql.CreateParam("mo", p3, "text"));
            ps.Add(sql.CreateParam("calcFTE", p4, "float"));
            ps.Add(sql.CreateParam("mode", mode, "text"));



            newsubtotal = sql.DoubleScalar_from_ProcName("fin.spFTE_FutureMo_UPDATE", ps);
            //sql.NonQuery_from_ProcName("fin.spFTE_FutureMo_UPDATE", ps);

            sql.Close();

            
        }

        string output = string.Format("{0},{1},{2}", p2, colIndex, newsubtotal);
        return output;

    }




    [WebMethod]
    public static void UpdateOBJ(string p1, string p2, string p3, string p4)
    {

        double calcobj;

        Double.TryParse(p4, out calcobj);

        if (calcobj >= 0)
        {

            SQL_utils sql = new SQL_utils("backend");

            List<SqlParameter> ps = new List<SqlParameter>();

            ps.Add(sql.CreateParam("ObjCode", p1, "text"));
            ps.Add(sql.CreateParam("budgetNbr", p2, "text"));
            ps.Add(sql.CreateParam("mo", p3, "text"));
            ps.Add(sql.CreateParam("calcOBJ", p4, "int"));


            sql.NonQuery_from_ProcName("fin.spOBJ_FutureMo_UPDATE", ps);

            sql.Close();
        }
    }


    [WebMethod]
    public static void UpdateREV(string p1, string p2, string p3)
    {

        double calcrev;

        Double.TryParse(p3, out calcrev);

        if (calcrev >= 0)
        {

            SQL_utils sql = new SQL_utils("backend");

            List<SqlParameter> ps = new List<SqlParameter>();

            ps.Add(sql.CreateParam("budgetNbr", p1, "text"));
            ps.Add(sql.CreateParam("mo", p2, "text"));
            ps.Add(sql.CreateParam("calcREV", p3, "int"));


            sql.NonQuery_from_ProcName("fin.spREV_FutureMo_UPDATE", ps);

            sql.Close();
        }
    }

    #endregion 




    #region PLOTS
    protected void LoadPlots_FTE(DataTable budg)
    {

        //PLOT
        if (budg.Rows.Count > 0)
        {
            foreach (DataRow row in budg.Rows)
            {
                //Literal plot1 = PlotStackedCol_FTE_byBudgetNbr(row["budgetNbr"].ToString());
                //panel1.Controls.Add(plot1);

                Literal plot2 = PlotLine_FTE_byBudgetNbr(row["val"].ToString());

                panelPlots_FTE.Controls.Add(plot2);

            }

        }

        ////Add plot
        //utilCharts.Highcharts_Line("FTE by staff", )

    }

    protected Literal PlotStackedCol_TOTAL_byBudgetNbr(DataTable dt)
    {

        List<string> rows = new List<string> {  "ObjDesc", "caldate" };
        //List<string> cols = new List<string> { "budgetNbr", "budgetName", "BegDate", "EndDate", "PastProj" };
        List<string> cols = new List<string> {  "const" };

        List<string> stats = new List<string> { "Sum" };


        List<string> keepCols = new List<string>();
        keepCols.AddRange(rows);
        keepCols.AddRange(cols);

        SumAggregatorFactory sumAggr = new SumAggregatorFactory("amt");
        
        var cube = new PivotData(keepCols.ToArray(), sumAggr);
        cube.ProcessData(new DataTableReader(dt));

        PivotTable pivotTable = new PivotTable(rows.ToArray(), cols.ToArray(), cube);
        PivotTableDataTableWriter foo =  new PivotTableDataTableWriter("foo");
        DataTable dt_totals = foo.Write(pivotTable);

        string[] series_vals = new string[1] { "ObjDesc" };
        PivotTable pivotTable_series = new PivotTable(series_vals, null, cube);
        PivotTableDataTableWriter foo2 = new PivotTableDataTableWriter("foo2");
        DataTable dt_series = foo2.Write(pivotTable_series);




        //DataView dv = 

        //DataTable dt_series2 = sql.DataTable_from_SQLstring("select Name from fin.vwFTE_Previous_and_Projections where budgetNbr = '" + budgetNbr + "' group by Name");
        //DataTable dtraw2 = sql.DataTable_from_SQLstring("select * from fin.vwFTE_Previous_and_Projections where budgetNbr = '" + budgetNbr + "' and calcFTE>0 order by Name");

        //string x1 = utilCharts.Highcharts_StackedColumn()

        Literal lit2 = new Literal();
        string x2 = utilCharts.Highcharts_StackedColumn(dt_series, dt_totals, "caldate", "1[trial]", "ObjDesc", "ObjDesc", "chart1", "charttitle",
            "Month", "Totals", -999, -999, -999, -999, 700, 400);
        lit2.Text += x2;

        ////panel2.Controls.Add(lit2);

        //sql.Close();

        return lit2;
    }



    protected Literal PlotStackedCol_FTE_byBudgetNbr(string budgetNbr)
    {
        SQL_utils sql = new SQL_utils("backend");
        
        DataTable dt_series2 = sql.DataTable_from_SQLstring("select Name from fin.vwFTE_Previous_and_Projections where budgetNbr = '" + budgetNbr + "' group by Name");
        DataTable dtraw2 = sql.DataTable_from_SQLstring("select * from fin.vwFTE_Previous_and_Projections where budgetNbr = '" + budgetNbr + "' and calcFTE>0 order by Name");
        
        Literal lit2 = new Literal();
        string x2 = utilCharts.Highcharts_StackedColumn(dt_series2, dtraw2, "Mo", "calcFTE", "Name", "Name", "chart1" + budgetNbr.Replace(" ", ""), budgetNbr,
            "Month", "FTE", -999, -999, -999, -999, 700, 400);
        lit2.Text += x2;

        //panel2.Controls.Add(lit2);

        sql.Close();

        return lit2;
    }


    protected Literal PlotLine_FTE_byBudgetNbr(string budgetNbr)
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt_series2 = sql.DataTable_from_SQLstring("select Name from fin.vwFTE_Previous_and_Projections where budgetNbr = '" + budgetNbr + "' group by Name");
        DataTable dtraw2 = sql.DataTable_from_SQLstring("select * from fin.vwFTE_Previous_and_Projections where budgetNbr = '" + budgetNbr + "' and calcFTE>0 order by Name, mo");

        Literal lit2 = new Literal();
        string x2 = utilCharts.Highcharts_Line("FTEline" + budgetNbr, dtraw2, "mo", "calcFTE", "Name", "date", "Staff FTE - " + budgetNbr.Replace(" ", ""), "Month", "FTE", 600, 400, "");
        lit2.Text += x2;
        lit2.ID = "FTEline" + budgetNbr;

        //panel2.Controls.Add(lit2);


        sql.Close();

        return lit2;
    }



    #endregion 


    #region Export to Excel
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable fte = sql.DataTable_from_SQLstring("select * from tempFTE_with_NETID order by PayCycleEndDate, budget, budgetNbr, FirstMiddleLastName");
        DataTable budgets = sql.DataTable_from_SQLstring("select budget, budgetNbr, budgetName, min(PayCycleEndDate) minDate, max(PayCycleEndDate) maxDate " +
                                ", count(*) nrecs from tempFTE_with_NETID group by budget, budgetNbr, budgetName order by 1,2");
        DataTable staff = sql.DataTable_from_SQLstring("select FirstMiddleLastName, UWnetid, min(PayCycleEndDate) minDate, max(PayCycleEndDate) maxDate " +
                                ", count(distinct(budget)) n_budgets, count(*) as n_recs from tempFTE_with_NETID group by FirstMiddleLastName, UWnetid order by 1,2" );

        DataTable fte_proj = sql.DataTable_from_SQLstring("select vwFTE_FutureMo order by FirstMiddleLastName, budget, budgetName, budgetNbr");



        DataSet ds = new DataSet();
        ds.Tables.Add(fte);
        ds.Tables.Add(fte_proj);
        ds.Tables.Add(budgets);
        ds.Tables.Add(staff);


        ds.Tables[0].TableName = "FTE";
        ds.Tables[1].TableName = "FTE_proj";
        ds.Tables[2].TableName = "Budgets";
        ds.Tables[3].TableName = "Staff";

        string filename = "uwac_fte_" + SpreadsheetGearUtils.DateTime_for_filename();

        SpreadsheetGearUtils.SaveDataSetToExcel(ds, filename, true, "xlsx");


    }
    #endregion 




    protected void btnEditProjections_Command(object sender, CommandEventArgs e)
    {

        string obj_to_edit = rblObjectsToEdit.SelectedValue;
        hidEditMode.Value = obj_to_edit;
        bool hideit = false;

        if (obj_to_edit == "All Staff FTE")
        {
            if (utilSelect2.anyselected(selBudgets))
            {
                    LoadFTEGrid("budget");
                    ToggleVisibility(obj_to_edit);
                    panelEditButtons.Visible = true;
                    panelEditStaffButtons.Visible = true;
                    ddlStaff.SelectedIndex = -1;

                    hideit = true;

                    LoadStaffDDL();
                }
            else
            {
                lblError.Text = "Select a budget to edit.";
                lblError.Visible = true;
            }
        }
        else if (obj_to_edit == "Single Staff FTE")
        {
            if (ddlStaff.SelectedIndex > 0)
            {
                LoadFTEGrid("staff");
                ToggleVisibility(obj_to_edit);
                panelEditButtons.Visible = true;
                panelEditStaffButtons.Visible = true;
                hideit = true;

            }
            else
            {
                lblError.Text = "Select a staff member to edit.";
                lblError.Visible = true;
            }
        }

        else if (utilSelect2.anyselected(selBudgets))
        {
            if (obj_to_edit == "Expenses")
            {
                LoadObjGrid("budget");
                ToggleVisibility(obj_to_edit);
                panelEditButtons.Visible = true;
                panelEditStaffButtons.Visible = false;
                ddlStaff.SelectedIndex = -1;
                hideit = true;

            }
            else if (obj_to_edit == "Revenue")
            {
                LoadREVGrid("budget");
                ToggleVisibility(obj_to_edit);
                panelEditButtons.Visible = true;
                panelEditStaffButtons.Visible = false;
                ddlStaff.SelectedIndex = -1;
                hideit = true;

            }
        }
        //else
        //{
        //    if (obj_to_edit == "Staff FTE")
        //    {
        //        lblError.Text = "Select a budget or staff member to edit.";
        //    }
        //    else
        //    {
        //        lblError.Text = "Select a budget to edit.";
        //    }


        //}


        if (hideit)
        {
            btnEditProjections.Visible = false;
            rblObjectsToEdit.Visible = false;
        }
        else
        {
            btnEditProjections.Visible = true;
            rblObjectsToEdit.Visible = true;
        }

    }



    protected void btnAddStaffToBudget_Click(object sender, EventArgs e)
    {
        string staff = ddlStaff.SelectedValue;
        
        if (utilSelect2.numselected(selBudgets)==1 & ddlStaff.SelectedValue != "--select specific staff to edit--")
        {
            SQL_utils sql = new SQL_utils("backend");


            List<SqlParameter> ps = new List<SqlParameter>();

            ps.Add(sql.CreateParam("FirstMiddleLastName", staff, "text"));
            ps.Add(sql.CreateParam("budgetNbr", utilSelect2.getselected_ListVal(selBudgets)[0], "text"));

            sql.NonQuery_from_ProcName("fin.spFTE_FutureMo_INSERT", ps);


            sql.Close();
        }
        else
        {
            string err = "";
            if (ddlStaff.SelectedValue == "--select specific staff to edit--") err += " Select a staff member.";
            if (utilSelect2.numselected(selBudgets)!=1) err += " Select a single budget.";

            lblError.Text = err;
            lblError.Visible = true;
            ToggleVisibility("none");
        }
    }

    protected void btnDeleteStaffFromBudget_Click(object sender, EventArgs e)
    {
        string staff = ddlStaff.SelectedValue;

        if (utilSelect2.numselected(selBudgets) == 1 & ddlStaff.SelectedValue != "--select specific staff to edit--")
        {
            SQL_utils sql = new SQL_utils("backend");

            List<SqlParameter> ps = new List<SqlParameter>();

            ps.Add(sql.CreateParam("FirstMiddleLastName", staff, "text"));
            ps.Add(sql.CreateParam("budgetNbr", utilSelect2.getselected_ListVal(selBudgets)[0], "text"));

            sql.NonQuery_from_ProcName("fin.spFTE_FutureMo_DELETE", ps);


            sql.Close();
        }
        else
        {
            string err = "";
            if (ddlStaff.SelectedValue == "--select specific staff to edit--") err += " Select a staff member.";
            if (utilSelect2.numselected(selBudgets)!=1) err += " Select a sinlgle budget.";

            lblError.Text = err;
            lblError.Visible = true;
            ToggleVisibility("none");
        }
    }




    protected void btnLoadTotals_Click(object sender, EventArgs e)
    {

        string budgets_csv = utilSelect2.getselected_CSVval(selBudgets);
        List<string> rows = utilSelect2.getselected_ListVal (selRows);

        List<string> cols = utilSelect2.getselected_ListVal(selCols);
        List<string> functions = utilSelect2.getselected_ListVal(selFunctions);

        string fy_csv = utilSelect2.getselected_CSVval(selFY);

        if (chkShowTotals.Checked)
        {
            LoadProjections_TOTALS(utilSelect2.getselected_ListVal(selBudgets), utilSelect2.getselected_ListVal(selFY), rows, cols, functions);
        }
        if (chkShowFTE.Checked)
        {
            LoadProjections_FTE( utilSelect2.getselected_ListVal(selBudgets), utilSelect2.getselected_ListVal(selFY));

            if (chkPlot.Checked)
            {
                LoadPlots_FTE(utilSelect2.getselected_DataTable(selBudgets));
            }

        }
    }



    protected void LoadMeta_Budget()
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = sql.DataTable_from_SQLstring("select * from fin.meta_budget order by budgetNbr");

        GridMeta_Budget.DataSource = dt;
        GridMeta_Budget.DataBind();

        GridMeta_Budget.Visible = true;
    }



    protected void btnMeta_Click(object sender, EventArgs e)
    {
        LoadMeta_Budget();

        panelEditButtons.Visible = true;

    }
    protected void GridMeta_Budget_UpdateCommand(object sender, GridRecordEventArgs e)
    {
        oboutGrid_utils o = new oboutGrid_utils();

        Hashtable hash = (Hashtable)e.Record;

        string result = o.oGrid_UpdateData(hash, "meta_budget","backend","fin", "budgetNbr");


    }
    protected void GridMeta_Budget_Rebind(object sender, EventArgs e)
    {

    }

    protected void Grid3_Rebind(object sender, EventArgs e)
    {

    }
    protected void Grid2_Rebind(object sender, EventArgs e)
    {

    }
    protected void btnMyBudgets_Click(object sender, EventArgs e)
    {
        if (btnMyBudgets.Visible == true)
        {
            LoadMyBudgets();
            btnMyBudgets.Visible = false;
            btnMyBudgets2.Visible = true;
        }
        else
        {
            Grid_MyBudgets.Visible = false;
            btnMyBudgets.Visible = true;
            btnMyBudgets2.Visible = false;
        }

    }


    protected void Grid_MyBudgets_InsertCommand(object sender, GridRecordEventArgs e)
    {
        oboutGrid_utils o = new oboutGrid_utils();

        Hashtable hash = (Hashtable)e.Record;

        string x = o.oGrid_InsertData(hash, "MyBudget", "backend", "fin", "mybudgetpk", 0);

        LoadMyBudgets();

    }


    protected void Grid_MyBudgets_UpdateCommand(object sender, GridRecordEventArgs e)
    {
        oboutGrid_utils o = new oboutGrid_utils();
        Hashtable hash = (Hashtable)e.Record;
        string x = o.oGrid_UpdateData(hash, "MyBudget", "backend", "fin", "mybudgetpk");
        LoadMyBudgets();
    }
   
    
    protected void Grid_MyBudgets_DeleteCommand(object sender, GridRecordEventArgs e)
    {
        oboutGrid_utils o = new oboutGrid_utils();
        Hashtable hash = (Hashtable)e.Record;
        string x = o.oGrid_DeleteData(hash, "MyBudget", "backend", "fin", "mybudgetpk", false);
        LoadMyBudgets();

        Load_Select2_controls();
    }


    protected void rblObjectsToEdit_SelectedIndexChanged(object sender, EventArgs e)
    {

        lblError.Text = "";

        if(rblObjectsToEdit.SelectedValue=="Single Staff FTE")
        {
            ddlStaff.Visible = true;
        }
        else
        {
            ddlStaff.Visible = false;
        }

        updatepanel_SingleStaff.Update();
    }



}




public class MyHtmlWriter2 : NReco.PivotData.Output.PivotTableHtmlWriter
{

    public MyHtmlWriter2(TextWriter writer)
        : base(writer)
    {

    }

    protected override void OnWriteValueCell(NReco.PivotData.Output.PivotTableHtmlWriter.ValueCellContext valueContext)
    {

        try
        {
            if (valueContext.RowKey.DimKeys.Contains("EQUIPMENT"))
            {
                valueContext.AddCssClass("cssDirectTotal");
            } 
            if (valueContext.ColumnKey.DimKeys.Contains("Projected"))
            {
                valueContext.AddCssClass("cssProjected");
            }


        }
        catch (Exception ex) {
			string x = ex.Message;
		}
    }


    protected override void OnWriteKeyCell(NReco.PivotData.Output.PivotTableHtmlWriter.KeyCellContext keyContext)
    {
        if (keyContext.Dimension == "FacilityName")
        {
            if ("Projected".Equals(keyContext.DimensionKey))
                keyContext.AddCssClass("cssProjected");
        }
    }



   



}
