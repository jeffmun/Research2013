using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;
using DevExpress.Web.Data;
using uwac;

namespace uwac
{
	/// <summary>
	/// Summary description for DxGridView
	/// </summary>
	public static class DxGridView
	{
		//public static  DxGridView()
		//{
		//	//
		//	// TODO: Add constructor logic here
		//	//
		//}


		public static bool BuildInsertSqlCode(ASPxDataInsertingEventArgs e, string tbl, string db)
		{
			return BuildInsertSqlCode(e.NewValues, tbl, db, "dbo");
		}
		public static bool BuildInsertSqlCode(ASPxDataInsertingEventArgs e, string tbl, string db, string schema)
		{
			return BuildInsertSqlCode(e.NewValues, tbl, db, schema);
		}


		public static bool BuildInsertSqlCode(ASPxDataInsertValues e, string tbl, string db)
		{
			return BuildInsertSqlCode(e.NewValues, tbl, db, "dbo");
		}

		public static bool BuildInsertSqlCode(ASPxDataInsertValues e, string tbl, string db, string schema)
		{
			return BuildInsertSqlCode(e.NewValues, tbl, db, schema);
		}

		public static bool BuildInsertSqlCode(OrderedDictionary NewValues, string tbl, string db)
		{
			return BuildInsertSqlCode(NewValues, tbl, db, "dbo");
		}

		public static bool BuildInsertSqlCode(OrderedDictionary NewValues , string tbl, string db, string schema)
		{
			bool result = false;

			SQL_utils sql1 = new SQL_utils(db);
			DataTable flds = sql1.DataTable_from_SQLstring("select lower(column_name) column_name, lower(data_type) data_type from INFORMATION_SCHEMA.columns where table_name='" + tbl + "' and table_schema = '" + schema + "'");
			string hasCreated = sql1.StringScalar_from_SQLstring("select coalesce(column_name,'null') colname from information_schema.columns where column_name = 'created' and table_name='" + tbl + "' and table_schema = '" + schema + "'");
			string hasCreatedBy = sql1.StringScalar_from_SQLstring("select coalesce(column_name,'null') colname from information_schema.columns where column_name = 'createdby' and table_name='" + tbl + "' and table_schema = '" + schema + "'");
			sql1.Close();

			List<string> insert_flds = new List<string>();
			List<string> insert_vals = new List<string>();



			foreach (DictionaryEntry newentry in NewValues)
			{
				var newval = (newentry.Value == null) ? null : newentry.Value.ToString();

				//make sure the field in contained in the table 
				int hasfld = flds.AsEnumerable().Where(f => f.Field<string>("column_name") == newentry.Key.ToString().ToLower()).Count();

				if (hasfld > 0)
				{
					if (newval != null)
					{
						string data_type = flds.AsEnumerable()
											.Where(f => f.Field<string>("column_name") == newentry.Key.ToString().ToLower())
											.Select(f => f["data_type"]).First().ToString();

						List<string> char_types = new List<string> { "char", "varchar", "text", "memo", "nvarchar", "date", "datetime", "smalldatetime" };

						string quote_holder = (char_types.Contains(data_type)) ? "'" : "";

						insert_flds.Add(String.Format("{0}", newentry.Key));
						insert_vals.Add(String.Format("{0}{1}{0}", quote_holder, newentry.Value));

					}
				}
			}

			if (insert_vals.Count > 0)
			{

				if (hasCreated != null)
				{
					if (hasCreated.ToLower() == "created")
					{
						insert_flds.Add("created");
						insert_vals.Add("getdate()");
					}
				}
				if (hasCreatedBy != null)
				{
					if (hasCreatedBy.ToLower() == "createdby")
					{
						insert_flds.Add("createdby");
						insert_vals.Add("sec.systemuser()");
					}
				}

				
				string insert_code = String.Format("insert into {0}.{1}({2}) values({3}) "
					, schema, tbl, String.Join(",", insert_flds), String.Join(",", insert_vals));

				SQL_utils sql = new SQL_utils(db);
				try
				{
					sql.NonQuery_from_SQLstring(insert_code);
					result = true;
				}
				catch (Exception ex)
				{
					result = false;
				}
			}
			return result;
		}



