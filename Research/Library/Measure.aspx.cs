using DevExpress.Web;
using DevExpress.Web.Export;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.Web.Data;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraGrid;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using uwac;
using uwac.trk;
using System.Collections.Specialized;

public partial class Library_Measure : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		bool isCallback = IsCallback;
		bool isPostback = IsPostBack;

		if(!IsPostBack & Request.QueryString["mID"] != null)
		{
			int measureID = Convert.ToInt32(Request.QueryString["mID"]);
			LoadMeasureInfo(measureID);

			LoadDocs(measureID);
		}

	}



	protected void SaveButton_OnClick(object sender, EventArgs e)
	{
		int measureID = Convert.ToInt32(Request.QueryString["mID"]);
		OrderedDictionary keys = new OrderedDictionary();
		keys.Add("measureID", measureID);

		OrderedDictionary newvalues = new DxDbOps.FormLayoutNewValues((ASPxFormLayout)FormLayout);
		newvalues.Add("measureID", measureID);

		OrderedDictionary oldvalues = (OrderedDictionary)Session["formlayoutoldvalues"];

		bool outcome = DxDbOps.BuildUpdateSqlCode(keys, newvalues, oldvalues, "tblMeasure", "backend", "dbo");
		bool outcome2 = DxDbOps.BuildUpdateSqlCode(keys, newvalues, oldvalues, "tbl", "data", "def");

		LoadMeasureInfo(measureID);

	}

	

	protected void LoadMeasureInfo(int measureID)
	{
		SQL_utils sql = new SQL_utils("backend");
		string code = String.Format("select a.*, tblname, tblpk, spname, skipstartingrows, importfiletype, textqualifier from tblmeasure a {0} left join uwautism_research_data.def.tbl b ON a.measureID = b.measureID where a.measureID={1}"
			, Environment.NewLine, measureID);

		DataTable dt = sql.DataTable_from_SQLstring(code);
		sql.Close();

		FormLayout.DataSource = dt;
		FormLayout.DataBind();

		OrderedDictionary oldvalues = new DxDbOps.FormLayoutNewValues((ASPxFormLayout)FormLayout);
		oldvalues.Add("measureID", measureID);
		Session["formlayoutoldvalues"] = oldvalues;

	}

	protected void LoadDocs(int measureID)
	{
		SQL_utils sql = new SQL_utils("backend");
		string code = String.Format("select DocID, DocTitle, DocDesc, DocVersID, Version, DocFileName, ChangesDesc, DateSubmitted, doctype, docstatus, DocLink, fileext from vwDocs_Meas where entityID = {0}"
			, measureID);
		
		DataTable dt = sql.DataTable_from_SQLstring(code);
		sql.Close();

		gridDocs.DataSource = dt;
		gridDocs.DataBind();
	}


	protected void keyFieldLink_Init(object sender, EventArgs e)
	{
		ASPxHyperLink link = sender as ASPxHyperLink;
		GridViewDataItemTemplateContainer container = link.NamingContainer as GridViewDataItemTemplateContainer;
		link.Text = "View"; // + container.KeyValue;
		link.Target = "_blank";
		link.NavigateUrl = "Doc.aspx?dvID=" + container.KeyValue;
	}

	protected void gridDocs_OnRowUpdating(object sender, ASPxDataUpdatingEventArgs e)
	{
		var x = e;

		bool results_docVers = DxDbOps.BuildUpdateSqlCode(e, "tblDocVers", "backend");


		OrderedDictionary oldvals = e.OldValues;
		OrderedDictionary newvals = e.NewValues;
		OrderedDictionary keys = new OrderedDictionary();
		keys.Add("DocID", oldvals["DocID"]);

		bool results_doc = DxDbOps.BuildUpdateSqlCode(keys, newvals, oldvals, "tblDoc", "backend");


		int measureID = Convert.ToInt32(Request.QueryString["mID"]);

		LoadDocs(measureID);

		e.Cancel = true;
		gridDocs.CancelEdit();

		//		gridDocs.EndUpdate();

	}


	#region Upload


	protected void ShowUploadDocPanel(object sender, EventArgs e)
	{
		ddl_DocType.SelectedValue = "0";
		ddl_DocStatus.SelectedValue = "0";
		txtDocTitle.Text = "";
		txtDocDesc.Text = "";
		lblDocUploadInfo.Text = "";

		Panel_UploadDocs.Visible = true;
		btnShowUploadDocPanel.Visible = false;
	}

	protected void UploadDoc(object sender, EventArgs e)
	{
		int measureID = Convert.ToInt32(Request.QueryString["mID"]);

		if (FileUpload_Doc.HasFile)
		{

			UploadSettings s = new UploadSettings(
				Server.MapPath("~/webdocs/").ToString()
				, FileUpload_Doc.PostedFile.FileName.ToString()
				, UploadFiletype.Doc);
		
			s.doctitle = txtDocTitle.Text.ToString();
			s.docdesc = txtDocDesc.Text.ToString();
			s.doctypeID = Convert.ToInt32(ddl_DocType.SelectedValue);
			s.docstatusID = Convert.ToInt32(ddl_DocStatus.SelectedValue);
			s.linked_entitytype = DbEntityType.measure;
			s.linked_entityID = measureID;
	
			if (s.IsAllowed)
			{
				string upload_results = Uploader.UploadDoc(FileUpload_Doc, s);

				if(upload_results == "ok")
				{
					lblDocUploadInfo.Text = "You have successfully upload this document.";
					lblDocUploadInfo.ForeColor = Color.ForestGreen;
				}
				else
				{
					lblDocUploadInfo.Text = upload_results;
					lblDocUploadInfo.ForeColor = Color.DarkRed;
				}
			}
			else
			{ //Not an allowed file type

				lblDocUploadInfo.Text = "Error: This file type is not allowed.";
				lblDocUploadInfo.ForeColor = Color.DarkRed;
			}

		}
		else
		{
			lblDocUploadInfo.Text = "You must select a file for upload.";
			lblDocUploadInfo.ForeColor = Color.DarkRed;
		}

	}



	protected void UploadDoc_Cancel(object sender, EventArgs e)
	{
		ddl_DocType.SelectedValue = "0";
		ddl_DocStatus.SelectedValue = "0";
		txtDocTitle.Text = "";
		txtDocDesc.Text = "";
		lblDocUploadInfo.Text = "";

		Panel_UploadDocs.Update();

		Panel_UploadDocs.Visible = false;

		btnShowUploadDocPanel.Visible = true;
	}



	#endregion

}
