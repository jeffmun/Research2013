using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
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

public partial class Info_LabStaffinfo : BasePage 
{

	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();
	
	private string[] _colnames;

	private int staffID_for_selecting;
	private int staffID_for_insert ;
	private int labID_for_insert ;
	private bool debugprint = false;


	/// <summary>
	/// SQL objects used on this page:
	/// 
	/// spSEC_PIVOT__Lab_and_AllStaffInLab_by_Studies 
	/// spSEC_LabGroup_Staff_details
	/// select dbroleID, dbRole from tblDBrole_lkup where dbroleID>0
	/// select stafftypeID, stafftype from tblStaffType_Lkup order by stafftypeID
	/// select labID, LabName from tblLab where acctmngr_staffID in (select dbo.fnGetStaffIDByCurrentUser()) order by labname
	/// select 0 as staffID, ' ..select staff..' staffname union select staffID, firstname + ' ' + lastname as staffname from tblstaff where active >= 0 order by 2
	/// 
	/// 
	/// 
	/// 
	/// 
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>

	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ConnectionString;
		oConn.Open();

		//if (!oLogin.CheckGroupPermissions("AUTISM\\Permissions Group".Split(',')))
		//{

		//    tblMaster.Rows[1].Cells[0].Controls.Clear();
		//    //tblMaster.Rows.RemoveAt(1);

		//    tblMaster.Rows[1].Cells[0].Attributes["style"] = "color: #B22222;";
		//    tblMaster.Rows[1].Cells[0].InnerHtml = "Only those in the 'Permissions group' Active Directory group are authorized to view this page.";

		//    Label1.Visible = false;
		//    DDL_SelectLabID.Visible = false;
		//    Label2.Visible = false;
		//}

		BuildLegend();
		BuildLegendTable();

		//BindTheData();
		tblmyinfo.Rows[0].Cells[0].InnerHtml = "";


