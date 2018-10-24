﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using LinqStatistics;

namespace uwac.data
{
	/// <summary>
	/// Summary description for dataproject
	/// </summary>
	public class Dataproject
	{
		private DataSet _dataset;
		private DataSet _dataset_components;
		private int _dataproj_pk;
		private int _studyID;
		private List<int> _subjID_list;
		private List<int> _studymeasID_list;
		private List<int> _timepointID_list;
		private List<int> _fldpk_list;


		private List<string> _ID_list;
		private List<string> _measureID_list;
		private List<string> _fldname_list;

		public DataSet Dataset { get { return _dataset; }  }
		public int Dataproj_pk { get; set; }
		public List<int> SubjID_list { get; set; }
		public List<int> StudymeasID_list { get; set; }

		private List<string> MeasureID_list { get; set; }


		//internal vars used to process & generate data
		private List<string> _tbls_to_process = new List<string>();
		private List<string> _messages = new List<string>();
		private List<string> _meas_to_skip = new List<string>();
		private List<string> _sqlcode_tbl = new List<string>();
		private List<string> _sqlcode_tbl_mult = new List<string>();
		private List<string> _measname_mult = new List<string>();
		private List<string> _sqlcode_tbl_dups = new List<string>();
		private List<string> _sqlcode_vars = new List<string>();
		private List<string> _sqlcode_vars_mult = new List<string>();
		private List<string> _measname_dups = new List<string>();
		private List<string> _fldname_list_noskips = new List<string>();
		private string _sqlcode_subj;


		//Creates a DataProject
		public Dataproject(int dataproj_pk)
		{
			_dataproj_pk = dataproj_pk;
			

			GetDataprojectComponents();

			CreateSqlForMeasures();
			CreateSqlForIntHx();
			GetData();


			if (this._dataset.Tables.Contains("CompVars"))
			{
				if (this._dataset.Tables["CompVars"].Rows.Count > 0)
				{
					GetCompvars();
					CalculateZscores();
				}
			}

			//StackData();
		}



		public Dataproject(int dataproj_pk, int studyID, List<int> subjID_list, List<int> studymeasID_list, List<int> fldpk_list)
		{
			_dataproj_pk = dataproj_pk;
			_studyID = studyID;
			_subjID_list = subjID_list;
			_studymeasID_list = studymeasID_list;

		}



		private void GetDataprojectComponents()
		{
			SQL_utils sql = new SQL_utils("data");
			_studyID = sql.IntScalar_from_SQLstring("select studyID from dp.DataProject where dataproj_pk=" + _dataproj_pk.ToString());
			//this._dataset_components = sql.DataSet_from_ProcName("dp.spDataprojectComponents", sql.CreateParam("dataproj_pk", _dataproj_pk.ToString(), "int"));
			this._dataset = sql.DataSet_from_ProcName("dp.spDataProject_MetaData", sql.CreateParam("dataproj_pk", _dataproj_pk.ToString(), "int"));

			this._dataset.Tables[0].TableName = "Subjects";
			this._dataset.Tables[1].TableName = "Subjects_Excluded";
			this._dataset.Tables[2].TableName = "DataDictionary";
			this._dataset.Tables[3].TableName = "CompVars";
			this._dataset.Tables[4].TableName = "Measures";
			this._dataset.Tables[5].TableName = "Timepoints";
			this._dataset.Tables[6].TableName = "Subj Timepoints";

			AddInfoTable();
			//this._dataset_components.Tables[0].TableName = "Subjects";
			//this._dataset_components.Tables[1].TableName = "StudyMeasures";
			//this._dataset_components.Tables[2].TableName = "Measures";
			//this._dataset_components.Tables[3].TableName = "Timepoints";
			//this._dataset_components.Tables[4].TableName = "Variables";

			//_subjID_list = _dataset_components.Tables["Subjects"].AsEnumerable().Select(f => f.Field<int>("subjID")).ToList();
			_ID_list = _dataset.Tables["Subjects"].AsEnumerable().Select(f => f.Field<string>("id")).ToList();
			_timepointID_list = _dataset.Tables["Timepoints"].AsEnumerable().Where(f => f.Field<int?>("timepointID")>0).Select(f => f.Field<int>("timepointID")).ToList();


			RemoveTableIfRowsEq0("Subjects_Excluded");
			RemoveTableIfRowsEq0("CompVars");
			RemoveTableIfRowsEq0("Subj Timepoints");


			_fldname_list = _dataset.Tables["DataDictionary"].AsEnumerable().Select(f => f.Field<string>("varname")).ToList();

		}

		private void RemoveTableIfRowsEq0(string tbl)
		{
			int nrows = _dataset.Tables[tbl].Rows.Count;

			if (nrows == 0)
			{
				DataTableCollection tablesCol = _dataset.Tables;

				if (tablesCol.Contains(tbl) && tablesCol.CanRemove(tablesCol[tbl]))
					tablesCol.Remove(tbl);
			}
		}


		private void AddInfoTable()
		{
			//Create the table to hold the summary information after processing 
			DataTable dtmsg = new DataTable();
			dtmsg.Columns.Add(new DataColumn("Measure", typeof(string)));
			dtmsg.Columns.Add(new DataColumn("N_Records", typeof(int)));
			dtmsg.Columns.Add(new DataColumn("N_IDs", typeof(int)));
			dtmsg.Columns.Add(new DataColumn("N_TimePts", typeof(int)));
			dtmsg.Columns.Add(new DataColumn("N_Vars", typeof(int)));
			dtmsg.Columns.Add(new DataColumn("Message", typeof(string)));
			dtmsg.TableName = "SummaryInfo";

			this._dataset.Tables.Add(dtmsg);


		}


		private void LoadDataDictionary()
		{


		}


