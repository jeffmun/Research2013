using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.Data;
using DevExpress.Web.Rendering;
using uwac;


public partial class Admin_StudyDesign : BasePage  
{
	private List<string> entities;


	protected void Page_Init(object sender, EventArgs e)
	{
		entities = new List<string> { "tblgroup", "tbltimepoint", "tblsubjstatus", "tblstudyaction", "tblstudymeas" };
		//o = new oboutGrid_utils();

		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		LoadHypterlinks_for_new_entities();

		if (!IsPostBack)
		{
			//LoadTimepoints();
		}

	}
	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		lblStudyname.Text = Master.Master_studyname;

		//sql_Group.DataBind();
		//LoadEntities();

		Response.Redirect(Request.Url.ToString());


	}

	protected void Page_Load(object sender, EventArgs e)
	{
		//CHeck who this is:


		grid_tblstudyaction.JSProperties["cpIsUpdated"] = "";
		grid_tblstudymeas.JSProperties["cpIsUpdated"] = "";
		grid_tblconsentform.JSProperties["cpIsUpdated"] = "";
		grid_tblsubjstatus.JSProperties["cpIsUpdated"] = "";
		grid_tbltimepoint.JSProperties["cpIsUpdated"] = "";
		grid_tblgroup.JSProperties["cpIsUpdated"] = "";

		grid_MeasNotInAction.JSProperties["cpIsUpdated"] = "";
		grid_MeasInAction.JSProperties["cpIsUpdated"] = "";



		if (!IsPostBack)
		{
			lblStudyname.Text = Master.Master_studyname;

			//LoadEntities();
			//LoadSelect2controls();

			//grid_studymeas.CssSettings["CSSRowEditTemplate"] = "rowedittemplate_css";
		}


		//grid_tblstudymeas.CssSettings.CSSRowEditTemplate = "rowedittemplate_css";
	}

	protected void LoadHypterlinks_for_new_entities()
	{
		hypSubjStatus.NavigateUrl="~/admin/editentity.aspx?tbl=" + utilCrypt.Encrypt("tblSS")+"&detail=" + utilCrypt.Encrypt("tblSSD") +"&usestudy=" + utilCrypt.Encrypt("y");

		hypNEW_ActionType.NavigateUrl = "~/admin/editentity.aspx?tbl=" + utilCrypt.Encrypt("tblActionType_lkup") + "&detail=" + utilCrypt.Encrypt("tblActionTypeStatus_lkup");

		hypMeasure.NavigateUrl = "~/admin/editentity.aspx?tbl=" + utilCrypt.Encrypt("tblMeasure");

	}

	


	#region Stuff for automatically displaying info messages after insert, update, deletes 
	public void UpdateMsg( string entity)
	{
		entity = entity.Replace("grid_", "");

		string entity_msg = entity + "_msg";
		string msg = "";
		if (Session[entity_msg] != null)
		{
			msg = Session[entity_msg].ToString();
		}


		Literal lit = (Literal)Page.FindControlRecursive(entity_msg);
		lit.Text = msg;

		if(msg.StartsWith("NOT DELETED"))
		{
			try
			{
				Button btn = (Button)Page.FindControlRecursive("btnOVERRIDE_" + entity);
				btn.Visible = true;
			}
			catch(Exception ){}
		}

		//UpdatePanel("callbackPanel_" + entity);

		//// create a timer that will clear the msg in 5 seconds
		//CreateTimer("MyTimer", "ClearMsg('" + "callbackPanel_" + entity + "_Content')", 12000);

	}


	public void ServerCancelTimer()
	{
		//CancelTimer("MyTimer");
	}

	
	#endregion


	

	//StudyDesign Utilities
	// Copy a group - give new group all the same actions and measures
	// Copy a timepoint 
	// Give subjects missing measures and actions

	//Tracking Utilities
	//Delete a subject
	//Change subject's group




	protected void btnOVERRIDE_tblstudymeas_Click(object sender, EventArgs e)
	{

		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = "insert into tblOVERRIDE_DELETE(tbl, pk) values ('tblstudymeas'," + Session["studymeasID_toDelete"].ToString() + ")";

		sql.NonQuery_from_SQLstring(sqlcode);

		sql.Close();
		Session["studymeasID_toDelete"] = null;
	}


	protected void btnOVERRIDE_tblstudyaction_Click(object sender, EventArgs e)
	{

		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = "insert into tblOVERRIDE_DELETE(tbl, pk) values ('tblstudyaction'," + Session["studyactionID_toDelete"].ToString() + ")";

		sql.NonQuery_from_SQLstring(sqlcode);

		sql.Close();
		Session["studyactionID_toDelete"] = null;
	}



	#region Basic Grid CRUD
	protected void dxgrid_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		e.NewValues.Add("HouseholdID", Request.QueryString["hhID"]);
		e.NewValues.Add("studyID", Master.Master_studyID.ToString());

		int newgroupID=-1;
		int staffID=-1;
		int labID=-1;
		SQL_utils sql = new SQL_utils("backend");

		if (gv.ClientInstanceName == "grid_tblgroup")
		{
			newgroupID = sql.IntScalar_from_SQLstring("select max(groupID) + 1 from tblGroup");
			staffID = sql.IntScalar_from_SQLstring("select sec.systemuser_staffID()");
			labID = sql.IntScalar_from_SQLstring("select labID from tblStudy where studyID=" + Master.Master_studyID.ToString());
			e.NewValues["groupID"] = newgroupID;
		}

		DxDbOps.BuildInsertSqlCode(e, GridnameToTable(gv.ClientInstanceName), "backend");


		if (gv.ClientInstanceName == "grid_tblgroup")
		{
			if(newgroupID > 0 & staffID > 0 & labID > 0)
			{
				// Add the group to this lab
				string sqlcode = String.Format("insert into tbllabgroup(groupID, labID, labgroup_enabled) values({0},{1},{2})"
					, newgroupID.ToString(), labID, "1");
				sql.NonQuery_from_SQLstring(sqlcode);

				int labgroupID = sql.IntScalar_from_SQLstring(String.Format("select labgroupID from tbllabgroup where groupID={0} and labID={1}", newgroupID, labID));

				if (labgroupID > 0)
				{
					// Add the group to this staff
					string sqlcode2 = String.Format("insert into tbllabgroup_staff(StaffID, LabGroupID , DBroleID) values({0}, {1}, {2})"
						, staffID, labgroupID, "1");
					sql.NonQuery_from_SQLstring(sqlcode2);
				}

			}
		}


		((ASPxGridView)sender).JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
		gv.CancelEdit();
		e.Cancel = true;

		RefreshGrids();


	}

	protected void dxgrid_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;

		//For changes to ActionText
		if (gv.ID == "grid_tblstudyaction")
		{
			string pkfld = "";
			int pkvalue = -1;

			foreach (DictionaryEntry key in e.Keys)
			{
				pkfld = key.Key.ToString();
				pkvalue = Convert.ToInt32(key.Value);
			}

			if (pkvalue > 0 && pkfld == "studyactionID")
			{
				foreach (DictionaryEntry newentry in e.NewValues)
				{
					foreach (DictionaryEntry oldentry in e.OldValues)
					{
						var newfld = newentry.Key.ToString().ToLower();
						var oldfld = oldentry.Key.ToString().ToLower();

						if (newentry.Key == oldentry.Key && newentry.Key.ToString() == "actiontext")
						{

							var newval = (newentry.Value == null) ? null : newentry.Value.ToString();
							var oldval = (oldentry.Value == null) ? null : oldentry.Value.ToString();

							if (newval != oldval)
							{
								SQL_utils sql = new SQL_utils("backend");
								string sqlcode = String.Format("update tblAction set actiontext=replace(actiontext,'{0}','{1}') where studyactionID={2}"
									, oldval, newval, pkvalue);

								sql.NonQuery_from_SQLstring(sqlcode);
							}

						}
					}
				}
			}
		}
		DxDbOps.BuildUpdateSqlCode(e, GridnameToTable(gv.ClientInstanceName), "backend");

		((ASPxGridView)sender).JSProperties["cpIsUpdated"] = gv.ClientInstanceName.ToString();
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void dxgrid_OnRowDeleting(object sender, ASPxDataDeletingEventArgs e)
	{
		bool proceed_as_normal = true;
		ASPxGridView gv = (ASPxGridView)sender;
		string result = "Error (uninitialized.)";

		#region Conditions for specific grids
		//For people, first check if there are any subjects
		if (gv.ClientInstanceName == "grid_tblgroup")
		{
			var pk = e.Keys[0];
			SQL_utils sql = new SQL_utils("backend");
			int n = sql.IntScalar_from_SQLstring("select count(*) from tblSubject where groupID=" + pk.ToString());
			
			if (n > 0)
			{
				string study = (n == 1) ? " study" : " studies";
				string subject = (n == 1) ? " this subject" : " these subjects";
				string msg = "This group is assigned to " + n.ToString() + " subjects.  Please delete these first.";
				result = msg;
				proceed_as_normal = false;
			}
			else{

				try
				{
					sql.NonQuery_from_SQLstring("delete from tblStudyActionGroup where groupID=" + pk.ToString());
					sql.NonQuery_from_SQLstring("delete from tblStudyMeasGroup where groupID=" + pk.ToString());
					sql.NonQuery_from_SQLstring("delete from tblLabGroup_Staff where labgroupID in (select labgroupID from tblLabGroup where groupID=" + pk.ToString() + ")");
					sql.NonQuery_from_SQLstring("delete from tblLabGroup where groupID =" + pk.ToString());
				}
				catch (Exception ex)
				{ }
			}
			sql.Close();
		}


		#endregion


		if (proceed_as_normal)
		{
			result = DxDbOps.BuildDeleteSqlCode(e, GridnameToTable(gv.ClientInstanceName), "backend");
		}


		//
		((ASPxGridView)sender).JSProperties["cpIsUpdated"] = String.Format("DELETED.{0}", result);
		gv.CancelEdit();
		e.Cancel = true;

		RefreshGrids();
	}
	#endregion

	protected void RefreshGrids()
	{
		grid_tblstudyaction.DataBind();
		grid_tblstudymeas.DataBind();
		grid_tblconsentform.DataBind();

		grid_MeasNotInAction.DataBind();
		grid_MeasInAction.DataBind();
		grid_Timepoint_Mismatch.DataBind();

		grid_ConsentNotInAction.DataBind();
		grid_ConsentInAction.DataBind();
		grid_Consent_Timepoint_Mismatch.DataBind();
	}



	protected void dxgridSAM_DataBound(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt_grps = sql.DataTable_from_SQLstring("select * from tblgroup where studyID=" + Master.Master_studyID.ToString());
		sql.Close();

		ASPxGridView grid = sender as ASPxGridView;
		string prefix = GetPrefix(grid);


		//Check to see if these have been added
		bool hasCol = (grid.Columns.IndexOf(grid.Columns["CommandColumnGroups"]) != -1) ? true : false;

		if (hasCol)
		{
			grid.Columns.Remove(grid.Columns["CommandColumnGroups"]);
		}

		GridViewCommandColumn col = new GridViewCommandColumn();
		col.Name = "CommandColumnGroups";


		foreach (DataRow row in dt_grps.Rows)
		{
			string groupID = row["groupID"].ToString();
			string groupabbr = row["groupabbr"].ToString();

			GridViewCommandColumnCustomButton but = new GridViewCommandColumnCustomButton();
			but.ID = String.Format("{0}grp{1}", prefix, groupID);
			but.Text = groupabbr;
			but.Styles.Native = true;
			
			col.CustomButtons.Add(but);
		}

		grid.Columns.Add(col);
	}

	protected string GetPrefix(ASPxGridView grid)
	{
		string prefix = "";
		if (grid.ID == "grid_tblstudyaction") prefix = "sa";
		else if (grid.ID == "grid_tblstudymeas") prefix = "sm";
		else if (grid.ID == "grid_tblconsentform") prefix = "cf";

		return prefix;

	}


	protected void gridSAM_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
	{
		var x = 0;

		ASPxGridView grid = (ASPxGridView)sender;
		string prefix = GetPrefix(grid);

		string v = grid.GetRowValues(e.VisibleIndex, "groupIDs").ToString();

		List<string> groupIDs = v.Split(',').ToList();

		string thisgrpID = e.ButtonID.Replace(String.Format("{0}grp", prefix), "");

		if (groupIDs.Contains(thisgrpID))
		{
			e.Styles.Style.Font.Bold = true;
			e.Styles.Style.ForeColor = Color.Green;
		}
		else
		{
			e.Styles.Style.ForeColor = Color.LightGray;
		}

	}


	//Rebind the grids so that the custom buttons are properly formatted for managing groups.
	// The call of this method originates in the CRUD methods that set the JSProperties, then the ClientCallback, calls these.
	protected void gridSA_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
	{
		grid_tblstudyaction.DataBind();
	}
	protected void gridSM_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
	{
		grid_tblstudymeas.DataBind();
	}




	protected void gridSA_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
	{

		var ID = e.ButtonID;

		ASPxGridView grid = (ASPxGridView)sender;

		int studyactionID = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "studyactionID").ToString());
		int groupID = Convert.ToInt32(e.ButtonID.Replace("sagrp", ""));

		if(groupID > 0 && studyactionID > 0)
		{
			ToggleGroup(groupID, "studyaction", studyactionID);
		}
	}


	protected void gridSM_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
	{

		var ID = e.ButtonID;

		ASPxGridView grid = (ASPxGridView)sender;

		int studymeasID = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "studymeasID").ToString());
		int groupID = Convert.ToInt32(e.ButtonID.Replace("smgrp", ""));

		if (groupID > 0 && studymeasID > 0)
		{
			ToggleGroup(groupID, "studymeas", studymeasID);
		}
	}

	protected void gridCF_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
	{

		var ID = e.ButtonID;

		ASPxGridView grid = (ASPxGridView)sender;

		int consentformID = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "consentformID").ToString());
		int groupID = Convert.ToInt32(e.ButtonID.Replace("cfgrp", ""));

		if (groupID > 0 && consentformID > 0)
		{
			ToggleGroup(groupID, "consentform", consentformID);
		}
	}



	protected void grid_tblstudymeas_OnHtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
	{
		if (e.RowType != GridViewRowType.Data)
			return;
		string studymeasname = e.GetValue("StudyMeasName").ToString();
		string color = "Lime";
		if (studymeasname.EndsWith("(REL)"))
		{
			color = "PowderBlue";
		}
		else {
			color = "White";
		}
		Color c = Color.FromName(color);
		//this works
		//e.Row.BackColor = c;

		//this does not work
		e.Row.BackColor = c;

	}



	protected void ToggleGroup(int groupID, string type, int pk)
	{
		SQL_utils sql = new SQL_utils("backend");
		//New or Existing?
		string sql_exists = String.Format("select count(*) from tbl{0}Group where groupID={1} and {0}ID={2}", type, groupID, pk);
		int n_exists = sql.IntScalar_from_SQLstring(sql_exists);

		bool isNew = (n_exists > 0) ? false : true;

		if (isNew)
		{
			string insert = String.Format("insert into tbl{0}Group(groupID, {0}ID) values({1},{2})", type, groupID, pk);
			try
			{
				sql.NonQuery_from_SQLstring(insert);

				sql.NonQuery_from_SQLstring(String.Format("exec spAddNew{0}_to_Subj_who_need_it {1}, 'insert'", type, pk));    

				if (type == "studyaction")
				{
					grid_tblstudyaction.DataBind();
				}
				else if (type == "studymeas")
				{
					grid_tblstudymeas.DataBind();
				}
				else if (type == "consentform")
				{
					grid_tblconsentform.DataBind();
				}
			}
			catch (Exception ex) { }
		}
		else
		{
			//Remove assignments to this studyaction
			if (type == "studyaction")
			{
				try
				{
					string removeSM = String.Format("update tblstudymeasgroup set studyactiongroupID = null where studyactiongroupID in (select studyactiongroupID from tblstudyactiongroup where studyactionID={0})", pk);
					string removeCF = String.Format("update tblconsentformgroup set studyactiongroupID = null where studyactiongroupID in (select studyactiongroupID from tblstudyactiongroup where studyactionID={0})", pk);
					sql.NonQuery_from_SQLstring(removeSM);
					sql.NonQuery_from_SQLstring(removeCF);
					

				}
				catch (Exception ex) { }

			}

			try
			{
				string remove1 = String.Format("delete from tbl{0}Group where groupID={1} and {0}ID={2}", type, groupID, pk);
				sql.NonQuery_from_SQLstring(remove1);
			}
			catch(Exception ex) { }

		}

		//Update the status based on the changes
		string updatestatus = String.Format("exec spUpdateStatus_after_ToggleGroup {0}, '{1}', {2}", groupID, type, pk);
		try
		{
			sql.NonQuery_from_SQLstring(updatestatus);

		}
		catch (Exception ex) { }


		if (type == "studyaction")
		{
			grid_tblstudyaction.DataBind();
		}
		else if (type == "studymeas")
		{
			grid_tblstudymeas.DataBind();
		}
		else if (type == "consentform")
		{
			grid_tblconsentform.DataBind();
		}

		sql.Close();
	}




	protected void grid_MeasNotInAction_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
	{
		if (e.Column.FieldName == "studyactiongroupID")
		{
			var combo = (ASPxComboBox)e.Editor;
			combo.Callback += new CallbackEventHandlerBase(combo_Callback);

			var grid = e.Column.Grid;
			if (!combo.IsCallback)
			{
				var timepointID = -1;
				var groupID = -1;
				if (!grid.IsNewRowEditing)
				{
					timepointID = (int)grid.GetRowValues(e.VisibleIndex, "timepointID");
					groupID = (int)grid.GetRowValues(e.VisibleIndex, "groupID");
					FillStudyActionGroupComboBox(combo, timepointID, groupID);
				}
			}
		}
	}

	protected void grid_ConsentNotInAction_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
	{
		if (e.Column.FieldName == "studyactiongroupID")
		{
			var combo = (ASPxComboBox)e.Editor;
			combo.Callback += new CallbackEventHandlerBase(combo_Callback);

			var grid = e.Column.Grid;
			if (!combo.IsCallback)
			{
				var timepointID = -1;
				var groupID = -1;
				if (!grid.IsNewRowEditing)
				{
					timepointID = (int)grid.GetRowValues(e.VisibleIndex, "timepointID");
					groupID = (int)grid.GetRowValues(e.VisibleIndex, "groupID");
					FillStudyActionGroupComboBox(combo, timepointID, groupID);
				}
			}
		}
	}


	private void combo_Callback(object sender, CallbackEventArgsBase e)
	{
		var timepointID = -1;
		var groupID = -1;
		Int32.TryParse(e.Parameter, out timepointID);

		FillStudyActionGroupComboBox(sender as ASPxComboBox, timepointID, groupID);

	}

	protected void FillStudyActionGroupComboBox(ASPxComboBox combo, int timepointID, int groupID)
	{
		combo.DataSourceID = "sql_StudyActionGroups";
		sql_StudyActionGroups.SelectParameters["timepointID"].DefaultValue = timepointID.ToString();
		sql_StudyActionGroups.SelectParameters["groupID"].DefaultValue = groupID.ToString();
		combo.DataBindItems();

		combo.Items.Insert(0, new ListEditItem("", null)); // Null Item
	}





	protected string GridnameToTable(string grid)
	{
		     if (grid == "grid_tblstudyaction") return "tblstudyaction";
		else if (grid == "grid_tblstudymeas") return "tblstudymeas";
		else if (grid == "grid_tblconsentform") return "tblconsentform";
		else if (grid == "grid_tbltimepoint") return "tbltimepoint";
		else if (grid == "grid_tblgroup") return "tblgroup";
		else if (grid == "grid_MeasInAction") return "tblStudyMeasGroup";
		else if (grid == "grid_MeasNotInAction") return "tblStudyMeasGroup";
		else if (grid == "grid_tblsubjstatus") return "tblss";

		else return "";
	}

	protected void btnBulkAssign_OnClick (object sender, EventArgs e)
	{
		var x = grid_tblstudymeas.GetSelectedFieldValues("studymeasID");
		int studyactionID = Convert.ToInt32(cboStudyActionContainer.Value);

		List<string> studymeasIDs = new List<string>();

		for(int i=0; i < x.Count; i++)
		{
			int studymeasID = Convert.ToInt32(x[i].ToString());
			if (studymeasID > 0)
			{
				studymeasIDs.Add(studymeasID.ToString());
			}
		}

		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = " update tblstudymeasgroup  set studyactiongroupID = b.studyactiongroupID " +
			" from tblStudyActionGroup b " +
			" where tblstudymeasgroup.studymeasID in (" + String.Join(",", studymeasIDs) + ") " +
			" and b.studyactionID = " + studyactionID.ToString() +
			" and tblstudymeasgroup.groupID = b.groupID " +
			" and tblstudymeasgroup.studymeasID in (select studymeasID from tblstudymeas where timepointID = " +
			"         (select timepointID from tblStudyAction where studyactionID=" + studyactionID.ToString() + "))";

		try
		{
			sql.NonQuery_from_SQLstring(sqlcode);
		}
		catch (Exception ex) { }

		sql.Close();


		Response.Redirect("StudyDesign.aspx");
	}


	//protected void btnAssignMtoSA_OnClick(object sender, EventArgs e)
	//{
	//	var x = grid_MeasNotInAction.GetSelectedFieldValues("studymeasgroupID");
	//	int studyactionID = Convert.ToInt32(cboStudyAction_for_Meas.Value);

	//	if(x.Count > 0 & studyactionID > 0)
	//	{
	//		int foo = 0;
	//	}

		
	//}

	protected void btnBulkAssign2_OnClick(object sender, EventArgs e)
	{
		var x = grid_tblconsentform.GetSelectedFieldValues("consentformID");
		int studyactionID = Convert.ToInt32(cboStudyActionContainer2.Value);

		List<string> consentformIDs = new List<string>();

		for (int i = 0; i < x.Count; i++)
		{
			int consentformID = Convert.ToInt32(x[i].ToString());
			if (consentformID > 0)
			{
				consentformIDs.Add(consentformID.ToString());
			}
		}

		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = " update tblconsentformgroup  set studyactiongroupID = b.studyactiongroupID " +
			" from tblStudyActionGroup b " +
			" where tblconsentformgroup.consentformID in (" + String.Join(",", consentformIDs) + ") " +
			" and b.studyactionID = " + studyactionID.ToString() +
			" and tblconsentformgroup.groupID = b.groupID " +
			" and tblconsentformgroup.consentformID in (select consentformID  from tblconsentform where studyID = " + Master.Master_studyID.ToString() + ")";

		try
		{
			sql.NonQuery_from_SQLstring(sqlcode);
		}
		catch (Exception ex) { }

		sql.Close();


		Response.Redirect("StudyDesign.aspx");
	}

	//protected void btnCancelBulkAssign_OnClick(object sender, EventArgs e)
	//{
		
	//}

		

	protected void btnREL_OnClick(object sender, EventArgs e)
	{
		var x = grid_tblstudymeas.GetSelectedFieldValues("studymeasID");

		SQL_utils sql = new SQL_utils("backend");

		for (int i = 0; i < x.Count; i++)
		{
			int studymeasID = Convert.ToInt32(x[i].ToString());
			if (studymeasID > 0)
			{

				string sqlcode = "exec spStudyDesign_add_reliability_StudyMeas " + studymeasID.ToString();

				try
				{
					sql.NonQuery_from_SQLstring(sqlcode);
				}
				catch (Exception ex) { }

			}
		}

		sql.Close();

		Response.Redirect("StudyDesign.aspx");

	}

		//protected DataTable GetStudyActions()
		//{
		//	SQL_utils sql = new SQL_utils("backend");

		//	DataTable dt_grps = sql.DataTable_from_SQLstring("select * from tblgroup where studyID=" + Master.Master_studyID.ToString());
		//	List<string> sql_join = new List<string>();
		//	List<string> sql_fld = new List<string>();



		//	foreach(DataRow row in dt_grps.Rows)
		//	{
		//		string groupID = row["groupID"].ToString();
		//		string tmp_fld = String.Format(",coalesce(grp{0},0) grp{0}", groupID);
		//		sql_fld.Add(tmp_fld);
		//		string tmp_join = String.Format(" left join (select *, groupID as grp{0} from tblStudyActionGroup where groupID={0}) g{0} ON sa.studyactionID = g{0}.studyactionID", groupID);
		//		sql_join.Add(tmp_join);
		//	}

		//	string sql1 = String.Format("Select sa.* {0} from tblstudyaction sa {1} where sa.studyID={2}"
		//		, String.Join("", sql_fld), String.Join("", sql_join), Master.Master_studyID);

		//	DataTable dt_sa = sql.DataTable_from_SQLstring(sql1);

		//	return dt_sa;
		//}



	}

