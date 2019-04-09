using DevExpress.Web;
using DevExpress.Web.Export;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.Web.Data;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraGrid;
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


public partial class Tracking_Subjects : System.Web.UI.Page
{
	private string ID;
	private string group_csv;
	private string subjstatus_csv;

	#region Page Events
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = Master.Master_studyID.ToString();
	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("Subjects.aspx");
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		//GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);
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

	protected void CboSS_Init(object sender, EventArgs e)
	{
		ASPxComboBox CboSS = (ASPxComboBox)sender;
		//GridViewDataItemTemplateContainer templateContainer = (GridViewDataItemTemplateContainer)CboMS.NamingContainer;
		GridViewEditFormLayoutItemTemplateContainer templateContainer = (GridViewEditFormLayoutItemTemplateContainer)CboSS.NamingContainer;

		CboSS.ClientInstanceName = string.Format("cboSS_{0}", templateContainer.VisibleIndex);
		CboSS.ClientSideEvents.SelectedIndexChanged = string.Format("function(s, e) {{ OnSelectedIndexChanged(s, e, {0}); }}", templateContainer.VisibleIndex);

		CboSS.DataSourceID = "sqlSS";
		CboSS.TextField = "SubjStatus";
		CboSS.ValueField = "SubjStatusID";
		CboSS.DataBind();

		CboSS.Value = templateContainer.Grid.GetRowValues(templateContainer.VisibleIndex, "SubjStatusID");

	}




	protected void CboSSD_Init(object sender, EventArgs e)
	{
		ASPxComboBox CboSSD = (ASPxComboBox)sender;
		GridViewEditFormLayoutItemTemplateContainer templateContainer = (GridViewEditFormLayoutItemTemplateContainer)CboSSD.NamingContainer;
		CboSSD.ClientInstanceName = string.Format("cboSSD_{0}", templateContainer.VisibleIndex);
		CboSSD.Callback += CboSSD_Callback;

		string str_ssID = templateContainer.Grid.GetRowValues(templateContainer.VisibleIndex, "SubjStatusID").ToString();
		string str_ssdID = templateContainer.Grid.GetRowValues(templateContainer.VisibleIndex, "SubjStatusDetailID").ToString();


		CboSSD.DataSourceID = "sqlSSD_by_SS";
		CboSSD.TextField = "SubjStatusDetail";
		CboSSD.ValueField = "SubjStatusDetailID";


		int ssID; int ssdID;
		bool ssID_is_int = int.TryParse(str_ssID, out ssID);
		if (ssID_is_int) FillCboSSD(CboSSD, ssID.ToString());

		bool ssdID_is_int = int.TryParse(str_ssdID, out ssdID);
		if (ssdID_is_int) CboSSD.Value = ssdID;
	}

	private void CboSSD_Callback(object sender, CallbackEventArgsBase e)
	{
		ASPxComboBox cbossd = (ASPxComboBox)sender;
		string ssd = e.Parameter;

		if (string.IsNullOrEmpty(ssd)) return;

		FillCboSSD(cbossd, ssd);
	}


	protected void FillCboSSD(ASPxComboBox cbo, string ssID)
	{
		if (string.IsNullOrEmpty(ssID)) return;

		SqlDataSource sqlSSD_by_SS = (SqlDataSource)cbo.NamingContainer.FindControl("sqlSSD_by_SS");
		sqlSSD_by_SS.SelectParameters[1].DefaultValue = ssID;  //Because it is the second parameter
		cbo.DataBind();
	}


