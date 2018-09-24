using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ExtensionMethods;
using uwac;

/// <summary>
/// Summary description for NDAR
/// </summary>
public class NDAR
{
	public NDAR()
	{
		//
		// TODO: Add constructor logic here
		//
	}


	// from
	// http://stackoverflow.com/questions/3552461/how-to-format-a-javascript-date
//    new Date(parseInt(496407600)*1000).toLocaleDateString('de-DE', {
//year: 'numeric',
//month: '2-digit',
//day: '2-digit'
//}).replace(/\./g, '/');


	public static DataTable NDAR_dataStructures()
	{
		DataTable dt = new DataTable();
		dt.Columns.Add("shortName", typeof(string));
		dt.Columns.Add("title", typeof(string));
		dt.Columns.Add("datatype", typeof(string));
		dt.Columns.Add("status", typeof(string));
		dt.Columns.Add("publicStatus", typeof(string));
		dt.Columns.Add("publishDate", typeof(Int64));
		dt.Columns.Add("modifiedDate", typeof(Int64));
		dt.Columns.Add("url", typeof(string));

		return dt;
	}


	public static DataTable NDAR_dataElements()
	{
		DataTable dt = new DataTable();
		dt.Columns.Add("shortName", typeof(string));
		dt.Columns.Add("id", typeof(int));
		dt.Columns.Add("required", typeof(string));

		////Not using the following
		//dt.Columns.Add("condition", typeof(string));
		//dt.Columns.Add("aliases", typeof(string));
		//dt.Columns.Add("filterElement", typeof(string));
		dt.Columns.Add("position", typeof(int));
		dt.Columns.Add("dataElementId", typeof(Int64));
		dt.Columns.Add("name", typeof(string));
		dt.Columns.Add("type", typeof(string));
		dt.Columns.Add("size", typeof(int));
		dt.Columns.Add("description", typeof(string));
		dt.Columns.Add("valueRange", typeof(string));
		dt.Columns.Add("notes", typeof(string));
		dt.Columns.Add("uwfld", typeof(string));
		dt.Columns.Add("fx", typeof(string));
		dt.Columns.Add("param1", typeof(string));
		dt.Columns.Add("param2", typeof(string));

		return dt;
	}

	
	public class NDAR_DataElement
	{
		public Int64? id { get; set; }
		public string required { get; set; }
		public string condition { get; set; }
		public List<string> aliases { get; set; }
		public string filterElement { get; set; }
		public Int64? position { get; set; }
		public Int64? dataElementId { get; set; }
		public string name { get; set; }
		public string type { get; set; }
		public Int64? size { get; set; }
		public string description { get; set; }
		public string valueRange { get; set; }
		public string notes { get; set; }
		public List<NDAR_translation> translations { get; set; }
	}

	public class NDAR_translation
	{
		public string key { get; set; }
		public string value { get; set; }
	}



public class NDAR_DataStructure
	{
		public string shortName { get; set; }
		public string title { get; set; }
		public List<string> sources { get; set; }
		public List<string> categories { get; set; }
		public string dataType { get; set; }
		public string status { get; set; }
		public string publicStatus { get; set; }
		public Int64? publishDate { get; set; }
		public Int64? modifiedDate { get; set; }
		public List<NDAR_DataElement> dataElements { get; set; }
	}

