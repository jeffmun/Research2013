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
using RedcapLibrary;
using uwac;
using uwac_REDCap;
using DevExpress.Web;
using System.Data.SqlClient;

namespace uwac
{
	/// <summary>
	/// Summary description for Actigraphy
	/// </summary>
	public class Actigraphy : Datapipeline
	{
		public DataTable dt_props;
		public DataTable dt_stats;
		public DataTable dt_epochs;
		public DataTable dt_stats_summary;
		public DataTable dt_sleeps;
		public DataTable dt_diary;
		public string _id { get; set; }
		public int _timepointid { get; set;}
		public List<ActigraphChunkMarkers> markers { get; set; }

		public ActigraphyTimepoint startsource;
		public ActigraphyTimepoint endsource;

		public Actigraphy(int docversid, string filepath, string id, int timepointid, ActigraphyTimepoint starting_point, ActigraphyTimepoint ending_point)
        {
			startsource = starting_point;
			endsource = ending_point;
			_id = id;
			_timepointid = timepointid;

			Initialize(docversid, filepath);

			if (_docvers.HasTables())
			{
				ExtractMarkers();

				ExtractProperties();
				ExtractStats();

				ExtractEpochs();

				GetSleepDiaryInfoFromDB();

				CountConsecSleepsWithinEpochs();

				//dt_sleeps = CreateFirstLastSleepsTable();
				//_log.Log(String.Format("INFO: Found {0} records of Sleep Diary info for '{1}'", dt_diary.Rows.Count, id));

				//ScoreFromDiary();

			}

		}

		#region Public Methods to Return Data to Page

		public DataTable SleepStats(string intervaltype)
		{
			if (dt_stats.HasRows())
			{
				DataTable dt = dt_stats.AsEnumerable().Where(f => f.Field<string>("intervaltype") == intervaltype).CopyToDataTable();
				return dt;
			}
			else return null;
		}

		public DataTable TopNEpochs(int n)
		{
			int min_rownum = dt_epochs.AsEnumerable().Select(f => f.Field<int>("rownum")).Min();

			DataTable dt_topn = dt_epochs.AsEnumerable().Where(f => f.Field<int>("rownum") < min_rownum + n).CopyToDataTable();
			return dt_topn;
		}

		public DataTable BottomNEpochs(int n)
		{
			int max_rownum = dt_epochs.AsEnumerable().Select(f => f.Field<int>("rownum")).Max();

			DataTable dt_topn = dt_epochs.AsEnumerable().Where(f => f.Field<int>("rownum") > max_rownum - n).CopyToDataTable();
			return dt_topn;
		}

		#endregion

		private void Initialize(int docversid, string filepath)
        {
			bool noColHeaders = true;
            _docvers = new Docvers(docversid, filepath, noColHeaders);

			_log = new ProcessLog(String.Format("Actigraphy Import (docversid={0})", _docvers.docversid));
			_logs.AddLog(_docvers.processing_results);
			_logs.AddLog(_log);

			if (_docvers.HasTables())
			{
				_docvers.dset.Tables[0].AddRowNumColumn();
				_log.Log(String.Format("origfilename = {0}", _docvers._origfilename));
			}
        }

        #region Methods to Extract Data from the .csv file
        private void ExtractMarkers()
        {
			//4855  Actigraph_properties T1  8221 
			//3842	Actigraph_stats      T1  8222 
			//4853  Actigraph_epochs     T1  8223    

			markers = new List<ActigraphChunkMarkers>();
			markers.Add(FindMarkers(4855));
			markers.Add(FindMarkers(3842));
			markers.Add(FindMarkers(4853));

		}

		private ActigraphChunkMarkers FindMarkers(int measureID)
        {
			ActigraphChunkMarkers m = new ActigraphChunkMarkers(measureID);
			m.PopulateIndices(_docvers.dset.Tables[0]);
			
			foreach(ChunkMarker cm in m)
            {
				_log.Log(String.Format("found marker: rows {0} to {1} {2}", cm.linenumber_start, cm.linenumber_end, cm.text));
            }

			return m;
		}

		private List<DataTable> ExtractDataFromMarkers(ActigraphChunkMarkers cms, List<string> cols_to_keep)
        {
			List<DataTable> dts = new List<DataTable>();

			foreach (ChunkMarker cm in cms)
			{
				string chunkname = cm.text.Replace("-", "");
				DataTable dtnew = _docvers.dset.Tables[0].AsEnumerable()
					.Where(f => f.Field<int>("rownum") >= cm.linenumber_start+2 & f.Field<int>("rownum") <= cm.linenumber_end)
					.CopyToDataTable();

				dtnew.AddColumn("section", typeof(string), chunkname);
				dtnew.AddColumn("docversid", typeof(int), _docvers.docversid);

				dtnew.ColumnNamesToLower();

				if(cols_to_keep != null) dtnew = dtnew.KeepColumns(cols_to_keep);

				dts.Add(dtnew);
			}

			return dts;
		}

		private void ExtractProperties()
        {
			List<string> cols_to_keep = new List<string> { "section", "docversid", "column1", "column2", "column3", "rownum" };

			List<DataTable> mydts_props = ExtractDataFromMarkers(markers[0], cols_to_keep);

			dt_props = mydts_props[0];
			dt_props.Merge(mydts_props[1]);
			dt_props.Merge(mydts_props[2]);

			dt_props.RenameColumn("column1", "property");
			dt_props.RenameColumn("column2", "value");
			dt_props.RenameColumn("column3", "units");
		}

