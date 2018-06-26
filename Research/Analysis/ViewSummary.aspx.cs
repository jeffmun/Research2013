using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Analysis_ViewSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string myfile = "output_6_v2.html";
        //loadHTMLsummary(myfile);

        Response.WriteFile(myfile);

     if (Request.QueryString["filename"] != null)
     {
        string filename = Request.QueryString["filename"];
        loadHTMLsummary(filename);
     }
     else
     {
         lblInfo.Text = "No file by that name.";
     }
    }




    private void loadHTMLsummary(string filename)
    {
        //string folder = @"E:\inetpub\wwwroot\research\analysis\output\" ;

        Literal lit = new Literal();

        //string filename = Convert.ToString(Server.MapPath("~\\Analysis\\AutoMeas\\" + _content_studyID.ToString() + "_" + version + "_mID" + measureID.ToString() + ".html"));
        //string filename = Convert.ToString("~/Analysis/AutoMeas/" + _content_studyID.ToString() + "_" + version + "_mID" + measureID.ToString() + ".html");
        //lit.Text = "<a name=" + measureID.ToString() + "></a><a href=#top>top</a><br/>" + Convert.ToString(ReadHtmlFile(filename));

        
        //lit.Text = Convert.ToString(ReadHtmlFile(folder + filename));
        
        //Oct27
        //lit.Text = Convert.ToString(ReadFile(folder + filename));


        //tblmyinfo.Rows[0].Cells[0].InnerHtml += ". . .  " + filename + "<br/>";

        //UpdatePanel UpdatePanel_output = (UpdatePanel)FindControl("UpdatePanel_output");
        //UpdatePanel_output.ContentTemplateContainer.Controls.Add(lit);
        //UpdatePanel_output.Update();

        //Panel panel1 = (Panel)FindControl("panel1");
        panel1.Controls.Add(lit);
    }



    /// <summary>
    /// Read Html file 
    /// </summary>
    /// <param name="htmlFileNameWithPath"></param>
    /// <returns></returns>
    public static System.Text.StringBuilder ReadHtmlFile(string htmlFileNameWithPath)
    {
        System.Text.StringBuilder htmlContent = new System.Text.StringBuilder();
        System.Text.StringBuilder htmlContent_toreturn = new System.Text.StringBuilder();
        string line;

        try
        {
            System.IO.StreamReader htmlReader = new System.IO.StreamReader(htmlFileNameWithPath);

            using (htmlReader)
            {

                while ((line = htmlReader.ReadLine()) != null)
                {
                    htmlContent.Append(line);
                }
            }

            htmlContent_toreturn = htmlContent;
        }
        catch (Exception objError)
        {
            htmlContent_toreturn.Append(objError.Message);
            //throw objError;
        }

        return htmlContent_toreturn;
    }




}