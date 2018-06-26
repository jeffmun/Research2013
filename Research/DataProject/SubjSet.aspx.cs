using System;
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
using DevExpress.Web.Data;
using uwac;

public partial class DataProject_SubjSet : System.Web.UI.Page
{

	private List<string> selected_measlist;
	private List<string> selected_varlist;
	private List<string> selected_subjlist;

	private int numsubj;

	#region Page Setup
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = Master.Master_studyID.ToString();
		ViewState["subjNeedBind"] = "true";

	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("SubjSet.aspx");
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		Debug.Print("Page_Load " + System.DateTime.Now.ToString());

		if (!IsPostBack)
		{

			// Not a postback and there is a defined DataProject - preload the selected Measures and Variables
			if(Request.QueryString["subjset_pk"] != null)
			{
				int subjset_pk;
				bool have_pk = int.TryParse(Request.QueryString["subjset_pk"], out subjset_pk);
				if (have_pk)
				{
					SQL_utils sql = new SQL_utils("data");

					int studyID = sql.IntScalar_from_SQLstring("select studyID from dp.SubjSet where subjset_pk = " + Request.QueryString["subjset_pk"].ToString());
					string subjset = sql.StringScalar_from_SQLstring("select coalesce(subjset,'') subjset from dp.SubjSet where subjset_pk = " + Request.QueryString["subjset_pk"].ToString());
					string subjsetdetails = sql.StringScalar_from_SQLstring("select coalesce(subjsetdetails,'') subjsetdetails  from dp.SubjSet where subjset_pk = " + Request.QueryString["subjset_pk"].ToString());

					txtSubjset.Text = subjset;
					txtSubjsetdetails.Text = subjsetdetails;


					if (Master.Master_studyID != studyID)
					{
						Master.Master_studyID = studyID;
					}

					DataTable dts = sql.DataTable_from_SQLstring("select subjID from dp.Subj where subjset_pk = " + subjset_pk.ToString());
					selected_subjlist = dts.AsEnumerable().Select(f => f.Field<int>("subjID").ToString()).ToList();

					sql.Close();

					lblTitle.Text = "Edit Subject Set: " + subjset;
					btnSave.Text = "Update Subject Set";
				}

			}
			else {
				lblTitle.Text = "Create New Subject Set" ;
				btnSave.Text = "Create Subject Set";
			}

			gridLkupSubj.DataBind();
			RefreshSelectedSubj();
			

			PivotSelSubj.DataSource = (DataView)Session["ss_selsubj"];
			PivotSelSubj.DataBind();

			PivotUnselSubj.DataSource = (DataView)Session["ss_unselsubj"];
			PivotUnselSubj.DataBind();

		}
		else
		{
			Debug.Print("   --- is Postback " + System.DateTime.Now.ToString());
			PivotSelSubj.DataSource = (DataView)Session["ss_selsubj"];
			PivotSelSubj.DataBind();

			PivotUnselSubj.DataSource = (DataView)Session["ss_unselsubj"];
			PivotUnselSubj.DataBind();
		}


		var selsubj = gridLkupSubj.GridView.GetSelectedFieldValues(gridLkupSubj.KeyFieldName);
		selected_subjlist = selsubj.ConvertAll(x => Convert.ToString(x));


		// Process visibility 
		if (selsubj.Count > 0)
		{
			string txt = String.Format("({0} selected)", selsubj.Count);
			selsubj_n.Text = txt;
			PivotSelSubj.Visible = true;
			PivotUnselSubj.Visible = true;
		}
		else
		{
			PivotSelSubj.Visible = false;
			PivotUnselSubj.Visible = false;
		}


