using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Data;
using System.Linq;
using System.Web;
using uwac;


namespace uwac_REDCap
{
	/// <summary>
	/// Summary description for REDCapDataImport
	/// </summary>
	public class REDCapDataImport
	{
		public int studyid { get; set; }
		public string tblname { get; set; }
		public string idvarname { get; set; }
		public List<int> studymeasids { get; set; }

		public List<string> matching_ids { get; set; }
		public ProcessLogs logs { get; set; }

		public ProcessLog resultslog { get; set; }
		public List<string> ids_not_in_DB { get; set; }
		private REDCap redcap;

		private bool commitToDB;

		private DataTable _dtRC;

		public DataTable dtRC_postProcess { 
			get {
				_dtRC.Columns["isready"].SetOrdinal(0);
				return _dtRC; } }

		private bool readyForInsert;

		public REDCapDataImport(REDCap myredcap, string formname, int mystudyid, bool mycommitToDB)
		{
			logs = new ProcessLogs();

			resultslog = new ProcessLog("Import from REDCap");
			ProcessLog matchingrowslog = new ProcessLog("Matching Rows");
			matching_ids = new List<string>();

			logs.AddLog(resultslog);
			logs.AddLog(matchingrowslog);
			ids_not_in_DB = new List<string>();
			resultslog.Log(String.Format("BEGIN processing REDCap form: <b>{0}</b>", formname));

			commitToDB = mycommitToDB;
			redcap = myredcap;
			studyid = mystudyid;
			_dtRC = redcap.DataFromForm(formname);

			_dtRC.AddColumn("isvalidid", typeof(int));
			_dtRC.AddColumn("isready", typeof(string));

			_dtRC = redcap.AddStudymeasToREDCapFormData(_dtRC);
			readyForInsert = false;


			SQL_utils sql = new SQL_utils("data");
			//idvarname = "record_id";
			idvarname = redcap.REDCap_id_fldname_for_DB(sql, formname, studyid);


			if (_dtRC.HasRows())
			{
				resultslog.Log(String.Format("{0} records present in REDCap", _dtRC.Rows.Count));

				CheckValidityOfAllIDs(sql);

				int smid = _dtRC.AsEnumerable().Select(f => f.Field<int>("studymeasid")).First();

				tblname = sql.StringScalar_from_SQLstring(String.Format("select tblname from def.tbl where measureid=(select measureid from uwautism_research_backend..tblstudymeas where studymeasid={0})", smid));

				Datadictionary dict = new Datadictionary(tblname);
				RenameREDCapColumns(dict);

				string sqlcode = String.Format("select * from {0} where studymeasid in (select studymeasid from uwautism_research_backend..tblstudymeas where studyid={1})", tblname, studyid);
				DataTable dt_inDB = sql.DataTable_from_SQLstring(sqlcode);
				dt_inDB.ColumnNamesToLower();

				int nrows_dt_inDB = (dt_inDB.HasRows()) ? dt_inDB.Rows.Count : 0;


				//Here Apr 27 2021
				CheckForRowMatch(sql, dt_inDB, dict);


				//// Compare Rows that are already in the DB
				//if (dt_inDB.HasRows())
				//{
				//	nrows_dt_inDB = dt_inDB.Rows.Count;
				//	studymeasids = _dtRC.AsEnumerable().Select(f => f.Field<int>("studymeasid")).Distinct().ToList();
				//	foreach (DataRow row in _dtRC.Rows)
				//	{
				//		string row_all_match = CheckREDCapData_by_row(sql, row, dt_inDB, dict);
				//	}
				//}

				//Handle rows that are not in the DB already.  Make sure they have enough valid values 
				if (nrows_dt_inDB < _dtRC.Rows.Count) //There are more rows in REDCap than in the UWAC DB
				{
					//No rows
					//Mark row "ready" if isvalidid = 1, the row is not in DB, and the row contains valid data 

					List<string> ids_in_db = dt_inDB.AsEnumerable().Select(f => f.Field<string>("id").ToUpper()).Distinct().ToList();

					foreach (DataRow row in _dtRC.Rows)
					{
						if (row["isvalidid"].ToString() != "1")
						{
							row["isready"] = "NotReady: ID not in DB";
						}
						else if (row["isvalidid"].ToString() == "1") //(row["isready"].ToString() == "ready")
						{

							if (!ids_in_db.Contains(row["record_id"].ToString().ToUpper()))
							{
								bool isready = CheckREDCapData_that_row_contains_data(sql, row, .20f); //Needs 20% valid fields
								if (isready) row["isready"] = "ready";
								else if (!isready) row["isready"] = "NotReady: too much missing data";
							}
						}
					}
				}

				matchingrowslog.Log(String.Join(",", matching_ids.Distinct()));

				List<string> ids_with_mult_recs = _dtRC.AsEnumerable().Where(f => f.Field<string>("isready") == "multiple records")
					.Select(f => f.Field<string>("id")).Distinct().ToList();
				int n_multrecs = ids_with_mult_recs.Count();
				if (n_multrecs > 0) resultslog.Log(String.Format("<b>WARNING:</b> {0} records with MULTIPLE RECORDS [{1}]", n_multrecs
					, String.Join(", ", ids_with_mult_recs)));

				int n_tocompare = _dtRC.AsEnumerable().Where(f => f.Field<string>("isready") == "need to compare values").Count();
				if (n_tocompare > 0) resultslog.Log(String.Format("INFO: {0} records already exist in DB, NEED TO COMPARE VALUES", n_tocompare));

				int n_ready = _dtRC.AsEnumerable().Where(f => f.Field<string>("isready") == "ready").Count();
				List<string> ready_ids = _dtRC.AsEnumerable().Where(f => f.Field<string>("isready") == "ready").Select(f => f.Field<string>("id")).ToList();


				if (n_ready > 0)
				{
					resultslog.Log(String.Format("PASS: Ready to insert {0} records into {1} <br/>=> {2}", n_ready, tblname, String.Join(",", ready_ids.Distinct())));
				}
				else if (n_ready == 0) resultslog.Log(String.Format("INFO: 0 records are Ready to insert into {1}", n_ready, tblname));


				if (commitToDB)
				{


					if (n_ready > 0)
					{

						InsertREDCapData();
					}
				}
				else
				{
					resultslog.Log(String.Format("** Check 'Save to DB?' to save these {0} records. **", n_ready));
				}
			}
			else
			{
				resultslog.Log(String.Format("WARNING: 0 records present in REDCap"));
			}
		
			sql.Close();
		}


