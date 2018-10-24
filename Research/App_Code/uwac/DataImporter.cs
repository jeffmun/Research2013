using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using SpreadsheetGear;
using SpreadsheetGear.Data;
using GenericParsing;
using uwac;
using System.Diagnostics;
using System.IO;

namespace uwac
{
	/// <summary>
	/// Summary description for ImportData
	/// </summary>
	public static class DataImporter
	{

	
		public static List<string> ReadLinesFromFiles(string filepath, string filename)
		{
			string myfilepath = filepath + filename;
			var logFile = File.ReadAllLines(myfilepath);
			var logList = new List<string>(logFile);
			return logList;
		}

		
		public static DataTable GetDataTableFromCSVFile(string filepath, string csvfilename, DataImportSettings settings)
		{
			DataTable dt = EmptyDataTable(settings.tblname);
			string myfilepath = filepath + csvfilename;

			using (GenericParser parser = new GenericParser())
			{
				parser.SetDataSource(myfilepath);

				parser.ColumnDelimiter = settings.delimiter;   //= "\t".ToCharArray();
				parser.FirstRowHasHeader = false;
				parser.SkipStartingDataRows = settings.skipstartingrows;
				parser.MaxBufferSize = 4096;
				parser.MaxRows = settings.rowstoprocess;
				parser.TextQualifier = settings.textqualifier;

				int counter = 0;
				while (parser.Read() ) //& counter < 100)
				{

					DataRow row = PopulateRow(dt, parser, settings);
					dt.Rows.Add(row);
					if (counter % 100 == 0)  Debug.WriteLine(counter);
					counter++;
				}

			}

			return dt;
		}



		public static DataTable GetDataTableFromText(string text, DataImportSettings settings)
		{
			DataTable dt = EmptyDataTable(settings.tblname);

			using (GenericParser parser = new GenericParser())
			{
				parser.SetDataSource(new StringReader(text));

				parser.ColumnDelimiter = settings.delimiter;   //= "\t".ToCharArray();
				parser.FirstRowHasHeader = false;
				parser.SkipStartingDataRows = settings.skipstartingrows;
				parser.MaxBufferSize = 4096;
				parser.MaxRows = settings.rowstoprocess;
				parser.TextQualifier = settings.textqualifier;

				int counter = 0;
				DateTime? basedate = null;

				bool usebasedate = false;
				int basedate_importpos = 0;
				foreach (Importfield fld in settings.fields)
				{
					if (fld.mode == FieldExtractionMode.calcDayNum)
					{
						usebasedate = true;
						basedate_importpos = fld.importposition;
					}
				}


				while (parser.Read()) //& counter < 100)
				{

					//CONDITIONS IN WHICH WE NEED TO TO SKIP THE ROW
					bool isSummaryRow = CheckForSummaryRow(parser, 0, settings.measureID);

					if (!isSummaryRow)
					{
						DataRow row = PopulateRow(dt, parser, settings, basedate);
						if (usebasedate & basedate == null)
						{
							basedate = Convert.ToDateTime(parser[basedate_importpos]);
						}
						if (row != null) dt.Rows.Add(row);
						if (counter % 100 == 0) Debug.WriteLine(counter);
						counter++;
					}
				}

			}

			return dt;
		}



		private static bool CheckForSummaryRow(GenericParser parser, int position_to_check, int measureID)
		{
			//For ActigraphStats (measureID 3842) skip row if the first position contains " Summary"
			if (measureID != 3842) return false;
			else {
				if (parser[position_to_check].Contains (" Summary")) return true;
			}
			return false;
		}

		private static bool CheckForExcludedRow(GenericParser parser, int position_to_check)
		{
			bool isExcluded = (parser[position_to_check] == "EXCLUDED") ? true : false;
			return isExcluded;
		}

		private static DataRow PopulateRow(DataTable dt, GenericParser parser, DataImportSettings settings)
		{
			DateTime? basedate = null;
			return PopulateRow(dt, parser, settings, basedate);
		}

