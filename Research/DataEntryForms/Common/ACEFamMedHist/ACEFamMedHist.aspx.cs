using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using AutismCenterBase.DataEntryFramework3;

public partial class AutismCenterResearch_DataEntryForms_Common_ACEFamMedHist_ACEFamMedHist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void pop(object sender, EventArgs e)
    {
        //DataFieldControl c = (DataFieldControl)this.Page.FindControl("ques_age2");

        Control c = (Control)UpdatePanel1.ContentTemplateContainer.FindControl("ques_age2");

        Label lblError = (Label)Master.FindControl("lblInfoLog_Error");

        lblError.Text += "hi.";
        lblError.Text += "<br/>********* c is " + c.GetType().ToString();

    }
}