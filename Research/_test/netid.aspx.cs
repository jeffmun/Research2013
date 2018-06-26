using System;
using System.DirectoryServices;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using uwac;


public partial class _test_netid : System.Web.UI.Page
{

	protected void Page_Load(object sender, EventArgs e)
	{

		string x = GetGroups();

		lbl1.Text = x;
	}




	public static string GetGroups()
	{
		//LDAP://autism.washington.edu/DC=autism,DC=washington,DC=edu

		string sPath2 = @"LDAPS://netid.washington.edu,636/dc=netid,dc=edu user base,dc=washington,dc=edu,ou=People,ou=u_uwautism";


		DirectoryEntry oDirEntry = new DirectoryEntry(sPath2, "jeffmun", "0987!@KLm");



		DirectorySearcher oSearch = new DirectorySearcher(oDirEntry);
		string sGroups = "";

		//Object obj = oDirEntry.NativeObject;
		oSearch.Filter = "(uwNetid=jeffmun)";  //oSearch.Filter = "(SAMAccountName=jeffmun)";  if (String.IsNullOrEmpty(sLoginID))  ...
											   //		oSearch.Filter = "(SAMAccountName=" + sLoginID + ")";  //oSearch.Filter = "(SAMAccountName=jeffmun)";  if (String.IsNullOrEmpty(sLoginID))  ...
		oSearch.PropertiesToLoad.Add("memberOf");

		try 
		{
			SearchResult oResult = oSearch.FindOne();


			if (oResult != null)
			{
				String sResult;
				int i;

				for (i = 0; i < oResult.Properties["memberOf"].Count; i++)
				{
					sResult = oResult.Properties["memberOf"][i].ToString();

					if (sResult.IndexOf("=", 1) == -1)
						return null;

					sGroups += (sResult.Substring((sResult.IndexOf("=", 1) + 1), (sResult.IndexOf(",", 1) - sResult.IndexOf("=", 1)) - 1)) + "|";
				}
			}

			if (sGroups.EndsWith("|"))
				sGroups = sGroups.Substring(0, sGroups.Length - 1);

			return sGroups;
		}
		catch(Exception ex)
		{
			return ex.Message +  "<br/>" + Environment.NewLine + Environment.NewLine + ex.StackTrace;
		}


	}



}