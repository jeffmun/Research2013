using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.Linq;
using System.Diagnostics;
using System.Linq;
using System.Linq.Dynamic;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using DevExpress.Web;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using LinqStatistics;
using MathNet.Numerics.Statistics;
using uwac;
using uwac.trk;
using Accord.Statistics.Analysis;
using Accord.Statistics.Testing;
using Accord.Statistics.Models.Regression.Linear;
using uwac.data;

namespace uwac
{

	/// <summary>
	/// Summary description for DxData
	/// </summary>
	
	[Serializable]
	public class DPData
	{

		private bool printDebug = false;
		private DataTable _dt;
		private DataTable _dtstacked;
		private DataTable _dtdict;
		private List<string> _numericvars;
		private List<string> _textvars;
		private List<string> _datevars;
		private List<string> _groupingvars;
		private List<string> _idvars;
		private string _filter;
		private string _info;
		private string _selectedsheet;
		public string selectedsheet { get { return _selectedsheet; } set { _selectedsheet = value; } }


		private DataSubsets _dataSubsets;

		public string filename { get; set; }
		public int dataproj_pk { get; set; }

		public DataTable dt
		{
			get {
					if (filter != "" & filter != "null")
					{
						return FilteredData();
					}
					else 
					{
						return _dt;
					}
				}
			set { _dt = value; }
		}
		public DataTable dtstacked
		{
			get { return _dtstacked; }
			set { _dtstacked = value; }
		}
		public DataTable dtdict
		{
			get { return _dtdict; }
			set { _dtdict = value; }
		}
		public List<string> numericvars
		{
			get { return _numericvars; }
			set {
				_numericvars = value;
				log(String.Format(" /// set _numericvars  {0}///", String.Join(",",_numericvars)));
			}
		}
		public List<string> textvars
		{
			get { return _textvars; }
			set { _textvars = value; }
		}
		public List<string> datevars
		{
			get { return _datevars; }
			set { _datevars = value; }
		}
		public List<string> groupingvars
		{
			get { return _groupingvars; }
			set { _groupingvars = value; }
		}

		public List<string> idvars
		{
			get { return _idvars; }
			set { _idvars = value; }
		}


		public DataSubsets dataSubsets
		{
			get { return _dataSubsets; }
			set { _dataSubsets = value; }
		}
		public string filter
		{
			get { return _filter; }
			set { 
				//_filter = value;

					if (_filter != value)
					{
						_filter = value;
						_info = CalculateInfo();
					}
				}
		}
		public string Info
		{
			get { return _info; }
		}


		public DPData(Dataproject dataproject, string myfilter)
		{
			_selectedsheet = dataproject.selectedsheet;
			_filter = myfilter;
			_dtdict = AddIsCatToDataDict(dataproject.Dataset.Tables["DataDictionary"]);
			DataTable dt_fixedcols = FixColumnTypes(dataproject.Dataset.Tables[_selectedsheet], dataproject.Dataset.Tables["DataDictionary"]);
			_dt = dt_fixedcols;
			_idvars = new List<string> { "ref_id", "group", "txgrp", "timept" };
			//if (filter != "" & filter != "null")
			//{
			//	FilterData();
			//}
			_info = CalculateInfo();
		}


		public DPData(DataTable initial_dt, DataTable initial_dtdict)
		{
			_dtdict = AddIsCatToDataDict(initial_dtdict);
			DataTable dt_fixedcols = FixColumnTypes(initial_dt, initial_dtdict);
			_dt = dt_fixedcols;
			_idvars = new List<string> { "ref_id", "group", "txgrp", "timept" };

		}

		public DPData(DataTable initial_dt, DataTable initial_dtdict, string filter)
		{
			_filter = filter;
			_dtdict = AddIsCatToDataDict(initial_dtdict);
			DataTable dt_fixedcols = FixColumnTypes(initial_dt, initial_dtdict);
			_dt = dt_fixedcols;

			_idvars = new List<string> { "ref_id", "group", "txgrp", "timept" };

			//if (filter != "")
			//{
			//	FilterData();
			//}

		}

