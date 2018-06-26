using System;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Security.Principal;
using System.Security.Permissions;
using System.Text;
using System.Web;
using System.Configuration;

using AutismCenterBase.Utilities;

//Now Obsolete
//[assembly:SecurityPermissionAttribute(SecurityAction.RequestMinimum, UnmanagedCode=true)]
//[assembly:PermissionSetAttribute(SecurityAction.RequestMinimum, Name = "FullTrust")]

namespace AutismCenterBase.Security
{
	public class Login
	{  //test
		private string sLoginID;
		private string sPassword;
		private string sPath;
		private string sDomain;
		private string sFilterAttribute;
		private ReadConfig oConfig = new ReadConfig();
		private int nSessionDuration;
		private IntPtr oToken = new IntPtr(0);
		private IntPtr oNewToken = new IntPtr(0);

		const int LOGON32_LOGON_INTERACTIVE = 2;
		const int LOGON32_PROVIDER_DEFAULT = 0;

		#region Login Constructors
		public Login()
		{
			sPath = ConfigurationManager.AppSettings["LDAPpath"].ToString();  //moved to web.config rather than hard coding it
			sDomain = ConfigurationManager.AppSettings["LDAPdomain"].ToString();  //moved to web.config rather than hard coding it
			nSessionDuration = oConfig.SessionDuration;

			//JMTEMP
			this.sLoginID = "jeffmun";//HttpContext.Current.Request.ServerVariables["AUTH_USER"].ToString().Replace("AUTISM\\", "");
			this.sPassword = "0987!@KLm";//HttpContext.Current.Request.ServerVariables["AUTH_PASSWORD"].ToString();
		}

		public Login(string sUID, string sPWD)
		{
			this.sLoginID = sUID;
			this.sPassword = sPWD;
			sPath = ConfigurationManager.AppSettings["LDAPpath"].ToString();  //moved to web.config rather than hard coding it
			sDomain = ConfigurationManager.AppSettings["LDAPdomain"].ToString();  //moved to web.config rather than hard coding it
			nSessionDuration = oConfig.SessionDuration;
		}
		#endregion

		[DllImport("advapi32.dll", SetLastError=true)]
		private static extern bool LogonUser(string sUserName, string sDomain, string sPassword, int nLogonType, int nLogonProvider, ref IntPtr oToken);

		#region AutenticateUser Method
		//This method attempts to authenticate the user against the Active Directory using the
		//LoginID and Password credentials supplied to the Login class.

		public bool AutenticateUser()
		{
			DirectoryEntry oDirEntry;

			if (!sLoginID.StartsWith(sDomain))
				oDirEntry = new DirectoryEntry(sPath, sDomain + sLoginID, sPassword);
			else
				oDirEntry = new DirectoryEntry(sPath, sLoginID, sPassword);

			if (sLoginID == "" || sPassword == "" || sLoginID == null || sPassword == null)
				return false;

			Object obj = oDirEntry.NativeObject;
			DirectorySearcher oDirSearch = new DirectorySearcher(oDirEntry);
			oDirSearch.Filter = "(SAMAccountName=" + sLoginID + ")";
			oDirSearch.PropertiesToLoad.Add("cn");
			SearchResult oResult = oDirSearch.FindOne();

			/*
			// Testing Password Expiration
			TimeSpan pwdTimeLeft = PasswordExpires.GetTimeLeft(oDirEntry);

			// Set a cookie with the password expiration
			oCookie = new HttpCookie("ACPWordExp");
			oCookie.Value = pwdTimeLeft.ToString();
			oCookie.Expires = DateTime.Now.AddMinutes(nSessionDuration);
			HttpContext.Current.Response.Cookies.Add(oCookie);

			// End Test area
			*/

			if (oResult == null)
				return false;
			else
			{
				sFilterAttribute = (string) oResult.Properties["cn"][0];
				return true;
			}
		}
		#endregion


		#region GetGroups Method (private)
		//This method gets all of the Active Directory groups that the authenticated user is
		//a part of.
		public string GetGroups_public()
		{
			string groups = GetGroups();
			return groups;
		}
		
		
		private string GetGroups()
		{
			//LDAP://autism.washington.edu/DC=autism,DC=washington,DC=edu
			//string sPath2 = @"LDAP://directory.washington.edu/dc=netid,dc=washington,dc=edu,ou=People,o=University of Washington,c=US";
			string sGroups = "";

			try
			{
				DirectoryEntry oDirEntry = new DirectoryEntry(sPath);

				DirectorySearcher oSearch = new DirectorySearcher(oDirEntry);

				Object obj = oDirEntry.NativeObject;
				oSearch.Filter = "(SAMAccountName=" + sLoginID + ")";  //oSearch.Filter = "(SAMAccountName=jeffmun)";  if (String.IsNullOrEmpty(sLoginID))  ...
				oSearch.PropertiesToLoad.Add("memberOf");

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
			}
			catch(Exception)
			{

			}
			return sGroups;
		}
		#endregion

