<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    protected void Application_PreRequestHandlerExecute(object sender, System.EventArgs e) {
        Page page = HttpContext.Current.CurrentHandler as Page;
        if (page != null) {
            page.PreInit += new EventHandler(page_PreInit);
        }
    }

    void page_PreInit(object sender, EventArgs e) {
        Page page = HttpContext.Current.CurrentHandler as Page;
        if (page != null && page.Request.Cookies["theme"] != null)
        {
            DevExpress.Web.ASPxWebControl.GlobalTheme = page.Request.Cookies["theme"].Value;
        }
    }

</script>
