using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using uwac;
using uwac.data;
using uwac.trk;
using LinqStatistics;

public partial class DataProject_Explore2 : System.Web.UI.Page
{

	private bool dataproject_initialized = false;
	private List<int> selected_measlist;
	private List<int> selected_varslist;
	private List<int> selected_subjlist;

	DataTable tbl_selsubj;
	DataTable tbl_selmeas;
	DataTable tbl_selvars;

	private int selected_subjset_pk;
	private bool isCancelRequired;
	private double progressInPercent;

	#region Page Setup
	protected void Page_Init(object sender, EventArgs e)
	{
		Debug.Print("&&&&&&&&&&&&&&&&&&&&& Page_Init " + System.DateTime.Now.ToString() + "&&&&&&&&&&&&&&&&&&&&&");

		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = Master.Master_studyID.ToString();
		ViewState["measNeedBind"] = "true";
		ViewState["varsNeedBind"] = "false";
		ViewState["subjNeedBind"] = "true";

	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("Index.aspx");
	}

	protected void Page_Unload(object sender, EventArgs e)
	{
		PrintStatus();
		Debug.Print(" ===================   Page_Unload " + System.DateTime.Now.ToString() + " ==================");
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		Debug.Print("*********************  Page_Load " + System.DateTime.Now.ToString() + " **************************");



		if (!IsPostBack)
		{

			ShowHideResults();
			Debug.Print("--- is NOT Postback " + System.DateTime.Now.ToString());


			// Not a postback and there is a defined DataProject - preload the selected Measures and Variables
			if (Request.QueryString["pk"] != null)
			{

				int pk = Convert.ToInt32(Request.QueryString["pk"].ToString());

				lbl0.Text = "Explore2 Data Project";
				lblPK.Text = "#" + Request.QueryString["pk"];

				PrintStatus();
				InitializeSessionVars();
				PrintStatus();

				LoadDataproject(pk);

				//Bind Subjects
				DataTable dts = dataops.GetSelectedSubjects(pk);
				Session["subj"] = dts;
				gridSelSubj.DataSource = Session["subj"];
				gridSelSubj.DataBind();

				gridSelSubj.Selection.SelectAll();


				//Bind the Measures   "onlySavedMeas" param is true (here we only want to return the measures saved for this dp)
				DataTable dtm = dataops.GetAllStudymeas(pk.ToString(), Master.Master_studyIDfull, true);
				Session["meas"] = dtm;
				gridSelMeas.DataSource = Session["meas"];
				gridSelMeas.DataBind();
				gridSelMeas.Selection.SelectAll();

				//Bind the Vars
				var selected_measlist = dtm.AsEnumerable().Select(f => f.Field<int>("studymeasID")).ToList();
				string selm_csv = String.Join(",", selected_measlist);
				DataTable dtv = dataops.GetVarsForDataproject(pk, selm_csv, true);
				Session["vars"] = dtv;
				gridSelVars.DataSource = Session["vars"];
				gridSelVars.DataBind();
				gridSelVars.Selection.SelectAll();


				//LoadDataproject_SelectedItems(pk);


			}
			else
			{
				//With no pk redirect
				Response.Redirect("Index.aspx");
			}

			//chkOptions.UnselectAll();

			//Set default FilterRowMenu to 'Contains'
			//SetRowFilterMenuToContains(gridSelSubj);
			SetRowFilterMenuToContains(gridSelMeas);
			SetRowFilterMenuToContains(gridSelVars);
		}

		// IS PostBack
		else
		{
			Debug.Print("--- is Postback " + System.DateTime.Now.ToString());
			PrintStatus();

			if (Session["subj"] != null)
			{
				gridSelSubj.DataSource = Session["subj"];
				gridSelSubj.DataBind();
			}

			if (Session["meas"] != null )
			{
				gridSelMeas.DataSource = Session["meas"];
				gridSelMeas.DataBind();
			}

			if (Session["vars"] != null)
			{
				gridSelVars.DataSource = Session["vars"];
				gridSelVars.DataBind();
			}

			if (Session["proj_data_stack"] != null)
			{
				if (chkOpt_desc.Checked)
				{
					pivotDescStats.DataSource = (DataTable)Session["proj_data_stack"];
					pivotDescStats.DataBind();
				}
				if (chkOpt_miss.Checked)
				{
					pivotMissing.DataSource = (DataTable)Session["proj_data_stack"];
					pivotMissing.DataBind();
				}
				if (chkOpt_data_stackvar.Checked)
				{
					gridDataStackvar.DataSource = (DataTable)Session["proj_data_stack"];
					gridDataStackvar.DataBind();
				}
			}

			if (Session["proj_data"] != null)
			{
				if (chkOpt_data_long.Checked)
				{
					gridDataLong.DataSource = (DataTable)Session["proj_data"];
					gridDataLong.DataBind();
				}

			}


			//if (Session["proj_data_stack"] != null & chkOpt_desc.Checked)
			//{
			//	pivotDescStats.DataSource = (DataTable)Session["proj_data_stack"];
			//	pivotDescStats.DataBind();
			//}

			//if (Session["proj_subj"] != null)
			//{
			//	PivotSelSubj.DataSource = Session["proj_subj"];
			//	PivotSelSubj.DataBind();
			//}

			//if (Session["meas"] != null & Session["proj_meas"] != null)
			//{
			//	gridSelMeas.DataSource = Session["meas"];
			//	gridSelMeas.DataBind();

			//	PivotSelMeas.DataSource = Session["proj_meas"];
			//	PivotSelMeas.DataBind();
			//	PivotSelMeas.Visible = true;
			//}
			//else
			//{
			//	Debug.Print("   **** Not Binding VARS yet - no meas selected ****" + System.DateTime.Now.ToString());
			//	Debug.Print("");

			//	//PivotSelMeas.Visible = false;
			//}



			//if(Session["proj_vars"] != null)
			//{
			//	gridProjVars.DataSource = Session["proj_vars"];
			//	gridProjVars.DataBind();
			//	gridProjVars.Visible = true;
			//}



		}


		int n_proj_subj = (Session["proj_subj"] != null) ? ((DataTable)Session["proj_subj"]).Rows.Count : 0;
		int n_proj_meas = (Session["proj_meas"] != null) ? ((DataTable)Session["proj_meas"]).Rows.Count : 0;
		int n_proj_vars = (Session["proj_vars"] != null) ? ((DataTable)Session["proj_vars"]).Rows.Count : 0;
		int n_proj_data = (Session["proj_data"] != null) ? ((DataTable)Session["proj_data"]).Rows.Count : 0;

		lblStatus.Text = String.Format("This project has {0} subjects, {1} measures, {2} vars saved.", n_proj_subj.ToString(), n_proj_meas.ToString(), n_proj_vars.ToString());



		//selsubj_n.Text = String.Format("({0} selected)", n_proj_subj);

		int num_selsubj = gridSelSubj.GetSelectedFieldValues("subjID").Count;
		int num_selmeas = gridSelMeas.GetSelectedFieldValues("studymeasID").Count;
		int num_selvars = gridSelVars.GetSelectedFieldValues("fldpk").Count;

		selsubj_n.Text = String.Format("({0} selected)", num_selsubj);
		selsubj_n2.Text = String.Format("({0} selected)", num_selsubj);

		selmeas_n.Text = String.Format("({0} selected)", num_selmeas);
		selmeas_n2.Text = String.Format("({0} selected)", num_selmeas);
		selvars_n.Text = String.Format("({0} selected)", num_selvars);
		selvars_n2.Text = String.Format("({0} selected)", num_selvars);

		
		PrintStatus();
		Debug.Print("   --- Page_Load complete " + System.DateTime.Now.ToString());

	}
	#endregion

