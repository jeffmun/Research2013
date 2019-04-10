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
		{
			if (e.CellValue != null)
				e.Cell.ToolTip = gridProjects.GetRowValues(e.VisibleIndex, "projSummary").ToString() + ": " + e.CellValue.ToString();
		}
		else if (e.DataColumn.FieldName == "isDeleted")
		{
			//if (e.CellValue.ToString() == "1")
			//{
			//	e.Cell.Controls[0].Visible = false;
			//	e.Cell.Controls[1].Visible = true;
			//	e.Cell.BackColor = Color.Red;
			//} else{
			//	e.Cell.Controls[0].Visible = true;
			//	e.Cell.Controls[1].Visible = false;
			//}

		}
	}


	protected void callbackPanel_Callback(object source, DevExpress.Web.CallbackEventArgsBase e)
	{
		SQL_utils sql = new SQL_utils("data");
		string html = sql.StringScalar_from_SQLstring("select projSummary from dp.DataProject where dataproj_pk=" + e.Parameter.ToString());
		
		
		litText.Text = html;
		sql.Close();

	}

	protected void gridProjects_OnCustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
	{
		if (e.VisibleIndex == -1) return;

		ASPxGridView grid = (ASPxGridView)sender;
		string isDeleted = grid.GetRowValues(e.VisibleIndex, "isDeleted").ToString();


		DevExpress.Utils.DefaultBoolean showDel = (isDeleted == "0") ? DevExpress.Utils.DefaultBoolean.True : DevExpress.Utils.DefaultBoolean.False;
		DevExpress.Utils.DefaultBoolean showUndel = (isDeleted == "1") ? DevExpress.Utils.DefaultBoolean.True : DevExpress.Utils.DefaultBoolean.False;

		if (e.ButtonID == "btnDelete") e.Visible = showDel;
		if (e.ButtonID == "btnUndelete") e.Visible = showUndel;

	}


	protected void gridProjects_OnCustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
	{
		Debug.WriteLine("**** gridProjects_OnCustomButtonCallback");

		ASPxGridView grid = (ASPxGridView)sender;
		string keyValue = grid.GetRowValues(e.VisibleIndex, "dataproj_pk").ToString();
		//gv.JSProperties["cpKeyValue"] = keyValue;

		if (e.ButtonID == "btnDelete")
		{

			SQL_utils sql = new SQL_utils("data");
			sql.NonQuery_from_SQLstring("update dp.DataProject set IsDeleted=1, deleted=getdate(), deletedBy=sec.systemuser()  where dataproj_pk = " + keyValue);
			sql.Close();

			DataTable dt = GetProjects();
			gridProjects.DataSource = dt;
			gridProjects.DataBind();
		}
		else if (e.ButtonID == "btnUndelete")
		{

			SQL_utils sql = new SQL_utils("data");
			sql.NonQuery_from_SQLstring("update dp.DataProject set IsDeleted=0, deleted=null, deletedBy=null  where dataproj_pk = " + keyValue);
			sql.Close();

			DataTable dt = GetProjects();
			gridProjects.DataSource = dt;
			gridProjects.DataBind();
		}


	}

	//protected void btnDeleteDataproject_Command(object sender, CommandEventArgs e)
	//{
	//	Debug.WriteLine("**** btnDeleteDataproject_Command");
	//	if (e.CommandName == "DeleteDataproject")
	//	{

	//		SQL_utils sql = new SQL_utils("data");

	//		string dataproj_pk = e.CommandArgument.ToString();

	//		sql.NonQuery_from_SQLstring("update dp.Datafile set IsDeleted=1, deleted=getdate(), deletedBy=system_user  where dataproj_pk = " + dataproj_pk );


	//		sql.Close();

	//		DataTable dt = GetProjects();
	//		gridProjects.DataSource = dt;
	//		gridProjects.DataBind();
	//	}


	//}


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

	protected void chkShowDeleted_CheckChanged(object sender, EventArgs e)
	{

		DataTable dt = GetProjects();
		gridProjects.DataSource = dt;
		gridProjects.DataBind();
	}

	protected DataTable GetProjects()
	{

		bool showdeleted = chkShowDeleted.Checked;

		string sqlcode = (showdeleted) ?
			"select * from dp.vwDataProject3 where  studyID = " + Master.Master_studyID.ToString() :
			"select * from dp.vwDataProject3 where isDeleted=0 and studyID = " + Master.Master_studyID.ToString();

		SQL_utils sql = new SQL_utils("data");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		Session["dataprojects"] = dt;
		sql.Close();
		return dt;

	}


	#endregion



}