using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Text;
using System.Reflection;
using NReco.PivotData;
using NReco.PivotData.Output;
using LinqStatistics;
using MathNet.Numerics.Statistics;
using uwac;

namespace uwac
{



	/// <summary>
	/// Summary description for utilDataProject
	/// </summary>
	public class utilDataProject
	{
		public utilDataProject()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static List<DataTable> GetMeasure(SQL_utils sql, int dataproj_pk, int measureID, string measname, string tblname, string studymeas_csv, int studyID)
		{

			List<DataTable> m = GetMeasure( sql,  dataproj_pk,  measureID,  measname,  tblname,  studymeas_csv,  studyID, "","");
			return m;
		}



		/// <summary>
		/// Returns a List<DataTable> for the selected measure, regular data & REL data if it exists
		/// </summary>
		/// <param name="sql"></param>
		/// <param name="dataproj_pk"></param>
		/// <param name="measureID"></param>
		/// <param name="measname"></param>
		/// <param name="tblname"></param>
		/// <param name="studymeas_csv"></param>
		/// <param name="studyID"></param>
		/// <param name="groupID_csv"></param>
		/// <param name="subjstatusID_csv"></param>
		/// <returns></returns>
		public static List<DataTable> GetMeasure(SQL_utils sql, int dataproj_pk, int measureID, string measname, string tblname, string studymeas_csv, int studyID, string groupID_csv, string subjstatusID_csv)
		{
			List<DataTable> tbls = new List<DataTable>();

			if (sql.SqlConnection.State != ConnectionState.Open) sql.SqlConnection.Open();

			string fldlist = utilStats.GetDataFlds_byDataProject(dataproj_pk, tblname, measureID);


			DataTable delinks = sql.DataTable_from_SQLstring("select a.name as pkfield, coalesce(deformname,'') deformname " +
				"from datField a " +
				"join datTable b ON a.TableID = b.tableID " +
				"join datTable_measure c ON b.TableID = c.tableID   " +
				"left join uwautism_research_backend..tblMeasure d ON c.measureID = d.measureID " +
				"where fieldcodeID=10 and c.measureID=" + measureID.ToString());

			string deformurl = "";
			string pkfield = "";
			string linkcode = "";

			if (delinks.Rows.Count > 0)
			{
				deformurl = delinks.Rows[0].Field<string>("deformname").ToString();
				pkfield = delinks.Rows[0].Field<string>("pkfield").ToString();
				if (deformurl.Length > 3 & pkfield.Length > 1)
				{
					string excelfx = " '=HYPERLINK(\"https://uwac.autism.washington.edu/research/dataentryforms/common/" + deformurl + "/" + deformurl + ".aspx";

					linkcode = excelfx + "?pk=' + cast(" + pkfield + " as varchar) + '\",\"link\")' DE_link, ";
				}
				else
				{
					linkcode = " '' DE_link, ";
				}
			}


			string sel_subj = (dataproj_pk == 0) ? GetProject_Subjects(groupID_csv, subjstatusID_csv)  : GetProject_Subjects(dataproj_pk);


			string sSQL = "";
			DataTable dt = new DataTable();
			DataTable dt_REL = new DataTable();

		

			string datevar = sql.StringScalar_from_SQLstring("select fldname  from uwautism_research_data.def.Fld where fieldcodeID = 2 " +
						" and tblpk in (select tblpk from uwautism_research_data.def.Tbl where measureID = " + measureID.ToString() + " ) ");
			string days_from_datevar = "";
			if (datevar != null)
			{
				days_from_datevar = (datevar.Length > 0) ? " datediff(day, txstart," + datevar + ") days_from_txstart, " : "";
			}


			string tadpole_txgrps = (studyID == 1076) ? " (case when txgrp in ('A','D') then 'DTT' when txgrp in ('B','C') then 'PB' end) as txtype, " +
				" (case when txgrp in ('A','C') then 'High' when txgrp in ('B','D') then 'Low' end) as txintensity, " : "";



			sSQL = linkcode + " a.ID, groupname as [Group], subjstatus, coalesce(txgrp,'**NA**') txgrp, " + tadpole_txgrps + "  txstart, " + days_from_datevar +
			" timepoint as timepointnum, timepoint_text as TimePoint " +
			" , a.studymeasID , dbo.fnStudymeas_IsREL(a.studymeasID) isREL " + fldlist +
			" from uwautism_research_data.." + tblname + " a " +
			" join  (select ID, groupname, txgrp, txstart, subjstatus from uwautism_research_backend..vwMasterStatus_S_txgrp where ( " + sel_subj + ")) b ON a.ID = b.ID " +
			" join  (select studymeasID, timepointID from uwautism_research_backend..tblStudyMeas) c ON a.studymeasID = c.studymeasID " +
			" join  uwautism_research_backend..tblTimePoint d ON c.timepointID = d.timepointID " +
			" where verified in (0,1) and a.studymeasID in (" + studymeas_csv + ")  ";


			// Exclude any REL records from the real data
			string sSQL_data = "select * from (select " + sSQL + ") x where isREL = 0   order by TimePoint, [ID]";


			dt = sql.DataTable_from_SQLstring(sSQL_data);


			int hasREL = sql.IntScalar_from_SQLstring("select  coalesce(sum(dbo.fnStudymeas_IsREL(studymeasID)),0) as hasREL " +
					" from   dp.Meas where dataproj_pk = " + dataproj_pk.ToString() + " and measureID = " + measureID.ToString());

			//Stack the REL data, but only include cases with both the ORIG and REL.
			// the dp.fnGet_RELKEY function returns the tablePK for the original coding for both the ORIG and the REL so that cases can be matched on this.
			if (hasREL > 0)
			{
				string sSQL_RELdata = "select * from (select  dp.fnGet_RELKEY(a.id, a.studymeasID) RELKEY, " + sSQL + ") x where RELKEY is not null   order by [ID], RELKEY, isREL";
				dt_REL = sql.DataTable_from_SQLstring(sSQL_RELdata);
			}

			//}

			//DataTable dt_clean = utilStats.DataTable_MissingToNULL(dt, row["tblname"].ToString(), false);

			dt.TableName = measname.ToString();

			tbls.Add(dt);


			if (dt_REL.DataSet != null)
			{
				dt_REL.TableName = "REL_" + measname.ToString();
				tbls.Add(dt_REL);
			}

			return tbls;

		}




