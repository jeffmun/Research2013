using System;
using System.Data;
using System.Collections;
using System.Linq;
using uwac;
using Obout.Grid;
using Obout.SuperForm;


public partial class Info_Tracking_Subject : OboutInc.oboutAJAXPage
//public partial class Info_Tracking_Subject : System.Web.UI.Page
{
    string ddlMeasstatusdetailID_clientID = string.Empty;

    #region Page Events
    //raise events on content page for the buttons on master page

    protected void Page_Init(object sender, EventArgs e)
    {
        Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        //this.Page.ClientScript.GetPostBackEventReference(<a control>, string.Empty);
    }

    //If the master page default study is changed, update the Measure DDL
    protected void Master_Study_Changed(object sender, EventArgs e)
    {
        //Response.Redirect("~/Tracking/Tracking.aspx");
    }

    //public override void VerifyRenderingInServerForm(Control control)
    //{
    //    /* Verifies that the control is rendered */
    //}

    protected void Page_Load(object sender, EventArgs e)
    {

        //ClientScript.GetPostBackEventReference(this, string.Empty);

        //LoadTimepoints();
        //LoadSubjectInfo();

        if (!IsPostBack)
        {
            //
        }
    }

    #endregion

    protected void getPersonData()
    {
        //string ID = txtID.Text;
        SQL_utils sql = new SQL_utils("backend");

        DataSet ds = sql.DataSet_from_ProcName("ac.getPersonData", sql.CreateParam("personID", Request.QueryString["personID"], "int"));

        //grid0.DataSource = ds.Tables[0];
        //grid1.DataSource = ds.Tables[1];
        //grid2.DataSource = ds.Tables[2];

        //grid0.DataBind();
        //grid1.DataBind();
        //grid2.DataBind();

        sql.Close();
    }

    protected void LoadSubjStatus_options()
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = sql.DataTable_from_SQLstring("select * from tblSubjectStatus_Lkup where subjstatusID in " +
           "	(select subjstatusID from tblStudy_SubjStatus where studyID = " + Master.Master_studyID.ToString() + ")");


    }

    protected void LoadTimepoints()
    {
        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = sql.DataTable_from_SQLstring("select timepoint_text, timepointID from tblTimepoint  where studyID= " + Master.Master_studyID.ToString() +
               " group by timepoint_text, timepointID, timepoint order by timepoint");
        //p_timepoint.Controls.Add(new UpdatePanel_O_CheckBoxes(dt, "timepointID", "TimePoint", "timepoint_text", "timepointID", "int", "1"));

        sql.Close();

    }

    protected void LoadGrid(SuperForm g, DataTable dt)
    {
        g.DataSource = dt;
        g.DataBind();
    }

    protected void LoadGrid(Grid g, DataTable dt)
    {

        // extract the current grouping - it can be "Country" or
        // whatever column the end users grouped by
        string currentGroupBy = g.GroupBy;

        g.DataSource = dt;

        // resetting the GroupBy
        g.GroupBy = currentGroupBy;

        // rebinding the Grid
        g.DataBind();
    }



    protected void btnLoad_Click(object sender, EventArgs e)
    {
        //LoadSubjectInfo();
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //sql_vwDDLPeople.Update();
        updateGrid(gridContacts, "sql_vwGridContacts");
        updateGrid(gridClientInfo, "sql_vwGridClient");
        updateGrid(gridFamily, "sql_vwGridFamily");
        updateGrid(gridFamAttr, "sql_vwGridFamilyAttributes");
        updateGrid(gridAddress, "sql_vwGridAddresses");
        updateGrid(gridPhone, "sql_vwGridPhone");
        updateGrid(gridEmail, "sql_vwGridEmail");
        updateGrid(gridDiagnosis, "sql_vwGridDiagnosis");
        updateGrid(gridEvents, "sql_vwGridClientEvents");
        updateGrid(gridServices, "sql_vwGridServices");
    }

    protected void updateGrid(Grid grid, String datasource)
    {
        grid.ClearPreviousDataSource();
        grid.DataSourceID = datasource;
        grid.DataBind();
    }

    public string loadMeasstatusdetail(string measstatusID, string measstatusdetailID)
    {

        SQL_utils sql = new SQL_utils("backend");

        DataTable dt = sql.DataTable_from_SQLstring("select '--select detail--,-1' as ms_msd union select measstatusdetail  +','+ cast(measstatusdetailID as varchar) ms_msd from tblMeasstatusdetail_lkup" +
            " where measstatusdetailID in (select measstatusdetailID from tblmeasstatusanddetail where measstatusID=" + measstatusID + ")");

        DataTable dt2 = sql.DataTable_from_SQLstring("select '--select detail--' measstatusdetail,'-1' as measstatusdetailID union select measstatusdetail , cast(measstatusdetailID as varchar) measstatusdetailID  from tblMeasstatusdetail_lkup" +
            " where measstatusdetailID in (select measstatusdetailID from tblmeasstatusanddetail where measstatusID=" + measstatusID + ")");


        string msd = String.Join(";", dt.AsEnumerable().Select(r => r.Field<string>("ms_msd")).ToArray());

        if (measstatusdetailID == null | measstatusdetailID == "") measstatusdetailID = "-1";


        //Control ctrl = gridM.Templates[0].Container.FindControl("ddl_measstatusdetailID");
        //string ctlID = ctrl.ID;
        //string ctl_clientID = ctrl.ClientID;


        //OboutDropDownList ddl = (OboutDropDownList )gridM.Templates[0].Container.FindControl("ddlMeasstatusdetailID2");

        //ddl.DataSource = dt2;

        //ddl.DataBind();

        //UpdatePanel up = (UpdatePanel)gridM.Templates[0].Container.FindControl("updatepanel_M");
        //up.Update();

        //msd += "|" + measstatusdetailID + "|" +
        //ddlMeasstatusdetailID_clientID; //although
        //ddlMeasstatusdetailID_clientID was correct didn't work
        //msd += "|" + measstatusdetailID + "|" + ctlID ; //try to just lookup the control name without the full clientID

        sql.Close();

        return msd;
    }

    protected string GetControlClientIdFromTemplate(string controlId, int templateIndex, string tpl_name)
    {
        string ctlID = "";
        //if (tpl_name == "gridM")
        //{
        //    Control ctrl = gridM.Templates[templateIndex].Container.FindControl(controlId);
        //    ctlID = ctrl.ClientID;
        //}

        return ctlID;
    }

    protected void gridM_UpdateCommand(object sender, GridRecordEventArgs e)
    {
        try
        {
            string x = "";
            oboutGrid_utils o = new oboutGrid_utils();
            x = o.oGrid_UpdateData(e.Record, "tblstudymeassubj", "backend", "dbo", "studymeassubjID");
        }
        catch (Exception) { }

    }

    protected void gridM_RowDataBound(object sender, GridRowEventArgs e)
    {
      
        if (e.Row.RowType == GridRowType.DataRow)
        {
            //SQL_utils sql = new SQL_utils("backend");

            //DataTable dt2 = sql.DataTable_from_SQLstring("select '--select detail--' measstatusdetail,'-1' as measstatusdetailID union select measstatusdetail , cast(measstatusdetailID as varchar) measstatusdetailID  from tblMeasstatusdetail_lkup" +
            //    " where measstatusdetailID in (select measstatusdetailID from tblmeasstatusanddetail where measstatusID=2)"); // + measstatusID + ")");

            //Control ctrl = gridM.Templates[0].Container.FindControl("ddlMeasstatusdetailID");


            //OboutDropDownList ddl = (OboutDropDownList)gridM.Templates[0].Container.FindControl("ddlMeasstatusdetailID2");

            //ddl.DataSource = dt2;

            //ddl.DataBind();
            //sql.Close();
        }
    }

    //Pass in the ctlname and filtervalue to get the data to populate a DDL
    //with a subset of relevant options.  This string is then passed back to a
    //Javascript function that loads the ddl.

    public string GetDDLcontents(string ctlname, string measstatusID, string measstatusdetailID)
    {
        SQL_utils sql = new SQL_utils("backend");
        string data = "";
        DataTable dt = new DataTable();

        if (ctlname == "measstatusdetailID")
        {
            dt = sql.DataTable_from_SQLstring(
                "select '--select detail--^-1' as textvalue union select measstatusdetail  +'^'+ cast(measstatusdetailID as varchar) textvalue from tblMeasstatusdetail_lkup" +
                " where measstatusdetailID in (select measstatusdetailID from tblmeasstatusanddetail where measstatusID=" + measstatusID.ToString() + ")");
        }

        data = String.Join(";", dt.AsEnumerable().Select(r => r.Field<string>("textvalue")).ToArray());

        if (measstatusdetailID == "") measstatusdetailID = "-1";

        //Control ctl = (Control)gridM.Templates[0].Container.FindControl("ddl_" + ctlname);

        data += "|" + measstatusdetailID.ToString() + "|ddl_" + ctlname;

        return data;
    }

    protected void FixDate(string thedate)
    {
        //OboutInc.Calendar2.Calendar cal = (OboutInc.Calendar2.Calendar)gridM.Templates[0].Container.FindControl("cal_M_datedone");
        //cal.SelectedDate = Convert.ToDateTime(thedate);
    }

    public string GetControlClientIdFromTemplate(string gridname, string controlId, int templateIndex)
    {
        //Grid grid = (Grid)this.FindControlRecursive(gridname);
        //Control ctl = grid.Templates[templateIndex].Container.FindControl(controlId);
        string ctlID = "";
        //ctlID = ctl.ClientID;


        return ctlID;
    }

    protected void gridM_Rebind(object sender, EventArgs e)
    {
        //LoadSubjectInfo();
    }

    protected void txtID0_TextChanged(object sender, EventArgs e)
    {

    }
    protected void gridContacts_UpdateCommand(object sender, GridRecordEventArgs e)
    {

        Hashtable hash = (Hashtable)e.Record;

        oboutGrid_utils o = new oboutGrid_utils();

        string result = o.oGrid_UpdateData(hash, "tContact", "backend","ac","contactID");


    }
    protected void gridContacts_InsertCommand(object sender, GridRecordEventArgs e)
    {
        Hashtable hash = (Hashtable)e.Record;

        oboutGrid_utils o = new oboutGrid_utils();

        string foo = o.oGrid_InsertData(hash, "tContact","backend","ac","contactID",0);

    }
}

