using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web.Services;
using DevExpress.Web;

namespace uwac.trk
{

	/// <summary>
	/// Summary description for dataops
	/// </summary>
	public class dataops
	{
		public dataops()
		{
			//
			// TODO: Add constructor logic here
			//
		}



		#region Utilities

		public static List<string>  Numtypes() {
			return new List<string> { "number", "int", "smallint", "bigint", "float", "decimal" };
		 }

		public static List<string> Texttypes() { return new List<string> { "text", "string", "char", "varchar", "nchar" }; }

		public static List<string> Datetypes() { return new List<string> { "date", "datetime", "smalldatetime" }; }



public static void SetColorLevel(int x)
		{
			SQL_utils sql = new SQL_utils("backend");
			sql.NonQuery_from_SQLstring("exec trk.spUpdate_ColorLevel_for_User " + x.ToString());
			sql.Close();
		}

		public static int CountValues(List<object> selectedValues, string targetvalue)
		{
			List<string> csv = new List<string>();
			if (selectedValues.Count > 0)
			{
				for (int i = 0; i < selectedValues.Count; i++)
				{
					if (selectedValues[i] != null)
					{
						string x = selectedValues[i].ToString();
						csv.Add(x);
					}
				}
			}

			int num = 0;
			foreach (string s in csv)
			{
				if (s == targetvalue) num++;
			}

			return num;
		}


		public static List<string> GetListString(List<object> selectedValues)
		{
			List<string> csv = new List<string>();
			if (selectedValues.Count > 0)
			{
				for (int i = 0; i < selectedValues.Count; i++)
				{
					if (selectedValues[i] != null)
					{
						string x = selectedValues[i].ToString();
						csv.Add(x);
					}
				}
			}
			return csv;
		}

		public static List<string> GetListString(SelectedValueCollection selectedValues)
		{
			List<string> csv = new List<string>();
			if (selectedValues.Count > 0)
			{
				for (int i = 0; i < selectedValues.Count; i++)
				{
					if (selectedValues[i] != null)
					{
						string x = selectedValues[i].ToString();
						csv.Add(x);
					}
				}
			}
			return csv;
		}


		public static List<int> GetListInt(List<object> selectedValues)
		{
			List<int> csv = new List<int>();
			if (selectedValues.Count > 0)
			{
				for (int i = 0; i < selectedValues.Count; i++)
				{
					int x = Convert.ToInt32(selectedValues[i].ToString());
					csv.Add(x);
				}
			}
			return csv;
		}

		public static string GetCSV(List<object> selectedValues, bool useQuote)
		{
			string quote = "";
			string csv = null;
			if (selectedValues.Count > 0)
			{
				for (int i = 0; i < selectedValues.Count; i++)
				{
					var x = selectedValues[i].GetType();
					string comma = (i > 0) ? "," : "";
					if (useQuote) quote = (x == typeof(Int32) | x == typeof(Int16) | x == typeof(int)) ? "" : "'";

					csv += String.Format("{0}{1}{2}{1}", comma, quote, selectedValues[i].ToString());
				}
			}

			return csv;
		}

		public static string GetCSV(List<object> selectedValues)
		{
			return GetCSV(selectedValues, true);
		}

		public static string GetCSV(List<int> selectedValues)
		{
			return GetCSV(selectedValues.Cast<object>().ToList(), true);
		}
		public static string GetCSV(List<string> selectedValues)
		{
			return GetCSV(selectedValues.Cast<object>().ToList(), true);
		}


		#endregion



