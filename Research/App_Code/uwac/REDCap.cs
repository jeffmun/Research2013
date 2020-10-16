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
using Redcap;
using Redcap.Models;
using System.Dynamic;

/// https://github.com/cctrbic/redcap-api
/// Publications resulting from the use of this software should cite the Wright Center's Clinical and Translational Science Award (CTSA) grant #UL1TR002649, 
/// National Center for Advancing Translational Sciences, NIH.


namespace uwac_REDCap
{




	/// <summary>
	/// Summary description for REDCap
	/// </summary>
	public class REDCap
	{
		//public RedcapAPI api { get; set; } //this was from RedcapLibrary (nuget package)
		public RedcapNefcyExt api { get; set; }
		public RedcapAPI apiMeta { get; set; }

		private DataTable dt_tokens;
		public DataTable dt_redcapforms { get; set; }
		public DataTable dt_redcapevents { get; set; }
		public DataTable dt_metadata { get; set; }
		public DataTable dt_formevents { get; set; }

		public DataTable dt_db_formevent_studymeasid { get; set; }
		public List<string>  redcapevents { get; set; }

		private string idfld;
		public string dataheader { get; set; }
		private int _studyID;

		public REDCap(int studyID)
		{
			_studyID = studyID;
			idfld = "id";

			LoadTokens();
			GetAPIInfo();
		}

		public void LoadTokens()
		{
			if (_studyID > 0)
			{
				SQL_utils sql = new SQL_utils("data");

				//string code = "select coalesce(token,'') token, coalesce(url,'') url, coalesce(idfld, '') idfld from uwautism_research_backend..tblstudy s LEFT JOIN def.REDCapToken_Study a ON s.studyID=a.studyID LEFT JOIN def.REDCapToken b ON a.tokenID=b.tokenID where s.studyID=" + studyID.ToString();
				string code = "select b.tokenid, coalesce(token,'') token, coalesce(url,'') url, coalesce(idfld, '') idfld from uwautism_research_backend..tblstudy s JOIN def.REDCapToken_Study a ON s.studyID=a.studyID JOIN def.REDCapToken b ON a.tokenID=b.tokenID where s.studyID=" + _studyID.ToString();
				dt_tokens = sql.DataTable_from_SQLstring(code);

				string form_event_code = String.Format("select unique_event_name + form form_and_event, tokenid, studymeasid from def.redcap_formevent where studymeasid in (select studymeasid from uwautism_research_backend..tblstudymeas where studyid={0})", _studyID);
				dt_db_formevent_studymeasid = sql.DataTable_from_SQLstring(form_event_code);

				sql.Close();
			}
		}

		public void GetAPIInfo()
		{
			if (dt_tokens.HasRows())
			{
				int counter = 0;
				foreach (DataRow row in dt_tokens.Rows)
				{
					apiMeta = new RedcapAPI(row["url"].ToString(), row["token"].ToString());
					api = new RedcapNefcyExt(row["url"].ToString(), row["token"].ToString());

					int tokenid = Convert.ToInt32(row["tokenid"]);

					if (counter == 0)
					{
						redcapevents = api.events;

						dt_redcapforms = AddTokenid(apiMeta.InstrumentDataTable, tokenid);
						dt_redcapevents = AddTokenid(api.dt_redcapevents, tokenid);
						dt_metadata = AddTokenid(apiMeta.MetaDataTable, tokenid);
						dt_formevents = AddTokenid(api.dt_formevents, tokenid);

					}
					else
					{
						foreach (DataRow row2 in apiMeta.InstrumentDataTable.Rows)
						{
							dt_redcapforms.ImportRow(row2);
						}
						foreach (DataRow row2m in apiMeta.MetaDataTable.Rows)
						{
							dt_metadata.ImportRow(row2m);
						}
					}
					counter++;
				}
			}
		}


		public DataTable AddStudymeasToREDCapFormData(DataTable dt)
        {
			string form_name = dt.AsEnumerable().Select(f => f.Field<string>("form_name")).First().ToString();
			string form_name2 = dt.AsEnumerable().Select(f => f.Field<string>("form_name")).Last().ToString();

			if(form_name == form_name2)
            {
				dt = ConcatFields(dt, "redcap_event_name", "form_name", "form_and_event");

				dt.Columns.Add(new DataColumn("studymeasid", typeof(int)));

                List<string> form_and_event1 = dt.AsEnumerable().Select(f => f.Field<string>("form_and_event")).Distinct().ToList();
                List<string> form_and_event2 = dt_db_formevent_studymeasid.AsEnumerable().Select(f => f.Field<string>("form_and_event")).Distinct().ToList();

				Debug.WriteLine("dt form_and_event");
				foreach (string s in form_and_event1) Debug.WriteLine(s);
				Debug.WriteLine("dt_db_formevent_studymeasid form_and_event");
				foreach (string s in form_and_event2) Debug.WriteLine(s);


				foreach (DataRow row in dt.Rows)
                {
					string form_and_event = row["form_and_event"].ToString();

					try
					{
						string str_studymeasid = dt_db_formevent_studymeasid.AsEnumerable().Where(f => f.Field<string>("form_and_event") == form_and_event)
							.Select(f => f.Field<int>("studymeasid")).First().ToString();

						int studymeasid;
						bool isint = Int32.TryParse(str_studymeasid, out studymeasid);

						if (isint) row["studymeasid"] = studymeasid;
					}
					catch(Exception ex)
					{ }
                }


				return dt;

				//List<string> form_and_event1 = dt.AsEnumerable().Select(f => f.Field<string>("form_and_event")).Distinct().ToList();
				//List<string> form_and_event2 = dt_db_formevent_studymeasid.AsEnumerable().Select(f => f.Field<string>("form_and_event")).Distinct().ToList();
				//DataTable dt2 = JoinDataTables(dt, dt_db_formevent_studymeasid, (row1, row2) =>
				//  row1.Field<string>("form_and_event") == row2.Field<string>("form_and_event")
				//  );
				//return dt2;
			}
            else
            {
				return null;
            }

		}

