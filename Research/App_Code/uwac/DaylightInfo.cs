using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using SimpleZipCode;
using Innovative.SolarCalculator;
using uwac;
using Newtonsoft.Json;

namespace uwac
{
	/// <summary>
	/// Summary description for DaylightInfo
	/// </summary>
	public class DaylightInfo
	{

		public DateTime targetdate { get; set; }
		public string Place { get; set; }
		public string Zip { get; set; }
		public string ZipDerivedFrom { get; set; }
		public double Lat { get; set; }
		public double Lng { get; set; }
		public TimezoneDbApiResult TimeZoneApiResultZip { get; set; }
		public TimeZoneInfo TimeZoneZip { get; set; }
		public TimeZoneInfo TimeZoneActigraph { get; set; }
		public DateTime Sunrise { get; set; }
		public DateTime Sunset { get; set; }
		public List<Daylight> Days { get; set; }

		public bool doTimeZonesMatch { get; set; }  //with regard to Zip code in DB and timezone set on Actigraph (in ALL_ActigraphProps) 

		public DaylightInfo() { }
		public DaylightInfo(DateTime date, string id, int studyID, string act_timezone_property)
		{
			Caclulate(date, 1, id, studyID, act_timezone_property);
		}
		public DaylightInfo(DateTime date, int numdays, string id, int studyID, string act_timezone_property)
		{
			Caclulate(date, numdays, id, studyID, act_timezone_property);

		}
		private void Caclulate(DateTime date, int numdays, string id, int studyID, string act_timezone_property)
		{
			Days = new List<Daylight>();
			targetdate = date;
			TimeZoneActigraph = LookupTimeZone(act_timezone_property);

			var zipCodes = ZipCodeSource.FromMemory().GetRepository();

			SQL_utils sql = new SQL_utils("backend");

			string code = String.Format("select  left(zip,5) from trk.vwMasterStatus_S a where id='{0}' and studyID={1}"
				, id,   studyID);
			string myDBzip = sql.StringScalar_from_SQLstring(code);
			sql.Close();

			if (myDBzip.Contains("Error"))
			{
				Zip = "98195";
				ZipDerivedFrom = "Default (address in DB is null)";
			}
			else
			{
				Zip = myDBzip;
				ZipDerivedFrom = "address in DB";
			}


			var myzipinfo = zipCodes.Get(Zip);

			Place = String.Format("{0}, {1}", myzipinfo.PlaceName, myzipinfo.StateAbbreviation);
			


			Lat = myzipinfo.Latitude;
			Lng = myzipinfo.Longitude;

			TimeZoneApiResultZip = LookupApiTimeZone( Lat, Lng);

			//TimeZoneZip = LookupTimeZone(myzipinfo.Latitude, myzipinfo.Longitude);

			for (int i = 0; i < numdays; i++)
			{
				DateTime tempdate = date.AddDays(i);
				SolarTimes solarTimes = new SolarTimes(tempdate, myzipinfo.Latitude, myzipinfo.Longitude);
				Daylight day = new Daylight()
				{
					Targetdate = tempdate,
					Sunrise = TimeZoneInfo.ConvertTimeFromUtc(solarTimes.Sunrise.ToUniversalTime(), TimeZoneActigraph),
					Sunset = TimeZoneInfo.ConvertTimeFromUtc(solarTimes.Sunset.ToUniversalTime(), TimeZoneActigraph)
				};

				Days.Add(day);

			}

		}

		public class Daylight
		{
			public DateTime Targetdate { get; set; }
			public DateTime Sunrise { get; set; }
			public DateTime Sunset { get; set; }
			public Daylight() { }
		}

		public override string ToString()
		{
			//string match = (doTimeZonesMatch) ?
			//	String.Format("Time zone from ZipCode & Actigraph DO NOT MATCH";
			string info = String.Format("<b>{1} {2}</b> {3}{0}<b>Sunset: {4}{0}Sunrise: {5}</b>{0}TimeZone used (from Actigraph):{6}{0}TimeZone of ZipCode:{7}{0}"
				, "<br/>"
				, Sunrise.ToShortDateString()
				, Place
				, String.Format("{0} [derived from {1}]", Zip, ZipDerivedFrom)
				, Sunset.ToShortTimeString(), Sunrise.ToShortTimeString()
				, TimeZoneActigraph.DisplayName
				, String.Format("{0} {1}", TimeZoneApiResultZip.zoneName, TimeZoneApiResultZip.abbreviation));
			return info;
		}


