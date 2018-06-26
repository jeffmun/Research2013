using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
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

public partial class Info_Tracking : System.Web.UI.Page
{
  


	#region Page Events
	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("~/Tracking/Tracking.aspx");
	}

	//public override void VerifyRenderingInServerForm(Control control)
	//{
	//    /* Verifies that the control is rendered */
	//}



	protected void Page_Load(object sender, EventArgs e)
	{

		LoadCheckBoxes();

		if (!IsPostBack)
		{
			//
		}

	}
	#endregion


	protected void LoadCheckBoxes ()
	{
		int studyID = Master.Master_studyID;

		SQL_utils sql = new SQL_utils("backend");

		DataSet ds = sql.DataSet_from_ProcName("spTracking_Populate_CheckBox_Selectors", sql.CreateParam("studyID", studyID.ToString(), "int"));


		p_group.Controls.Add(new UpdatePanel_O_CheckBoxes(ds.Tables[0], "groupID", "Group", "groupname", "groupID", "int", "1"));
		p_subjstatus.Controls.Add(new UpdatePanel_O_CheckBoxes(ds.Tables[1], "subjstatusID", "Subject Status", "subjstatus", "subjstatusID", "int", "1"));
		p_id.Controls.Add(new UpdatePanel_O_CheckBoxes(ds.Tables[2], "subjID", "ID", "id", "subjID", "int", "1"));
		p_timepoint.Controls.Add(new UpdatePanel_O_CheckBoxes(ds.Tables[3], "timepointID", "TimePoint", "timepoint_text", "timepointID", "int", "1"));
		p_actiontype.Controls.Add(new UpdatePanel_O_CheckBoxes(ds.Tables[4], "actiontypeID", "Action Type", "actiontype", "actiontypeID", "int", "1"));
		p_studyaction.Controls.Add(new UpdatePanel_O_CheckBoxes(ds.Tables[5], "studyactionID", "Action", "actiontext", "studyactionID", "int", "1"));
		p_measure.Controls.Add(new UpdatePanel_O_CheckBoxes(ds.Tables[6], "measureID", "Measure", "measname", "measureID", "int", "1"));
		p_consent.Controls.Add(new UpdatePanel_O_CheckBoxes(ds.Tables[7], "consentformversionID", "Consent", "cfvname", "consentformversionID", "int", "1"));


	}


	protected void GetSelectedItems()
	{

		List<string> lst = new List<string> { "groupID", "subjstatusID", "timepointID", "actiontypeID", "studyactionID", "measureID", "subjID" };

		foreach(string s in lst)
		{
			UpdatePanel_O_CheckBoxes p = (UpdatePanel_O_CheckBoxes)Page.FindControlRecursive( s);
			DataTable dt = p.GetChecked_as_DataTable();
			GridView gv = new GridView();
			gv.DataSource = dt;
			gv.DataBind();
			panel_test.Controls.Add(gv);

			string where = p.GetChecked_as_Where_Clause();

			lblInfo.Text += where + "<br/>";

		}
		
	}


	protected DataSet LoadSelectedItems_into_DataSet()
	{
		DataSet ds = new DataSet();
		List<string> lst = new List<string> { "groupID", "subjstatusID", "subjID" };

		if (RadioButtonList_mode.SelectedValue=="A")
		{
			string[] addA = new string[] { "timepointID", "actiontypeID", "studyactionID" };
			lst.AddRange(addA);
		}
		else if (RadioButtonList_mode.SelectedValue == "M")
		{
			string[] addM = new string[] { "timepointID", "measureID" };
			lst.AddRange(addM);
		}

		foreach (string s in lst)
		{
			UpdatePanel_O_CheckBoxes p = (UpdatePanel_O_CheckBoxes)Page.FindControlRecursive(s);
			DataTable dt = p.GetChecked_as_DataTable();
			dt.TableName = s;

			ds.Tables.Add(dt);

		}

		return ds;

	}




	protected DataTable GetTrackingData(string mode)
	{

		SQL_utils sql = new SQL_utils("backend");
		List<SqlParameter> ps = new List<SqlParameter>();

		//Get Info
		DataSet ds = LoadSelectedItems_into_DataSet();

		foreach (DataTable dt in ds.Tables)
		{
			ps.Add(sql.CreateParam(dt.TableName, dt));
		}


		DataTable dtX = sql.DataTable_from_ProcName("spTracking_GetInfo_" + mode, ps);

		sql.Close();

		return dtX;

	}


	protected void Process_Button_Command(object sender, CommandEventArgs e)
	{
		if(e.CommandName=="Info")
		{
			//GetSelectedItems();



			string mode = RadioButtonList_mode.SelectedValue;
			string IDplacement = RadioButtonList_IDplacement.SelectedValue;


			DataTable dtX = GetTrackingData(mode);


			DataTable dtX1 = new DataTable();


			if (mode == "S")
			{
				dtX1 = dtX.Copy();
				//if (IDplacement == "col") {
				//    string[] keep = new string[] { "ID", "action", "actiontype", "studyactionID", "statusshort" };
				//dtX1 = utilsPivot.Pivot(dtX, keep, "ID", "statusshort");
				//}
				//else if (IDplacement == "row")
				//{
				//    string[] keep = new string[] { "ID", "groupname",
				//    "subjstatus", "action", "studyactionID", "statusshort" };
				//dtX1 = utilsPivot.Pivot(dtX, keep, "action", "statusshort");
				//}
			}
			else if (mode == "A")
			{
				if (IDplacement == "col")
				{
					string[] keep = new string[] { "ID", "action", "actiontype", "studyactionID", "statusshort" };
					dtX1 = utilsPivot.Pivot(dtX, keep, "ID", "statusshort");
				}
				else if (IDplacement == "row")
				{
					string[] keep = new string[] { "ID", "groupname", "subjstatus", "action", "studyactionID", "statusshort" };
					dtX1 = utilsPivot.Pivot(dtX, keep, "action", "statusshort");
				}
			}
			else if(mode=="M")
			{
				if (IDplacement == "col")
				{
					string[] keep = new string[] { "ID", "StudyMeas", "timepoint_text", "statusshort" };
					dtX1 = utilsPivot.Pivot(dtX, keep, "ID", "statusshort");
				}
				else if (IDplacement == "row")
				{
					string[] keep = new string[] { "ID", "groupname", "subjstatus", "studymeas",  "statusshort" };
					dtX1 = utilsPivot.Pivot(dtX, keep, "StudyMeas", "statusshort");
				}

			}


		
			//GridView gv1 = new GridView();
			//gv1.DataSource = dtX1;
			//gv1.DataBind();
			//panel_test.Controls.Add(gv1);


			//grid1.DataSource = dtX1;
			//grid1.DataBind();
			//grid1.Visible = true;

			grid0.DataSource = dtX1;
			grid0.DataBind();

			Panel_grid.Visible = true;
		
		}

	}
	protected void grid0_RowDataBound(object sender, GridRowEventArgs e)
	{
		if(e.Row.RowType== GridRowType.DataRow)
		{

			DataRowView vw = (DataRowView) e.Row.DataItem;

			foreach(TableCell celllabel in e.Row.Cells)
			{
				string cellval = celllabel.Text;
				celllabel.ForeColor = System.Drawing.Color.Black;



				celllabel.BackColor =  utilColor.GetCellColor( RadioButtonList_mode.SelectedValue, cellval);

				//switch (cellval)
				//{
				//    //to fix with a query to return a data table and loop through it

				//    // /* Run the following query to create this syntax from the meta data in the DB */
				//    //select distinct('        case "' + sms_dd_status + '": celllabel.BackColor = SystemDrawing.Color.' + sms_dd_color + '; break;' )
				//    //from tblSMS_DD_lkup order by verified, flag_sqldatatable_is_NA desc, SM_in_DatData, measstatusID

				//    //case "": if (_colnames[c] != "TimePoint") celllabel.BackColor = System.Drawing.Color.Gray; break;
				//    case "CK_e": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
				//    case "CK_g": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
				//    case "CK_h": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
				//    case "D_ND": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
				//    case "D0": celllabel.BackColor = System.Drawing.Color.DarkGreen; break;
				//    case "D1": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;
				//    case "D2": celllabel.BackColor = System.Drawing.Color.DarkGreen; break;
				//    case "NA": celllabel.BackColor = System.Drawing.Color.Gray; break;
				//    case "NA_D1": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
				//    case "NA_D2": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
				//    case "NA_ND": celllabel.BackColor = System.Drawing.Color.Red; break;
				//    case "ND": celllabel.BackColor = System.Drawing.Color.DarkRed; break;
				//    case "ND.": celllabel.BackColor = System.Drawing.Color.Red; break;
				//    case "ND_": celllabel.BackColor = System.Drawing.Color.Red; break;
				//    case "ND_D1": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
				//    case "ND_D2": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
				//    case "NDL": celllabel.BackColor = System.Drawing.Color.Red; break;
				//    case "TBC": celllabel.BackColor = System.Drawing.Color.CornflowerBlue; break;
				//    case @"TBC.": celllabel.BackColor = System.Drawing.Color.CornflowerBlue; break;
				//    case "TBC_D1": celllabel.BackColor = System.Drawing.Color.Yellow; break;
				//    case "TBC_D2": celllabel.BackColor = System.Drawing.Color.Yellow; break;
				//    case "TBC_ND": celllabel.BackColor = System.Drawing.Color.DarkOrange; break;
				//    case "TE": celllabel.BackColor = System.Drawing.Color.Lime; break;
				//    case "TE.": celllabel.BackColor = System.Drawing.Color.Lime; break;

				//    //Actions
				//    case "TBD": celllabel.BackColor = System.Drawing.Color.CornflowerBlue; break;
				//    case "Pass": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;
				//    case "COMP": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;
				//    case "Yes": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;
				//    case "MISSED": celllabel.BackColor = System.Drawing.Color.Red; break;
				//    case "No": celllabel.BackColor = System.Drawing.Color.Red; break;
				//    case "DC": celllabel.BackColor = System.Drawing.Color.Red; break;
				//    case "NOSHOW": celllabel.BackColor = System.Drawing.Color.Red; break;
				//    case "Fail": celllabel.BackColor = System.Drawing.Color.Red; break;
				//    case "Sched": celllabel.BackColor = System.Drawing.Color.Lime; break;
				//    case "Inc/Fup": celllabel.BackColor = System.Drawing.Color.Yellow; break;
				//    case "NA-ss": celllabel.BackColor = System.Drawing.Color.Gray; break;

				//    //CONSENTS
				//    case "Comp": celllabel.BackColor = System.Drawing.Color.ForestGreen; break;
				//}
			}
		}
	}



	protected void RadioButtonList_mode_SelectedIndexChanged(object sender, EventArgs e)
	{
		grid0.ClearPreviousDataSource();
		Panel_grid.Visible = false;

		RadioButtonList_IDplacement.Visible = true;

		string mode = RadioButtonList_mode.SelectedValue;
		if (mode=="S" | mode=="ENR")
		{
			p_timepoint.Visible = false;
			p_actiontype.Visible = false;
			p_studyaction.Visible = false;
			p_measure.Visible = false;
			p_consent.Visible = false;
			RadioButtonList_IDplacement.Visible = false;
		}
		else if (mode == "A")
		{
			p_timepoint.Visible = true;
			p_actiontype.Visible = true;
			p_studyaction.Visible = true;
			p_measure.Visible = false;
			p_consent.Visible = false;
		}
		else if (mode == "M")
		{
			p_timepoint.Visible = true;
			p_actiontype.Visible = false;
			p_studyaction.Visible = false;
			p_measure.Visible = true;
			p_consent.Visible = false;
		}
		else if (mode == "C")
		{
			p_timepoint.Visible = true;
			p_actiontype.Visible = false;
			p_studyaction.Visible = false;
			p_measure.Visible = false;
			p_consent.Visible = true;
		}

	}


	//protected void grid1_ColumnsCreated(object sender, EventArgs e)
	//{
	//    //grid1.Columns[1].Width = "20%";

	//    if(grid1.Rows != null)
	//    {
	//        if (grid1.Columns.Count > 0)
	//        {

	//            //if(RadioButtonList_IDplacement.SelectedValue=="row")
	//            //{
	//            //    grid1.ScrollingSettings.FixedColumnsPosition = GridFixedColumnsPositionType.Left;
	//            //    grid1.ScrollingSettings.NumberOfFixedColumns = 3;
	//            //    grid1.Columns[0].Width = "15%";
	//            //    grid1.Columns[1].Width = "30%";
	//            //}
	//            //else
	//            //{
	//            //    grid1.ScrollingSettings.FixedColumnsPosition = GridFixedColumnsPositionType.Left;
	//            //    grid1.ScrollingSettings.NumberOfFixedColumns = 1;
	//            //    grid1.Columns[0].Width = "20%";
	//            //    grid1.Columns[1].Width = "10%";
	//            //}

	//        }

	//    }


	//}


	//will need to use this:
	// https://www.obout.com/grid/grid_auto_scroll.aspx




	//The Grid allows developers to add an extra heading above the column
	//headers. The content of this heading is custmizable using templates. Use
	//the TemplateSettings.HeadingTemplateId property to specify the ID of the
	//template that will be rendered in the heading.

	//For the source code please check the
	//"aspnet_customization_extra_heading.aspx" sample from the Grid folder



	//For the source code please check the "aspnet_column_sets.aspx" sample from the Grid folder 


	//For the source code please check the
	//"aspnet_columns_resizing_dynamic.aspx" sample from the Grid folder

	protected void grid0_ColumnsCreated(object sender, EventArgs e)
	{
		Grid grid = sender as Grid;

		foreach (Column column in grid.Columns)
		{
			column.TemplateSettings.TemplateId = "Template1";
			column.TemplateSettings.HeaderTemplateId = "Template1";
		}
	}
}