		public DataTable ConcatFields(DataTable dt, string fld1, string fld2, string newfld)
        {
			DataColumn col_newfld = new DataColumn(newfld);
			dt.Columns.Add(col_newfld);

			foreach(DataRow row in dt.Rows)
            {
				row[newfld] = String.Format("{0}{1}", row[fld1].ToString(), row[fld2].ToString());
            }
			return dt;
        }


		public List<dynamic> ToDynamic(DataTable dt)
		{
			var dynamicDt = new List<dynamic>();
			foreach (DataRow row in dt.Rows)
			{
				dynamic dyn = new ExpandoObject();
				foreach (DataColumn column in dt.Columns)
				{
					var dic = (IDictionary<string, object>)dyn;
					dic[column.ColumnName] = row[column];
				}
				dynamicDt.Add(dyn);
			}
			return dynamicDt;
		}

		private DataTable JoinDataTables(DataTable t1, DataTable t2, params Func<DataRow, DataRow, bool>[] joinOn)
		{
			DataTable result = new DataTable();
			foreach (DataColumn col in t1.Columns)
			{
				try
				{
					if (result.Columns[col.ColumnName] == null)
						result.Columns.Add(col.ColumnName, col.DataType);
				}
				catch(Exception ex)
                {
					int x = 0;
                }
			}
			foreach (DataColumn col in t2.Columns)
			{
				if (result.Columns[col.ColumnName] == null)
					result.Columns.Add(col.ColumnName, col.DataType);
			}
			foreach (DataRow row1 in t1.Rows)
			{
				var joinRows = t2.AsEnumerable().Where(row2 =>
				{
					foreach (var parameter in joinOn)
					{
						if (!parameter(row1, row2)) return false;
					}
					return true;
				});
				foreach (DataRow fromRow in joinRows)
				{
					DataRow insertRow = result.NewRow();
					foreach (DataColumn col1 in t1.Columns)
					{
						insertRow[col1.ColumnName] = row1[col1.ColumnName];
					}
					foreach (DataColumn col2 in t2.Columns)
					{
						insertRow[col2.ColumnName] = fromRow[col2.ColumnName];
					}
					result.Rows.Add(insertRow);
				}
			}
			return result;
		}


		#region Save to DB
		private DataTable AddTokenid(DataTable dt, int tokenid)
        {
			DataColumn col_tokenid = new DataColumn("tokenid", typeof(int));
			col_tokenid.DefaultValue = tokenid;

			dt.Columns.Add(col_tokenid);

			return dt;
        }

		public string SaveFormsToDB()
        {
			string result = "";
			if (dt_redcapforms.HasRows())
            {
				SQL_utils sql = new SQL_utils("data");
				result = sql.BulkInsert(dt_redcapforms, "redcap_form", "def");
            }
			return result;
        }
		public string SaveEventsToDB()
		{
			string result = "";
			if (dt_redcapevents.HasRows())
			{
				SQL_utils sql = new SQL_utils("data");
				result = sql.BulkInsert(dt_redcapevents, "redcap_form", "def");
			}
			return result;
		}
		public string SaveFormEventsToDB()
		{
			string result = "";
			if (dt_formevents.HasRows())
			{
				SQL_utils sql = new SQL_utils("data");

				string first_tokenid = dt_formevents.AsEnumerable().Select(f => f.Field<int>("tokenid")).First().ToString();
				string sql_del = String.Format("delete from def.REDCap_formevent where tokenid = {0}", first_tokenid);

				if (first_tokenid != "")
				{
					sql.NonQuery_from_SQLstring(sql_del);
					result = sql.BulkInsert(dt_formevents, "redcap_formevent", "def");
				}
			}
			return result;
		}

