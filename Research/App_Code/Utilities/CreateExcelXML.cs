using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using AutismCenterBase.Utilities;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;


namespace AutismCenterBase.Utilities
{

/// <summary>
/// Summary description for CreateExcelXML
/// This class returns a StringWriter object formatted as an Excel XML document.
/// Input parameters:
///     DataTable Array containing the data to be placed on separate worksheets
///     Name for the Workbook
///     Cell width for display
///     String Array of WorkSheet names
/// </summary>
public class CreateExcelXML : StringWriter
{


    public CreateExcelXML(object[] cList, string wbName, int CellWidth) //, string[] sheetnames)
    {
		//
		// Add additional constructor logic here
		//

        CreateWorkBook(this, cList, wbName, CellWidth); //, sheetnames);
    }
        
    /// <summary>
    /// Method to create workbook
    /// </summary>
    /// <param name="cList"></param>
    /// <param name="wbName"></param>
    /// <param name="CellWidth"></param>
    public void CreateWorkBook(StringWriter sw, object[] cList, string wbName, int CellWidth)  //, string[] sheetnames)
    {

        sw.WriteLine("<?xml version=\"1.0\"?>");
        sw.WriteLine("<?mso-application progid=\"Excel.Sheet\"?>");
        sw.WriteLine("<ss:Workbook xmlns=\"urn:schemas-microsoft-com:office:spreadsheet\"");
        sw.WriteLine(" xmlns:o=\"urn:schemas-microsoft-com:office:office\"");
        sw.WriteLine(" xmlns:x=\"urn:schemas-microsoft-com:office:excel\"");
        sw.WriteLine(" xmlns:ss=\"urn:schemas-microsoft-com:office:spreadsheet\"");
        sw.WriteLine(" xmlns:html=\"http://www.w3.org/TR/REC-html40/\">");

        foreach (DataTable myTable in cList)
        {
            if (myTable.Rows.Count > 0) CreateWorkSheet(myTable.TableName, sw, myTable, CellWidth);
            else CreateWorkSheet_Blank(myTable.TableName, sw);
        }
        sw.WriteLine("</ss:Workbook>");

    }

    


    /// <summary>
    /// Method to create worksheet
    /// </summary>
    /// <param name="wsName"></param>
    /// <param name="sw"></param>
    /// <param name="dt"></param>
    /// <param name="cellwidth"></param>
    private void CreateWorkSheet(string wsName, System.IO.StringWriter sw, DataTable dt, int cellwidth)
    {
        if (dt.Columns.Count > 0)
        {
            sw.WriteLine("<ss:Worksheet ss:Name=\"" + wsName + "\">");
            int cCount = dt.Columns.Count;
            long rCount = dt.Rows.Count + 1;
            sw.WriteLine("<ss:Table ss:ExpandedColumnCount=\"" + cCount + "\" ss:ExpandedRowCount=\"" + rCount + "\" x:FullColumns=\"1\" x:FullRows=\"1\">");
            for (int i = (cCount - cCount); i <= (cCount - 1); i++)
            {
                sw.WriteLine("<ss:Column ss:AutoFitWidth=\"1\" ss:Width=\"" + cellwidth + "\"/>");
            }
            DataTableRowIteration(dt, sw);
            sw.WriteLine("</ss:Table>");
            //sw.WriteLine("<WorksheetOptions xmlns=\"urn:schemas-microsoft-com:office:excel\">");
            //sw.WriteLine("<Selected/>");
            //sw.WriteLine("<DoNotDisplayGridlines/>");
            //sw.WriteLine("<ProtectObjects>False</ProtectObjects>");
            //sw.WriteLine("<ProtectScenarios>False</ProtectScenarios>");
            //sw.WriteLine("</WorksheetOptions>");
            sw.WriteLine("</ss:Worksheet>");
        }
    }

    private void CreateWorkSheet_Blank(string wsName, System.IO.StringWriter sw)
    {
        {
            sw.WriteLine("<ss:Worksheet ss:Name=\"" + wsName + "\">");
            sw.WriteLine("<ss:Table>");
            sw.WriteLine("<ss:Row>");
            sw.WriteLine("<ss:Cell><ss:Data ss:Type=\"String\">No data records met criteria for this measure.</ss:Data></ss:Cell>");
            sw.WriteLine("</ss:Row>");
            sw.WriteLine("</ss:Table>");
            sw.WriteLine("</ss:Worksheet>");
        }
    }


    /// <summary>
    /// Method to create rows by iterating thru datatable rows
    /// </summary>
    /// <param name="dt"></param>
    /// <param name="sw"></param>
    private void DataTableRowIteration(DataTable dt, System.IO.StringWriter sw)
    {
        sw.WriteLine("<ss:Row>");
        foreach (DataColumn dc in dt.Columns)
        {
            string tcText = dc.ColumnName;
            sw.WriteLine("<ss:Cell><ss:Data ss:Type=\"String\">" + CleanInvalidXmlChars(tcText) + "</ss:Data></ss:Cell>");
        }
        sw.WriteLine("</ss:Row>");
        foreach (DataRow dr in dt.Rows)
        {
            sw.WriteLine("<ss:Row>");
            foreach (DataColumn tc in dt.Columns)
            {
                string gcText = dr[tc].ToString();
                sw.WriteLine("<ss:Cell><ss:Data ss:Type=\"String\">" + CleanInvalidXmlChars(gcText) + "</ss:Data></ss:Cell>");
            }
            sw.WriteLine("</ss:Row>");
        }
    }



    public static string CleanInvalidXmlChars(string text)
    {
        string re = @"[^\x09\x0A\x0D\x20-\xD7FF\xE000-\xFFFD\x10000-x10FFFF]";
        return Regex.Replace(text, re, "");
    }  

	}
}

