using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
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


public partial class Admin_LabGroups : BasePage
{
	private List<string> entities;
	private bool needrefresh;

	protected void Page_Init(object sender, EventArgs e)
	{

		if (!IsPostBack)
		{
			//LoadTimepoints();
		}

	}
	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		//lblStudyname.Text = Master.Master_studyname;

		//sql_Group.DataBind();
		//LoadEntities();

		Response.Redirect(Request.Url.ToString());


	}

	protected void Page_Load(object sender, EventArgs e)
	{
		//CHeck who this is:
		bool isPostback = IsPostBack;
		bool isCallback = IsCallback;


		if (!IsPostBack)
		{
			//lblStudyname.Text = Master.Master_studyname;

		}
		if (IsCallback)
		{
			//if (Session["labgroups_staff"] != null)
			//{
			//	DataTable dt = (DataTable)Session["labgroups_staff"];
			//	if (dt.Rows.Count > 0)
			//	{
			//		gridStaffGroup.DataSource = dt;
			//		gridStaffGroup.DataBind();
			//	}

			//}

		}

	}

	protected void cboLab_OnSelectedIndexChanged(object sender, EventArgs e)
	{

		var x = cboLab.Value;

		string sqlcode = String.Format("select * from tblLabGroups where ");

		gridStudies.Visible = true;
		btnLoadStaff.Visible = true;
	}





	protected void btnLoadStaff_OnClick(object sender, EventArgs e)
	{
		int labID = Convert.ToInt32(cboLab.Value);

		SQL_utils sql = new SQL_utils("backend");

		string studyIDs_csv = uwac.trk.dataops.GetCSV(gridStudies.GridView.GetSelectedFieldValues("studyID"));
		
		string sqlcode = String.Format("select * from vwSEC_AllowedGroups_By_StaffID where studyID in ({0}) and StaffName not in ('{1}','{2}')", studyIDs_csv, "aut user", "autsys TestAcct");
		
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		Session["labstaff"] = dt;
		

		pivotStaff.DataSource = dt;
		pivotStaff.DataBind();

		pageControl1.Visible = true;
		
		sql.Close();
	}




	protected void cboStaffInLab_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		DataTable dt = GetStaffToEdit();
		Session["labgroups_staff"] = dt;
		gridEditStaff.DataSource = dt;

		gridEditStaff.DataBind();
	}

	protected void cboStaffNotInLab_OnSelectedIndexChanged(object sender, EventArgs e)
	{



	}


	protected DataTable  GetStaffToEdit()
	{
		SQL_utils sql = new SQL_utils("backend");

		int staffID = Convert.ToInt32(cboStaffInLab.Value.ToString());
		int labID = Convert.ToInt32(cboLab.Value.ToString());

		string studyIDs_csv = uwac.trk.dataops.GetCSV(gridStudies.GridView.GetSelectedFieldValues("studyID"));
		string code1 = String.Format("select coalesce(labgroup_staffID, -1 * a.labgroupID) labgroup_staffID, studyname, groupname, a.labgroupID, a.groupID, staffID, coalesce(b.dbroleID, 0) dbroleID, coalesce(dbrole, '*NONE*') dbrole " +
			" from tbllabgroup a  " +
			" join tblgroup a1 ON a.groupID=a1.groupID " +
			" join (select * from tblstudy  where studyID in ({0})) a2 ON a1.studyID=a2.studyID " +
			" left join (select * from tblLabgroup_staff where staffID = {1}) b ON a.labgroupID = b.labgroupID " +
			" left join tblDBrole_lkup c ON b.dbroleID = c.dbroleID " +
			" where a.labID = {2}", studyIDs_csv, staffID, labID);

		DataTable dt1 = sql.DataTable_from_SQLstring(code1);
		sql.Close();

		int n1 = dt1.Rows.Count;

		return dt1;
	}


	
	protected void gridEditStaff_OnDataBinding(object sender, EventArgs e)
	{
		//(sender as ASPxGridView).DataSource = GetStaffDetails();
		if (Session["labgroups_staff"] != null)
		{
			(sender as ASPxGridView).DataSource = Session["labgroups_staff"];
		}
		else
		{
			(sender as ASPxGridView).DataSource = GetStaffToEdit();
		}

		gridEditStaff.Visible = true;

		string staffname = cboStaffInLab.Text;
		lblStaffEditing.Text = String.Format("Editing: {0}", staffname);

	}

	protected void gridEditStaff_OnCellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
	{
		if(e.Column.FieldName=="dbroleID")
		{
			e.Editor.ReadOnly = false;
		}

	}

	protected void gridEditStaff_BatchUpdate(object sender, ASPxDataBatchUpdateEventArgs e)
	{

		List<bool> results = new List<bool>();

		foreach (ASPxDataUpdateValues args in e.UpdateValues)
		{
			if (Convert.ToInt32(args.Keys[0].ToString()) < 0)
			{
				//Add staffID to the NewValues
				int staffID = Convert.ToInt32(cboStaffInLab.Value.ToString());
				args.NewValues["staffID"] = staffID;

				bool result = DxGridView.BuildInsertSqlCode(args.NewValues, "tbllabgroup_staff", "backend");
				results.Add(result);

				if (result) needrefresh = true;
			}
			else
			{
				bool result = DxGridView.BuildUpdateSqlCode(args, "tbllabgroup_staff", "backend");
				results.Add(result);
				if (result) needrefresh = true;
			}
		}

		e.Handled = true;

	}

	
	protected void CancelEditing(CancelEventArgs e)
	{
		e.Cancel = true;
		gridEditStaff.CancelEdit();
	}



}