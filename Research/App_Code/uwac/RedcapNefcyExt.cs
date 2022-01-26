using System;
using System.Data;
using System.Diagnostics;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Security.Cryptography.X509Certificates;
using System.Configuration;
using System.Linq;
using System.Web;

namespace uwac_REDCap
{

	/// <summary>
	/// Summary description for RedcapNefcyExt
	/// </summary>
	


	public class RedcapNefcyExt : RedcapNefcy
	{

        public List<string> events { get { return GetEvents_List(); } }
        public DataTable  dt_redcapevents { get { return GetEvents(); } }
		public DataTable dt_formevents { get { return GetFormEventMapping(); } }

		public RedcapNefcyExt()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public RedcapNefcyExt(string url, string token)
		{
			strURI = url;
			strPostToken = token;

		}

		public List<string> GetEvents_List()
        {
			List<string> events = new List<string>();

			events = GetFormEventMapping().AsEnumerable().Select(f => f.Field<string>("unique_event_name")).Distinct().ToList();
			return events;
		}

		public DataTable GetEvents()
		{
			List<string> events = new List<string>();

			events = GetFormEventMapping().AsEnumerable().Select(f => f.Field<string>("unique_event_name")).Distinct().ToList();

			DataTable dt = new DataTable();
			dt.Columns.Add(new DataColumn("event_name", typeof(string)));

			foreach(string e in events)
            {
				DataRow row = dt.NewRow();
				row["event_name"] = e;
				dt.Rows.Add(row);
			}

			return dt;
		}

		public DataTable GetFormEventMapping()
		{
			Debug.WriteLine("GetFormEventMapping()");

			string strRecord;
			CSVDoc csvDoc;
			string strPostParameters = "";
			//int intReturnLength = strReturnCheck.Trim().Length;

			DataTable dtDataTable = new DataTable();
			DataRow drRecord;

			strPostParameters = "&content=formEventMapping&format=csv&returnFormat=csv"; // &eventName=unique";

			strPostParameters += "&rawOrLabel=raw";

			string post_string = String.Format("token={0}{1}", strPostToken , strPostParameters);
			byte[] bytePostData = Encoding.UTF8.GetBytes(post_string);
			//byte[] bytePostData = Encoding.UTF8.GetBytes("token=" + strPostToken + strPostParameters);

			string strResponse = responseHTTP(bytePostData);

			if (strResponse.StartsWith("ERROR"))
            {
				return null;
            }

			//replace newline with commas
			//strResponse = strResponse.Replace('\n', ',');

			// if no records found, there are no fields.  new in RC 6 and greater
			// have to deal with null DataTable in your call to this function
			// if Rc < 6, then it will return field names without any rows of data
			else if (strResponse == "\n")
			{
				return (dtDataTable);
			}

			List<string> response_vars = strResponse.Split(',').ToList();

			csvDoc = new CSVDoc(strResponse);

			// first line of .csv is column names
			strRecord = csvDoc.ReadLine();

			// get column headers
			string[] strColumnHeaders = strRecord.Split(',');

			// set up table
			for (int i = 0; i < strColumnHeaders.Length; i++)
			{
				Debug.WriteLine(String.Format("setup table i={0}  adding {1}", i, strColumnHeaders[i]));
				dtDataTable.Columns.Add(strColumnHeaders[i].ToString(), typeof(string));
			}

			// now read all data and assign to data table
			while ((strRecord = csvDoc.ReadLine()) != null)
			{
				CSVLine csvLine = new CSVLine(strRecord);

				drRecord = dtDataTable.NewRow();

				// now get fields
				for (int i = 0; i < strColumnHeaders.Length; i++)
				{
					drRecord[i] = csvLine.ReadField();
				}

				dtDataTable.Rows.Add(drRecord);
			}

			return (dtDataTable);
		}

	}

}

