using SpssLib.DataReader;
using SpssLib.SpssDataset;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using uwac;
using uwac.trk;

namespace uwac
{
	/// <summary>
	/// Summary description for Spsssav
	/// </summary>
	public class Spsssav
	{
		private Datadictionary _dict;
		private DataTable _data;
		public Datadictionary dict { get { return _dict; } }
		public DataTable data { get { return _data; } }
		private SpssReader spssDataset;


		//Read in an SPSS .sav file
		public Spsssav(string filepath, string savfilename)
		{
			_dict = new Datadictionary(filepath, savfilename);
	
			using (FileStream fileStream = new FileStream(filepath + savfilename, FileMode.Open, FileAccess.Read, FileShare.Read, 2048 * 10,
														  FileOptions.SequentialScan))
			{
				// Create the reader, this will read the file header
				spssDataset = new SpssReader(fileStream);

				GetData();

				//// Iterate through all data rows in the file
				//foreach (var record in spssDataset.Records)
				//{
				//	foreach (var variable in spssDataset.Variables)
				//	{
				//		Console.Write(variable.Name);
				//		Console.Write(':');
				//		// Use the corresponding variable object to get the values.
				//		Console.Write(record.GetValue(variable));
				//		// This will get the missing values as null, text with out extra spaces,
				//		// and date values as DateTime.
				//		// For original values, use record[variable] or record[int]
				//		Console.Write('\t');
				//	}
				//	Console.WriteLine("");
				//}

			}
		}


		private void GetData()
		{
			DataTable dt = new DataTable();

			foreach (uwac.Variable var in _dict.vars)
			{
				DataColumn col = new DataColumn(var.varname.ToLower());
				col.DataType = GetDataType(var.datatype);
				dt.Columns.Add(col);

			}

			// Iterate through all data rows in the file
			foreach (var record in spssDataset.Records)
			{
				DataRow row = dt.NewRow();
				foreach (var variable in spssDataset.Variables)
				{
					string vname = variable.Name.ToLower();
					object value = record.GetValue(variable);
					// Use the corresponding variable object to get the values.
					//Debug.WriteLine(String.Format("{0}: {1}", variable.Name, value));
					row[vname] = (value == null) ? DBNull.Value : record.GetValue(variable);

				}
				dt.Rows.Add(row);
			}
			_data = dt;
		}


		protected Type GetDataType(string datatype)
		{
			if (dataops.Texttypes().Contains(datatype)) return typeof(string);
			else if (dataops.Numtypes().Contains(datatype) & datatype.Contains("int")) return typeof(int);
			else if (dataops.Numtypes().Contains(datatype) & !datatype.Contains("int")) return typeof(double);
			else if (dataops.Datetypes().Contains(datatype)) return typeof(DateTime);
			else return typeof(string);
		}



		protected SpssLib.SpssDataset.Variable SpssVar(string fldname, string label, DataType datatype, Dictionary<double, string> vallabels)
		{
			DataType dtype = new DataType();


			SpssLib.SpssDataset.Variable var = new SpssLib.SpssDataset.Variable(fldname);

			var.PrintFormat = new OutputFormat(FormatType.F, 8, 2);
			var.WriteFormat = new OutputFormat(FormatType.F, 8, 2);
			var.Type = datatype;
			var.Width = 10;
			var.MissingValueType = MissingValueType.NoMissingValues;
			var.Label = label;
			if (vallabels != null) var.ValueLabels = vallabels;

			return var;
		}

		protected DataType GetSPSSDataType(string datatype)
		{

			if (dataops.Texttypes().Contains(datatype)) return DataType.Text;
			else return DataType.Numeric;
		}


		protected List<SpssLib.SpssDataset.Variable> SpssVars(DataTable dt_dict)
		{
			List<SpssLib.SpssDataset.Variable> vars = new List<SpssLib.SpssDataset.Variable>();

			foreach (DataRow row in dt_dict.Rows)
			{
				string varname = row["varname"].ToString();
				string varlabel = row["FieldLabel"].ToString();
				DataType datatype = GetSPSSDataType(row["FieldDataType"].ToString());

				SpssLib.SpssDataset.Variable var = SpssVar(varname, varlabel, datatype, null);
			}

			return vars;
		}

	}
}