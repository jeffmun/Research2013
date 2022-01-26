using AutismCenterBase.Utilities;
using System;
using System.Data.SqlClient;
using uwac;

public partial class ComputerReservations : BasePage //System.Web.UI.Page
{
    private SqlConnection oConn = new SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnCreateNewComputer.Enabled = btnCreateNewComputerEnabled();
        }
    }

    protected void btnCreateNewComputer_Click(object sender, EventArgs e)
    {
        SQL_utils sql = new SQL_utils("backend");

        string sqlcode = String.Format("INSERT into [IT].[ComputerReservations] ([Computer]) VALUES ( '" + TextBoxNewComputerName.Text + "')");

        sql.NonQuery_from_SQLstring(sqlcode);
    }

    protected void TextBoxNewComputerName_TextChanged(object sender, EventArgs e)
    {
        //lblInfo.Text += "yo";
        //btnCreateNewClient.Enabled = true;
        btnCreateNewComputer.Enabled = btnCreateNewComputerEnabled();
    }

    protected Boolean btnCreateNewComputerEnabled()
    {
        return (TextBoxNewComputerName.Text.Trim().Length > 0 );
    }

    protected void logConfirmation(string email, string usergroup)
    {
        string textToShow = "Confirmation successful, thank you!";

        email = email ?? "";
        usergroup = usergroup ?? "";

        if (email.Length < 5 || usergroup.Length < 5)
        {
            textToShow = "Confirmation failed, please email authelp@uw.edu.";
        }
        else
        {
            SQL_utils sql = new SQL_utils("backend");
            string sqlcode = String.Format("INSERT into confirmations ([email], [usergroup], [datetime]) VALUES ( '{0}', '{1}', '{2}')", email, usergroup, DateTime.Now.ToString());

            try
            {
                sql.NonQuery_from_SQLstring(sqlcode);
            }
            catch (SqlException exc)
            {
                textToShow = "Confirmation failed, please email authelp@uw.edu." + exc.Message;
            }
        }

        lblInfo.Text = textToShow;
    }
}
