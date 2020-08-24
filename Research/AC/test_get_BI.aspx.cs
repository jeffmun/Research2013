using System;
using uwac;
using System.IO;
using System.Net;
using uwac;
using System.Web;

public partial class test_get_BI : BasePage //System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{




    }
    public void Read_Month()
    {
        String urlString = "https://edw.washington.edu/ReportServer/Pages/ReportViewer.aspx?"
            + "/Financial/Variable Reporting Period Budget Summary"
            + "&rs:Command=Render"
            + "&rs:format=csv"
            + "&startdate=nov 2019"
            + "&enddate=dec 2019"
            + "&myfdbudlist=N/A"
            + "&encumbrances=True"
            + "&expiredsalary=True"
            + "&inckids=n"
            + "&budgetnbr=65-3920"
            + "&reportby=s";


        //String urlString = "https://ucs.admin.uw.edu/MyFD/UWNetID/BudgetSummary.aspx?"
        //    + "FdiNavbar:ViewBudgetNumberTxt=653920"
        //    + "&FdiNavbar:TimePeriodList=Feb"
        //    + "&FdiNavbar:CalendarYearList=2020";

        WebRequest request = WebRequest.Create(urlString);

        //request.PreAuthenticate = true;

        request.Credentials = CredentialCache.DefaultCredentials;


        //request.Credentials = BuildCredentials(urlString, @"netid\freitz", "Fr1tz007", "OAuth");

        WebResponse response = request.GetResponse(); // response is netid sign in page HTML!

        Console.WriteLine(((HttpWebResponse)response).StatusDescription);

        using (Stream dataStream = response.GetResponseStream())
        {
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();
            Console.WriteLine(responseFromServer);
            lbl1.Text = responseFromServer;
        }

        response.Close();
    }

    private ICredentials BuildCredentials(string siteurl, string username, string password, string authtype)
    {
        NetworkCredential cred;
        if (username.Contains(@"\"))
        {
            string domain = username.Substring(0, username.IndexOf(@"\"));
            username = username.Substring(username.IndexOf(@"\") + 1);
            cred = new System.Net.NetworkCredential(username, password, domain);
        }
        else
        {
            cred = new System.Net.NetworkCredential(username, password);
        }
        CredentialCache cache = new CredentialCache();
        if (authtype.Contains(":"))
        {
            authtype = authtype.Substring(authtype.IndexOf(":") + 1); //remove the TMG: prefix
        }
        cache.Add(new Uri(siteurl), authtype, cred);
        return cache;
    }

    protected void btn_Click(object sender, EventArgs e)
    {
        int x = 0;
        Read_Month();
    }
}