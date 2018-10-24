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

		public ImportFiletype importfiletype { get; set; }
		public char delimiter { get; set; }
		public int skipstartingrows { get; set; }
		public int rowstoprocess { get; set; }
		public char textqualifier { get; set; }
		public List<Importfield> fields { get; set; }

		public DataImportSettings(string input_ID, int input_studymeasID)
		{
			rowstoprocess = 100000;  //200;  //for testing set to 200
			ID = input_ID;
			studymeasID = input_studymeasID;

			fields = new List<Importfield>();

			PopulateImportSettingsFromDB(ID, studymeasID);
			AssignDelimiter();
		}
		public DataImportSettings(string input_ID, int input_studymeasID, int numrows)
		{
			ID = input_ID;
			studymeasID = input_studymeasID;
			rowstoprocess = numrows;

			fields = new List<Importfield>();

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



		private void PopulateImportSettingsFromDB(string ID, int studymeasID)
		{
			SQL_utils sql = new SQL_utils("data");
			
			DbEntityInstance studymeas = new DbEntityInstance(new DbEntity(DbEntityType.studymeas), studymeasID);
			measureID = studymeas.PkvalOfRelatedEntity(DbEntityType.measure);

			DataTable dt_meas = sql.DataTable_from_SQLstring("select * from def.tbl where measureID = " + measureID.ToString());


			DataRow trow = dt_meas.Rows[0];

			if (trow["skipstartingrows"] == DBNull.Value) skipstartingrows = 0;
			else skipstartingrows = Convert.ToInt32(trow["skipstartingrows"]) ;

			//Escape the double quote character
			char textqual = (trow["textqualifier"].ToString() == "\"") ? '\"' : Convert.ToChar(trow["textqualifier"].ToString());
			textqualifier = textqual;
			importfiletype = (ImportFiletype)Convert.ToInt32(trow["importfiletype"]);

			tblpk = Convert.ToInt32(trow["tblpk"]);
			tblname = trow["tblname"].ToString();

			string sqlcode = String.Format("select coalesce(max(indexnum),0) from uwautism_research_data..{0} where id='{1}' and studymeasID={2}", tblname, ID, studymeasID);
			Debug.WriteLine(sqlcode);
			int next_indexnum = sql.IntScalar_from_SQLstring(sqlcode);


			DataTable dt_fld = sql.DataTable_from_SQLstring("select * from def.fld where fldextractionmode is not null and tblpk = " + tblpk.ToString());

			fields.Add(new Importfield { field = "indexnum", mode = FieldExtractionMode.useConstString, constString = next_indexnum.ToString() });
			fields.Add(new Importfield { field = "ID", mode = FieldExtractionMode.useConstString, constString = ID });
			fields.Add(new Importfield { field = "studymeasID", mode = FieldExtractionMode.useConstString, constString = studymeasID.ToString() });
			fields.Add(new Importfield { field = "verified", mode = FieldExtractionMode.useConstString, constString = "1" });


			foreach (DataRow row in dt_fld.Rows)
			{
				string fldname = row["fldname"].ToString();
				fields.Add(new Importfield {
				      field = row["fldname"].ToString()
					, mode = ((FieldExtractionMode)Convert.ToInt32(row["fldextractionmode"])) 
					, importposition = Convert.ToInt32(row["importposition"])
					, constString = row["constString"].ToString()
				});
			}

		}



	}

	public class Importfield
	{
		public string field { get; set; }
		//public Type datatype { get; set; }
		public FieldExtractionMode mode { get; set; }
		public int importposition { get; set; }
		public string constString { get; set; }
		public Importfield() { }


		//public T CastIt<T>(object input)
		//{
		//	return (T)input;
		//}

		//public T ConvertIt<T>(object input)
		//{
		//	return (T)Convert.ChangeType(input, typeof(T));
		//}
	}


	public enum FieldExtractionMode
	{
		useImportPosition = 0,
		useImportPositionWithNext = 1,
		useConstString = 2,
		calcDayNum = 3,
		useMarkerString = 4
	}


	public enum ImportFiletype
	{
		csv = 0,
		txt = 1,
		xls = 2,
		xlsx = 3,
		tsv = 4,
		textlines = 5,
		actigraph = 6
	}

	public class ChunkMarker
	{
		public string text { get; set; }
		public int studymeasID { get; set; }
		public int linenumber_start { get; set; }
		public int linenumber_end { get; set; }
		public ChunkMarker() { }
	}

	public class ActigraphChunkMarkers : List<ChunkMarker>
	{

		public ActigraphChunkMarkers(int studymeasID)
		{
			SQL_utils sql = new SQL_utils("backend");
			int timepointID = sql.IntScalar_from_SQLstring("select timepointID from tblstudymeas where studymeasID=" + studymeasID.ToString());


			List<string> markers = new List<string>{
				 "-------------------- Subject Properties--------------------"
				,"----------------- Actiwatch Data Properties ----------------"
				,"--------------------- Analysis Inputs ----------------------"
				,"------------------------ Statistics ------------------------"
				,"--------------------- Marker/Score List --------------------"
				,"-------------------- Epoch-by-Epoch Data -------------------"
				};

			List<int> measureIDs = new List<int> { 4855, 4855, 4855, 3842, -1, 4853 };  //For now Marker/Score List not processed

			for(int i=0; i < markers.Count; i++)
			{
				string m = markers[i];
				int smID = (measureIDs[i] > 0) ? sql.IntScalar_from_SQLstring(
					String.Format("select studymeasID from tblstudymeas where measureID={0} and timepointID={1}"
					 , measureIDs[i], timepointID)) : -1;

				ChunkMarker cm = new ChunkMarker() { text = m, studymeasID = smID };
				this.Add(cm);
			}
			sql.Close();

		}

		public void PopulateIndices(List<string> textlines)
		{
			foreach (ChunkMarker cm in this)
			{
				int index = textlines.FindIndex(x => x.Contains(cm.text));
				cm.linenumber_start = index+1;  //add 1 so it is not zero indexed
			}
			for(int i=0; i < (this.Count - 1); i++)
			{
				this[i].linenumber_end = this[i+1].linenumber_start - 1;
			}

			this[(this.Count - 1)].linenumber_end = textlines.Count;
		}
	}


}