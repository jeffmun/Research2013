using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.SessionState;


namespace Documents
{

    public partial class DataDictionary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Page_PreRender(Object o, EventArgs e)
        {
            string tableID = Request.Params["tableID"];

            HtmlControl frame1 = new System.Web.UI.HtmlControls.HtmlGenericControl("iframe");

            //if (Request.Params["tableID"] != null)
            if (tableID != null)
            {
                try
                {
                    frame1.Attributes["src"] = "https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fData+Documentation%2fData+Dictionary+by+Table&tableID=" + tableID + "&rs%3aCommand=Render";
                }
                catch (Exception ex)
                {
                    frame1.Attributes["src"] = "https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fData+Documentation%2fData+Dictionary+by+Table&rs%3aCommand=Render";
                }

            }
            else
            {
                frame1.Attributes["src"] = "https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fData+Documentation%2fData+Dictionary+by+Table&rs%3aCommand=Render";
            }

            frame1.Attributes["style"] = "width:100%; height:800px";
            frame1.Attributes["frameborder"] = "1";
            frame1.Attributes["scrolling"] = "auto";
            frame1.Attributes["align"] = "top";

            theFrameHolder.Controls.Add(frame1);


        }


    }
}