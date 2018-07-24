using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ImageResizer;
using LinqStatistics;
using GoogleChartsNGraphsControls;
using uwac;
//using SelectPdf;
using DotNet.Highcharts;
using DotNet.Highcharts.Options;
using DotNet.Highcharts.Helpers;
using DotNet.Highcharts.Enums;



public partial class stats_descstats : System.Web.UI.Page
{
	private UWAC master { get { return (UWAC)this.Master; } }

	private SQL_utils sql = new SQL_utils("data");

	//private DataSet dset = new DataSet();
	private DataTable dt_searchparams = new DataTable();

	private Config_utils oConfig = new Config_utils();
	//private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();

	private List<measureSubset> selectedMeas = new List<measureSubset>();
	private List<subjectSubset> selectedSubjects = new List<subjectSubset>();
	private List<string> subgroups = new List<string>();


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



	#region PAGE EVENTS
	protected void Page_Init(object sender, EventArgs e)
	{
		master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	protected void Page_Load(object sender, EventArgs e)
	{

		//ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Hello World');", true);

		//btnCOUNT.Attributes.Add("onclick", "javascript:countChecksInGridView('" + gvSubjects.ClientID + "','" + hid_nSubj.ClientID + "','" + lblCount.ClientID + "')");
		//ClientScript.RegisterStartupScript(GetType(), "hwa", "countEm2()", true);
		//btnCOUNT.Attributes.Add("onclick", "javascript:countEm2()");


		//Show the Update Defaults button for Jeff
		int staffID = sql.IntScalar_from_SQLstring("select uwautism_research_backend.dbo.fnGetStaffIDByCurrentUser()");
		if (staffID == 8)
		{
			btn_UpdateDefaults.Visible = true;
		}

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

		//if (ViewState["gv1"] != null)
		//{

		//    if (ViewState["subgroups"] != null)
		//    {
		//        subgroups = (List<string>)ViewState["subgroups"];
		//    }

		//    gv1.DataSource = (DataTable)ViewState["gv1"];
		//    gv1.DataBind();
		//}


		//if (ViewState["dt_SelectedVars"] != null)
		//{
		//    gv_SelectedVars.DataSource = (DataTable)ViewState["dt_SelectedVars"];
		//    gv_SelectedVars.DataBind();
		//}


		if (!IsPostBack)
		{
			LoadRadioButtonLists();
			ShowSubjects(Master.Master_studyID);
			ShowStudyMeas(Master.Master_studyID);
		}

		//if (ViewState["foo"] == "yep")
		//{
		//    ScriptManager.RegisterStartupScript(this, this.GetType(), "toImgJM", "toImgJM(document.getElementById('chart_oBodyPlaceHolder_foo23'), document.getElementById('img_div'));", true);

		//}


	}


	public override void VerifyRenderingInServerForm(Control control)
	{
		/* Verifies that the control is rendered */
	}


	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		ShowSubjects(Master.Master_studyID);
		ShowStudyMeas(Master.Master_studyID);

		lblStudyName.Text = Master.Master_studyname;

		ResetPage();
	}

	#endregion


	protected void ResetPage()
	{

		selectedMeas.Clear();
		selectedSubjects.Clear();
		lblInfo.Text = "";
		lblError.Text = "";

		ShowSubjects(master.Master_studyID);
		ShowStudyMeas(master.Master_studyID);

	}


