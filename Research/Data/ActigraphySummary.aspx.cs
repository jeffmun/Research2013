using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Data_ActigraphySummary : BasePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
        Session["studyID"] = Master.Master_studyID.ToString();
    }
    protected void Master_Study_Changed(object sender, EventArgs e)
    {
        Response.Redirect("ActigraphySummary.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    protected void LoadActigraphy(int docversid, int timepointid)
    {
        string file_path = Server.MapPath(String.Format("~/webdocs/"));

        SQL_utils sql = new SQL_utils("backend");

        string id = sql.StringScalar_from_SQLstring(String.Format("select id from tblsubject where subjid in (select entityid from vwdocvers where docversid={0})", docversid));
        

        Actigraphy actigraphy = new Actigraphy(docversid, file_path, id, timepointid, ActigraphyTimepoint.sleep_time, ActigraphyTimepoint.out_of_bed_time);

        actigraphy.SaveToDB();

        lbl.Text = actigraphy._logs.LogNotesToHtml();

        DisplayResults();
    }

    protected void LoadSleepInfo(DataTable dt, string title)
    {
        if (dt.HasRows())
        {
            ASPxLabel lbl = new ASPxLabel();
            lbl.EncodeHtml = false;
            lbl.Text = String.Format("<br/><br/>{0}",title);
            lbl.Font.Size = 12;
            lbl.Font.Bold = true;

            ASPxGridView gv = new ASPxGridView();
            gv.SettingsPager.Mode = GridViewPagerMode.ShowAllRecords;
            gv.DataSource = dt;
            gv.DataBind();

            panel.Controls.Add(lbl);
            panel.Controls.Add(gv);
        }
    }



    //protected void btnProcess_Click(object sender, EventArgs e)
    //{
    //    int docversid = Convert.ToInt32(cboFile.Value);
    //    int timepointid = Convert.ToInt32(cboTimeptID.Value);

    //    lbl.ForeColor = System.Drawing.Color.Black;

    //    if (docversid > 0 & timepointid > 0)
    //    {
    //        LoadActigraphy(docversid, timepointid);
            
    //    }
    //    else
    //    {
    //        lbl.Text = "Select a file and timepoint.";
    //        lbl.ForeColor = System.Drawing.Color.Red;
    //    }
    //}

    protected void DisplayResults()
    {
        SQL_utils sql = new SQL_utils("data");

        string id = sql.StringScalar_from_SQLstring(String.Format("select dbo.fnGetID_from_DocVersID('{0}')", cboFile.Value));
        DataSet dset = sql.DataSet_from_SQLstring("exec spSleepInfo " + cboFile.Value);


        ASPxLabel lbl = new ASPxLabel();
        lbl.EncodeHtml = false;
        lbl.Text = String.Format("<br/>Actigraphy Details for {0}", id);
        lbl.Font.Size = 14;
        lbl.Font.Bold = true;

        panel.Controls.Add(lbl);
        LoadSleepInfo(dset.Tables[0], "Diary Times");
        LoadSleepInfo(dset.Tables[1], "Compare Actiwatch and DB scoring");
        LoadSleepInfo(dset.Tables[2], "DB scoring");
        LoadSleepInfo(dset.Tables[3], "Actiwatch scoring");
        sql.Close();
    }

    protected void btnViewFile_Click(object sender, EventArgs e)
    {
        int docversid = Convert.ToInt32(cboFile.Value);

        string url = String.Format("~/Library/Doc.aspx?dvID={0}", docversid);
        Response.Redirect(url);
    }

    protected void btnStats_Click(object sender, EventArgs e)
    {
        DisplayResults();
    }
}