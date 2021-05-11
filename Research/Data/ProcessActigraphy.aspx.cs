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


    protected void LoadActigraphy(int docversid)
    {
        string file_path = Server.MapPath(String.Format("~/webdocs/"));

        SQL_utils sql = new SQL_utils("backend");

        string id = sql.StringScalar_from_SQLstring(String.Format("select id from tblsubject where subjid in (select entityid from vwdocvers where docversid={0})", docversid));

        Actigraphy actigraphy = new Actigraphy(docversid, file_path, id, ActigraphyTimepoint.sleep_time, ActigraphyTimepoint.out_of_bed_time);

        actigraphy.SaveToDB();

        lbl.Text = actigraphy._logs.LogNotesToHtml();

        if (actigraphy._docvers.dset != null)
        {
            LoadSleepInfo(actigraphy.dt_sleeps);
            LoadSleepInfo(actigraphy.SleepStats("SLEEP"));
            LoadSleepInfo(actigraphy.SleepStats("REST"));

            //LoadSleepInfo(actigraphy.TopNEpochs(12));
            //LoadSleepInfo(actigraphy.BottomNEpochs(12));
        }

        int x = 0;
    }

    protected void LoadSleepInfo(DataTable dt)
    {
        ASPxGridView gv = new ASPxGridView();
        gv.SettingsPager.Mode = GridViewPagerMode.ShowAllRecords;
        gv.DataSource = dt;
        gv.DataBind();
        panel.Controls.Add(gv);

    }



    protected void btn_Click(object sender, EventArgs e)
    {
        string val = txtmins.Text;
        double mins = Convert.ToDouble(val);

        double days = ((mins + 2880) / 1440.0) ;
        

        DateTime dt = DateTime.FromOADate(days);
        lbldt.Text = dt.ToString();


    }

    protected void btnProcess_Click(object sender, EventArgs e)
    {
        int docversid = Convert.ToInt32(txtdocversid.Text);
        LoadActigraphy(docversid);
    }
}