		public TimezoneDbApiResult LookupApiTimeZone(double lat, double lng)
		{
			// see https://timezonedb.com/
			string request = String.Format("http://api.timezonedb.com/v2.1/get-time-zone?key=IAS6CZVPLCMS&format=json&by=position&lat={0}&lng={1}&fields=countryCode,zoneName,gmtOffset,abbreviation,nextAbbreviation"
				, lat, lng);


			var result = new System.Net.WebClient().DownloadString(request);
			//var latLongResult = JsonConvert.DeserializeObject<GoogleGeoCodeResponse>(result);

			TimezoneDbApiResult zoneapi = JsonConvert.DeserializeObject<TimezoneDbApiResult>(result);

			return zoneapi;
		}


		public TimeZoneInfo LookupTimeZone(string displayname)
		{
			TimeZoneInfo myzone;
			List<TimeZoneInfo> tzList = TimeZoneInfo.GetSystemTimeZones().ToList();

			foreach (TimeZoneInfo tz in tzList)
			{
				if (tz.DisplayName == displayname)
				{
					return tz;
				}
			}
			return null;
		}

		#region Display TimeZones
		public void DisplayTimeZones()
		{
			DisplayTimeZones(true, "");
		}
		public void DisplayTimeZones(string searchstring)
		{
			Debug.WriteLine("Begin searching TimeZones for '" + searchstring + "'");
			DisplayTimeZones(false, searchstring);
			Debug.WriteLine("End searching TimeZones for '" + searchstring + "'");
		}

		private void DisplayTimeZones(bool printall, string searchstring)
		{
			List<TimeZoneInfo> tzList = TimeZoneInfo.GetSystemTimeZones().ToList();

			foreach (TimeZoneInfo tz in tzList)
			{
				bool ismatch = tz.DisplayName.ToLower().Contains(searchstring.ToLower());

				if (printall | ismatch ) PrintIt(tz);
			}
		}

		public void PrintIt(TimeZoneInfo tz)
		{
			Debug.WriteLine("");
			Debug.WriteLine("========================================================");
			Debug.WriteLine(String.Format("   Time Zone ID         : {0}", tz.Id));
			Debug.WriteLine(String.Format("   Display Name is      : {0}.", tz.DisplayName));
			Debug.WriteLine(String.Format("   Standard name is     : {0}.", tz.StandardName));
			Debug.WriteLine(String.Format("   Daylight saving name : {0}.", tz.DaylightName));
			Debug.WriteLine(String.Format("   UTC Offset           : {0}.", tz.BaseUtcOffset));
		}
		#endregion