		private void CheckForRowMatch(SQL_utils sql, DataTable dt_inDB, Datadictionary dict)
        {
			//Here Apr 27 2021
			// Compare Rows that are already in the DB
			if (dt_inDB.HasRows())
			{
				int nrows_dt_inDB = dt_inDB.Rows.Count;
				studymeasids = _dtRC.AsEnumerable().Select(f => f.Field<int>("studymeasid")).Distinct().ToList();
				foreach (DataRow row in _dtRC.Rows)
				{
					string row_all_match = CheckREDCapData_by_row(sql, row, dt_inDB, dict);
				}
			}
		}





		private void RenameREDCapColumns(Datadictionary dict)
        {
			int x = 0;

			foreach(DataColumn col in _dtRC.Columns)
            {
				string newcolname = dict.Fldname_in_REDCap_TO_fldname(col.ColumnName);
				if (newcolname != null)
				{
					Debug.WriteLine(String.Format("fldname_in_redcap={0}   fldname={1}    ", col.ColumnName.ToLower(), newcolname.ToString()));
					_dtRC.RenameColumn(col.ColumnName, newcolname);
				}
			}
        }




		private void InsertREDCapData()
        {
			DataTable dtready = _dtRC.AsEnumerable().Where(f => f.Field<string>("isready") == "ready").CopyToDataTable();

			DataColumn col = new DataColumn("verified", typeof(int));
			col.DefaultValue = 0;
			dtready.Columns.Add(col);

			SQL_utils sql = new SQL_utils("data");

			resultslog.Log("INFO: Attempting to match data types");
			DataTable dt_dest = sql.DataTable_from_SQLstring(String.Format("select * from {0} where 1=2", tblname));

			dtready.MatchColumnDataTypes(dt_dest);

			try
			{
				string insertresults = sql.BulkInsert(dtready, tblname);
				resultslog.Log(insertresults);

				//resultslog.Log(String.Format("SUCCESS: inserted {0} rows of data into {1}", dtready.Rows.Count, tblname));
				if(!insertresults.Contains("Error"))
                {
					UpdateTrackingDB(dtready);
				} 

			}
			catch(Exception ex )
            {
				resultslog.Log(String.Format("FAILED to insert data into {0} (# rows = {1})", tblname, dtready.Rows.Count));
            }

			sql.Close();
        }

		private void UpdateTrackingDB(DataTable dt)
        {
			SQL_utils sql = new SQL_utils("backend");
			try
			{
				foreach (DataRow row in dt.Rows)
				{
					string code = String.Format("update uwautism_research_backend..tblstudymeassubj set measstatusid=1, measstatusdetailid=52 where subjid=(select subjid from vwMasterStatus_S where id='{0}' and studyid={1}) and studymeasid = {2}", row["id"].ToString(), studyid, row["studymeasid"].ToString());
					sql.NonQuery_from_SQLstring(code);
				}
				resultslog.Log("SUCCESS: tracking DB updated.");
			}
			catch (Exception ex)
            {
				resultslog.Log("<b>ERROR while updating tracking DB.</b>");
            }


			sql.Close();

		}