		public static List<SQL_utils.dbfield> dxGrid_UpdateData_CreateDbFields(SQL_utils sql, string pk, OrderedDictionary newvalues, string tbl, string schema) //, string db, string pk )
		{
			//Do not include the pk field
			string sql_get_fields = "select column_name, data_type from information_schema.columns where table_schema = '" + schema + "'" + " and table_name = '" + tbl + "'";
			DataTable dt_flds = sql.DataTable_from_SQLstring(sql_get_fields);

			List<SQL_utils.dbfield> flds = new List<SQL_utils.dbfield>();


			IDictionaryEnumerator enumerator = newvalues.GetEnumerator();
			enumerator.Reset();
			while (enumerator.MoveNext())
			{
				string fieldname = enumerator.Key.ToString().ToLower();
				//check to see if this field is present in this table
				int fld_in_table = dt_flds.AsEnumerable().Where(r => r.Field<string>("column_name").ToLower() == fieldname).Select(r => r.Field<string>("column_name")).Count();

				if (fld_in_table >= 1)  //if this field is in the table then add it to the list
				{

					//Get the data type for the field from the db
					string fldtype = dt_flds.AsEnumerable().Where(r => r.Field<string>("column_name").ToLower() == enumerator.Key.ToString().ToLower()).Select(r => r.Field<string>("data_type")).First();

					SQL_utils.dbfield fld = new SQL_utils.dbfield();
					fld.fieldname = enumerator.Key.ToString();
					if (enumerator.Value != null)
					{
						fld.value = enumerator.Value.ToString();
					}
					fld.sqldbtype = fldtype;
					flds.Add(fld);

				}

			}

			return flds;
		}


		#region Tracking
		public static string dxGrid_Update_StudyMeasSubj_Dates(string mode, List<int> pkvals)
		{
			try
			{
				SQL_utils sql = new SQL_utils("backend");
				// Update only those records with a date
				string sqlcode = "update tblstudymeassubj set [date] = " + mode +
					" from (select * from trk.vwMasterStatus_M  where " + mode + " is not null and studymeassubjID in (select val from[dbo].[fnSplitCSV_int]('" + string.Join(",", pkvals) + "'))) b " +
					" where b.studymeassubjID = tblstudymeassubj.studymeassubjID";


				sql.NonQuery_from_SQLstring(sqlcode);

				sql.Close();

				return sqlcode + " --Updated!";
			}
			catch (Exception ex) {
				return ex.Message;
			}

		}
		#endregion



		public static DataTable CopyColumntoID(DataTable dt, string sourcecol)
		{
			List<string> colnames = new List<string>();
			foreach(DataColumn col in dt.Columns)
            {
				colnames.Add(col.ColumnName.ToLower());
            }

			if(!colnames.Contains("id"))
            {
				dt.Columns.Add(new DataColumn("id", typeof(string)));
            }

			foreach (DataRow row in dt.Rows)
			{
				row["id"] = row[sourcecol].ToString().ToUpper();
			}

			return dt;
		}

			public static DataTable VerifyID(DataTable dt, string sourcecol, int studyid)
		{
			SQL_utils sql = new SQL_utils("backend");

			DataTable dt_ids = sql.DataTable_from_SQLstring(String.Format("select id from trk.vwMasterStatus_S where studyid={0}", studyid));
			List<string> ids = dt_ids.AsEnumerable().Select(f => f.Field<string>("id")).ToList();
			sql.Close();

			for(int i=0; i < ids.Count; i++) { ids[i] = ids[i].ToUpper(); }

			DataColumn idcol = new DataColumn("not_id", typeof(string));
			dt.Columns.Add(idcol);

			foreach (DataRow row in dt.Rows)
			{
				string txt_with_potential_id = row[sourcecol].ToString().ToUpper();

				if (!ids.Contains(txt_with_potential_id))
				{
					row["not_id"] = txt_with_potential_id;
					row["id"] = "";
				}
			}
			return dt;
		}




