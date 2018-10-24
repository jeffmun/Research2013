using System;
using System.Collections.Generic;
using System.Data;
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
using uwac;
using System.Configuration;
using System.Drawing;
using System.Diagnostics;

public partial class Data_Import : BasePage
{
	
	protected void Page_Init(object sender, EventArgs e)
	{
		//REngine.SetEnvironmentVariables();
		//if (engine == null)
		//{
		//	engine = REngine.GetInstance();
		//	engine.Initialize();
		//}
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		LoadSubjects();
		LoadDatatypes();

		//if (IsPostBack && FileUpload_Doc.PostedFile != null)
		//{
		//	btnUploadDoc.Visible = true;
		//	btnUploadDoc_Cancel.Visible = true;
		//}
	}



	protected void LoadSubjects()
	{
		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = "select subjID, ID from trk.vwMasterStatus_S where studyID=" + Master.Master_studyID.ToString();
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

		string sqlcode = "select studymeasID, studymeasname from tblmeasure a join tblstudymeas b " + 
			" ON a.measureID=b.measureID where a.measureID in (3842,3843,3844) and studyID = " + Master.Master_studyID.ToString();
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		cboStudymeas.DataSource = dt;
		cboStudymeas.ValueField = "studymeasID";
		cboStudymeas.TextField = "studymeasname";
		cboStudymeas.DataBind();
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
			string sFileExt = FileUpload_Doc.PostedFile.FileName.Substring(FileUpload_Doc.PostedFile.FileName.LastIndexOf(".")).ToLower();
			string sOrigFileName = FileUpload_Doc.PostedFile.FileName;

			string sFilePath = ConfigurationManager.AppSettings["DataUploadPath"];


			string[] allowedExts = { ".xlsx", ".xls", ".txt", ".csv"};

			//bool isallowed = new bool();
			//isallowed = false;
			int matches = 0;
			for (int i = 0; i < allowedExts.Length; i++)
			{
				if (allowedExts[i] == sFileExt) matches++;
			}

			if (matches >= 1)
			{

				
				if (1 == 1)
				{
					//try
					//{
					DateTime startupload = DateTime.Now;

					string sFileName = String.Format("smID{0}___ID{1}{2}", cboStudymeas.Value.ToString(), cboSubject.Value.ToString(), sFileExt);

					string myfilepath = Server.MapPath(sFilePath) + sFileName;
					FileUpload_Doc.PostedFile.SaveAs(myfilepath);

					string results = ProcessUploadedData(ID, studymeasID, Server.MapPath(sFilePath), sFileName);



					double timeelapsed = Math.Round((DateTime.Now - startupload).TotalSeconds, 2);

					string info = String.Format("Begin. {0}<br/>You have successfully uploaded this document. {1}<br/> End. {2} total seconds."
						, startupload.ToString()
						, results
						, timeelapsed);
					lblDocUploadInfo.Text = Server.HtmlDecode(info);
					lblDocUploadInfo.ForeColor = Color.Green;
				}

				//}
				//catch (Exception oErr)
				//{
				//	string err = String.Format("<b>{0}</b><br/><br/>{1}<br/><br/>{2}"
				//	, oErr.Message
				//	, oErr.InnerException
				//	, oErr.StackTrace.Replace(Environment.NewLine, "<br/>"));
				//	lblDocUploadInfo.Text = Server.HtmlDecode(err);

				//	lblDocUploadInfo.ForeColor = Color.Red;

				//}
			}
			else
			{ //Not an allowed file type

				lblDocUploadInfo.Text = "Error: This file type is not allowed.";
				lblDocUploadInfo.ForeColor = Color.Red;
			}

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


		if (measureID == 3842 | measureID == 4853 | measureID == 4855)
		{
			results = ProcessActigraph(ID, filepath, filename, studymeasID);
		}
		else {
			DataImportSettings settings = new DataImportSettings(ID, studymeasID);

			if (settings.importfiletype == ImportFiletype.csv | settings.importfiletype == ImportFiletype.tsv)
			{
				DataTable dt = DataImporter.GetDataTableFromCSVFile(filepath, filename, settings);
				sql = new SQL_utils("data");
				if (settings.tblname == "ALL_SleepEnv_Sound")
				{
					DataTable dt_agg = AggregrateSoundData(dt, settings.tblname);
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


	protected string ProcessActigraph(string ID, string filepath, string filename, int studymeasID)
	{
		DateTime starttime = DateTime.Now;
		string results = String.Format("<br/>Begin processing. {0}", System.DateTime.Now.ToString());
		List<string> lines = DataImporter.ReadLinesFromFiles(filepath, filename);



		//TOFIX - now hardcoded for Sleep Pilot study
		List<int> chunk_studymeasID = new List<int> { 8015, 8015, 8015, 6998, -1, 8014 };  // -1 because we are not yet processing Marker/Score List

		//combine subject, actiwatch, and analysis inputs into the same table with 3 fields: parameter, value, units


		ActigraphChunkMarkers markers = new ActigraphChunkMarkers(studymeasID);
		markers.PopulateIndices(lines);

		for (int i=0; i <  markers.Count; i++) 
		{
			int smID = markers[i].studymeasID;

			if (smID > 0)
			{
				bool resetDaynum = false;
				string fldDaynum = "";
				DataImportSettings act_settings = new DataImportSettings(ID, smID);
				act_settings.rowstoprocess = markers[i].linenumber_end - markers[i].linenumber_start;
				act_settings.markerstring = markers[i].text.Replace("-", "").Replace(" Properties", "");

				//Num rows to skip varies by section
				if (markers[i].text.Contains("Statistics")) act_settings.skipstartingrows = 3;
				else if (markers[i].text.Contains("Epoch")) act_settings.skipstartingrows = 18;
				else act_settings.skipstartingrows = 1; //Because we are sending just the text to parse we just skip the header


				//Set the constString for fields with mode = FieldExtractionMode.useMarkerString
				if (markers[i].text.Contains("Subject") |
					markers[i].text.Contains("Actiwatch") |
					markers[i].text.Contains("Analysis"))
				{
					act_settings.markerstring = markers[i].text.Replace("-", "").Replace(" Properties", "");
				}

				foreach (Importfield fld in act_settings.fields)
				{
					if (fld.mode == FieldExtractionMode.useMarkerString) fld.constString = act_settings.markerstring;
					if (fld.mode == FieldExtractionMode.calcDayNum)
					{
						resetDaynum = true;
						fldDaynum = fld.field;
					}
				}



				Debug.WriteLine(String.Format(" >>>> {0}  {1}  {2}", act_settings.skipstartingrows, act_settings.rowstoprocess, markers[i].text));

				string text_to_parse = String.Join(Environment.NewLine,
					lines.GetRange(markers[i].linenumber_start - 1, (markers[i].linenumber_end - markers[i].linenumber_start)));

				DataTable dt = DataImporter.GetDataTableFromText(text_to_parse, act_settings);
				results += "</br>" + markers[i].text + " >> Found " + dt.Rows.Count.ToString() + " records. >> ";

				//reset Daynum to begin at 1.  Needed because the actigraph starts a few days earlier before actual data is obtained
				if(resetDaynum & fldDaynum != "")
				{
					int minDaynum = dt.AsEnumerable().Select(f => f.Field<int>(fldDaynum)).Min();
					foreach(DataRow row in dt.Rows)
					{
						int tmp = Convert.ToInt32(row[fldDaynum]);
						row[fldDaynum] = tmp + (-1 * (minDaynum - 1));
					}
				}



				SQL_utils sql = new SQL_utils("data");
				results += sql.BulkInsert(dt, act_settings.tblname);
				sql.Close();
			}
		}

		double timeelapsed = Math.Round((DateTime.Now - starttime).TotalSeconds, 2);

		results += String.Format("<br/>End processing. {0}  {1} seconds.", System.DateTime.Now.ToString(), timeelapsed);

		return results;
	}



	protected DataTable AggregrateSoundData(DataTable dt_in, string emtpytable)
	{
		//DataTable dt = new DataTable();

		var aggdata = from x in dt_in.AsEnumerable()
					group x by new
					{
						id = x.Field<string>("id"),
						studymeasid = x.Field<int>("studymeasid"),
						indexnum = x.Field<int>("indexnum"),
						senvs_datetime = x.Field<DateTime>("senvs_datetime"),
					} into g
					select new
					{
						id = g.Min(h => h.Field<string>("id")),
						studymeasid = g.Min(h => h.Field<int>("studymeasid")),
						indexnum = g.Min(h => h.Field<int>("indexnum")),
						senvs_datetime = g.Min(h => h.Field<DateTime>("senvs_datetime")),
						senvs_dbmin = g.Min(h => h.Field<double>("senvs_db")),
						senvs_db = g.Max(h => h.Field<double>("senvs_db")),
						senvs_dbsd = Math.Round(g.StdDev(h => h.Field<double>("senvs_db")), 4),
					};


		DataTable dt_out = aggdata.CustomCopyToDataTable();

		DataTable dt_empty = DataImporter.EmptyDataTable(emtpytable);
		dt_out.AddEmptyColumns(dt_empty);

		return dt_out;

	}


	

}


//TODO
// add progress bar
// delete contents in DB before inserting ? 
