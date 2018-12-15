﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using SpssLib.DataReader;
using SpssLib.SpssDataset;

namespace uwac 
{ 
/// <summary>
/// Summary description for Datadictionary
	/// </summary>
	public class Datadictionary
	{
		public string sourcefilename { get; set; }
		public int tblpk { get; set; }
		public int measureid { get; set; }
		public string tblname { get; set; }
		public string measname { get; set; }
		public List<Variable> vars { get; set; }
		public List<Valueset> valsets { get; set; }
		public DataTable dt_dict { get; set; }

		public Datadictionary()
		{
			Initialize();
		}

		public Datadictionary(string path, string file)
		{
			Initialize();
			sourcefilename = file;

			if(sourcefilename.ToLower().EndsWith(".sav") )
			{
				CreateDatadictionaryFromSpsssav(path, sourcefilename);
			}
		}

		public Datadictionary(int mymeasureID)
		{
			measureid = mymeasureID;
			Initialize();

			dt_dict = GetDatadictionaryFromDB();
		}

		public DataTable GetDatadictionaryFromDB()
		{
			DataTable dt = new DataTable();
			if (measureid > 0)
			{
				SQL_utils sql = new SQL_utils("data");


				string code = String.Format("select * from (select * from vwNDAR_Required_Vars_Definition union select Row_number() over( order by ord_pos) + 5  as Pos, fldname as ElementName " + Environment.NewLine +
				", (case when fielddatatype in ('decimal', 'float') then 'Float' when fielddatatype like '%char%' then 'String' when fielddatatype like '%int%' then 'Integer' when fielddatatype like '%date%' then 'Date' else 'String' end) DataType" +
				", fielddatatypelength as  Size, 'Recommended' as Required " + Environment.NewLine +
				", fieldlabel as ElementDescription " + Environment.NewLine +
				" , def.fnValueLabels_for_NDARdatadict(fieldvaluesetID) ValueRange " + Environment.NewLine +
				" , def.fnValueLabels_for_HtmlDisplay(fieldvaluesetID,'; ') Notes, '' Aliases " + Environment.NewLine +
				" from def.Fld a " + Environment.NewLine +
				" JOIN def.Tbl b ON a.tblpk = b.tblpk" + Environment.NewLine +
				" LEFT JOIN (select table_name, column_name from INFORMATION_SCHEMA.COLUMNS ) c ON b.tblname = c.table_name and a.fldname = c.column_name " + Environment.NewLine +
				" where a.tblpk = (select tblpk from def.tbl where measureID = {0}) " + Environment.NewLine +
				" and fldname not in ('id','studymeasID','indexnum','verified','created','updated','scored','createdby','updatedby','scoredby') " + Environment.NewLine +
				" and ord_pos >= 1 " + Environment.NewLine +
				" and ExcludeFromNDARdict is null " + Environment.NewLine +
				" and (a.fieldcodeID != 10 or a.fieldcodeID is null) " + Environment.NewLine +
				" ) x order by Pos", measureid);

				measname = sql.StringScalar_from_SQLstring("select measname from uwautism_research_backend..tblMeasure where measureID=" + measureid.ToString());
				//measfullname = sql.StringScalar_from_SQLstring("select measfullname from uwautism_research_backend..tblMeasure where measureID=" + measureid.ToString());


				dt = sql.DataTable_from_SQLstring(code);

			}

			return dt;
		}

		public void Initialize()
		{
			vars = new List<Variable>();
			valsets = new List<Valueset>();
		}



		public void CreateDatadictionaryFromSpsssav(string filepath, string sourcefilename)
		{

			using (FileStream fileStream = new FileStream(filepath + sourcefilename, FileMode.Open, FileAccess.Read, FileShare.Read, 2048 * 10,
													  FileOptions.SequentialScan))
			{
				// Create the reader, this will read the file header
				SpssReader spssDataset = new SpssReader(fileStream);

				// Iterate through all the varaibles
				foreach (var variable in spssDataset.Variables)
				{
					// Display name and label
					Debug.WriteLine("{0} - {1}", variable.Name, variable.Label);
					// Display value-labels collection
					foreach (KeyValuePair<double, string> label in variable.ValueLabels)
					{
						Debug.WriteLine(" {0} - {1}", label.Key, label.Value);
					}

					uwac.Variable newvar = new uwac.Variable(variable);

					if (newvar != null) this.vars.Add(newvar);
				}
			}

			ExtractValuesets();
		}


		public void ExtractValuesets()
		{
			int counter = 0;
			
			foreach (Variable v in vars)
			{
				if (v.HasValueset())
				{
					//add the first one
					if (valsets.Count == 0)
					{
						AddValueset(v.valueset, counter);
						counter++;
					}
					else
					{
						bool hasmatch = false;
						bool keeplooking = true;

						int nummatches = 0;

						for (int i = 0; i < valsets.Count; i++)
						{
							if (keeplooking)
							{
								Valueset _vset = valsets[i];

								bool boo1 = (_vset == v.valueset) ? true : false;
								bool boo2 = (_vset.Equals( v.valueset)) ? true : false;
								bool boo3 = CompareEm(_vset, v.valueset);

								nummatches += (boo3) ? 1 : 0;
								//Debug.WriteLine("nummatches: " + nummatches.ToString());

								if (boo3)
								{
									v.valueset.localvaluesetid = _vset.localvaluesetid;
									hasmatch = true;
									keeplooking = false;
								}
							}
						}
						if (!hasmatch)
						{
							AddValueset(v.valueset, counter);
							counter++;
						}
					}
				}

			}

			Debug.WriteLine("1. # valsets = " + valsets.Count.ToString());

			valsets = valsets.Distinct().ToList();

			Debug.WriteLine("2. # valsets = " + valsets.Count.ToString());

			bool print_valsets = false;
			if (print_valsets)
			{
				foreach (Valueset valset in valsets)
				{
					Debug.WriteLine(String.Format("local: {0}  numtimesused: {1}  numitems: {2}", valset.localvaluesetid, valset.numtimesused, valset.valitems.Count));
				}

				foreach (uwac.Variable v in vars)
				{
					if (v.HasValueset())
					{
						Debug.WriteLine(String.Format("   -- > local: {0}  numitems: {1}", v.valueset.localvaluesetid, v.valueset.valitems.Count));
					}
				}
			}

		}

