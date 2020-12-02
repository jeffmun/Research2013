using System;
using System.Collections.Generic;
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
		public List<string> resultslog { get; set; }
		public List<string> ids_not_in_DB { get; set; }
		private REDCap redcap;

		private bool commitToDB;

		private DataTable _dtRC;

		private bool readyForInsert;

		public REDCapDataImport(REDCap myredcap, string formname, int mystudyid, bool mycommitToDB)
		{
			resultslog = new List<string>();
			ids_not_in_DB = new List<string>();
			resultslog.Add(String.Format("BEGIN processing REDCap form: <b>{0}</b>", formname));

			commitToDB = mycommitToDB;
			redcap = myredcap;
			studyid = mystudyid;
			_dtRC = redcap.DataFromForm(formname);
			DataColumn col1 = new DataColumn("isvalidid", typeof(int));
			DataColumn col2 = new DataColumn("isready", typeof(string));
			_dtRC.Columns.Add(col1);
			_dtRC.Columns.Add(col2);
			_dtRC = redcap.AddStudymeasToREDCapFormData(_dtRC);
			readyForInsert = false;
			idvarname = "record_id";
			
			if (_dtRC.HasRows())
			{
				resultslog.Add(String.Format("{0} records present in REDCap", _dtRC.Rows.Count));

				SQL_utils sql = new SQL_utils("data");
				CheckValidityOfAllIDs(sql);

				int smid = _dtRC.AsEnumerable().Select(f => f.Field<int>("studymeasid")).First();

				tblname = sql.StringScalar_from_SQLstring(String.Format("select tblname from def.tbl where measureid=(select measureid from uwautism_research_backend..tblstudymeas where studymeasid={0})", smid));

				string sqlcode = String.Format("select * from {0} where studymeasid in (select studymeasid from uwautism_research_backend..tblstudymeas where studyid={1})", tblname, studyid);

				DataTable dt_inDB = sql.DataTable_from_SQLstring(sqlcode);
				dt_inDB.ColumnNamesToLower();

				if (dt_inDB.HasRows())
				{
					studymeasids = _dtRC.AsEnumerable().Select(f => f.Field<int>("studymeasid")).Distinct().ToList();
					foreach (DataRow row in _dtRC.Rows)
					{
						CheckREDCapData_by_row(sql, row, dt_inDB);

					}
				}
                else
                {
					//No rows
					//Mark all rows "ready" if isvalidid = 1
					foreach(DataRow row in _dtRC.Rows)
                    {
						if (row["isvalidid"].ToString() == "1") row["isready"] = "ready";
                    }
                }

				int n_multrecs = _dtRC.AsEnumerable().Where(f => f.Field<string>("isready") == "multiple records").Count();
				if (n_multrecs > 0) resultslog.Add(String.Format("<b>WARNING:</b> {0} records with MULTIPLE RECORDS", n_multrecs));

				int n_tocompare = _dtRC.AsEnumerable().Where(f => f.Field<string>("isready") == "need to compare values").Count();
				if (n_tocompare > 0) resultslog.Add(String.Format("INFO: {0} records already exist in DB, NEED TO COMPARE VALUES", n_tocompare));

				int n_ready = _dtRC.AsEnumerable().Where(f => f.Field<string>("isready") == "ready").Count();
				if (n_ready > 0) resultslog.Add(String.Format("PASS: Ready to insert {0} records into {1}", n_ready, tblname));
				else if (n_ready == 0) resultslog.Add(String.Format("INFO: 0 records are Ready to insert into {1}", n_ready, tblname));



				if (commitToDB)
				{
					if(n_ready > 0) InsertREDCapData();
				}
			}
		}



		private void InsertREDCapData()
        {
			DataTable dtready = _dtRC.AsEnumerable().Where(f => f.Field<string>("isready") == "ready").CopyToDataTable();

			DataColumn col = new DataColumn("verified", typeof(int));
			col.DefaultValue = 1;
			dtready.Columns.Add(col);

			SQL_utils sql = new SQL_utils("data");

			try
			{
				string insertresults = sql.BulkInsert(dtready, tblname);
				resultslog.Add(insertresults);

				//resultslog.Add(String.Format("SUCCESS: inserted {0} rows of data into {1}", dtready.Rows.Count, tblname));
				if(!insertresults.Contains("Error"))
                {
					UpdateTrackingDB(dtready);
				} 

			}
			catch(Exception ex )
            {
				resultslog.Add(String.Format("FAILED to insert data into {0} (# rows = {1})", tblname, dtready.Rows.Count));
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
				resultslog.Add("SUCCESS: tracking DB updated.");
			}
			catch (Exception ex)
            {
				resultslog.Add("<b>ERROR while updating tracking DB.</b>");
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
				resultslog.Add("PASS: All ID's are present in the DB");
            }
            else
            {
				foreach (string id in ids_not_in_DB)
				{
					resultslog.Add(String.Format("WARNING: ID not in DB: {0}", id ));
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

		
		public void CheckREDCapData_by_row(SQL_utils sql, DataRow row, DataTable dtdb)
		{
			string result = "";

			// Loop through each row of REDCap data

			// select only records with this id
			string id = row[idvarname].ToString().ToUpper();
			int smid = Convert.ToInt32(row["studymeasid"].ToString());
			bool isvalidsubject = (row["isvalidid"].ToString()=="1");

			if (isvalidsubject & smid > 0)
			{
				int nrecs_for_id = dtdb.AsEnumerable().Where(f => f.Field<string>("id").ToUpper() == id).Count();

				if (nrecs_for_id > 0)
				{
					DataTable dtid = dtdb.AsEnumerable().Where(f => f.Field<string>("id").ToUpper() == id).CopyToDataTable();


					if (dtid.HasRows())
					{
						if (dtid.Rows.Count == 1)
						{
							row["isready"] = "need to compare values"; //CompareRows(row, dtid.Rows[0]);
						}
						else
						{
							row["isready"] = "multiple records";
							result = String.Format("There are {0} matching records for id:{1}", id, dtid.Rows.Count);
						}
					}
					else
					{
						row["isready"] = "ready";
						result = String.Format("There are NO matching records for id:{1}", id);
					}
				}
				else
                {
					row["isready"] = "ready"; //Not in DB
				}
			}

			
		 
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
				else return String.Format("{0}|{3}[{1}<>{2}]", v1, val1, val2, v2);
			}
		}

	}
}