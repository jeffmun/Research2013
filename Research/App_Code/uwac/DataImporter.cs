using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using SpreadsheetGear;
using SpreadsheetGear.Data;
using GenericParsing;
using uwac;
using System.Diagnostics;
using System.IO;
using System.Data.SqlClient;
using uwac_REDCap;

namespace uwac
{
	/// <summary>
	/// Summary description for ImportData
	/// </summary>
	public class DataImporter
	{
		public bool fileexists;
		public string filepath;
		public string filename;
		public string uploadedfilename;
		public string ID;
		public int main_studymeasID;
		public int main_measureID;
		public int inputfile_rowcounter { get; set; }
		public List<int> studymeasIDs;
		public List<string> redcap_formnames { get; set; }
		public DataImportSettings settings { get; set; }
		public List<string> results { get; set; }
		public DataTable dtLinkedImportTbls { get; set; }

		public DataUpload dataupload { get; set; }
		private DataTable _imported_dt;
		public DataTable imported_dt { get { return _imported_dt; } set { _imported_dt = value; } }

		public int nrecs_nodata { 
			get
			{
				if(_imported_dt.HasRows())
				{
					return _imported_dt.AsEnumerable().Where(f => f.Field<int>("verified") == 4).Count();
				}
				else{
				return 0;
				}

			}
		}


		public DataImporter(string myID, int mystudymeasID)
		{
			main_studymeasID = mystudymeasID; // = new List<int> { mystudymeasID };
			ID = myID;
			Initialize();
			settings = new DataImportSettings(ID, main_studymeasID);
		}

		// REDCap
		public DataImporter(string myID, int mystudymeasID, List<string> myredcap_formnames)
		{

			main_studymeasID = mystudymeasID; // = new List<int> { mystudymeasID };
			ID = myID;
			redcap_formnames = myredcap_formnames;
			Initialize();
			settings = new DataImportSettings(ID, main_studymeasID);
			ExtractREDCapTableForImport();

			results.Add("Skpped 'CheckSubjects' for now.");
			//results.Add(CheckSubjects(_imported_dt));

			FixIndexnum(_imported_dt, settings.tblname);

			DataTable dt_to_match = EmptyDataTable(settings.tblname);

			_imported_dt.MatchColumnDataTypes(dt_to_match);


			if (_imported_dt.HasRows())
			{
				SQL_utils sql = new SQL_utils("data");

				string insert_result = sql.BulkInsert(_imported_dt, settings.tblname);
				results.Add(insert_result);
				sql.Close();

			}

			SQLAfterInsert();
		}


		public DataImporter(string myID, int mystudymeasID, string myfilepath, string myfilename, string myuploadedfilename)
		{
			filepath = myfilepath;
			filename = myfilename;
			uploadedfilename = myuploadedfilename;
			main_studymeasID = mystudymeasID;
			ID = myID;
			Initialize();

			fileexists = File.Exists(filepath + filename);


			if (fileexists)
			{
				Debug.WriteLine(" #### attempt to define DataImportSettings ####");


				results.Add(String.Format("You have successfully uploaded '{0}'.", uploadedfilename));



				//Begin processing each identified studymeasID
				foreach (DataRow linkedrow in dtLinkedImportTbls.Rows)
				{
					_imported_dt = null;
					settings = new DataImportSettings(ID, Convert.ToInt32(linkedrow["studymeasID"]));
					CreateTableForImport(ID, Convert.ToInt32(linkedrow["studymeasID"]), filepath, filename, linkedrow["tblname"].ToString());

					CheckSubjects(_imported_dt);  //add any needed subjects in order to import this data.  Only need to do this once

					FixIndexnum(_imported_dt, linkedrow["tblname"].ToString()); //Check subjects and fix indexnum

					if (_imported_dt.HasRows())
					{

						//ConvertLabelsToValues();

						SQL_utils sql = new SQL_utils("data");
						string insert_result = sql.BulkInsert(_imported_dt, linkedrow["tblname"].ToString());
						results.Add(insert_result);
						sql.Close();
					}

					SQLAfterInsert();
				}

			}
			else
			{
				results.Add(String.Format("File '' does not exist.", filename));
			}
		}


		protected void Initialize()
		{
			results = new List<string>();
			PopulateLinkedImportTbls();



		}



		/* BUILD THE DataTable To Import */


		#region Create Empty DataTable based on a table defined in the DB
		public static DataTable EmptyDataTable(string tblname)
		{
			return EmptyDataTable(tblname, "dbo");
		}
		public static DataTable EmptyDataTable(string tblname, string schema)
		{
			SQL_utils sql = new SQL_utils("data");
			DataTable dt = sql.DataTable_from_SQLstring(String.Format("select * from [{0}].[{1}] where 1=2", schema, tblname));
			sql.Close();
			return dt;
		}
		#endregion



		#region Create the DataTable from the imported file OR REDCap


		protected void ExtractREDCapTableForImport()
		{
			Debug.WriteLine(" *** ProcessUploadedData *** ");
			Debug.WriteLine(String.Format("ID:{0}  smID:{1}  filepath:{2}  filename:{3} ", ID, main_studymeasID, filepath, filename));

			SQL_utils sql = new SQL_utils("backend");
			int measureID = sql.IntScalar_from_SQLstring(
				String.Format("select measureID from tblstudymeas where studymeasID={0}", main_studymeasID));
			int studyID = sql.IntScalar_from_SQLstring(
				String.Format("select studyID from tblstudymeas where studymeasID={0}", main_studymeasID));

			string tblname = sql.StringScalar_from_SQLstring("select tblname from uwautism_research_data.def.tbl where measureID=" + measureID.ToString());

			if (settings.importfiletype == ImportFiletype.REDCap)
			{
				REDCap redcap = new REDCap(studyID);
				_imported_dt = redcap.DataFromForms(redcap_formnames);

				//DataTable dt_prepped = AddNeededColumnsBeforeImport(dt, settings);
				_imported_dt.AddNeededColumnsBeforeImport(settings);


			}



			results.Add(String.Format("Creating local DataTable for destination '{0}'...", tblname));

		}


