using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.XtraPivotGrid;
using DevExpress.Web.ASPxHtmlEditor;
using DevExpress.Web.Data;
using uwac;

public partial class _test_DataProject : System.Web.UI.Page
{

	private bool dataproject_initialized = false;
	private List<int> selected_measlist;
	private List<int> selected_varslist;
	private List<int> selected_subjlist;

	DataTable tbl_selsubj;
	DataTable tbl_selmeas;
	DataTable tbl_selvars;

	private int selected_subjset_pk;



	#region Page Setup
	protected void Page_Init(object sender, EventArgs e)
	{
		Debug.Print("&&&&&&&&&&&&&&&&&&&&& Page_Init " + System.DateTime.Now.ToString() + "&&&&&&&&&&&&&&&&&&&&&");

		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = Master.Master_studyID.ToString();
		ViewState["measNeedBind"] = "true";
		ViewState["varsNeedBind"] = "false";
		ViewState["subjNeedBind"] = "true";

		gridLkupMeas.GridView.CustomUnboundColumnData += gridLkupMeas_CustomUnboundColumnData;
		gridLkupVars.GridView.CustomUnboundColumnData += gridLkupVars_CustomUnboundColumnData;

	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("DataProjects.aspx");
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
			Debug.Print("--- is NOT Postback " + System.DateTime.Now.ToString());
			PrintStatus();
			InitializeSessionVars();
			PrintStatus();


			//Bind Subject Sets
			DataTable dtsets = GetSubjSets();
			cboSubjSet.DataSource = dtsets;
			cboSubjSet.DataBind();

			//Bind the Measures
			DataTable dt = GetAllStudymeas();
			gridLkupMeas.DataSource = Session["meas"];
			gridLkupMeas.DataBind();


			// Not a postback and there is a defined DataProject - preload the selected Measures and Variables
			if (Request.QueryString["pk"] != null)
			{

				LoadDataproject_SelectedItems(Convert.ToInt32(Request.QueryString["pk"].ToString()));
				
				btnUpdate.Visible = true;
				btnNew.Visible = false;
			}
			else
			{
				//Always start fresh if it is not a PostBack and there is no pk
				Debug.Print("   **** Start Fresh - NO PK ****" + System.DateTime.Now.ToString());

				ViewState["measNeedBind"] = "true";
				ViewState["subjNeedBind"] = "true";

				btnUpdate.Visible = false;
				btnNew.Visible = true;
			}
			

			//Bind the Vars if there are selected Measures
			if(Session["selected_measlist"] != null)
			{
				Debug.Print("");
				Debug.Print("   BINDING VARS GRID 0 " + System.DateTime.Now.ToString());
				Debug.Print("");

				//Retrieve Vars to the Session variable because some Measures are selected
				GetVarsForSelectedMeas();
				gridLkupVars.DataBind();

			}
			else {
				Debug.Print("   **** Not Binding VARS yet - no meas selected ****" + System.DateTime.Now.ToString());
				Debug.Print("");
				Session["vars_count"] = "No measures selected yet";
			}
			//RefreshSession_selvars();

			if(Session["selected_varslist"] != null)
			{
				DataTable dtv = (DataTable)Session["tbl_selvars"];

				List<int> selectedvars = (List<int>)Session["selected_varslist"];
				CheckSelectedVars(selectedvars);

				//FIX!
				//if (dtv.Rows.Count > 0)
				//{
				//	Debug.Print("");
				//	Debug.Print("   BINDING Selected VARS GRID -0- " + System.DateTime.Now.ToString());
				//	Debug.Print("");
				//	gridSelVars.DataBind();
				//}
			}
		}