		private void ExtractStats()
		{
			List<DataTable> mydts_stats = ExtractDataFromMarkers(markers[1], null);
			dt_stats = mydts_stats[0];

			dt_stats.RenameColumnsFromRowIndex(0, true);

			dt_stats.AddColumn("issummary", typeof(int), 0);

			dt_stats.AddColumn("start_dt", typeof(string));
			dt_stats.AddColumn("end_dt", typeof(string));



			List<string> keep_intervals = new List<string> { "REST", "ACTIVE", "SLEEP", "DAILY", "EXCLUDED" };

			foreach(DataRow r in dt_stats.Rows)
            {
				string intervaltype = r["intervaltype"].ToString();
				if (intervaltype.EndsWith("ummary")) r["issummary"] = 1;
				if (keep_intervals.Contains(intervaltype)) r["issummary"] = 2;
			}

			dt_stats.AcceptChanges();

			dt_stats.ChangeColumnIndex("start_dt", 8);
			dt_stats.ChangeColumnIndex("end_dt", 9);

			dt_stats_summary = dt_stats.AsEnumerable().Where(f => f.Field<int>("issummary") == 1).CopyToDataTable();
			dt_stats = dt_stats.AsEnumerable().Where(f => f.Field<int>("issummary") == 2).CopyToDataTable();


			foreach (DataRow r in dt_stats.Rows)
			{

				int int_startdate;
				bool isint_startdate = Int32.TryParse(r["startdate"].ToString(), out int_startdate);

				double dbl_starttime;
				bool isdbl_starttime = Double.TryParse(r["starttime"].ToString(), out dbl_starttime);

				int int_enddate;
				bool isint_enddate = Int32.TryParse(r["enddate"].ToString(), out int_enddate);

				double dbl_endtime;
				bool isdbl_endtime = Double.TryParse(r["endtime"].ToString(), out dbl_endtime);

				if (isint_startdate & isdbl_starttime )
				{
					r["start_dt"] = ActigraphyScoring.Date_time_ToDateTime(int_startdate, dbl_starttime);
				}
				if (isint_enddate & isdbl_endtime)
				{
					r["end_dt"] = ActigraphyScoring.Date_time_ToDateTime(int_enddate, dbl_endtime);
				}

				//Convert to numeric types
				if (dt_stats.ContainsColumnName("intervalnum")) dt_stats.ConvertColumnType("intervalnum", typeof(int));
				if (dt_stats.ContainsColumnName("startdate")) dt_stats.ConvertColumnType("startdate", typeof(int));
				if (dt_stats.ContainsColumnName("enddate")) dt_stats.ConvertColumnType("enddate", typeof(int));
				if (dt_stats.ContainsColumnName("duration")) dt_stats.ConvertColumnType("duration", typeof(int));
				if (dt_stats.ContainsColumnName("offwrist")) dt_stats.ConvertColumnType("offwrist", typeof(int));
				if (dt_stats.ContainsColumnName("totalac")) dt_stats.ConvertColumnType("totalac", typeof(int));
				if (dt_stats.ContainsColumnName("maxac")) dt_stats.ConvertColumnType("maxac", typeof(int));
				if (dt_stats.ContainsColumnName("invtimeac")) dt_stats.ConvertColumnType("invtimeac", typeof(int));
				if (dt_stats.ContainsColumnName("invtimesw")) dt_stats.ConvertColumnType("invtimesw", typeof(int));
				if (dt_stats.ContainsColumnName("onsetlatency")) dt_stats.ConvertColumnType("onsetlatency", typeof(int));
				if (dt_stats.ContainsColumnName("snoozetime")) dt_stats.ConvertColumnType("snoozetime", typeof(int));
				if (dt_stats.ContainsColumnName("waso")) dt_stats.ConvertColumnType("waso", typeof(int));
				if (dt_stats.ContainsColumnName("waketime")) dt_stats.ConvertColumnType("waketime", typeof(int));
				if (dt_stats.ContainsColumnName("numwakebouts")) dt_stats.ConvertColumnType("numwakebouts", typeof(int));
				if (dt_stats.ContainsColumnName("sleeptime")) dt_stats.ConvertColumnType("sleeptime", typeof(int));
				if (dt_stats.ContainsColumnName("numsleepbouts")) dt_stats.ConvertColumnType("numsleepbouts", typeof(int));
				if (dt_stats.ContainsColumnName("immobiletime")) dt_stats.ConvertColumnType("immobiletime", typeof(int));
				if (dt_stats.ContainsColumnName("numimmbouts")) dt_stats.ConvertColumnType("numimmbouts", typeof(int));
				if (dt_stats.ContainsColumnName("mobiletime")) dt_stats.ConvertColumnType("mobiletime", typeof(int));
				if (dt_stats.ContainsColumnName("nummobbouts")) dt_stats.ConvertColumnType("nummobbouts", typeof(int));
				if (dt_stats.ContainsColumnName("numoneminimmb")) dt_stats.ConvertColumnType("numoneminimmb", typeof(int));
				if (dt_stats.ContainsColumnName("taltwhite")) dt_stats.ConvertColumnType("taltwhite", typeof(int));
				if (dt_stats.ContainsColumnName("invtimewhite")) dt_stats.ConvertColumnType("invtimewhite", typeof(int));
				if (dt_stats.ContainsColumnName("rownum")) dt_stats.ConvertColumnType("rownum", typeof(int));
				if (dt_stats.ContainsColumnName("docversid")) dt_stats.ConvertColumnType("docversid", typeof(int));
				if (dt_stats.ContainsColumnName("issummary")) dt_stats.ConvertColumnType("issummary", typeof(int));

				if (dt_stats.ContainsColumnName("starttime")) dt_stats.ConvertColumnType("starttime", typeof(double));
				if (dt_stats.ContainsColumnName("endtime")) dt_stats.ConvertColumnType("endtime", typeof(double));
				if (dt_stats.ContainsColumnName("pctoffwrist")) dt_stats.ConvertColumnType("pctoffwrist", typeof(double));
				if (dt_stats.ContainsColumnName("avgac_per_min")) dt_stats.ConvertColumnType("avgac_per_min", typeof(double));
				if (dt_stats.ContainsColumnName("avgac_per_epoch")) dt_stats.ConvertColumnType("avgac_per_epoch", typeof(double));
				if (dt_stats.ContainsColumnName("stdac")) dt_stats.ConvertColumnType("stdac", typeof(double));
				if (dt_stats.ContainsColumnName("pctinvalidac")) dt_stats.ConvertColumnType("pctinvalidac", typeof(double));
				if (dt_stats.ContainsColumnName("pctinvalidsw")) dt_stats.ConvertColumnType("pctinvalidsw", typeof(double));
				if (dt_stats.ContainsColumnName("efficiency")) dt_stats.ConvertColumnType("efficiency", typeof(double));
				if (dt_stats.ContainsColumnName("pctwake")) dt_stats.ConvertColumnType("pctwake", typeof(double));
				if (dt_stats.ContainsColumnName("avgwakeb")) dt_stats.ConvertColumnType("avgwakeb", typeof(double));
				if (dt_stats.ContainsColumnName("pctsleep")) dt_stats.ConvertColumnType("pctsleep", typeof(double));
				if (dt_stats.ContainsColumnName("avgsleepb")) dt_stats.ConvertColumnType("avgsleepb", typeof(double));
				if (dt_stats.ContainsColumnName("pctimmobile")) dt_stats.ConvertColumnType("pctimmobile", typeof(double));
				if (dt_stats.ContainsColumnName("avgimmbout")) dt_stats.ConvertColumnType("avgimmbout", typeof(double));
				if (dt_stats.ContainsColumnName("pctmobile")) dt_stats.ConvertColumnType("pctmobile", typeof(double));
				if (dt_stats.ContainsColumnName("avgmobbout")) dt_stats.ConvertColumnType("avgmobbout", typeof(double));
				if (dt_stats.ContainsColumnName("pctoneminimmb")) dt_stats.ConvertColumnType("pctoneminimmb", typeof(double));
				if (dt_stats.ContainsColumnName("fragmentation")) dt_stats.ConvertColumnType("fragmentation", typeof(double));
				if (dt_stats.ContainsColumnName("exposurewhite")) dt_stats.ConvertColumnType("exposurewhite", typeof(double));
				if (dt_stats.ContainsColumnName("avgwhite")) dt_stats.ConvertColumnType("avgwhite", typeof(double));
				if (dt_stats.ContainsColumnName("stdwhite")) dt_stats.ConvertColumnType("stdwhite", typeof(double));
				if (dt_stats.ContainsColumnName("maxwhite")) dt_stats.ConvertColumnType("maxwhite", typeof(double));
				if (dt_stats.ContainsColumnName("pctinvalidwhite")) dt_stats.ConvertColumnType("pctinvalidwhite", typeof(double));
				if (dt_stats.ContainsColumnName("exposurered")) dt_stats.ConvertColumnType("exposurered", typeof(double));
				if (dt_stats.ContainsColumnName("avgred")) dt_stats.ConvertColumnType("avgred", typeof(double));
				if (dt_stats.ContainsColumnName("stdred")) dt_stats.ConvertColumnType("stdred", typeof(double));
				if (dt_stats.ContainsColumnName("maxred")) dt_stats.ConvertColumnType("maxred", typeof(double));
				if (dt_stats.ContainsColumnName("taltred")) dt_stats.ConvertColumnType("taltred", typeof(double));
				if (dt_stats.ContainsColumnName("invtimered")) dt_stats.ConvertColumnType("invtimered", typeof(double));
				if (dt_stats.ContainsColumnName("pctinvalidred")) dt_stats.ConvertColumnType("pctinvalidred", typeof(double));
				if (dt_stats.ContainsColumnName("exposuregreen")) dt_stats.ConvertColumnType("exposuregreen", typeof(double));
				if (dt_stats.ContainsColumnName("avggreen")) dt_stats.ConvertColumnType("avggreen", typeof(double));
				if (dt_stats.ContainsColumnName("stdgreen")) dt_stats.ConvertColumnType("stdgreen", typeof(double));
				if (dt_stats.ContainsColumnName("maxgreen")) dt_stats.ConvertColumnType("maxgreen", typeof(double));
				if (dt_stats.ContainsColumnName("taltgreen")) dt_stats.ConvertColumnType("taltgreen", typeof(double));
				if (dt_stats.ContainsColumnName("invtimegreen")) dt_stats.ConvertColumnType("invtimegreen", typeof(double));
				if (dt_stats.ContainsColumnName("pctinvalidgreen")) dt_stats.ConvertColumnType("pctinvalidgreen", typeof(double));
				if (dt_stats.ContainsColumnName("exposureblue")) dt_stats.ConvertColumnType("exposureblue", typeof(double));
				if (dt_stats.ContainsColumnName("avgblue")) dt_stats.ConvertColumnType("avgblue", typeof(double));
				if (dt_stats.ContainsColumnName("stdblue")) dt_stats.ConvertColumnType("stdblue", typeof(double));
				if (dt_stats.ContainsColumnName("maxblue")) dt_stats.ConvertColumnType("maxblue", typeof(double));
				if (dt_stats.ContainsColumnName("taltblue")) dt_stats.ConvertColumnType("taltblue", typeof(double));
				if (dt_stats.ContainsColumnName("invtimeblue")) dt_stats.ConvertColumnType("invtimeblue", typeof(double));
				if (dt_stats.ContainsColumnName("pctinvalidblue")) dt_stats.ConvertColumnType("pctinvalidblue", typeof(double));
			}
		}

