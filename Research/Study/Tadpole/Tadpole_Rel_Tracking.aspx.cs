using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;


public partial class AutismCenterResearch_Study_Tadpole_Tadpole_Rel_Tracking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        GridView agv = new AutoGridView("backend", "vwTadpolePATH__ADOS_Reliability_Status_TOTALS", "gv_vwTadpolePATH__ADOS_Reliability_Status_TOTALS", false, "",
            "gvNavy,gvNavy,gvNavy,gvNavy,gvNavy,gvPurple,gvPurple,gvBlack,gvDkBlack,gvRed");
        Panel1.Controls.Clear();
        Panel1.Controls.Add(agv);


    }


    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;

        string mycolor = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sms_dd_color"));
        row.Cells[8].BackColor = Color.FromName(mycolor);

        string mycolor_REL = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sms_dd_color_REL"));
        row.Cells[13].BackColor = Color.FromName(mycolor_REL);

        
        string useForRel = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "UseForReliability"));

        switch (useForRel)
        {
            case "Yes":
                row.BackColor = Color.LemonChiffon;
                row.Font.Bold = true;
                break;
            case "Yes-ToEnter":
                row.BackColor = Color.Gold;
                row.Font.Bold = true;
                break;
            case "Yes-DONE":
                row.BackColor = Color.Goldenrod;
                row.Font.Bold = true;
                break;
            default:
                row.ForeColor = Color.Gray;
                break;

        }

    }

}