		private DataTable AddIsCatToDataDict (DataTable initial_dtdict)
		{
			bool has_isCat = false;
			foreach(DataColumn col in initial_dtdict.Columns)
			{
				if (col.ColumnName == "isCat") has_isCat = true;
			}

			if(!has_isCat)
			{
				initial_dtdict.Columns.Add("isCat", typeof(string), "IIF(inanalysis = 3 OR DataType IN ('varchar','char','nvarchar','text'), 'Y', '')");
			}
			return initial_dtdict;
		}

		
		public string CalculateInfo()
		{
			string info = "";
			if (_dt == null)
			{
				info = "ERROR: No data has been loaded.";
			}
			else
			{
				if (dt.HasRows())
				{
					string sheet = _dt.TableName;
					int nrows = dt.Rows.Count;
					int ncols = dt.Columns.Count;

					if (_filter == null || filter == "")
					{
						info = String.Format("Using '{0}' worksheet with {1} rows & {2} columns", sheet, nrows, ncols);
					}
					else
					{
						info = String.Format("Using '{0}' worksheet with {1} rows & {2} columns{3}<br/><div style='color: red;'><b><i>(filter: {4})</i></b></div>", sheet, nrows, ncols, Environment.NewLine, _filter);
					}
				}
				else
				{
					info = "Unknown error.";
				}

			}
			return info;
		}

		public void FilterData()
		{
			try
			{
				DataView vw = _dt.AsDataView();
				vw.RowFilter = _filter;
				DataTable dt_filtered = vw.ToTable();

				_dt = dt_filtered;
			}
			catch (Exception ex)
			{
				_filter += " *FAILED*";
			}

		}

		public DataTable FilteredData()
		{
			try
			{
				DataView vw = _dt.AsDataView();
				vw.RowFilter = _filter;
				DataTable dt_filtered = vw.ToTable();

				return dt_filtered;
			}
			catch (Exception ex)
			{
				_filter += " *FAILED*";
				return _dt; 
			}

		}


		public DataTable FixColumnTypes(DataTable initial_dt, DataTable initial_dtdict)
		{
			if (initial_dt == null)
			{
				return null;
			}
			else
			{
				List<string> stringcols = new List<string>();

				//Get string columns in init_data
				foreach (DataColumn c in initial_dt.Columns)
				{
					c.ColumnName = c.ColumnName.ToLower();
					if (c.DataType == typeof(string)) stringcols.Add(c.ColumnName);
				}

				//Get numeric vars from data dictionary
				List<string> date_vars = initial_dtdict.AsEnumerable()
					.Where(f => sqltypes.date.Contains(f.Field<string>("datatype")))
					.Select(f => f.Field<string>("varname")).ToList();

				date_vars = date_vars.ConvertAll(d => d.ToLower());



				//Get numeric vars from data dictionary
				List<string> numeric_vars = initial_dtdict.AsEnumerable()
					.Where(f => sqltypes.numeric.Contains(f.Field<string>("datatype")))
					.Select(f => f.Field<string>("varname")).ToList();

				numeric_vars = numeric_vars.ConvertAll(d => d.ToLower());

				List<string> stringcols_to_make_numeric = stringcols.AsEnumerable()
					.Where(c => numeric_vars.Contains(c)).ToList();

				DataTable dtCloned = initial_dt.Clone();
				foreach (DataColumn col in dtCloned.Columns)
				{
					//Make "id" string 
					if (col.ColumnName.ToLower() == "id" || col.ColumnName.ToLower() == "ref_id") col.DataType = typeof(string);
					if (stringcols_to_make_numeric.Contains(col.ColumnName.ToLower())) col.DataType = typeof(Double);
					if (date_vars.Contains(col.ColumnName.ToLower()))
					{
						col.DataType = typeof(DateTime);
					}

				}
				foreach (DataRow row in initial_dt.Rows)
				{
					//Was simply just this
					//dtCloned.ImportRow(row);

					//Now handling dates
					DataRow newrow = dtCloned.NewRow();

					for (int i = 0; i < row.ItemArray.Length; i++)
					//foreach(object col in row.ItemArray)
					{
						string thiscol = initial_dt.Columns[i].ColumnName;
						if (thiscol == "id" || thiscol == "ref_id")
						{
							newrow[i] = row.ItemArray[i].ToString();
						}

						if (date_vars.Contains(thiscol))
						{
							DateTime? newdate = null;
							var oldvalue = row.ItemArray[i];
							if (oldvalue != DBNull.Value)
							{
								double olddbl = Convert.ToDouble(oldvalue);
								newdate = DateTime.FromOADate(olddbl);
								newrow[i] = newdate;
							}
							else
							{
								newrow[i] = DBNull.Value;
							}

						}
						else
						{
							newrow[i] = row[i];
						}
					}
					dtCloned.Rows.Add(newrow);

				}
				return dtCloned;
			}
		}



		
		// Data
		public DataTable Data_SelectColumns()
		{
			log(String.Format(" /// Data_SelectColumns  ///"));
			log(String.Format(" /// Data_SelectColumns  numeric {0} ///", String.Join(",",_numericvars)));
			log(String.Format(" /// Data_SelectColumns  text {0} ///", String.Join(",", _textvars)));
			log(String.Format(" /// Data_SelectColumns  date {0} ///", String.Join(",", _datevars)));

			DataTable dtout = _dt.Copy();

			foreach (DataColumn dc in _dt.Columns)
			{
				string colname = dc.ColumnName.ToLower();
				List<string> allvars = new List<string>();
				allvars.AddRange(_numericvars);
				allvars.AddRange(_textvars);
				allvars.AddRange(_groupingvars);
				allvars.Add("id");


				if (allvars.Contains(colname) )
				{
					//keep it
				}
				else
				{
					dtout.Columns.Remove(colname);
				}
			}
			return dtout;
		}
		public DataTable Data_SelectColumns(List<string> vars_to_keep)
		{
			return Data_SelectColumns(vars_to_keep, true, false);
		}