		private void ExtractEpochs()
		{
			List<string> cols_to_keep = new List<string> { "section", "docversid", "rownum"
				, "column1", "column2", "column3", "column4", "column5", "column6", "column7", "column8", "column9", "column10"
				, "column11", "column12", "column13", "column14", "column15", "column16", "column17"};

			List<DataTable> mydts_epochs = ExtractDataFromMarkers(markers[2], cols_to_keep);

			dt_epochs = mydts_epochs[0];

			int rowidx = -1;
			int counter = 0;

			while(rowidx < 0 & counter < dt_epochs.Rows.Count)
            {
				string rowval0 = dt_epochs.Rows[counter].ItemArray[0].ToString();
				string rowval1 = dt_epochs.Rows[counter].ItemArray[1].ToString();
				if (rowval0 == "Line" )
                {
					rowidx = counter;
                }
				counter++;

			}

			if (rowidx > 0)
			{
				dt_epochs.RenameColumnsFromRowIndex(rowidx, true);
			}

			int min_rownum = dt_epochs.AsEnumerable().Select(f => f.Field<int>("rownum")).Min();

			dt_epochs = dt_epochs.AsEnumerable().Where(f => f.Field<int>("rownum") >= min_rownum + counter + 1).CopyToDataTable();

			dt_epochs = dt_epochs.AsEnumerable().Where(f => f.Field<string>("intervalstatus") != "EXCLUDED").CopyToDataTable();

			if (dt_epochs.ContainsColumnName("sleep0wake1")) dt_epochs.ConvertColumnType("sleep0wake1", typeof(int));
			if (dt_epochs.ContainsColumnName("mobility")) dt_epochs.ConvertColumnType("mobility", typeof(int));
			if (dt_epochs.ContainsColumnName("date")) dt_epochs.ConvertColumnType("date", typeof(int));
			if (dt_epochs.ContainsColumnName("day")) dt_epochs.ConvertColumnType("day", typeof(int));
			if (dt_epochs.ContainsColumnName("epoch")) dt_epochs.ConvertColumnType("epoch", typeof(int));
			if (dt_epochs.ContainsColumnName("time")) dt_epochs.ConvertColumnType("time", typeof(double));

			if (dt_epochs.ContainsColumnName("offwriststatus")) dt_epochs.ConvertColumnType("offwriststatus", typeof(int));

			if (dt_epochs.ContainsColumnName("activity")) dt_epochs.ConvertColumnType("activity", typeof(int));


			dt_epochs.AddColumn("mins_from_midnite", typeof(int));
			dt_epochs.AddColumn("daymin", typeof(int));


			foreach (DataRow row in dt_epochs.Rows)
            {
				int mins_from_midnite = Convert.ToInt32(Math.Round(Convert.ToDouble(row["time"].ToString()) * 1440, 0));
				int daymin = mins_from_midnite + (1440 * Convert.ToInt32(row["date"]));

				row["mins_from_midnite"] = mins_from_midnite;
				row["daymin"] = daymin;
				//row["epochdt"] = DayminToDateTime(daymin);
			}


			_log.Log(String.Format("INFO: Extracted {0} epochs", dt_epochs.Rows.Count));
		}