		public string SaveFieldsToDB()
		{
			string result = "";
			string result2 = "";
			if (dt_metadata.HasRows())
			{
				SQL_utils sql = new SQL_utils("data");

				string first_tokenid = dt_metadata.AsEnumerable().Select(f => f.Field<int>("tokenid")).First().ToString();

				if (first_tokenid != "")
				{
					string sql_n = String.Format("select count(*) from def.REDCap_fields where tokenid = {0}", first_tokenid);
					int nflds = sql.IntScalar_from_SQLstring(sql_n);

					if (nflds > 0)
					{
						string sql_del = String.Format("delete from def.REDCap_fields where tokenid = {0}", first_tokenid);
						sql.NonQuery_from_SQLstring(sql_del);
						result = String.Format("{0} records deleted from [redcap_fields]. ", nflds);
					}
					result2 = sql.BulkInsert(dt_metadata, "redcap_fields", "def");
				}
			}
			return String.Format("{0} {1}",result, result2);
		}

		public string CreateTableFromForm(string form)
        {
			string result = "";


			return result;
        }

		public string SaveFormDataToDB(string form)
        {

			DataTable dt_redcap = DataFromForm(form);
			dt_redcap = AddStudymeasToREDCapFormData(dt_redcap);

			SQL_utils sql = new SQL_utils("data");

			int studymeasid1 = dt_redcap.AsEnumerable().Select(f => f.Field<int>("studymeasid")).Min();
			int studymeasid2 = dt_redcap.AsEnumerable().Select(f => f.Field<int>("studymeasid")).Max();

			int measureid1 = sql.IntScalar_from_SQLstring("select measureid  from uwautism_research_backend..tblstudymeas where studymeasid=" + studymeasid1.ToString());
			int measureid2 = sql.IntScalar_from_SQLstring("select measureid  from uwautism_research_backend..tblstudymeas where studymeasid=" + studymeasid2.ToString());

			if(measureid1 == measureid2)
            {
				string tblname = sql.StringScalar_from_SQLstring(String.Format("select tblname from def.tbl where measureid={0}", measureid1));

				DataTable dt_db = DataImporter.EmptyDataTable(tblname, "dbo");

				List<string> redcap_colnames = dt_redcap.ColumnNames();

				foreach (DataRow row in dt_redcap.Rows)
				{

					int x = SaveRowToDB(sql, row);

				}


			}


			return "ok";
        }




		//private  DataRow PopulateRow(DataTable dt, DataRow source_row, List<string> source_colnames)
		//{
		//	DataRow row = dt.NewRow();

		//	try
		//	{
		//		for(int i=0; i < row.ItemArray.Length; i++)
		//		//foreach (Importfield fld in settings.fields)
		//		{
		//			fld.type = dt.Columns[fld.field].DataType.ToString();
		//			fld.basedate = basedate;
		//			if (fld.ConvertFromLabelToValue)
		//			{
		//				fld.valueset = settings.valuesets.Where(v => v.fieldvaluesetid == fld.fieldvaluesetID).First();
		//			}
		//			fld.AssignImportValueToProcess(source_row);



		//			string rowfield = fld.field;
		//			row[rowfield] = fld.ProcessedValue();


		//		}
		//		return row;
		//	}
		//	catch (Exception ex)
		//	{
		//		//some error
		//		return null;
		//	}
		
		//}


		//public void AddRow(bool has_id, DataTable dt, DataRow row)
		//{
		//	if (row != null)
		//	{
		//		if (has_id)
		//		{
		//			string row_id = row["id"].ToString();
		//			if (String.IsNullOrEmpty(row_id))
		//			{
		//				row["id"] = settings.ID;
		//			}
		//		}
		//		Debug.WriteLine(row["id"].ToString());
		//		dt.Rows.Add(row);
		//	}
		//}





		public int SaveRowToDB(SQL_utils sql, DataRow row)
        {
			int studymeasid = Convert.ToInt32(row["studymeasid"]);
			string tblname = sql.StringScalar_from_SQLstring(String.Format("select coalesce(tblname,'none') from def.tbl where measureid = (select measureid from uwautism_research_backend..tblstudymeas where studymeasid={0})", studymeasid));
			int x = 0;

			int n = CountValuesInRow( row);

			if (studymeasid > 0 & tblname != "none")
            {
				string code = String.Format("select count(*) from {0} where studymeasid={1} and id='{2}'", tblname, studymeasid, row["record_id"]);
				int nrows = sql.IntScalar_from_SQLstring(code);

				string msg;
				if (nrows > 0)
                {
					msg = String.Format(" YES ROW nrows:{0}  studymeasid={1} and id='{2}'  n_values: {3}", nrows, studymeasid, row["record_id"], n);
				}
				else
                {
					msg = String.Format(" NO ROW  nrows:{0}  studymeasid={1} and id='{2}'  n_values: {3}", nrows, studymeasid, row["record_id"], n);
				}

				Debug.WriteLine(msg);
			}

			return x;
        }

		#endregion

		public int CountValuesInRow(DataRow row)
        {
			int n = 0;
			for (int i = 0; i < row.ItemArray.Length; i++) 
            {
				//Debug.WriteLine(row.ItemArray[i]);
				if(row.ItemArray[i].ToString() != "") n++;
            }
			return n;
        }


