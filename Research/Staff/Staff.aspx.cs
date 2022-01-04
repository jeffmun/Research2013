using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;
using DevExpress;
using DevExpress.Web;
using DevExpress.Web.Data;

public partial class Staff_Staff : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }




	protected void gvcrud_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;

		SQL_utils sql = new SQL_utils("backend");
		int current_max_staffpk = sql.IntScalar_from_SQLstring("select max(staffpk) from stf.staff");


		if (gv.ClientInstanceName == "staffevent" | gv.ClientInstanceName == "staffproperty")
        {
            e.NewValues.Add("staffpk", Request.QueryString["staffpk"]);
        }
	

		gvCRUD.gvcrud_OnRowInserting((ASPxGridView)sender, e, "backend", "stf");

		((ASPxGridView)sender).JSProperties["cpUpdate"] = true;

    }

	protected void gvcrud_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		string tbl = gv.ClientInstanceName;
		gvCRUD.gvcrud_OnRowUpdating(gv, e, "backend", tbl, "stf" );

		if (gv.ClientInstanceName == "staff" )
		{
			gv_staff.DataBind();
		}
		else if (gv.ClientInstanceName == "staffevent" )
		{
			gv_staffevent.DataBind();
		}
		else if ( gv.ClientInstanceName == "staffproperty")
		{
			gv_staffproperty.DataBind();
		}

	}

	protected void gvcrud_OnRowDeleting(object sender, ASPxDataDeletingEventArgs e)
	{
		gvCRUD.gvcrud_OnRowDeleting((ASPxGridView)sender, e, "backend", "stf");

	}



}