		public static string dxGrid_UpdateData(string pk, List<int> pkvals, OrderedDictionary newvalues, string db, string schema, string tbl)
		{
			SQL_utils sql = new SQL_utils(db);

			List<SQL_utils.dbfield> flds = dxGrid_UpdateData_CreateDbFields(sql, pk, newvalues, tbl, schema);

			string sqlcode = "update " + schema + "." + tbl + " set ";

			List<string> numtypes = new List<string> { "number", "int", "smallint", "bigint", "float", "decimal" };
			List<string> texttypes = new List<string> { "text", "string", "char", "varchar", "nchar" };
			List<string> datetypes = new List<string> { "date", "datetime", "smalldatetime" };

			foreach (SQL_utils.dbfield fld in flds)
			{
				if (fld.fieldname.ToLower() != pk.ToLower())  //don't add the PK
				{
					if (fld.value != "" & fld.value != null)
					{
						if (numtypes.Any(s => fld.sqldbtype.Contains(s)))
						{
							sqlcode += fld.fieldname + "= " + SQL_utils.CleanString(fld.value, false) + ",";
						}
						else if (texttypes.Any(s => fld.sqldbtype.Contains(s)))
						{
							sqlcode += fld.fieldname + "= " + SQL_utils.CleanString(fld.value, true) + ",";
						}
						else if (datetypes.Any(s => fld.sqldbtype.Contains(s)))
						{
							sqlcode += fld.fieldname + "= " + SQL_utils.CleanString(fld.value, true) + ",";
						}
						else
						{
							sqlcode += fld.fieldname + "= " + SQL_utils.CleanString(fld.value, true) + ",";
						}
					}
				}
			}

			sqlcode = sqlcode.Substring(0, sqlcode.Length - 1);

			//array of pkvals is when we update multiple records with the same values
			string pkvals_csv = string.Join(",", pkvals);

			sqlcode += "   where " + pk + " in (" + pkvals_csv.ToString() + ")";


			if (sqlcode.Contains(" where ") && pkvals.Count >= 1)  //must have a where clause
			{
				try
				{
					sql.NonQuery_from_SQLstring(sqlcode);
					sql.Close();
					return sqlcode + " pk:" + pk + " = " + pkvals_csv + " updated!";// +sql;
				}
				catch (Exception ex)
				{
					sql.Close();
					return ex.Message;
				}
			}
			else
			{
				sql.Close();
				return "No Where Clause or no PK Value!!";
			}
		}


		#region DataProjects

		public static DataTable GetSubjSets(int studyID)
		{
			Debug.Print("  ***** GetSubjSets()");

			string sqlcode = "select a.subjset_pk, a.studyID, a.subjset, a.subjsetdetails, 'N = ' + cast(count(*) as varchar) as nsubj, a.created, a.createdBy " +
				" from dp.SubjSet a " +
				" join dp.Subj b ON a.subjset_pk = b.subjset_pk " +
				" where studyID = " + studyID.ToString() +
				" group by a.subjset_pk, a.studyID, a.subjset, a.subjsetdetails, a.created, a.createdBy ";


			SQL_utils sql = new SQL_utils("data");
			DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

			sql.Close();
			return dt;

		}


		//We never need to get all the subjects, only those in the selected set
		public static DataTable GetSelectedSubjects(int subjset_pk, int studyID)
		{

			Debug.Print("  ***** GetSelectedSubjects " + System.DateTime.Now.ToString());

			string sqlcode = "select subjID, id, groupname as [Group], coalesce(txgrp, '**NA**') txgrp, subjstatus, subjstatusdetail, sex,  " +
			" coalesce(ethnicitydesc, 'UNKNOWN') as race, coalesce(hispanicdesc, 'UNKNOWN') as ethnicity " +
			", subjNotes, convert(VARCHAR, txstart, 101) txstart, txstartnote " +
			"from uwautism_research_backend..vwMasterStatus_S_txgrp a where studyID = " + studyID.ToString() +
			" and subjID in (select subjID from dp.Subj  where subjset_pk = " + subjset_pk.ToString() + ") ";

			SQL_utils sql = new SQL_utils("data");
			DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

			//Session["proj_subj"] = dt;
			sql.Close();
			return dt;

		}