		#region Fields 
		public string FieldsCSV(string formname)
		{

			//List<string> flds = api.MetaDataTable.AsEnumerable()
			List<string> flds = dt_metadata.AsEnumerable()
							.Where(f => f.Field<string>("form_name") == formname).Select(f => f.Field<string>("field_name")).ToList();

			flds.Remove(idfld);

			string flds_csv = String.Join(",", flds);
			flds_csv = flds_csv + "," + idfld;
			return flds_csv;

		}


		public string FieldsCSV(List<string> formnames)
		{
			List<string> flds = new List<string>();

			foreach (string formname in formnames)
			{
				List<string> tmp_flds = dt_metadata.AsEnumerable()
					.Where(f => f.Field<string>("form_name") == formname).Select(f => f.Field<string>("field_name")).ToList();

				tmp_flds.Remove(idfld);

				flds.AddRange(tmp_flds);
			}


			string flds_csv = String.Join(",", flds);
			flds_csv = idfld + ", " + flds_csv;
			return flds_csv;

		}





		public string FirstField(string formname)
		{

			//string fld = dt_metadata.AsEnumerable()
			//	.Where(f => f.Field<string>("form_name") == formname).Select(f => f.Field<string>("field_name")).First();

			string fld = dt_metadata.AsEnumerable()
				.Where(f => f.Field<string>("form_name") == formname && f.Field<string>("field_type") != "descriptive" ).Select(f => f.Field<string>("field_name")).First();

			return fld;
		}
		#endregion

		#region DataTables

		public DataTable DataFromAllForms(string formname)
		{

			return DataFromForms(new List<string> { formname });
		}


		public DataTable DataFromForm(string formname)
		{
			return DataFromForms(new List<string> { formname });
		}


		public DataTable DataFromForms(List<string> formnames)
		{
			string strRecordsSelect = "";
			//string strFilterLogic = "";
			string strFields = FieldsCSV(formnames);
			string strEvents = "";
			string strForms = "";
			bool boolLabels = false;
			bool boolAccessGroups = false;


			if(!strFields.Contains("redcap_repeat_instance,")) strFields = "redcap_repeat_instance," + strFields;
			if (!strFields.Contains("redcap_repeat_instrument,")) strFields = "redcap_repeat_instrument," + strFields;
			if (!strFields.Contains("redcap_event_name,")) strFields = "redcap_event_name," + strFields;
			if (!strFields.Contains("record_id,")) strFields = "record_id," + strFields;


			string firstfld = FirstField(formnames[0]);

			try
			{
				//DataTable dt = api.GetTableFromCSV(idfld, strRecordsSelect, strFilterLogic, stFields, strEvents, strForms, boolLabels, boolAccessGroups);
				//DataTable dt = api.GetTableFromCSV(idfld, strRecordsSelect, strFilterLogic, "", "", "", boolLabels, boolAccessGroups);
				//DataTable dt = api.GetTableFromAnyRC(idfld, strRecordsSelect, strFilterLogic, strFields, strEvents, strForms, boolLabels, boolAccessGroups);

				DataTable dt = api.GetTableFromAnyRC(firstfld, strRecordsSelect, strFields, strEvents, strForms, boolLabels, boolAccessGroups);

				//When only a single form is included, add the formname to the datatable
				if(formnames.Count==1)
                {
					DataColumn formcol = new DataColumn("form_name");
					formcol.DefaultValue = formnames[0];

					dt.Columns.Add(formcol);
                }

				// FIX?  dt.RenameColumn("id", "redcap_id");

				return dt;
			}
			catch (Exception ex)
			{
				return null;
			}
		}




		public bool IsREDCapMeasure(int studymeasID)
		{
			SQL_utils sql = new SQL_utils("data");
			int importfiletype = sql.IntScalar_from_SQLstring("select importfiletype from def.tbl where measureID=(select measureID from uwautism_research_backend..tblstudymeas where studymeasID=" + studymeasID.ToString() + ")");
			sql.Close();

			bool isREDCap = (importfiletype == (int)ImportFiletype.REDCap) ? true : false;
			return isREDCap;
		}

		public Datadictionary Datadictionary(string formname)
		{
			Datadictionary dict = Datadictionary(new List<string> { formname });
			return dict;
		}

		public Datadictionary Datadictionary(List<string> formnames)
		{
			DataTable dt_meta = dt_metadata.AsEnumerable().Where(f => formnames.Contains(f.Field<string>("form_name"))).CopyToDataTable();
			Datadictionary dict = new Datadictionary(dt_meta, formnames, _studyID);
			return dict;
		}

		#endregion