	public static NDAR_DataStructure GetNDARDataStructure(string shortName)
	{
		NDAR_DataStructure ds = new NDAR_DataStructure();
		//ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
		WebClient wc = new WebClient();
		try
		{

			wc.Headers.Add("Accept", "application/json");

			ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;


			string ds_string = wc.DownloadString(@"https://ndar.nih.gov/api/datadictionary/v2/datastructure/" + shortName );

			//read the top level of the JSON data
			JToken token = JObject.Parse(ds_string);


			ds.shortName = GetTokenValue_string(token, "shortName");
			ds.title = GetTokenValue_string(token, "title");
			//ds.sources = token.SelectToken("sources").ToString();
			//ds.categories = token.SelectToken("categories").ToString();
			ds.dataType = GetTokenValue_string(token, "dataType");
			ds.status = GetTokenValue_string(token, "status");
			ds.publicStatus = GetTokenValue_string(token, "publicStatus");
			ds.publishDate = GetTokenValue_int(token, "publishDate");
			ds.modifiedDate = GetTokenValue_int(token, "modifiedDate");
			ds.dataElements = new List<NDAR_DataElement>();

			JArray deTokens = (JArray)token.SelectToken("dataElements");

			foreach (JToken deToken in deTokens)
			{
				NDAR_DataElement de = new NDAR_DataElement();

				de.required = GetTokenValue_string(deToken, "required");
				de.id = GetTokenValue_int(deToken, "id");
				de.condition = GetTokenValue_string(deToken, "condition");
				de.name = GetTokenValue_string(deToken, "name");

				//de.aliases = deToken.SelectToken("aliases").ToString();
				de.filterElement = GetTokenValue_string(deToken, "filterElement");
				de.position = GetTokenValue_int(deToken, "position");
				de.name = GetTokenValue_string(deToken, "name");
				de.type = GetTokenValue_string(deToken, "type");
				de.size = GetTokenValue_int(deToken, "size");
				de.description = GetTokenValue_string(deToken, "description");
				de.valueRange = GetTokenValue_string(deToken, "valueRange");
				de.notes = GetTokenValue_string(deToken, "notes");
				//de.translations = deToken.SelectToken("").ToString();

				ds.dataElements.Add(de);
			}

		}
		catch(Exception)
		{
			ds = null;
		}


		return ds;
	}

	public static string GetTokenValue_string(JToken token, string fld)
	{
		string s = null;
		if (!token[fld].IsNullOrEmpty())
		{
			s = token.SelectToken(fld).ToString();
		}
		return s;
	}

	public static Int64? GetTokenValue_int(JToken token, string fld)
	{
		Int64? s = null;
		if (!token[fld].IsNullOrEmpty())
		{
			s = Int64.Parse(token.SelectToken(fld).ToString());
		}
		return s;
	}


	public static DataTable NDARDataStructureElements_to_DataTable(NDAR_DataStructure ds)
	{
		if (ds != null)
		{
			//Create the data table for the dataElements
			DataTable dt = NDAR_dataElements();

			foreach (NDAR_DataElement de in ds.dataElements)
			{
				DataRow row = dt.NewRow();

				row["shortName"] = !string.IsNullOrWhiteSpace(ds.shortName) ? (object)ds.shortName : (object)DBNull.Value;
				row["id"] = !(de.id == null) ? (object)de.id : (object)DBNull.Value;
				row["dataElementId"] = !(de.dataElementId == null) ? (object)de.dataElementId : (object)DBNull.Value;
				row["name"] = !string.IsNullOrWhiteSpace(de.name) ? (object)de.name : (object)DBNull.Value;
				row["description"] = !string.IsNullOrWhiteSpace(de.description.Replace("\"", "")) ? (object)de.description.Replace("\"", "") : (object)DBNull.Value;
				row["type"] = !string.IsNullOrWhiteSpace(de.type) ? (object)de.type : (object)DBNull.Value;


				row["required"] = !string.IsNullOrWhiteSpace(de.required) ? (object)de.required : (object)DBNull.Value;
				row["position"] = !(de.position == null) ? (object)de.position : (object)DBNull.Value;
				row["valueRange"] = !string.IsNullOrWhiteSpace(de.valueRange) ? (object)de.valueRange : (object)DBNull.Value;

				int maxleng = (de.description.Length > 50) ? 50 : de.description.Length;

				row["uwfld"] = DBNull.Value;
				//row["uwfld"] = " ,   as " + de.name + " /* (" + de.valueRange + ") " + de.description.Substring(0, maxleng - 1) + " */";
				row["fx"] = DBNull.Value;
				row["param1"] = DBNull.Value;
				row["param2"] = DBNull.Value;

				dt.Rows.Add(row);
			}

			return dt;
		}
		else{
			return null;
		}

	}


