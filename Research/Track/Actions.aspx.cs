using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.Web.Data;
using DevExpress.XtraPivotGrid;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.Services;
using uwac;
using uwac.trk;


public partial class Tracking_Actions : System.Web.UI.Page
{
	private string ID;
	private string studyaction_csv;
	private string tp_csv;
	private string group_csv;
	private string actionstatus_csv;
	private string subjstatus_csv;
	private string DEstatus_csv;
	private string IncludeREL;

	#region Page Events
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = Master.Master_studyID.ToString();
	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("Actions.aspx");
	}

	protected void Page_Load(object sender, EventArgs e)
	{

		bool isCallback = IsCallback;
		bool isPostback = IsPostBack;


		if (!IsCallback && !IsPostBack)
		{
			LoadEntities();
		}
		sliderValue.Value = Master.Colorlevel.ToString();

	}


	#endregion




	#region Setup Controls 
	//protected void CboMS_Init(object sender, EventArgs e)
	//{
	//	ASPxComboBox CboMS = (ASPxComboBox)sender;
	//	//GridViewDataItemTemplateContainer templateContainer = (GridViewDataItemTemplateContainer)CboMS.NamingContainer;
	//	GridViewEditFormLayoutItemTemplateContainer templateContainer = (GridViewEditFormLayoutItemTemplateContainer)CboMS.NamingContainer;

	//	CboMS.ClientInstanceName = string.Format("cboMS_{0}", templateContainer.VisibleIndex);
	//	CboMS.ClientSideEvents.SelectedIndexChanged = string.Format("function(s, e) {{ OnSelectedIndexChanged(s, e, {0}); }}", templateContainer.VisibleIndex);

	//	CboMS.DataSourceID = "sqlMS";
	//	CboMS.TextField = "MeasStatus";
	//	CboMS.ValueField = "MeasStatusID";
	//	CboMS.DataBind();

	//	CboMS.Value = templateContainer.Grid.GetRowValues(templateContainer.VisibleIndex, "MeasStatusID");

	//}


	protected void CboAS_Init(object sender, EventArgs e)
	{
		ASPxComboBox CboAS = (ASPxComboBox)sender;
		GridViewEditFormLayoutItemTemplateContainer templateContainer = (GridViewEditFormLayoutItemTemplateContainer)CboAS.NamingContainer;
		CboAS.ClientInstanceName = string.Format("cboAS_{0}", templateContainer.VisibleIndex);
		CboAS.Callback += CboAS_Callback;

		string str_actiontypeID = templateContainer.Grid.GetRowValues(templateContainer.VisibleIndex, "ActionTypeID").ToString();
		string str_asID = templateContainer.Grid.GetRowValues(templateContainer.VisibleIndex, "ActionStatusID").ToString();


		CboAS.DataSourceID = "sqlAS_by_AT";
		CboAS.TextField = "actionstatus";
		CboAS.ValueField = "actionstatusID";

		int actiontypeID;
		bool actiontypeID_is_int = int.TryParse(str_actiontypeID, out actiontypeID);
		if (actiontypeID_is_int) FillCboAS(CboAS, actiontypeID.ToString());

	}

	private void CboAS_Callback(object sender, CallbackEventArgsBase e)
	{
		ASPxComboBox cboas = (ASPxComboBox)sender;
		string ms = e.Parameter;

		if (string.IsNullOrEmpty(ms)) return;

		FillCboAS(cboas, ms);
	}


	protected void FillCboAS(ASPxComboBox cbo, string actiontypeID)
	{
		if (string.IsNullOrEmpty(actiontypeID)) return;

		SqlDataSource sqlAS_by_AT = (SqlDataSource)cbo.NamingContainer.FindControl("sqlAS_by_AT");
		sqlAS_by_AT.SelectParameters[0].DefaultValue = actiontypeID;
		cbo.DataBind();
	}



	#endregion



	#region User Initiated Events

	protected void ddlEntity_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		ASPxComboBox cbo = (ASPxComboBox)sender;
		string entity = cbo.SelectedItem.Value.ToString();

		switch (entity){
			case "Subjects":
				Response.Redirect("Subjects.aspx");
				break;
			case "Measures":
				Response.Redirect("Measures.aspx");
				break;
		}

	}


	protected void btnLoad_OnClick(object sender, EventArgs e)
	{
		LoadEntities();
	}



	protected void btnHelp_Click(object sender, EventArgs e)
	{
		Response.Redirect("Help_Tracking.aspx?ent=Actions");
	}


	#endregion

	protected DataTable getDataforCombobox(string sqlcode)
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
		return dt;
	}


	protected void LoadEntities()
	{
		ViewState["needBind"] = "true";


		switch (rblObj.Value.ToString())
		{
			case "Table":

				gvENT.DataBind();
				gvENT.Visible = true;
				pivotENT.Visible = false;
				break;
			case "Grid Details":
				gvENT.Visible = false;
				pivotENT.Visible = true;
				pivotENT.DataBind();

				pivotENT.Fields["fldID"].SetAreaPosition(PivotArea.ColumnArea, 0);
				pivotENT.Fields["fldGroupName"].SetAreaPosition(PivotArea.ColumnArea, 1);
				pivotENT.Fields["fldSubjStatus"].SetAreaPosition(PivotArea.ColumnArea, 2);

				pivotENT.Fields["fldGroupName"].Visible = true;
				pivotENT.Fields["fldSubjStatus"].Visible = true;

				pivotENT.Fields["fldActionStatus"].SetAreaPosition(PivotArea.DataArea, 0);
				pivotENT.Fields["fldActionStatus"].SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Min;

				pivotENT.Fields["fldtimepoint_text"].SetAreaPosition(PivotArea.RowArea, 0);
				pivotENT.Fields["fldActionText"].SetAreaPosition(PivotArea.RowArea, 1);
				pivotENT.Fields["fldActionText"].Visible = true;

				break;
			case "Grid Counts":
				gvENT.Visible = false;
				pivotENT.Visible = true;


				pivotENT.Fields["fldID"].SetAreaPosition(PivotArea.DataArea, 0);
				pivotENT.Fields["fldID"].SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Count;



				pivotENT.Fields["fldActionStatus"].SetAreaPosition(PivotArea.RowArea, 0);
				pivotENT.Fields["fldtimepoint_text"].SetAreaPosition(PivotArea.ColumnArea, 0);
				pivotENT.Fields["fldGroupName"].SetAreaPosition(PivotArea.ColumnArea, 1);


				pivotENT.Fields["fldActionText"].Visible = false;
				pivotENT.Fields["fldSubjStatus"].Visible = false;

				pivotENT.OptionsView.ShowColumnGrandTotals = true;
				pivotENT.OptionsView.ShowRowGrandTotals = true;

				pivotENT.DataBind();
				break;
		}
	}

		#region Main Grid Events

		protected void gvENT_DataBinding(object sender, EventArgs e)
	{

		if (ViewState["needBind"].ToString() == "true")
		{

			UpdateSelectParameters();

			DataTable dt = ENT_GetData("gvENT", studyaction_csv, tp_csv.ToString(), group_csv.ToString(), actionstatus_csv.ToString(), subjstatus_csv.ToString());

			if (dt.Rows.Count > 0)
			{
				gvENT.DataSource = Session["ENT_data"];
				gvENT.DataBind();
			}
			
			if (studyaction_csv + tp_csv.ToString() + group_csv.ToString() + actionstatus_csv.ToString() + subjstatus_csv.ToString() == "")
			{ btnLoad.Text = "Load Actions"; }
			else { btnLoad.Text = "Load Selected Actions"; }
		}
		else 
		{
			gvENT.DataSource = Session["ENT_data"];
		}

	}


	protected void gvENT_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;

		//Get and Process the list of selected records in order to populate the list of pkvals
		#region process selected records
		var selected_keys = gvENT.GetSelectedFieldValues("actionID");


		ASPxCheckBox chkAllSelected = gv.FindEditFormLayoutItemTemplateControl("chkUpdateAllSelected") as ASPxCheckBox;
		bool updateALLSelected = chkAllSelected.Checked;


		List<int> pkvals = new List<int>();

		foreach (object key in e.Keys.Values)
		{
			int ikey;
			bool isint = int.TryParse(key.ToString(), out ikey);
			if (isint) pkvals.Add(ikey);
		}

		//Add the other selected rows to the update if the user has selected the "Update All" checkbox
		if (selected_keys.Count > 0 && updateALLSelected)
		{
			foreach (object k in selected_keys)
			{
				int ikey;
				bool isint = int.TryParse(k.ToString(), out ikey);
				if (!pkvals.Contains(ikey)) pkvals.Add(ikey);
			}
		}
		#endregion


		//Custom: retrieve specific data from the grid
		//Get the data from the ComboBoxes
		ASPxComboBox cboAS = (ASPxComboBox)gvENT.FindEditFormLayoutItemTemplateControl("CboAS");

		e.NewValues["actionstatusID"] = cboAS.Value;

		ASPxMemo notes = (ASPxMemo)gvENT.FindEditFormLayoutItemTemplateControl("notesEditor");
		e.NewValues["Notes"] = notes.Value;


		string result = dataops.dxGrid_UpdateData("actionID", pkvals, e.NewValues, "backend", "dbo", "tblAction");
		gvENTstatus.Text = result;

		gv.CancelEdit();
		e.Cancel = true;

		gvENT.DataBind();
	}

	protected void CountNumSelectedRecords(object sender, EventArgs e)
	{
		ASPxLabel lblNumSelected = (ASPxLabel)sender; // gvM.FindEditFormLayoutItemTemplateControl("lblNumSelected");
		int num = gvENT.GetSelectedFieldValues("actionID").Count();
		GridViewEditFormLayoutItemTemplateContainer template = (GridViewEditFormLayoutItemTemplateContainer)lblNumSelected.NamingContainer;
		ASPxGridView gv = (ASPxGridView)template.Grid;

		ASPxCheckBox chkall = (ASPxCheckBox)gv.FindControlRecursive("chkUpdateAllSelected");

		if (lblNumSelected != null & num > 0)
		{
			lblNumSelected.Text = num.ToString() + " records";
			chkall.ClientVisible = true;
		}
		else
		{
			lblNumSelected.Text = "";
			chkall.ClientVisible = false;

		}
	}


	protected void gvENT_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
	{
		
		if (e.DataColumn.FieldName == "ActionStatus")
		{

			int colorlevel = uwac.trk.color.GetColorLevel();

			string x = e.Cell.Text;
			Color newcolor = color.GetStatus_Color(color.StatusType.Action, e.CellValue.ToString(), colorlevel);
			//Color newcolor = GetActionStatus_Color(x);
			e.Cell.BackColor = newcolor;
			e.Cell.ForeColor = Color.Black;
		}
	}

	#endregion


	protected void UpdateSelectParameters()
	{
		studyaction_csv = uwac.trk.dataops.GetCSV(gridLkupAction.GridView.GetSelectedFieldValues(gridLkupAction.KeyFieldName));
		studyaction_csv = (studyaction_csv == null) ? "" : studyaction_csv;

		tp_csv = (tokTimepoint.Value == null) ? "" : tokTimepoint.Value.ToString();
		group_csv = tokGroup.Value.ToString();
		actionstatus_csv = tokActionStatus.Value.ToString();
		subjstatus_csv = tokSubjStatus.Value.ToString();
		
	}



	#region pivotENT



	protected void pivotENT_DataBinding(object sender, EventArgs e)
	{
		//if (ViewState["needBind"] != null && (bool)ViewState["needBind"])
		if (ViewState["needBind"].ToString() == "true")
		{
			UpdateSelectParameters();

			DataTable dt = ENT_GetData("pivotENT", studyaction_csv, tp_csv, group_csv, actionstatus_csv, subjstatus_csv);

			if (dt != null)
			{
				if (dt.Rows.Count > 0)
				{
					pivotENT.DataSource = Session["ENT_data"];
				}
			}


			if (studyaction_csv + tp_csv.ToString() + group_csv.ToString() + actionstatus_csv.ToString() + subjstatus_csv.ToString() == "")
			{ btnLoad.Text = "Load Actions"; }
			else { btnLoad.Text = "Load Selected Actions"; }


			//Debug.Print("!!!! pivotENT_DataBinding            pivotENT.RowCount=" + pivotENT.RowCount.ToString());
		}

	}





	protected void pivotENT_OnBeginRefresh(object sender, EventArgs e)
	{
		//Debug.Print("pivotENT_OnBeginRefresh              pivotENT.RowCount=" + pivotENT.RowCount.ToString());
		pivotENT.DataSource = Session["ENT_data"];
		pivotENT.DataBind();
	}



	protected void pivotENT_CustomCellDisplayText(object sender, DevExpress.Web.ASPxPivotGrid.PivotCellDisplayTextEventArgs e)
	{

	}


	protected void pivotENT_CustomCellStyle(object sender, PivotCustomCellStyleEventArgs e)
	{

		if (e.ColumnValueType == PivotGridValueType.Value)
		{
			if (rblObj.Value.ToString() != "Grid Counts")
			{

				if (e.Value != null)
				{
					Color cellcolor = color.GetStatus_Color(color.StatusType.Action, e.Value.ToString(), color.GetColorLevel());
					e.CellStyle.BackColor = cellcolor;
				}
			}

			else
			{
				var rowfield = e.RowField;
				if (rowfield != null)
				{
					var v = e.GetFieldValue(e.RowField).ToString();
					if (v != null)
					{
						Color cellcolor = color.GetStatus_Color(color.StatusType.Action, v.ToString(), color.GetColorLevel());
						e.CellStyle.BackColor = cellcolor;
					}
				}
			}
		}

	}

	#endregion



	#region Get Data from DB


