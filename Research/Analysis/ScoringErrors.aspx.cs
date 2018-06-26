using System;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using AutismCenterBase.Utilities;
using uwac;


public partial class Analysis_ScoringErrors : System.Web.UI.Page
{
    private SqlConnection oConn = new SqlConnection();
    private SqlConnection oConnData = new SqlConnection();
    private DBLookup oDBLookup;

    private ReadConfig oConfig = new ReadConfig();
    private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();

    private int _content_studyID;
    private string _content_studyname;
    private string version;

   
    //If the master page default study is changed, update the Measure DDL
    protected void Master_Study_Changed(object sender, EventArgs e)
    {
        GetCurrentDefaultStudyID();

        loadList();
    }


    protected void GetCurrentDefaultStudyID()
    {
        SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("exec spSEC_Get_Default_StudyID_for_User", oConn);
        DataTable dt = new DataTable();
        SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
        sqlAdapter.Fill(dt);

        foreach (DataRow row in dt.Rows)
        {
            _content_studyID = Convert.ToInt16(row["defaultstudyID"]);
            _content_studyname = Convert.ToString(row["studyname"]);
        }
    }

    //raise events on content page for the buttons on master page
    protected void Page_Init(object sender, EventArgs e)
    {
       // version = "1";
        Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
      
    }

    protected void Page_Load(object sender, EventArgs e)
    {
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
        oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
        oConnData.Open();

        GetCurrentDefaultStudyID();

        loadList();

    }


    protected void loadList()
    {

        SQL_utils sql = new SQL_utils();

        List<SqlParameter> ps = new List<SqlParameter>();

        ps.Add(sql.CreateParam("studyID", _content_studyID.ToString(), "int"));

        //Fill the data table
        DataTable dt = sql.DataTable_from_ProcName("spSCORING_ERRORS_GetViews_by_studyID", ps);

        sql.Close();

        HideAllPanels();

        load_dupl_studymeasID();

        for (int i = 0; i < dt.Rows.Count; i++ )
        {
            DataRow row = dt.Rows[i];
            string tbl = row["tbl"].ToString();
            string vw = row["vw"].ToString();

            string gv_name = "gv_" + tbl;
            string up_name = "UpdatePanel_" + tbl;


            //lblInfo.Text += up_name + "   "  + gv_name + "  " + tbl + "<br/>";

            UpdatePanel up = (UpdatePanel)FindControlRecursive(this.Page, up_name);

            if (up != null)
            {
               // lblInfo.Text += "..." + up.ID + "<br/>";

                loadScoringErrors(up, gv_name, vw);
                up.Visible = true;
            }
            else
            {
               // lblInfo.Text += "...NULL<br/>" ;
            
            }

            //
            

        }



    }

    protected void HideAllPanels()
    {
        UpdatePanel_ALL_ADOS_T.Visible = false;
        UpdatePanel_ALL_CurrChecklist.Visible = false;
        UpdatePanel_ALL_ESDMCurrChecklist.Visible = false;
        UpdatePanel_ALL_MIND_IntHx_vers2.Visible = false;
        UpdatePanel_ALL_Mullen_items.Visible = false;
        UpdatePanel_ALL_VineII.Visible = false;

    }


    protected void load_dupl_studymeasID()
    {


        GridView gv = (GridView)FindControlRecursive(this.Page, "gv_dupl_studymeasID");

        //need to add the groups and subjstatus here
        string sql = "exec spSCORING_ERRORS_duplicate_studymeasID_by_ID " + _content_studyID.ToString() ;

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = oConnData;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = sql;

        SqlDataReader SqlReader = cmd.ExecuteReader();

        //Fill the data table
        DataTable dt = new DataTable();
        dt.Load(SqlReader);

        gv.DataSource = dt;
        gv.DataBind();

    }



 
    protected void loadScoringErrors(UpdatePanel up, string gv_name, string vw)
    {


        GridView gv = (GridView)up.ContentTemplateContainer.FindControl(gv_name);
        Label lbl = (Label)up.ContentTemplateContainer.FindControl(gv_name.Replace("gv_","N_"));
        string base_lbl_text = lbl.Text;


        //need to add the groups and subjstatus here
        string sqlcode ;

        if (vw == "vwSCORING_ERRORS_ALL_CurrChecklist")
        {
            sqlcode = "select * from " + vw + " where studyID = " + _content_studyID.ToString() + " order by details, studyname, groupname, ID";
        }
        else
        {
            sqlcode = "select * from " + vw + " where studyID = " + _content_studyID.ToString() + " order by studyname, groupname, ID";
        }


        SQL_utils sql = new SQL_utils();

        DataTable dt = sql.DataTable_from_SQLstring(sqlcode);


        gv.DataSource = dt;
        gv.DataBind();

        lbl.Text =  " (N = " + dt.Rows.Count.ToString() + ")";

        sql.Close();
    }


    protected void btnReset_Click(object sender, EventArgs e)
    {
        Control p = (Control)sender;

        GridViewRow row = (GridViewRow)p.NamingContainer;

        HiddenField hid_studymeasID = (HiddenField)row.FindControl("hid_studymeasID");
        HiddenField hid_pk = (HiddenField)row.FindControl("hid_pk");

        int studymeasID = Convert.ToInt16(hid_studymeasID.Value);
        int pk = Convert.ToInt16(hid_pk.Value);

        ResetForm(studymeasID, pk);

    }


    protected void ResetForm(int studymeasID, int pk)
    {

        SqlCommand sqlCmd = new SqlCommand();
        sqlCmd.Connection = oConnData;
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.CommandText = "spDEF_RESET_Verified_to_0";
        sqlCmd.Parameters.Add("studymeasID", SqlDbType.Int);
        sqlCmd.Parameters.Add("pk", SqlDbType.Int);

        sqlCmd.Parameters["studymeasID"].Value = studymeasID;
        sqlCmd.Parameters["pk"].Value = pk;


        sqlCmd.ExecuteNonQuery();

        loadList();

    }

    //Use to find controls in other controls
    private Control FindControlRecursive(Control rootControl, string controlID)
    {
        if (rootControl.ID == controlID) return rootControl;

        foreach (Control controlToSearch in rootControl.Controls)
        {
            Control controlToReturn =
                FindControlRecursive(controlToSearch, controlID);
            if (controlToReturn != null) return controlToReturn;
        }
        return null;
    }


}
