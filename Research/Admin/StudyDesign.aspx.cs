using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Obout.Grid;
using Obout.Interface;
using Obout.ListBox; 
using Obout.Ajax.UI.TreeView;

using uwac;



public partial class Admin_StudyDesign : OboutInc.oboutAJAXPage //System.Web.UI.Page
{
	private oboutGrid_utils o;
	private List<string> entities;
	public Tree ObTree;

	protected void Page_Init(object sender, EventArgs e)
	{
		entities = new List<string> { "tblgroup", "tbltimepoint", "tblsubjstatus", "tblstudyaction", "tblstudymeas" };
		o = new oboutGrid_utils();

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
		// if Y

		if (!IsPostBack)
		{
			lblStudyname.Text = Master.Master_studyname;

			LoadEntities();
			LoadSelect2controls();


			

			//grid_studymeas.CssSettings["CSSRowEditTemplate"] = "rowedittemplate_css";
		}


		grid_tblstudymeas.CssSettings.CSSRowEditTemplate = "rowedittemplate_css";
	}

	protected void LoadHypterlinks_for_new_entities()
	{
		hypSubjStatus.NavigateUrl="~/admin/editentity.aspx?tbl=" + utilCrypt.Encrypt("tblSS")+"&detail=" + utilCrypt.Encrypt("tblSSD") +"&usestudy=" + utilCrypt.Encrypt("y");

		hypNEW_ActionType.NavigateUrl = "~/admin/editentity.aspx?tbl=" + utilCrypt.Encrypt("tblActionType_lkup") + "&detail=" + utilCrypt.Encrypt("tblActionTypeStatus_lkup");

		hypMeasure.NavigateUrl = "~/admin/editentity.aspx?tbl=" + utilCrypt.Encrypt("tblMeasure");

	}


	protected void LoadEntities()
	{
		LoadEntities(entities);
	}

	protected void LoadEntities(List<string> entities)
	{
		foreach(string e in entities)
		{
			LoadEntity(e);
		}
	}


	protected void LoadEntity(string entity)
	{
		SQL_utils sql = new SQL_utils("backend");
		string sqlcmd = "";

		switch(entity)
		{
			case "tblgroup":
				sqlcmd = "select 'group' objtype, groupID objpk, * from tblGroup where studyID = " + Master.Master_studyID.ToString();
				break;
			case "tbltimepoint":
				sqlcmd = "select 'timepoint' objtype, timepointID objpk, * from tbltimepoint where studyID = " + Master.Master_studyID.ToString();
				break;
			case "tblsubjstatus":
				sqlcmd = "select 'subjstatus' objtype, ssID objpk,  * from tblSS where studyID = " + Master.Master_studyID.ToString() ;
				break;
			case "tblstudyaction":
				sqlcmd = "select 'studyaction' objtype, studyactionID objpk, *, dbo.fnCSV_GetLinkedIDs('studyaction','group',studyactionID,',') groupIDs  , dbo.fnCSV_GetLinkedIDs_text('studyaction','group',studyactionID, ',') groupabbrs from vwstudyaction where studyID = " + Master.Master_studyID.ToString() + " order by timepoint, sortorder";
				break;
			case "tblstudymeas":
				sqlcmd = "select 'studymeas' objtype, studymeasID objpk, *, dbo.fnCSV_GetLinkedIDs('studymeas','group',studymeasID, ',') groupIDs , dbo.fnCSV_GetLinkedIDs_text('studymeas','group',studymeasID, ',') groupabbrs from vwstudymeas where studyID = " + Master.Master_studyID.ToString() + " order by timepoint, sortorder";
				break;
		}

		DataTable dt = sql.DataTable_from_SQLstring(sqlcmd);

		Grid grid = (Grid)Page.FindControlRecursive("grid_" + entity);

		// extract the current grouping - it can be "Timepoint" or whatever column the end users grouped by
		string currentGroupBy = grid.GroupBy;


		grid.DataSource = dt;
		// resetting the GroupBy
		grid.GroupBy = currentGroupBy;
		grid.DataBind();

		sql.Close();

	}