	protected void LoadRadioButtonLists()
	{
		bool allowTxGroup = true;

		List<string> btn_text = new List<string> { "--None--", "Group", "Timepoint", "Tx Group" };
		List<string> btn_val = new List<string> { "none", "Group", "TimePoint", "txgrp" };
		for (int i = 0; i < btn_text.Count; i++)
		{
			if (btn_text[i] != "Tx Group")
			{
				rbl1.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));
				rbl2.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));
				rbl3.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));
			}
			else if (btn_text[i] == "Tx Group")
			{
				int istx = sql.IntScalar_from_SQLstring("select uwautism_research_backend.dbo.fnIsTxStudy(" + master.Master_studyID.ToString() + ") as x");

				if (istx == 1)  //Only add this if it is a treatment group
				{
					rbl1.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));
					rbl2.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));
					rbl3.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));

					if (!allowTxGroup)  //However, this should only be enabled based on permission
					{
						rbl1.Items[i].Enabled = false;
						rbl2.Items[i].Enabled = false;
						rbl3.Items[i].Enabled = false;
					}
				}

			}

		}

		rbl1.SelectedIndex = 1;
		rbl2.SelectedIndex = 2;
		rbl3.SelectedIndex = 0;
	}


	#region LOAD SUBJECTS
	protected void ShowSubjects(int studyID)
	{
		lblStudyName.Text = Master.Master_studyname;

		string s;

		s = "select groupname + ' (N=' + cast(TotalN as varchar) + ')' [group], groupID, subjstatus, subjstatusID, " +
			" cast(groupID as varchar) + '_' + cast(subjstatusID as varchar) + '|N=' + cast( count(*) as varchar) as groupID_and_subjstatusID  " +
			" from uwautism_research_backend..vwMasterStatus_S a " +
			" join (select groupname groupnameSum, count(*) as totalN from uwautism_research_backend..vwMasterStatus_S where studyID= " + studyID.ToString() +
			" group by groupname) b ON a.groupname = b.groupnameSum " +
			" where studyID = " + studyID.ToString() + " and groupID in (select groupID  from uwautism_research_backend.dbo.fnSEC_Allowed_DATACCESS_GroupID_by_User()) " +
			" group by groupname, TotalN, groupID, subjstatus, subjstatusID " +
			" order by groupname, subjstatus";

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
	}

	protected void gvSubjects_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		int starting_col = 2;
		int numhiddencols = 0;

		//HEADER
		if (e.Row.RowType == DataControlRowType.Header)
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
		if (e.Row.RowType == DataControlRowType.DataRow)
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

					foreach (CheckBox chk in chks)
					{
						LiteralControl lit = new LiteralControl(); lit.Text = "<br/>";  //Add a manual break between each checkbox

						e.Row.Cells[i].Controls.Add(chk);
						e.Row.Cells[i].Controls.Add(lit);

						chk.Attributes.Add("onclick", "javascript:Checked('" +
							((CheckBox)e.Row.FindControl(chk.ID)).ClientID + "','" + gvSubjects.ClientID + "','" + e.Row.RowIndex.ToString() + "','" + i.ToString() + "'," + numhiddencols.ToString() + ")");

					}
				}


			}
			#endregion



		}

		////Hide the groupID column
		//e.Row.Cells[1].Visible = false;

	}
	#endregion  //SUBJECTS


	#region LOAD MEASURES
	protected void ShowStudyMeas(int studyID)
	{
		Panel_Controls.Visible = true;

		string s;
		string rel_clause = "";
		if (!chkShowREL.Checked)
		{   //Show the reliability measures
			rel_clause = " and a.studymeasID not in (select reliabilitystudymeasID from uwautism_research_backend..tblstudymeas  where reliabilitystudymeasID is not null) ";
		}


		string studylist = studyID.ToString();

		if (new List<string> { "1", "2", "3", "1029" }.Contains(studyID.ToString())) studylist = "1,2,3,1029";
		//switch (studyID)
		//{
		//    case 1:
		//        studylist = "1,2,3,1029";
		//        break;
		//}

		s = "select a.studyID, measname, a.measureID, Coalesce(Nvars_staff, Nvars) + (case when Nvars_staff<>Nvars then '**' else '' End)  Nvars " +
			"   , b2.name as tblname, a.studymeasID, studymeasname, " +
			" a.timepointID, timepoint, timepoint_text, cast(studymeasID as varchar) + '|' + replace(studymeasname, measname, '') as studymeasID_and_name " +
			" from uwautism_research_backend..tblstudymeas a " +
			" join uwautism_research_backend..tblmeasure b ON a.measureID = b.measureID " +
			" join uwautism_research_data..DatTable_Measure b1 ON a.measureID = b1.measureID " +
			" join uwautism_research_data..DatTable  b2 ON b1.tableID = b2.tableID" +
			" join uwautism_research_backend..tbltimepoint c ON a.timepointID = c.timepointID " +
			" left join vwdatFlds_N_by_table_Defaults d ON b2.name = d.tbl " +
			" left join vwdatFlds_N_by_table_by_staff e ON b2.name = e.tbl " +
			" where a.studyID in  (" + studylist + ") " + rel_clause +
			" order by timepoint, measname, studymeasname";


		//string s = "select DASIIagemo, NonverbalClust_StdScr from dat.ALL_DASII_Final where DASIIagemo>0 and studymeasID=" + studymeasID.ToString();

		DataTable dt = sql.DataTable_from_SQLstring(s);

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
						ColumnValue = r.Field<string>("studymeasID_and_name")
					}
					group i by new { i.Measure, i.measureID, i.Nvars, i.tblname } into g
					select g;


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
			foreach (var c in item)
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


		ViewState["dt_meas_by_timepoint"] = dt_meas_by_timepoint;
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

			//Add Button for selecting variables 
			Label btnlbl = new Label();
			btnlbl.Text = e.Row.Cells[2].Text;   //Nvars column
			btnlbl.Font.Size = 8;
			btnlbl.Width = Unit.Pixel(85);
			Button btn = new Button();
			btn.ID = "btn" + e.Row.Cells[1].Text; //use the measureID
			btn.Font.Size = 7;
			btn.Width = Unit.Pixel(120);
			btn.Text = e.Row.Cells[2].Text;
			//btn.BackColor = Color.LightGray;
			//btn.BorderStyle = BorderStyle.Solid;
			btn.Command += btn_Command;
			btn.CommandName = "ShowVars";
			btn.CommandArgument = e.Row.Cells[3].Text;

			//e.Row.Cells[2].Controls.Add(btnlbl);
			e.Row.Cells[2].Controls.Add(btn);


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
	#endregion  //measures


	#region POPULATE THE DSET
	protected DataSet Populate_dset(int vartype)
	{
		DataSet dset = new DataSet();
		List<int> vartypes = new List<int>();
		vartypes.Add(vartype);

		dset = Populate_dset(vartypes);

		return dset;
	}

	protected DataSet Populate_dset(string mode)
	{
		DataSet dset = new DataSet();
		List<int> vartypes = new List<int>();
		switch (mode)
		{
			case "DescStats":
				vartypes.Add(2);
				break;
			case "SaveToExcel":
				vartypes.AddRange(new List<int> { 2, 3, 4 });
				break;
			case "ShowData":
				vartypes.AddRange(new List<int> { 2, 3, 4 });
				break;
		}

		dset = Populate_dset(vartypes);

		return dset;
	}


	protected DataSet Populate_dset(List<int> vartypes)
	{
		DataSet dset = new DataSet();
		lblInfo.Text = "";
		//string vartypes_csv = string.Join(",", vartypes.ToString().ToArray());

		//get the  subjects data
		string sel_subj = GetSelectedSubjects(gvSubjects, "");

		//Get Txgrp if relevant 
		int istx = sql.IntScalar_from_SQLstring("select uwautism_research_backend.dbo.fnIsTxStudy(" + master.Master_studyID.ToString() + ") as x");
		string sql_txgrp = "";

		if (istx == 1)
		{
			sql_txgrp = " uwautism_research_backend.dbo.fnGetTxgrp(studyID, a.ID) as txgrp, ";
		}

		//string sql_subj = "select id, groupID, subjstatusID, groupname as [Group], " + sql_txgrp + " subjstatus from uwautism_research_backend..vwMasterStatus_S a " +
		//        " where ( " + sel_subj + ")";
		string sql_subj = "select id,  groupname as [Group], " + sql_txgrp + " subjstatus from uwautism_research_backend..vwMasterStatus_S a " +
				" where ( " + sel_subj + ")";

		//SUBJECTS
		DataTable dt_subj = sql.DataTable_from_SQLstring(sql_subj);
		dt_subj.TableName = "subjects";
		dset.Tables.Add(dt_subj);

		//MEASURES
		selectedMeas.Clear();
		selectedMeas = GetSelectedMeasures(gvMeasures);

		string orderby = (subgroups.Count > 0) ? "[" + String.Join("],[", subgroups.ToArray<string>()) + "]" : " [group], timepoint";

		foreach (measureSubset meassub in selectedMeas)
		{
			//DataTable dt_fldlist_numeric = sql.DataTable_from_SQLstring("select databasefield from uwautism_research_data..dat FieldInfo where databasetable = '" + meassub.tblname +
			//    "' and InAnalysis in (1,2,3) and databasefield not in ('studymeasID','indexnum','verified') and fielddatatype in ('int','float','smallint','bigint')");

			string fldlist = utilStats.GetDataFlds(meassub.tblname, vartypes);  //continuous vars = 2
			string sSQL = "select a.ID, groupname as [Group], subjstatus, " + sql_txgrp + " timepoint as timepointnum, timepoint_text as TimePoint,  " + fldlist + " from uwautism_research_data.." + meassub.tblname + " a " +
				" join  (select ID, groupname, subjstatus from uwautism_research_backend..vwMasterStatus_S where ( " + sel_subj + ")) b ON a.ID = b.ID " +
				" join  (select studymeasID, timepointID from uwautism_research_backend..tblStudyMeas) c ON a.studymeasID = c.studymeasID " +
				" join  uwautism_research_backend..tblTimePoint d ON c.timepointID = d.timepointID " +
				" where verified in (0,1) and a.studymeasID in (" + meassub.studymeas_csv.Replace('$', ',') + ") " +
				" order by " + orderby + ", [ID]";

			DataTable dt = sql.DataTable_from_SQLstring(sSQL);
			//            DataTable dt_clean = utilStats.DataTable_MissingToNULL(dt, meassub.tblname);

			dt.TableName = meassub.tblname;
			dset.Tables.Add(dt);

		}


		return dset;
	}


	protected int GetNumSelectedRows(GridView gv)
	{  //Count the number of checkboxes selected in each row of a GridView
		int n = 0;

		//Loop though each row of the grid and collect the checked ones into a SQL where clause for group and subjstatus
		for (int r = 0; r < gv.Rows.Count; r++)
		{
			string stuff = "";
			stuff = Control_utils.GetAllCheckedInRow_string(gv, r);

			if (stuff.Length > 0) n++;
		}

		return n;
	}


	//protected List<subjectSubset> GetSelectedSubjects(GridView gv)
	protected string GetSelectedSubjects(GridView gv, string test)
	{
		string info = "";
		string g_ss_csv = "";

		//Loop though each row of the grid and collect the checked ones into a SQL where clause for group and subjstatus
		for (int r = 0; r < gv.Rows.Count; r++)
		{
			string stuff = "";
			stuff = Control_utils.GetAllCheckedInRow_string(gv, r);

			if (stuff != "")
			{
				string[] gss_groups = stuff.Split('$');
				info += "{stuff=" + stuff + "}{" + gss_groups.Length.ToString() + "}";
				for (int k = 0; k < gss_groups.Length; k++) { info += "{" + k.ToString() + ":" + gss_groups[k] + "}"; }

				for (int s = 0; s < gss_groups.Length; s++)
				{
					string[] elements = gss_groups[s].Split('_');
					string prefix = (g_ss_csv == "") ? "" : " OR ";

					g_ss_csv += prefix + " (groupID=" + elements[0] + " and subjstatusID=" + elements[1] + ") ";
				}
			}
		}

		info += " g_ss_csv= [" + g_ss_csv + "]";

		if (test == "test") return info;
		else return g_ss_csv;
	}


	protected List<measureSubset> GetSelectedMeasures(GridView gv)
	{
		List<measureSubset> measlist = new List<measureSubset>();
		measureSubset meassub = new measureSubset();

		//Loop though each row of the grid and collect the checked ones into a DataTable
		for (int r = 0; r < gv.Rows.Count; r++)
		{
			string stuff = "";
			stuff = Control_utils.GetAllCheckedInRow_string(gv, r);

			if (stuff != "")
			{
				meassub.studymeas_csv = stuff;
				meassub.tblname = gv.Rows[r].Cells[3].Text; // gv.Rows[r].DataItem["tblname"];
				measlist.Add(meassub);
			}
			else
			{
				gv.Rows[r].Visible = false;
			}
		}

		return measlist;
	}




	#endregion




	#region DISPLAY THE DESCRIPTIVE STATS FOR THE DATASET

	protected void Display_DescStats_for_dset(DataSet dset, List<string> groupvars)
	{
		int counter=0;
		if (dset.Tables.Count > 1)
		{
			foreach (DataTable dt in dset.Tables)
			{
				DataTable dt_desc = new DataTable();
				string tname = dt.TableName;

				if (tname != "subjects")
				{
					counter++;
					#region stuff for subjects
					//if (tname == "subjects")
					//{
					//    //GridView gv = new GridView();
					//    //gv.DataSource = dt;
					//    //gv.DataBind();
					//    //Label lbl = new Label();
					//    //lbl.Text = "<br/><br/>" + tname;
					//    //lbl.Font.Size = 12;

					//    //Panel_descstats.Controls.Add(lbl);
					//    //Panel_descstats.Controls.Add(gv);
					//}
					//else if (tname != null & dt != null & dt.Rows.Count > 0 & subgroups[0] == "")
					//{
					//    dt_desc = utilStats.DataTable_DescStats(dt, tname);
					//    dt_desc.TableName = tname;
					//}
					//else if (tname != null & dt != null & dt.Rows.Count > 0 & subgroups[0] != "" & subgroups.Count > 0)
					//{

					//    dt_desc = utilStats.DataTable_DescStats_ByGroup(dt, tname, subgroups, RadioButtonList1.SelectedValue.ToString());
					//}
					#endregion

					dt_desc = utilStats.DataTable_DescStats_ByGroup(dt, tname, subgroups); //, rbl_stackwide.SelectedValue.ToString());

					//Sort the data
					DataView dt_desc_sorted = new DataView(dt_desc);

					string subgroups_csv = String.Join(",", groupvars.ToArray<string>());
					string comma = (groupvars[0] != "") ? "," : "";

					if (rbl_varsfirstlast.SelectedValue == "first")
					{
						//Place the Variable and label first
						dt_desc.Columns["Label"].SetOrdinal(0);
						dt_desc.Columns["Variable"].SetOrdinal(0);

						dt_desc_sorted.Sort = "Variable, Label" + comma + subgroups_csv;
					}
					else
					{
						dt_desc_sorted.Sort = subgroups_csv + comma + " Variable, Label";
					}


					//Check for at least some valid cases
					int NValidCases = dt_desc.AsEnumerable().Sum(r => r.Field<int>("N"));

					Label lbl = new Label(); lbl.Font.Size = 12; lbl.Font.Bold = true;
					lbl.Text = "<br/><br/>" + tname.Remove(0, 4); //dt_desc.TableName;
					Panel_descstats.Controls.Add(lbl);

					Label lbl2 = new Label();

					//No valid cases 
					if (NValidCases == 0 & tname != "subjects")
					{
						lbl2.Text = "<br/><i>There were no valid cases for the selected variables.</i>";
						lbl2.Font.Size = 10;
						lbl2.Font.Bold = true;
						lbl2.ForeColor = Color.DarkRed;

						Panel_descstats.Controls.Add(lbl2);
					}
					else if (NValidCases > 0)
					{
						////Create the GridView
						//GridView gv = new GridView();
						//gv.ID = "gv" + tname;

						GridView gv = (GridView)Panel_descstats.FindControlRecursive("GridView" + counter.ToString());
						gv.EnableViewState = true;

						gv.DataSource = dt_desc_sorted;
						gv.RowDataBound += new GridViewRowEventHandler(gvDescStats_RowDataBound);
						gv.DataBind();
						//Panel_descstats.Controls.Add(gv);

						//GVLineChart lc = utilCharts.BoxPlot(dt_desc_sorted.ToTable(), "Variable","M", "SD", 400,300);
						GVColumnChart col = utilCharts.ColumnChart(dt_desc_sorted.ToTable(), "Variable", "M", "SD", 400, 300);
						col.EnableViewState = true;

						Panel p = (Panel)Panel_descstats.FindControlRecursive("colPanel" + counter.ToString());
						p.Controls.Add(col);



						#region HighChart
						//List<Dictionary<string, object>> allSeries = new List<Dictionary<string, object>>();
						//foreach (DataRow dr1 in dt_desc_sorted.ToTable().Rows)
						//{
						//    Dictionary<string, object> aSeries = new Dictionary<string, object>();
						//    aSeries["name"] = dr1["name"];
						//    aSeries["data"] = new List<int>();
						//    int N = dr1.ItemArray.Length;
						//    for (int i = 1; i < N; i++)
						//    {
						//        ((List<int>)aSeries["data"]).Add((int)dr1[i]);
						//    }
						//    allSeries.Add(aSeries);
						//}
						//string jsonSeries = Newtonsoft.Json.JsonConvert.SerializeObject(allSeries);
						

	   //                 DotNet.Highcharts.Highcharts chart = new DotNet.Highcharts.Highcharts("chart");

	   //                 chart.SetPlotOptions(new PlotOptions { Column })
	   //                 chart.SetXAxis(new XAxis
	   //{
	   //    Categories = new[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }
	   //})
	   //.SetSeries(new Series() jsonSeries );
	   //{
	   //    Data = new Data(new object[] { 29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4 })
	   //});

	   //                 Literal lit = new Literal();

	   //                 lit.Text = chart.ToHtmlString();

						#endregion





						//Panel_descstats.Controls.Add(lc);
						//Panel_descstats.Controls.Add(col);

						//gv1.DataSource = dt_desc_sorted;
						//gv1.DataBind();
						//Panel_descstats.Controls.Add(gv1);
						//ViewState["gv1"] = dt_desc_sorted.Table;
 
					}

				}
			}
		}
	}



	protected void gvDescStats_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		GridView gv = (GridView)sender;

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			//Hide the First Column
			//e.Row.Cells[0].Visible = false;
		}

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			if (subgroups[0] != "")
			{
				int ncols = e.Row.Cells.Count;
				int numsubgroups = subgroups.Count;
				try
				{
					double z = Convert.ToDouble(e.Row.Cells[ncols - 2].Text);
					string Variable = e.Row.Cells[subgroups.Count].Text;


					int intz = (int)utilStats.RoundToNearestX(Math.Abs(z * 100), 5);  //from 0 to 200 by 5's

					string pad_intz = (intz < 10) ? "00" : (intz < 100) ? "0" : "";
					string posneg = (z < 0) ? "NEG" : "POS";

					System.Web.UI.WebControls.Image bar = new System.Web.UI.WebControls.Image();

					if (intz >= 0 & intz <= 200)
					{
						string str_url = @"http://faculty.washington.edu/jeffmun/images/ruler/ruler2" + posneg + pad_intz + intz.ToString() + ".png";

						//ruler2xxx###.png are images of -2SD to +2SD
						bar.ImageUrl = str_url;
						bar.CssClass = "graph";
						e.Row.Cells[ncols - 1].Controls.Add(bar);
					}
					else
					{
						e.Row.Cells[ncols - 1].Controls.Clear();
						e.Row.Cells[ncols - 1].Text = "";
					}
				}
				catch (Exception )
				{
					//keep going, there is likely no z column
				}

			}
		}


		//Merge cells by subgroups 
		int RowSpan = 2;

		int n_cols_to_merge = 0;

		if (subgroups[0] != "") n_cols_to_merge = subgroups.Count + 2;

		for (int s = 0; s < n_cols_to_merge; s++)  //loop through subgroups + 2 (to also include Variable and Label)
		{
			for (int i = gv.Rows.Count - 2; i >= 0; i--)
			{
				GridViewRow currRow = gv.Rows[i];
				GridViewRow prevRow = gv.Rows[i + 1];
				if (currRow.Cells[s].Text == prevRow.Cells[s].Text)
				{
					currRow.Cells[s].RowSpan = RowSpan;
					prevRow.Cells[s].Visible = false;
					RowSpan += 1;
				}
				else
				{
					RowSpan = 2;
				}

				if (i % 3 == 0)
				{
					//currRow.BorderWidth
					//currRow.BackColor = System.Drawing.Color.Violet;
				}

			}
		}


	}

	#endregion





	protected Table CreateTable(int rowCnt, int colCnt)
	{
		Table tbl = new Table();
		// Current row count.
		int rowCtr;
		// Current cell counter
		int cellCtr;

		for (rowCtr = 1; rowCtr <= rowCnt; rowCtr++)
		{
			// Create new row and add it to the table.
			TableRow tRow = new TableRow();
			tbl.Rows.Add(tRow);
			for (cellCtr = 1; cellCtr <= colCnt; cellCtr++)
			{
				// Create a new cell and add it to the row.
				TableCell tCell = new TableCell();
				tCell.Text = "Row " + rowCtr + ", Cell " + cellCtr;
				tRow.Cells.Add(tCell);
			}
		}

		return tbl;
	}





	protected void ScatterPlots2(DataTable dt, List<string> vars, List<string> groupvars)
	{
		List<GVScatterChart> s = new List<GVScatterChart>();

		//Get the unique variable pairs 
		var combinations = vars.Select((value, index) => new { value, index })
					   .SelectMany(x => vars.Skip(x.index + 1),
								   (x, y) => Tuple.Create(x.value, y));

		dt.Columns.Add("tooltip", typeof(string));
		dt.Columns.Add("style", typeof(string));
		foreach (DataRow r in dt.Rows)
		{
			r["tooltip"] = r["id"];

		}

		Table t = CreateTable(vars.Count + 1, vars.Count + 1);
		t.ID = "charttable";
		for (int v = 0; v < vars.Count; v++)
		{
			t.Rows[v + 1].Cells[0].Text = vars[v];
			t.Rows[0].Cells[v + 1].Text = vars[v];
		}


		//foreach (var pair in combinations)
		//{
		//    s.Add( ScatterPlots(dt, pair.Item1.ToString(), pair.Item2.ToString()));
		//}

		int counter = 0;
		for (int r = 1; r < vars.Count + 1; r++)
		{
			for (int c = r; c < vars.Count + 1; c++)
			{
				counter++;
				//DIAG
				if (r == c)
				{
					GVHistogram  h = utilCharts.Histogram(dt, vars[r - 1]);
					h.ID = "foo" + r.ToString() + c.ToString();

					//if (r == 2)
					//{ panel_foo22.Controls.Add( h); }
					//else
					//{ }
					t.Rows[r].Cells[c].Controls.Add(h);

				}
				else
				{
					GVScatterChart scat = utilCharts.ScatterPlots(dt, vars[r - 1], vars[c - 1]);
					scat.ID = "foo" + r.ToString() + c.ToString(); 
					t.Rows[r].Cells[c].Controls.Add(scat);
				}

			}

		}

		Panel_Testing.Controls.Add(t);


	}





	#region DISPLAY, SELECT, and UPDATE VARS

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
			int c = 4;  //cell to use

			if (e.Row.Cells[c].Text == "4")
			{
				CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar4");
				chk.Checked = true;
			}
			else if (e.Row.Cells[c].Text == "3")
			{
				CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar3");
				chk.Checked = true;
			}
			else if (e.Row.Cells[c].Text == "1" | e.Row.Cells[c].Text == "2")
			{
				CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar2");
				chk.Checked = true;
			}
		}
	}


	protected void gvVarsD_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			int c = 4;  //cell to use

			if (e.Row.Cells[c].Text == "4")
			{
				CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar4");
				chk.Checked = true;
			}
			else if (e.Row.Cells[c].Text == "3")
			{
				CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar3");
				chk.Checked = true;
			}
			else if (e.Row.Cells[c].Text == "1" | e.Row.Cells[c].Text == "2")
			{
				CheckBox chk = (CheckBox)e.Row.FindControlRecursive("chkVar2");
				chk.Checked = true;
			}
		}
	}
	#endregion


	protected void ShowVars(string tblname)
	{
		//This displays the vars for a given table allowing the user to edit which vars are included in the data set

		//Check to see if there are any records in datFlds_by_staff
		string useflag = "";
		int nflds = sql.IntScalar_from_SQLstring("select coalesce(count(*),0) n from datFlds_by_staff where staffID=dbo.fnGetStaffIDByCurrentUser() " +
			" and tbl='" + tblname + "'");

		
		if (nflds == 0)
		{ //If no, then insert the default fields for this measure/staff combo into the datFlds_by_staff 
			//TOFIX
			sql.NonQuery_from_SQLstring("insert into datFlds_by_staff(tbl, staffID, fld, InAnalysis)" +
				 " select databasetable, staffID, databasefield, inanalysis  from " +
				 " (select * from datFieldINfo where databasetable = '" + tblname + "' and inanalysis>0) a" +
				 " cross join (select dbo.fnGetTableIDByTableName ('" + tblname + "') as tableID) b" +
				 "  cross join (select dbo.fnGetStaffIDByCurrentUser() as staffID) c");
			useflag = "staff";
		}
		{
			useflag = "defaults";
		}

		//TODO  
		//Load the fields from datFlds_by_staff


		string sql_main = "select * from vwDataFlds where tbl = '" + tblname + "' ";
		string sql_order = " order by  (case when inanalysis=0 then 99 else coalesce(inanalysis,99) end) , " +
					" (case when default_InAnalysis=0 then 99 else coalesce(default_InAnalysis,99) end) , ordinal_position ";



		DataTable vars = sql.DataTable_from_SQLstring(sql_main + " and DataType='numeric' " + sql_order);
		gvVars.DataSource = vars;
		gvVars.DataBind();

		DataTable varsText = sql.DataTable_from_SQLstring(sql_main + " and DataType='text' " + sql_order);
		gvVars_text.DataSource = varsText;
		gvVars_text.DataBind();

		DataTable varsDate = sql.DataTable_from_SQLstring(sql_main + " and DataType='date' " + sql_order);
		gvVars_date.DataSource = varsDate;
		gvVars_date.DataBind();


		//Show/Hide the panels
		lbl_gvVars.Text = tblname;
		Panel_Measures.Visible = false;
		Panel_Vars.Visible = true;
		Panel_Controls.Visible = false;


		//lblInfo.Text = sqlstr;

	}

	protected void UpdateVars(string tblname)
	{
		DataTable dt = GetSelectedVars(tblname);

		//Update the SQL table 
		SqlParameter p1 = sql.CreateParam("tbl", tblname, "text");
		SqlParameter p2 = sql.CreateParam("flds", dt);
		List<SqlParameter> p = new List<SqlParameter> { p1, p2 };
		sql.NonQuery_from_ProcName("spdatFlds_by_staff_UPDATE", p);


		//Reload the measures so that var counts are updated
		ShowStudyMeas(Master.Master_studyID);


		Panel_Measures.Visible = true;
		Panel_Vars.Visible = false;
		Panel_Controls.Visible = true;
	}

	protected void UpdateDefaults(string tblname)
	{

		DataTable dt = GetSelectedVars(tblname);

		//Update the SQL table 
		SqlParameter p1 = sql.CreateParam("tbl", tblname, "text");
		SqlParameter p2 = sql.CreateParam("flds", dt);
		List<SqlParameter> p = new List<SqlParameter> { p1, p2 };
		sql.NonQuery_from_ProcName("spdatFlds_DEFAULTS_UPDATE", p);

		//Reload the measures so that var counts are updated
		ShowStudyMeas(Master.Master_studyID);


		Panel_Measures.Visible = true;
		Panel_Vars.Visible = false;
		Panel_Controls.Visible = true;
	}


	protected DataTable GetSelectedVars(string tblname)
	{
		DataTable dt_SelectedVars = new DataTable();
		DataColumn c1 = new DataColumn("fld", typeof(string));
		DataColumn c2 = new DataColumn("InAnalysis", typeof(int));
		DataColumn c3 = new DataColumn("missval", typeof(string));
		dt_SelectedVars.Columns.Add(c1);
		dt_SelectedVars.Columns.Add(c2);
		dt_SelectedVars.Columns.Add(c3);


		//Loop through and update the vars
		dt_SelectedVars = AddToSelectedVars(dt_SelectedVars, gvVars);
		dt_SelectedVars = AddToSelectedVars(dt_SelectedVars, gvVars_text);
		dt_SelectedVars = AddToSelectedVars(dt_SelectedVars, gvVars_date);

		return dt_SelectedVars;
	}


	protected void CancelVars()
	{
		Panel_Measures.Visible = true;
		Panel_Vars.Visible = false;
		Panel_Controls.Visible = true;
	}

	#endregion


	#region SHOW DATA
	protected void ShowData(DataSet dset)
	{
		Panel_showdata.Controls.Clear();

		foreach (DataTable dt in dset.Tables)
		{
			Label lbl = new Label();
			lbl.Text = "<br/><br/><b>" + dt.TableName + "</b><br/>";
			GridView gv = new GridView();
			gv.DataSource = dt;
			gv.DataBind();
			Panel_showdata.Controls.Add(lbl);
			Panel_showdata.Controls.Add(gv);
		}
		Panel_showdata.Visible = true;
	}

	#endregion






	#region Events from Page Controls

	protected void btn_Command(object sender, CommandEventArgs e)
	{

		if (e.CommandName == "ShowData")
		{
			string tblname = e.CommandArgument.ToString();
			// ShowData(tblname);
		}

		else if (e.CommandName == "ShowVars")
		{
			string tblname = e.CommandArgument.ToString();
			ShowVars(tblname);
		}

		else if (e.CommandName == "UpdateVars")
		{
			string tblname = lbl_gvVars.Text;
			UpdateVars(tblname);
		}

		else if (e.CommandName == "UpdateDefaults")
		{
			string tblname = lbl_gvVars.Text;
			UpdateDefaults(tblname);
		}

		else if (e.CommandName == "CancelVars")
		{
			CancelVars();
		}
	}


	protected DataTable AddToSelectedVars(DataTable dt, GridView gv)
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

					TextBox txtmissval = (TextBox)row.FindControlRecursive("txtmissval");
					string missval = null;
					if (txtmissval != null) missval = txtmissval.Text;


					if (inanal > 0) dt.Rows.Add(row.Cells[3].Text, inanal, missval);
				}
				catch (Exception ex)
				{
					lblInfo.Text += gv.ID + "  " + rowcounter.ToString() + " " + ex.Message;
				}
			}
		}

		return dt;
	}




	protected void btnReset_Click(object sender, EventArgs e)
	{
		ResetPage();

	}


	protected void testGetSubj_Click(object sender, EventArgs e)
	{
		string sel_subj = GetSelectedSubjects(gvSubjects, "test");
		lblInfo.Text = sel_subj;
	}

	protected string ValidateSelections()
	{
		string error_msg = "";
		int nSubj = GetNumSelectedRows(gvSubjects);

		int nMeas = GetNumSelectedRows(gvMeasures);

		if (nSubj == 0 & nMeas == 0)
		{
			error_msg = "Select Subjects and Measures.";
			//ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "Select some Subjects and Measures.", true);
		}
		else if (nSubj == 0)
		{
			error_msg = "Select Subjects.";
			//ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "Select some Subjects.", true);
		}
		else if (nMeas == 0)
		{
			error_msg = "Select Measures.";
			//ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "Select some Measures.", true);
		}


		return error_msg;
	}



	protected void ProcessData(string mode)
	{
		string error_msg = ValidateSelections();

		if (error_msg == "")
		{

			//TOFIX  only get data if needed 
			//Get the data
			DataSet dset = Populate_dset(mode);

			if (dset.Tables.Count == 0)
			{
				error_msg = "No data tables returned to dataset.";
			}

			else
			{
				if (mode == "DescStats")
				{
					subgroups.Clear();
					if (rbl1.SelectedValue != "none") subgroups.Add(rbl1.SelectedValue);
					if (rbl2.SelectedValue != "none" & rbl2.SelectedValue != rbl1.SelectedValue) subgroups.Add(rbl2.SelectedValue);
					if (rbl3.SelectedValue != "none" & rbl3.SelectedValue != rbl1.SelectedValue & rbl3.SelectedValue != rbl2.SelectedValue) subgroups.Add(rbl3.SelectedValue);

					if (subgroups.Count == 0) subgroups.Add("");

					ViewState["subgroups"] = subgroups;

					if (dset.Tables.Count > 0)
					{

						Display_DescStats_for_dset(dset, subgroups);

						Table t = CreateTable(3, 3);


						List<string> vars = utilStats.GetDataFlds_ToList(dset.Tables[1].TableName, 2);
						ScatterPlots2(dset.Tables[1], vars, subgroups);


					}
					else
					{
						error_msg = "No data tables returned to dataset.";
					}
				}


				else if (mode == "SaveToExcel")
				{
					string filename = "data"; //TODO
					SpreadsheetGearUtils.SaveDataSetToExcel(dset, filename, true, "xlsx");
				}
				else if (mode == "ShowData")
				{
					ShowData(dset);
				}
			}

		}
		lblError.Text = error_msg;

	   // ScriptManager.RegisterStartupScript(this, GetType(), "toImg", "toImgJM(document.getElementById('chart_oBodyPlaceHolder_foo23'), document.getElementById('img_div'));", true);

	}


	protected void btnGetStats_Click(object sender, EventArgs e)
	{
		ProcessData("DescStats");


	}


	protected void btnShowData_Click(object sender, EventArgs e)
	{
		ProcessData("ShowData");
	}


	protected void btnSaveToExcel_Click(object sender, EventArgs e)
	{
		ProcessData("SaveToExcel");
	}




	#endregion



	//protected void btnBuildBars_Click(object sender, EventArgs e)
	//{
	//    BuildBars();
	//}

	//    protected void BuildBars()
	//    {


	//        //MemoryStream b2 = new MemoryStream();

	//        for (int i = 0; i < 41; i++)
	////        for (int i = 0; i < 3; i++)
	//            {
	//            int z = (i * 5) - 200;

	//            string pad_intz = (Math.Abs(z) < 10) ? "00" : (Math.Abs(z) < 100) ? "0" : "";
	//            string Poldname = "tocrop_ruler2POS" +  pad_intz + Math.Abs(z).ToString() + ".png";
	//            string Pnewname = "ruler2POS" + pad_intz + Math.Abs(z).ToString() + ".png";
	//            string Noldname = "tocrop_ruler2NEG" + pad_intz + Math.Abs(z).ToString() + ".png";
	//            string Nnewname = "ruler2NEG" + pad_intz + Math.Abs(z).ToString() + ".png";


	//            Bitmap p1 = new Bitmap(Server.MapPath(@"~/images/ruler/") + Poldname);
	//            string p2 =  (Server.MapPath(@"~/images/ruler/") + Pnewname);

	//            Bitmap n1 = new Bitmap(Server.MapPath(@"~/images/ruler/") + Noldname);
	//            string n2 = (Server.MapPath(@"~/images/ruler/") + Nnewname);

	//            string inst = "crop=17,0,-8,-12;";
	//            Instructions resize_settings = new Instructions(inst);

	//            ImageJob Pjob = new ImageJob(p1, p2, resize_settings);
	//            Pjob.Build();
	//            ImageJob Njob = new ImageJob(n1, n2, resize_settings);
	//            Njob.Build();
	//            }

	//    }

	#region ChkALL Vars
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




	protected void gvMeasures_DataBound(object sender, EventArgs e)
	{
		GridView gv = (GridView)sender;

		for (int j = 0; j < gv.Columns.Count; j++)
		{
			//if (j == 2) gv.Columns[j].Visible = false;

		}
	}

	//protected void btnCOUNT_Click(object sender, EventArgs e)
	//{
	//    //    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", message, true);

	//    //ClientScript.RegisterStartupScript(GetType(),  "hwa", "countEm2()", true);
	//    lblCount.Text += "foo";
	//}



	//protected void btnExportPDF_Click(object sender, EventArgs e)
	//{
	//    Response.ContentType = "application/pdf";
	//    Response.AddHeader("content-disposition", "attachment;filename=TestPage.pdf");
	//    //Response.AddHeader("content-disposition", "inline;filename=TestPage.pdf");
	//    Response.Cache.SetCacheability(HttpCacheability.NoCache);
	//    StringWriter sw = new StringWriter();
	//    HtmlTextWriter hw = new HtmlTextWriter(sw);


	//    //this.Page.RenderControl(hw);
	//    //Panel_Controls.RenderControl(hw);
	//    //gvSubjects.RenderControl(hw);
	//    //gvMeasures.RenderControl(hw);
	//    //Panel_descstats.RenderControl(hw);

	//    hw.Write("foo");

	//    foreach (Control c in Panel_descstats.Controls)
	//    {
	//        hw.Write(c.ID);
	//        c.RenderControl(hw);

	//        if (c.ID == "gvALL_Mullen_items")
	//        {
	//            throw new Exception("foo!");
	//        }
	//    }

	//    foreach (Control c in Panel_Testing.Controls)
	//    {
	//        hw.Write(c.ID);
	//        c.RenderControl(hw);

	//        if (c.ID == "gvALL_Mullen_items")
	//        {
	//            throw new Exception("foo! Panel_testing");
	//        }
	//    }


		
	//    StringReader sr = new StringReader(sw.ToString());
	//    //Document pdfDoc = new Document(PageSize.LETTER, 10f, 10f, 20f, 10f);
	//    var pgSize = new iTextSharp.text.Rectangle(22f * 72f, 8.5f * 72f);
	//    Document pdfDoc = new Document( pgSize, 10f, 10f, 20f, 10f); 


	//    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
	//    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
	//    pdfDoc.Open();
	//    htmlparser.Parse(sr);
	//    pdfDoc.Close();
	//    Response.Write(pdfDoc);
	//    Response.End();
	//}


	//Following statement is used to call pre-defined javascript function
	protected void btnServerSide_Click(object sender, EventArgs e)
	{
		//ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "myFunction();", true);

		ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "toImgJM", "toImgJM(document.getElementById('chart_oBodyPlaceHolder_foo23'), document.getElementById('img_div'));", true);
		//ViewState["foo"] = "yep";

		UpdatePanel1.Update();

		
	}




	//protected void selectpdf()
	//{
	//    bool startConversion = true;

	//    if (startConversion)
	//    {

	//        //Response.ContentType = "application/pdf";
	//        //Response.AddHeader("content-disposition", "attachment;filename=TestPage.pdf");
	//        ////Response.AddHeader("content-disposition", "inline;filename=TestPage.pdf");
	//        //Response.Cache.SetCacheability(HttpCacheability.NoCache);

	//        SelectPdf.HtmlToPdfOptions opt = new HtmlToPdfOptions();

	//        // get html of the page
	//        TextWriter myWriter = new StringWriter();
	//        HtmlTextWriter htmlWriter = new HtmlTextWriter(myWriter);

	//        htmlWriter.Write("This page: " + System.IO.Path.GetFileName(HttpContext.Current.Request.Url.ToString()) );
			
	//        htmlWriter.Write("foo1");

	//        //int counter = 0;
	//        //foreach(Control c in this.Page.Controls)
	//        //{
	//        //    counter++;
	//        //    string s = c.ToString();
	//        //    htmlWriter.Write("Begin Writing " + counter.ToString() + ": \n");
	//        //    htmlWriter.Write(s);
	//        //    htmlWriter.Write( " ID=" + c.ID);
	//        //    htmlWriter.Write(" unqID=" + c.UniqueID);
	//        //    htmlWriter.Write("End Writing " + counter.ToString() + ": ");

	//        //    c.RenderControl(htmlWriter);
	//        //}

	//        this.Page.RenderControl(htmlWriter);

	//        //Control c = (Control)Panel_descstats.FindControlRecursive("chartDiv");
	//        //c.RenderControl(htmlWriter);

	//        //chartDiv.RenderControl(htmlWriter);


	//        //htmlWriter.Write("foo2");

	//        //this.Page.RenderControl(htmlWriter);

	//        //Table t = (Table)Panel_Testing.FindControlRecursive("charttable");
	//        //Control c = (Control)Panel_Testing.FindControlRecursive("foo23");
			
	//        //Control c2 = (Control)this.Page.FindControlRecursive("oBodyPlaceHolder_foo23");

	//        //Panel_descstats.RenderControl(htmlWriter);
			
	//        //if (t != null) { t.RenderControl(htmlWriter);}
	//        //else { htmlWriter.Write("foo1");}

	//        //if (c != null) { c.RenderControl(htmlWriter); }
	//        //else { htmlWriter.Write("foo2"); }

	//        //if (c2 != null) { c.RenderControl(htmlWriter); }
	//        //else { htmlWriter.Write("foo3"); }


	//        //this.Page.RenderControl(htmlWriter);



	//        // instantiate a html to pdf converter object
	//        HtmlToPdf converter = new HtmlToPdf();
	//        converter.Options.MinPageLoadTime = 3;

	//        //converter.Options.VisibleWebElementId = "Panel_descstats";


	//        // create a new pdf document converting the html string of the page
	//        //SelectPdf.PdfDocument doc = converter.ConvertHtmlString(myWriter.ToString(), Request.Url.AbsoluteUri);
	//        SelectPdf.PdfDocument doc = converter.ConvertHtmlString(myWriter.ToString());



	//        SelectPdf.PdfPage page = doc.AddPage();

	//        // create a new pdf font (component standard font)
	//        SelectPdf.PdfFont font1 = doc.AddFont(PdfStandardFont.Helvetica);
	//        font1.Size = 20;

	//        // create a new pdf font (system font)
	//        SelectPdf.PdfFont font2 = doc.AddFont(new System.Drawing.Font("Verdana", 15));

	//        // define a rendering result object
	//        PdfRenderingResult result;

	//        ////Add a final page
	//        //// create text element 
	//        //PdfTextElement text1 = new PdfTextElement(0, 0,
	//        //    "Regular text using standard font Helvetica, size 20.", font1);
	//        //result = page.Add(text1);

	//        //// create text element 
	//        //PdfTextElement text2 = new PdfTextElement(0, result.PdfPageLastRectangle.Bottom + 20,
	//        //    "Regular text using system font Verdana, size 15.", font2);
	//        //result = page.Add(text2);

	//        //// create colored text element 
	//        //PdfTextElement text3 = new PdfTextElement(0, result.PdfPageLastRectangle.Bottom + 20, 200,
	//        //    "Red text over light blue background, using system font Verdana, size 15, limited at a width of 200 points.", font2);
	//        //text3.ForeColor = System.Drawing.Color.Red;
	//        //text3.BackColor = System.Drawing.Color.LightBlue;
	//        //result = page.Add(text3);



	//        // save pdf document
	//        doc.Save(Response, false, "Sample2.pdf");
	//        //doc.Save(HttpContext.Current.Response, false, "Sample2.pdf");
			


	//        // close pdf document
	//        doc.Close();


	//        //Response.Write(pdfDoc);
	//        Response.End();


	//    }
	//    else
	//    {
	//        //// render web page in browser
	//        //base.Render(writer);
	//    }
	//}


	protected void btnSelectPdf_Click(object sender, EventArgs e)
	{
	   // selectpdf();
	}
}