		#region UPDATE
		public static bool BuildUpdateSqlCode(ASPxDataUpdatingEventArgs e, string tbl, string db)
		{
			return BuildUpdateSqlCode(e.Keys, e.NewValues, e.OldValues, tbl, db);
		}
		public static bool BuildUpdateSqlCode(ASPxDataUpdatingEventArgs e, string tbl, string db, string schema)
		{
			return BuildUpdateSqlCode(e.Keys, e.NewValues, e.OldValues, tbl, db, schema);
		}

		public static bool BuildUpdateSqlCode(ASPxDataUpdateValues e, string tbl, string db)
		{
			return BuildUpdateSqlCode(e.Keys, e.NewValues, e.OldValues, tbl, db, "dbo");
		}

		public static bool BuildUpdateSqlCode(ASPxDataUpdateValues e, string tbl, string db, string schema)
		{
			return BuildUpdateSqlCode(e.Keys, e.NewValues, e.OldValues, tbl, db, schema);
		}

		public static bool BuildUpdateSqlCode(OrderedDictionary Keys, OrderedDictionary NewValues, OrderedDictionary OldValues, string tbl, string db)
		{
			return BuildUpdateSqlCode(Keys, NewValues, OldValues, tbl, db, "dbo");
		}

		public static bool BuildUpdateSqlCode(OrderedDictionary Keys, OrderedDictionary NewValues, OrderedDictionary OldValues, string tbl, string db, string schema)
		{
			bool result = false;
			int n_newvals = NewValues.Count;
			int n_oldvals = OldValues.Count;

			List<string> fldupdates = new List<string>();
			List<string> auditchanges = new List<string>();
			string pkfld = "";
			string pkvalue = "-1";

			foreach (DictionaryEntry key in Keys)
			{
				pkfld = key.Key.ToString();
				pkvalue = key.Value.ToString();
			}


			if (n_newvals == n_oldvals && pkvalue != "-1" && pkfld != "")
			{
				SQL_utils sql1 = new SQL_utils(db);
				DataTable flds = sql1.DataTable_from_SQLstring("select lower(column_name) column_name, lower(data_type) data_type from INFORMATION_SCHEMA.columns where table_name='" + tbl + "' and table_schema = '" + schema + "'");
				sql1.Close();


				foreach (DictionaryEntry newentry in NewValues)
				{
					foreach (DictionaryEntry oldentry in OldValues)
					{
						var newfld = newentry.Key.ToString().ToLower();
						var oldfld = oldentry.Key.ToString().ToLower();

						if (newentry.Key == oldentry.Key)
						{

							var newval = (newentry.Value == null) ? null : newentry.Value.ToString();
							var oldval = (oldentry.Value == null) ? null : oldentry.Value.ToString();
							string newval_audit;
							string oldval_audit;

							if (newval != null)
							{
								newval_audit = (newval.Length > 1000) ? newval.ToString().Substring(0, 1000) : newval;

							}
							else
							{
								newval_audit = newval;
							}
							if (oldval != null)
							{
								oldval_audit = (oldval.Length > 1000) ? oldval.ToString().Substring(0, 1000) : oldval;
							}
							else
							{
								oldval_audit = oldval;
							}


							//if oldval is null - go get the real one
							if (oldval == null)
							{
								SQL_utils sql2 = new SQL_utils(db);
								string oldval_from_DB = sql2.StringScalar_from_SQLstring(String.Format("select {0} from {1} where cast({2} as varchar) = '{3}'"
									, oldfld, tbl, pkfld, pkvalue));

								oldval = oldval_from_DB;

								oldval_audit = (oldval_from_DB.Length > 1000) ? oldval_from_DB.ToString().Substring(0, 1000) : oldval_from_DB;
							}


							//new value is not null AND old value is null or empty = update to newval (even if empty string)
							bool update_to_empty = ((newval == "" || newval != null) && !String.IsNullOrEmpty(oldval)) ? true : false;
							bool update_to_value = (!String.IsNullOrEmpty(newval)) ? true : false;

							if (newval == null) newval = "";
							if (oldval == null) oldval = "";


							if (true)
							//if (update_to_empty || update_to_value)
							{
								if (newval != oldval)
								{
									string data_type = flds.AsEnumerable()
										.Where(f => f.Field<string>("column_name") == newentry.Key.ToString().ToLower())
										.Select(f => f["data_type"]).First().ToString();

									List<string> char_types = new List<string> { "char", "varchar", "text", "memo", "nvarchar", "date", "datetime", "smalldatetime" };

									string quote_holder = (char_types.Contains(data_type)) ? "'" : "";

									string newentry_dblquotes = newentry.Value.ToString().Replace("'", "''");


									string upd = String.Format("{0}={1}{2}{1} ", newentry.Key, quote_holder, newentry_dblquotes);

									string changeaudit = String.Format("insert into AuditChanges(pk,pkfldname,tblname,fldname,oldvalue,newvalue,updated,updatedby) " +
										"values( {0},'{1}','{2}','{3}','{4}','{5}',getdate(), cast(SESSION_CONTEXT(N'netid') as varchar))"
										, pkvalue, pkfld, tbl, newentry.Key, oldval_audit, newval_audit);

									auditchanges.Add(changeaudit);
									fldupdates.Add(upd);

								}
							}
						}
					}

				}
			}



			SQL_utils sql = new SQL_utils(db);

			//Write the changes
			if (fldupdates.Count >= 1)
			{

				string hasUpdated = sql.StringScalar_from_SQLstring("select coalesce(column_name,'null') colname from information_schema.columns where column_name = 'updated' and table_name='" + tbl + "'");
				string hasUpdatedBy = sql.StringScalar_from_SQLstring("select coalesce(column_name,'null') colname from information_schema.columns where column_name = 'updatedby' and table_name='" + tbl + "'");

				if (hasUpdated != null)
				{
					if (hasUpdated.ToLower() == "updated")
					{
						fldupdates.Add("updated=getdate()");
					}
				}
				if (hasUpdatedBy != null)
				{
					if (hasUpdatedBy.ToLower() == "updatedby")
					{
						fldupdates.Add("updatedby=cast(SESSION_CONTEXT(N'netid') as varchar)");
					}
				}

				string update_code = String.Format("update {0}.{1} set {2} where {3}={4}", schema, tbl, String.Join(",", fldupdates), pkfld, pkvalue);

				try
				{
					sql.NonQuery_from_SQLstring(update_code);
					result = true;

				}
				catch (Exception ex)
				{
					result = false;
				}
			}


			//Write the changes to the AuditChanges table
			if (auditchanges.Count >= 1 && db == "backend")
			{
				foreach (string auditchange in auditchanges)
				{
					try
					{
						sql.NonQuery_from_SQLstring(auditchange);
						result = true;

					}
					catch (Exception ex)
					{
						result = false;
					}
				}
			}

			sql.Close();
			return result;

		}


