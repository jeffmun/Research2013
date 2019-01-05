﻿using System;
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
using DevExpress.Web.Data;


public partial class Data_REDCap : BasePage
{

	REDCap redcap;


	protected void Page_Init(object sender, EventArgs e)
	{
		Session["LinkedREDCapForm"] = null;
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = Master.Master_studyID.ToString();
	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Session["LinkedREDCapForm"] = null;
		Response.Redirect("REDCap.aspx");
	}


	protected void Page_Load(object sender, EventArgs e)
	{
		Debug.WriteLine(String.Format("Page_Load  IsPostBack:{0}  IsCallback:{1}", IsPostBack, IsCallback));


		//LoadSubjects();
		LoadREDCapMeasures();


		redcap = new REDCap(Master.Master_studyID);

		//ASPxComboBox cbo = redcap.cboFormSelector();

		ASPxListBox lst = redcap.lstFormSelector();
		lst.EnableViewState = true;

		if (lst != null)
		{
			//placeholder_cboForms.Controls.Add(cbo);
			placeholder_cboForms.Controls.Add(lst);
			panelREDCap_controls.Visible = true;
		}
		else {
			panelREDCap_controls.Visible = false;
		}

		LoadlinkedTables();
		btnImportMeta.Visible = false;

		if (IsCallback)
		{
			//if (Session["redcap_metadata"] != null)
			//{
			//	gridREDCap.DataSource = (DataTable)Session["redcap_metadata"];
			//	gridREDCap.DataBind();
			//}
		}
		if (panel.IsCallback)
		{
			//LoadFormData();

		}

	}


	#region Linked Import Tables
	protected void LoadlinkedTables()
	{


		if (cboMeas.Value != null)
		{
			int measureID = Convert.ToInt32(cboMeas.Value.ToString());

			if (Session["LinkedREDCapForm"] == null)
			{
				DataTable dt2 = DataImporter.LinkedREDCapForms(Convert.ToInt32(Session["studyID"].ToString()), measureID, DbEntityType.measure);
				Session["LinkedREDCapForm"] = dt2;
			}

			if (Session["LinkedREDCapForm"] != null)
			{
				ASPxGridView gridLinkedREDCapForm = (ASPxGridView)this.Page.FindControlRecursive("gridLinkedREDCapForm");

				gridLinkedREDCapForm.DataSource = (DataTable)Session["LinkedREDCapForm"];
				gridLinkedREDCapForm.DataBind();
				gridLinkedREDCapForm.Visible = true;
			}
		}
		else{
			gridLinkedREDCapForm.Visible = false;
		}
	}




	protected void gridLinkedREDCapForm_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;

		DxDbOps.BuildUpdateSqlCode(e, "REDCap_Form", "data", "def");
		gv.CancelEdit();
		e.Cancel = true;
		Session["LinkedREDCapForm"] = null;

