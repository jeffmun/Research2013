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

/// <summary>
/// Summary description for Actigraph
/// </summary>
public static class Actigraph
{
	//public Actigraph()
	//{
	//	//
	//	// TODO: Add constructor logic here
	//	//
	//}

	public static int[] measureIDs = { 3842, 4853, 4855 };

	public static List<Color> colors = new List<Color> {Color.Black, Color.Red, Color.Gold};


	public static string ProcessActigraph(string id, string filepath, string filename, int studymeasID)
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
			int smID = markers[i].studymeasID;

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

				string text_to_parse = String.Join(Environment.NewLine,
					lines.GetRange(markers[i].linenumber_start - 1, (markers[i].linenumber_end - markers[i].linenumber_start)));

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


	public static DataTable AggregrateSoundData(DataTable dt_in, string emtpytable)
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


	public static string GetActigraphProperty(string id, int studymeasID, string propname)
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
		catch(Exception ex)
		{
			act_propvalue = "Not Found!";
		}
		return act_propvalue;

	}



	public static string LogDaylightInfo(string id, int studymeasID_stats, int indexnum)
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

	public static string InsertDaylightProp(string id, int studymeasID, int indexnum, string param, object value)
	{
		string s = String.Format("insert into ALL_ActigraphProps(verified, id, studymeasID, indexnum, ap_section, ap_param, ap_value) values(1,'{0}',{1},{2},'{3}','{4}','{5}')"
				, id, studymeasID, indexnum, "DaylightInfo", param, value.ToString());
		return s;
	}

	public static List<string> InsertDaylightPropDay(string id, int studymeasID, int indexnum, DaylightInfo.Daylight day)
	{
		List<string> s = new List<string>();

		s.Add(String.Format("insert into ALL_ActigraphProps(verified, id, studymeasID, indexnum, ap_date, ap_section, ap_param, ap_value) values(1,'{0}',{1},{2},'{3}','{4}','{5}','{6}')"
						, id, studymeasID, indexnum, day.Targetdate.Date, "DaylightInfo", "Sunrise", day.Sunrise.ToShortTimeString()));
		s.Add(String.Format("insert into ALL_ActigraphProps(verified, id, studymeasID, indexnum, ap_date, ap_section, ap_param, ap_value) values(1,'{0}',{1},{2},'{3}','{4}','{5}','{6}')"
				, id, studymeasID, indexnum, day.Targetdate.Date, "DaylightInfo", "Sunset", day.Sunset.ToShortTimeString()));
		return s;
	}

	public class ActogramStats
	{
		public DateTime report_date { get; set; }
		public DateTime sleep_starttime_chart { get; set; }
		public DateTime sleep_endtime_chart { get; set; }
		public DateTime rest_starttime_chart { get; set; }
		public DateTime rest_endtime_chart { get; set; }
		public double hrsinbed { get; set; }
		public double hrssleep { get; set; }
		public double avgacpermin_sleep { get; set; }
		public double avgacpermin_rest { get; set; }
		public double onsetlatency { get; set; }
		public double efficiency { get; set; }
		public double waso { get; set; }
		public double numwakebouts { get; set; }
		public double pctwake { get; set; }
		public double pctsleep { get; set; }
		public double fragmentation { get; set; }
		public DateTime sunset { get; set; }
		public DateTime sunrise { get; set; }

		public ActogramStats(DataRow row)
		{

			report_date = Convert.ToDateTime(row["report_date"]);
			sleep_starttime_chart = Convert.ToDateTime(row["sleep_starttime_chart"]);
			sleep_endtime_chart = Convert.ToDateTime(row["sleep_endtime_chart"]);
			rest_starttime_chart = Convert.ToDateTime(row["rest_starttime_chart"]);
			rest_endtime_chart = Convert.ToDateTime(row["rest_endtime_chart"]);
			hrsinbed = Convert.ToDouble(row["hrsinbed"]);
			hrssleep = Convert.ToDouble(row["hrssleep"]);
			avgacpermin_sleep = Convert.ToDouble(row["avgacpermin_sleep"]);
			avgacpermin_rest = Convert.ToDouble(row["avgacpermin_rest"]);
			onsetlatency = Convert.ToDouble(row["onsetlatency"]);
			efficiency = Convert.ToDouble(row["efficiency"]);
			waso = Convert.ToDouble(row["waso"]);
			numwakebouts = Convert.ToDouble(row["numwakebouts"]);
			pctwake = Convert.ToDouble(row["pctwake"]);
			pctsleep = Convert.ToDouble(row["pctsleep"]);
			fragmentation = Convert.ToDouble(row["fragmentation"]);
			sunset = Convert.ToDateTime(row["sunset"]);
			sunrise = Convert.ToDateTime(row["sunrise"]);

		}
	}


}