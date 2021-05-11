using DevExpress.Web;
using DevExpress.Web.Data;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;
using uwac;
using uwac.trk;

public partial class Track_Subject : BasePage // System.Web.UI.Page
{
	private string ID;

	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);

		Session["studyID"] = Master.Master_studyID.ToString();



	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("Subject.aspx");
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		//ApplyValidationSummarySettings();
		//ApplyEditorsSettings();
		bool isCallback = IsCallback;
		bool isPostback = IsPostBack;

		if(Request.QueryString["subjid"] != null)
		{
			SQL_utils sql = new SQL_utils("backend");
			string theID =  sql.StringScalar_from_SQLstring("select id from tblsubject where subjID=" + Request.QueryString["subjid"]);
			Session["ID"] = theID;
			//cboID.Value = theID;
			ID = theID;

			lblID.Text = theID;

			int newstudyID = sql.IntScalar_from_SQLstring("select studyID from vwMasterStatus_S where subjID=" + Request.QueryString["subjid"]);

			if(newstudyID != Master.Master_studyID)
			{
				sql.NonQuery_from_SQLstring("exec spSEC_Update_Default_StudyID_for_User " + newstudyID);
			}

			Master.Master_studyID = newstudyID;

			sql.Close();
		}
		else if (Request.QueryString["ID"] != null)
		{
			ID = Request.QueryString["ID"];
			Session["ID"] = ID;
			lblID.Text = ID;

			//cboID.Value = ID;
		} 
		else 
		{
			Session["ID"] = "";
			
		}



		if (!IsCallback && !IsPostBack)
		{
			//sliderValue.Value = color.GetColorLevel().ToString();


			if (!String.IsNullOrEmpty(Session["ID"].ToString() ))
			{
				GetSubjectInfo(Session["ID"].ToString());
				//GetMeasureInfo(ID);
				ASPxEdit.ValidateEditorsInContainer(this);
			}
		}
	}

	//[WebMethod]
	//public static void SetColorLevel(int x)
	//{
	//	SQL_utils sql = new SQL_utils("backend");
	//	sql.NonQuery_from_SQLstring("exec spSEC_Update_ColorLevel_for_User " + x.ToString());
	//	sql.Close();
	//}


	#region Setup Controls



	protected void cboSSD_Callback(object source, CallbackEventArgsBase e)
	{
		Session["ssID"] = e.Parameter;
		cboSSD.DataBind();
		//FillCboSSD(e.Parameter);
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


	protected void CboAS_Init(object sender, EventArgs e)
	{
		ASPxComboBox CboAS = (ASPxComboBox)sender;
		//GridViewDataItemTemplateContainer templateContainer = (GridViewDataItemTemplateContainer)CboMS.NamingContainer;
		GridViewEditFormLayoutItemTemplateContainer templateContainer = (GridViewEditFormLayoutItemTemplateContainer)CboAS.NamingContainer;

		CboAS.ClientInstanceName = string.Format("cboAS_{0}", templateContainer.VisibleIndex);
		CboAS.ClientSideEvents.SelectedIndexChanged = string.Format("function(s, e) {{ OnSelectedIndexChanged(s, e, {0}); }}", templateContainer.VisibleIndex);
		   
		CboAS.DataSourceID = "sqlAS";
		CboAS.TextField = "ActionStatus";
		CboAS.ValueField = "ActionStatusID";
		CboAS.DataBind();
		   
		CboAS.Value = templateContainer.Grid.GetRowValues(templateContainer.VisibleIndex, "ActionStatusID");

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

	#endregion Setup Controls
 

	#region Populate Grids

	protected void GetSubjectInfo(string myID)
	{

		int numtimepoints = tokTimepoint.Items.Count;
		var tb = tokTimepoint.Value.ToString();

		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring(String.Format("select * from trk.vwMasterStatus_S where studyID={0} and ID = '{1}'", Master.Master_studyID.ToString(), myID));

		if (dt.Rows.Count > 0)
		{
			string subjid = dt.AsEnumerable().Select(t => t.Field<int>("subjid")).First().ToString();
			string id = dt.AsEnumerable().Select(t => t.Field<string>("ID")).First().ToString();
			string ss = dt.AsEnumerable().Select(t => t.Field<string>("subjstatus") == null ? string.Empty : t.Field<string>("subjstatus")).First().ToString();
			string ssd = dt.AsEnumerable().Select(t => t.Field<string>("subjstatusdetail") == null ? string.Empty : t.Field<string>("subjstatusdetail")).First().ToString();

			
			//string ssnotes = dt.AsEnumerable().Select(t => t.Field<string>("Notes")).First().ToString();
			string ssnotes = dt.AsEnumerable().Select(t => t.Field<string>("notes") == null ? string.Empty : t.Field<string>("notes")).First().ToString();
			string groupname = dt.AsEnumerable().Select(t => t.Field<string>("groupname")).First().ToString();

			if (ss != "")
			{
				string ssID = dt.AsEnumerable().Select(t => t.Field<int>("ssID")).First().ToString();
				Session["ssID"] = ssID;
			}
			if (ssd != "")
			{
				string ssdID = dt.AsEnumerable().Select(t => t.Field<int>("ssdID")).First().ToString();
			}


			hidSubjID.Value = subjid;
			lblID.Text = id;
			lblSS.Text = ss;
			lblSSD.Text = ssd;
			lblNotes.Text = ssnotes;
			txtNotes.Text = ssnotes;
			lblGroup.Text = groupname;

			var x = cboSS.Items.FindByText(ss);

			//is this needed?
			//FillCboSSD(ssID);
			sql.Close();

		}
		else 
		{
			Response.Redirect("~/Track/Subject.aspx");
		}
	}


	protected void GetMeasureInfo(string ID)
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_SQLstring(String.Format("Select * from trk.vwMasterStatus_M where studyID={0} and ID='{1}'" , Master.Master_studyID.ToString(), ID));
		gvM.DataSource = dt;
		gvM.DataBind();

	}


	protected DataTable getDataforCombobox(string sqlcode)
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
		return dt;
	}


	#endregion Populate Grids


	protected void SaveSubject(object source, EventArgs e)
	{

		SQL_utils sql = new SQL_utils("backend");

		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("subjid", hidSubjID.Value.ToString(), "int"));
		ps.Add(sql.CreateParam("Notes", txtNotes.Text.ToString(), "text"));
		ps.Add(sql.CreateParam("ssID", cboSS.Value.ToString(), "int"));
		ps.Add(sql.CreateParam("ssdID", cboSSD.Value.ToString(), "int"));

		sql.NonQuery_from_ProcName("trk.spSubject_Update", ps);

		sql.Close();

		GetSubjectInfo(ID);
	}



 

	protected void CountNumSelectedRecords(object sender, EventArgs e)
	{
		ASPxLabel lblNumSelected = (ASPxLabel)sender; // gvM.FindEditFormLayoutItemTemplateControl("lblNumSelected");
		int num = gvM.GetSelectedFieldValues("StudyMeasSubjID").Count();
		GridViewEditFormLayoutItemTemplateContainer template = (GridViewEditFormLayoutItemTemplateContainer) lblNumSelected.NamingContainer;
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

	protected void gvM_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;

		var selected_keys = gvM.GetSelectedFieldValues("StudyMeasSubjID");

		ASPxCheckBox chkAllSelected = gv.FindEditFormLayoutItemTemplateControl("chkUpdateAllSelected") as ASPxCheckBox;
		bool updateALLSelected = chkAllSelected.Checked;

		List<int> pkvals = new List<int>();
		
		foreach(object key in e.Keys.Values)
		{
			int ikey;
			bool isint = int.TryParse(key.ToString(), out ikey);
			if(isint) pkvals.Add(ikey);
		}

		//Add the other selected rows to the update if the user has selected the "Update All" checkbox
		if(selected_keys.Count>0 && updateALLSelected)
		{
			foreach(object k in selected_keys)
			{
				int ikey;
				bool isint = int.TryParse(k.ToString(), out ikey);
				if (!pkvals.Contains(ikey)) pkvals.Add( ikey);
			}
		}


		popupdata.AddField(e.NewValues, gvM, "MeasStatusID", "CboMS", DevExpress.Web.ControlType.ASPxComboBox);
		popupdata.AddField(e.NewValues, gvM, "MeasStatusDetailID", "CboMSD", DevExpress.Web.ControlType.ASPxComboBox);
		popupdata.AddField(e.NewValues, gvM, "Date", "DateCalendar", DevExpress.Web.ControlType.ASPxDateEdit);
		popupdata.AddField(e.NewValues, gvM, "Clinician", "CboClin", DevExpress.Web.ControlType.ASPxComboBox);
		popupdata.AddField(e.NewValues, gvM, "Notes", "notesEditor", DevExpress.Web.ControlType.ASPxMemo);


		ASPxRadioButtonList rblDate = gv.FindEditFormLayoutItemTemplateControl("rblDate") as ASPxRadioButtonList;

		if (rblDate.Value != null)
		{
			//remove the entered date as we will programmatically assign a different date
			e.NewValues.Remove("Date");

			//Update the date based on the selected mode
			string mode = rblDate.Value.ToString();
			string date_update = dataops.dxGrid_Update_StudyMeasSubj_Dates(mode, pkvals);
		}


		string result = dataops.dxGrid_UpdateData("studymeassubjID", pkvals, e.NewValues, "backend", "dbo", "tblStudyMeasSubj");


		gvMstatus.Text = result;

		//gvM.JSProperties["gvM_IsUpdated"] = true;

		gv.CancelEdit();
		e.Cancel = true;

		//GetMeasureInfo(ID);
		gvM.DataBind();
	}


	protected void gvA_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;

		var selected_keys = gvA.GetSelectedFieldValues("ActionID");

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

		////Get the data from the ComboBoxes
		//ASPxComboBox cboMS = (ASPxComboBox)gvM.FindEditFormLayoutItemTemplateControl(  "CboMS");
		//ASPxComboBox cboMSD = (ASPxComboBox)gvM.FindEditFormLayoutItemTemplateControl(  "CboMSD");

		//e.NewValues["MeasStatusID"] = cboMS.Value;
		//e.NewValues["MeasStatusDetailID"] = cboMSD.Value;

		//ASPxMemo notes = (ASPxMemo)gvM.FindEditFormLayoutItemTemplateControl("notesEditor");
		//e.NewValues["Notes"] = notes.Value;

		////string result = dxGrid_UpdateData(e.Keys, e.NewValues, "backend", "dbo", "tblStudyMeasSubj");
		//string result = dataops.dxGrid_UpdateData("studymeassubjID", pkvals, e.NewValues, "backend", "dbo", "tblStudyMeasSubj");



		popupdata.AddField(e.NewValues, gvA, "ActionStatusID", "CboAS", DevExpress.Web.ControlType.ASPxComboBox);
		popupdata.AddField(e.NewValues, gvA, "DateDone", "DateCalendarA", DevExpress.Web.ControlType.ASPxDateEdit);
		//popupdata.AddField(e.NewValues, gvA, "Clinician", "CboClinA", DevExpress.Web.ControlType.ASPxComboBox);
		popupdata.AddField(e.NewValues, gvA, "Notes", "notesEditorA", DevExpress.Web.ControlType.ASPxMemo);

		
		string result = dataops.dxGrid_UpdateData("actionID", pkvals, e.NewValues, "backend", "dbo", "tblAction");


		gvAstatus.Text = result;

		//gvM.JSProperties["gvM_IsUpdated"] = true;

		gv.CancelEdit();
		e.Cancel = true;

		gvA.DataBind();
	}




	//search for Convert.ToInt32(sliderValue.Value)

	#region Grid Events

	protected void gvA_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
	{
		
		if (e.DataColumn.FieldName == "ActionStatus")
		{
			string x = e.Cell.Text;
			Color newcolor = color.GetStatus_Color( color.StatusType.Action, e.CellValue.ToString(), Master.Colorlevel);
			//Color newcolor = GetActionStatus_Color(x);
			e.Cell.BackColor = newcolor;
			e.Cell.ForeColor = Color.Black;
		}
	}



	protected void gvM_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
	{
		if (e.DataColumn.FieldName == "sms_dd_status")
		{
			string x = e.Cell.Text;
			Color newcolor = color.GetStatus_Color( color.StatusType.Measure, e.CellValue.ToString(), Master.Colorlevel);
			e.Cell.BackColor = newcolor;
			e.Cell.ForeColor = Color.Black;
		}
	}


	//    Use to select all the measures for a given action
	//from https://documentation.devexpress.com/AspNet/3748/ASP-NET-WebForms-Controls/Grid-View/Examples/How-to-Select-Rows-That-Contain-the-Specified-Value
	protected void gvM_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
	{
		string actionid = e.Parameters.ToString();
		gvM.Selection.UnselectAll();

		if (actionid != "")
		{
			for (int i = 0; i < gvM.VisibleRowCount; i++)
			{
				if (gvM.GetRowValues(i, "ActionID") != null)
				{
					if (gvM.GetRowValues(i, "ActionID").ToString() == actionid)
					{
						gvM.Selection.SelectRow(i);
					}
					else
					{
					}
				}

			}
		}
	}

	#endregion Grid Events


	protected void btnHousehold_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils("backend");

		if (Request.QueryString["ID"] != null)
		{
			int hhid = sql.IntScalar_from_SQLstring("select householdID from vwMasterStatus_S where ID='" + Request.QueryString["ID"] + "' and studyID=" + Master.Master_studyID.ToString());
			Response.Redirect("~/Tracking/Household2.aspx?hhID=" + hhid.ToString());
		}
		else if (Request.QueryString["subjid"] != null)
		{
			int hhid = sql.IntScalar_from_SQLstring("select householdID from vwMasterStatus_S where subjID='" + Request.QueryString["subjid"] + "' and studyID=" + Master.Master_studyID.ToString());
			Response.Redirect("~/Tracking/Household2.aspx?hhID=" + hhid.ToString());
		}

	}




	#region Upload

	protected void keyFieldLink_Init(object sender, EventArgs e)
	{
		ASPxHyperLink link = sender as ASPxHyperLink;
		GridViewDataItemTemplateContainer container = link.NamingContainer as GridViewDataItemTemplateContainer;

		link.Text = container.Text; // + container.KeyValue;
		link.Target = "_blank";
		link.NavigateUrl = "~/Library/Doc.aspx?dvID=" + container.KeyValue;
	}

	protected void gridDocs_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		var x = e;

		bool results_docVers = DxDbOps.BuildUpdateSqlCode(e, "tblDocVers", "backend");


		OrderedDictionary oldvals = e.OldValues;
		OrderedDictionary newvals = e.NewValues;
		OrderedDictionary keys = new OrderedDictionary();
		keys.Add("DocID", oldvals["DocID"]);

		bool results_doc = DxDbOps.BuildUpdateSqlCode(keys, newvals, oldvals, "tblDoc", "backend");


		//LoadDocs(Request.QueryString["ID"]);

		e.Cancel = true;
		gridDocs.CancelEdit();

		//		gridDocs.EndUpdate();

	}

	public int GetSubjid(string id)
	{
		SQL_utils sql = new SQL_utils("backend");
		int subjid = sql.IntScalar_from_SQLstring(
			String.Format("select subjid from trk.vwMasterStatus_S where id='{0}' and studyID={1}"
			, id, Master.Master_studyID));
		sql.Close();
		return subjid;
	}


	#endregion


}