		protected void CreateTableForImport(string ID, int studymeasID, string filepath, string filename, string tblname)
		{
			Debug.WriteLine(" *** ProcessUploadedData *** ");
			Debug.WriteLine(String.Format("ID:{0}  smID:{1}  filepath:{2}  filename:{3} ", ID, studymeasID, filepath, filename));

			SQL_utils sql = new SQL_utils("backend");
			int measureID = sql.IntScalar_from_SQLstring(
				String.Format("select measureID from tblstudymeas where studymeasID={0}", studymeasID));


			results.Add(String.Format("Creating local DataTable for destination '{0}'...", tblname));


			if (Actigraph.measureIDs.Contains(measureID))
			{
				string results_actigraph = Actigraph.ProcessActigraph(ID, filepath, filename, studymeasID);
				results.Add(results_actigraph);
			}
			//else if (measureID == 3843)  //SleepEnv_Sound
			//{
			//	//Note this involves looping through all files in a folder.
			//}
			else
			{

				if (settings.importfiletype == ImportFiletype.csv | settings.importfiletype == ImportFiletype.tsv)
				{
					Debug.WriteLine(" #### CSV TSV ####");

					DataTable dt = GetDataTableFromCSVFile(filepath, filename, settings);

					if (settings.tblname == "ALL_SleepEnv_Sound")
					{
						DataTable dt_agg = Actigraph.AggregrateSoundData(dt, tblname);

						_imported_dt = dt_agg;
					}
					else
					{
						_imported_dt = dt;
					}


				}
				else if (settings.importfiletype == ImportFiletype.xlsx)
				{
					Debug.WriteLine(" #### XLXS ####");

					DataTable dt = GetDataTableFromXLSX(filepath, filename, settings);
				}

				else if (settings.importfiletype == ImportFiletype.SPSSsav)
				{
					Debug.WriteLine(" #### SPSSsav ####");
					settings = new DataImportSettings(ID, studymeasID);
					sql = new SQL_utils("data");
					Spsssav sav = new Spsssav(filepath, filename);
					_imported_dt = sav.data;

					int nsubj = _imported_dt.AsEnumerable().Select(f => f.Field<string>("study_id")).Distinct().Count();

					string msg = String.Format("{0} records, {1} variables, {2} subjects"
						, _imported_dt.Rows.Count, _imported_dt.Columns.Count, nsubj);

					_imported_dt.AddNeededColumnsBeforeImport(settings);

					Debug.WriteLine("# recs: " + _imported_dt.Rows.Count);
					_imported_dt = _imported_dt.RemoveRowsWithNullID();
					Debug.WriteLine("# recs: " + _imported_dt.Rows.Count);


					string result_sav = "SPSSsav file contains " + msg + "<br/>";
					results.Add(result_sav);

				}
				else if (settings.importfiletype == ImportFiletype.textlines)
				{

					results.Add("<br/>Importing not yet impletented for ImportFiletype.textlines.");
				}
				//}
			}

			sql.Close();

			if (_imported_dt.HasRows())
			{
				string tblinfo = String.Format("local DataTable with {0} rows from a total of {1} rows processed. {2} rows marked as 'NoData'"
					, _imported_dt.Rows.Count, inputfile_rowcounter, nrecs_nodata);
				results.Add(tblinfo);
			}
			else
			{
				results.Add("_imported_dt Has No Rows!");
			}

		}

		public void ConvertLabelsToValues()
		{
			SQL_utils sql = new SQL_utils("data");

			//Get the set of fields and valuesets to transform
			DataTable dt_valsets = sql.DataTable_from_SQLstring(String.Format("select fldname, fieldvaluesetid from def.fld where tblpk={0} and ConvertFromLabelToValue=1", settings.tblpk));

			//Loop through the valuesets 
			List<int> valsetIDs = dt_valsets.AsEnumerable().Select(f => f.Field<int>("fieldvaluesetid")).Distinct().ToList();
			List<string> fldnames = dt_valsets.AsEnumerable().Select(f => f.Field<string>("fldname")).Distinct().ToList();

			foreach (int valsetID in valsetIDs)
			{
				Valueset valset = new Valueset(valsetID);

				//Loop through the fields
				foreach (string fldname in fldnames)
				{

					//Loop through the rows and update the value
					foreach (DataRow row in _imported_dt.Rows)
					{
						row[fldname] = valset.ValueFromLabel(row[fldname].ToString()).ToString();
					}

				}

			}
		}


		public DataTable GetDataTableFromCSVFile(string filepath, string csvfilename, DataImportSettings settings)
		{
			Debug.WriteLine("~~~~~ DataImporter ~~~~~~");
			Debug.WriteLine("~~~~~ GetDataTableFromCSVFile ~~~~~~");
			DataTable dt = EmptyDataTable(settings.tblname);
			string myfilepath = filepath + csvfilename;

			bool has_id = dt.ColumnNames().Contains("id");
			bool hasindexnum = dt.ContainsColumnName("indexnum");

			using (GenericParser parser = new GenericParser())
			{
				parser.SetDataSource(myfilepath);

				parser.ColumnDelimiter = settings.delimiter;   //= "\t".ToCharArray();
				parser.FirstRowHasHeader = settings.firstRowContainsFieldnames;
				parser.SkipStartingDataRows = settings.skipstartingrows;
				parser.MaxBufferSize = 4096;
				parser.MaxRows = settings.rowstoprocess;
				parser.TextQualifier = settings.textqualifier;

				int counter = 0;
				while (parser.Read()) //& counter < 100)
				{
					DataRow row = PopulateRow(dt, parser, settings);

					if (row == null)
					{
						//do nothing for now
					}
					else
					{
						if (row.HasErrors)
						{
							DataColumn[] colArr;
							colArr = row.GetColumnsInError();
							for (int i = 0; i < colArr.Length; i++)
							{
								// Insert code to fix errors on each column.
								Debug.WriteLine(colArr[i].ColumnName);
							}

						}
						else
						{
							//Debug.WriteLine(String.Format("id='{0}'", row["id"].ToString()));

							AddRow(has_id, dt, row);

							//dt.Rows.Add(row);
							if (counter % 100 == 0) Debug.WriteLine("counter = " + counter.ToString());

						}
					}
					counter++;
				}

				inputfile_rowcounter = counter;

			}

			return dt;
		}