		#region SetProfileCookie Method
		//This method will open a connection to the db and lookup all of the user's information
		//and stores it in a cookie that we can use later on throughout the site. This cookie
		//is requested on every page requiring security; if it does not exist, the user is
		//redirected to the login page.
		public void SetProfileCookie()
		{
			HttpContext.Current.Request.Cookies.Clear();
			string sUserName;

			if (this.LoginID.StartsWith(sDomain))
				sUserName = this.LoginID.Substring(sDomain.Length);
			else
				sUserName = this.LoginID;

			//Create the user profile cookie; this cookie will last longer than the security
			//cookie and contains information about the user.
			HttpCookie oCookie = new HttpCookie("UserProfile");
			SqlConnection oConn = new SqlConnection();
			oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
			oConn.Open();
			
			DBLookup oDBLookup = new DBLookup(oConn);

			SqlDataReader oReader = oDBLookup.GetUserProfile(sUserName);

			if (oReader.HasRows)
			{
				oReader.Read();
				oCookie.Values["StaffID"] = oReader["StaffID"].ToString();
				oCookie.Values["ActiveDirID"] = oReader["ActDirID"].ToString();
				oCookie.Values["StaffShortName"] = oReader["StaffShortName"].ToString();
				oCookie.Values["FullName"] = oReader["FullName"].ToString();
				oCookie.Values["StaffInits"] = oReader["StaffInits"].ToString();
				oCookie.Values["Title"] = oReader["Title"].ToString();
				oCookie.Values["Active"] = oReader["Active"].ToString();
				oCookie.Values["ApptStaff"] = oReader["ApptStaff"].ToString();
				oCookie.Values["Clinician"] = oReader["Clinician"].ToString();
				oCookie.Values["StaffType"] = oReader["StaffType"].ToString();
				oCookie.Values["DefaultStudyID"] = oReader["DefaultStudyID"].ToString();
				oCookie.Values["Status"] = oReader["Status"].ToString();
				oCookie.Values["EmailAddress"] = oReader["Email"].ToString();
				oCookie.Values["PhoneNumber"] = oReader["Phone_Work"].ToString();
			}

			oCookie.Values["UserGroups"] = this.GetGroups();
			oCookie.Expires = DateTime.Now.AddHours(10);

			HttpContext.Current.Response.Cookies.Add(oCookie);

			//This section will create a cookie especially for the ASP pages in the screening
			//section of the site. ASP does not know how to handle series of key/value pairs
			//as cookie data so we just give them one text-based cookie.
			oCookie = new HttpCookie("ASPUserCookie");
			oCookie.Value = "True";
			oCookie.Expires = DateTime.Now.AddMinutes(nSessionDuration);

			HttpContext.Current.Response.Cookies.Add(oCookie);

			oConn.Close();
		}
		#endregion

		#region Check Group Level Permissions
		public bool CheckGroupPermissions(string[] aGroupsAllowed)
		{
			string[] aUserGroups = this.GetGroups().Split('|');
			bool bReturn = false;

			for (int i=0;i<aUserGroups.Length;i++)
			{
				for (int j=0;j<aGroupsAllowed.Length;j++)
				{
					if (aGroupsAllowed[j] == aUserGroups[i])
					{
						bReturn = true;
						break;
					}
				}

				if (bReturn)
					break;
			}

			return bReturn;
		}
		#endregion

		#region Login Properties (LoginID/Password)
		public string LoginID
		{
			get {return this.sLoginID;}
			set {this.sLoginID = value;}
		}

		public string Password
		{
			set {this.sPassword = value;}
		}
		#endregion

		#region PersistSession Method (No Longer Used)
/*
		//This method is called to extend the life of the user's session by the amount of time
		//(in minutes) specified.
		public void PersistSession(int nDuration)
		{
			if (HttpContext.Current.Request.Cookies["Security"] != null)
				HttpContext.Current.Response.Cookies["Security"].Expires = DateTime.Now.AddMinutes(nDuration);

			if (HttpContext.Current.Request.Cookies["ASPUserCookie"] != null)
				HttpContext.Current.Response.Cookies["ASPUserCookie"].Expires = DateTime.Now.AddMinutes(nDuration);
		}
*/
		#endregion

		#region Open a Trusted, Impersonated Connection to SQL Server (No Longer Used)
/*
		public SqlConnection OpenTrustedConnection(string sConnectionString)
		{
			SqlConnection oConn = new SqlConnection();
			oConn.ConnectionString = sConnectionString;

			if (HttpContext.Current.Request.ServerVariables["AUTH_USER"].ToString() == "")
			{
				try
				{
					WindowsImpersonationContext oImpersonatedUser;
					HttpCookie oCookie = HttpContext.Current.Request.Cookies["UserProfile"];
					string sToken = oCookie.Values["UserToken"].ToString();

					IntPtr oToken = new IntPtr(Convert.ToInt32(sToken));
					WindowsIdentity oIdentity = new WindowsIdentity(oToken);

					oImpersonatedUser = oIdentity.Impersonate();
					oConn.Open();
					oImpersonatedUser.Undo();
				}
				catch(System.Exception oErr)
				{
					HttpContext.Current.Response.Redirect("/Home/Error.aspx?ErrMsg=" + HttpContext.Current.Server.UrlEncode(oErr.Message) + "&ErrSrc=" + HttpContext.Current.Server.UrlEncode(oErr.Source), true);
				}
			}
			else
				oConn.Open();

			return oConn;
		}
*/
		#endregion
	}
}
