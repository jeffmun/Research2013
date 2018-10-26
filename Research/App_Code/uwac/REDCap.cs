using System;
using System.Data;
using System.Diagnostics;
using System.Collections;
using System.IO; 
using System.Net;
using System.Text;
using System.Security.Cryptography.X509Certificates;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using uwac;
using RedcapLibrary;
using DevExpress.Web;

// the code below would be placed in your code once you have created a blank aspx page, or
// in a windows program or wherever.

namespace uwac_REDCap
{

	/// <summary>
	/// Summary description for REDCap
	/// </summary>
	public class REDCap
	{
		public RedcapAPI api { get; set; }
		private string token;
		private string url;
		private string idfld;
		public string dataheader { get; set; }

		public REDCap(int studyID)
		{
			//
			// TODO: Add constructor logic here
			//
			SQL_utils sql = new SQL_utils("data");
			token = "";
			url = "";

			string code = "select coalesce(token,'') token, coalesce(url,'') url, coalesce(idfld, '') idfld from uwautism_research_backend..tblstudy s LEFT JOIN def.REDCapToken_Study a ON s.studyID=a.studyID LEFT JOIN def.REDCapToken b ON a.tokenID=b.tokenID where s.studyID=" + studyID.ToString();
			DataTable dt = sql.DataTable_from_SQLstring(code);
			DataRow row = dt.Rows[0];
			token = row["token"].ToString();
			url = row["url"].ToString();
			idfld = row["idfld"].ToString();

			sql.Close();

			if (token != "" & url != "" & idfld != "") api = new RedcapAPI(url, token);

		}



		#region Data & Information
		public string FieldsCSV(string formname)
		{
			List<string> flds = api.MetaDataTable.AsEnumerable()
				.Where(f => f.Field<string>("form_name") == formname).Select(f => f.Field<string>("field_name")).ToList();

			flds.Remove(idfld);

			string flds_csv = String.Join(",", flds);
			flds_csv = flds_csv + "," + idfld;
			return flds_csv;

		}


		public string FirstField(string formname)
		{
			string fld = api.MetaDataTable.AsEnumerable()
				.Where(f => f.Field<string>("form_name") == formname).Select(f => f.Field<string>("field_name")).First();

			return fld;
		}


		public DataTable DataFromForm (string formname)
		{
			string strRecordsSelect = "";
			string strFilterLogic = "";
			string strFields = FieldsCSV(formname);
			string strEvents = ""; 
			string strForms = "";
			bool boolLabels = false;
			bool boolAccessGroups = false;

			string firstfld = FirstField(formname);

			try
			{
				DataTable dt = api.GetTableFromCSV(idfld, strRecordsSelect, strFilterLogic, strFields, strEvents, strForms, boolLabels, boolAccessGroups);
				return dt;
			}
			catch(Exception ex)
			{
				return null;
			}
		}
		#endregion


		#region Controls
		public ASPxComboBox cboFormSelector()
		{
			if (api != null)
			{
				ASPxComboBox cbo = new ASPxComboBox();
				cbo.ID = "cboRedcapForms";
				cbo.ClientInstanceName = "cboRedcapForms";
				cbo.Caption = "REDCap Forms:";
				cbo.DataSource = api.InstrumentDataTable;
				cbo.TextField = "instrument_label";
				cbo.ValueField = "instrument_name";
				cbo.NullText = String.Format("Available REDCap forms (N={0})", api.InstrumentDataTable.Rows.Count);
				cbo.Width = 300;
				cbo.DataBind();
				return cbo;
			}
			else
			{
				return null;
			}
		}

		public ASPxGridView gridMetaData()
		{
			if (api != null)
			{
				ASPxGridView grid = new ASPxGridView();
				grid.ID = "gridMeta";
				grid.ClientInstanceName = "gridMeta";
				grid.AutoGenerateColumns = true;
				grid.SettingsBehavior.AllowGroup = true;
				grid.DataSource = api.MetaDataTable;
				grid.DataBind();
				return grid;
			}
			else
			{
				return null;
			}

		}