		// IS PostBack
		else
		{
			Debug.Print("--- is Postback " + System.DateTime.Now.ToString());
			PrintStatus();

			ViewState["measNeedBind"] = "false";
			ViewState["subjNeedBind"] = "false";

			if (Session["tbl_selmeas"] != null)
			{
				Debug.Print("");
				Debug.Print("   BINDING MEAS GRID 1 " + System.DateTime.Now.ToString());
				Debug.Print("");
				gridLkupMeas.DataBind();


				Debug.Print("");
				Debug.Print("   BINDING VARS GRID 1 " + System.DateTime.Now.ToString());
				Debug.Print("");
				gridLkupVars.DataBind();
			}
			else
			{
				Debug.Print("   **** Not Binding VARS yet - no meas selected ****" + System.DateTime.Now.ToString());
				Debug.Print("");
				Session["vars_count"] = "No measures selected yet";
			}

			if (Session["tbl_selvars"] != null)
			{
				DataTable dtv = (DataTable)Session["tbl_selvars"];

				if (dtv.Rows.Count > 0)
				{
					Debug.Print("");
					Debug.Print("   BINDING Selected VARS GRID -1- " + System.DateTime.Now.ToString());
					Debug.Print("");
					gridSelVars.DataBind();
				}

			}

		}


		//Set_Private_Vars_of_selected_items();

		#region Process visibility 
		
		ShowSelected("subj");

		ShowSelected("meas");

		ShowSelected("vars");

		#endregion

		if(Session["vars_count"] != null) lblVarsTOTAL.Text = Session["vars_count"].ToString();


		int n_selsubj = (Session["tbl_selsubj"] != null) ? ((DataTable)Session["tbl_selsubj"]).Rows.Count : 0;
		int n_selmeas = (Session["tbl_selmeas"] != null) ? ((DataTable)Session["tbl_selmeas"]).Rows.Count : 0;
		int n_selvars = (Session["tbl_selvars"] != null) ? ((DataTable)Session["tbl_selvars"]).Rows.Count : 0;

		lblStatus.Text = String.Format("This project has {0} subjects, {1} measures, {2} vars saved.", n_selsubj.ToString(), n_selmeas.ToString(), n_selvars.ToString());

