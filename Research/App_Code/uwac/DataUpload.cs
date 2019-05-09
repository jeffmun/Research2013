using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using uwac;


namespace uwac
{
	/// <summary>
	/// Summary description for DataUpload
	/// </summary>
	public class DataUpload
	{
		int datauploadPK;
		string filename;
		int studymeasID;
		string ID;
		bool isMultSubj;
		public List<string> results;
		private DataTable _uploaded_dt;
		public DataTable uploaded_dt { get { return _uploaded_dt; } set { _uploaded_dt = value; } }
		

		public DataUpload()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public void SaveToDB()
		{
			SQL_utils sql = new SQL_utils("data");

			int current_maxpk = sql.IntScalar_from_SQLstring("select max(datauploadPK) maxPK from def.DataUpload");
			string sqlcode = String.Format("insert into def.DataUpload (filename, studymeasID, ID, isMultSubj, uploaded, uploadedby) values ({0},{1},{2},{3},getdate(), sec.systemuser())"
				, filename, studymeasID, ID, isMultSubj);

			sql.NonQuery_from_SQLstring(sqlcode);

			string sqlcode2 = String.Format("select datauploadPK from def.DataUpload where filename='{0}' and uploadedby=sec.systemuser() and datauploadPK > {1} ", filename, current_maxpk);
			datauploadPK = sql.IntScalar_from_SQLstring(sqlcode2);

			sql.Close();
			
			if (datauploadPK > 0) {
				results.Add(String.Format("Added datauploadPK {0}", datauploadPK));
			} else {
				results.Add(String.Format("DataUpload Not Logged for '{0}'!", filename));
			}
		}

		//protected void CreateTableForImport(string ID, int studymeasID, string filepath, string filename, string tblname)
		//{
		//	Debug.WriteLine(" *** ProcessUploadedData *** ");
		//	Debug.WriteLine(String.Format("ID:{0}  smID:{1}  filepath:{2}  filename:{3} ", ID, studymeasID, filepath, filename));

		//	SQL_utils sql = new SQL_utils("backend");
		//	int measureID = sql.IntScalar_from_SQLstring(
		//		String.Format("select measureID from tblstudymeas where studymeasID={0}", studymeasID));


		//	results.Add(String.Format("Creating local DataTable for destination '{0}'...", tblname));


		//	if (Actigraph.measureIDs.Contains(measureID))
		//	{
		//		string results_actigraph = Actigraph.ProcessActigraph(ID, filepath, filename, studymeasID);
		//		results.Add(results_actigraph);
		//	}
		//	//else if (measureID == 3843)  //SleepEnv_Sound
		//	//{
		//	//	//Note this involves looping through all files in a folder.
		//	//}
		//	else
		//	{

		//		if (settings.importfiletype == ImportFiletype.csv | settings.importfiletype == ImportFiletype.tsv)
		//		{
		//			Debug.WriteLine(" #### CSV TSV ####");

		//			DataTable dt = GetDataTableFromCSVFile(filepath, filename, settings);

		//			if (settings.tblname == "ALL_SleepEnv_Sound")
		//			{
		//				DataTable dt_agg = Actigraph.AggregrateSoundData(dt, tblname);

		//				_imported_dt = dt_agg;
		//			}
		//			else
		//			{
		//				_imported_dt = dt;
		//			}


		//		}
		//		else if (settings.importfiletype == ImportFiletype.xlsx)
		//		{
		//			Debug.WriteLine(" #### XLXS ####");

		//			DataTable dt = GetDataTableFromXLSX(filepath, filename, settings);
		//		}

		//		else if (settings.importfiletype == ImportFiletype.SPSSsav)
		//		{
		//			Debug.WriteLine(" #### SPSSsav ####");
		//			settings = new DataImportSettings(ID, studymeasID);
		//			sql = new SQL_utils("data");
		//			Spsssav sav = new Spsssav(filepath, filename);
		//			_imported_dt = sav.data;

		//			int nsubj = _imported_dt.AsEnumerable().Select(f => f.Field<string>("study_id")).Distinct().Count();

		//			string msg = String.Format("{0} records, {1} variables, {2} subjects"
		//				, _imported_dt.Rows.Count, _imported_dt.Columns.Count, nsubj);

		//			_imported_dt.AddNeededColumnsBeforeImport(settings);

		//			Debug.WriteLine("# recs: " + _imported_dt.Rows.Count);
		//			_imported_dt = _imported_dt.RemoveRowsWithNullID();
		//			Debug.WriteLine("# recs: " + _imported_dt.Rows.Count);


		//			string result_sav = "SPSSsav file contains " + msg + "<br/>";
		//			results.Add(result_sav);

		//		}
		//		else if (settings.importfiletype == ImportFiletype.textlines)
		//		{

		//			results.Add("<br/>Importing not yet impletented for ImportFiletype.textlines.");
		//		}
		//		//}
		//	}

		//	sql.Close();

		//	if (_imported_dt.HasRows())
		//	{
		//		string tblinfo = String.Format("local DataTable with {0} rows from a total of {1} rows processed. {2} rows marked as 'NoData'"
		//			, _imported_dt.Rows.Count, inputfile_rowcounter, nrecs_nodata);
		//		results.Add(tblinfo);
		//	}
		//	else
		//	{
		//		results.Add("_imported_dt Has No Rows!");
		//	}

		//}

	}
}