		#endregion


		public static string BuildDeleteSqlCode(ASPxDataDeletingEventArgs e, string tbl, string db)
		{

			var pkval = "";
			var pkfld = "";

			foreach (DictionaryEntry key in e.Keys)
			{
				pkfld = (key.Key == null) ? null : key.Key.ToString();
				pkval = (key.Value == null) ? null : key.Value.ToString();

			}
			string result = "";

			if (pkfld != "" && Convert.ToInt32(pkval) > 0)
			{

				result = BuildDeleteSqlCode(tbl, db, pkfld, Convert.ToInt32(pkval), "");

			}
			else 
			{
				result = "Not Implemented.";
			}



			return result;
		}


		public static string BuildDeleteSqlCode(string tbl, string db, string subquery)
		{
			return BuildDeleteSqlCode(tbl, db, "", -1, subquery);
		}
		public static string BuildDeleteSqlCode(string tbl, string db, string fldname, int fldvalue)
		{
			return BuildDeleteSqlCode(tbl, db, fldname, fldvalue, "");
		}


		public static string BuildDeleteSqlCode(string tbl, string db, string fldname, int fldvalue, string subquery)
		{

			SQL_utils sql = new SQL_utils(db);


			string where_clause = "";
			if(subquery != "" && fldname == "" && fldvalue == -1)
			{
				where_clause = String.Format(" {0} ", subquery);

			}
			else
			{
				where_clause = String.Format(" {0} = {1} ", fldname, fldvalue);
			}


			try
			{
				string sql_selectcode = String.Format("select * from {0} where {1} for xml raw, elements", tbl, where_clause);
				//string contents = sql.StringScalar_from_SQLstring(log_code1);

				//string log_code2 = String.Format("insert into AuditDeletes(tblname,pkfld,pkval,contents,deleted,deletedby) select '{0}','{1}',{2},({3}),getdate(),cast(SESSION_CONTEXT(N'netid') as varchar)"
				//, tbl, fldname, fldvalue, sql_selectcode);
				//string del_code = String.Format("Delete from {0} where {1}={2}", tbl, pkfld, pkval);
				

				string log_code2 = (fldvalue > 0) ?
					String.Format("insert into AuditDeletes(tblname,pkfld,pkval,contents,deleted,deletedby) select '{0}','{1}',{2},coalesce(({3}),'no records'),getdate(), sec.systemuser()"
				, tbl, fldname, fldvalue, sql_selectcode) :
					String.Format("insert into AuditDeletes(tblname,pkfld,pkval,where_clause,contents,deleted,deletedby) select '{0}',null,-1,'{1}',coalesce(({2}),'no records'),getdate(), sec.systemuser()"
					, tbl, where_clause, sql_selectcode);

				string del_code = String.Format("Delete from {0} where {1}", tbl, where_clause);


				var sql_output = sql.NonQuery_from_SQLstring_withRollback(String.Format("{0}; {1};", log_code2, del_code));


			}
			catch (Exception ex)
			{

			}

			sql.Close();

			string result = (fldvalue > 0) ? RecoverDeletedRecord(tbl, db, fldname, fldvalue) : RecoverDeletedRecord(tbl, db, where_clause);

			return result;
		}