		public ASPxGridView gridDataFromForm(string formname)
		{
			if (api != null)
			{
				DataTable dt = DataFromForm(formname);
				if (dt != null)
				{
					dataheader = String.Format("{0} (cols={1}, rows={2})", formname, dt.Columns.Count, dt.Rows.Count);

					ASPxGridView grid = new ASPxGridView();
					grid.ID = "grid" + formname;
					grid.ClientInstanceName = "grid" + formname;
					grid.AutoGenerateColumns = true;
					grid.SettingsBehavior.AllowGroup = true;
					grid.Settings.HorizontalScrollBarMode = ScrollBarMode.Auto;
					grid.Width = 1150;
					grid.DataSource = dt;
					grid.DataBind();
					return grid;
				}
				else
				{
					return null;
				}
			}
			else
			{
				return null;
			}

		}
		#endregion
	}



	public class SampleCode
	{

		// must be declared somewhere in code, or pulled from config file
		// RC URI and RC Token
		string strURI = "https://redcap.iths.org/api/";
		string strPostToken = "40ACFE0E609AECA842207964B1301275";

		// if pulling from web.config you could use the code below. i do this so i can easily switch between dev and production servers
		// by just using different config files
		//string strURI = ConfigurationManager.AppSettings["RCURI"];
		//string strPostToken = ConfigurationManager.AppSettings["RCToken"];

		//------------------------------
		//    // to get the above, this would be in your Web.config file in the <configuration> section.
		//    // sample shown in the Web.config file. Only if you want to do it this way.
		//  <appSettings>
		//    <add key="RCURI" value="YOUR_RC_API_URI" />
		//    <add key="RCToken" value="YOUR_RC_TOKEN" />
		//  </appSettings>
		//------------------------------



