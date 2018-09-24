using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using DevExpress.Web.Data;
using uwac;
using uwac.data;
using uwac.trk;
using System.ComponentModel;


public partial class DataProject_Edit : BasePage //System.Web.UI.Page
{

	private bool dataproject_initialized = false;
	private List<int> selected_measlist;
	private List<int> selected_varslist;
	private List<int> selected_subjlist;
	private List<string> selected_inthxlist;

	private int selected_subjset_pk;



	#region Page Setup
	protected void Page_Init(object sender, EventArgs e)
	{
		Debug.Print("&&&&&&&&&&&&&&&&&&&&& Page_Init " + System.DateTime.Now.ToString() + "&&&&&&&&&&&&&&&&&&&&&");

		this.Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = this.Master.Master_studyID.ToString();
		Session["studyIDfull"] = this.Master.Master_studyIDfull.ToString();
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


			Debug.Print("--- is NOT Postback " + System.DateTime.Now.ToString());
			PrintStatus();
			InitializeSessionVars();
			PrintStatus();

			//Bind Subject Sets
			DataTable dtsets = uwac.trk.dataops.GetSubjSets(Master.Master_studyID);
			cboSubjSet.DataSource = dtsets;
			cboSubjSet.DataBind();
			Session["subjsets"] = dtsets;

			//Bind the Measures
			DataTable dt = uwac.trk.dataops.GetAllStudymeas(Request.QueryString["pk"], Master.Master_studyIDfull);
			gridSelMeas.DataSource = dt;
			gridSelMeas.DataBind();
			Session["meas"] = dt;

			//Bind the IntHx
			DataTable dtinthx = uwac.trk.dataops.GetAllIntHxTimept(Request.QueryString["pk"], Master.Master_studyIDfull);
			gridSelIntHx.DataSource = dtinthx;
			gridSelIntHx.DataBind();
			Session["inthx"] = dtinthx;

			// Not a postback and there is a defined DataProject - preload the selected Measures and Variables
			if (Request.QueryString["pk"] != null)
			{

				lbl0.Text = "Edit Data Project";
				lblPK.Text = "#" + Request.QueryString["pk"];

				LoadDataproject_SelectedItems(Convert.ToInt32(Request.QueryString["pk"].ToString()));
				btnUpdate.Visible = true;
				btnNew.Visible = false;


			}
			else
			{
				//Always start fresh if it is not a PostBack and there is no pk
				Debug.Print("   **** Start Fresh - NO PK ****" + System.DateTime.Now.ToString());

				lbl0.Text = "Create Data Project";
				lblPK.Text = "";
				btnUpdate.Visible = false;
				btnNew.Visible = true;


				txtTitle.Text = "** Enter Title Here **";
				HtmlEditor.Html = "** Enter Summary Here **  <br/>** Then select:<br/> - set of subjects<br/> - measures<br/> - variables<br/><br/><i>Click the Full Screen button (upper right icon or F11) to expand this editor.</i>";
				HtmlEditor.ActiveView = DevExpress.Web.ASPxHtmlEditor.HtmlEditorView.Design;

			}

			SetRowFilterMenuToContains(gridSelMeas);
			SetRowFilterMenuToContains(gridSelVars);
		}

		// IS PostBack
		else
		{
			Debug.Print("--- is Postback " + System.DateTime.Now.ToString());
			PrintStatus();


			if (Session["meas"] != null & Session["proj_meas"] == null)
			{
				gridSelMeas.DataSource = Session["meas"];
				gridSelMeas.DataBind();
			}

			if (Session["proj_subj"] != null)
			{
				PivotSelSubj.DataSource = Session["proj_subj"];
				PivotSelSubj.DataBind();
			}

			if (Session["subjsets"] != null)
			{

				//fix?
				cboSubjSet.DataSource = Session["subjsets"];
				cboSubjSet.DataBind();
			}

			if (Session["meas"] != null )
			{
				gridSelMeas.DataSource = Session["meas"];
				gridSelMeas.DataBind();
			}
			if (Session["proj_meas"] != null)
			{ 
				PivotSelMeas.DataSource = Session["proj_meas"];
				PivotSelMeas.DataBind();
				PivotSelMeas.Visible = true;
			}
			else
			{
				Debug.Print("   **** Not Binding VARS yet - no meas selected ****" + System.DateTime.Now.ToString());
				Debug.Print("");
			}

			if (Session["inthx"] != null & Session["proj_inthx"] != null)
			{
				gridSelIntHx.DataSource = Session["inthx"];
				gridSelIntHx.DataBind();

				PivotSelIntHx.DataSource = Session["proj_inthx"];
				PivotSelIntHx.DataBind();
				PivotSelIntHx.Visible = true;
			}


			if (Session["vars"] != null)
			{
				gridSelVars.DataSource = Session["vars"];
				gridSelVars.DataBind();
			}

			if(Session["proj_vars"] != null)
			{
				gridProjVars.DataSource = Session["proj_vars"];
				gridProjVars.DataBind();
				gridProjVars.Visible = true;
			}
		


		}


