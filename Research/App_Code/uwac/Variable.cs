using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for Variable
	/// </summary>
	
	[Serializable]
	public class Variable
	{
	
		public string varname { get; set; }
		public string varlabel { get; set; }
		public int fieldvaluesetid { get; set; }
		public Datatype datatype { get; set; }
		public Valueset valueset { get; set; }

		public Vartype vartype {
			get {
				return datatype.ToVartype();
			}
		}

		public Variable()
		{

		}


		public Variable(string myvarname, string myvarlabel, Datatype mydatatype)
		{
			varname = myvarname;
			varlabel = myvarlabel;
			datatype = mydatatype;
		}

		public Variable(DataRow row) //From a row of REDCap meta data
		{
			this.varname = row["field_name"].ToString();
			this.varlabel = row["field_label"].ToString().Replace("'", "`");

			List<string> override_types = new List<string> { "number", "date_mdy", "time" };
			string override_datatype = row["text_validation_type_or_show_slider_number"].ToString();

			string mydatatype = (override_types.Contains(override_datatype)) ? override_datatype : row["field_type"].ToString();

			this.datatype = new Datatype(mydatatype);


		}

		public Variable(SpssLib.SpssDataset.Variable spssvar)
		{
			varname = spssvar.Name;
			varlabel = spssvar.Label;
			//if (spssvar.IsDate()) datatype = "date";
			//else if (spssvar.Type == SpssLib.SpssDataset.DataType.Numeric) datatype = "float";
			//else if (spssvar.Type == SpssLib.SpssDataset.DataType.Text) datatype = "varchar";

			if (spssvar.IsDate()) datatype = new Datatype(SqlDatatype.Date);
			else if (spssvar.Type == SpssLib.SpssDataset.DataType.Numeric) datatype = new Datatype(SqlDatatype.Float);
			else if (spssvar.Type == SpssLib.SpssDataset.DataType.Text) datatype = new Datatype(SqlDatatype.Varchar);



			if (spssvar.ValueLabels != null)
			{
				if (spssvar.ValueLabels.Count > 0)
				{
					Valueset valset = new Valueset();

					foreach (KeyValuePair<double, string> label in spssvar.ValueLabels)
					{
						Valuesetitem itm = new Valuesetitem(label);
						valset.valitems.Add(itm);
					}

					valueset = valset;
				}
			}
		}


		public bool HasValueset()
		{
			bool hasvalset = false;
			if (valueset != null)
			{
				if (valueset.valitems != null)
				{
					if (valueset.valitems.Count > 0) hasvalset = true;
				}
			}
			return hasvalset;
		}
	}


	[Serializable]
	public class Valuesetitem
	{
		public double value { get; set; }
		public string label { get; set; }
		public Valuesetitem()
		{ }

		public Valuesetitem(KeyValuePair<double, string> input)
		{
			value = input.Key;
			label = input.Value;
		}
		public Valuesetitem(int myvalue, string mylabel)
		{
			value = myvalue;
			label = mylabel;
		}
	}

	[Serializable]
	public class Datatype
	{

		private SqlDatatype _sqldatatype;
		public SqlDatatype SqlDatatype { get { return _sqldatatype; } }

		public Datatype()
		{ }

		public Datatype(SqlDatatype mySqlDatatype)
		{
			_sqldatatype = mySqlDatatype;
		}

		public Datatype(string REDCapMeta_datatype)
		{
			AssignDatatype(REDCapMeta_datatype, Datatypesource.REDCap);
		}
		public Datatype(string datatype, Datatypesource source)
		{
			AssignDatatype(datatype, source);
		}
				public void AssignDatatype(string datatype, Datatypesource source)
		{
			if (source == Datatypesource.REDCap)
			{
				List<string> inttypes = new List<string> { "radio", "yesno" };
				List<string> floattypes = new List<string> { "number" };
				List<string> texttypes = new List<string> { "text", "notes" };
				List<string> datetypes = new List<string> { "date_mdy" };
				List<string> datetimetypes = new List<string> { "time" };

				if (inttypes.Contains(datatype)) _sqldatatype = SqlDatatype.Integer;
				else if (texttypes.Contains(datatype)) _sqldatatype = SqlDatatype.Varchar;
				else if (floattypes.Contains(datatype)) _sqldatatype = SqlDatatype.Float;
				else if (datetypes.Contains(datatype)) _sqldatatype = SqlDatatype.Date;
				else if (datetimetypes.Contains(datatype)) _sqldatatype = SqlDatatype.DateTime;
				else _sqldatatype = SqlDatatype.Varchar;
			}
			else if (source == Datatypesource.DxChartsettings)
			{
				if ( datatype == "int" ) _sqldatatype = SqlDatatype.Integer;
				else if (datatype=="num" | datatype=="int" | datatype=="float") _sqldatatype = SqlDatatype.Float;
				else if (datatype == "date") _sqldatatype = SqlDatatype.Date;
				else if (datatype == "text") _sqldatatype = SqlDatatype.Varchar;
				else _sqldatatype = SqlDatatype.Varchar;
			}
		}

		public override string ToString()
		{
			if (_sqldatatype == SqlDatatype.Integer) return "int";
			else if (_sqldatatype == SqlDatatype.Float) return "float";
			else if (_sqldatatype == SqlDatatype.Varchar) return "varchar";
			else if (_sqldatatype == SqlDatatype.Date) return "date";
			else if (_sqldatatype == SqlDatatype.DateTime) return "datetime";
			else return "varchar";
		}

		public Vartype ToVartype()
		{
			if (_sqldatatype == SqlDatatype.Integer) return Vartype.numeric;
			else if (_sqldatatype == SqlDatatype.Float) return Vartype.numeric;
			else if (_sqldatatype == SqlDatatype.Varchar) return Vartype.text;
			else if (_sqldatatype == SqlDatatype.Date) return Vartype.date;
			else if (_sqldatatype == SqlDatatype.DateTime) return Vartype.text;
			else return Vartype.text;
		}
	}

	[Serializable]
	public enum Datatypesource
	{
		REDCap = 0,
		DxChartsettings = 1
	}

	[Serializable]
	public enum Vartype
	{

		numeric = 0,
		text = 1,
		date = 2
	}

	[Serializable]
	public enum SqlDatatype
	{
		Integer = 0,
		Float = 1,
		Varchar = 2,
		Date = 3,
		DateTime = 4
	}

}