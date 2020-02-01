using System;
using uwac;
using System.IO;
using System.Net;
public partial class test_get_BI : BasePage //System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
        Read_Month();
    }
    public void Read_Month()
    {
        String urlString = "https://edw.washington.edu/ReportServer/Pages/ReportViewer.aspx?"
            + "/ Financial / Variable Reporting Period Budget Summary"
            + "& rs:Command = Render"
            + "& rs:format = csv"
            + "& startdate = nov 2019"
            + "& enddate = dec 2019"
            + "& myfdbudlist = N / A"
            + "& encumbrances = True"
            + "& expiredsalary = True"
            + "& inckids = n"
            + "& budgetnbr = 65 - 3920"
            + "& reportby = s";

        WebRequest request = WebRequest.Create(urlString);

        request.Credentials = BuildCredentials(urlString, "netid\freitz", "Fr1tz007", "Bearer");

        WebResponse response = request.GetResponse();

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
        NetworkCredential cred = new System.Net.NetworkCredential(username, password);

        CredentialCache cache = new CredentialCache();

        cache.Add(new Uri(siteurl), authtype, cred);

        return cache;
    }
}