		public DataTable Data_SelectColumns(List<string> vars_to_keep, bool add_id, bool remove_rows_with_null)
		{
			return Data_SelectColumns(_dt, vars_to_keep, add_id, remove_rows_with_null);
		}


		public DataTable Data_SelectColumns(DataTable dt, List<string> vars_to_keep, bool add_id, bool remove_rows_with_null)
		{
			log(String.Format(" /// Data_SelectColumns  ///"));
			log(String.Format(" /// Data_SelectColumns  vars_to_keep {0} ///", String.Join(",", vars_to_keep)));

			DataTable dtout = dt.Copy();

			foreach (DataColumn dc in dt.Columns)
			{
				string colname = dc.ColumnName.ToLower();
				if(add_id) vars_to_keep.Add("id");


				if (vars_to_keep.Contains(colname))
				{
					//keep it
				}
				else
				{
					dtout.Columns.Remove(colname);
				}
			}

			if(remove_rows_with_null)
			{
				try
				{
					DataTable dtout2 = dtout.AsEnumerable()
						.Where(row => !row.ItemArray.Any(field => field is DBNull ||
									string.IsNullOrWhiteSpace(field.ToString())))
						.CopyToDataTable();
					return dtout2;
				}
				catch (Exception ex)
				{
					return null;
				}
			}
			else 
			{
				return dtout;
			}
		}

		public DataTable Data_SelectColumnX( string xvar)
		{
			log(String.Format(" /// Data_SelectColumnX  {0}", xvar));
			return Data_SelectColumnX(_dt, xvar);
		}

		public DataTable Data_SelectColumnX(DataTable mydt, string xvar)
		{
			//Convert to double and get rid of DBNull values
			//var origdata = dt.AsEnumerable().Select(x => (x[col.ColumnName] == DBNull.Value) ? -998877 : x[col.ColumnName]).ToList();
			//data = origdata.ConvertAll(x => Convert.ToDouble(x)).Where(x => x != -998877).ToList();

			
			var coltype = mydt.Columns[xvar].DataType;

			if (coltype.Name == "String")
			{
				var qry = mydt.AsEnumerable()
					.Where(f => f.Field<string>(xvar) != null)
					.Select(r => new
					{
						id = r.Field<string>("id"),
						timept = r.Field<string>("timept"),
						group = r.Field<string>("group"),
						x = Convert.ToDouble(r.Field<string>(xvar))
					});

				DataTable data2 = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

				return data2;
			}

			else
			{
				var qry = mydt.AsEnumerable()
				  .Where(f => f.Field<double?>(xvar) != null)
					.Select(r => new
					{
						id = r.Field<string>("id"),
						timept = r.Field<string>("timept"),
						group = r.Field<string>("group"),
						x = r.Field<double>(xvar)
					});

				//DataTable data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);
				DataTable data = qry.CustomCopyToDataTable();


				return data;
			}

		}

