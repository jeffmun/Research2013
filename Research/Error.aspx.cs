using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;

public partial class Error : System.Web.UI.Page
{
	private void Page_Load(object sender, System.EventArgs e)
	{
		if (Request["ErrMsg"] != null)
		{
			pErrMsg.Style["display"] = "";
			pErrMsg.Style["color"] = "#ff0000";
			pErrMsg.InnerHtml = Request["ErrMsg"].ToString() + "<br/><br/>" + Request["ErrSrc"].ToString();
		}
	}}