		/// <summary>
		/// Returns a List<DataTable> for the selected measure, regular data & REL data if it exists
		/// </summary>
		/// <param name="sql"></param>
		/// <param name="dataproj_pk"></param>
		/// <param name="measureID"></param>
		/// <param name="measname"></param>
		/// <param name="tblname"></param>
		/// <param name="studymeas_csv"></param>
		/// <param name="studyID"></param>
		/// <param name="subj"></param>
		/// <returns></returns>
		public static List<DataTable> GetMeasure(SQL_utils sql, int dataproj_pk, int measureID, string measname, string tblname, string studymeas_csv, int studyID, List<string> subj)
		{
			List<DataTable> tbls = new List<DataTable>();

			if (sql.SqlConnection.State != ConnectionState.Open) sql.SqlConnection.Open();

			string fldlist = utilStats.GetDataFlds_byDataProject(dataproj_pk, tblname, measureID);


			DataTable delinks = sql.DataTable_from_SQLstring("select a.name as pkfield, coalesce(deformname,'') deformname " +
				"from datField a " +
				"join datTable b ON a.TableID = b.tableID " +
				"join datTable_measure c ON b.TableID = c.tableID   " +
				"left join uwautism_research_backend..tblMeasure d ON c.measureID = d.measureID " +
				"where fieldcodeID=10 and c.measureID=" + measureID.ToString());

			string deformurl = "";
			string pkfield = "";
			string linkcode = "";

			if (delinks.Rows.Count > 0)
			{
				deformurl = delinks.Rows[0].Field<string>("deformname").ToString();
				pkfield = delinks.Rows[0].Field<string>("pkfield").ToString();
				if (deformurl.Length > 3 & pkfield.Length > 1)
				{
					string excelfx = " '=HYPERLINK(\"https://uwac.autism.washington.edu/research/dataentryforms/common/" + deformurl + "/" + deformurl + ".aspx";

					linkcode = excelfx + "?pk=' + cast(" + pkfield + " as varchar) + '\",\"link\")' DE_link, ";
				}
				else
				{
					linkcode = " '' DE_link, ";
				}
			}

			string sel_subj = "'" + String.Join("','", subj) + "'";
			//string sel_subj = (dataproj_pk == 0) ? GetProject_Subjects(groupID_csv, subjstatusID_csv) : GetProject_Subjects(dataproj_pk);


			string sSQL = "";
			DataTable dt = new DataTable();
			DataTable dt_REL = new DataTable();

			string datevar = sql.StringScalar_from_SQLstring("select fldname  from uwautism_research_data.def.Fld where fieldcodeID = 2 " +
						" and tblpk in (select tblpk from uwautism_research_data.def.Tbl where measureID = " + measureID.ToString() + " ) ");
			string days_from_datevar = "";
			if (datevar != null)
			{
				days_from_datevar = (datevar.Length > 0) ? " datediff(day, txstart," + datevar + ") days_from_txstart, " : "";
			}


			string tadpole_txgrps = (studyID == 1076) ? " (case when txgrp in ('A','D') then 'DTT' when txgrp in ('B','C') then 'PB' end) as txstyle, " +
				" (case when txgrp in ('A','C') then 'High' when txgrp in ('B','D') then 'Low' end) as txintensity, " : "";



			sSQL = linkcode + " a.ID, groupname as [Group], subjstatus, coalesce(txgrp,'**NA**') txgrp, " + tadpole_txgrps + "  txstart, " + days_from_datevar +
			" timepoint as timepointnum, timepoint_text as TimePoint " +
			" , a.studymeasID , dbo.fnStudymeas_IsREL(a.studymeasID) isREL " + fldlist +
			" from uwautism_research_data.." + tblname + " a " +
			" join  (select ID, groupname, txgrp, txstart, subjstatus from uwautism_research_backend..vwMasterStatus_S_txgrp where id in ( " + sel_subj + ")) b ON a.ID = b.ID " +
			" join  (select studymeasID, timepointID from uwautism_research_backend..tblStudyMeas) c ON a.studymeasID = c.studymeasID " +
			" join  uwautism_research_backend..tblTimePoint d ON c.timepointID = d.timepointID " +
			" where verified in (0,1) and a.studymeasID in (" + studymeas_csv + ")  ";


			// Exclude any REL records from the real data
			string sSQL_data = "select * from (select " + sSQL + ") x where isREL = 0   order by TimePoint, [ID]";


			dt = sql.DataTable_from_SQLstring(sSQL_data);


			int hasREL = sql.IntScalar_from_SQLstring("select  coalesce(sum(dbo.fnStudymeas_IsREL(studymeasID)),0) as hasREL " +
					" from   dp.Meas where dataproj_pk = " + dataproj_pk.ToString() + " and measureID = " + measureID.ToString());

			//Stack the REL data, but only include cases with both the ORIG and REL.
			// the dp.fnGet_RELKEY function returns the tablePK for the original coding for both the ORIG and the REL so that cases can be matched on this.
			if (hasREL > 0)
			{
				string sSQL_RELdata = "select * from (select  dp.fnGet_RELKEY(a.id, a.studymeasID) RELKEY, " + sSQL + ") x where RELKEY is not null   order by [ID], RELKEY, isREL";
				dt_REL = sql.DataTable_from_SQLstring(sSQL_RELdata);
			}

			//}

			//DataTable dt_clean = utilStats.DataTable_MissingToNULL(dt, row["tblname"].ToString(), false);

			dt.TableName = measname.ToString();

			tbls.Add(dt);


			if (dt_REL.DataSet != null)
			{
				dt_REL.TableName = "REL_" + measname.ToString();
				tbls.Add(dt_REL);
			}

			return tbls;

		}





