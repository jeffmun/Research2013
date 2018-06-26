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


public partial class Tracking_VStudyNs : OboutInc.oboutAJAXPage
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

		//LoadStudyNs();


		if (!IsPostBack)
		{
			LoadPIs();

			string sqltxt = "select PHONE_HOME from tblstaff where actdirID = 'jeffmun'";

			//SQL_utils vsql = new SQL_utils("vbackend");
			//string vtext = vsql.StringScalar_from_SQLstring(sqltxt);

			//SQL_utils sql = new SQL_utils("backend");
			//string text = sql.StringScalar_from_SQLstring(sqltxt);


			//lbl1.Text = text;
			//vlbl1.Text = vtext;
		}




	}
	#endregion

	
	protected void LoadPIs()
	{
		SQL_utils sql = new SQL_utils("vbackend");

		DataTable dt = sql.DataTable_from_SQLstring("select -1 staffID, '<select PI>' pi_name union select staffID, firstname + ' ' + lastname as pi_name from tblStaff where staffID in (select distinct(PI) from tblstudy where PI is not null)");

		ddlPI.DataSource = dt;
		ddlPI.DataBind();
	 }

	protected void LoadStudyNs()
	{
		SQL_utils sql = new SQL_utils("vbackend");

		string PI = ddlPI.SelectedValue;


		DataTable dt1 = sql.DataTable_from_SQLstring("exec spSubjects_by_PI " + PI + ", 'byStudy'");
		DataTable dt2 = sql.DataTable_from_SQLstring("exec spSubjects_by_PI " + PI + ", 'byStudy_GroupType'");
		DataTable dt3 = sql.DataTable_from_SQLstring("exec spSubjects_by_PI " + PI + ", 'byStudy_Group'");



		GridView gv1 = new GridView();
		gv1.DataSource = dt1;
		gv1.DataBind();
		panel1.Controls.Add(gv1);

		GridView gv2 = new GridView();
		gv2.DataSource = dt2;
		gv2.DataBind();
		panel2.Controls.Add(gv2);


		GridView gv3 = new GridView();
		gv3.DataSource = dt3;
		gv3.DataBind();
		panel3.Controls.Add(gv3);



		label1.Visible = true;
		label2.Visible = true;
		label3.Visible = true;

		sql.Close();        
	}


	protected void ddlPI_SelectedIndexChanged(object sender, EventArgs e)
	{
		LoadStudyNs();
	}
}