	public static int Get_Count_NDAR_DSE_from_DB(string shortName)
	{
		SQL_utils sql = new SQL_utils("data");

		int n = sql.IntScalar_from_SQLstring("select coalesce(count(*),0) from NDAR_DSE where shortname = '" + shortName + "'");

		return n;
	}


	public static DataTable NDAR_DSE_from_DB (string shortName)
	{
		SQL_utils sql = new SQL_utils("data");

		DataTable dt = sql.DataTable_from_SQLstring("select * from NDAR_DSE where shortname = '" +
			shortName + "' order by position");

		return dt;
	}


	#region Construct the NDAR view
	public static string GetSQL_for_NDAR_fields(string shortName)
	{
		SQL_utils sql = new SQL_utils("data");

		DataTable dt = sql.DataTable_from_SQLstring("exec spNDAR_SQL_for_NDAR_fields '" + shortName + "'");

		List<string> list_sql = dt.AsEnumerable().Select(r => r.Field<string>("sqlfields")).ToList<string>();

		string sql_for_NDAR_fields = String.Join(" ", list_sql);
		
		return sql_for_NDAR_fields;
	}



	public static string GetSQL_for_NDAR_studymeas_to_include(string shortName, int studyID, int tp)
	{
		SQL_utils sql = new SQL_utils("data");

		List<SqlParameter> p = new List<SqlParameter> ();
		p.Add(sql.CreateParam("shortName", shortName, "string"));
		p.Add(sql.CreateParam("studyID", studyID.ToString(), "int"));
		p.Add(sql.CreateParam("tp", tp.ToString(), "int"));

		DataTable dt = sql.DataTable_from_ProcName("spNDAR_get_studymeasID_to_include", p);

		string sql_for_studymeasIDs = "";
		if (dt != null)
		{

			List<string> myIds = new List<string>();
			foreach (DataRow dr in dt.Rows)
			{
				myIds.Add(Convert.ToString(dr["studymeasID"]));
			}
			sql_for_studymeasIDs = string.Join(",", myIds);

		}

		//var idlist = dt.AsEnumerable().Select(r => r.Field<string>("studymeasID")).ToArray();
		//string sql_for_studymeasIDs = string.Join(",", idlist);

		//string sql_for_studymeasIDs = dt.AsEnumerable()
		//             .Select(row => row["studymeasID"].ToString())
		//             .Aggregate((s1, s2) => String.Concat(s1, "," + s2));

//        List<string> list_sql = dt.AsEnumerable().Select(r => r.Field<string>("studymeasID")).ToList<string>();
		//string sql_for_studymeasIDs = String.Join(" ", (from row In dt.AsEnumerable() select row("studymeasID")).ToList<string>);

		sql.Close();

		return sql_for_studymeasIDs;
	}

	public static string GetSQL_for_NDAR_view(string shortName, int studyID, string studymeasIDs)
	{
		string sql = GetSQL_for_NDAR_view(shortName, studyID, 0, true, "", studymeasIDs); //return all when no timepointID passed in
		return sql;
	}

	public static string GetSQL_for_NDAR_view(string shortName, int studyID, string IDexclude, string studymeasIDs)
	{
		string sql = GetSQL_for_NDAR_view(shortName, studyID, 0, true, IDexclude, studymeasIDs); //return all when no timepointID passed in
		return sql;
	}

	public static string GetSQL_for_NDAR_view(string shortName, int studyID, int timepointID, bool ReasonExclude, string IDexclude)
	{
		string sql = GetSQL_for_NDAR_view(shortName, studyID, timepointID, ReasonExclude, IDexclude, "NONE SELECTED");
			return sql;
	}