//public partial class Info_Waitlist_Edit : System.Web.UI.Page
//{
//    private SqlConnection oConn = new SqlConnection();
//    //private SqlConnection oConnData = new SqlConnection();
//    private ReadConfig oConfig = new ReadConfig();

//    protected void Page_Load(object sender, EventArgs e)
//    {
//        oConn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["waitlistConnectionString"].ConnectionString;
//        oConn.Open();
//        int ID = Convert.ToInt16(Request.QueryString["ID"]);

//        if (!IsPostBack)
//        {
//            populate_DropDownList1(ID);

//            btnCreateNewClient.Enabled = btnCreateNewClientEnabled();
//        }
//    }

//protected void populate_client_info(int ID)
//{
//    SqlCommand sqlCmd = new SqlCommand();
//    SqlDataReader sqlRead;
//    sqlCmd.Connection = oConn;
//    sqlCmd.CommandType = System.Data.CommandType.Text;
//    sqlCmd.CommandText = "SELECT " +

//    #region Big Read Query
//        "b.ContactDate, " +
//        "b.ClientID, " +
//        "b.LName, " +
//        "b.FName, " +
//        "b.MName, " +
//        "convert(varchar, b.DOB , 101) as DOB,  " +
//        "DATEDIFF(hour,DOB,GETDATE())/8766 ," +
//        //"b.Age,  " +
//        "b.Gender,  " +
//        "b.GuardianLN, " +
//        "b.GuardianFN, " +
//        "b.Relationship, " +
//        "b.[Add], " +
//        "b.City, " +
//        "b.State, " +
//        "b.Zip, " +
//        "b.Phone, " +
//        "b.[Phone 2], " +
//        "b.[Phone 3], " +
//        "b.PCP, " +
//        "b.Facility,  " +
//        "b.SD,  " +
//        "b.Ins,  " +
//        "b.SecondaryIns,  " +
//        "b.Archive,  " +
//        "g.Staff,  " +
//        "g.Site,  " +
//        "g.ReferralCategory, " +
//        "convert(varchar, g.Mailed , 101), " +
//        "convert(varchar, g.InfoRtn , 101), " +
//        "convert(varchar, g.ChartEmail , 101), " +
//        "convert(varchar, g.PreAuthEmail , 101), " +
//        "convert(varchar, g.PreAuthGiven , 101),  " +
//        "convert(varchar, g.BillingApproval , 101),  " +
//        "convert(varchar, g.IntCk , 101),  " +
//        "convert(varchar, g.IntCK2 , 101), " +
//        "convert(varchar, g.SchedAttempt1 , 101),  " +
//        "convert(varchar, g.SchedAttempt2 , 101), " +
//        "convert(varchar, g.Scheduled , 101), " +
//        "convert(varchar, g.SchedPacketSent , 101), " +
//        "convert(varchar, g.FirstAppt , 101),  " +
//        "g.CType,  " +
//        "g.SchWith, " +
//        "g.[Archive Reason], " +
//        "convert(varchar, g.ArchiveDate , 101), " +
//        "g.ArchiveStaff, " +
//        "convert(varchar, g.PurgeDate , 101),  " +
//        "e.DX, " +
//        "e.DX2,  " +
//        "e.DX3, " +
//        "e.DXBy, " +
//        "e.Position,  " +
//        "e.RefSource, " +
//        "e.RefPosition, " +
//        "i.SvcReq, " +
//        "i.SvcStatus, " +
//        "i.SvcReq2, " +
//        "i.SvcStatus2, " +
//        "i.SvcReq3,  " +
//        "i.SvcStatus3,  " +
//        "i.SvcReq4,  " +
//        "i.SvcStatus4, " +
//        "i.SvcReq5,  " +
//        "i.SvcStatus5, " +
//        "c.[Initial Comment],  " +
//        "c.[Final Comment],  " +
//        "b.Email " +

