using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Library_Pub : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void gv_pubs_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildInsertSqlCode(e, "tblPub", "backend", "dbo");
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void gv_pubs_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildUpdateSqlCode(e, "tblPub", "backend", "dbo");
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void gv_pubs_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildDeleteSqlCode(e, "tblPub", "backend", "dbo");
		gv.CancelEdit();
		e.Cancel = true;
	}


	protected void gv_pubvar_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildInsertSqlCode(e, "tblPubVar", "backend", "dbo");
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void gv_pubvar_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildUpdateSqlCode(e, "tblPubVar", "backend", "dbo");
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void gv_pubvar_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildDeleteSqlCode(e, "tblPubVar", "backend", "dbo");
		gv.CancelEdit();
		e.Cancel = true;
	}



}