		#region Controls
		public ASPxComboBox cboFormSelector()
		{
			//if (api != null)
			if (dt_redcapforms.HasRows())
			{
				ASPxComboBox cbo = new ASPxComboBox();
				cbo.ID = "cboRedcapForms";
				cbo.ClientInstanceName = "cboRedcapForms";
				cbo.Caption = "REDCap Forms:";
				cbo.DataSource = dt_redcapforms;
				cbo.TextField = "instrument_label";
				cbo.ValueField = "instrument_name";
				cbo.NullText = String.Format("Available REDCap forms (N={0})", apiMeta.InstrumentDataTable.Rows.Count);
				cbo.Width = 300;
				cbo.DataBind();
				return cbo;
			}
			else
			{
				return null;
			}
		}

		public ASPxListBox lstFormSelector()
		{
			//if (api != null)
			if (dt_redcapforms.HasRows())
			{

				ASPxListBox lst = new ASPxListBox();
				lst.ID = "lstRedcapForms";
				lst.ClientInstanceName = "lstRedcapForms";
				lst.Caption = "All REDCap Forms:";
				lst.ValueType = typeof(string);
				lst.SelectionMode = ListEditSelectionMode.Multiple;
				lst.Width = 400;
				//lst.DataBind();

				foreach (DataRow row in dt_redcapforms.Rows)
				{
					ListEditItem itm = new ListEditItem();
					itm.Value = row["instrument_name"].ToString();
					itm.Text = row["instrument_name"].ToString();
					lst.Items.Add(itm);
				}


				return lst;
			}
			else
			{
				return null;
			}
		}


		public ASPxComboBox cboEventSelector()
		{
			//if (api != null)
			if (dt_redcapforms.HasRows())
			{
				ASPxComboBox cbo = new ASPxComboBox();
				cbo.ID = "cboRedcapEvents";
				cbo.ClientInstanceName = "cboRedcapEvents";
				cbo.Caption = "REDCap Events:";
				cbo.DataSource = redcapevents;
				//cbo.TextField = "unique_event_name";
				//cbo.ValueField = "unique_event_name";
				cbo.NullText = String.Format("Available REDCap events (N={0})", redcapevents.Count);
				cbo.Width = 300;
				cbo.DataBind();
				return cbo;
			}
			else
			{
				return null;
			}
		}




		public ASPxGridView gridFormEvents()
		{
			if(dt_formevents.HasRows())
			{
				string dataheader = String.Format("{0} (cols={1}, rows={2})", "Form-Events", dt_formevents.Columns.Count, dt_formevents.Rows.Count);

				ASPxGridView grid = new ASPxGridView();
				grid.ID = "gridFormEvents";
				grid.ClientInstanceName = "gridFormEvents";
				grid.Caption = dataheader;
				grid.AutoGenerateColumns = true;
				grid.SettingsBehavior.AllowGroup = true;
				grid.SettingsPager.PageSize = 200;
				grid.DataSource = dt_formevents;
				grid.DataBind();
				return grid;
			}
			else
			{
				return null;
			}
		}

		public ASPxGridView gridMetaData(string formname)
		{
			DataTable dt_meta;
			if (formname == null)
			{
				dt_meta = apiMeta.MetaDataTable;
			}
			else
			{
				DataTable dt = apiMeta.MetaDataTable;
				dt_meta = dt.AsEnumerable().Where(f => f.Field<string>("form_name") == formname).CopyToDataTable();
			}

			return gridMetaData(dt_meta, formname);
		}


		public ASPxGridView gridMetaData(List<string> formnames)
		{
			DataTable dt_meta;
			if (formnames == null)
			{
				dt_meta = dt_metadata;
			}
			else
			{
				dt_meta = dt_metadata.AsEnumerable().Where(f => formnames.Contains(f.Field<string>("form_name"))).CopyToDataTable();
			}

			return gridMetaData(dt_meta, String.Join(",", formnames));
		}



