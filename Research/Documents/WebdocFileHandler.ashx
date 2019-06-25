<%@ WebHandler Language="C#" Class="WebdocFileHandler" %>

using System;
using System.Web;
using System.IO;


public class WebdocFileHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        string filename = context.Request.QueryString["file"];
        string mode = context.Request.QueryString["mode"];

        if (filename != null)
        {


            string fullpath;

            if(mode == "valant")
            {
                //DirectoryInfo dir= new DirectoryInfo(HttpContext.Current.Server.MapPath("/ValantDocs"));
                //FileInfo[] files = dir.GetFiles( "*.pdf", SearchOption.TopDirectoryOnly);

                string dir = HttpContext.Current.Server.MapPath("~/ValantDocs");
                //string dir = @"\\medicine.washington.edu\autism\UWAC\clinic\Ops\UWAC IT\ValantExport\Docs";


                string[] parms = filename.Split(new string[] { "@!@" }, StringSplitOptions.None);
                string path = String.Format(@"{0}\{1}\", dir, parms[0]);
              

                fullpath = String.Format(@"{0}\{1}\{2}", dir, parms[0], parms[1]);
                filename = parms[1];
            }
            else
            {
                // Default mode is to retrieve docs from the "webdocs" folder 
                fullpath = HttpContext.Current.Server.MapPath("~/webdocs/" + filename);
            }

            //Validate the file name and make sure it is one that the user may access
            context.Response.Buffer = true;
            context.Response.Clear();
            context.Response.AddHeader("content-disposition", "attachment; filename=" + filename);
            context.Response.ContentType = "application/octet-stream";


            try
            {
                context.Response.WriteFile(fullpath);
            }
            catch (Exception)
            {

            }
        }
        else {
            try
            {
                HttpPostedFile postedFile = context.Request.Files[0];
                if (postedFile.ContentLength == 0)

                    throw new Exception("Empty file received");

                // cannot restrict accept type on client
                //if (postedFile.ContentType == "image/png")  
                //  throw new Exception("PNG files not allowed");

                context.Response.Write(postedFile.ContentType);

                string fn = System.IO.Path.GetFileName(postedFile.FileName);
                // to save in 'App_Data':
                // string path =  
                //   HttpContext.Current.Server.MapPath("~/App_Data/");
                string path = HttpContext.Current.Server.MapPath("~/_temp/AnalysisSession/");

                postedFile.SaveAs(path + fn);
                context.Response.Write("Server received " + fn);  //
            }
            catch (Exception ex)
            {
                context.Response.Write("Error occurred on server " +
                  ex.Message);
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}