		int n_proj_subj = (Session["proj_subj"] != null) ? ((DataTable)Session["proj_subj"]).Rows.Count : 0;
		int n_proj_meas = (Session["proj_meas"] != null) ? ((DataTable)Session["proj_meas"]).Rows.Count : 0;
		int n_proj_vars = (Session["proj_vars"] != null) ? ((DataTable)Session["proj_vars"]).Rows.Count : 0;
		int n_proj_data = (Session["proj_data"] != null) ? ((DataTable)Session["proj_data"]).Rows.Count : 0;
		int n_proj_inthx = (Session["n_proj_inthx"] != null) ? ((DataTable)Session["n_proj_inthx"]).Rows.Count : 0;


		lblStatus.Text = String.Format("This project has {0} subjects, {1} measures, {2} vars saved.", n_proj_subj.ToString(), n_proj_meas.ToString(), n_proj_vars.ToString());



		selsubj_n.Text = String.Format("({0} selected)", n_proj_subj);


		selmeas_n.Text = String.Format("({0} selected)", gridSelMeas.GetSelectedFieldValues("studymeasID").Count);
		selmeas_n2.Text = String.Format("({0} selected)", gridSelMeas.GetSelectedFieldValues("studymeasID").Count);
		selvars_n.Text = String.Format("({0} selected)", gridSelVars.GetSelectedFieldValues("fldpk").Count);
		selvars_n2.Text = String.Format("({0} selected)", gridSelVars.GetSelectedFieldValues("fldpk").Count);


		PivotSelSubj.Visible = (n_proj_subj > 0) ? true : false;
		PivotSelMeas.Visible = (gridSelMeas.GetSelectedFieldValues("studymeasID").Count > 0) ? true : false;
		gridProjVars.ClientVisible = (gridSelVars.GetSelectedFieldValues("fldpk").Count > 0) ? true : false;

		PivotSelIntHx.Visible = (gridSelIntHx.GetSelectedFieldValues("timept").Count > 0) ? true : false;