		public static DataSet GetIntHxData(SQL_utils sql, int dataproj_pk)
		{
			List<DataTable> tbls = new List<DataTable>();

			if (sql.SqlConnection.State != ConnectionState.Open) sql.SqlConnection.Open();

			List<SqlParameter> ps = new List<SqlParameter>();
			ps.Add(sql.CreateParam("dataproj_pk", dataproj_pk.ToString(), "int"));

			DataSet ds = sql.DataSet_from_ProcName("[dp].[IntHx_SUMMARIZE]", ps);

			if (ds !=null)
			{
				int counter = 0;
				foreach(DataTable dt in ds.Tables)
				{

					if(counter==0)
					{
						dt.TableName = "IntHx Settings";
					}
					else{
						dt.TableName = "IntHx_" + counter.ToString();
					}
					counter++;
				}
			}


			return ds;

		}



			public static string wrapCSV(string s)
		{
			s = s.Replace(",", "','");
			s = "'" + s + "'";
			return s;
		}


		//This parallels the DataProject that is defined on the website and formally saved to the DB.
		//This method is a one-off used by MeasureStats.aspx that creates the same structure.  
		public static DataSet DataProject_Populate(int studyID, string measureID_csv, string timepointID_csv, string groupID_csv, string subjstatusID_csv)
		{
			SQL_utils sql = new SQL_utils();

			DataSet dset = new DataSet();
			List<int> vartypes = new List<int>();
			vartypes.AddRange(new List<int> { 2, 3, 4 });

			//int dataproj_pk = Convert.ToInt32(Request.QueryString["pk"]);

			if (1 == 1)
			{

				List<SqlParameter> ps = new List<SqlParameter>();
				ps.Add(sql.CreateParam("studyID", studyID.ToString(), "int"));
				ps.Add(sql.CreateParam("measureID_csv", measureID_csv, "text"));
				ps.Add(sql.CreateParam("timepointID_csv", timepointID_csv, "text"));
				ps.Add(sql.CreateParam("groupID_csv", groupID_csv, "text"));
				ps.Add(sql.CreateParam("subjstatusID_csv", subjstatusID_csv, "text"));
				
				dset = sql.DataSet_from_ProcName("dp.spDataProject_MetaData2", ps);

				if (dset != null)
				{
					dset.Tables[0].TableName = "Subjects";
					dset.Tables[1].TableName = "Subjects_excluded";
					dset.Tables[2].TableName = "DataDict";
					dset.Tables[3].TableName = "Measures";

					#region MEASURES

					foreach (DataRow row in dset.Tables["Measures"].Rows)
					{
						//1

						int measureID = (int)row["measureID"];
						string measname = row["measname"].ToString();
						string tblname = row["tblname"].ToString();
						string studymeas_csv = row["studymeas_csv"].ToString();

						//2   pass 0 for dataproj_pk as we are not using a dataproject 
						List<DataTable> tbls = GetMeasure(sql, 0, measureID, measname, tblname, studymeas_csv, studyID, groupID_csv, subjstatusID_csv);

						foreach (DataTable t in tbls)
						{
							dset.Tables.Add(t);
						}

					}
				}

				#endregion

			}
			sql.Close();


			dset = utilStats.RemoveMissingValues_from_DataSet(dset);

			return dset;
		}




