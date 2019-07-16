using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;
using uwac.trk;
using DevExpress.Web;

public partial class AC_ValantDoc2 : BasePage //System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

		int x = 0;

		string netid = Master.Master_netid;
		string user = HttpContext.Current.User.Identity.Name.ToString().Replace(@"NETID\","");

		string errormsg = String.Format("Sorry, {0} you do not have permission for this page.  Contact Kathryn Larson with questions.", user);

		List<string> allowedusers = new List<string> { "jeffmun", "freitz", "larsonk", "greenson", "eskandar","ykv", "granathk","sharim2","cathek","matestic" };


		//if(true)
		if(allowedusers.Contains(user))
		{
			grid.Visible = true;
			lblPerm.Visible = false;

		}
		else
		{
			grid.Visible = false;
			lblPerm.Text = errormsg;
			lblPerm.Visible = true;
		}

	}


	protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;

		//Get and Process the list of selected records in order to populate the list of pkvals
		#region process selected records
		var selected_keys = gv.GetSelectedFieldValues("valdocID");



		List<int> pkvals = new List<int>();

		foreach (object key in e.Keys.Values)
		{
			int ikey;
			bool isint = int.TryParse(key.ToString(), out ikey);
			if (isint) pkvals.Add(ikey);
		}

		//Add the other selected rows to the update if the user has selected the "Update All" checkbox
		if (selected_keys.Count > 0 ) 
		{
			foreach (object k in selected_keys)
			{
				int ikey;
				bool isint = int.TryParse(k.ToString(), out ikey);
				if (!pkvals.Contains(ikey)) pkvals.Add(ikey);
			}
		}
		#endregion



		string result = dataops.dxGrid_UpdateData("valdocID", pkvals, e.NewValues, "ValantTJ", "dbo", "valantdocdump");
		
		gv.CancelEdit();
		e.Cancel = true;
		//ViewState["needBind"] = "true";
		gv.DataBind();
	}

	


}