		public DataTable Data_SelectColumnXY( string xvar, string yvar)
		{
			return Data_SelectColumnXY(_dt, xvar, yvar);
		}

		public DataTable Data_SelectColumnXY(DataTable mydt, string xvar, string yvar)
		{
			var coltypeX = mydt.Columns[xvar].DataType;
			var coltypeY = mydt.Columns[yvar].DataType;

			if (coltypeX.Name.ToLower() == "string")
			{
				var qry = mydt.AsEnumerable()
					.Where(f => f.Field<string>(xvar) != null && f.Field<double?>(yvar) != null)
				.Select(r => new 
				{
					id = r.Field<string>("id"),
					x = r.Field<string>(xvar),
					y = r.Field<double>(yvar)
				});

				DataTable data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

				return data;
			}
			else
			{
				var qry = mydt.AsEnumerable().Where(f => f.Field<double?>(xvar) != null && f.Field<double?>(yvar) != null)
				.Select(r => new 
				{
					id = r.Field<string>("id"),
					x = r.Field<double>(xvar),
					y = r.Field<double>(yvar)
				});

				DataTable data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

				return data;
			}
		}

		public DataTable Data_SelectColumnXY(DataTable mydt, string xvar, string yvar, string seriesby)
		{
			var coltypeX = mydt.Columns[xvar].DataType;
			var coltypeY = mydt.Columns[yvar].DataType;


			if(coltypeX.Name.ToLower() == "datetime")
			{
				var qry = mydt.AsEnumerable().Where(f => f.Field<DateTime?>(xvar) != null && f.Field<double?>(yvar) != null)
				.Select(r => new
				{
					seriesby = r.Field<string>(seriesby),
					id = r.Field<string>("id"),
					x = r.Field<DateTime>(xvar),
					y = r.Field<double>(yvar)
				});

				DataTable data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

				return data;
			}

			else if (coltypeX.Name.ToLower() == "string")
			{
				var qry = mydt.AsEnumerable().Where(f => f.Field<string>(xvar) != null && f.Field<double?>(yvar) != null)
				.Select(r => new
				{
					seriesby = r.Field<string>(seriesby),
					id = r.Field<string>("id"),
					x = r.Field<string>(xvar),
					y = r.Field<double>(yvar)
				});

				DataTable data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

				return data;
			}
			else if (coltypeX.Name.ToLower() == "double")
			{
				var qry = mydt.AsEnumerable()
					.Where(f => f.Field<double?>(xvar) != null && f.Field<double?>(yvar) != null)
				.Select(r => new
				{
					seriesby = r.Field<string>(seriesby),
					id = r.Field<string>("id"),
					x = r.Field<double>(xvar),
					y = r.Field<double>(yvar)
				});

				DataTable data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

				return data;
			}
			else
			{
				return null;
			}
		}


			public List<string> GetLevels (string var)
		{
			List<string> levels = new List<string>();

			foreach(Groupingvar gv in _dataSubsets.groupingvars)
			{
				if (gv.Groupingvarname == var) return gv.Levels;	
			}
			return null;
		}

		public List<DataSubset> ExtractSubsets(string groupingvar, string level)
		{
			List<DataSubset> list = new List<DataSubset>();

			foreach(DataSubset sub in _dataSubsets.subsets)
			{
				foreach(ColumnValue cv in sub.cols_and_vals)
				{
					if (cv.Colname == groupingvar && cv.Colvalue == level) list.Add(sub);
				}
			}

			return list;
		}