		private static DataRow PopulateRow(DataTable dt, GenericParser parser,  DataImportSettings settings, DateTime? basedate)
		{
			DataRow row = dt.NewRow();
			bool printdebug = false;
			if (printdebug)
			{
				Debug.WriteLine("..........................................................");
				Debug.WriteLine("..........................................................");
				Debug.WriteLine("..........................................................");


				Debug.WriteLine("0 [{0}]   1 [{1}]   2 [{2}]   3 [{3}]", parser[0], parser[1], parser[2], parser[3]);
				Debug.WriteLine("delim [{0}]   txtqual [{1}]   ", settings.delimiter, settings.textqualifier);
				Debug.WriteLine("..........................................................");
			}

			bool isExcluded = false;
			if(settings.measureID == 4853) isExcluded = (CheckForExcludedRow(parser, 11)) ; //For ActigraphEpoch check column 11 for "EXCLUDED"


			if (isExcluded)
			{
				return null;	
			}
			else
			{
				foreach (Importfield fld in settings.fields)
				{
					string type = dt.Columns[fld.field].DataType.ToString();
					if (printdebug) Debug.WriteLine(String.Format("fld[{0}]  importpos[{1}] parservalue[{2}]", fld.field, fld.importposition, parser[fld.importposition]));
					if (fld.mode == FieldExtractionMode.useImportPosition)
					{
						if (parser[fld.importposition] == "" | parser[fld.importposition] == "NaN")
						{
							row[fld.field] = DBNull.Value;
						}
						else
						{
							switch (type)
							{
								case "System.Double":
									row[fld.field] = Convert.ToDouble(parser[fld.importposition]);
									break;
								case "System.DateTime":
									row[fld.field] = Convert.ToDateTime(parser[fld.importposition]);
									break;
								case "System.Int32":
									row[fld.field] = Convert.ToInt32(parser[fld.importposition]);
									break;
								default:
									row[fld.field] = parser[fld.importposition];
									break;
							}
						}

					}
					else if (fld.mode == FieldExtractionMode.useConstString | fld.mode == FieldExtractionMode.useMarkerString)
					{
						switch (type)
						{
							case "System.Double":
								row[fld.field] = Convert.ToDouble(fld.constString);
								break;
							case "System.DateTime":
								row[fld.field] = Convert.ToDateTime(fld.constString);
								break;
							default:
								row[fld.field] = fld.constString;
								break;
						}
					}
					else if (fld.mode == FieldExtractionMode.useImportPositionWithNext)
					{
						switch (type)
						{
							case "System.DateTime":
								row[fld.field] = RoundTime(Convert.ToDateTime(
									String.Format("{0} {1}", parser[fld.importposition], parser[fld.importposition + 1]))
									, RoundTo.HalfMinute);
								break;
							default:
								row[fld.field] = String.Format("{0} {1}", parser[fld.importposition], parser[fld.importposition + 1]);
								break;
						}

					}
					else if (fld.mode == FieldExtractionMode.calcDayNum)
					{
						DateTime thisdate = Convert.ToDateTime(parser[fld.importposition]);

						DateTime thisbasedate = (basedate != null) ? Convert.ToDateTime(basedate) : thisdate;

						int daynum = ((thisdate - thisbasedate).Days) + 1; //make the first day = 1

						row[fld.field] = daynum;

					}
				}
				return row;
			}

			
		}





		public static DataTable EmptyDataTable (string tblname)
		{
			SQL_utils sql = new SQL_utils("data");
			DataTable dt = sql.DataTable_from_SQLstring("select * from " + tblname + " where 1=2");
			sql.Close();
			return dt;
		}



		public static DateTime RoundTime(DateTime d, RoundTo rt)
		{
			DateTime dtRounded = new DateTime();

			switch (rt)
			{
				case RoundTo.Second:
					dtRounded = new DateTime(d.Year, d.Month, d.Day, d.Hour, d.Minute, d.Second);
					if (d.Millisecond >= 500) dtRounded = dtRounded.AddSeconds(1);
					break;
				case RoundTo.HalfMinute:
					dtRounded = new DateTime(d.Year, d.Month, d.Day, d.Hour, d.Minute, 0);
					if (d.Second >= 30) dtRounded = dtRounded.AddSeconds(30);
					break;
				case RoundTo.Minute:
					dtRounded = new DateTime(d.Year, d.Month, d.Day, d.Hour, d.Minute, 0);
					if (d.Second >= 30) dtRounded = dtRounded.AddMinutes(1);
					break;
				case RoundTo.Hour:
					dtRounded = new DateTime(d.Year, d.Month, d.Day, d.Hour, 0, 0);
					if (d.Minute >= 30) dtRounded = dtRounded.AddHours(1);
					break;
				case RoundTo.Day:
					dtRounded = new DateTime(d.Year, d.Month, d.Day, 0, 0, 0);
					if (d.Hour >= 12) dtRounded = dtRounded.AddDays(1);
					break;
			}

			return dtRounded;
		}

	}



	public enum RoundTo
	{
		Second, HalfMinute, Minute, Hour, Day
	}


	//public DataImporter()
	//{
	//	//
	//	// TODO: Add constructor logic here
	//	//
	//}

	//public DataSet FiletoDataTable(string filename)
	//{
	//	DataSet dset = new DataSet();

	//	string serverfilename =  HttpContext.Current.Server.MapPath(@"~/App_Data/DataUploads/" + filename);


	//	try
	//	{
	//		//dset =
	//		//SpreadsheetGear.Factory.GetWorkbook(serverfilename).GetDataSet(SpreadsheetGear.Data.GetDataFlags.NoColumnTypes);
	//		//dset = SpreadsheetGear.Factory.GetWorkbook(serverfilename).GetDataSet(SpreadsheetGear.Data.GetDataFlags.NoColumnTypes);


	//		//dset = SpreadsheetGear.Factory.GetWorkbook(serverfilename, CultureInfo.CurrentCulture).GetDataSet(SpreadsheetGear.Data.GetDataFlags.None);

	//		SpreadsheetGear.Factory

	//		dset = SpreadsheetGear.Factory.GetWorkbook(serverfilename, CultureInfo.CurrentCulture).Get(SpreadsheetGear.Data.GetDataFlags.None);


	//		if (fixcols)
	//		{
	//			//bool cleaned = FixXLColumnTypes(dset);
	//		}
	//	}
	//	catch (Exception ex)
	//	{
	//		string x = ex.Message;
	//		//ex.Message;
	//	}

	//	//dset = RemoveMissingValues_from_DataSet(dset);

	//	return dset;
	//}


}