        #endregion


        #region Methods for Various Computations

		private void CountConsecSleepsWithinEpochs()
        {
			dt_epochs.AddColumn("consecsleeps", typeof(int));

			int consec_sleeps = 0;

			for(int i=0; i < dt_epochs.Rows.Count; i++)
            {
				DataRow row = dt_epochs.Rows[i];
				string sleep0wake1 = row["sleep0wake1"].ToString();
				consec_sleeps = (sleep0wake1 == "0") ? consec_sleeps + 1 : 0;
				row["consecsleeps"] = consec_sleeps;
			}
			dt_epochs.AcceptChanges();
        }

		private void ScoreFromDiary()
        {

			int diarydaycounter = 0;
			foreach (DataRow diaryrow in dt_diary.Rows)
			{
				diarydaycounter++;
				int bed_time_daymin = Convert.ToInt32(diaryrow["bed_time_daymin"].ToString());
				int sleep_time_daymin = Convert.ToInt32(diaryrow["sleep_time_daymin"].ToString());
				int wake_time_daymin = Convert.ToInt32(diaryrow["wake_time_daymin"].ToString());
				int out_of_bed_time_daymin = Convert.ToInt32(diaryrow["out_of_bed_time_daymin"].ToString());

				_log.Log(String.Format("..Day {0}: bed_time {1}  sleep_time {2}  wake_time {3}  out_of_bed_time {4}"
							, diarydaycounter
							, ActigraphyScoring.Daymin_to_String(bed_time_daymin)
							, ActigraphyScoring.Daymin_to_String(sleep_time_daymin)
							, ActigraphyScoring.Daymin_to_String(wake_time_daymin)
							, ActigraphyScoring.Daymin_to_String(out_of_bed_time_daymin)
							));


				int? actig_sleepstart_daymin = null;
				int? actig_sleepend_daymin = null;

				try
				{
					actig_sleepstart_daymin = dt_epochs.AsEnumerable()
							.Where(f => f.Field<int>("daymin") >= bed_time_daymin - 5 &
							f.Field<string>("intervalstatus") == "REST-S").Select(f => f.Field<int>("daymin")).Min();
				}
				catch (Exception ex) { }
				try
				{
					actig_sleepend_daymin = dt_epochs.AsEnumerable()
							.Where(f => f.Field<int>("daymin") <= out_of_bed_time_daymin + 5 &
							f.Field<string>("intervalstatus") == "REST-S").Select(f => f.Field<int>("daymin")).Max() + 1;
				}
				catch (Exception ex) { }


				DataTable dtday = GetSubsetOfEpochs(sleep_time_daymin, out_of_bed_time_daymin);

				if (dtday.HasRows() & actig_sleepstart_daymin.HasValue & actig_sleepend_daymin.HasValue)
				{
					_log.Log(String.Format("..Day {0}: Processing between {1} ({2}) and {3} ({4}), found {5} epochs out of {6} possible"
							, diarydaycounter, startsource.ToString(), ActigraphyScoring.Daymin_to_String(actig_sleepstart_daymin)
							, endsource.ToString(), ActigraphyScoring.Daymin_to_String(actig_sleepend_daymin), dtday.Rows.Count
							, actig_sleepend_daymin - actig_sleepstart_daymin));

					dtday = CalculateCustomSleepWake(dtday, 40);

					dtday = CountConsecSleepsWithinDay(dtday);

					CaclulateSleepVariables(dtday, diarydaycounter, 3, 5, 40
						, startsource.ToString(), endsource.ToString()
						, actig_sleepstart_daymin.Value, actig_sleepend_daymin.Value);
				}
				else
				{
					_log.Log(String.Format("..Day {0}: Processing between {1} ({2}) and {3} ({4}), *** NONE FOUND ***"
							, diarydaycounter, startsource, ActigraphyScoring.Daymin_to_String(actig_sleepstart_daymin)
							, endsource, ActigraphyScoring.Daymin_to_String(actig_sleepend_daymin)));
				}

			}


		}


		public DataTable CalculateCustomSleepWake(DataTable dt, int act_threshhold)
        {
			dt.AddColumn("custom_activity", typeof(double));
			dt.AddColumn("custom_sleep0wake1", typeof(int));

			//Caclulate Activity Count
			for (int i=0; i < dt.Rows.Count; i++)
			{
				bool ready1bef = (i >= 1) ? true : false;
				bool ready2bef = (i >= 2) ? true : false;
				bool ready1aft = (i < (dt.Rows.Count - 1)) ? true : false;
				bool ready2aft = (i < (dt.Rows.Count - 2)) ? true : false;

				DataRow row = dt.Rows[i];
				DataRow row_bef = (ready1bef) ? dt.Rows[i - 1] : null;
				DataRow row_bef2 = (ready2bef) ? dt.Rows[i - 2] : null;

				DataRow row_aft = (ready1aft) ? dt.Rows[i + 1] : null;
				DataRow row_aft2 = (ready2aft) ? dt.Rows[i + 2] : null;


				double act = Convert.ToInt32(row["activity"].ToString());
				double act_bef = (ready1bef) ? Convert.ToInt32(row_bef["activity"].ToString()) : 9999;
				double act_aft = (ready1aft) ? Convert.ToInt32(row_aft["activity"].ToString()) : 9999;
				double act_bef2 = (ready2bef) ? Convert.ToInt32(row_bef2["activity"].ToString()) : 9999;
				double act_aft2 = (ready2aft) ? Convert.ToInt32(row_aft2["activity"].ToString()) : 9999;


				double total_activity_counts = act + (.2 * (act_bef + act_aft)) + (.04 * (act_bef2 + act_aft2));

				row["custom_activity"] = total_activity_counts;
				row["custom_sleep0wake1"] = (total_activity_counts <= act_threshhold) ? 0 : 1;
			}

			dt.AcceptChanges();
			return (dt);
		}