//	 A_GetData("pivotENT", studyaction_csv, tp_csv, group_csv, actionstatus_csv, subjstatus_csv, DEstatus_csv);

	protected DataTable ENT_GetData(string obj, string studyaction_csv, string tp_csv, string group_csv, string actionstatus_csv, string subjstatus_csv)
	{


		SQL_utils sql = new SQL_utils("backend");
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
		ps.Add(sql.CreateParam("studyactionID_csv", studyaction_csv, "text"));
		ps.Add(sql.CreateParam("tpID_csv", tp_csv.ToString(), "text"));
		ps.Add(sql.CreateParam("groupID_csv", group_csv.ToString(), "text"));
		ps.Add(sql.CreateParam("actionstatusID_csv", actionstatus_csv.ToString(), "text"));
		ps.Add(sql.CreateParam("subjstatusID_csv", subjstatus_csv.ToString(), "text"));

		DataTable dt = sql.DataTable_from_ProcName("trk.spGetSelected_A", ps);


		int nrows = 0;
		int nsubjects = 0;
		if (dt != null)
		{
			nrows = dt.Rows.Count;
			nsubjects = dt.AsEnumerable().Select(f => f.Field<string>("ID")).Distinct().Count();
		}
		Debug.Print(String.Format(" #### I have gathered {0} records at {1} #### ", nrows, System.DateTime.Now.ToString()));


		ViewState["ENT_nrecs"] = nrows.ToString();
		gvENTstatus.Text = nrows.ToString() + " actions for " + nsubjects.ToString() + " subjects";

		if (nrows == 0)
		{
			gvENT.Visible = false;
			pivotENT.Visible = false;
		}
		else
		{
			Session["ENT_data"] = dt;
			ViewState["needBind"] = "false";

			switch (obj)
			{
				case "gvENT":
					gvENT.DataSource = dt;
					gvENT.Visible = true;
					pivotENT.Visible = false;

					break;
				case "pivotENT":
					pivotENT.DataSource = dt;
					gvENT.Visible = false;
					pivotENT.Visible = true;

					break;
			}
		}



		gvENT.DataSource = dt;

		sql.Close();

		return dt;
	}




	#endregion

	[WebMethod]
	public static void SetColorLevel(int x)
	{
		dataops.SetColorLevel(x);
	}


}