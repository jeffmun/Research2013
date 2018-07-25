using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
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


public partial class Admin_Staff : BasePage
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

		if(Session["staffID_to_edit"] != null)
		{
			Debug.WriteLine(Session["staffID_to_edit"]);
		}
		else{
			Debug.WriteLine("NO ONE TO EDIT!!");
		}

		
		if (!IsPostBack)
		{

			if(Request.QueryString["mode"]=="new")
			{
				gridStaffList.AddNewRow();
			}

		}
		if (IsCallback)
		{
			 
		}
		 
	}

	protected void dxgrid_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;

		string shortname = String.Format("{0}{1}"
			, e.NewValues["firstname"].ToString().Substring(0, 1)
			, e.NewValues["lastname"].ToString()) ;

		string staffinits = String.Format("{0}{1}"
			, e.NewValues["firstname"].ToString().Substring(0, 1)
			, e.NewValues["lastname"].ToString().Substring(0, 1));

		e.NewValues.Add("active", "1");
		e.NewValues.Add("staffshortname", shortname);
		e.NewValues.Add("staffinits", staffinits);
		

		bool result = DxGridView.BuildInsertSqlCode(e, "tblStaff", "backend");
		gv.CancelEdit();
		e.Cancel = true;
	}

	protected void dxgrid_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxGridView.BuildUpdateSqlCode(e, "tblStaff", "backend");
		gv.CancelEdit();
		e.Cancel = true;
	}



}