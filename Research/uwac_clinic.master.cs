using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;

//using AutismCenterBase.Utilities;
//using AutismCenterBase.Security;
using uwac;

public partial class uwac_clinic : System.Web.UI.MasterPage
{
	uwac.Login oLogin = new uwac.Login();

	//private ReadConfig oConfig = new ReadConfig();
	private Config_utils oConfig = new Config_utils();
	//private DBLookup oDB = new DBLookup();
	private SQL_utils oSQL = new SQL_utils("tracking");
	private SqlConnection oConn = new SqlConnection();
	private string sCallingPage;
	private int master_serviceID;
	private string master_servicename;
	private string aspx;
	private string aspxfull;

	private bool testing_login = false;

	#region ...Public Vars...
	public SqlConnection SqlConn
	{
		get { return oConn; }
		//set { this.oConn = value; }
	}

	//public AutismCenterBase.Utilities.ReadConfig Config
	//{
	//    get { return oConfig; }
	//}

	public uwac.Config_utils Config
	{
		get { return oConfig; }
	}

	//public AutismCenterBase.Utilities.DBLookup DB
	//{
	//    get { return oDB; }
	//}

	public uwac.SQL_utils SQL
	{
		get { return oSQL; }
	}

	//public AutismCenterBase.Security.Login AutismLogin
	//{
	//    get { return oLogin; }
	//}

	public uwac.Login AutismLogin
	{
		get { return oLogin; }
	}

	public int Master_serviceID
	{
		get { return master_serviceID; }
		set { master_serviceID = value; }
	}


	public string Master_servicename
	{
		get { return master_servicename; }
	}

	public Label MasterERROR
	{
		get { return masterERROR; }
	}
	public Label MasterINFO
	{
		get { return masterINFO; }
	}

	public string Aspx
	{
		get { return aspx; }
	}

	public string Aspxfull
	{
		get { return aspxfull; }
	}

	//Exposed the dropdown as public so that it's "SelectedIndexChanged" event can be monitored in content pages
	public DropDownList DDL_Master_SelectStudyID
	{
		get { return ddl_Master_SelectStudyID; }
	}
	#endregion


	protected void ddl_Master_SelectStudyID_SelectedIndexChanged(object sender, EventArgs e)
	{


		//update the user's default studyID
		if (Convert.ToInt16(ddl_Master_SelectStudyID.SelectedValue) > 0)
		{

			//string procoutput = oDB.RunProc("spSEC_Update_Default_StudyID_for_User", 
			//    "@studyID", ddl_Master_SelectStudyID.SelectedValue,"int");
			//string procoutput = oSQL.StringScalar_from_ProcName("spSEC_Update_Default_StudyID_for_User",
			//    oSQL.CreateParam("@studyID", ddl_Master_SelectStudyID.SelectedValue, "int"));

			oSQL.NonQuery_from_SQLstring("exec spSEC_Update_Default_StudyID_for_User " + ddl_Master_SelectStudyID.SelectedValue);


			//master_studyID = Convert.ToInt32(ddl_Master_SelectStudyID.SelectedValue);
			//ViewState["studyID"] = master_studyID;

		}

		GetCurrentDefaultStudyID();

		ddl_Master_SelectStudyID.SelectedIndex = 0;

		//masterINFO.Text += "{" + master_studyID.ToString() + "}";

	}



	/// <summary>
	/// New from Jeff - incorporating the Default StudyID
	/// </summary>
	public void GetCurrentDefaultStudyID()
	{


		//DataTable dt = oSQL.DataTable_from_ProcName("spSEC_Get_selected_services_for_User");

		//if (dt != null)
		//{
		//    foreach (DataRow row in dt.Rows)
		//    {
		//        master_studyID = Convert.ToInt16(row["defaultstudyID"]);
		//        master_studyname = Convert.ToString(row["studyname"]);
		//        master_studyIDfull = Convert.ToInt32(row["studyIDfull"]);
				
		//    }

		//    lblDefaultStudy.Text = master_studyname;
		//    lblMasterStudyID.Text = master_studyID.ToString();
		//    lblMasterStudyIDfull.Text = master_studyIDfull.ToString();
		//}
		////ViewState["studyID"] = master_studyID;
	}


	protected void PopulateStudyDDL()
	{

		//DataTable dt = oSQL.DataTable_from_ProcName("spSEC_GetStudies_CanView_OR_Acess_by_User__Short__with_SelectStudy");

		//ddl_Master_SelectStudyID.DataSource = dt;
		//ddl_Master_SelectStudyID.DataBind();

	}



	#region ...Page Events...