//        "FROM Clients b LEFT OUTER JOIN " +
//        "Intakes g ON g.ClientID = b.ClientID LEFT OUTER JOIN " +
//        "DXs e ON e.ClientID = b.ClientID LEFT OUTER JOIN " +
//        "UWACServices i ON i.ClientID = b.ClientID LEFT OUTER JOIN " +
//        "Comments c ON c.ClientID = b.ClientID  " +
//    #endregion

//    "WHERE b.ClientID = @Client_ID";
//    sqlCmd.Parameters.Add(new SqlParameter("@Client_ID", ID));
//    sqlRead = sqlCmd.ExecuteReader();
//    if (sqlRead.Read())
//    {
//        #region Populate Text Boxes
//        TextBox1.Text = sqlRead[0].ToString();
//        TextBox2.Text = sqlRead[1].ToString();
//        TextBox4.Text = sqlRead[2].ToString();
//        TextBox5.Text = sqlRead[3].ToString();
//        TextBox6.Text = sqlRead[4].ToString();
//        TextBox7.Text = sqlRead[5].ToString();
//        TextBox8.Text = sqlRead[6].ToString();
//        TextBox9.Text = sqlRead[7].ToString();
//        TextBox10.Text = sqlRead[8].ToString();
//        TextBox11.Text = sqlRead[9].ToString();
//        //"b.ContactDate, " +
//        //"b.ClientID, " +
//        //"b.LName, " +
//        //"b.FName, " +
//        //"b.MName, " +
//        //"convert(varchar, b.DOB , 101),  " +
//        //"b.Age,  " +
//        //"b.Gender,  " +
//        //"b.GuardianLN, " +
//        //"b.GuardianFN, " +
//        TextBox12.Text = sqlRead[10].ToString();
//        TextBox13.Text = sqlRead[11].ToString();
//        TextBox14.Text = sqlRead[12].ToString();
//        TextBox15.Text = sqlRead[13].ToString();
//        TextBox16.Text = sqlRead[14].ToString();
//        TextBox17.Text = sqlRead[15].ToString();
//        TextBox18.Text = sqlRead[16].ToString();
//        TextBox19.Text = sqlRead[17].ToString();
//        TextBox20.Text = sqlRead[18].ToString();
//        TextBox21.Text = sqlRead[19].ToString();
//        //"b.Relationship, " +
//        //"b.[Add], " +
//        //"b.City, " +
//        //"b.State, " +
//        //"b.Zip, " +
//        //"b.Phone, " +
//        //"b.[Phone 2], " +
//        //"b.[Phone 3], " +
//        //"b.PCP, " +
//        //"b.Facility,  " +
//        TextBox22.Text = sqlRead[20].ToString();
//        TextBox23.Text = sqlRead[21].ToString();
//        TextBox24.Text = sqlRead[22].ToString();
//        CheckBox25.Checked = Convert.ToBoolean(sqlRead[23]);
//        TextBox26.Text = sqlRead[24].ToString();
//        TextBox27.Text = sqlRead[25].ToString();
//        TextBox28.Text = sqlRead[26].ToString();
//        TextBox29.Text = sqlRead[27].ToString();
//        TextBox30.Text = sqlRead[28].ToString();
//        TextBox31.Text = sqlRead[29].ToString();
//        //"b.SD,  " +
//        //"b.Ins,  " +
//        //"b.SecondaryIns,  " +
//        //"b.Archive,  " +
//        //"g.Staff,  " +
//        //"g.Site,  " +
//        //"g.ReferralCategory, " +
//        //"convert(varchar, g.Mailed , 101), " +
//        //"convert(varchar, g.InfoRtn , 101), " +
//        //"convert(varchar, g.ChartEmail , 101), " +
//        TextBox32.Text = sqlRead[30].ToString();
//        TextBox33.Text = sqlRead[31].ToString();
//        TextBox34.Text = sqlRead[32].ToString();
//        TextBox37.Text = sqlRead[33].ToString();
//        TextBox38.Text = sqlRead[34].ToString();
//        TextBox40.Text = sqlRead[35].ToString();
//        TextBox41.Text = sqlRead[36].ToString();
//        TextBox43.Text = sqlRead[37].ToString();
//        TextBox44.Text = sqlRead[38].ToString();
//        TextBox45.Text = sqlRead[39].ToString();
//        //"convert(varchar, g.PreAuthEmail , 101), " +
//        //"convert(varchar, g.PreAuthGiven , 101),  " +
//        //"convert(varchar, g.BillingApproval , 101),  " +
//        //"convert(varchar, g.IntCk , 101),  " +
//        //"convert(varchar, g.IntCK2 , 101), " +
//        //"convert(varchar, g.SchedAttempt1 , 101),  " +
//        //"convert(varchar, g.SchedAttempt2 , 101), " +
//        //"convert(varchar, g.Scheduled , 101), " +
//        //"convert(varchar, g.SchedPacketSent , 101), " +
//        //"convert(varchar, g.FirstAppt , 101),  " +
//        TextBox46.Text = sqlRead[40].ToString();
//        TextBox47.Text = sqlRead[41].ToString();
//        TextBox48.Text = sqlRead[42].ToString();
//        TextBox49.Text = sqlRead[43].ToString();
//        TextBox50.Text = sqlRead[44].ToString();
//        TextBox51.Text = sqlRead[45].ToString();
//        TextBox52.Text = sqlRead[46].ToString();
//        TextBox53.Text = sqlRead[47].ToString();
//        TextBox54.Text = sqlRead[48].ToString();
//        TextBox55.Text = sqlRead[49].ToString();
//        //"g.CType,  " +
//        //"g.SchWith, " +
//        //"g.[Archive Reason], " +
//        //"convert(varchar, g.ArchiveDate , 101), " +
//        //"g.ArchiveStaff, " +
//        //"convert(varchar, g.PurgeDate , 101),  " +
//        //"e.DX, " +
//        //"e.DX2,  " +
//        //"e.DX3, " +
//        //"e.DXBy, " +
//        TextBox56.Text = sqlRead[50].ToString();
//        TextBox57.Text = sqlRead[51].ToString();
//        TextBox58.Text = sqlRead[52].ToString();
//        TextBox59.Text = sqlRead[53].ToString();
//        TextBox60.Text = sqlRead[54].ToString();
//        TextBox61.Text = sqlRead[55].ToString();
//        TextBox62.Text = sqlRead[56].ToString();
//        TextBox63.Text = sqlRead[57].ToString();
//        TextBox64.Text = sqlRead[58].ToString();
//        TextBox65.Text = sqlRead[59].ToString();
//        //"e.Position,  " +
//        //"e.RefSource, " +
//        //"e.RefPosition, " +
//        //"i.SvcReq, " +
//        //"i.SvcStatus, " +
//        //"i.SvcReq2, " +
//        //"i.SvcStatus2, " +
//        //"i.SvcReq3,  " +
//        //"i.SvcStatus3,  " +
//        //"i.SvcReq4,  " +
//        TextBox66.Text = sqlRead[60].ToString();
//        TextBox67.Text = sqlRead[61].ToString();
//        TextBox68.Text = sqlRead[62].ToString();
//        TextBox69.Text = sqlRead[63].ToString();
//        TextBox71.Text = sqlRead[64].ToString();
//        TextBoxEmail.Text = sqlRead[65].ToString();
//        //"i.SvcStatus4, " +
//        //"i.SvcReq5,  " +
//        //"i.SvcStatus5, " +
//        //"c.[Initial Comment],  " +
//        //"c.[Final Comment]  ," +
//        //"b.Email
//        #endregion
//    }
//    sqlRead.Close();
//}


