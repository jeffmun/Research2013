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

public partial class DataProject_Index : BasePage  
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
		Response.Redirect("Index.aspx");
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		Debug.Print("Page_Load " + System.DateTime.Now.ToString());

		if (!IsPostBack)
		{
			DataTable dt = GetProjects();
			gridProjects.DataSource = dt;
			gridProjects.DataBind();

		}
		else
		{
			Debug.Print("   --- is Postback " + System.DateTime.Now.ToString());

			gridProjects.DataSource = Session["dataprojects"];
			gridProjects.DataBind();

		}

		
		Debug.Print("   --- Page_Load complete " + System.DateTime.Now.ToString());
	}
	#endregion


	protected void gridProjects_OnRowCommand(object sender, EventArgs e)
	{
		int foo = 0;
	}

	protected void gridProjects_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
	{
		if (e.DataColumn.FieldName == "projTitle")
			if (e.CellValue != null)
				e.Cell.ToolTip = gridProjects.GetRowValues(e.VisibleIndex, "projSummary").ToString() + ": " + e.CellValue.ToString();
	}


	protected void callbackPanel_Callback(object source, DevExpress.Web.CallbackEventArgsBase e)
	{
		SQL_utils sql = new SQL_utils("data");
		string html = sql.StringScalar_from_SQLstring("select projSummary from dp.DataProject where dataproj_pk=" + e.Parameter.ToString());
		
		
		litText.Text = html;
		sql.Close();

	}


	#region User Controls

	protected void btnNew_OnClick(object sender, EventArgs e)
	{
		Response.Redirect("Edit.aspx");
	}

	
	protected void btnSubjSets_OnClick(object sender, EventArgs e)
	{
		Response.Redirect("SubjSets.aspx");
	}

	#endregion




	#region Retrieve data from DB


	protected DataTable GetSubjSets()
	{


		string sqlcode = "select a.subjset_pk, a.studyID, a.subjset, a.subjsetdetails, count(*) as nsubj, a.created, a.createdBy " +
			" from dp.SubjSet a " +
			" join dp.Subj b ON a.subjset_pk = b.subjset_pk " +
			" where studyID = " + Master.Master_studyID.ToString() +
			" group by a.subjset_pk, a.studyID, a.subjset, a.subjsetdetails, a.created, a.createdBy ";


		SQL_utils sql = new SQL_utils("data");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		Session["subjsets"] = dt;
		sql.Close();
		return dt;

	}



	protected DataTable GetProjects()
	{
		SQL_utils sql = new SQL_utils("data");
		DataTable dt = sql.DataTable_from_SQLstring("select * from dp.vwDataProject3 where studyID = " + Master.Master_studyID.ToString());

		Session["dataprojects"] = dt;
		sql.Close();
		return dt;

	}


	#endregion



}