		public DataTable GetDataTableFromText(string text, DataImportSettings settings)
		{
			DataTable dt = EmptyDataTable(settings.tblname);

			bool has_id = dt.ColumnNames().Contains("id");

			using (GenericParser parser = new GenericParser())
			{
				parser.SetDataSource(new StringReader(text));

				parser.ColumnDelimiter = settings.delimiter;   //= "\t".ToCharArray();
				parser.FirstRowHasHeader = settings.firstRowContainsFieldnames;
				parser.SkipStartingDataRows = settings.skipstartingrows;
				parser.MaxBufferSize = 4096;
				parser.MaxRows = settings.rowstoprocess;
				parser.TextQualifier = settings.textqualifier;

				int counter = 0;
				DateTime? basedate = null;

				bool usebasedate = false;
				int basedate_importpos = 0;
				foreach (Importfield fld in settings.fields)
				{
					if (fld.mode == FieldExtractionMode.calcDayNum)
					{
						usebasedate = true;
						basedate_importpos = fld.importposition;
					}
				}

				int error_counter = 0;

				while (parser.Read()) //& counter < 100)
				{
					if (error_counter > 1000000)
					{
						parser.Close();
					}
					else
					{

						//CONDITIONS IN WHICH WE NEED TO TO SKIP THE ROW
						bool isSummaryRow = CheckForSummaryRow(parser, 0, settings.measureID);

						if (!isSummaryRow)
						{
							//Debug.WriteLine(counter);
							DataRow row = PopulateRow(dt, parser, settings, basedate);
							if (row == null)
							{
								Debug.WriteLine(String.Format("{0} . . . . . . . . . . . . . . . row is null . . . . . . . . . . . . ", error_counter));
								error_counter++;
								results.Add("ERROR. GetDataTableFromText: No Row! counter = " + counter.ToString());
							}
							else
							{

								if (usebasedate & basedate == null)
								{
									basedate = (DateTime)Convert.ToDateTime(parser[basedate_importpos].ToString());
								}
								if (row != null)
								{

									AddRow(has_id, dt, row);
								}

							}
						}
					}
					if (counter % 100 == 0) Debug.WriteLine(String.Format("counter: {0}  {1}", counter, settings.tblname));
					counter++;

				}

				inputfile_rowcounter = counter;


			}

			return dt;
		}


		public DataTable GetDataTableFromREDCap(string text, DataImportSettings settings)
		{
			DataTable dt = EmptyDataTable(settings.tblname);

			bool has_id = dt.ColumnNames().Contains("id");

			using (GenericParser parser = new GenericParser())
			{
				parser.SetDataSource(new StringReader(text));

				parser.ColumnDelimiter = settings.delimiter;   //= "\t".ToCharArray();
				parser.FirstRowHasHeader = settings.firstRowContainsFieldnames;
				parser.SkipStartingDataRows = settings.skipstartingrows;
				parser.MaxBufferSize = 4096;
				parser.MaxRows = settings.rowstoprocess;
				parser.TextQualifier = settings.textqualifier;

				int counter = 0;
				DateTime? basedate = null;

				bool usebasedate = false;
				int basedate_importpos = 0;
				foreach (Importfield fld in settings.fields)
				{
					if (fld.mode == FieldExtractionMode.calcDayNum)
					{
						usebasedate = true;
						basedate_importpos = fld.importposition;
					}
				}

				int error_counter = 0;

				while (parser.Read()) //& counter < 100)
				{
					if (error_counter > 1000000)
					{
						parser.Close();
					}
					else
					{

						//CONDITIONS IN WHICH WE NEED TO TO SKIP THE ROW
						bool isSummaryRow = CheckForSummaryRow(parser, 0, settings.measureID);

						if (!isSummaryRow)
						{
							//Debug.WriteLine(counter);
							DataRow row = PopulateRow(dt, parser, settings, basedate);
							if (row == null)
							{
								Debug.WriteLine(String.Format("{0} . . . . . . . . . . . . . . . row is null . . . . . . . . . . . . ", error_counter));
								error_counter++;
								results.Add("ERROR. GetDataTableFromText: No Row! counter = " + counter.ToString());
							}
							else
							{

								if (usebasedate & basedate == null)
								{
									basedate = (DateTime)Convert.ToDateTime(parser[basedate_importpos].ToString());
								}
								if (row != null)
								{

									AddRow(has_id, dt, row);
								}

							}
						}
					}
					if (counter % 100 == 0) Debug.WriteLine(String.Format("counter: {0}  {1}", counter, settings.tblname));
					counter++;

				}

				inputfile_rowcounter = counter;


			}

			return dt;
		}


		public static List<string> ReadLinesFromFiles(string filepath, string filename)
		{
			string myfilepath = filepath + filename;
			var logFile = File.ReadAllLines(myfilepath);
			var logList = new List<string>(logFile);
			return logList;
		}




