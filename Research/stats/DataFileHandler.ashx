<%@ WebHandler Language="C#" Class="DataFileHandler" %>

using System;
using System.Web;


public class DataFileHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        string filename = context.Request.QueryString["file"];
        string folder = "DataDownloads"; 
        if (context.Request.QueryString["folder"] != null) folder = context.Request.QueryString["folder"] ;
        //Validate the file name and make sure it is one that the user may access
        context.Response.Buffer = true;
        context.Response.Clear();
        context.Response.AddHeader("content-disposition", "attachment; filename=" + filename);
        context.Response.ContentType = "application/octet-stream";

        try
        {
            string localfilename = (folder == null | folder == "") ? "DataDownloads" : folder;
            context.Response.WriteFile(HttpContext.Current.Server.MapPath(String.Format("~/App_Data/{0}/{1}", folder, filename)));
        }
        catch(Exception)
        {

        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}