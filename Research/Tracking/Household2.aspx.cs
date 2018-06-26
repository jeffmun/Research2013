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
//using Research_Webforms;


public partial class Tracking_Household2 : BasePage // OboutInc.oboutAJAXPage
													//public partial class Tracking_Household : System.Web.UI.Page
{

	//private DataSet ds = new DataSet();
	//string ddlMeasstatusdetailID_clientID = string.Empty;

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

	protected void Page_PreRender(object sender, EventArgs e)
	{
		//this.Page.ClientScript.GetPostBackEventReference(<a control>, string.Empty);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		LoadIDs();
		panelMAIN.Visible = false;
		lblStudyname_ContentPage.Text = Master.Master_studyname;
		//Response.Redirect("~/Tracking/Tracking.aspx");
	}

	//public override void VerifyRenderingInServerForm(Control control)
	//{
	//    /* Verifies that the control is rendered */
	//}



	protected void Page_Load(object sender, EventArgs e)
	{
		ClientScript.GetPostBackEventReference(this, string.Empty);
		lblStudyname_ContentPage.Text = Master.Master_studyname;


		if (!IsPostBack)
		{
			LoadIDs();

			int hhID = GetHouseholdID();
			if (hhID > 0)
			{
				LoadHouseholdInfo(hhID);
			}

		}

		//lblEnterName.Visible = false;


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

		ddlID.DataSource = dt;
		ddlID.DataTextField = "IDlabel";
		ddlID.DataValueField = "householdID";
		ddlID.DataBind();

		sql.Close();
	}

	protected void ddlID_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (ddlID.SelectedValue != "--Select ID--")
		{

			string hhID = ddlID.SelectedValue.ToString();
			Response.Redirect("Household2.aspx?hhID=" + ddlID.SelectedValue.ToString());

			//LoadHouseholdInfo(householdID);
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

		//sql_Persons_by_Household.SelectParameters["householdID"].DefaultValue = householdID.ToString();
		//gridP.DataBind();
		panelMAIN.Visible = true;
	}


	#region OLD STUFF
	//protected void LoadSubjectInfo(string str_subjID)
	//{
	//    int subjID = 0;
	//    bool success = int.TryParse(str_subjID, out subjID);


	//    if (success & subjID > 0)
	//    {
	//        //populate the Subject Superform by updating the select parameter
	//        sqlSUBJ.SelectParameters[0].DefaultValue = subjID.ToString();




	//        SQL_utils sql = new SQL_utils("backend");

	//        List<SqlParameter> ps = new List<SqlParameter>();

	//        ps.Add(sql.CreateParam("subjID", subjID.ToString(), "int"));
	//        ps.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
	//        ps.Add(sql.CreateParam("ID", ID, "text"));

	//        //Not currently used
	//        //UpdatePanel_O_CheckBoxes p = (UpdatePanel_O_CheckBoxes)p_timepoint.FindControl("timepointID");

	//        //if (p != null)
	//        //{
	//        //    DataTable dt_tp = p.GetChecked_as_DataTable();
	//        //    ps.Add(sql.CreateParam("tp", dt_tp));
	//        //    ds = sql.DataSet_from_ProcName("spTracking_SubjInfo", ps);
	//        //}
	//        //else
	//        //{
	//            ds = sql.DataSet_from_ProcName("spTracking_SubjInfo_all_tp", ps);
	//        //}

	//        //LoadForm(ds.Tables[0]);
	//        //LoadGrid(superS, ds.Tables[0]);
	//        LoadGrid(gridP, ds.Tables[1]);
	//        //LoadGrid(gridM, ds.Tables[2]);
	//        //LoadGrid(gridC, ds.Tables[3]);


	//        sql.Close();
	//        panel.Visible = true;

	//    }

	//}


	// protected void LoadSubjStatus_options()
	//{
	//    SQL_utils sql = new SQL_utils("backend");

	//    DataTable dt = sql.DataTable_from_SQLstring("select * from tblSubjectStatus_Lkup where subjstatusID in " +
	//       "	(select subjstatusID from tblStudy_SubjStatus where studyID = " + Master.Master_studyID.ToString() + ")");


	//}

	//protected void LoadTimepoints() {
	//    SQL_utils sql = new SQL_utils("backend");

	//    DataTable dt = sql.DataTable_from_SQLstring("select timepoint_text, timepointID from tblTimepoint  where studyID= " + Master.Master_studyID.ToString() +
	//           " group by timepoint_text, timepointID, timepoint order by timepoint");

	//    if (dt.Rows.Count > 1)
	//    {
	//        UpdatePanel_O_CheckBoxes p = new UpdatePanel_O_CheckBoxes(dt, "timepointID", "TimePoint", "timepoint_text", "timepointID", "int", "1");
	//        p.ID = "timepointID";
	//        p_timepoint.Controls.Add(p);
	//    }

	//    sql.Close();

	//}




	//public string loadMeasstatusdetail(string measstatusID, string
	//measstatusdetailID) {

	//    SQL_utils sql = new SQL_utils("backend");

	//    DataTable dt = sql.DataTable_from_SQLstring("select '--select detail--,-1' as ms_msd union select measstatusdetail  +','+ cast(measstatusdetailID as varchar) ms_msd from tblMeasstatusdetail_lkup" +
	//        " where measstatusdetailID in (select measstatusdetailID from tblmeasstatusanddetail where measstatusID=" + measstatusID + ")");

	//    DataTable dt2 = sql.DataTable_from_SQLstring("select '--select detail--' measstatusdetail,'-1' as measstatusdetailID union select measstatusdetail , cast(measstatusdetailID as varchar) measstatusdetailID  from tblMeasstatusdetail_lkup" +
	//        " where measstatusdetailID in (select measstatusdetailID from tblmeasstatusanddetail where measstatusID=" + measstatusID + ")");


	//    string msd = String.Join(";", dt.AsEnumerable().Select(r => r.Field<string>("ms_msd")).ToArray());

	//    if (measstatusdetailID == null | measstatusdetailID == "") measstatusdetailID = "-1";


	//    Control ctrl = gridM.Templates[0].Container.FindControl("ddl_measstatusdetailID");
	//    string ctlID = ctrl.ID;
	//    string ctl_clientID = ctrl.ClientID;


	//    msd += "|" + measstatusdetailID + "|" + ctlID ; //try to just lookup the control name without the full clientID

	//    sql.Close();

	//    return msd;
	//}


	//protected string GetControlClientIdFromTemplate(string controlId, int
	//templateIndex, string tpl_name) {
	//    string ctlID = "";
	//    if (tpl_name == "gridM")
	//    {
	//        Control ctrl = gridM.Templates[templateIndex].Container.FindControl(controlId);
	//        ctlID = ctrl.ClientID;
	//    }

	//    return ctlID;
	//}


	#endregion



	protected void LoadGrid(SuperForm g, DataTable dt)
	{
		g.DataSource = dt;
		g.DataBind();
	}


	protected void LoadGrid(Grid g, DataTable dt)
	{
		// extract the current grouping
		string currentGroupBy = g.GroupBy;

		g.DataSource = dt;

		// resetting the GroupBy
		g.GroupBy = currentGroupBy;

		// rebinding the Grid
		g.DataBind();
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





	[WebMethod]
	//public static void UpdateM(Mdata m)
	public static void UpdateP(string mode, string HouseholdID, string personID, string last, string first, string middle, string nickname, string lastBC,
		string city, string state, string sex, string dobtxt, string role, string ethnicityID, string hispanicID, string maincontact, string FapersonID, string MopersonID, string notes)
	{

		SQL_utils sql = new SQL_utils("backend");


		List<SqlParameter> ps = new List<SqlParameter>();

		int maincontact01 = (maincontact == "True") ? 1 : 0;


		ps.Add(sql.CreateParam("mode", mode, "text"));
		ps.Add(sql.CreateParam("HouseholdID", HouseholdID, "int"));
		ps.Add(sql.CreateParam("personID", personID, "int"));
		ps.Add(sql.CreateParam("last", last, "text"));
		ps.Add(sql.CreateParam("first", first, "text"));
		ps.Add(sql.CreateParam("middle", middle, "text"));
		ps.Add(sql.CreateParam("nickname", nickname, "text"));
		ps.Add(sql.CreateParam("lastBC", lastBC, "text"));
		ps.Add(sql.CreateParam("city", city, "text"));
		ps.Add(sql.CreateParam("state", state, "text"));
		ps.Add(sql.CreateParam("sex", sex, "text"));
		ps.Add(sql.CreateParam("dobtxt", dobtxt, "text"));
		ps.Add(sql.CreateParam("role", role, "int"));
		ps.Add(sql.CreateParam("EthnicityID", ethnicityID, "int"));
		ps.Add(sql.CreateParam("HispanicID", hispanicID, "int"));
		ps.Add(sql.CreateParam("MainContact", maincontact01.ToString(), "int"));
		ps.Add(sql.CreateParam("FapersonID", FapersonID, "text"));
		ps.Add(sql.CreateParam("MopersonID", MopersonID, "text"));

		ps.Add(sql.CreateParam("notes", notes, "text"));

		sql.StringScalar_from_ProcName("hh.spPerson_MODIFY", ps);

		sql.Close();

	}




	[WebMethod]
	//public static void UpdateM(Mdata m)
	public static void UpdateAddress(string mode, string HouseholdID, string addressID, string address1, string address2, string city, string state, string zip,
		string country, string notes)
	{

		SQL_utils sql = new SQL_utils("backend");


		List<SqlParameter> ps = new List<SqlParameter>();

		ps.Add(sql.CreateParam("mode", mode, "text"));
		ps.Add(sql.CreateParam("HouseholdID", HouseholdID, "int"));
		ps.Add(sql.CreateParam("addressID", addressID, "int"));
		ps.Add(sql.CreateParam("address1", address1, "text"));
		ps.Add(sql.CreateParam("address2", address1, "text"));
		ps.Add(sql.CreateParam("city", city, "text"));
		ps.Add(sql.CreateParam("state", state, "text"));
		ps.Add(sql.CreateParam("zip", zip, "text"));
		ps.Add(sql.CreateParam("country", country, "text"));
		ps.Add(sql.CreateParam("notes", notes, "text"));

		sql.StringScalar_from_ProcName("hh.spAddress_MODIFY", ps);

		sql.Close();

	}




	protected void gridP_Rebind(object sender, EventArgs e)
	{

		int hhID;
		bool success = int.TryParse(Request.QueryString["hhID"], out hhID);
		if (success & hhID > 0)
		{
			LoadHouseholdInfo(hhID);
		}
		else
		{
			bool success2 = int.TryParse(hidHouseholdID.Value, out hhID);
			if (success2 & hhID > 0)
			{
				LoadHouseholdInfo(hhID);
			}
		}

	}

	//protected void gridS_Rebind(object sender, EventArgs e) {

	//    if (ddlID.SelectedValue != "--Select ID--")
	//    {
	//        //LoadSubjectInfo(ddlID.SelectedValue);
	//        SQL_utils sql = new SQL_utils("backend");
	//        int householdID = sql.IntScalar_from_SQLstring("select householdID from vwMasterStatus_S where subjID = " + ddlID.SelectedValue.ToString());
	//        sql.Close();
	//        LoadHouseholdInfo(householdID);
	//    } 
	//}


	protected int[] GetSelectedRecords(Grid g, string fldname)
	{
		int[] x = new int[g.SelectedRecords.Count];
		int i = 0;
		foreach (Hashtable oRecord in g.SelectedRecords)
		{
			x[i] = Convert.ToInt32(oRecord[fldname].ToString());
			i++;
		}
		
		string foo = "";
		string bar = "";

		return x;
	}






	//protected void btnP_Update_Click(object sender, EventArgs e)
	//{

	//}
	//protected void btnP_Update_Command(object sender, CommandEventArgs e)
	//{

	//}


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

				//ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('" + msg + "');", true);

				//ShowAlert(msg);  // only with with obout AJAXpage

				//ExecOnLoad("ShowPersonMessage('" + msg + "')");

				//sql.NonQuery_from_SQLstring("delete from tblPerson where personID = " + personid);

			}

			sql.Close();



		}
		//else if (e.CommandName == "NewSubject")
		//{
		//	int rowIndex = int.Parse(e.CommandArgument.ToString());

		//	Hashtable dataItem = gridP.Rows[rowIndex].ToHashtable() as Hashtable;
		//	string personID = dataItem["PersonID"].ToString();

		//	Response.Redirect("~/Household/CreateSubject.aspx?PersonID=" + personID);
		//}
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


	//protected void gridS_RowDataBound(object sender, GridRowEventArgs e)
	//{

	//	if (e.Row.RowType == GridRowType.DataRow)
	//	{
	//		string subjID = e.Row.Cells[7].Text;

	//		if (subjID != "---")
	//		{
	//			OboutButton btn = new OboutButton();


	//			btn.Text = e.Row.Cells[2].Text.ToString();
	//			btn.PostBackUrl = "../Track/subject.aspx?subjID=" + subjID;
	//			//btn.PostBackUrl = "../Track/subject.aspx?ID=" + e.Row.Cells[2].Text;

	//			e.Row.Cells[2].Controls.Clear();
	//			e.Row.Cells[2].Controls.Add(btn);
	//			e.Row.Cells[1].Font.Bold = true;
	//		}
	//	}
	//}


	//protected void gridP_RowDataBound(object sender, GridRowEventArgs e)
	//{


	//	if (e.Row.RowType == GridRowType.DataRow)
	//	{
	//		DataRowView vw = (DataRowView)e.Row.DataItem;
	//		int ndups = Convert.ToInt32(vw["ndups"]);
	//		int minhhID = Convert.ToInt32(vw["minhhID"]);
	//		int maxhhID = Convert.ToInt32(vw["maxhhID"]);
	//		int maincontact = Convert.ToInt32(vw["MainContact"]);

	//		for (int c = 0; c < e.Row.Cells.Count; c++)
	//		{
	//			e.Row.Cells[c].BackColor = Color.AliceBlue;
	//			List<int> bigcells = new List<int> { 1, 2, 3, 4, 6, 7 };
	//			if (bigcells.Contains(c))
	//			{
	//				e.Row.Cells[c].Font.Size = 10;
	//				e.Row.Cells[c].Font.Bold = true;
	//			}

	//			if (maincontact != 0)
	//			{
	//				e.Row.Cells[c].BackColor = Color.SkyBlue;
	//			}


	//			if (ndups > 0)
	//			{
	//				e.Row.Cells[c].BackColor = Color.LawnGreen;
	//				if (c == 2)
	//				{
	//					if (minhhID > 0)
	//					{
	//						HyperLink hyp1 = new HyperLink();
	//						hyp1.Text = "Duplicate!";
	//						hyp1.ForeColor = Color.Blue;
	//						//hyp1.ToolTip = "There is another person with this Name & DOB!";
	//						hyp1.Target = "_blank";
	//						hyp1.NavigateUrl = "Household.aspx?hhID=" + minhhID.ToString();
	//						e.Row.Cells[c].Controls.Add(hyp1);

	//						btnMergeHousehold.Visible = true;
	//						btnMergeHousehold.CommandArgument = minhhID.ToString();
	//					}
	//					if (maxhhID > 0)
	//					{
	//						HyperLink hyp2 = new HyperLink();
	//						hyp2.Text = "Dup2!";
	//						//hyp2.ToolTip = "There is another person with this Name & DOB!";
	//						hyp2.ForeColor = Color.Blue;
	//						hyp2.Target = "_blank";
	//						hyp2.NavigateUrl = "Household.aspx?hhID=" + maxhhID.ToString();
	//						e.Row.Cells[c].Controls.Add(hyp2);
	//					}

	//					//e.Row.Cells[c].Text += " DUP!";
	//				}
	//			}

	//		}
	//	}
	//}

	//protected void gridLogContact_RowDataBound(object sender, GridRowEventArgs e)
	//{
	//	if (e.Row.RowType == GridRowType.DataRow)
	//	{
	//		for (int c = 0; c < e.Row.Cells.Count; c++)
	//		{
	//			if (e.Row.Cells[c].Text == "Urgent")
	//			{
	//				e.Row.Cells[c].Font.Bold = true;
	//				e.Row.Cells[c].ForeColor = Color.Red;

	//			}

	//		}
	//	}
	//}

	//protected void gridLogInfo_RowDataBound(object sender, GridRowEventArgs e)
	//{
	//	if (e.Row.RowType == GridRowType.DataRow)
	//	{
	//		for (int c = 0; c < e.Row.Cells.Count; c++)
	//		{
	//			if (e.Row.Cells[c].Text == "Urgent")
	//			{
	//				e.Row.Cells[c].Font.Bold = true;
	//				e.Row.Cells[c].ForeColor = Color.Red;

	//			}

	//		}
	//	}
	//}


	protected void btnGotoCreate_OnClick(object sender, EventArgs e)
	{
		Response.Redirect("~/Tracking/CreateHousehold.aspx");
	}

	//protected void btnHouseholdINSERT_Click(object sender, EventArgs e)
	//{

	//	Page.Validate("NewHH");
	//	if (Page.IsValid)
	//	{
	//		//Continue with your logic
	//		SQL_utils sql = new SQL_utils("backend");

	//		int hhID = sql.IntScalar_from_SQLstring("exec hh.spHousehold_INSERT '" + txtNewHHname.Text + "'");
	//		sql.Close();

	//		if (hhID > 0)
	//		{

	//			Response.Redirect("Household.aspx?hhID=" + hhID.ToString());

	//		}
	//	}
	//	else
	//	{
	//		//Display errors, hide controls, etc.
	//	}


	//	//lblEnterName.Visible = false;
	//	//if (txtNewHHname.Text == "New Household Name")
	//	//{
	//	//    lblEnterName.Visible = true;

	//	//    //ExecBeforeLoad("alert('some value')"); ShowAlert("Enter a name for
	//	//    //the new household.");
	//	//}
	//	//else if (txtNewHHname.Text != "" )
	//	//{

	//	//}

	//}



	protected void gridP_InsertCommand(object sender, GridRecordEventArgs e)
	{

	}


	protected void gridP_DeleteCommand(object sender, GridRecordEventArgs e)
	{
		int pk = Convert.ToInt32(e.Record["personID"]);

		if (pk > 0)
		{


			SQL_utils sql = new SQL_utils("backend");
			List<SqlParameter> ps = new List<SqlParameter>();
			ps.Add(sql.CreateParam("personID", pk.ToString(), "int"));

			string result = sql.StringScalar_from_ProcName("hh.spPerson_DELETE", ps);



			sql.Close();


			//oboutGrid_utils o = new oboutGrid_utils();
			//o.oGrid_DeleteData("tblAddress", "backend", "dbo", "addressID", pk);
			//RefreshGrid(gridAddress, "hh.spAddress_by_HouseholdID", Request.QueryString["hhID"]);
		}
	}




	protected void RefreshGrid(Grid grid, string procname, string hhID)
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_ProcName(procname, sql.CreateParam("householdID", hhID, "int"));
		LoadGrid(grid, dt);
		sql.Close();
	}





	protected void btnNewSubject_Click(object sender, EventArgs e)
	{
		try
		{
			int pID = Convert.ToInt32(hidPersonID.Value.ToString());

			if (pID > 0)
			{
				Response.Redirect("~/Household/CreateSubject.aspx?personID=" + pID.ToString());
			}

		}
		catch (Exception)
		{ }

	}


	protected void btnOld_Click(object sender, EventArgs e)
	{
		int hhID = Convert.ToInt32(Request.QueryString["hhID"].ToString());
		if (hhID > 0)
		{
			Response.Redirect("~/Household/ViewHousehold.aspx?householdID=" + hhID.ToString());
		}

	}
	protected void btnMergeHousehold_Click(object sender, EventArgs e)
	{

	}

	protected void btnOnClick(object sender, EventArgs e)
	{
		var x = e;
	}
	protected void btnOnCommand(object sender, CommandEventArgs e)
	{
		var x = e;
		if (e.CommandName == "view_subject")
		{
			Response.Write(e.CommandArgument.ToString());
		}
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
			color = "White";
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


	protected void dxgridEmerContact_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		e.NewValues.Add("HouseholdID", Request.QueryString["hhID"]);
		DxGridView.BuildInsertSqlCode(e, "tblEmerContact", "backend");
		ASPxGridView gv = (ASPxGridView)sender;
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void dxgridEmerContact_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		DxGridView.BuildUpdateSqlCode(e, "tblEmerContact", "backend");
		ASPxGridView gv = (ASPxGridView)sender;
		gv.CancelEdit();
		e.Cancel = true;
	}
	protected void dxgridEmerContact_OnRowDeleting(object sender, ASPxDataDeletingEventArgs e)
	{
		DxGridView.BuildDeleteSqlCode(e, "tblEmerContact", "backend");
		ASPxGridView gv = (ASPxGridView)sender;

		gv.JSProperties["cpCancelEdit"] = e.Cancel;
		gv.JSProperties["cpMessage"] = string.Format("JS properties message.");

		//gv.Settings.ShowTitlePanel = true;
		//gv.SettingsText.Title = "CHANGES ARE DONE";

		gv.CancelEdit();
		e.Cancel = true;


	}

	protected void dxgridPhone_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		e.NewValues.Add("HouseholdID", Request.QueryString["hhID"]);
		DxGridView.BuildInsertSqlCode(e, "tblPhonenumber", "backend");
		ASPxGridView gv = (ASPxGridView)sender;
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void dxgridPhone_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		DxGridView.BuildUpdateSqlCode(e, "tblPhonenumber", "backend");
		ASPxGridView gv = (ASPxGridView)sender;
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void dxgridEmail_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		e.NewValues.Add("HouseholdID", Request.QueryString["hhID"]);
		DxGridView.BuildInsertSqlCode(e, "tblEmail", "backend");
		ASPxGridView gv = (ASPxGridView)sender;
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void dxgridEmail_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		DxGridView.BuildUpdateSqlCode(e, "tblEmail", "backend");
		ASPxGridView gv = (ASPxGridView)sender;
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void dxgridAddress_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		e.NewValues.Add("HouseholdID", Request.QueryString["hhID"]);
		DxGridView.BuildInsertSqlCode(e, "tblAddress", "backend");
		ASPxGridView gv = (ASPxGridView)sender;
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void dxgridAddress_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		DxGridView.BuildUpdateSqlCode(e, "tblAddress", "backend");
		ASPxGridView gv = (ASPxGridView)sender;
		gv.CancelEdit();
		e.Cancel = true;
	}

}