		public static DataSet DataProject_Populate_Metadata(int dataproj_pk)
		{
			SQL_utils sql = new SQL_utils();

			DataSet dset = new DataSet();

			if (dataproj_pk > 0)
			{

				dset = sql.DataSet_from_ProcName("dp.spDataProject_MetaData", sql.CreateParam("dataproj_pk", dataproj_pk.ToString(), "int"));

				dset.Tables[0].TableName = "Subjects";
				dset.Tables[1].TableName = "Subjects_excluded";
				dset.Tables[2].TableName = "DataDict";
				dset.Tables[3].TableName = "Measures";
			}

			return dset;
		}

		

		public static DataSet DataProject_Populate(int dataproj_pk, List<string> subj, List<int> meas, List<string> vars)
		{
			SQL_utils sql = new SQL_utils();
			DataSet dset = new DataSet();
			dset = DataProject_Populate_Metadata(dataproj_pk );

			DataTable tmp = dset.Tables["Subjects"].Copy();
			var use_subj =
				from a in tmp.AsEnumerable()
				where subj.Any(x => a.Field<string>("id").Contains(x.ToString()))
				select a;
			dset.Tables["Subjects"].Clear();
			dset.Tables["Subjects"].Merge(use_subj.AsDataView().ToTable());
			dset.Tables["Subjects"].AcceptChanges();

			DataTable tmp2 = dset.Tables["DataDict"].Copy();
			var use_vars =
				from a in tmp2.AsEnumerable()
				where vars.Any(x => a.Field<string>("fldname").Contains(x.ToString()))
				select a;
			dset.Tables["Subjects"].Clear();
			dset.Tables["Subjects"].Merge(use_subj.AsDataView().ToTable());
			dset.Tables["Subjects"].AcceptChanges();


			dset = DataProject_Add_Meas(dset, dataproj_pk, sql);

			sql.Close();

			dset = utilStats.RemoveMissingValues_from_DataSet(dset);

			return dset;


		}