		LoadlinkedTables();
	}


	protected void gridLinkedREDCapForm_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		SQL_utils sql = new SQL_utils("data");

		int tokenid = sql.IntScalar_from_SQLstring(String.Format("select min(tokenID) from def.vwREDCap_Form where studyID={0} and measureID={1}",
			Session["studyID"].ToString(), cboMeas.Value.ToString()));
		sql.Close();

		int measureID = Convert.ToInt32(cboMeas.Value.ToString());
		e.NewValues.Add("tokenid", tokenid);
		e.NewValues.Add("measureid", measureID);


		DxDbOps.BuildInsertSqlCode(e, "REDCap_Form", "data", "def");
		gv.CancelEdit();
		e.Cancel = true;
		Session["LinkedREDCapForm"] = null;

		LoadlinkedTables();
	}



	protected void gridLinkedREDCapForm_OnRowDeleting(object sender, ASPxDataDeletingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildDeleteSqlCode(e, "REDCap_Form", "data", "def");
		gv.CancelEdit();
		e.Cancel = true;
		Session["LinkedREDCapForm"] = null;

		LoadlinkedTables();
	}


	protected void gridLinkedREDCapForm_CellEditorInitialize(object sender,
	DevExpress.Web.ASPxGridViewEditorEventArgs e)
	{
		if (e.Column.FieldName == "redcapformID")
		{
			e.Editor.ReadOnly = false;
		}
	}

	#endregion

	protected void LoadREDCapMeasures()
	{
		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = String.Format("select a.measureID, measname from tblmeasure a join tblstudymeas b ON a.measureID=b.measureID " + Environment.NewLine +
			" where a.measureID in (select measureID from uwautism_research_data.def.tbl where measureID>0 and importfiletype = {0}) " + Environment.NewLine +
			" and studyID = {1} " + Environment.NewLine +
			" group by a.measureID, measname ", (int)ImportFiletype.REDCap , Master.Master_studyID.ToString());
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		cboMeas.DataSource = dt;
		cboMeas.ValueField = "measureID";
		cboMeas.TextField = "measname";
		cboMeas.DataBind();

		if (dt.Rows.Count > 0)
		{
			cboMeas.NullText = "select measure";
		}
		else
		{
			cboMeas.NullText = "none configured for REDCap";
		}
		sql.Close();
	}



	protected void cboMeas_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		try
		{
			int measureID = Convert.ToInt32(cboMeas.Value.ToString());


			//string ns = new DataImporter(ID, studymeasID).LinkedTableInfo();


		}
		catch(Exception ex)
		{
			Debug.WriteLine("ERROR in cboMeas_OnSelectedIndexChanged");
			Debug.WriteLine(ex.Message);
		}
	}



	
	//protected void DeleteRecs(object sender, EventArgs e)
	//{
	//	string ID = cboSubject.Value.ToString();
	//	int studymeasID = Convert.ToInt32(cboStudymeas.Value.ToString());

	//	DataImporter importer = new DataImporter(ID, studymeasID); 
	//	importer.DeleteRecs();

	//	Response.Redirect(Request.Url.AbsolutePath);

	//}


	#region RED Cap
	protected void btnShowMeta_OnClick(object sender, EventArgs e)
	{
		Debug.WriteLine("*************** btnLoadFormData_OnClick");

		List<string> formnames = GetSelectedFormnames();

		placeholder_gridMeta.Controls.Add(redcap.gridMetaData(formnames));

		if(cboMeas.Value != null)
		{
			btnImportMeta.Visible = true;
		}
	}

	protected void btnImportMeta_OnClick(object sender, EventArgs e)
	{
		Debug.WriteLine("*************** btnImportFormData_OnClick");

		List<string> formnames = GetSelectedFormnames();

		Datadictionary dict = redcap.Datadictionary(formnames);


		SQL_utils sql = new SQL_utils("data");

		int tblpk = sql.IntScalar_from_SQLstring(String.Format("select tblpk from def.tbl where measureID={0}", cboMeas.Value));
		string tblname = sql.StringScalar_from_SQLstring(String.Format("select tblname from def.tbl where tblpk={0}", tblpk));

		dict.measureid = Convert.ToInt32(cboMeas.Value);
		dict.tblpk = tblpk;
		dict.tblname = tblname;
		string dict_save_info = dict.SaveToDB();

		lblDictSaveInfo.Text = dict_save_info;

		sql.Close();


	}

		protected void btnLoadFormData_OnClick(object sender, EventArgs e)
	{
		Debug.WriteLine("*************** btnLoadFormData_OnClick");

		List<string> formnames = GetSelectedFormnames();

		ASPxGridView grid = redcap.gridDataFromForm(formnames);
		if (grid != null)
		{
			placeholder_gridMeta.Controls.Clear();
			placeholder_gridMeta.Controls.Add(grid);
		}

	}

	protected List<string> GetSelectedFormnames()
	{

		ASPxListBox lstRedcapForms = (ASPxListBox)placeholder_cboForms.FindControlRecursive("lstRedcapForms");

		List<string> formnames = new List<string>();
		foreach (ListEditItem li in lstRedcapForms.SelectedItems)
		{
			formnames.Add(li.Value.ToString());
		}

		return formnames;
	}

	#endregion


}


//TODO
// add progress bar

