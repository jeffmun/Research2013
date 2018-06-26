using System;
using System.Drawing;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AutismCenterBase.Utilities;

public partial class Waitlist_Waitlist_Edit_2 : System.Web.UI.Page
{
    private SqlConnection oConn = new SqlConnection();
    //private SqlConnection oConnData = new SqlConnection();
    private ReadConfig oConfig = new ReadConfig();

    protected void Page_Load(object sender, EventArgs e)
    {
        oConn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["waitlistConnectionString"].ConnectionString;
        oConn.Open();
        int ID = Convert.ToInt16(Request.QueryString["ID"]);
        DropDownList ddlServ1 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_1");
        DropDownList ddlStat1 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_1");
        DropDownList ddlServ2 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_2");
        DropDownList ddlStat2 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_2");
        DropDownList ddlServ3 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_3");
        DropDownList ddlStat3 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_3");
        DropDownList ddlServ4 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_4");
        DropDownList ddlStat4 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_4");
        DropDownList ddlServ5 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_5");
        DropDownList ddlStat5 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_5");

        if (!IsPostBack)
        {
            populate_DropDownList1(ID);

            #region ddlPopulate

            ddlServ1.DataTextField = "ServiceType";
            ddlServ1.DataValueField = "ServiceTypeID";


            ddlServ1.DataSource = populate_DDL("select -1 ServiceTypeID, '  ---  ' ServiceType union " +
                "SELECT ServiceTypeID, ServiceType FROM [waitlist].[dbo].[EnumServiceTypes]"
                + "order by ServiceTypeID");
            ddlServ1.DataBind();

            ddlServ2.DataTextField = "ServiceType";
            ddlServ2.DataValueField = "ServiceTypeID";
            ddlServ2.DataSource = populate_DDL("select -1 ServiceTypeID, '  ---  ' ServiceType union " +
                "SELECT ServiceTypeID, ServiceType FROM [waitlist].[dbo].[EnumServiceTypes]"
            + "order by ServiceTypeID");
            ddlServ2.DataBind();

            ddlServ3.DataTextField = "ServiceType";
            ddlServ3.DataValueField = "ServiceTypeID";
            ddlServ3.DataSource = populate_DDL("select -1 ServiceTypeID, '  ---  ' ServiceType union " +
                "SELECT ServiceTypeID, ServiceType FROM [waitlist].[dbo].[EnumServiceTypes]"
            + "order by ServiceTypeID");
            ddlServ3.DataBind();

            ddlServ4.DataTextField = "ServiceType";
            ddlServ4.DataValueField = "ServiceTypeID";
            ddlServ4.DataSource = populate_DDL("select -1 ServiceTypeID, '  ---  ' ServiceType union " +
                "SELECT ServiceTypeID, ServiceType FROM [waitlist].[dbo].[EnumServiceTypes]"
            + "order by ServiceTypeID");
            ddlServ4.DataBind();

            ddlServ5.DataTextField = "ServiceType";
            ddlServ5.DataValueField = "ServiceTypeID";
            ddlServ5.DataSource = populate_DDL("select -1 ServiceTypeID, '  ---  ' ServiceType union " +
                "SELECT ServiceTypeID, ServiceType FROM [waitlist].[dbo].[EnumServiceTypes]"
            + "order by ServiceTypeID");
            ddlServ5.DataBind();

            ddlStat1.DataTextField = "Status";
            ddlStat1.DataValueField = "StatusID";
            ddlStat1.DataSource = populate_DDL("select -1 StatusID, '  ---  ' Status union " +
                "SELECT StatusID, Status FROM [waitlist].[dbo].[EnumStatuses]"
                + "order by StatusID");
            ddlStat1.DataBind();


            ddlStat2.DataTextField = "Status";
            ddlStat2.DataValueField = "StatusID";
            ddlStat2.DataSource = populate_DDL("select -1 StatusID, '  ---  ' Status union " +
                "SELECT StatusID, Status FROM [waitlist].[dbo].[EnumStatuses]"
                                + "order by StatusID");
            ddlStat2.DataBind();


            ddlStat3.DataTextField = "Status";
            ddlStat3.DataValueField = "StatusID";
            ddlStat3.DataSource = populate_DDL("select -1 StatusID, '  ---  ' Status union " +
                "SELECT StatusID, Status FROM [waitlist].[dbo].[EnumStatuses]"
                                + "order by StatusID");
            ddlStat3.DataBind();


            ddlStat4.DataTextField = "Status";
            ddlStat4.DataValueField = "StatusID";
            ddlStat4.DataSource = populate_DDL("select -1 StatusID, '  ---  ' Status union " +
                "SELECT StatusID, Status FROM [waitlist].[dbo].[EnumStatuses]"
                                + "order by StatusID");
            ddlStat4.DataBind();


            ddlStat5.DataTextField = "Status";
            ddlStat5.DataValueField = "StatusID";
            ddlStat5.DataSource = populate_DDL("select -1 StatusID, '  ---  ' Status union " +
                "SELECT StatusID, Status FROM [waitlist].[dbo].[EnumStatuses]"
                                + "order by StatusID");
            ddlStat5.DataBind();

            get_service_DDL_indices(ID);

            #endregion

            btnCreateNewClient.Enabled = btnCreateNewClientEnabled();
        }
    }


    protected DataTable populate_DDL(string commandText)
    {

        SqlCommand sqlCmdx = new SqlCommand();
        sqlCmdx.Connection = oConn;
        sqlCmdx.CommandType = System.Data.CommandType.Text;

        sqlCmdx.CommandText = commandText;

        DataTable dtx = new DataTable();
        SqlDataAdapter sqlAdapterx = new SqlDataAdapter(sqlCmdx);
        sqlAdapterx.Fill(dtx);

        return dtx;

    }

    protected void get_service_DDL_indices(int ID)
    {
        DropDownList ddlServ1 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_1");
        DropDownList ddlStat1 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_1");
        DropDownList ddlServ2 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_2");
        DropDownList ddlStat2 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_2");
        DropDownList ddlServ3 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_3");
        DropDownList ddlStat3 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_3");
        DropDownList ddlServ4 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_4");
        DropDownList ddlStat4 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_4");
        DropDownList ddlServ5 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_5");
        DropDownList ddlStat5 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_5");

        SqlCommand sqlCmd = new SqlCommand();
        SqlDataReader sqlRead;
        sqlCmd.Connection = oConn;
        sqlCmd.CommandType = System.Data.CommandType.Text;
        sqlCmd.CommandText = "SELECT " +

            "i.SvcReq, " +
            "i.SvcStatus, " +
            "i.SvcReq2, " +
            "i.SvcStatus2, " +
            "i.SvcReq3,  " +
            "i.SvcStatus3,  " +
            "i.SvcReq4,  " +
            "i.SvcStatus4, " +
            "i.SvcReq5,  " +
            "i.SvcStatus5 " +
            "FROM UWACServices i WHERE ClientID = @Client_ID";

        sqlCmd.Parameters.Add(new SqlParameter("@Client_ID", ID));
        sqlRead = sqlCmd.ExecuteReader();
        if (sqlRead.Read())
        {

            ddlServ1.SelectedIndex = ddlServ1.Items.IndexOf(ddlServ1.Items.FindByText(sqlRead[0].ToString()));
            ddlStat1.SelectedIndex = ddlStat1.Items.IndexOf(ddlStat1.Items.FindByText(sqlRead[1].ToString()));
            ddlServ2.SelectedIndex = ddlServ2.Items.IndexOf(ddlServ2.Items.FindByText(sqlRead[2].ToString()));
            ddlStat2.SelectedIndex = ddlStat2.Items.IndexOf(ddlStat2.Items.FindByText(sqlRead[3].ToString()));
            ddlServ3.SelectedIndex = ddlServ3.Items.IndexOf(ddlServ3.Items.FindByText(sqlRead[4].ToString()));
            ddlStat3.SelectedIndex = ddlStat3.Items.IndexOf(ddlStat3.Items.FindByText(sqlRead[5].ToString()));
            ddlServ4.SelectedIndex = ddlServ4.Items.IndexOf(ddlServ4.Items.FindByText(sqlRead[6].ToString()));
            ddlStat4.SelectedIndex = ddlStat4.Items.IndexOf(ddlStat4.Items.FindByText(sqlRead[7].ToString()));
            ddlServ5.SelectedIndex = ddlServ5.Items.IndexOf(ddlServ5.Items.FindByText(sqlRead[8].ToString()));
            ddlStat5.SelectedIndex = ddlStat5.Items.IndexOf(ddlStat5.Items.FindByText(sqlRead[9].ToString()));
        }
        sqlRead.Close();
    }