		//HERE!
		public static DataSet DataProject_Populate(int dataproj_pk)
		{
			SQL_utils sql = new SQL_utils();
			DataSet dset = new DataSet();
			dset = DataProject_Populate_Metadata(dataproj_pk);

			dset = DataProject_Add_Meas(dset, dataproj_pk, sql);

			dset = DataProject_Add_IntHx(dset, dataproj_pk, sql);
			
			sql.Close();

			dset = utilStats.RemoveMissingValues_from_DataSet(dset);

			return dset;
		}


		public static DataSet DataProject_Add_Meas(DataSet dset, int dataproj_pk, SQL_utils sql)
		{

			foreach (DataRow row in dset.Tables["Measures"].Rows)
			{
				int measureID = (int)row["measureID"];
				string measname = row["measname"].ToString();
				string tblname = row["tblname"].ToString();
				string studymeas_csv = row["studymeas_csv"].ToString();

				List<DataTable> tbls = GetMeasure(sql, dataproj_pk, measureID, measname, tblname, studymeas_csv, 0);

				foreach (DataTable t in tbls)
				{
					dset.Tables.Add(t);
				}
			}

			return dset;
		}

		public static DataSet DataProject_Add_IntHx(DataSet dset, int dataproj_pk, SQL_utils sql)
		{
			int hasIntHx = sql.IntScalar_from_SQLstring("select count(*) from dp.IntHxPARAMS where dataproj_pk = " + dataproj_pk.ToString());

			if (hasIntHx > 0)
			{

				DataTable inthxSheets = new DataTable();
				inthxSheets.TableName = "IntHx Worksheets";
				inthxSheets.Columns.Add("worksheet");
				inthxSheets.Columns.Add("mode");
				inthxSheets.Columns.Add("N records");
				inthxSheets.Columns.Add("N IDs");
				inthxSheets.Columns.Add("Sum TxHrs");


				DataSet inthx_ds = GetIntHxData(sql, dataproj_pk);

				for (int i = 1; i < inthx_ds.Tables.Count; i++)
				{
					DataTable t = inthx_ds.Tables[i];
					DataRow row = inthxSheets.NewRow();
					row["worksheet"] = t.TableName;

					string mode = (from DataRow dr in t.Rows
								   select (string)dr["mode"]).FirstOrDefault().ToString();
					row["mode"] = mode;
					row["N records"] = t.Rows.Count.ToString();

					string N_IDs = (from DataRow dr in t.Rows
									select (string)dr["ID"]).Distinct().Count().ToString();
					row["N IDs"] = N_IDs;


					string hrs_varname = (i == 1) ? "ihhrsperwk" : "sum_ihhrsperwk";
					double sum = (from DataRow dr in t.Rows
								  select (double)dr[hrs_varname]).Sum();
					row["Sum TxHrs"] = sum.ToString();

					inthxSheets.Rows.Add(row);
				}

				for (int i = 0; i < inthx_ds.Tables.Count; i++)
				{
					DataTable t = inthx_ds.Tables[i];
					dset.Tables.Add(t.Copy());
				}
			}

			return dset;
		}

		public static DataSet DataProject_Descstats(int dataproj_pk, DataSet dset)
		{
			return DataProject_Descstats( dset, Create_IVset_TP_Group_txgrp());
			//return DataProject_Descstats(dataproj_pk, dset, Create_IVset_TP_Group_txgrp());
		}




