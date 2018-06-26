//using System;
//using System.Collections.Generic;
//using System.ComponentModel;
//using System.Drawing;
//using System.Data.SqlClient;
//using System.IO;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Data;
//using SelectPdf;



//public partial class stats_testpdf : System.Web.UI.Page
//{
//    protected void Page_Load(object sender, EventArgs e)
//    {
//        //ScriptManager.RegisterStartupScript(this, GetType(), "foochart", "drawfoochart_js();", true);

//        //ScriptManager.RegisterClientScriptInclude(this, GetType(),"foochart", ResolveUrl("~/js/foochart.js"));



//        //Page.ClientScript.RegisterStartupScript(this.GetType(), )
//        //string x = "checkbox";

//        //if (ClientScript.IsClientScriptBlockRegistered(x))
//        //    {
//        //        lblInfo.Text = x + " is registered";
//        //    }
//        //    else
//        //    {
//        //        lblInfo.Text = x + " is NOT registered";
//        //    }
//    }

//    protected void btnSelectPdf_Click(object sender, EventArgs e)
//    {
//        TextWriter myWriter = new StringWriter();
//        HtmlTextWriter htmlWriter = new HtmlTextWriter(myWriter);

//        htmlWriter.Write("This page: " + System.IO.Path.GetFileName(HttpContext.Current.Request.Url.ToString()));


//        HtmlToPdf converter = new HtmlToPdf();
//        converter.Options.MinPageLoadTime = 2;

//        this.Page.RenderControl(htmlWriter);

//        SelectPdf.PdfDocument doc = converter.ConvertHtmlString(myWriter.ToString());
//        doc.Save(Response, false, "GoogleChart_Sample.pdf");
//        doc.Close();
//        Response.End();

//    }

//}