	protected DataTable getDataforCombobox(string sqlcode)
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
		return dt;
	}

	#endregion


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

				pivotENT.Fields["fldID"].SetAreaPosition(PivotArea.DataArea, 0);
				pivotENT.Fields["fldGroupName"].SetAreaPosition(PivotArea.ColumnArea, 0);
				pivotENT.Fields["fldSubjStatus"].SetAreaPosition(PivotArea.RowArea, 0);


				break;
			case "Grid Enroll Race":
				gvENT.Visible = false;
				pivotENT.Visible = true;
				pivotENT.DataBind();

				pivotENT.Fields["fldID"].SetAreaPosition(PivotArea.DataArea, 0);
				pivotENT.Fields["fldID"].SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Count;

				pivotENT.Fields["fldSex"].SetAreaPosition(PivotArea.ColumnArea, 0);
				pivotENT.Fields["fldEthnicityDesc"].SetAreaPosition(PivotArea.RowArea, 0);
				pivotENT.Fields["fldHispanicDesc"].SetAreaPosition(PivotArea.FilterArea, 0);

				pivotENT.Fields["fldGroupName"].SetAreaPosition(PivotArea.FilterArea, 1);

				break;
			case "Grid Enroll Ethn":
				gvENT.Visible = false;
				pivotENT.Visible = true;
				pivotENT.DataBind();

				pivotENT.Fields["fldID"].SetAreaPosition(PivotArea.DataArea, 0);
				pivotENT.Fields["fldID"].SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Count;

				pivotENT.Fields["fldSex"].SetAreaPosition(PivotArea.ColumnArea, 0);
				pivotENT.Fields["fldHispanicDesc"].SetAreaPosition(PivotArea.RowArea, 0);
				pivotENT.Fields["fldEthnicityDesc"].SetAreaPosition(PivotArea.FilterArea,0);


				pivotENT.Fields["fldGroupName"].SetAreaPosition(PivotArea.FilterArea, 1);

				break;
			case "Grid Enroll RaceEthn":
				gvENT.Visible = false;
				pivotENT.Visible = true;
				pivotENT.DataBind();

				pivotENT.Fields["fldID"].SetAreaPosition(PivotArea.DataArea, 0);
				pivotENT.Fields["fldID"].SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Count;

				pivotENT.Fields["fldSex"].SetAreaPosition(PivotArea.ColumnArea, 0);
				pivotENT.Fields["fldEthnicityDesc"].SetAreaPosition(PivotArea.RowArea, 0);
				pivotENT.Fields["fldHispanicDesc"].SetAreaPosition(PivotArea.RowArea, 1);


				pivotENT.Fields["fldGroupName"].SetAreaPosition(PivotArea.FilterArea, 1);

				break;
			case "Grid Counts":
				gvENT.Visible = false;
				pivotENT.Visible = true;


				pivotENT.Fields["fldID"].SetAreaPosition(PivotArea.DataArea, 0);
				pivotENT.Fields["fldID"].SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Count;

				pivotENT.Fields["fldGroupName"].SetAreaPosition(PivotArea.ColumnArea, 0);
				pivotENT.Fields["fldSubjStatus"].SetAreaPosition(PivotArea.RowArea, 0);


				pivotENT.Fields["fldSex"].Visible = false;
				pivotENT.Fields["fldEthnicityDesc"].Visible = false;
				pivotENT.Fields["fldHispanicDesc"].Visible = false;

				pivotENT.OptionsView.ShowColumnGrandTotals = true;
				pivotENT.OptionsView.ShowRowGrandTotals = true;

				pivotENT.DataBind();
				break;
		}

	}


	#region User Initiated Events

	protected void ddlEntity_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		ASPxComboBox cbo = (ASPxComboBox)sender;
		string entity = cbo.SelectedItem.Value.ToString();

		switch (entity){
			case "Actions":
				Response.Redirect("Actions.aspx");
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
		Response.Redirect("Help_Tracking.aspx?ent=Subjects");
	}


	#endregion





	#region gvENT Events

	protected void gvENT_DataBinding(object sender, EventArgs e)
	{
		var needbind = ViewState["needBind"];

		if (ViewState["needBind"].ToString() == "true")
		{

			//UpdateSelectParameters();
			group_csv = "";
			subjstatus_csv = "";
			DataTable dt = ENT_GetData("gvENT", group_csv.ToString(), subjstatus_csv.ToString());

			if (dt != null)
			{
				if (dt.Rows.Count > 0)
				{
					gvENT.DataSource = Session["ENT_data"];
					gvENT.DataBind();
				}
			}
			
			if (group_csv.ToString() +  subjstatus_csv.ToString() == "")
			{ btnLoad.Text = "Load Subjects"; }
			else { btnLoad.Text = "Load Selected Subjects"; }
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
		var selected_keys = gvENT.GetSelectedFieldValues("SubjID");


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
		ASPxComboBox cboSS = (ASPxComboBox)gvENT.FindEditFormLayoutItemTemplateControl("CboSS");
		e.NewValues["subjstatusID"] = cboSS.Value;

		ASPxComboBox cboSSD = (ASPxComboBox)gvENT.FindEditFormLayoutItemTemplateControl("CboSSD");
		e.NewValues["subjstatusdetailID"] = cboSSD.Value;

		ASPxMemo notes = (ASPxMemo)gvENT.FindEditFormLayoutItemTemplateControl("notesEditor");
		e.NewValues["Notes"] = notes.Value;


		string result = dataops.dxGrid_UpdateData("subjID", pkvals, e.NewValues, "backend", "dbo", "tblSubject");
		gvENTstatus.Text = result;

		gv.CancelEdit();
		e.Cancel = true;
		ViewState["needBind"] = "true";
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
		
		if (e.DataColumn.FieldName == "SubjStatusID")
		{

			SQL_utils sql = new SQL_utils("backend");
			string subjstatus = sql.StringScalar_from_SQLstring("select subjstatus from tblSubjectStatus_lkup where subjstatusID=" + e.CellValue.ToString());
			sql.Close();

			int colorlevel = uwac.trk.color.GetColorLevel();

			string x = e.Cell.Text;
			Color newcolor = color.GetStatus_Color(color.StatusType.Subject, subjstatus, colorlevel);
			e.Cell.BackColor = newcolor;
			e.Cell.ForeColor = Color.Black;
		}
	}

	#endregion





	#region pivotENT Events



	protected void pivotENT_DataBinding(object sender, EventArgs e)
	{
		//if (ViewState["needBind"] != null && (bool)ViewState["needBind"])
		if (ViewState["needBind"].ToString() == "true")
		{
			//UpdateSelectParameters();

			DataTable dt = ENT_GetData("pivotENT",  group_csv, subjstatus_csv);

			if (dt != null)
			{
				if (dt.Rows.Count > 0)
				{
					pivotENT.DataSource = Session["ENT_data"];
				}
			}


			if ( group_csv.ToString() +   subjstatus_csv.ToString() == "")
			{ btnLoad.Text = "Load Subjects"; }
			else { btnLoad.Text = "Load Selected Subjects"; }


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
					Color cellcolor = color.GetStatus_Color(color.StatusType.Subject, e.Value.ToString(), color.GetColorLevel());
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
						Color cellcolor = color.GetStatus_Color(color.StatusType.Subject, v.ToString(), color.GetColorLevel());
						e.CellStyle.BackColor = cellcolor;
					}
				}
			}
		}

	}

	#endregion



	#region Get Data from DB

	//protected void UpdateSelectParameters()
	//{
	//	//group_csv = tokGroup.Value.ToString();
	//	//subjstatus_csv = tokSubjStatus.Value.ToString();

	//}


	protected DataTable ENT_GetData(string obj, string group_csv, string subjstatus_csv)
	{


		SQL_utils sql = new SQL_utils("backend");
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
		ps.Add(sql.CreateParam("groupID_csv", group_csv.ToString(), "text"));
		ps.Add(sql.CreateParam("subjstatusID_csv", subjstatus_csv.ToString(), "text"));

		DataTable dt = sql.DataTable_from_ProcName("trk.spGetSelected_S", ps);


		int nrows = 0;
		int nsubjects = 0;
		if (dt != null)
		{
			nrows = dt.Rows.Count;
			nsubjects = dt.AsEnumerable().Select(f => f.Field<string>("ID")).Distinct().Count();
		}
		Debug.Print(String.Format(" #### I have gathered {0} records at {1} #### ", nrows, System.DateTime.Now.ToString()));


		ViewState["ENT_nrecs"] = nrows.ToString();
		gvENTstatus.Text =  nsubjects.ToString() + " subjects";

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