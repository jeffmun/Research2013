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
using System.Data.OleDb;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;
using SpreadsheetGear;
using uwac;

public partial class Info_GetInfo : System.Web.UI.Page
{
    DataTable dt_selectedstudies; 

    protected void Page_Load(object sender, EventArgs e)
    {


        if(IsPostBack)
        {
            if(ViewState["SelectedStudies"] != null)
            {
                dt_selectedstudies = (DataTable)ViewState["SelectedStudies"];
                ShowSelectedStudies(dt_selectedstudies);
            }
        }
        else
        {
            LoadStudies();
        }
    }


    protected void LoadStudies()
    {
        SQL_utils sql = new SQL_utils("backend");
        DataTable dt = sql.DataTable_from_ProcName("spSEC_GetStudies_CanView_OR_Acess_by_User__Short__with_SelectStudy");

        lstStudies.DataSource = dt;
        lstStudies.DataTextField = "studyname";
        lstStudies.DataValueField = "studyID";
        lstStudies.DataBind();

    }


    protected void GetInfo(string infotype, string sqlproc)
    {

        SQL_utils sql = new SQL_utils("backend");

        // Create a DataTable of the selected studies
        DataTable dt = new DataTable();
        dt.Columns.Add("fld", typeof(string));
        dt.Columns.Add("value", typeof(int));

        int counter = 0;
        foreach(ListItem li in lstStudies.Items)
        {
            counter++;
            lblInfo.Text += ", " + counter.ToString();

            if (li.Selected)
            {
                DataRow r = dt.NewRow();
                r["fld"] = "studyID";
                r["value"] = Convert.ToInt16(li.Value);
                dt.Rows.Add(r);
                lblInfo.Text += "SELECTED";
            }
        }
        ViewState["SelectedStudies"] = dt;


        if (dt.Rows.Count > 0)
        {

            SqlParameter p = sql.CreateParam("studies", dt);
            DataTable info = sql.DataTable_from_ProcName(infotype, p);

            //ShowSelectedStudies(mailing);

            SpreadsheetGearUtils.SaveDataTableToExcel(info, "mailing", true, "xlsx");
        }
        else
        {
            lblInfo.Text = "0 records in data table.";
        }

    }

    protected void ShowSelectedStudies(DataTable dt)
    {
      
        gv.DataSource = dt;
        gv.DataBind();

    }


    protected void btnGetInfo_Click(object sender, EventArgs e)
    {
        GetInfo(ddlInfoType.SelectedValue, ddlInfoType.SelectedItem.ToString());
    }

}