		if (!IsPostBack)
		{
			//BindTheData();
		}
			
		
	}




	protected void Load_LabStaff()
	{
		
		int labID = int.Parse(DDL_SelectLabID.SelectedValue.ToString());
		int studyactive = int.Parse(DDL_StudyActive.SelectedValue.ToString());

		if (labID > 0)
		{
			SQL_utils sql = new SQL_utils("backend");


			List<SqlParameter> p = new List<SqlParameter>();

			p.Add(sql.CreateParam("labID", labID.ToString(), "int"));
			p.Add(sql.CreateParam("studyactive", studyactive.ToString(), "int"));
			p.Add(sql.CreateParam("single_staffID", "0", "int"));

			DataTable dt = sql.DataTable_from_ProcName("spSEC_Lab_and_AllStaffInLab_by_Studies", p);

			string[] keepCols = new string[] { "staffID", "StaffName", "LastLogon", "LabName", "N_Labs" };

			DataTable dt_pivot = utilsPivot.Pivot(dt, keepCols, "StudyName", "color_allowed_groups", "StaffName", "StudyName DESC");


			sql.Close();

			Gridview_LabGroup_Staff2.DataSource = dt_pivot;
			Gridview_LabGroup_Staff2.DataBind();
			Gridview_LabGroup_Staff2.Visible = true;


			Panel_AddNewStaff.Visible = false;
			btnShow_AddNew.Visible = true;
			Panel_MultLabs.Visible = true;
			Panel_EditStaff.Visible = false;
			Panel_UWAC_ADinfo.Visible = false;


		}

	}
   

	protected void BindTheData()
	{

		//Sql_LabGroup_staff.SelectParameters["single_staffID"].DefaultValue = "0";
		//Sql_LabGroup_staff.DataBind();

		//Gridview_LabGroup_Staff.DataBind();
		//Gridview_LabGroup_Staff.Visible = true;

		//new version
		Load_LabStaff();

		if (Convert.ToInt16(DDL_SelectLabID.SelectedValue) > 0)
		{
			//Panel_MultLabs.Controls.Clear();
			//GridView agv = new AutoGridView("backend", "exec spSEC_Staff_in_MultipleLabs " + DDL_SelectLabID.SelectedValue.ToString(), "gvMultLabs", false, "all_l", "all_gvBlack");
			//Label lbl = new Label(); lbl.Text = "<br/><br/>The following staff are also in additional labs: "; lbl.Font.Size = 10;
			//Panel_MultLabs.Controls.Add(lbl);
			//Panel_MultLabs.Controls.Add(agv);
		}


		//Panel1.Controls.Clear();
		////Response.Write("<script>alert('Binding...')</script>");


		//int labID = int.Parse(DDL_SelectLabID.SelectedItem.Value);


		Panel_AddNewStaff.Visible = false;
		btnShow_AddNew.Visible = true;
		Panel_MultLabs.Visible = true;
		Panel_EditStaff.Visible = false;
		Panel_UWAC_ADinfo.Visible = false;

	}

	protected void btnShowLegendTable_Click(object sender, EventArgs e)
	{
		if(Panel_LegendTable.Visible==true)
		{ Panel_LegendTable.Visible = false;
		btnShowLegendTable.Text = "Show Role Details";
		}
		else { Panel_LegendTable.Visible = true;
		btnShowLegendTable.Text = "Hide Role Details";
		}

	}

	protected void BuildLegend()
	{
		SqlCommand SqlCmd = new System.Data.SqlClient.SqlCommand();

		SqlCmd.CommandType = CommandType.Text;
		SqlCmd.CommandText = "Select replicate('_',  (16 - Len(DBrole))/2) + DBrole +  replicate('_',  (16 - Len(DBrole))/2) as DBrole  , htmlcolor from tblDBrole_lkup where DBroleID > 0";
		SqlCmd.Connection = oConn;

		SqlDataReader SqlReader = SqlCmd.ExecuteReader();

		//Fill the data table
		DataTable dt = new DataTable();
		dt.Load(SqlReader);

		int numrows = dt.Rows.Count;
	   
		foreach(DataRow row in dt.Rows){
			Label lbl = new Label();
			lbl.Text = row["DBrole"].ToString();
			lbl.Font.Bold = true;
			lbl.BackColor = Color.FromName(row["htmlcolor"].ToString());
			Panel_Legend.Controls.Add(lbl);
		}
	
	}

	protected void BuildLegendTable()
	{

		GridView agv = new AutoGridView("backend", "vwDBrole_Pivoted", "gv0", false, "all_l", "gvBlack,gvBlueViolet,gvSkyblue,gvRoyalBlue,gvOrange,gvRed,gvLime,gvTeal");
  
		Panel_LegendTable.Controls.Add(agv);

	}



	protected void Gridview_LabGroup_Staff_OnRowDataBoundPAGE(Object sender, GridViewRowEventArgs e)
	{
		// For each DataRow in the GridView

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			DataRowView datarow = (DataRowView)e.Row.DataItem;
			int dataviewcount = datarow.DataView.Count;
			string staffID = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "staffID"));

			if (staffID=="0")
			{
				e.Row.ForeColor = Color.Blue;
			}

			//LinkButton linkbutton = (LinkButton)e.Row.FindControl("btnEditStaff");
			//if (staffID == "0") { linkbutton.Visible = false;}
			//else                { linkbutton.Visible = true; }

			int numctls = e.Row.Controls.Count;
			//LogToPageUrgent("numctls=" + numctls.ToString());

			for (int i = 0; i < numctls; i++)
			{
				Control ctl = e.Row.Controls[i];
			}

			//loop through columns and adjust the color based on the contents
			for (int c = 1; c < e.Row.Cells.Count; c++)
			{
				//if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========> c: " + c.ToString() + " <br/>";

				//if (c <= _colnames.Length)  //This prevents an out of range error
				//if (c <= dataviewcount)  //This prevents an out of range error
				//if(1==1)
				//{
					DataControlFieldCell celllabel = (DataControlFieldCell)e.Row.Controls[c];

					string cellval_full = "";
					try
					{
						//cellval_full = Convert.ToString(DataBinder.Eval(e.Row.DataItem, _colnames[c-1]));  //go back and get the first value
						cellval_full = datarow[c-1].ToString();  //go back and get the first value

					}
					catch
					{
						cellval_full = "";
					}
					string cellval = "";
					string cellcolor = "white";


					string[] split = cellval_full.Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries);

					if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "<br/> cellval_full=" + cellval_full;
					if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "    cellval_full.IndexOf(|)=" + cellval_full.IndexOf("|").ToString();
					if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "    cellval_full.Length=" + cellval_full.Length.ToString();
					if (split.Length > 0) if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "    split[0]=" + split[0];

					if (split.Length > 1) if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "    split[1]=" + split[1];


					if (split.Length > 1)
					{
						celllabel.BackColor = System.Drawing.Color.FromName(split[1]);
						celllabel.Text = split[0];
					}
					else
					{
						celllabel.Text = cellval_full;
					}



				//}
			}


		}

	}


	protected void Gridview_LabGroup_Staff_RowCommandPAGE(object sender, GridViewCommandEventArgs e)
	{
		//  tblmyinfo.Rows[0].Cells[0].InnerHtml += e.CommandSource.ToString();
		//  tblmyinfo.Rows[0].Cells[0].InnerHtml += e.CommandName.ToString() + "<br/>";

		if (e.CommandName == "rowcmd_Edit_StaffDetails")
		{
			//show the controls
			Panel_UWAC_ADinfo.Visible = true;
			Panel_EditStaff.Visible = true;
			Panel_MultLabs.Visible = false;
			Panel_AddNewStaff.Visible = false;
			btnShow_AddNew.Visible = true;

			int staffID = int.Parse(e.CommandArgument.ToString());
			staffID_for_selecting = int.Parse(e.CommandArgument.ToString());

			lblCurrentStaffID.Text = e.CommandArgument.ToString();

			Refresh_Gridview_EditStaff(staffID_for_selecting);


			Gridview_LabGroup_Staff2.Visible = false;
		}


	}


	protected void LoadUWAC_ADinfo(int mystaffID)
	{
		LogToPageUrgent("UWAC_ADinfo");
		SqlCommand cmd = new SqlCommand();

		cmd.Connection = oConn;
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.CommandText = "spUWAC_ADgroups_by_StaffID";
		cmd.Parameters.Add("@staffID", SqlDbType.Int);
		cmd.Parameters["@staffID"].Direction = ParameterDirection.Input;
		cmd.Parameters["@staffID"].Value = mystaffID;

		SqlDataReader reader = cmd.ExecuteReader();

		//Fill the data table
		DataTable dt = new DataTable();
		dt.Load(reader);
		
		//build the Gridview & columns
		GridView gv = new GridView();
		gv.ID = "UWAC_ADinfo";
		gv.AutoGenerateColumns = true;  //Check here - DO NOT AUTO GENERATE THE COLUMNS, Add based on visibility assigned above
		gv.CssClass = "tblinputsmall";
		gv.DataSource = dt;

		gv.DataBind();

		Panel_UWAC_ADinfo.Controls.Clear();

		Label lbl = new Label();
		lbl.Text = "UWAC Active Directory Group Membership";
		lbl.Font.Bold = true;
		lbl.Font.Underline = true;

		Literal lit = new Literal();
		lit.Text = "<br/><br/>";

		Panel_UWAC_ADinfo.Controls.Add(lbl);
		Panel_UWAC_ADinfo.Controls.Add(lit);

		Panel_UWAC_ADinfo.Controls.Add(gv);


	}


	#region Add LabGroups =============================================================================

	protected void Show_AddNewLabGroups(Object sender, System.EventArgs e)
	{

		Panel_AddNewLabGroups.Visible = true;


		Panel_AddNewStaff.Visible = false;
		btnShow_AddNew.Visible = false;
		btnShow_AddLabGroups.Visible = false;


		Panel_UWAC_ADinfo.Visible = false;
		Panel_EditStaff.Visible = false;
	}

	#endregion



	#region Add Staff =============================================================================
	protected void Show_AddNewStaff(Object sender, System.EventArgs e)
	{

		Panel_AddNewStaff.Visible = true;
		btnShow_AddNew.Visible = false;
		btnShow_AddLabGroups.Visible = false;

		Panel_UWAC_ADinfo.Visible = false;
		Panel_EditStaff.Visible = false;
	}

	//protected void OnDataBound(Object sender, System.EventArgs e)
	//{
	//    //if (Gridview1.Rows.Count > 0)
	//    //{
	//    //    Response.Write("<script>alert('Gridview1.Rows.Count > 0')</script>");
	//    //}
	//    //else
	//    //{
	//    //    Response.Write("<script>alert('else')</script>");
	//    //}
	//}

	protected void Populate_Eligible_Groups()
	{
		int labID = int.Parse(DDL_SelectLabID.SelectedValue);
		SqlCommand cmd = new SqlCommand("exec spSEC_Eligible_Groups_for_Lab " + labID.ToString(), oConn);

		DataTable dt = new DataTable();
		SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
		sqlAdapter.Fill(dt);

		DDL_GroupID.DataSource = dt;
		DDL_GroupID.DataBind();

		
	}

	protected void cmd_AddGroupToLab(Object sender, System.EventArgs e)
	{

		int groupID = int.Parse(DDL_GroupID.SelectedItem.Value);

		if(groupID > 0)
		{
			SqlCommand oCmd = new SqlCommand();
			oCmd.CommandTimeout = 90;

			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spSEC_AddGroupToLab";


			oCmd.Parameters.Add(new SqlParameter("@labID", SqlDbType.Int));
			oCmd.Parameters["@labID"].Direction = ParameterDirection.Input;
			oCmd.Parameters.Add(new SqlParameter("@groupID", SqlDbType.Int));
			oCmd.Parameters["@groupID"].Direction = ParameterDirection.Input;

			oCmd.Parameters["@labID"].Value = int.Parse(DDL_SelectLabID.SelectedItem.Value);
			oCmd.Parameters["@groupID"].Value = groupID;

			oCmd.Connection = this.oConn;
			oCmd.ExecuteNonQuery();
		}
	}


	protected void cmd_AddExistingStaff(Object sender, System.EventArgs e)
	{

		int staffID = int.Parse(DDL_SelectStaffID.SelectedItem.Value);
		staffID_for_selecting = int.Parse(DDL_SelectStaffID.SelectedItem.Value);

		//Response.Write("<script>alert('onRowDatabound')</script>");


		if (oConn.State == ConnectionState.Closed)
		{
			oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();

			oConn.Open();
		}


		Refresh_Gridview_EditStaff(staffID_for_selecting);
		
	}

	protected void cmd_CreateNewStaff(Object sender, System.EventArgs e)
	{
		Response.Redirect("~/Info/StaffAccess.aspx");

		//Panel_CreateNewStaff.Visible = true;
		//Panel_AddNewStaff.Visible = false;

		//Panel_EditStaff.Visible = false;
		//Panel_UWAC_ADinfo.Visible = false;

		//TextBox firstname = (TextBox)tbl_insertfields.FindControl("firstname");
		//TextBox lastname = (TextBox)tbl_insertfields.FindControl("lastname");
		//TextBox actdirID = (TextBox)tbl_insertfields.FindControl("actdirID");
		//TextBox email = (TextBox)tbl_insertfields.FindControl("email");
		//TextBox phone_work = (TextBox)tbl_insertfields.FindControl("phone_work");
		//TextBox phone_home = (TextBox)tbl_insertfields.FindControl("phone_home");
		//TextBox phone_other = (TextBox)tbl_insertfields.FindControl("phone_other");
		//TextBox officelocation = (TextBox)tbl_insertfields.FindControl("officelocation");

		//firstname.Text = "";
		//lastname.Text = "";
		//actdirID.Text = "";
		//email.Text = "";
		//phone_work.Text = "";
		//phone_home.Text = ""; 
		//phone_other.Text = "";
		//officelocation.Text = "";

	}

	protected void cmd_Cancel(Object sender, System.EventArgs e)
	{ //cancel the add new staff
		Panel_AddNewStaff.Visible = false;
		btnShow_AddNew.Visible = true;
		Panel_CreateNewStaff.Visible = false;


		//BindTheData();
		Load_LabStaff();

		Panel1.Visible = true;
		Gridview_LabGroup_Staff2.Visible = true;

		Panel_EditStaff.Visible = false;

	}


	protected void cmdnewstaff_Insert(Object sender, System.EventArgs e)
	{ //Insert the new staff


		//check that they don't already exist

		try
		{
			if (oConn.State == ConnectionState.Closed)
			{
				oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
				oConn.Open();
			}

			SqlCommand oCmdCreateSet = new SqlCommand();
			oCmdCreateSet.Connection = oConn;
			oCmdCreateSet.CommandTimeout = 90;

			oCmdCreateSet.CommandType = CommandType.StoredProcedure;
			oCmdCreateSet.CommandText = "spSEC_Create_New_Staff";

			oCmdCreateSet.Parameters.Add(new SqlParameter("@firstname", SqlDbType.VarChar));
			oCmdCreateSet.Parameters.Add(new SqlParameter("@lastname", SqlDbType.VarChar));
			oCmdCreateSet.Parameters.Add(new SqlParameter("@actdirID", SqlDbType.VarChar));
			oCmdCreateSet.Parameters.Add(new SqlParameter("@stafftypeID", SqlDbType.Int));
			oCmdCreateSet.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar));
			oCmdCreateSet.Parameters.Add(new SqlParameter("@phone_work", SqlDbType.VarChar));
			oCmdCreateSet.Parameters.Add(new SqlParameter("@phone_home", SqlDbType.VarChar));
			oCmdCreateSet.Parameters.Add(new SqlParameter("@phone_other", SqlDbType.VarChar));
			oCmdCreateSet.Parameters.Add(new SqlParameter("@officelocation", SqlDbType.VarChar));
			oCmdCreateSet.Parameters.Add(new SqlParameter("@labID", SqlDbType.VarChar));


			oCmdCreateSet.Parameters["@firstname"].Direction = ParameterDirection.Input;
			oCmdCreateSet.Parameters["@lastname"].Direction = ParameterDirection.Input;
			oCmdCreateSet.Parameters["@actdirID"].Direction = ParameterDirection.Input;
			oCmdCreateSet.Parameters["@stafftypeID"].Direction = ParameterDirection.Input;
			oCmdCreateSet.Parameters["@email"].Direction = ParameterDirection.Input;
			oCmdCreateSet.Parameters["@phone_work"].Direction = ParameterDirection.Input;
			oCmdCreateSet.Parameters["@phone_home"].Direction = ParameterDirection.Input;
			oCmdCreateSet.Parameters["@phone_other"].Direction = ParameterDirection.Input;
			oCmdCreateSet.Parameters["@officelocation"].Direction = ParameterDirection.Input;
			oCmdCreateSet.Parameters["@labID"].Direction = ParameterDirection.Input;

			TextBox firstname = (TextBox)tbl_insertfields.FindControl("firstname");
			TextBox lastname = (TextBox)tbl_insertfields.FindControl("lastname");
			TextBox actdirID = (TextBox)tbl_insertfields.FindControl("actdirID");
			TextBox email = (TextBox)tbl_insertfields.FindControl("email");
			TextBox phone_work = (TextBox)tbl_insertfields.FindControl("phone_work");
			TextBox phone_home = (TextBox)tbl_insertfields.FindControl("phone_home");
			TextBox phone_other = (TextBox)tbl_insertfields.FindControl("phone_other");
			TextBox officelocation = (TextBox)tbl_insertfields.FindControl("officelocation");


			oCmdCreateSet.Parameters["@firstname"].Value = firstname.Text;
			oCmdCreateSet.Parameters["@lastname"].Value = lastname.Text;
			oCmdCreateSet.Parameters["@actdirID"].Value = actdirID.Text;
			oCmdCreateSet.Parameters["@stafftypeID"].Value = int.Parse(DDL_stafftype.SelectedItem.Value);
			oCmdCreateSet.Parameters["@email"].Value = email.Text;
			oCmdCreateSet.Parameters["@phone_work"].Value = phone_work.Text ?? "";
			oCmdCreateSet.Parameters["@phone_home"].Value = phone_home.Text ?? "";
			oCmdCreateSet.Parameters["@phone_other"].Value = phone_other.Text ?? "";
			oCmdCreateSet.Parameters["@officelocation"].Value = officelocation.Text ?? "";
			oCmdCreateSet.Parameters["@labID"].Value = int.Parse(DDL_SelectLabID.SelectedItem.Value);


			tblmyinfo.Rows[0].Cells[0].InnerHtml += "<br/>"+firstname.Text + lastname.Text + actdirID.Text + email.Text +
				int.Parse(DDL_stafftype.SelectedItem.Value).ToString() +
													 phone_work.Text + phone_home.Text  +  phone_other.Text + officelocation.Text;


			oCmdCreateSet.ExecuteNonQuery();


		}


		catch (SqlException oException)
		{
			foreach (SqlError oErr in oException.Errors)
			{
				if (oErr.Message.StartsWith("New staff member created"))
				{
					tblmyinfo.Rows[0].Cells[0].InnerHtml = "<font color=\"green\"><b>" + oErr.Message + "</b></font><br/>";
				}
				else
				{
					tblmyinfo.Rows[0].Cells[0].InnerHtml = "<font color=\"red\"><b>" + oErr.Message + "</b></font><br/>";
				}
			}
		}

		DDL_SelectStaffID.DataBind();
	}


	protected void cmdnewstaff_Cancel(Object sender, System.EventArgs e)
	{ //cancel the add new staff
		Panel_AddNewStaff.Visible = false;
		btnShow_AddNew.Visible = true;
		Panel_CreateNewStaff.Visible = false;

		//BindTheData();
		Load_LabStaff();

		Gridview_LabGroup_Staff2.Visible = true;

		tblmyinfo.Rows[0].Cells[0].InnerHtml = "";
	}

	#endregion

	


	protected void Refresh_Gridview_EditStaff(int staffID)
	{

		LoadUWAC_ADinfo(staffID);

		
		//populate the staff details

		if (oConn.State == ConnectionState.Closed)
		{
			oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
			oConn.Open();
		}


		SQL_utils sql = new SQL_utils("backend");
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("labID", int.Parse(DDL_SelectLabID.SelectedItem.Value).ToString(), "int"));
		ps.Add(sql.CreateParam("staffID", staffID.ToString(), "int"));
		DataTable dtStaffDetails = sql.DataTable_from_ProcName("spSEC_LabGroup_Staff_details_for_EDIT", ps);


		Gridview_EditStaff.DataSource = dtStaffDetails;
		Gridview_EditStaff.DataBind();

		Panel_EditStaff.Visible = true;
		Gridview_EditStaff.Visible = true;



	}





	protected void Gridview_EditStaff_OnDataBound(object sender, GridViewRowEventArgs e)
	{
		
		// For each DataRow in the GridView
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			GridViewRow myrow = e.Row;

			//Label dbrole = (Label)e.Row.FindControl("dbrole");

			string dbrole = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "dbrole"));
			CheckBox chk = (CheckBox)e.Row.FindControl("chk");
			CheckBox chkChange = (CheckBox)e.Row.FindControl("chkChange");
			CheckBox chkRemove = (CheckBox)e.Row.FindControl("chkRemove");

			if (dbrole== "---")
			{
				e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#ff9999");
				chk.Enabled = true;
				chkChange.Enabled = false;
				chkRemove.Enabled = false;
				
			}
			else
			{
				e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#99ff99");
				chk.Enabled = false;
				chkChange.Enabled = true;
				chkRemove.Enabled = true;
			}

			int groupID = Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "groupID"));

			//tblmyinfo.Rows[0].Cells[0].InnerHtml += "  groupID=" + groupID;

		}
	}

	protected void Edit_StaffDetails(Object sender, System.EventArgs e)
	{ //cancel the add new staff

	   //tblmyinfo.Rows[0].Cells[0].InnerHtml += "  Edit_StaffDetails" + "<br/>";

	}



		protected void cmd_Insert(object sender, EventArgs e)
		{
			int labID = int.Parse(DDL_SelectLabID.SelectedItem.Value);
			int dbroleID = int.Parse(DDL_DBrole.SelectedItem.Value);
			int staffID = 0;

			foreach (GridViewRow row in Gridview_EditStaff.Rows)
			{
				Label lblgroupID = (Label)row.FindControl("lblgroupID");
				Label lblstaffID = (Label)row.FindControl("lblstaffID");

				int groupID = int.Parse(lblgroupID.Text);
				staffID = int.Parse(lblstaffID.Text);


				CheckBox chk = (CheckBox)row.FindControl("chk");


				if (chk.Checked)
				{

					//  tblmyinfo.Rows[0].Cells[0].InnerHtml += "INSERT   labID=" +labID.ToString() +
					//          " staffID=" + staffID.ToString() +  "  groupID=" + groupID.ToString() + 
					//          " dbroleID=" + dbroleID.ToString() + "<br/>";

					//Insert staff
					if (oConn.State == ConnectionState.Closed)
					{
						oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
						oConn.Open();
					}

					SqlCommand oCmdInsertStaff = new SqlCommand();
					oCmdInsertStaff.CommandTimeout = 90;

					oCmdInsertStaff.CommandType = CommandType.StoredProcedure;
					oCmdInsertStaff.CommandText = "spSEC_AddStaffToLabGroups_Single";

					//spSEC_AddStaffToLabGroups_Single @labID, @staffID, @DBroleID, @groupID

					oCmdInsertStaff.Parameters.Add(new SqlParameter("@labID", SqlDbType.Int));
					oCmdInsertStaff.Parameters["@labID"].Direction = ParameterDirection.Input;
					oCmdInsertStaff.Parameters.Add(new SqlParameter("@staffID", SqlDbType.Int));
					oCmdInsertStaff.Parameters["@staffID"].Direction = ParameterDirection.Input;
					oCmdInsertStaff.Parameters.Add(new SqlParameter("@DBroleID", SqlDbType.Int));
					oCmdInsertStaff.Parameters["@DBroleID"].Direction = ParameterDirection.Input;
					oCmdInsertStaff.Parameters.Add(new SqlParameter("@groupID", SqlDbType.Int));
					oCmdInsertStaff.Parameters["@groupID"].Direction = ParameterDirection.Input;


					oCmdInsertStaff.Parameters["@labID"].Value = labID;
					oCmdInsertStaff.Parameters["@staffID"].Value = staffID;
					oCmdInsertStaff.Parameters["@DBroleID"].Value = dbroleID;
					oCmdInsertStaff.Parameters["@groupID"].Value = groupID;

					oCmdInsertStaff.Connection = this.oConn;
					oCmdInsertStaff.ExecuteNonQuery();
				}
			}
			
			//Gridview_LabGroup_Staff.DataBind();
			Load_LabStaff();

			Refresh_Gridview_EditStaff(staffID);

		}

		protected void cmd_Change(object sender, EventArgs e)
		{
			//spSEC_DeleteStaffFromLabGroup

			int labID = int.Parse(DDL_SelectLabID.SelectedItem.Value);
			int dbroleID = int.Parse(DDL_DBrole.SelectedItem.Value);
			int staffID = 0;

			foreach (GridViewRow row in Gridview_EditStaff.Rows)
			{
				Label lbllabgroupID = (Label)row.FindControl("lbllabgroupID");
				Label lblstaffID = (Label)row.FindControl("lblstaffID");

				int labgroupID = int.Parse(lbllabgroupID.Text);
				staffID = int.Parse(lblstaffID.Text);

				CheckBox chkChg = (CheckBox)row.FindControl("chkChange");

				if (chkChg.Checked)
				{

				  //  tblmyinfo.Rows[0].Cells[0].InnerHtml += "CHANGE  staffID=" + staffID.ToString() + "  labgroupID=" + labgroupID.ToString() +
				  //        " dbroleID=" + dbroleID.ToString() + "<br/>";

					//Change staff

					if (oConn.State == ConnectionState.Closed)
					{
						oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
					oConn.Open();
					}

					SqlCommand oCmdChangeStaff = new SqlCommand();
					oCmdChangeStaff.CommandTimeout = 90;

					oCmdChangeStaff.CommandType = CommandType.StoredProcedure;
					oCmdChangeStaff.CommandText = "spSEC_Change_LabGroup_Staff_DBrole";

					//	spSEC_DeleteStaffFromLabGroup  @staffID, @labgroupID 

					oCmdChangeStaff.Parameters.Add(new SqlParameter("@staffID", SqlDbType.Int));
					oCmdChangeStaff.Parameters["@staffID"].Direction = ParameterDirection.Input;
					oCmdChangeStaff.Parameters.Add(new SqlParameter("@labgroupID", SqlDbType.Int));
					oCmdChangeStaff.Parameters["@labgroupID"].Direction = ParameterDirection.Input;
					oCmdChangeStaff.Parameters.Add(new SqlParameter("@DBroleID", SqlDbType.Int));
					oCmdChangeStaff.Parameters["@DBroleID"].Direction = ParameterDirection.Input;

					oCmdChangeStaff.Parameters["@staffID"].Value = staffID;
					oCmdChangeStaff.Parameters["@labgroupID"].Value = labgroupID;
					oCmdChangeStaff.Parameters["@DBroleID"].Value = dbroleID;

					oCmdChangeStaff.Connection = this.oConn;
					oCmdChangeStaff.ExecuteNonQuery();

				}

			}

			//Gridview_LabGroup_Staff.DataBind();
			Load_LabStaff();

			Refresh_Gridview_EditStaff(staffID);


		}


		protected void cmd_Delete(object sender, EventArgs e)
		{
			  //spSEC_DeleteStaffFromLabGroup

			int labID = int.Parse(DDL_SelectLabID.SelectedItem.Value);
			int staffID = 0;

			foreach (GridViewRow row in Gridview_EditStaff.Rows)
			{
				Label lbllabgroupID = (Label)row.FindControl("lbllabgroupID");
				Label lblstaffID = (Label)row.FindControl("lblstaffID");

				int labgroupID = int.Parse(lbllabgroupID.Text);
				staffID = int.Parse(lblstaffID.Text);

				CheckBox chkRem = (CheckBox)row.FindControl("chkRemove");

				if (chkRem.Checked)
				{

				   // tblmyinfo.Rows[0].Cells[0].InnerHtml += "DELETE  staffID=" + staffID.ToString() + "  labgroupID=" + labgroupID.ToString()+ "<br/>";

					//Delete staff

					if (oConn.State == ConnectionState.Closed)
					{
						oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
						oConn.Open();
					}

					SqlCommand oCmdDeleteStaff = new SqlCommand();
					oCmdDeleteStaff.CommandTimeout = 90;

					oCmdDeleteStaff.CommandType = CommandType.StoredProcedure;
					oCmdDeleteStaff.CommandText = "spSEC_DeleteStaffFromLabGroup";

					//	spSEC_DeleteStaffFromLabGroup  @staffID, @labgroupID 

					oCmdDeleteStaff.Parameters.Add(new SqlParameter("@staffID", SqlDbType.Int));
					oCmdDeleteStaff.Parameters["@staffID"].Direction = ParameterDirection.Input;
					oCmdDeleteStaff.Parameters.Add(new SqlParameter("@labgroupID", SqlDbType.Int));
					oCmdDeleteStaff.Parameters["@labgroupID"].Direction = ParameterDirection.Input;

					oCmdDeleteStaff.Parameters["@staffID"].Value = staffID;
					oCmdDeleteStaff.Parameters["@labgroupID"].Value = labgroupID;

					oCmdDeleteStaff.Connection = this.oConn;
					oCmdDeleteStaff.ExecuteNonQuery();
				}

			}
			//Gridview_LabGroup_Staff.DataBind();
			Load_LabStaff();

			Refresh_Gridview_EditStaff(staffID);

		}




		protected void cmd_Cancel_StaffEdits(object sender, EventArgs e)
		{
			Panel_EditStaff.Visible = false;
			Panel_MultLabs.Visible = true;



			//BindTheData();
			Load_LabStaff();
			
			Panel1.Visible = true;
		}


	#region  Individual CheckBox Changes 
	protected void chng_AddStaff(object sender, EventArgs e)
	{

			CheckBox chk = (CheckBox)(sender);
			GridViewRow row = (GridViewRow)chk.Parent.Parent;

			CheckBox chkChg = (CheckBox)row.FindControl("chkChange");
			CheckBox chkRem = (CheckBox)row.FindControl("chkRemove");


			if (chk.Checked) //Checked
			{
				//uncheck the others
				chkRem.Checked = false;
				chkChg.Checked = false;

				if (row.Cells[4].Text == "---") //checked and no dbrole so make green
				{
					row.BackColor = System.Drawing.Color.Green;
				}
				else
				{
					row.BackColor = System.Drawing.ColorTranslator.FromHtml("#ff9999");
				}
			}
			else  //not checked
			{
				if (row.Cells[4].Text == "---") //not checked and no dbrole so return to red
				{
					row.BackColor = System.Drawing.ColorTranslator.FromHtml("#ff9999");
				}
				else
				{
					row.BackColor = System.Drawing.Color.Purple;
				}
			}
	  
	}



	protected void chng_ChangeStaff(object sender, EventArgs e)
	{

		//            <asp:HiddenField runat="server" ID="hndRowBackColor" Value="" />  

		CheckBox chk = (CheckBox)(sender);
		GridViewRow row = (GridViewRow)chk.Parent.Parent;

		CheckBox chkAdd = (CheckBox)row.FindControl("chk");
		CheckBox chkRem = (CheckBox)row.FindControl("chkRemove");


		if (chk.Checked) //Checked
		{
			//uncheck the others
			chkRem.Checked = false;
			chkAdd.Checked = false;
			if (row.Cells[4].Text == "---") //checked and make blue
			{
				row.BackColor = System.Drawing.Color.Green;
			}
			else
			{
				row.BackColor = System.Drawing.ColorTranslator.FromHtml("#9999ff"); // Translator.FromHtml("#ff9999");
			}
		}
		else  //not checked
		{
			if (row.Cells[4].Text == "---") //not checked and no dbrole so return to green
			{
				row.BackColor = System.Drawing.ColorTranslator.FromHtml("#ff9999");   //return to red
			}
			else
			{   //return to green
				row.BackColor = System.Drawing.ColorTranslator.FromHtml("#99ff99");    //return to green
			}
		}

	}


	protected void chng_RemoveStaff(object sender, EventArgs e)
	{

		//            <asp:HiddenField runat="server" ID="hndRowBackColor" Value="" />  

		CheckBox chk = (CheckBox)(sender);
		GridViewRow row = (GridViewRow)chk.Parent.Parent;

		CheckBox chkChg = (CheckBox)row.FindControl("chkChange");
		CheckBox chkAdd = (CheckBox)row.FindControl("chk");


		if (chk.Checked) //Checked
		{
			//uncheck the others
			chkChg.Checked = false;
			chkAdd.Checked = false;
			if (row.Cells[4].Text == "---") //checked and no dbrole so make green
			{
				row.BackColor = System.Drawing.Color.Green;
			}
			else
			{
				row.BackColor = System.Drawing.Color.Red; // Translator.FromHtml("#ff9999");
			}
		}
		else  //not checked
		{
			if (row.Cells[4].Text == "---") //not checked and no dbrole so return to green
			{
				row.BackColor = System.Drawing.ColorTranslator.FromHtml("#ff9999");
			}
			else
			{
				row.BackColor = System.Drawing.ColorTranslator.FromHtml("#99ff99");
			}
		}

	}

	#endregion


	protected void chkAll_checkchanged(object sender, EventArgs e)
	{
		CheckBox chk;

		foreach (GridViewRow rowItem in Gridview_EditStaff.Rows)
		{
			string dbrole = rowItem.Cells[4].Text;

			chk = (CheckBox)(rowItem.Cells[0].FindControl("chk"));
			if (chk.Enabled)
			{
				if (!chk.Checked)  //Not checked:  check and turn green
				{
					//rowItem.BackColor = System.Drawing.ColorTranslator.FromHtml("#99ff99");
					rowItem.BackColor = System.Drawing.Color.Green; // Translator.FromHtml("#99ff99");

					chk.Checked = ((CheckBox)sender).Checked;
				   // tblmyinfo.Rows[0].Cells[0].InnerHtml += "--First--";
				}
				else  //Checked
				{
					if (dbrole == "---")  //return to red when unchecked
					{
						rowItem.BackColor = System.Drawing.ColorTranslator.FromHtml("#ff9999");
						chk.Checked = false;
					 //   tblmyinfo.Rows[0].Cells[0].InnerHtml += "--TOP--";
					}
					else  //return to green when unchecked
					{
						rowItem.BackColor = System.Drawing.ColorTranslator.FromHtml("#99ff99");
						chk.Checked = false;
					  //  tblmyinfo.Rows[0].Cells[0].InnerHtml += "--BOTTOM--";
					}
				}
			}
		}
	}

	
	protected void chkAll_Change_checkchanged(object sender, EventArgs e)
	{
		CheckBox chk;

		foreach (GridViewRow rowItem in Gridview_EditStaff.Rows)
		{
			string dbrole = rowItem.Cells[4].Text;

			chk = (CheckBox)(rowItem.Cells[0].FindControl("chkChange"));
			if (chk.Enabled)
			{
				if (!chk.Checked)  //Not checked:  check and turn blue
				{
					rowItem.BackColor = System.Drawing.ColorTranslator.FromHtml("#9999ff"); // Translator.FromHtml("#ff9999");
					chk.Checked = ((CheckBox)sender).Checked;
				//    tblmyinfo.Rows[0].Cells[0].InnerHtml += "--First--";
				}
				else  //Checked
				{
					if (dbrole == "---")  //return to green when unchecked
					{
						rowItem.BackColor = System.Drawing.ColorTranslator.FromHtml("#99ff99");
						chk.Checked = false;
				   //     tblmyinfo.Rows[0].Cells[0].InnerHtml += "--TOP--";
					}
					else  //return to green when unchecked
					{
						rowItem.BackColor = System.Drawing.ColorTranslator.FromHtml("#99ff99");
						chk.Checked = false;
					//    tblmyinfo.Rows[0].Cells[0].InnerHtml += "--BOTTOM--";
					}
				}
			}
		}
	}


	protected void chkAll_Remove_checkchanged(object sender, EventArgs e)
	{
		CheckBox chk;

		foreach (GridViewRow rowItem in Gridview_EditStaff.Rows)
		{
			string dbrole = rowItem.Cells[4].Text;

			chk = (CheckBox)(rowItem.Cells[0].FindControl("chkRemove"));
			if (chk.Enabled)
			{
				if (!chk.Checked)  //Not checked:  check and turn red
				{
					rowItem.BackColor = System.Drawing.Color.Red; // Translator.FromHtml("#ff9999");
					chk.Checked = ((CheckBox)sender).Checked;
				//    tblmyinfo.Rows[0].Cells[0].InnerHtml += "--First--";
				}
				else  //Checked
				{
					if (dbrole == "---")  //return to red when unchecked
					{
						rowItem.BackColor = System.Drawing.ColorTranslator.FromHtml("#ff9999");
						chk.Checked = false;
				   //     tblmyinfo.Rows[0].Cells[0].InnerHtml += "--TOP--";
					}
					else  //return to green when unchecked
					{
						rowItem.BackColor = System.Drawing.ColorTranslator.FromHtml("#99ff99");
						chk.Checked = false;
					//    tblmyinfo.Rows[0].Cells[0].InnerHtml += "--BOTTOM--";
					}
				}
			}
		}
	}


	protected void cmdEditStaff(object sender, EventArgs e)
	{
		this.Panel_EditStaff.Visible = true;

	}

	protected void DDL_SelectLabID_SelectedIndexChanged(object sender, EventArgs e)
	{
		 int labID = Convert.ToInt16(DDL_SelectLabID.SelectedValue);

		 if (labID > 0)
		 {
			 btnShow_AddNew.Visible = true;


			 //BindTheData();
			 Load_LabStaff();

			 if(Request.ServerVariables["AUTH_USER"]=="AUTISM\\jeffmun")  //Only Jeff for now!
			 {
				 btnShow_AddLabGroups.Visible = true;
				 Populate_Eligible_Groups();
			 }

		 }
	}



	protected void DDL_GroupID_SelectedIndexChanged(object sender, EventArgs e)
	{
		 int groupID = Convert.ToInt16(DDL_GroupID.SelectedValue);

		 if (groupID > 0)
		 {
			 btn_AddGroupToLab.Visible = true;
			 //BindTheData();

			 Load_LabStaff();
		 }
	}


	
	


 
	protected void DDL_StudyActive_SelectedIndexChanged(object sender, EventArgs e)
	{
		//BindTheData();

		Load_LabStaff();
	}


	protected void DDL_SelectStaffID_SelectedIndexChanged(object sender, EventArgs e)
	{
		int staffID = Convert.ToInt16(DDL_SelectStaffID.SelectedValue);

		if(staffID>0)
		{
			this.Gridview_EditStaff.DataBind();
			Button1.Visible = true;
			Button3.Visible = true;

		}
		
	}



	protected int GetStaffID_from_ActDirID(string myactdirID)
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-------> GetStaffID_from_ActDirID <br/>";

		SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("select staffID from tblstaff where actdirID = '" + myactdirID + "'", oConn);
		DataTable dt = new DataTable();
		SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
		sqlAdapter.Fill(dt);

		int _newstaffID = 0;
		foreach (DataRow row in dt.Rows)
		{
			_newstaffID  = Convert.ToInt16(row["staffID"]);
		}

		return _newstaffID;
	}


	#region Utilities
	private void LogToPage(string text)
	{

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += text + "<br/>";
	}

	private void LogToPageUrgent(string text)
	{

		tblmyinfo.Rows[0].Cells[0].InnerHtml += text + "<br/>";
	}
	#endregion


	//protected void btnNew_Click(object sender, EventArgs e) {
	//    //int labID = int.Parse(DDL_SelectLabID.SelectedValue.ToString()); int
	//    //studyactive = int.Parse(DDL_StudyActive.SelectedValue.ToString());

	//    //if (labID > 0)
	//    //{
	//    //    SQL_utils sql = new SQL_utils("backend");


	//    //    List<SqlParameter> p = new List<SqlParameter>();

	//    //    p.Add(sql.CreateParam("labID", labID.ToString(), "int"));
	//    //    p.Add(sql.CreateParam("studyactive", studyactive.ToString(), "int"));
	//    //    p.Add(sql.CreateParam("single_staffID", "0", "int"));

	//    //    DataTable dt = sql.DataTable_from_ProcName("spSEC_Lab_and_AllStaffInLab_by_Studies", p);

	//    //    string[] keepCols = new string[] { "staffID", "StaffName", "TimeSinceLastLogon", "LabName", "N_Labs" };


	//DataTable dt_pivot = utilsPivot.Pivot(dt, keepCols, "StudyName","color_allowed_groups", "StaffName", "StudyName DESC");

	//    //    gvNew.DataSource = dt_pivot;
	//    //    gvNew.DataBind();

	//    //    sql.Close();
	//    //}


	//}
}