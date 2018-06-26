using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;
using DataEntryFramework3;

public partial class AutismCenterResearch_DataEntryForms_Common_CurrChecklist_CurrChecklist : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		lblNewrec.Text = "";
	}
	protected void Page_PreRender(object sender, EventArgs e)
	{

		DataEntryController dec = (DataEntryController)this.DataEntryController1;
		int smID = dec.StudyMeasID;


		 btnDuplicate.Visible = (smID == 4984) ? true : false;

		if (Request.QueryString["pk"] != null)
		{
			SQL_utils sql = new SQL_utils("data");
			int db_smID = sql.IntScalar_from_SQLstring("select studymeasID from all_currchecklist where ccl_pk = " + Request.QueryString["pk"]);

			if (db_smID == 4984) btnDuplicate.Visible = true;
			sql.Close();
		}

	}



	protected void btnDuplicate_click(Object sender, EventArgs e)
	{

		SQL_utils sql = new SQL_utils("data");

		DataEntryController dec = (DataEntryController)this.DataEntryController1;
		string tblname = dec.DatabaseTable;
		var smID = dec.StudyMeasID;
		var pkfld = dec.PrimaryKeyField;
		int pkval = dec.PrimaryKeyVal;
		string id = dec.StudySubjectIDString;
		int indexnum = dec.StudyMeasureIndexnum;


		DataTable dtflds = sql.DataTable_from_SQLstring("select fldname from def.fld where tblpk = " + Environment.NewLine +
			" (select tblpk from def.tbl where tblname='" + tblname + "') and fldname not in ('" + pkfld + "')");

		int maxindexnum = sql.IntScalar_from_SQLstring("select max(indexnum) from " + tblname + Environment.NewLine +
			" where id = '" + id + "' and studymeasID=" + smID.ToString());
		int nextindexnum = maxindexnum + 1;

		List<string> flds = dtflds.AsEnumerable().Select(f => f.Field<string>("fldname")).ToList();

		string flds_csv = String.Join(",",flds).ToLower();

		string newflds_csv = flds_csv.Replace(",studymeasid,", ",4984 as studymeasid,");
		newflds_csv = newflds_csv.Replace(",indexnum,", "," + nextindexnum.ToString() + " as indexnum,");

		string sqlcode = String.Format("insert into all_currchecklist({0}) " + Environment.NewLine +
			" select {1} " + Environment.NewLine +
			" from all_currchecklist where ccl_pk={2}"
				, flds_csv, newflds_csv, pkval);

		sql.NonQuery_from_SQLstring(sqlcode);

		int maxindexnum2 = sql.IntScalar_from_SQLstring("select max(indexnum) from " + tblname + Environment.NewLine +
			" where id = '" + id + "' and studymeasID=" + smID.ToString());

		if (maxindexnum2 > maxindexnum) lblNewrec.Text = String.Format("indexnum={0} inserted", maxindexnum2);

		sql.Close();

	}
}