		Debug.Print("   --- Page_Load complete " + System.DateTime.Now.ToString());
	}
	#endregion


	protected void pivotCallback_OnCallback (object sender, EventArgs e)
	{
		Debug.Print("pivotCallback_OnCallback " + System.DateTime.Now.ToString());

		RefreshSelectedSubj();
		PivotSelSubj.DataSource = (DataView)Session["ss_selsubj"];
		PivotSelSubj.DataBind();
		PivotSelSubj.ReloadData();

		PivotUnselSubj.DataSource = (DataView)Session["ss_unselsubj"];
		PivotUnselSubj.DataBind();
		PivotUnselSubj.ReloadData();

	}




	#region User Controls
	protected void btnSave_OnClick(object sender, EventArgs e)
	{
		Debug.Print("btnSave_OnClick " + System.DateTime.Now.ToString());


		int subjset_pk = UpdateSubjset();

		if(Request.QueryString["subjset_pk"] == null & subjset_pk > 0)
		{
			Response.Redirect("SubjSet.aspx?subjset_pk=" + subjset_pk.ToString());
		}
		else if(!String.IsNullOrEmpty(Request.QueryString["subjset_pk"])) {
			Response.Redirect("SubjSet.aspx?subjset_pk=" + Request.QueryString["subjset_pk"]);
		}
		else {
			//do nothing as there is no pk
		}

	}


	protected void btnReturn_OnClick(object sender, EventArgs e)
	{
		Response.Redirect("SubjSets.aspx");
	}
	#endregion



	#region Dropdowns for selecting Measures and Variables


	//Groups
	protected void gridLkupSubj_DataBinding(object sender, EventArgs e)
	{
		Debug.Print("gridLkupSubj_DataBinding " + System.DateTime.Now.ToString());

		//if (ViewState["needBind"] != null && (bool)ViewState["needBind"])
		if (ViewState["subjNeedBind"].ToString() == "true")
		{
			//var grp_csv = uwac.trk.dataops.GetCSV(gridLkupSubj.GridView.GetSelectedFieldValues(gridLkupSubj.KeyFieldName));
			// Assign the data source in grid_DataBinding

			DataTable dt = GetAllSubjects();

			if (dt != null)
			{
				Session["subjects"] = dt;
				ViewState["subjNeedBind"] = "false";

				numsubj = dt.Rows.Count;
				if (dt.Rows.Count > 0)
				{
					gridLkupSubj.DataSource = Session["subjects"];

					lblSubj.Text = dt.Rows.Count.ToString() + " total subjects";
				}
			}

		}
		else
		{
			gridLkupSubj.DataSource = Session["subjects"];
			ViewState["subjNeedBind"] = "false";
		}
	}


	protected void gridLkupSubj_OnDataBound(object sender, EventArgs e)
	{
		Debug.Print("gridLkupSubj_OnDataBound " + System.DateTime.Now.ToString());

		bool loadvars = false;
		if (Request.QueryString["subjset_pk"] != null)
		{
			ASPxGridLookup x = (ASPxGridLookup)sender;
			ASPxGridView grid = (ASPxGridView)x.GridView;
			var nrow = (int)grid.VisibleRowCount;
			//var nrow = 33;
			for (int i = 0; i < numsubj; i++)
			{

				if (selected_subjlist.Contains(grid.GetRowValues(i, "subjID").ToString()))
				{
					if (grid.Selection.IsRowSelected(i) == false)
					{
						loadvars = true;
						grid.Selection.SelectRow(i);
					}
				}
			}
		}

		RefreshSelectedSubj();
	}


	protected void gridLkupSubj_OnValueChanged(object sender, EventArgs e)
	{
		Debug.Print("gridLkupSubj_OnValueChanged " + System.DateTime.Now.ToString());

		var selsubj = gridLkupSubj.GridView.GetSelectedFieldValues(gridLkupSubj.KeyFieldName);
		ViewState["selsubj_n"] = selsubj.Count;

		ViewState["subjNeedBind"] = "true";

		RefreshSelectedSubj();
	}


	protected void RefreshSelectedSubj()
	{
		Debug.Print("RefreshSelectedSubj " + System.DateTime.Now.ToString());

		DataTable subj = (DataTable)Session["subjects"];

		var selsubj_list = gridLkupSubj.GridView.GetSelectedFieldValues(gridLkupSubj.KeyFieldName).ToList();

		var subj_list = subj.AsEnumerable().Select(f => f.Field<int>("subjID")).ToList();

		var unselsubj_list = subj_list.Where(f => !selsubj_list.Contains(f)).ToList();

		if (selsubj_list.Count > 0)
		{
			var selsubjinfo =
				from a in subj.AsEnumerable()
				where selsubj_list.Any(x => a.Field<int>("subjID").ToString().Contains(x.ToString()))
				select a;
			var unselsubjinfo =
				from a in subj.AsEnumerable()
				where unselsubj_list.Any(x => a.Field<int>("subjID").ToString().Contains(x.ToString()))
				select a;

			DataView selsubj = selsubjinfo.AsDataView();
			DataView unselsubj = unselsubjinfo.AsDataView();

			Session["ss_selsubj"] = selsubj;
			Session["ss_unselsubj"] = unselsubj;
			

		}
	}


	

	#endregion



	#region Retrieve data from DB



	protected DataTable GetAllSubjects()
	{


		string sqlcode = "select subjID, id, groupname as [Group], coalesce(txgrp, '**NA**') txgrp, subjstatus, subjstatusdetail, sex,  " +
		"coalesce(ethnicitydesc, 'UNKNOWN') as race, coalesce(hispanicdesc, 'UNKNOWN') as ethnicity " +
		", subjNotes, convert(VARCHAR, txstart, 101) txstart, txstartnote " +
		"from uwautism_research_backend..vwMasterStatus_S_txgrp a where studyID = " + Master.Master_studyID.ToString();


		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);


		Session["subjects"] = dt;
		sql.Close();
		return dt;

	}

	

	protected int UpdateSubjset()
	{

		var subj_csv = uwac.trk.dataops.GetCSV(gridLkupSubj.GridView.GetSelectedFieldValues(gridLkupSubj.KeyFieldName));

		if(subj_csv != null)
		{

		string subjset_pk = (Request.QueryString["subjset_pk"] != null) ? Request.QueryString["subjset_pk"] : "0";

		string subjset = txtSubjset.Text;
		string subjsetdetails = txtSubjsetdetails.Text;

		SQL_utils sql = new SQL_utils("data");
		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("subjset_pk", subjset_pk, "int"));
		ps.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
		ps.Add(sql.CreateParam("subjset", subjset,"text"));
		ps.Add(sql.CreateParam("subjsetdetails", subjsetdetails, "text"));
		ps.Add(sql.CreateParam("sel_subj", subj_csv, "text"));
		ps.Add(sql.CreateParam("out", "", "int", "output"));

		int newsubjset_pk = sql.NonQuery_from_ProcName("dp.spSubjSet_UPDATE", ps, "out");


		sql.Close();

		return newsubjset_pk;
		}
		else{
			return 0;
		}
	}
	#endregion



}