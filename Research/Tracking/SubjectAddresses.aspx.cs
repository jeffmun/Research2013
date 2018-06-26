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


public partial class Tracking_SubjectAddresses : OboutInc.oboutAJAXPage
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

	protected void btnGetAddresses_Click(object sender, EventArgs e)
	{
		UpdatePanel_O_CheckBoxes p =  (UpdatePanel_O_CheckBoxes)panelChk.FindControl("study1");

		string studies = p.GetChecked_as_CSV();


		SQL_utils sql = new SQL_utils("backend");

		List<SqlParameter> ps = new List<SqlParameter>();

		ps.Add(sql.CreateParam("studies", studies, "text"));


		DataTable dt = sql.DataTable_from_ProcName("spTracking_Subj_AddressList", ps);
		dt.TableName = "Subject Addresses";

		string datenow = DateTime.Now.Year.ToString() + ((DateTime.Now.Month < 10) ? "0" : "") + DateTime.Now.Month.ToString() + ((DateTime.Now.Day < 10) ? "0" : "") + DateTime.Now.Day.ToString();
		string hrminnow = ((DateTime.Now.Hour < 10) ? "0" : "") + DateTime.Now.Hour.ToString() + ((DateTime.Now.Minute < 10) ? "0" : "") + DateTime.Now.Minute.ToString();

		string filename = "UWAC_Subject_Addresses_" + datenow + "_" + hrminnow; //TODO


		SpreadsheetGearUtils.SaveDataTableToExcel(dt, filename, "xlsx");
	}


}




