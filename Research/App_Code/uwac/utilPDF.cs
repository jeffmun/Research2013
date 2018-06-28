using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Web.Services;
//using iTextSharp.text;
using Obout.Grid;
//using iTextSharp.text.xml;
//using iTextSharp.text.pdf;
//using iTextSharp.text.factories;
//using iTextSharp.tool.xml;


namespace uwac
{
    /// <summary>
    /// Summary description for utilPDF
    /// </summary>
    public class utilPDF
    {
        public utilPDF()
        {
            //
            // TODO: Add constructor logic here
            //
        }


        //public static PdfPTable AddGridToPDF(GridView GridView1,
        //iTextSharp.text.Font font, iTextSharp.text.Font fontHeader) {
        //    int ncols = 0;
        //    if(GridView1.Rows.Count>0) ncols = GridView1.Rows[0].Cells.Count;

        //    //Calculate the widths of the cells 


        //}

        //public static PdfPTable AddGridToPDF(GridView GridView1, iTextSharp.text.Font font, iTextSharp.text.Font fontHeader, float totalwidth, float[] widths)
        //{

        //    //BaseFont bf = BaseFont.CreateFont(Environment.GetEnvironmentVariable("windir") + @"\fonts\ARIALUNI.TTF", BaseFont.IDENTITY_H, true);

        //    int ncols = 0;
        //    if(GridView1.Rows.Count>0) ncols = GridView1.Rows[0].Cells.Count;

        //    iTextSharp.text.pdf.PdfPTable table = new iTextSharp.text.pdf.PdfPTable(ncols);
        //    //int[] widths = new int[ncols];
        //    for (int x = 0; x < ncols; x++)
        //    {

        //        //? widths[x] = (int)GridView1.Columns[x].ItemStyle.Width.Value;
        //        string cellText = HttpUtility.HtmlDecode(GridView1.HeaderRow.Cells[x].Text);

        //        //Set Font and Font Color iTextSharp.text.Font font = new
        //        //iTextSharp.text.Font(bf, 10, iTextSharp.text.Font.NORMAL);
        //        //font.Color = new Color(GridView1.HeaderStyle.ForeColor)
                
        //        // ABOVE NOT USED - use the font passed in to this method
        //        iTextSharp.text.pdf.PdfPCell cell;
        //        if (x == 0)
        //        {
        //            cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(12, cellText, fontHeader));
        //        }
        //        else
        //        {
        //            cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(12, cellText, font));
        //        }


        //        //Set Header Row BackGround Color
        //        //NOT USED - assume white
        //        //cell.BackgroundColor = new Color(GridView1.HeaderStyle.BackColor);

        //        table.AddCell(cell);
        //    }

        //    table.HorizontalAlignment = 0;
        //    table.WidthPercentage = totalwidth;
        //    table.SetTotalWidth(widths);
        //    //? table.SetWidths(widths);

        //    for (int i = 0; i < GridView1.Rows.Count; i++)
        //    {
        //        if (GridView1.Rows[i].RowType == DataControlRowType.DataRow)
        //        {
        //            for (int j = 0; j < ncols; j++)
        //            {
        //                string cellText = HttpUtility.HtmlDecode(GridView1.Rows[i].Cells[j].Text);

        //                //NOT USED - use the font passed in to the method
        //                // Set Font and Font Color
        //                //iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 10, iTextSharp.text.Font.NORMAL);
        //                //font.Color = new Color(GridView1.RowStyle.ForeColor);
        //                iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(12, cellText, font));

        //                //Set Color of row
        //                if (i % 2 == 0)
        //                {
        //                    //NOT USED - Alternating row color not used for now
        //                    //Set Row BackGround Color
        //                    //cell.BackgroundColor = new Color(GridView1.RowStyle.BackColor);
        //                }

        //                table.AddCell(cell);
        //            }
        //        }
        //    }


        //    return table;
        //}



        //public static PdfPTable AddGridToPDF2(GridView Grid1, iTextSharp.text.Font font, iTextSharp.text.Font fontHeader)
        //{