		public DataTable GetDataTableFromXLSX(string filepath, string xlsxfilename, DataImportSettings settings)
		{
			Debug.WriteLine("~~~~~ DataImporter ~~~~~~");
			Debug.WriteLine("~~~~~ GetDataTableFromCSVFile ~~~~~~");
			DataTable dt = EmptyDataTable(settings.tblname);
			string myfilepath = filepath + xlsxfilename;

			bool has_id = dt.ColumnNames().Contains("id");
			bool hasindexnum = dt.ContainsColumnName("indexnum");

			DataSet ds_xlsx = SpreadsheetGearUtils.GetDataSet(myfilepath, false);

			DataTable dt_xlsx = ds_xlsx.Tables[0];
			int counter = 0;
			foreach (DataRow xlrow in dt_xlsx.Rows)
			{
				DataRow row = PopulateRow(dt, xlrow, settings, null);


				if (row == null)
				{
					//do nothing for now
				}
				else
				{
					if (row.HasErrors)
					{
						DataColumn[] colArr;
						colArr = row.GetColumnsInError();
						for (int i = 0; i < colArr.Length; i++)
						{
							// Insert code to fix errors on each column.
							Debug.WriteLine(colArr[i].ColumnName);
						}

					}
					else
					{
						//Debug.WriteLine(String.Format("id='{0}'", row["id"].ToString()));

						AddRow(has_id, dt, row);

						//dt.Rows.Add(row);
						if (counter % 100 == 0) Debug.WriteLine("counter = " + counter.ToString());

					}
				}
				counter++;
			}

			inputfile_rowcounter = counter;


			return dt;
		}



		#endregion


		#region process ROW
		private static bool CheckForSummaryRow(GenericParser parser, int position_to_check, int measureID)
		{
			//For ActigraphStats (measureID 3842) skip row if the first position contains " Summary"
			if (measureID != 3842) return false;
			else
			{
				if (parser[position_to_check].Contains(" Summary")) return true;
			}
			return false;
		}


		private static bool CheckForExcludedRow(GenericParser parser, int position_to_check)
		{
			bool isExcluded = (parser[position_to_check].Contains("EXCLUDED")) ? true : false;
			return isExcluded;
		}


		private static DataRow PopulateRow(DataTable dt, GenericParser parser, DataImportSettings settings)
		{
			DateTime? basedate = null;
			return PopulateRow(dt, parser, settings, basedate);
		}


		private static DataRow PopulateRow(DataTable dt, GenericParser parser, DataImportSettings settings, DateTime? basedate)
		{
			DataRow row = dt.NewRow();

			bool isExcluded = false;
			if (settings.measureID == 4853) isExcluded = (CheckForExcludedRow(parser, 11)); //For ActigraphEpoch check column 11 for "EXCLUDED"


			if (isExcluded)
			{
				return null;
			}
			else
			{
				//try
				//{
				int n_nonnull_flds = 0;
				foreach (Importfield fld in settings.fields)
				{
					fld.type = dt.Columns[fld.field].DataType.ToString();
					fld.basedate = basedate;
					if (fld.ConvertFromLabelToValue)
					{
						fld.valueset = settings.valuesets.Where(v => v.fieldvaluesetid == fld.fieldvaluesetID).First();
					}
					fld.AssignImportValueToProcess(parser);

					string rowfield =  fld.field;
					row[rowfield] = fld.ProcessedValue();

					List<string> flds_to_skip = new List<string> { "id", "studymeasid", "indexnum", "verified" };

					if( !flds_to_skip.Contains(rowfield.ToLower()))
					{
						if (row[rowfield] != DBNull.Value) n_nonnull_flds++;
					}


				}

				if (n_nonnull_flds == 0)
				{
					row["verified"] = 4;
					return row;
				}
				else
				{
					return row;
				}

			}


		}


		private static DataRow PopulateRow(DataTable dt, DataRow source_row, DataImportSettings settings, DateTime? basedate)
		{
			DataRow row = dt.NewRow();

			bool isExcluded = false;
			//if (settings.measureID == 4853) isExcluded = (CheckForExcludedRow(parser, 11)); //For ActigraphEpoch check column 11 for "EXCLUDED"

			if (isExcluded)
			{
				return null;
			}
			else
			{
				try
				{
					foreach (Importfield fld in settings.fields)
					{
						fld.type = dt.Columns[fld.field].DataType.ToString();
						fld.basedate = basedate;
						if (fld.ConvertFromLabelToValue)
						{
							fld.valueset = settings.valuesets.Where(v => v.fieldvaluesetid == fld.fieldvaluesetID).First();
						}
						fld.AssignImportValueToProcess(source_row);

						string rowfield =  fld.field;
						row[rowfield] = fld.ProcessedValue();

						
					}
					return row;
				}
				catch (Exception ex)
				{
					//some error
					return null;
				}
			}


		}


		protected void AddRow(bool has_id, DataTable dt, DataRow row)
		{
			if (row != null)
			{
				if (has_id)
				{
					string row_id = row["id"].ToString();
					if (String.IsNullOrEmpty(row_id))
					{
						row["id"] = settings.ID;
					}
				}
				Debug.WriteLine(row["id"].ToString());
				dt.Rows.Add(row);
			}
		}


		#endregion


		//public static object GetValueFromLabel(string tblname, string type, string imported_label, Importfield fld)
		//{
		//	SQL_utils sql = new SQL_utils("data");

		//	string sqlcode = String.Format("select def.fnGetValue_from_Label ('{0}','{1}', '{2}')", tblname, fld.field, imported_label.Replace("'","''"));

		//	int fieldvaluesetID = sql.IntScalar_from_SQLstring(sqlcode);
		//	sql.Close();

		//	return ConvertValue(type, fieldvaluesetID);
		//}

		//public static object GetParserValue(GenericParser parser, string type, string colname)
		//{
		//	object val = parser[colname];
		//	return ConvertValue(type, val);
		//}


		//public static object GetParserValue(GenericParser parser, string type, int index)
		//{
		//	object val = parser[index];
		//	return ConvertValue(type, val);
		//}


		#region SQL After Insert
		public void SQLAfterInsert()
		{
			//Loop through the fields
			foreach (Importfield fld in settings.fields)
			{
				if (fld.mode == FieldExtractionMode.UpdateAfterInsert)
				{
					UpdateAfterInsertMode AfterInsertMode = (UpdateAfterInsertMode)Convert.ToInt32(fld.constString.Split(';').ToList()[0]);
					string params_text = fld.constString.Split(';').ToList()[1];

					string sqlafterinsert_results = BuildSQLAfterInsert(AfterInsertMode, fld, params_text);

					results.Add(sqlafterinsert_results);


				}
			}
		}

