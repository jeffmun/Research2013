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

public partial class UWAutism : System.Web.UI.MasterPage
{
	uwac.Login oLogin = new uwac.Login();

	//private ReadConfig oConfig = new ReadConfig();
	private Config_utils oConfig = new Config_utils();
	//private DBLookup oDB = new DBLookup();
	private SQL_utils oSQL = new SQL_utils("tracking");
	private SqlConnection oConn = new SqlConnection();
	private string sCallingPage;
	private int master_studyID;
	private int master_studyIDfull;
	private string master_studyname;
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

	public int Master_studyID
	{
		get { return master_studyID; }
		set { master_studyID = value; }
	}

	public int Master_studyIDfull
	{
		get { return master_studyIDfull; }
	}

	public string Master_studyname
	{
		get { return master_studyname; }
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
	//public DropDownList DDL_Master_SelectStudyID
	//{
	//    get { return ddl_Master_SelectStudyID; }
	//}
	#endregion


	//protected void ddl_Master_SelectStudyID_SelectedIndexChanged(object sender, EventArgs e)
	//{


	//    //update the user's default studyID
	//    if (Convert.ToInt16(ddl_Master_SelectStudyID.SelectedValue) > 0)
	//    {

	//        //string procoutput = oDB.RunProc("spSEC_Update_Default_StudyID_for_User", 
	//        //    "@studyID", ddl_Master_SelectStudyID.SelectedValue,"int");
	//        //string procoutput = oSQL.StringScalar_from_ProcName("spSEC_Update_Default_StudyID_for_User",
	//        //    oSQL.CreateParam("@studyID", ddl_Master_SelectStudyID.SelectedValue, "int"));

	//        oSQL.NonQuery_from_SQLstring("exec spSEC_Update_Default_StudyID_for_User " + ddl_Master_SelectStudyID.SelectedValue);


	//        //master_studyID = Convert.ToInt32(ddl_Master_SelectStudyID.SelectedValue);
	//        //ViewState["studyID"] = master_studyID;

	//    }

	//    GetCurrentDefaultStudyID();

	//    ddl_Master_SelectStudyID.SelectedIndex = 0;

	//    //masterINFO.Text += "{" + master_studyID.ToString() + "}";

	//}



	///// <summary>
	///// New from Jeff - incorporating the Default StudyID
	///// </summary>
	//public void GetCurrentDefaultStudyID()
	//{


	//    //DataTable dt = oDB.GetProc("spSEC_Get_Default_StudyID_for_User");
	//    DataTable dt = oSQL.DataTable_from_ProcName("spSEC_Get_Default_StudyID_for_User");

	//    //2del
	//    //SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
	//    //sqlAdapter.Fill(dt);
	//    if (dt != null)
	//    {
	//        foreach (DataRow row in dt.Rows)
	//        {
	//            master_studyID = Convert.ToInt16(row["defaultstudyID"]);
	//            master_studyname = Convert.ToString(row["studyname"]);
	//            master_studyIDfull = Convert.ToInt32(row["studyIDfull"]);
				
	//        }

	//        lblDefaultStudy.Text = master_studyname;
	//        lblMasterStudyID.Text = master_studyID.ToString();
	//        lblMasterStudyIDfull.Text = master_studyIDfull.ToString();
	//    }
	//    //ViewState["studyID"] = master_studyID;
	//}


	//protected void PopulateStudyDDL()
	//{

	//    DataTable dt = oSQL.DataTable_from_ProcName("spSEC_GetStudies_CanView_OR_Acess_by_User__Short__with_SelectStudy");

	//    ddl_Master_SelectStudyID.DataSource = dt;
	//    ddl_Master_SelectStudyID.DataBind();

	//}



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


		NReco.PivotData.License.SetLicenseKey(
"PivotDataToolkit_Bin_Pack_000426121678",
"Galv8kCqIiZYLGq5Qoc+ymn8Jo57iNuWgMqZ9vrpjfdSLkiqGpTC0AtpV7VHn1GyhoEorRfIEi27UOgJf28o+2KlKuOnrPlO/FxCV4+qUTTWL7LyP/HmhYZdeI4kox5pyThzUZb36ijxsfXzAMlFzpv3uDtPtu6ktwtiROwKG/c=");


		//GetCurrentDefaultStudyID();

		//PopulateStudyDDL();

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
		//spnSessionInfo.InnerHtml = Request.ServerVariables["AUTH_USER"];

		//if (ViewState["studyID"] != null)
		//{
		//    master_studyID = Convert.ToInt32(ViewState["studyID"]);
		//}

		//if (!testing_login)
		//{

		//    LoadAspxStatus();
		//}

		lblDate.Text = System.DateTime.Today.ToLongDateString();

		if (!IsPostBack)
		{
			//LoadStudiesByUser();

			XmlDocument oSiteMap = new XmlDocument();

			//DF: 4/8 added ~
			oSiteMap.Load(Server.MapPath("~/") + "UWBudgetTool.sitemap");
			
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



	//protected void btnShowRedObj_Click(object sender, EventArgs e)
	//{
	//    LoadRefdObjects();
	//}

	//protected void btnHideRedObj_Click(object sender, EventArgs e)
	//{
	//    lbl1.Visible = false;
	//    gvRefdObj.Visible = false;
	//    btnHideRedObj.Visible = false;
	//    btnShowRedObj.Visible = true;
	//}


	//protected void LoadAspxStatus()
	//{
	//    ////Load the referenced objects
	//    ////string s = oDB.GetProcScalar_string("web.spASPX_GetStatus", oDB.CreateParam("aspxfull", Aspxfull, "text"));
	//    //string s = oSQL.StringScalar_from_ProcName("web.spASPX_GetStatus", oSQL.CreateParam("aspxfull", Aspxfull, "text"));

	//    ////string[] status = new string[2];
	//    ////status = s.Split('|');

	//    ////txtAssignedTo.Text = status[0];
	//    ////txtTestingStatus.Text = status[1];

	//}



	//protected void LoadRefdObjects()
	//{
	//    ////This will display the SQL objects referenced by this page (provided they are logged into web.aspx_pages_with_obj
	//    //// as well as the SQL objects that these objects in turn reference
	//    //string pageName = Path.GetFileName(Request.Path);

	//    ////Check to see if this page is logged in the DB.  If not, then log it
	//    //List<SqlParameter> p = new List<SqlParameter>();
	//    //p.Add(oSQL.CreateParam("aspxfull", Aspxfull, "text"));
	//    //p.Add(oSQL.CreateParam("aspx", Aspx, "text"));
	//    //string x = oSQL.StringScalar_from_ProcName("web.spInsert_aspx", p);


	//    ////Load the referenced objects
	//    ////DataTable dt = oDB.GetProc("web.spASPX_RefdObj", oDB.CreateParam("aspx", Aspx, "text"));
	//    //DataTable dt = oSQL.DataTable_from_ProcName("web.spASPX_RefdObj", oSQL.CreateParam("aspx", Aspx, "text"));
	//    //int numrecs = dt.Rows.Count;
	//    //lbl1.Text = "aspxfull:[" + aspxfull + "] aspx:[" + aspx + "]";
	//    //gvRefdObj.DataSource = dt;
	//    //gvRefdObj.DataBind();

	//    ////Update visibilty of objects on the page
	//    //lbl1.Visible = true;
	//    //gvRefdObj.Visible = true;
	//    //btnHideRedObj.Visible = true;
	//    //btnShowRedObj.Visible = false;

	//}


	//protected void btnInsertObj_Click(object sender, EventArgs e)
	//{
	//    //List<SqlParameter> p = new List<SqlParameter>();
	//    //p.Add(oSQL.CreateParam("aspx", Aspxfull, "text"));
	//    //p.Add (oSQL.CreateParam("objname",txtObj.Text, "text"));
	//    ////string x = oDB.RunProc("web.spInsert_aspx_obj", p);
	//    //string x = oSQL.StringScalar_from_ProcName("web.spInsert_aspx_obj", p);
	//}


	//protected void btnSaveStatus_Click(object sender, EventArgs e)
	//{
	//    //List<SqlParameter> p = new List<SqlParameter>();
	//    //p.Add(oSQL.CreateParam("aspxfull", Aspxfull, "text"));
	//    //p.Add(oSQL.CreateParam("assigned_to", txtAssignedTo.Text, "text"));
	//    //p.Add(oSQL.CreateParam("testing_status", txtTestingStatus.Text, "text"));
	//    //string x = oSQL.StringScalar_from_ProcName("web.spUpdate_aspx", p);

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



	//protected void btnManager_Show_Click(object sender, EventArgs e)
	//{
	//    Panel_PageManager.Visible = true;
	//    btnManager_Hide.Visible = true;
	//    btnManager_Show.Visible = false;

	//}
	//protected void btnManager_Hide_Click(object sender, EventArgs e)
	//{
	//    Panel_PageManager.Visible = false;
	//    btnManager_Hide.Visible = false;
	//    btnManager_Show.Visible = true;
	//}
}