	public static string GetSQL_for_NDAR_view(string shortName, int studyID, int timepointID, bool ReasonExclude, string IDexclude, string studymeasIDs)
	{
		SQL_utils sql = new SQL_utils("data");
		string sql_for_NDAR_fields = GetSQL_for_NDAR_fields(shortName);

		string uwtable = sql.StringScalar_from_SQLstring("select uwtable from NDAR_DS where shortname = '" + shortName + "'");
		string sql_from = " from " + uwtable;

		if (studymeasIDs == "NONE SELECTED")
		{
			//studymeasIDs = GetSQL_for_NDAR_studymeas_to_include(shortName, studyID, timepointID);
		}
		string sql_where1 = " where verified in (0,1) and studymeasID in (" + studymeasIDs + ")" ;

		string sql_where_IDexclude = "" ;

		if (IDexclude != "")
		{
			sql_where_IDexclude = " and ID not in ('" + IDexclude.Replace(",", "','") + "')";
		}



		string sql_customValidation = sql.StringScalar_from_SQLstring(" select coalesce(' and ' + customValidation,'') from NDAR_DS where shortName='" + shortName + "'");
		

		///todo:
		///need to add a variable to check that all required fields are populated

		string sql_where_ados = "";
		switch(shortName)
		{
			case "ados1_201201":
				sql_where_ados = " and ados2_mod = 1 ";
				break;
			case "ados2_201201":
				sql_where_ados = " and ados2_mod = 2 ";
				break;
			case "ados3_201201":
				sql_where_ados = " and ados2_mod = 3 ";
				break;
			case "adost_201201":
				sql_where_ados = " and ados2_mod = 0 ";
				break;

		}
		string sql_string;
		if (ReasonExclude)  // include the reasonExclude field 
		{
			string databasepk = sql.StringScalar_from_SQLstring("exec spNDAR_SQL_for_databasepk '" + shortName + "'");

			string urlstem = sql.StringScalar_from_SQLstring("select def.fnGetDElink_stem_from_shortname('" + shortName + "')");


			//wrap the query as "x" in order to select the parameters needed for the function fnNDAR_ReasonExclude 
			sql_string = "select cast( row_number() over(order by reason_exclude, src_subject_id) as varchar) + '|" + urlstem + "' + cast(databasepk as varchar) as rownum, * " + System.Environment.NewLine +
				" from (select  dbo.fnNDAR_ReasonExclude(" + studyID.ToString() + ",subjectkey, src_subject_id, interview_date, gender) as reason_exclude " + System.Environment.NewLine +
				" , * from (" + System.Environment.NewLine + "select " + databasepk + " as databasepk, " +
				sql_for_NDAR_fields + System.Environment.NewLine +
				sql_from + System.Environment.NewLine +
				sql_where1 + System.Environment.NewLine +
				sql_where_IDexclude + System.Environment.NewLine +
				sql_where_ados + System.Environment.NewLine +
				") x) y  order by reason_exclude, src_subject_id ";
		}
		else
		{
			//exclude those with a ReasonExclude value
			string sql_where2 = "  where dbo.fnNDAR_ReasonExclude(" + studyID.ToString() + ",subjectkey, src_subject_id, interview_date, gender) = ''";

			//wrap the query as "x" in order to select the parameters needed for the function fnNDAR_ReasonExclude 
			sql_string = "select * from (select " + sql_for_NDAR_fields + sql_from + sql_where1 + sql_where_IDexclude + sql_where_ados + " ) x " + sql_where2 + " order by src_subject_id";
		}
		return sql_string;
	}




	public static DataTable GetNDAR_view(string shortName, int studyID, string studymeasIDs)
	{
		DataTable dt = GetNDAR_view(shortName, studyID, 0, true, studymeasIDs);
		return dt;
	}

	public static DataTable GetNDAR_view(string shortName, int studyID, string IDexclude, string studymeasIDs)
	{
		DataTable dt = GetNDAR_view(shortName, studyID, 0, true, IDexclude, studymeasIDs);
		return dt;
	}


	public static DataTable GetNDAR_view(string shortName, int studyID, int timepointID, bool ReasonExclude, string studymeasIDs)
	{
		SQL_utils sql = new SQL_utils("data");
		string sql_string = GetSQL_for_NDAR_view(shortName, studyID, timepointID, ReasonExclude, "", studymeasIDs);

		DataTable dt = sql.DataTable_from_SQLstring(sql_string);

		return dt;
	}


