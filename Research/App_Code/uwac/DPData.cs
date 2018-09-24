using Accord.Statistics.Analysis;
using Accord.Statistics.Testing;

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
using Accord.Statistics.Models.Regression.Linear;
using Accord.Statistics.Testing;

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

		private DataSubsets _dataSubsets;

		public DataTable dt
		{
			get { return _dt; }
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
				_filter = value;
				if (_filter != "")
				{
					FilterData();
				}
			}
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

			if (filter != "")
			{
				FilterData();
			}

		}

		private DataTable AddIsCatToDataDict (DataTable initial_dtdict)
		{

			initial_dtdict.Columns.Add("isCat", typeof(string), "IIF(inanalysis = 3 OR DataType IN ('varchar','char','nvarchar','text'), 'Y', '')");
			return initial_dtdict;
		}


		public string Info()
		{
			string sheet = _dt.TableName;
			int nrows = _dt.Rows.Count;
			int ncols = _dt.Columns.Count;
			string info = "";
			if(_filter == null || filter=="")
			{
				info = String.Format("'{0}' worksheet has {1} rows & {2} columns", sheet, nrows, ncols);
			} else {
				info = String.Format("'{0}' worksheet has {1} rows & {2} columns{3}<br/><div style='color: red;'><b><i>(filter: {4})</i></b></div>", sheet, nrows, ncols, Environment.NewLine, _filter);
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

	}




	#region Misc Classes

	public class AccordStats
	{
		public Table OutputTable { get; set; }
		public string OutputMainTitle { get; set; }
		public List<OutputGridview> OutputGridviews { get; set; }
	}

	public class OutputGridview
	{
		public string Title;
		public ASPxGridView Grid;
	}



	public class List_O_PCA
	{
		private List<PCA> _pcas;
		public List<PCA> pcas { get { return _pcas; } }

		public List_O_PCA(DPData dpdata, List<string> numvars, string method, string groupingvar)
		{
			_pcas = new List<PCA>();
			DataSubsets subsets = new DataSubsets(dpdata.dt, numvars, groupingvar);

			foreach (DataSubset subset in subsets.subsets)
			{
				if (subset.dt != null)
				{
					if (subset.dt.Rows.Count > 0)
					{
						DataTable mydt = dpdata.Data_SelectColumns(subset.dt, numvars, false, true);
						if(mydt != null)
						{
							PCA pca = new PCA(mydt, numvars, method, subset.Cols_and_Vals_ToString());
							if (pca.final_N > 0) _pcas.Add(pca);
						}
					}
				}
			}
		}
	}

	public class PCA : AccordStats
	{
		private PrincipalComponentAnalysis _pca { get; set; }
		private DataTable _dt;
		private double[][] _data;
		private List<string> _numvars;
		private int _final_N { get; set; }
		private string _method { get; set; }
		private string _subtitle { get; set; }

		public PrincipalComponentAnalysis pca { get { return _pca; } }
		public int final_N { get { return _final_N; } }
		public string method { get { return _method; } }
		public string subtitle { get { return _subtitle; } }


		public PCA(DPData dpdata, List<string> numvars, string method, string subtitle)
		{
			_numvars = numvars;
			_method = method;
			_subtitle = subtitle;

			//need to select only the vars passed in
			_dt = dpdata.Data_SelectColumns(_numvars, false, true);

			ConvertData();
		}


		public PCA(DataTable mydt, List<string> numvars, string method, string subtitle)
		{
			_numvars = numvars;
			_method = method;
			_subtitle = subtitle;

			//vars already selected
			_dt = mydt;

			ConvertData();
		}


		public void ConvertData()  //assumes all vars in mydt are for use in the PCA
		{
			if(_dt != null)
			{
				if(_dt.Rows.Count > 0)
				{
					_data = Accord.Math.Matrix.ToJagged(_dt);
					_final_N = _data.Length;
					if (_final_N > 2)
					{
						runPCA();
					}

				}
				else 
				{
					_final_N = 0;
				}
			}
			else 
			{
				_final_N = 0;
			}
			//double[][] _data0 = new ConvertDataTableToMatrix(_dt).matrix;
		}


		public void runPCA() //DataTable mydt, List<string> numvars, string method, string subtitle)
		{

			if (_dt == null || _final_N==0)
			{
				_subtitle += " *No data rows*";
				_final_N = 0;
			}
			else
			{

				////from http://accord-framework.net/docs/html/T_Accord_Statistics_Analysis_PrincipalComponentAnalysis.htm 
				PrincipalComponentMethod mymethod = new PrincipalComponentMethod();
				if (method == "Center")
				{
					mymethod = PrincipalComponentMethod.Center;
				}
				else if (method == "Standardize")
				{
					mymethod = PrincipalComponentMethod.Standardize;
				}



				var pca = new PrincipalComponentAnalysis()
				{
					Method = mymethod,
					Whiten = true
				};

				// Learn the PCA projection using passing the cov matrix
				MultivariateLinearRegression transform = pca.Learn(_data);

				// Now, we can transform data as usual
				double[][] out1 = pca.Transform(_data);

				_pca = pca;

				buildPCAtable();
			}

		}


		public void buildPCAtable()
		{
			int nvars = _numvars.Count;

			if (_pca == null || _final_N == 0)
			{
				ASPxLabel label = new ASPxLabel();
				label.Text = string.Format("PCA analysis, listwise deletion N = {0} {1}", _final_N, _subtitle);
				label.Font.Bold = true;
				ASPxLabel labela = new ASPxLabel();

				Table t = new Table();
				TableRow r1 = new TableRow();
				TableCell c1 = new TableCell();
				c1.Controls.Add(label);

				OutputTable = t;
			}
			else
			{

				DataTable dt_pca = new DataTable();
				dt_pca.Columns.Add("index", typeof(int));
				dt_pca.Columns.Add("eigenvalue", typeof(double));
				dt_pca.Columns.Add("proportion_of_variance", typeof(double));
				dt_pca.Columns.Add("cum_proportion_of_variance", typeof(double));

				foreach (Accord.Statistics.Analysis.PrincipalComponent comp in _pca.Components)
				{
					DataRow row = dt_pca.NewRow();
					row["index"] = comp.Index + 1;
					row["eigenvalue"] = Math.Round(comp.Eigenvalue, 4);
					row["proportion_of_variance"] = Math.Round(comp.Proportion, 4);
					row["cum_proportion_of_variance"] = Math.Round(comp.CumulativeProportion, 4);
					dt_pca.Rows.Add(row);
				}


				ASPxGridView gv = new ASPxGridView();
				gv.DataSource = dt_pca;
				gv.DataBind();


				DataTable dt_compmatrix = new DataTable();
				dt_compmatrix.Columns.Add("varname", typeof(string));
				for (int n = 0; n < nvars; n++)
				{
					dt_compmatrix.Columns.Add(String.Format("PC{0}", n + 1), typeof(double));
				}

				for (int i = 0; i < nvars; i++)
				{
					DataRow row = dt_compmatrix.NewRow();
					row[0] = _numvars[i];
					for (int j = 0; j < _numvars.Count; j++)
					{
						row[j + 1] = Math.Round(_pca.ComponentMatrix[i, j] * _pca.SingularValues[j], 4);
					}
					dt_compmatrix.Rows.Add(row);
				}


				ASPxGridView gv2 = new ASPxGridView();
				gv2.DataSource = dt_compmatrix;
				gv2.DataBind();


				#region build table

				string lbl1 = string.Format("PCA analysis, listwise deletion N = {0} {1}", _final_N, _subtitle);
				string lbl1a = string.Format("{0}Method: {1}", Environment.NewLine, _method);
				string lbl2 = string.Format("{0}Factor loadings", Environment.NewLine); ;

				ASPxLabel label = new ASPxLabel();
				label.Text = lbl1;
				label.Font.Bold = true;
				ASPxLabel labela = new ASPxLabel();
				labela.Text = lbl1a;
				labela.Font.Bold = true;
				ASPxLabel label2 = new ASPxLabel();
				label2.Text = lbl2;
				label2.Font.Bold = true;


				OutputGridviews = new List<OutputGridview>();

				OutputMainTitle = lbl1;

				OutputGridviews.Add(new OutputGridview() { Title = lbl1a, Grid = gv });
				OutputGridviews.Add(new OutputGridview() { Title = lbl2, Grid = gv2 });

				

				Table t = new Table();
				TableRow r1 = new TableRow();
				TableCell c1 = new TableCell();
				c1.Controls.Add(label);
				c1.Controls.Add(labela);
				c1.Controls.Add(gv);

				TableCell c2 = new TableCell();
				c2.Controls.Add(label2);
				c2.Controls.Add(gv2);
				c1.Width = 550;
				r1.Cells.Add(c1);
				r1.Cells.Add(c2);
				t.Rows.Add(r1);

				TableRow r2 = new TableRow();
				TableCell c21 = new TableCell();
				ASPxHyperLink hyp1 = new ASPxHyperLink()
				{
					NavigateUrl = "http://accord-framework.net/docs/html/T_Accord_Statistics_Analysis_PrincipalComponentAnalysis.htm",
					Text = "Conducted with Accord.NET Framework v3.8.0 (with whiten=true)"
				};
				ASPxLabel l21 = new ASPxLabel();
				l21.Text = string.Format(" and results with test data match those obtained using the ");

				ASPxHyperLink hyp2 = new ASPxHyperLink()
				{
					NavigateUrl = "http://stat.ethz.ch/R-manual/R-devel/library/stats/html/prcomp.html",
					Text = "R 'prcomp' package."
				};
				Literal l22 = new Literal();
				l22.Text = "<br/>However, users should replicate these results on their own before publication!";



				c21.ColumnSpan = 2;
				c21.Controls.Add(hyp1);
				c21.Controls.Add(l21);
				c21.Controls.Add(hyp2);
				c21.Controls.Add(l22);
				r2.Cells.Add(c21);
				t.Rows.Add(r2);

				TableRow r3 = new TableRow();
				TableCell c31 = new TableCell() { ColumnSpan = 2 };
				ASPxHyperLink hyp3 = new ASPxHyperLink()
				{
					NavigateUrl = "https://arxiv.org/ftp/arxiv/papers/1210/1210.7463.pdf",
					Text = "Link to Accord.NET PCA tutorial."
				};
				c31.Controls.Add(hyp3);
				r3.Cells.Add(c31);

				t.Rows.Add(r3);
				#endregion

				OutputTable = t;
			}

		}
	}



	//public class PCAtable
	//{
	//	private List<string> _numvars;
	//	private PCAoutput _pcaoutput;
	//	public Table table;

	//	public PCAtable(PCAoutput pcaoutput, List<string> numvars)
	//	{
	//		_pcaoutput = pcaoutput;
	//		_numvars = numvars;
	//		int nvars = _numvars.Count;

	//		if (pcaoutput.pca == null || pcaoutput.final_N == 0)
	//		{
	//			ASPxLabel label = new ASPxLabel();
	//			label.Text = string.Format("PCA analysis, listwise deletion N = {0} {1}", _pcaoutput.final_N, _pcaoutput.subtitle);
	//			label.Font.Bold = true;
	//			ASPxLabel labela = new ASPxLabel();

	//			Table t = new Table();
	//			TableRow r1 = new TableRow();
	//			TableCell c1 = new TableCell();
	//			c1.Controls.Add(label);

	//			this.table = t;
	//		}
	//		else
	//		{

	//			DataTable dt_pca = new DataTable();
	//			dt_pca.Columns.Add("index", typeof(int));
	//			dt_pca.Columns.Add("eigenvalue", typeof(double));
	//			dt_pca.Columns.Add("proportion_of_variance", typeof(double));
	//			dt_pca.Columns.Add("cum_proportion_of_variance", typeof(double));

	//			foreach (Accord.Statistics.Analysis.PrincipalComponent comp in _pcaoutput.pca.Components)
	//			{
	//				DataRow row = dt_pca.NewRow();
	//				row["index"] = comp.Index + 1;
	//				row["eigenvalue"] = Math.Round(comp.Eigenvalue, 4);
	//				row["proportion_of_variance"] = Math.Round(comp.Proportion, 4);
	//				row["cum_proportion_of_variance"] = Math.Round(comp.CumulativeProportion, 4);
	//				dt_pca.Rows.Add(row);
	//			}


	//			ASPxGridView gv = new ASPxGridView();
	//			gv.DataSource = dt_pca;
	//			gv.DataBind();


	//			DataTable dt_compmatrix = new DataTable();
	//			dt_compmatrix.Columns.Add("varname", typeof(string));
	//			for (int n = 0; n < nvars; n++)
	//			{
	//				dt_compmatrix.Columns.Add(String.Format("PC{0}", n + 1), typeof(double));
	//			}

	//			for (int i = 0; i < nvars; i++)
	//			{
	//				DataRow row = dt_compmatrix.NewRow();
	//				row[0] = numvars[i];
	//				for (int j = 0; j < numvars.Count; j++)
	//				{
	//					row[j + 1] = Math.Round(_pcaoutput.pca.ComponentMatrix[i, j] * _pcaoutput.pca.SingularValues[j], 4);
	//				}
	//				dt_compmatrix.Rows.Add(row);
	//			}

	//			#region build table
	//			ASPxGridView gv2 = new ASPxGridView();
	//			gv2.DataSource = dt_compmatrix;
	//			gv2.DataBind();


	//			ASPxLabel label = new ASPxLabel();
	//			label.Text = string.Format("PCA analysis, listwise deletion N = {0} {1}", _pcaoutput.final_N, _pcaoutput.subtitle);
	//			label.Font.Bold = true;
	//			ASPxLabel labela = new ASPxLabel();
	//			labela.Text = string.Format("{0}Method: {1}", Environment.NewLine, _pcaoutput.method);
	//			labela.Font.Bold = true;
	//			ASPxLabel label2 = new ASPxLabel();
	//			label2.Text = string.Format("{0}Factor loadings", Environment.NewLine);
	//			label2.Font.Bold = true;


	//			Table t = new Table();
	//			TableRow r1 = new TableRow();
	//			TableCell c1 = new TableCell();
	//			c1.Controls.Add(label);
	//			c1.Controls.Add(labela);
	//			c1.Controls.Add(gv);

	//			TableCell c2 = new TableCell();
	//			c2.Controls.Add(label2);
	//			c2.Controls.Add(gv2);
	//			c1.Width = 550;
	//			r1.Cells.Add(c1);
	//			r1.Cells.Add(c2);
	//			t.Rows.Add(r1);

	//			TableRow r2 = new TableRow();
	//			TableCell c21 = new TableCell();
	//			ASPxHyperLink hyp1 = new ASPxHyperLink()
	//			{
	//				NavigateUrl = "http://accord-framework.net/docs/html/T_Accord_Statistics_Analysis_PrincipalComponentAnalysis.htm",
	//				Text = "Conducted with Accord.NET Framework v3.8.0 (with whiten=true)"
	//			};
	//			ASPxLabel l21 = new ASPxLabel();
	//			l21.Text = string.Format(" and results match those obtained using the ", _pcaoutput.final_N);

	//			ASPxHyperLink hyp2 = new ASPxHyperLink()
	//			{
	//				NavigateUrl = "http://stat.ethz.ch/R-manual/R-devel/library/stats/html/prcomp.html",
	//				Text = "R 'prcomp' package."
	//			};



	//			c21.ColumnSpan = 2;
	//			c21.Controls.Add(hyp1);
	//			c21.Controls.Add(l21);
	//			c21.Controls.Add(hyp2);
	//			r2.Cells.Add(c21);
	//			t.Rows.Add(r2);

	//			TableRow r3 = new TableRow();
	//			TableCell c31 = new TableCell() { ColumnSpan = 2 };
	//			ASPxHyperLink hyp3 = new ASPxHyperLink()
	//			{
	//				NavigateUrl = "https://arxiv.org/ftp/arxiv/papers/1210/1210.7463.pdf",
	//				Text = "Link to Accord.NET PCA tutorial."
	//			};
	//			c31.Controls.Add(hyp3);
	//			r3.Cells.Add(c31);

	//			t.Rows.Add(r3);
	//			#endregion

	//			this.table = t;
	//		}
	//	}
	//}



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


	//public class ConvertDataTableToMatrix
	//{
	//	public double[][] matrix;

	//	public ConvertDataTableToMatrix(DataTable dt)
	//	{

	//		matrix = new double[dt.Rows.Count][];
	//		Converter<object, double> converter = Convert.ToDouble;

	//		for (int row = 0; row < dt.Rows.Count; row++)
	//		{
	//			try
	//			{
	//				matrix[row] = Array.ConvertAll(dt.Rows[row].ItemArray, converter);
	//			}
	//			catch (Exception ex) { }
	//		}
	//	}
	//}

	//public static double[][] ConvertData(DataTable _dt)  //assumes all vars in mydt are for use in the PCA
	//{
	//	double[][] _data;
	//	int _final_N;

	//	if (_dt != null)
	//	{
	//		if (_dt.Rows.Count > 0)
	//		{
	//			_data = Accord.Math.Matrix.ToJagged(_dt);
	//			_final_N = _data.Length;
	//			return _data;
	//		}
	//		else
	//		{
	//			_final_N = 0;
	//			return null;
	//		}
	//	}
	//	else
	//	{
	//		_final_N = 0;
	//		return null;
	//	}

	//}


	public static class sqltypes
	{
		public static readonly ReadOnlyCollection<string> numeric = new ReadOnlyCollection<string>
			(new string[] { "int", "bigint","smallint","tinyint","decimal","float" } );
		public static readonly ReadOnlyCollection<string> text = new ReadOnlyCollection<string>
			(new string[] { "char", "varchar", "nvarchar" });
		public static readonly ReadOnlyCollection<string> date = new ReadOnlyCollection<string>
			(new string[] { "date", "datetime", "smalldatetime" });
	}



	//public class DataSubsets
	//{
	//	private List<DataSubset> _subsets;
	//	private List<Groupingvar> _groupingvars;

	//	public List<DataSubset> subsets { get { return _subsets; } }
	//	public List<Groupingvar> groupingvars { get { return _groupingvars; } }

	//	public DataSubsets(List<DataSubset> subsets_value, List<Groupingvar> groupingvars_value) //, List<int> numlevels_value)
	//	{
	//		_subsets = subsets_value;
	//		_groupingvars = groupingvars_value;
	//		//numlevels = numlevels_value;
	//	}

	//	public DataSubsets(DataTable dt_input, List<string> varnames, string groupingvar)
	//	{
	//		//just selected vars
	//		List<string> allvars = new List<string>();
	//		allvars.AddRange(varnames);
	//		allvars.Add(groupingvar);
	//		DataTable dt = SelectColumns(dt_input, allvars);

	//		_subsets = CreateSubsets(dt, varnames, new List<string> {groupingvar});
	//	}


	//	public DataSubsets(DataTable dt_input, List<string> varnames, List<string> groupingvarnames)
	//	{
	//		//just selected vars
	//		List<string> allvars = new List<string>();
	//		allvars.AddRange(varnames);
	//		allvars.AddRange(groupingvarnames);
	//		DataTable dt = SelectColumns(dt_input, allvars);

	//		_subsets = CreateSubsets(dt, varnames, groupingvarnames);
	//	}

	//	public List<DataSubset> CreateSubsets(DataTable dt, List<string> varnames, List<string> groupingvarnames)
	//	{
	//		_groupingvars = new List<Groupingvar>();
	//		List<DataSubset> mysubsets = new List<DataSubset>();
	//		try
	//		{

	//			//Create the list of GroupingVars
	//			for (int g = 0; g < groupingvarnames.Count; g++)
	//			{
	//				string vtype = dt.Columns[groupingvarnames[g]].DataType.ToString().ToLower();

	//				if(vtype != "string")
	//				{
	//					dt.ConvertColumnType(groupingvarnames[g], typeof(string));
	//				}


	//				List<string> unsorted_levels = dt.AsEnumerable().Select(f => f.Field<string>(groupingvarnames[g].ToString())).Distinct().ToList();
	//				List<string> levels = unsorted_levels.OrderBy(x => x).ToList(); 

	//				Groupingvar gv = new Groupingvar(groupingvarnames[g], levels);
	//				_groupingvars.Add(gv);
	//			}


	//			// from: http://www.scriptscoop.net/t/7516b362c821/c-c-linq-how-to-build-group-by-clause-dynamically.html
	//			IEnumerable<string> columnsToGroupBy = groupingvarnames;
	//			var groups = dt.AsEnumerable()
	//						.GroupBy(r => new NTuple<object>(from column in columnsToGroupBy select r[column]))
	//						.OrderBy(p => p.Key);

	//			//var groups = dt.AsEnumerable()
	//			//	.GroupBy(r => new NTuple<object>(from column in columnsToGroupBy select r[column]));


	//			foreach (var group in groups)
	//			{
	//				DataTable dtSub = group.CopyToDataTable();

	//				List<string> keyvalues = new List<string>();
	//				foreach (var s in group.Key.Values)
	//				{
	//					keyvalues.Add(s.ToString());
	//				}


	//				DataSubset subset = new DataSubset(dtSub, groupingvarnames, keyvalues);
	//				mysubsets.Add(subset);
	//			}
	//		}
	//		catch (Exception ex)
	//		{
	//			throw new Exception("ERROR! instantiating DataSubsets  Msg:" + ex.Message); // + "............." + ex.StackTrace.ToString());
	//		}
	//		return mysubsets;
	//	}


	//	public DataTable SelectColumns(DataTable dtin, List<string> allvars)
	//	{

	//		DataTable dtout = dtin.Copy();

	//		foreach (DataColumn dc in dtin.Columns)
	//		{
	//			string colname = dc.ColumnName.ToLower();

	//			if (allvars.Contains(colname)) { /*keep it*/ }
	//			else
	//			{
	//				dtout.Columns.Remove(colname);
	//			}
	//		}
	//		return dtout;
	//	}

	//}

	


	//public class DataSubset
	//{
	
	//	public DataTable dt { get; set; }
	//	public List<ColumnValue> cols_and_vals { get; set; }

	//	public DataSubset() { }

	//	public DataSubset(DataTable dtorig, List<string> additional_cols, List<string> additional_vals)
	//	{
	//		if (additional_cols.Count == additional_vals.Count)
	//		{
	//			cols_and_vals = new List<ColumnValue>();

	//			for (int i = 0; i < additional_cols.Count; i++)
	//			{
	//				ColumnValue cv = new ColumnValue(additional_cols[i], additional_vals[i]);
	//				cols_and_vals.Add(cv);

	//			}
	//			dt = dtorig;
	//		}

	//	}

	//	public string Cols_and_Vals_ToString()
	//	{
	//		string output = "";
	//		foreach(ColumnValue cv in cols_and_vals)
	//		{
	//			output += String.Format("{0}={1} ", cv.Colname, cv.Colvalue);
	//		}
	//		return output;
	//	}

	//	public string Cols_ToString()
	//	{
	//		string output = "";
	//		foreach (ColumnValue cv in cols_and_vals)
	//		{
	//			output += String.Format("{0} ", cv.Colname);
	//		}
	//		return output;
	//	}

	//	public string Vals_ToString()
	//	{
	//		string output = "";
	//		foreach (ColumnValue cv in cols_and_vals)
	//		{
	//			output += String.Format("{0} ", cv.Colvalue);
	//		}
	//		return output;
	//	}
	//}

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


	public class NTuple<T> : IEquatable<NTuple<T>>, IComparable<NTuple<T>>
	{
		public NTuple(IEnumerable<T> values)
		{
			Values = values.ToArray();
		}

		public readonly T[] Values;

		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
			if (obj == null)
				return false;
			return Equals(obj as NTuple<T>);
		}

		public bool Equals(NTuple<T> other)
		{
			if (ReferenceEquals(this, other))
				return true;
			if (other == null)
				return false;
			var length = Values.Length;
			if (length != other.Values.Length)
				return false;
			for (var i = 0; i < length; ++i)
				if (!Equals(Values[i], other.Values[i]))
					return false;
			return true;
		}

		public override int GetHashCode()
		{
			var hc = 17;
			foreach (var value in Values)
				hc = hc * 37 + (!ReferenceEquals(value, null) ? value.GetHashCode() : 0);
			return hc;
		}

		public int CompareTo(NTuple<T> other){
			if (ReferenceEquals(this, other))
				return 0;
				
			if (other == null)
				return -1;
			var length = Values.Length;
			if (length != other.Values.Length)
				return -1;
			int dif = String.Compare(this.Values[0].ToString(), other.Values[0].ToString());
			return dif;
			//for (var i = 0; i < length; ++i)
			//	if (!Equals(Values[i], other.Values[i])) return false;
			//return true;
		}
	}




	#endregion





}