		public DataTable Data_SelectColumnXY(DataTable mydt, string xvar, string yvar, string seriesby, string colorsby)
		{
			var coltypeX = mydt.Columns[xvar].DataType;
			var coltypeY = mydt.Columns[yvar].DataType;

			if (colorsby == "none")
			{ colorsby = seriesby; }
			else
			{
				var coltypeColors = mydt.Columns[colorsby].DataType;
				if (coltypeColors.Name.ToLower() != "string")
				{
					mydt.ConvertColumnType(colorsby, typeof(string));
				}
			}

			
			if (coltypeX.Name.ToLower() == "datetime")
			{
				var qry = mydt.AsEnumerable()
					.Where(f => f.Field<DateTime?>(xvar) != null && f.Field<double?>(yvar) != null)
				.Select(r => new
				{
					seriesby = r.Field<string>(seriesby),
					colorsby = r.Field<string>(colorsby.ToString()),
					id = r.Field<string>("id"),
					x = r.Field<DateTime>(xvar),
					y = r.Field<double>(yvar)
				});

				DataTable data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

				return data;
			}

			else if (coltypeX.Name.ToLower() == "string")
			{
				var qry = mydt.AsEnumerable()
					.Where(f => f.Field<string>(xvar) != null && f.Field<double?>(yvar) != null)
				.Select(r => new
				{
					seriesby = r.Field<string>(seriesby),
					colorsby = r.Field<string>(colorsby).ToString(),
					id = r.Field<string>("id"),
					x = r.Field<string>(xvar),
					y = r.Field<double>(yvar)
				})
				.OrderBy(o => o.x)
				.ThenBy(o => o.id);

				DataTable data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

				return data;
			}
			else if (coltypeX.Name.ToLower() == "double")
			{
				var qry = mydt.AsEnumerable()
					.Where(f => f.Field<double?>(xvar) != null && f.Field<double?>(yvar) != null)
				.Select(r => new
				{
					seriesby = r.Field<string>(seriesby),
					colorsby = r.Field<string>(colorsby),
					id = r.Field<string>("id"),
					x = r.Field<double>(xvar),
					y = r.Field<double>(yvar)
				});

				DataTable data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

				return data;
			}
			else
			{
				return null;
			}
		}



		public void Data_FullyStacked(List<string> id_vars, List<string> vars)
		{

			var tblPivot = new DataTable();

			foreach(string idv in id_vars)
			{
				tblPivot.Columns.Add(idv, typeof(string));
			}
			tblPivot.Columns.Add("measname", typeof(string));
			tblPivot.Columns.Add("varname", typeof(string));
			tblPivot.Columns.Add("value", typeof(double));
			tblPivot.Columns.Add("isvalid", typeof(int));


			for (int i = 1; i < _dt.Rows.Count; i++)
			{
				DataRow datarow = _dt.Rows[i];

				for (int col = 0; col < vars.Count; col++)
				{
					var r = tblPivot.NewRow();

					//Add the ID vars
					foreach (string idv in id_vars)
					{
						r[idv] = datarow[idv]; 
					}

					try
					{
						string vname = vars[col];
						string measname = _dtdict.AsEnumerable().Where(f => f.Field<string>("varname") == vname).Select(f => f.Field<string>("measname")).First().ToString();
						r["varname"] = vname;
						r["measname"] = measname;

						var val = datarow[vname];
						if (val != null && val.ToString() != "")
						{
							r["value"] = val;
							r["isvalid"] = 1;
						}
						else
						{
							r["isvalid"] = 0;
						}

						tblPivot.Rows.Add(r);
					}
					catch(Exception )
					{ }
				}
			}
			
			this._dtstacked = tblPivot;

		}


		
		private void ChangeColumnToString(System.Data.DataTable dt, string colname)
		{
			dt.Columns.Add(colname + "_new", typeof(string));
			foreach (System.Data.DataRow dr in dt.Rows)
			{   // Will need switch Case for others if Date is not the only one.
				dr[colname + "_new"] = double.Parse(dr[colname].ToString()); // dr[p].ToString();
			}
			dt.Columns.Remove(colname);
			dt.Columns[colname + "_new"].ColumnName = colname;
		}

		//STATS
		//public PCAoutput PCA(List<string> numvars, string method)
		//{
		//	DataTable mydt = Data_SelectColumns(numvars, false, true);

		//	return createPCA(mydt, numvars, method, "");
		//}




		public void log(string s)
		{
			if (printDebug)
			{
				Debug.Print(s);
			}
		}



		public void TestFilterChange()
		{
			List<string> filters = new List<string>();
			filters.Add(" sex = 'M' ");
			filters.Add(" sex = 'F' ");
			filters.Add(" group in ( 'UW','MIND') ");
			filters.Add(" sex = 'M' and group in ( 'UW','MIND') ");
			filters.Add(" sex = 'F' and group in ( 'UMACC') ");


			Debug.WriteLine("");
			Debug.WriteLine("");
			Debug.WriteLine("");
			Debug.WriteLine("");

			foreach (string f in filters)
			{

				this.filter = f;
				Debug.WriteLine("");
				Debug.WriteLine("filter = '{0}'      {1}", f, DateTime.Now.ToString());
				Debug.WriteLine("");
				Debug.WriteLine(this.Info);
				Debug.WriteLine("");

			}

			Debug.WriteLine("");
			Debug.WriteLine("");
			Debug.WriteLine("");
			Debug.WriteLine("");

		}


	}