	public static DataTable GetNDAR_view(string shortName, int studyID, int timepointID, bool ReasonExclude, string IDexclude, string studymeasIDs)
	{
		SQL_utils sql = new SQL_utils("data");
		string sql_string = GetSQL_for_NDAR_view(shortName, studyID, timepointID, ReasonExclude, IDexclude, studymeasIDs);

		DataTable dt = sql.DataTable_from_SQLstring(sql_string);

		return dt;
	}
	#endregion



	public static DataTable LoadFullDataStructureList(string source)
	{
		DataTable dt = new System.Data.DataTable();

		if (source == "NDAR")
		{
			WebClient wc = new WebClient();
			string ds_string = wc.DownloadString(@"https://ndar.nih.gov/api/datadictionary/v2/datastructure");

			List<NDAR_DataStructure> dsList = JsonConvert.DeserializeObject<List<NDAR_DataStructure>>(ds_string,
				new JsonSerializerSettings
				{
					NullValueHandling = NullValueHandling.Ignore,
					DateFormatHandling = DateFormatHandling.IsoDateFormat
				});

			//Create the data table for the dataElements
			dt = NDAR_dataStructures();

			foreach (NDAR_DataStructure ds in dsList)
			{
				DataRow row = dt.NewRow();

				row["shortName"] = ds.shortName;
				row["title"] = ds.title;
				row["datatype"] = ds.dataType;
				row["status"] = ds.status;
				row["publicStatus"] = ds.publicStatus;
				if (ds.publishDate.ToString() != "") row["publishDate"] = Convert.ToInt64(ds.publishDate);
				if (ds.modifiedDate.ToString() != "") row["modifiedDate"] = Convert.ToInt64(ds.modifiedDate);

			
				dt.Rows.Add(row);
			}

		}
		else if (source == "localDB")
		{
			SQL_utils sql = new SQL_utils();
			dt = sql.DataTable_from_ViewName("vwNDAR_DS");
		}
		return dt;
	}

	public static DataTable LoadFullDataStructureList(string source, string whereclause, bool uwonly)
	{
		DataTable dt = LoadFullDataStructureList(source, whereclause, uwonly, 0);
		return dt;
	}

	public static DataTable LoadFullDataStructureList(string source, string whereclause, bool uwonly, int studyID)
	{
		DataTable dt = new System.Data.DataTable();
		if (source == "localDB")
		{
			SQL_utils sql = new SQL_utils("data");
			if (uwonly & studyID>0)
			{
				// See below where the view 'vwALL_VinelandIISurvey_withMBI' is swapped in.
				// NDAR now requires the MBI variables, this view pulls these in from the 'ALL_VinelandIISurvey_MBI' table.

				//dt = sql.DataTable_from_SQLstring("select * from vwNDAR_DS where uwtable is not null and " + 
				//	" (shortname like '%" + whereclause + "%' or title like '%" + whereclause + "%')" +
				//	" and  uwtable in (select (case when name = 'ALL_VinelandIISurvey' then 'vwALL_VinelandIISurvey_withMBI' else name end) name from datTable a " +
				//	" join datTable_Measure b ON a.tableID = b.tableID " +
				//	"    where measureID in " +
				//	"	(select measureID from uwautism_research_backend..tblstudymeas where studyID = " + studyID.ToString() + "))");

				string code = String.Format("select * from vwNDAR_DS where uwtable is not null and " +
				" (shortname like '%{0}%' or title like '%{0}%')" +
				" and  uwtable in (select tblname from def.Tbl " +
				"    where measureID in " +
				"	(select measureID from uwautism_research_backend..tblstudymeas where studyID = {1}))"
					, whereclause, studyID);

				dt = sql.DataTable_from_SQLstring(code);

			}
			else if (uwonly & studyID == 0)
			{
				dt = sql.DataTable_from_SQLstring("select * from vwNDAR_DS where uwtable is not null and " +
					" (shortname like '%" + whereclause + "%' or title like '%" + whereclause + "%')");
			}
			else if (whereclause!="")
			{
				dt = sql.DataTable_from_SQLstring("select * from vwNDAR_DS where " +
					" (shortname like '%" + whereclause + "%' or title like '%" + whereclause + "%')");
			}
			else 
			{
				dt = sql.DataTable_from_ViewName("vwNDAR_DS");
			}
			sql.Close();
		}
		else if(source == "NDAR")
		{
			dt = LoadFullDataStructureList(source);
		}
		return dt;
	}


