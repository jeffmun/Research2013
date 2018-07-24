﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
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

		}
		if (IsCallback)
		{

		}
		ShowEditTabs();
	}


	protected void ShowEditTabs()
	{
		var x = cboLab.Value;

		if (x != null)
		{
			SQL_utils sql = new SQL_utils("backend");

			int labID = Convert.ToInt32(cboLab.Value.ToString());
			string code = String.Format("select count(*) from tblLabGroup_staff where staffID = sec.systemuser_staffID() and dbroleID=1 and labgroupID in (select labgroupID from tbllabgroup where labID={0})", labID);
			int n = sql.IntScalar_from_SQLstring(code);

			string user = HttpContext.Current.User.Identity.Name;

			string netid = Master.Master_netid;


			bool showeditors = (n > 0 || netid=="jeffmun") ? true : false;


			try
			{
				

				pageControl1.TabPages.FindByName("LabAccess").ClientVisible = showeditors;
				pageControl1.TabPages.FindByName("StaffAccess").ClientVisible = showeditors;
			}
			catch(Exception ex) { }
			sql.Close();
		}

	}


	protected void cboLab_OnSelectedIndexChanged(object sender, EventArgs e)
	{

		var x = cboLab.Value;

		string sqlcode = String.Format("select * from tblLabGroups where ");

		pageControl1.ClientVisible = true;
		gridStudies.Visible = true;
		btnLoadStaff.Visible = true;

		cboStaffInLab.SelectedIndex = -1;
		lblStaffEditing.Text = "";
		gridEditStaff.Visible = false;
		lblInstructions.Visible = false;
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

		string studyID_whereclause = (studyIDs_csv == null) ? " > 0 " : String.Format(" in ({0}) ", studyIDs_csv);

		string code1 = String.Format("select coalesce(labgroup_staffID, -1 * a.labgroupID) labgroup_staffID, studyname, groupname, a.labgroupID, a.groupID, staffID, coalesce(b.dbroleID, 0) dbroleID, coalesce(dbrole, '*NONE*') dbrole " +
			" from tbllabgroup a  " +
			" join tblgroup a1 ON a.groupID=a1.groupID " +
			" join (select * from tblstudy  where studyID {0}) a2 ON a1.studyID=a2.studyID " +
			" left join (select * from tblLabgroup_staff where staffID = {1}) b ON a.labgroupID = b.labgroupID " +
			" left join tblDBrole_lkup c ON b.dbroleID = c.dbroleID " +
			" where a.labID = {2}  order by studyname, groupname ", studyID_whereclause, staffID, labID);

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
		lblInstructions.Visible = true;


		string staffname = cboStaffInLab.Text;
		lblStaffEditing.Text = String.Format("Editing: {0}", staffname);

	}

	//protected void trkColorCorrectionFactor_OnPositionChanged(object sender, EventArgs e)
	//{
	//	gridEditStaff.DataBind();
	//}

	protected void gridEditStaff_OnHtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
	{
		if (e.DataColumn.FieldName == "dbroleID")
		{
			if (e.CellValue != null)
			{
				string colorname = GetDBroleIDColor(e.CellValue.ToString());
				Color colorbase = Color.FromName(colorname);

				var x = (100 - Convert.ToSingle(trkColorCorrectionFactor.Value)) / 100f;
				Color color = ChangeColorBrightness(colorbase, x);

				e.Cell.BackColor = color;

				if (colorname == "Black" && x < .3) e.Cell.ForeColor = Color.White;
			}
		}
	}


	protected void gridEditStaff_OnCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
	{
		gridEditStaff.DataBind();
	}

	protected void gridEditStaff_OnCellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
	{
		if(e.Column.FieldName=="dbroleID")
		{
			e.Editor.ReadOnly = false;
			(e.Editor as ASPxComboBox).ItemTextCellPrepared += cboRole_ItemTextCellPrepared;

		}

	}

	private void cboRole_ItemTextCellPrepared(object sender, ListBoxItemTextCellPreparedEventArgs e)
	{
		string fieldname = (e.Column == null) ? "" : e.Column.FieldName;

		e.TextCell.ForeColor = Color.FromName(GetDBroleColor(e.Item.Text));
	}

	protected string GetDBroleColor (string role)
	{
		string color = "Black";
		switch (role)
		{
			case "NO_ACCESS": color = "Black"; break;
			case "Admin": color = "BlueViolet"; break;
			case "Staff": color = "SkyBlue"; break;
			case "Scheduler": color = "RoyalBlue"; break;
			case "DataEntry": color = "Orange"; break;
			case "DataEntry_BLIND": color = "Red"; break;
			case "View data only": color = "Lime"; break;
			case "Study Designer": color = "Teal"; break;
			case "Data Admin": color = "Magenta"; break;
		}
		return color;
	}

	protected string GetDBroleIDColor(string role)
	{
		string color = "Black";
		switch (role)
		{
			case "0": color = "Black"; break;
			case "1": color = "BlueViolet"; break;
			case "2": color = "SkyBlue"; break;
			case "3": color = "RoyalBlue"; break;
			case "4": color = "Orange"; break;
			case "5": color = "Red"; break;
			case "6": color = "Lime"; break;
			case "7": color = "Teal"; break;
			case "8": color = "Magenta"; break;
		}
		return color;
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


		DataTable dt = GetStaffToEdit();
		Session["labgroups_staff"] = dt;

		e.Handled = true;

	}

	
	protected void CancelEditing(CancelEventArgs e)
	{
		e.Cancel = true;
		gridEditStaff.CancelEdit();
	}



	protected void cboDBrole_ItemTextCellPrepared(object sender, ListBoxItemTextCellPreparedEventArgs e)
	{
		if (e.Column.FieldName == "ContactName")
		{
			string contactTitle = e.Item.GetFieldValue("ContactTitle").ToString();
			if (contactTitle == "Owner")
			{
				e.TextCell.CssClass += " owner";
				e.TextCell.ToolTip = "Owner";
			}
		}
		if (e.Column.FieldName == "Phone")
			e.TextCell.CssClass += " phone";

	}


	public static Color ChangeColorBrightness(Color color, float correctionFactor)
	{
		float red = (float)color.R;
		float green = (float)color.G;
		float blue = (float)color.B;

		if (correctionFactor < 0)
		{
			correctionFactor = 1 + correctionFactor;
			red *= correctionFactor;
			green *= correctionFactor;
			blue *= correctionFactor;
		}
		else
		{
			red = (255 - red) * correctionFactor + red;
			green = (255 - green) * correctionFactor + green;
			blue = (255 - blue) * correctionFactor + blue;
		}

		return Color.FromArgb(color.A, (int)red, (int)green, (int)blue);
	}


	#region Labs as a whole



	protected void gridLabEditing_DataBound(object sender, EventArgs e)
	{
		ASPxGridView grid = sender as ASPxGridView;

		bool hasCol = (grid.Columns.IndexOf(grid.Columns["CommandColumnGroups"]) != -1) ? true : false;

		if (hasCol)
		{
			grid.Columns.Remove(grid.Columns["CommandColumnGroups"]);
		}

		GridViewCommandColumn col = new GridViewCommandColumn();
		col.Name = "CommandColumnGroups";

		col.CellStyle.HorizontalAlign = HorizontalAlign.Left;


		for(int i=0; i<8;i++)
		{
			GridViewCommandColumnCustomButton but = new GridViewCommandColumnCustomButton();
			but.ID = String.Format("grp{0}", i);
			but.Text = String.Format("grp{0}", i);
			but.Styles.Native = true;

			col.CustomButtons.Add(but);
		}

		grid.Columns.Add(col);
	}


	protected void gridLabEditing_OnCustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
	{
		var x = 0;


		ASPxGridView grid = (ASPxGridView)sender;
		//string prefix = GetPrefix(grid);

		string matching_btnID = e.ButtonID;
		int idx = Convert.ToInt32(matching_btnID.Replace("grp", ""));



		string abbrids_csv = grid.GetRowValues(e.VisibleIndex, "abbrids").ToString();
		string lab_abbrids_csv = grid.GetRowValues(e.VisibleIndex, "lab_abbrids").ToString();

		List<string> abbrids = new List<string>();
		List<string> lab_abbrids = new List<string>();


		//Create the lists
		if (abbrids_csv != "")
		{
			abbrids = abbrids_csv.Split(',').ToList();
		}
		if (lab_abbrids_csv != "")
		{
			lab_abbrids = lab_abbrids_csv.Split(',').ToList();
		}

		if (idx < abbrids.Count)
		{
			string this_abbrid = abbrids[idx];

			List<string> abbrid = this_abbrid.Split('|').ToList();

			e.Text = abbrid[0];

			if (lab_abbrids.Contains(this_abbrid))
			{
				e.Styles.Style.Font.Bold = true;
				e.Styles.Style.ForeColor = Color.Green;
			}
			else
			{
				e.Styles.Style.ForeColor = Color.LightGray;
			}
		}
		else
		{
			e.Enabled = false;
			e.Visible = DevExpress.Utils.DefaultBoolean.False;
		}
		
	}



	protected void gridLabEditing_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
	{

		var ID = e.ButtonID;

		ASPxGridView grid = (ASPxGridView)sender;

		int studyID = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "studyID").ToString());

		

		int groupindex = Convert.ToInt32(e.ButtonID.Replace("grp", ""));
		int labID = Convert.ToInt32(cboLab.Value.ToString());

		string abbrids_csv = grid.GetRowValues(e.VisibleIndex, "abbrids").ToString();
		List<string> abbrids = abbrids_csv.Split(',').ToList();

		List<string> abbrid = abbrids[groupindex].Split('|').ToList();

		int groupID = Convert.ToInt32(abbrid[1]);


		if (groupID > 0 && labID > 0)
		{
			ToggleLabGroup(groupID, labID);
		}
	}

	protected void ToggleLabGroup(int groupID, int labID )
	{
		SQL_utils sql = new SQL_utils("backend");
		//New or Existing?


		string sql_exists = String.Format("select count(*) from tblLabGroup where groupID={0} and labID={1}", groupID, labID);
		int n_exists = sql.IntScalar_from_SQLstring(sql_exists);

		bool isNew = (n_exists > 0) ? false : true;

		if (isNew)
		{
			string insert = String.Format("insert into tblLabGroup(groupID, labID) values({0},{1})", groupID, labID);
			try
			{
				sql.NonQuery_from_SQLstring(insert);
			}
			catch (Exception ex) { }
		}
		else
		{
			//Remove this group

			try
			{
				string remove1 = String.Format("delete from tbllabgroup_staff where labgroupID = (select labgroupID from tbllabgroup where groupID={0} and labID={1})", groupID, labID);
				string remove2 = String.Format("delete from tbllabgroup where  groupID={0} and labID={1}", groupID, labID);
				sql.NonQuery_from_SQLstring(remove1);
				sql.NonQuery_from_SQLstring(remove2);
			}
			catch (Exception ex) { }

		}

		
		sql.Close();

		gridLabEditing.DataBind();
		gridEditStaff.DataBind();

	}



	#endregion

}