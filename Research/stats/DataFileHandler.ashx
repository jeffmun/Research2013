<%@ WebHandler Language="C#" Class="DataFileHandler" %>

using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;


public class DataFileHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        string filename = context.Request.QueryString["file"];
        //Validate the file name and make sure it is one that the user may access
        context.Response.Buffer = true;
        context.Response.Clear();
        context.Response.AddHeader("content-disposition", "attachment; filename=" + filename);
        context.Response.ContentType = "application/octet-stream";

        try
        {
            context.Response.WriteFile(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + filename));
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