		private DataTable CountConsecSleepsWithinDay(DataTable dt)
		{
			dt.AddColumn("consecsleeps", typeof(int));
			dt.AddColumn("custom_consecsleeps", typeof(int));

			int consec_sleeps = 0;
			int custom_consec_sleeps = 0;

			for (int i = 0; i < dt.Rows.Count; i++)
			{
				DataRow row = dt.Rows[i];
				string sleep0wake1 = row["sleep0wake1"].ToString();
				consec_sleeps = (sleep0wake1 == "0") ? consec_sleeps + 1 : 0;
				row["consecsleeps"] = consec_sleeps;

				string cust_sleep0wake1 = row["custom_sleep0wake1"].ToString();
				custom_consec_sleeps = (cust_sleep0wake1 == "0") ? custom_consec_sleeps + 1 : 0;
				row["consecsleeps"] = custom_consec_sleeps;

			}
			dt.AcceptChanges();
			return (dt);
		}


		private void CaclulateSleepVariables(DataTable dt, int day, int nconsec_sleeps_forward, int nconsec_sleeps_backward
			, int act_threshhold, string first_day_min_source, string last_day_min_source, int actig_sleepstart_daymin, int actig_sleepend_daymin)
		{
			Debug.WriteLine(String.Format("******** LogFirstLastSleeps forward {0}   backward {1} ************", nconsec_sleeps_forward, nconsec_sleeps_backward));

			//get the extent of the time period to be scored	
			int min_daymin = dt.AsEnumerable().Select(f => f.Field<int>("daymin")).Min();
			int max_daymin = dt.AsEnumerable().Select(f => f.Field<int>("daymin")).Max();

			// min max sleep from actiwatch scoring
			int min_sleep_daymin = dt.AsEnumerable().Where(f => f.Field<int?>("sleep0wake1") == 0).Select(f => f.Field<int>("daymin")).Min();
			int max_sleep_daymin = dt.AsEnumerable().Where(f => f.Field<int?>("sleep0wake1") == 0).Select(f => f.Field<int>("daymin")).Max();

			Debug.WriteLine(String.Format("min_sleep_day_min {0}     max_sleep_day_min {1} ", min_sleep_daymin, max_sleep_daymin));

			//Find first and last consecutive sleeps
			int starting_day_min_first_nconsec = dt.AsEnumerable().Where(f => f.Field<int>("consecsleeps") >= nconsec_sleeps_forward).Select(f => f.Field<int>("daymin")).Min();
			int starting_day_min_last_nconsec = dt.AsEnumerable().Where(f => f.Field<int>("consecsleeps") >= nconsec_sleeps_backward).Select(f => f.Field<int>("daymin")).Max();

			starting_day_min_first_nconsec  = starting_day_min_first_nconsec - nconsec_sleeps_forward + 1;

			int sum_all_activity_default = dt.AsEnumerable().Select(f => f.Field<int>("activity")).Sum();
			int sum_all_mobility_default = dt.AsEnumerable().Select(f => f.Field<int>("mobility")).Sum();

			int sum_wake_default = dt.AsEnumerable().Where(f => f.Field<int>("daymin") >= starting_day_min_first_nconsec & f.Field<int>("daymin") <= starting_day_min_last_nconsec &
				f.Field<int?>("sleep0wake1") == 1)
				.Count();

			int sum_mobility_default = (dt.ContainsColumnName("mobility")) ? dt.AsEnumerable().Where(f => f.Field<int>("daymin") >= starting_day_min_first_nconsec & f.Field<int>("daymin") <= starting_day_min_last_nconsec &
				f.Field<int?>("mobility")==1)
				.Count() : -1;

			int sum_wake_custom = dt.AsEnumerable().Where(f => f.Field<int>("activity") >= act_threshhold &
					f.Field<int>("daymin") >= starting_day_min_first_nconsec & f.Field<int>("daymin") <= starting_day_min_last_nconsec).Count();
			int sum_mobility_custom = dt.AsEnumerable().Where(f => f.Field<int>("activity") >= act_threshhold &
					f.Field<int>("daymin") >= starting_day_min_first_nconsec & f.Field<int>("daymin") <= starting_day_min_last_nconsec).Count();

			int startday_int = min_daymin / 1440;
			int endday_int = max_daymin / 1440;

			double auto_wake_threshhold = (sum_all_activity_default / sum_all_mobility_default) * 0.88888;

			DataRow row = dt_sleeps.NewRow();
			row["day"] = day;
			row["startday_int"] = startday_int;
			row["endday_int"] = endday_int;
			row["actig_sleepstart_daymin"] = actig_sleepstart_daymin;
			row["actig_sleepend_daymin"] = actig_sleepend_daymin;

			row["actig_sleepstart_dt"] = ActigraphyScoring.Daymin_to_DateTime(actig_sleepstart_daymin).ToString();
			row["actig_sleepend_dt"] = ActigraphyScoring.Daymin_to_DateTime(actig_sleepend_daymin).ToString();
			row["sleepstart_dt"] = ActigraphyScoring.Daymin_to_DateTime(starting_day_min_first_nconsec).ToString();
			row["sleepend_dt"] = ActigraphyScoring.Daymin_to_DateTime(starting_day_min_last_nconsec).ToString();

			row["nconsec_sleepstart"] = nconsec_sleeps_forward;
			row["nconsec_sleepend"] = nconsec_sleeps_backward;
			row["first_daymin_source"] = first_day_min_source;
			row["first_daymin"] = min_daymin;
			row["last_daymin_source"] = last_day_min_source;
			row["last_daymin"] = max_daymin;
			row["sleepstart_daymin"] = starting_day_min_first_nconsec;
			row["sleepend_daymin"] = starting_day_min_last_nconsec;
			row["sleepduration"] = starting_day_min_last_nconsec - starting_day_min_first_nconsec;

			row["sleepstart_time"] = (starting_day_min_first_nconsec % 1440.0) / 1440.0;
			row["sleepend_time"] = (starting_day_min_last_nconsec % 1440.0) / 1440.0;

			row["sum_all_activity_default"] = sum_all_activity_default;
			row["num_wake_epochs_default"] = sum_wake_default;
			row["customactivtythreshhold"] = act_threshhold;
			row["num_wake_epochs_custom"] = sum_wake_custom;
			row["auto_wake_threshhold"] = auto_wake_threshhold;

			dt_sleeps.Rows.Add(row);

		}