		PrintStatus();
		Debug.Print("   --- Page_Load complete " + System.DateTime.Now.ToString());

	}
	#endregion

	protected void InitializeSessionVars()
	{
		Debug.Print("  **  InitializeSessionVars ");
		
		Session["meas"] = null;
		Session["vars"] = null;
		Session["inthx"] = null;

		Session["proj_subj"] = null;
		Session["proj_meas"] = null;
		Session["proj_vars"] = null;
		Session["proj_data"] = null;
		Session["proj_data_stack"] = null;
		Session["proj_infomsg"] = null;
		Session["proj_inthx"] = null;

		Session["selected_subjlist"] = null;
		Session["selected_varslist"] = null;
		Session["selected_measlist"] = null;
		Session["selected_inthxlist"] = null;
		
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

			Debug.Print("");
		}


	}


	protected void LoadDataproject_SelectedItems(int pk)
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
		txtTitle.Text = dtProj.Rows[0]["projTitle"].ToString();
		HtmlEditor.Html = dtProj.Rows[0]["projSummary"].ToString();


		#region Selected Subjects
		string subjset_pk_txt = dtProj.Rows[0]["subjset_pk"].ToString();
		int selected_subjset_pk;
		bool result = Int32.TryParse(subjset_pk_txt, out selected_subjset_pk);
		if (result)
		{
			DataTable dts = uwac.trk.dataops.GetSelectedSubjects(selected_subjset_pk, Master.Master_studyID);
			cboSubjSet.SelectedItem = cboSubjSet.Items.FindByValue(selected_subjset_pk.ToString());

			if (dts.Rows.Count > 0)
			{
				selected_subjlist = dts.AsEnumerable().Select(f => f.Field<int>("subjID")).ToList();
				Session["selected_subjlist"] = selected_subjlist;
				Session["proj_subj"] = dts;

				PivotSelSubj.DataSource = Session["proj_subj"];
				PivotSelSubj.DataBind();

				selsubj_n.Text = String.Format("({0} selected)", dts.Rows.Count.ToString());
			}

		}
		#endregion

		#region Selected Measures
		string sqlm = "select a.StudyMeasName, a.studymeasID, MeasName, a.measureID, Category, timepoint_text TimePt, tblname" +
			", dbo.fnStudymeas_IsREL(studymeasID) as isREL  " +
			" from uwautism_research_backend..vwStudyMeas a " +
			" left join def.tbl b ON a.measureID = b.measureID " +
			" where a.studymeasID in " +
			" (select  studymeasID from dp.Meas where  measureID not in (815,816,817,819) and dataproj_pk = " + pk.ToString() + ")";


		DataTable dt_selm = sql.DataTable_from_SQLstring(sqlm);

		if (dt_selm.Rows.Count > 0)
		{
			selected_measlist = dt_selm.AsEnumerable().Select(f => f.Field<int>("studymeasID")).ToList();

			Session["proj_meas"] = dt_selm;

			Session["selected_measlist"] = selected_measlist;

			PivotSelMeas.DataSource = Session["proj_meas"];
			PivotSelMeas.DataBind();
			PivotSelMeas.Visible = true;

			CheckSelectedMeas(selected_measlist);
		}
		else
		{
			PivotSelMeas.Visible = false;
		}

		#endregion

		#region Selected IntHx
		//string sqlih = "select measureID, measname, measfullname from uwautism_research_backend..tblmeasure where measureID in (815,816,817,819) " + 
		//	" and measureID in (select measureID from uwautism_research_data.dp.Meas where dataproj_pk = " + pk.ToString() + ")";
		//DataTable dt_selih = sql.DataTable_from_SQLstring(sqlih);
		//if (dt_selih.Rows.Count > 0)
		//{ 
		//	selected_inthxlist = dt_selih.AsEnumerable().Select(f => f.Field<int>("measureID")).ToList();
		//	Session["proj_inthx"] = dt_selih;

		//	Session["selected_inthxlist"] = selected_inthxlist;

		//	PivotSelIntHx.DataSource = Session["proj_inthx"];
		//	PivotSelIntHx.DataBind();
		//	PivotSelIntHx.Visible = true;

		//	//TOFIX CheckSelectedIntHx(selected_inthxlist);
		//}
		//else
		//{
		//	PivotSelIntHx.Visible = false;
		//}


		string sqlih = String.Format("select string as timept from dbo.UDF_CSVToTable((select inthx_timepts from dp.dataproject where dataproj_pk = {0}), ',') order by 1" , pk.ToString()) ;
		DataTable dt_selih = sql.DataTable_from_SQLstring(sqlih);

		if (dt_selih.Rows.Count > 0)
		{
			selected_inthxlist = dt_selih.AsEnumerable().Select(f => f.Field<string>("timept")).ToList();

			Session["proj_inthx"] = dt_selih;

			Session["selected_inthxlist"] = selected_inthxlist;
			PivotSelIntHx.DataSource = Session["proj_inthx"];
			PivotSelIntHx.DataBind();
			PivotSelIntHx.Visible = true;

			CheckSelectedIntHx(selected_inthxlist);
		}
		else
		{
			PivotSelIntHx.Visible = false;
		}

		#endregion




		#region Selected Variables

		//Gets the vars for all the measures saved in this project, the "inDataproj" field has the fldpk for those that are selected
		var x = selected_measlist.ConvertAll(n => n.ToString());
		string smID_csv = String.Join(",", x);

		bool include_inthx_vars = (dt_selih.Rows.Count > 0) ? true : false;

		DataTable dtv = uwac.trk.dataops.GetVarsForDataproject(pk,  smID_csv, include_inthx_vars);

		if(dtv.Rows.Count > 0)
		{
			Session["vars"] = dtv;
			selected_varslist = dtv.AsEnumerable().Select(f => f.Field<int>("inDataproj")).ToList();

			Session["selected_varslist"] = selected_varslist;

			DataView vw = dtv.AsDataView();
			vw.RowFilter = "inDataproj > 0";
			DataTable dtv_selvars = vw.ToTable();


			// Here, since we are just loading the saved info from the DB we load the saved vars
			// Later, 
			// when the selected measures change we change Session["vars"] -> which is bound to gridSelVars
			// when the selected vars change we change Session["proj_vars"] -> which is bound to gridProjVars

			gridSelVars.DataSource = Session["vars"];
			gridSelVars.DataBind();

			//Actually select these in the grid
			CheckSelectedVars(selected_varslist);


			Session["proj_vars"] = dtv_selvars;

			gridProjVars.DataSource = Session["proj_vars"];
			gridProjVars.DataBind();


		}

		#endregion

		#region Composite Variables

		//DataTable dtcv = uwac.trk.dataops.GetCompvarsForDataproject(pk);
		//gridCompvar.DataSource = dtcv;
		//gridCompvar.DataBind();

		#endregion


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

	protected void CheckSelectedIntHx(List<string> inthxlist)
	{
		ASPxGridView grid = (ASPxGridView)gridSelIntHx;

		//Remove any filter before selecting rows
		if (grid.Settings.ShowFilterRow) grid.FilterExpression = string.Empty;

		var nrow_visible = (int)grid.VisibleRowCount;

		int n_total_inthx = ((DataTable)Session["inthx"]).Rows.Count;

		int sel = 0;
		int unsel = 0;
		Debug.Print("");
		Debug.Print("   CHECK INTHX");
		Debug.Print(String.Format("   nrow_visible={0}  n_total_inthx={1}", nrow_visible.ToString(), n_total_inthx.ToString()));

		if (inthxlist.Count > 0)
		{
			for (int i = 0; i < inthxlist.Count; i++)
			{
				gridSelIntHx.Selection.SelectRowByKey(inthxlist[i]);
			}
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


	//Detail
	protected void detailGrid_DataSelect(object sender, EventArgs e)
	{
		Session["compvar_pk"] = (sender as ASPxGridView).GetMasterRowKeyValue();
	}


	protected void Compvarvar_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
	{
		if (e.RowType != GridViewRowType.Data) return;
		int weight = Convert.ToInt32(e.GetValue("varweight"));
		if (weight == -1)
			e.Row.BackColor = System.Drawing.Color.LightSalmon;
		else if (weight == 1)
			e.Row.BackColor = System.Drawing.Color.WhiteSmoke;
		else 
			e.Row.BackColor = System.Drawing.Color.Lime;


	}
	protected void Compvar_InitNewRow(object sender, ASPxDataInitNewRowEventArgs e)
	{
		var key = (sender as ASPxGridView).GetMasterRowKeyValue();
		Session["compvar_pk"] = key;

		//e.NewValues["ref_groupID"] = "0";
		e.NewValues["varweight"] = "1";
	}

	protected void Compvarvar_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		var key = (sender as ASPxGridView).GetMasterRowKeyValue();
		e.NewValues.Add("compvar_pk", key);		
	}
	protected void Compvarvar_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		var key = (sender as ASPxGridView).GetMasterRowKeyValue();
		e.NewValues.Add("compvar_pk", key);
	}

	protected void Compvar_OnParseValue(object sender, ASPxParseValueEventArgs e)
	{
		int x = 0;

	}

	#region Callbacks


	protected void gridSubjCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  pivotSubjCallback_OnCallback " + System.DateTime.Now.ToString());

		DataTable dt = uwac.trk.dataops.GetSelectedSubjects(Convert.ToInt32(cboSubjSet.Value.ToString()), Master.Master_studyID);

		Session["proj_subj"] = dt;

		PivotSelSubj.DataSource = (DataTable)Session["proj_subj"];
		PivotSelSubj.DataBind();
		PivotSelSubj.ReloadData();

		int n_proj_subj = dt.Rows.Count;

		PivotSelSubj.Visible = (n_proj_subj > 0) ? true : false;

		selsubj_n.Text = String.Format("({0} selected)", n_proj_subj.ToString());

	}
	protected void gridMeasCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  gridMeasCallback_OnCallback " + System.DateTime.Now.ToString());

		RefreshSession_selmeas();
		PivotSelMeas.DataSource = (DataTable)Session["proj_meas"]; //["tbl_selmeas"];
		PivotSelMeas.DataBind();

		PivotSelMeas.ReloadData();


		var selmeas = gridSelMeas.GetSelectedFieldValues(gridSelMeas.KeyFieldName);
		selected_measlist = selmeas.ConvertAll(x => Convert.ToInt32(x));

		int n_selmeas = selected_measlist.Count;
		selmeas_n2.Text = String.Format("({0} selected)", n_selmeas.ToString());

	}

	protected void gridIntHxCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  gridMeasCallback_OnCallback " + System.DateTime.Now.ToString());

		RefreshSession_selinthx();
		PivotSelIntHx.DataSource = (DataTable)Session["proj_inthx"];
		PivotSelIntHx.DataBind();


		var selinthx = gridSelIntHx.GetSelectedFieldValues(gridSelIntHx.KeyFieldName);
		selected_inthxlist = selinthx.ConvertAll(x => Convert.ToString(x));
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
			bool include_inthx_vars = (Session["selected_inthxlist"] != null) ? true : false;

			DataTable dtv = uwac.trk.dataops.GetVarsForDataproject(Convert.ToInt32(Request.QueryString["pk"]),  smID_csv, include_inthx_vars);
			Session["vars"] = dtv;
		}

		gridSelVars.DataSource = Session["vars"];
		gridSelVars.DataBind();

	}

	protected void pivotIntHxCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  pivotVarsCallback_OnCallback " + System.DateTime.Now.ToString());

		RefreshSession_selinthx();
		PivotSelIntHx.DataSource = (DataTable)Session["proj_inthx"];
		PivotSelIntHx.DataBind();

	}


	protected void pivotVarsCallback_OnCallback(object sender, EventArgs e)
	{
		Debug.Print("  $$  pivotVarsCallback_OnCallback " + System.DateTime.Now.ToString());

		RefreshSession_selvars();
		gridProjVars.DataSource = (DataTable)Session["proj_vars"];
		gridProjVars.DataBind();

	}
	

	//Update the Session variable based on what is currently selected
	//Call right before we bind the PivotTable 
	protected void RefreshSession_selmeas()
	{
		Debug.Print("RefreshSession_selmeas " + System.DateTime.Now.ToString());
		DataTable meas = (DataTable)Session["meas"];
		//var selmeas = gridSelMeas.GetSelectedFieldValues(gridSelMeas.KeyFieldName).ToList();


		List<int> selmeas = dataops.GetListInt(gridSelMeas.GetSelectedFieldValues(gridSelMeas.KeyFieldName));

		//List<int> selmeasint = selmeas.ConvertAll(new Converter<string, int>(Convert.ToInt32(x));

		if (selmeas.Count > 0)
		{

			var selmeasinfo = 
				from a in meas.AsEnumerable()
				where selmeas.Contains(a.Field<int>("studymeasID"))
				select a;


			DataView selmeasinfo2 = selmeasinfo.AsDataView();
			DataTable dt_proj_meas = selmeasinfo2.ToTable();
			Session["proj_meas"] = dt_proj_meas;
		}
		else{
			Session["proj_meas"] = null;
		}
		//PrintStatus();
	}


	protected void RefreshSession_selinthx()
	{
		Debug.Print("RefreshSession_selinthx " + System.DateTime.Now.ToString());
		//DataTable vars = (DataTable)Session["inthx"];
		//DataTable dtinthx = uwac.trk.dataops.GetAllIntHx(Request.QueryString["pk"], Master.Master_studyIDfull);
		DataTable dtinthx = uwac.trk.dataops.GetAllIntHxTimept(Request.QueryString["pk"], Master.Master_studyIDfull);

		//var selinthx= gridSelVars.GetSelectedFieldValues(gridSelIntHx.KeyFieldName).ToList();

		DataTable vars = (DataTable)Session["vars"];

		List<string> selinthx = dataops.GetListString(gridSelIntHx.GetSelectedFieldValues(gridSelIntHx.KeyFieldName));

		if (selinthx.Count > 0)
		{
			//var selinthxinfo =
			//	from a in vars.AsEnumerable()
			//	where selinthx.Contains(a.Field<string>("timept"))
			//	select a;
			//DataView selinthx2 = selinthxinfo.AsDataView();
			//Session["proj_inthx"] = selinthx2.ToTable();
			//Session["selected_inthxlist"] = selinthx;
		}
		PrintStatus();
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

	//SAVE the project
	protected void btnUpdate_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnUpdate_OnClick " + System.DateTime.Now.ToString());

		//Validate
		string title = txtTitle.Text;

		if (String.IsNullOrWhiteSpace(title))
		{

		}


		string meas_csv = dataops.GetCSV(gridSelMeas.GetSelectedFieldValues(gridSelMeas.KeyFieldName));
		string vars_csv = dataops.GetCSV(gridSelVars.GetSelectedFieldValues(gridSelVars.KeyFieldName));

		string inthx_csv = dataops.GetCSV(gridSelIntHx.GetSelectedFieldValues(gridSelIntHx.KeyFieldName));


		int subjset = 0;
		try
		{
			subjset = Convert.ToInt32(cboSubjSet.Value);
		}
		catch(Exception) { }

		if (txtTitle.Text != "** Enter Title Here **" & subjset > 0 & !String.IsNullOrEmpty(meas_csv) & !String.IsNullOrEmpty(vars_csv))

		{
			int newdataproj_pk = dataops.UpdateDataproject(Request.QueryString["pk"], Master.Master_studyID, subjset, txtTitle.Text, HtmlEditor.Html, meas_csv, vars_csv, inthx_csv);

			Response.Redirect("Edit.aspx?pk=" + newdataproj_pk.ToString());

			lblERROR.Text = "";
		} else{

			string err_text = "";
			if (txtTitle.Text == "** Enter Title Here **") err_text += "Enter a title.";
			if (subjset == 0) err_text += " Select subjects.";
			if (String.IsNullOrEmpty(meas_csv)) err_text += " Select measures.";
			if (String.IsNullOrEmpty(vars_csv)) err_text += " Select variables.";
			lblERROR.Text = err_text;
		}


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
		Response.Redirect("Explore2.aspx?pk=" + Request.QueryString["pk"]);
	}

	protected void btnFiles_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnFiles_OnClick " + System.DateTime.Now.ToString());
		Response.Redirect("Files.aspx?pk=" + Request.QueryString["pk"]);
	}


	protected void btnView_OnClick(object sender, EventArgs e)
	{
		viewPanel.Visible = true;
		btnHide.Visible = true;
		btnView.Visible = false;
	}
	protected void btnHide_OnClick(object sender, EventArgs e)
	{
		viewPanel.Visible = false;
		btnHide.Visible = false;
		btnView.Visible = true;
	}

	protected void gridCompvar_OnDataBound(object sender, System.EventArgs e)
	{
		((ASPxGridView)sender).DetailRows.ExpandAllRows();
		((ASPxGridView)sender).SettingsDetail.ShowDetailButtons = false;
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


	//protected void cboSubjSet_SelectedIndexChanged(object sender, EventArgs e)
	//{
	//	Debug.Print("cboSubjSet_SelectedIndexChanged" + System.DateTime.Now.ToString());

	//	//ViewState["subjNeedBind"] = "true";
	//	//int set = Convert.ToInt32(cboSubjSet.Value.ToString());
	//	//GetSelectedSubjects(set);
	//}
	#endregion



	#region PivotTable of Selected Measures	


	protected void PivotSelMeas_Concat(object sender, DevExpress.Web.ASPxPivotGrid.PivotGridCustomSummaryEventArgs e)
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

	}

	#endregion




	
}