		private string CreateTxgrpCode(int studyID){
			string txgrp_code = " ";

			// Tadpole
			if (studyID==1076 | studyID==1077) txgrp_code = " txprop1value as txstyle, txprop2value as txintensity, coalesce(txgrp, '**NA**') txgrp, ";
			// TAP
			else if (studyID==1065 | studyID == 1011 | studyID == 1015 | studyID == 1022 | studyID == 1030) txgrp_code = " coalesce(txgrp, '**NA**') txgrp, ";
			// Path
			else if (studyID == 1065 | studyID == 1072) txgrp_code = " coalesce(txgrp, '**NA**') txgrp, ";
			// Tadpole
			else if (studyID == 1039 | studyID == 1073) txgrp_code = " coalesce(txgrp, '**NA**') txgrp, ";

			return txgrp_code;
		}


		private string CreateStartdateCode(int studyID)
		{
			string startdate_code = " ";

			List<int> tx_studies = new List<int> { 1011, 1015, 1022, 1030, 1039, 1073, 1065, 1072, 1076, 1077 };

			if (tx_studies.Contains(studyID)) startdate_code = "convert(VARCHAR, studystart, 101) studystart, " + 
			   " convert(VARCHAR, txstart, 101) txstart, studystart_agemos, txstart_agemos, txstartnote,";


			return startdate_code;
		}


		private void CreateSqlForMeasures()
		{
			SQL_utils sql = new SQL_utils("data");

			//Step 0 - Determine whether txgrp should be included

			string txgrp_code = CreateTxgrpCode( _studyID);
			string startdate_code = CreateStartdateCode(_studyID);


			//Step 1 - Subjects CROSS JOIN with Timepoints

			_sqlcode_subj = String.Format(Environment.NewLine + " /*SUBJECTS*/ ( select ref_id, studyname, timept, a1.id, [group], {0} " + Environment.NewLine +
				"  subjstatus, subjstatusdetail, sex, race, ethnicity " + Environment.NewLine +
				" , {1} a1.personID, a1.subjID, studyID  " + Environment.NewLine +
				" fROM ( " + Environment.NewLine +
				"    select  dp.fnRef_ID({2}, personID) as ref_id " + Environment.NewLine +
				"    , * from uwautism_research_backend.trk.vwMasterStatus_S_wTimept   " + Environment.NewLine +
				"    where timepointID in " + Environment.NewLine +
				"           (select distinct(timepointID) from dp.Meas m1 " + Environment.NewLine +
				"             JOIN uwautism_research_backend..tblStudymeas m2 ON m1.studymeasID = m2.studymeasID " + Environment.NewLine +
				"             where dataproj_pk = {3} /**/) " + Environment.NewLine +
				"       ) a1 " + Environment.NewLine +
				" JOIN ( " + Environment.NewLine +
				"        select * from dp.vwSubj where subjset_pk = " + Environment.NewLine +
				"             (select subjset_pk from dp.DataProject where dataproj_pk =  {3} /**/) " + Environment.NewLine +
				"      ) a2 ON a1.personID = a2.personID " + Environment.NewLine +
				" ) a "+ Environment.NewLine 
				, txgrp_code
				, startdate_code
				, _studyID
				, _dataproj_pk);




			//string _sqlcode_subj_IDs = String.Format(" (select id from dp.subj s1 " +
			//	"  join uwautism_research_backend..tblsubject s2 ON s1.subjID = s2.subjID" +
			//	"   where subjset_pk = (select subjset_pk from dp.DataProject where dataproj_pk ={0})) ", _dataproj_pk.ToString());

			//_sqlcode_subj = String.Format("(select id, timepoint_text timept, groupname as [group], {0}  subjstatus, subjstatusdetail, sex " +
			//	" , coalesce(ethnicitydesc, 'UNKNOWN') as race, coalesce(hispanicdesc, 'UNKNOWN') as ethnicity " +
			//	" , subjNotes, {1} subjID " +
			//	" from  ( select * from uwautism_research_backend..vwMasterStatus_S_txgrp where studyID={4} and ID in {5} ) a1 " +
			//	" CROSS JOIN (select timepoint_text from uwautism_research_backend..tbltimepoint " + 
			//	"     where studyID in {2} and timepointID in ({3}) ) a2 " +   //all the relevant timepoints
			//	//" where studyID in {4} and a1.ID in {5} " +					   // but just the ID's from the main study
			//	"   ) a "
			//	, txgrp_code
			//	, startdate_code
			//	, sql_distinct_studies
			//	, uwac.trk.dataops.GetCSV(_timepointID_list)
			//	, _studyID.ToString()
			//	, _sqlcode_subj_IDs
			//	);

				
				//what we actually need is to get the actual subjID for each timepoint
				//because they might be in different studies
				//ADD A NEW TAB THAT IS SubjectTimepts !!!!!!!
				//TODO !!!!!!


			int NsSubjTp = sql.DataTable_from_SQLstring(string.Format("select * from {0}", _sqlcode_subj)).Rows.Count;

			//Step 2 - Loop through Measures and process
			//  a) check N's
			//	b) ?

			_messages.Add("<b>Data Loading...</b>");

			string msg = "";
			int counter = 0;
			for(int t=0; t < _dataset.Tables["Measures"].Rows.Count; t++)
			{

				DataRow row = _dataset.Tables["Measures"].Rows[t];

				CreateSqlForMeasure(sql, row, t, counter, msg);


				counter++;
			}


			sql.Close();
		}