		Debug.Print("   --- Page_Load complete " + System.DateTime.Now.ToString());
		
	}
	#endregion

	protected void InitializeSessionVars()
	{
		Session["tbl_selsubj"] = null;
		Session["tbl_selmeas"] = null;
		Session["tbl_selvars"] = null;
		Session["vars_count"] = null;
		Session["vars"] = null;
		Session["meas"] = null;

		Session["selected_subjlist"] = null;
		Session["selected_varslist"] = null;
		Session["selected_measlist"] = null;

	}


	protected void ShowSelected(string type)
	{
		if(type == "subj")
		{
			if (selected_subjset_pk == 0 & cboSubjSet.Value != null) selected_subjset_pk = Convert.ToInt32(cboSubjSet.Value);

			if (selected_subjset_pk > 0)
			{

				if (Session["tbl_selsubj"] == null)
				{
					DataTable dt = GetSelectedSubjects(selected_subjset_pk);
					Session["tbl_selsubj"] = dt;
				}

				if (((DataTable)Session["tbl_selsubj"]).Rows.Count > 0)
				{
					PivotSelSubj.DataSource = (DataTable)Session["tbl_selsubj"];
					PivotSelSubj.DataBind();
					PivotSelSubj.Visible = true;
					title_pivSubj.Visible = true;
				}

			}
			else
			{
				PivotSelSubj.Visible = false;
				title_pivSubj.Visible = false;
			}


		}
		else if (type=="meas")
		{
			if (Session["selected_measlist"] != null)
			{
				if (((List<int>)Session["selected_measlist"]).Count > 0)
				{
					RefreshSession_selmeas();
					PivotSelMeas.DataSource = (DataTable)Session["tbl_selmeas"];
					PivotSelMeas.DataBind();
					string txt = String.Format("({0} selected)", ((DataTable)Session["tbl_selmeas"]).Rows.Count);
					//string txt = String.Format("({0} selected)", selected_measlist.Count);
					selmeas_n.Text = txt;
					PivotSelMeas.Visible = true;
					title_pivMeas.Visible = true;


					//Check if vars have been loaded yet
					if (Session["vars"] != null)
					{
						Debug.Print("");
						Debug.Print("   BINDING VARS GRID 2 " + System.DateTime.Now.ToString());
						Debug.Print("");
						//DataTable dtv = GetVarsForSelectedMeas();
						gridLkupVars.DataSource = Session["vars"];
						gridLkupVars.DataBind();
					}
				}
			}
			else
			{
				PivotSelMeas.Visible = false;
				title_pivMeas.Visible = false;

			}
		}

		else if (type=="vars")
		{
			if (Session["selected_varslist"] != null)
			{
				RefreshSession_selvars();
				gridSelVars.DataBind();
				string txt = String.Format("({0} selected)", ((DataTable)Session["tbl_selvars"]).Rows.Count);
				selvars_n.Text = txt;
				gridSelVars.Visible = true;
				title_pivVar.Visible = true;
				btnExpand.Visible = false;
				btnCollapse.Visible = false;
			}
			else
			{
				gridSelVars.Visible = false;
				title_pivVar.Visible = false;
				btnExpand.Visible = false;
				btnCollapse.Visible = false;

			}
		}
	}

	protected void PrintStatus()
	{
		int n_selsubj = (Session["tbl_selsubj"] != null) ? ((DataTable)Session["tbl_selsubj"]).Rows.Count : 0;
		int n_selmeas = (Session["tbl_selmeas"] != null) ? ((DataTable)Session["tbl_selmeas"]).Rows.Count : 0;
		int n_selvars = (Session["tbl_selvars"] != null) ? ((DataTable)Session["tbl_selvars"]).Rows.Count : 0;

		//int n_subj = (Session["subj"] != null) ? ((DataTable)Session["subj"]).Rows.Count : 0;
		int n_meas = (Session["meas"] != null) ? ((DataTable)Session["meas"]).Rows.Count : 0;
		int n_vars = (Session["vars"] != null) ? ((DataTable)Session["vars"]).Rows.Count : 0;


		int grid_n_meas = gridLkupMeas.GridView.VisibleRowCount;
		int grid_n_vars = gridLkupVars.GridView.VisibleRowCount;

		Debug.Print("");
		Debug.Print("Session tbl_selsubj = " + n_selsubj.ToString() + "   " + System.DateTime.Now.ToString());
		Debug.Print("Session tbl_selmeas = " + n_selmeas.ToString() + "   " + System.DateTime.Now.ToString());
		Debug.Print("Session tbl_selvars = " + n_selvars.ToString() + "   " + System.DateTime.Now.ToString());
		//Debug.Print("Session        subj = " + n_subj.ToString() + "   " + System.DateTime.Now.ToString());
		Debug.Print("Session        meas = " + n_meas.ToString() + "   " + System.DateTime.Now.ToString());
		Debug.Print("Session        vars = " +    n_vars.ToString() + "   " + System.DateTime.Now.ToString());
		Debug.Print("Grid           meas = " + grid_n_meas.ToString() + "   " + System.DateTime.Now.ToString());
		Debug.Print("Grid           vars = " + grid_n_vars.ToString() + "   " + System.DateTime.Now.ToString());
		Debug.Print("");


	}

	protected void LoadDataproject_SelectedItems(int pk)
	{
		//if (!dataproject_initialized)
		//{

		SQL_utils sql = new SQL_utils("data");

		int studyID = sql.IntScalar_from_SQLstring("select studyID from dp.DataProject where dataproj_pk = " + pk.ToString());

		if (Master.Master_studyID != studyID)
		{
			Master.Master_studyID = studyID;
		}

		DataTable dtProj = sql.DataTable_from_SQLstring("select * from dp.DataProject where dataproj_pk = " + pk.ToString());
		txtTitle.Text = dtProj.Rows[0]["projTitle"].ToString();
		txtSummary.Text = dtProj.Rows[0]["projSummary"].ToString();

		HtmlEditor.Html = dtProj.Rows[0]["projSummary"].ToString();



		string subjset_pk_txt = dtProj.Rows[0]["subjset_pk"].ToString();
		int selected_subjset_pk;
		bool result = Int32.TryParse(subjset_pk_txt, out selected_subjset_pk);
		if (result)
		{
			GetSelectedSubjects(selected_subjset_pk);
		}

		
		DataTable dtm = sql.DataTable_from_SQLstring("select studymeasID from dp.Meas where dataproj_pk = " + pk.ToString());
		selected_measlist = dtm.AsEnumerable().Select(f => f.Field<int>("studymeasID")).ToList();


		DataTable dtv = sql.DataTable_from_SQLstring("select fldpk from dp.Var where dataproj_pk = " + pk.ToString());
		selected_varslist = dtv.AsEnumerable().Select(f => f.Field<int>("fldpk")).ToList();


		DataTable dts = sql.DataTable_from_SQLstring("select * from uwautism_research_backend..vwMasterStatus_S_txgrp a " +
			" join (select * from dp.Grp where dataproj_pk = " + pk.ToString() + " ) b ON a.groupID=b.groupID and a.subjstatusID=b.subjstatusID ");
		selected_subjlist = dts.AsEnumerable().Select(f => f.Field<int>("subjID")).ToList();

		sql.Close();

		//Set the UI controls
		foreach (ListEditItem i in cboSubjSet.Items) 
		{
			if(i.Value.ToString() == selected_subjset_pk.ToString())
			{
				i.Selected = true;
			}
		}
		CheckSelectedMeas(selected_measlist);
		CheckSelectedVars(selected_varslist);

		
		Session["selected_subjlist"] = selected_subjlist;
		Session["selected_varslist"] = selected_varslist;
		Session["selected_measlist"] = selected_measlist;

		//	dataproject_initialized = true;
		//}


	}



	#region Callbacks
	protected void pivotSubjCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  pivotSubjCallback_OnCallback " + System.DateTime.Now.ToString());

		DataTable dt = GetSelectedSubjects(Convert.ToInt32(cboSubjSet.Value.ToString()));

		Session["tbl_selsubj"] = dt;

		PivotSelSubj.DataSource = (DataTable)Session["tbl_selsubj"];
		PivotSelSubj.DataBind();

	}


	protected void pivotMeasCallback_OnCallback (object sender, EventArgs e)
	{
		Debug.Print("");
		Debug.Print("  $$  pivotMeasCallback_OnCallback " + System.DateTime.Now.ToString());
		Debug.Print("");

		RefreshSession_selmeas();
		PivotSelMeas.DataSource = (DataTable)Session["tbl_selmeas"];
		PivotSelMeas.DataBind();

		PivotSelMeas.ReloadData();


		var selmeas = gridLkupMeas.GridView.GetSelectedFieldValues(gridLkupMeas.KeyFieldName);
		selected_measlist = selmeas.ConvertAll(x => Convert.ToInt32(x));

		//gridLkupVars.DataSource = Session["vars"];
		//gridLkupVars.DataBind();

		//DataTable dtv = GetVarsForSelectedMeas();
		//Session["vars"] = dtv;
		//gridLkupVars.DataSource = dtv;
		//gridLkupVars.DataBind();

		//RefreshSession_selvars();
		//gridSelVar.DataSource = (DataTable)Session["tbl_selvars"];
		//gridSelVar.DataBind();

		//PrintStatus();
	}

	protected void varCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("");
		Debug.Print("  $$  varCallback_OnCallback " + System.DateTime.Now.ToString());
		Debug.Print("");

		gridLkupVars.DataBind();
	}


	protected void pivotVarsCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("");
		Debug.Print("  $$  pivotVarsCallback_OnCallback " + System.DateTime.Now.ToString());
		Debug.Print("");


		RefreshSession_selvars();
		gridSelVars.DataSource = (DataTable)Session["tbl_selvars"];
		gridSelVars.DataBind();

		ShowSelected("vars");


		var selvars = gridLkupVars.GridView.GetSelectedFieldValues(gridLkupVars.KeyFieldName);
		selected_varslist = selvars.ConvertAll(x => Convert.ToInt32(x));


		//PrintStatus();
	}

	#endregion


	#region User Controls
	protected void btnUpdate_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnUpdate_OnClick " + System.DateTime.Now.ToString());

		//Validate
		string title = txtTitle.Text;

		if (String.IsNullOrWhiteSpace(title) )
		{
			
		}


		int newdataproj_pk = UpdateDataproject();

		Response.Redirect("DataProject.aspx?pk=" + newdataproj_pk.ToString());


		//SQL_utils sql = new SQL_utils("data");
		//sql.Close();
	}

	protected void TitleTextBox_Validation(object sender, ValidationEventArgs e)
	{
		if ((e.Value as string).Length < 2)
			e.IsValid = false;
	}


	protected void btnSets_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnSets_OnClick " + System.DateTime.Now.ToString());

		Response.Redirect("SubjSets.aspx");
	}

	protected void btnProjects_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnSets_OnClick " + System.DateTime.Now.ToString());

		Response.Redirect("DataProjects.aspx");
	}

	protected void btnExploreProject_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnExploreProject_OnClick " + System.DateTime.Now.ToString());
		Response.Redirect("DataProjectExplore.aspx?pk=" + Request.QueryString["pk"]);
	}

	#endregion



	#region Subject Sets Dropdown

	protected void cboSubjSet_DataBound(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils("backend");

		int nsubj = sql.IntScalar_from_SQLstring("select count(*) n from vwMasterStatus_S where studyID = " + Master.Master_studyID.ToString());

		lblSubj.Text = nsubj.ToString() + " total subjects";

		sql.Close();
	}


	protected void cboSubjSet_SelectedIndexChanged(object sender, EventArgs e)
	{
		Debug.Print("cboSubjSet_SelectedIndexChanged" + System.DateTime.Now.ToString());

		//ViewState["subjNeedBind"] = "true";
		//int set = Convert.ToInt32(cboSubjSet.Value.ToString());
		//GetSelectedSubjects(set);
	}
	#endregion 
	

	#region Measures Dropdown
	protected void gridLkupMeas_DataBinding(object sender, EventArgs e)
	{
		Debug.Print("gridLkupMeas_DataBinding " + System.DateTime.Now.ToString());
		gridLkupMeas.DataSource = Session["meas"];

		lblMeasTOTAL.Text = ((DataTable)Session["meas"]).Rows.Count.ToString() + " total measures";

	}


	protected void gridLkupMeas_OnDataBound(object sender, EventArgs e)
	{
		Debug.Print("gridLkupMeas_OnDataBound " + System.DateTime.Now.ToString());

		//string datasrc = gridLkupMeas.GridView.DataSource.ToString();
		//Debug.Print(String.Format("datasrc=[{0}]", datasrc));
	}


	protected void CheckSelectedMeas(List<int> measlist)
	{
		ASPxGridView grid = (ASPxGridView)gridLkupMeas.GridView;

		//Remove any filter before selecting rows
		if (grid.Settings.ShowFilterRow) grid.FilterExpression = string.Empty;

		var nrow_visible = (int)grid.VisibleRowCount;

		int n_total_meas = ((DataTable)Session["meas"]).Rows.Count;

		int sel = 0;
		int unsel = 0;
		Debug.Print("");
		Debug.Print("   CHECK MEAS");
		Debug.Print(String.Format("   nrow_visible={0}  n_total_meas={1}", nrow_visible.ToString(), n_total_meas.ToString()));


		for (int i = 0; i < n_total_meas; i++)
		{
			var row = grid.GetRow(i);
			int rowpk = Convert.ToInt32(grid.GetRowValues(i, "studymeasID").ToString());
			if (measlist.Contains(rowpk))
			{
				grid.Selection.SelectRow(i);
				sel++;
			}
			else
			{
				grid.Selection.UnselectRow(i);
				unsel++;
			}
		}

		Debug.Print(String.Format("   sel={0}  unsel={1}", sel.ToString(), unsel.ToString()));
		Debug.Print("");
	}

	protected void gridLkupMeas_OnValueChanged(object sender, EventArgs e)
	{
		Debug.Print("gridLkupMeas_OnValueChanged " + System.DateTime.Now.ToString());

		var selmeas = gridLkupMeas.GridView.GetSelectedFieldValues(gridLkupMeas.KeyFieldName);
		ViewState["selmeas_n"] = selmeas.Count;

		ViewState["varsNeedBind"] = "true";

		RefreshSession_selmeas();
		PivotSelMeas.DataSource = (DataTable)Session["tbl_selmeas"];
		PivotSelMeas.DataBind();

		//Update the available vars to select 
		DataTable dt = GetVarsForSelectedMeas();
		//gridLkupVars.DataSource = dt;
		//gridLkupVars.DataBind();

	}

	#endregion


	#region Variables Dropdown

	protected void gridLkupVars_DataBinding(object sender, EventArgs e)
	{
		Debug.Print("gridLkupVars_DataBinding " + System.DateTime.Now.ToString() + "  varsNeedBind=" + ViewState["varsNeedBind"].ToString());

		gridLkupVars.DataSource = Session["vars"];


		int n_selmeas = gridLkupMeas.GridView.GetSelectedFieldValues(gridLkupMeas.KeyFieldName).ToList().Count;
		string vars_count = ((DataTable)Session["vars"]).Rows.Count.ToString() + " variables, in " + n_selmeas.ToString() + " measures";
		lblVarsTOTAL.Text = vars_count;
		

	}


	protected void gridLkupVars_OnDataBound(object sender, EventArgs e)
	{
		Debug.Print("gridLkupVars_OnDataBound " + System.DateTime.Now.ToString());

	}


	protected void gridLkupVars_OnValueChanged(object sender, EventArgs e)
	{
		Debug.Print("");
		Debug.Print("gridLkupVars_OnValueChanged " + System.DateTime.Now.ToString());
		Debug.Print("");

		var selvars = gridLkupVars.GridView.GetSelectedFieldValues(gridLkupVars.KeyFieldName);
		selected_varslist = selvars.ConvertAll(x => Convert.ToInt32(x));
		ViewState["selvars_n"] = selvars.Count;

		//ViewState["varsNeedBind"] = "true";

		RefreshSession_selvars();

		DataTable check_dt = (DataTable)Session["tbl_selvars"];
		int n = check_dt.Rows.Count;

		gridSelVars.DataBind();

		ShowSelected("vars");
		

	}

	#endregion



	#region Grid to display Selected Variables

	protected void gridSelVars_OnDataBinding(object sender, EventArgs e)
	{
		Debug.Print("gridSelVars_OnDataBinding " + System.DateTime.Now.ToString() + "  varsNeedBind=" + ViewState["varsNeedBind"].ToString());

		DataTable dt = (DataTable)Session["tbl_selvars"];
		gridSelVars.DataSource = dt;

	}


	protected void gridSelVars_OnCustomCallback(object sender, EventArgs e)
	{
		Debug.Print("");
		Debug.Print("  $$  gridSelVars_OnCustomCallback " + System.DateTime.Now.ToString());
		Debug.Print("");

		

		//PrintStatus();
	}

	
	protected void gridSelVars_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
	{
		
	}

	#endregion



	protected void CheckSelectedVars(List<int> pks)
	{
		ASPxGridView grid = (ASPxGridView)gridLkupVars.GridView;
		grid.Selection.UnselectAll();


		foreach (int i in pks)
		{
			grid.Selection.SelectRowByKey(i);
		}

	}
	

	//Update the Session variable based on what is currently selected
	//Call right before we bind the PivotTable 
	protected void RefreshSession_selmeas()
	{
		Debug.Print("RefreshSession_selmeas " + System.DateTime.Now.ToString());
		DataTable meas = (DataTable)Session["meas"];
		var selmeas = gridLkupMeas.GridView.GetSelectedFieldValues(gridLkupMeas.KeyFieldName).ToList();
		
		if (selmeas.Count > 0)
		{
			var selmeasinfo =
				from a in meas.AsEnumerable()
				where selmeas.Any(x => a.Field<int>("studymeasID").ToString().Contains(x.ToString()))
				select a;
			DataView selmeasinfo2 = selmeasinfo.AsDataView();
			Session["tbl_selmeas"] = selmeasinfo2.ToTable();
		}
		//PrintStatus();
	}

	protected void RefreshSession_selvars()
	{
		Debug.Print("RefreshSession_selvars " + System.DateTime.Now.ToString());
		DataTable vars = (DataTable)Session["vars"];
		var selvars = gridLkupVars.GridView.GetSelectedFieldValues(gridLkupVars.KeyFieldName).ToList();
		if (selvars.Count > 0)
		{
			var selvarinfo =
				from a in vars.AsEnumerable()
				where selvars.Any(x => a.Field<int>("fldpk").ToString().Contains(x.ToString()))
				select a;
			DataView selvarinfo2 = selvarinfo.AsDataView();
			Session["tbl_selvars"] = selvarinfo2.ToTable();
			Session["selected_varslist"] = selvars;
		}
		//PrintStatus();
	}








	#region PivotTable of Selected Measures	

	protected void PivotSelMeas_OnDataBinding(object sender, EventArgs e)
	{
		int x = 0;

	}

	protected void PivotSelMeas_Concat(object sender, PivotGridCustomSummaryEventArgs e)
	{
		Debug.Print("ENTER PivotSelMeas_Concat");
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

			string newtext = row["studymeasname"].ToString();
			string isREL = row["isREL"].ToString();

			if (isREL == "REL")
			{
				newtext = String.Format(@"<p style=""background-color: gold; display:inline; text-align: right;"">{0}</p>", newtext);
			}

			concat = String.Format("{0}{1}{2}", concat, sep, newtext);
			//// Get the order's total sum.
			//decimal orderSum = (decimal)row[fieldExtendedPrice];
			//if (orderSum >= minSum) order500Count++;
		}

		if (ds.RowCount > 0)
		{
			e.CustomValue = concat;
		}
		Debug.Print("EXIT PivotSelMeas_Concat");

	}

	#endregion



	#region Retrieve data from DB


	protected DataTable GetSubjSets()
	{


		string sqlcode = "select a.subjset_pk, a.studyID, a.subjset, a.subjsetdetails, 'N = ' + cast(count(*) as varchar) as nsubj, a.created, a.createdBy " +
			" from dp.SubjSet a " +
			" join dp.Subj b ON a.subjset_pk = b.subjset_pk " +
			" where studyID = " + Master.Master_studyID.ToString() +
			" group by a.subjset_pk, a.studyID, a.subjset, a.subjsetdetails, a.created, a.createdBy ";


		SQL_utils sql = new SQL_utils("data");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		sql.Close();
		return dt;

	}

	protected DataTable GetAllStudymeas()
	{
		string sqlcode = "select * from ( " +
			" select coalesce(s.fullstudyID*10000, a.studyID) studyIDfull, studyname, a.studyID, measname, a.measureID " +
			"  , a.studymeasID, (case when dbo.fnIsREL(a.studymeasID) = 1 then 'REL' else '' end) isREL, studymeasname " +
			"  , a.timepointID, timepoint, timepoint_text, meascat " +
			"  from  " +
			"  (select studyID, studymeasID, measureID, studymeasname, timepointID from uwautism_research_backend..tblstudymeas where measureID <> 749 ) a " +
			"  left join uwautism_research_backend..tblstudy s ON a.studyID = s.studyID " +
			"  join uwautism_research_backend..tblmeasure b ON a.measureID = b.measureID " +
			"  join uwautism_research_backend..tbltimepoint c ON a.timepointID = c.timepointID " +
			"  left join uwautism_research_backend..tblMeasureCat_Lkup d ON b.MeasCatID = d.MeasCatID " +
			" ) x " +
			" where studyIDfull = " + Master.Master_studyIDfull.ToString();

		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		Session["meas"] = dt;
		sql.Close();
		return dt;


	}


	//We never need to get all the subjects, only those in the selected set
	protected DataTable GetSelectedSubjects(int subjset_pk)
	{
		Debug.Print("GetSelectedSubjects " + System.DateTime.Now.ToString());
		string sqlcode = "select subjID, id, groupname as [Group], coalesce(txgrp, '**NA**') txgrp, subjstatus, subjstatusdetail, sex,  " +
		"coalesce(ethnicitydesc, 'UNKNOWN') as race, coalesce(hispanicdesc, 'UNKNOWN') as ethnicity " +
		", subjNotes, convert(VARCHAR, txstart, 101) txstart, txstartnote " +
		"from uwautism_research_backend..vwMasterStatus_S_txgrp a where studyID = " + Master.Master_studyID.ToString() +
		" and subjID in (select subjID from dp.Subj  where subjset_pk = " + subjset_pk.ToString() + ") ";


		SQL_utils sql = new SQL_utils("data");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		sql.Close();
		return dt;

	}

	protected DataTable GetVarsForSelectedMeas()
	{

		var meas_csv = uwac.trk.dataops.GetCSV(gridLkupMeas.GridView.GetSelectedFieldValues(gridLkupMeas.KeyFieldName));


		SQL_utils sql = new SQL_utils("data");

		string sqlcode = "select * from (select fldpk, b.measureID, measname, fldname, fieldlabel, (case when fieldvaluesetid > 0  and InAnalysis > 0 then 'X-categ' " +
			" when fielddatatype in ('smallint','numeric','int','float','bigint','decimal') and InAnalysis > 0 then 'X-contin' " +
			" when fielddatatype in ('char','varchar','nvarchar') and InAnalysis>0 then 'X-categ' " +
			" else '' end) CoreVar " +
			" , (case when fielddatatype in ('char','varchar','nvarchar') then 'text' " +
			"         when fielddatatype in ('date','datetime','smalldatetime') then 'date' " +
			"         when fielddatatype in ('smallint','numeric','int','float','bigint','decimal') then ' num' else '' end) Type" +
			" from def.fld a " +
			" join def.tbl b ON a.tblpk = b.tblpk " +
			" join uwautism_research_backend..tblmeasure c ON b.measureID = c.measureID " +
			" where b.measureID in (select measureID from uwautism_research_backend..tblstudymeas where studymeasID in (" + meas_csv + ")) " + 
			" and fldname not in ('id','indexnum','studymeasID','created','createdby','updated','updatedby','scored','scoredby','verified')" + 
			" ) x " +
			"order by CoreVar desc, measname, Type, fldname";
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
		sql.Close();

		Session["vars"] = dt;

		int nvars = dt.Rows.Count;
		int nmeas = gridLkupMeas.GridView.GetSelectedFieldValues(gridLkupMeas.KeyFieldName).ToList().Count;

		//Session["vars_info"] = 
		Debug.Print("");
		Debug.Print("   LOADING VARS INTO SESSION " + System.DateTime.Now.ToString());
		Debug.Print("");

		return dt;
	}


	protected int UpdateDataproject()
	{

		var meas_csv = uwac.trk.dataops.GetCSV(gridLkupMeas.GridView.GetSelectedFieldValues(gridLkupMeas.KeyFieldName));
		var var_csv = uwac.trk.dataops.GetCSV(gridLkupVars.GridView.GetSelectedFieldValues(gridLkupVars.KeyFieldName));

		string pk = (Request.QueryString["pk"] != null) ? Request.QueryString["pk"] : "0";

		SQL_utils sql = new SQL_utils("data");
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("dataproj_pk", pk, "int"));
		ps.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
		ps.Add(sql.CreateParam("subjset_pk", cboSubjSet.Value.ToString(), "int"));
		ps.Add(sql.CreateParam("projTitle", txtTitle.Text, "text"));
		ps.Add(sql.CreateParam("projSummary", HtmlEditor.Html, "text"));
		ps.Add(sql.CreateParam("supervisor_staffID", "0", "int"));
		ps.Add(sql.CreateParam("sel_meas", meas_csv, "text"));
		ps.Add(sql.CreateParam("sel_vars", var_csv, "text"));

		ps.Add(sql.CreateParam("out", "", "int", "output"));

		int newdataproj_pk = sql.NonQuery_from_ProcName("dp.spDataProject_UPDATE2", ps, "out");

		sql.Close();

		return newdataproj_pk;
	}
	#endregion 


	
	private void gridLkupMeas_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
	{
		if (e.Column.FieldName == "IsSelected")
		{
			ASPxGridView grid = (ASPxGridView)sender;
			e.Value = (grid.Selection.IsRowSelectedByKey(e.GetListSourceFieldValue("studymeasID"))) ? "X" : "";
		}
	}
	private void gridLkupVars_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
	{
		//Debug.Print("x");
		string col = e.Column.FieldName;
		int idx = e.ListSourceRowIndex;

		if (e.Column.FieldName == "IsSelected")
		{
			ASPxGridView grid = (ASPxGridView)sender;
			e.Value = (grid.Selection.IsRowSelectedByKey(e.GetListSourceFieldValue("fldpk"))) ? "X" : "";
		}
	}


}