    protected void populate_client_info(int ID)
    {

        Label Label82 = (Label)UpdatePanel1.FindControl("Label82");

        get_service_DDL_indices(ID);

        SqlCommand sqlCmd = new SqlCommand();
        SqlDataReader sqlRead;
        sqlCmd.Connection = oConn;
        sqlCmd.CommandType = System.Data.CommandType.Text;
        sqlCmd.CommandText = "SELECT " +

        #region Big Read Query
            "b.ContactDate, " +
            "b.ClientID, " +
            "b.LName, " +
            "b.FName, " +
            "b.MName, " +
            "convert(varchar, b.DOB , 101) as DOB,  " +
            "DATEDIFF(hour,DOB,GETDATE())/8766 ," +
            //"b.Age,  " +
            "b.Gender,  " +
            "b.GuardianLN, " +
            "b.GuardianFN, " +
            "b.Relationship, " +
            "b.[Add], " +

            "b.City, " +
            "b.State, " +
            "b.Zip, " +
            "b.Phone, " +
            "b.[Phone 2], " +
            "b.[Phone 3], " +
            "b.PCP, " +
            "b.Facility,  " +
            "b.SD,  " +
            "b.Ins,  " +
            "b.SecondaryIns,  " +
            "b.Archive,  " +
            "g.Staff,  " +
            "g.Site,  " +
            "g.ReferralCategory, " +
            "convert(varchar, g.Mailed , 101), " +
            "convert(varchar, g.InfoRtn , 101), " +
            "convert(varchar, g.ChartEmail , 101), " +
            "convert(varchar, g.PreAuthEmail , 101), " +
            "convert(varchar, g.PreAuthGiven , 101),  " +
            "convert(varchar, g.BillingApproval , 101),  " +
            "convert(varchar, g.IntCk , 101),  " +
            "convert(varchar, g.IntCK2 , 101), " +
            "convert(varchar, g.SchedAttempt1 , 101),  " +
            "convert(varchar, g.SchedAttempt2 , 101), " +
            "convert(varchar, g.Scheduled , 101), " +
            "convert(varchar, g.SchedPacketSent , 101), " +
            "convert(varchar, g.FirstAppt , 101),  " +
            "g.CType,  " +
            "g.SchWith, " +
            "g.[Archive Reason], " +
            "convert(varchar, g.ArchiveDate , 101), " +
            "g.ArchiveStaff, " +
            "convert(varchar, g.PurgeDate , 101),  " +
            "e.DX, " +
            "e.DX2,  " +
            "e.DX3, " +
            "e.DXBy, " +
            "e.Position,  " +
            "e.RefSource, " +
            "e.RefPosition, " +
            "i.SvcReq, " +
            "i.SvcStatus, " +
            "i.SvcReq2, " +
            "i.SvcStatus2, " +
            "i.SvcReq3,  " +
            "i.SvcStatus3,  " +
            "i.SvcReq4,  " +
            "i.SvcStatus4, " +
            "i.SvcReq5,  " +
            "i.SvcStatus5, " +
            "c.[Initial Comment],  " +
            "c.[Final Comment],  " +
            "b.Email, " +
            "b.[Apt], " +
            "b.[OnCall], " +
            "b.[WhenNotOnCall], " +
            "c.[Follow-up Comment] " +

            "FROM Clients b LEFT OUTER JOIN " +
            "Intakes g ON g.ClientID = b.ClientID LEFT OUTER JOIN " +
            "DXs e ON e.ClientID = b.ClientID LEFT OUTER JOIN " +
            "UWACServices i ON i.ClientID = b.ClientID LEFT OUTER JOIN " +
            "Comments c ON c.ClientID = b.ClientID  " +
        #endregion

 "WHERE b.ClientID = @Client_ID";
        sqlCmd.Parameters.Add(new SqlParameter("@Client_ID", ID));
        sqlRead = sqlCmd.ExecuteReader();
        if (sqlRead.Read())
        {
            #region Populate Text Boxes
            TextBox1.Text = sqlRead[0].ToString();
            TextBox2.Text = sqlRead[1].ToString();
            TextBox4.Text = sqlRead[2].ToString();
            TextBox5.Text = sqlRead[3].ToString();
            TextBox6.Text = sqlRead[4].ToString();
            TextBox7.Text = sqlRead[5].ToString();
            TextBox8.Text = sqlRead[6].ToString();
            TextBox9.Text = sqlRead[7].ToString();
            TextBox10.Text = sqlRead[8].ToString();
            TextBox11.Text = sqlRead[9].ToString();
            //"b.ContactDate, " +
            //"b.ClientID, " +
            //"b.LName, " +
            //"b.FName, " +
            //"b.MName, " +
            //"convert(varchar, b.DOB , 101),  " +
            //"b.Age,  " +
            //"b.Gender,  " +
            //"b.GuardianLN, " +
            //"b.GuardianFN, " +
            TextBox12.Text = sqlRead[10].ToString();
            TextBox13.Text = sqlRead[11].ToString();
            TextBox14.Text = sqlRead[12].ToString();
            TextBox15.Text = sqlRead[13].ToString();
            TextBox16.Text = sqlRead[14].ToString();
            TextBox17.Text = sqlRead[15].ToString();
            TextBox18.Text = sqlRead[16].ToString();
            TextBox19.Text = sqlRead[17].ToString();
            TextBox20.Text = sqlRead[18].ToString();
            TextBox21.Text = sqlRead[19].ToString();
            //"b.Relationship, " +
            //"b.[Add], " +
            //"b.City, " +
            //"b.State, " +
            //"b.Zip, " +
            //"b.Phone, " +
            //"b.[Phone 2], " +
            //"b.[Phone 3], " +
            //"b.PCP, " +
            //"b.Facility,  " +
            TextBox22.Text = sqlRead[20].ToString();
            TextBox23.Text = sqlRead[21].ToString();
            TextBox24.Text = sqlRead[22].ToString();
            CheckBox25.Checked = Convert.ToBoolean(sqlRead[23]);
            TextBox26.Text = sqlRead[24].ToString();
            TextBox27.Text = sqlRead[25].ToString();
            TextBox28.Text = sqlRead[26].ToString();
            TextBox29.Text = sqlRead[27].ToString();
            TextBox30.Text = sqlRead[28].ToString();
            TextBox31.Text = sqlRead[29].ToString();
            //"b.SD,  " +
            //"b.Ins,  " +
            //"b.SecondaryIns,  " +
            //"b.Archive,  " +
            //"g.Staff,  " +
            //"g.Site,  " +
            //"g.ReferralCategory, " +
            //"convert(varchar, g.Mailed , 101), " +
            //"convert(varchar, g.InfoRtn , 101), " +
            //"convert(varchar, g.ChartEmail , 101), " +
            TextBox32.Text = sqlRead[30].ToString();
            TextBox33.Text = sqlRead[31].ToString();
            TextBox34.Text = sqlRead[32].ToString();
            TextBox37.Text = sqlRead[33].ToString();
            TextBox38.Text = sqlRead[34].ToString();
            TextBox40.Text = sqlRead[35].ToString();
            TextBox41.Text = sqlRead[36].ToString();
            TextBox43.Text = sqlRead[37].ToString();
            TextBox44.Text = sqlRead[38].ToString();
            TextBox45.Text = sqlRead[39].ToString();
            //"convert(varchar, g.PreAuthEmail , 101), " +
            //"convert(varchar, g.PreAuthGiven , 101),  " +
            //"convert(varchar, g.BillingApproval , 101),  " +
            //"convert(varchar, g.IntCk , 101),  " +
            //"convert(varchar, g.IntCK2 , 101), " +
            //"convert(varchar, g.SchedAttempt1 , 101),  " +
            //"convert(varchar, g.SchedAttempt2 , 101), " +
            //"convert(varchar, g.Scheduled , 101), " +
            //"convert(varchar, g.SchedPacketSent , 101), " +
            //"convert(varchar, g.FirstAppt , 101),  " +
            TextBox46.Text = sqlRead[40].ToString();
            TextBox47.Text = sqlRead[41].ToString();
            TextBox48.Text = sqlRead[42].ToString();
            TextBox49.Text = sqlRead[43].ToString();
            TextBox50.Text = sqlRead[44].ToString();
            TextBox51.Text = sqlRead[45].ToString();
            TextBox52.Text = sqlRead[46].ToString();
            TextBox53.Text = sqlRead[47].ToString();
            TextBox54.Text = sqlRead[48].ToString();
            TextBox55.Text = sqlRead[49].ToString();
            //"g.CType,  " +
            //"g.SchWith, " +
            //"g.[Archive Reason], " +
            //"convert(varchar, g.ArchiveDate , 101), " +
            //"g.ArchiveStaff, " +
            //"convert(varchar, g.PurgeDate , 101),  " +
            //"e.DX, " +
            //"e.DX2,  " +
            //"e.DX3, " +
            //"e.DXBy, " +
            TextBox56.Text = sqlRead[50].ToString();
            TextBox57.Text = sqlRead[51].ToString();
            TextBox58.Text = sqlRead[52].ToString();
            Label82.Text = sqlRead[53].ToString();
            Label82.Text = sqlRead[54].ToString();
            Label82.Text = sqlRead[55].ToString();
            Label82.Text = sqlRead[56].ToString();
            Label82.Text = sqlRead[57].ToString();
            Label82.Text = sqlRead[58].ToString();
            Label82.Text = sqlRead[59].ToString();
            //"e.Position,  " +
            //"e.RefSource, " +
            //"e.RefPosition, " +
            //"i.SvcReq, " +
            //"i.SvcStatus, " +
            //"i.SvcReq2, " +
            //"i.SvcStatus2, " +
            //"i.SvcReq3,  " +
            //"i.SvcStatus3,  " +
            //"i.SvcReq4,  " +
            Label82.Text = sqlRead[60].ToString();
            Label82.Text = sqlRead[61].ToString();
            Label82.Text = sqlRead[62].ToString();
            TextBox69.Text = sqlRead[63].ToString();
            TextBox71.Text = sqlRead[64].ToString();
            TextBoxEmail.Text = sqlRead[65].ToString();
            TextBox3.Text = sqlRead[66].ToString();
            TextBox25.Text = sqlRead[67].ToString();
            TextBox35.Text = sqlRead[68].ToString();
            TextBox70.Text = sqlRead[69].ToString();
            //"i.SvcStatus4, " +
            //"i.SvcReq5,  " +
            //"i.SvcStatus5, " +
            //"c.[Initial Comment],  " +
            //"c.[Final Comment]  ," +
            //"b.Email
            #endregion
        }
        sqlRead.Close();
        populate_data_dump(ID);
    }