		private void CreateSqlForIntHx()
		{
			SQL_utils sql = new SQL_utils("data");
			int studyIDfull = _studyID;
			studyIDfull = sql.IntScalar_from_SQLstring("select coalesce(fullstudyID * 10000, studyID) from uwautism_research_backend..tblstudy where studyID = " + _studyID.ToString());


			DataTable dtvars = sql.DataTable_from_SQLstring("select * from[dp].[Var] where varname != 'nwks_in_tp' and  measureID = 749 and dataproj_pk = " + _dataproj_pk.ToString());


			if (dtvars.Rows.Count > 0)
			{
				#region IntHx vars by TimePt
				List<string> inthx_vars = dtvars.AsEnumerable().Select(f => f.Field<string>("varname")).ToList();

				string _sqlcode_inthx_subjects = 
					"/*SUBJECTS*/ " + Environment.NewLine +
					"( " + Environment.NewLine +
					"select  /*studyname, timept,*/ a1.id, groupname[group],  coalesce(txgrp, '**NA**') txgrp " + Environment.NewLine +
					", convert(VARCHAR, studystart, 101) studystart,  convert(VARCHAR, txstart, 101) txstart, studystart_agemos, txstart_agemos, txstartnote, a1.personID, a1.subjID, studyID " + Environment.NewLine +
					" fROM ( " + Environment.NewLine +
					"	select * from uwautism_research_backend..vwMasterStatus_S_txgrp ) a1 " + Environment.NewLine +
					" JOIN( " + Environment.NewLine +
					"		select * from dp.vwSubj where subjset_pk = " + Environment.NewLine +
					"			 (select subjset_pk from dp.DataProject where dataproj_pk = " + _dataproj_pk.ToString() + ") " + Environment.NewLine +
					"      ) a2 ON  a1.SubjID = a2.subjID " + Environment.NewLine +
					" ) a " + Environment.NewLine;

				string sql_inthx_body = "select timept, id, id id_inthx, nwks_in_tp, " + String.Join(",", inthx_vars) + Environment.NewLine +
					" from ALL_MIND_IntHx_vers2_STACKED_TIMEPT_2018 " + Environment.NewLine +
					" where studyIDfull = " + studyIDfull.ToString() + Environment.NewLine +
					" and timept in  " + Environment.NewLine +
					" (select * from dbo.UDF_CSVToTable((select inthx_timepts from dp.DataProject where dataproj_pk = " + _dataproj_pk.ToString() + "),','))" + Environment.NewLine +
					" and personID in  " + Environment.NewLine +
					" (select personID from uwautism_research_backend..vwmasterstatus_S_txgrp where subjID in " + Environment.NewLine +
					" 	(select subjID from dp.Subj where subjset_pk = (select subjset_pk from dp.DataProject where dataproj_pk = " + _dataproj_pk.ToString() + " ))) " ;


				string x = _sqlcode_subj;

				string sql_inthx_final = String.Format("select a.*, timept, nwks_in_tp, {0} from {1} left join ({2}) ih ON a.ID=ih.ID  order by a.ID, timept "
					, String.Join(",", inthx_vars), _sqlcode_inthx_subjects, sql_inthx_body);


				DataTable dt = sql.DataTable_from_SQLstring(sql_inthx_final );
				string inthx_by_tp = "Data_IntHx_by_TP";
				dt.TableName = inthx_by_tp;

				string msg = String.Format("{0} added as separate worksheet. (See: Data > IntHx Tx Types & Categories - for info regarding categories)", inthx_by_tp);

				//Since this isn't part of "Data" add directly to the dset 
				_dataset.Tables.Add(dt);


				string tmp_body = String.Format("LEFT JOIN ({0})  inthx  ON a.id=inthx.id_inthx and a.TimePt= inthx.timept", sql_inthx_body);
				_sqlcode_tbl.Add(tmp_body);


				_sqlcode_vars.Add("nwks_in_tp");
				_sqlcode_vars.Add(String.Join(",", inthx_vars));

				//Add this table to those to be processed
				_tbls_to_process.Add("IntHx");

				DataRow r = _dataset.Tables["SummaryInfo"].NewRow();
				r["Measure"] = "IntHx";
				r["Message"] = msg;
				r["N_records"] = dt.Rows.Count;
				r["N_IDs"] = dt.AsEnumerable().Select(f => f.Field<string>("id")).Distinct().Count();
				r["N_TimePts"] = dt.AsEnumerable().Select(f => f.Field<string>("timept")).Distinct().Count();
				r["N_Vars"] = inthx_vars.Count + 1;

				_dataset.Tables["SummaryInfo"].Rows.Add(r);
				#endregion


				#region TOTal vars - one row per subject 

				bool makeonerowpersubject = true;

				if (makeonerowpersubject)
				{
					DataTable dtvarstot = sql.DataTable_from_SQLstring("select * from vwIntHx2018_Vars where dataproj_pk = " + _dataproj_pk.ToString());

					List<string> totinthx_vars = dtvarstot.AsEnumerable().Select(f => f.Field<string>("totvarname")).ToList();
					List<string> totinthx_varscode = dtvarstot.AsEnumerable().Select(f => f.Field<string>("totvarcode")).ToList();


					string sql_totinthx_body = "select studyIDfull, id , count(distinct(timept)) nunq_timept, min(timept) min_timept, max(timept) max_timept, sum(nwks_in_tp) tot_nwks_in_tp, " +
					 String.Join(",", totinthx_varscode) + Environment.NewLine +
						" from ALL_MIND_IntHx_vers2_STACKED_TIMEPT_2018 " + Environment.NewLine +
						" where studyIDfull = " + studyIDfull.ToString() + " and timept in " + Environment.NewLine +
						" (select * from dbo.UDF_CSVToTable((select inthx_timepts from dp.DataProject where dataproj_pk = " + _dataproj_pk.ToString() + "),','))" + Environment.NewLine +
						" group by studyIDfull, id ";


					string sql_totinthx_final = String.Format("select a.*, nunq_timept, min_timept, max_timept, tot_nwks_in_tp " +
						" , {0} from {1} left join ({2}) ih ON a.ID=ih.ID  order by a.ID "
						, String.Join(",", totinthx_vars), _sqlcode_inthx_subjects, sql_totinthx_body);


					DataTable dt2 = sql.DataTable_from_SQLstring(sql_totinthx_final);
					string totinthx_by_tp = "Data_IntHx_TOTAL";
					dt2.TableName = totinthx_by_tp;

					string msg2 = String.Format("{0} added as separate worksheet.  (See: Data > IntHx Tx Types & Categories - for info regarding categories)", totinthx_by_tp);

					//Since this isn't part of "Data" add directly to the dset 
					_dataset.Tables.Add(dt2);


					////For now we are not adding the total into the main Data
					//string tmp_body = String.Format("LEFT JOIN ({0})  inthx  ON a.id=inthx.id_inthx and a.TimePt= inthx.timept", sql_inthx_final);
					//_sqlcode_tbl.Add(tmp_body);
					//_sqlcode_vars.Add("tot_nwks_in_tp");
					//sqlcode_vars.Add(String.Join(",", totinthx_vars));

					////Add this table to those to be processed
					//_tbls_to_process.Add("IntHx");

					DataRow r2 = _dataset.Tables["SummaryInfo"].NewRow();
					r2["Measure"] = "TOTAL IntHx";
					r2["Message"] = msg2;
					r2["N_records"] = dt2.Rows.Count;
					r2["N_IDs"] = dt2.AsEnumerable().Select(f => f.Field<string>("id")).Distinct().Count();
					r2["N_TimePts"] = -999;
					r2["N_Vars"] = totinthx_vars.Count + 1;

					_dataset.Tables["SummaryInfo"].Rows.Add(r2);
				}
				#endregion  


			}

			sql.Close();
		}


