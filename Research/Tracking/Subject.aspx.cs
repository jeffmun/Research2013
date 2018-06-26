using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;
using uwac;
using uwac_controls;
using Obout.Grid;
using Obout.Interface;
using Obout.ComboBox;
using Obout.SuperForm;
using OboutInc.EasyMenu_Pro;
using Obout.Ajax;

public partial class Tracking_Subject : OboutInc.oboutAJAXPage
//public partial class Info_Tracking_Subject : System.Web.UI.Page
{

	 private DataSet ds = new DataSet();

	string ddlMeasstatusdetailID_clientID = string.Empty;
	string _cbMessage = "";


	#region Page Events
	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);



		if (!IsPostBack)
		{
			LoadTimepoints();
		}

	}


	//// Define method that processes the callbacks on server.
	//public void RaiseCallbackEvent(String eventArgument)
	//{
	//    try
	//    {
	//        Page.ClientScript.ValidateEvent(btnUpdateSS.UniqueID);
	//        _cbMessage = "Correct event raised callback.";
	//    }
	//    catch (Exception ex)
	//    {
	//        _cbMessage = "Incorrect event raised callback.";
	//    }
	//}
	//// Define method that returns callback result.
	//public string GetCallbackResult()
	//{
	//    return _cbMessage;
	//}


	protected void Page_PreRender(object sender, EventArgs e)
	{
		//this.Page.ClientScript.GetPostBackEventReference(<a control>, string.Empty);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		//LoadIDs(); panel.Visible = false; lblStudyname_ContentPage.Text =
		//Master.Master_studyname;
		////Response.Redirect("~/Tracking/Tracking.aspx");

		
		//panel.Visible = false;
		//panelSubjectInfo.Visible = false;

		Response.Redirect("~/Tracking/Subject.aspx");

	}

	//public override void VerifyRenderingInServerForm(Control control)
	//{
	//    /* Verifies that the control is rendered */
	//}



	protected void Page_Load(object sender, EventArgs e)
	{
		//ClientScript.GetPostBackEventReference(this, string.Empty);
		lblStudyname_ContentPage.Text = Master.Master_studyname;

		//DropDownList ddlMeasstatusdetailID = (DropDownList)gridM.Templates[0].Container.FindControl("ddlMeasstatusdetailID");
		//ddlMeasstatusdetailID_clientID = ddlMeasstatusdetailID.ClientID;

		//OboutInc.Calendar2.Calendar cal_M_datedone = gridM.Templates[0].Container.FindControl("cal_M_datedone") as OboutInc.Calendar2.Calendar;
		//OboutTextBox txt_M_datedone = gridM.Templates[0].Container.FindControl("txt_M_datedone") as OboutTextBox;
		//cal_M_datedone.TextBoxId = txt_M_datedone.ClientID;

		//TextBox txtTime = (TextBox)gridA.Templates[0].Container.FindControl("txtTime");
		//txtTime.Text = hour + ":" + minute;

		//txtTime2.Text = hour + ":" + minute;

		//ClientScriptManager cs = Page.ClientScript; String cbReference =
		//cs.GetCallbackEventReference("'" +
		//        Page.UniqueID + "'", "arg", "ReceiveServerData", "",
		//        "ProcessCallBackError", false);
		//String callbackScript = "function CallTheServer(arg, context) {" +
		//    cbReference + "; }";
		//cs.RegisterClientScriptBlock(this.GetType(), "CallTheServer",
		//    callbackScript, true);


		if (!Page.IsPostBack)
			ViewState["something"] = 1;

		// if it's not a callback (aka first load or postback) write the value of the viewstate variable
		if (!IsCallback)
			if (ViewState["something"] != null)
				lblViewState.Text = "ViewState value = " + ViewState["something"].ToString();



		if (!IsPostBack)
		{

			LoadIDs();
			
			if (Request.QueryString["subjID"] != null)
			{
				LoadSubjectInfo(Request.QueryString["subjID"]);
			}
			if (Request.QueryString["smsID"] != null)
			{
				LoadSubjectInfo(Request.QueryString["subjID"]);
			}

		}

	}
	#endregion

	//protected override void Render(HtmlTextWriter writer) {
	//    Button btn = (Button)panelSubjectInfo.ContentTemplateContainer.FindControlRecursive("btn1");
	//    Page.ClientScript.RegisterForEventValidation(btn.UniqueID);
	//    base.Render(writer);
	//}


	protected void LoadIDs()
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_ProcName("spSEC_AllowedIDs_By_Study_User", sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));

		ddlID.DataSource = dt;
		ddlID.DataTextField = "IDlabel";
		ddlID.DataValueField = "subjID";
		ddlID.DataBind();

		sql.Close();
	}

	protected void ddlID_SelectedIndexChanged(object sender, EventArgs e)
	{
		if(ddlID.SelectedValue!="--Select ID--")
		{
			Response.Redirect("Subject.aspx?subjID=" + ddlID.SelectedValue);
			//LoadSubjectInfo(ddlID.SelectedValue);
		}
	}


	protected void LoadSubjectInfo(string str_subjID)
	{

		LoadSubjectInfo(str_subjID, 0);
	}


	protected void LoadSubjectInfo(string str_subjID, int smsID)
	{
		int subjID = 0;
		bool success = int.TryParse(str_subjID, out subjID);


		if (success & subjID > 0)
		{
			//populate the Subject Superform by updating the select parameter
			//sqlSUBJ.SelectParameters[0].DefaultValue = subjID.ToString();


			//// markup SQL
			////populate the Measure grid by updating the select parameter
			//sqlA.SelectParameters[0].DefaultValue = subjID.ToString();
			//gridA.DataBind();


			////populate the Measure grid by updating the select parameter
			//sqlM.SelectParameters[0].DefaultValue = subjID.ToString();
			//gridM.DataBind();



			SQL_utils sql = new SQL_utils("backend");

			List<SqlParameter> ps = new List<SqlParameter>();

			ps.Add(sql.CreateParam("subjID", subjID.ToString(), "int"));
			ps.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
			ps.Add(sql.CreateParam("ID", ID, "text"));

			//Not currently used
			//UpdatePanel_O_CheckBoxes p = (UpdatePanel_O_CheckBoxes)p_timepoint.FindControl("timepointID");

			//if (p != null)
			//{
			//    DataTable dt_tp = p.GetChecked_as_DataTable();
			//    ps.Add(sql.CreateParam("tp", dt_tp));
			//    ds = sql.DataSet_from_ProcName("spTracking_SubjInfo", ps);
			//}
			//else
			//{
				ds = sql.DataSet_from_ProcName("spTracking_SubjInfo_all_tp", ps);
			//}

			//LoadForm(ds.Tables[0]);
			//LoadGrid(superS, ds.Tables[0]);

			string strID = ds.Tables[0].AsEnumerable().Select(f => f.Field<string>("ID")).FirstOrDefault();
			string groupname = ds.Tables[0].AsEnumerable().Select(f => f.Field<string>("GroupName")).FirstOrDefault();
			int subjstatusID = ds.Tables[0].AsEnumerable().Select(f => f.Field<int>("subjstatusID")).FirstOrDefault();
			int subjstatusdetailID = ds.Tables[0].AsEnumerable().Select(f => f.Field<int>("subjstatusdetailID")).FirstOrDefault();
			string notes = ds.Tables[0].AsEnumerable().Select(f => f.Field<string>("notes")).FirstOrDefault();
			int householdID = ds.Tables[0].AsEnumerable().Select(f => f.Field<int>("householdID")).FirstOrDefault();
			int studyID = ds.Tables[0].AsEnumerable().Select(f => f.Field<int>("studyID")).FirstOrDefault();

			string subjstatus = ds.Tables[0].AsEnumerable().Select(f => f.Field<string>("subjstatus")).FirstOrDefault();
			string subjstatusdetail = ds.Tables[0].AsEnumerable().Select(f => f.Field<string>("subjstatusdetail")).FirstOrDefault();


			if(studyID != Master.Master_studyID)
			{
				sql.NonQuery_from_SQLstring("exec spSEC_Update_Default_StudyID_for_User " + studyID.ToString());

				Response.Redirect("subject.aspx?subjID=" + subjID.ToString());

			}




			hidHouseholdID.Value = householdID.ToString();
			lblID.Text = strID;
			lblGroupName.Text = groupname;
			txtNotes.Text = notes;
			lblNotes.Text = notes;
			lblSS.Text = subjstatus;
			lblSSD.Text = subjstatusdetail;

			lblNotes.Text = notes;

//			ddlSubjStatus2.SelectedValue = subjstatusID.ToString();

			//sqlSSD.SelectParameters["subjstatusID"].DefaultValue = subjstatusID.ToString();
			
//			ddlSubjStatusDetail2.DataBind();
			//try
			//{
			//    ddlSubjStatusDetail2.SelectedValue = subjstatusdetailID.ToString();
			//}
			//catch(Exception ex)
			//{

			//}



			LoadGrid(gridA, ds.Tables[1]);
			LoadGrid(gridM, ds.Tables[2]);
			LoadGrid(gridC, ds.Tables[3]);

			DataTable dtDocs = sql.DataTable_from_SQLstring("select a.*, dbo.fnElapTime_text(created, getdate()) TimeSinceUpload " + 
					" from vwDocVers a join tblDocFK b ON a.docID = b.docID " + 
					" where entitytypeID=4 and entityID=" + Request.QueryString["subjID"]);

			if(dtDocs.Rows.Count>0)
			{
				gvDocs.DataSource = dtDocs;
				gvDocs.DataBind();

			}

			sql.Close();

			panelSubjectInfo.Visible = true;
			btnReturnToHousehold.Visible = true;
			btnViewDataValues.Visible = false;
		}
		
	}


	 protected void LoadSubjStatus_options()
	{
		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring("select * from tblSubjectStatus_Lkup where subjstatusID in " +
		   "	(select subjstatusID from tblStudy_SubjStatus where studyID = " + Master.Master_studyID.ToString() + ")");


	}

	 protected void LoadTimepoints()
	 {
		 SQL_utils sql = new SQL_utils("backend");

		 DataTable dt = sql.DataTable_from_SQLstring("select timepoint_text, timepointID from tblTimepoint  where studyID= " + Master.Master_studyID.ToString() +
				" group by timepoint_text, timepointID, timepoint order by timepoint");

		 if (dt.Rows.Count > 1)
		 {
			 UpdatePanel_O_CheckBoxes p = new UpdatePanel_O_CheckBoxes(dt, "timepointID", "TimePoint", "timepoint_text", "timepointID", "int", "1");
			 p.ID = "timepointID";
			 p_timepoint.Controls.Add(p);
		 }

		 sql.Close();

	 }


	 
	 protected void LoadGrid(SuperForm g, DataTable dt)
	 {
		 g.DataSource = dt;
		 g.DataBind();
	 }


	protected void LoadGrid(Grid g, DataTable dt) 
	{

		// extract the current grouping - it can be "Country" or
		// whatever column the end users grouped by
		string currentGroupBy = g.GroupBy;

		g.DataSource = dt;

		// resetting the GroupBy
		g.GroupBy = currentGroupBy;

		// rebinding the Grid
		g.DataBind();
	}

	// protected void Load_ddlSSD()
	//{
	//    SQL_utils sql = new SQL_utils("backend");
	//    string sqlcmd = "select -1 as subjstatusdetailID, '-- update status detail--' subjstatusdetail union select a.subjstatusdetailID, subjstatusdetail from uwautism_research_backend..tblsubjstatusdetail_lkup a " +
	//       "join tblsubjstatusanddetail b ON a.subjstatusdetailID = b.subjstatusdetailID " +
	//       "where b.subjstatusID = " + ddlSS.SelectedValue.ToString();

	//    DataTable dt = sql.DataTable_from_SQLstring(sqlcmd);

	//     List<string> ssdvals = dt.AsEnumerable().Select(f => f.Field<int>("subjstatusdetailID").ToString()).ToList();

	//     Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "CallMyFunction", "ClearOptionSSD();", true);

	//     foreach(string s in ssdvals)
	//     {

	//         Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "CallMyFunction", "AddOptionSSD(" + s + "," + s + ");", true);

	//         //foreach(ListItem itm in ddlSSD.Items)
	//         //{
	//         //    if (ssdvals.Contains(itm.Value))
	//         //    {

	//         //        itm.Enabled = true;
	//         //    }
	//         //    else{
	//         //        ddlSSD.options.
	//         //        itm.Enabled = false; 
	//         //    }
	//         //}
	//     }

	//    //ddlSSD.DataValueField = "subjstatusdetailID";
	//    //ddlSSD.DataTextField = "subjstatusdetail";
	//    //ddlSSD.DataSource = dt;
	//    //ddlSSD.DataBind();

	//    // updatepanelSSD.Update();

	//    sql.Close();
	//}
	


	public string loadMeasstatusdetail(string measstatusID, string measstatusdetailID)
	{
	  
		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring("select '--select detail--,-1' as ms_msd union select measstatusdetail  +','+ cast(measstatusdetailID as varchar) ms_msd from tblMeasstatusdetail_lkup" +
			" where measstatusdetailID in (select measstatusdetailID from tblmeasstatusanddetail where measstatusID=" + measstatusID + ")");

		DataTable dt2 = sql.DataTable_from_SQLstring("select '--select detail--' measstatusdetail,'-1' as measstatusdetailID union select measstatusdetail , cast(measstatusdetailID as varchar) measstatusdetailID  from tblMeasstatusdetail_lkup" +
			" where measstatusdetailID in (select measstatusdetailID from tblmeasstatusanddetail where measstatusID=" + measstatusID + ")");


		string msd = String.Join(";", dt.AsEnumerable().Select(r => r.Field<string>("ms_msd")).ToArray());

		if (measstatusdetailID == null | measstatusdetailID == "") measstatusdetailID = "-1";


		Control ctrl = gridM.Templates[0].Container.FindControl("ddl_measstatusdetailID");
		string ctlID = ctrl.ID;
		string ctl_clientID = ctrl.ClientID;


		msd += "|" + measstatusdetailID + "|" + ctlID ; //try to just lookup the control name without the full clientID

		sql.Close();

		return msd;
	}


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


	public string GetControlClientIdFromTemplate(string gridname, string controlId, int templateIndex)
	{
		Grid grid = (Grid)this.FindControlRecursive(gridname);
		Control ctl = grid.Templates[templateIndex].Container.FindControl(controlId);
		string ctlID = "";
		ctlID = ctl.ClientID;


		return ctlID;
	}


	protected void btnM_Update_Click(object sender, EventArgs e)
	{
	
	}

	protected void btnM_Update_Command(object sender, CommandEventArgs e)
	{
		
	}


