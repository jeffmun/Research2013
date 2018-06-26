using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Web.Services;
using uwac;
using Obout.Grid;
using Obout.ListBox;
using Obout.Interface;
using SelectPdf;
using iTextSharp.text;
using iTextSharp.text.xml;
using iTextSharp.text.pdf;
using iTextSharp.text.factories;



/*
 * to do
 * 
 * take stuff from descstats.aspx 
 *   - select groups
 *   - select measures
 *     but include measures from all full studies
 *     
 * save these selected things to the "dp" tables
 * 
 * DATA PROJECTS
 * -------------
 * dp.vwDataProject
 * dp.StudyApprover - populates the Supervisor DDL
 * 
 *      for VIEWING:
 *      -------------
 *      dp.vwDataProject_Group_Ns 
 *      dp.spDataProject_Meas
 *      dp.vwDatafile 
 *      
 * 
 *      for EDITING the project:
 *      -------------------------
 *      dp.spGroups_with_totals  
 *      dp.spLoadMeasures
 *      
 *      dp.spVars_by_Measure     -- for the variables
 *      
 * 
 *      for SAVING:
 *      ------------
 *      dp.spDataProject_UPDATE
 *      
 *      dp.spVars_by_Measure_INSERT_SELECTED
 *      
 *      spdatFlds_DEFAULTS_UPDATE  <- TO FIX
 *      
 * 
 * 
 *      for CREATING the data file:
 *      ----------------------------
 *      dp.spDataProject_MetaData
 * 
 *      //measures
 *                  string fldlist = utilStats.GetDataFlds_byDataProject(int.Parse(Request.QueryString["pk"]), row["tblname"].ToString(), int.Parse(row["measureID"].ToString()));

					DataTable delinks = sql.DataTable_from_SQLstring("select a.name as pkfield, coalesce(deformname,'') deformname " +
						"from datField a " +
						"join datTable b ON a.TableID = b.tableID " +
						"join datTable_measure c ON b.TableID = c.tableID   " +
						"left join uwautism_research_backend..tblMeasure d ON c.measureID = d.measureID " +
						"where fieldcodeID=10 and c.measureID=" + row["measureID"].ToString());
 * 
 * 					string sel_subj = GetProject_Subjects();
 * 					        select groupID, subjstatusID from dp.Grp where dataproj_pk = x

					string sSQL = "select " + linkcode + " a.ID, groupname as [Group], subjstatus, txgrp, timepoint as timepointnum, timepoint_text as TimePoint " + fldlist +
						" from uwautism_research_data.." + row["tblname"].ToString() + " a " +
						" join  (select ID, groupname, txgrp, subjstatus from uwautism_research_backend..vwMasterStatus_S_txgrp where ( " + sel_subj + ")) b ON a.ID = b.ID " +
						" join  (select studymeasID, timepointID from uwautism_research_backend..tblStudyMeas) c ON a.studymeasID = c.studymeasID " +
						" join  uwautism_research_backend..tblTimePoint d ON c.timepointID = d.timepointID " +
						" where verified in (0,1) and a.studymeasID in (" + row["studymeas_csv"].ToString() + ") " +
						" order by timepoint_text, [ID]";
 * 
 * 
 * 
 * */

public partial class stats_DataProject : System.Web.UI.Page
{
	//DataTable dt_studymeas = new DataTable();

	#region STRUCTS
	protected struct subjectSubset
	{
		public string groupID;
		public string subjstatusID;
	}

	protected struct measureSubset
	{
		public string tblname;
		public string studymeas_csv;
	}

	struct GridInfo
	{
		Grid grid;
		string gridTitle;
		float totalwidth;
		float[] widths;

		public GridInfo(Grid grid, string gridTitle, float totalwidth, float[] widths)
		{
			this.grid = grid;
			this.gridTitle = gridTitle;
			if (totalwidth == 0) { this.totalwidth = 90; } else this.totalwidth = totalwidth;
			if (widths == null) { this.widths = new float[] { 0 }; } else this.widths = widths;
		}


	}

	struct GridViewInfo
	{
		public GridView grid;
		public string gridTitle;
		public float totalwidth;
		public float[] widths;

		public GridViewInfo(GridView grid, string gridTitle, float totalwidth)
		{
			this.grid = grid;
			this.gridTitle = gridTitle;
			if (totalwidth == 0) { this.totalwidth = 90; } else this.totalwidth = totalwidth;

			//Yes there are columns
			if (grid.Columns.Count > 0)
			{
				float[] w = new float[grid.Columns.Count];
				float tot = 0;
				for (int c = 0; c < grid.Columns.Count; c++)
				{
					w[c] = float.Parse(grid.Columns[c].ItemStyle.Width.Value.ToString());
					tot += w[c];
				}

				this.widths = w;
			}
			else  //No there are no columns - make columns equal
			{
				float[] w = new float[grid.Rows[0].Cells.Count];

				for (int c = 0; c < grid.Rows[0].Cells.Count; c++)
				{
					w[c] = 100 / grid.Columns.Count;
				}
				this.widths = w;
				this.totalwidth = 90;  //default width of 90% if the columns widths are unavailable
			}


		}



		public GridViewInfo(GridView grid, string gridTitle, float totalwidth, float[] widths)
		{
			this.grid = grid;
			this.gridTitle = gridTitle;
			if (totalwidth == 0) { this.totalwidth = 90; } else this.totalwidth = totalwidth;
			if (widths == null) { this.widths = new float[] { 0 }; } else this.widths = widths;
		}


	}
	#endregion //STRUCTS


