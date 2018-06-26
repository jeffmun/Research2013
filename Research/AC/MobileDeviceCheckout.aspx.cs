using AutismCenterBase.Utilities;
using System;
using System.Data.SqlClient;

public partial class MobileDeviceCheckout : System.Web.UI.Page
{
    private SqlConnection oConn = new SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        string email = Request.QueryString["email"];
        string usergroup = Request.QueryString["usergroup"];

        oConn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["mobileDeviceConnectionString"].ConnectionString;
        oConn.Open();

        if (!IsPostBack)
        {
            logConfirmation(email, usergroup);
        }
    }

    protected void logConfirmation(string email, string usergroup)
    {
        string textToShow = "Confirmation successful, thank you!";

        email = email ?? "";
        usergroup = usergroup ?? "";

        if (email.Length < 5 || usergroup.Length < 5) textToShow = "Confirmation failed, please email authelp@uw.edu.";

        SqlCommand sqlCmd = new SqlCommand
        {
            Connection = oConn,
            CommandType = System.Data.CommandType.Text,
            CommandText = "INSERT into confirmations ([email], [usergroup], [datetime]) VALUES ( '" + email + "', '" + usergroup + "', '" + DateTime.Now + "')"
        };

        try

        {
            sqlCmd.ExecuteNonQuery();
        }

        catch(SqlException exc)

        {
            textToShow = "Confirmation failed, please email authelp@uw.edu." + exc.Message;
        }

        lblInfo.Text = textToShow;
    }
}