		public static string RecoverDeletedRecord(string tbl, string db, string where_clause)
		{
			string result = "The following record has been deleted:<br/><br/>";
			SQL_utils sql = new SQL_utils(db);

			string sqlcode = String.Format("select top 1 contents from auditdeletes where tblname='{0}' and where_clause='{1}'", tbl, where_clause);

			try
			{
				string myXml = sql.StringScalar_from_SQLstring(sqlcode);

				XmlDocument xdoc = new XmlDocument();
				xdoc.LoadXml(myXml);
				var rownodes = xdoc.ChildNodes;


				foreach (XmlNode child in rownodes[0].ChildNodes)
				{
					if (child.InnerText != "") result += String.Format("{0} = {1}{2}", child.Name, child.InnerText, "<br/>");
				}

				result += "<br/><br/><i>This record can be recovered if needed.  Contact Jeff.</i>";

				return result;
			}
			catch(Exception ex)
			{
				return String.Format("{0} <br/>ERROR retrieving deleted data for tbl: {1} <br/>where_clause: {2}", result, tbl, where_clause);
			}
		}


		public static string RecoverDeletedRecord(string tbl, string db, string fldname, int fldvalue)
		{
			string result = "The following record has been deleted:<br/><br/>";
			SQL_utils sql = new SQL_utils(db);

			try
			{
				string myXml = sql.StringScalar_from_SQLstring(String.Format("select top 1 contents from auditdeletes where tblname='{0}' and {1}={2}", tbl, fldname, fldvalue));


				XmlDocument xdoc = new XmlDocument();
				xdoc.LoadXml(myXml);
				var rownodes = xdoc.ChildNodes;

				foreach (XmlNode child in rownodes[0].ChildNodes)
				{
					if (child.InnerText != "") result += String.Format("{0} = {1}{2}", child.Name, child.InnerText, "<br/>");
				}

				result += "<br/><br/><i>This record can be recovered if needed.  Contact Jeff.</i>";

				return result;
			}
			catch (Exception ex)
			{
				return String.Format("{0} <br/>ERROR retrieving deleted data for tbl: {1} <br/>{2}: {3}", result, tbl, fldname, fldvalue);
			}

		}

	}
}