		//private DataTable GetNthConsecutive(int day, int nconsec, string state)
		//{

		//	DataTable dtconsec = EmptyConsecs("REST-S");

		//	DataTable tmp = dt_epochs.AsEnumerable().Where(f => f.Field<string>("intervalstatus") == state).CopyToDataTable();

		//	bool consec_is_active = false;
		//	int start_consec = 0;
		//	int current_consec = 0;
		//	int counter = 0;
		//	string prev_intstatus = "";
		//	foreach (DataRow row in tmp.Rows)
		//	{
		//		if (prev_intstatus == row["intervalstatus"].ToString())
		//		{
		//			if (consec_is_active == false) start_consec = counter;
		//			consec_is_active = true;
		//			current_consec++;
		//		}
		//		else
		//		{
		//			if (consec_is_active == true)
		//			{
		//				start_consec = counter;
		//				dtconsec = AddConsec(dtconsec, state, start_consec, start_consec + current_consec);
		//				current_consec = 0;
		//				consec_is_active = false;
		//			}
		//		}
		//		counter++;
		//		prev_intstatus = row["intervalstatus"].ToString();

		//	}
		//	return dtconsec;
		//}


		//private DataTable AddConsec(DataTable dt, string state, int r1, int r2)
		//{
		//	DataRow row = dt.NewRow();
		//	row["state"] = state;
		//	row["min_epoch"] = r1;
		//	row["max_epoch"] = r2;
		//	dt.Rows.Add(row);
		//	return dt;
		//}

		//private DataTable EmptyConsecs(string state)
		//{
		//	DataTable dt = new DataTable();
		//	dt.AddColumn("state", typeof(string));
		//	dt.AddColumn("min_epoch", typeof(int));
		//	dt.AddColumn("max_epoch", typeof(int));
		//	return dt;
		//}


		#endregion


		#region utility functions
		private DataTable GetSubsetOfEpochs(int min_begin, int min_end)
		{
			try
			{
				DataTable sub = dt_epochs.AsEnumerable().Where(f => f.Field<int>("daymin") >= min_begin & f.Field<int>("daymin") <= min_end).CopyToDataTable();
				return sub;
			}
			catch (Exception ex)
			{
				return null;
			}
		}


		private DataTable CreateFirstLastSleepsTable()
		{
			DataTable dt = new DataTable();
			dt.AddColumn("day", typeof(int));
			dt.AddColumn("startday_int", typeof(int));
			dt.AddColumn("endday_int", typeof(int));

			dt.AddColumn("actig_sleepstart_daymin", typeof(int));
			dt.AddColumn("actig_sleepend_daymin", typeof(int));

			dt.AddColumn("actig_sleepstart_dt", typeof(string));
			dt.AddColumn("actig_sleepend_dt", typeof(string));
			dt.AddColumn("sleepstart_dt", typeof(string));
			dt.AddColumn("sleepend_dt", typeof(string));

			dt.AddColumn("nconsec_sleepstart", typeof(int));
			dt.AddColumn("nconsec_sleepend", typeof(int));
			dt.AddColumn("first_daymin_source", typeof(string));
			dt.AddColumn("first_daymin", typeof(int));
			dt.AddColumn("last_daymin_source", typeof(string));
			dt.AddColumn("last_daymin", typeof(int));
			dt.AddColumn("sleepstart_daymin", typeof(int));
			dt.AddColumn("sleepend_daymin", typeof(int));
			dt.AddColumn("sleepduration", typeof(int));
			dt.AddColumn("sleepstart_time", typeof(double));
			dt.AddColumn("sleepend_time", typeof(double));

			dt.AddColumn("sum_all_activity_default", typeof(int));
			dt.AddColumn("num_mobile_epochs_default", typeof(int));
			dt.AddColumn("num_wake_epochs_default", typeof(int));

			dt.AddColumn("customactivtythreshhold", typeof(int));
			dt.AddColumn("num_wake_epochs_custom", typeof(int));
			dt.AddColumn("auto_wake_threshhold", typeof(double));

			//dt.AddColumn("num_mobile_bouts", typeof(int));
			//dt.AddColumn("num_wake_bouts", typeof(int));


			return dt;
		}


        #endregion

        #region DB functions

        private void GetSleepDiaryInfoFromDB()
        {
			SQL_utils sql = new SQL_utils("data");
			dt_diary = sql.DataTable_from_SQLstring(String.Format("select * from vwALL_SleepDiaryTimes where id='{0}'", _id));
        }