//    protected void populate_DropDownList1(int index)
//    {
//        SqlCommand sqlCmd2 = new SqlCommand();
//        sqlCmd2.Connection = oConn;
//        sqlCmd2.CommandType = System.Data.CommandType.Text;

//        sqlCmd2.CommandText =
//            "SELECT a.ClientID, a.Archive, a.Name " +
//            "FROM ( " +
//            "SELECT ClientID, Archive, (LName + ', '+ FName) AS Name from Clients " +
//            //"UNION " +
//            //"SELECT ClientID, Archive, (LName + ', '+ FName) AS Name from ArchivedClients " +
//            ") a WHERE (a.Name <> '' AND a.Name <> ',')";

//        if (!CheckBox1.Checked) 
//        { sqlCmd2.CommandText += " AND a.Archive = 'False' "; }
//        sqlCmd2.CommandText += "ORDER BY a.Name ";

//        DataTable dt2 = new DataTable();
//        SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlCmd2);
//        sqlAdapter2.Fill(dt2);

//        DropDownList1.DataTextField = "Name";
//        DropDownList1.DataValueField = "ClientID";
//        DropDownList1.DataSource = dt2;
//        DropDownList1.DataBind();
//        //lblInfo.Text += " / index.ToString():" + index.ToString() ;
//        //lblInfo.Text += " / ddl.selected:" + DropDownList1.SelectedValue ;
//        if (index > 0)
//        {
//            DropDownList1.SelectedValue = index.ToString();
//        }
//        populate_client_info(index);
//    }

