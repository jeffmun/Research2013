using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using iTextSharp;
//using iTextSharp.tool;
//using iTextSharp.text;
//using iTextSharp.text.html;
//using iTextSharp.text.pdf;
using uwac;


public partial class Admin_MailLabels : System.Web.UI.Page
{
    //If the master page default study is changed, update the Measure DDL
    protected void Master_Study_Changed(object sender, EventArgs e)
    {
        lblStudy.Text = Master.Master_studyname;
        //Response.Redirect("~/MailLabels.aspx");
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
    }


    protected void Page_Load(object sender, EventArgs e)
    {

        lblStudy.Text = Master.Master_studyname;
      
    }
    protected void btnCreateLabels_Click(object sender, EventArgs e)
    {
        LabelsPdf();

    }


    public void LabelsPdf()
    {
        //// Open a new PDF document

        //const int pageMargin = 5;
        //const int pageRows = 10;
        //const int pageCols = 3;

        //var doc = new Document();
        //doc.SetMargins(pageMargin, pageMargin, pageMargin, pageMargin);
        //var memoryStream = new MemoryStream();

        //var pdfWriter = PdfWriter.GetInstance(doc, memoryStream);
        //doc.Open();

        //// Create the Label table

        //PdfPTable table = new PdfPTable(pageCols);
        //table.WidthPercentage = 100f;
        //table.DefaultCell.Border = 0;

        //var baseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);

        // DataTable dt = GetAddressData();

        //foreach(DataRow row in dt.Rows)
        ////foreach (var Thing in YourCollectionOfThings)
        //{
        //    #region Label Construction

        //    PdfPCell cell = new PdfPCell();
        //    cell.Border = 0;
        //    cell.FixedHeight = (doc.PageSize.Height - (pageMargin * 2)) / pageRows;
        //    cell.VerticalAlignment = Element.ALIGN_MIDDLE;

        //    var contents = new Paragraph();
        //    contents.Alignment = Element.ALIGN_CENTER;


        //    contents.Add(new Chunk(string.Format("{0}\n", row["addr_line1"].ToString()), new Font(baseFont, 11f, Font.BOLD)));
        //    contents.Add(new Chunk(string.Format("{0}\n", row["addr_line2"].ToString()), new Font(baseFont, 11f)));
        //    contents.Add(new Chunk(string.Format("{0}\n", row["addr_line3"].ToString()), new Font(baseFont, 11f)));

        //    Annotation info_annotation = new Annotation("info:", "my annot");
        //    contents.AddSpecial(info_annotation);

        //    cell.AddElement(contents);
        //    table.AddCell(cell);

        //    //GetPos
        //    //PdfAnnotation info_annotation = new PdfAnnotation(pdfWriter, GetPosition(cell));

        //    //info_annotation

        //    //Rectangle rect = cell.GetRectangle();


        //    #endregion
        //}

        //table.CompleteRow();
        //doc.Add(table);

        //// Close PDF document and send

        //pdfWriter.CloseStream = false;
        //doc.Close();
        //memoryStream.Position = 0;

        //string filename = Master.Master_studyname + "_MailingLabels_" + SpreadsheetGearUtils.DateTime_for_filename() + ".pdf";

        //// Send the data and the appropriate headers to the browser
        //Response.Clear();
        //Response.AddHeader("content-disposition", "attachment;filename=" + filename );
        //Response.ContentType = "application/pdf";

        //Response.BinaryWrite(memoryStream.ToArray());
        //Response.End();

//        return File(memoryStream, "application/pdf");
    }
    protected void btnCreateExcel_Click(object sender, EventArgs e)
    {
        DataTable dt = GetAddressData();

        string datetxt = SpreadsheetGearUtils.DateTime_for_filename();

        SpreadsheetGearUtils.SaveDataTableToExcel(dt, Master.Master_studyname + "_Addresses_" + datetxt, true, "xlsx");

    }

    protected DataTable GetAddressData()
    {
        SQL_utils sql = new SQL_utils("backend");
        List<SqlParameter> ps = new List<SqlParameter>();
        ps.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
        ps.Add(sql.CreateParam("type", "2", "int"));  //1=all subjects, 2=main contacts
        ps.Add(sql.CreateParam("include", "1", "int"));
        DataTable dt = sql.DataTable_from_ProcName("spSubject_Addresses", ps);

        return dt;
    }

}