		//public static DataSet DataProject_Descstats(int dataproj_pk, DataSet dset, List<IVset> myIVset)  
		public static DataSet DataProject_Descstats( DataSet dset, List<IVset> myIVset)  
		{
			DataSet dset_descstats = new DataSet();



			//List<List<string>> list_of_groupvars = new List<List<string>> { new List<string> { "TimePoint" }, new List<string> { "TimePoint", "Group" } };

			List<string> all_grouping_vars = myIVset
				.SelectMany(x => x.IVs.Select(y => y))
				.Distinct()
				.ToList();

			//stringList = empList.SelectMany(emp => emp.Certifications).Distinct().ToList();

			//List<string> distinct = list_of_groupvars.SelectMany(mo => mo.Li).Distinct();


			DataTable dtmeas = dset.Tables["Measures"];

			List<string> measures = dtmeas.AsEnumerable().Select(f => f.Field<string>("measname")).ToList();


			//int counter0 = 0;

			//DataTable descstats_0 = new DataTable();

			//int counter1 = 0;
			//Process each set of IVs (a set of IV's will subdivide the data by one of more variables)
			foreach (IVset groupvars in myIVset)
			{
				List<string> listIVs = groupvars.IVs;
				Debug.Print("    IVset: " + String.Join(",", listIVs)); //.ToString());

				int counter_ivset = 0;

				//Start a new data table to hold the stats for this IVset
				DataTable descstats_ivset = new DataTable();

				//Process measures (each measure is processed as a whole, by looping through the list of IV sets)
				foreach(string t in measures)
				{
					Debug.Print("START: " + t);
					DataTable dt = dset.Tables[t];


					//split the data into a list of 
					List<DataTable> tbls = utilStats.qryGroupBy(dt, t, groupvars.IVs);
					Debug.Print("    made list of tbls length: " + tbls.Count.ToString());

					DataTable descstats_t = new DataTable();

					int counter_subt = 0;
					foreach (DataTable subt in tbls)
					{
						Debug.Print("        subt: " + subt.TableName);
						DataTable_DescStats descstats_subtA = new DataTable_DescStats(subt);
						descstats_subtA.TableName = t + subt.TableName;

						DataTable descstats_subtB = AddGroupingColumns(descstats_subtA, t, groupvars.IVs, all_grouping_vars, subt.TableName);

						Debug.Print("==================> rows descstats_t = " + descstats_t.Rows.Count.ToString()  + "    B = " + descstats_subtB.Rows.Count.ToString());
						if (counter_subt == 0) descstats_t = descstats_subtB;
						else descstats_t.Merge(descstats_subtB);
						Debug.Print("==================> rows descstats_t = " + descstats_t.Rows.Count.ToString());

						counter_subt++;
					}

					Debug.Print("=======================> rows descstats_ivset = " + descstats_ivset.Rows.Count.ToString() + "    t = " + descstats_t.Rows.Count.ToString());
					if (counter_ivset == 0) descstats_ivset = descstats_t;
					else descstats_ivset.Merge(descstats_t);
					Debug.Print("=======================> rows descstats_ivset = " + descstats_ivset.Rows.Count.ToString());

					counter_ivset++;
				}

				descstats_ivset.TableName = String.Join(",", listIVs);
				dset_descstats.Tables.Add(descstats_ivset);


				//Debug.Print("============================> rows       descstats_0 = " + descstats_0.Rows.Count.ToString() + "    1 = " + descstats_1.Rows.Count.ToString());
				//if (counter0 == 0) descstats_0 = descstats_1;
				//else descstats_0.Merge(descstats_1);
				//Debug.Print("============================> rows       descstats_0 = " + descstats_0.Rows.Count.ToString());

				//counter0++;
				
			}

			//List<DataTable> grouped_descstats = utilStats.qryGroupBy(descstats_0, "t", new List<string> { "IVs" });

			//foreach(DataTable dt in grouped_descstats)
			//{
			//    dset_descstats.Tables.Add(dt);
			//}


			return dset_descstats;
		}