	protected void InitializeSessionVars()
	{
		Debug.Print("  **  InitializeSessionVars ");
		
			Session["meas"] = null;
			Session["vars"] = null;

			Session["proj_subj"] = null;
			Session["proj_meas"] = null;
			Session["proj_vars"] = null;
			Session["proj_data"] = null;
			Session["proj_data_stack"] = null;
			Session["proj_infomsg"] = null;


			Session["selected_subjlist"] = null;
			Session["selected_varslist"] = null;
			Session["selected_measlist"] = null;
		
	}




	protected void SetRowFilterMenuToContains(ASPxGridView g)
	{
		foreach (var col in g.Columns)
		{
			if (col is GridViewDataColumn)
			{
				((GridViewDataColumn)col).Settings.AutoFilterCondition = AutoFilterCondition.Contains;
			}
		}
	}


	protected void PrintStatus()
	{
		int n_projsubj = (Session["proj_subj"] != null) ? ((DataTable)Session["proj_subj"]).Rows.Count : 0;
		int n_projmeas = (Session["proj_meas"] != null) ? ((DataTable)Session["proj_meas"]).Rows.Count : 0;
		int n_projvars = (Session["proj_vars"] != null) ? ((DataTable)Session["proj_vars"]).Rows.Count : 0;
		//int n_projdata = (Session["proj_data"] != null) ? ((DataTable)Session["proj_data"]).Rows.Count : 0;

		//int n_subj = (Session["subj"] != null) ? ((DataTable)Session["subj"]).Rows.Count : 0;
		int n_meas = (Session["meas"] != null) ? ((DataTable)Session["meas"]).Rows.Count : 0;
		int n_vars = (Session["vars"] != null) ? ((DataTable)Session["vars"]).Rows.Count : 0;

		bool print = false;
		if (print)
		{
			Debug.Print("");
			Debug.Print("Session meas     = " + n_meas.ToString() + "   " + System.DateTime.Now.ToString());
			Debug.Print("Session vars     = " + n_vars.ToString() + "   " + System.DateTime.Now.ToString());
			Debug.Print("");
			Debug.Print("Session proj_subj = " + n_projsubj.ToString() + "   " + System.DateTime.Now.ToString());
			Debug.Print("Session proj_meas = " + n_projmeas.ToString() + "   " + System.DateTime.Now.ToString());
			Debug.Print("Session proj_vars = " + n_projvars.ToString() + "   " + System.DateTime.Now.ToString());

			//Debug.Print("Session proj_data = " + n_projdata.ToString() + "   " + System.DateTime.Now.ToString());
			Debug.Print("");
		}


	}


	protected void LoadDataproject(int pk)
	{
		Debug.Print(" ***** LoadDataproject_SelectedItems" + System.DateTime.Now.ToString());
		SQL_utils sql = new SQL_utils("data");

		int studyID = sql.IntScalar_from_SQLstring("select studyID from dp.DataProject where dataproj_pk = " + pk.ToString());

		if (Master.Master_studyID != studyID)
		{
			Master.Master_studyID = studyID;
		}

		DataTable dtProj = sql.DataTable_from_SQLstring("select * from dp.DataProject where dataproj_pk = " + pk.ToString());
		lblTitle.Text = dtProj.Rows[0]["projTitle"].ToString();

		sql.Close();
	}

	
		protected void CheckSelectedMeas(List<int> measlist)
	{
		ASPxGridView grid = (ASPxGridView)gridSelMeas;

		//Remove any filter before selecting rows
		if (grid.Settings.ShowFilterRow) grid.FilterExpression = string.Empty;

		var nrow_visible = (int)grid.VisibleRowCount;

		int n_total_meas = ((DataTable)Session["meas"]).Rows.Count;

		int sel = 0;
		int unsel = 0;
		Debug.Print("");
		Debug.Print("   CHECK MEAS");
		Debug.Print(String.Format("   nrow_visible={0}  n_total_meas={1}", nrow_visible.ToString(), n_total_meas.ToString()));


		for (int i=0; i<measlist.Count; i++)
		{
			gridSelMeas.Selection.SelectRowByKey(measlist[i]);
		}

		Debug.Print(String.Format("   sel={0}  unsel={1}", sel.ToString(), unsel.ToString()));
		Debug.Print("");
	}


