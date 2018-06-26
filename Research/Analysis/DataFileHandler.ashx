<%@ WebHandler Language="C#" Class="DataFileHandler" %>

using System;
using System.Web;

public class DataFileHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        string filename = context.Request.QueryString["file"];
        //Validate the file name and make sure it is one that the user may access
        context.Response.Buffer = true;
        context.Response.Clear();
        context.Response.AddHeader("content-disposition", "attachment; filename=" + filename);
        context.Response.ContentType = "application/octet-stream";

        context.Response.WriteFile("~/App_Data/DataDownloads/" + filename);
        
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}