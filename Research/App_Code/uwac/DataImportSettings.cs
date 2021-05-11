using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using uwac;

namespace uwac
{
	/// <summary>
	/// Summary description for DataImportSettings
	/// </summary>
	public class DataImportSettings
	{
		public int tblpk { get; set; }
		public string tblname { get; set; }
		public int measureID { get; set; }
		public int studymeasID { get; set; }
		public string ID { get; set; }
		public string markerstring { get; set; }
		public bool firstRowContainsFieldnames { get; set; }

		public ImportFiletype importfiletype { get; set; }
		public char delimiter { get; set; }
		public int skipstartingrows { get; set; }
		public int rowstoprocess { get; set; }
		public char textqualifier { get; set; }
		public List<Importfield> fields { get; set; }
		public List<Valueset> valuesets { get; set; }

		public bool needToCheckIndexnum { get; set; }

		public DataImportSettings(string input_ID, int input_studymeasID)
		{
			needToCheckIndexnum = true;
			rowstoprocess =  200000;  //200;  //for testing set to 200
			ID = input_ID;
			studymeasID = input_studymeasID;

			fields = new List<Importfield>();
			valuesets = new List<Valueset>();

			PopulateImportSettingsFromDB(ID, studymeasID);
			AssignDelimiter();
		}
		public DataImportSettings(string input_ID, int input_studymeasID, int numrows)
		{
			needToCheckIndexnum = true;

			ID = input_ID;
			studymeasID = input_studymeasID;
			rowstoprocess = numrows;

			fields = new List<Importfield>();
			valuesets = new List<Valueset>();

			PopulateImportSettingsFromDB(ID, studymeasID);
			//PopulateImportSettings(ID, studymeasID);
			AssignDelimiter();
		}

		private void AssignDelimiter()
		{
			if (this.importfiletype == ImportFiletype.csv) this.delimiter = ',';
			else if (this.importfiletype == ImportFiletype.actigraph) this.delimiter = ',';
			else if (this.importfiletype == ImportFiletype.tsv) this.delimiter = '\t';
		}

		private char AssignTextqualifier(ImportTextqualifier myqualifer)
		{
			if (myqualifer == ImportTextqualifier.doublequote) return '\"';
			else if (myqualifer == ImportTextqualifier.singlequote) return '\'';
			//else if (myqualifer == ImportTextqualifier.none) this.textqualifier = new char();
			return new char();
		}



		private void PopulateImportSettingsFromDB(string ID, int studymeasID)
		{
			Debug.WriteLine("***PopulateImportSettingsFromDB ***");
			SQL_utils sql = new SQL_utils("data");
			
			DbEntityInstance studymeas = new DbEntityInstance(new DbEntity(DbEntityType.studymeas), studymeasID);
			measureID = studymeas.PkvalOfRelatedEntity(DbEntityType.measure);

			DataTable dt_meas = sql.DataTable_from_SQLstring("select * from def.tbl where measureID = " + measureID.ToString());


			DataRow trow = dt_meas.Rows[0];

			if (trow["skipstartingrows"] == DBNull.Value) skipstartingrows = 0;
			else skipstartingrows = Convert.ToInt32(trow["skipstartingrows"]) ;

			int textqualifiercode = (trow["skipstartingrows"] == DBNull.Value) ? 0 : Convert.ToInt32(trow["skipstartingrows"]);

			if (trow["firstrowcontainsfldnames"] == DBNull.Value | trow["firstrowcontainsfldnames"].ToString() == "0") firstRowContainsFieldnames = false;
			else if (trow["firstrowcontainsfldnames"].ToString() == "1") firstRowContainsFieldnames = true;

			textqualifier = AssignTextqualifier((ImportTextqualifier)textqualifiercode);
			importfiletype = (ImportFiletype)Convert.ToInt32(trow["importfiletype"]);


			tblpk = Convert.ToInt32(trow["tblpk"]);
			tblname = trow["tblname"].ToString();

			int next_indexnum = 1;
			if (!ID.StartsWith("Multiple "))
			{
				string sqlcode = String.Format("select coalesce(max(indexnum),0) from uwautism_research_data..{0} where id='{1}' and studymeasID={2}", tblname, ID, studymeasID);
				Debug.WriteLine(sqlcode);
				next_indexnum = sql.IntScalar_from_SQLstring(sqlcode);
			}

			DataTable dt_fld = sql.DataTable_from_SQLstring("select * from def.fld where fldextractionmode is not null and tblpk = " + tblpk.ToString());

			fields.Add(new Importfield { field = "indexnum", mode = FieldExtractionMode.useConstString, constString = next_indexnum.ToString() });
			//fields.Add(new Importfield { field = "ID", mode = FieldExtractionMode.useConstString, constString = ID });
			fields.Add(new Importfield { field = "studymeasID", mode = FieldExtractionMode.useConstString, constString = studymeasID.ToString() });
			fields.Add(new Importfield { field = "verified", mode = FieldExtractionMode.useConstString, constString = "1" });

			Debug.WriteLine("*** == > Begin looping through rows ***");



			foreach (DataRow row in dt_fld.Rows)
			{
				string fldname = row["fldname"].ToString();
				Importfield impfld = new Importfield();
				impfld.field = row["fldname"].ToString();
				impfld.mode = ((FieldExtractionMode)Convert.ToInt32(row["fldextractionmode"]));
				if (row["importposition"] != DBNull.Value) impfld.importposition = Convert.ToInt32(row["importposition"]);
				if (row["constString"] != DBNull.Value) impfld.constString = row["constString"].ToString();
				impfld.ConvertFromLabelToValue = (row["ConvertFromLabelToValue"].ToString() == "1") ? true : false;
				if(row["fieldvaluesetID"] != DBNull.Value) impfld.fieldvaluesetID = Convert.ToInt32(row["fieldvaluesetID"].ToString());
				fields.Add(impfld);
			}
			Debug.WriteLine("*** == > End looping through rows ***");

			PopulateValueSets(tblpk);
		}


		private void PopulateValueSets(int tblpk)
		{

			SQL_utils sql = new SQL_utils("data");

			DataTable dt_valsets = sql.DataTable_from_SQLstring("select fldname, fieldvaluesetID from def.fld where ConvertFromLabelToValue=1 and tblpk=" + tblpk.ToString());

			List<int> valsetIDs = dt_valsets.AsEnumerable().Select(f => f.Field<int>("fieldvaluesetID")).Distinct().ToList();

			foreach(int valsetID in valsetIDs)
			{
				Valueset valset = new Valueset(valsetID);
				if (valset != null) valuesets.Add(valset);
			}

		}


	}



}