	protected void Page_Init(object sender, EventArgs e)
	{
		if (Request.Browser.Crawler) { Response.End(); }

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

		//Here remove the constant for the specific location of the file on the websever 
		//so that we only deal with a relative path from the root of the site.
		aspxfull = Path.GetFullPath(Request.Path).Replace(@"c:\research2", "").Replace(@"\", @"/");
		aspx = Path.GetFileName(Request.Path);


		GetCurrentDefaultStudyID();

		PopulateStudyDDL();


		NReco.PivotData.License.SetLicenseKey(
"PivotDataToolkit_Bin_Pack_000426121678",
"Galv8kCqIiZYLGq5Qoc+ymn8Jo57iNuWgMqZ9vrpjfdSLkiqGpTC0AtpV7VHn1GyhoEorRfIEi27UOgJf28o+2KlKuOnrPlO/FxCV4+qUTTWL7LyP/HmhYZdeI4kox5pyThzUZb36ijxsfXzAMlFzpv3uDtPtu6ktwtiROwKG/c=");

	}

	protected void Page_Unload(object sender, EventArgs e)
	{
		if (oConn != null)
		{
			if (oConn.State == ConnectionState.Open)
				oConn.Close();
		}

		if (oSQL != null)
		{
			oSQL.Close();
		}

	}

	protected void Page_Load(object sender, EventArgs e)
	{
		//fix menu display in Chrome and Safari
		if (Request.UserAgent.IndexOf("AppleWebKit") > 0)
		{
			Request.Browser.Adapters.Clear();
		}


		if (Request.Cookies["UserProfile"] == null) { oLogin.SetProfileCookie(); }

		//oLogin.LoginID

		lblSessionInfo.Text = oLogin.LoginID;
		lblDomainInUse.Text = oLogin.DomainInUse;
		//spnSessionInfo.InnerHtml = Request.ServerVariables["AUTH_USER"];

		//if (ViewState["studyID"] != null)
		//{
		//    master_studyID = Convert.ToInt32(ViewState["studyID"]);
		//}

		if (!testing_login)
		{

			//LoadAspxStatus();
		}

		lblDate.Text = System.DateTime.Today.ToLongDateString();

		if (!IsPostBack)
		{
			//LoadStudiesByUser();

			XmlDocument oSiteMap = new XmlDocument();

			//DF: 4/8 added ~
			oSiteMap.Load(Server.MapPath("~/") + "Web.sitemap");
			AddMenuItem(oSiteMap.ChildNodes.Item(1).ChildNodes.Item(0).ChildNodes, null);

		}


	}

	#endregion


	//protected void LoadStudiesByUser()
	//{

	//    ////DataTable dt = oDB.GetProc("spSEC_GetStudies_CanView_OR_Acess_by_User__Short__with_SelectStudy");
	//    DataTable dt = oSQL.DataTable_from_ProcName("spSEC_GetStudies_CanView_OR_Acess_by_User__Short__with_SelectStudy");

	//    ddl_Master_SelectStudyID.DataSource = dt;
	//    ddl_Master_SelectStudyID.DataTextField = "StudyName";
	//    ddl_Master_SelectStudyID.DataValueField = "studyID";
	//    ddl_Master_SelectStudyID.DataBind();

	//}






	#region ...Build Menu...
	private void AddMenuItem(XmlNodeList oNodes, MenuItem oParentMenu)
	{
		foreach (XmlNode oChildNode in oNodes)
		{
			if (oChildNode.NodeType == XmlNodeType.Element)
			{
				bool bHasMenuAccess = true;
				MenuItem oMenuItem = new MenuItem();
				string sURL = oChildNode.Attributes["url"].Value.ToString();
				string sTitle = oChildNode.Attributes["title"].Value.ToString();
				string sRole = "";
				string sDesc = "";
				string sPage = "";
				string sHelpFile = "";
				bool bIsMenuItem = false;

				if (oChildNode.Attributes["roles"] != null) { sRole = oChildNode.Attributes["roles"].Value.ToString(); }
				if (oChildNode.Attributes["description"] != null) { sDesc = oChildNode.Attributes["description"].Value.ToString(); }
				if (oChildNode.Attributes["url"] != null) { sPage = oChildNode.Attributes["url"].Value.ToString(); }
				if (oChildNode.Attributes["helpfile"] != null) { sHelpFile = oChildNode.Attributes["helpfile"].Value.ToString(); } else { sHelpFile = ""; }
				if (oChildNode.Attributes["menuitem"] != null) { bIsMenuItem = (oChildNode.Attributes["menuitem"].Value.ToString().ToLower() == "true"); }

				oMenuItem.ToolTip = sDesc;

				//OFF
				//if (sRole != "")
				//    bHasMenuAccess = oLogin.CheckGroupPermissions(sRole.Split('|'));
				//else
				//    bHasMenuAccess = true;

				//if (this.Page.AppRelativeVirtualPath.Replace("~", "").Replace("default.aspx", "") == sPage)

				//2del??
				//if (this.Page.AppRelativeVirtualPath.Replace("default.aspx", "") == sPage)
				//{
				//    if (sHelpFile != "")
				//    {
				//        oHelpLink.HRef = "javascript:var oHelpWdw = window.open('" + Request.ApplicationPath + sHelpFile + "', '', 'height=500,width=700,toolbar=no,scrollbars=yes,resizable=yes');";
				//        oHelpLink.InnerHtml = "Help";
				//    }
				//}

				if (bHasMenuAccess && bIsMenuItem)
				{
					if (oParentMenu != null)
					{
						oMenuItem.Text = sTitle;
						oMenuItem.NavigateUrl = sURL;

						oParentMenu.ChildItems.Add(oMenuItem);
					}
					else
					{
						oMenuItem.Text = sTitle;
						oMenuItem.NavigateUrl = sURL;
						oMenu.Items.Add(oMenuItem);
					}

					AddMenuItem(oChildNode.ChildNodes, oMenuItem);
				}
			}
		}
	}
	#endregion



	protected void btnManager_Show_Click(object sender, EventArgs e)
	{
		Panel_PageManager.Visible = true;
		btnManager_Hide.Visible = true;
		btnManager_Show.Visible = false;

	}
	protected void btnManager_Hide_Click(object sender, EventArgs e)
	{
		Panel_PageManager.Visible = false;
		btnManager_Hide.Visible = false;
		btnManager_Show.Visible = true;
	}
}
