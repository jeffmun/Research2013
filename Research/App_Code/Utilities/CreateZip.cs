using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;
using Ionic.Zip;
using AutismCenterBase.Utilities;

/// <summary>
/// Summary description for CreateZip
/// </summary>
public class CreateZip
{

 
    public CreateZip(DataTable[] tblList, string filename, string saveto, string ziptype )
	{
		//
		// TODO: Add constructor logic here
		//

        StringWriter sw ;
        string filename_with_zip = filename + ".zip";



        using (ZipFile zip = new ZipFile())
        {
            int counter = 0;
            foreach (DataTable myTable in tblList)
            {
              
                if (myTable.Rows.Count > 0)
                {
                    sw = new CreateTABdelim(myTable); //, filenames[counter]);
                }
                else
                {
                    sw = new StringWriter();
                    sw.WriteLine("No data for this measure");
                }
                counter++;

                zip.AddEntry(myTable.TableName + ".txt", sw.ToString());
                
            }

            //Add the R code files if this is a zipdata file we are creating
            if(ziptype=="zipdata")
            {
                zip.AddFile(@"E:\inetpub\wwwroot\research\app_data\R\_README.txt","");
            }


            if (saveto == "browser")
            {
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.ContentType = "application/zip";
                HttpContext.Current.Response.AddHeader("content-disposition", "filename=" + filename_with_zip);
                zip.Save(HttpContext.Current.Response.OutputStream);
                HttpContext.Current.Response.End();

            }
            else
            {
                zip.Save(@"E:\inetpub\wwwroot\research\app_data\datadownloads\" + filename_with_zip);
            }

        }

    }



}