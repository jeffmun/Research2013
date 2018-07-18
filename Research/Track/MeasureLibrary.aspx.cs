using DevExpress.Web;
using DevExpress.Web.Export;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.Web.Data;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraGrid;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.Services;
using uwac;
using uwac.trk;


public partial class Track_MeasureLibrary : System.Web.UI.Page
{
	private string ID;
	private string group_csv;
	private string subjstatus_csv;

	#region Page Events
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = Master.Master_studyID.ToString();
	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("Subjects.aspx");
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		bool isCallback = IsCallback;
		bool isPostback = IsPostBack;


		if (!IsCallback && !IsPostBack)
		{
			
		}

		else if (IsCallback )
		{

			
		}

	}



	protected void gridDict_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
	{
	}

	protected void gridDict_DataBinding(object sender, EventArgs e)
	{	
	}

	protected void gridDict_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
	{


	}






	#endregion








}