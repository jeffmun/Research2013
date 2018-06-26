using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tracking_Help_Tracking : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

		string qs = Request.QueryString["ent"];

		if(String.IsNullOrEmpty(qs))
		{
			btnReturn.Visible = false;
		}
		else
		{
			btnReturn.Text = "Return to " + qs;
		}

	}

	protected void btn_Click(object sender, EventArgs e)
	{
		string qs = Request.QueryString["ent"];

		switch(qs){
			case "Measures":
				Response.Redirect("Measures.aspx");
				break;
			case "Actions":
				Response.Redirect("Actions.aspx");
				break;
			case "Subjects":
				Response.Redirect("Subjects.aspx");
				break;

		}
	}
}