//    protected void populate_DropDownList1()
//    {
//        populate_DropDownList1(0);
//    }

//    protected int getClientID(string LName, string FName)
//    {
//        int ID = 0;
//        SqlCommand sqlCmdID = new SqlCommand();
//        SqlDataReader sqlReadID;
//        sqlCmdID.Connection = oConn;
//        sqlCmdID.CommandType = System.Data.CommandType.Text;

//        sqlCmdID.CommandText = "SELECT ClientID FROM Clients WHERE (LName = '"+ LName +"' AND FName = '"+FName+"')";

//        sqlReadID = sqlCmdID.ExecuteReader();
//        if (sqlReadID.Read())
//        {
//            ID = Convert.ToInt16(sqlReadID[0]);
//        }
//        sqlReadID.Close();
//        return ID;
//    }

//    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
//    //protected void color_gridview(object sender, GridViewRowEventArgs e)
//    {
//        if (e.Row.Cells[2].Text.Contains("Eval"))
//        {
//            e.Row.BackColor = Color.FromName("#FFC0FF");
//            if (e.Row.Cells[3].Text.Contains("Pre"))
//            {
//                e.Row.BackColor = Color.FromName("#FF40FF");
//            }
//        }
//        if (e.Row.Cells[2].Text.Contains("BEC"))
//        {
//            e.Row.BackColor = Color.FromName("#FFD088");
//            if (e.Row.Cells[3].Text.Contains("Pre"))
//            {
//                e.Row.BackColor = Color.FromName("#FF8000");
//            }
//        }
//        if (e.Row.Cells[2].Text.Contains("Pediatric"))
//        {
//            e.Row.BackColor = Color.FromName("#C0FFC0");
//            if (e.Row.Cells[3].Text.Contains("Pre"))
//            {
//                e.Row.BackColor = Color.FromName("#00FF00");
//            }
//        }
//        if (e.Row.Cells[2].Text.Contains("SP"))
//        {
//            e.Row.BackColor = Color.FromName("#FFC0C0");
//            if (e.Row.Cells[3].Text.Contains("Pre"))
//            {
//                e.Row.BackColor = Color.FromName("#FF8080");
//            }
//        }
//        if (e.Row.Cells[2].Text.Contains("Sleep"))
//        {
//            e.Row.BackColor = Color.FromName("#C0C0FF");
//            if (e.Row.Cells[3].Text.Contains("Pre"))
//            {
//                e.Row.BackColor = Color.FromName("#4040FF");
//            }
//        }
//        if (e.Row.Cells[2].Text.Contains("Therapy"))
//        {
//            e.Row.BackColor = Color.FromName("#D0FFFF");
//            if (e.Row.Cells[3].Text.Contains("Pre"))
//            {
//                e.Row.BackColor = Color.FromName("#00FFFF");
//            }
//        }
//        if (e.Row.Cells[2].Text.Contains("Social"))
//        {
//            e.Row.BackColor = Color.FromName("#D0B080");
//            if (e.Row.Cells[3].Text.Contains("Pre"))
//            {
//                e.Row.BackColor = Color.FromName("#b09060");
//            }
//        }
//    }