	// https://ndar.nih.gov/api/datadictionary/v2/datastructure/sds01/csv 


	//public void LoadDataStructure(string shortName)
	//{
	//    WebClient wc = new WebClient();
	//    string ds_string = wc.DownloadString(@"https://ndar.nih.gov/api/datadictionary/v2/datastructure/aims01");

	//    NDAR.NDAR_DataStructure ds = JsonConvert.DeserializeObject<NDAR.NDAR_DataStructure>(ds_string, new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore });

	//    //Create the data table for the dataElements
	//    DataTable dt = NDAR.NDAR_dataElements();

	//    foreach (NDAR.NDAR_DataElement de in ds.dataElements)
	//    {
	//        DataRow row = dt.NewRow();

	//        row["shortName"] = shortName;
	//        row["id"] = de.id;
	//        row["dataElementId"] = de.dataElementId;
	//        row["name"] = de.name;
	//        row["description"] = de.description;
	//        row["type"] = de.type;

	//        row["required"] = de.required;
	//        row["position"] = de.position;
	//        row["valueRange"] = de.valueRange;

	//        dt.Rows.Add(row);
	//    }


	//}

	
	//https://ndar.nih.gov/api/datadictionary/v2/datastructure


	public static DataTable LoadDataStructure(string shortName)
	{
		WebClient wc = new WebClient();
		string ds_string = wc.DownloadString(@"https://ndar.nih.gov/api/datadictionary/v2/datastructure/" + shortName );

		NDAR.NDAR_DataStructure ds = JsonConvert.DeserializeObject<NDAR.NDAR_DataStructure>(ds_string, new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore });

		//Create the data table for the dataElements
		DataTable dt = NDAR.NDAR_dataElements();

		foreach (NDAR.NDAR_DataElement de in ds.dataElements)
		{
			DataRow row = dt.NewRow();

			row["shortName"] = shortName;
			row["id"] = de.id;
			row["dataElementId"] = de.dataElementId;
			row["name"] = de.name;
			row["description"] = de.description;
			row["type"] = de.type;

			row["required"] = de.required;
			row["position"] = de.position;
			row["valueRange"] = de.valueRange;

			dt.Rows.Add(row);
		}

		return dt;
	}


	public static DataTable LoadDataStructureList(string shortName, string version)
	{
		WebClient wc = new WebClient();
		string ds_string = wc.DownloadString(@"https://ndar.nih.gov/api/datadictionary/v2/datastructure/");

		NDAR.NDAR_DataStructure ds = JsonConvert.DeserializeObject<NDAR.NDAR_DataStructure>(ds_string, new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore });

		//Create the data table for the dataElements
		DataTable dt = NDAR.NDAR_dataElements();

		foreach (NDAR.NDAR_DataElement de in ds.dataElements)
		{
			DataRow row = dt.NewRow();

			row["shortName"] = shortName;
			row["id"] = de.id;
			row["dataElementId"] = de.dataElementId;
			row["name"] = de.name;
			row["description"] = de.description;
			row["type"] = de.type;

			row["required"] = de.required;
			row["position"] = de.position;
			row["valueRange"] = de.valueRange;

			dt.Rows.Add(row);
		}

		return dt;
	}




}

namespace ExtensionMethods
{
	public static class JsonExtensions
	{
		public static bool IsNullOrEmpty(this JToken token)
		{
			return (token == null) ||
				   (token.Type == JTokenType.Array && !token.HasValues) ||
				   (token.Type == JTokenType.Object && !token.HasValues) ||
				   (token.Type == JTokenType.String && token.ToString() == String.Empty) ||
				   (token.Type == JTokenType.Null);
		}
	}
}