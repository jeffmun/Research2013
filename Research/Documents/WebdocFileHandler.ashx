<%@ WebHandler Language="C#" Class="WebdocFileHandler" %>

using System;
using System.Web;


public class WebdocFileHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        string filename = context.Request.QueryString["file"];

        if (filename != null)
        {
            //Validate the file name and make sure it is one that the user may access
            context.Response.Buffer = true;
            context.Response.Clear();
            context.Response.AddHeader("content-disposition", "attachment; filename=" + filename);
            context.Response.ContentType = "application/octet-stream";

            try
            {
                context.Response.WriteFile(HttpContext.Current.Server.MapPath("~/webdocs/" + filename));
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