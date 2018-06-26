using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.XtraPivotGrid;
using DevExpress.Web.Data;
using uwac;
using System.Collections;

public partial class DataProject_SubjSets : System.Web.UI.Page
{

	private List<string> selected_measlist;
	private List<string> selected_varlist;
	private List<string> selected_subjlist;

	private int numsubj;

	#region Page Setup
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = Master.Master_studyID.ToString();
		ViewState["subjNeedBind"] = "true";

	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("SubjSets.aspx");
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		Debug.Print("Page_Load " + System.DateTime.Now.ToString());

		if (!IsPostBack)
		{
			DataTable dt = GetSubjSets();
			gridSets.DataSource = dt;
			gridSets.DataBind();

		}
		else
		{
			Debug.Print("   --- is Postback " + System.DateTime.Now.ToString());

			gridSets.DataSource = Session["subjsets"];
			gridSets.DataBind();

		}

		
		Debug.Print("   --- Page_Load complete " + System.DateTime.Now.ToString());
	}
	#endregion

	


	#region User Controls

	protected void btnNew_OnClick(object sender, EventArgs e)
	{
		Response.Redirect("SubjSet.aspx");
	}
	
	protected void btnProjects_OnClick(object sender, EventArgs e)
	{
		Response.Redirect("Index.aspx");
	}

	#endregion




	#region Retrieve data from DB


	protected DataTable GetSubjSets()
	{


		string sqlcode = "select ab.*, coalesce(n_dataproj, 0) n_dataproj from " + 
			"( select a.subjset_pk, a.studyID, a.subjset, a.subjsetdetails, count(*) as nsubj, a.created, a.createdBy " +
			" from dp.SubjSet a " +
			" join dp.Subj b ON a.subjset_pk = b.subjset_pk " +
			" where studyID = " + Master.Master_studyID.ToString() +
			" group by a.subjset_pk, a.studyID, a.subjset, a.subjsetdetails, a.created, a.createdBy) ab " +
			" left join (select subjset_pk, count(*) n_dataproj from dp.DataProject group by subjset_pk) c ON ab.subjset_pk = c.subjset_pk";


		SQL_utils sql = new SQL_utils("data");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		Session["subjsets"] = dt;
		sql.Close();
		return dt;

	}


	#endregion


	protected void gridSets_OnCommandButtonInitialize(object sender, ASPxGridCommandButtonEventArgs e)
	{
		string n_dataproj = gridSets.GetRowValues(e.VisibleIndex, new string[] { "n_dataproj" }).ToString();

		if (n_dataproj=="0")
		{  // some condition
		   // hide the Edit button
			if (e.Text == "Delete") e.Visible = true;
		} else {
			if (e.Text == "Delete") e.Visible = false;
		}
	}

	protected void gridSets_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
	{
		var keys = e.Keys;
		ICollection valueCollection = e.Keys.Values;
		int[] vals = new int[e.Keys.Count];
		valueCollection.CopyTo(vals, 0);

		int subjset_pk = Convert.ToInt32(vals[0]);

		int i = gridSets.FindVisibleIndexByKeyValue(e.Keys[gridSets.KeyFieldName]);
		Control c = gridSets.FindDetailRowTemplateControl(i, "gridSets");
		e.Cancel = true;

		SQL_utils sql = new SQL_utils("data");

		int n = sql.IntScalar_from_SQLstring("select count(*) from dp.dataproject where subjset_pk = " + subjset_pk.ToString());

		if (n==0)
		{
			string sql1 = "delete from dp.Subj where subjset_pk = " + subjset_pk;
			sql.NonQuery_from_SQLstring(sql1);
			string sql2 = "delete from dp.SubjSet where subjset_pk = " + subjset_pk;
			sql.NonQuery_from_SQLstring(sql2);
		}


		DataTable dt = GetSubjSets();

		gridSets.DataSource = dt;
		gridSets.DataBind();

		sql.Close();

	}

	protected void gridSets_RowDeleted(object sender, ASPxDataDeletedEventArgs e)
	{
		GetSubjSets();

		Response.Redirect("SubjSets.aspx");
	}

}