		public string BuildSQLAfterInsert(UpdateAfterInsertMode afterinsertmode, Importfield fld, string params_text)
		{
			string result = null;
			string code = null;
			SQL_utils sql = new SQL_utils("data");

			if (afterinsertmode == UpdateAfterInsertMode.ValFromStudymeasAndField)
			{
				int studymeasidFROM = Convert.ToInt32(params_text.Split(',').ToList()[0]);
				string fldnameFROM = params_text.Split(',').ToList()[1];

				string tblnameFROM = sql.StringScalar_from_SQLstring(
					String.Format("select tblname from def.tbl where measureID=(select measureID from uwautism_research_backend..tblStudymeas where studymeasID={0})", studymeasidFROM));

				code = String.Format("update {0} set {1} = b.[{2}] from (select * from {3} where studymeasID={4}) b WHERE {0}.id = b.id and {0}.studymeasID={5}"
					, settings.tblname, fld.field, fldnameFROM, tblnameFROM, studymeasidFROM, settings.studymeasID);

			}
			else if (afterinsertmode == UpdateAfterInsertMode.ValFromStudymeasAndFieldWithCalculation)
			{
				int studymeasidFROM = Convert.ToInt32(params_text.Split(',').ToList()[0]);
				string fldnameFROM = params_text.Split(',').ToList()[1];
				string calculationCode = params_text.Split(',').ToList()[2];


				string tblnameFROM = sql.StringScalar_from_SQLstring(
					String.Format("select tblname from def.tbl where measureID=(select measureID from uwautism_research_backend..tblStudymeas where studymeasID={0})", studymeasidFROM));

				code = String.Format("update {0} set {1} = b.[{2}]{6} from (select * from {3} where studymeasID={4}) b WHERE {0}.id = b.id and {0}.studymeasID={5}"
					, settings.tblname, fld.field, fldnameFROM, tblnameFROM, studymeasidFROM, settings.studymeasID, calculationCode);

			}
			else if (afterinsertmode == UpdateAfterInsertMode.ExtractFromListAllText)
			{
				string fldnameFROM = params_text;

				string fieldlabel = sql.StringScalar_from_SQLstring(String.Format("select fieldlabel from def.fld where tblpk = {0} and fldname='{1}'"
						, settings.tblpk, fld.field));

				code = String.Format("update {0} set {1} = (case when {2} like '%{3}%' then 1 else 0 end) where studymeasID={4}"
						, settings.tblname, fld.field, fldnameFROM, fieldlabel, settings.studymeasID);

			}
			else if (afterinsertmode == UpdateAfterInsertMode.ExtractOtherFromListAllText)
			{
				string fldnameFROM = params_text;

				string fieldlabel = sql.StringScalar_from_SQLstring(String.Format("select fieldlabel from def.fld where tblpk = {0} and fldname='{1}'"
						, settings.tblpk, fld.field));

				code = String.Format("update {0} set {1} = (case when {2} like '%{3}%' then 1 else 0 end) where studymeasID={4}"
						, settings.tblname, fld.field, fldnameFROM, fieldlabel, settings.studymeasID);

			}




			if (code != null)
			{
				Debug.WriteLine("/****************************************/");
				Debug.WriteLine(String.Format("/********  {0}  **********/", afterinsertmode));
				Debug.WriteLine(code);
				Debug.WriteLine("/****************************************/");


				try
				{
					sql.NonQuery_from_SQLstring(code);
					result = String.Format("Success for UpdateAfterInsert for field '{0}', mode={1}, params='{2}'{3}", fld.field, (int)afterinsertmode, params_text, Environment.NewLine);
				}
				catch (Exception ex)
				{
					result = String.Format("ERROR in UpdateAfterInsert for field '{0}', mode={1}, params='{2}'{3}{4}{3}", fld.field, (int)afterinsertmode, params_text, Environment.NewLine, ex.Message);
				}

			}
			sql.Close();

			return result;
		}

		#endregion