	protected void LoadSelect2controls()
	{
		SQL_utils sql = new SQL_utils("backend");

		DataTable grps = sql.DataTable_from_SQLstring("select 'tblgroup' objtype, groupID objpk, * from tblGroup where studyID = " + Master.Master_studyID.ToString());

		//StudyAction groups
		HtmlSelect selStudyActionGroup = grid_tblstudymeas.Templates[0].Container.FindControl("selStudyActionGroup") as HtmlSelect;
		if (selStudyActionGroup != null)
		{
			utilSelect2.loaditems(selStudyActionGroup, grps, "groupID", "groupname");
		}

		//StudyMeas groups
		HtmlSelect selStudyMeasGroup = grid_tblstudymeas.Templates[0].Container.FindControl("selStudyMeasGroup") as HtmlSelect;
		if (selStudyMeasGroup != null)
		{
			utilSelect2.loaditems(selStudyMeasGroup, grps, "groupID", "groupname");
		}




		sql.Close();
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

		UpdatePanel("callbackPanel_" + entity);

		// create a timer that will clear the msg in 5 seconds
		CreateTimer("MyTimer", "ClearMsg('" + "callbackPanel_" + entity + "_Content')", 12000);

	}


	public void ServerCancelTimer()
	{
		CancelTimer("MyTimer");
	}


	protected string GetControlIdFromTemplate(string gridname, string controlId, int templateIndex, string idtype)
	{
		Grid grid = (Grid)Page.FindControlRecursive("grid_" + gridname);

		Control ctrl = grid.Templates[templateIndex].Container.FindControl(controlId);

		
		switch (idtype) {
			case "client":
				return ctrl.ClientID;
			case "unique":
				return ctrl.UniqueID;
			default:
				return ctrl.UniqueID;
		}

	}

	protected string GetControlUniqueIdFromTemplate(string gridname, string controlId, int templateIndex)
	{
		Grid grid = (Grid)Page.FindControlRecursive("grid_" + gridname);

		Control ctrl = grid.Templates[templateIndex].Container.FindControl(controlId);

		return ctrl.UniqueID;
	}

	protected string GetControlClientIdFromTemplate2(string gridname, string controlId, int templateIndex)
	{
		Grid grid = (Grid)Page.FindControlRecursive("grid_" + gridname);

		Control ctrl = grid.Templates[templateIndex].Container.FindControl(controlId);

		return ctrl.ClientID;
	}


	#endregion