		public ASPxGridView gridMetaData(DataTable dt_meta, string title)
		{
			if (dt_meta.HasRows())
			{
				string dataheader = String.Format("{0} (cols={1}, rows={2})", title, dt_meta.Columns.Count, dt_meta.Rows.Count);

				ASPxGridView grid = new ASPxGridView();
				grid.ID = "gridMeta";
				grid.ClientInstanceName = "gridMeta";
				grid.Caption = dataheader;
				grid.Styles.HeaderPanel.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Left;
				grid.AutoGenerateColumns = true;
				grid.SettingsBehavior.AllowGroup = true;
				grid.SettingsPager.PageSize = 500;
				grid.DataSource = dt_meta;
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
			return gridDataFromForm(formname, false);
		}



		public ASPxGridView gridDataFromForm(string formname, bool addStudymeasID)
		{
			if (api != null)
			{
				DataTable dt = DataFromForm(formname);

				if (addStudymeasID)
				{
					dt = AddStudymeasToREDCapFormData(dt);
				}

				if (dt.HasRows())
				{
					string title = String.Format("{0} (cols={1}, rows={2})", formname, dt.Columns.Count, dt.Rows.Count);

					return gridMetaData(dt, title);
				}
			}
			return null;
		}


		public string SaveREDCapFormToDB(string formname)
        {

			DataTable dt = DataFromForm(formname);

			dt = AddStudymeasToREDCapFormData(dt);

			if (dt.HasRows())
			{

				foreach(DataRow row in dt.Rows)
                {
					Debug.WriteLine(String.Format("studymeasID:{0}  record_id:{1}", row["studymeasid"], row["record_id"] ));
                }

			}

			return "ok";
		}





	public ASPxGridView gridDataFromForm(List<string> formnames)
		{
			if (api == null)
			{
				GetAPIInfo();
			}

			if (api != null)
			{
				DataTable dt = DataFromForms(formnames);
				if (dt != null)
				{
					string forms = String.Join(",", formnames);
					string title = String.Format("{0} (cols={1}, rows={2})", forms, dt.Columns.Count, dt.Rows.Count);

					return gridDataFromForm(dt, title);
				}
			}
			return null;
		}



		public ASPxGridView gridDataFromForm(DataTable dt, string title)
		{
			if (api != null)
			{
				if (dt != null)
				{
					dataheader = String.Format("{0} (cols={1}, rows={2})", title, dt.Columns.Count, dt.Rows.Count);

					ASPxGridView grid = new ASPxGridView();
					grid.ID = "gridREDCapMeta";
					grid.ClientInstanceName = "gridREDCapMeta";
					grid.Caption = dataheader;
					grid.AutoGenerateColumns = true;
					grid.SettingsBehavior.AllowGroup = true;
					grid.Settings.HorizontalScrollBarMode = ScrollBarMode.Auto;
					grid.Width = 1150;
					grid.SettingsPager.PageSize = 20;
					grid.DataSource = dt;
					grid.DataBind();
					return grid;
				}
			}
			return null;
		}



		#endregion
	}


	//public class SampleCode
	//{

	//	// must be declared somewhere in code, or pulled from config file
	//	// RC URI and RC Token
	//	string strURI = "https://redcap.iths.org/api/";
	//	string strPostToken = "40ACFE0E609AECA842207964B1301275";

	//	// if pulling from web.config you could use the code below. i do this so i can easily switch between dev and production servers
	//	// by just using different config files
	//	//string strURI = ConfigurationManager.AppSettings["RCURI"];
	//	//string strPostToken = ConfigurationManager.AppSettings["RCToken"];

	//	//------------------------------
	//	//    // to get the above, this would be in your Web.config file in the <configuration> section.
	//	//    // sample shown in the Web.config file. Only if you want to do it this way.
	//	//  <appSettings>
	//	//    <add key="RCURI" value="YOUR_RC_API_URI" />
	//	//    <add key="RCToken" value="YOUR_RC_TOKEN" />
	//	//  </appSettings>
	//	//------------------------------



	//	// get any RC data. Need Token and strReturnCheck (to see if error in data returning). rest are optional
	//	// strRecordsSelect: any records you want separated by ','; all records if ""
	//	// strFields: Particular fields you want, separated by ','; all fields if ""
	//	// strEvents: Particular events you want, separated by ','; all events if ""
	//	// strForms: Particular forms you want, separated by ','; all forms if ""
	//	// boolLabels: false=raw; true=label
	//	// boolAccessGroups: false=no access group returned; true=access group returned (should be false, see note below)
	//	// (note: can't import access group column if in your data table; ontology fields at the moment can't be imported too)
	//	public DataTable GetTableFromAnyRC(string strPostToken, string strReturnCheck, string strRecordsSelect, string strFields,
	//		 string strEvents, string strForms, bool boolLabels, bool boolAccessGroups)
	//	{
	//		Debug.WriteLine("GetTableFromAnyRC()");

	//		string strRecord;
	//		CSVDoc csvDoc;
	//		string strPostParameters = "";
	//		int intReturnLength = strReturnCheck.Trim().Length;

	//		DataTable dtDataTable = new DataTable();
	//		DataRow drRecord;

	//		strPostParameters = "&content=record&format=csv&type=flat&eventName=unique";

	//		if (strReturnCheck == "")
	//		{
	//			throw new Exception("Error: " + "Must provide first field to check");
	//		}

	//		if (strRecordsSelect != "")
	//		{
	//			strPostParameters += "&records=" + strRecordsSelect;
	//		}

	//		if (strFields != "")
	//		{
	//			strPostParameters += "&fields=" + strFields;
	//		}

	//		if (strEvents != "")
	//		{
	//			strPostParameters += "&events=" + strEvents;
	//		}

	//		if (strForms != "")
	//		{
	//			strPostParameters += "&forms=" + strForms;
	//		}

	//		if (boolLabels)
	//			strPostParameters += "&rawOrLabel=label";
	//		else
	//			strPostParameters += "&rawOrLabel=raw";

	//		// probably should take out if you are going to import this exported data
	//		if (boolAccessGroups)
	//		{
	//			strPostParameters += "&exportDataAccessGroups=true";
	//		}

