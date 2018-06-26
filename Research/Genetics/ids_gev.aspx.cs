using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;


public partial class Genetics_ids_gev : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if(!IsPostBack)
        {
            //Populate_Studies_DDL();
        }

    }



    protected void Populate_Studies_DDL()
    {

        SQL_utils sql = new SQL_utils("backend");

        DataTable dt1 = sql.DataTable_from_SQLstring("select 0 studyID, '--Select study--' studyname union " + 
            " select studyID, studyname from tblstudy where studyID in (select studyID from gev.study)" + 
            "and studyID in (select studyID from dbo.fn_AllowedStudies_by_CurrentUser())" );

        lstStudies.DataSource = dt1;
        lstStudies.DataTextField = "studyname"; 
        lstStudies.DataValueField = "studyID";
        lstStudies.DataBind();


        DataTable dt2 = sql.DataTable_from_SQLstring("select 0 siteID, '--Select other ID--' sitename union select siteID, sitename from tblsite where siteID in (14,15,16)");

        lstSites.DataSource = dt2;
        lstSites.DataTextField = "sitename"; 
        lstSites.DataValueField = "siteID";
        lstSites.DataBind();

    




    }
    protected void btnFindID_Click(object sender, EventArgs e)
    {
        if (txtIDToFind.Text.Length > 0)
        {
            SQL_utils sql = new SQL_utils("backend");


            string s = "select a.* from gev.vwSubjects_in_UW_studies_with_Names a " + 
                "where personID in " + 
                "(select personID from gev.vwSubjects_in_UW_studies where ID like '%" + txtIDToFind.Text + "%' )";

            DataTable dt = sql.DataTable_from_SQLstring(s);

            gv.DataSource = dt;
            gv.DataBind();

            lblInfo.Text = "";
        }
        else
        {
            lblInfo.Text = "";

            //Nothing to search
        }

    }


    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Merge cells by personID 
            int RowSpan = 2;

            int n_cols_to_merge = 3;

            for (int s = 0; s < n_cols_to_merge; s++)  //loop through subgroups + 2 (to also include Variable and Label)
            {
                for (int i = gv.Rows.Count - 2; i >= 0; i--)
                {
                    GridViewRow currRow = gv.Rows[i];
                    GridViewRow prevRow = gv.Rows[i + 1];
                    if (currRow.Cells[s].Text == prevRow.Cells[s].Text)
                    {
                        currRow.Cells[s].RowSpan = RowSpan;
                        prevRow.Cells[s].Visible = false;
                        RowSpan += 1;

                    }
                    else
                    {
                        RowSpan = 2;
                    }

                    if (i % 3 == 0)
                    {
                        //currRow.BorderWidth
                        //currRow.BackColor = System.Drawing.Color.Violet;
                    }

                }
            }
        }
        e.Row.Cells[1].Visible = false;  //Hide the PersonID cell

    }



}