	protected void grid_tblgroup_InsertCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "insert", "tblgroup", "backend", "dbo", "groupid"); }
	protected void grid_tblgroup_UpdateCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "update", "tblgroup", "backend", "dbo", "groupid"); }
	protected void grid_tblgroup_DeleteCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "delete", "tblgroup", "backend", "dbo","groupid"); }
	protected void grid_tbltimepoint_InsertCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "insert", "tbltimepoint", "backend", "dbo", "timepointid"); }
	protected void grid_tbltimepoint_UpdateCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "update", "tbltimepoint", "backend", "dbo", "timepointid"); }
	protected void grid_tbltimepoint_DeleteCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "delete", "tbltimepoint", "backend", "dbo", "timepointid"); }
	protected void grid_tblstudyaction_InsertCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "insert", "tblstudyaction", "backend", "dbo", "studyactionid"); }
	protected void grid_tblstudyaction_UpdateCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "update", "tblstudyaction", "backend", "dbo", "studyactionid"); }
	protected void grid_tblstudyaction_DeleteCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "delete", "tblstudyaction", "backend", "dbo","studyactionid"); }
	protected void grid_tblstudymeas_InsertCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "insert", "tblstudymeas", "backend", "dbo", "studymeasid", "groupIDs", "hidStudyMeasGroup"); }
	protected void grid_tblstudymeas_UpdateCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "update", "tblstudymeas", "backend", "dbo", "studymeasid", "groupIDs", "hidStudyMeasGroup"); }
	protected void grid_tblstudymeas_DeleteCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "delete", "tblstudymeas", "backend", "dbo","studymeasid"); }
	protected void grid_tblsubjstatus_InsertCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "insert", "tblsubjstatus", "backend", "dbo", "subjstatusID"); }
	protected void grid_tblsubjstatus_UpdateCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "update", "tblsubjstatus", "backend", "dbo", "subjstatusID"); }
	protected void grid_tblsubjstatus_DeleteCommand(object sender, GridRecordEventArgs e) { PrepDBAction(e, "delete", "tblsubjstatus", "backend", "dbo","subjstatusID"); }


	[WebMethod]
	public static void Update(string tbl, string mode, Object e)
	{
		//Dictionary<string, object> d = (Dictionary<string, object>)e;
		//Hashtable hash = new Hashtable(d);

		//oboutGrid_utils o = new oboutGrid_utils();
		////string result = o.oGrid_UpdateData(hash, tbl, "backend", "dbo", "studymeasID");

		//string entity = tbl.ToLower();
		//o.ProcessGridAction(hash, mode, entity, "1081");
		//string x = "";
		////LoadEntity(entity);
	}


	protected Hashtable AddStudyIDToHash(Hashtable hash)
	{
		bool has_studyid = false;
		foreach(string s in hash.Keys)
		{
			if(s.ToLower() == "studyid") has_studyid = true;
		}

		if(!has_studyid)
		{
			hash.Add("studyID", Master.Master_studyID.ToString());
		}
		else
		{
			if (hash["studyid"].ToString() == "") hash["studyid"] = Master.Master_studyID.ToString();
			if (hash["studyID"].ToString() == "") hash["studyID"] = Master.Master_studyID.ToString();
		}

		return hash;
	}


	protected void PrepDBAction(GridRecordEventArgs e, string mode, string tbl, string db, string schema, string pkfld)
	{
		Hashtable hash = e.Record;
		hash = AddStudyIDToHash(hash);
		oboutGrid_utils o = new oboutGrid_utils();
		o.ExecuteDBAction(hash, mode, tbl, db, schema, pkfld);

		LoadEntity(tbl);
	}


	protected void PrepDBAction(GridRecordEventArgs e, string mode, string tbl, string db, string schema, string pkfld, string fld_to_override, string ctl_with_override_value)
	{
		Hashtable hash = e.Record;
		hash = AddStudyIDToHash(hash);
		oboutGrid_utils o = new oboutGrid_utils();

		HiddenField hid = (HiddenField)Page.FindControlRecursive(ctl_with_override_value);

		string newval = hid.Value;
		hash[fld_to_override] = newval;

		o.ExecuteDBAction(hash, mode, tbl, db, schema, pkfld);

		LoadEntity(tbl);
	}



	#region old
	//public void ProcessGridAction(Hashtable hash , string mode, string entity)
	//{
	//    string msg = "";
	//    string str_studyid = Master.Master_studyID.ToString();
	//    oboutGrid_utils o = new oboutGrid_utils();

	//    if(entity == "timepoint")
	//    {
	//        if(mode == "insert")
	//        {
	//            if (hash["studyID"] == "") hash["studyID"] = str_studyid;
	//            msg = o.oGrid_InsertData(hash, "tblTimepoint", "backend", "dbo", "TimepointID", 0);
	//        }
	//        else if (mode == "update")
	//        {
	//            msg = o.oGrid_UpdateData(hash, "tblTimepoint", "backend", "dbo", "TimepointID");
	//        }
	//        else if (mode == "delete")
	//        {
	//            msg = o.oGrid_DeleteData("tbltimepoint", "backend", "dbo", "timepointID", Convert.ToInt32(hash["timepointID"].ToString()), true);
	//        }
	//    }
	//    else if (entity == "group")
	//    {
	//        if (mode == "insert")
	//        {
	//            if (hash["studyID"] == "") hash["studyID"] = str_studyid;
	//            msg = o.oGrid_InsertData(hash, "tblGroup", "backend", "dbo", "groupID", 0);
	//        }
	//        else if (mode == "update")
	//        {
	//            msg = o.oGrid_UpdateData(hash, "tblGroup", "backend", "dbo", "groupID");
	//        }
	//        else if (mode == "delete")
	//        {
	//            msg = o.oGrid_DeleteData("tblGroup", "backend", "dbo", "groupID", Convert.ToInt32(hash["groupID"].ToString()), true);
	//        }
	//    }
	//    else if (entity == "subjstatus")
	//    {
	//        if (mode == "insert")
	//        {
	//            if (hash["studyID"] == "") hash["studyID"] = str_studyid;
	//            msg = o.oGrid_InsertData(hash, "tblSS", "backend", "dbo", "ssID", 0);
	//        }
	//        else if (mode == "update")
	//        {
	//            msg = o.oGrid_UpdateData(hash, "tblSS", "backend", "dbo", "ssID");
	//        }
	//        else if (mode == "delete")
	//        {
	//            msg = o.oGrid_DeleteData("tblSS", "backend", "dbo", "ssID", Convert.ToInt32(hash["ssID"].ToString()), true);
	//        }
	//    }
	//    else if (entity == "studyaction")
	//    {
	//        if (mode == "insert")
	//        {
	//            if (hash["studyID"] == "") hash["studyID"] = str_studyid;
	//            msg = o.oGrid_InsertData(hash, "tblStudyaction", "backend", "dbo", "studyactionID", 0);
	//        }
	//        else if (mode == "update")
	//        {
	//            msg = o.oGrid_UpdateData(hash, "tblStudyaction", "backend", "dbo", "studyactionID");
	//        }
	//        else if (mode == "delete")
	//        {
	//            msg = o.oGrid_DeleteData("tblStudyaction", "backend", "dbo", "studyactionID", Convert.ToInt32(hash["studyactionID"].ToString()), true);
	//        }
	//    }
	//    else if (entity == "studymeas")
	//    {
	//        if (mode == "insert")
	//        {
	//            if (hash["groupIDs"] == "")
	//            {
	//                msg = "NOT SAVED. Select the groups that will get this measure (Ctl-click for multi-select).";
	//            }
	//            else
	//            {
	//                if (hash["studyID"] == "") hash["studyID"] = str_studyid;
	//                msg = o.oGrid_InsertData(hash, "tblStudymeas", "backend", "dbo", "studymeasID", 0);

	//                string[] groupIDs = hash["groupIDs"].ToString().Split(',');


	//                string newpk = msg.Replace("INSERTED! New pk = ", "");

	//                foreach(string s in groupIDs)
	//                {
	//                    Hashtable hash2 = new Hashtable();
	//                    hash2.Add("groupID", s);
	//                    hash2.Add("studymeasID", newpk);
	//                    string child_msg = o.oGrid_InsertData(hash2, "tblstudymeasgroup", "backend", "dbo", "studymeasgroupID", 0);

	//                    msg += child_msg;

	//                }
	//            }
	//        }
	//        else if (mode == "update")
	//        {
	//            Grid grid_studymeas = (Grid)this.FindControlRecursive("grid_studymeas");

	//            HtmlSelect ctrl = (HtmlSelect)grid_studymeas.Templates[0].Container.FindControl("selStudyMeasGroup");
	//            HiddenField hid = (HiddenField)grid_studymeas.Templates[0].Container.FindControl("hidStudyMeasGroup");

	//            string hidval = hid.Value;
	//            string selected = utilSelect2.getselected_CSVval(ctrl);
	//            string selected2 = utilSelect2.getselected_CSVtxt(ctrl);
	//            List<string> v2 = utilSelect2.getselected_ListVal(ctrl);


	//            msg = o.oGrid_UpdateData(hash, "tblStudymeas", "backend", "dbo", "studymeasID");
	//        }
	//        else if (mode == "delete")
	//        {
				
	//            msg = o.oGrid_DeleteData("tblStudymeas", "backend", "dbo", "studymeasID", Convert.ToInt32(hash["studymeasID"].ToString()), true);
	//        }
	//    }
	//    else  
	//    {
	//        msg = "ProcessGridAction not completed for " + entity;
	//    }


	//    string additional_msg = PostProcessGridAction(mode, entity);

	//    Session[entity + "_msg"] = msg + additional_msg; // +"<br/>" + e.Record["objpk"].ToString();

	//    if(msg.StartsWith("NOT DELETED"))
	//    {
	//        if (entity == "studymeas")
	//        {
	//            Session["studymeasID_toDelete"] = hash["studymeasID"].ToString();
	//            btnOVERRIDE_studymeas.Visible = true;
	//        }
	//        else if (entity == "studyaction")
	//        {
	//            Session["studyactionID_toDelete"] = hash["studyactionID"].ToString();
	//            btnOVERRIDE_studyaction.Visible = true;
	//        }
	//    }

	//    LoadEntity(entity);
	//}
	#endregion



	public string OverrideDelete(string tbl, string schema, string pk, int pkval)
	{
		string msg = "";
		SQL_utils sql = new SQL_utils("backend");

		if(tbl=="tblstudymeas")
		{

			msg += sql.sql_delete(schema, "tblstudymeassubj", pk, pkval, true);  //studymeassubj

		}

		sql.Close();

		return msg;
	}

 

	//StudyDesign Utilities
	// Copy a group - give new group all the same actions and measures
	// Copy a timepoint 
	// Give subjects missing measures and actions

	//Tracking Utilities
	//Delete a subject
	//Change subject's group






	protected void grid_tblstudymeas_RowDataBound(object sender, GridRowEventArgs e)
	{


		if (e.Row.RowType == GridRowType.DataRow)
		{
			e.Row.Style["background-image"] = "none";
			e.Row.Style["background-color"] = (e.Row.RowIndex % 2 == 0) ? "white" : "aliceblue";
		}


	}


	//protected void grid_studymeas_Rebind(object sender, EventArgs e)
	//{
	//    LoadEntity("studymeas");
	//}
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


}