		#region Check the table for subjects, indexnum, etc. 
		public string CheckSubjects(DataTable dt)
		{
			Debug.WriteLine(" **** Begin CheckSubjects *****");
			if (dt.HasRows())
			{
				SQL_utils sql = new SQL_utils("backend");

				if (dt.ContainsColumnName("id") & dt.ContainsColumnName("studymeasid"))
				{
					List<string> ids = dt.AsEnumerable().Select(f => f.Field<string>("id")).Distinct().ToList();
					ids.RemoveAll(item => item == null);
					List<int> studymeasids = dt.AsEnumerable().Select(f => f.Field<int>("studymeasid")).Distinct().ToList();
					List<int> studyids = new List<int>();

					foreach (int studymeasid in studymeasids)
					{
						studyids.Add(sql.IntScalar_from_SQLstring("select studyID from tblStudymeas where studymeasID=" + studymeasid.ToString()));
					}

					studyids = studyids.Distinct().ToList();

					int numnewsubjects = 0;
					foreach (int studyid in studyids)
					{
						foreach (string id in ids)
						{
							string getpersonID = String.Format("select count(*) from trk.vwMasterStatus_S where studyID={0} and id='{1}'", studyid, id);
							int personid = sql.IntScalar_from_SQLstring(getpersonID);
							if (personid == 0)
							{
								Debug.WriteLine(" **** Begin CheckSubjects - no person *****");

								//int anon_hhid = sql.IntScalar_from_SQLstring("select householdID from tblhousehold where hhname='Imported_studyID_" + studyid.ToString() + "'");

								string hhname = String.Format("Imported_stuydyID_{0}", studyid);
								int anon_hhid = sql.IntScalar_from_SQLstring("exec hh.spHousehold_INSERT '" + hhname + "'");
								//sql.Close();


								string newpersoncode = String.Format("insert into tblPerson(householdID, sex, firstname, lastname, ethnicityID, hispanicID) values ( {0}, 'U','{1}','studyid={2}', 7, 3 )"
									, anon_hhid, id, studyid);
								sql.NonQuery_from_SQLstring(newpersoncode);

								Debug.WriteLine(" **** Begin CheckSubjects - person now created *****");
								string newIDcode = String.Format("select personID from tblPerson where firstname='{0}' and lastname='studyid={1}' and householdID={2}", id, studyid, anon_hhid);
								int newpersonID = sql.IntScalar_from_SQLstring(newIDcode);
								sql.NonQuery_from_SQLstring(newpersoncode);

								Debug.WriteLine(" **** Begin CheckSubjects - now have the new personID *****");

								// ---- then make the subject ------
								// count the number of groups
								int ngrps = sql.IntScalar_from_SQLstring("select count(*) from tblGroup where studyID=" + studyid.ToString());
								Debug.WriteLine(" **** Begin CheckSubjects -there are " + ngrps.ToString() + " groups *****");

								// proceed if only there are some groups - NOTE HOWEVER THAT THIS MAY LEAD TO ASSIGNMENT TO A GROUP THAT MAY NEED TO BE CHANGED LATER
								if (ngrps >= 1)
								{
									Debug.WriteLine(" **** Begin CheckSubjects - prepare to add subject *****");

									int groupID = sql.IntScalar_from_SQLstring("select top 1 groupID from tblGroup where studyID=" + studyid.ToString() + " order by sortorder");

									List<SqlParameter> ps = new List<SqlParameter>();
									ps.Add(sql.CreateParam("PersonID", newpersonID.ToString(), "int"));
									ps.Add(sql.CreateParam("StudyID", studyid.ToString(), "int"));
									ps.Add(sql.CreateParam("GroupID", groupID.ToString(), "int"));
									ps.Add(sql.CreateParam("ID", id, "text"));
									ps.Add(sql.CreateParam("SubjectID", "0", "int", "output"));

									int newsubjID = sql.NonQuery_from_ProcName("trk.spCreateSubject_WEB", ps, "SubjectID");

									if (newsubjID > 0)
									{
										numnewsubjects++;
										Debug.WriteLine(String.Format("personID={0} subjID={1} id={2}", newpersonID, newsubjID, id));
									}

								}
								else
								{
									return "There are multiple groups in this study. Cannot create new subjects without specifying which group.";
								}
							}
							else
							{
								//subject with this ID exists
							}
						}
					}

					sql.Close();
					return String.Format("Created {0} new subjects.<br/>", numnewsubjects);
				}
				else
				{
					sql.Close();
					return "Table does not contain 'id' and 'studymeasid' fields.";
				}
				
			}
			else
			{
				return "Table is null or has no rows.";
			}
		}

		//This needs to be done separately for each tbl that is imported into
		public void FixIndexnum(DataTable dt, string tblname)
		{

			if (tblname == "ALL_ObsBehaviorCounts") return;

			Debug.WriteLine(" **** Begin FixIndexnum *****");
			if (dt.HasRows())
			{
				if (dt.ContainsColumnName("indexnum") & dt.ContainsColumnName("id") & dt.ContainsColumnName("studymeasid"))
				{
					SQL_utils sql = new SQL_utils("data");
					DataTable dtmax = sql.DataTable_from_SQLstring(
						String.Format("select id, studymeasid, max(indexnum) maxidx from {0} group by id, studymeasid", tblname));
					sql.Close();

					List<int> studymeasids = dt.AsEnumerable().Select(f => f.Field<int>("studymeasid")).Distinct().ToList();

					if (dtmax.Rows.Count > 0)
					{

					}
					else
					{
						foreach (int studymeasid in studymeasids)
						{
							foreach (DataRow row in dt.Rows)
							{
								string id = row["id"].ToString();

								int maxidx = MaxIndexnum(dt, id, studymeasid);
								row["indexnum"] = maxidx + 1;
							}
						}

					}
				}
			}
		}

		public int MaxIndexnum(DataTable dt, string id, int studymeasid)
		{
			try
			{
				int maxindexnum = dt.AsEnumerable()
					.Where(f => f.Field<string>("id") == id && f.Field<int>("studymeasid") == studymeasid)
					.Max(f => f.Field<int>("indexnum"));
				return maxindexnum;
			}
			catch (Exception ex)
			{
				return 0;
			}
		}

		#endregion



		/* INFO about the Data To Import */

		#region Linked Import Tables and REDCap Forms


		protected void PopulateLinkedImportTbls()
		{
			SQL_utils sql = new SQL_utils("backend");
			main_measureID = sql.IntScalar_from_SQLstring(
				String.Format("select measureID from tblstudymeas where studymeasID={0}", main_studymeasID));

			string importcode = String.Format("select a.*, b.measureid, b.tblname, c.studymeasid, studymeasname " +
				"from (select * from def.LinkedImportTbl " +
				"      where ltpk = (select ltpk from def.LinkedImportTbl where tblpk = (select tblpk from def.tbl where measureID ={0}))) a " +
				"JOIN def.tbl b ON a.tblpk = b.tblpk " +
				"JOIN (select * from uwautism_research_backend..tblstudymeas where timepointID = " +
				" (select timepointID from uwautism_research_backend..tblstudymeas where studymeasID={1})) c ON b.measureID = c.measureID "
				, main_measureID, main_studymeasID);


			sql = new SQL_utils("data");

			dtLinkedImportTbls = sql.DataTable_from_SQLstring(importcode);

			//string tblname = sql.StringScalar_from_SQLstring(
			//	String.Format("select tblname from uwautism_research_data.def.tbl where measureID = (select measureID from tblstudymeas where studymeasID={0})"
			//	, studymeasID));



			if (dtLinkedImportTbls.HasRows())
			{
				studymeasIDs = dtLinkedImportTbls.AsEnumerable().Select(f => f.Field<int>("studymeasid")).ToList();

				if (studymeasIDs.Count > 0)
				{
					results.Add(String.Format("Found {0} linked tables for import.", studymeasIDs.Count));
				}
			}
			else
			{

				string importcode2 = String.Format("SELECT b.tblpk, b.measureid, b.tblname, c.studymeasid, studymeasname " +
					"FROM (select * from def.tbl where measureID={0}) b   " +
					"JOIN (select * from uwautism_research_backend..tblstudymeas where timepointID = " +
					" (select timepointID from uwautism_research_backend..tblstudymeas where studymeasID={1})) c ON b.measureID = c.measureID "
					, main_measureID, main_studymeasID);

				dtLinkedImportTbls = sql.DataTable_from_SQLstring(importcode2);

				studymeasIDs = new List<int> { main_studymeasID };
				results.Add(String.Format("No additional linked tables for import found.", studymeasIDs.Count));

			}
			sql.Close();
		}


