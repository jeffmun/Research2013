using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutismCenterResearch_Study_Tadpole_new : System.Web.UI.Page
{

    //protected void Page_Init(object sender, EventArgs e)
    //{
    //    if (!Page.IsPostBack)
    //    {
    //        // Set the processing mode for the ReportViewer to Remote
    //        reportViewer.ProcessingMode = ProcessingMode.Remote;

    //        ServerReport serverReport = reportViewer.ServerReport;

    //        // Set the report server URL and report path
    //        serverReport.ReportServerUrl =
    //            new Uri("https://autism.washington.edu/reportserver");
    //        serverReport.ReportPath =
    //            "/Tadpole/Tadpole Tx Log";

    //        //// Create the sales order number report parameter
    //        //ReportParameter salesOrderNumber = new ReportParameter();
    //        //salesOrderNumber.Name = "SalesOrderNumber";
    //        //salesOrderNumber.Values.Add("SO43661");

    //        //// Set the report parameters for the report
    //        //reportViewer.ServerReport.SetParameters(
    //        //    new ReportParameter[] { salesOrderNumber });


    //    }
    //}


    protected void Page_Load(object sender, EventArgs e)
    {
        string myurl = "https://autism.washington.edu/ReportServer/Pages/ReportViewer.aspx?%2fTadpole%2fTadpole+Tx+Logs&rs:Command=Render";
        
        iframeDiv.Controls.Add(new LiteralControl("<iframe runat=\"server\" width=\"1000px\" height=\"720px\" src=\"" + myurl + "\"></iframe><br />"));


    }
}