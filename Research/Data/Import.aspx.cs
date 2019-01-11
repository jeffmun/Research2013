using System;
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


public partial class Data_Import : BasePage
{

	REDCap redcap;


	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = Master.Master_studyID.ToString();
	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Session["LinkedImports"] = null;
		Session["LinkedImportTbls"] = null;
		Response.Redirect("Import.aspx");
	}


	protected void Page_Load(object sender, EventArgs e)
	{
		Debug.WriteLine(String.Format("Page_Load  IsPostBack:{0}  IsCallback:{1}", IsPostBack, IsCallback));


		LoadSubjects();
		LoadDatatypes();
		
		//LoadlinkedTables();

		if (IsCallback)
		{

		}
		if (panel.IsCallback)
		{

		}

	}


	protected void LoadSubjects()
	{
		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = String.Format("select 0 subjID, 'Multiple {0} subjects' ID union select subjID, ID from trk.vwMasterStatus_S where studyID={1}"
			, Master.Master_studyname, Master.Master_studyID.ToString());
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		cboSubject.DataSource = dt;
		cboSubject.ValueField = "ID";
		cboSubject.TextField = "ID";
		cboSubject.DataBind();
		sql.Close();
	}

	protected void LoadDatatypes()
	{
		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = "select studymeasID, studymeasname from tblmeasure a join tblstudymeas b ON a.measureID=b.measureID " + Environment.NewLine +
			" where a.measureID in (select measureID from uwautism_research_data.def.tbl where measureID>0 and importfiletype is not null) " + Environment.NewLine +
			" and studyID = " + Master.Master_studyID.ToString() + Environment.NewLine +
			" order by b.timepointID, studymeasname ";
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		cboStudymeas.DataSource = dt;
		cboStudymeas.ValueField = "studymeasID";
		cboStudymeas.TextField = "studymeasname";
		cboStudymeas.DataBind();

		if (dt.Rows.Count > 0)
		{
			cboStudymeas.NullText = "select measure";
		}
		else
		{
			cboStudymeas.NullText = "none configured for import";
		}
		sql.Close();
	}

	protected void cboSubject_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		CheckNs();
	}
	protected void cboStudymeas_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		CheckNs();
	}


	protected void CheckNs()
	{
		try
		{
			string ID = cboSubject.Value.ToString();
			int studymeasID = Convert.ToInt32(cboStudymeas.Value.ToString());

			string ns = new DataImporter(ID, studymeasID).LinkedTableInfo();


			REDCap redcap = new REDCap(Master.Master_studyID);

			if (redcap.IsREDCapMeasure(studymeasID))
			{
				DataTable dt_forms = DataImporter.LinkedREDCapForms(Master.Master_studyID, studymeasID, DbEntityType.studymeas);

				gridREDCapForms.DataSource = dt_forms;
				gridREDCapForms.DataBind();
				panelREDCap_controls.Visible = true;
			}
			else
			{
				panelREDCap_controls.Visible = false;
			}


			if (ns.Contains("!"))
			{
				lblNrecs.Visible = true;
				lblNrecs.ForeColor = Color.Red;
				lblNrecs.Text = String.Format("{0}There are records already entered!", ns);
				FileUpload_Doc.Visible = false;
				btnDelete.Visible = true;
				btnContinue.Visible = true;

				btnShowREDCap.Visible = false;
				btnImportREDCap.Visible = false;
			}
			else
			{
				lblNrecs.Visible = true;
				lblNrecs.ForeColor = Color.ForestGreen;
				lblNrecs.Text = ns;
				FileUpload_Doc.Visible = (redcap.IsREDCapMeasure(studymeasID)) ? false : true;  // don't show if a REDCap measure, because you don't upload files for these
				btnDelete.Visible = false;
				btnContinue.Visible = false;

				btnShowREDCap.Visible = (redcap.IsREDCapMeasure(studymeasID)) ? true : false;
				btnImportREDCap.Visible = (redcap.IsREDCapMeasure(studymeasID)) ? true : false;

			}

		}
		catch (Exception ex)
		{
			Debug.WriteLine("ERROR in CheckNs");
			Debug.WriteLine(ex.Message);
		}
	}



	/* IMPORT THE DATA */

	protected void ImportREDCapToDB()
	{
		string info;

		DateTime startupload = DateTime.Now;
		info = String.Format("Begin. {0}<br/>", startupload.ToString());

		string ID = cboSubject.Value.ToString();
		int studymeasID = Convert.ToInt32(cboStudymeas.Value.ToString());
		REDCap redcap = new REDCap(Master.Master_studyID);

		if (redcap.IsREDCapMeasure(studymeasID))
		{
			DataTable dt_forms = DataImporter.LinkedREDCapForms(Master.Master_studyID, studymeasID, DbEntityType.studymeas);
			List<string> formnames = dt_forms.AsEnumerable().Select(f => f.Field<string>("form_name")).ToList();


			DataImporter importer = new DataImporter(ID, studymeasID, formnames);
			info += importer.ResultsToString();
		}

		double timeelapsed = Math.Round((DateTime.Now - startupload).TotalSeconds, 2);
		info += String.Format("<br/> End. {0} total seconds.", timeelapsed);

		DisplayImporterResults(info);

	}


	protected void UploadFileAndSaveToDB(object sender, EventArgs e)
	{
		string ID = cboSubject.Value.ToString();
		int studymeasID = Convert.ToInt32(cboStudymeas.Value.ToString());
		SQL_utils sql = new SQL_utils("data");

		int mID = sql.IntScalar_from_SQLstring("select measureID from uwautism_research_backend..tblstudymeas where studymeasID=" + studymeasID.ToString());
		int int_importfiletype = sql.IntScalar_from_SQLstring("select importfiletype from def.tbl where measureID=" + mID.ToString());

		string info = "";

		if (FileUpload_Doc.HasFile)
		{

			DateTime startupload = DateTime.Now;
			info = String.Format("Begin. {0}<br/>", startupload.ToString());
			DataImporter importer;

			// Loop through all posted files
			for (int f = 0; f < FileUpload_Doc.PostedFiles.Count; f++)
			{
				HttpPostedFile httpfile = FileUpload_Doc.PostedFiles[f];
				Debug.WriteLine(String.Format("{0} {1}", httpfile.FileName, httpfile.ContentLength));
				string sFileExt = httpfile.FileName.Substring(httpfile.FileName.LastIndexOf(".")).ToLower();
				string sOrigFileName = httpfile.FileName;

				string sFilePath = ConfigurationManager.AppSettings["DataUploadPath"];

				string[] allowedExts;

				if (int_importfiletype == (int)ImportFiletype.SPSSsav)
				{
					allowedExts = new string[] { ".sav" };
				}
				else if (int_importfiletype == (int)ImportFiletype.tsv)
				{
					allowedExts = new string[] { ".tsv" };
				}
				else if (int_importfiletype == (int)ImportFiletype.xls)
				{
					allowedExts = new string[] { ".xls" };
				}
				else if (int_importfiletype == (int)ImportFiletype.xlsx)
				{
					allowedExts = new string[] { ".xlsx" };
				}
				else if (int_importfiletype == (int)ImportFiletype.csv)
				{
					allowedExts = new string[] { ".csv" };
				}
				else
				{
					allowedExts = new string[] { ".tsv", ".txt", ".csv" };
				}

				//Check if file extension is allowed 
				if (allowedExts.Contains(sFileExt))
				{
					string newfilename = String.Format("smID{0}___ID{1}_{2}{3}"
						, cboStudymeas.Value.ToString()
						, cboSubject.Value.ToString()
						, f
						, sFileExt);

					string myfilepath = Server.MapPath(sFilePath);

					try
					{
						//Save the file
						httpfile.SaveAs(myfilepath + newfilename);
					}
					catch (Exception oErr)
					{
						string err = String.Format("<b>{0}</b><br/><br/>{1}<br/><br/>{2}"
						, oErr.Message
						, oErr.InnerException
						, oErr.StackTrace.Replace(Environment.NewLine, "<br/>"));
						lblDocUploadInfo.Text = Server.HtmlDecode(err);

						lblDocUploadInfo.ForeColor = Color.Red;

					}

					importer = new DataImporter(ID, studymeasID, myfilepath, newfilename, httpfile.FileName);
					info += importer.ResultsToString();

				}
				else
				{ //Not an allowed file type

					info += "Error: This file type is not allowed.";
				}
			}


			double timeelapsed = Math.Round((DateTime.Now - startupload).TotalSeconds, 2);
			info += String.Format("<br/> End. {0} total seconds.", timeelapsed);

			lblDocUploadInfo.Text = Server.HtmlDecode(info);
			lblDocUploadInfo.ForeColor = (info.ToLower().Contains("error")) ? Color.Red : Color.Green;

		}

		else
		{
			info = "Error. You must select a file for upload.";
		}

		DisplayImporterResults(info);
	}


	protected void DisplayImporterResults(string info)
	{

		info = info.Replace("\r\n", "<br/>");
		info = info.Replace("\r", "<br/>");
		info = info.Replace("\n", "<br/>");

		lblDocUploadInfo.Text = Server.HtmlDecode(info);
		lblDocUploadInfo.ForeColor = (info.ToLower().Contains("error")) ? Color.Red : Color.Green;

		FileUpload_Doc.Visible = false;
		lblNrecs.Visible = false;
	}


	protected void UploadFile_Cancel(object sender, EventArgs e)
	{
		//ddl_DocType.SelectedValue = "0";
		//ddl_DocStatus.SelectedValue = "0";
		//txtDocTitle.Text = "";
		//txtDocDesc.Text = "";
		//lblDocUploadInfo.Text = "";

		//Panel_UploadDocs.Update();
		//Panel_UploadDocs.Visible = false;
		//btnShowUploadDocPanel.Visible = true;
	}

	
	protected void ContinueAnyway(object sender, EventArgs e)
	{
		FileUpload_Doc.Visible = true;
		btnDelete.Visible = false;
		btnContinue.Visible = false;
	}
	

	protected void DeleteRecs(object sender, EventArgs e)
	{
		string ID = cboSubject.Value.ToString();
		int studymeasID = Convert.ToInt32(cboStudymeas.Value.ToString());

		DataImporter importer = new DataImporter(ID, studymeasID); 
		importer.DeleteRecs();

		Response.Redirect(Request.Url.AbsolutePath);

	}



	#region RED Cap
	protected void btnImportREDCap_OnClick(object sender, EventArgs e)
	{
		ImportREDCapToDB();
	}


	protected void btnShowREDCap_OnClick(object sender, EventArgs e)
	{
		string ID = cboSubject.Value.ToString();
		int studymeasID = Convert.ToInt32(cboStudymeas.Value.ToString());
		REDCap redcap = new REDCap(Master.Master_studyID);

		if (redcap.IsREDCapMeasure(studymeasID))
		{
			DataTable dt_forms = DataImporter.LinkedREDCapForms(Master.Master_studyID, studymeasID, DbEntityType.studymeas);
			List<string> formnames = dt_forms.AsEnumerable().Select(f => f.Field<string>("form_name")).ToList();

			ASPxGridView grid = redcap.gridDataFromForm(formnames);
			if (grid != null)
			{
				placeholder_REDCap_data.Controls.Clear();
				placeholder_REDCap_data.Controls.Add(grid);
			}

		
		}



	}

	#endregion


}


//TODO
// add progress bar