	#region Misc Classes


	public class OneWayANOVA
	{
		public OneWayAnova anova;

		public OneWayANOVA()
		{

		}
	}


	public class ChiSq : AccordStats
	{
		public ChiSquareTest _chisq { get; set; }
		//public FisherExactTest _fisher { get; set; }
		private DataTable _dt;
		private double[][] _data;
		private List<string> _vars;
		private int _final_N { get; set; }
		private string _subtitle { get; set; }

		public int final_N { get { return _final_N; } }
		public string subtitle { get { return _subtitle; } }

		public ChiSquareTest chisq { get { return _chisq; } }
		//public FisherExactTest fisher { get { return _fisher; } }


		public ChiSq(DPData dpdata, List<string> vars, string subtitle)
		{
			_vars = vars;
			_subtitle = subtitle;

			//need to select only the vars passed in
			_dt = dpdata.Data_SelectColumns(_vars, false, true);

			//ConvertData();

		}

	}



	public static class sqltypes
	{
		public static readonly ReadOnlyCollection<string> numeric = new ReadOnlyCollection<string>
			(new string[] { "int", "bigint","smallint","tinyint","decimal","float" } );
		public static readonly ReadOnlyCollection<string> text = new ReadOnlyCollection<string>
			(new string[] { "char", "varchar", "nvarchar" });
		public static readonly ReadOnlyCollection<string> date = new ReadOnlyCollection<string>
			(new string[] { "date", "datetime", "smalldatetime" });
	}




	public class Groupingvar
	{
		//private string _colname;
		//private string _colvalue;
		public string Groupingvarname{ get; set; }
		public List<string> Levels { get; set; }

		public Groupingvar(string groupingvarname, List<string> levels)
		{
			Groupingvarname = groupingvarname;
			Levels = levels;
		}

	}


	public class ColumnValue
	{
		//private string _colname;
		//private string _colvalue;
		public string Colname { get; set; }
		public string Colvalue { get; set; }

		public ColumnValue(string colname, string colvalue)
		{
			Colname = colname;
			Colvalue = colvalue;
		}

	}


	//public class NTuple<T> : IEquatable<NTuple<T>>, IComparable<NTuple<T>>
	//{
	//	public NTuple(IEnumerable<T> values)
	//	{
	//		Values = values.ToArray();
	//	}

	//	public readonly T[] Values;

	//	public override bool Equals(object obj)
	//	{
	//		if (ReferenceEquals(this, obj))
	//			return true;
	//		if (obj == null)
	//			return false;
	//		return Equals(obj as NTuple<T>);
	//	}

	//	public bool Equals(NTuple<T> other)
	//	{
	//		if (ReferenceEquals(this, other))
	//			return true;
	//		if (other == null)
	//			return false;
	//		var length = Values.Length;
	//		if (length != other.Values.Length)
	//			return false;
	//		for (var i = 0; i < length; ++i)
	//			if (!Equals(Values[i], other.Values[i]))
	//				return false;
	//		return true;
	//	}

	//	public override int GetHashCode()
	//	{
	//		var hc = 17;
	//		foreach (var value in Values)
	//			hc = hc * 37 + (!ReferenceEquals(value, null) ? value.GetHashCode() : 0);
	//		return hc;
	//	}

	//	public int CompareTo(NTuple<T> other)
	//	{
	//		if (ReferenceEquals(this, other))
	//			return 0;

	//		if (other == null)
	//			return -1;
	//		var length = Values.Length;
	//		if (length != other.Values.Length)
	//			return -1;
	//		int dif = String.Compare(this.Values[0].ToString(), other.Values[0].ToString());
	//		return dif;
	//		//for (var i = 0; i < length; ++i)
	//		//	if (!Equals(Values[i], other.Values[i])) return false;
	//		//return true;
	//	}
	//}




	#endregion





}