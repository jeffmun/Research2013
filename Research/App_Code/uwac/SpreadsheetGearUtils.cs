using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using SpreadsheetGear;
using SpreadsheetGear.Data;
using uwac;

	/// <summary>
	/// Summary description for SpreadshetGearUtils
	/// </summary>
	public class SpreadsheetGearUtils
	{
		//Sales Receipt #: 00206256 , 10/28/2015 
		
		
		//license number: 21003-FBF3C4-FCB7C


		public SpreadsheetGearUtils()
		{

		}

		public static DataSet GetDataSet(string excelfile)
		{
			DataSet dset = GetDataSet(excelfile, false, true);
			return dset;
		}

		public static DataSet GetDataSet(string excelfile, bool usepathDataDownloads)
		{
			DataSet dset = GetDataSet(excelfile, false, false);
			return dset;
		}


	public static DataSet GetDataSet(string excelfile, bool fixcols, bool usepathDataDownloads)
		{
			DataSet dset = new DataSet();

			string serverfilename = (usepathDataDownloads) ? HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/" + excelfile) :
					excelfile;


		try
			{
				//dset =
				//SpreadsheetGear.Factory.GetWorkbook(serverfilename).GetDataSet(SpreadsheetGear.Data.GetDataFlags.NoColumnTypes);
				//dset = SpreadsheetGear.Factory.GetWorkbook(serverfilename).GetDataSet(SpreadsheetGear.Data.GetDataFlags.NoColumnTypes);

				
				dset = SpreadsheetGear.Factory.GetWorkbook(serverfilename, CultureInfo.CurrentCulture).GetDataSet(SpreadsheetGear.Data.GetDataFlags.None);

				if (fixcols)
				{
					//bool cleaned = FixXLColumnTypes(dset);
				}
			}
			catch(Exception ex)
			{
				string x = ex.Message;
			//ex.Message;
			}

			//dset = RemoveMissingValues_from_DataSet(dset);

			return dset;
		}


		public static void Serialize(DataSet ds, Stream stream)
		{
			BinaryFormatter serializer = new BinaryFormatter();
			serializer.Serialize(stream, ds);
		}



		public static bool SaveDataSet_to_BinaryFile(DataSet ds, string filename)
		{
			try
			{
				ds.RemotingFormat = SerializationFormat.Binary;

				string bin_filename = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/" + filename + ".bin");

				FileStream fs = new FileStream(bin_filename, FileMode.Create);
				BinaryFormatter fmt = new BinaryFormatter();
				fmt.Serialize(fs, ds);
				fs.Close();
				return true;
			}
			catch (Exception ex)
			{
				string msg = ex.Message;
				return false;
			}
		}

		public static DataSet GetDataSet_bin(string excelfile)
		{
			DataSet dset = new DataSet();
			try
			{
				string bin_filename = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/" + excelfile.Replace(".xlsx", ".bin"));
				FileStream stream = new FileStream(bin_filename, FileMode.Open);
				BinaryFormatter serializer = new BinaryFormatter();
				dset = (DataSet)serializer.Deserialize(stream);
				stream.Close();
			}
			catch (Exception ex)
			{
				string x = ex.Message;
			}
			return dset;

		}

		public static DataSet GetDataSet_xsd(string excelfile)
		{
			DataSet dset = new DataSet();
			DataSet dset_xl = new DataSet();


			string serverfilename = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/" + excelfile);

			string schemafilename = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/" + excelfile.Replace("xlsx","xsd"));



			try
			{

				dset.ReadXmlSchema(schemafilename);

				//dset =
				//SpreadsheetGear.Factory.GetWorkbook(serverfilename).GetDataSet(SpreadsheetGear.Data.GetDataFlags.NoColumnTypes);
				dset_xl = SpreadsheetGear.Factory.GetWorkbook(serverfilename).GetDataSet(SpreadsheetGear.Data.GetDataFlags.NoColumnTypes);

				foreach(DataTable dt in dset_xl.Tables)
				{
					dset.Merge(dt);
				}


				//int x = 1;
				//if (false)
				//{
				//    //bool cleaned = FixXLColumnTypes(dset);
				//}
				//int y = 2;
			}
			catch (Exception ex)
			{
				string x = ex.Message;
				//ex.Message;
			}

			

			return dset;
		}




		public static bool ChangeDatesToString(DataTable dt)
		{
			try
			{
				for (int i = 0; i < dt.Columns.Count; i++)
				{
					DataColumn col = dt.Columns[i];
					if (col.DataType == typeof(DateTime))
					{
						SpreadsheetGearUtils.ChangeColumnDataType(dt, col.ColumnName, typeof(string));
					}
				}
			}
			catch (Exception)
			{
				return false;
			}
			return true;
		}

		public static bool ChangeColumnDataType(DataTable table, string columnname, Type newtype)
		{
			if (table.Columns.Contains(columnname) == false)
				return false;

			DataColumn column = table.Columns[columnname];
			if (column.DataType == newtype)
				return true;

			try{
				DataColumn newcolumn = new DataColumn("temporary", newtype);
				table.Columns.Add(newcolumn);

				foreach (DataRow row in table.Rows){
					try{
						row["temporary"] = Convert.ChangeType(row[columnname], newtype);
					}
					catch{}
				}
				newcolumn.SetOrdinal(column.Ordinal);
				table.Columns.Remove(columnname);
				newcolumn.ColumnName = columnname;
			}
			catch (Exception){
				return false;
			}

			return true;
		}



		public static bool FixXLDates(DataSet ds)
		{
			try
			{
				DataTable dtdict = ds.Tables["DataDict"];

				DataView dv = dtdict.AsDataView();

				dv.RowFilter = "DataType = 'date'";

				DataTable dtdict2 = dv.ToTable();


				for (int i = 0; i < dtdict2.Rows.Count; i++)
				{
					DataRow row = dtdict2.Rows[i];
					string measname = row["measname"].ToString();
					string varname = row["varname"].ToString();
					string DataType = row["DataType"].ToString();

					if (DataType == "date")
					{
						SpreadsheetGearUtils.FixXLColumnDatatype(ds.Tables[measname], varname, typeof(DateTime));
					}
					else if(DataType == "numeric")
					{
						SpreadsheetGearUtils.FixXLColumnDatatype(ds.Tables[measname], varname, typeof(Double));
					}
				}
			}
			catch (Exception)
			{
				return false;
			}
			return true;
		}

		public static bool FixXLdate(DataTable table, string columnname)
		{
			Type newtype = typeof(DateTime);

			if (table.Columns.Contains(columnname) == false)
				return false;

			DataColumn column = table.Columns[columnname];
			if (column.DataType == newtype)
				return true;

			try
			{
				DataColumn newcolumn = new DataColumn("temporary", newtype);
				table.Columns.Add(newcolumn);

				foreach (DataRow row in table.Rows)
				{
					try
					{
						DateTime new_date = DateTime.FromOADate(Convert.ToInt32(row[columnname]));
						row["temporary"] = new_date;
					}
					catch { }
				}
				newcolumn.SetOrdinal(column.Ordinal);
				table.Columns.Remove(columnname);
				newcolumn.ColumnName = columnname;
			}
			catch (Exception)
			{
				return false;
			}

			return true;
		}


		public static bool FixXLColumnTypes(DataSet ds)
		{
			try
			{
				DataTable dtdict = ds.Tables["DataDictionary"];


				DataView dv = dtdict.AsDataView();

				dv.RowFilter = "DataType NOT IN ( 'text','varchar','char','string')";

				DataTable dtdict2 = dv.ToTable();


				for (int i = 0; i < dtdict2.Rows.Count; i++)
				{
					DataRow row = dtdict2.Rows[i];
					string measname = row["measname"].ToString();
					string varname = row["varname"].ToString();
					string DataType = row["DataType"].ToString().ToLower();

					if (measname.StartsWith("IntHx_by_TYPE")) measname = "IntHx_by_TYPE";

					if (measname != "IntHx_by_TYPE")
					{
						if (DataType == "date")
						{
							SpreadsheetGearUtils.FixXLColumnDatatype(ds.Tables[measname], varname, typeof(DateTime));
						}
						else //if (DataType == "numeric")
						{
							SpreadsheetGearUtils.FixXLColumnDatatype(ds.Tables[measname], varname, typeof(Double));
							if (measname == "IntHx_by_TYPE") //also do the other 2 IntHx tables
							{
								SpreadsheetGearUtils.FixXLColumnDatatype(ds.Tables["IntHx_by_CAT"], varname, typeof(Double));
								SpreadsheetGearUtils.FixXLColumnDatatype(ds.Tables["IntHx_by_ALL"], varname, typeof(Double));
							}
						}
					}
				}
			}
			catch (Exception)
			{
				return false;
			}
			return true;
		}


		public static bool FixXLColumnDatatype(DataTable table, string columnname, Type newtype)
		{
			if (table.Columns.Contains(columnname) == false)
				return false;

			DataColumn column = table.Columns[columnname];
			if (column.DataType == newtype)
				return true;

			try
			{
				DataColumn newcolumn = new DataColumn("temporary", newtype);
				table.Columns.Add(newcolumn);

				foreach (DataRow row in table.Rows)
				{
					try
					{
						if(newtype == typeof(Double))
						{
							Double new_double = Convert.ToDouble(row[columnname]);
							row["temporary"] = new_double;
						}
						else if (newtype == typeof(DateTime))
						{
							DateTime new_date = DateTime.FromOADate(Convert.ToInt32(row[columnname]));
							row["temporary"] = new_date;
						}
					}
					catch { }
				}
				newcolumn.SetOrdinal(column.Ordinal);
				table.Columns.Remove(columnname);
				newcolumn.ColumnName = columnname;
			}
			catch (Exception)
			{
				return false;
			}

			return true;
		}


	public static bool FixXLColumnTypes(DataTable dt, DataTable dtdict)
	{
		try
		{
			DataView dv = dtdict.AsDataView();

			dv.RowFilter = "DataType NOT IN ( 'text','varchar','char','string')";

			DataTable dtdict2 = dv.ToTable();

			SpreadsheetGearUtils.FixXLColumnDatatype(dt, "id", typeof(String));

			for (int i = 0; i < dtdict2.Rows.Count; i++)
			{
				DataRow row = dtdict2.Rows[i];
				string measname = row["measname"].ToString();
				string varname = row["varname"].ToString();
				string DataType = row["DataType"].ToString().ToLower();

				List<string> skipvars = new List<string> { "id", "txgrp", "txstyle", "txintensity", "timept", "group" };

				if (skipvars.Contains(varname))
				{
					//do nothing
				}
				else if (DataType == "char" || DataType == "varchar" || DataType == "nvarchar")
				{
					//do nothing
				}
				else if (DataType == "date" || DataType == "smalldatetime" || DataType == "datetime")
				{
					DataColumn col = dt.Columns[varname];
					if (col != null)
					{
						var coltype = dt.Columns[varname].DataType;
						if (coltype.Name == "String")
						{
							SpreadsheetGearUtils.FixXLColumnDatatype(dt, varname, typeof(DateTime));
						}
					}
				}
				else //if (DataType == "numeric")
				{
					DataColumn col = dt.Columns[varname];
					if (col != null)
					{
						var coltype = dt.Columns[varname].DataType;
						if (coltype.Name == "String")
						{
							SpreadsheetGearUtils.FixXLColumnDatatype(dt, varname, typeof(Double?));
						}
					}
				}
			}
		}
		catch (Exception)
		{
			return false;
		}
		return true;
	}



	public static bool SaveDataSet_To_XML(DataSet ds, string filename)
		{
			try
			{
				string xmlSchema = ds.GetXmlSchema();
				string schema_filename = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/" + filename + ".xsd");
				File.WriteAllText(schema_filename, xmlSchema);

				//string xml = ds.GetXml();
				//string xml_filename = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/" + filename + ".xml");
				//File.WriteAllText(xml_filename, xml);
				return true;
			}
			catch(Exception ex) {
				string x = ex.Message;
				return false;
			}

		}



		public static void SaveDataTableToExcel(DataTable dt, string filename)
		{
			SaveDataTableToExcel(dt, filename, true, "xlsx");
		}

		public static void SaveDataTableToExcel(DataTable dt, string filename, string filetype)
		{
			SaveDataTableToExcel(dt, filename, true, filetype);
		}
		

		public static void SaveDataTableToExcel(DataTable dt, string filename, bool returnFileToClient, string filetype)
		{

			DataSet dset = new DataSet();

			if (dt.TableName == "")
			{
				dt.TableName = "Sheet1";
			}

			dset.Tables.Add(dt);

			SaveDataSetToExcel(dset, filename, returnFileToClient, filetype);

			if (dt.Rows.Count > 0)
			{
			}
		}


		public static void SaveDataSetToExcel(DataSet dset, string filename )
		{

			SaveDataSetToExcel(dset, filename, true, "xlsx");
		
		}

		public static void SaveDataSetToExcel(DataSet dset, string filename, bool returnFileToClient, string filetype )
		{

			// Create a new workbook.
			SpreadsheetGear.IWorkbook workbook = SpreadsheetGear.Factory.GetWorkbook();
			workbook.WorkbookSet.Experimental = "OleDbOpenXmlWorkaround";
			int counter = 0;
			foreach (DataTable dt in dset.Tables)
			{
				ChangeDatesToString(dt);

				counter++;

				if(counter > 1) workbook.Worksheets.Add();

				IWorksheet worksheet = workbook.Worksheets["Sheet" + counter.ToString()];
				IRange cells = worksheet.Cells;
				// Set the worksheet name.
				if (dt.TableName.Length > 31) worksheet.Name = dt.TableName.Substring(0, 31);
				else worksheet.Name = dt.TableName;

				// Get the top left cell for the DataTable.
				SpreadsheetGear.IRange range = worksheet.Cells["A1"];

				// Copy the DataTable to the worksheet range.
				range.CopyFromDataTable(dt, SpreadsheetGear.Data.SetDataFlags.None);

				cells["1:1"].Font.Bold = true;

				worksheet.UsedRange.EntireColumn.AutoFit();

			}

			string user = System.Security.Principal.WindowsIdentity.GetCurrent().Name.ToString().Replace(@"AUTISM\", "");



			string serverfilename = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/" + filename + "." + filetype);

			if (filetype == "xlsx")
			{
				#region Add the fileinfo sheet

				workbook.Worksheets.Add();
				int idx = workbook.Worksheets.Count - 1;
				IWorksheet infows = workbook.Worksheets[idx];
				IRange infocells = infows.Cells;
				infows.Name = "fileinfo";
				infocells["A1"].Formula = "Attribute";
				infocells["A2"].Formula = "FileName:";
				infocells["A3"].Formula = "Created:";
				infocells["A4"].Formula = "Created By:";
				infocells["A5"].Formula = "Source page:";

				infocells["B1"].Formula = "Value";
				infocells["B2"].Formula = filename;
				infocells["B3"].Formula = " " + System.DateTime.Now.ToString();
				infocells["B4"].Formula = user;
				infocells["B5"].Formula = System.IO.Path.GetFileName(HttpContext.Current.Request.Url.ToString()); ;


				if (filename.StartsWith("Proj_"))
				{
					infocells["A6"].Formula = "Data Project #:";
					infocells["B6"].Formula = filename.Substring(4, 4).Replace("_", "");
				}


				#endregion

				workbook.SaveAs(serverfilename, FileFormat.OpenXMLWorkbook);


				if (returnFileToClient)
				{
					// Stream the Excel spreadsheet to the client in a format
					// compatible with Excel 97/2000/XP/2003/2007/2010.
					HttpContext.Current.Response.Clear();
					HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
					HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + filename + "." + filetype);
					workbook.SaveToStream(HttpContext.Current.Response.OutputStream, SpreadsheetGear.FileFormat.OpenXMLWorkbook);
					HttpContext.Current.Response.End();
				}

			}
			else if(filetype=="csv")
			{
				workbook.SaveAs(serverfilename, FileFormat.CSV);


				if (returnFileToClient)
				{
					// Stream the Excel spreadsheet to the client in a format
					// compatible with Excel 97/2000/XP/2003/2007/2010.
					HttpContext.Current.Response.Clear();
					HttpContext.Current.Response.ContentType = "application/text";
					HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + filename + "." + filetype);
					workbook.SaveToStream(HttpContext.Current.Response.OutputStream, SpreadsheetGear.FileFormat.CSV);
					HttpContext.Current.Response.End();
				}
			}
			//string serverfilename2 = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/" + filename + ".xls");            
			//workbook.SaveAs(serverfilename2, FileFormat.Excel8);


		}


		public static void SaveDataTableToFile(DataTable dt, string filename, string format)
		{
			SaveDataTableToFile( dt,  filename,  format, false);
		}


		public static void SaveDataTableToFile(DataTable dt, string filename, string format, bool isNDARdata)
		{
			//
			// TODO: Add constructor logic here
			//

			// Create a new workbook.
			SpreadsheetGear.IWorkbook workbook = SpreadsheetGear.Factory.GetWorkbook();
			int counter = 0;

			counter++;

			if (counter > 1) 
					
			workbook.Worksheets.Add();

			IWorksheet worksheet = workbook.Worksheets["Sheet" + counter.ToString()];
			IRange cells = worksheet.Cells;
			// Set the worksheet name.
			if (dt.TableName.Length > 31) worksheet.Name = dt.TableName.Substring(0, 31);
			else if (dt.TableName != "") worksheet.Name = dt.TableName;
			else worksheet.Name = "Sheet1";

			// Get the top left cell for the DataTable.
			SpreadsheetGear.IRange range = worksheet.Cells["A1"];

			// Copy the DataTable to the worksheet range.
			range.CopyFromDataTable(dt, SpreadsheetGear.Data.SetDataFlags.None);

			cells["1:1"].Font.Bold = true;


			string user = System.Security.Principal.WindowsIdentity.GetCurrent().Name.ToString().Replace(@"AUTISM\", "");
			

			if (format == "Excel")
			{
				string serverfilename = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDump/" + filename + ".xlsx");

				workbook.SaveAs(serverfilename, FileFormat.OpenXMLWorkbook);


				// Stream the Excel spreadsheet to the client in a format
				// compatible with Excel 97/2000/XP/2003/2007/2010.
				HttpContext.Current.Response.Clear();
				HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
				HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + filename + ".csv");
				workbook.SaveToStream(HttpContext.Current.Response.OutputStream, SpreadsheetGear.FileFormat.OpenXMLWorkbook);
				HttpContext.Current.Response.End();
			}
			else if (format == "CSV" | format == "csv")
			{
				string serverfilename = HttpContext.Current.Server.MapPath(@"~/App_Data/DataDump/" + filename + ".csv");


				if (isNDARdata)
				{
					//ADD The ShortName in the first row if this is an NDAR data file
					// Use SaveToMemory(...) to get a byte array copy of the range data in the CSV format.
					string dataRangeStr = Encoding.ASCII.GetString(workbook.SaveToMemory(FileFormat.CSV));

					string datafileheader = dt.TableName.Substring(0, (dt.TableName.Length - 2)) + "," + dt.TableName.Substring(dt.TableName.Length - 1, 1);


					// Prepend "header" text of the NDAR shortName and a linefeed to the rest of the CSV file.
					string csvString = datafileheader + "\r\n" + dataRangeStr;

					// Send to output stream
					HttpContext.Current.Response.Clear();
					HttpContext.Current.Response.ContentType = "text/csv";
					HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + filename + ".csv");
					HttpContext.Current.Response.Write(csvString);
					HttpContext.Current.Response.End();

				}
				
				else
				{
				workbook.SaveAs(serverfilename, FileFormat.CSV);
				HttpContext.Current.Response.Clear();
				HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
				HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + filename + ".csv");
				workbook.SaveToStream(HttpContext.Current.Response.OutputStream, SpreadsheetGear.FileFormat.CSV);
				HttpContext.Current.Response.End();
				}
			}
			else if (format == "IBISVine" )
			{
				//string filepath = @"\\autism-fs03\shared files\R drive\IBIS-2\Vineland_Uploads\"; 

				//string serverfilename = filepath  + filename ;
				string serverfilename = filename;

					//workbook.SaveAs(serverfilename, FileFormat.UnicodeText);
				HttpContext.Current.Response.Clear();
				HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
				HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + filename + ".csv");
				workbook.SaveToStream(HttpContext.Current.Response.OutputStream, SpreadsheetGear.FileFormat.CSV);
				HttpContext.Current.Response.End();
			}


		}

	
		public static void Save_xls_from_xlsx(string filexlsx)
		{

			IWorkbook wb = SpreadsheetGear.Factory.GetWorkbook(HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/" + filexlsx));

			string filexls = filexlsx.Replace(".xlsx", ".xls");

			wb.SaveAs(HttpContext.Current.Server.MapPath(@"~/App_Data/DataDownloads/" + filexls), FileFormat.Excel8);

		}


		public static string DateTime_for_filename()
		{
			string datenow = DateTime.Now.Year.ToString() + ((DateTime.Now.Month < 10) ? "0" : "") + DateTime.Now.Month.ToString() + ((DateTime.Now.Day < 10) ? "0" : "") + DateTime.Now.Day.ToString();
			string hrminnow = ((DateTime.Now.Hour < 10) ? "0" : "") + DateTime.Now.Hour.ToString() + ((DateTime.Now.Minute < 10) ? "0" : "") + DateTime.Now.Minute.ToString();

			string datetime_for_filename = "_" + datenow + "_" + hrminnow; //TODO
			return datetime_for_filename;
		}


}