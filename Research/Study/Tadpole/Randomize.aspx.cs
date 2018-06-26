using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Study_Tadpole_Randomize : System.Web.UI.Page
{
    List<int> BigCells = new List<int>();

    protected void Page_Load(object sender, EventArgs e)
    {
        int subjID = 0;

        //if (ViewState["subjID"] != null)
        //{
        //    subjID = int.Parse(ViewState["subjID"].ToString());
        //}

        if(!IsPostBack)
        {
            Populate_ddlNonRandomizedSubjects();
            Populate_Ns();
            LoadInfo();
        }



        if (Request.QueryString["subjID"] != null)
        {
            subjID = int.Parse(Request.QueryString["subjID"]);
        }

        if(subjID > 0 )
        {
            LoadInfo();

            ddlPotSubj.SelectedValue = subjID.ToString();
            LoadInfoForPotentialSubject(subjID);
            //LoadInfoForPotentialSubject(int.Parse(hidsubjID.Value));
        }


    }

    protected void Populate_ddlNonRandomizedSubjects()
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = sql.DataTable_from_SQLstring("select 0 subjID, '--select ID--' ID union select subjID, ID from uwautism_research_backend..vwTadpole_Randomization_Strata_POTENTIAL_SUBJECTS");

        ddlPotSubj.DataSource = dt;
        ddlPotSubj.DataBind();

        sql.Close();
    }


    protected void Populate_Ns()
    {

        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = sql.DataTable_from_SQLstring("select * from vwTadpole_Randomization_Strata_Ns_BY_STRATA order by 1,2");
        gvNs_Strata.DataSource = dt;
        gvNs_Strata.DataBind();

        DataTable dt1 = sql.DataTable_from_SQLstring("select * from vwTadpole_Randomization_Strata_Ns_BY_SexSiteGroup order by 1,2");
        gvSexSiteGroup.DataSource = dt1;
        gvSexSiteGroup.DataBind();

        DataTable dt2 = sql.DataTable_from_SQLstring("select * from vwTadpole_Randomization_Strata_Ns_BY_SiteGroup order by 1");
        gvSiteGroup.DataSource = dt2;
        gvSiteGroup.DataBind();

        DataTable dt3 = sql.DataTable_from_SQLstring("select * from vwTadpole_Randomization_Strata_MeanAge_BY_SiteGroup order by 1");
        gvMeanAge.DataSource = dt3;
        gvMeanAge.DataBind();

        DataTable dt4 = sql.DataTable_from_SQLstring("select * from vwTadpole_Randomization_Strata_MeanDQ_BY_SiteGroup order by 1");
        gvMeanDQ.DataSource = dt4;
        gvMeanDQ.DataBind();


        sql.Close();

    }



    protected void LoadInfo()
    {
        panel0.Visible=true;
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt1 = sql.DataTable_from_SQLstring("select * from vw_tmpTadpole_Randomization_Strata_withTOTS");
        DataTable dt2 = sql.DataTable_from_SQLstring("select * from vwTadpole_Randomization_CurrentImbalance");

        DataTable dtCurrentDB = sql.DataTable_from_SQLstring("select * from vwTadpole_Randomization_Strata_withTOTS");
        DataTable dtPendingConsent = sql.DataTable_from_SQLstring("select ID, Site, TxGroup, Sex, muagem as Age, mucoiq as DQ from vwTadpole_Randomization_Strata_base_withPending");
                // "where id in (select id from vwMasterStatus_S where
                // studyID=1077 and subjstatus='Pending Consent')");

        GridView gvCurrentDB = new GridView();
        gvCurrentDB.RowDataBound += new GridViewRowEventHandler(gv_RowDataBound);
        gvCurrentDB.ID = "gvCurrentDB";
        gvCurrentDB.DataSource = dtCurrentDB;
        gvCurrentDB.DataBind();
        panelCurrentDB.Controls.Clear();
        panelCurrentDB.Controls.Add(gvCurrentDB);

        Label lab2 = new Label();

        if (dtPendingConsent.Rows.Count>=1)
        {
            lab2.Text = "<br/><br/><i>Randomized Subjects Pending Consent:</i><br/><b> RESOLVE BEFORE RANDOMIZING NEW SUBJECTS</b><br/>";
        }
        else
        {
            lab2.Text = "<br/><br/><i>Randomized Subjects Pending Consent:</i> None.<br/>";
        }

        lab2.ForeColor = Color.Red;
        panelCurrentDB.Controls.Add(lab2);

        GridView gvPendingConsent = new GridView();
        gvPendingConsent.ID = "gvPendingConsent";
        gvPendingConsent.DataSource = dtPendingConsent;
        gvPendingConsent.DataBind();
        gvPendingConsent.ForeColor = Color.Red;
        panelCurrentDB.Controls.Add(gvPendingConsent);





        GridView gv1 = new GridView();
        gv1.RowDataBound += new GridViewRowEventHandler(gv_RowDataBound);
        gv1.ID = "gv1";
        gv1.DataSource = dt1;
        gv1.DataBind();

        GridView gv2 = new GridView();
        gv2.RowDataBound += new GridViewRowEventHandler(gv_RowDataBound);
        gv2.ID = "gv2";
        gv2.DataSource = dt2;
        gv2.DataBind();

        panel1.Controls.Add(gv1);
        panel2.Controls.Add(gv2);

        //Get the comparison between the live view and the tbl of entered data
        DataTable dt3 = sql.DataTable_from_SQLstring("exec spTadpole_Randomization_Strata_COMPARE_tbl_and_view");
        if (dt3.Rows.Count>0)
        {
            GridView gv3 = new GridView();

            gv3.RowDataBound += new GridViewRowEventHandler(gv_RowDataBound);
            gv3.ID = "gv3";
            gv3.DataSource = dt3;
            gv3.DataBind();

            Literal lit = new Literal();
            lit.Text = "<br/><br/>List of discrepancies between the table and view<br/>of the current distribution of N's.<br/>";

            panel1.Controls.Add(lit);
            panel1.Controls.Add(gv3);
        }
        else
        {
            Literal lit = new Literal();
            lit.Text = "<br/><br/>Hooray! No discrepancies between the table and view<br/>of the current distribution of N's.<br/>";

            panel1.Controls.Add(lit);
        }



        sql.Close();

    }

    protected void GetRandom()
    {
        panel3.Controls.Clear();

        SQL_utils sql = new SQL_utils("backend");

        DataTable dt1 = sql.DataTable_from_SQLstring("select * from vw_tmpTadpole_Randomization_Strata_withTOTS");
        DataTable dt2 = sql.DataTable_from_SQLstring("select * from vwTadpole_Randomization_CurrentImbalance");

        List<SqlParameter> ps = new List<SqlParameter>();

        ps.Add( sql.CreateParam("age", txtAge.Text, "int"));
        ps.Add( sql.CreateParam("dq", txtDQ.Text, "int"));
        ps.Add( sql.CreateParam("gender", txtGender.Text, "int"));
        ps.Add( sql.CreateParam("uw", txtUW.Text, "int"));
        ps.Add( sql.CreateParam("ucd", txtUCD.Text, "int"));
        ps.Add( sql.CreateParam("tot", txtTOT.Text, "int"));

        DataSet ds = sql.DataSet_from_ProcName("spTadpole_Randomization_DecisionFx", ps);

        int counter = 0;
        foreach (DataTable dt in ds.Tables)
        {
            counter++;

            GridView gv = new GridView();
            gv.ID = "gvout" + counter.ToString();

            Label lbl = new Label();

            lbl.Text = "<br/>If subject assigned to...";
            lbl.Font.Italic = true;
            lbl.Font.Size = 11;
            lbl.ForeColor = Color.Navy;
            lbl.Font.Bold = true;

            gv.RowDataBound += new GridViewRowEventHandler(gv_RowDataBound);

            gv.DataSource = dt;
            gv.DataBind();

            if (counter < 4)
            {
                panel3.Controls.Add(gv);
                Literal lit = new Literal();
                lit.Text = "<br/><br/>";
                panel3.Controls.Add(lit);
            }

            else if (counter == 4)
            {
                lbl.Text += "A";
                panel4a.Controls.Add(lbl);
                panel4a.Controls.Add(gv);

            }
            else if (counter == 5)
            {
                lbl.Text += "B";
                panel4b.Controls.Add(lbl);
                panel4b.Controls.Add(gv);

            }
            else if (counter == 6)
            {
                lbl.Text += "C";
                panel4c.Controls.Add(lbl);
                panel4c.Controls.Add(gv);
            }
            else if (counter == 7)
            {
                lbl.Text += "D";
                panel4d.Controls.Add(lbl);
                panel4d.Controls.Add(gv);

            }




        }

        sql.Close();

    }

    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string gvname = e.Row.Parent.NamingContainer.ClientID.ToString();

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (gvname == "gv3")
            {
                for(int i=0; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].ForeColor = Color.DarkRed;
                }
            }
            else
            {

                switch (e.Row.Cells[0].Text)
                {
                    case "1":
                        e.Row.BackColor = Color.AliceBlue;
                        break;
                    case "3":
                        e.Row.BackColor = Color.Honeydew;
                        break;
                    case "5":
                        e.Row.BackColor = Color.Lavender;
                        break;
                    case "6":
                        if (gvname == "gv2")
                            e.Row.Cells[8].BackColor = Color.LightSkyBlue;
                        if (gvname == "gvout4" | gvname == "gvout5" | gvname == "gvout6" | gvname == "gvout7")
                            e.Row.Cells[9].BackColor = Color.LightSkyBlue;
                        break;
                }
            }

            if(gvname == "gv2" )
            {
                e.Row.Height = 40;
            }
            else
            {
                e.Row.Height = 20;
            }


            if(gvname == "gvout2")
            {
                BigCells.Clear();

                e.Row.BackColor = Color.LightCoral;

                DataRowView vw = (DataRowView)e.Row.DataItem;

                List<int> nums = new List<int>();
                for(int i=2; i <= 7; i++)
                {
                    nums.Add(int.Parse(vw[i].ToString()));
                }

                var absoluteMax = nums.Select(x => Math.Abs(x)).Max();

                for (int j = 0; j < nums.Count(); j++ )
                {
                    if (Math.Abs(nums[j]) == absoluteMax)
                    {
                        BigCells.Add(j + 2);
                        e.Row.Cells[j + 2].Font.Size = 18;
                    }
                }

                e.Row.Cells[1].Width = 90;  //match the width of the first table

            }

            if (gvname == "gvout3")
            {
                foreach(int i in BigCells)
                {
                    e.Row.Cells[i].Font.Size = 18;
                }

                e.Row.Cells[1].Width = 90;  //match the width of the first table
            }

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        ProcessSubjectProfile();
    }


    protected void ddlPotSubj_SelectedIndexChanged(object sender, EventArgs e)
    {
//        LoadInfoForPotentialSubject(ddlPotSubj.SelectedValue.ToString() );

        ViewState["subjID"] = ddlPotSubj.SelectedValue.ToString();
        //Response.Redirect("~/study/Tadpole/Randomize.aspx?subjID=" + ddlPotSubj.SelectedValue.ToString());

        //hidsubjID.Value = ddlPotSubj.SelectedValue.ToString();

    }

    protected void LoadInfoForPotentialSubject(int subjID)
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = sql.DataTable_from_SQLstring("select * from uwautism_research_backend..vwTadpole_Randomization_Strata_POTENTIAL_SUBJECTS where subjID = " + subjID.ToString() );

        DataRow row = dt.Rows[0];


        //ID	site	sex	muagem	mucoiq	Age_factor	DQ_factor	Gender_factor	UW_factor	UCD_factor	Age_value	DQ_value	Gender_value	UW_value	UCD_value

        lblID.Text = row["ID"].ToString();

        lblAge.Text = "Age: " + row["Age_factor"].ToString();
        lblDQ.Text = "DQ: " + row["DQ_factor"].ToString();
        lblGender.Text = "Gender: " + row["Gender_factor"].ToString();
        lblUW.Text = "UW: " + row["UW_factor"].ToString();
        lblUCD.Text = "UCD: " + row["UCD_factor"].ToString();


        txtAge.Text =   row["Age_value"].ToString();
        txtDQ.Text = row["DQ_value"].ToString();
        txtGender.Text = row["Gender_value"].ToString();
        txtUW.Text = row["UW_value"].ToString();
        txtUCD.Text = row["UCD_value"].ToString();



        sql.Close();
    }


    protected void ProcessSubjectProfile()
    {
        List<string> x = new List<string>();
        x.Add("-1");
        x.Add("1");

        if (x.Contains(txtAge.Text) &
            x.Contains(txtDQ.Text) &
            x.Contains(txtGender.Text) & x
            .Contains(txtUW.Text) &
            x.Contains(txtUCD.Text) &
            x.Contains(txtTOT.Text)
            )
        {
            LoadInfo();
            lblInfo.Text = "";
            GetRandom();
        }
        else
        {
            lblInfo.Text = "Complete the subject profile.";
        }

    }




    protected void UpdateCurrentDistribution(string mode)
    {
        List<string> x = new List<string> {"-1","1"};
        List<string> grps = new List<string> { "A","B","C","D"};



        if (x.Contains(txtAge.Text) &
            x.Contains(txtDQ.Text) &
            x.Contains(txtGender.Text) & x
            .Contains(txtUW.Text) &
            x.Contains(txtUCD.Text) &
            x.Contains(txtTOT.Text) &
            grps.Contains(ddlGRP.SelectedValue)
            )
        {
            SQL_utils sql = new SQL_utils("backend");

            List<SqlParameter> ps = new List<SqlParameter>(); 

            ps.Add(sql.CreateParam("grp",ddlGRP.SelectedValue.ToString(),"text"));
            ps.Add(sql.CreateParam("lev1",txtAge.Text,"int"));
            ps.Add(sql.CreateParam("lev2",txtDQ.Text,"int"));
            ps.Add(sql.CreateParam("lev3",txtGender.Text,"int"));
            ps.Add(sql.CreateParam("lev4",txtUW.Text,"int"));
            ps.Add(sql.CreateParam("lev5",txtUCD.Text,"int"));
            ps.Add(sql.CreateParam("mode",mode,"text"));

            sql.NonQuery_from_ProcName("spUPDATE_tmpTadpole_Randomization_Strata", ps);

            LoadInfo();
            lblInfo.Text = "";
        }
        else
        {
            lblInfo.Text = "Complete the subject profile.";
        }

    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {

        UpdateCurrentDistribution("add");
    }
    protected void btnSubtract_Click(object sender, EventArgs e)
    {

        UpdateCurrentDistribution("subtract");
    }



    protected void btnGetSubj_Click(object sender, EventArgs e)
    {

        int subjID = int.Parse(ddlPotSubj.SelectedValue.ToString());

        if (subjID > 0)
        {
            LoadInfoForPotentialSubject(subjID);

            ProcessSubjectProfile();
        }

    }
    protected void gvNs_Strata_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            //FCD4F4 

            //D4DFFC

            Color c = (e.Row.Cells[0].Text == "F") ? Color.FromArgb(252, 212, 243) : Color.FromArgb(212, 236, 252);
            e.Row.BackColor = c;

            foreach(TableCell cell in e.Row.Cells)
            {
                 cell.Attributes.CssStyle["text-align"] = "center"; 
            }

        }
    }
    protected void gvSexSiteGroup_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Color c = (e.Row.Cells[0].Text == "F") ? Color.FromArgb(252, 212, 243) : Color.FromArgb(212, 236, 252);
            e.Row.BackColor = c;

            foreach (TableCell cell in e.Row.Cells)
            {
                cell.Attributes.CssStyle["text-align"] = "center";
            }

        }
    }
    protected void gvSiteGroup_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[0].Text == "Total") e.Row.BackColor = Color.Gainsboro;

            e.Row.Cells[5].BackColor = Color.Gainsboro;
 
        }
    }
}