    protected void populate_data_dump(int ID)
    {
        #region find f'ing text boxes
        TextBox tblLast4SSN = (TextBox)UpdatePanel1.FindControl("tblLast4SSN");
        TextBox tblEthnicity = (TextBox)UpdatePanel1.FindControl("tblEthnicity");
        TextBox tblAuthorized = (TextBox)UpdatePanel1.FindControl("tblAuthorized");
        TextBox tblHomeBestTime = (TextBox)UpdatePanel1.FindControl("tblHomeBestTime");
        TextBox tblhomeOkToLeaveMsg = (TextBox)UpdatePanel1.FindControl("tblhomeOkToLeaveMsg");
        TextBox tblWorkBestTime = (TextBox)UpdatePanel1.FindControl("tblWorkBestTime");
        TextBox tblWorkOkToLeaveMsg = (TextBox)UpdatePanel1.FindControl("tblWorkOkToLeaveMsg");
        TextBox tblCellBestTime = (TextBox)UpdatePanel1.FindControl("tblCellBestTime");
        TextBox tblCellOkToLeaveMsg = (TextBox)UpdatePanel1.FindControl("tblCellOkToLeaveMsg");
        TextBox tblBenefitPlanName = (TextBox)UpdatePanel1.FindControl("tblBenefitPlanName");
        TextBox tblSubscriberLastName = (TextBox)UpdatePanel1.FindControl("tblSubscriberLastName");
        TextBox tblSubscriberFirstName = (TextBox)UpdatePanel1.FindControl("tblSubscriberFirstName");
        TextBox tblSubscriberDOB = (TextBox)UpdatePanel1.FindControl("tblSubscriberDOB");
        TextBox tblSubscriberSSN = (TextBox)UpdatePanel1.FindControl("tblSubscriberSSN");
        TextBox tblPatientRelToSub = (TextBox)UpdatePanel1.FindControl("tblPatientRelToSub");
        TextBox tblSubID = (TextBox)UpdatePanel1.FindControl("tblSubID");
        TextBox tblGroupNum = (TextBox)UpdatePanel1.FindControl("tblGroupNum");
        TextBox tblProvPhoneNum = (TextBox)UpdatePanel1.FindControl("tblProvPhoneNum");
        TextBox tblInsuranceAddress = (TextBox)UpdatePanel1.FindControl("tblInsuranceAddress");
        TextBox tblBenefitPlanName2 = (TextBox)UpdatePanel1.FindControl("tblBenefitPlanName2");
        TextBox tblSubscriberLastName2 = (TextBox)UpdatePanel1.FindControl("tblSubscriberLastName2");
        TextBox tblSubscriberFirstName2 = (TextBox)UpdatePanel1.FindControl("tblSubscriberFirstName2");
        TextBox tblSubscriberDOB2 = (TextBox)UpdatePanel1.FindControl("tblSubscriberDOB2");
        TextBox tblSubscriberSSN2 = (TextBox)UpdatePanel1.FindControl("tblSubscriberSSN2");
        TextBox tblPatientRelToSub2 = (TextBox)UpdatePanel1.FindControl("tblPatientRelToSub2");
        TextBox tblSubID2 = (TextBox)UpdatePanel1.FindControl("tblSubID2");
        TextBox tblGroupNum2 = (TextBox)UpdatePanel1.FindControl("tblGroupNum2");
        TextBox tblProvPhoneNum2 = (TextBox)UpdatePanel1.FindControl("tblProvPhoneNum2");
        TextBox tblInsuranceAddress2 = (TextBox)UpdatePanel1.FindControl("tblInsuranceAddress2");
        TextBox tblGuarantorLastName = (TextBox)UpdatePanel1.FindControl("tblGuarantorLastName");
        TextBox tblGuarantorFirstName = (TextBox)UpdatePanel1.FindControl("tblGuarantorFirstName");
        TextBox tblGuarRelToClient = (TextBox)UpdatePanel1.FindControl("tblGuarRelToClient");
        TextBox tblGuarPhone = (TextBox)UpdatePanel1.FindControl("tblGuarPhone");
        TextBox tblGuarAddress = (TextBox)UpdatePanel1.FindControl("tblGuarAddress");
        TextBox tblNOKFirstName = (TextBox)UpdatePanel1.FindControl("tblNOKFirstName");
        TextBox tblNOKLastName = (TextBox)UpdatePanel1.FindControl("tblNOKLastName");
        TextBox tblNOKRelToClient = (TextBox)UpdatePanel1.FindControl("tblNOKRelToClient");
        TextBox tblNOKPhone = (TextBox)UpdatePanel1.FindControl("tblNOKPhone");
        TextBox tblPrimProvPhone = (TextBox)UpdatePanel1.FindControl("tblPrimProvPhone");
        TextBox tblPrimProvAddr = (TextBox)UpdatePanel1.FindControl("tblPrimProvAddr");
        TextBox tblPatRelStatus = (TextBox)UpdatePanel1.FindControl("tblPatRelStatus");
        TextBox tblParentsDivorced = (TextBox)UpdatePanel1.FindControl("tblParentsDivorced");
        TextBox tblIfYesParentsDiv = (TextBox)UpdatePanel1.FindControl("tblIfYesParentsDiv");
        TextBox tblIfYesParentName = (TextBox)UpdatePanel1.FindControl("tblIfYesParentName");
        TextBox tblIfYesMedDecisions = (TextBox)UpdatePanel1.FindControl("tblIfYesMedDecisions");
        TextBox tblPrimLanguage = (TextBox)UpdatePanel1.FindControl("tblPrimLanguage");
        TextBox tblOtherLanguages = (TextBox)UpdatePanel1.FindControl("tblOtherLanguages");
        TextBox tblWhoReferred = (TextBox)UpdatePanel1.FindControl("tblWhoReferred");
        TextBox tblEmailOK = (TextBox)UpdatePanel1.FindControl("tblEmailOK");
        #endregion

        SqlCommand sqlCmd = new SqlCommand();
        SqlDataReader sqlRead;
        sqlCmd.Connection = oConn;
        sqlCmd.CommandType = System.Data.CommandType.Text;
        sqlCmd.CommandText = "SELECT " +

        #region Big Read Query
 "a.Last4SSN, " +
            "a.Ethnicity, " +
            "a.GuardianAuthorizedToConsentForClientHealthCare, " +
            "a.Phone1BestTimeToCall, " +
            "a.Phone1OKToLeaveMSG, " +
            "a.Phone2BestTimeToCall, " +
            "a.Phone2OKToLeaveMSG, " +
            "a.Phone3BestTimeToCall, " +
            "a.Phone3OKToLeaveMSG, " +
            "b.BenefitPlanName, " +
            "b.SubscriberLastName, " +
            "b.SubscriberFirstName, " +
            "b.SubscriberDOB, " +
            "b.SubscriberSSN, " +
            "b.PatientRelationshipToSubscriber, " +
            "b.SubscriberIDNumber, " +
            "b.GroupNumber, " +
            "b.ProviderPhoneNumber, " +
            "b.InsuranceAddress, " +
            "b.BenefitPlanName2, " +
            "b.SubscriberLastName2, " +
            "b.SubscriberFirstName2, " +
            "b.SubscriberDOB2, " +
            "b.SubscriberSSN2, " +
            "b.PatientRelationshipToSubscriber2, " +
            "b.SubscriberIDNumber2, " +
            "b.GroupNumber2, " +
            "b.ProviderPhoneNumber2, " +
            "b.InsuranceAddress2, " +
            "a.GuarantorLastName, " +
            "a.GuarantorFirstName, " +
            "a.GuarantorRelationshipToClient, " +
            "a.GuarantorPhone, " +
            "a.GuarantorAddress, " +
            "a.NextOfKinFirstName, " +
            "a.NextOfKinLastName, " +
            "a.NextOfKinRelationshipToClient, " +
            "a.NextOfKinPhone, " +
            "d.Phone, " +
            "d.Address, " +
            "c.ParentsMaritalStatus, " +
            "c.Custody, " +
            "c.OtherCustodianName, " +
            "c.WhoMakesClientMedDecisions, " +
            "c.PrimaryLanguage, " +
            "c.OtherLanguages, " +
            "a.WhoReferredThem, " +
            "a.OkToContactByEmail, " +
            "a.MaritalStatus " +

            "FROM Clients a LEFT OUTER JOIN " +
            "InsurancePlans b ON b.clientID = a.ClientID LEFT OUTER JOIN " +
            "Households c ON c.clientID = a.ClientID LEFT OUTER JOIN " +
            "Providers d ON d.clientID = a.ClientID " +

        #endregion

 "WHERE a.ClientID = @Client_ID";

        sqlCmd.Parameters.Add(new SqlParameter("@Client_ID", ID));
        sqlRead = sqlCmd.ExecuteReader();
        if (sqlRead.Read())
        {
            #region Populate Text Boxes
            tblLast4SSN.Text = sqlRead[0].ToString();
            tblEthnicity.Text = sqlRead[1].ToString();
            tblAuthorized.Text = sqlRead[2].ToString();
            tblHomeBestTime.Text = sqlRead[3].ToString();
            tblhomeOkToLeaveMsg.Text = sqlRead[4].ToString();
            tblWorkBestTime.Text = sqlRead[5].ToString();
            tblWorkOkToLeaveMsg.Text = sqlRead[6].ToString();
            tblCellBestTime.Text = sqlRead[7].ToString();
            tblCellOkToLeaveMsg.Text = sqlRead[8].ToString();
            tblBenefitPlanName.Text = sqlRead[9].ToString();
            tblSubscriberLastName.Text = sqlRead[10].ToString();
            tblSubscriberFirstName.Text = sqlRead[11].ToString();
            tblSubscriberDOB.Text = sqlRead[12].ToString();
            tblSubscriberSSN.Text = sqlRead[13].ToString();
            tblPatientRelToSub.Text = sqlRead[14].ToString();
            tblSubID.Text = sqlRead[15].ToString();
            tblGroupNum.Text = sqlRead[16].ToString();
            tblProvPhoneNum.Text = sqlRead[17].ToString();
            tblInsuranceAddress.Text = sqlRead[18].ToString();
            tblBenefitPlanName2.Text = sqlRead[19].ToString();
            tblSubscriberLastName2.Text = sqlRead[20].ToString();
            tblSubscriberFirstName2.Text = sqlRead[21].ToString();
            tblSubscriberDOB2.Text = sqlRead[22].ToString();
            tblSubscriberSSN2.Text = sqlRead[23].ToString();
            tblPatientRelToSub2.Text = sqlRead[24].ToString();
            tblSubID2.Text = sqlRead[25].ToString();
            tblGroupNum2.Text = sqlRead[26].ToString();
            tblProvPhoneNum2.Text = sqlRead[27].ToString();
            tblInsuranceAddress2.Text = sqlRead[28].ToString();
            tblGuarantorLastName.Text = sqlRead[29].ToString();
            tblGuarantorFirstName.Text = sqlRead[30].ToString();
            tblGuarRelToClient.Text = sqlRead[31].ToString();
            tblGuarPhone.Text = sqlRead[32].ToString();
            tblGuarAddress.Text = sqlRead[33].ToString();
            tblNOKFirstName.Text = sqlRead[34].ToString();
            tblNOKLastName.Text = sqlRead[35].ToString();
            tblNOKRelToClient.Text = sqlRead[36].ToString();
            tblNOKPhone.Text = sqlRead[37].ToString();
            tblPrimProvPhone.Text = sqlRead[38].ToString();
            tblPrimProvAddr.Text = sqlRead[39].ToString();
            tblParentsDivorced.Text = sqlRead[40].ToString();
            tblIfYesParentsDiv.Text = sqlRead[41].ToString();
            tblIfYesParentName.Text = sqlRead[42].ToString();
            tblIfYesMedDecisions.Text = sqlRead[43].ToString();
            tblPrimLanguage.Text = sqlRead[44].ToString();
            tblOtherLanguages.Text = sqlRead[45].ToString();
            tblWhoReferred.Text = sqlRead[46].ToString();
            tblEmailOK.Text = sqlRead[47].ToString();
            tblPatRelStatus.Text = sqlRead[48].ToString();

            #endregion
        }
        sqlRead.Close();
    }

