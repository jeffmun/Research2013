using AutismCenterBase.Utilities;
using System;
using System.Data.SqlClient;
using uwac;

public partial class MobileDeviceCheckout : BasePage //System.Web.UI.Page
{
    private SqlConnection oConn = new SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        string email = Request.QueryString["email"];
        string usergroup = Request.QueryString["usergroup"];

        //oConn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["mobileDeviceConnectionString"].ConnectionString;
        //oConn.Open();

        if (!IsPostBack)
        {
            if (email != null || usergroup !=null)
            {
                logConfirmation(email, usergroup);
            }
        }
    }

    protected void logConfirmation(string email, string usergroup)
    {
        string textToShow = "Confirmation successful, thank you!";

        email = email ?? "";
        usergroup = usergroup ?? "";

        if (email.Length < 1 || usergroup.Length < 1) textToShow = "Confirmation failed, please email authelp@uw.edu.";

        SQL_utils sql = new SQL_utils("backend");

        string sqlcode = String.Format("INSERT into mob.confirmations ([email], [usergroup], [datetime]) VALUES ( '{0}', '{1}', getdate())", email, usergroup);

        sql.NonQuery_from_SQLstring(sqlcode);

        try
        {
            sql.NonQuery_from_SQLstring(sqlcode);
        }
        catch (Exception exc)
        {
            textToShow = "Confirmation failed, please email authelp@uw.edu." + exc.Message;
        }


        //SqlCommand sqlCmd = new SqlCommand
        //{
        //    Connection = oConn,
        //    CommandType = System.Data.CommandType.Text,
        //    CommandText = "INSERT into mob.confirmations ([email], [usergroup], [datetime]) VALUES ( '" + email + "', '" + usergroup + "', '" + DateTime.Now + "')"
        //};

        //try
        //{
        //    sqlCmd.ExecuteNonQuery();
        //}
        //catch(SqlException exc)
        //{
        //    textToShow = "Confirmation failed, please email authelp@uw.edu." + exc.Message;
        //}

        lblInfo.Text = textToShow;
    }
}
