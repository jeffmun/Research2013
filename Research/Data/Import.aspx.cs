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
//using uwac_REDCap;

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
		Response.Redirect("Import.aspx");
	}


	protected void Page_Load(object sender, EventArgs e)
	{
		Debug.WriteLine(String.Format("Page_Load  IsPostBack:{0}  IsCallback:{1}", IsPostBack, IsCallback));


		LoadSubjects();
		LoadDatatypes();


		redcap = new REDCap(Master.Master_studyID);

		ASPxComboBox cbo = redcap.cboFormSelector();
		if (cbo != null)
		{
			placeholder_cboForms.Controls.Add(cbo);
			panelREDCap_controls.Visible = true;
		}
		else {
			panelREDCap_controls.Visible = false;
		}


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

	protected void cboStudymeas_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		string ID = cboSubject.Value.ToString();
		int studymeasID = Convert.ToInt32(cboStudymeas.Value.ToString());
		int n = CheckExistingData(ID, studymeasID);

		if (n > 0)
		{
			lblNrecs.ForeColor = Color.Red;
			lblNrecs.Text = String.Format("There are {0} records already entered!", n);
			FileUpload_Doc.Visible = false;
			btnDelete.Visible =  true ;
		}
		else 
		{
			lblNrecs.ForeColor = Color.ForestGreen;
			lblNrecs.Text = "No records yet entered.";
			FileUpload_Doc.Visible = true;
			btnDelete.Visible = false;
		}
	}



	protected void UploadDoc(object sender, EventArgs e)
	{
		string ID = cboSubject.Value.ToString();
		int studymeasID = Convert.ToInt32(cboStudymeas.Value.ToString());

		if (FileUpload_Doc.HasFile)
		{

			DateTime startupload = DateTime.Now;
			string info = String.Format("Begin. {0}<br/>", startupload.ToString());

			for (int f = 0; f < FileUpload_Doc.PostedFiles.Count; f++)
			{
				HttpPostedFile httpfile = FileUpload_Doc.PostedFiles[f];
				Debug.WriteLine(String.Format("{0} {1}", httpfile.FileName, httpfile.ContentLength));
				string sFileExt = httpfile.FileName.Substring(httpfile.FileName.LastIndexOf(".")).ToLower();
				string sOrigFileName = httpfile.FileName;

				string sFilePath = ConfigurationManager.AppSettings["DataUploadPath"];


				string[] allowedExts = { ".xlsx", ".xls", ".txt", ".csv" };

				//bool isallowed = new bool();
				//isallowed = false;
				int matches = 0;
				for (int i = 0; i < allowedExts.Length; i++)
				{
					if (allowedExts[i] == sFileExt) matches++;
				}

				if (matches >= 1)
				{

					try
					{
						

						string sFileName = String.Format("smID{0}___ID{1}_{2}{3}"
							, cboStudymeas.Value.ToString()
							, cboSubject.Value.ToString()
							, f
							, sFileExt);

						string myfilepath = Server.MapPath(sFilePath) + sFileName;
						httpfile.SaveAs(myfilepath);

						string results = ProcessUploadedData(ID, studymeasID, Server.MapPath(sFilePath), sFileName);

						info += String.Format("You have successfully uploaded '{0}'. {1}<br/>"
							, httpfile.FileName
							, results);

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
				}
				else
				{ //Not an allowed file type

					lblDocUploadInfo.Text = "Error: This file type is not allowed.";
					lblDocUploadInfo.ForeColor = Color.Red;
				}
			}

			double timeelapsed = Math.Round((DateTime.Now - startupload).TotalSeconds, 2);
			info += String.Format("<br/> End. {0} total seconds.", timeelapsed);

			lblDocUploadInfo.Text = Server.HtmlDecode(info);
			lblDocUploadInfo.ForeColor = Color.Green;

		}

		else
		{
			lblDocUploadInfo.Text = "You must select a file for upload.";
			lblDocUploadInfo.ForeColor = Color.Red;
		}
		//oConn.Close();
	}




	protected void UploadDoc_Cancel(object sender, EventArgs e)
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


	protected int CheckExistingData(string ID, int studymeasID)
	{
		SQL_utils sql = new SQL_utils("data");

		DbEntityInstance studymeas = new DbEntityInstance(
			new DbEntity(DbEntityType.studymeas), studymeasID);

		string where = studymeas.WhereIn(DbEntityType.measure);

		string measname = studymeas.NameOfRelatedEntity(DbEntityType.measure);

		string tblname = studymeas.NameOfRelatedEntity2(DbEntityType.measure, DbEntityType.tbl);

		string nrecs_code = String.Format("select count(*) from {0} where ID='{1}' and studymeasID={2}"
			, tblname, ID, studymeasID);

		int nrecs = sql.IntScalar_from_SQLstring(nrecs_code);


		int measureID = studymeas.PkvalOfRelatedEntity(DbEntityType.measure);



		//Also count the other Actigraph records 
		if (measureID == 3842)
		{
			int timepointID = studymeas.PkvalOfRelatedEntity(DbEntityType.timepoint);
			string sql_propsID = String.Format("select studymeasID from uwautism_research_backend..tblstudymeas where timepointID={0} and measureID=4855"
				, timepointID);
			string sql_epochID = String.Format("select studymeasID from uwautism_research_backend..tblstudymeas where timepointID={0} and measureID=4853"
				, timepointID);

			int studymeasID_props = sql.IntScalar_from_SQLstring(sql_propsID);
			int studymeasID_epoch = sql.IntScalar_from_SQLstring(sql_epochID);

			int n_props = sql.IntScalar_from_SQLstring(String.Format("select count(*) from ALL_ActigraphProps where ID='{0}' and studymeasID={1}", ID, studymeasID_props));
			int n_epoch = sql.IntScalar_from_SQLstring(String.Format("select count(*)  from ALL_ActigraphEpoch where ID='{0}' and studymeasID={1}", ID, studymeasID_epoch));

			nrecs = nrecs + n_props + n_epoch;
		}


		sql.Close();
		return nrecs;

	}

	protected void DeleteRecs(object sender, EventArgs e)
	{
		string ID = cboSubject.Value.ToString();
		int studymeasID = Convert.ToInt32(cboStudymeas.Value.ToString());
		DbEntityInstance studymeas = new DbEntityInstance(new DbEntity(DbEntityType.studymeas), studymeasID);

		string tblname = studymeas.NameOfRelatedEntity2(DbEntityType.measure, DbEntityType.tbl);

		SQL_utils sql = new SQL_utils("data");

		string sqlcode = String.Format("delete from {0} where ID='{1}' and studymeasID={2}", tblname, ID, studymeasID);
		sql.NonQuery_from_SQLstring(sqlcode);

		int measureID = studymeas.PkvalOfRelatedEntity(DbEntityType.measure);



		//Also delete the other Actigraph records if needed
		if(measureID == 3842)
		{
			int timepointID = studymeas.PkvalOfRelatedEntity(DbEntityType.timepoint);
			string sql_propsID = String.Format("select studymeasID from uwautism_research_backend..tblstudymeas where timepointID={0} and measureID=4855"
				, timepointID);
			string sql_epochID = String.Format("select studymeasID from uwautism_research_backend..tblstudymeas where timepointID={0} and measureID=4853"
				, timepointID);

			int studymeasID_props = sql.IntScalar_from_SQLstring(sql_propsID);
			int studymeasID_epoch = sql.IntScalar_from_SQLstring(sql_epochID);

			sql.NonQuery_from_SQLstring(String.Format("delete from ALL_ActigraphProps where ID='{0}' and studymeasID={1}", ID, studymeasID_props));
			sql.NonQuery_from_SQLstring(String.Format("delete from ALL_ActigraphEpoch where ID='{0}' and studymeasID={1}", ID, studymeasID_epoch));

		}


		sql.Close();

		Response.Redirect(Request.Url.AbsolutePath);

	}



	protected string  ProcessUploadedData(string ID, int studymeasID, string filepath, string filename)
	{
		//List<string> smID_ID = filename.Split(new string[] { "___ID" }, StringSplitOptions.None).ToList();
		//int studymeasID = Convert.ToInt32(smID_ID[0].Replace("smID", "").ToString());
		//List<string> ID_ext = smID_ID[1].Replace("ID", "").Split('.').ToList();
		//string ID = ID_ext[0];
		//string ext = ID_ext[1];

		SQL_utils sql = new SQL_utils("backend");
		string tblname = sql.StringScalar_from_SQLstring(
			String.Format("select tblname from uwautism_research_data.def.tbl where measureID = (select measureID from tblstudymeas where studymeasID={0})"
			, studymeasID));
		int measureID = sql.IntScalar_from_SQLstring(
			String.Format("select measureID from tblstudymeas where studymeasID={0}", studymeasID));
		sql.Close();

		string results = "";


		if(Actigraph.measureIDs.Contains(measureID))
		{
			results = Actigraph.ProcessActigraph(ID, filepath, filename, studymeasID);
		}
		//else if (measureID == 3843)  //SleepEnv_Sound
		//{
		//	//Note this involves looping through all files in a folder.


		//}
		else {
			DataImportSettings settings = new DataImportSettings(ID, studymeasID);

			if (settings.importfiletype == ImportFiletype.csv | settings.importfiletype == ImportFiletype.tsv)
			{
				DataTable dt = DataImporter.GetDataTableFromCSVFile(filepath, filename, settings);
				sql = new SQL_utils("data");
				if (settings.tblname == "ALL_SleepEnv_Sound")
				{
					DataTable dt_agg = Actigraph.AggregrateSoundData(dt, settings.tblname);
					results = sql.BulkInsert(dt_agg, settings.tblname);
				}
				else
				{
					results = sql.BulkInsert(dt, settings.tblname);
				}
				sql.Close();
			}

			else if (settings.importfiletype == ImportFiletype.textlines)
			{

				results = "Importing not yet impletented for ImportFiletype.textlines.";
			}
		}



		return results;
	}



	protected void btnShowMeta_OnClick(object sender, EventArgs e)
	{
		placeholder_gridMeta.Controls.Add(redcap.gridMetaData());
	}
	
	protected void btnLoadFormData_OnClick(object sender, EventArgs e)
	{
		Debug.WriteLine("btnLoadFormData_OnClick");
		ASPxComboBox cboRedcapForms = (ASPxComboBox)placeholder_cboForms.FindControlRecursive("cboRedcapForms");
		string formname = cboRedcapForms.Value.ToString();

		ASPxGridView grid = redcap.gridDataFromForm(formname);
		if (grid != null)
		{
			grid.Caption = redcap.dataheader;
			placeholder_gridMeta.Controls.Clear();
			placeholder_gridMeta.Controls.Add(grid);
		}

	}



	

}


//TODO
// add progress bar
// delete contents in DB before inserting ? 
