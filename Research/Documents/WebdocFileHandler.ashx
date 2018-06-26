<%@ WebHandler Language="C#" Class="WebdocFileHandler" %>

using System;
using System.Web;


public class WebdocFileHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        string filename = context.Request.QueryString["file"];
        //Validate the file name and make sure it is one that the user may access
        context.Response.Buffer = true;
        context.Response.Clear();
        context.Response.AddHeader("content-disposition", "attachment; filename=" + filename);
        context.Response.ContentType = "application/octet-stream";

        try
        {
            context.Response.WriteFile(HttpContext.Current.Server.MapPath("~/webdocs/" + filename));
        }
        catch(Exception )
        {
            
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}