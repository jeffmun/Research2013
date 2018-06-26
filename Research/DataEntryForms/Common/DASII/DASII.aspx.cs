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

public partial class DataEntryForms_Common_DASII_DASII : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

     
        if (!IsPostBack)
        {

        
        }
    }



    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
        processVisibility(sender, e);

    }


    protected void processVisibility(object sender, EventArgs e)
    {
        if (DASIIlevel.FieldTextBoxText == "1")
        {
            ShowAll();
            ShowEYLower(sender, e);
        }

        else if (DASIIlevel.FieldTextBoxText == "2")
        {
            ShowAll();
            ShowEYUpper(sender, e);
        }

        else if (DASIIlevel.FieldTextBoxText == "3")
        {
            ShowAll();
            ShowSA(sender, e);
        }

        else if (DASIIlevel.FieldTextBoxText == "4")
        {
            ShowAll();
            ShowEYLower(sender, e);
        }

        else if (DASIIlevel.FieldTextBoxText == "5")
        {
            ShowAll();
            ShowEYUpper(sender, e);
        }

        else if (DASIIlevel.FieldTextBoxText == "6")
        {
            ShowAll();
            ShowSA(sender, e);
        }

        else if (DASIIlevel.FieldTextBoxText == "7")
        {
            ShowAll();
            ShowEYLower(sender, e);
        }

        else if (DASIIlevel.FieldTextBoxText == "8")
        {
            ShowAll();
            ShowEYUpper(sender, e);
        }

        else
        {
            HideAll();
        }

    }



    protected void HideAll()
    {
        ClusterScores_panel.Visible = false;
        EYL_ClusterScores_panel.Visible = false;
        EYU_ClusterScores_panel.Visible = false;
        SA_ClusterScores_panel.Visible = false;

        ValueLabels_panel.Visible = false;

        VerbComp_panel.Visible = false;
        PictSim_panel.Visible = false;
        NameVoc_panel.Visible = false;
        PattConStd_panel.Visible = false;
        PattConAlt_panel.Visible = false;
        Matrices_panel.Visible = false;
        Copying_panel.Visible = false;
        RecallDesigns_panel.Visible = false;
        WordDef_panel.Visible = false;
        VerbSim_panel.Visible = false;
        SeqQuant_panel.Visible = false;     

    }

    protected void ShowAll()
    {
        //not displayed for now
        ClusterScores_panel.Visible = false;
        tableClusterToUse.Visible = true;
        tableValidity.Visible = true;

        EYL_ClusterScores_panel.Visible = true;
        EYU_ClusterScores_panel.Visible = true;
        SA_ClusterScores_panel.Visible = true;
        ValueLabels_panel.Visible = true;

        VerbComp_panel.Visible = true;
        PictSim_panel.Visible = true;
        NameVoc_panel.Visible = true;
        PattConStd_panel.Visible = true;
        PattConAlt_panel.Visible = true;
        Matrices_panel.Visible = true;
        Copying_panel.Visible = true;
        RecallDesigns_panel.Visible = true;
        WordDef_panel.Visible = true;
        VerbSim_panel.Visible = true;
        SeqQuant_panel.Visible = true;

    }


    protected void ShowEYLower(object sender, EventArgs e)
    {

        EYL_title.Visible = true;
        EYU_title.Visible = false;
        SA_title.Visible = false;

        //EYL_ClusterScores_panel.BackColor = Color.LimeGreen;
        //EYU_ClusterScores_panel.BackColor = Color.White;
        //SA_ClusterScores_panel.BackColor = Color.White;

        SAscores.Attributes["Class"] = "tblInputSmall_white";
        EYUscores.Attributes["Class"] = "tblInputSmall_white";
        EYLscores.Attributes["Class"] = "tblInputSmall_green";


        VerbComp_panel.BackColor =      Color.LimeGreen;
        PictSim_panel.BackColor =       Color.LimeGreen;
        NameVoc_panel.BackColor =       Color.LimeGreen;  //EY
        PattConStd_panel.BackColor =    Color.LimeGreen;  //EY
        PattConAlt_panel.BackColor =    Color.DarkGreen;  //EY
        Matrices_panel.BackColor =      Color.LightGreen;  //SA
        Copying_panel.BackColor =       Color.LightGreen;  //EY
        RecallDesigns_panel.BackColor = Color.White;  //SA
        WordDef_panel.BackColor =       Color.White;  //SA
        VerbSim_panel.BackColor =       Color.White;  //SA
        SeqQuant_panel.BackColor =      Color.White;  //SA

        ItemSet1_VerbComp.BgColor = "LimeGreen";
        ItemSet1_PictSim.BgColor = "LimeGreen";
        ItemSet1_NameVoc.BgColor = "LimeGreen";  //EY
        ItemSet1_Copying.BgColor = "LightGreen";  //EY
        ItemSet1_RecallDesigns.BgColor = "White";  //SA
        ItemSet1_WordDef.BgColor = "White";  //SA
        ItemSet1_PattConStd.BgColor = "LimeGreen";  //SA
        ItemSet1_PattConAlt.BgColor = "DarkGreen";  //SA
        ItemSet1_Matrices.BgColor = "LightGreen";  //SA
        ItemSet1_VerbSim.BgColor = "White";  //SA
        ItemSet1_SeqQuant.BgColor = "White";  //SA

        ItemSet2_VerbComp.BgColor = "LimeGreen";
        ItemSet2_PictSim.BgColor = "LimeGreen";
        ItemSet2_NameVoc.BgColor = "LimeGreen";  //EY
        ItemSet2_Copying.BgColor = "LightGreen";  //EY
        ItemSet2_RecallDesigns.BgColor = "White";  //SA
        ItemSet2_WordDef.BgColor = "White";  //SA
        ItemSet2_PattConStd.BgColor = "LimeGreen";  //SA
        ItemSet2_PattConAlt.BgColor = "DarkGreen";  //SA
        ItemSet2_Matrices.BgColor = "LightGreen";  //SA
        ItemSet2_VerbSim.BgColor = "White";  //SA
        ItemSet2_SeqQuant.BgColor = "White";  //SA


        //RecallObjImm_panel.Visible = true;  //SA
        //RecallObjDel_panel.Visible = true;  //SA
        //RecallDigFor_panel.Visible = true;  //SA
        //RecogPict_panel.Visible = true;  //SA
        //ENC_panel.Visible = true;  //EY
        //MLLF_panel.Visible = true;  //EY
        //RecallSeqOrd_panel.Visible = true;  //SA
        //SpdInfoProc_panel.Visible = true;  //SA
        //RecallDigBac_panel.Visible = true;  //SA
        //PhonProc_panel.Visible = true;  //SA
        //RapidName_panel.Visible = true;  //SA


        highlightUsedVals();

        
    }

    protected void ShowEYLower_click(object sender, EventArgs e)
    {
        ShowAll();
        ShowEYLower(sender, e);
    }
    protected void ShowEYUpper_click(object sender, EventArgs e)
    {
        ShowAll();

        ShowEYUpper(sender, e);
    }

    protected void ShowSA_click(object sender, EventArgs e)
    {
        ShowAll();

        ShowSA(sender, e);
    }
    protected void ShowEYUpper(object sender, EventArgs e)
    {

        EYL_title.Visible = false;
        EYU_title.Visible = true;
        SA_title.Visible = false;

        //EYL_ClusterScores_panel.BackColor = Color.White;
        //EYU_ClusterScores_panel.BackColor = Color.LimeGreen;
        //SA_ClusterScores_panel.BackColor = Color.White;

        SAscores.Attributes["Class"] = "tblInputSmall_white";
        EYLscores.Attributes["Class"] = "tblInputSmall_white";
        EYUscores.Attributes["Class"] = "tblInputSmall_green";

        VerbComp_panel.BackColor = Color.LimeGreen;
        PictSim_panel.BackColor = Color.LimeGreen;
        NameVoc_panel.BackColor = Color.LimeGreen;  //EY
        PattConStd_panel.BackColor = Color.LimeGreen;  //EY
        PattConAlt_panel.BackColor = Color.DarkGreen;  //EY
        Matrices_panel.BackColor = Color.LimeGreen;  //SA
        Copying_panel.BackColor = Color.LimeGreen;  //EY


        RecallDesigns_panel.BackColor = Color.White;  //SA
        WordDef_panel.BackColor = Color.White;  //SA
        VerbSim_panel.BackColor = Color.White;  //SA
        SeqQuant_panel.BackColor = Color.White;  //SA


        ItemSet1_VerbComp.BgColor = "LimeGreen";
        ItemSet1_PictSim.BgColor = "LimeGreen";
        ItemSet1_NameVoc.BgColor = "LimeGreen";  //EY
        ItemSet1_Copying.BgColor = "LimeGreen";  //EY
        ItemSet1_RecallDesigns.BgColor = "White";  //SA
        ItemSet1_WordDef.BgColor = "White";  //SA
        ItemSet1_PattConStd.BgColor = "LimeGreen";  //SA
        ItemSet1_PattConAlt.BgColor = "DarkGreen";  //SA
        ItemSet1_Matrices.BgColor = "LimeGreen";  //SA
        ItemSet1_VerbSim.BgColor = "White";  //SA
        ItemSet1_SeqQuant.BgColor = "White";  //SA

        ItemSet2_VerbComp.BgColor = "LimeGreen";
        ItemSet2_PictSim.BgColor = "LimeGreen";
        ItemSet2_NameVoc.BgColor = "LimeGreen";  //EY
        ItemSet2_Copying.BgColor = "LimeGreen";  //EY
        ItemSet2_RecallDesigns.BgColor = "White";  //SA
        ItemSet2_WordDef.BgColor = "White";  //SA
        ItemSet2_PattConStd.BgColor = "LimeGreen";  //SA
        ItemSet2_PattConAlt.BgColor = "DarkGreen";  //SA
        ItemSet2_Matrices.BgColor = "LimeGreen";  //SA
        ItemSet2_VerbSim.BgColor = "White";  //SA
        ItemSet2_SeqQuant.BgColor = "White";  //SA

        //RecallObjImm_panel.Visible = true;  //SA
        //RecallObjDel_panel.Visible = true;  //SA
        //RecallDigFor_panel.Visible = true;  //SA
        //RecogPict_panel.Visible = true;  //SA
        //ENC_panel.Visible = true;  //EY
        //MLLF_panel.Visible = true;  //EY
        //RecallSeqOrd_panel.Visible = true;  //SA
        //SpdInfoProc_panel.Visible = true;  //SA
        //RecallDigBac_panel.Visible = true;  //SA
        //PhonProc_panel.Visible = true;  //SA
        //RapidName_panel.Visible = true;  //SA

        highlightUsedVals();
    }



    protected void highlightUsedVals()
    {

        if (DASIIvclustused.FieldTextBoxText == "1")
        {
            EYLverb.Attributes["Class"] = "yellowrow";
            EYUverb.Attributes["Class"] = "plainrow";
            SAverb.Attributes["Class"] = "plainrow";
            //errorLink1.InnerHtml += "1";
        }

        else if (DASIIvclustused.FieldTextBoxText == "2")
        {
            EYLverb.Attributes["Class"] = "plainrow";
            EYUverb.Attributes["Class"] = "yellowrow";
            SAverb.Attributes["Class"] = "plainrow";
            //errorLink1.InnerHtml += "2";

        }
        else if (DASIIvclustused.FieldTextBoxText == "3")
        {
            EYLverb.Attributes["Class"] = "plainrow";
            EYUverb.Attributes["Class"] = "plainrow";
            SAverb.Attributes["Class"] = "yellowrow";
            //errorLink1.InnerHtml += "3";
        }
        
        
        if (DASIInvclustused.FieldTextBoxText == "1")
        {
            EYLnverb.Attributes["Class"] = "yellowrow";
            EYUnverb.Attributes["Class"] = "plainrow";
            SAnverb.Attributes["Class"] = "plainrow";
            //errorLink1.InnerHtml += "4";

        }

        else if (DASIInvclustused.FieldTextBoxText == "2")
        {
            EYLnverb.Attributes["Class"] = "plainrow";
            EYUnverb.Attributes["Class"] = "yellowrow";
            SAnverb.Attributes["Class"] = "plainrow";
            //errorLink1.InnerHtml += "5";
        }

        else if (DASIInvclustused.FieldTextBoxText == "3")
        {
            EYLnverb.Attributes["Class"] = "plainrow";
            EYUnverb.Attributes["Class"] = "plainrow";
            SAnverb.Attributes["Class"] = "yellowrow";
            //errorLink1.InnerHtml += "6";
        }


    }

    protected void ShowSA(object sender, EventArgs e)
    {

        EYL_title.Visible = false;
        EYU_title.Visible = false;
        SA_title.Visible = true;

        //EYL_ClusterScores_panel.BackColor = Color.White;
        //EYU_ClusterScores_panel.BackColor = Color.White;
        //SA_ClusterScores_panel.BackColor = Color.CornflowerBlue;

        SAscores.Attributes["Class"] = "tblInputSmall_blue";
        EYUscores.Attributes["Class"] = "tblInputSmall_white";
        EYLscores.Attributes["Class"] = "tblInputSmall_white";




        

        VerbComp_panel.BackColor = Color.White;
        PictSim_panel.BackColor = Color.White;
        NameVoc_panel.BackColor = Color.White;  //EY
        Copying_panel.BackColor = Color.White;  //EY
        RecallDesigns_panel.BackColor = Color.CornflowerBlue;  //SA
        WordDef_panel.BackColor = Color.CornflowerBlue;  //SA
        PattConStd_panel.BackColor = Color.CornflowerBlue;  //SA
        PattConAlt_panel.BackColor = Color.RoyalBlue;  //SA
        Matrices_panel.BackColor = Color.CornflowerBlue;  //SA
        VerbSim_panel.BackColor = Color.CornflowerBlue;  //SA
        SeqQuant_panel.BackColor = Color.CornflowerBlue;  //SA


        ItemSet1_VerbComp.BgColor = "White";
        ItemSet1_PictSim.BgColor = "White";
        ItemSet1_NameVoc.BgColor = "White";  //EY
        ItemSet1_Copying.BgColor = "White";  //EY
        ItemSet1_RecallDesigns.BgColor = "CornflowerBlue";  //SA
        ItemSet1_WordDef.BgColor = "CornflowerBlue";  //SA
        ItemSet1_PattConStd.BgColor = "CornflowerBlue";  //SA
        ItemSet1_PattConAlt.BgColor = "RoyalBlue";  //SA
        ItemSet1_Matrices.BgColor = "CornflowerBlue";  //SA
        ItemSet1_VerbSim.BgColor = "CornflowerBlue";  //SA
        ItemSet1_SeqQuant.BgColor = "CornflowerBlue";  //SA

        ItemSet2_VerbComp.BgColor = "White";
        ItemSet2_PictSim.BgColor = "White";
        ItemSet2_NameVoc.BgColor = "White";  //EY
        ItemSet2_Copying.BgColor = "White";  //EY
        ItemSet2_RecallDesigns.BgColor = "CornflowerBlue";  //SA
        ItemSet2_WordDef.BgColor = "CornflowerBlue";  //SA
        ItemSet2_PattConStd.BgColor = "CornflowerBlue";  //SA
        ItemSet2_PattConAlt.BgColor = "RoyalBlue";  //SA
        ItemSet2_Matrices.BgColor = "CornflowerBlue";  //SA
        ItemSet2_VerbSim.BgColor = "CornflowerBlue";  //SA
        ItemSet2_SeqQuant.BgColor = "CornflowerBlue";  //SA


        highlightUsedVals();

        //RecallObjImm_panel.Visible = true;  //SA
        //RecallObjDel_panel.Visible = true;  //SA
        //RecallDigFor_panel.Visible = true;  //SA
        //RecogPict_panel.Visible = true;  //SA
        //RecallSeqOrd_panel.Visible = true;  //SA
        //SpdInfoProc_panel.Visible = true;  //SA
        //RecallDigBac_panel.Visible = true;  //SA
        //PhonProc_panel.Visible = true;  //SA
        //RapidName_panel.Visible = true;  //SA
    }

}