////Get the SSD we need
//     [WebMethod]
//    public static ArrayList PopulateSSD(string subjstatusID)
//    {
//        ArrayList list = new ArrayList();


//        SQL_utils sql = new SQL_utils("backend");

//        String strQuery = "select  a.subjstatusdetailID, subjstatusdetail from uwautism_research_backend..tblsubjstatusdetail_lkup a "  +
//            "join tblsubjstatusanddetail b ON a.subjstatusdetailID = b.subjstatusdetailID where subjstatusID = " + subjstatusID.ToString();

//        DataTable dt = sql.DataTable_from_SQLstring(strQuery);


//        foreach(DataRow row in dt.Rows)
//        {
//            list.Add(new ListItem(
//                row["subjstatusdetail"].ToString(),
//                row["subjstatusdetailID"].ToString()));
//        }

//        return list;
	//    }




	#region WebMethod
	[WebMethod]
	//public static void UpdateM(Mdata m)
	public static void UpdateA(string actionIDs, string actionstatusID, string respforID, string CompletedBy, string datedone, 
		string starttime, string endtime, string location, string notes)
	{

		SQL_utils sql = new SQL_utils("backend");


		List<SqlParameter> ps = new List<SqlParameter>();

		ps.Add(sql.CreateParam("actionIDs", actionIDs, "text"));
		ps.Add(sql.CreateParam("actionstatusID", actionstatusID, "int"));
		ps.Add(sql.CreateParam("respforID", respforID, "int"));
		ps.Add(sql.CreateParam("CompletedBy", CompletedBy, "int"));
		ps.Add(sql.CreateParam("datedone", datedone, "text"));
		ps.Add(sql.CreateParam("starttime", starttime, "text"));
		ps.Add(sql.CreateParam("endtime", endtime, "text"));
		ps.Add(sql.CreateParam("location", location, "text"));
		ps.Add(sql.CreateParam("notes", notes, "text"));

		sql.StringScalar_from_ProcName("spTracking_SubjInfo_A_UPDATE", ps);

		sql.Close();

	}

   

	[WebMethod]
	//public static void UpdateM(Mdata m)
	public static void UpdateM(string subjID, string smsIDs, string measstatusID, string measstatusdetailID, string date, string clinician, string notes)
	{
		
		SQL_utils sql = new SQL_utils("backend");


		List<SqlParameter> ps = new List<SqlParameter>();

		ps.Add(sql.CreateParam("smsIDs", smsIDs, "text"));
		ps.Add(sql.CreateParam("measstatusID", measstatusID, "int"));
		ps.Add(sql.CreateParam("measstatusdetailID", measstatusdetailID, "int"));
		ps.Add(sql.CreateParam("date", date, "date"));
		ps.Add(sql.CreateParam("clinician", clinician, "int"));
		ps.Add(sql.CreateParam("notes", notes, "text"));

		sql.StringScalar_from_ProcName("spTracking_SubjInfo_M_UPDATE", ps);

		sql.Close();

	}

	#endregion 


	protected void gridC_UpdateCommand(object sender, GridRecordEventArgs e)
	{
		oboutGrid_utils o = new oboutGrid_utils();
		o.oGrid_UpdateData(e.Record, "tblSubjConsent", "backend", "dbo", "SubjConsentID");
	}


	protected void gridM_UpdateCommand(object sender, GridRecordEventArgs e)
	{

		try
		{
			string x = "";
			oboutGrid_utils o = new oboutGrid_utils();

			if (gridM.SelectedRecords != null)
			{
				int[] recs = GetSelectedRecords(gridM, "studymeassubjID");
				x = o.oGrid_UpdateData(e.Record, "tblstudymeassubj", "backend", "dbo", "studymeassubjID", recs);
			}
			else
			{
				x = o.oGrid_UpdateData(e.Record, "tblstudymeassubj", "backend", "dbo", "studymeassubjID");
			}
		}
		catch (Exception ex) {
			string x = ex.Message;
		}


		//LoadSubjectInfo(ddlID.SelectedValue);

		//gridM.DataBind();
		
	}

	protected void gridM_Rebind(object sender, EventArgs e)
	{
		//LoadSubjectInfo(ddlID.SelectedValue);

		string subjID;

		if (Request.QueryString["subjID"] != null)
		{
			subjID = Request.QueryString["subjID"];
			LoadSubjectInfo(subjID);

		}

	}


	protected void gridA_Rebind(object sender, EventArgs e)
	{
		string subjID;

		if(Request.QueryString["subjID"] != null)
		{
			subjID = Request.QueryString["subjID"];
			LoadSubjectInfo(subjID);

		}

	}

	protected void gridC_Rebind(object sender, EventArgs e)
	{
		//LoadSubjectInfo(ddlID.SelectedValue);

		string subjID;

		if (Request.QueryString["subjID"] != null)
		{
			subjID = Request.QueryString["subjID"];
			LoadSubjectInfo(subjID);

		}

	}



	protected void btn2_Command(object sender, CommandEventArgs e)
	{

		if (e.CommandName == "UpdateSS")
		{
			string x = e.CommandName;
		}

	}


	 protected int[] GetSelectedRecords(Grid g, string fldname)
	{
		int[] x = new int[g.SelectedRecords.Count];
		int i = 0;
		foreach (Hashtable oRecord in g.SelectedRecords)
		{
			x[i] = Convert.ToInt32(oRecord[fldname].ToString());
			i++;
		}

		return x;
	}

	 protected void gridM_RowCreated(object sender, GridRowEventArgs e)
	 {


		
	 }

	 protected void gridM_RowDataBound(object sender, GridRowEventArgs e)
	{


		if (e.Row.RowType == GridRowType.DataRow)
		{
			e.Row.Style["background-image"] = "none";

			int cell_with_colorname = 7;

			e.Row.Cells[6].BackColor = Color.FromName(e.Row.Cells[cell_with_colorname].Text);
		}
	}



	 protected void gridA_RowDataBound(object sender, GridRowEventArgs e)
	 {


		 if (e.Row.RowType == GridRowType.DataRow)
		 {
			 e.Row.Style["background-image"] = "none";

			 int cell_with_colorname = 8;

			 e.Row.Cells[7].BackColor = Color.FromName(e.Row.Cells[cell_with_colorname].Text);
		 }
	 }



	 #region Get DDL contents
	 //Pass in the ctlname and filtervalue to get the data to populate a DDL
	//with a subset of relevant options.  This string is then passed back to a
	//Javascript function that loads the ddl.
	public string GetDDLcontents(string ctlname, string measstatusID, string measstatusdetailID)
	{
			SQL_utils sql = new SQL_utils("backend");
			string data = "";
			DataTable dt = new DataTable();

			if (ctlname == "measstatusdetailID")
			{


				dt = sql.DataTable_from_SQLstring("select '--select detail--^-1' as textvalue union select measstatusdetail  +'^'+ cast(measstatusdetailID as varchar) textvalue from tblMeasstatusdetail_lkup" +
					" where measstatusdetailID in (select measstatusdetailID from tblmeasstatusanddetail where measstatusID=" + measstatusID.ToString() + ")");

			}

			data = String.Join(";", dt.AsEnumerable().Select(r => r.Field<string>("textvalue")).ToArray());

			if (measstatusdetailID == "") measstatusdetailID = "-1";


			//Control ctl = (Control)gridM.Templates[0].Container.FindControl("ddl_" + ctlname);

			data += "|" + measstatusdetailID.ToString() + "|ddl_" + ctlname;

			sql.Close();
			return data;

	}


	//Pass in the ctlname and filtervalue to get the data to populate a DDL
	//with a subset of relevant options.  This string is then passed back to a
	//Javascript function that loads the ddl.
	public string GetDDLcontentsSSD(string ctlname, string subjstatusID)
	{
		SQL_utils sql = new SQL_utils("backend");
		string data = "";
		DataTable dt = new DataTable();

		if (ctlname == "ddlSSD")
		{

			String strQuery = "select  cast(a.subjstatusdetailID as varchar) + '^' + subjstatusdetail as textvalue from uwautism_research_backend..tblsubjstatusdetail_lkup a " +
			"join tblsubjstatusanddetail b ON a.subjstatusdetailID = b.subjstatusdetailID where subjstatusID = " + subjstatusID.ToString();

			dt = sql.DataTable_from_SQLstring(strQuery);

			//dt = sql.DataTable_from_SQLstring("select '--select detail--^-1' as textvalue union select measstatusdetail  +'^'+ cast(measstatusdetailID as varchar) textvalue from tblMeasstatusdetail_lkup" +
			//    " where measstatusdetailID in (select measstatusdetailID from tblmeasstatusanddetail where measstatusID=" + subjstatusID.ToString() + ")");

		}

		data = String.Join(";", dt.AsEnumerable().Select(r => r.Field<string>("textvalue")).ToArray());

		//if (measstatusdetailID == "") measstatusdetailID = "-1";


		//Control ctl = (Control)gridM.Templates[0].Container.FindControl("ddl_" + ctlname);

		//data += "|" + measstatusdetailID.ToString() + "|ddl_" + ctlname;



		//ArrayList list = new ArrayList();




		//foreach (DataRow row in dt2.Rows)
		//{
		//    list.Add(new ListItem(
		//        row["subjstatusdetail"].ToString(),
		//        row["subjstatusdetailID"].ToString()));
		//}

		//sql.Close();



		sql.Close();



		return data;

	}



	public string GetDDLcontents_A(string ctlname, string actiontypeID, string actionstatusID)
	{
		SQL_utils sql = new SQL_utils("backend");
		string data = "";
		DataTable dt = new DataTable();

		if (ctlname == "actionstatusID")
		{
			dt = sql.DataTable_from_SQLstring("select '--select status--^-1' as textvalue " + 
				" union select * from (select top 100 percent actionstatus +'^'+ cast(a.actionstatusID as varchar) textvalue " + 
				" from tblactionstatus_lkup a" +
				" join tblActionTypeStatus b ON a.actionstatusID = b.actionstatusID " + 
				" where actiontypeID = " + actiontypeID + " order by b.sortorder ) x ");

		}

		data = String.Join(";", dt.AsEnumerable().Select(r => r.Field<string>("textvalue")).ToArray());

		if (actionstatusID == "") actionstatusID = "-1";


		Control ctl = (Control)gridM.Templates[0].Container.FindControl("ddl_" + ctlname);

		data += "|" + actionstatusID.ToString() + "|ddl_" + ctlname;

		return data;

	}

	 #endregion 


	protected void FixDate(string thedate)
	{

		OboutInc.Calendar2.Calendar cal = (OboutInc.Calendar2.Calendar)gridM.Templates[0].Container.FindControl("cal_M_datedone");
		cal.SelectedDate = Convert.ToDateTime(thedate);
	}



	//protected void ddlSubjStatus_SelectedIndexChanged(object sender,
	//ComboBoxItemEventArgs e) {
	//    sqlSSD.SelectParameters[0].DefaultValue = e.Item.Value;
	//}


	protected void btnA_Click(object sender, EventArgs e)
	{
		if(gridA.Visible == true)
		{
			gridA.Visible = false;
			btnA.Text = "Show";
		}
		else
		{
			LoadSubjectInfo(ddlID.SelectedValue);
			gridA.Visible = true;
			btnA.Text = "Hide";

		}
		//panel.Update();
	}


	protected void btnM_Click(object sender, EventArgs e)
	{
		if (gridM.Visible == true)
		{
			gridM.Visible = false;
			btnM.Text = "Show";
		}
		else
		{
			LoadSubjectInfo(ddlID.SelectedValue);
			gridM.Visible = true;
			btnM.Text = "Hide";

		}
		//panel.Update();
	}

	protected void btnC_Click(object sender, EventArgs e)
	{
		if (gridC.Visible == true)
		{
			gridC.Visible = false;
			btnC.Text = "Show";
		}
		else
		{
			LoadSubjectInfo(ddlID.SelectedValue);
			gridC.Visible = true;
			btnC.Text = "Hide";

		}
		//panel.Update();
	}





	protected void gridM_Filtering(object sender, EventArgs e)
	{
		
	}
	protected void btnReturnToHousehold_Click(object sender, EventArgs e)
	{

		Response.Redirect("Household.aspx?hhID=" + hidHouseholdID.Value.ToString());
	}
	protected void btnViewDataValues_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/stats/DataValues.aspx?subjID=" + Request.QueryString["subjID"]);

	}
	//protected void ddlSubjStatus2_SelectedIndexChanged(object sender, EventArgs e)
	//{
	//    //UpdateSSD();
	//}

	// protected void UpdateSSD()
	//{
	//    //string x = ddlSubjStatus2.SelectedValue.ToString();

	//    //SQL_utils sql = new SQL_utils("backend");
	//    //DataTable dt = sql.DataTable_from_SQLstring("select 0 subjstatusdetailID, '--select status detail--' subjstatusdetail union " +
	//    //    " select  subjstatusdetailID, subjstatusdetail  from tblSubjStatusDetail_Lkup " +
	//    //    " where subjstatusdetailID in " +
	//    //    "    (select subjstatusdetailID from tblSubjStatusAndDetail where subjstatusID = " + x + ")");

	//    //ddlSubjStatusDetail2.DataSource = dt;
	//    //ddlSubjStatusDetail2.DataTextField = "subjstatusdetail";
	//    //ddlSubjStatusDetail2.DataValueField = "subjstatusdetailID";

	//    //ddlSubjStatusDetail2.DataBind();
	//    //panelSubjectInfo.Update();
	//    //sql.Close();
	//}

	// protected void ddlSubjStatus2_TextChanged(object sender, EventArgs e)
	// {
	//     UpdateSSD();
	// }


	 protected void btnUpdateSS_Click(object sender, EventArgs e)
	 {
		 UpdatePanel("panelSubjectInfo");
		 SQL_utils sql = new SQL_utils("backend");

		 HiddenField hidSSD = (HiddenField)Page.FindControlRecursive("hidSSD");
		 string ssd = hidSSD.Value;

		 if (ssd != "" | txtNotes.Text != "")
		 //if (ddlSSD.SelectedValue.ToString() != "")
		 {
			 if (ssd == "") ssd = "-1"; //if ssd is blank then set to -1 so that the orig value is retained in the stored proc
										//note that it is blank because the SSD dropdown is not populated until the SS is selected
			 List<SqlParameter> ps = new List<SqlParameter>();
			 ps.Add(sql.CreateParam("subjID", Request.QueryString["subjID"], "int"));
			 ps.Add(sql.CreateParam("subjstatusID", ddlSS.SelectedValue.ToString(), "int"));
			 ps.Add(sql.CreateParam("subjstatusdetailID", ssd, "int"));
			 ps.Add(sql.CreateParam("notes", txtNotes.Text, "text"));

			 sql.NonQuery_from_ProcName("hh.spSubject_MODIFY", ps);


			 //panelEditSS.Visible = false;

			 //btnUpdateSS.Visible = false;
			 //btnEditSS.Visible = true;

			 //reset selected index to -1
			 ddlSS.SelectedIndex = -1;
			 ddlSSD.SelectedIndex = -1;


			 Response.Redirect("subject.aspx?subjID=" + Request.QueryString["subjID"]);
		 }

		 //LoadSubjectInfo(Request.QueryString["subjID"]);


		 sql.Close();

	 }
	
	
	//protected void btnEditSS_Click(object sender, EventArgs e) {
	 //    //ddlSS.DataBind();
	 //    //ddlSSD.DataBind();
		
	 //    //btnUpdateSS.Visible = true;
	 //    //btnEditSS.Visible = false;


	 //}





	 public string tempFunction()
	 {
		 // increase the value of the viewstate variable
		 int count = (int)ViewState["something"];
		 count++;
		 ViewState["something"] = count;
		 return ViewState["something"].ToString();
	 }



	 protected void btnAddDoc_Click(object sender, EventArgs e)
	 {
		 string url = "~/Documents/UploadDocument.aspx?EntityTypeID=4&EntityID=" + Request.QueryString["subjID"];

		 Response.Redirect(url);

	 }

	 protected string CreateHyperLinkUrl(string url, string id)
	 {
		 return url + id;
	 }


	 protected void btnCancelSS_Click(object sender, EventArgs e)
	 {
		 Response.Redirect("subject.aspx?subjID=" + Request.QueryString["subjID"]);
	 }


	protected void SetEntityToEdit(string entity, int entity_pk)
	 {
		if(entity=="sms")
		{
			//foreach()
		}

	 }



}