		private void CreateSqlForMeasure(SQL_utils sql, DataRow row, int t, int counter, string msg) {

			string tblname = row["tblname"].ToString();
			string measname = row["measname"].ToString();
			int measureID = Convert.ToInt32(row["measureID"]);
			string studymeasID_csv = row["studymeasID_csv"].ToString().Replace(";","");
			string fldpk_csv = row["fldpk_csv"].ToString().Replace(";", "");
			string ID_csv = trk.dataops.GetCSV(_ID_list);

			int N_vars = (String.IsNullOrEmpty(fldpk_csv)) ? 0 : fldpk_csv.Split(',').Length;
			int Ns1_N = 0;
			int Ns1_IDs = 0;
			int Ns1_TimePts = 0;

			List<int> inthx_measureIDs = new List<int> { 815, 816, 817, 819 };
			List<int> actigraph_measureIDs= new List<int> { 3842, 4853, 4855 }; //Actigraph measures



			if (N_vars == 0)
				{
				//No Data so don't include
				msg = String.Format("No variables selected.", measname);

			}
			else
			{
				//Check the N's for the selected studymeas
				string check_Ns1 = String.Format(" select count(*) N, count(distinct(dbo.fnGetTimePoint_text_from_StudymeasID(studymeasID))) N_TimePts " +
				" , count(distinct(id)) N_IDs  " +
				" from {0} where verified in (0,1) and studymeasID in ({1}) and ID in ({2} )", tblname, studymeasID_csv, ID_csv);
				DataTable Ns1 = sql.DataTable_from_SQLstring(check_Ns1);
				Ns1_N = Ns1.Rows[0].Field<int>("N");
				Ns1_TimePts = Ns1.Rows[0].Field<int>("N_TimePts");
				Ns1_IDs = Ns1.Rows[0].Field<int>("N_IDs");


				//Check for Dups by ID within a single studymeas
				string check_Ns2 = String.Format(" select ID, studymeasID, count(*) n from {0} where verified in (0,1) and studymeasID in ({1}) and ID in ({2}) " +
					" group by ID, studymeasID  having count(*) > 1 ", tblname, studymeasID_csv, ID_csv);
				DataTable dups = sql.DataTable_from_SQLstring(check_Ns2);
				int Ns2 = dups.Rows.Count;
				string remove_dup_IDs = "";
				var dupsIDs_csv = "";


				// STEP 0 - Actigraph
				if ( actigraph_measureIDs.Contains(measureID))
				{
					//Wait until next step
				}

				#region  STEP 1 - check for dups in a studymeas.

				else if (Ns2 > 0 )
				{
					//IF there are ID's with dups in a studymeas, remove it when checking the next type of dups
					string plural = (Ns2 > 1) ? "s" : "";
					var dupsIDs = dups.AsEnumerable().Select(f => f.Field<string>("ID")).ToList();
					dupsIDs_csv = String.Join("','", dupsIDs);
					remove_dup_IDs = " and a.ID not in ('" + dupsIDs_csv + "') ";
				}
				#endregion


				#region STEP 2 - check for measures collected more than once in a given timepoint.

				//Dups by ID within a TimePoint and Measure.
				//If there are dups here, we don't want to join it with the other measures.
				//These will be skipped when creating the unified file.
				string check_Ns3 = String.Format(" select a.ID, measureID, b.timepointID, c.timepoint_text, count(*) n from {0} a " +
				" join uwautism_research_backend..tblstudymeas b ON a.studymeasID=b.studymeasID " +
				" join uwautism_research_backend..tbltimepoint c ON b.timepointID=c.timepointID " +
				" where verified in (0,1) and a.studymeasID in ({1}) and a.ID in ({2}) {3} " +
				" group by a.ID, measureID, b.timepointID, c.timepoint_text having count(*) > 1 ", tblname, studymeasID_csv, ID_csv, remove_dup_IDs);


				DataTable dups3 = sql.DataTable_from_SQLstring(check_Ns3);
				int Ns3 = dups3.Rows.Count;

				Debug.Print(String.Format("tbl={0} Ns2={1} Ns3={2} sm={3}", tblname, Ns2, Ns3, studymeasID_csv));
				#endregion


				#region STEP 3 - make sure there are at least some records. 

				if (Ns1_N == 0)
				{
					//No Data so don't include
					msg = String.Format("No records for these subjects.", measname);
				}

				//STEP 3b - MULTIPLE, prepare to save this measure as it's own table. 
				else if (Ns3 > 0 )
				{
					//Collected Multiple Times
					_meas_to_skip.Add(measureID.ToString());
					msg = String.Format("{0} collected multiple times within a timepoint. Placed on separate worksheet.", measname);


					//NEXT get the fieldnames
					//AND automatically create an "_agemos" variable for every date variable that is selected
					//  - this is the UNION portion of the query.
					string sqlcode_flds = String.Format("select fldname, fldname_miss2null, flddatatype  from def.vwFld " +
						" where fldpk in ({0}) and tblpk=(select tblpk from def.tbl where measureID={1} ) " +
						" UNION " +
						" select fldname + '_agemos' as fldname, 'dbo.fnDate_AgeMos_from_studymeasID_fromDays(studymeasID,ID,' + fldname + ') as ' + fldname + '_agemos'" +
						"   as fldname_agemos, flddatatype  from def.vwFld " +
						" where fldpk in ({0}) and flddatatype='date' and tblpk=(select tblpk from def.tbl where measureID={1} ) "
						, fldpk_csv, measureID, t);
					DataTable flds = sql.DataTable_from_SQLstring(sqlcode_flds);


					//vars_names   contains the list of var names (without the additional code to recode missing or calculate age)
					List<string> vars_names = flds.AsEnumerable().Select(f => f.Field<string>("fldname")).ToList();


					//Check to see if there any are reliability 
					int hasREL = sql.IntScalar_from_SQLstring("select  coalesce(sum(dbo.fnStudymeas_IsREL(studymeasID)),0) as hasREL " +
							" from   dp.Meas where dataproj_pk = " + _dataproj_pk.ToString() + " and measureID = " + measureID.ToString());

					string _sqlcode_calc_REL_vars = "";

					//Add the REL vars if needed
					// the dp.fnGet_RELKEY function returns the tablePK for the original coding for both the ORIG and the REL so that cases can be matched on this.
					if (hasREL > 0)
					{
						_sqlcode_calc_REL_vars = " , (case when uwautism_research_backend.dbo.fnIsREL(studymeasID) = 1 then 'REL' else '' end) isREL " +
							", dp.fnGet_RELKEY(id, studymeasID) RELKEY ";
						vars_names.Add("isREL");
						vars_names.Add("RELKEY");
					}


					//vars_no_quote  contains the syntax needed recode missing values and calculate ages
					//  this goes in the body of the LEFT JOIN clause
					List<string> vars_recode = flds.AsEnumerable().Select(f => f.Field<string>("fldname_miss2null")).ToList();

					//DEL?
					//_sqlcode_vars_mult.Add(String.Join(",", vars_recode));
					_sqlcode_vars_mult.Add(String.Join(",", vars_names));


					string _sqlcode_final_mult = String.Format(Environment.NewLine + " LEFT JOIN (select {2}, id as id{1}, studymeasID as smID{1} " + Environment.NewLine +
						" {4} " + Environment.NewLine +
						" from {0} " + Environment.NewLine +
						" where verified in (0,1) and studymeasID in ({3}) ) t{1} ON a.id=t{1}.id{1} and a.TimePt=dbo.fnGetTimePoint_text_from_StudymeasID(t{1}.smID{1})" + Environment.NewLine
						, tblname, t, String.Join(",", vars_recode), studymeasID_csv, _sqlcode_calc_REL_vars);

					//!!!!
					_measname_mult.Add(measname);
					_sqlcode_tbl_mult.Add(_sqlcode_final_mult);


				}

				//STEP 3c - Actigraph, prepare to save this measure as it's own table. 
				else if (actigraph_measureIDs.Contains(measureID))
				{
					//Collected Multiple Times
					_meas_to_skip.Add(measureID.ToString());
					msg = String.Format("{0} collected multiple times within a timepoint. Placed on separate worksheet.", measname);


					//NEXT get the fieldnames
					//AND automatically create an "_agemos" variable for every date variable that is selected
					//  - this is the UNION portion of the query.
					string sqlcode_flds = String.Format("select fldname, flddatatype  from def.vwFld " +
						" where fldpk in ({0}) and tblpk=(select tblpk from def.tbl where measureID={1} ) " +
						" UNION " +
						" select fldname + '_agemos' as fldname, 'dbo.fnDate_AgeMos_from_studymeasID_fromDays(studymeasID,ID,' + fldname + ') as ' + fldname + '_agemos'" +
						"   as fldname_agemos, flddatatype  from def.vwFld " +
						" where fldpk in ({0}) and flddatatype='date' and tblpk=(select tblpk from def.tbl where measureID={1} ) "
						, fldpk_csv, measureID, t);
					DataTable flds = sql.DataTable_from_SQLstring(sqlcode_flds);


					//vars_names   contains the list of var names (without the additional code to recode missing or calculate age)
					List<string> vars_names = flds.AsEnumerable().Select(f => f.Field<string>("fldname")).ToList();

					_sqlcode_vars_mult.Add(String.Join(",", vars_names));

					string _sqlcode_final_mult = "";

					//string _sqlcode_final_mult = String.Format(Environment.NewLine + " LEFT JOIN (select {2}, id as id{1}, studymeasID as smID{1} " + Environment.NewLine +
					//	" from {0} " + Environment.NewLine +
					//	" where verified in (0,1) and studymeasID in ({3}) ) t{1} " + 
					//	" ON a.id=t{1}.id{1} and a.TimePt=dbo.fnGetTimePoint_text_from_StudymeasID(t{1}.smID{1})" + Environment.NewLine
					//	, tblname, t, String.Join(",", vars_recode), studymeasID_csv);

					//!!!!
					_measname_mult.Add(measname);
					_sqlcode_tbl_mult.Add(_sqlcode_final_mult);


				}

				//STEP 4 - final checks 

				//OK so far, try to get the data now...
				else if (Ns1_N > 0 & Ns2 >= 0)
				{
					//Make sure some of these measures are selected

					//NEXT get the fieldnames
					//AND automatically create an "_agemos" variable for every date variable that is selected
					//  - this is the UNION portion of the query.
					string sqlcode_flds = String.Format("select fldname, fldname_miss2null, flddatatype  from def.vwFld " +
						" where fldpk in ({0}) and tblpk=(select tblpk from def.tbl where measureID={1} ) " +
						" UNION " +
						" select fldname + '_agemos' as fldname, 'dbo.fnDate_AgeMos_from_studymeasID_fromDays(studymeasID,ID,' + fldname + ') as ' + fldname + '_agemos'" +
						"   as fldname_agemos, flddatatype  from def.vwFld " +
						" where fldpk in ({0}) and flddatatype='date' and tblpk=(select tblpk from def.tbl where measureID={1} ) "
						, fldpk_csv, measureID, t);
					DataTable flds = sql.DataTable_from_SQLstring(sqlcode_flds);

					//vars_names   contains the list of var names (without the additional code to recode missing or calculate age)
					List<string> vars_names = flds.AsEnumerable().Select(f => f.Field<string>("fldname")).ToList();

					//vars_no_quote  contains the syntax needed recode missing values and calculate ages
					//  this goes in the body of the LEFT JOIN clause
					List<string> vars_recode = flds.AsEnumerable().Select(f => f.Field<string>("fldname_miss2null")).ToList();

					_sqlcode_vars.Add(String.Join(",", vars_names));

					string tmp_body = "";
					msg = "";

					if (Ns2 == 0)
					{
						tmp_body = String.Format(Environment.NewLine + " LEFT JOIN (select {2}, id as id{1}, studymeasID as smID{1} " + Environment.NewLine + "   FROM {0} " + Environment.NewLine +
							"    WHERE verified in (0,1) and studymeasID in ({3}) ) t{1} ON a.id=t{1}.id{1} and a.TimePt=dbo.fnGetTimePoint_text_from_StudymeasID(t{1}.smID{1})"
							, tblname, t, String.Join(",", vars_recode), studymeasID_csv);

						msg = String.Format("Yes - data loaded", Ns1);
					}
					//Yes, Duplicates!!!!
					else if (Ns2 > 0)
					{
						string plural = (Ns2 > 1) ? "s" : "";

						//Exclude the dups from the main Data
						tmp_body = String.Format(Environment.NewLine + " LEFT JOIN (select {2}, id as id{1}, studymeasID as smID{1} " + Environment.NewLine + "   FROM {0} " + Environment.NewLine +
								"   WHERE verified in (0,1) and studymeasID in ({3}) and ID not in ('{4}') ) t{1} ON a.id=t{1}.id{1} and a.TimePt=dbo.fnGetTimePoint_text_from_StudymeasID(t{1}.smID{1})"
								, tblname, t, String.Join(",", vars_recode), studymeasID_csv, dupsIDs_csv);

						msg = String.Format("Yes data loaded, DUPS: values for {0} subject{1} excluded, see 'Dups_' worksheets. [{2}]", Ns2, plural, dupsIDs_csv);


						string tmp_dupdata = String.Format("select * from {0} " +
						" where verified in (0,1) and studymeasID in ({3}) and ID in ('{4}') ORDER BY id, studymeasID "
						, tblname, t, String.Join(",", vars_recode), studymeasID_csv, dupsIDs_csv);

						_sqlcode_tbl_dups.Add(tmp_dupdata);
						_measname_dups.Add(measname);
					}

					_sqlcode_tbl.Add(tmp_body);

					//Add this table to those to be processed
					_tbls_to_process.Add(tblname);


				}
				else
				{
					msg = String.Format("{0} unprocessed.", measname);
				}
				#endregion
			}

			DataRow r = _dataset.Tables["SummaryInfo"].NewRow();
			r["Measure"] = measname;
			r["Message"] = msg;
			r["N_records"] = Ns1_N;
			r["N_IDs"] = Ns1_IDs;
			r["N_TimePts"] = Ns1_TimePts;
			r["N_Vars"] = N_vars;

			_dataset.Tables["SummaryInfo"].Rows.Add(r);
		}

		