	//		byte[] bytePostData = Encoding.UTF8.GetBytes("token=" + strPostToken + strPostParameters);

	//		string strResponse = responseHTTP(bytePostData);

	//		// if no records found, there are no fields.  new in RC 6 and greater
	//		// have to deal with null DataTable in your call to this function
	//		// if Rc < 6, then it will return field names without any rows of data
	//		if (strResponse == "\n")
	//		{
	//			return (dtDataTable);
	//		}

	//		// should return the first field you expect. otherwise it is error
	//		if (strResponse.Substring(0, intReturnLength) != strReturnCheck)
	//		{
	//			throw new Exception("RC Error: " + strResponse);
	//		}

	//		csvDoc = new CSVDoc(strResponse);

	//		// first line of .csv is column names
	//		strRecord = csvDoc.ReadLine();

	//		// get column headers
	//		string[] strColumnHeaders = strRecord.Split(',');

	//		// set up table
	//		for (int i = 0; i < strColumnHeaders.Length; i++)
	//		{
	//			dtDataTable.Columns.Add(strColumnHeaders[i].ToString(), typeof(string));
	//		}

	//		// now read all data and assign to data table
	//		while ((strRecord = csvDoc.ReadLine()) != null)
	//		{
	//			CSVLine csvLine = new CSVLine(strRecord);

	//			drRecord = dtDataTable.NewRow();

	//			// now get fields
	//			for (int i = 0; i < strColumnHeaders.Length; i++)
	//			{
	//				drRecord[i] = csvLine.ReadField();
	//			}

	//			dtDataTable.Rows.Add(drRecord);
	//		}

	//		return (dtDataTable);
	//	}

	//	// will return a csv string to import, given a data table
	//	// if given any field string (like "studyid,redcap_event_name,field1,field2") will only put those fields in the csv string
	//	public string GetCSVFromTable(DataTable dtData, string strFields)
	//	{
	//		Debug.WriteLine("GetCSVFromTable()");

	//		string strCSVContents = "";

	//		int i = 0;
	//		int j = 0;

	//		try
	//		{
	//			string[] strFieldsArray = strFields.Split(',');

	//			//Write into csv format
	//			for (i = 0; i < dtData.Columns.Count; i++)
	//			{
	//				if (strFields == "")
	//				{
	//					if (i > 0)
	//						strCSVContents += ",";

	//					strCSVContents += dtData.Columns[i].ColumnName;
	//				}
	//				else
	//				{
	//					if (InArray(strFieldsArray, dtData.Columns[i].ColumnName))
	//					{
	//						if (i > 0)
	//							strCSVContents += ",";

	//						strCSVContents += dtData.Columns[i].ColumnName;
	//					}
	//				}
	//			}

	//			strCSVContents += "\n";

	//			for (i = 0; i < dtData.Rows.Count; i++)
	//			{
	//				for (j = 0; j < dtData.Columns.Count; j++)
	//				{
	//					if (strFields == "")
	//					{
	//						if (j > 0)
	//							strCSVContents += ",";

	//						// double quote all fields. replace any double quotes in field with escape clause.
	//						// this allows things like inches (") to be put in fields, or any quote marks
	//						strCSVContents += "\"" + dtData.Rows[i][j].ToString().Replace("\"", "\\\"") + "\"";
	//					}
	//					else
	//					{
	//						if (InArray(strFieldsArray, dtData.Columns[j].ColumnName))
	//						{
	//							if (j > 0)
	//								strCSVContents += ",";

	//							// double quote all fields. replace any double quotes in field with escape clause.
	//							// this allows things like inches (") to be put in fields, or any quote marks
	//							strCSVContents += "\"" + dtData.Rows[i][j].ToString().Replace("\"", "\\\"") + "\"";
	//						}
	//					}
	//				}

	//				strCSVContents += "\n";
	//			}
	//		}
	//		catch (Exception ex)
	//		{
	//			throw new Exception("RC Error: " + ex.Message.ToString(), ex);
	//		}

	//		return (strCSVContents);
	//	}

	//	// if value found in array, will return true
	//	private bool InArray(string[] strArray, string strText)
	//	{
	//		foreach (string strItem in strArray)
	//		{
	//			if (strItem == strText)
	//			{
	//				return true;
	//			}
	//		}
	//		return false;
	//	}

	//	// will import a csv string into RC. 
	//	// remember that ONLY data exported in 'raw' mode can be imported (I think 'label' will not work)
	//	public string RCImportCSVFlat(string strPostToken, string strCSVContents, bool boolOverwrite)
	//	{
	//		string strPostParameters = "&content=record&format=csv&type=flat&overwriteBehavior=overwrite&data=" + strCSVContents;
	//		if (boolOverwrite)
	//			strPostParameters += "&overwriteBehavior=overwrite";
	//		strPostParameters += "&data=" + strCSVContents;

	//		byte[] bytePostData = Encoding.ASCII.GetBytes("token=" + strPostToken + strPostParameters);

	//		string strResponse = responseHTTP(bytePostData);

