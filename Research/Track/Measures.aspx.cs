using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.XtraPivotGrid;
using DevExpress.Web.Data;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.Services;
using uwac;
using uwac.trk;
using System.Web.UI;
using DevExpress.XtraPivotGrid.Data;

public partial class Tracking_Measures : System.Web.UI.Page
{
	//private string ID;
	private string meas_csv;
	private string tp_csv;
	private string group_csv;
	private string measstatus_csv;
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
		Response.Redirect("Measures.aspx");
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		//pivotM.FieldValueTemplate = new FieldValueTemplate();
		//pivotM.CellTemplate = new CellTemplate();

		bool isCallback = IsCallback;
		bool isPostback = IsPostBack;

		if (!IsCallback && !IsPostBack)
		{
			LoadEntities();
		}

		if (IsPostBack && Session["M_data"] != null)
		{
		}

		sliderValue.Value = Master.Colorlevel.ToString();
		txtColorLevel.Text = Master.Colorlevel.ToString();

	}


	#endregion


	protected void LoadEntities()
	{
		ViewState["needBind"] = "true";


		switch (rblObj.Value.ToString())
		{
			case "Table":
				gvM.Visible = true;
				pivotM.Visible = false;
				gvM.DataBind();
				break;
			case "Grid Details":
				gvM.Visible = false;
				pivotM.Visible = true;
				pivotM.DataBind();

				pivotM.Fields["fldID"].SetAreaPosition(PivotArea.ColumnArea, 0);
				pivotM.Fields["fldGroupName"].SetAreaPosition(PivotArea.ColumnArea, 1);
				pivotM.Fields["fldSubjStatus"].SetAreaPosition(PivotArea.ColumnArea, 2);

				pivotM.Fields["fldGroupName"].Visible = true;
				pivotM.Fields["fldSubjStatus"].Visible = true;

				pivotM.Fields["fldsms_dd_status"].SetAreaPosition(PivotArea.DataArea, 0);
				pivotM.Fields["fldsms_dd_status"].SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Min;



				pivotM.Fields["fldtimepoint_text"].SetAreaPosition(PivotArea.RowArea, 0);
				pivotM.Fields["fldStudyMeasName"].SetAreaPosition(PivotArea.RowArea, 1);
				pivotM.Fields["fldStudyMeasName"].Visible = true;

				break;
			case "Grid Counts":
				gvM.Visible = false;
				pivotM.Visible = true;


				pivotM.Fields["fldID"].SetAreaPosition(PivotArea.DataArea, 0);
				pivotM.Fields["fldID"].SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Count;



				pivotM.Fields["fldsms_dd_status"].SetAreaPosition(PivotArea.RowArea, 0);
				pivotM.Fields["fldtimepoint_text"].SetAreaPosition(PivotArea.ColumnArea, 0);

				pivotM.Fields["fldStudyMeasName"].Visible = false;
				pivotM.Fields["fldGroupName"].Visible = false;
				pivotM.Fields["fldSubjStatus"].Visible = false;

				pivotM.OptionsView.ShowColumnGrandTotals = true;
				pivotM.OptionsView.ShowRowGrandTotals = true;

				pivotM.DataBind();
				break;
		}
	}


		#region classes for hyperlink cells

		//class FieldValueTemplate : ITemplate
		//{
		//	public void InstantiateIn(Control container)
		//	{
		//		PivotGridFieldValueTemplateContainer c = (PivotGridFieldValueTemplateContainer)container;
		//		PivotGridFieldValueHtmlCell cell = c.CreateFieldValue();
		//		PivotFieldValueItem valueItem = c.ValueItem;
		//		PivotFieldValueEventArgs helperArgs = new PivotFieldValueEventArgs(valueItem);
		//		PivotDrillDownDataSource ds = helperArgs.CreateDrillDownDataSource();
		//		string link = ds[0]["link"].ToString();
		//		cell.Controls.AddAt(cell.Controls.IndexOf(cell.TextControl), new MyLink(c.Text, link));
		//		cell.Controls.Remove(cell.TextControl);
		//		c.Controls.Add(cell);
		//	}
		//}


		//class CellTemplate : ITemplate
		//{
		//	public void InstantiateIn(Control container)
		//	{
		//		PivotGridCellTemplateContainer c = container as PivotGridCellTemplateContainer;
		//		PivotDrillDownDataSource ds = c.Item.CreateDrillDownDataSource();
		//		//int id = Convert.ToInt32(ds[0]["ProductID"]);
		//		string link = ds[0]["link"].ToString();
		//		c.Controls.Add(new MyLink(c.Text, link));
		//	}
		//}


		//public class MyLink : HyperLink
		//{
		//	public MyLink(string text, string link) : base()
		//	{
		//		Text = text;
		//		NavigateUrl = link;
		//		Attributes["onclick"] = "alert(' " + link + " ')";
		//	}
		//}

		#endregion


		#region User Initiated Events


		protected void ddlEntity_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		ASPxComboBox cbo = (ASPxComboBox)sender;
		string entity = cbo.SelectedItem.Value.ToString();

		switch (entity)
		{
			case "Subjects":
				Response.Redirect("Subjects.aspx");
				break;
			case "Actions":
				Response.Redirect("Actions.aspx");
				break;
		}

	}



	protected void btnLoad_OnClick(object sender, EventArgs e)
	{
		Debug.Print("============= CLICK =============");
		LoadEntities();
	}


	protected void btnHelp_Click(object sender, EventArgs e)
	{
		Response.Redirect("Help_Tracking.aspx?ent=Measures");
	}

	#endregion





	#region Main Grid Events

	protected void UpdateSelectParameters()
	{
		meas_csv = uwac.trk.dataops.GetCSV(gridLkupMeas.GridView.GetSelectedFieldValues(gridLkupMeas.KeyFieldName));
		meas_csv = (meas_csv == null) ? "" : meas_csv;

		tp_csv = (tokTimepoint.Value == null) ? "" : tokTimepoint.Value.ToString();
		group_csv = tokGroup.Value.ToString();
		measstatus_csv = tokMeasStatus.Value.ToString();
		subjstatus_csv = tokSubjStatus.Value.ToString();
		DEstatus_csv = tokDEStatus.Value.ToString();
		IncludeREL = rblREL.Value.ToString();
	}




	#region gvM
	protected void gvM_DataBinding(object sender, EventArgs e)
	{

		//if (ViewState["needBind"] != null && (bool)ViewState["needBind"])
		if (ViewState["needBind"].ToString() == "true")
		{
			UpdateSelectParameters();

			DataTable dt = M_GetData("gvM", meas_csv, tp_csv, group_csv, measstatus_csv, subjstatus_csv, DEstatus_csv, IncludeREL);

			if (dt.Rows.Count > 0)
			{
				gvM.DataSource = Session["M_data"];
			}

			if (meas_csv + tp_csv.ToString() + group_csv.ToString() + measstatus_csv.ToString() + subjstatus_csv.ToString() == "")
			{ btnLoad.Text = "Load Measures"; }
			else { btnLoad.Text = "Load Selected Measures"; }


		}

	}




	protected void gvM_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;

		//Get and Process the list of selected records in order to populate the list of pkvals
		#region process selected records
		var selected_keys = gvM.GetSelectedFieldValues("StudyMeasSubjID");


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

		

		popupdata.AddField(e.NewValues, gvM, "MeasStatusID", "CboMS", DevExpress.Web.ControlType.ASPxComboBox);
		popupdata.AddField(e.NewValues, gvM, "MeasStatusDetailID", "CboMSD", DevExpress.Web.ControlType.ASPxComboBox);
		popupdata.AddField(e.NewValues, gvM, "Date", "DateCalendar", DevExpress.Web.ControlType.ASPxDateEdit);
		popupdata.AddField(e.NewValues, gvM, "Clinician", "CboClin", DevExpress.Web.ControlType.ASPxComboBox);
		popupdata.AddField(e.NewValues, gvM, "Notes", "notesEditor", DevExpress.Web.ControlType.ASPxMemo);


		ASPxRadioButtonList rblDate = gv.FindEditFormLayoutItemTemplateControl("rblDate") as ASPxRadioButtonList;

		if(rblDate.Value != null)
		{
			//remove the entered date as we will programmatically assign a different date
			e.NewValues.Remove("Date");

			//Update the date based on the selected mode
			string mode = rblDate.Value.ToString();
			string date_update = dataops.dxGrid_Update_StudyMeasSubj_Dates(mode, pkvals);
		}


		string result = dataops.dxGrid_UpdateData("studymeassubjID", pkvals, e.NewValues, "backend", "dbo", "tblStudyMeasSubj");

		lblTest.Text = result;

		gv.CancelEdit();
		e.Cancel = true;

		ViewState["needBind"] = "true";
		gvM.DataBind();
	}





	protected void CountNumSelectedRecords(object sender, EventArgs e)
	{
		ASPxLabel lblNumSelected = (ASPxLabel)sender; // gvM.FindEditFormLayoutItemTemplateControl("lblNumSelected");


		var obj_selectedPKs = gvM.GetSelectedFieldValues("StudyMeasSubjID");
		List<string> selectedPKs = new List<string>();
		foreach ( var itm in obj_selectedPKs)
		{
			int i = (int)itm;
			selectedPKs.Add(i.ToString());
		}

		int sumPKs = selectedPKs.Sum(item => Convert.ToInt32(item));

		int num = gvM.GetSelectedFieldValues("StudyMeasSubjID").Count();


		GridViewEditFormLayoutItemTemplateContainer template = (GridViewEditFormLayoutItemTemplateContainer)lblNumSelected.NamingContainer;
		ASPxGridView gv = (ASPxGridView)template.Grid;

		ASPxCheckBox chkall = (ASPxCheckBox)gv.FindControlRecursive("chkUpdateAllSelected");

		if (selectedPKs.Contains(hidEditingPk.Value)) num = num - 1;


		if (lblNumSelected != null & num > 0)
		{
				string adds = (num > 1) ? "s" : "";
				lblNumSelected.Text = num.ToString() + " additional record" + adds;
				chkall.ClientVisible = true;
		}
		else
		{
			lblNumSelected.Text = "";
			chkall.ClientVisible = false;

			//Hide the DoNotUpdate checkboxes if multiple records are not selected
			ASPxCheckBox DateCalendar_DoNotUpdate = (ASPxCheckBox)gv.FindControlRecursive("DateCalendar_DoNotUpdate");
			ASPxCheckBox CboMS_DoNotUpdate = (ASPxCheckBox)gv.FindControlRecursive("CboMS_DoNotUpdate");
			ASPxCheckBox CboMSD_DoNotUpdate = (ASPxCheckBox)gv.FindControlRecursive("CboMSD_DoNotUpdate");
			ASPxCheckBox CboClin_DoNotUpdate = (ASPxCheckBox)gv.FindControlRecursive("CboClin_DoNotUpdate");
			ASPxCheckBox notesEditor_DoNotUpdate = (ASPxCheckBox)gv.FindControlRecursive("notesEditor_DoNotUpdate");


			DateCalendar_DoNotUpdate.Visible = false;
			CboMS_DoNotUpdate.Visible = false;
			CboMSD_DoNotUpdate.Visible = false;
			CboClin_DoNotUpdate.Visible = false;
			notesEditor_DoNotUpdate.Visible = false;

		}
	}


	protected void gvM_OnStartRowEditing(object sender, ASPxStartRowEditingEventArgs e)
	{

		hidEditingPk.Value = e.EditingKeyValue.ToString();

		//if (gvM.GetRowValuesByKeyValue(e.EditingKeyValue, "Department").ToString() != UserDepartment)
		//{
		//}
	}
		

	protected void gvM_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
	{
		if (e.DataColumn.FieldName == "sms_dd_status")
		{
			string x = e.Cell.Text;
			Color newcolor = uwac.trk.color.GetStatus_Color(color.StatusType.Measure, e.CellValue.ToString(), Convert.ToInt32(sliderValue.Value));
			e.Cell.BackColor = newcolor;
			e.Cell.ForeColor = Color.Black;
		}
	}

	protected void gvM_OnBeginRefresh(object sender, EventArgs e)
	{
		Debug.Print("gvM_OnBeginRefresh              gvM.RowCount=" + gvM.DetailRows.VisibleCount.ToString());
		gvM.DataSource = Session["M_data"];
		gvM.DataBind();
	}

	protected void gvM_OnBeforeColumnSortingGrouping(object sender, EventArgs e)
	{
		gvM.DataSource = Session["M_data"];
		gvM.DataBind();
		Debug.Print("gvM_OnBeforeColumnSortingGrouping    gvM.RowCount=" + gvM.DetailRows.VisibleCount.ToString());
	}


	#endregion gvM



	protected void tokDEStatus_ItemRowPrepared(object sender, ListBoxItemRowPreparedEventArgs e)
	{
		Color newcolor = color.GetStatus_Color(color.StatusType.Measure, e.Row.Cells[0].Text, Master.Colorlevel);
		//e.Row.Cells[0].BackColor = Color.DarkMagenta;
		e.Row.Cells[0].BackColor = newcolor;

	}



	#region pivotM

	protected void pivotM_DataBinding(object sender, EventArgs e)
	{
		//if (ViewState["needBind"] != null && (bool)ViewState["needBind"])
		if (ViewState["needBind"].ToString() == "true")
		{
			UpdateSelectParameters();

			DataTable dt = M_GetData("pivotM", meas_csv, tp_csv, group_csv, measstatus_csv, subjstatus_csv, DEstatus_csv, IncludeREL);

			if (dt.Rows.Count > 0)
			{
				pivotM.DataSource = Session["M_data"];
			}


			if (meas_csv + tp_csv.ToString() + group_csv.ToString() + measstatus_csv.ToString() + subjstatus_csv.ToString() == "")
			{ btnLoad.Text = "Load Measures"; }
			else { btnLoad.Text = "Load Selected Measures"; }


			Debug.Print("!!!! pivotM_DataBinding            pivotM.RowCount=" + pivotM.RowCount.ToString());
		}

	}





	protected void pivotM_OnBeginRefresh(object sender, EventArgs e)
	{
		Debug.Print("pivotM_OnBeginRefresh              pivotM.RowCount=" + pivotM.RowCount.ToString());
		pivotM.DataSource = Session["M_data"];
		pivotM.DataBind();
	}



	protected void pivotM_CustomCellDisplayText(object sender, DevExpress.Web.ASPxPivotGrid.PivotCellDisplayTextEventArgs e)
	{

	}


	protected void pivotM_CustomCellStyle(object sender, PivotCustomCellStyleEventArgs e)
	{

		if (e.ColumnValueType == PivotGridValueType.Value)
		{
			if (rblObj.Value.ToString() != "Grid Counts")
			{

				if (e.Value != null)
				{
					Color cellcolor = color.GetStatus_Color(color.StatusType.Measure, e.Value.ToString(), Convert.ToInt32(sliderValue.Value));
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
						Color cellcolor = color.GetStatus_Color(color.StatusType.Measure, v.ToString(), Convert.ToInt32(sliderValue.Value));
						e.CellStyle.BackColor = cellcolor;

					}
				}
			}
		}

	}
	#endregion  pivotM

	#endregion  Main Grid Events



	#region Get Data from DB


	protected DataTable M_GetData(string obj, string meas_csv, string tp_csv, string group_csv, string measstatus_csv, string subjstatus_csv, string DEstatus_csv, string rel)
	{
		Debug.Print(" #### Getting Data #### ");

		SQL_utils sql = new SQL_utils("backend");
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
		ps.Add(sql.CreateParam("measID_csv", meas_csv, "text"));
		ps.Add(sql.CreateParam("tpID_csv", tp_csv, "text"));
		ps.Add(sql.CreateParam("groupID_csv", group_csv, "text"));
		ps.Add(sql.CreateParam("measstatusID_csv", measstatus_csv, "text"));
		ps.Add(sql.CreateParam("subjstatusID_csv", subjstatus_csv, "text"));
		ps.Add(sql.CreateParam("DEstatus_csv", DEstatus_csv, "text"));
		ps.Add(sql.CreateParam("rel", rel, "text"));

		DataTable dt = sql.DataTable_from_ProcName("trk.spGetSelected_M", ps);


		int nrows = 0;
		int nsubjects = 0;
		if (dt != null)
		{
			nrows = dt.Rows.Count;
			nsubjects = dt.AsEnumerable().Select(f => f.Field<string>("ID")).Distinct().Count();
		}

		Debug.Print(String.Format(" #### I have gathered {0} records at {1} #### ", nrows, System.DateTime.Now.ToString()));

		ViewState["M_nrecs"] = nrows.ToString();
		Mstatus.Text = nrows.ToString() + " measures for " + nsubjects.ToString() + " subjects";

		if (nrows == 0)
		{
			gvM.Visible = false;
			pivotM.Visible = false;
		}
		else
		{
			Session["M_data"] = dt;
			ViewState["needBind"] = "false";

			switch (obj)
			{
				case "gvM":
					gvM.DataSource = dt;
					gvM.Visible = true;
					pivotM.Visible = false;

					break;
				case "pivotM":
					pivotM.DataSource = dt;
					gvM.Visible = false;
					pivotM.Visible = true;

					break;
			}
		}

		sql.Close();

		return dt;
	}





	protected DataTable getDataforCombobox(string sqlcode)
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
		return dt;
	}



	#endregion


	#region Setup Controls 



	#region Setup Measures
	protected void popupTitle_OnInit(object sender, EventArgs e)
	{
		ASPxLabel popupTitle = (ASPxLabel)sender;
		GridViewEditFormLayoutItemTemplateContainer templateContainer = (GridViewEditFormLayoutItemTemplateContainer)popupTitle.NamingContainer;
		popupTitle.Text = DataBinder.Eval(templateContainer.DataItem, "timepoint_text").ToString() + " " +
			DataBinder.Eval(templateContainer.DataItem, "StudyMeasName").ToString() + " for subject " +
			DataBinder.Eval(templateContainer.DataItem, "ID").ToString();


	}

	protected void CboClin_Init(object sender, EventArgs e)
	{
		ASPxComboBox CboClin = (ASPxComboBox)sender;
		GridViewEditFormLayoutItemTemplateContainer templateContainer = (GridViewEditFormLayoutItemTemplateContainer)CboClin.NamingContainer;

		CboClin.ClientInstanceName = string.Format("cboClin_{0}", templateContainer.VisibleIndex);
		//CboClin.ClientSideEvents.SelectedIndexChanged = string.Format("function(s, e) {{ OnSelectedIndexChanged(s, e, {0}); }}", templateContainer.VisibleIndex);

		CboClin.DataSourceID = "sqlStaff";
		CboClin.TextField = "staffname";
		CboClin.ValueField = "staffID";
		CboClin.DataBind();

		CboClin.Value = templateContainer.Grid.GetRowValues(templateContainer.VisibleIndex, "Clinician");

	}

	protected void CboMS_Init(object sender, EventArgs e)
	{
		ASPxComboBox CboMS = (ASPxComboBox)sender;
		//GridViewDataItemTemplateContainer templateContainer = (GridViewDataItemTemplateContainer)CboMS.NamingContainer;
		GridViewEditFormLayoutItemTemplateContainer templateContainer = (GridViewEditFormLayoutItemTemplateContainer)CboMS.NamingContainer;

		CboMS.ClientInstanceName = string.Format("cboMS_{0}", templateContainer.VisibleIndex);
		CboMS.ClientSideEvents.SelectedIndexChanged = string.Format("function(s, e) {{ OnSelectedIndexChanged(s, e, {0}); }}", templateContainer.VisibleIndex);

		CboMS.DataSourceID = "sqlMS";
		CboMS.TextField = "MeasStatus";
		CboMS.ValueField = "MeasStatusID";
		CboMS.DataBind();

		CboMS.Value = templateContainer.Grid.GetRowValues(templateContainer.VisibleIndex, "MeasStatusID");

	}

	protected void CboMSD_Init(object sender, EventArgs e)
	{
		ASPxComboBox CboMSD = (ASPxComboBox)sender;
		GridViewEditFormLayoutItemTemplateContainer templateContainer = (GridViewEditFormLayoutItemTemplateContainer)CboMSD.NamingContainer;
		CboMSD.ClientInstanceName = string.Format("cboMSD_{0}", templateContainer.VisibleIndex);
		CboMSD.Callback += CboMSD_Callback;

		string str_msID = templateContainer.Grid.GetRowValues(templateContainer.VisibleIndex, "MeasStatusID").ToString();
		string str_msdID = templateContainer.Grid.GetRowValues(templateContainer.VisibleIndex, "MeasStatusDetailID").ToString();


		CboMSD.DataSourceID = "sqlMSD2";
		CboMSD.TextField = "MeasStatusDetail";
		CboMSD.ValueField = "MeasStatusDetailID";

		int msID; int msdID;
		bool msID_is_int = int.TryParse(str_msID, out msID);
		if (msID_is_int) FillCboMSD(CboMSD, msID.ToString());

		bool msdID_is_int = int.TryParse(str_msdID, out msdID);
		if (msdID_is_int) CboMSD.Value = msdID;
	}

	private void CboMSD_Callback(object sender, CallbackEventArgsBase e)
	{
		ASPxComboBox cbomsd = (ASPxComboBox)sender;
		string ms = e.Parameter;

		if (string.IsNullOrEmpty(ms)) return;

		FillCboMSD(cbomsd, ms);
	}

	protected void FillCboMSD(ASPxComboBox cbomsd, string msID)
	{
		if (string.IsNullOrEmpty(msID)) return;

		SqlDataSource sqlMSD2 = (SqlDataSource)cbomsd.NamingContainer.FindControl("sqlMSD2");
		sqlMSD2.SelectParameters[0].DefaultValue = msID;
		cbomsd.DataBind();
	}
	#endregion Setup Measures


	#endregion


	[WebMethod]
	public static void SetColorLevel(int x)
	{
		dataops.SetColorLevel(x);
	}
}