		private void GetData()
		{
			SQL_utils sql = new SQL_utils("data");

			if (_sqlcode_tbl.Count > 0)
			{
				//string sqlcode_final_Data = string.Format("select a.*, {0} FroM {1} {2} ",
				//	String.Join(", ", _sqlcode_vars),
				//	_sqlcode_subj,
				//	String.Join(" ", _sqlcode_tbl));

				string sqlcode_final_Data = "select a.* " + Environment.NewLine +
					" , " + String.Join(", ", _sqlcode_vars) + Environment.NewLine +
					" FroM " + Environment.NewLine +
					_sqlcode_subj + Environment.NewLine +
					String.Join(" ", _sqlcode_tbl);





				//Final SQL code for final integrated "Data"
				Debug.Print(String.Format("done building sqlcode  {0}", System.DateTime.Now.ToString()));
				DataTable dt = sql.DataTable_from_SQLstring(sqlcode_final_Data);
				Debug.Print(String.Format("done retrieving dt  {0}       nrecs={1}", System.DateTime.Now.ToString(), dt.Rows.Count.ToString()));



				//Need to remove fields for the Skipped measures.
				string meas_to_skip_csv = String.Join(",", _meas_to_skip);
				DataTable dt_flds_to_drop = sql.DataTable_from_SQLstring(
					String.Format("select fldname from dp.Var where measureID in ({0})", meas_to_skip_csv));
				List<string> flds_to_drop = dt_flds_to_drop.AsEnumerable().Select(f => f.Field<string>("fldname")).ToList();

				_fldname_list_noskips = _fldname_list.Except(flds_to_drop).ToList();



				dt.TableName = "Data";
				//Add tables to dataset
				this._dataset.Tables.Add(dt);


				#region Add sql code to the dataset
				string sqlcode_final_Data2 = sqlcode_final_Data.Replace("LEFT ", "|LEFT ");
				sqlcode_final_Data2 = sqlcode_final_Data2.Replace("JOIN ", "|JOIN ");


				string[] sqlcode_final_Data_array = sqlcode_final_Data2.Split('|');

				DataTable dt_sql = new DataTable();
				dt_sql.Columns.Add("sql_code");
				for (int i = 0; i < sqlcode_final_Data_array.Length; i++)
				{
					string codechunk = sqlcode_final_Data_array[i];
					int codechunk_length = codechunk.Length;
					int numchunks = Convert.ToInt32(Math.Truncate((Double)(codechunk.Length / 30000)));

					for (int j = 0; j <= numchunks; j++)
					{
						int from = (j * 30000);
						int to =  (from + 30000) - 1;

						int leng = (j == numchunks) ? codechunk_length - from : to - from;
						

						string tmp = codechunk.Substring(from, leng);
						DataRow row = dt_sql.NewRow();
						row["sql_code"] = tmp;
						dt_sql.Rows.Add(row);
					}

				}
				dt_sql.TableName = "sqlcode_Data";
				this._dataset.Tables.Add(dt_sql);
				#endregion

			}

				//Collected Multiple Times per Timepoint
				if (_sqlcode_tbl_mult.Count > 0)
				{
					for (int m = 0; m < _sqlcode_tbl_mult.Count(); m++)
					{
						string sqlcode = string.Format("select a.*, {0} from {1} {2} ",
							String.Join(", ",_sqlcode_vars_mult[m]),
							_sqlcode_subj,
							String.Join(" ", _sqlcode_tbl_mult[m]));

						Debug.Print(String.Format("done building sqlcode  {0}", 
							System.DateTime.Now.ToString()));
						DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
						Debug.Print(String.Format("done retrieving dt  {0}       nrecs={1}", 
							System.DateTime.Now.ToString(), dt.Rows.Count.ToString()));


						//Need to remove fields for the Skipped measures.
						string meas_to_skip_csv = String.Join(",", _meas_to_skip);
						DataTable dt_flds_to_drop = sql.DataTable_from_SQLstring(
							String.Format("select fldname from def.vwFld where measureID in ({0})",
								meas_to_skip_csv));
						List<string> flds_to_drop = dt_flds_to_drop.AsEnumerable()
							.Select(f => f.Field<string>("fldname")).ToList();

						_fldname_list_noskips = _fldname_list.Except(flds_to_drop).ToList();



						dt.TableName = "Data_" + _measname_mult[m].ToString();
						//Add tables to dataset
						this._dataset.Tables.Add(dt);

					}
				}

				//Dup ID's
				if (_sqlcode_tbl_dups.Count > 0)
				{
					for (int s= 0; s < _sqlcode_tbl_dups.Count; s++)
					{
						string sqlcode = _sqlcode_tbl_dups[s];

						DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

						if(dt != null)
						{
							dt.TableName = String.Format("Dups_{0}", _measname_dups[s]);
							//Add tables to dataset
							_dataset.Tables.Add(dt);
						}
					}
				}



			sql.Close();
		}

