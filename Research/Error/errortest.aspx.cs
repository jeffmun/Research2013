using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Error_errortest : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{


	}

	protected void btnError_OnClick(object sender, EventArgs e)
	{
		throw new Exception("testing the error!");

	}
}