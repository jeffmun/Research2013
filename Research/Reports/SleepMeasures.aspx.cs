using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// Imports needed for R
using System.Threading;
using System.IO;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
//using RDotNet;
//using RDotNet.NativeLibrary;
using RedcapLibrary;
using uwac;
using uwac_REDCap;
using DevExpress.Web;
using DevExpress.XtraCharts.Web;
using DevExpress.XtraCharts;
using System.Data.SqlClient;
//using uwac_REDCap;

public partial class Reports_SleepMeasures : BasePage
{

	protected void Page_Load(object sender, EventArgs e)
	{


		
	}


	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("SleepMeasures.aspx");
	}


}