		public void AddValueset(Valueset valset, int idx)
		{
			valset.localvaluesetid = idx;
			valsets.Add(valset);
		}


		public int ValuesetToDB(SQL_utils sql, Valueset vset)
		{
			if (measureid > 0)
			{
				int newvaluesetid = DxDbOps.CreateValueSet(sql, measureid, vset);
				return newvaluesetid;
			}
			return -1;
		}

		public string SaveValuesetsToDB(SQL_utils sql)
		{
			string info = "";
			int num_valsets = 0;
			if (valsets.Count > 0)
			{
				foreach (Valueset vset in valsets)
				{
					int newfvsid = ValuesetToDB(sql, vset);
					vset.fieldvaluesetid = newfvsid;

					if (newfvsid > 0)
					{
						num_valsets++;
						foreach (uwac.Variable var in vars)
						{
							if (var.HasValueset())
							{
								if (var.valueset.localvaluesetid == vset.localvaluesetid)
								{
									var.fieldvaluesetid = newfvsid;
								}
							}
						}
					}
					else
					{
						info += String.Format("Err vset {0}.", vset.localvaluesetid);
					}
				}
			}

			if (num_valsets > 0) info += String.Format("{0} value sets added.", num_valsets);

			return info;
		}


		public string SaveVarsToDB(SQL_utils sql)
		{
			string info = "";
			int num_vars = 0;

			if (vars.Count > 0)
			{
				try
				{
					foreach (uwac.Variable v in vars)
					{
						num_vars++;
						string sqlcode = String.Format("insert into def.fld(tblpk, ord_pos, fldname, FieldDataType, FieldLabel, FieldValueSetID) " +
							" values({0},{1},'{2}','{3}','{4}',{5})"
							, tblpk, num_vars, v.varname, v.datatype, v.varlabel, v.fieldvaluesetid);

						sql.NonQuery_from_SQLstring(sqlcode);

						int newfldpk = sql.IntScalar_from_SQLstring(
							String.Format("select fldpk from def.fld where tblpk={0} and fldname='{1}'", tblpk, v.varname));

					}
					if (num_vars > 0) info += String.Format("{0} variables added.", num_vars);

					return info;

				}
				catch (Exception ex)
				{
					return String.Format("ERROR. {0}", ex.Message);
				}
			}
			else
			{
				return "No variables defined.";
			}
			

		}



	public string SaveToDB()
	{
		if (tblpk > 0)
		{
			if (measureid > 0)
			{
				string info = "";
				SQL_utils sql = new SQL_utils("data");

				int num_vars = 0;

				info += SaveValuesetsToDB(sql);
				info += SaveVarsToDB(sql);
				sql.Close();

				return info;
			}
			else
			{
				return "ERROR: No MeasureID provided.";
			}
		}
		else
		{
			return "ERROR: No tblpk defined.";
		}
	}

		public bool CompareEm(Valueset vset1, Valueset vset2)
		{
			bool match = false;
			if(vset1.valitems.Count == vset2.valitems.Count)
			{
				int tot = vset1.valitems.Count;
				int numerrors = 0;
				for (int i = 0; i < vset1.valitems.Count; i++)
				{
					if (numerrors == 0)
					{
						var o1 = vset1.valitems[i];
						var o2 = vset2.valitems[i];

						if (o1.value != o2.value | o1.label != o2.label)
						{
							numerrors++;
						}
						//else{
						//	var x = "hooray!";
						//}
					}
				}
				if(numerrors == 0) match = true;

			}
			if(match)
			{
				vset1.numtimesused++;
			}
			return match;
		}

	}



	public class Valueset
	{
		public int localvaluesetid { get; set; }
		public int fieldvaluesetid { get; set; }
		public string valuesetname { get; set; }
		public List<Valuesetitem> valitems { get; set; }
		public int numtimesused { get; set; }

		public Valueset()
		{
			valitems = new List<Valuesetitem>();
		}
	}

	public class Valuesetitem
	{
		public double value { get; set; }
		public string label { get; set; }
		public Valuesetitem (KeyValuePair<double, string> input)
		{
			value = input.Key;
			label = input.Value;
		}
	}

	public class Variable
	{
		public string varname { get; set; }
		public string varlabel { get; set; }
		public int fieldvaluesetid { get; set; }
		public string datatype { get; set; }
		public Valueset valueset { get; set; }

		public Variable(SpssLib.SpssDataset.Variable spssvar)
		{
			varname = spssvar.Name;
			varlabel = spssvar.Label;
			if (spssvar.IsDate()) datatype = "date";
			else if (spssvar.Type == SpssLib.SpssDataset.DataType.Numeric) datatype = "float";
			else if (spssvar.Type == SpssLib.SpssDataset.DataType.Text) datatype = "varchar";

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
			if(valueset != null)
			{
				if (valueset.valitems != null)
				{
					if (valueset.valitems.Count > 0) hasvalset = true;
				}
			}
			return hasvalset;
		}
	}

}