	#region PAGE SETUP
	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("~/stats/DataProject.aspx");
	}

	//public override void VerifyRenderingInServerForm(Control control)
	//{
	//    /* Verifies that the control is rendered */
	//}



	protected void Page_Load(object sender, EventArgs e)
	{
		int dataproj_pk;

		if (IsPostBack)
		{
			//Load the ViewState - this populates the GridViews with the checkboxes
			if (ViewState["dt_group_by_subjstatus"] != null)
			{
				gvSubjects.DataSource = (DataTable)ViewState["dt_group_by_subjstatus"];
				gvSubjects.DataBind();
			}


			if (ViewState["dt_meas_by_timepoint"] != null)
			{
				gvMeasures.DataSource = (DataTable)ViewState["dt_meas_by_timepoint"];
				gvMeasures.DataBind();
			}

		}

		if (!IsPostBack)
		{

			//Check 


			if (gridProjects.SelectedRecords != null)
			{
				int pk = 0;
				foreach (Hashtable oRecord in gridProjects.SelectedRecords)
				{
					foreach (DictionaryEntry d in oRecord)
					{
						if (d.Key.ToString() == "dataproj_pk")
						{
							pk = Convert.ToInt16(d.Value);
						}
					}
				}

				LoadProjects(pk);

				panel_DetailControls.Visible = false;

			}


			else if (Request.QueryString["pk"] != null)
			{

				Session["studyIDfull"] = Master.Master_studyIDfull.ToString();

				dataproj_pk = Convert.ToInt16(Request.QueryString["pk"].ToString());
				LoadProjects(dataproj_pk);

				panel_DetailControls.Visible = true;


				//REMOVED for NOW: TO FIX
				//was uwac.Login
				//AutismCenterBase.Security.Login oLogin = Master.AutismLogin;

				//if (Master.AutismLogin.LoginID.ToString() == "jeffmun")
				//{ 
				//	btnDeleteProject.Enabled = true;
				//	btnDeleteProject.Visible = true;

				//	btnPDF.Visible = true;

				//}


			}
			else
			{
				LoadProjects(0);
				panel_DetailControls.Visible = false;

			}

		}

	}
	#endregion



	#region LOAD data for VIEWING
	protected void LoadProjects(int dataproj_pk)
	{
		SQL_utils sql = new SQL_utils();
		DataTable dt = new DataTable();
		if (dataproj_pk == 0)
		{
			dt = sql.DataTable_from_SQLstring("select * from dp.vwDataProject where studyID = " + Master.Master_studyID.ToString());

			if (dt.Rows.Count > 0)
			{

				gridProjects.DataSource = dt;
				gridProjects.DataBind();
				gridProjects.Visible = true;
				panelDetails.Visible = false;

				lblNoProjects.Visible = false;

			}
			else
			{
				lblNoProjects.Visible = true;

			}

		}
		else if (dataproj_pk > 0)
		{
			dt = sql.DataTable_from_SQLstring("select * from dp.vwDataProject where dataproj_pk = " + dataproj_pk.ToString());

			editor.Content = dt.Rows[0].Field<string>("projSummary");

			lblTitle.Text = dt.Rows[0].Field<string>("projTitle");
			litSummary.Text = dt.Rows[0].Field<string>("projSummary");

			lblAuthor.Text = dt.Rows[0].Field<string>("Author");
			lblAuthor_email.Text =  dt.Rows[0].Field<string>("Author_email") ;
			lblSupervisor.Text = dt.Rows[0].Field<string>("Supervisor");
			
			string supervisor_email = dt.Rows[0].Field<string>("Supervisor_email");
			if (supervisor_email == null) supervisor_email = "";
			lblSupervisor_email.Text = supervisor_email;


			//Get the data
			Load_for_View(dataproj_pk, sql);

			int supervisor_staffID;

			if (dt.Rows[0].Field<int?>("supervisor_staffID") != null)
			{
				supervisor_staffID = dt.Rows[0].Field<int>("supervisor_staffID");
			}
			else
			{
				supervisor_staffID = 0;
			}


			if (supervisor_email.Contains("@"))
			{
				btnSubmit.Visible = true;
			}
			else
			{
				btnSubmit.Visible = false;
			}



			LoadSupervisorsDDL(Master.Master_studyID, supervisor_staffID);

			panelDetails.Visible = true;
			gridProjects.Visible = false;

			panelVIEWproj.Visible = true;
			panelEDITproj.Visible = false;

			lblNoProjects.Visible = false;

			#region Process Approval Status

			int? currentuser_staffID = sql.IntScalar_from_SQLstring("select dbo.fnGetStaffIDByCurrentuser() ");


			//NOT APPROVED
			if (dt.Rows[0].Field<string>("approvedBy") == null)
			{
				lblApproved.Text = "NOT YET APPROVED";
				btnDownloadData.Visible = false;
			}

			else  //APROVED
			{
				lblApproved.Text = "APPROVED on " + dt.Rows[0].Field<DateTime>("approved").ToShortDateString() + " by " + dt.Rows[0].Field<string>("approvedBy");

				btnDownloadData.Visible = true;
			}


			if(currentuser_staffID == dt.Rows[0].Field<int>("supervisor_staffID") | currentuser_staffID==8)
			{
				if (dt.Rows[0].Field<string>("approvedBy") == null)
				{
					btnApprove.Visible = true;
				}
			}

			#endregion 



		}




		//Load the ViewState - this populates the GridViews with the checkboxes
		if (ViewState["dt_group_by_subjstatus"] != null)
		{
			gvSubjects.DataSource = (DataTable)ViewState["dt_group_by_subjstatus"];
			gvSubjects.DataBind();
		}

		if (!IsPostBack)
		{
			//LoadRadioButtonLists();
			LoadSubjects_for_Edit(Master.Master_studyID);
			LoadMeasures_for_Edit(Master.Master_studyID);

		}


		sql.Close();
	}


	protected void gridProject_Rebind(object sender, EventArgs e)
	{
		LoadProjects(0);
	}


	protected void gridProject_RowCreated(object sender, Obout.Grid.GridRowEventArgs e)
	{
		if (e.Row.RowType == GridRowType.Header)
		{
			Grid currentGrid = (Grid)sender;

			foreach (Column column in currentGrid.Columns)
			{
				if (!column.AllowSorting)
				{
					e.Row.Cells[column.Index].CssClass += " no-sort";
				}
			}
		}

	}


	protected void LoadSupervisorsDDL(int studyID, int supervisorID)
{
	SQL_utils sql = new SQL_utils();
	DataTable dt = sql.DataTable_from_SQLstring("select 0 staffID, 'Select supervisor...' staffname union select a.staffID, firstname + ' ' + lastname as staffname from uwautism_research_backend..tblStaff a " + 
		" join dp.StudyApprover b ON a.staffID = b.staffID " + 
		" where studyID =  " + studyID.ToString() + 
		" union select 8, 'Jeff M (Default)'");
	ddlSupervisor.DataSource = dt;
	ddlSupervisor.DataTextField = "staffname";
	ddlSupervisor.DataValueField = "staffID";
	ddlSupervisor.DataBind();
	sql.Close();

	ddlSupervisor.SelectedValue = supervisorID.ToString();
}


	protected void Load_for_View(int dataproj_pk, SQL_utils sql)
	{
		Load_for_View_Subjects(dataproj_pk, sql);
		Load_for_View_Measures(dataproj_pk, sql);
		Load_for_View_Datafiles(dataproj_pk, sql);
		
	}

	protected void Load_for_View_Subjects(int dataproj_pk, SQL_utils sql)
	{
		DataTable dt = sql.DataTable_from_SQLstring("select [Group], N from dp.vwDataProject_Group_Ns where dataproj_pk = " + dataproj_pk.ToString());
		gvViewSubjects.DataSource = dt;
		gvViewSubjects.DataBind();
	}

	protected void Load_for_View_Measures(int dataproj_pk, SQL_utils sql)
	{
		DataTable dt2 = sql.DataTable_from_SQLstring("exec dp.spDataProject_Meas " + dataproj_pk.ToString());
		gvViewMeas.DataSource = dt2;
		gvViewMeas.DataBind();

	}

	protected void Load_for_View_Datafiles(int dataproj_pk, SQL_utils sql)
	{

		DataTable dt3 = sql.DataTable_from_SQLstring("select filename, N_subjects, N_measures, N_studymeas, N_datarows, N_datacols, created, TimeSinceCreated, createdBy " +
				" from dp.vwDatafile where dataproj_pk = " + dataproj_pk.ToString() + " and isDeleted=0 order by created");
		gvViewDatafiles.DataSource = dt3;
		gvViewDatafiles.DataBind();

	}

	
	#endregion  //LOAD data for VIEWING


	#region  ================= MAKE CHANGES TO DATA =================

	#region INSERT/DELETE Project
	protected void gridProject_InsertCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		
	int studyID = Master.Master_studyID;
		
	SQL_utils sql = new SQL_utils();
	sql.NonQuery_from_SQLstring("insert into dp.DataProject(studyID, projTitle, projSummary, isDeleted,created,createdBy)" +
		" values(" + studyID.ToString() + ",'" + e.Record["projTitle"].ToString() + "','** to edit **', 0,getdate(), system_user)");


	int newdataproj_pk = sql.IntScalar_from_SQLstring("select max(dataproj_pk) from dp.DataProject");

	List<SqlParameter> p = new List<SqlParameter>();
	p.Add(sql.CreateParam("studyID", studyID.ToString(), "int"));
	p.Add(sql.CreateParam("dataproj_pk", newdataproj_pk.ToString(), "int"));

	//sql.NonQuery_from_ProcName("dp.spAddApprovers", p);

	sql.Close();

	}


	//Note that deleting is for now just setting the IsDeleted field to 1 to
	//serve as a flag so the deleted project is not displayed.

	protected void btnDeleteProject_Click(object sender, EventArgs e)
	{
	SQL_utils sql = new SQL_utils();
	string dataproj_pk = Request.QueryString["pk"];
	sql.NonQuery_from_SQLstring("exec dp.spDataProject_DELETE " + dataproj_pk);
	sql.Close();

	Response.Redirect("~/stats/DataProject.aspx");
	}

	#endregion    //INSERT/DELETE Project


	#region SAVE Project  /  dp.spDataProject_UPDATE
	protected void btnProjSAVE_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils();

		List<SqlParameter> p = new List<SqlParameter>();
		p.Add(sql.CreateParam("dataproj_pk", Request.QueryString["pk"], "int"));
		p.Add(sql.CreateParam("projSummary", editor.Content, "text"));
		p.Add(sql.CreateParam("projTitle", txtTitle.Text, "text"));
		p.Add(sql.CreateParam("supervisor_staffID", ddlSupervisor.SelectedValue, "int"));


		DataTable dt_sel_subj = DataTable_GetSelectedSubjects(gvSubjects, "");
		DataTable dt_sel_meas = DataTable_GetSelectedMeasures(gvMeasures);

		DataTable dt_sel_intx = DataTable_GetSelectedIntHx(gvIntHx);



		p.Add(sql.CreateParam("sel_subj", dt_sel_subj));
		p.Add(sql.CreateParam("sel_meas", dt_sel_meas));

		p.Add(sql.CreateParam("sel_inthx", dt_sel_intx));

		sql.NonQuery_from_ProcName("dp.spDataProject_UPDATE", p);
		sql.Close();

		Response.Redirect("~/stats/DataProject.aspx?pk=" + Request.QueryString["pk"]);

		//panelEDITproj.Visible = false;
		//panelVIEWproj.Visible = true;

	}


	protected DataTable DataTable_GetSelectedSubjects(GridView gv, string test)
	{
		DataTable dt = new DataTable();
		dt.Columns.Add("dataproj_pk", typeof(int));
		dt.Columns.Add("groupID", typeof(int));
		dt.Columns.Add("subjstatusID", typeof(int));


		//Loop though each row of the grid and collect the checked ones into a SQL where clause for group and subjstatus
		for (int r = 0; r < gv.Rows.Count; r++)
		{
			//start in column 2
			for (int c = 1; c < gv.Rows[r].Cells.Count; c++)
			{
				int rowval = 0;
				int colval = 0;
				int numchecked = 0;
				DataControlFieldCell cell = (DataControlFieldCell)gv.Rows[r].Cells[c];
				foreach (Control ctl in cell.Controls)
				{
					if (ctl.GetType() == typeof(HiddenField))
					{
						HiddenField hid = (HiddenField)ctl;
						if (ctl.ID.StartsWith("hidrow")) rowval = int.Parse(hid.Value.ToString());
						if (ctl.ID.StartsWith("hidcol")) colval = int.Parse(hid.Value.ToString());
					}
					else if (ctl.GetType() == typeof(CheckBox))
					{
						CheckBox chk = (CheckBox)ctl;
						if (chk.Checked)
						{
							numchecked++;
							//string prefix = (s == "") ? "" : "$";
							//s += prefix + ctl.ID.ToString().Replace("chk", "");
						}
					}
				}
				if (numchecked > 0)
				{
					//if(((HiddenField)cell.FindControl("hidRowValue")))

					DataRow row = dt.NewRow();
					row["dataproj_pk"] = int.Parse(Request.QueryString["pk"]);
					row["groupID"] = rowval;
					row["subjstatusID"] = colval;
					//row[]
					dt.Rows.Add(row);
				}
			}
		}

		return dt;
	}



	protected DataTable DataTable_GetSelectedMeasures(GridView gv)
	{
		DataTable dt = new DataTable();
		dt.Columns.Add("dataproj_pk", typeof(int));
		dt.Columns.Add("studymeasID", typeof(int));

		//Loop though each row of the grid and collect the checked ones into a DataTable
		for (int r = 0; r < gv.Rows.Count; r++)
		{
			for (int c = 1; c < gv.Rows[r].Cells.Count; c++)
			{
				DataControlFieldCell cell = (DataControlFieldCell)gv.Rows[r].Cells[c];
				foreach (Control ctl in cell.Controls)
				{
					if (ctl.GetType() == typeof(CheckBox))
					{
						CheckBox chk = (CheckBox)ctl;
						if (chk.Checked)
						{
							string studymeasID = ctl.ID.ToString().Replace("chk", "");

							DataRow row = dt.NewRow();
							row["dataproj_pk"] = int.Parse(Request.QueryString["pk"]);
							row["studymeasID"] = int.Parse(studymeasID);
							dt.Rows.Add(row);
						}
					}
				}
			}
		}

		return dt;
	}

	protected DataTable DataTable_GetSelectedIntHx(GridView gv)
	{
		DataTable dt = new DataTable();
		dt.Columns.Add("dataproj_pk", typeof(int));
		dt.Columns.Add("studymeasID", typeof(int));

		//Loop though each row of the grid and collect the checked ones into a DataTable
		for (int r = 0; r < gv.Rows.Count; r++)
		{
			for (int c = 1; c < gv.Rows[r].Cells.Count; c++)
			{
				DataControlFieldCell cell = (DataControlFieldCell)gv.Rows[r].Cells[c];
				foreach (Control ctl in cell.Controls)
				{
					if (ctl.GetType() == typeof(CheckBox))
					{
						CheckBox chk = (CheckBox)ctl;
						if (chk.Checked)
						{
							HiddenField hid = (HiddenField)cell.FindControl("hidMeasureID");
							Label lbl = (Label)cell.FindControl("lblMeasureID");

							string studymeasID = hid.Value;//ctl.ID.ToString().Replace("chk", "");

							DataRow row = dt.NewRow();
							row["dataproj_pk"] = int.Parse(Request.QueryString["pk"]);
							row["studymeasID"] = int.Parse(lbl.Text);
							dt.Rows.Add(row);
						}
					}
				}
			}
		}

		return dt;
	}


	#endregion  //SAVE Project  /  dp.spDataProject_UPDATE


	#endregion //MAKE CHANGES TO DATA





	#region LOAD SUBJECTS for EDIT
	protected void LoadSubjects_for_Edit(int studyID)
	{
		SQL_utils sql = new SQL_utils();
		lblStudyName.Text = Master.Master_studyname;

		string s;

		int pk = 0;
		if (Request.QueryString["pk"] != null) pk = int.Parse(Request.QueryString["pk"]);

		s = "exec dp.spGroups_with_totals2 '" + studyID.ToString() + "', " + pk.ToString() ;

		DataTable dt = sql.DataTable_from_SQLstring(s);

		#region //Group by Group & Subjstatus
		var query = from r in dt.AsEnumerable()
					let i = new
					{
						Group = r.Field<string>("Group"),
						groupID = r.Field<int>("groupID"),
						ColumnName = r.Field<string>("subjstatus"),
						ColumnValue = r.Field<string>("groupID_and_subjstatusID")
					}
					group i by new { i.Group, i.groupID } into g
					select g;


		DataTable dt_group_by_subjstatus = new DataTable();
		dt_group_by_subjstatus.Columns.Add("Group", typeof(string));
		dt_group_by_subjstatus.Columns.Add("groupID", typeof(int));

		foreach (var item in query)
		{
			var newRow = dt_group_by_subjstatus.NewRow();

			// static columns
			newRow["Group"] = item.Key.Group;
			newRow["groupID"] = item.Key.groupID;

			// dynamic columns
			foreach (var c in item)
			{
				if (!dt_group_by_subjstatus.Columns.Contains(c.ColumnName))
				{
					dt_group_by_subjstatus.Columns.Add(new DataColumn(c.ColumnName, typeof(String)));
				}

				newRow[c.ColumnName] += c.ColumnValue.ToString() + "$";
			}

			dt_group_by_subjstatus.Rows.Add(newRow);
		}
		#endregion


		gvSubjects.DataSource = dt_group_by_subjstatus;
		gvSubjects.DataBind();

		ViewState["dt_group_by_subjstatus"] = dt_group_by_subjstatus;

		sql.Close();
	}



	protected void gvSubjects_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		int starting_col = 2;
		int numhiddencols = 0;

		//HEADER
		if (e.Row.RowType ==  DataControlRowType.Header)
		{
			//
			//start in the 3rd cell 
			for (int i = starting_col; i < e.Row.Cells.Count; i++)
			{


				//Add the column header text & checkbox
				Label lbl = new Label();
				lbl.Text = e.Row.Cells[i].Text + "<br/>";
				lbl.Font.Size = 10;
				lbl.ForeColor = Color.Navy;

				CheckBox chk = new CheckBox();
				chk.ID = i.ToString();
				chk.Text = "";
				e.Row.Cells[i].Controls.Add(chk);
				e.Row.Cells[i].Controls.Add(lbl);

				chk.Attributes.Add("onclick", "javascript:CheckAllColumn('" +
				   ((CheckBox)e.Row.FindControl(i.ToString())).ClientID + "','" + gvSubjects.ClientID + "'," + numhiddencols.ToString() + ")");

			}
		}


		//DATA ROWS
		if (e.Row.RowType ==   DataControlRowType.DataRow)
		{
			#region //ROW HEADER (or 1st column)
			CheckBox chkrow = new CheckBox();
			chkrow.Text = " ";
			chkrow.ID = "chkg" + e.Row.Cells[1].Text; //use the measureID
			e.Row.Cells[0].Controls.Add(chkrow);

			chkrow.Attributes.Add("onclick", "javascript:CheckAllRow('" +
			   ((CheckBox)e.Row.FindControl(chkrow.ID)).ClientID + "','" + gvSubjects.ClientID + "','" + e.Row.RowIndex.ToString() + "')");


			Label lblrow = new Label();
			lblrow.Text = e.Row.Cells[0].Text;
			lblrow.Font.Size = 10;
			lblrow.Font.Bold = true;
			lblrow.ForeColor = Color.Navy;
			e.Row.Cells[0].Controls.Add(lblrow);
			#endregion


			#region //CELLS
			//start in the 3rd cell, skipping measure and measureID
			//int startcol = 2;
			for (int i = starting_col; i < e.Row.Cells.Count; i++)
			{
				//If there is some info in the cell then add checkboxes
				if (e.Row.Cells[i].Text.Contains('$'))
				{

					//Create the checkboxes to be added to the cell
					// ADD A NEW PARAM HERE TO ALTER THE TEXT OF THE CHECKBOX
					//   - SHOULD THE ID OF THE CHECKBOX SERVE AS THE PARAMETER VALUE???????
					List<CheckBox> chks = Control_utils.ListOCheckBoxes(e.Row.Cells[i].Text, "chk");  //Pass in the cell contents (csv) and get back a list of checkboxes


					string[] txt = e.Row.Cells[i].Text.Split('|');
					string[] txt2 = txt[0].Split('_');



					//add hiddenfields to hold the values
					HiddenField hidRowValue = new HiddenField();
					HiddenField hidColValue = new HiddenField();

					hidRowValue.ID = "hidrow" + i.ToString();
					hidColValue.ID = "hidcol" + i.ToString();

					hidRowValue.Value = txt2[0];
					hidColValue.Value = txt2[1];
					e.Row.Cells[i].Controls.Add(hidRowValue);
					e.Row.Cells[i].Controls.Add(hidColValue);

					foreach (CheckBox chk in chks)
					{
						LiteralControl lit = new LiteralControl(); lit.Text = "<br/>";  //Add a manual break between each checkbox

						e.Row.Cells[i].Controls.Add(chk);
						e.Row.Cells[i].Controls.Add(lit);

						chk.Attributes.Add("onclick", "javascript:Checked('" +
							((CheckBox)e.Row.FindControl(chk.ID)).ClientID + "','" + gvSubjects.ClientID + "','" + e.Row.RowIndex.ToString() + "','" + i.ToString() + "'," + numhiddencols.ToString() + ")");

						if(e.Row.Cells[i].Text.EndsWith("1$"))
						{
							chk.Checked = true;
							e.Row.Cells[i].BackColor = Color.Yellow;
						}

						chk.Text = chk.Text.Substring(0, chk.Text.Length - 2);
						//split the text by the ~ to see whether to precheck the box or not

					}
				}
			}
			#endregion

		}

		////Hide the groupID column
		//e.Row.Cells[1].Visible = false;

	}
	#endregion  //SUBJECTS


	#region LOAD MEASURES for EDIT
	protected void LoadMeasures_for_Edit(int studyID)
	{
		SQL_utils sql = new SQL_utils();


		int showREL = 0;

		int nREL_in_project = 0;
		if (Request.QueryString["pk"] != null)
		{
			nREL_in_project = sql.IntScalar_from_SQLstring("select count(*) from dp.Meas where dataproj_pk= " + Request.QueryString["pk"] +
			" and studymeasID in (select reliabilitystudymeasID from uwautism_research_backend..tblstudymeas where studyID=" + Master.Master_studyID.ToString() +
			" and ReliabilityStudyMeasID is not null )");
		}

		if (nREL_in_project > 0)
		{
			showREL = 1;
		}
		else if (chkShowREL.Checked)
		{   //Show the reliability measures
			showREL = 1;
		}

		List<SqlParameter> ps = new List<SqlParameter>();

		string dataproj_pk = "0";
		if (Request.QueryString["pk"] != null)
		{
			dataproj_pk = Request.QueryString["pk"];
		}

		ps.Add(sql.CreateParam("studyIDfull", Master.Master_studyIDfull.ToString(), "int"));
		ps.Add(sql.CreateParam("dataproj_pk", dataproj_pk, "int"));
		ps.Add(sql.CreateParam("showREL", showREL.ToString(), "int"));

		DataTable dt = sql.DataTable_from_ProcName("dp.spLoadMeasures", ps );

		
		//gvSubjects.DataSource = dt;
		//gvSubjects.DataBind();

		#region //Group the studymeas by measure
		var query = from r in dt.AsEnumerable()
					let i = new
					{
						Measure = r.Field<string>("measname"),
						measureID = r.Field<int>("measureID"),
						Nvars = r.Field<string>("Nvars"),
						tblname = r.Field<string>("tblname"),
						ColumnName = r.Field<string>("timepoint_text"),
						ColumnValue = r.Field<string>("studymeasID_and_name"),
						ColumnSort = r.Field<double>("timepoint")
					}
					group i by new { i.Measure, i.measureID, i.Nvars, i.tblname } 
					into g orderby g.Min(r => r.ColumnSort)
					select g ;



		DataTable dt_meas_by_timepoint = new DataTable();
		dt_meas_by_timepoint.Columns.Add("Measure", typeof(string));
		dt_meas_by_timepoint.Columns.Add("measureID", typeof(int));
		dt_meas_by_timepoint.Columns.Add("Nvars", typeof(string));
		dt_meas_by_timepoint.Columns.Add("tblname", typeof(string));

		foreach (var item in query)
		{
			var newRow = dt_meas_by_timepoint.NewRow();

			// static columns
			newRow["Measure"] = item.Key.Measure;
			newRow["measureID"] = item.Key.measureID;
			newRow["Nvars"] = item.Key.Nvars;
			newRow["tblname"] = item.Key.tblname;

			// dynamic columns
			foreach (var c in item.OrderBy(c => c.ColumnName))
			{
				if (!dt_meas_by_timepoint.Columns.Contains(c.ColumnName))
				{
					dt_meas_by_timepoint.Columns.Add(new DataColumn(c.ColumnName, typeof(String)));
				}

				newRow[c.ColumnName] += c.ColumnValue.ToString() + "$";
			}

			dt_meas_by_timepoint.Rows.Add(newRow);
		}
		#endregion


		gvMeasures.DataSource = dt_meas_by_timepoint;
		gvMeasures.DataBind();


		//List<SqlParameter> psIntHx_p = new List<SqlParameter>();
		//psIntHx_p.Add(sql.CreateParam("studyIDfull", Master.Master_studyIDfull.ToString(), "int"));
		//psIntHx_p.Add(sql.CreateParam("dataproj_pk", dataproj_pk, "int"));

		//// The dataset returned includes the list of PERIODS, TYPES, and CATS
		//DataSet dsIntHx_params = sql.DataSet_from_ProcName("dp.spLoadMeasures_IntHx_PARAMS", psIntHx_p);
		//Populate_IntHx_TokenBoxes(dsIntHx_params);


		//IntHx measures

		List<SqlParameter> psIntHx = new List<SqlParameter>();
		psIntHx.Add(sql.CreateParam("studyIDfull", Master.Master_studyIDfull.ToString(), "int"));
		psIntHx.Add(sql.CreateParam("dataproj_pk", dataproj_pk, "int"));
		DataTable dtIntHx = sql.DataTable_from_ProcName("dp.spLoadMeasures_IntHx", psIntHx);

		gvIntHx.DataSource = dtIntHx;
		gvIntHx.DataBind();


		ViewState["dt_meas_by_timepoint"] = dt_meas_by_timepoint;

		sql.Close();
	}

	

	protected void gvMeasures_DataBound(object sender, EventArgs e)
	{
		GridView gv = (GridView)sender;

		for (int j = 0; j < gv.Columns.Count; j++)
		{
			//if (j == 2) gv.Columns[j].Visible = false;

		}
	}


	protected void gvViewMeas_RowDataBound(object sender, GridViewRowEventArgs e)
	{

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			DataRowView row = (DataRowView)e.Row.DataItem;

			if (row["N_vars"].ToString() == "0")
			{
				e.Row.Cells[7].BackColor = Color.Red;
			}


			if (row["measureID"].ToString() == "749")
			{
				Button b = (Button)e.Row.FindControl("btnEditVars");
				if (b != null)
				{
					b.Visible = false;
					e.Row.Cells[7].Text = "Auto";
				}
			}
		}

	}

	protected void gvMeasuresIntHx_RowDataBound(object sender, GridViewRowEventArgs e)
	{
				//DATA ROWS
		if (e.Row.RowType == DataControlRowType.DataRow)
		{

			DataRowView drview = e.Row.DataItem as DataRowView;

			CheckBox chk = (CheckBox)e.Row.FindControl("chkIntHx");
			HiddenField hid = (HiddenField)e.Row.FindControl("hidMeasureID");
			Label lbl = (Label)e.Row.FindControl("lblMeasureID");

			string newID =  drview["measureID"].ToString();
			hidMeasureID.Value = newID;
			//lbl.Text = newID;

			//if (drview["isSelected"].ToString() == "1")
			//{
			//	chk.Checked = true;
			//	e.Row.Cells[3].BackColor = Color.Yellow;
			//}
			//else
			//{
			//	chk.Checked = false;
			//}


			//chk.Attributes.Add("onclick", "javascript:Checked('" + chk.ClientID + "','" + gvIntHx.ClientID + "','" + e.Row.RowIndex.ToString() + "','3',0)");


		}
	}

	protected void gvMeasures_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		int starting_col = 3;
		int numhiddencols = 2;
		//HEADER
		if (e.Row.RowType == DataControlRowType.Header)
		{
			//
			//start in the 3rd cell, skipping measure and measureID
			for (int i = starting_col; i < e.Row.Cells.Count; i++)
			{
				//Add the column header text & checkbox
				Label lbl = new Label();
				lbl.Text = e.Row.Cells[i].Text + "<br/>";
				lbl.Font.Size = 10;

				CheckBox chk = new CheckBox();
				chk.ID = i.ToString();
				chk.Text = "";
				e.Row.Cells[i].Controls.Add(chk);
				e.Row.Cells[i].Controls.Add(lbl);

				chk.Attributes.Add("onclick", "javascript:CheckAllColumn('" +
				   ((CheckBox)e.Row.FindControl(i.ToString())).ClientID + "','" + gvMeasures.ClientID + "'," + numhiddencols.ToString() + ")");

			}
		}


		//DATA ROWS
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			//ROW HEADER (or 1st column)
			#region
			CheckBox chkrow = new CheckBox();
			chkrow.Text = " ";
			chkrow.ID = "chk" + e.Row.Cells[1].Text; //use the measureID
			e.Row.Cells[0].Controls.Add(chkrow);

			chkrow.Attributes.Add("onclick", "javascript:CheckAllRow('" +
			   ((CheckBox)e.Row.FindControl(chkrow.ID)).ClientID + "','" + gvMeasures.ClientID + "','" + e.Row.RowIndex.ToString() + "')");


			Label lblrow = new Label();
			lblrow.Text = e.Row.Cells[0].Text;
			lblrow.Font.Size = 10;
			e.Row.Cells[0].Controls.Add(lblrow);

			////Add Button for selecting variables 
			//Label btnlbl = new Label();
			//btnlbl.Text = e.Row.Cells[2].Text;   //Nvars column
			//btnlbl.Font.Size = 8;
			//btnlbl.Width = Unit.Pixel(85);
			//Button btn = new Button();
			//btn.ID = "btn" + e.Row.Cells[1].Text; //use the measureID
			//btn.Font.Size = 7;
			//btn.Width = Unit.Pixel(120);
			//btn.Text = e.Row.Cells[2].Text;
			//btn.Command += btn_Command;
			//btn.CommandName = "ShowVars";
			//btn.CommandArgument = e.Row.Cells[3].Text;

			//e.Row.Cells[2].Controls.Add(btn);

			//Add Label showing how many variables there are
			Label lblvarnum = new Label();
			lblvarnum.Text = e.Row.Cells[2].Text;   //Nvars column
			lblvarnum.Font.Size = 8;
			lblvarnum.Width = 120;
			e.Row.Cells[2].Controls.Add(lblvarnum);



			chkrow.Attributes.Add("onclick", "javascript:CheckAllRow('" +
			   ((CheckBox)e.Row.FindControl(chkrow.ID)).ClientID + "','" + gvMeasures.ClientID + "','" + e.Row.RowIndex.ToString() + "')");



			#endregion


			#region //CELLS
			//start in the 3rd cell, skipping measure and measureID
			for (int i = starting_col; i < e.Row.Cells.Count; i++)
			{

				//If there is some info in the cell then add checkboxes
				if (e.Row.Cells[i].Text.Contains('$'))
				{
					try
					{
						//Create the checkboxes to be added to the cell
						// ADD A NEW PARAM HERE TO ALTER THE TEXT OF THE CHECKBOX
						//   - SHOULD THE ID OF THE CHECKBOX SERVE AS THE PARAMETER VALUE???????
						List<CheckBox> chks = Control_utils.ListOCheckBoxes(e.Row.Cells[i].Text, "chk");  //Pass in the cell contents (csv) and get back a list of checkboxes

						foreach (CheckBox chk in chks)
						{
							LiteralControl lit = new LiteralControl(); lit.Text = "<br/>";  //Add a manual break between each checkbox

							e.Row.Cells[i].Controls.Add(chk);
							e.Row.Cells[i].Controls.Add(lit);

							chk.Attributes.Add("onclick", "javascript:Checked('" +
								((CheckBox)e.Row.FindControl(chk.ID)).ClientID + "','" + gvMeasures.ClientID + "','" + e.Row.RowIndex.ToString() + "','" + i.ToString() + "'," + numhiddencols.ToString() + ")");

							//if (e.Row.Cells[i].Text.Contains("~1$"))
							if (chk.Text.EndsWith("~1"))
							{
								chk.Checked = true;
								e.Row.Cells[i].BackColor = Color.Yellow;
							}

							chk.Text = chk.Text.Substring(0, chk.Text.Length - 2);
						}
					}
					catch (Exception ex)
					{
						string x = ex.Message;
						//LiteralControl lit = new LiteralControl(); lit.Text = ex.StackTrace;  //Add a manual break between each checkbox
						//e.Row.Cells[i].Controls.Add(lit);
					}
				}
			}



			#endregion



		}

		//Hide the measureID and tblname cells
		e.Row.Cells[1].Visible = false;
		e.Row.Cells[3].Visible = false;

	}
	#endregion  LOAD MEASURES

	



	




	#region SHOW, EDIT and SAVE VARIABLES
	protected void ShowVars(int measureID, int rowidx)
	{

		gvViewDatafiles.Visible = false;
		HighlightRow(gvViewMeas, rowidx);

		SQL_utils sql = new SQL_utils();
		hidMeasureID.Value = measureID.ToString();

		string measname = sql.StringScalar_from_SQLstring("select measname from uwautism_research_backend..tblMeasure where measureID = " + measureID.ToString() );

		string tblname = sql.StringScalar_from_SQLstring("select name from def.Tbl where measureID = " + measureID.ToString() );
		////string pkname = sql.StringScalar_from_SQLstring("select name from datField where fieldcodeID=10 and tableID = " +
		////        " ( select tableID from datTable where name = '" + tblname + "')");

		//string tblname = sql.StringScalar_from_SQLstring("select tblname from def.Tbl where measureID = " + measureID.ToString() );
		//int tblpk   = sql.IntScalar_from_SQLstring("select tblpk from def.Tbl where measureID = " + measureID.ToString());
		
		//string pkname = sql.StringScalar_from_SQLstring("select fldname from def.Fld where fieldcodeID=10 and tblpk = " + tblpk.ToString()); 
		
		//string vars_excluded = " varname not in ('ID','" + pkname + "','studymeasID','indexnum','verified','created','createdBy','updated','updatedBy','scored','scoredBy') ";


		//string sql_main = "select * from dp.vwVar where " + vars_excluded + " and tbl = '" + tblname + "' ";
		//string sql_order = " order by  (case when inanalysis=0 then 99 else coalesce(inanalysis,99) end) , " +
		//            " (case when default_InAnalysis=0 then 99 else coalesce(default_InAnalysis,99) end) , ordinal_position ";
		//DataTable vars = sql.DataTable_from_SQLstring(sql_main + " and DataType='numeric' " + sql_order);

		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("dataproj_pk", Request.QueryString["pk"], "int"));
		ps.Add(sql.CreateParam("measureID", measureID.ToString(), "int"));

		DataSet dset = sql.DataSet_from_ProcName("dp.spVars_by_Measure", ps);

		gvVars.DataSource = dset.Tables[0];
		gvVars.DataBind();

		gvVars_text.DataSource = dset.Tables[1];
		gvVars_text.DataBind();

		gvVars_date.DataSource = dset.Tables[2];
		gvVars_date.DataBind();


		//Show/Hide the panels
		lbl_gvVars.Text = tblname;
		lbl_gvVars_measname.Text = measname;
		
		Panel_ViewSummary.Visible = false;
		Panel_EditVars.Visible = true;

		//lblInfo.Text = sqlstr;

		sql.Close();

	}


	protected void HighlightRow(GridView gv, int rowidx)
	{
		for (int i = 0; i < gv.Rows.Count; i++)
		{
			GridViewRow row = gv.Rows[i];
			if (row.RowType == DataControlRowType.DataRow)
			{
				if (i == rowidx)
				{
					row.Visible = true;
					row.BackColor = Color.Yellow;
					//gv.Rows[i].Visible = true;
					//gv.BackColor = Color.Yellow;
				}
				else
				{
					gv.Rows[i].Visible = false;
				}
			}

		}
	}

	protected void ShowAllRows(GridView gv)
	{
		foreach(GridViewRow row in gv.Rows)
		{
			row.Visible = true;
			row.BackColor = Color.White;
			//gv.Rows[i].Visible = true;
			//gv.BackColor = Color.White;
		}
	}


	protected void gridIntHx_OnHtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
	{
		//List<string> fields_to_split = new List<string> { "periods", "types", "cats" };

		//string x = Environment.NewLine;

		//if (fields_to_split.Contains(e.DataColumn.FieldName))
		//{
		//	string oldtext = e.CellValue.ToString();
		//	string newtext = oldtext.Replace(",", "<br/>");
		//	e.Cell.Text = newtext;
		//}

	}


	#region  Pre-Check the Var checkboxes based on InAnalysis values
	protected void gvVars_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		int i = 0;
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			i++;
			// Retrieve the underlying data item. In this example
			// the underlying data item is a DataRowView object. 
			DataRowView rowView = (DataRowView)e.Row.DataItem;
			string x = rowView["InAnalysis"].ToString();

			CheckBox chk = new CheckBox();

			if (x == "4")
			{
				chk = (CheckBox)e.Row.FindControlRecursive("chkVar4");
				chk.Checked = true;
			}
			else if (x == "3")
			{
				chk = (CheckBox)e.Row.FindControlRecursive("chkVar3");
				chk.Checked = true;
			}
			else if (x == "2")
			{
				chk = (CheckBox)e.Row.FindControlRecursive("chkVar2");
				chk.Checked = true;
			}
			if (chk != null)
			{
				int numhiddencols = 0;
				chk.Attributes.Add("onclick", "javascript:Checked('" +
					chk.ClientID + "','" + gvVars.ClientID + "','" + e.Row.RowIndex.ToString() + "','" + i.ToString() + "'," + numhiddencols.ToString() + ")");

				//chk.Attributes.Add("onclick", "javascript:Checked('" +
				//    ((CheckBox)e.Row.FindControl(chk.ID)).ClientID + "','" + gvVars.ClientID + "','" + e.Row.RowIndex.ToString() + "','" + i.ToString() + "')");
			}
		}
	}


	protected void gvVarsT_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			DataRowView rowView = (DataRowView)e.Row.DataItem;
			string x = rowView["InAnalysis"].ToString();

			//int c = 4;  //cell to use

			if (x == "4") //(e.Row.Cells[c].Text == "4")
			{
				CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar4");
				chk.Checked = true;
			}
			else if (x == "3") //(e.Row.Cells[c].Text == "3")
			{
				CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar3");
				chk.Checked = true;
			}

			//Text can only be 3 or 4 

			//else if (x == "1" | x == "2") //(e.Row.Cells[c].Text == "1" | e.Row.Cells[c].Text == "2") {
			//    CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar2");
			//    chk.Checked = true;
			//}
		}
	}


	protected void gvVarsD_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			DataRowView rowView = (DataRowView)e.Row.DataItem;
			string x = rowView["InAnalysis"].ToString();

			//int c = 4;  //cell to use

			//Dates can only be 4

			if (x == "4")  //(e.Row.Cells[c].Text == "4")
			{
				CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar4");
				chk.Checked = true;
			}
			//else if (e.Row.Cells[c].Text == "3")
			//{
			//    CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar3");
			//    chk.Checked = true;
			//}
			//else if (e.Row.Cells[c].Text == "1" | e.Row.Cells[c].Text == "2")
			//{
			//    CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar2");
			//    chk.Checked = true;
			//}
		}
	}
	#endregion


	#region ChkALL Vars  / (to allow checking a column header to select all variables at once 
	protected void chkAllVar2_CheckedChanged(object sender, EventArgs e)
	{
		CheckBox chkall = (CheckBox)sender;
		foreach (GridViewRow row in gvVars.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				CheckBox chk = (CheckBox)row.FindControlRecursive("chkVar2");
				chk.Checked = chkall.Checked;
			}
		}
	}

	protected void chkAllVar3_CheckedChanged(object sender, EventArgs e)
	{
		CheckBox chkall = (CheckBox)sender;
		foreach (GridViewRow row in gvVars.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				CheckBox chk = (CheckBox)row.FindControlRecursive("chkVar3");
				chk.Checked = chkall.Checked;
			}
		}
	}

	protected void chkAllVar4_CheckedChanged(object sender, EventArgs e)
	{
		CheckBox chkall = (CheckBox)sender;
		foreach (GridViewRow row in gvVars.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				CheckBox chk = (CheckBox)row.FindControlRecursive("chkVar4");
				chk.Checked = chkall.Checked;
			}
		}
	}


	protected void chkAllVar2T_CheckedChanged(object sender, EventArgs e)
	{
		CheckBox chkall = (CheckBox)sender;
		foreach (GridViewRow row in gvVars_text.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				CheckBox chk = (CheckBox)row.FindControlRecursive("chkVar2");
				chk.Checked = chkall.Checked;
			}
		}
	}

	protected void chkAllVar3T_CheckedChanged(object sender, EventArgs e)
	{
		CheckBox chkall = (CheckBox)sender;
		foreach (GridViewRow row in gvVars_text.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				CheckBox chk = (CheckBox)row.FindControlRecursive("chkVar3");
				chk.Checked = chkall.Checked;
			}
		}
	}

	protected void chkAllVar4T_CheckedChanged(object sender, EventArgs e)
	{
		CheckBox chkall = (CheckBox)sender;
		foreach (GridViewRow row in gvVars_text.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				CheckBox chk = (CheckBox)row.FindControlRecursive("chkVar4");
				chk.Checked = chkall.Checked;
			}
		}
	}

	protected void chkAllVar2D_CheckedChanged(object sender, EventArgs e)
	{
		CheckBox chkall = (CheckBox)Page.FindControlRecursive("chkAllVarD2");
		foreach (GridViewRow row in gvVars_date.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				CheckBox chk = (CheckBox)row.FindControlRecursive("chkVar2");
				chk.Checked = chkall.Checked;
			}
		}
	}

	protected void chkAllVar3D_CheckedChanged(object sender, EventArgs e)
	{
		CheckBox chkall = (CheckBox)Page.FindControlRecursive("chkAllVarD3");
		foreach (GridViewRow row in gvVars_date.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				CheckBox chk = (CheckBox)row.FindControlRecursive("chkVar3");
				chk.Checked = chkall.Checked;
			}
		}
	}

	protected void chkAllVar4D_CheckedChanged(object sender, EventArgs e)
	{
		CheckBox chkall = (CheckBox)Page.FindControlRecursive("chkAllVarD4");
		foreach (GridViewRow row in gvVars_date.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				CheckBox chk = (CheckBox)row.FindControlRecursive("chkVar4");
				chk.Checked = chkall.Checked;
			}
		}
	}
	#endregion



	protected void Vars_INSERT_SELECTED(string tblname, int measureID)
	{
		SQL_utils sql = new SQL_utils();

		DataTable dt = GetSelectedVars(tblname);

		//Update the SQL table 
		SqlParameter p0 = sql.CreateParam("dataproj_pk", Request.QueryString["pk"], "int");
		SqlParameter p1 = sql.CreateParam("measureID", hidMeasureID.Value.ToString(), "int");
		//SqlParameter p1 = sql.CreateParam("tbl", tblname, "text");
		SqlParameter p2 = sql.CreateParam("flds", dt);
		List<SqlParameter> p = new List<SqlParameter> { p0, p1, p2 };
		sql.NonQuery_from_ProcName("dp.spVars_by_Measure_INSERT_SELECTED", p);
				

		Panel_ViewSummary.Visible = true;
		Panel_EditVars.Visible = false;

		int dataproj_pk = int.Parse(Request.QueryString["pk"]);

		Load_for_View_Measures(dataproj_pk, sql);

		sql.Close();

		
	}

	protected void UpdateDefaults(string tblname)
	{
		SQL_utils sql = new SQL_utils();
		DataTable dt = GetSelectedVars(tblname);

		//Update the SQL table 
		SqlParameter p1 = sql.CreateParam("tbl", tblname, "text");
		SqlParameter p2 = sql.CreateParam("flds", dt);
		List<SqlParameter> p = new List<SqlParameter> { p1, p2 };
		sql.NonQuery_from_ProcName("spdatFlds_DEFAULTS_UPDATE", p);

		////Reload the measures so that var counts are updated
		//ShowStudyMeas(Master.Master_studyID);


		Panel_ViewSummary.Visible = true;
		Panel_EditVars.Visible = false;


		sql.Close();
	}


	protected DataTable GetSelectedVars(string tblname)
	{
		DataTable dt_SelectedVars = new DataTable();
		DataColumn c1 = new DataColumn("fldpk", typeof(int));
		DataColumn c2 = new DataColumn("InAnalysis", typeof(int));
		//DataColumn c3 = new DataColumn("missval", typeof(string));
		dt_SelectedVars.Columns.Add(c1);
		dt_SelectedVars.Columns.Add(c2);
		//dt_SelectedVars.Columns.Add(c3);


		//Loop through and update the vars
		dt_SelectedVars = AddToSelectedVars(dt_SelectedVars, gvVars, 8);
		dt_SelectedVars = AddToSelectedVars(dt_SelectedVars, gvVars_text, 6);
		dt_SelectedVars = AddToSelectedVars(dt_SelectedVars, gvVars_date, 6);

		return dt_SelectedVars;
	}


	protected DataTable AddToSelectedVars(DataTable dt, GridView gv, int cell_idx)
	{
		int rowcounter = 0;
		foreach (GridViewRow row in gv.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				rowcounter++;
				int inanal = 0;
				try
				{
					CheckBox chk2 = (CheckBox)row.FindControlRecursive("chkVar2");
					CheckBox chk3 = (CheckBox)row.FindControlRecursive("chkVar3");
					CheckBox chk4 = (CheckBox)row.FindControlRecursive("chkVar4");
					if (chk2.Checked) inanal = 2;
					else if (chk3.Checked) inanal = 3;
					else if (chk4.Checked) inanal = 4;


					if (inanal > 0)
					{
						dt.Rows.Add(row.Cells[cell_idx].Text, inanal);
						//dt.Rows.Add(row.Cells[3].Text, inanal);

					}
					////This is when I want to also save the missing value
					//TextBox txtmissval = (TextBox)row.FindControlRecursive("txtmissval");
					//string missval = null;
					//if (txtmissval != null) missval = txtmissval.Text;
					//if (inanal > 0) dt.Rows.Add(row.Cells[3].Text, inanal, missval);
				}
				catch (Exception ex)
				{
					string x = ex.Message;
					//lblInfo.Text += gv.ID + "  " + rowcounter.ToString() + " " + ex.Message;
				}
			}
		}

		return dt;
	}



	#endregion


	


	#region CREATE DATA FILE
	protected void CreateDatafile()
	{
		int dataproj_pk = Convert.ToInt32(Request.QueryString["pk"].ToString());

		if (dataproj_pk > 0)
		{
			DataSet dset = utilDataProject.DataProject_Populate(dataproj_pk);
			DataSet dset_descstats = utilDataProject.DataProject_Descstats(dataproj_pk, dset);  // by default: TP, Group, txgrp

			string datenow = DateTime.Now.Year.ToString() + ((DateTime.Now.Month < 10) ? "0" : "") + DateTime.Now.Month.ToString() + ((DateTime.Now.Day < 10) ? "0" : "") + DateTime.Now.Day.ToString();
			string hrminnow = ((DateTime.Now.Hour < 10) ? "0" : "") + DateTime.Now.Hour.ToString() + ((DateTime.Now.Minute < 10) ? "0" : "") + DateTime.Now.Minute.ToString();

			string filename = "Proj_" + dataproj_pk + "_Data_" + datenow + "_" + hrminnow; //TODO
			string filename_descstats = "Proj_" + dataproj_pk + "_DescStats_" + datenow + "_" + hrminnow; //TODO


			#region Log the Datafile
			//Log the Datafile
			int N_subjects = 0;
			int N_measures = 0;
			int N_studymeas = 0;
			int N_datarows = 0;
			int N_datacols = 0;

			SQL_utils sql = new SQL_utils();


			N_measures = sql.IntScalar_from_SQLstring("select count(distinct(measureID))  from [dp].[vwDataProject_Meas]  where dataproj_pk =  " + Request.QueryString["pk"]);
			N_studymeas = sql.IntScalar_from_SQLstring("select count(distinct(studymeasID))  from [dp].[vwDataProject_Meas]  where dataproj_pk =  " + Request.QueryString["pk"]);

			//Get the number of variables associated withe the MIND INtHx v2
			//measure.  Since the data output for this measure is dynamically
			//created, we have to add in the number of variables (20,21,23, & 25 =
			//89 across the 4 levels of aggregation) manually.
			N_datacols = sql.IntScalar_from_SQLstring("select count(*) from dp.Var where dataproj_pk =  " + Request.QueryString["pk"]);


			foreach (DataTable dt in dset.Tables)
			{
				List<string> skip = new List<string> { "Subjects", "Subjects_excluded", "fileinfo", "DataDict", "Measures" };
				if (dt.TableName == "Subjects") N_subjects = dt.Rows.Count;

				if (!skip.Contains(dt.TableName))
				{
					N_datarows += dt.Rows.Count;
				}
			}


			List<SqlParameter> ps = new List<SqlParameter>();
			ps.Add(sql.CreateParam("dataproj_pk", Request.QueryString["pk"], "int"));
			ps.Add(sql.CreateParam("filename", filename + ".xlsx", "text"));
			ps.Add(sql.CreateParam("N_subjects", N_subjects.ToString(), "int"));
			ps.Add(sql.CreateParam("N_measures", N_measures.ToString(), "int"));
			ps.Add(sql.CreateParam("N_studymeas", N_studymeas.ToString(), "int"));
			ps.Add(sql.CreateParam("N_datarows", N_datarows.ToString(), "int"));
			ps.Add(sql.CreateParam("N_datacols", N_datacols.ToString(), "int"));

			sql.NonQuery_from_ProcName("dp.spLogDatafile", ps);
			#endregion


			//Log the Download
			List<SqlParameter> ps2 = new List<SqlParameter>();
			ps2.Add(sql.CreateParam("dataproj_pk", Request.QueryString["pk"], "int"));
			ps2.Add(sql.CreateParam("filename", filename, "text"));
			sql.NonQuery_from_ProcName("dp.spLogDownload", ps2);

			SpreadsheetGearUtils.SaveDataSetToExcel(dset, filename, false, "xlsx");
			SpreadsheetGearUtils.SaveDataSetToExcel(dset_descstats, filename_descstats, false, "xlsx");

			// Not needed as now the Excel file is being read into a DataSet with the datatype retained.
			//		SpreadsheetGearUtils.SaveDataSet_To_XML(dset, filename);
			//		SpreadsheetGearUtils.SaveDataSet_to_BinaryFile(dset, filename);

			dset.Dispose();

		}
	}





	//protected DataSet Populate_dset()
	//{
	//    DataSet dset = new DataSet();
	//    DataSet dset_descstats = new DataSet();


	//    int dataproj_pk = Convert.ToInt32(Request.QueryString["pk"]);

	//    if (dataproj_pk > 0)
	//    {
	//        dset = utilDataProject.DataProject_Populate(dataproj_pk);

	//    }


	//    return dset;
	//}





	#endregion





	#region PDF

	protected void btnPDF_Click(object sender, EventArgs e)
	{
		MemoryStream ms = ExportDataProjectToPDF();

		string filename = "Proposal_" + Request.QueryString["pk"] + " " + lblAuthor.Text + " (" + lblStudyName.Text + ").pdf";

		// Send the data and the appropriate headers to the browser
		Response.Clear();
		Response.AddHeader("content-disposition", "attachment;filename=" + filename);
		Response.ContentType = "application/pdf";

		Response.BinaryWrite(ms.ToArray());
		Response.End();
	}



	protected void btnSubmit_Click(object sender, EventArgs e)
	{

		MemoryStream ms = ExportDataProjectToPDF();

		string filename = "Proposal_" + Request.QueryString["pk"] + " " + lblAuthor.Text + " (" + lblStudyName.Text + ").pdf";

		
		MailMessage msg = new MailMessage("authelp@u.washington.edu", lblSupervisor_email.Text); 
		msg.CC.Add(lblAuthor_email.Text);
		msg.CC.Add("jeffmun@uw.edu");


		msg.Subject = "Proposal from " + lblAuthor.Text + " to review (TESTING...)";
		msg.IsBodyHtml = true;
		msg.Body = "Attached is a data project proposal from " + lblAuthor.Text + " involving the " + lblStudyName.Text + 
			" study.<br/><br/>The proposal can be viewed/edited/approved " + 
			"<a href='" + @"~/stats/DataProject.aspx?pk=" + Request.QueryString["pk"] + "'>here.</a>" +
			"<br/><br/>THIS IS ONLY A TEST.  NO NEED TO RESPOND.";

		byte[] bytes = ms.ToArray();

		Attachment attach = new Attachment(new MemoryStream(bytes), filename, MediaTypeNames.Application.Pdf);

		msg.Attachments.Add(attach);

		SmtpClient smtp = new SmtpClient();
		//smtp.Host = "smtp.gmail.com";
		//NetworkCredential networkCredential = new NetworkCredential("jeffmunson@gmail.com", "swerty!1");
		smtp.Host = "smtp.uw.edu";
		NetworkCredential networkCredential = new NetworkCredential("jeffmun@u.washington.edu", "0987!@KLm");
		smtp.EnableSsl = true;
		smtp.UseDefaultCredentials = true;
		smtp.Credentials = networkCredential;
		smtp.Port = 587;
		smtp.Send(msg);
		ClientScript.RegisterStartupScript(GetType(), "alert", "alert('This proposal has been sent successfully.');", true);


		smtp.Dispose();
		ms.Dispose();

		msg.Dispose();


	}




	private MemoryStream ExportDataProjectToPDF()
	{
		// Stream which will be used to render the data
		MemoryStream fileStream = new MemoryStream();

		Document doc = new Document(iTextSharp.text.PageSize.LETTER, 10, 10, 30, 20);
		try
		{
			#region Define Fonts
			iTextSharp.text.Font font8 = iTextSharp.text.FontFactory.GetFont("Arial", 8f);
			iTextSharp.text.Font font8Bold = iTextSharp.text.FontFactory.GetFont("Arial", 8f);
			font8Bold.SetStyle("bold");

			iTextSharp.text.Font font7 = iTextSharp.text.FontFactory.GetFont("Arial", 7f);
			iTextSharp.text.Font font7Bold = iTextSharp.text.FontFactory.GetFont("Arial", 7f);
			font7Bold.SetStyle("bold");
			#endregion

			//Create Document class object and set its size to letter and give space left, right, Top, Bottom Margin
			PdfWriter wri = iTextSharp.text.pdf.PdfWriter.GetInstance(doc, fileStream);

			doc.Open();//Open Document to write

			//Header 
			Chunk headerc1 = new Chunk("UW Autism Center: Data Project Proposal                                            ", font8);
			Chunk headerc2 = new Chunk("                 Printed: " + DateTime.Now.ToString(), font8);
			Phrase header = new Phrase();
			header.Add(headerc1); header.Add(headerc2);

			iTextSharp.text.Font linkfont = iTextSharp.text.FontFactory.GetFont("Arial", 7f, new BaseColor(Color.DarkBlue));
			Anchor link = new Anchor("Click here to view on the web.\n\n", linkfont);
			link.Reference = "https://uwac.autism.washington.edu/research/stats/DataProject.aspx?pk=" + Request.QueryString["pk"];

			doc.Add(new Paragraph(header));
			doc.Add(link);


			#region  Project Info
			SQL_utils sql = new SQL_utils();

			DataTable dt_proj = sql.DataTable_from_SQLstring("select dataproj_pk, studyname, Author, Supervisor, projTitle, projSummary, created, createdBy from dp.vwDataProject where dataproj_pk=" +
				Request.QueryString["pk"].ToString());

			foreach (DataRow row in dt_proj.Rows)
			{
				Paragraph p0a = new Paragraph("Study: " + row["studyname"].ToString());
				doc.Add(p0a);
				Paragraph p0b = new Paragraph("Author: " + row["Author"].ToString());
				doc.Add(p0b);
				Paragraph p0c = new Paragraph("Supervisor: " + row["Supervisor"].ToString()  +  "     " + lblApproved.Text);
				doc.Add(p0c);
				Paragraph p1 = new Paragraph("Title: " + row["projTitle"].ToString());
				doc.Add(p1);
				Paragraph p2 = new Paragraph("Project No.: " + row["dataproj_pk"].ToString());
				doc.Add(p2);





				List<GridViewInfo> grids = new List<GridViewInfo>();

				if (gvViewSubjects.Rows.Count > 0)
				{
					grids.Add(new GridViewInfo(gvViewSubjects, "Subjects:", 30f, new float[] { 70f, 30f }));
				}
				else
				{
					Paragraph s1 = new Paragraph("Subjects: **To be defined**" );
					doc.Add(s1);
				}


				if (gvViewMeas.Rows.Count > 0)
				{
					grids.Add(new GridViewInfo(gvViewMeas, "Measures:", 80f, new float[] { 10f, 10f, 10f, 10f, 10f, 10f, 10f }));
				}
				else
				{
					Paragraph s1 = new Paragraph("Measures: **To be defined**");
					doc.Add(s1);
				}


				//Add the Grids
				foreach (GridViewInfo g in grids)
				{
					//Write the title
					Paragraph gridTitle = new Paragraph(g.gridTitle + "\n");
					doc.Add(gridTitle);

					//Write the table
					PdfPTable pdf_tbl = utilPDF.AddGridToPDF(g.grid, font8, font8Bold, g.totalwidth, g.widths);
					doc.Add(pdf_tbl);
				}



				doc.Add(new Paragraph("\nProject Summary: \n"));
				//XMLWorker also reads from a TextReader and not directly from a string
				using (var srHtml = new StringReader(row["projSummary"].ToString()))
				{
					//Parse the HTML
					iTextSharp.tool.xml.XMLWorkerHelper.GetInstance().ParseXHtml(wri, doc, srHtml);
				}

			}
			#endregion //Project Info




			sql.Close();

		}
		catch (DocumentException docEx)
		{
			string x = docEx.Message;
			//handle pdf document exception if any
		}
		catch (IOException ioEx)
		{
			string x = ioEx.Message;
			// handle IO exception
		}
		catch (Exception ex)
		{
			string x = ex.Message;
			// ahndle other exception if occurs
		}
		finally
		{
			//Close document and writer
			doc.Close();
		}

		return (fileStream);

	}
	#endregion //PDF





	#region USER controls on the page

	#region NAVIGATION events

	protected void gridProject_Select(object sender, Obout.Grid.GridRecordEventArgs e)
	{

		Hashtable hash = (Hashtable)e.RecordsCollection[0];

		int dataproj_pk = Convert.ToInt16(hash["dataproj_pk"].ToString());

		Response.Redirect("~/stats/DataProject.aspx?pk=" + dataproj_pk.ToString());

		//LoadProjects(dataproj_pk);
	}


	protected void btnBackToAll_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/stats/DataProject.aspx");
	}

	#endregion //NAVIGATION events



	protected void btnProjEDIT_Click(object sender, EventArgs e)
	{
		//lblTitle.Text = dt.Rows[0].Field<string>("projTitle");
		//litSummary.Text = dt.Rows[0].Field<string>("projSummary");

		txtTitle.Text = lblTitle.Text;
		editor.Content = litSummary.Text;

		panelEDITproj.Visible = true;
		panelVIEWproj.Visible = false;
	}

	protected void btnProjCANCEL_Click(object sender, EventArgs e)
	{
		panelEDITproj.Visible = false;
		panelVIEWproj.Visible = true;

	}

	protected void btnHide_Click(object sender, EventArgs e)
	{
		gvSubjects.Visible = false;
		Panel_Measures.Visible = false;
		Panel_IntHx.Visible = false;

		btnHide.Visible = false;
		btnShow.Visible = true;
	}
	protected void btnShow_Click(object sender, EventArgs e)
	{
		gvSubjects.Visible = true;
		Panel_Measures.Visible = true;
		Panel_IntHx.Visible = true;


		btnHide.Visible = true;
		btnShow.Visible = false;
	}

	protected void CancelVars()
	{
		Panel_ViewSummary.Visible = true;
		Panel_EditVars.Visible = false;
	}


	protected void btnApprove_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils();


		sql.NonQuery_from_SQLstring("exec dp.spApproveProject " + Request.QueryString["pk"]);

		#region SEND CONFIRMATION EMAIL
		MailMessage msg = new MailMessage("authelp@u.washington.edu", lblAuthor_email.Text);
		msg.CC.Add(lblSupervisor_email.Text);
		
		DataTable dt_approver_emails = sql.DataTable_from_ProcName("dp.spStudyApprover_emails", sql.CreateParam("dataproj_pk", Request.QueryString["pk"], "int"));

		foreach(DataRow row in dt_approver_emails.Rows)
		{
			string approver_email = row["email"].ToString();
			if (approver_email != lblSupervisor_email.Text)
			{
				msg.CC.Add(approver_email);
			}
		}
		msg.CC.Add("jeffmun@uw.edu");



		string approvedBy = sql.StringScalar_from_SQLstring("select approvedby + ' ON ' + cast(approved as varchar) x from dp.vwDataPRoject where approved is not null and dataproj_pk = " + Request.QueryString["pk"]);

		if (approvedBy.Length > 2)
		{
			msg.Subject = "Proposal #" + Request.QueryString["pk"] + " approved by " + approvedBy;
			msg.IsBodyHtml = true;
			msg.Body = "Your proposal titled '" + lblTitle.Text + "' involving the <b>" + lblStudyName.Text +
				"</b> study has been approved by "  +  approvedBy + ".<br/><br/>You may now create and download data files " +
				"<a href='" + @"~/stats/DataProject.aspx?pk=" + Request.QueryString["pk"] + "'>here.</a>" +
				"<br/><br/>Or using the website menu:  <b>Data > Data Projects</b>";


			SmtpClient smtp = new SmtpClient();
			smtp.Host = "smtp.uw.edu";
			NetworkCredential networkCredential = new NetworkCredential("jeffmun@u.washington.edu", "0987!@KLm");
			smtp.EnableSsl = true;
			smtp.UseDefaultCredentials = true;
			smtp.Credentials = networkCredential;
			smtp.Port = 587;
			smtp.Send(msg);
			ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Thank you. You will receive a copy of the email notifying the project author of your approval.'); window.location='" +
				   Request.ApplicationPath + "/stats/DataProject.aspx?pk=" + Request.QueryString["pk"] + "';", true);



			smtp.Dispose();

			msg.Dispose();
		}
		#endregion



		sql.Close();

		//Response.Redirect("~/stats/DataProject.aspx?pk=" + Request.QueryString["pk"]);

	}

	protected void btn_Command(object sender, CommandEventArgs e)
	{

		if (e.CommandName == "CancelVars")
		{
			CancelVars();
			ShowAllRows(gvViewMeas);
			gvViewDatafiles.Visible = true;
		}
		else if (e.CommandName == "UpdateVars")
		{
			string tblname = lbl_gvVars.Text;
			Vars_INSERT_SELECTED(tblname, int.Parse(hidMeasureID.Value.ToString()));
			ShowAllRows(gvViewMeas);
			gvViewDatafiles.Visible = true;
		}
	}


	protected void btnCreateDatafile_Click(object sender, EventArgs e)
	{

		CreateDatafile();
		Response.Redirect("~/stats/DataProject.aspx?pk=" + Request.QueryString["pk"]);

	}

	protected string DownloadFile(string filename)
	{

		string result = "";

		try
		{
			Response.Redirect("~/stats/DataFileHandler.ashx?file=" + filename);
			result = "success";
		}
		catch (Exception ex)
		{
			string x = ex.Message;
			//lblInfo.Text += "#ERROR in DownloadFile: " + ex.Message;
			result = "error";
		}


		return result;
	}


	protected void btnDownloadExistingFile_Command(object sender, CommandEventArgs e)
	{
		if (e.CommandName == "DownloadExistingFile")
		{
			string filename = e.CommandArgument.ToString();

			if (File.Exists(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + filename)))
			{
				LogDownload(filename);
				DownloadFile(filename);
			}
			else
			{
				string result = "Sorry, the file [" + filename + "] was not found.";
				ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);
			}

		}

		else if (e.CommandName == "DownloadExistingFile_xls")
		{
			string filename = e.CommandArgument.ToString().Replace(".xlsx", ".xls");

			if (File.Exists(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + filename)))
			{
				LogDownload(filename);
				DownloadFile(filename);
			}
			else
			{

				if (File.Exists(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + e.CommandArgument.ToString())))
				{
					//convert to .xls here
					try
					{
						SpreadsheetGearUtils.Save_xls_from_xlsx(e.CommandArgument.ToString());

						LogDownload(filename);
						DownloadFile(filename);

					}
					catch(Exception ex)
					{
						string x = ex.Message;
						string result = "Sorry, the file [" + filename + "] was not found. We have tried to create it but an error occurred.";
						ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);

					}
				}
				else
				{
					string result = "Sorry, the file [" + filename + "] was not found.";
					ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);
				}
				
			}

		}

		else if (e.CommandName == "ViewSummary")
		{

			string filename = e.CommandArgument.ToString();


			string pageurl = "DataProjectStats.aspx";
			pageurl += "?filename=" + e.CommandArgument.ToString() + "&pk=" + Request.QueryString["pk"];
			Response.Redirect(pageurl);



			//if (File.Exists(HttpContext.Current.Server.MapPath("~/App_Data/DataDownloads/" + filename)))
			//{
			//    //convert to .xls here
			//    try
			//    {
			//        DataSet dset_descstats = SpreadsheetGearUtils.GetDataSet(filename);

			//        int g = 0;

			//    }
			//    catch (Exception ex)
			//    {
			//        string result = "Sorry, the file [" + filename + "] was unable to load.  Create a new Excel file to generate the latest descriptive stats.";
			//        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);

			//    }
			//}
			//else
			//{

			//    string data_filename = filename.Replace("DescStats","Data");

			//    DataSet dset = SpreadsheetGearUtils.GetDataSet(data_filename);
			//    int dataproj_pk = Convert.ToInt32(Request.QueryString["pk"]);
			//    if(dataproj_pk > 0 & dset != null & dset.Tables.Count > 0 )
			//    {
			//        string result = "Sorry, the file [" + filename + "] was not found.  Attempting to create file now...";
			//        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);
					
			//        DataSet dset_descstats = utilDataProject.DataProject_Descstats(dataproj_pk, dset);

			//        SpreadsheetGearUtils.SaveDataSetToExcel(dset_descstats, filename);

			//        int g = 0;
			//    }
			//    else
			//    {
			//        string result = "Sorry, the file [" + filename + "] was not found.";
			//        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);

			//    }

			//}

		   


		}


	}

	protected void LogDownload(string filename)
	{
		SQL_utils sql = new SQL_utils();

		//Log the Download
		List<SqlParameter> ps2 = new List<SqlParameter>();
		ps2.Add(sql.CreateParam("dataproj_pk", Request.QueryString["pk"], "int"));
		ps2.Add(sql.CreateParam("filename", filename, "text"));
		sql.NonQuery_from_ProcName("dp.spLogDownload", ps2);

		sql.Close();
	}





	protected void btnEditVars_Command(object sender, CommandEventArgs e)
	{

		if (e.CommandName == "EditVars")
		{

			GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
			int rowidx = gvRow.RowIndex;

			if (e.CommandArgument.ToString() != "")
			{

				ShowVars(int.Parse(e.CommandArgument.ToString()), rowidx);

				Panel_ViewSummary.Visible = false;
				Panel_EditVars.Visible = true;
			}

			//Response.Redirect("~/stats/EditVars.aspx?pk=" + Request.QueryString["pk"] + "&mID=" + e.CommandArgument.ToString());

		}
	}



	protected void btnDeleteDatafile_Command(object sender, CommandEventArgs e)
	{
		if (e.CommandName=="DeleteDatafile")
		{
		SQL_utils sql = new SQL_utils();

		string filename = e.CommandArgument.ToString();

		sql.NonQuery_from_SQLstring("update dp.Datafile set IsDeleted=1, deleted=getdate(), deletedBy=system_user  where filename = '" + filename + "'");

		int dataproj_pk = int.Parse(Request.QueryString["pk"]);

		Load_for_View_Datafiles(dataproj_pk, sql);

		sql.Close();
		}

		
	}


	#endregion  //User controls on the page






	//public static string GetAllCheckedInRow_string(GridView gv, int rowidx) {
	//    string s = "";

	//    for (int c = 1; c < gv.Rows[rowidx].Cells.Count; c++)
	//    //foreach (DataControlFieldCell cell in gv.Rows[rowidx].Cells)
	//    {
	//        DataControlFieldCell cell = (DataControlFieldCell)gv.Rows[rowidx].Cells[c];
	//        foreach (Control ctl in cell.Controls)
	//        {
	//            if (ctl.GetType() == typeof(CheckBox))
	//            {
	//                CheckBox chk = (CheckBox)ctl;
	//                if (chk.Checked)
	//                {
	//                    string prefix = (s == "") ? "" : "$";
	//                    s += prefix + ctl.ID.ToString().Replace("chk", "");
	//                }
	//            }
	//        }
	//    }

	//    return s;
	//}



	//#region CREATE DATA FILE XML
	//protected void CreateDatafileXML()
	//{
	//    //ReadXML();
	//    DataSet dset = Populate_dset();

	//    string datenow = DateTime.Now.Year.ToString() + ((DateTime.Now.Month < 10) ? "0" : "") + DateTime.Now.Month.ToString() + ((DateTime.Now.Day < 10) ? "0" : "") + DateTime.Now.Day.ToString();
	//    string hrminnow = ((DateTime.Now.Hour < 10) ? "0" : "") + DateTime.Now.Hour.ToString() + ((DateTime.Now.Minute < 10) ? "0" : "") + DateTime.Now.Minute.ToString();

	//    string filename = "Proj_" + Request.QueryString["pk"] + "_Data_" + datenow + "_" + hrminnow; //TODO

	//    string mode = "xml";

	//    if (mode == "bin")
	//    {

	//        BinaryFormatter tempbinform = new BinaryFormatter();
	//        MemoryStream ms = new MemoryStream();

	//        tempbinform.Serialize(ms, dset);
	//        byte[] byteStream = null;
	//        byteStream = ms.ToArray();

	//        var path1 = Server.MapPath("~/App_Data/DataDownloads/" + filename + ".bin");


	//        FileStream newFile = File.Create(path1);
	//        newFile.Write(byteStream, 0, byteStream.Length);
	//        newFile.Dispose();
	//    }
	//    else if (mode == "xml")
	//    {
	//        System.Xml.Serialization.XmlSerializer writer =
	//            new System.Xml.Serialization.XmlSerializer(typeof(DataSet));

	//        var path = Server.MapPath("~/App_Data/DataDownloads/" + filename + ".xml");
	//        System.IO.FileStream file = System.IO.File.Create(path);

	//        writer.Serialize(file, dset);
	//        file.Close();
	//    }

	//}



	//public void ReadXML()
	//{


	//    // Now we can read the serialized DataSet...
	//    System.Xml.Serialization.XmlSerializer reader =
	//        new System.Xml.Serialization.XmlSerializer(typeof(DataSet));
	//    System.IO.StreamReader file = new System.IO.StreamReader(
	//        Server.MapPath("/App_Data/DataDownloads/Proj_37_Data_20160609_1108.xml"));
	//    DataSet ds = (DataSet)reader.Deserialize(file);
	//    file.Close();

		
	//}
	//#endregion

	protected void btnRefresh_Click(object sender, EventArgs e)
	{
		
		LoadMeasures_for_Edit(Master.Master_studyID);

	
	}
}