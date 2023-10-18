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

public partial class AC_Attendance : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_Init(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //gv_devices.FilterExpression = "[Archived] = Unchecked";
        }
    }

    protected void gvcrud_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
    {
        ASPxGridView gv = (ASPxGridView)sender;

        SQL_utils sql = new SQL_utils("backend");
        int current_max_eventpk = sql.IntScalar_from_SQLstring("select max(id) from att.Events");

        //if (gv.ClientInstanceName == "staffevent" | gv.ClientInstanceName == "staffproperty")
        //{
        //    e.NewValues.Add("staffpk", Request.QueryString["staffpk"]);
        //}

        gvCRUD.gvcrud_OnRowInserting((ASPxGridView)sender, e, "backend", "att");

        ((ASPxGridView)sender).JSProperties["cpUpdate"] = true;
    }


    protected void gvcrud_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		string tbl = gv.ClientInstanceName;
		gvCRUD.gvcrud_OnRowUpdating(gv, e, "backend", tbl, "att");

		if (gv.ClientInstanceName == "events")
		{
			gv_events.DataBind();
		}
	

	}


    protected void gvcrud_OnRowDeleting(object sender, ASPxDataDeletingEventArgs e)
    {

        string key = e.Keys[0].ToString();

        // Delete the staffevents and staffproperties first
        SQL_utils sql = new SQL_utils("backend");

        string sqlcode = String.Format("update att.Events set staffpk = NULL where DeviceId = {0}", key);
        sql.NonQuery_from_SQLstring(sqlcode);

        gv_events.JSProperties["cpIsUpdated"] = gv_events.ClientInstanceName.ToString();
        gv_events.CancelEdit();
        e.Cancel = true;



    }


}