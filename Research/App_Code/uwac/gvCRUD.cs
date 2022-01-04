using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using DevExpress.Web;
using DevExpress.Web.Data;
using DevExpress.WebUtils;
using uwac;

/// <summary>
/// Summary description for gvCRUD
/// </summary>
/// 
namespace uwac
{
	public static class gvCRUD
	{
		//public gvCRUD()
		//{
		//	//
		//	// TODO: Add constructor logic here
		//	//
		//}



		#region CRUD
		public static void gvcrud_OnRowInserting(ASPxGridView gv, ASPxDataInsertingEventArgs e)
		{
			Debug.WriteLine(" ***** grid_OnRowInserting");
			//ASPxGridView gv = (ASPxGridView)sender;

			SQL_utils sql = new SQL_utils("Data");

			string gvname = gv.ClientInstanceName;
			DxDbOps.BuildInsertSqlCode(e, gvname, "Data");

			gv.JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
			gv.CancelEdit();
			e.Cancel = true;
		}

		public static void gvcrud_OnRowInserting(ASPxGridView gv, ASPxDataInsertingEventArgs e, string dbname)
		{
			Debug.WriteLine(" ***** grid_OnRowInserting");
			//ASPxGridView gv = (ASPxGridView)sender;

			//SQL_utils sql = new SQL_utils(dbname);

			string gvname = gv.ClientInstanceName;
			DxDbOps.BuildInsertSqlCode(e, gvname, dbname);

			gv.JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
			gv.CancelEdit();
			e.Cancel = true;
		}

		public static void gvcrud_OnRowInserting(ASPxGridView gv, ASPxDataInsertingEventArgs e, string dbname, string schemaname)
		{
			Debug.WriteLine(" ***** grid_OnRowInserting");
			//ASPxGridView gv = (ASPxGridView)sender;

			//SQL_utils sql = new SQL_utils(dbname);

			string gvname = gv.ClientInstanceName;
			DxDbOps.BuildInsertSqlCode(e, gvname, dbname, schemaname);

			gv.JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
			gv.CancelEdit();
			e.Cancel = true;
		}



		public static void gvcrud_OnRowUpdating(ASPxGridView gv, ASPxDataUpdatingEventArgs e)
		{
			gvcrud_OnRowUpdating(gv, e, "data", gv.ClientInstanceName,  "dbo");
		}

		public static void gvcrud_OnRowUpdating(ASPxGridView gv, ASPxDataUpdatingEventArgs e, string db, string tbl, string schema)
		{
			Debug.WriteLine(" ***** grid_OnRowUpdating");
			DxDbOps.BuildUpdateSqlCode(e, tbl, db, schema);

			//((ASPxGridView)sender).JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
			gv.JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
			gv.CancelEdit();
			e.Cancel = true;
		}
		public static void gvcrud_OnRowDeleting(ASPxGridView gv, ASPxDataDeletingEventArgs e)
		{
			//ASPxGridView gv = (ASPxGridView)sender;
			string gvname = gv.ClientInstanceName;
			DxDbOps.BuildDeleteSqlCode(e, gvname, "Data");

			gv.JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
			gv.CancelEdit();
			e.Cancel = true;
		}


		public static void gvcrud_OnRowDeleting(ASPxGridView gv, ASPxDataDeletingEventArgs e, string dbname, string schemaname)
		{
			//ASPxGridView gv = (ASPxGridView)sender;
			string gvname = gv.ClientInstanceName;
			DxDbOps.BuildDeleteSqlCode(e, gvname, dbname, schemaname);

			gv.JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
			gv.CancelEdit();
			e.Cancel = true;
		}


		public static void gvcrud_InitNewRow(object sender, ASPxDataInitNewRowEventArgs e)
		{
			Debug.WriteLine(" ***** grid_InitNewRow");

		}
		#endregion

	}
}