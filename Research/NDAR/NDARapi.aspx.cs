using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
//using Newtonsoft.Json.Schema;
using DevExpress.Web;
using DevExpress.Web.Data;
using uwac;


public partial class NDAR_NDARapi : System.Web.UI.Page
{

	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			LoadDataStructures("localDB");
		}
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		LoadDataStructures("localDB"); 
	}




	protected void btnSearchDS_Click(object sender, EventArgs e)
	{
		LoadDataStructures("localDB");
	}

	protected void LoadDataStructures(string source)
	{
		string where = txtWhere.Text;
		DataTable dt = new System.Data.DataTable();
		SQL_utils sql = new SQL_utils("data");
		if (chkInStudy.Checked)
		{
			//UWAutism uwac = new UWAutism();
			//int studyID = uwac.Master_studyID;

			int studyID = sql.GetUserStudyID();

			dt = NDAR.LoadFullDataStructureList(source, where, chkUWview.Checked, studyID);
		}
		else
		{
			dt = NDAR.LoadFullDataStructureList(source, where, chkUWview.Checked);
		}


		string code_no_ndar = String.Format("select * from uwautism_research_backend..tblMeasure where " +
			" measureID in (select measureID from uwautism_research_backend..tblStudyMeas where studyID={0}) and measureID not in " + 
			" ( select measureID from def.Tbl a " +
			" join NDAR_DS b ON a.tblname = b.uwtable  where measureID>0) "
				, Master.Master_studyID);


		DataTable dt_no_ndar = sql.DataTable_from_SQLstring(code_no_ndar);
		sql.Close();

		gridNoNDAR.DataSource = dt_no_ndar;
		gridNoNDAR.DataBind();

		//gvScroll.DataSource = dt;
		//gvScroll.DataBind();


		grid.DataSource = dt;
		grid.DataBind();

		lblN.Text = "No. of Data Structures: " + dt.Rows.Count.ToString();

	}


	protected void SaveAllDataStructures(DataTable dt)
	{
		SQL_utils sql = new SQL_utils();
		SqlParameter p = sql.CreateParam("NDAR_DS", dt);
		sql.NonQuery_from_ProcName("spNDAR_Insert_DS", p);
	}


	////protected void gvScroll_RowCommand(object sender, GridViewCommandEventArgs e)
	//protected void grid_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
	//{
	//	string cmd_name = e.CommandArgs.CommandName;
	//	string cmd_arg = e.CommandArgs.CommandArgument.ToString();
	//	//save DSE here
	//	if (cmd_name == "Import flds")
	//	{


	//		//GridView gv_Fields = new GridView();
	//		//gv_Fields.DataSource = dse;
	//		//gv_Fields.DataBind();

	//		//Panel_dataElements.Controls.Add(gv_Fields);
	//		//Panel_dataElements.Visible = true;
	//	}


	//	//LoadDataStructures("localDB");
	//}



	//protected void gvScroll_RowDataBound(object sender, GridViewRowEventArgs e)
	//{

	//	if (e.Row.RowType == DataControlRowType.DataRow)
	//	{
	//		string txt_n_flds = e.Row.Cells[0].Text;
	//		int n_flds = Convert.ToInt16(txt_n_flds);

	//		string txt_n_uwflds = e.Row.Cells[1].Text;
	//		int n_uwflds = Convert.ToInt16(txt_n_uwflds);

	//		if (n_flds > 0)
	//		{
	//			Button b = (Button)e.Row.FindControl("btnImportFlds");
	//			b.Visible = false;
	//			HyperLink lnkDict = (HyperLink)e.Row.FindControl("linkDict");
	//		}

	//		if(n_uwflds == 0)
	//		{
	//			HyperLink lnkView = (HyperLink)e.Row.FindControl("linkView");
	//			lnkView.Visible = false;
	//		}


	//		//LinkButton lnk1 = (LinkButton)e.Row.FindControl("linkView");
	//		//LinkButton lnk2 = (LinkButton)e.Row.FindControl("linkDict");

	//		//var data = e.Row.DataItem as DataRowView;
	//		//string shortName = data["shortName"].ToString();

	//		////string shortName = e.Row.DataItem["shortName"].ToString();

	//		//lnk1.Attributes.Add("href", "NDARview.aspx?shortName=" + shortName);
	//		//lnk1.Attributes.Add("href", "NDARdict.aspx?shortName=" + shortName);

	//		//lnk1.Attributes.Add("target", "_blank");
	//		//lnk2.Attributes.Add("target", "_blank");

	//	}
	//}


	protected void grid_DataBound(object sender, EventArgs e)
	{
		//Check to see if these have been added
		bool hasCol = (grid.Columns.IndexOf(grid.Columns["CommandColumnGroups"]) != -1) ? true : false;

		if (hasCol)
		{
			grid.Columns.Remove(grid.Columns["CommandColumnGroups"]);
		}

		GridViewCommandColumn col = new GridViewCommandColumn();
		col.Name = "CommandColumnGroups";
		
		GridViewCommandColumnCustomButton but = new GridViewCommandColumnCustomButton();
		but.ID = "btnImportFlds";
		but.Text = "Import flds from NDAR";
		but.Styles.Native = true;
		but.Styles.Style.Font.Size = 10;

		col.CustomButtons.Add(but);
		grid.Columns.Add(col);
		col.Index = 0;
	}


	protected void grid_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
	{
		ASPxGridView grid = (ASPxGridView)sender;

		int n = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "n_flds").ToString());

		if (n > 0)
		{
			e.Visible = DevExpress.Utils.DefaultBoolean.False;
		}

	}


	protected void grid_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
	{

		var ID = e.ButtonID;

		ASPxGridView grid = (ASPxGridView)sender;

		string shortname = grid.GetRowValues(e.VisibleIndex, "shortName").ToString();

		if (!String.IsNullOrEmpty(shortname ))
		{

			SaveDSToDB(shortname);

		}
	}


	protected void btnSave_Click(object sender, EventArgs e)
	{
		DataTable dt = NDAR.LoadFullDataStructureList("NDAR");

		SaveAllDataStructures(dt);
	}

	protected void btnManualImport_Click(object sender, EventArgs e)
	{

		string shortname = txtShortName.Text;
		if (!String.IsNullOrEmpty(shortname))
		{
			SaveDSToDB(shortname);
		}
	}

	protected void SaveDSToDB(string shortname)
	{
		string results = NDAR.SaveToDB(shortname);

	}


	protected void dxgrid_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;


		SQL_utils sql = new SQL_utils("data");

		string uwtbl = e.NewValues["uwtable"].ToString();
		string shortname = e.NewValues["shortName"].ToString();


		string s = String.Format("update NDAR_DS set uwtable='{0}' where shortname='{1}'", uwtbl, shortname);

		sql.NonQuery_from_SQLstring(s);

		grid.DataBind();

		gv.CancelEdit();
		e.Cancel = true;

		
	}

}