    protected void populate_DropDownList1(int index)
    {
        SqlCommand sqlCmd2 = new SqlCommand();
        sqlCmd2.Connection = oConn;
        sqlCmd2.CommandType = System.Data.CommandType.Text;

        sqlCmd2.CommandText =
            "SELECT a.ClientID, a.Archive, a.Name " +
            "FROM ( " +
            "SELECT ClientID, Archive, (LName + ', '+ FName) AS Name from Clients " +
            //"UNION " +
            //"SELECT ClientID, Archive, (LName + ', '+ FName) AS Name from ArchivedClients " +
            ") a WHERE (a.Name <> '' AND a.Name <> ',')";

        if (!CheckBox1.Checked)
        { sqlCmd2.CommandText += " AND a.Archive = 'False' "; }
        sqlCmd2.CommandText += "ORDER BY a.Name ";

        DataTable dt2 = new DataTable();
        SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlCmd2);
        sqlAdapter2.Fill(dt2);

        DropDownList1.DataTextField = "Name";
        DropDownList1.DataValueField = "ClientID";
        DropDownList1.DataSource = dt2;
        DropDownList1.DataBind();
        lblInfo.Text += " / index.ToString():" + index.ToString() ;
        lblInfo.Text += " / ddl.selected:" + DropDownList1.SelectedValue ;
        if (index > 0)
        {
            DropDownList1.SelectedValue = index.ToString();
        }
        populate_client_info(index);

    }

    protected void populate_DropDownList1()
    {
        populate_DropDownList1(0);
    }

    protected int getClientID(string LName, string FName)
    {
        int ID = 0;
        SqlCommand sqlCmdID = new SqlCommand();
        SqlDataReader sqlReadID;
        sqlCmdID.Connection = oConn;
        sqlCmdID.CommandType = System.Data.CommandType.Text;

        sqlCmdID.CommandText = "SELECT ClientID FROM Clients WHERE (LName = '" + LName + "' AND FName = '" + FName + "')";

        sqlReadID = sqlCmdID.ExecuteReader();
        if (sqlReadID.Read())
        {
            ID = Convert.ToInt16(sqlReadID[0]);
        }
        sqlReadID.Close();
        return ID;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    //protected void color_gridview(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.Cells[2].Text.Contains("Eval"))
        {
            e.Row.BackColor = Color.FromName("#FFC0FF");
            if (e.Row.Cells[3].Text.Contains("Pre"))
            {
                e.Row.BackColor = Color.FromName("#FF40FF");
            }
        }
        if (e.Row.Cells[2].Text.Contains("BEC"))
        {
            e.Row.BackColor = Color.FromName("#FFD088");
            if (e.Row.Cells[3].Text.Contains("Pre"))
            {
                e.Row.BackColor = Color.FromName("#FF8000");
            }
        }
        if (e.Row.Cells[2].Text.Contains("Pediatric"))
        {
            e.Row.BackColor = Color.FromName("#C0FFC0");
            if (e.Row.Cells[3].Text.Contains("Pre"))
            {
                e.Row.BackColor = Color.FromName("#00FF00");
            }
        }
        if (e.Row.Cells[2].Text.Contains("SP"))
        {
            e.Row.BackColor = Color.FromName("#FFC0C0");
            if (e.Row.Cells[3].Text.Contains("Pre"))
            {
                e.Row.BackColor = Color.FromName("#FF8080");
            }
        }
        if (e.Row.Cells[2].Text.Contains("Sleep"))
        {
            e.Row.BackColor = Color.FromName("#C0C0FF");
            if (e.Row.Cells[3].Text.Contains("Pre"))
            {
                e.Row.BackColor = Color.FromName("#4040FF");
            }
        }
        if (e.Row.Cells[2].Text.Contains("Therapy"))
        {
            e.Row.BackColor = Color.FromName("#D0FFFF");
            if (e.Row.Cells[3].Text.Contains("Pre"))
            {
                e.Row.BackColor = Color.FromName("#00FFFF");
            }
        }
        if (e.Row.Cells[2].Text.Contains("Social"))
        {
            e.Row.BackColor = Color.FromName("#D0B080");
            if (e.Row.Cells[3].Text.Contains("Pre"))
            {
                e.Row.BackColor = Color.FromName("#b09060");
            }
        }
    }

    protected void update_client_info()
    {

        DropDownList ddlServ1 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_1");
        DropDownList ddlStat1 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_1");
        DropDownList ddlServ2 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_2");
        DropDownList ddlStat2 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_2");
        DropDownList ddlServ3 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_3");
        DropDownList ddlStat3 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_3");
        DropDownList ddlServ4 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_4");
        DropDownList ddlStat4 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_4");
        DropDownList ddlServ5 = (DropDownList)UpdatePanel1.FindControl("DDL_Service_5");
        DropDownList ddlStat5 = (DropDownList)UpdatePanel1.FindControl("DDL_Status_5");

        int ClientID = int.Parse(TextBox2.Text);
        if (ClientID > 0)
        {
            SqlCommand oCmd = new SqlCommand();

            oCmd.Connection = oConn;
            oCmd.CommandText = "spUpdateWaitlistClient";
            oCmd.CommandTimeout = 90;
            oCmd.CommandType = CommandType.StoredProcedure;

            #region Add Big Bunch of Parameters to oCmd

            oCmd.Parameters.Add("@ContactDate", SqlDbType.Date);
            if (TextBox1.Text == "")
            {
                oCmd.Parameters["@ContactDate"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@ContactDate"].Value = Convert.ToDateTime(TextBox1.Text);
            }

            oCmd.Parameters.Add("@ClientID", SqlDbType.Int);
            oCmd.Parameters["@ClientID"].Value = Convert.ToInt16(TextBox2.Text);

            //oCmd.Parameters.Add("@Cancellations", SqlDbType.NVarChar, 50);
            //oCmd.Parameters["@Cancellations"].Value = (TextBox3.Text);

            oCmd.Parameters.Add("@LName", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@LName"].Value = (TextBox4.Text);

            oCmd.Parameters.Add("@FName", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@FName"].Value = (TextBox5.Text);

            oCmd.Parameters.Add("@MName", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@MName"].Value = (TextBox6.Text);

            oCmd.Parameters.Add("@DOB", SqlDbType.Date);
            if (TextBox7.Text == "")
            {
                oCmd.Parameters["@DOB"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@DOB"].Value = Convert.ToDateTime(TextBox7.Text);
            }

            oCmd.Parameters.Add("@Age", SqlDbType.Int);
            if (TextBox8.Text == "")
            {
                oCmd.Parameters["@Age"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@Age"].Value = Convert.ToInt16(TextBox8.Text);
            }

            oCmd.Parameters.Add("@Gender", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Gender"].Value = (TextBox9.Text);

            oCmd.Parameters.Add("@GuardianLN", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@GuardianLN"].Value = (TextBox10.Text);

            oCmd.Parameters.Add("@GuardianFN", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@GuardianFN"].Value = (TextBox11.Text);

            oCmd.Parameters.Add("@Relationship", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Relationship"].Value = (TextBox12.Text);

            oCmd.Parameters.Add("@_Add_", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@_Add_"].Value = (TextBox13.Text);

            oCmd.Parameters.Add("@Apt", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Apt"].Value = (TextBox3.Text);

            oCmd.Parameters.Add("@City", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@City"].Value = (TextBox14.Text);

            oCmd.Parameters.Add("@_State_", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@_State_"].Value = (TextBox15.Text);

            oCmd.Parameters.Add("@Zip", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Zip"].Value = (TextBox16.Text);

            oCmd.Parameters.Add("@OnCall", SqlDbType.NVarChar, 50);
            if (TextBox25.Text == "")
            {
                oCmd.Parameters["@OnCall"].Value = DBNull.Value;
            }
            else if (TextBox25.Text == "yes" || TextBox25.Text == "Yes" || TextBox25.Text == "y" || TextBox25.Text == "Y")
            {
                oCmd.Parameters["@OnCall"].Value = "True";
            }
            else if (TextBox25.Text == "no" || TextBox25.Text == "No" || TextBox25.Text == "n" || TextBox25.Text == "N")
            {
                oCmd.Parameters["@OnCall"].Value = "False";
            }
            else
            {
                oCmd.Parameters["@OnCall"].Value = TextBox25.Text;
            }

            oCmd.Parameters.Add("@WhenNotOnCall", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@WhenNotOnCall"].Value = (TextBox35.Text);

            oCmd.Parameters.Add("@Phone", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Phone"].Value = (TextBox17.Text);

            oCmd.Parameters.Add("@Phone_2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Phone_2"].Value = (TextBox18.Text);

            oCmd.Parameters.Add("@Phone_3", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Phone_3"].Value = (TextBox19.Text);

            oCmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Email"].Value = (TextBoxEmail.Text);

            oCmd.Parameters.Add("@PCP", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@PCP"].Value = (TextBox20.Text);

            oCmd.Parameters.Add("@Facility", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Facility"].Value = (TextBox21.Text);

            oCmd.Parameters.Add("@SD", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SD"].Value = (TextBox22.Text);

            oCmd.Parameters.Add("@Ins", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Ins"].Value = (TextBox23.Text);

            oCmd.Parameters.Add("@SecondaryIns", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SecondaryIns"].Value = (TextBox24.Text);

            oCmd.Parameters.Add("@Archive", SqlDbType.Bit, 1);
            oCmd.Parameters["@Archive"].Value = Convert.ToBoolean(CheckBox25.Checked);

            oCmd.Parameters.Add("@Staff", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Staff"].Value = (TextBox26.Text);

            oCmd.Parameters.Add("@_Site_", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@_Site_"].Value = (TextBox27.Text);

            oCmd.Parameters.Add("@ReferralCategory", SqlDbType.NVarChar, 20);
            oCmd.Parameters["@ReferralCategory"].Value = (TextBox28.Text);

            oCmd.Parameters.Add("@Mailed", SqlDbType.Date);
            if (TextBox29.Text == "")
            {
                oCmd.Parameters["@Mailed"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@Mailed"].Value = Convert.ToDateTime(TextBox29.Text);
            }

            oCmd.Parameters.Add("@InfoRtn", SqlDbType.Date);
            if (TextBox30.Text == "")
            {
                oCmd.Parameters["@InfoRtn"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@InfoRtn"].Value = Convert.ToDateTime(TextBox30.Text);
            }

            oCmd.Parameters.Add("@ChartEmail", SqlDbType.Date);
            if (TextBox31.Text == "")
            {
                oCmd.Parameters["@ChartEmail"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@ChartEmail"].Value = Convert.ToDateTime(TextBox31.Text);
            }

            oCmd.Parameters.Add("@PreAuthEmail", SqlDbType.Date);
            if (TextBox32.Text == "")
            {
                oCmd.Parameters["@PreAuthEmail"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@PreAuthEmail"].Value = Convert.ToDateTime(TextBox32.Text);
            }

            oCmd.Parameters.Add("@PreAuthGiven", SqlDbType.Date);
            if (TextBox33.Text == "")
            {
                oCmd.Parameters["@PreAuthGiven"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@PreAuthGiven"].Value = Convert.ToDateTime(TextBox33.Text);
            }

            oCmd.Parameters.Add("@BillingApproval", SqlDbType.Date);
            if (TextBox34.Text == "")
            {
                oCmd.Parameters["@BillingApproval"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@BillingApproval"].Value = Convert.ToDateTime(TextBox34.Text);
            }

            oCmd.Parameters.Add("@IntCk", SqlDbType.Date);
            if (TextBox37.Text == "")
            {
                oCmd.Parameters["@IntCk"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@IntCk"].Value = Convert.ToDateTime(TextBox37.Text);
            }

            oCmd.Parameters.Add("@IntCK2", SqlDbType.Date);
            if (TextBox38.Text == "")
            {
                oCmd.Parameters["@IntCK2"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@IntCK2"].Value = Convert.ToDateTime(TextBox38.Text);
            }



            oCmd.Parameters.Add("@SchedAttempt1", SqlDbType.Date);
            if (TextBox40.Text == "")
            {
                oCmd.Parameters["@SchedAttempt1"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@SchedAttempt1"].Value = Convert.ToDateTime(TextBox40.Text);
            }

            oCmd.Parameters.Add("@SchedAttempt2", SqlDbType.Date);
            if (TextBox41.Text == "")
            {
                oCmd.Parameters["@SchedAttempt2"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@SchedAttempt2"].Value = Convert.ToDateTime(TextBox41.Text);
            }

            oCmd.Parameters.Add("@Scheduled", SqlDbType.Date);
            if (TextBox43.Text == "")
            {
                oCmd.Parameters["@Scheduled"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@Scheduled"].Value = Convert.ToDateTime(TextBox43.Text);
            }

            oCmd.Parameters.Add("@SchedPacketSent", SqlDbType.Date);
            if (TextBox44.Text == "")
            {
                oCmd.Parameters["@SchedPacketSent"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@SchedPacketSent"].Value = Convert.ToDateTime(TextBox44.Text);
            }

            oCmd.Parameters.Add("@FirstAppt", SqlDbType.Date);
            if (TextBox45.Text == "")
            {
                oCmd.Parameters["@FirstAppt"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@FirstAppt"].Value = Convert.ToDateTime(TextBox45.Text);
            }



            oCmd.Parameters.Add("@CType", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@CType"].Value = (TextBox46.Text);

            oCmd.Parameters.Add("@SchWith", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SchWith"].Value = (TextBox47.Text);

            oCmd.Parameters.Add("@Archive_Reason", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Archive_Reason"].Value = (TextBox48.Text);

            oCmd.Parameters.Add("@ArchiveDate", SqlDbType.Date);
            if (TextBox49.Text == "")
            {
                oCmd.Parameters["@ArchiveDate"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@ArchiveDate"].Value = Convert.ToDateTime(TextBox49.Text);
            }

            oCmd.Parameters.Add("@ArchiveStaff", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@ArchiveStaff"].Value = (TextBox50.Text);

            oCmd.Parameters.Add("@PurgeDate", SqlDbType.Date);
            if (TextBox51.Text == "")
            {
                oCmd.Parameters["@PurgeDate"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@PurgeDate"].Value = Convert.ToDateTime(TextBox51.Text);
            }

            oCmd.Parameters.Add("@DX", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@DX"].Value = (TextBox52.Text);

            oCmd.Parameters.Add("@DX2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@DX2"].Value = (TextBox53.Text);

            oCmd.Parameters.Add("@DX3", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@DX3"].Value = (TextBox54.Text);

            oCmd.Parameters.Add("@DXBy", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@DXBy"].Value = (TextBox55.Text);

            oCmd.Parameters.Add("@Position", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Position"].Value = (TextBox56.Text);

            oCmd.Parameters.Add("@RefSource", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@RefSource"].Value = (TextBox57.Text);

            oCmd.Parameters.Add("@RefPosition", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@RefPosition"].Value = (TextBox58.Text);





            oCmd.Parameters.Add("@SvcReq", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SvcReq"].Value = (ddlServ1.SelectedItem.ToString());

            oCmd.Parameters.Add("@SvcStatus", SqlDbType.NVarChar, 255);
            oCmd.Parameters["@SvcStatus"].Value = (ddlStat1.SelectedItem.ToString());

            oCmd.Parameters.Add("@SvcReq2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SvcReq2"].Value = (ddlServ2.SelectedItem.ToString());

            oCmd.Parameters.Add("@SvcStatus2", SqlDbType.NVarChar, 255);
            oCmd.Parameters["@SvcStatus2"].Value = (ddlStat2.SelectedItem.ToString());

            oCmd.Parameters.Add("@SvcReq3", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SvcReq3"].Value = (ddlServ3.SelectedItem.ToString());

            oCmd.Parameters.Add("@SvcStatus3", SqlDbType.NVarChar, 255);
            oCmd.Parameters["@SvcStatus3"].Value = (ddlStat3.SelectedItem.ToString());

            oCmd.Parameters.Add("@SvcReq4", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SvcReq4"].Value = (ddlServ4.SelectedItem.ToString());

            oCmd.Parameters.Add("@SvcStatus4", SqlDbType.NVarChar, 255);
            oCmd.Parameters["@SvcStatus4"].Value = (ddlStat4.SelectedItem.ToString());

            oCmd.Parameters.Add("@SvcReq5", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SvcReq5"].Value = (ddlServ5.SelectedItem.ToString());

            oCmd.Parameters.Add("@SvcStatus5", SqlDbType.NVarChar, 255);
            oCmd.Parameters["@SvcStatus5"].Value = (ddlStat5.SelectedItem.ToString());




            oCmd.Parameters.Add("@Initial_Comment", SqlDbType.NVarChar, 2000);
            oCmd.Parameters["@Initial_Comment"].Value = (TextBox69.Text);

            oCmd.Parameters.Add("@Follow_up_Comment", SqlDbType.NVarChar, 2000);
            oCmd.Parameters["@Follow_up_Comment"].Value = (TextBox70.Text);

            oCmd.Parameters.Add("@Final_Comment", SqlDbType.NVarChar, 2000);
            oCmd.Parameters["@Final_Comment"].Value = (TextBox71.Text);

            #endregion

            try
            {
                oCmd.ExecuteNonQuery();
                lblInfo.Text += " / Success!";
            }
            catch (SqlException exc)
            {
                //handle the error msg
                lblInfo.Text += " / Update Failed: " + exc.Message;
            }
        }
    }

    protected void update_data_dump_info()
    {

        int ClientID = int.Parse(TextBox2.Text);
        if (ClientID > 0)
        {
            SqlCommand oCmd = new SqlCommand();

            oCmd.Connection = oConn;
            oCmd.CommandText = "spUpdateDataDumpClient";
            oCmd.CommandTimeout = 90;
            oCmd.CommandType = CommandType.StoredProcedure;

            #region Add Big Bunch of Parameters to oCmd

            oCmd.Parameters.Add("@ClientID", SqlDbType.Int);
            oCmd.Parameters["@ClientID"].Value = Convert.ToInt16(TextBox2.Text);

            oCmd.Parameters.Add("@Last4SSN", SqlDbType.Int);
            if (tblLast4SSN.Text == "")
            {
                oCmd.Parameters["@Last4SSN"].Value = DBNull.Value;
            }
            else
            {
                oCmd.Parameters["@Last4SSN"].Value = Convert.ToInt16(tblLast4SSN.Text);
            }

            oCmd.Parameters.Add("@Ethnicity", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Ethnicity"].Value = (tblEthnicity.Text);
            oCmd.Parameters.Add("@GuardianAuthorizedToConsentForClientHealthCare", SqlDbType.NVarChar, 50);
            if (tblAuthorized.Text == "")
            {
                oCmd.Parameters["@GuardianAuthorizedToConsentForClientHealthCare"].Value = DBNull.Value;
            }
            else if (tblAuthorized.Text == "yes" || tblAuthorized.Text == "Yes" || tblAuthorized.Text == "y" || tblAuthorized.Text == "Y")
            {
                oCmd.Parameters["@GuardianAuthorizedToConsentForClientHealthCare"].Value = "True";
            }
            else if (tblAuthorized.Text == "no" || tblAuthorized.Text == "No" || tblAuthorized.Text == "n" || tblAuthorized.Text == "N")
            {
                oCmd.Parameters["@GuardianAuthorizedToConsentForClientHealthCare"].Value = "False";
            }
            else
            {
                oCmd.Parameters["@GuardianAuthorizedToConsentForClientHealthCare"].Value = tblAuthorized.Text;
            }


            oCmd.Parameters.Add("@Phone1BestTimeToCall", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Phone1BestTimeToCall"].Value = (tblHomeBestTime.Text);
            oCmd.Parameters.Add("@Phone1OKToLeaveMSG", SqlDbType.NVarChar, 50);
            if (tblhomeOkToLeaveMsg.Text == "")
            {
                oCmd.Parameters["@Phone1OKToLeaveMSG"].Value = DBNull.Value;
            }
            else if (tblhomeOkToLeaveMsg.Text == "yes" || tblhomeOkToLeaveMsg.Text == "Yes" || tblhomeOkToLeaveMsg.Text == "y" || tblhomeOkToLeaveMsg.Text == "Y")
            {
                oCmd.Parameters["@Phone1OKToLeaveMSG"].Value = "True";
            }
            else if (tblhomeOkToLeaveMsg.Text == "no" || tblhomeOkToLeaveMsg.Text == "No" || tblhomeOkToLeaveMsg.Text == "n" || tblhomeOkToLeaveMsg.Text == "N")
            {
                oCmd.Parameters["@Phone1OKToLeaveMSG"].Value = "False";
            }
            else
            {
                oCmd.Parameters["@Phone1OKToLeaveMSG"].Value = tblhomeOkToLeaveMsg.Text;
            }
            oCmd.Parameters.Add("@Phone2BestTimeToCall", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Phone2BestTimeToCall"].Value = (tblWorkBestTime.Text);
            oCmd.Parameters.Add("@Phone2OKToLeaveMSG", SqlDbType.NVarChar, 50);
            if (tblWorkOkToLeaveMsg.Text == "")
            {
                oCmd.Parameters["@Phone2OKToLeaveMSG"].Value = DBNull.Value;
            }
            else if (tblWorkOkToLeaveMsg.Text == "yes" || tblWorkOkToLeaveMsg.Text == "Yes" || tblWorkOkToLeaveMsg.Text == "y" || tblWorkOkToLeaveMsg.Text == "Y")
            {
                oCmd.Parameters["@Phone2OKToLeaveMSG"].Value = "True";
            }
            else if (tblWorkOkToLeaveMsg.Text == "no" || tblWorkOkToLeaveMsg.Text == "No" || tblWorkOkToLeaveMsg.Text == "n" || tblWorkOkToLeaveMsg.Text == "N")
            {
                oCmd.Parameters["@Phone2OKToLeaveMSG"].Value = "False";
            }
            else
            {
                oCmd.Parameters["@Phone2OKToLeaveMSG"].Value = tblWorkOkToLeaveMsg.Text;
            }
            oCmd.Parameters.Add("@Phone3BestTimeToCall", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Phone3BestTimeToCall"].Value = (tblCellBestTime.Text);
            oCmd.Parameters.Add("@Phone3OKToLeaveMSG", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Phone3OKToLeaveMSG"].Value = (tblCellOkToLeaveMsg.Text);
            if (tblCellOkToLeaveMsg.Text == "")
            {
                oCmd.Parameters["@Phone3OKToLeaveMSG"].Value = DBNull.Value;
            }
            else if (tblCellOkToLeaveMsg.Text == "yes" || tblCellOkToLeaveMsg.Text == "Yes" || tblCellOkToLeaveMsg.Text == "y" || tblCellOkToLeaveMsg.Text == "Y")
            {
                oCmd.Parameters["@Phone3OKToLeaveMSG"].Value = "True";
            }
            else if (tblCellOkToLeaveMsg.Text == "no" || tblCellOkToLeaveMsg.Text == "No" || tblCellOkToLeaveMsg.Text == "n" || tblCellOkToLeaveMsg.Text == "N")
            {
                oCmd.Parameters["@Phone3OKToLeaveMSG"].Value = "False";
            }
            else
            {
                oCmd.Parameters["@Phone3OKToLeaveMSG"].Value = tblCellOkToLeaveMsg.Text;
            }
            oCmd.Parameters.Add("@BenefitPlanName", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@BenefitPlanName"].Value = (tblBenefitPlanName.Text);
            oCmd.Parameters.Add("@SubscriberLastName", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SubscriberLastName"].Value = (tblSubscriberLastName.Text);
            oCmd.Parameters.Add("@SubscriberFirstName", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SubscriberFirstName"].Value = (tblSubscriberFirstName.Text);
            oCmd.Parameters.Add("@SubscriberDOB", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SubscriberDOB"].Value = (tblSubscriberDOB.Text);
            oCmd.Parameters.Add("@SubscriberSSN", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SubscriberSSN"].Value = (tblSubscriberSSN.Text);
            oCmd.Parameters.Add("@PatientRelationshipToSubscriber", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@PatientRelationshipToSubscriber"].Value = (tblPatientRelToSub.Text);
            oCmd.Parameters.Add("@SubscriberIDNumber", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SubscriberIDNumber"].Value = (tblSubID.Text);
            oCmd.Parameters.Add("@GroupNumber", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@GroupNumber"].Value = (tblGroupNum.Text);
            oCmd.Parameters.Add("@ProviderPhoneNumber", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@ProviderPhoneNumber"].Value = (tblProvPhoneNum.Text);
            oCmd.Parameters.Add("@InsuranceAddress", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@InsuranceAddress"].Value = (tblInsuranceAddress.Text);
            oCmd.Parameters.Add("@BenefitPlanName2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@BenefitPlanName2"].Value = (tblBenefitPlanName2.Text);
            oCmd.Parameters.Add("@SubscriberLastName2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SubscriberLastName2"].Value = (tblSubscriberLastName2.Text);
            oCmd.Parameters.Add("@SubscriberFirstName2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SubscriberFirstName2"].Value = (tblSubscriberFirstName2.Text);
            oCmd.Parameters.Add("@SubscriberDOB2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SubscriberDOB2"].Value = (tblSubscriberDOB2.Text);
            oCmd.Parameters.Add("@SubscriberSSN2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SubscriberSSN2"].Value = (tblSubscriberSSN2.Text);
            oCmd.Parameters.Add("@PatientRelationshipToSubscriber2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@PatientRelationshipToSubscriber2"].Value = (tblPatientRelToSub2.Text);
            oCmd.Parameters.Add("@SubscriberIDNumber2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SubscriberIDNumber2"].Value = (tblSubID2.Text);
            oCmd.Parameters.Add("@GroupNumber2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@GroupNumber2"].Value = (tblGroupNum2.Text);
            oCmd.Parameters.Add("@ProviderPhoneNumber2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@ProviderPhoneNumber2"].Value = (tblProvPhoneNum2.Text);
            oCmd.Parameters.Add("@InsuranceAddress2", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@InsuranceAddress2"].Value = (tblInsuranceAddress2.Text);
            oCmd.Parameters.Add("@GuarantorLastName", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@GuarantorLastName"].Value = (tblGuarantorLastName.Text);
            oCmd.Parameters.Add("@GuarantorFirstName", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@GuarantorFirstName"].Value = (tblGuarantorFirstName.Text);
            oCmd.Parameters.Add("@GuarantorRelationshipToClient", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@GuarantorRelationshipToClient"].Value = (tblGuarRelToClient.Text);
            oCmd.Parameters.Add("@GuarantorPhone", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@GuarantorPhone"].Value = (tblGuarPhone.Text);
            oCmd.Parameters.Add("@GuarantorAddress", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@GuarantorAddress"].Value = (tblGuarAddress.Text);
            oCmd.Parameters.Add("@NextOfKinFirstName", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@NextOfKinFirstName"].Value = (tblNOKFirstName.Text);
            oCmd.Parameters.Add("@NextOfKinLastName", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@NextOfKinLastName"].Value = (tblNOKLastName.Text);
            oCmd.Parameters.Add("@NextOfKinRelationshipToClient", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@NextOfKinRelationshipToClient"].Value = (tblNOKRelToClient.Text);
            oCmd.Parameters.Add("@NextOfKinPhone", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@NextOfKinPhone"].Value = (tblNOKPhone.Text);
            oCmd.Parameters.Add("@Phone", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Phone"].Value = (tblPrimProvPhone.Text);
            oCmd.Parameters.Add("@Address", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Address"].Value = (tblPrimProvAddr.Text);
            oCmd.Parameters.Add("@ParentsMaritalStatus", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@ParentsMaritalStatus"].Value = (tblParentsDivorced.Text);
            oCmd.Parameters.Add("@Custody", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Custody"].Value = (tblIfYesParentsDiv.Text);
            oCmd.Parameters.Add("@OtherCustodianName", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@OtherCustodianName"].Value = (tblIfYesParentName.Text);
            oCmd.Parameters.Add("@WhoMakesClientMedDecisions", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@WhoMakesClientMedDecisions"].Value = (tblIfYesMedDecisions.Text);
            oCmd.Parameters.Add("@PrimaryLanguage", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@PrimaryLanguage"].Value = (tblPrimLanguage.Text);
            oCmd.Parameters.Add("@OtherLanguages", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@OtherLanguages"].Value = (tblOtherLanguages.Text);
            oCmd.Parameters.Add("@WhoReferredThem", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@WhoReferredThem"].Value = (tblWhoReferred.Text);
            oCmd.Parameters.Add("@OkToContactByEmail", SqlDbType.NVarChar, 50);

            if (tblEmailOK.Text == "")
            {
                oCmd.Parameters["@OkToContactByEmail"].Value = DBNull.Value;
            }
            else if (tblEmailOK.Text == "yes" || tblEmailOK.Text == "Yes" || tblEmailOK.Text == "y" || tblEmailOK.Text == "Y")
            {
                oCmd.Parameters["@OkToContactByEmail"].Value = "True";
            }
            else if (tblEmailOK.Text == "no" || tblEmailOK.Text == "No" || tblEmailOK.Text == "n" || tblEmailOK.Text == "N")
            {
                oCmd.Parameters["@OkToContactByEmail"].Value = "False";
            }
            else
            {
                oCmd.Parameters["@OkToContactByEmail"].Value = tblEmailOK.Text;
            }




            oCmd.Parameters.Add("@PCP", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@PCP"].Value = (TextBox20.Text);
            oCmd.Parameters.Add("@Facility", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Facility"].Value = (TextBox21.Text);
            oCmd.Parameters.Add("@Ins", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@Ins"].Value = (TextBox23.Text);
            oCmd.Parameters.Add("@SecondaryIns", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@SecondaryIns"].Value = (TextBox24.Text);
            oCmd.Parameters.Add("@MaritalStatus", SqlDbType.NVarChar, 50);
            oCmd.Parameters["@MaritalStatus"].Value = (tblPatRelStatus.Text);


            //oCmd.Parameters.Add("@Age", SqlDbType.Int);
            //if (TextBox8.Text == "")
            //{
            //    oCmd.Parameters["@Age"].Value = DBNull.Value;
            //}
            ////else
            //{
            //    oCmd.Parameters["@Age"].Value = Convert.ToInt16(TextBox8.Text);
            //}

            //oCmd.Parameters.Add("@Archive", SqlDbType.Bit, 1);
            //oCmd.Parameters["@Archive"].Value = Convert.ToBoolean(CheckBox25.Checked);


            #endregion

            try
            {
                oCmd.ExecuteNonQuery();
                lblInfo.Text += " / Success!";
            }
            catch (SqlException exc)
            {
                //handle the error msg
                lblInfo.Text += " / Update Failed: " + exc.Message;
            }
        }
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        populate_DropDownList1();
    }

    protected void btnCreateNewClient_Click(object sender, EventArgs e)
    {
        int ID = 0;
        SqlCommand sqlCmd3 = new SqlCommand();
        sqlCmd3.Connection = oConn;
        sqlCmd3.CommandType = System.Data.CommandType.Text;
        sqlCmd3.CommandText =
            "INSERT into Clients (FName, LName, Archive) " +
            "VALUES ( '" + TextBoxNewClientFName.Text + "', '" + TextBoxNewClientLName.Text + "', 'False' )";
        sqlCmd3.ExecuteNonQuery();
        //populate_DropDownList1(getClientID(TextBoxNewClientLName.Text, TextBoxNewClientFName.Text));
        ID = getClientID(TextBoxNewClientLName.Text, TextBoxNewClientFName.Text);
        //DropDownList1.SelectedValue = Convert.ToString(ID);
        populate_client_info(ID);
    }

    protected void btnSaveChanges_Click(object sender, EventArgs e)
    {
        lblInfo.Text = " / Begin Save Changes ";
        update_client_info();
        update_data_dump_info();

        lblInfo.Text += " / End Save Changes ";
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblInfo.Text = "";
        populate_client_info(Convert.ToInt16(DropDownList1.SelectedValue));
    }

    protected void TextBoxNewClientName_TextChanged(object sender, EventArgs e)
    {
        //lblInfo.Text += "yo";
        //btnCreateNewClient.Enabled = true;
        btnCreateNewClient.Enabled = btnCreateNewClientEnabled();
    }

    protected Boolean btnCreateNewClientEnabled()
    {
        return (TextBoxNewClientFName.Text.Trim().Length > 0 || TextBoxNewClientLName.Text.Trim().Length > 0);
    }
    protected void TextBox55_TextChanged(object sender, EventArgs e)
    {

    }
    protected void DDL_Service_1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox51_TextChanged(object sender, EventArgs e)
    {

    }
}
