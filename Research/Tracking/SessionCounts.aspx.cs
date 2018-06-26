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


public partial class Tracking_SessionCounts : OboutInc.oboutAJAXPage
//public partial class Info_Tracking_Subject : System.Web.UI.Page
{


	#region Page Events
	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);

		if (!IsPostBack)
		{
			 
		}

	}

	protected void Page_PreRender(object sender, EventArgs e)
	{
		//this.Page.ClientScript.GetPostBackEventReference(<a control>, string.Empty);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		
		//panel.Visible = false;
		//lblStudyname_ContentPage.Text = Master.Master_studyname;
		//Response.Redirect("~/Tracking/Tracking.aspx");
	}

	//public override void VerifyRenderingInServerForm(Control control)
	//{
	//    /* Verifies that the control is rendered */
	//}



	protected void Page_Load(object sender, EventArgs e)
	{
		ClientScript.GetPostBackEventReference(this, string.Empty);
		
		//DropDownList ddlMeasstatusdetailID = (DropDownList)gridM.Templates[0].Container.FindControl("ddlMeasstatusdetailID");
		//ddlMeasstatusdetailID_clientID = ddlMeasstatusdetailID.ClientID;

		//OboutInc.Calendar2.Calendar cal_M_datedone = gridM.Templates[0].Container.FindControl("cal_M_datedone") as OboutInc.Calendar2.Calendar;
		//OboutTextBox txt_M_datedone = gridM.Templates[0].Container.FindControl("txt_M_datedone") as OboutTextBox;
		//cal_M_datedone.TextBoxId = txt_M_datedone.ClientID;

		LoadStudyIDs();


		if (!IsPostBack)
		{


		}

	}
	#endregion


	protected void LoadStudyIDs()
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_ProcName("spSEC_AllowedStudies_By_User");


		UpdatePanel_O_CheckBoxes p = new UpdatePanel_O_CheckBoxes(dt, "study1", "Select studies", "studyname", "studyID", "int", "0");
		panelChk.Controls.Add(p);

		sql.Close();



	}

	protected void btnGetCounts_Click(object sender, EventArgs e)
	{
		UpdatePanel_O_CheckBoxes p =  (UpdatePanel_O_CheckBoxes)panelChk.FindControl("study1");

		string studies = p.GetChecked_as_CSV();


		SQL_utils sql = new SQL_utils("backend");

		List<SqlParameter> ps = new List<SqlParameter>();

		ps.Add(sql.CreateParam("datebeg", txtD1.Text, "date"));
		ps.Add(sql.CreateParam("dateend", txtD2.Text, "date"));
		ps.Add(sql.CreateParam("studies", studies, "text"));


		DataTable dt = sql.DataTable_from_ProcName("spTracking_Sessions_Counts", ps);
		gv.DataSource = dt;
		gv.DataBind();


		if(studies.Contains("1076") | studies.Contains("1077"))
		{
			List<SqlParameter> psTadpole = new List<SqlParameter>();

			psTadpole.Add(sql.CreateParam("datebeg", txtD1.Text, "date"));
			psTadpole.Add(sql.CreateParam("dateend", txtD2.Text, "date"));


			DataTable dtTadpole = sql.DataTable_from_ProcName("spTracking_Sessions_Counts_TadpoleTX_hrs", psTadpole);
			gvTadpole.DataSource = dtTadpole;
			gvTadpole.DataBind();
		}



	}



	protected void btnGetCounts_Command(object sender, CommandEventArgs e)
	{

	}

	//protected void ddlID_SelectedIndexChanged(object sender, EventArgs e)
	//{
	//    if(ddlID.SelectedValue!="--Select ID--")
	//    {
	//        LoadSubjectInfo(ddlID.SelectedValue);
	//    }
	//}



	//protected void LoadSubjectInfo(string str_subjID)
	//{
	//    int subjID = 0;
	//    bool success = int.TryParse(str_subjID, out subjID);


	//    if (success & subjID > 0)
	//    {
	//        //populate the Subject Superform by updating the select parameter
	//        sqlSUBJ.SelectParameters[0].DefaultValue = subjID.ToString();

	//        #region markup SQL
	//        ////populate the Measure grid by updating the select parameter
	//        //sqlA.SelectParameters[0].DefaultValue = subjID.ToString();
	//        //gridA.DataBind();


	//        ////populate the Measure grid by updating the select parameter
	//        //sqlM.SelectParameters[0].DefaultValue = subjID.ToString();
	//        //gridM.DataBind();
	//        #endregion



	//        SQL_utils sql = new SQL_utils("backend");

	//        List<SqlParameter> ps = new List<SqlParameter>();

	//        ps.Add(sql.CreateParam("subjID", subjID.ToString(), "int"));
	//        ps.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
	//        ps.Add(sql.CreateParam("ID", ID, "text"));

	//        //DataSet ds = new DataSet();

	//        if (p != null)
	//        {
	//            DataTable dt_tp = p.GetChecked_as_DataTable();
	//            ps.Add(sql.CreateParam("tp", dt_tp));
	//            ds = sql.DataSet_from_ProcName("spTracking_SubjInfo", ps);
	//        }
	//        else
	//        {
	//            ds = sql.DataSet_from_ProcName("spTracking_SubjInfo_all_tp", ps);
	//        }

	//        //LoadForm(ds.Tables[0]);
	//        //LoadGrid(superS, ds.Tables[0]);
	//        LoadGrid(gridA, ds.Tables[1]);
	//        LoadGrid(gridM, ds.Tables[2]);
	//        LoadGrid(gridC, ds.Tables[3]);


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

	// protected void LoadTimepoints()
	// {
	//     SQL_utils sql = new SQL_utils("backend");

	//     DataTable dt = sql.DataTable_from_SQLstring("select timepoint_text, timepointID from tblTimepoint  where studyID= " + Master.Master_studyID.ToString() +
	//            " group by timepoint_text, timepointID, timepoint order by timepoint");

	//     if (dt.Rows.Count > 1)
	//     {
	//         UpdatePanel_O_CheckBoxes p = new UpdatePanel_O_CheckBoxes(dt, "timepointID", "TimePoint", "timepoint_text", "timepointID", "int", "1");
	//         p.ID = "timepointID";
	//         p_timepoint.Controls.Add(p);
	//     }

	//     sql.Close();

	// }


	 
	// protected void LoadGrid(SuperForm g, DataTable dt)
	// {
	//     g.DataSource = dt;
	//     g.DataBind();
	// }


	//protected void LoadGrid(Grid g, DataTable dt) 
	//{

	//    // extract the current grouping - it can be "Country" or
	//    // whatever column the end users grouped by
	//    string currentGroupBy = g.GroupBy;

	//    g.DataSource = dt;

	//    // resetting the GroupBy
	//    g.GroupBy = currentGroupBy;

	//    // rebinding the Grid
	//    g.DataBind();
	//}


	


	//public string loadMeasstatusdetail(string measstatusID, string measstatusdetailID)
	//{
	  
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


	////protected string GetControlClientIdFromTemplate(string controlId, int
	////templateIndex, string tpl_name) {
	////    string ctlID = "";
	////    if (tpl_name == "gridM")
	////    {
	////        Control ctrl = gridM.Templates[templateIndex].Container.FindControl(controlId);
	////        ctlID = ctrl.ClientID;
	////    }

	////    return ctlID;
	////}


	//public string GetControlClientIdFromTemplate(string gridname, string controlId, int templateIndex)
	//{
	//    Grid grid = (Grid)this.FindControlRecursive(gridname);
	//    Control ctl = grid.Templates[templateIndex].Container.FindControl(controlId);
	//    string ctlID = "";
	//    ctlID = ctl.ClientID;


	//    return ctlID;
	//}


	//protected void btnM_Update_Click(object sender, EventArgs e)
	//{

	//    int x = 0;

	//}

	//protected void btnM_Update_Command(object sender, CommandEventArgs e)
	//{
	//    int x = 0;
	//}





	//public class Mdata
	//{
	//    int studymeassubj;
	//    int measstatusID;
	//    int measstatusdetailID;
	//    string notes;


	//}

	//[WebMethod]
	////public static void UpdateM(Mdata m)
	//public static void UpdateM(string subjID, string smsIDs, string measstatusID, string measstatusdetailID, string date, string clinician, string notes)
	//{
		
	//    SQL_utils sql = new SQL_utils("backend");


	//    List<SqlParameter> ps = new List<SqlParameter>();

	//    ps.Add(sql.CreateParam("smsIDs", smsIDs, "text"));
	//    ps.Add(sql.CreateParam("measstatusID", measstatusID, "int"));
	//    ps.Add(sql.CreateParam("measstatusdetailID", measstatusdetailID, "int"));
	//    ps.Add(sql.CreateParam("date", date, "date"));
	//    ps.Add(sql.CreateParam("clinician", clinician, "int"));
	//    ps.Add(sql.CreateParam("notes", notes, "text"));

	//    sql.StringScalar_from_ProcName("spTracking_SubjInfo_M_UPDATE", ps);

	//    sql.Close();

	//}




	//protected void gridM_UpdateCommand(object sender, GridRecordEventArgs e)
	//{

	//    try
	//    {
	//        string x = "";
	//        oboutGrid_utils o = new oboutGrid_utils();

	//        if (gridM.SelectedRecords != null)
	//        {
	//            int[] recs = GetSelectedRecords(gridM, "studymeassubjID");
	//            x = o.oGrid_UpdateData(e.Record, "tblstudymeassubj", "backend", "dbo", "studymeassubjID", recs);
	//        }
	//        else
	//        {
	//            x = o.oGrid_UpdateData(e.Record, "tblstudymeassubj", "backend", "dbo", "studymeassubjID");
	//        }
	//    }
	//    catch (Exception) { }


	//    //LoadSubjectInfo(ddlID.SelectedValue);

	//    //gridM.DataBind();
		
	//}

	//protected void gridM_Rebind(object sender, EventArgs e)
	//{
	//    LoadSubjectInfo(ddlID.SelectedValue);
	//}


	//protected void gridA_Rebind(object sender, EventArgs e)
	//{
	//    LoadSubjectInfo(ddlID.SelectedValue);
	//}


	// protected int[] GetSelectedRecords(Grid g, string fldname)
	//{
	//    int[] x = new int[g.SelectedRecords.Count];
	//    int i = 0;
	//    foreach (Hashtable oRecord in g.SelectedRecords)
	//    {
	//        x[i] = Convert.ToInt32(oRecord[fldname].ToString());
	//        i++;
	//    }

	//    return x;
	//}

	// protected void gridM_RowCreated(object sender, GridRowEventArgs e)
	// {


		
	// }

	// protected void gridM_RowDataBound(object sender, GridRowEventArgs e)
	//{


	//    if (e.Row.RowType == GridRowType.DataRow)
	//    {
	//        e.Row.Style["background-image"] = "none";

	//        e.Row.Cells[6].BackColor = Color.FromName(e.Row.Cells[6].Text);


	//        //int counter = 0;
	//        //foreach (TableCell cell in e.Row.Cells)
	//        //{
	//        //    string t = cell.Text;
	//        //    cell.Text += counter.ToString();

	//        //    if (t != null)
	//        //    {
	//        //        e.Row.Style["background-image"] = "none";
	//        //        cell.BackColor = Color.FromName(t);
	//        //    }
	//        //    else
	//        //    {
	//        //        e.Row.Style["background-image"] = "none";
	//        //        cell.BackColor = Color.FromName("Yellow");
	//        //        cell.ForeColor = Color.Blue;
	//        //    }

	//        //    counter++;
	//        //}

			
	//        //Hashtable oRecord = (Hashtable) e.Row.
	//        //e.Row.GetHashCode
	//    }
	//}






	////Pass in the ctlname and filtervalue to get the data to populate a DDL
	////with a subset of relevant options.  This string is then passed back to a
	////Javascript function that loads the ddl.
	//public string GetDDLcontents(string ctlname, string measstatusID, string measstatusdetailID)
	//{
	//        SQL_utils sql = new SQL_utils("backend");
	//        string data = "";
	//        DataTable dt = new DataTable();




	//        if (ctlname == "measstatusdetailID")
	//        {


	//            dt = sql.DataTable_from_SQLstring("select '--select detail--^-1' as textvalue union select measstatusdetail  +'^'+ cast(measstatusdetailID as varchar) textvalue from tblMeasstatusdetail_lkup" +
	//                " where measstatusdetailID in (select measstatusdetailID from tblmeasstatusanddetail where measstatusID=" + measstatusID.ToString() + ")");

	//        }

	//        data = String.Join(";", dt.AsEnumerable().Select(r => r.Field<string>("textvalue")).ToArray());

	//        if (measstatusdetailID == "") measstatusdetailID = "-1";


	//        Control ctl = (Control)gridM.Templates[0].Container.FindControl("ddl_" + ctlname);

	//        data += "|" + measstatusdetailID.ToString() + "|ddl_" + ctlname;

	//        return data;


	//}


	//protected void FixDate(string thedate)
	//{

	//    OboutInc.Calendar2.Calendar cal = (OboutInc.Calendar2.Calendar)gridM.Templates[0].Container.FindControl("cal_M_datedone");
	//    cal.SelectedDate = Convert.ToDateTime(thedate);
	//}





	////protected void Combo_LoadingItems(object sender,
	////ComboBoxLoadingItemsEventArgs e) {
	////    if (!string.IsNullOrEmpty(e.Text))
	////    {
	////        int tryout = 0;
	////        if (int.TryParse(e.Text, out tryout))
	////        {
	////            sql2.SelectParameters[0].DefaultValue = e.Text;
	////            sql2.DataBind();
	////        }
	////    }
	////}

	//protected void superS_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
	//{
	//    e.NewValues["subjstatusID"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)superS.Rows[3]).FindControl("ddlSubjStatus")).SelectedValue;
	//    e.NewValues["subjstatusdetailID"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)superS.Rows[4]).FindControl("ddlSubjStatusDetail")).SelectedValue;
	//}


	//protected void ddlSubjStatus_SelectedIndexChanged(object sender, ComboBoxItemEventArgs e)
	//{
	//    sqlSSD.SelectParameters[0].DefaultValue = e.Item.Value;
	//}

	////protected void superS_DataBound(object sender, EventArgs e)
	////{
	////    if (superS.CurrentMode == DetailsViewMode.Edit)
	////    {
	////        sqlSSD.SelectParameters[0].DefaultValue = DataBinder.Eval(superS.DataItem, "subjstatusID").ToString();
	////        //((Obout.ComboBox.ComboBox)((DetailsViewRow)superS.Rows[5]).FindControl("ddlSubjStatusDetail")).SelectedValue = DataBinder.Eval(superS.DataItem, "subjstatusdetailID").ToString();
	////    }
	////    else
	////    {
	////        sqlSSD.SelectParameters[0].DefaultValue = "";
	////    }
	////}





	////protected void checked_Click(object sender, EventArgs e) {
	////    string selectedIDs = "";

	////    //for (int i = 0; i < gridM.RowsInViewState.Count; i++) {
	////    //    GridDataControlFieldCell cell = gridM.RowsInViewState[i].Cells[0] as GridDataControlFieldCell;
	////    //    CheckBox chk = cell.FindControl("chkID_M") as CheckBox;

	////    //    if (chk.Checked == true)
	////    //    {
	////    //        if (!string.IsNullOrEmpty(selectedIDs))
	////    //            selectedIDs += ", ";

	////    //        selectedIDs += chk.ToolTip;
	////    //    }
	////    //}




	////    for (int i = 0; i < gridM.Rows.Count; i++)
	////    {
	////        string z = gridM.Rows[i].RowState.ToString();

	////        if (gridM.Rows[i].RowState == DataControlRowState.Selected)
	////        {
				

	////            DataRowView v = (DataRowView)gridM.Rows[i].DataItem;
	////            string x = v["studymeassubjID"].ToString();
	////            selectedIDs += x + ",";
	////        }
	////    }

	////    if (!string.IsNullOrEmpty(selectedIDs))
	////    lblChecked.Text = "<span class='tdText'>The orders with the following IDs have been processed: <b>" + selectedIDs + "</b></span><br /><br />";

	////}
	//protected void btnA_Click(object sender, EventArgs e)
	//{
	//    if(gridA.Visible == true)
	//    {
	//        gridA.Visible = false;
	//        btnA.Text = "Show";
	//    }
	//    else
	//    {
	//        LoadSubjectInfo(ddlID.SelectedValue);
	//        gridA.Visible = true;
	//        btnA.Text = "Hide";

	//    }
	//    //panel.Update();
	//}


	//protected void btnM_Click(object sender, EventArgs e)
	//{
	//    if (gridM.Visible == true)
	//    {
	//        gridM.Visible = false;
	//        btnM.Text = "Show";
	//    }
	//    else
	//    {
	//        LoadSubjectInfo(ddlID.SelectedValue);
	//        gridM.Visible = true;
	//        btnM.Text = "Hide";

	//    }
	//    //panel.Update();
	//}

	//protected void btnC_Click(object sender, EventArgs e)
	//{
	//    if (gridC.Visible == true)
	//    {
	//        gridC.Visible = false;
	//        btnC.Text = "Show";
	//    }
	//    else
	//    {
	//        LoadSubjectInfo(ddlID.SelectedValue);
	//        gridC.Visible = true;
	//        btnC.Text = "Hide";

	//    }
	//    //panel.Update();
	//}





	//protected void gridM_Filtering(object sender, EventArgs e)
	//{
	//    int x = 0;

	//}
}