		public void SaveToDB()
        {

			//SQLCreateTableSyntax_from_DataTable(dt_props, "Props");
			//SQLCreateTableSyntax_from_DataTable(dt_stats, "Stats");
			//SQLCreateTableSyntax_from_DataTable(dt_stats_summary, "Stats_Summary");
			//SQLCreateTableSyntax_from_DataTable(dt_epochs, "Epochs");

			bool has_props = dt_props.HasRows();
			bool has_stats = dt_stats.HasRows();
			bool has_stats_summary = dt_stats_summary.HasRows();
			bool has_epochs = dt_epochs.HasRows();
	
						
			if (has_props)
			{
				SQL_utils sql1 = new SQL_utils("data");
				sql1.NonQuery_from_SQLstring(String.Format("delete from ALL_Actigraphy_Props where docversid = {0}", _docvers.docversid));
				_log.Log(sql1.BulkInsert(dt_props, "ALL_Actigraphy_Props"));
				sql1.Close();
			}

			if (has_stats)
			{
				SQL_utils sql2 = new SQL_utils("data");
				sql2.NonQuery_from_SQLstring(String.Format("delete from ALL_Actigraphy_Stats where docversid = {0}", _docvers.docversid));
				_log.Log(sql2.BulkInsert(dt_stats, "ALL_Actigraphy_Stats"));
				sql2.Close();
			}

			if (has_stats_summary)
			{
				SQL_utils sql3 = new SQL_utils("data");
				sql3.NonQuery_from_SQLstring(String.Format("delete from ALL_Actigraphy_Stats_Summary where docversid = {0}", _docvers.docversid));
				_log.Log(sql3.BulkInsert(dt_stats_summary, "ALL_Actigraphy_Stats_Summary"));
				sql3.Close();
			}

			if (has_epochs)
			{
				SQL_utils sql4 = new SQL_utils("data");
				sql4.NonQuery_from_SQLstring(String.Format("delete from ALL_Actigraphy_Epochs where docversid = {0}", _docvers.docversid));
				_log.Log(sql4.BulkInsert(dt_epochs, "ALL_Actigraphy_Epochs"));
				sql4.Close();
			}

			SQL_utils sql = new SQL_utils("data");
			int smid_props = sql.IntScalar_from_SQLstring(String.Format("select studymeasid from uwautism_research_backend..tblstudymeas where measureid=4855 and timepointid={0}", _timepointid));
			int smid_stats = sql.IntScalar_from_SQLstring(String.Format("select studymeasid from uwautism_research_backend..tblstudymeas where measureid=3842 and timepointid={0}", _timepointid));
			int smid_epochs = sql.IntScalar_from_SQLstring(String.Format("select studymeasid from uwautism_research_backend..tblstudymeas where measureid=4853 and timepointid={0}", _timepointid));


			sql.NonQuery_from_SQLstring(String.Format("update ALL_Actigraphy_Props set id='{0}', studymeasid={1}  where docversid={2}", _id, smid_props, _docvers.docversid));
			sql.NonQuery_from_SQLstring(String.Format("update ALL_Actigraphy_Stats set id='{0}', studymeasid={1}  where docversid={2}", _id, smid_stats, _docvers.docversid));
			sql.NonQuery_from_SQLstring(String.Format("update ALL_Actigraphy_Stats_Summary set id='{0}', studymeasid={1}  where docversid={2}", _id, smid_stats, _docvers.docversid));
			sql.NonQuery_from_SQLstring(String.Format("update ALL_Actigraphy_Epochs set id='{0}', studymeasid={1}  where docversid={2}", _id, smid_epochs, _docvers.docversid));

			sql.NonQuery_from_SQLstring(String.Format("exec spActigraphy_Score_WASO_levels '{0}'", _id));
		}

		public void  SQLCreateTableSyntax_from_DataTable(DataTable dt, string tblname)
        {
			//DataTable newdt = new DataTable();
			//newdt.AddColumn("fld", typeof(string));
			//newdt.AddColumn("datatype", typeof(string));

			Debug.WriteLine(String.Format("CREATE TABLE  ALL_Actigraphy_{0} (", tblname));

			foreach (DataColumn col in dt.Columns)
            {
				string datatype = col.DataType.ToString();
				datatype = datatype.Replace("System.String", "varchar(50)").Replace("System.Int32","int").Replace("System.Double", "float");
				Debug.WriteLine(String.Format(" {0} {1} NULL, ", col.ColumnName.ToLower(), datatype));
            }

			Debug.WriteLine(String.Format("CONSTRAINT [pk_ALL_Actigraphy_{0}] PRIMARY KEY CLUSTERED (	[actig_p_pk] ASC", tblname));
			Debug.WriteLine(")WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON[PRIMARY]");
			Debug.WriteLine(") ON[PRIMARY]");
			Debug.WriteLine("GO");
			Debug.WriteLine(""); 
			Debug.WriteLine("");
		}

		#endregion



		public string ProcessActigraph(string id, string filepath, string filename, int studymeasID)
		{
			DateTime starttime = DateTime.Now;
			string results = String.Format("<br/>Begin processing. {0}", System.DateTime.Now.ToString());
			List<string> lines = DataImporter.ReadLinesFromFiles(filepath, filename);


			//TOFIX - now hardcoded for Sleep Pilot study
			List<int> chunk_studymeasID = new List<int> { 8015, 8015, 8015, 6998, -1, 8014 };  // -1 because we are not yet processing Marker/Score List

			//combine subject, actiwatch, and analysis inputs into the same table with 3 fields: parameter, value, units


			ActigraphChunkMarkers markers = new ActigraphChunkMarkers(studymeasID);
			markers.PopulateIndices(lines);

			for (int i = 0; i < markers.Count; i++)
			{
				int smID = 0; // markers[i].studymeasID;

				if (smID > 0)
				{
					bool resetDaynum = false;
					string fldDaynum = "";
					DataImportSettings act_settings = new DataImportSettings(id, smID);
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


					string text_to_parse;

					if (act_settings.measureID == 4853) //Actigraph Epoch
					{
						Debug.WriteLine(" **************             lines.Count = " + lines.Count.ToString());
						List<string> lines_no_excluded = lines.GetRange(markers[i].linenumber_start - 1, (markers[i].linenumber_end - markers[i].linenumber_start));
						lines_no_excluded = lines_no_excluded.Where(f => !f.Contains("EXCLUDED")).ToList();
						Debug.WriteLine(" ************** lines_no_excluded.Count = " + lines_no_excluded.Count.ToString());
						text_to_parse = String.Join(Environment.NewLine, lines_no_excluded);
					}
					else
					{
						text_to_parse = String.Join(Environment.NewLine,
							lines.GetRange(markers[i].linenumber_start - 1, (markers[i].linenumber_end - markers[i].linenumber_start)));
					}
					DataImporter importer = new DataImporter(id, smID);


					//DataTable dt = DataImporter.GetDataTableFromText(text_to_parse, act_settings);
					DataTable dt = importer.GetDataTableFromText(text_to_parse, act_settings);

					results += "</br>" + markers[i].text + " >> Found " + dt.Rows.Count.ToString() + " records. >> ";

					if (dt.HasRows())
					{
						//reset Daynum to begin at 1.  Needed because the actigraph starts a few days earlier before actual data is obtained
						if (resetDaynum & fldDaynum != "")
						{
							int minDaynum = dt.AsEnumerable().Select(f => f.Field<int>(fldDaynum)).Min();
							foreach (DataRow row in dt.Rows)
							{
								int tmp = Convert.ToInt32(row[fldDaynum]);
								row[fldDaynum] = tmp + (-1 * (minDaynum - 1));
							}
						}

						SQL_utils sql = new SQL_utils("data");
						results += sql.BulkInsert(dt, act_settings.tblname);
						sql.Close();
					}
					else
					{
						results += "</br> No Rows!!";
					}

				}
			}

			double timeelapsed = Math.Round((DateTime.Now - starttime).TotalSeconds, 2);


			string daylightinfo_results = LogDaylightInfo(id, studymeasID, 0);

			results += String.Format("<br/>{0}", daylightinfo_results);

			results += String.Format("<br/>End processing. {0}  {1} seconds.", System.DateTime.Now.ToString(), timeelapsed);

			return results;
		}


