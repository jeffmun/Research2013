using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.Data;
using DevExpress.Web.Rendering;
using uwac;


public partial class Admin_NewMeasure: BasePage  
{
	private List<string> entities;


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


	
		if (!IsPostBack)
		{
			//lblStudyname.Text = Master.Master_studyname;

		}

	}



	protected void btnNew_OnCLick(object sender, EventArgs e)
	{	
		SQL_utils sql = new SQL_utils("backend");

		List<SqlParameter> ps = new List<SqlParameter>();

		string measname = txtName.Value.ToString();

		ps.Add(sql.CreateParam("measname", txtName.Value.ToString(), "text"));
		ps.Add(sql.CreateParam("measfullname", txtNameFull.Value.ToString(), "text"));
		ps.Add(sql.CreateParam("newmeasureID", "0", "int", "output"));

		int newmeasID = 0;
		try
		{
			newmeasID = sql.NonQuery_from_ProcName("trk.spStudyDesign__CreateNewMeasure", ps, "newmeasureID");
		}
		catch(Exception ex)
		{ 
		}

		if(newmeasID > 0)
		{
			lblNewMeasName.Text = measname;
			panelMeasure.Visible = false;
			panelTable.Visible = true;
			hidNewMeasID.Value = newmeasID.ToString();
		}
		
		sql.Close();

	}


	protected void btnNewTable_OnCLick(object sender, EventArgs e)
	{


		int newmeasID = Convert.ToInt32(hidNewMeasID.Value.ToString());

		if (newmeasID > 0)
		{
			SQL_utils sql = new SQL_utils("data");

			List<SqlParameter> ps = new List<SqlParameter>();

			string tblname = txtTblName.Value.ToString().Replace("ALL_", "");


			ps.Add(sql.CreateParam("tbl", "ALL_" + tblname, "text"));
			ps.Add(sql.CreateParam("abbr", txtAbbr.Value.ToString(), "text"));
			ps.Add(sql.CreateParam("measureID", newmeasID.ToString(), "int"));

			try
			{
				sql.NonQuery_from_ProcName("def.spPopulate_NEW_Tbl_and_Flds", ps);
			}
			catch (Exception ex)
			{
			}
			sql.Close();

		}

		txtName.Value = "";
		txtNameFull.Value = "";

		panelMeasure.Visible = true;
		panelTable.Visible = false;
		hidNewMeasID.Value = "-1";


	}
}

