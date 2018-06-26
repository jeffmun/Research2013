using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NReco.PivotData;
using NReco.PivotData.Output;
using NReco.PivotData.File;
using uwac;


public partial class Testing_CPTtest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



        //GetCPT(new List<string> { "FacilityName", "CPTgroup", "CPTcode" }, new List<string> { "PatientType" });

   
    }





    protected void GetCPT(DataTable dt, List<string> rows, List<string> cols, bool showCount)
    {



        // These are all the fields that are going to be used in the cube
        List<string> keepCols = new List<string>();
        keepCols.AddRange(rows);
        keepCols.AddRange(cols);

        // Create the cube
        PivotData cube;// = new PivotData(keepCols.ToArray(), compositeFactory);


        //Create the aggregators you want (Sum, Avg, Count, Min, Max, etc.) 
        SumAggregatorFactory sumAggr = new SumAggregatorFactory("TotalAmount");
        CountAggregatorFactory countAggr = new CountAggregatorFactory();

        if (showCount)
        {
            // Put them into a composite
            IAggregatorFactory[] aggs = new IAggregatorFactory[2];
            aggs[0] = sumAggr;
            aggs[1] = countAggr;

            CompositeAggregatorFactory compositeFactory = new CompositeAggregatorFactory(aggs);

            // Create the cube
            cube = new PivotData(keepCols.ToArray(), compositeFactory);

        }
        else
        {
            SumAggregatorFactory sumFactory = new SumAggregatorFactory("TotalAmount");

            // Create the cube
            cube = new PivotData(keepCols.ToArray(), sumFactory);
        }



        cube.ProcessData(new DataTableReader(dt));


        //Create pivot table 
        PivotTable pivotTable = new PivotTable(rows.ToArray(), cols.ToArray(), cube);

        //Define how we are going to render the pivot table - here as HTML (could be Excel, CSV, etc.)
        var htmlResult = new StringWriter();
        //var pvtHtmlWr = new PivotTableHtmlWriter(htmlResult);

        var pvtHtmlWr = new MyHtmlWriter(htmlResult);

   


        // Define the labels for the dimensions
        //string[] aggr_labels = new string[] { "Sum", "Count" };
        string[] aggr_labels = new string[] { "Sum"  };


        // Various properties 
        pvtHtmlWr.SubtotalDimensions = new string[] { "PaymentOther" };
        pvtHtmlWr.SubtotalRows = true;

        pvtHtmlWr.AllowHtml = true;
        pvtHtmlWr.TotalsColumn = true;
        pvtHtmlWr.TotalsRow = true;
        pvtHtmlWr.GrandTotal = true;

        //create the actual HTML code
        pvtHtmlWr.Write(pivotTable);

        //Place the HTML code into literal control and add it to a Panel so you can place it where you wish on the page.
        Literal lit = new Literal();
        lit.Text = htmlResult.ToString();
        panel1.Controls.Add(lit);


    }







    protected void btnLoad_Click(object sender, EventArgs e)
    {
        SQL_utils sql = new SQL_utils("backend");
        DataTable dt = sql.DataTable_from_SQLstring("select a.*, CPTgroup from vtj.vwValantTJ  a join vtj.CPTgroups b ON a.CPTcode = b.cpt" +
                " where a.Yr=" + txtYr.Text + "");
        sql.Close();

        GetCPT(dt, new List<string> { "PaymentOther", "PatientType" }, new List<string> { "YrMo" }, chkCount.Checked);
        GetCPT(dt, new List<string> { "providerID" }, new List<string> { "YrMo" }, chkCount.Checked);

    }


}

public class MyHtmlWriter : NReco.PivotData.Output.PivotTableHtmlWriter
{

    public  MyHtmlWriter(TextWriter writer) : base( writer)
    {
        
    }

    protected override void OnWriteValueCell(NReco.PivotData.Output.PivotTableHtmlWriter.ValueCellContext valueContext)
    {

        try
        {
            if (valueContext.ColumnKey.DimKeys[0].ToString() == "ABA")
            {
                valueContext.AddCssClass("cssForABA");
            }
            if (valueContext.RowKey.DimKeys.Contains( "UWAC TACOMA CLINIC"))
            {
                valueContext.AddCssClass("cssForTacoma");

                valueContext.FormattedValue = "<a href='www.washington.edu'>" + valueContext.FormattedValue + "</a>";
            }
            if (valueContext.RowKey.DimKeys.Contains("No Shows"))
            {
                valueContext.AddCssClass("cssForNoShow");
            }

            if (valueContext.RowKey.DimKeys.Contains("UWAC HOME"))
            {
                if(valueContext.CssClass.StartsWith("subtotal"))
                {
                    valueContext.AddCssClass("cssForNoShow");
                }
                valueContext.AddCssClass("cssForTacoma");

                valueContext.FormattedValue = "<a href='www.washington.edu'>" + valueContext.FormattedValue + "</a>";
            }


        }
        catch(Exception ){}
    }


    protected override void OnWriteKeyCell(NReco.PivotData.Output.PivotTableHtmlWriter.KeyCellContext keyContext)  
    {
        if (keyContext.Dimension == "FacilityName")
        {
            if ("UWAC HOME Total".Equals(keyContext.FormattedKey))
                keyContext.CssClass = "cssForNoShow";
        }
    }

}