		// get any RC data. Need Token and strReturnCheck (to see if error in data returning). rest are optional
		// strRecordsSelect: any records you want separated by ','; all records if ""
		// strFields: Particular fields you want, separated by ','; all fields if ""
		// strEvents: Particular events you want, separated by ','; all events if ""
		// strForms: Particular forms you want, separated by ','; all forms if ""
		// boolLabels: false=raw; true=label
		// boolAccessGroups: false=no access group returned; true=access group returned (should be false, see note below)
		// (note: can't import access group column if in your data table; ontology fields at the moment can't be imported too)
		public DataTable GetTableFromAnyRC(string strPostToken, string strReturnCheck, string strRecordsSelect, string strFields,
			 string strEvents, string strForms, bool boolLabels, bool boolAccessGroups)
		{
			Debug.WriteLine("GetTableFromAnyRC()");

			string strRecord;
			CSVDoc csvDoc;
			string strPostParameters = "";
			int intReturnLength = strReturnCheck.Trim().Length;

			DataTable dtDataTable = new DataTable();
			DataRow drRecord;

			strPostParameters = "&content=record&format=csv&type=flat&eventName=unique";

			if (strReturnCheck == "")
			{
				throw new Exception("Error: " + "Must provide first field to check");
			}

			if (strRecordsSelect != "")
			{
				strPostParameters += "&records=" + strRecordsSelect;
			}

			if (strFields != "")
			{
				strPostParameters += "&fields=" + strFields;
			}

			if (strEvents != "")
			{
				strPostParameters += "&events=" + strEvents;
			}

			if (strForms != "")
			{
				strPostParameters += "&forms=" + strForms;
			}

			if (boolLabels)
				strPostParameters += "&rawOrLabel=label";
			else
				strPostParameters += "&rawOrLabel=raw";

			// probably should take out if you are going to import this exported data
			if (boolAccessGroups)
			{
				strPostParameters += "&exportDataAccessGroups=true";
			}

			byte[] bytePostData = Encoding.UTF8.GetBytes("token=" + strPostToken + strPostParameters);

			string strResponse = responseHTTP(bytePostData);

			// if no records found, there are no fields.  new in RC 6 and greater
			// have to deal with null DataTable in your call to this function
			// if Rc < 6, then it will return field names without any rows of data
			if (strResponse == "\n")
			{
				return (dtDataTable);
			}

			// should return the first field you expect. otherwise it is error
			if (strResponse.Substring(0, intReturnLength) != strReturnCheck)
			{
				throw new Exception("RC Error: " + strResponse);
			}

			csvDoc = new CSVDoc(strResponse);

			// first line of .csv is column names
			strRecord = csvDoc.ReadLine();

			// get column headers
			string[] strColumnHeaders = strRecord.Split(',');

			// set up table
			for (int i = 0; i < strColumnHeaders.Length; i++)
			{
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

		// will return a csv string to import, given a data table
		// if given any field string (like "studyid,redcap_event_name,field1,field2") will only put those fields in the csv string
		public string GetCSVFromTable(DataTable dtData, string strFields)
		{
			Debug.WriteLine("GetCSVFromTable()");

			string strCSVContents = "";

			int i = 0;
			int j = 0;

			try
			{
				string[] strFieldsArray = strFields.Split(',');

				//Write into csv format
				for (i = 0; i < dtData.Columns.Count; i++)
				{
					if (strFields == "")
					{
						if (i > 0)
							strCSVContents += ",";

						strCSVContents += dtData.Columns[i].ColumnName;
					}
					else
					{
						if (InArray(strFieldsArray, dtData.Columns[i].ColumnName))
						{
							if (i > 0)
								strCSVContents += ",";

							strCSVContents += dtData.Columns[i].ColumnName;
						}
					}
				}

				strCSVContents += "\n";

				for (i = 0; i < dtData.Rows.Count; i++)
				{
					for (j = 0; j < dtData.Columns.Count; j++)
					{
						if (strFields == "")
						{
							if (j > 0)
								strCSVContents += ",";

							// double quote all fields. replace any double quotes in field with escape clause.
							// this allows things like inches (") to be put in fields, or any quote marks
							strCSVContents += "\"" + dtData.Rows[i][j].ToString().Replace("\"", "\\\"") + "\"";
						}
						else
						{
							if (InArray(strFieldsArray, dtData.Columns[j].ColumnName))
							{
								if (j > 0)
									strCSVContents += ",";

								// double quote all fields. replace any double quotes in field with escape clause.
								// this allows things like inches (") to be put in fields, or any quote marks
								strCSVContents += "\"" + dtData.Rows[i][j].ToString().Replace("\"", "\\\"") + "\"";
							}
						}
					}

					strCSVContents += "\n";
				}
			}
			catch (Exception ex)
			{
				throw new Exception("RC Error: " + ex.Message.ToString(), ex);
			}

			return (strCSVContents);
		}

		// if value found in array, will return true
		private bool InArray(string[] strArray, string strText)
		{
			foreach (string strItem in strArray)
			{
				if (strItem == strText)
				{
					return true;
				}
			}
			return false;
		}

		// will import a csv string into RC. 
		// remember that ONLY data exported in 'raw' mode can be imported (I think 'label' will not work)
		public string RCImportCSVFlat(string strPostToken, string strCSVContents, bool boolOverwrite)
		{
			string strPostParameters = "&content=record&format=csv&type=flat&overwriteBehavior=overwrite&data=" + strCSVContents;
			if (boolOverwrite)
				strPostParameters += "&overwriteBehavior=overwrite";
			strPostParameters += "&data=" + strCSVContents;

			byte[] bytePostData = Encoding.ASCII.GetBytes("token=" + strPostToken + strPostParameters);

			string strResponse = responseHTTP(bytePostData);

			// error if more than 9999 records (this num could change, but is just what I tried), or most likely, just has an error message.
			if (strResponse.Length > 4)
			{
				throw new Exception("RC Error: " + strResponse);
			}

			return (strResponse);
		}

		// makes the API call and returns response from request
		private string responseHTTP(byte[] bytePostData)
		{
			Debug.WriteLine("responseHTTP()");
			string strResponse = "";

			try
			{
				// added for mono on unix server. should not need if don't have this environment
				// ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate,
				//                         X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };

				HttpWebRequest webreqRedCap = (HttpWebRequest)WebRequest.Create(strURI);

				webreqRedCap.Method = "POST";
				webreqRedCap.ContentType = "application/x-www-form-urlencoded";
				webreqRedCap.ContentLength = bytePostData.Length;

				// Get the request stream and read it
				Stream streamData = webreqRedCap.GetRequestStream();
				streamData.Write(bytePostData, 0, bytePostData.Length);
				streamData.Close();

				HttpWebResponse webrespRedCap = (HttpWebResponse)webreqRedCap.GetResponse();

				//Now, read the response (the string), and output it.
				Stream streamResponse = webrespRedCap.GetResponseStream();
				StreamReader readerResponse = new StreamReader(streamResponse);

				strResponse = readerResponse.ReadToEnd();
			}
			catch (WebException exWE)
			{
				Stream streamWE = exWE.Response.GetResponseStream();
				StringBuilder sbResponse = new StringBuilder("", 65536);

				try
				{
					byte[] readBuffer = new byte[1000];
					int intCnt = 0;

					for (; ; )
					{
						intCnt = streamWE.Read(readBuffer, 0, readBuffer.Length);

						if (intCnt == 0)
						{
							// EOF
							break;
						}

						sbResponse.Append(System.Text.Encoding.UTF8.GetString(readBuffer, 0, intCnt));
					}

				}
				finally
				{
					streamWE.Close();

					strResponse = sbResponse.ToString();
				}
			}
			catch (Exception ex)
			{
				strResponse = ex.Message.ToString();
				//throw new Exception ( "RC Error. " +  ex.Message.ToString(), ex);
			}

			return (strResponse);
		}

		//----------------------------------------------
		/// Sample GetData code. gives you an idea of how to use above functions
		public DataTable GetDataTableFromForm(string yourformname)
		{
			//tbResults.Text = "";

			DataTable dtRCTable = null;
			DataRow drTableRow;

			// say RC fields are: studyid, redcap_event_name, radio_button1
			// remember, check_boxes come back as check_box___0 , check_box___1, etc.
			string strField1 = "";
			string strField2 = "";
			string strField3 = "";

			try
			{
				// the call below will expect 'studyid' as the 1st field (or errors out), asks for all records, all fields, all events, from form 'yourformname, raw data, all access groups
				dtRCTable = GetTableFromAnyRC(strPostToken, "studyid", "", "", "", yourformname, false, false);

				for (int i = 0; i < dtRCTable.Rows.Count; i++)
				{
					// these will throw exceptions if the field name ("studyid") is not correct or not in the data returned
					// when putting in Data Tables, noticed that empty fields sometimes have &nbsp; in them, so change it to blank ""
					strField1 = dtRCTable.Rows[i]["studyid"].ToString().Trim().Replace("&nbsp;", "");
					strField2 = dtRCTable.Rows[i]["redcap_event_name"].ToString().Trim().Replace("&nbsp;", "");  // this call should be removed if not longitudinal
					strField3 = dtRCTable.Rows[i]["radio_button1"].ToString().Trim().Replace("&nbsp;", "");

					// do whatever with the three fields you wanted


				}

			}
			catch (Exception ex)
			{
				// whatever you want to do with exception
			}
			finally
			{
				// any actions needed here
			}

			return dtRCTable;
		}

		// sample SetData code.  gives you an idea of how to use the above functions
		public void SetData(DataTable dtData)
		{
			string strCSVContents = "";

			try
			{
				// makes a csv string from all columns in data table
				strCSVContents = GetCSVFromTable(dtData, "");

				// imports this csv string to RC using API, with overwrite
				RCImportCSVFlat(strPostToken, strCSVContents, true);

			}
			catch (Exception ex)
			{
				// whatever you want to do with exception
			}
			finally
			{
				// any actions needed here
			}
		}

	}
}