		public string GetActigraphProperty(string id, int studymeasID, string propname)
		{
			SQL_utils sql = new SQL_utils("data");
			List<SqlParameter> ps = new List<SqlParameter>();
			ps.Add(sql.CreateParam("id", id, "text"));
			ps.Add(sql.CreateParam("smID_epoch", studymeasID.ToString(), "int"));
			DataTable dt_actprops = sql.DataTable_from_ProcName("spActigraphProps", ps);
			sql.Close();

			string act_propvalue;

			try
			{
				act_propvalue = dt_actprops.AsEnumerable().Where(f => f.Field<string>("ap_param") == propname)
					.Select(f => f.Field<string>("ap_value")).First().ToString();
			}
			catch (Exception ex)
			{
				act_propvalue = "Not Found!";
			}
			return act_propvalue;

		}



		public  string LogDaylightInfo(string id, int studymeasID_stats, int indexnum)
		{
			SQL_utils sql = new SQL_utils("data");
			int studymeasID = sql.IntScalar_from_SQLstring("select studymeasID from uwautism_research_backend..tblstudymeas where measureID=4855 and " +
				" timepointID=(select timepointID from uwautism_research_backend..tblstudymeas where studymeasID = " + studymeasID_stats.ToString() + ")");

			string act_timezone = GetActigraphProperty(id, studymeasID, "Time Zone:");

			string txtStartDate = GetActigraphProperty(id, studymeasID, "Data Collection Start Date:");
			string txtEndDate = GetActigraphProperty(id, studymeasID, "Data Collection End Date:");


			if (act_timezone != "Not Found!" & txtStartDate != "Not Found!" & txtEndDate != "Not Found!")
			{
				DateTime startdate = Convert.ToDateTime(txtStartDate).Date;
				DateTime enddate = Convert.ToDateTime(txtEndDate).Date;

				DbEntityInstance ent_studymeasID = new DbEntityInstance(new DbEntity(DbEntityType.studymeas), studymeasID);

				int studyID = ent_studymeasID.PkvalOfRelatedEntity(DbEntityType.study);

				int numdays = (enddate - startdate).Days;

				try
				{
					DaylightInfo daylightinfo = new DaylightInfo(startdate, numdays, id, studyID, act_timezone);

					List<string> insert_sql = new List<string>();

					insert_sql.Add(InsertDaylightProp(id, studymeasID, indexnum, "Zip", daylightinfo.Zip));
					insert_sql.Add(InsertDaylightProp(id, studymeasID, indexnum, "ZipDerivedFrom", daylightinfo.ZipDerivedFrom));
					insert_sql.Add(InsertDaylightProp(id, studymeasID, indexnum, "Lat", daylightinfo.Lat));
					insert_sql.Add(InsertDaylightProp(id, studymeasID, indexnum, "Lng", daylightinfo.Lng));

					insert_sql.Add(InsertDaylightProp(id, studymeasID, indexnum, "Zip_TimeZoneName", daylightinfo.TimeZoneApiResultZip.zoneName));
					insert_sql.Add(InsertDaylightProp(id, studymeasID, indexnum, "Zip_TimeZoneAbbr", daylightinfo.TimeZoneApiResultZip.abbreviation));
					insert_sql.Add(InsertDaylightProp(id, studymeasID, indexnum, "Zip_TimeZoneNextAbbr", daylightinfo.TimeZoneApiResultZip.nextAbbreviation));

					for (int i = 0; i < daylightinfo.Days.Count; i++)
					{
						DaylightInfo.Daylight day = daylightinfo.Days[i];

						insert_sql.AddRange(InsertDaylightPropDay(id, studymeasID, indexnum, day));
					}

					foreach (string s in insert_sql)
					{
						sql.NonQuery_from_SQLstring(s);
					}
					return String.Format("------ DaylightInfo ------ >> Looking up daylight hours: {0} properties inserted", insert_sql.Count);
				}

				catch (Exception ex)
				{
					return ex.Message;
				}
			}
			else
			{
				return String.Format("------ DaylightInfo ------ >> TimeZone:{0} StartDate:{1} EndDate:{2}", act_timezone, txtStartDate, txtEndDate);
			}



		}


		public  string InsertDaylightProp(string id, int studymeasID, int indexnum, string param, object value)
		{
			string s = String.Format("insert into ALL_ActigraphProps(verified, id, studymeasID, indexnum, ap_section, ap_param, ap_value) values(1,'{0}',{1},{2},'{3}','{4}','{5}')"
					, id, studymeasID, indexnum, "DaylightInfo", param, value.ToString());
			return s;
		}

		public  List<string> InsertDaylightPropDay(string id, int studymeasID, int indexnum, DaylightInfo.Daylight day)
		{
			List<string> s = new List<string>();

			s.Add(String.Format("insert into ALL_ActigraphProps(verified, id, studymeasID, indexnum, ap_date, ap_section, ap_param, ap_value) values(1,'{0}',{1},{2},'{3}','{4}','{5}','{6}')"
							, id, studymeasID, indexnum, day.Targetdate.Date, "DaylightInfo", "Sunrise", day.Sunrise.ToShortTimeString()));
			s.Add(String.Format("insert into ALL_ActigraphProps(verified, id, studymeasID, indexnum, ap_date, ap_section, ap_param, ap_value) values(1,'{0}',{1},{2},'{3}','{4}','{5}','{6}')"
					, id, studymeasID, indexnum, day.Targetdate.Date, "DaylightInfo", "Sunset", day.Sunset.ToShortTimeString()));
			return s;
		}


	}


	public enum ActigraphyTimepoint
    {
		bed_time = 1,
		sleep_time = 2,
		wake_time = 3,
		out_of_bed_time = 4
    }
}