		public string AbbrevToUTCOffset(string x)
		{
			string utc;
			if (x == "ACDT") utc = "10:30:00";
			else if (x == "ACST") utc = "09:30:00";
			else if (x == "ACT") utc = "-05:00:00";
			else if (x == "ACWST") utc = "08:45:00";
			else if (x == "ADT") utc = "-03:00:00";
			else if (x == "AEDT") utc = "11:00:00";
			else if (x == "AEST") utc = "10:00:00";
			else if (x == "AFT") utc = "04:30:00";
			else if (x == "AKDT") utc = "-08:00:00";
			else if (x == "AKST") utc = "-09:00:00";
			else if (x == "AMST") utc = "-03:00:00";
			else if (x == "AMT") utc = "-04:00:00";
			else if (x == "AMT") utc = "04:00:00";
			else if (x == "ART") utc = "-03:00:00";
			else if (x == "AST") utc = "03:00:00";
			else if (x == "AST") utc = "-04:00:00";
			else if (x == "AWST") utc = "08:00:00";
			else if (x == "AZOST") utc = "00:00:00";
			else if (x == "AZOT") utc = "-01:00:00";
			else if (x == "AZT") utc = "04:00:00";
			else if (x == "BDT") utc = "08:00:00";
			else if (x == "BIOT") utc = "06:00:00";
			else if (x == "BIT") utc = "-12:00:00";
			else if (x == "BOT") utc = "-04:00:00";
			else if (x == "BRST") utc = "-02:00:00";
			else if (x == "BRT") utc = "-03:00:00";
			else if (x == "BST") utc = "06:00:00";
			else if (x == "BST") utc = "11:00:00";
			else if (x == "BST") utc = "01:00:00";
			else if (x == "BTT") utc = "06:00:00";
			else if (x == "CAT") utc = "02:00:00";
			else if (x == "CCT") utc = "06:30:00";
			else if (x == "CDT") utc = "-05:00:00";
			else if (x == "CDT") utc = "-04:00:00";
			else if (x == "CEST") utc = "02:00:00";
			else if (x == "CET") utc = "01:00:00";
			else if (x == "CHADT") utc = "13:45:00";
			else if (x == "CHAST") utc = "12:45:00";
			else if (x == "CHOT") utc = "08:00:00";
			else if (x == "CHOST") utc = "09:00:00";
			else if (x == "CHST") utc = "10:00:00";
			else if (x == "CHUT") utc = "10:00:00";
			else if (x == "CIST") utc = "-08:00:00";
			else if (x == "CIT") utc = "08:00:00";
			else if (x == "CKT") utc = "-10:00:00";
			else if (x == "CLST") utc = "-03:00:00";
			else if (x == "CLT") utc = "-04:00:00";
			else if (x == "COST") utc = "-04:00:00";
			else if (x == "COT") utc = "-05:00:00";
			else if (x == "CST") utc = "-06:00:00";
			else if (x == "CST") utc = "08:00:00";
			else if (x == "CST") utc = "-05:00:00";
			else if (x == "CT") utc = "08:00:00";
			else if (x == "CVT") utc = "-01:00:00";
			else if (x == "CWST") utc = "08:45:00";
			else if (x == "CXT") utc = "07:00:00";
			else if (x == "DAVT") utc = "07:00:00";
			else if (x == "DDUT") utc = "10:00:00";
			else if (x == "DFT") utc = "01:00:00";
			else if (x == "EASST") utc = "-05:00:00";
			else if (x == "EAST") utc = "-06:00:00";
			else if (x == "EAT") utc = "03:00:00";
			else if (x == "ECT") utc = "-04:00:00";
			else if (x == "ECT") utc = "-05:00:00";
			else if (x == "EDT") utc = "-04:00:00";
			else if (x == "EEST") utc = "03:00:00";
			else if (x == "EET") utc = "02:00:00";
			else if (x == "EGST") utc = "00:00:00";
			else if (x == "EGT") utc = "-01:00:00";
			else if (x == "EIT") utc = "09:00:00";
			else if (x == "EST") utc = "-05:00:00";
			else if (x == "FET") utc = "03:00:00";
			else if (x == "FJT") utc = "12:00:00";
			else if (x == "FKST") utc = "-03:00:00";
			else if (x == "FKT") utc = "-04:00:00";
			else if (x == "FNT") utc = "-02:00:00";
			else if (x == "GALT") utc = "-06:00:00";
			else if (x == "GAMT") utc = "-09:00:00";
			else if (x == "GET") utc = "04:00:00";
			else if (x == "GFT") utc = "-03:00:00";
			else if (x == "GILT") utc = "12:00:00";
			else if (x == "GIT") utc = "-09:00:00";
			else if (x == "GMT") utc = "±00:00:00";
			else if (x == "GST") utc = "-02:00:00";
			else if (x == "GST") utc = "04:00:00";
			else if (x == "GYT") utc = "-04:00:00";
			else if (x == "HDT") utc = "-09:00:00";
			else if (x == "HAEC") utc = "02:00:00";
			else if (x == "HST") utc = "-10:00:00";
			else if (x == "HKT") utc = "08:00:00";
			else if (x == "HMT") utc = "05:00:00";
			else if (x == "HOVST") utc = "08:00:00";
			else if (x == "HOVT") utc = "07:00:00";
			else if (x == "ICT") utc = "07:00:00";
			else if (x == "IDLW") utc = "-12:00:00";
			else if (x == "IDT") utc = "03:00:00";
			else if (x == "IOT") utc = "03:00:00";
			else if (x == "IRDT") utc = "04:30:00";
			else if (x == "IRKT") utc = "08:00:00";
			else if (x == "IRST") utc = "03:30:00";
			else if (x == "IST") utc = "05:30:00";
			else if (x == "IST") utc = "01:00:00";
			else if (x == "IST") utc = "02:00:00";
			else if (x == "JST") utc = "09:00:00";
			else if (x == "KALT") utc = "02:00:00";
			else if (x == "KGT") utc = "06:00:00";
			else if (x == "KOST") utc = "11:00:00";
			else if (x == "KRAT") utc = "07:00:00";
			else if (x == "KST") utc = "09:00:00";
			else if (x == "LHST") utc = "10:30:00";
			else if (x == "LHST") utc = "11:00:00";
			else if (x == "LINT") utc = "14:00:00";
			else if (x == "MAGT") utc = "12:00:00";
			else if (x == "MART") utc = "-09:30:00";
			else if (x == "MAWT") utc = "05:00:00";
			else if (x == "MDT") utc = "-06:00:00";
			else if (x == "MET") utc = "01:00:00";
			else if (x == "MEST") utc = "02:00:00";
			else if (x == "MHT") utc = "12:00:00";
			else if (x == "MIST") utc = "11:00:00";
			else if (x == "MIT") utc = "-09:30:00";
			else if (x == "MMT") utc = "06:30:00";
			else if (x == "MSK") utc = "03:00:00";
			else if (x == "MST") utc = "08:00:00";
			else if (x == "MST") utc = "-07:00:00";
			else if (x == "MUT") utc = "04:00:00";
			else if (x == "MVT") utc = "05:00:00";
			else if (x == "MYT") utc = "08:00:00";
			else if (x == "NCT") utc = "11:00:00";
			else if (x == "NDT") utc = "-02:30:00";
			else if (x == "NFT") utc = "11:00:00";
			else if (x == "NPT") utc = "05:45:00:00";
			else if (x == "NST") utc = "-03:30:00";
			else if (x == "NT") utc = "-03:30:00";
			else if (x == "NUT") utc = "-11:00:00";
			else if (x == "NZDT") utc = "13:00:00";
			else if (x == "NZST") utc = "12:00:00";
			else if (x == "OMST") utc = "06:00:00";
			else if (x == "ORAT") utc = "05:00:00";
			else if (x == "PDT") utc = "-07:00:00";
			else if (x == "PET") utc = "-05:00:00";
			else if (x == "PETT") utc = "12:00:00";
			else if (x == "PGT") utc = "10:00:00";
			else if (x == "PHOT") utc = "13:00:00";
			else if (x == "PHT") utc = "08:00:00";
			else if (x == "PKT") utc = "05:00:00";
			else if (x == "PMDT") utc = "-02:00:00";
			else if (x == "PMST") utc = "-03:00:00";
			else if (x == "PONT") utc = "11:00:00";
			else if (x == "PST") utc = "-08:00:00";
			else if (x == "PST") utc = "08:00:00";
			else if (x == "PYST") utc = "-03:00:00";
			else if (x == "PYT") utc = "-04:00:00";
			else if (x == "RET") utc = "04:00:00";
			else if (x == "ROTT") utc = "-03:00:00";
			else if (x == "SAKT") utc = "11:00:00";
			else if (x == "SAMT") utc = "04:00:00";
			else if (x == "SAST") utc = "02:00:00";
			else if (x == "SBT") utc = "11:00:00";
			else if (x == "SCT") utc = "04:00:00";
			else if (x == "SDT") utc = "-10:00:00";
			else if (x == "SGT") utc = "08:00:00";
			else if (x == "SLST") utc = "05:30:00";
			else if (x == "SRET") utc = "11:00:00";
			else if (x == "SRT") utc = "-03:00:00";
			else if (x == "SST") utc = "-11:00:00";
			else if (x == "SST") utc = "08:00:00";
			else if (x == "SYOT") utc = "03:00:00";
			else if (x == "TAHT") utc = "-10:00:00";
			else if (x == "THA") utc = "07:00:00";
			else if (x == "TFT") utc = "05:00:00";
			else if (x == "TJT") utc = "05:00:00";
			else if (x == "TKT") utc = "13:00:00";
			else if (x == "TLT") utc = "09:00:00";
			else if (x == "TMT") utc = "05:00:00";
			else if (x == "TRT") utc = "03:00:00";
			else if (x == "TOT") utc = "13:00:00";
			else if (x == "TVT") utc = "12:00:00";
			else if (x == "ULAST") utc = "09:00:00";
			else if (x == "ULAT") utc = "08:00:00";
			else if (x == "UTC") utc = "00:00:00";
			else if (x == "UYST") utc = "-02:00:00";
			else if (x == "UYT") utc = "-03:00:00";
			else if (x == "UZT") utc = "05:00:00";
			else if (x == "VET") utc = "-04:00:00";
			else if (x == "VLAT") utc = "10:00:00";
			else if (x == "VOLT") utc = "04:00:00";
			else if (x == "VOST") utc = "06:00:00";
			else if (x == "VUT") utc = "11:00:00";
			else if (x == "WAKT") utc = "12:00:00";
			else if (x == "WAST") utc = "02:00:00";
			else if (x == "WAT") utc = "01:00:00";
			else if (x == "WEST") utc = "01:00:00";
			else if (x == "WET") utc = "00:00:00";
			else if (x == "WIT") utc = "07:00:00";
			else if (x == "WST") utc = "08:00:00";
			else if (x == "YAKT") utc = "09:00:00";
			else if (x == "YEKT") utc = "05:00:00";
			//default to Pacific time
			else utc = "-08:00:00";

			return utc;
		}
	}

	public class TimezoneDbApiResult
	{
		public string status { get; set; }
		public string message { get; set; }
		public string countryCode { get; set; }
		public string zoneName { get; set; }
		public string abbreviation { get; set; }
		public string gmtOffset { get; set; }
		public string nextAbbreviation { get; set; }
	}

}