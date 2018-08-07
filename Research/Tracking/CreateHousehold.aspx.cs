using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.Internal;
using DevExpress.Web;
using uwac;


public partial class Tracking_CreateHousehold : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void NameTextBox_Validation(object sender, ValidationEventArgs e)
	{
		if ((e.Value as string).Length < 2)
		{
			e.IsValid = false;
		}
		else 
		{
			CreateHousehold();
		}

	}

	protected void CreateHousehold()
	{

		//Continue with your logic
		SQL_utils sql = new SQL_utils("backend");

		int hhID = sql.IntScalar_from_SQLstring("exec hh.spHousehold_INSERT '" + NameTextBox.Text + "'");
		sql.Close();

		if (hhID > 0)
		{

			Response.Redirect("Household2.aspx?hhID=" + hhID.ToString());

		}

		//lblEnterName.Visible = false;
		//if (txtNewHHname.Text == "New Household Name")
		//{
		//    lblEnterName.Visible = true;

		//    //ExecBeforeLoad("alert('some value')"); ShowAlert("Enter a name for
		//    //the new household.");
		//}
		//else if (txtNewHHname.Text != "" )
		//{

		//}

	}


}