		public string LinkedTableInfo()
		{
			if (dtLinkedImportTbls.HasRows())
			{
				string results = "Checking existing records in linked import tables:" + Environment.NewLine;

				foreach (DataRow row in dtLinkedImportTbls.Rows)
				{
					int linkedstudymeasid = Convert.ToInt32(row["studymeasid"]);
					results += ExistingDataInfo(ID, linkedstudymeasid) + Environment.NewLine;
				}
				return results;
			}
			else if (main_studymeasID > 0)
			{
				string results = "Checking existing records in linked import tables:" + Environment.NewLine;
				results += ExistingDataInfo(ID, main_studymeasID);
				return results;
			}
			else
			{
				return "No records entered.";
			}

		}


		protected string ExistingDataInfo(string ID, int localstudymeasID)
		{
			SQL_utils sql = new SQL_utils("data");

			DbEntityInstance studymeas = new DbEntityInstance(
				new DbEntity(DbEntityType.studymeas), localstudymeasID);

			string studymeasname = studymeas.Name();
			string where = studymeas.WhereIn(DbEntityType.measure);

			string measname = studymeas.NameOfRelatedEntity(DbEntityType.measure);

			string tblname = studymeas.NameOfRelatedEntity2(DbEntityType.measure, DbEntityType.tbl);

			string nrecs_code = (ID.StartsWith("Multiple ")) ?
					String.Format("select count(*) from {0} where studymeasID={1}", tblname, localstudymeasID)
				  : String.Format("select count(*) from {0} where ID='{1}' and studymeasID={2}", tblname, ID, localstudymeasID);

			int nrecs = sql.IntScalar_from_SQLstring(nrecs_code, true);

			if (nrecs < 0) return "Error check # records for '" + studymeas + "'";

			int measureID = studymeas.PkvalOfRelatedEntity(DbEntityType.measure);



			////Also count the other Actigraph records 
			//if (measureID == 3842)
			//{
			//	int timepointID = studymeas.PkvalOfRelatedEntity(DbEntityType.timepoint);
			//	string sql_propsID = String.Format("select studymeasID from uwautism_research_backend..tblstudymeas where timepointID={0} and measureID=4855"
			//		, timepointID);
			//	string sql_epochID = String.Format("select studymeasID from uwautism_research_backend..tblstudymeas where timepointID={0} and measureID=4853"
			//		, timepointID);

			//	int studymeasID_props = sql.IntScalar_from_SQLstring(sql_propsID);
			//	int studymeasID_epoch = sql.IntScalar_from_SQLstring(sql_epochID);

			//	int n_props = sql.IntScalar_from_SQLstring(String.Format("select count(*) from ALL_ActigraphProps where ID='{0}' and studymeasID={1}", ID, studymeasID_props));
			//	int n_epoch = sql.IntScalar_from_SQLstring(String.Format("select count(*)  from ALL_ActigraphEpoch where ID='{0}' and studymeasID={1}", ID, studymeasID_epoch));

			//	nrecs = nrecs + n_props + n_epoch;
			//}


			sql.Close();
			string hasrecs = (nrecs > 0) ? "!" : "";
			return String.Format("{0} records for '{1}'{2}", nrecs, studymeas.Name(), hasrecs);

		}


		public static DataTable LinkedREDCapFormsALL(int studyID)
		{
			SQL_utils sql = new SQL_utils("data");


			string code = String.Format("select a.*, b.studyID, form_name, measureID " + Environment.NewLine +
			"from def.REDCapToken a " + Environment.NewLine +
			"join def.REDCapToken_Study b ON a.tokenID = b.tokenID " + Environment.NewLine +
			"join def.REDCAP_Form c ON a.tokenID = c.tokenID " + Environment.NewLine +
			"join uwautism_research.backend..tblMeasure d ON c.measureID = d.measureID " + Environment.NewLine +
			"where b.studyID = {0}", studyID);

			DataTable dt = sql.DataTable_from_SQLstring(code);
			sql.Close();
			return dt;
		}


		public static DataTable LinkedREDCapForms(int studyID, int pk, DbEntityType dbEntityType)
		{
			SQL_utils sql = new SQL_utils("data");
			string code = "";

			if (dbEntityType == DbEntityType.studymeas)
			{
				//code = String.Format("select a.*, b.studyID, redcapformID, form_name, form_name2, c.measureID, measname, studymeasID, studymeasname " + Environment.NewLine +
				//"from def.REDCapToken a " + Environment.NewLine +
				//"join def.REDCapToken_Study b ON a.tokenID = b.tokenID " + Environment.NewLine +
				//"join def.REDCAP_Form c ON a.tokenID = c.tokenID " + Environment.NewLine +
				//"join uwautism_research_backend..tblMeasure d ON c.measureID = d.measureID " + Environment.NewLine +
				//"join uwautism_research_backend..tblStudyMeas e ON d.measureID = e.measureID " + Environment.NewLine +
				//"where e.studymeasID = {0} and b.studyID={1}", pk, studyID);

				code = String.Format("select * from def.vwREDCap_LinkedImportTbls where ltpk in " + Environment.NewLine +
					"(select ltpk from def.vwREDCap_LinkedImportTbls where studymeasID = {0}  and studyID = {1})", pk, studyID);

			}
			else if (dbEntityType == DbEntityType.measure)
			{
				//code = String.Format("select a.*, b.studyID, redcapformID, form_name, form_name2, c.measureID, measname " + Environment.NewLine +
				//"from def.REDCapToken a " + Environment.NewLine +
				//"join def.REDCapToken_Study b ON a.tokenID = b.tokenID " + Environment.NewLine +
				//"join def.REDCAP_Form c ON a.tokenID = c.tokenID " + Environment.NewLine +
				//"join uwautism_research_backend..tblMeasure d ON c.measureID = d.measureID " + Environment.NewLine +
				//"where d.measureID = {0} and b.studyID={1}", pk, studyID);

				code = String.Format("select * from def.vwREDCap_LinkedImportTbls where ltpk in " + Environment.NewLine +
					"(select ltpk from def.vwREDCap_LinkedImportTbls where measureID = {0}  and studyID = {1})", pk, studyID);
			}



			DataTable dt = sql.DataTable_from_SQLstring(code);
			sql.Close();
			return dt;
		}