		private void CheckValidityOfAllIDs(SQL_utils sql)
        {
			bool populateid = false;
			if(!_dtRC.ColumnNames().Contains("id"))
            {
				_dtRC.Columns.Add(new DataColumn("id", typeof(string)));
				populateid = true;
			}
			if(idvarname != "id") populateid = true;

			foreach (DataRow row in _dtRC.Rows)
            {
				string id = row[idvarname].ToString();
				string newid = row[idvarname].ToString();
				//if (newid == "TEST0000") newid = "TEST0000!";

				if (populateid)
                {
					row["id"] = newid;
					_dtRC.AcceptChanges();
                }

				int smid = Convert.ToInt32(row["studymeasid"].ToString());
				bool isvalid = IsValidSubject(sql, newid, smid);

				row["isvalidid"] = (isvalid) ? 1 : 0;
			}

			if(ids_not_in_DB.Count == 0)
            {
				resultslog.Log("PASS: All ID's are present in the DB");
            }
            else
            {
				foreach (string id in ids_not_in_DB.Distinct())
				{
					resultslog.Log(String.Format("WARNING: ID not in DB: {0}", id ));
				}
			}
        }



		private bool IsValidSubject (SQL_utils sql, string id, int smid)
        {
			DataTable dt_subj = sql.DataTable_from_SQLstring(String.Format("select subjid from uwautism_research_backend..vwMasterStatus_S where id='{0}' and studyid = (select studyid from uwautism_research_backend..tblstudymeas where studymeasid={1})", id, smid));
			bool isvalid = (dt_subj.HasRows()) ? true : false;

			if(!isvalid)
            {
				ids_not_in_DB.Add(id);
			}

			return isvalid;
        }


		public bool CheckREDCapData_that_row_contains_data(SQL_utils sql, DataRow row, float pct_of_flds_needed_to_insert)
		{
			float num_not_null = 0;

			for (int c = 0; c < row.ItemArray.Length; c++)
			{
				string val = row[c].ToString();

				if (!String.IsNullOrEmpty(val))
				{
					num_not_null++;
				}

			}

			float pctvalid =  (float)(num_not_null / (float)row.ItemArray.Length);
			return (pctvalid > pct_of_flds_needed_to_insert) ? true : false;
		}

			public string CheckREDCapData_by_row(SQL_utils sql, DataRow row, DataTable dtdb, Datadictionary dict)
		{
			string result = "";
			
			// Loop through each row of REDCap data

			// select only records with this id
			string id = row[idvarname].ToString().ToUpper();
			int smid = Convert.ToInt32(row["studymeasid"].ToString());
			bool isvalidsubject = (row["isvalidid"].ToString()=="1");

			if (isvalidsubject & smid > 0)
			{
				int nrecs_for_id = 0;
				try
				{
					nrecs_for_id = dtdb.AsEnumerable().Where(f => f.Field<string>("id").ToUpper() == id).Count();
				}
				catch (Exception ex) { }

				if (nrecs_for_id > 0)
				{

					var qry = dtdb.AsEnumerable().Where(f => f.Field<string>("id").ToUpper() == id &  f.Field<int>("studymeasid") == smid); //.CopyToDataTable();

					if (qry.Any())
					{
						DataTable dtid = (DataTable)qry.AsEnumerable().CopyToDataTable();

						if (dtid.HasRows())
						{
							if (dtid.Rows.Count == 1)
							{
								DataRowCompare rowcompare = new DataRowCompare(row, dtid.Rows[0], dict, true);

								if (rowcompare.log_mismatches.Numlogs() > 0) logs.AddLog(rowcompare.log_mismatches);
								else
								{
									//matches += String.Format("{0},",rowcompare.log_matches.LogNotesToHtml());
									//logs.AddLog(rowcompare.log_matches);
									result = String.Format("AllMatch{0}", id);
									matching_ids.Add(id);
								}

								row["isready"] = rowcompare.Results(); //CompareRows(row, dtid.Rows[0]);
							}
							else
							{
								row["isready"] = "multiple records";
								result = String.Format("There are {0} matching records for id:{1}", id, dtid.Rows.Count);
							}
						}
					}
					else
					{
						row["isready"] = "ready";
						result = String.Format("There are NO matching records for id:{0}", id);
					}
				}
				else
                {
					row["isready"] = "ready"; //Not in DB
				}
			}

			//ProcessLog log_matches = new ProcessLog("Matching rows");
			//log_matches.Log(matches);
			//logs.AddLog(log_matches);

			return result;
		}




		public string CompareRows(DataRow r1, DataRow r2)
		{
			string row_result = "";
			for (int i = 0; i < r1.ItemArray.Length; i++)
			{
				string colname = r1.Table.Columns[i].ColumnName;
				string colname2 = (colname == "record_id") ? "id" : colname;
				row_result += CompareRowValues(r1, r2, colname, colname2);

			}
			if (row_result == "") row_result = "ready";
			return row_result;
		}

		public string CompareRowValues(DataRow r1, DataRow r2, string v1, string v2)
		{
			string val1 = r1[v1].ToString();
			string val2 = r2[v2].ToString();
			if (val1 == val2) return "";
			else
			{
				if (v1 == v2) return String.Format("{0}[{1}<>{2}]", v1, val1, val2);
				else
				{
						
					return String.Format("{0}|{3}[{1}<>{2}]", v1, val1, val2, v2);
				}
			}
		}

	}
}