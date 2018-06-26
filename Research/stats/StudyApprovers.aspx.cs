using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Web.Services;
using uwac;

public partial class stats_DataProject_Add : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        GetApproverList_for_all_studies();
        //LoadStudyAppr();
        //LoadPotentAppr();
    }





    //protected void LoadStudyAppr()
    //{
    //    SQL_utils sql = new SQL_utils();
    //    DataTable dt = new DataTable();
        
    //    dt = sql.DataTable_from_SQLstring("select studyappr_pk, a.staffID, allowProxy, firstname + ' ' + lastname staffname, studyname " +
    //        " from dp.StudyApprover a join uwautism_research_backend..tblstaff b ON a.staffID = b.staffID" + 
    //        " join uwautism_research_backend..tblstudy c ON a.studyID = c.studyID order by studyname, firstname, lastname " );

    //    gridStudyAppr.DataSource = dt;
    //    gridStudyAppr.DataBind();
    //    sql.Close();
    //}


    //protected void LoadPotentAppr()
    //{
    //    SQL_utils sql = new SQL_utils();
    //    DataTable dt = new DataTable();

    //    dt = sql.DataTable_from_SQLstring("select a.staffID, firstname + ' ' + lastname staffname " +
    //        " from dp.PotentialApprover a join uwautism_research_backend..tblstaff b ON a.staffID = b.staffID" );

    //    gridPotentAppr.DataSource = dt;
    //    gridPotentAppr.DataBind();
    //    sql.Close();
    //}





    //protected void gridStudyAppr_InsertCommand(object sender, Obout.Grid.GridRecordEventArgs e)
    //{
    //    oboutGrid_utils o = new oboutGrid_utils();
    //    string x = o.oGrid_InsertData(e.Record, "StudyApprover", "data", "dp", "studyappr_pk", 0);

    //}



    //protected void gridPotentAppr_InsertCommand(object sender, Obout.Grid.GridRecordEventArgs e)
    //{
    //    oboutGrid_utils o = new oboutGrid_utils();
    //    string x = o.oGrid_InsertData(e.Record, "PotentialApprover", "data", "dp", "staffID", 0);

    //}


    //protected void gridStudyAppr_DeleteCommand(object sender, Obout.Grid.GridRecordEventArgs e)
    //{
        
    //    int pkval = Convert.ToInt16(e.Record["studyappr_pk"]);

    //    oboutGrid_utils o = new oboutGrid_utils();
    //    string x = o.oGrid_DeleteData("StudyApprover", "data", "dp", "studyappr_pk", pkval);
    //}


    //protected void gridPotentAppr_DeleteCommand(object sender, Obout.Grid.GridRecordEventArgs e)
    //{

    //    int pkval = Convert.ToInt16(e.Record["staffID"]);

    //    oboutGrid_utils o = new oboutGrid_utils();
    //    string x = o.oGrid_DeleteData("PotentialApprover", "data", "dp", "staffID", pkval);
    //}

    //#region Rebind


    //protected void gridStudyAppr_Rebind(object sender, EventArgs e)
    //{
    //    LoadStudyAppr();
    //}

    //protected void gridPotentAppr_Rebind(object sender, EventArgs e)
    //{
    //    LoadPotentAppr();
    //}

    //#endregion

    

    protected void GetApproverList_for_all_studies()
    {

        SQL_utils sql = new SQL_utils("data");

        string[] keep = new string[] { "FullStudyName", "StudyName", "studyID" };

        DataTable dtSTATS = sql.DataTable_from_SQLstring("select * from dp.vwDBstatistics");
        gvSTATS.DataSource = dtSTATS;
        gvSTATS.DataBind();


        DataTable dtY0 = sql.DataTable_from_SQLstring("exec dp.spStudyApprover 'yes', 0");
        DataTable dtY0_pivot = utilsPivot.Pivot(dtY0, keep, "ApproverNum", "ApproverName", "FullStudyName, ApproverName", "ApproverNum");

        gvY0.DataSource = dtY0_pivot;
        gvY0.DataBind();


        DataTable dtN0 = sql.DataTable_from_SQLstring("exec dp.spStudyApprover 'no', 0");
        DataTable dtN0_pivot = utilsPivot.Pivot(dtN0, keep, "ApproverNum", "ApproverName", "FullStudyName, ApproverName", "ApproverNum");


        gvN0.DataSource = dtN0_pivot;
        gvN0.DataBind();

        DataTable dtY1 = sql.DataTable_from_SQLstring("exec dp.spStudyApprover 'yes', 1");
        DataTable dtY1_pivot = utilsPivot.Pivot(dtY1, keep, "ApproverNum", "ApproverName", "FullStudyName, ApproverName", "ApproverNum");

        gvY1.DataSource = dtY1_pivot;
        gvY1.DataBind();


        DataTable dtN1 = sql.DataTable_from_SQLstring("exec dp.spStudyApprover 'no', 1");
        DataTable dtN1_pivot = utilsPivot.Pivot(dtN1, keep, "ApproverNum", "ApproverName", "FullStudyName, ApproverName", "ApproverNum");


        gvN1.DataSource = dtN1_pivot;
        gvN1.DataBind();

        sql.Close(); 

    }


}