	protected void CheckSelectedVars(List<int> pks)
	{
		ASPxGridView grid = (ASPxGridView)gridSelVars;
		grid.Selection.UnselectAll();


		foreach (int i in pks)
		{
			grid.Selection.SelectRowByKey(i);
		}

	}

	
	protected void pivotDescStats_OnCustomChartDataSourceData(object sender, EventArgs e)
	{
	}


	#region Callbacks


	protected void gridSubjCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  pivotSubjCallback_OnCallback " + System.DateTime.Now.ToString());

		//DataTable dt = uwac.trk.dataops.GetSelectedSubjects(Convert.ToInt32(cboSubjSet.Value.ToString()), Master.Master_studyID);

		//Session["proj_subj"] = dt;

		//gridSelSubj.DataSource = (DataTable)Session["proj_subj"];
		//gridSelSubj.DataBind();
	}
	protected void gridMeasCallback2_OnCallback(object sender, EventArgs e)
	{
	}

	protected void gridMeasCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  gridMeasCallback_OnCallback " + System.DateTime.Now.ToString());

		//RefreshSession_selmeas();
		//PivotSelMeas.DataSource = (DataTable)Session["tbl_selmeas"];
		//PivotSelMeas.DataBind();

		//PivotSelMeas.ReloadData();

		//gridSelMeas.DataSource = Session["meas"];
		//gridSelMeas.DataBind();

		var selmeas = gridSelMeas.GetSelectedFieldValues(gridSelMeas.KeyFieldName);
		selected_measlist = selmeas.ConvertAll(x => Convert.ToInt32(x));

		//ResetLoadedData();
	}
	protected void gridVarsCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  gridVarsCallback_OnCallback " + System.DateTime.Now.ToString());

		var list_selmeas = gridSelMeas.GetSelectedFieldValues(gridSelMeas.KeyFieldName);
		var smID_csv = uwac.trk.dataops.GetCSV(gridSelMeas.GetSelectedFieldValues(gridSelMeas.KeyFieldName));

		//Here only get vars if it needs binding

		if(Session["selected_measlist"] == list_selmeas)
		{ 
			//Here we are
		}
		else
		{
			DataTable dtv = uwac.trk.dataops.GetVarsForDataproject(Convert.ToInt32(Request.QueryString["pk"]), smID_csv, true);
			Session["vars"] = dtv;
		}

		gridSelVars.DataSource = Session["vars"];
		gridSelVars.DataBind();

	}





	//Update the Session variable based on what is currently selected
	//Call right before we bind the PivotTable 
	protected void RefreshSession_selmeas()
	{
		Debug.Print("RefreshSession_selmeas " + System.DateTime.Now.ToString());
		DataTable meas = (DataTable)Session["meas"];
		var selmeas = gridSelMeas.GetSelectedFieldValues(gridSelMeas.KeyFieldName).ToList();

		if (selmeas.Count > 0)
		{
			var selmeasinfo =
				from a in meas.AsEnumerable()
				where selmeas.Any(x => a.Field<int>("studymeasID").ToString().Contains(x.ToString()))
				select a;
			DataView selmeasinfo2 = selmeasinfo.AsDataView();
			Session["tbl_selmeas"] = selmeasinfo2.ToTable();
		}
		else{
			Session["tbl_selmeas"] = null;
		}
		//PrintStatus();
	}

	protected void RefreshSession_selvars()
	{
		Debug.Print("RefreshSession_selvars " + System.DateTime.Now.ToString());
		DataTable vars = (DataTable)Session["vars"];
		var selvars = gridSelVars.GetSelectedFieldValues(gridSelVars.KeyFieldName).ToList();
		if (selvars.Count > 0)
		{
			var selvarinfo =
				from a in vars.AsEnumerable()
				where selvars.Any(x => a.Field<int>("fldpk").ToString().Contains(x.ToString()))
				select a;
			DataView selvarinfo2 = selvarinfo.AsDataView();
			Session["proj_vars"] = selvarinfo2.ToTable();
			Session["selected_varslist"] = selvars;
		}
		//PrintStatus();
	}


	#endregion


	#region User Controls
	
	protected void btnProjects_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnSets_OnClick " + System.DateTime.Now.ToString());

		Response.Redirect("Index.aspx");
	}

	protected void btnEditProject_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnEditProject_OnClick " + System.DateTime.Now.ToString());
		Response.Redirect("Edit.aspx?pk=" + Request.QueryString["pk"]);
	}


	#endregion





	#region PivotTable of Selected Measures	


	protected void PivotSelMeas_Concat(object sender, PivotGridCustomSummaryEventArgs e)
	{
//		Debug.Print("ENTER PivotSelMeas_Concat");
		var x = e.DataField;
		//if (e.DataField != field_meas) return;
		if (e.DataField.Name != "field_meas") return;

		// Get the record set corresponding to the current cell.
		PivotDrillDownDataSource ds = e.CreateDrillDownDataSource();

		string concat = "";
		// Iterate through the records and count the orders.
		for (int i = 0; i < ds.RowCount; i++)
		{
			PivotDrillDownDataRow row = ds[i];
			string sep = (i == 0) ? "" : "<br>";

			string newtext = row["StudyMeasName"].ToString();
			string isREL = row["isREL"].ToString();

			if (isREL == "REL")
			{
				newtext = String.Format(@"<p style=""background-color: gold; display:inline; text-align: right;"">{0}</p>", newtext);
			}

			concat = String.Format("{0}{1}{2}", concat, sep, newtext);
		}

		if (ds.RowCount > 0)
		{
			e.CustomValue = concat;
		}
//		Debug.Print("EXIT PivotSelMeas_Concat");

	}

	#endregion


	#region Save XLSX


	protected void btnXLSX_OnClick(object sender, EventArgs e)
	{

		//gridWide1Data.ExportToXlsx();
		string filename = String.Format("Proj{0}_");

		gridDataLong.ExportXlsxToResponse(true);
	}


	#endregion



	#region stats 

	protected void btnBuild_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnBuild_OnClick " + System.DateTime.Now.ToString());

		int pk;
		bool has_pk = int.TryParse(Request.QueryString["pk"], out pk);

		if(has_pk)
		{
			Dataproject dataproject = new Dataproject(pk);

			//This saves the dataproject as an Excel file.
			dataproject.CreateDatafile();
		}

	}



	protected void btnLoad_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnLoad_OnClick " + System.DateTime.Now.ToString());


		if (
			gridSelSubj.GetSelectedFieldValues("subjID").ToList().Count > 0 &
			gridSelMeas.GetSelectedFieldValues("measureID").ToList().Count > 0 &
			gridSelVars.GetSelectedFieldValues("fldpk").ToList().Count > 0
		)
		{
			panelCharts.Controls.Clear();

			LoadDataSet(Convert.ToInt32(Request.QueryString["pk"]), true);

		}

	}


	protected void LoadDataSet(int pk, bool loadFromPage)
	{
		DataSet dset = new DataSet();
		if (loadFromPage)
		{
			//Retrieve the selected values from the page
			List<string> id_list = uwac.trk.dataops.GetListString(gridSelSubj.GetSelectedFieldValues("id"));
			List<int> subjID_list = uwac.trk.dataops.GetListInt(gridSelSubj.GetSelectedFieldValues("subjID")).Distinct().ToList();

			List<int> studymeasureID_list = uwac.trk.dataops.GetListInt(gridSelMeas.GetSelectedFieldValues("studymeasID")).Distinct().ToList();
			List<int> measureID_list = uwac.trk.dataops.GetListInt(gridSelMeas.GetSelectedFieldValues("measureID")).Distinct().ToList();
			List<string> MeasName_list = uwac.trk.dataops.GetListString(gridSelMeas.GetSelectedFieldValues("MeasName")).Distinct().ToList();
			List<string> tblname_list = uwac.trk.dataops.GetListString(gridSelMeas.GetSelectedFieldValues("tblname")).Distinct().ToList();
			List<string> TimePt_list = uwac.trk.dataops.GetListString(gridSelMeas.GetSelectedFieldValues("TimePt")).Distinct().ToList();

			List<int> fldpk_list = uwac.trk.dataops.GetListInt(gridSelVars.GetSelectedFieldValues("fldpk")).Distinct().ToList();
			List<string> fldname_list = uwac.trk.dataops.GetListString(gridSelVars.GetSelectedFieldValues("fldname"));

			dset = BuildDataProject(id_list, subjID_list,
				studymeasureID_list, measureID_list, MeasName_list, tblname_list, TimePt_list,
				fldpk_list, fldname_list, pk);

		}
		else
		{
			//Alternatively, look these up directly from the DB

		}


		if (dset != null)
		{

			DataTable data = dset.Tables["Data"];
			int nrecs_data = 0;
			if (data != null)
			{

				nrecs_data = ((DataTable)dset.Tables["Data"]).Rows.Count;
				Session["proj_data"] = (DataTable)dset.Tables["Data"];
				Session["proj_data_stack"] = (DataTable)dset.Tables["Data_Stacked"];
			}


			lblLoadedDataInfo.Text = String.Format("Loaded Data Information: {0} total records.", nrecs_data);
			Session["proj_infomsg"] = (DataTable)dset.Tables["InfoMsg"];


			gridInfoMsg.DataSource = (DataTable)Session["proj_infomsg"];
			gridInfoMsg.DataBind();

			btnLoad.ClientVisible = false;
			panelInfo.ClientVisible = true;
		}

	}


	protected DataTable GetCompvars(DataTable data, int pk )
	{


		//Need to calculate Z-scores if needed
		SQL_utils sql = new SQL_utils("data");
		DataTable dtcompvars = sql.DataTable_from_ProcName("dp.spCompvars", sql.CreateParam("dataproj_pk", pk.ToString(), "int"));


		if (dtcompvars != null)
		{

			dtcompvars.Columns.Add("ref_M", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			dtcompvars.Columns.Add("ref_SD", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
			dtcompvars.Columns.Add("ref_N", Nullable.GetUnderlyingType(typeof(int)) ?? typeof(int));


			#region Z values

			//Get new values
			foreach (DataRow row in dtcompvars.Rows)
			{

				//Calculate Z
				string curr_Variable = row.Field<string>("varname").ToString();
				string ref_timept = row.Field<string>("ref_timept").ToString();

				if(data.Columns.Contains(curr_Variable))
				{
					//remove NULL values				
					var currvar_data = data.AsEnumerable()
						.Where(r => !r.IsNull(curr_Variable))
						.Where(r => r["timept"].ToString() == ref_timept)
						.Select(x => Convert.ToDouble(x[curr_Variable]));
					if (currvar_data.Count() > 0)
					{
						double? ref_M = currvar_data.Average();
						double? ref_SD = currvar_data.StandardDeviation();
						int ref_N = currvar_data.Count();

						row["ref_M"] = ref_M;
						row["ref_SD"] = ref_SD;
						row["ref_N"] = ref_N;
					}
				}
			}
			#endregion

		}
		sql.Close();

		return dtcompvars;

	}


	protected DataSet BuildDataProject(List<string> id_list, List<int> subjID_list, 
		List<int> studymeasureID_list, List<int> measureID_list, List<string> MeasName_list, List<string> tblname_list, List<string> TimePt_list,
		List<int> fldpk_list, List<string> fldname_list, int pk)
	{
		var beg = DateTime.Now;
		Debug.Print("ENTER BuildDataProject" + System.DateTime.Now.ToString());
		DataSet dset = new DataSet();
		SQL_utils sql = new SQL_utils("data");


		//Prelim info needed:
		//CSV: subjID, studymeasID, id, fldpk, TimePt

		string subjID_csv = uwac.trk.dataops.GetCSV(gridSelSubj.GetSelectedFieldValues("subjID"));
		string studymeasID_csv = uwac.trk.dataops.GetCSV(gridSelMeas.GetSelectedFieldValues("studymeasID"));
		string id_csv = uwac.trk.dataops.GetCSV(id_list);
		string fldpk_csv = uwac.trk.dataops.GetCSV(fldpk_list);
		string TimePt_csv = uwac.trk.dataops.GetCSV(TimePt_list);


		string sqlcode_s = String.Format("select * from (select id, timepoint_text timept, groupname as [group], coalesce(txgrp, '**NA**') txgrp, subjstatus, subjstatusdetail, sex " +
			" , coalesce(ethnicitydesc, 'UNKNOWN') as race, coalesce(hispanicdesc, 'UNKNOWN') as ethnicity " +
			" , subjNotes, convert(VARCHAR, txstart, 101) txstart, txstartnote, subjID " +
			" from uwautism_research_backend..vwMasterStatus_S_txgrp a1 " +
			" CROSS JOIN (select timepoint_text from uwautism_research_backend..tbltimepoint where studyID = {0} and timepoint_text in ({2}) ) a2 " +
			" where studyID = {0} and subjID in ({1}) ) a "
			, Master.Master_studyID.ToString()
			, subjID_csv
			, TimePt_csv);

		int NsSubjTp = sql.DataTable_from_SQLstring(sqlcode_s).Rows.Count;



		//Create the table to hold the summary information after processing 
		DataTable dtmsg = new DataTable();
		dtmsg.Columns.Add(new DataColumn("Measure", typeof(string)));
		dtmsg.Columns.Add(new DataColumn("N_Records", typeof(int)));
		dtmsg.Columns.Add(new DataColumn("N_IDs", typeof(int)));
		dtmsg.Columns.Add(new DataColumn("N_TimePts", typeof(int)));
		dtmsg.Columns.Add(new DataColumn("N_Vars", typeof(int)));
		dtmsg.Columns.Add(new DataColumn("Message", typeof(string)));
		dtmsg.TableName = "InfoMsg";
		string msg;

		List<string> tbls_to_process = new List<string>();
		List<string> messages = new List<string>();
		messages.Add("<b>Data Loading...</b>");
		List<string> sqlcode_t = new List<string>();
		List<string> sqlcode_t_dups = new List<string>();

		List<string> all_meas = new List<string>();
		List<string> meas_to_skip = new List<string>();

		// Process each selected measure(table) in the data project
		for (int t = 0; t < tblname_list.Count; t++)
		{
			string tblname = tblname_list[t];
			string MeasName = MeasName_list[t];
			int measureID = measureID_list[t];

			msg = "";
			
			string check_N_vars = String.Format("select count(*) n from def.vwFld where measureID={0} and fldpk in ({1})", measureID.ToString(), fldpk_csv);
			int N_vars = sql.IntScalar_from_SQLstring(check_N_vars);

			all_meas.Add(measureID.ToString());

			DataRow row = dtmsg.NewRow();


			//Continue only if N_vars > 0
			if (N_vars == 0)
			{
				//No Data so don't include
				msg = String.Format("No variables selected.", MeasName);

				row["Measure"] = MeasName;
				row["Message"] = msg;
				row["N_Vars"] = N_vars;
			}
			else
			{

				//Check the N's
				string check_Ns1 = String.Format(" select count(*) N, count(distinct(dbo.fnGetTimePoint_text_from_StudymeasID(studymeasID))) N_TimePts, count(distinct(id)) N_IDs  " +
				" from {0} where verified in (0,1) and studymeasID in ({1}) and ID in ({2} )", tblname, studymeasID_csv, id_csv);
				DataTable Ns = sql.DataTable_from_SQLstring(check_Ns1);
				int Ns1 = Ns.Rows[0].Field<int>("N");
				int N_TimePts = Ns.Rows[0].Field<int>("N_TimePts");
				int N_IDs = Ns.Rows[0].Field<int>("N_IDs");


				//Dups by ID within a single studymeas
				string check_Ns2 = String.Format(" select ID, studymeasID, count(*) n from {0} where verified in (0,1) and studymeasID in ({1}) and ID in ({2}) group by ID, studymeasID  having count(*) > 1 ", tblname_list[t], studymeasID_csv, id_csv);
				DataTable dups = sql.DataTable_from_SQLstring(check_Ns2);
				int Ns2 = dups.Rows.Count;
				string remove_dup_IDs = "";
				var dupsIDs_csv = "";
				if (Ns2 > 0)
				{
					//IF there are ID's with dups in a studymeas, remove it when checking the next type of dups
					string plural = (Ns2 > 1) ? "s" : "";
					var dupsIDs = dups.AsEnumerable().Select(f => f.Field<string>("ID")).ToList();
					dupsIDs_csv = String.Join("','", dupsIDs);
					remove_dup_IDs = " and a.ID not in ('" + dupsIDs_csv + "') ";
				}


				//Dups by ID within a TimePoint and Measure.
				//If there are dups here, we don't want to join it with the other measures.
				//These will be skipped when creating the unified file.
				string check_Ns3 = String.Format(" select a.ID, measureID, b.timepointID, c.timepoint_text, count(*) n from {0} a " +
				" join uwautism_research_backend..tblstudymeas b ON a.studymeasID=b.studymeasID " +
				" join uwautism_research_backend..tbltimepoint c ON b.timepointID=c.timepointID " +
				" where verified in (0,1) and a.studymeasID in ({1}) and a.ID in ({2}) {3} " +
				" group by a.ID, measureID, b.timepointID, c.timepoint_text having count(*) > 1 ", tblname, studymeasID_csv, id_csv, remove_dup_IDs);


				DataTable dups3 = sql.DataTable_from_SQLstring(check_Ns3);
				int Ns3 = dups3.Rows.Count;

				Debug.Print(String.Format("tbl={0} Ns2={1} Ns3={2} sm={3}", tblname, Ns2, Ns3, studymeasID_csv));

				#region Checks N's etc.
				if (Ns1 == 0)
				{
					//No Data so don't include
					msg = String.Format("No records for these subjects.", MeasName);
				}
				else if (Ns3 > 0)
				{
					//No Data so don't include
					//int measureID = dups3.AsEnumerable().Select(f => f.Field<int>("measureID")).Min();
					meas_to_skip.Add(measureID.ToString());
					msg = String.Format("Skipped.  Multiple records for {0} within a timepoint. Not clear how to join.", MeasName);
				}
				else if (Ns1 > 0 & Ns2 >= 0)
				{
					//Make sure some of these measures are selected


					//NEXT get the fieldnames
					string sqlcode_flds = String.Format("select fldname, fldname_miss2null  from def.vwFld where fldpk in ({0}) and tblpk=(select tblpk from def.tbl where measureID={1} ) " +
						" and (case when fielddatatype like '%char%' then 'text' when fielddatatype like '%date%' then 'date' else 'numeric' end) = 'numeric' "
						, fldpk_csv, measureID);
					DataTable flds = sql.DataTable_from_SQLstring(sqlcode_flds);
					//List<string> vars_no_quote = flds.AsEnumerable().Select(f => f.Field<string>("fldname")).ToList();
					List<string> vars_no_quote = flds.AsEnumerable().Select(f => f.Field<string>("fldname_miss2null")).ToList();

					string tmp = "";
					msg = "";

					if (Ns2 == 0)
					{
						tmp = String.Format(" LEFT JOIN (select {2}, id as id{1}, studymeasID as smID{1} from {0} " +
							" where verified in (0,1) and studymeasID in ({3}) ) t{1} ON a.id=t{1}.id{1} and a.TimePt=dbo.fnGetTimePoint_text_from_StudymeasID(t{1}.smID{1})"
							, tblname, t, String.Join(",", vars_no_quote), studymeasID_csv);

						msg = String.Format("Yes - data loaded", Ns1);
					}
					else if (Ns2 > 0)
					{
						string plural = (Ns2 > 1) ? "s" : "";
						//var dupsIDs = dups.AsEnumerable().Select(f => f.Field<string>("ID")).ToList();
						//var dupsIDs_csv = String.Join("','", dupsIDs);

						tmp = String.Format(" LEFT JOIN (select {2}, id as id{1}, studymeasID as smID{1} from {0} " +
								" where verified in (0,1) and studymeasID in ({3}) and ID not in ('{4}') ) t{1} ON a.id=t{1}.id{1} and a.TimePt=dbo.fnGetTimePoint_text_from_StudymeasID(t{1}.smID{1})"
								, tblname, t, String.Join(",", vars_no_quote), studymeasID_csv, dupsIDs_csv);

						msg = String.Format("Yes data loaded. Duplicate recs for {0} subject{1} excluded. [{2}]", Ns2, plural, dupsIDs_csv);


						string tmp_dupdata = String.Format("select * from (select {2}, id as id{1}, studymeasID as smID{1} from {0} " +
						" where verified in (0,1) and studymeasID in ({3}) and ID not in ('{4}') ) t{1} "
						, tblname, t, String.Join(",", vars_no_quote), studymeasID_csv, dupsIDs_csv);

						sqlcode_t_dups.Add(tmp_dupdata);
					}

					sqlcode_t.Add(tmp);

					//Add this table to those to be processed
					tbls_to_process.Add(tblname);


				}
				else
				{
					msg = String.Format("{0} unprocessed.", MeasName);
				}
				#endregion

				row["Measure"] = MeasName;
				row["Message"] = msg;
				row["N_records"] = Ns1;
				row["N_IDs"] = N_IDs;
				row["N_TimePts"] = N_TimePts;
				row["N_Vars"] = N_vars;
			}
			

			dtmsg.Rows.Add(row);
		}

		if (sqlcode_t.Count == 0)
		{
			dset.Tables.Add(dtmsg);
		}
		else if (sqlcode_t.Count > 0)
		{
			string sqlcode = sqlcode_s + String.Join(" ", sqlcode_t);


			Debug.Print(String.Format("done building sqlcode  {0}", System.DateTime.Now.ToString()));
			DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
			Debug.Print(String.Format("done retrieving dt  {0}       nrecs={1}", System.DateTime.Now.ToString(), dt.Rows.Count.ToString()));


			#region Composite Vars

			//Create Composite Var reference info
			DataTable dtCompvars = GetCompvars(dt, pk);
			dtCompvars.TableName = "Compvar_Refs";
			dset.Tables.Add(dtCompvars);

			#endregion


			#region STACK
			//STACK the data completely, so pivot table can calculate descriptives natively
			List<string> vars_to_keep = new List<string> { "id", "group", "timept", "txgrp", "subjstatus", "sex" };

			//Need to remove fields for the Skipped measures.
			//  and non-numeric fields
			string meas_to_skip_csv = String.Join(",", meas_to_skip);
			string all_meas_csv = String.Join(",", all_meas);
			DataTable dt_flds_to_drop = sql.DataTable_from_SQLstring(
				String.Format("select fldname from def.vwFld where measureID in ({0}) or " +
				" (  measureID in ({1}) and fielddatatype in ('char','varchar','nvarchar','date','smalldatetime')) ", meas_to_skip_csv, all_meas_csv));
			List<string> flds_to_drop = dt_flds_to_drop.AsEnumerable().Select(f => f.Field<string>("fldname")).ToList();

			List<string> fldname_list_noskips = fldname_list.Except(flds_to_drop).ToList();


			DataTable dt_stack = utilStats.StackData(dt, vars_to_keep, fldname_list_noskips);
			dt_stack.TableName = "Data_Stacked";
			Debug.Print(String.Format("done stacking data  nrows={0}  {1}", dt_stack.Rows.Count.ToString(), System.DateTime.Now.ToString()));

			DataView dv = new DataView(dt_stack);
			dv.RowFilter = "Value IS NOT null";
			DataTable dt_new = dv.ToTable();

			Debug.Print(String.Format("done stacking data  nrows={0}  nrwos2={1} {2}", dt_stack.Rows.Count.ToString(), dt_new.Rows.Count.ToString(), System.DateTime.Now.ToString()));
			#endregion

			dt.TableName = "Data";
			//Add tables to dataset
			dset.Tables.Add(dt);

			//Calculate the Z scores
			if (dtCompvars != null)
			{

				//Calculate the individual Z's for each variable
				foreach (DataRow row in dtCompvars.Rows)
				{
					//Get the variable
					string varname = row["varname"].ToString();

					//Check that variable is in the dataset
					if (dt.Columns.Contains(varname))
					{

						//Get the ref stats
						double ref_M;
						double ref_SD;
						int ref_N;
						Double.TryParse(row["ref_M"].ToString(), out ref_M);
						Double.TryParse(row["ref_SD"].ToString(), out ref_SD);
						int.TryParse(row["ref_N"].ToString(), out ref_N);

						dt.Columns.Add(string.Format("{0}_Z", varname), typeof(double),
							string.Format("({0} - {1}) / {2}", varname, ref_M.ToString(), ref_SD.ToString()));
					}
				}


				//Calculate the Composite

				//get the unique list of compvars
				var compvars = dtCompvars.AsEnumerable().Select(x => x.Field<string>("compvarname")).Distinct().ToList();


				//Loop through list of compvars and get each var
				foreach(string compvarname in compvars)
				{
					//get the vars for the compvar
					List<string> vars = dtCompvars.AsEnumerable()
						.Where(r => r.Field<string>("compvarname") == compvarname)
						.Where(r => r.Field<int?>("ref_N") > 0)
						.Select(r => r.Field<string>("varname")).ToList();


					string vars_csv = string.Join("+", vars);
					string compvar_formula = string.Format("({0}) / {1}", vars_csv, vars.Count);

					dt.Columns.Add(string.Format("{0}_Z", compvarname), typeof(double), compvar_formula);

				}


			}


			dset.Tables.Add(dtmsg);


		}

		//NEED TO PROCESS THESE DUPS
		//if (sqlcode_t_dups.Count > 0)
		//{
		//	foreach(string s in sqlcode_t_dups)
		//	{
		//		string sqlcode = sqlcode_s + String.Join(" ", sqlcode_t);

		//		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);


		//		//Remove Missing Values
		//		string tbls_csv = String.Join("','", tbls_to_process);
		//		DataTable dt_missing_to_null = utilStats.DataTable_MissingToNULL(dt, tbls_csv, false, fldpks);
		//		dt_missing_to_null.TableName = "Data";

		//		//Stack the data completely, so pivot table can calculate descriptives natively
		//		List<string> vars_to_keep = new List<string> { "id", "group", "timept", "txgrp", "subjstatus", "sex" };
		//		DataTable dt_stack = utilStats.StackData(dt_missing_to_null, vars_to_keep, fldname_list);
		//		dt_stack.TableName = "Data_Stacked";

		//		//Add tables to dataset
		//		dset.Tables.Add(dt_missing_to_null);
		//		dset.Tables.Add(dt_stack);
		//		dset.Tables.Add(dtmsg);
		//	}
		//}



		sql.Close();

		return dset;

	}

	protected void ProcessMeasure(DataRow row, int t, int measureID, string MeasName, string tblname, string studymeasID_csv, string id_csv, string fldpk_csv)
	{
		//returns:
		//
		//
		//



	}


	protected void gridDataLong_OnDataBound(object sender, EventArgs e)
	{
		if (gridDataLong.Columns.Count > 1)
		{
			gridDataLong.Columns[0].FixedStyle = GridViewColumnFixedStyle.Left;
			gridDataLong.Columns[1].FixedStyle = GridViewColumnFixedStyle.Left;
			gridDataLong.Columns[2].FixedStyle = GridViewColumnFixedStyle.Left;
			gridDataLong.Columns[3].FixedStyle = GridViewColumnFixedStyle.Left;
			gridDataLong.Columns[4].FixedStyle = GridViewColumnFixedStyle.Left;
		}
	}


	protected void btnGetStats_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnGetStats_OnClick " + System.DateTime.Now.ToString());
		ProcessStats();
	}

	protected void panelResults_OnCallback(object sender, EventArgs e)
	{
		ProcessStats();
	}


	protected void ProcessStats()
	{ 
		if(Session["proj_data"] != null)
		{
			int nrecs_proj_data = ((DataTable)Session["proj_data"]).Rows.Count;

			if (nrecs_proj_data > 0)
			{
				panelInfo.ClientVisible = true;

				//var chk = chkOptions.SelectedValues;
				var chk = "0";

				DataTable dt = (DataTable)Session["proj_data"];
				List<string> flds = uwac.trk.dataops.GetListString(gridSelVars.GetSelectedFieldValues("fldname"));
				List<string> fldlabels = uwac.trk.dataops.GetListString(gridSelVars.GetSelectedFieldValues("fieldlabel"));

				string levels_row = cboLevelsRow.Value.ToString();
				string levels_col = cboLevelsCol.Value.ToString();

				panelDescStatsCharts.Controls.Clear();

				//Histograms
				if (chkOpt_hist.Checked)
				//if (chk.Contains("Hist"))
				{
					Hist(dt, flds, fldlabels, "timept", levels_row);
				}

				//Desc Stats
				if (chkOpt_desc.Checked)
				{

					//Use the Combobox to populate the pivotgrid Column

					pivotDescStats.Fields["group"].Area = PivotArea.FilterArea;
					pivotDescStats.Fields["txgrp"].Area = PivotArea.FilterArea;
					pivotDescStats.Fields["sex"].Area = PivotArea.FilterArea;

					pivotDescStats.Fields[levels_row].Area = PivotArea.RowArea;
					pivotDescStats.Fields[levels_col].Area = PivotArea.ColumnArea;


					pivotDescStats.DataSource = (DataTable)Session["proj_data_stack"];
					pivotDescStats.DataBind();


					DevExpress.XtraPivotGrid.PivotSummaryDataSource pivot_ds = pivotDescStats.CreateSummaryDataSource();
					DataTable dt_descstats = dxpivot.ConvertSummaryDataSourceToDataTable(pivot_ds);

					//dt_descstats.Columns.Add("SDplus", typeof(double), "Value_Average + Value_StdDev");
					//dt_descstats.Columns.Add("SDminus", typeof(double), "Value_Average - Value_StdDev");

					//DataTable dt2 = dt_descstats.Copy();

					List<DataTable> dts = utilStats.qryGroupBy(dt_descstats, "x", new List<string> { "Variable" });

					double progressInPercent = 0;
					int numtbls = dts.Count;
					for(int i=0; i < numtbls; i++)
					//foreach (DataTable dt1 in dts)
					{
						DataTable dt1 = dts[i];
						progressInPercent = Math.Round(((double)i / numtbls) * 100);

						WebChartControl WebChart = dxpivot.CreateChart(dt1, cboLevelsRow.Value.ToString(), cboLevelsCol.Value.ToString());
						WebChart.Titles.Add(new ChartTitle() { Text = dt1.TableName.ToString() });
						panelDescStatsCharts.Controls.Add(WebChart);
					}
				}



				//Missing Data
				if (chkOpt_miss.Checked)
				{

					pivotMissing.DataSource = (DataTable)Session["proj_data_stack"];
					pivotMissing.DataBind();

				}

				//Data Table - stacked by var
				if (chkOpt_data_stackvar.Checked)
				{
					gridDataStackvar.DataSource = (DataTable)Session["proj_data_stack"];
					gridDataStackvar.DataBind();

				}

				if (chkOpt_data_long.Checked)
				{
					gridDataLong.DataSource = (DataTable)Session["proj_data"];
					gridDataLong.DataBind();
				}



			}

			panelResults.Visible = true;
			ShowHideResults();

			panelResults.JSProperties["cp_isFinished"] = true;
		}

	}


	protected void ShowHideResults()
	{

		splitter_descstats.Visible = (chkOpt_desc.Checked) ? true : false;
		panelCharts.Visible = (chkOpt_hist.Checked) ? true : false;
		panelMissing.Visible = (chkOpt_miss.Checked) ? true : false;
		panelDataStackvar.Visible = (chkOpt_data_stackvar.Checked) ? true : false;
		panelDataLong.Visible = (chkOpt_data_long.Checked) ? true : false;


	}

	protected void Hist(DataTable dt, List<string> flds, List<string> fldlabels, string facetrow_fld, string facetcol_fld)
	{

		for (int i = 0; i < flds.Count; i++)
		{
			progressInPercent = Math.Round(((double)i / flds.Count) * 100);

			string f = flds[i];
			string lbl = fldlabels[i];

			var hist = utilCharts.Histograms_byRowLevel_byColLevel(dt, f, facetrow_fld, facetcol_fld, 400, 250, "", lbl);

			if (hist != null)
			{
				Literal head = new Literal();
				head.Text = String.Format("<h3>{0} {1}</h3>", f, lbl);
				panelCharts.Controls.Add(head);
				panelCharts.Controls.Add(hist);
			}




			var hippy = dt.AsEnumerable().Select(c => c.Field<int?>(flds[i])).ToList();

			var hippy2 = hippy.Histogram(30, BinningMode.ExpandRange);

			//dxpivot.CreateHist()


		}
	}




	#endregion





	protected void clbProgress_Callback(object source, DevExpress.Web.CallbackEventArgs e)
	{
		e.Result = progressInPercent.ToString();
	}

	protected void clbCancel_Callback(object source, DevExpress.Web.CallbackEventArgs e)
	{
		isCancelRequired = true;
	}


}