		public static DataSet DataProject_Descstats(DataSet dset, List<IVset> myIVset, string orig)
		{
			DataSet dset_descstats = new DataSet();



			//List<List<string>> list_of_groupvars = new List<List<string>> { new List<string> { "TimePoint" }, new List<string> { "TimePoint", "Group" } };

			List<string> all_grouping_vars = myIVset
				.SelectMany(x => x.IVs.Select(y => y))
				.Distinct()
				.ToList();

			//stringList = empList.SelectMany(emp => emp.Certifications).Distinct().ToList();

			//List<string> distinct = list_of_groupvars.SelectMany(mo => mo.Li).Distinct();


			DataTable dtmeas = dset.Tables["Measures"];

			List<string> measures = dtmeas.AsEnumerable().Select(f => f.Field<string>("measname")).ToList();


			int counter0 = 0;

			DataTable descstats_0 = new DataTable();

			//Process measures (each measure is processed as a whole, by looping through the list of IV sets)
			foreach (string t in measures)
			{
				Debug.Print("START: " + t);
				DataTable dt = dset.Tables[t];

				DataTable descstats_1 = new DataTable();

				int counter1 = 0;
				//Process each set of IVs (a set of IV's will subdivide the data by one of more variables)
				foreach (IVset groupvars in myIVset)
				{
					List<string> listIVs = groupvars.IVs;
					Debug.Print("    IVset: " + String.Join(",", listIVs)); //.ToString());

					int counter2 = 0;

					//split the data into a list of 
					List<DataTable> tbls = utilStats.qryGroupBy(dt, t, groupvars.IVs);
					Debug.Print("    made list of tbls length: " + tbls.Count.ToString());

					DataTable descstats_2 = new DataTable();

					foreach (DataTable subt in tbls)
					{
						Debug.Print("        subt: " + subt.TableName);
						DataTable_DescStats descstatsA = new DataTable_DescStats(subt);
						descstatsA.TableName = t + subt.TableName;

						DataTable descstatsB = AddGroupingColumns(descstatsA, t, groupvars.IVs, all_grouping_vars, subt.TableName);

						Debug.Print("==================> rows descstats_2 = " + descstats_2.Rows.Count.ToString() + "    B = " + descstatsB.Rows.Count.ToString());
						if (counter2 == 0) descstats_2 = descstatsB;
						else descstats_2.Merge(descstatsB);
						Debug.Print("==================> rows descstats_2 = " + descstats_2.Rows.Count.ToString());

						counter2++;
					}

					Debug.Print("=======================> rows descstats_1 = " + descstats_1.Rows.Count.ToString() + "    2 = " + descstats_2.Rows.Count.ToString());
					if (counter1 == 0) descstats_1 = descstats_2;
					else descstats_1.Merge(descstats_2);
					Debug.Print("=======================> rows descstats_1 = " + descstats_1.Rows.Count.ToString());

					counter1++;
				}

				Debug.Print("============================> rows       descstats_0 = " + descstats_0.Rows.Count.ToString() + "    1 = " + descstats_1.Rows.Count.ToString());
				if (counter0 == 0) descstats_0 = descstats_1;
				else descstats_0.Merge(descstats_1);
				Debug.Print("============================> rows       descstats_0 = " + descstats_0.Rows.Count.ToString());

				counter0++;

			}

			List<DataTable> grouped_descstats = utilStats.qryGroupBy(descstats_0, "t", new List<string> { "IVs" });

			foreach (DataTable dt in grouped_descstats)
			{
				dset_descstats.Tables.Add(dt);
			}


			return dset_descstats;
		}

		protected static DataTable AddGroupingColumns(DataTable dt, string measname, List<string> groupvars, List<string> all_grouping_vars, string values_csv)
		{
			List<string> vals = values_csv.Split(',').ToList();
			int counter = 0;

			foreach (string s in groupvars)
			{
				//Add the columns 
				DataColumn col = new DataColumn(s, typeof(System.String));
				col.DefaultValue = vals[counter];
				dt.Columns.Add(col);
				col.SetOrdinal(1 + counter);
				counter++;
			}

			////Add missing columns
			//foreach (string s in all_grouping_vars)
			//{
			//    if (!groupvars.Contains(s))
			//    {
			//        DataColumn col = new DataColumn(s, typeof(System.String));
			//        dt.Columns.Add(col);
			//        col.SetOrdinal(0);

			//    }
			//}

			//Add a column to list the IVs used
			DataColumn col2 = new DataColumn("IVs", typeof(System.String));
			col2.DefaultValue = String.Join(",", groupvars);
			dt.Columns.Add(col2);
			//col2.SetOrdinal(0);

			//Add the Measure
			DataColumn col3 = new DataColumn("Measure", typeof(System.String));
			col3.DefaultValue = measname;
			dt.Columns.Add(col3);
			col3.SetOrdinal(0);


			return dt;
		}