		public void StackData()
		{
			//Stack the data completely, so pivot table can calculate descriptives natively
			List<string> vars_to_keep = new List<string> { "id", "group", "timept", "txgrp", "subjstatus", "sex" };

			DataTable dt_stack = utilStats.StackData(_dataset.Tables["Data"], vars_to_keep, _fldname_list_noskips);
			dt_stack.TableName = "Data_Stacked";
			Debug.Print(String.Format("done stacking data  nrows={0}  {1}", dt_stack.Rows.Count.ToString(), System.DateTime.Now.ToString()));

			DataView dv = new DataView(dt_stack);
			dv.RowFilter = "Value IS NOT null";
			DataTable dt_new = dv.ToTable();

			Debug.Print(String.Format("done stacking data  nrows={0}  nrwos2={1} {2}", dt_stack.Rows.Count.ToString(), dt_new.Rows.Count.ToString(), System.DateTime.Now.ToString()));

			this._dataset.Tables.Add(dt_stack);

		}



		private void GetCompvars()
		{
			DataTable data = this._dataset.Tables["Data"];
			DataTable dtcompvars = this._dataset.Tables["CompVars"];

			//Need to calculate Z-scores if needed
			//SQL_utils sql = new SQL_utils("data");
			//DataTable dtcompvars = sql.DataTable_from_ProcName("dp.spCompvars", sql.CreateParam("dataproj_pk", pk.ToString(), "int"));


			if (dtcompvars != null)
			{

				dtcompvars.Columns.Add("ref_M", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				dtcompvars.Columns.Add("ref_SD", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
				dtcompvars.Columns.Add("ref_N", Nullable.GetUnderlyingType(typeof(int)) ?? typeof(int));

				#region Z values

				//Get new values
				foreach (DataRow row in dtcompvars.Rows)
				{

					//Calculate Z
					string curr_Variable = row.Field<string>("varname").ToString();
					string ref_timept = row.Field<string>("ref_timept").ToString();
					int varweight = row.Field<int>("varweight");


					//if this var is in the Data set
					if (data.Columns.Contains(curr_Variable))
					{

						//remove NULL values				
						var currvar_data = data.AsEnumerable()
						.Where(r => !r.IsNull(curr_Variable))
						.Where(r => r["timept"].ToString() == ref_timept)
						.Select(x => Convert.ToDouble(x[curr_Variable]));
						if (currvar_data.Count() > 0)
						{
							double? ref_M = currvar_data.Average();
							double? ref_SD = currvar_data.StandardDeviation();
							int ref_N = currvar_data.Count();

							row["ref_M"] = ref_M;
							row["ref_SD"] = ref_SD;
							row["ref_N"] = ref_N;
							row["varweight"] = varweight;
						}
					}
					
				}
				#endregion

			}

		}


		private void CalculateZscores()
		{
			//Calculate the Z scores
			if (this._dataset.Tables["CompVars"].Rows.Count > 0 )
			{

				//Calculate the individual Z's for each variable
				foreach (DataRow row in this._dataset.Tables["CompVars"].Rows)
				{
					//Get the variable
					string varname = row["varname"].ToString();

					//Check that variable is in the dataset
					if (this._dataset.Tables["Data"].Columns.Contains(varname))
					{

						//Get the ref stats
						double ref_M;
						double ref_SD;
						int ref_N;
						int varweight;
						Double.TryParse(row["ref_M"].ToString(), out ref_M);
						Double.TryParse(row["ref_SD"].ToString(), out ref_SD);
						int.TryParse(row["ref_N"].ToString(), out ref_N);
						int.TryParse(row["varweight"].ToString(), out varweight);

						//If this column is not already present, add it
						string zvar = string.Format("{0}_z", varname);

						List<string> existingcols = new List<string>();
						foreach(DataColumn c in this._dataset.Tables["Data"].Columns)
						{
							existingcols.Add(c.ColumnName);
						}

						if (!existingcols.Contains(zvar))
						{
							this._dataset.Tables["Data"].Columns.Add(zvar, typeof(double),
								string.Format("(({0} - {1}) / {2}) * {3}", varname, ref_M.ToString(), ref_SD.ToString(), varweight.ToString()));
						}
					}
				}


				//Calculate the Composite

				//get the unique list of compvars
				var compvars = this._dataset.Tables["CompVars"].AsEnumerable().Select(x => x.Field<string>("compvarname")).Distinct().ToList();


				//Loop through list of compvars and get each var
				foreach (string compvarname in compvars)
				{
					//get the vars for the compvar
					List<string> vars = this._dataset.Tables["CompVars"].AsEnumerable()
						.Where(r => r.Field<string>("compvarname") == compvarname)
						.Where(r => r.Field<int?>("ref_N") > 0)
						.Select(r => r.Field<string>("varname")).ToList();
					List<string> var_numerator = new List<string>();
					List<string> var_denominator = new List<string>();


					//This takes the mean of the component vars while avoiding a divide by zero error if there are no valid component vars.
					// When there are no valid component vars, it returns Null (In Excel this is an empty cell).
					if (vars.Count > 0)
					{
						for (int i = 0; i < vars.Count; i++)
						{
							vars[i] = string.Format("{0}_z", vars[i]);
							var_numerator.Add(String.Format("IsNull({0},0)", vars[i]));
							var_denominator.Add(String.Format("IIF(IsNull({0},-987654)=-987654,0,1)", vars[i]));
						}



						string vars_csv = string.Join("+", vars);
						string vars_numerator_csv = string.Join("+", var_numerator);
						string var_denominator_csv = string.Join("+", var_denominator);

						string compvar_formula = string.Format("IIF(({1})=0, Null,({0}) / ({1}))", vars_numerator_csv, var_denominator_csv);

						DataColumn zcol = new DataColumn(string.Format("{0}", compvarname), typeof(double), compvar_formula);
						zcol.AllowDBNull=true;
						this._dataset.Tables["Data"].Columns.Add(zcol);
					}
				}


			}

		}


		public void CreateDatafile()
		{

			if (_dataproj_pk > 0)
			{
				//DataSet dset_descstats = utilDataProject.DataProject_Descstats(_dataproj_pk, this._dataset);  // by default: TP, Group, txgrp

				string datenow = DateTime.Now.Year.ToString() + ((DateTime.Now.Month < 10) ? "0" : "") + DateTime.Now.Month.ToString() + ((DateTime.Now.Day < 10) ? "0" : "") + DateTime.Now.Day.ToString();
				string hrminnow = ((DateTime.Now.Hour < 10) ? "0" : "") + DateTime.Now.Hour.ToString() + ((DateTime.Now.Minute < 10) ? "0" : "") + DateTime.Now.Minute.ToString();

				string filename = "Proj_" + _dataproj_pk + "_Data_" + datenow + "_" + hrminnow; //TODO
				string filename_descstats = "Proj_" + _dataproj_pk + "_DescStats_" + datenow + "_" + hrminnow; //TODO


				#region Log the Datafile
				//Log the Datafile
				int N_subjects = 0;
				int N_measures = 0;
				int N_studymeas = 0;
				int N_datarows = 0;
				int N_datacols = 0;
				int N_data_dups = 0;
				int N_other_datarows = 0;

				SQL_utils sql = new SQL_utils();


				N_measures = sql.IntScalar_from_SQLstring("select count(distinct(measureID))  from [dp].[vwDataProject_Meas]  where dataproj_pk =  " + _dataproj_pk.ToString());
				N_studymeas = sql.IntScalar_from_SQLstring("select count(distinct(studymeasID))  from [dp].[vwDataProject_Meas]  where dataproj_pk =  " + _dataproj_pk.ToString());

				//Get the number of variables associated withe the MIND INtHx v2
				//measure.  Since the data output for this measure is dynamically
				//created, we have to add in the number of variables (20,21,23, & 25 =
				//89 across the 4 levels of aggregation) manually.
				N_datacols = sql.IntScalar_from_SQLstring("select count(*) from dp.Var where dataproj_pk =  " + _dataproj_pk.ToString());


				foreach (DataTable dt in this._dataset.Tables)
				{
					List<string> skip = new List<string> { "Subjects", "Subjects_excluded", "fileinfo", "DataDict", "Measures" };
					if (dt.TableName == "Subjects") N_subjects = dt.Rows.Count;

					else if (dt.TableName == "Data") N_datarows = dt.Rows.Count;

					else if (dt.TableName.Contains( "Data_")) N_other_datarows += dt.Rows.Count;


					if (dt.TableName.Contains("Dups_"))
					{
						N_data_dups += dt.Rows.Count;
					}
				}


				List<SqlParameter> ps = new List<SqlParameter>();
				ps.Add(sql.CreateParam("dataproj_pk", _dataproj_pk.ToString(), "int"));
				ps.Add(sql.CreateParam("filename", filename + ".xlsx", "text"));
				ps.Add(sql.CreateParam("N_subjects", N_subjects.ToString(), "int"));
				ps.Add(sql.CreateParam("N_measures", N_measures.ToString(), "int"));
				ps.Add(sql.CreateParam("N_studymeas", N_studymeas.ToString(), "int"));
				ps.Add(sql.CreateParam("N_datarows", N_datarows.ToString(), "int"));
				ps.Add(sql.CreateParam("N_datacols", N_datacols.ToString(), "int"));
				ps.Add(sql.CreateParam("N_data_dups", N_data_dups.ToString(), "int"));
				ps.Add(sql.CreateParam("N_other_datarows", N_other_datarows.ToString(), "int"));

				sql.NonQuery_from_ProcName("dp.spLogDatafile", ps);
				#endregion


				//Log the Download
				List<SqlParameter> ps2 = new List<SqlParameter>();
				ps2.Add(sql.CreateParam("dataproj_pk", _dataproj_pk.ToString(), "int"));
				ps2.Add(sql.CreateParam("filename", filename, "text"));
				sql.NonQuery_from_ProcName("dp.spLogDownload", ps2);

				SpreadsheetGearUtils.SaveDataSetToExcel(this._dataset, filename, false, "xlsx");
				//SpreadsheetGearUtils.SaveDataSetToExcel(dset_descstats, filename_descstats, false, "xlsx");


			}
		}

	}
}