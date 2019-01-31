using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using GenericParsing;

namespace uwac
{ 
/// <summary>
/// Summary description for Importfield
/// </summary>


	public class Importfield
	{
		public string field { get; set; }
		public string type { get; set; }
		//public Type datatype { get; set; }
		public FieldExtractionMode mode { get; set; }
		public int importposition { get; set; }
		public string constString { get; set; }
		public bool ConvertFromLabelToValue { get; set; }
		public int fieldvaluesetID { get; set; }
		public object inputValueToProcess { get; set; }
		public object processedValue { get; set; }
		public DateTime? basedate { get; set; }
		public Valueset valueset { get; set; }

		public Importfield() { }

		public void AssignImportValueToProcess(GenericParser parser)
		{
			if (field == "indexnum")
			{
				inputValueToProcess = "0";
			}
			else if (mode == FieldExtractionMode.matchFldname)
			{
				inputValueToProcess = GetValue(parser, type, field);
			}
			else if (mode == FieldExtractionMode.useImportPosition)
			{
				inputValueToProcess = GetValue(parser, type, importposition);
			}
			else if (mode == FieldExtractionMode.useImportPositionWithNext)
			{
				string newvalue = String.Format("{0} {1}", parser[importposition], parser[importposition + 1]).Replace("\"", "");

				if (type.ToString() == "System.DateTime")
				{
					inputValueToProcess = RoundTime((DateTime)ConvertValue(type, newvalue, "none_useImportPositionWithNext"), RoundTo.HalfMinute);
				}
				else
				{
					inputValueToProcess = newvalue;
				}
			}
			else if (mode == FieldExtractionMode.useConstString)
			{
				inputValueToProcess = constString;
			}
			else if (mode == FieldExtractionMode.useMarkerString)
			{
				inputValueToProcess = constString;
			}
			else if (mode == FieldExtractionMode.calcDayNum)
			{
				string datetxt = parser[importposition].Replace("\"", "");
				DateTime thisdate = Convert.ToDateTime(datetxt);
				DateTime thisbasedate = (basedate != null) ? Convert.ToDateTime(basedate) : thisdate;
				int daynum = ((thisdate - thisbasedate).Days) + 1; //make the first day = 1
				inputValueToProcess = daynum;
			}
			else if (mode == FieldExtractionMode.useOtherFld)
			{
				if (ConvertFromLabelToValue)
				{

					string imported_label = GetValue(parser, "System.String", constString).ToString();
					int imported_value = valueset.ValueFromLabel(imported_label);

					inputValueToProcess = ConvertValue(type, (object)imported_value, "ConvertFromLabelToValue");
				}
				else
				{
					inputValueToProcess = GetValue(parser, type, constString);
				}
			}
			else if (mode == FieldExtractionMode.dateWithTimeZone)
			{
				string datetxt = GetValue(parser, type, constString).ToString();
				inputValueToProcess = DateWithTimeZone(datetxt);
			}
		}

		public void AssignImportValueToProcess(DataRow source_row)
		{
			if (field == "indexnum")
			{
				inputValueToProcess = "0";
			}
			else if (mode == FieldExtractionMode.matchFldname)
			{
				inputValueToProcess = GetValue(source_row, type, field);
			}
			else if (mode == FieldExtractionMode.useImportPosition)
			{
				inputValueToProcess = GetValue(source_row, type, importposition);
			}
			else if (mode == FieldExtractionMode.useImportPositionWithNext)
			{
				switch (type)
				{
					case "System.DateTime":
						inputValueToProcess = RoundTime(Convert.ToDateTime(
							String.Format("{0} {1}", source_row[importposition], source_row[importposition + 1]))
							, RoundTo.HalfMinute);
						break;
					default:
						inputValueToProcess = String.Format("{0} {1}", source_row[importposition], source_row[importposition + 1]);
						break;
				}

			}
			else if (mode == FieldExtractionMode.useConstString)
			{
				inputValueToProcess = constString;
			}
			else if (mode == FieldExtractionMode.useMarkerString)
			{
				inputValueToProcess = constString;
			}
			else if (mode == FieldExtractionMode.calcDayNum)
			{
				DateTime thisdate = Convert.ToDateTime(source_row[importposition]);

				DateTime thisbasedate = (basedate != null) ? Convert.ToDateTime(basedate) : thisdate;

				int daynum = ((thisdate - thisbasedate).Days) + 1; //make the first day = 1

				inputValueToProcess = daynum.ToString();

			}
			else if (mode == FieldExtractionMode.useOtherFld)
			{
				inputValueToProcess = GetValue(source_row, type, constString);
			}
			else if (mode == FieldExtractionMode.dateWithTimeZone)
			{
				string datetxt = GetValue(source_row, type, constString).ToString();
				inputValueToProcess = DateWithTimeZone(datetxt);
			}
		}