		protected static DataTable AddGroupingColumns(DataTable dt, string measname, List<string> groupvars, List<string> all_grouping_vars, string values_csv, string orig)
		{
			List<string> vals = values_csv.Split(',').ToList();
			int counter = 0;

			foreach(string s in groupvars)
			{
				//Add the columns 
				DataColumn col = new DataColumn(s, typeof(System.String));
				col.DefaultValue = vals[counter];
				dt.Columns.Add(col);
				col.SetOrdinal(0);
				counter++;
			}

			//Add missing columns
			foreach (string s in all_grouping_vars)
			{
				if(!groupvars.Contains(s))
				{
					DataColumn col = new DataColumn(s, typeof(System.String));
					dt.Columns.Add(col);
					col.SetOrdinal(0);

				}
			}

			//Add a column to list the IVs used
			DataColumn col2 = new DataColumn("IVs", typeof(System.String));
			col2.DefaultValue = String.Join(",", groupvars);
			dt.Columns.Add(col2);
			col2.SetOrdinal(0);

			//Add the Measure
			DataColumn col3 = new DataColumn("Measure", typeof(System.String));
			col3.DefaultValue = measname;
			dt.Columns.Add(col3);
			col3.SetOrdinal(0);


			return dt;
		}



		protected static void LogDescstatsToDB(DataTable dt, int dataproj_pk, string meas)
		{
			
		}



		protected static string GetProject_Subjects(int dataproj_pk)
		{
			SQL_utils sql = new SQL_utils();

			DataTable dt = sql.DataTable_from_SQLstring("select groupID, subjstatusID from dp.Grp where dataproj_pk = " + dataproj_pk.ToString());

			string g_ss_csv = "";

			//Loop though each row to build a SQL where clause for group and
			//subjstatus
			int counter = 0;
			foreach (DataRow row in dt.Rows)
			{
				string ORclause = (counter == 0) ? "" : " OR ";
				g_ss_csv += ORclause + " (groupID=" + row["groupID"].ToString() + " and subjstatusID=" + row["subjstatusID"].ToString() + ") ";
				counter++;
			}
			sql.Close();

			return g_ss_csv;
		}


		//Overloaded: pass in a list of groupID's and a list of subjstatusID's
		protected static string GetProject_Subjects(List<string> groupIDs, List<string> subjstatusIDs)
		{


			string g = String.Join(",", groupIDs);
			string ss = String.Join(",", subjstatusIDs);

			string g_ss_csv = " (groupID in (" + g + ") and subjstatusID in (" + ss + ")";

			return g_ss_csv;
		}

		//Overloaded: pass in a csv of groupID's and a list of subjstatusID's
		protected static string GetProject_Subjects(string groupID_csv, string subjstatusID_csv)
		{
			string g_ss_csv = " groupID in (" + groupID_csv + ") and subjstatusID in (" + subjstatusID_csv + ")";

			return g_ss_csv;
		}






		public static List<IVset> Create_IVset_TP_Group_txgrp()
		{
			List<IVset> myIVset = new List<IVset>();

			myIVset.Add(new IVset() { IVs = new List<string> { "TimePoint" } });
			myIVset.Add(new IVset() { IVs = new List<string> { "TimePoint", "Group" } });
			myIVset.Add(new IVset() { IVs = new List<string> { "TimePoint", "txgrp" } });
			myIVset.Add(new IVset() { IVs = new List<string> { "TimePoint", "Group", "txgrp" } });


			return myIVset;
		}




	}

	public class IVset  
	{
		private List<string> _IVs;
		public IVset() 
		{
		}

		public List<string> IVs
		{
			get { return _IVs; }
			set { _IVs = value; }
		}

		//public void Add (List<string> set)
		//{
		//    this._IVs.Add(set);
		//}

	}


	
}