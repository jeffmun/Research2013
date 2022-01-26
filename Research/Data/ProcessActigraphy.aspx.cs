using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Data_ProcessActigraphy : BasePage
{
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
            gv.DataBound += grid_DataBound;
            gv.SettingsPager.Mode = GridViewPagerMode.ShowAllRecords;
            gv.Settings.HorizontalScrollBarMode = ScrollBarMode.Visible;
            gv.Width = 1600; 
            gv.DataSource = dt;
            gv.DataBind();


            panel.Controls.Add(lbl);
            panel.Controls.Add(gv);
        }
    }


    protected void grid_DataBound(object sender, EventArgs e)
    {
        ASPxGridView grid = (ASPxGridView)sender;

        grid.Columns[0].FixedStyle = GridViewColumnFixedStyle.Left;
        grid.Columns[1].FixedStyle = GridViewColumnFixedStyle.Left;
        grid.Columns[2].FixedStyle = GridViewColumnFixedStyle.Left;
    }


    protected void btnProcess_Click(object sender, EventArgs e)
    {
        int docversid = Convert.ToInt32(cboFile.Value);
        int timepointid = Convert.ToInt32(cboTimeptID.Value);

        lbl.ForeColor = System.Drawing.Color.Black;

        if (docversid > 0 & timepointid > 0)
        {
            LoadActigraphy(docversid, timepointid);
            
        }
        else
        {
            lbl.Text = "Select a file and timepoint.";
            lbl.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void DisplayResults()
    {
        SQL_utils sql = new SQL_utils("data");

        DataSet dset = sql.DataSet_from_SQLstring("exec spSleepInfo " + cboFile.Value);

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