//    protected void update_client_info()
//    {
//        int ClientID = int.Parse(TextBox2.Text);
//        if (ClientID > 0)
//        {
//            SqlCommand oCmd = new SqlCommand();

//            oCmd.Connection = oConn;
//            oCmd.CommandText = "spUpdateWaitlistClient";
//            oCmd.CommandTimeout = 90;
//            oCmd.CommandType = CommandType.StoredProcedure;

//            #region Add Big Bunch of Parameters to oCmd

//            oCmd.Parameters.Add("@ContactDate", SqlDbType.Date);
//            if (TextBox1.Text == "")
//            {
//                oCmd.Parameters["@ContactDate"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@ContactDate"].Value = Convert.ToDateTime(TextBox1.Text);
//            }

//            oCmd.Parameters.Add("@ClientID", SqlDbType.Int);
//            oCmd.Parameters["@ClientID"].Value = Convert.ToInt16(TextBox2.Text);

//            //oCmd.Parameters.Add("@Cancellations", SqlDbType.NVarChar, 50);
//            //oCmd.Parameters["@Cancellations"].Value = (TextBox3.Text);

//            oCmd.Parameters.Add("@LName", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@LName"].Value = (TextBox4.Text);

//            oCmd.Parameters.Add("@FName", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@FName"].Value = (TextBox5.Text);

//            oCmd.Parameters.Add("@MName", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@MName"].Value = (TextBox6.Text);

//            oCmd.Parameters.Add("@DOB", SqlDbType.Date);
//            if (TextBox7.Text == "")
//            {
//                oCmd.Parameters["@DOB"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@DOB"].Value = Convert.ToDateTime(TextBox7.Text);
//            }

//            oCmd.Parameters.Add("@Age", SqlDbType.Int);
//            if (TextBox8.Text == "")
//            {
//                oCmd.Parameters["@Age"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@Age"].Value = Convert.ToInt16(TextBox8.Text);
//            }

//            oCmd.Parameters.Add("@Gender", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Gender"].Value = (TextBox9.Text);

//            oCmd.Parameters.Add("@GuardianLN", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@GuardianLN"].Value = (TextBox10.Text);

//            oCmd.Parameters.Add("@GuardianFN", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@GuardianFN"].Value = (TextBox11.Text);

//            oCmd.Parameters.Add("@Relationship", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Relationship"].Value = (TextBox12.Text);

//            oCmd.Parameters.Add("@_Add_", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@_Add_"].Value = (TextBox13.Text);

//            oCmd.Parameters.Add("@City", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@City"].Value = (TextBox14.Text);

//            oCmd.Parameters.Add("@_State_", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@_State_"].Value = (TextBox15.Text);

//            oCmd.Parameters.Add("@Zip", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Zip"].Value = (TextBox16.Text);

//            oCmd.Parameters.Add("@Phone", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Phone"].Value = (TextBox17.Text);

//            oCmd.Parameters.Add("@Phone_2", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Phone_2"].Value = (TextBox18.Text);

//            oCmd.Parameters.Add("@Phone_3", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Phone_3"].Value = (TextBox19.Text);

//            oCmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Email"].Value = (TextBoxEmail.Text);

//            oCmd.Parameters.Add("@PCP", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@PCP"].Value = (TextBox20.Text);

//            oCmd.Parameters.Add("@Facility", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Facility"].Value = (TextBox21.Text);

//            oCmd.Parameters.Add("@SD", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@SD"].Value = (TextBox22.Text);

//            oCmd.Parameters.Add("@Ins", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Ins"].Value = (TextBox23.Text);

//            oCmd.Parameters.Add("@SecondaryIns", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@SecondaryIns"].Value = (TextBox24.Text);

//            oCmd.Parameters.Add("@Archive", SqlDbType.Bit, 1);
//            oCmd.Parameters["@Archive"].Value = Convert.ToBoolean(CheckBox25.Checked);