		//We never need to get all the subjects, only those in the selected set
		public static DataTable GetSelectedSubjects(int pk)
		{

			Debug.Print("  ***** GetSelectedSubjects " + System.DateTime.Now.ToString());

			string sqlcode = "select subjID, id, groupname as [Group], coalesce(txgrp, '**NA**') txgrp, subjstatus, subjstatusdetail, sex,  " +
			" coalesce(ethnicitydesc, 'UNKNOWN') as race, coalesce(hispanicdesc, 'UNKNOWN') as ethnicity " +
			", subjNotes, convert(VARCHAR, txstart, 101) txstart, txstartnote " +
			"from uwautism_research_backend..vwMasterStatus_S_txgrp a  " +
			"  where subjID in (select subjID from dp.Subj  where subjset_pk = " + 
			"  (select subjset_pk from dp.DataProject where dataproj_pk = " + pk.ToString() + ")) ";

			SQL_utils sql = new SQL_utils("data");
			DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

			//Session["proj_subj"] = dt;
			sql.Close();
			return dt;

		}


		public static DataTable GetAllIntHx(string pk, int studyIDfull)
		{
			SQL_utils sql = new SQL_utils("data");
			string sqlcode = "select m.* from " + Environment.NewLine +
				"(select measureID, measname, measfullname from uwautism_research_backend..tblMeasure " + Environment.NewLine +
				" where measureID in (815, 816, 817, 819)) m " + Environment.NewLine +
				"  cross join " + Environment.NewLine +
				"  (" + Environment.NewLine +
				"  select   dbo.fnGetFullStudyID_from_StudyID(studyID) fullstudyID " + Environment.NewLine +
				"   from uwautism_research_backend..tblstudy " + Environment.NewLine +
				"   where studyID in " + Environment.NewLine +
				"	  (select distinct(studyID) from uwautism_research_backend..tblstudymeas where measureID in (88, 275, 749)) " + Environment.NewLine +
				" and dbo.fnGetFullStudyID_from_StudyID(studyID) = " + studyIDfull.ToString()  + Environment.NewLine +
				"  group by dbo.fnGetFullStudyID_from_StudyID(studyID) " + Environment.NewLine +
				" ) s"  ;
			DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

			sql.Close();
			return dt;
		}

		public static DataTable GetAllIntHxTimept(string pk, int studyIDfull)
		{
			SQL_utils sql = new SQL_utils("backend");
			string sqlcode = "select studyID, studyname, timept, tporder, count(distinct(personID)) n_subjects" + Environment.NewLine +
			", cast(round(avg(nwks_in_tp * 1.0), 1) as decimal(18,1)) as avg_nwks_in_tp" + Environment.NewLine +
			", min(tpdatebeg_SUN) earliest_start_date, max(next_tpdatebeg_SUN) latest_end_date" + Environment.NewLine +
			", cast(round(avg(tpagemos_beg), 1) as decimal(18,1)) avg_agemos_beg, cast(round(avg(tpagemos_end), 1) as decimal(18,1)) avg_agemos_end" + Environment.NewLine +
			"  from vwTimepointSubj_periods_2018" + Environment.NewLine +
			"  where studyIDfull = " + studyIDfull.ToString() + " group by studyID, studyname, timept, tporder" + Environment.NewLine;

			  DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

			sql.Close();
			return dt;
		}


		public static DataTable GetAllStudymeas(string pk, int studyIDfull)
		{
			//Default is to include all meas
			return GetAllStudymeas(pk, studyIDfull, false);
		}

