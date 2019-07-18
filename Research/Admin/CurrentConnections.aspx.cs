using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using uwac;



public partial class Admin_CurrentConnections : BasePage
{ 
	private string schema;
	private string master_tbl;
	private string detail_tbl;
	private string master_pk;
	private string detail_pk;
	private bool usestudy;
	private int master_pkvalue;
	private int viewstate_pkvalue;

	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{

		Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);

	}


	protected void Page_Load(object sender, EventArgs e)
	{

		bool bool_isPostback = IsPostBack;

		
		if (!IsPostBack)
		{
			LoadData();
		}

	}

	

	protected void LoadData()
	{
		SQL_utils sql = new SQL_utils("backend");

		
		string sqlcode = "select a.staffID, lastname, firstname, actdirID NETID, numHits, unqHits, hitTime, dbo.fnElapTime_text(hittime, getdate()) as lastHit " +
		" , datediff(minute, hittime, getdate()) mins_since_lastHit " + 
		"from uwautism_research_backend..tblStaff a " +
		"join tblSessionCounter b ON a.staffID = b.staffID order by hitTime desc";

		

		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		grid.DataSource = dt;
		grid.DataBind();


		sql.Close();
	}

}