	//		// error if more than 9999 records (this num could change, but is just what I tried), or most likely, just has an error message.
	//		if (strResponse.Length > 4)
	//		{
	//			throw new Exception("RC Error: " + strResponse);
	//		}

	//		return (strResponse);
	//	}

	//	// makes the API call and returns response from request
	//	private string responseHTTP(byte[] bytePostData)
	//	{
	//		Debug.WriteLine("responseHTTP()");
	//		string strResponse = "";

	//		try
	//		{
	//			// added for mono on unix server. should not need if don't have this environment
	//			// ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate,
	//			//                         X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };

	//			HttpWebRequest webreqRedCap = (HttpWebRequest)WebRequest.Create(strURI);

	//			webreqRedCap.Method = "POST";
	//			webreqRedCap.ContentType = "application/x-www-form-urlencoded";
	//			webreqRedCap.ContentLength = bytePostData.Length;

	//			// Get the request stream and read it
	//			Stream streamData = webreqRedCap.GetRequestStream();
	//			streamData.Write(bytePostData, 0, bytePostData.Length);
	//			streamData.Close();

	//			HttpWebResponse webrespRedCap = (HttpWebResponse)webreqRedCap.GetResponse();

	//			//Now, read the response (the string), and output it.
	//			Stream streamResponse = webrespRedCap.GetResponseStream();
	//			StreamReader readerResponse = new StreamReader(streamResponse);

	//			strResponse = readerResponse.ReadToEnd();
	//		}
	//		catch (WebException exWE)
	//		{
	//			Stream streamWE = exWE.Response.GetResponseStream();
	//			StringBuilder sbResponse = new StringBuilder("", 65536);

	//			try
	//			{
	//				byte[] readBuffer = new byte[1000];
	//				int intCnt = 0;

	//				for (; ; )
	//				{
	//					intCnt = streamWE.Read(readBuffer, 0, readBuffer.Length);

	//					if (intCnt == 0)
	//					{
	//						// EOF
	//						break;
	//					}

	//					sbResponse.Append(System.Text.Encoding.UTF8.GetString(readBuffer, 0, intCnt));
	//				}

	//			}
	//			finally
	//			{
	//				streamWE.Close();

	//				strResponse = sbResponse.ToString();
	//			}
	//		}
	//		catch (Exception ex)
	//		{
	//			strResponse = ex.Message.ToString();
	//			//throw new Exception ( "RC Error. " +  ex.Message.ToString(), ex);
	//		}

	//		return (strResponse);
	//	}

	//	//----------------------------------------------
	//	/// Sample GetData code. gives you an idea of how to use above functions
	//	public DataTable GetDataTableFromForm(string yourformname)
	//	{
	//		//tbResults.Text = "";

	//		DataTable dtRCTable = null;
	//		DataRow drTableRow;

	//		// say RC fields are: studyid, redcap_event_name, radio_button1
	//		// remember, check_boxes come back as check_box___0 , check_box___1, etc.
	//		string strField1 = "";
	//		string strField2 = "";
	//		string strField3 = "";

	//		try
	//		{
	//			// the call below will expect 'studyid' as the 1st field (or errors out), asks for all records, all fields, all events, from form 'yourformname, raw data, all access groups
	//			dtRCTable = GetTableFromAnyRC(strPostToken, "studyid", "", "", "", yourformname, false, false);

	//			for (int i = 0; i < dtRCTable.Rows.Count; i++)
	//			{
	//				// these will throw exceptions if the field name ("studyid") is not correct or not in the data returned
	//				// when putting in Data Tables, noticed that empty fields sometimes have &nbsp; in them, so change it to blank ""
	//				strField1 = dtRCTable.Rows[i]["studyid"].ToString().Trim().Replace("&nbsp;", "");
	//				strField2 = dtRCTable.Rows[i]["redcap_event_name"].ToString().Trim().Replace("&nbsp;", "");  // this call should be removed if not longitudinal
	//				strField3 = dtRCTable.Rows[i]["radio_button1"].ToString().Trim().Replace("&nbsp;", "");

	//				// do whatever with the three fields you wanted


	//			}

	//		}
	//		catch (Exception ex)
	//		{
	//			// whatever you want to do with exception
	//		}
	//		finally
	//		{
	//			// any actions needed here
	//		}

	//		return dtRCTable;
	//	}

	//	// sample SetData code.  gives you an idea of how to use the above functions
	//	public void SetData(DataTable dtData)
	//	{
	//		string strCSVContents = "";

	//		try
	//		{
	//			// makes a csv string from all columns in data table
	//			strCSVContents = GetCSVFromTable(dtData, "");

	//			// imports this csv string to RC using API, with overwrite
	//			RCImportCSVFlat(strPostToken, strCSVContents, true);

	//		}
	//		catch (Exception ex)
	//		{
	//			// whatever you want to do with exception
	//		}
	//		finally
	//		{
	//			// any actions needed here
	//		}
	//	}

	//}

}