		public static DataTable GetAllStudymeas(string pk, int studyIDfull, bool onlySavedMeas)
		{
			Debug.Print("  ***** GetAllStudymeas()");

			string add_saved_meas = "";

			if (pk != null)
			{
				string jointype = (onlySavedMeas) ? " inner " : " left ";
				add_saved_meas = String.Format("{0}join (select studymeasID as smID from uwautism_research_data.dp.Meas where dataproj_pk = {1}) e ON x.studymeasID = e.smID ", jointype, pk);
			}


			string sqlcode = "select * from ( " +
				" select coalesce(s.fullstudyID*10000, a.studyID) studyIDfull, studyname, a.studyID, MeasName, a.measureID " +
				"  , a.studymeasID, (case when uwautism_research_backend.dbo.fnIsREL(a.studymeasID) = 1 then 'REL' else '' end) isREL, StudyMeasName " +
				"  , a.timepointID, timepoint, timepoint_text as TimePt, meascat as Category, tblname " +
				"  from  " +
				"  (select studyID, studymeasID, measureID, studymeasname, timepointID from uwautism_research_backend..tblstudymeas where measureID <> 749 ) a " +
				"  left join uwautism_research_backend..tblstudy s ON a.studyID = s.studyID " +
				"  join uwautism_research_backend..tblmeasure b ON a.measureID = b.measureID " +
				"  join uwautism_research_backend..tbltimepoint c ON a.timepointID = c.timepointID " +
				"  left join uwautism_research_backend..tblMeasureCat_Lkup d ON b.MeasCatID = d.MeasCatID " +
				" left join (select tblname, tblpk, measureID mID from uwautism_research_data.def.tbl) f ON a.measureID = f.mID " +
				" ) x " + add_saved_meas +
				" where studyIDfull = " + studyIDfull.ToString();

			SQL_utils sql = new SQL_utils("backend");
			DataTable dt = sql.DataTable_from_SQLstring(sqlcode);


			sql.Close();
			return dt;
		}


		public static DataTable GetVarsForDataproject(int pk, string smID_csv, bool include_inthx_vars)
		{
			//Default is to include all vars
			return GetVarsForDataproject(pk, smID_csv, include_inthx_vars, false);
		}


		public static DataTable GetVarsForDataproject(int pk, string smID_csv, bool include_inthx_vars, bool onlySavedVars)
		{
			Debug.Print(" ***** GetVarsForDataproject " + System.DateTime.Now.ToString());

			// Now this is passed in as a parameter, so that we can use this when loading the dataproj initially
			//  and with the selected measures from gridSelMeas
			//var smID_csv = uwac.trk.dataops.GetCSV(gridSelMeas.GetSelectedFieldValues(gridSelMeas.KeyFieldName));

			
			string jointype = (onlySavedVars) ? " inner " : " left ";

			string inthx_vars = (include_inthx_vars) ? " or b.measureID = 749 " : "";

			SQL_utils sql = new SQL_utils("data");

			string sqlcode = "select * from (select a.fldpk, b.measureID, measname, fldname, fieldlabel " + Environment.NewLine + 
				", (case when fieldvaluesetid > 0  and InAnalysis > 0 then 'X-categ' " + Environment.NewLine +
				"        when fielddatatype in ('tinyint','smallint','numeric','int','float','bigint','decimal') and InAnalysis > 0 then 'X-contin' " + Environment.NewLine +
				"        when fielddatatype in ('char','varchar','nvarchar') and InAnalysis>0 then 'X-categ' " + Environment.NewLine +
				"        else '' end) CoreVar " + Environment.NewLine +
				", (case when fieldvaluesetID > 0 and fielddatatype in ('char','varchar','nvarchar') then 'text-categorical' " + Environment.NewLine +
				"        when fielddatatypelength <=30 and fielddatatype in ('char','varchar','nvarchar') then 'text (length<=30)' " + Environment.NewLine +
				"        when fielddatatype in ('char','varchar','nvarchar') then 'text (length>30)' " + Environment.NewLine +
				"        when fielddatatype in ('date','datetime','smalldatetime') then 'date' " + Environment.NewLine +
				"        when fieldvaluesetID > 0  then 'num-categorical' " + Environment.NewLine +
				"        when fielddatatype in ('smallint','numeric','int','float','bigint','decimal') then 'num-continuous' " + Environment.NewLine +
				"     else fielddatatype  end) VarType" + Environment.NewLine +
				" , (case when d.fldpk>0 then d.fldpk else -1 end) as inDataproj " + Environment.NewLine +
				" from def.fld a " + Environment.NewLine +
				" join def.tbl b ON a.tblpk = b.tblpk " + Environment.NewLine +
				" join uwautism_research_backend..tblMeasure c ON b.measureID = c.measureID " + Environment.NewLine +
				 jointype + " join (select fldpk from dp.Var where dataproj_pk = " + pk.ToString() + " ) d ON a.fldpk = d.fldpk " + Environment.NewLine +
				" where " +
				//" where a.fldpk in (select fldpk from dp.Var where dataproj_pk = " + pk.ToString() + " ) and " +
				" fldname not in ('id','indexnum','studymeasID','created','createdby','updated','updatedby','scored','scoredby','verified')" + Environment.NewLine +
				" and ( b.measureID in (select measureID from uwautism_research_backend..tblStudyMeas " + Environment.NewLine + 
				"       where studymeasID in (" + smID_csv + ")) " + Environment.NewLine +
				"       " + inthx_vars + " ) " + Environment.NewLine +
				" ) x " + Environment.NewLine +
				//" where VarType like '%" + VarType + "%'" +
				"order by CoreVar desc, measname, VarType, fldname";
			DataTable dt = sql.DataTable_from_SQLstring(sqlcode);
			sql.Close();


			int nvars = dt.Rows.Count;

			return dt;
		}
		