		public static DataTable LinkedImports(int studyID)
		{
			SQL_utils sql = new SQL_utils("data");

			string code = String.Format("select a.* from def.LinkedImport a " + Environment.NewLine +
				"  left join (select ltpk, count(*) n from def.LinkedImportTbl group by ltpk) e ON a.ltpk = e.ltpk " + Environment.NewLine +
				" where e.n is null or a.ltpk in (select ltpk from def.LinkedImportTbl " + Environment.NewLine +
				" where tblpk in (select tblpk from def.Tbl where measureID in " + Environment.NewLine +
				" (select measureID from uwautism_research_backend..tblstudymeas where studyID={0} )))", studyID);

			DataTable dt = sql.DataTable_from_SQLstring(code);
			sql.Close();
			return dt;
		}
		
		
		public static DataTable LinkedImportTbls(int studyID)
		{
			SQL_utils sql = new SQL_utils("data");
			string code = "  select a.*, b.tblpk, tblname, measname, b.sortorder from [def].[LinkedImport] a  " + Environment.NewLine +
				"  join [def].[LinkedImportTbl] b ON a.ltpk = b.ltpk " + Environment.NewLine +
				"  join def.Tbl c ON b.tblpk = c.tblpk " + Environment.NewLine +
				"  join uwautism_research_backend..tblmeasure d ON c.measureID = d.measureID " + Environment.NewLine +
				" where a.ltpk in (select ltpk from def.LinkedImportTbl " + Environment.NewLine +
				" where tblpk in (select tblpk from def.Tbl where measureID in " +
				" (select measureID from uwautism_research_backend..tblstudymeas where studyID=" + studyID.ToString() + ")))" +
				" order by a.ltpk, sortorder, d.measname";
			DataTable dt = sql.DataTable_from_SQLstring(code);
			sql.Close();
			return dt;
		}

		public static DataTable AvailableMeasuresForLinking(int studyID)
		{
			SQL_utils sql = new SQL_utils("data");
			string code = String.Format("select tblpk, measname from def.Tbl a " +
				" JOIN uwautism_research_backend..tblmeasure  b ON a.measureID=b.measureID where measureID in " +
				" (select measureID from uwautism_research_backend..tblstudymeas where studyID={0} )", studyID);
			DataTable dt = sql.DataTable_from_SQLstring("select tblpk, measname from def.Tbl");
			sql.Close();
			return dt;
		}
		#endregion


		/* MISC */
		public void DeleteRecs()
		{


			if (dtLinkedImportTbls.Rows.Count > 0)
			{
				foreach (DataRow row in dtLinkedImportTbls.Rows)
				{
					string del_tblname = row["tblname"].ToString();
					int del_studymeasID = Convert.ToInt32(row["studymeasID"]);

					DeleteRecs(del_tblname, del_studymeasID);

				}
			}
			else if (main_studymeasID > 0 & !String.IsNullOrEmpty(settings.tblname))
			{

				DeleteRecs(settings.tblname, main_studymeasID);
			}


			////Also delete the other Actigraph records if needed
			//if (measureID == 3842)
			//{
			//	int timepointID = studymeas.PkvalOfRelatedEntity(DbEntityType.timepoint);
			//	string sql_propsID = String.Format("select studymeasID from uwautism_research_backend..tblstudymeas where timepointID={0} and measureID=4855"
			//		, timepointID);
			//	string sql_epochID = String.Format("select studymeasID from uwautism_research_backend..tblstudymeas where timepointID={0} and measureID=4853"
			//		, timepointID);

			//	int studymeasID_props = sql.IntScalar_from_SQLstring(sql_propsID);
			//	int studymeasID_epoch = sql.IntScalar_from_SQLstring(sql_epochID);

			//	sql.NonQuery_from_SQLstring(String.Format("delete from ALL_ActigraphProps where ID='{0}' and studymeasID={1}", ID, studymeasID_props));
			//	sql.NonQuery_from_SQLstring(String.Format("delete from ALL_ActigraphEpoch where ID='{0}' and studymeasID={1}", ID, studymeasID_epoch));

			//}



		}


		public void DeleteRecs(string del_tblname, int del_studymeasID)
		{
			SQL_utils sql = new SQL_utils("data");

			string nrecs_code = (ID.StartsWith("Multiple ")) ?
							String.Format("select count(*) from {0} where studymeasID={1}", del_tblname, del_studymeasID)
						  : String.Format("select count(*) from {0} where ID='{1}' and studymeasID={2}", del_tblname, ID, del_studymeasID);

			string sqlcode = (ID.StartsWith("Multiple ")) ?
				  String.Format("delete from {0} where  studymeasID={1}", del_tblname, del_studymeasID)
				: String.Format("delete from {0} where ID='{1}' and studymeasID={2}", del_tblname, ID, del_studymeasID);
			sql.NonQuery_from_SQLstring(sqlcode);

			sql.Close();
		}

		public string ResultsToString()
		{
			string info = "";
			foreach (string s in results)
			{
				info += String.Format("{0}{1}", Environment.NewLine, s);
			}

			return info;
		}

	

	}

}