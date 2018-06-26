using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AutismCenterBase;

public partial class DataEntryForms_Common_BOT2_BOT2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // UpdatePanel panel_full = (UpdatePanel)FindControl("panel_full");


        //if (bot2_formvers.FieldTextBoxText== "1")
        //{
        //    panel_full.Visible = true;
        //    panel_full.Update();
        //}

        //panel_full.Visible = true;

    }


    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
        
        processVisibility(sender, e);

    }

    protected void processVisibility(object sender, EventArgs e)
    {
        if (bot2_formvers.FieldTextBoxText == String.Empty)
        {
            panel_full.Visible = false;
        }
        else if (bot2_formvers.FieldTextBoxText == "0")
        {
            panel_full.Visible = true;
            label_short.Visible = true;
            label_full.Visible = false;
            showShort();
        }
        else if (bot2_formvers.FieldTextBoxText == "1")
        {
            panel_full.Visible = true;
            label_short.Visible = false;
            label_full.Visible = true;

            showFull();
        }


    }

    protected void showFull()
    {
        fmp01.Visible = true;
        fmp02.Visible = true;
        fmp03.Visible = true;
        fmp04.Visible = true;
        fmp05.Visible = true;
        fmp06.Visible = true;
        fmp07.Visible = true;
        fmi01.Visible = true;
        fmi02.Visible = true;
        fmi03.Visible = true;
        fmi04.Visible = true;
        fmi05.Visible = true;
        fmi06.Visible = true;
        fmi07.Visible = true;
        fmi08.Visible = true;
        md01.Visible = true;
        md02.Visible = true;
        md03.Visible = true;
        md04.Visible = true;
        md05.Visible = true;
        bc01.Visible = true;
        bc02.Visible = true;
        bc03.Visible = true;
        bc04.Visible = true;
        bc05.Visible = true;
        bc06.Visible = true;
        bc07.Visible = true;
        bal01.Visible = true;
        bal02.Visible = true;
        bal03.Visible = true;
        bal04.Visible = true;
        bal05.Visible = true;
        bal06.Visible = true;
        bal07.Visible = true;
        bal08.Visible = true;
        bal09.Visible = true;
        rsa01.Visible = true;
        rsa02.Visible = true;
        rsa03.Visible = true;
        rsa04.Visible = true;
        rsa05.Visible = true;
        ulc01.Visible = true;
        ulc02.Visible = true;
        ulc03.Visible = true;
        ulc04.Visible = true;
        ulc05.Visible = true;
        ulc06.Visible = true;
        ulc07.Visible = true;
        str01.Visible = true;
        str02.Visible = true;
        str03.Visible = true;
        str04.Visible = true;
        str05.Visible = true;
    }

    protected void showShort()
    {

        fmp01.Visible = false;
        fmp02.Visible = false;
        fmp03.Visible = true;
        fmp04.Visible = false;
        fmp05.Visible = false;
        fmp06.Visible = true;
        fmp07.Visible = false;
        fmi01.Visible = false;
        fmi02.Visible = true;
        fmi03.Visible = false;
        fmi04.Visible = false;
        fmi05.Visible = false;
        fmi06.Visible = false;
        fmi07.Visible = true;
        fmi08.Visible = false;
        md01.Visible = false;
        md02.Visible = true;
        md03.Visible = false;
        md04.Visible = false;
        md05.Visible = false;
        bc01.Visible = false;
        bc02.Visible = false;
        bc03.Visible = true;
        bc04.Visible = false;
        bc05.Visible = false;
        bc06.Visible = true;
        bc07.Visible = false;
        bal01.Visible = false;
        bal02.Visible = true;
        bal03.Visible = false;
        bal04.Visible = false;
        bal05.Visible = false;
        bal06.Visible = false;
        bal07.Visible = true;
        bal08.Visible = false;
        bal09.Visible = false;
        rsa01.Visible = false;
        rsa02.Visible = false;
        rsa03.Visible = true;
        rsa04.Visible = false;
        rsa05.Visible = false;
        ulc01.Visible = true;
        ulc02.Visible = false;
        ulc03.Visible = false;
        ulc04.Visible = false;
        ulc05.Visible = false;
        ulc06.Visible = true;
        ulc07.Visible = false;
        str01.Visible = false;
        str02.Visible = true;
        str03.Visible = true;
        str04.Visible = false;
        str05.Visible = false;


    }
}