//            oCmd.Parameters.Add("@Staff", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Staff"].Value = (TextBox26.Text);

//            oCmd.Parameters.Add("@_Site_", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@_Site_"].Value = (TextBox27.Text);

//            oCmd.Parameters.Add("@ReferralCategory", SqlDbType.NVarChar, 20);
//            oCmd.Parameters["@ReferralCategory"].Value = (TextBox28.Text);

//            oCmd.Parameters.Add("@Mailed", SqlDbType.Date);
//            if (TextBox29.Text == "")
//            {
//                oCmd.Parameters["@Mailed"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@Mailed"].Value = Convert.ToDateTime(TextBox29.Text);
//            }

//            oCmd.Parameters.Add("@InfoRtn", SqlDbType.Date);
//            if (TextBox30.Text == "")
//            {
//                oCmd.Parameters["@InfoRtn"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@InfoRtn"].Value = Convert.ToDateTime(TextBox30.Text);
//            }

//            oCmd.Parameters.Add("@ChartEmail", SqlDbType.Date);
//            if (TextBox31.Text == "")
//            {
//                oCmd.Parameters["@ChartEmail"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@ChartEmail"].Value = Convert.ToDateTime(TextBox31.Text);
//            }

//            oCmd.Parameters.Add("@PreAuthEmail", SqlDbType.Date);
//            if (TextBox32.Text == "")
//            {
//                oCmd.Parameters["@PreAuthEmail"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@PreAuthEmail"].Value = Convert.ToDateTime(TextBox32.Text);
//            }

//            oCmd.Parameters.Add("@PreAuthGiven", SqlDbType.Date);
//            if (TextBox33.Text == "")
//            {
//                oCmd.Parameters["@PreAuthGiven"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@PreAuthGiven"].Value = Convert.ToDateTime(TextBox33.Text);
//            }

//            oCmd.Parameters.Add("@BillingApproval", SqlDbType.Date);
//            if (TextBox34.Text == "")
//            {
//                oCmd.Parameters["@BillingApproval"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@BillingApproval"].Value = Convert.ToDateTime(TextBox34.Text);
//            }

//            oCmd.Parameters.Add("@IntCk", SqlDbType.Date);
//            if (TextBox37.Text == "")
//            {
//                oCmd.Parameters["@IntCk"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@IntCk"].Value = Convert.ToDateTime(TextBox37.Text);
//            }

//            oCmd.Parameters.Add("@IntCK2", SqlDbType.Date);
//            if (TextBox38.Text == "")
//            {
//                oCmd.Parameters["@IntCK2"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@IntCK2"].Value = Convert.ToDateTime(TextBox38.Text);
//            }



//            oCmd.Parameters.Add("@SchedAttempt1", SqlDbType.Date);
//            if (TextBox40.Text == "")
//            {
//                oCmd.Parameters["@SchedAttempt1"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@SchedAttempt1"].Value = Convert.ToDateTime(TextBox40.Text);
//            }

//            oCmd.Parameters.Add("@SchedAttempt2", SqlDbType.Date);
//            if (TextBox41.Text == "")
//            {
//                oCmd.Parameters["@SchedAttempt2"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@SchedAttempt2"].Value = Convert.ToDateTime(TextBox41.Text);
//            }

//            oCmd.Parameters.Add("@Scheduled", SqlDbType.Date);
//            if (TextBox43.Text == "")
//            {
//                oCmd.Parameters["@Scheduled"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@Scheduled"].Value = Convert.ToDateTime(TextBox43.Text);
//            }

//            oCmd.Parameters.Add("@SchedPacketSent", SqlDbType.Date);
//            if (TextBox44.Text == "")
//            {
//                oCmd.Parameters["@SchedPacketSent"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@SchedPacketSent"].Value = Convert.ToDateTime(TextBox44.Text);
//            }

//            oCmd.Parameters.Add("@FirstAppt", SqlDbType.Date);
//            if (TextBox45.Text == "")
//            {
//                oCmd.Parameters["@FirstAppt"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@FirstAppt"].Value = Convert.ToDateTime(TextBox45.Text);
//            }



//            oCmd.Parameters.Add("@CType", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@CType"].Value = (TextBox46.Text);

//            oCmd.Parameters.Add("@SchWith", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@SchWith"].Value = (TextBox47.Text);

//            oCmd.Parameters.Add("@Archive_Reason", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Archive_Reason"].Value = (TextBox48.Text);

//            oCmd.Parameters.Add("@ArchiveDate", SqlDbType.Date);
//            if (TextBox49.Text == "")
//            {
//                oCmd.Parameters["@ArchiveDate"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@ArchiveDate"].Value = Convert.ToDateTime(TextBox49.Text);
//            }

//            oCmd.Parameters.Add("@ArchiveStaff", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@ArchiveStaff"].Value = (TextBox50.Text);

//            oCmd.Parameters.Add("@PurgeDate", SqlDbType.Date);
//            if (TextBox51.Text == "")
//            {
//                oCmd.Parameters["@PurgeDate"].Value = DBNull.Value;
//            }
//            else
//            {
//                oCmd.Parameters["@PurgeDate"].Value = Convert.ToDateTime(TextBox51.Text);
//            }