		public object ProcessedValue()
		{
			return ConvertValue(type, inputValueToProcess, "none_from_ProcessdValue");
			
		}



		#region process a specific VALUE
		public static object GetValue(GenericParser parser, string type, string colname)
		{
			object val = parser[colname];
			return ConvertValue(type, val, colname);
		}

		public static object GetValue(GenericParser parser, string type, int index)
		{
			object val = parser[index];
			return ConvertValue(type, val, "index=" + index.ToString());
		}

		public static object GetValue(DataRow row, string type, string colname)
		{
			object val = row[colname];
			return ConvertValue(type, val, colname);
		}
		
		public static object GetValue(DataRow row, string type, int index)
		{
			object val = row[index];
			return ConvertValue(type, val, "index=" + index.ToString());
		}



		public static object ConvertValue(string type, object val, string colname)
		{
			try
			{
				if (val != null)
				{
					string valtxt = val.ToString().ToLower().Replace("\"", "");
					if (valtxt == "" | valtxt == "na" | valtxt == "nan" | valtxt == "\"nan\"" | valtxt == "-9876")
					{
						return DBNull.Value;
					}
					else
					{
						switch (type)
						{
							case "System.Double":
								return Convert.ToDouble(valtxt);
							case "System.DateTime":
								return Convert.ToDateTime(valtxt);
							case "System.Int32":
								return Convert.ToInt32(valtxt);
							default:
								return val.ToString().Replace("\"", "");
						}
					}

				}
				else
				{
					return DBNull.Value;
				}
			}
			catch (Exception ex)
			{
				Debug.WriteLine("*** ERROR ************************************");
				Debug.WriteLine(String.Format("type='{0}' val='{1}' colname='{2}'", type, val.ToString(), colname));
				Debug.WriteLine(ex.Message);
				Debug.WriteLine("**********************************************");
				return DBNull.Value;
			}
		}

		public static DateTime DateWithTimeZone(string datetxt)
		{
			datetxt = datetxt.Replace(" America/Los_Angeles (-07)", "");
			datetxt = datetxt.Replace("T", " ");

			DateTime date = DateTime.Parse(datetxt);

			return date;
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
	


	#endregion


	//public T CastIt<T>(object input)
	//{
	//	return (T)input;
	//}

	//public T ConvertIt<T>(object input)
	//{
	//	return (T)Convert.ChangeType(input, typeof(T));
	//}



	public enum RoundTo
	{
		Second, HalfMinute, Minute, Hour, Day
	}

	public enum UpdateAfterInsertMode
	{
		ValFromStudymeasAndField = 0,
		ExtractFromListAllText = 1,
		ExtractOtherFromListAllText = 2,
		ValFromStudymeasAndFieldWithCalculation = 3,
	}

	public enum FieldExtractionMode
	{
		matchFldname = 0,
		useImportPosition = 1,
		useImportPositionWithNext = 2,
		useConstString = 3,
		calcDayNum = 4,
		useMarkerString = 5,
		useOtherFld = 6,
		UpdateAfterInsert = 7,
		dateWithTimeZone = 8
	}


	public enum ImportFiletype
	{
		csv = 0,
		txt = 1,
		xls = 2,
		xlsx = 3,
		tsv = 4,
		textlines = 5,
		actigraph = 6,
		REDCap = 7,
		SPSSsav = 8
	}

	public enum ImportTextqualifier
	{
		none = 0,
		doublequote = 1,
		singlequote = 2
	}



}