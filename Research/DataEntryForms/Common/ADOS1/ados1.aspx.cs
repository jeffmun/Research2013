using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class DataEntryForms_Common_ados1_ados1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }


    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
       // HideAll();
       // processVisibility(sender, e);

    }

    //protected void HideAll()
    //{
    //    scores.Visible = false;
    //    scores_T.Visible = false;
    //    scores_123.Visible = false;

    //    items_T.Visible = false;
    //    items_1.Visible = false;
    //    items_2.Visible = false;
    //    items_3.Visible = false;

    //}


    //protected void processVisibility(object sender, EventArgs e)
    //{
    //    if (ados2_scrmsg.FieldTextBoxText == String.Empty)
    //    {
    //        scores.Visible = false;
    //    }
    //    else
    //    {
    //        scores.Visible = true;
    //    }

    //    string scrmsg = ados2_scrmsg.FieldTextBoxText ;
    //    int locError = scrmsg.IndexOf("ERROR");
    //    int locWarning = scrmsg.IndexOf("WARNING");
                

    //    if (locError > 0 )
    //    {
    //        scrmsg_panel.BackColor = Color.Red;
    //    }
    //    if (locWarning > 0)
    //    {
    //        scrmsg_panel.BackColor = Color.Yellow;
    //    }
    //    else
    //    {
    //        scrmsg_panel.BackColor = Color.White;
    //    }
        
        




    //    if (ados2_mod.FieldTextBoxText == "0")
    //    {
    //        ShowToddler(sender, e);
    //    }

    //    if (ados2_mod.FieldTextBoxText == "1")
    //    {
    //        ShowMod1(sender, e);
    //    }

    //    if (ados2_mod.FieldTextBoxText == "2")
    //    {
    //        ShowMod2(sender, e);
    //    }

    //    if (ados2_mod.FieldTextBoxText == "3")
    //    {
    //        ShowMod3(sender, e);
    //    }

  
    //}



    //protected void ShowToddler(object sender, EventArgs e)
    //{
    //    scores_T.Visible = true;
    //    scores_123.Visible = true;

    //    items_T.Visible = true;
    //    items_1.Visible = false;
    //    items_2.Visible = false;
    //    items_3.Visible = false;
    //}

    //protected void ShowMod1(object sender, EventArgs e)
    //{
    //    scores_T.Visible = false;
    //    scores_123.Visible = true;

    //    items_T.Visible = false;
    //    items_1.Visible = true;
    //    items_2.Visible = false;
    //    items_3.Visible = false;
    //}

    //protected void ShowMod2(object sender, EventArgs e)
    //{
    //    scores_T.Visible = false;
    //    scores_123.Visible = true;

    //    items_T.Visible = false;
    //    items_1.Visible = false;
    //    items_2.Visible = true;
    //    items_3.Visible = false;
    //}

    //protected void ShowMod3(object sender, EventArgs e)
    //{
    //    scores_T.Visible = false;
    //    scores_123.Visible = true;

    //    items_T.Visible = false;
    //    items_1.Visible = false;
    //    items_2.Visible = false;
    //    items_3.Visible = true;
    //}

}