//            oCmd.Parameters.Add("@DX", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@DX"].Value = (TextBox52.Text);

//            oCmd.Parameters.Add("@DX2", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@DX2"].Value = (TextBox53.Text);

//            oCmd.Parameters.Add("@DX3", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@DX3"].Value = (TextBox54.Text);

//            oCmd.Parameters.Add("@DXBy", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@DXBy"].Value = (TextBox55.Text);

//            oCmd.Parameters.Add("@Position", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@Position"].Value = (TextBox56.Text);

//            oCmd.Parameters.Add("@RefSource", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@RefSource"].Value = (TextBox57.Text);

//            oCmd.Parameters.Add("@RefPosition", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@RefPosition"].Value = (TextBox58.Text);

//            oCmd.Parameters.Add("@SvcReq", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@SvcReq"].Value = (TextBox59.Text);

//            oCmd.Parameters.Add("@SvcStatus", SqlDbType.NVarChar, 255);
//            oCmd.Parameters["@SvcStatus"].Value = (TextBox60.Text);

//            oCmd.Parameters.Add("@SvcReq2", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@SvcReq2"].Value = (TextBox61.Text);

//            oCmd.Parameters.Add("@SvcStatus2", SqlDbType.NVarChar, 255);
//            oCmd.Parameters["@SvcStatus2"].Value = (TextBox62.Text);

//            oCmd.Parameters.Add("@SvcReq3", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@SvcReq3"].Value = (TextBox63.Text);

//            oCmd.Parameters.Add("@SvcStatus3", SqlDbType.NVarChar, 255);
//            oCmd.Parameters["@SvcStatus3"].Value = (TextBox64.Text);

//            oCmd.Parameters.Add("@SvcReq4", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@SvcReq4"].Value = (TextBox65.Text);

//            oCmd.Parameters.Add("@SvcStatus4", SqlDbType.NVarChar, 255);
//            oCmd.Parameters["@SvcStatus4"].Value = (TextBox66.Text);

//            oCmd.Parameters.Add("@SvcReq5", SqlDbType.NVarChar, 50);
//            oCmd.Parameters["@SvcReq5"].Value = (TextBox67.Text);

//            oCmd.Parameters.Add("@SvcStatus5", SqlDbType.NVarChar, 255);
//            oCmd.Parameters["@SvcStatus5"].Value = (TextBox68.Text);

//            oCmd.Parameters.Add("@Initial_Comment", SqlDbType.NVarChar, 2000);
//            oCmd.Parameters["@Initial_Comment"].Value = (TextBox69.Text);

//            oCmd.Parameters.Add("@Final_Comment", SqlDbType.NVarChar, 2000);
//            oCmd.Parameters["@Final_Comment"].Value = (TextBox71.Text);

//            #endregion

//            try
//            {
//                oCmd.ExecuteNonQuery();
//                lblInfo.Text += " / Success!";
//            }
//            catch (SqlException exc)
//            {
//                //handle the error msg
//                lblInfo.Text += " / Update Failed: " + exc.Message;
//            }
//        }
//    }

//    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
//    {
//        populate_DropDownList1();
//    }

//    protected void btnCreateNewClient_Click(object sender, EventArgs e)
//    {
//        int ID = 0;
//        SqlCommand sqlCmd3 = new SqlCommand();
//        sqlCmd3.Connection = oConn;
//        sqlCmd3.CommandType = System.Data.CommandType.Text;
//        sqlCmd3.CommandText =
//            "INSERT into Clients (FName, LName, Archive) " +
//            "VALUES ( '" + TextBoxNewClientFName.Text + "', '" + TextBoxNewClientLName.Text + "', 'False' )";
//        sqlCmd3.ExecuteNonQuery();
//        populate_DropDownList1(getClientID(TextBoxNewClientLName.Text, TextBoxNewClientFName.Text));
//        //ID = getClientID(TextBoxNewClientLName.Text, TextBoxNewClientFName.Text);
//        //DropDownList1.SelectedValue = Convert.ToString(ID);
//        //populate_client_info(ID);
//    }

//    protected void btnSaveChanges_Click(object sender, EventArgs e)
//    {
//        lblInfo.Text = " / Begin Save Changes ";
//        update_client_info();
//        lblInfo.Text += " / End Save Changes ";
//    }

//protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
//{
//    lblInfo.Text = "";
//    populate_client_info(Convert.ToInt16(DropDownList1.SelectedValue));
//}

//    protected void TextBoxNewClientName_TextChanged(object sender, EventArgs e)
//    {
//        lblInfo.Text += "yo";
//        //btnCreateNewClient.Enabled = true;
//        btnCreateNewClient.Enabled = btnCreateNewClientEnabled();
//    }

//    protected Boolean btnCreateNewClientEnabled()
//    {
//        return (TextBoxNewClientFName.Text.Trim().Length > 0 || TextBoxNewClientLName.Text.Trim().Length > 0);
//    }
//    protected void TextBox55_TextChanged(object sender, EventArgs e)
//    {

//    }
//}


