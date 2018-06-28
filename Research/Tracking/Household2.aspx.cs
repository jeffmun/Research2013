using System;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Text;
using Obout.Grid;
using Obout.SuperForm;
using Obout.Interface;
using Obout.ComboBox;
using DevExpress.Web;
using DevExpress.Web.Data;
using uwac;


public partial class Tracking_Household2 : BasePage  
													//public partial class Tracking_Household : System.Web.UI.Page
{

	#region Page Events
	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);

		if (!IsPostBack)
		{
			//LoadTimepoints();
		}

	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		LoadIDs();
		panelMAIN.Visible = false;
		lblStudyname_ContentPage.Text = Master.Master_studyname;
		
	}



	protected void Page_Load(object sender, EventArgs e)
	{
		ClientScript.GetPostBackEventReference(this, string.Empty);
		lblStudyname_ContentPage.Text = Master.Master_studyname;


		dxgridPeople.JSProperties["cpIsUpdated"] = "";
		dxgridPhone.JSProperties["cpIsUpdated"] = "";
		dxgridEmail.JSProperties["cpIsUpdated"] = "";
		dxgridAddress.JSProperties["cpIsUpdated"] = "";
		dxgridEmerContact.JSProperties["cpIsUpdated"] = "";
		dxgridLogContact.JSProperties["cpIsUpdated"] = "";
		dxgridLogInfo.JSProperties["cpIsUpdated"] = "";


		if (!IsPostBack)
		{
			LoadIDs();

			int hhID = GetHouseholdID();
			if (hhID > 0)
			{
				LoadHouseholdInfo(hhID);
			}

		}

		//SQL_utils sql = new SQL_utils("data");

	}
	#endregion


	protected int GetHouseholdID()
	{
		int hhID;
		bool success = int.TryParse(Request.QueryString["hhID"], out hhID);
		if (success & hhID > 0)
		{
			//worked
		}
		else
		{
			hhID = 0;
		}

		return hhID;
	}

	protected void LoadIDs()
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_ProcName("spSEC_AllowedHouseholdIDs_By_Study_User", sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));


		dxddlID.DataSource = dt;
		dxddlID.TextField = "IDlabel";
		dxddlID.ValueField = "householdID";
		dxddlID.DataBind();
		dxddlID.SelectedIndex = 0;

		sql.Close();
	}



	protected void ddlID_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (dxddlID.Text != "--Select ID--")
		{
			string hhID = dxddlID.Value.ToString();
			Response.Redirect("Household2.aspx?hhID=" + dxddlID.Value.ToString());
		}
	}


	protected void LoadHouseholdInfo(int householdID)
	{
		SQL_utils sql = new SQL_utils("backend");
		DataSet ds = sql.DataSet_from_ProcName("hh.spHousehold", sql.CreateParam("householdID", householdID.ToString(), "int"));
		hidHouseholdID.Value = householdID.ToString();

		string hhname = sql.StringScalar_from_SQLstring("select hhname from tblHousehold where householdID = " + householdID.ToString());
		lblHHname.Text = hhname;

		sql.Close();

		panelMAIN.Visible = true;
	}


	
	protected void LoadDxGrid(DevExpress.Web.ASPxGridView g, DataTable dt)
	{
		//// extract the current grouping
		//string currentGroupBy = g.GroupBy;

		g.DataSource = dt;

		//// resetting the GroupBy
		//g.GroupBy = currentGroupBy;

		// rebinding the Grid
		g.DataBind();
	}




	public string GetControlClientIdFromTemplate(string gridname, string controlId, int templateIndex)
	{
		Grid grid = (Grid)this.FindControlRecursive(gridname);
		Control ctl = grid.Templates[templateIndex].Container.FindControl(controlId);
		string ctlID = "";
		ctlID = ctl.ClientID;

		return ctlID;
	}

	


	protected void ButtonCommand_Click(object sender, CommandEventArgs e)
	{
		if (e.CommandName == "DeletePerson")
		{
			SQL_utils sql = new SQL_utils("backend");
			string personid = hidPersonID.Value.ToString();
			int nsubj = sql.IntScalar_from_SQLstring("select count(*) from tblSubject where personID=" + personid);

			if (nsubj == 0)
			{
				//sql.NonQuery_from_SQLstring("delete from tblPerson where personID = " + personid);
				//LoadHouseholdInfo(Convert.ToInt32(hidHouseholdID.Value));
			}
			else
			{
				string study = (nsubj == 1) ? " study" : " studies";
				string subject = (nsubj == 1) ? " this subject" : " these subjects";

				string msg = "This person is assigned to " + nsubj.ToString() + study + ".  Please delete" + subject + " first.";

			}
			sql.Close();
			
		}

		else if (e.CommandName == "MergeHousehold")
		{
			SQL_utils sql = new SQL_utils("backend");

			string hhID = GetHouseholdID().ToString();
			string sqlcmd = "exec hh.spHousehold_MERGE " + e.CommandArgument + ", " + hhID;

			sql.NonQuery_from_SQLstring(sqlcmd);
			sql.Close();

			Response.Redirect("Household.aspx?hhID=" + hhID);
		}

	}

	protected void btnOld_Click(object sender, EventArgs e)
	{
		int hhID = Convert.ToInt32(Request.QueryString["hhID"].ToString());
		if (hhID > 0)
		{
			Response.Redirect("~/Household/ViewHousehold.aspx?householdID=" + hhID.ToString());
		}

	}

	protected void btnGotoCreate_OnClick(object sender, EventArgs e)
	{
		Response.Redirect("~/Tracking/CreateHousehold.aspx");
	}




	protected void btnMergeHousehold_Click(object sender, EventArgs e)
	{

	}

	

	protected void detailGrid_DataSelect(object sender, EventArgs e)
	{
		Session["personID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
	}

	protected void detailGrid_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
	{

		int idx = e.VisibleIndex;
		if (e.VisibleIndex == -1) return;

		if (e.ButtonID == "btnID")
		{
			ASPxGridView grid = (ASPxGridView)sender;
			object row = grid.GetRow(idx);

			string subjid = ((DataRowView)row)["subjid"].ToString();
			string id = ((DataRowView)row)["id"].ToString();

			e.Text = id;

		}

	}

	protected void cboPersonRole_OnInit(object sender, EventArgs e)
	{
	}

	protected void btnCreateSubject_OnInit(object sender, EventArgs e)
	{
		try
		{
			//var x = ((ASPxButton)sender).NamingContainer;

			GridViewEditFormTemplateContainer c = ((ASPxButton)sender).NamingContainer as GridViewEditFormTemplateContainer;

			ASPxGridView grid = c.Grid;
			if (grid.IsNewRowEditing)
			{
				((ASPxButton)sender).Visible = false;
			}
			else
			{

				//string ID = c.Grid.GetRowValues(c.VisibleIndex, "ID").ToString();
				string personID = c.Grid.GetRowValues(c.VisibleIndex, "personID").ToString();
				string fname = c.Grid.GetRowValues(c.VisibleIndex, "FirstName").ToString();
				string lname = c.Grid.GetRowValues(c.VisibleIndex, "LastName").ToString();


				string name = String.Format("{0} {1}", fname, lname);
				//string subjID = "0";
				((ASPxButton)sender).Text = String.Format("Create new subject for {0}", name);


				string authority = HttpContext.Current.Request.Url.Authority;
				string newpage = String.Format("../Track/CreateSubject.aspx?personID={0}", personID);
				//string newpage = String.Format("{0}/Track/Subject.aspx?ID={1}", authority, ID);
				string fx = String.Format("function(s,e){{  location.assign( '{0}');}}", newpage);
				string fx2 = String.Format("function(s,e) {{ window.open('{1}') }}", name, newpage);

				Debug.WriteLine(fx2);
				((ASPxButton)sender).ClientSideEvents.Click = fx2; // String.Format("function(s,e){{alert('{0}');}}",newpage);

				((ASPxButton)sender).AutoPostBack = true;
			}
		}
		catch(Exception )
		{ }
		
	}


	protected void btnID_Init(object sender, EventArgs e)
	{
		GridViewDataItemTemplateContainer c = ((ASPxButton)sender).NamingContainer as GridViewDataItemTemplateContainer;
		string ID = c.Grid.GetRowValues(c.VisibleIndex, "ID").ToString();
		string subjID = c.Grid.GetRowValues(c.VisibleIndex, "subjID").ToString();
		((ASPxButton)sender).Text = String.Format("{0}", ID);

		string authority = HttpContext.Current.Request.Url.Authority;
		string newpage = String.Format("../Track/Subject.aspx?subjID={0}", subjID);
		//string newpage = String.Format("{0}/Track/Subject.aspx?ID={1}", authority, ID);
		string fx = String.Format("function(s,e){{  location.assign( '{0}');}}", newpage);
		string fx2 = "function(s,e) { alert('foo');}";

		((ASPxButton)sender).ClientSideEvents.Click = fx; // String.Format("function(s,e){{alert('{0}');}}",newpage);

		//((ASPxButton)sender).AutoPostBack = true;
		//((ASPxButton)sender).CommandArgument = newpage;
		//((ASPxButton)sender).CommandName = "view_subject";
		////((ASPxButton)sender).Click += btnOnClick;
		//((ASPxButton)sender).Command += btnOnClick;

	}

	protected void dxgridPeople_OnHtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
	{
		if (e.RowType != GridViewRowType.Data)
			return;
		string maincontact = e.GetValue("MainContact").ToString();
		string color = "Lime";
		if (maincontact == "0")
		{
			
			color = (e.VisibleIndex % 2 == 1) ? "WhiteSmoke" : "White";
		}
		else
		{
			color = "SkyBlue";
		}
		Color c = Color.FromName(color);
		//this works
		//e.Row.BackColor = c;

		//this does not work
		e.Row.BackColor = c;

	}

	protected void dxgridPeople_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{

		DxGridView.BuildUpdateSqlCode(e, "tblPerson",  "backend");

		ASPxGridView gv = (ASPxGridView)sender;
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void dxgridPeople_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		//Add HouseholdID

		e.NewValues.Add("HouseholdID", Request.QueryString["hhID"]);

		bool result = DxGridView.BuildInsertSqlCode(e, "tblPerson", "backend");

		ASPxGridView gv = (ASPxGridView)sender;
		gv.CancelEdit();
		e.Cancel = true;
		//test
	}

	protected void dxgridPeople_RowValidating(object sender, ASPxDataValidationEventArgs e)
	{
		ASPxGridView grid = (ASPxGridView)sender;
		//foreach (GridViewColumn column in grid.Columns)
		//{
		//	GridViewDataColumn dataColumn = column as GridViewDataColumn;
		//	if (dataColumn == null) continue;
		//	if (e.NewValues[dataColumn.FieldName] == null)
		//	{
		//		e.Errors[dataColumn] = "Value can't be null.";
		//	}
		//}

	}


	#region new
	protected void dxgrid_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		e.NewValues.Add("HouseholdID", Request.QueryString["hhID"]);
		e.NewValues.Add("studyID", Master.Master_studyID.ToString());
		DxGridView.BuildInsertSqlCode(e, GridnameToTable(gv.ClientInstanceName), "backend");
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void dxgrid_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxGridView.BuildUpdateSqlCode(e, GridnameToTable(gv.ClientInstanceName), "backend");
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
		if (gv.ClientInstanceName == "dxgridPeople")
		{
			var personID = e.Keys[0];

			SQL_utils sql = new SQL_utils("backend");

			string personid = hidPersonID.Value.ToString();
			int nsubj = sql.IntScalar_from_SQLstring("select count(*) from tblSubject where personID=" + personID.ToString());
			sql.Close();

			if (nsubj > 0)
			{
				string study = (nsubj == 1) ? " study" : " studies";
				string subject = (nsubj == 1) ? " this subject" : " these subjects";

				string msg = "This person is assigned to " + nsubj.ToString() + study + ".  Please delete" + subject + " first.";

				result = msg;
				proceed_as_normal = false;

			}

		}
		#endregion


		if (proceed_as_normal)
		{
			result = DxGridView.BuildDeleteSqlCode(e, GridnameToTable(gv.ClientInstanceName), "backend");
		}

		//
		((ASPxGridView)sender).JSProperties["cpIsUpdated"] = result;
		gv.CancelEdit();
		e.Cancel = true;
		
	}

	protected void dxgridLogContact_OnInitNewRow(object sender, ASPxDataInitNewRowEventArgs e)
	{
		e.NewValues["logdate"] = System.DateTime.Now;
	}
	protected void dxgridLogInfo_OnInitNewRow(object sender, ASPxDataInitNewRowEventArgs e)
	{
		e.NewValues["loginfodate"] = System.DateTime.Now;
	}


	protected string GridnameToTable(string grid)
	{
		if (grid == "dxgridPhone") return "tblPhonenumber";
		else if (grid == "dxgridEmail") return "tblEmail";
		else if (grid == "dxgridAddress") return "tblAddress";
		else if (grid == "dxgridEmerContact") return "tblEmerContact";
		else if (grid == "dxgridLogInfo") return "tblLogInfo";
		else if (grid == "dxgridLogContact") return "tblLogContact";
		else if (grid == "dxgridPeople") return "tblPerson";

		else return "";
	}

	#endregion


	//protected void btnOK_Click(object sender, EventArgs e)
	//{
	//	// TODO: your code is here to process the popup window's data at the server
	//	//txtMain.Text = txtPopup.Text;
	//	txtPopup.Text = "foo";

	//	ASPxPopupControl1.ShowOnPageLoad = false;
	//}


}




