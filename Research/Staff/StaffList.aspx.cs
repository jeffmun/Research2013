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

public partial class Staff_StaffList : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{

    //    string last = txtLast.Text;

    //    if(last != "")
    //    {
    //        SQL_utils sql = new SQL_utils("backend");
    //        string sqlcode = String.Format("insert into stf.staff (last_name) values ('{0}')", last);
    //        sql.NonQuery_from_SQLstring(sqlcode);
    //        sql.Close();

    //        gv_staff.DataBind();
    //    }

    //}


    protected void gvcrud_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
    {
        ASPxGridView gv = (ASPxGridView)sender;

        SQL_utils sql = new SQL_utils("backend");
        int current_max_staffpk = sql.IntScalar_from_SQLstring("select max(staffpk) from stf.staff");

        //if (gv.ClientInstanceName == "staffevent" | gv.ClientInstanceName == "staffproperty")
        //{
        //    e.NewValues.Add("staffpk", Request.QueryString["staffpk"]);
        //}

        gvCRUD.gvcrud_OnRowInserting((ASPxGridView)sender, e, "backend", "stf");

        ((ASPxGridView)sender).JSProperties["cpUpdate"] = true;

    }


    protected void gvcrud_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		string tbl = gv.ClientInstanceName;
		gvCRUD.gvcrud_OnRowUpdating(gv, e, "backend", tbl, "stf");

		if (gv.ClientInstanceName == "staff")
		{
			gv_staff.DataBind();
		}
	

	}


    protected void gvcrud_OnRowDeleting(object sender, ASPxDataDeletingEventArgs e)
    {

        string key = e.Keys[0].ToString();

        // Delete the staffevents and staffproperties first
        SQL_utils sql = new SQL_utils("backend");

        string sqlcode = String.Format("update stf.staff set is_deleted = 1, updated=getdate(), updatedby=sec.systemuser() where staffpk = {0}", key);
        sql.NonQuery_from_SQLstring(sqlcode);

        gv_staff.JSProperties["cpIsUpdated"] = gv_staff.ClientInstanceName.ToString();
        gv_staff.CancelEdit();
        e.Cancel = true;



    }


}