        //    //Create instance of the pdf table and set the number of column in that table
        //    int num_visible_cols = 0;
        //    foreach (Column col in Grid1.Columns)
        //    {
        //        if (col.Visible & col.HeaderText != "") num_visible_cols++;
        //    }


        //    PdfPTable PdfTable = new PdfPTable(num_visible_cols);

        //    PdfPCell cell = null;

        //    int headcolcounter = 0;
        //    //Add headers of the pdf table
        //    foreach (Column col in Grid1.Columns)
        //    {
        //        if (col.HeaderText != "" & col.Visible)
        //        {
        //            cell = new PdfPCell(new Phrase(new Chunk(col.HeaderText, fontHeader)));
        //            cell.BorderColor = new BaseColor(Color.Silver);
        //            PdfTable.AddCell(cell);
        //            headcolcounter++;
        //        }
        //    }


        //    //How add the data from the Grid to pdf table
        //    for (int i = 0; i < Grid1.Rows.Count; i++)
        //    {
        //        //Hashtable dataItem = Grid1.Rows[i].ToHashtable();

        //        DataRowView dataItem = (DataRowView)Grid1.Rows[i].DataItem;

        //        int colcounter = 0;
        //        foreach (Column col in Grid1.Columns)
        //        {
        //            if (col.HeaderText != "" & col.Visible)
        //            {
        //                //Check to see if there is a TemplateID - if so, use it to get the value to print
        //                if (col.TemplateSettings.TemplateId != null)
        //                {
        //                    //col.
        //                    //col.TemplateSettings.TemplateId
        //                    string fldname = col.DataField;
        //                    string cellcontents = dataItem[fldname].ToString();
        //                    Chunk chnk = new Chunk(cellcontents, font);
        //                    Phrase phrse = new Phrase(chnk);
        //                    cell = new PdfPCell(phrse);
        //                    cell.BorderColor = new BaseColor(Color.Silver);
        //                    PdfTable.AddCell(cell);

        //                }
        //                else
        //                {
        //                    string fldname = col.DataField;
        //                    string cellcontents = dataItem[fldname].ToString();
        //                    Chunk chnk = new Chunk(cellcontents, font);
        //                    Phrase phrse = new Phrase(chnk);
        //                    cell = new PdfPCell(phrse);
        //                    cell.BorderColor = new BaseColor(Color.Silver);
        //                    PdfTable.AddCell(cell);
        //                }
        //                colcounter++;
        //            }

        //        }
        //    }

        //    PdfTable.SpacingBefore = 5f;

        //    return PdfTable;
        //}

        //public static PdfPTable AddGridToPDF(Grid Grid1, iTextSharp.text.Font font, iTextSharp.text.Font fontHeader)
        //{

        //    //Create instance of the pdf table and set the number of column in that table
        //    int num_visible_cols = 0;
        //    foreach (Column col in Grid1.Columns)
        //    {
        //        if (col.Visible & col.HeaderText != "") num_visible_cols++;
        //    }


        //    PdfPTable PdfTable = new PdfPTable(num_visible_cols);

        //    PdfPCell cell = null;

        //    int headcolcounter = 0;
        //    //Add headers of the pdf table
        //    foreach (Column col in Grid1.Columns)
        //    {
        //        if (col.HeaderText != "" & col.Visible)
        //        {
        //            cell = new PdfPCell(new Phrase(new Chunk(col.HeaderText, fontHeader)));
        //            cell.BorderColor = new BaseColor(Color.Silver);
        //            PdfTable.AddCell(cell);
        //            headcolcounter++;
        //        }
        //    }


