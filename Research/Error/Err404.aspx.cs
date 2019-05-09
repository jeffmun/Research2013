using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Error_Err404 : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{



		if (Request.QueryString["aspxerrorpath"] != null)
		{
			string aspxerrorpath = Request.QueryString["aspxerrorpath"];


				lblerror.Text = String.Format("Name of page not found: {0}",aspxerrorpath);

		}

	}
}