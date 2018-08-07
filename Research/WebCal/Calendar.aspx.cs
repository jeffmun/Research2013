using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using uwac;

using AutismCenterBase.Utilities;
using System.Linq;
using DevExpress.Web;
using DevExpress.Web.ASPxScheduler;
using DevExpress.XtraScheduler;
using DevExpress.XtraScheduler.Native;
using DevExpress.Web.ASPxScheduler.Controls;
using DevExpress.Web.ASPxScheduler.Drawing;
using System.Drawing;

public partial class WebCal_Calendar : BasePage 
{
	private DateTime dtStartDate;
	private DateTime dtEndDate;

	private void Page_Init(object sender, EventArgs e)
	{
		dtStartDate = Convert.ToDateTime("10/1/2015");
		dtEndDate = dtStartDate.AddDays(30);

		deStart.Value = dtStartDate;
		deEnd.Value = dtEndDate;

		dxSched.Start = dtStartDate;
	}

	private void Page_Load(object sender, System.EventArgs e)
	{

		bool isPostback = IsPostBack;
		bool isCallback = IsCallback;


		dtStartDate = Convert.ToDateTime(deStart.Value);
		dtEndDate = Convert.ToDateTime(deEnd.Value) ;

		TimeSpan ndays =  dtEndDate - dtStartDate;
		tbInfo.Text = String.Format("{0} days", ndays.TotalDays);

		var appts = dxSched.Storage.Appointments;
		int n_appts = dxSched.Storage.Appointments.Count;
		int n_studies = dxSched.Storage.Resources.Count;

		if (n_appts > 0)
		{
			string info = String.Format("{0} appointments in the {1} days between {2} and {3}", n_appts, ndays.TotalDays, dtStartDate.ToShortDateString(), dtEndDate.ToShortDateString());
			lblCount.Text = info;
		}

		dxSched.LimitInterval = new DevExpress.XtraScheduler.TimeInterval(dtStartDate, dtEndDate);

		

	}


	protected void btnSubmit_Click(object sender, EventArgs e)
	{
		//if (IsPostBack && ASPxEdit.ValidateEditorsInContainer(this))
		//	Page.ClientScript.RegisterStartupScript(this.GetType(), "alert",
		//			@"<script type=""text/javascript"">alert('The form has been submitted successfully.');</script>");
	}


		
		
	}