        //    //How add the data from the Grid to pdf table
        //    for (int i = 0; i < Grid1.Rows.Count; i++)
        //    {
        //        Hashtable dataItem = Grid1.Rows[i].ToHashtable();
        //        int colcounter = 0;
        //        foreach (Column col in Grid1.Columns)
        //        {
        //            if (col.HeaderText != "" & col.Visible)
        //            {
        //                //Check to see if there is a TemplateID - if so, use it to get the value to print
        //                if (col.TemplateSettings.TemplateId != null)
        //                {
        //                    //col.
        //                    //col.TemplateSettings.TemplateId
        //                    string fldname = col.DataField;
        //                    string cellcontents = dataItem[fldname].ToString();
        //                    Chunk chnk = new Chunk(cellcontents, font);
        //                    Phrase phrse = new Phrase(chnk);
        //                    cell = new PdfPCell(phrse);
        //                    cell.BorderColor = new BaseColor(Color.Silver);
        //                    PdfTable.AddCell(cell);

        //                }
        //                else
        //                {
        //                    string fldname = col.DataField;
        //                    string cellcontents = dataItem[fldname].ToString();
        //                    Chunk chnk = new Chunk(cellcontents, font);
        //                    Phrase phrse = new Phrase(chnk);
        //                    cell = new PdfPCell(phrse);
        //                    cell.BorderColor = new BaseColor(Color.Silver);
        //                    PdfTable.AddCell(cell);
        //                }
        //                colcounter++;
        //            }

        //        }
        //    }

        //    PdfTable.SpacingBefore = 5f;

        //    return PdfTable;
        //}

        //public static PdfPTable AddDataTableToPDF(DataTable dt, iTextSharp.text.Font font, iTextSharp.text.Font fontHeader)
        //{
        //    PdfPTable tbl = AddDataTableToPDF(dt, font, fontHeader, false);

        //    return (tbl);
        //}

        //public static PdfPTable AddDataTableToPDF(DataTable dt, iTextSharp.text.Font font, iTextSharp.text.Font fontHeader, bool hideDupFirstColumn)
        //{
        //    ////Create instance of the pdf table and set the number of column in that table
        //    //int num_visible_cols = 0;
        //    //foreach (Column col in Grid1.Columns)
        //    //{
        //    //    if (col.Visible & col.HeaderText != "") num_visible_cols++;
        //    //}
        //    PdfPTable PdfTable = new PdfPTable(dt.Columns.Count);
        //    PdfPCell cell = null;

        //    int headcolcounter = 0;
        //    //Add headers of the pdf table
        //    foreach (DataColumn col in dt.Columns)
        //    {

        //        cell = new PdfPCell(new Phrase(new Chunk(col.ColumnName, fontHeader)));
        //        cell.BorderColor = new BaseColor(Color.Silver);
        //        PdfTable.AddCell(cell);
        //        headcolcounter++;
        //    }

        //    string prevfirstcol = "thisisthefirstrowfirstcolumn";

        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        int colcount = 0;
        //        foreach (DataColumn dc in dt.Columns)
        //        {
        //            string cellcontents = dr[dc].ToString();

        //            //flag to check if we want to hide duplicate values in the first column
        //            if (hideDupFirstColumn & colcount == 0)
        //            {
        //                if (cellcontents == prevfirstcol) cellcontents = "";
        //            }
        //            else
        //            {
        //                cellcontents = dr[dc].ToString();
        //            }
        //            Chunk chnk = new Chunk(cellcontents, font);
        //            Phrase phrse = new Phrase(chnk);
        //            cell = new PdfPCell(phrse);
        //            cell.BorderColor = new BaseColor(Color.Silver);
        //            PdfTable.AddCell(cell);
        //            colcount++;
        //        }
        //        prevfirstcol = dr[0].ToString();

        //    }

        //    PdfTable.SpacingBefore = 5f;

        //    return PdfTable;
        //}


        //public static Paragraph Paragraph_fromKeyValue(string key, string value, iTextSharp.text.Font fontKey, iTextSharp.text.Font fontValue)
        //{

        //    Chunk c1 = new Chunk(key, fontKey);
        //    Chunk c2 = new Chunk(value, fontValue);

        //    Phrase phrase = new Phrase();
        //    phrase.Add(c1);
        //    phrase.Add(c2);

        //    Paragraph p = new Paragraph(phrase);

        //    return (p);
        //}


    }
}