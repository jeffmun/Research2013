using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;

using AutismCenterBase.Security;

public partial class PopUp : System.Web.UI.MasterPage
{
	AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();

	private SqlConnection oConn;
	private string sCallingPage;

	public SqlConnection SqlConn
	{
		get { return oConn; }
		set { this.oConn = value; }
	}

	public AutismCenterBase.Security.Login AutismLogin
	{
		get { return oLogin; }
	}

	protected void Page_Init(object sender, EventArgs e)
	{
		if (Request.Browser.Crawler) { Response.End(); }

		oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString());
		oConn.Open();
	}

	protected void Page_Unload(object sender, EventArgs e)
	{
		if (oConn != null)
		{
			if (oConn.State == ConnectionState.Open)
				oConn.Close();
		}
	}

	protected void Page_Load(object sender, EventArgs e)
    {
		if (Request.Cookies["UserProfile"] == null) { oLogin.SetProfileCookie(); }

		//spnSessionInfo.InnerHtml = Request.ServerVariables["AUTH_USER"];
	}
}