		public static int UpdateDataproject(string pk, int studyID, int subjset_pk, string projTitle, string projSummary
				, string meas_csv, string vars_csv, string inthx_csv)
		{

			pk = (String.IsNullOrEmpty(pk)) ? "0" : pk;

			inthx_csv = (inthx_csv==null) ? "": inthx_csv;

			SQL_utils sql = new SQL_utils("data");
			List<SqlParameter> ps = new List<SqlParameter>();
			ps.Add(sql.CreateParam("dataproj_pk", pk, "int"));
			ps.Add(sql.CreateParam("studyID",studyID.ToString(), "int"));
			ps.Add(sql.CreateParam("subjset_pk", subjset_pk.ToString(), "int"));
			ps.Add(sql.CreateParam("projTitle", projTitle, "text"));
			ps.Add(sql.CreateParam("projSummary", projSummary, "text"));
			ps.Add(sql.CreateParam("supervisor_staffID", "0", "int"));
			ps.Add(sql.CreateParam("sel_meas", meas_csv, "text"));
			ps.Add(sql.CreateParam("sel_vars", vars_csv, "text"));
			ps.Add(sql.CreateParam("sel_inthx", inthx_csv, "text"));
			ps.Add(sql.CreateParam("out", "", "int", "output"));

			int newdataproj_pk = sql.NonQuery_from_ProcName("dp.spDataProject_UPDATE3", ps, "out");

			sql.Close();

			return newdataproj_pk;
		}


		#endregion


		#region Composite Vars


		public DataTable GetBaseInfoForFld(string fld, string tbl, int timepointID, int subjset_pk, int studyID)
		{
			SQL_utils sql = new SQL_utils("data");
			DataTable dt_subj = GetSelectedSubjects(subjset_pk, studyID);

			var subj = dt_subj.AsEnumerable().Select(f => f.Field<string>("ID")).ToList();
			string subj_csv = String.Join(",", subj);


			string sqlcode = "select avg({0}) as varavg, stdev({0}) as varsd, count({0}) as varn" +
					" from {1} " +
					" where studymeasID in " +
					"   (select studymeasID from uwautism_research_backend..tblstudymeas where timepointID={2}) " +
					" and ID in ({3}) ";


			DataTable dt = sql.DataTable_from_SQLstring(sqlcode);


			return dt;
		}

		#endregion
	}
}