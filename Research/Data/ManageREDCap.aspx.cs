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


public partial class Data_ManageREDCap : BasePage
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
		Session["LinkedImports"] = null;
		Session["LinkedImportTbls"] = null;
		Session["LinkedREDCapForm"] = null;
		Response.Redirect("ManageREDCap.aspx");
	}


	protected void Page_Load(object sender, EventArgs e)
	{
		Debug.WriteLine(String.Format("Page_Load  IsPostBack:{0}  IsCallback:{1}", IsPostBack, IsCallback));


		GridViewDataComboBoxColumn cbo = ((GridViewDataComboBoxColumn)gv_Redcap_FormEvent.Columns["studymeasid"]);
		cbo.PropertiesComboBox.DataSource = GetStudymeasids();


		//LoadSubjects();
		LoadREDCapMeasures();

		LoadlinkedTables();

		redcap = new REDCap(Master.Master_studyID);

		

		//ASPxComboBox cbo = redcap.cboFormSelector();

		ASPxListBox lst = redcap.lstFormSelector();

		ASPxComboBox cboForms = redcap.cboFormSelector();

		if (cboForms != null)
		{
			cboForms.SelectedIndexChanged += cboForm_OnSelectedIndexChanged;
			cboForms.ID = "cboForms";

			placeholder.Controls.Add(cboForms);
			//tab_import_fields.Controls.Add(cboForms);
		}

		if (lst != null)
		{
			lst.EnableViewState = true;
			//placeholder_cboForms.Controls.Add(cbo);
			placeholder_cboForms.Controls.Add(lst);
			panelREDCap_controls.Visible = true;
		}
		else {
			panelREDCap_controls.Visible = false;
		}

		LoadlinkedTables();

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

		//Load the comparison between selected measure and Redcap
		CompareLinkedRedcap();

	}



	
	protected void gvcrud_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		gvCRUD.gvcrud_OnRowUpdating((ASPxGridView)sender, e, "data", "REDCap_Formevent","def");
	}






	#region Linked Import Tables - General
	protected void LoadlinkedTables()
	{

		if (Session["LinkedImports"] == null)
		{
			DataTable dt1 = DataImporter.LinkedImports(Convert.ToInt32(Session["studyID"].ToString()));
			Session["LinkedImports"] = dt1;
		}
		if (Session["LinkedImportTbls"] == null)
		{
			DataTable dt2 = DataImporter.LinkedImportTbls(Convert.ToInt32(Session["studyID"].ToString()));
			Session["LinkedImportTbls"] = dt2;
		}
		gridLinkedImport.DataSource = (DataTable)Session["LinkedImports"];
		gridLinkedImport.DataBind();
		gridLinkedImportTbl.DataSource = (DataTable)Session["LinkedImportTbls"];
		gridLinkedImportTbl.DataBind();


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
		else
		{
			gridLinkedREDCapForm.Visible = false;
		}
	}




	protected void gridLinkedImport_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildInsertSqlCode(e, "LinkedImport", "data", "def");
		gv.CancelEdit();
		e.Cancel = true;
		Session["LinkedImports"] = null;
		Session["LinkedImportTbls"] = null;

		LoadlinkedTables();
	}


	protected void gridLinkedImport_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildUpdateSqlCode(e, "LinkedImport", "data", "def");
		gv.CancelEdit();
		e.Cancel = true;
		Session["LinkedImports"] = null;
		Session["LinkedImportTbls"] = null;

		LoadlinkedTables();
	}


	protected void gridLinkedImportTbl_OnRowInserting(object sender, ASPxDataInsertingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildInsertSqlCode(e, "LinkedImportTbl", "data", "def");
		gv.CancelEdit();
		e.Cancel = true;
		Session["LinkedImports"] = null;
		Session["LinkedImportTbls"] = null;

		LoadlinkedTables();
	}


	protected void gridLinkedImport_OnRowDeleting(object sender, ASPxDataDeletingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildDeleteSqlCode(e, "LinkedImport", "data", "def");
		gv.CancelEdit();
		e.Cancel = true;
		Session["LinkedImports"] = null;
		Session["LinkedImportTbls"] = null;

		LoadlinkedTables();
	}


	protected void gridLinkedImportTbl_OnRowDeleting(object sender, ASPxDataDeletingEventArgs e)
	{
		ASPxGridView gv = (ASPxGridView)sender;
		DxDbOps.BuildDeleteSqlCode(e, "LinkedImportTbl", "data", "def");
		gv.CancelEdit();
		e.Cancel = true;
		Session["LinkedImports"] = null;
		Session["LinkedImportTbls"] = null;

		LoadlinkedTables();
	}


	protected void gridLinkedImportTbl_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
	{
		if (e.Column.FieldName == "ltpk")
		{
			e.Editor.ReadOnly = false;
		}
	}

	#endregion




	#region Linked Import Tables - REDCap


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
		string sqlcode = String.Format("select min(tokenID) from def.vwREDCap_Form where studyID={0} and measureID={1}",
			Session["studyID"].ToString(), cboMeas.Value.ToString());
		int tokenid = sql.IntScalar_from_SQLstring(sqlcode);
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


	protected void cboForm_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils("data");



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




	protected void CompareLinkedRedcap()
	{

		if(cboMeas.Value != null)
		{
			int measureID = Convert.ToInt32(cboMeas.Value.ToString());

			Datadictionary dict = new Datadictionary(measureID);

			REDCap redcap = new REDCap(Master.Master_studyID);

			DataTable foo = redcap.dt_metadata;

			var x = 
			from a in dict.dt_dict.AsEnumerable()
			join b in redcap.dt_metadata.AsEnumerable() on a.Field<string>("fldname_in_redcap").ToLower() equals b.Field<string>("field_name").ToLower()
			into ab
			from b in ab.DefaultIfEmpty()
			select new
			{
				ord_pos = a.Field<double>("ord_pos"),
				fldname = a.Field<string>("fldname").ToLower(),
				fldlabel = a.Field<string>("fieldlabel"),
				redcap_formname = (b == null) ? null : b.Field<string>("form_name"),
				redcap_fldname = (b == null) ? null : b.Field<string>("field_name"),
				redcap_fldlabel = (b == null) ? null : b.Field<string>("field_label")
			};

			DataTable dtMerged = x.CustomCopyToDataTable();



			if(dtMerged.HasRows())
			{
				gridMerged.DataSource = dtMerged;
				gridMerged.SettingsPager.PageSize = 200;
				gridMerged.DataBind();
				gridMerged.Caption = "Matched Fields between DB & REDCap: " + cboMeas.Text;
				panelMerged.Visible = true;
			}

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


	#region Get RED Cap Data


	protected void btnLoadFormData_OnClick(object sender, EventArgs e)
	{
		Debug.WriteLine("*************** btnLoadFormData_OnClick");

		List<string> formnames = GetSelectedFormnames();

		if (formnames.Count > 0)
		{
			placeholder_gridMeta.Controls.Clear();

			for (int i=0; i < formnames.Count; i++)
			{
				SQL_utils sql = new SQL_utils("data");

				REDCapDataImport rcdata = new REDCapDataImport(redcap, formnames[i], Master.Master_studyID, true);

				ASPxLabel lbllog = new ASPxLabel();
				lbllog.EncodeHtml = false;

				foreach(string s in rcdata.resultslog)
                {
					lbllog.Text += s + "</br/>";

				}

				placeholder_gridMeta.Controls.Add(lbllog);

				ASPxGridView grid = redcap.gridDataFromForm(formnames[i], true);

				if (grid != null)
				{
					grid.SettingsPager.PageSize = 200;
					ASPxLabel lbl = new ASPxLabel();
					lbl.Font.Bold = true;
					lbl.EncodeHtml = false;
					lbl.Text = String.Format("<br/><br/>{0}" , formnames[i]);
					placeholder_gridMeta.Controls.Add(lbl);
					placeholder_gridMeta.Controls.Add(grid);
				}
			}
			lblNoneSelected.Text = "";
		}
		else
		{
			lblNoneSelected.Text = "Select a REDCap form.";
		}

	}

	protected void btnSaveFormData_OnClick(object sender, EventArgs e)
	{
		Debug.WriteLine("*************** btnSaveFormData_OnClick");

		List<string> formnames = GetSelectedFormnames();


		if (formnames.Count > 0)
		{
			placeholder_gridMeta.Controls.Clear();

			for (int i = 0; i < formnames.Count; i++)
			{

				redcap.SaveFormDataToDB(formnames[i], Master.Master_studyID);

				string result = "";
				int counter = 0;
				foreach(string s in redcap.import_results)
                {
					counter++;
					result += String.Format("{0}. {1}</br>", counter, s);
                }

				lblSaveInfo.ForeColor = (result.ToUpper().Contains("ERROR")) ? Color.Red : Color.ForestGreen;
				lblSaveInfo.Text = result;
			}
			lblNoneSelected.Text = "";
		}
		else
		{
			lblNoneSelected.Text = "Select a REDCap form.";
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



    protected void btnFormEvents_Click(object sender, EventArgs e)
    {
		var results = redcap.SaveFormEventsToDB();
		lblRESULTS.Text = results;
	}


	protected void btnFields_Click(object sender, EventArgs e)
	{
		var results = redcap.SaveFieldsToDB();
		lblRESULTS.Text = results;
	}


    protected void btnInsertToken_Click(object sender, EventArgs e)
    {

		string url = "https://redcap.iths.org/api/";

		SQL_utils sql = new SQL_utils("data");

		//Make sure token is unique

		int numtokens = sql.IntScalar_from_SQLstring(String.Format("select count(*) from def.redcaptoken where token='{0}'", txtToken.Text));

		if (numtokens > 0)
		{
			lblRESULTS.ForeColor = Color.Red;
			lblRESULTS.Text = "This token has already been entered into the DB. Try again.";
		}
		else
		{

			int newtokenid = sql.IntScalar_from_SQLstring(String.Format("select max(tokenid)+1 from def.REDCapToken "));
			string sql_newtoken = String.Format("insert into def.REDCapToken(token, project, url, idfld, tokenid) Values('{0}','{1}','{2}','{3}',{4})", txtToken.Text, txtProjectname.Text, url, txtIDfld.Text, newtokenid);
			sql.NonQuery_from_SQLstring(sql_newtoken);
			sql.NonQuery_from_SQLstring(String.Format("insert into def.REDCapToken_study(tokenid, studyid) values({0},{1})", newtokenid, Master.Master_studyID));
			lblRESULTS.ForeColor = Color.ForestGreen;
			lblRESULTS.Text = "Token added.";

		}
		sql.Close();

		gv_tokens.DataBind();
	}

    protected void btnAddFlds_Click(object sender, EventArgs e)
    {
		ASPxComboBox cboForms = (ASPxComboBox)this.FindControlRecursive("cboForms");

		var form = cboForms.Value;

		SQL_utils sql = new SQL_utils("data");

		sql.DataTable_from_SQLstring(String.Format("exec def.spInsertREDCap_flds_to_tbl '{0}'", form));
		gv_redcap_forms_to_db.DataBind();
	}

    protected void gv_Redcap_FormEvent_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
    {
		if(e.Column.FieldName=="studymeasid")
        {

            ASPxComboBox combo = (ASPxComboBox)e.Editor;
            //combo.DataSource = GetStudymeasids();
            combo.DataBind();
        }



	}

	protected DataTable GetStudymeasids()
    {
		SQL_utils sql = new SQL_utils("data");

		string code = String.Format("select  studymeasid, studymeasname, studyid from vwREDCap_available_studymeasid where studyid = {0}", Master.Master_studyID);

		DataTable dt = sql.DataTable_from_SQLstring(code);
		sql.Close();

		return (dt);
	}



}


