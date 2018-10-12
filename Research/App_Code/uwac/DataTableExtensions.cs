using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Text;
using LinqStatistics;
using uwac;

namespace uwac
{

	/// <summary>
	/// Summary description for DataTableExtensions
	/// </summary>
	public static class DataTableExtensions
	{
		public static void ConvertColumnType(this DataTable dt, string columnName, Type newType)
		{
			using (DataColumn dc = new DataColumn(columnName + "_new", newType))
			{
				// Add the new column which has the new type, and move it to the ordinal of the old column
				int ordinal = dt.Columns[columnName].Ordinal;
				dt.Columns.Add(dc);
				dc.SetOrdinal(ordinal);

				// Get and convert the values of the old column, and insert them into the new
				foreach (DataRow dr in dt.Rows)
					dr[dc.ColumnName] = Convert.ChangeType(dr[columnName], newType);

				// Remove the old column
				dt.Columns.Remove(columnName);

				// Give the new column the old column's name
				dc.ColumnName = columnName;
			}
		}

		public static void JitterColumn(this DataTable dt, string columnName, double amt)
		{
			Random random = new Random(Guid.NewGuid().GetHashCode());


			using (DataColumn dc = new DataColumn(columnName + "_new", typeof(double) ))
			{
				// Add the new column which has the new type, and move it to the ordinal of the old column
				int ordinal = dt.Columns[columnName].Ordinal;
				dt.Columns.Add(dc);
				dc.SetOrdinal(ordinal);

				// Get and convert the values of the old column, and insert them into the new
				foreach (DataRow dr in dt.Rows)
				{
					double rand = random.NextDouble();
					double jit = (rand * (2.0 * amt)) - amt;
					double orig = Convert.ToDouble(dr[columnName]);

					dr[dc.ColumnName] = orig + jit;
				}
				// Remove the old column
				dt.Columns.Remove(columnName);

				// Give the new column the old column's name
				dc.ColumnName = columnName;
			}
		}


		public static List<string> ColumnNames(this DataTable dt)
		{
			List<string> colnames = new List<string>();

			foreach (DataColumn col in dt.Columns)
			{
				colnames.Add(col.ColumnName);
			}
			return colnames;
		}


		public static void DebugTable(this DataTable table)
		{
			Debug.WriteLine("--- DebugTable(" + table.TableName + ") ---");
			int zeilen = table.Rows.Count;
			int spalten = table.Columns.Count;

			// Header
			for (int i = 0; i < table.Columns.Count; i++)
			{
				string s = table.Columns[i].ToString();
				Debug.Write(String.Format("{0,-20} | ", s));
			}
			Debug.Write(Environment.NewLine);
			for (int i = 0; i < table.Columns.Count; i++)
			{
				Debug.Write("---------------------|-");
			}
			Debug.Write(Environment.NewLine);

			// Data
			for (int i = 0; i < zeilen; i++)
			{
				DataRow row = table.Rows[i];
				//Debug.WriteLine("{0} {1} ", row[0], row[1]);
				for (int j = 0; j < spalten; j++)
				{
					string s = row[j].ToString();
					if (s.Length > 20) s = s.Substring(0, 17) + "...";
					Debug.Write(String.Format("{0,-20} | ", s));
				}
				Debug.Write(Environment.NewLine);
			}
			for (int i = 0; i < table.Columns.Count; i++)
			{
				Debug.Write("---------------------|-");
			}
			Debug.Write(Environment.NewLine);
		}


		//// Data
		//public static DataTable Data_SelectColumns()
		//{
		//	log(String.Format(" /// Data_SelectColumns  ///"));
		//	log(String.Format(" /// Data_SelectColumns  numeric {0} ///", String.Join(",", _numericvars)));
		//	log(String.Format(" /// Data_SelectColumns  text {0} ///", String.Join(",", _textvars)));
		//	log(String.Format(" /// Data_SelectColumns  date {0} ///", String.Join(",", _datevars)));

		//	DataTable dtout = _dt.Copy();

		//	foreach (DataColumn dc in _dt.Columns)
		//	{
		//		string colname = dc.ColumnName.ToLower();
		//		List<string> allvars = new List<string>();
		//		allvars.AddRange(_numericvars);
		//		allvars.AddRange(_textvars);
		//		allvars.AddRange(_groupingvars);
		//		allvars.Add("id");


		//		if (allvars.Contains(colname))
		//		{
		//			//keep it
		//		}
		//		else
		//		{
		//			dtout.Columns.Remove(colname);
		//		}
		//	}
		//	return dtout;
		//}


		//public static DataTable Data_SelectColumns(List<string> vars_to_keep)
		//{
		//	return Data_SelectColumns(vars_to_keep, true, false);
		//}

		//public static DataTable Data_SelectColumns(List<string> vars_to_keep, bool add_id, bool remove_rows_with_null)
		//{
		//	return Data_SelectColumns(_dt, vars_to_keep, add_id, remove_rows_with_null);
		//}


		public static DataTable Data_SelectColumns(DataTable dt, List<string> vars_to_keep, bool add_id, bool remove_rows_with_null)
		{
			log(String.Format(" /// Data_SelectColumns  ///"));
			log(String.Format(" /// Data_SelectColumns  vars_to_keep {0} ///", String.Join(",", vars_to_keep)));

			DataTable dtout = dt.Copy();

			foreach (DataColumn dc in dt.Columns)
			{
				string colname = dc.ColumnName.ToLower();
				if (add_id) vars_to_keep.Add("id");


				if (vars_to_keep.Contains(colname))
				{
					//keep it
				}
				else
				{
					dtout.Columns.Remove(colname);
				}
			}

			if (remove_rows_with_null)
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

		//public static DataTable Data_SelectColumnX(string xvar)
		//{
		//	log(String.Format(" /// Data_SelectColumnX  {0}", xvar));
		//	return Data_SelectColumnX(_dt, xvar);
		//}

		public static DataTable Data_SelectColumnX(DataTable dt, string xvar)
		{
			//Convert to double and get rid of DBNull values
			//var origdata = dt.AsEnumerable().Select(x => (x[col.ColumnName] == DBNull.Value) ? -998877 : x[col.ColumnName]).ToList();
			//data = origdata.ConvertAll(x => Convert.ToDouble(x)).Where(x => x != -998877).ToList();


			var coltype = dt.Columns[xvar].DataType;

			if (coltype.Name == "String")
			{
				var qry = dt.AsEnumerable()
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
				var qry = dt.AsEnumerable()
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

		//public static DataTable Data_SelectColumnXY(string xvar, string yvar)
		//{
		//	return Data_SelectColumnXY(_dt, xvar, yvar);
		//}

		public static DataTable Data_SelectColumnXY(DataTable mydt, string xvar, string yvar)
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

				data.Columns["x"].ColumnName = xvar;
				data.Columns["y"].ColumnName = yvar;

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
				data.Columns["x"].ColumnName = xvar;
				data.Columns["y"].ColumnName = yvar;
				return data;
			}
		}

		public static DataTable Data_SelectColumnXY(DataTable mydt, string xvar, string yvar, string seriesby)
		{
			var coltypeX = mydt.Columns[xvar].DataType;
			var coltypeY = mydt.Columns[yvar].DataType;

			DataTable data;

			if (coltypeX.Name.ToLower() == "datetime")
			{
				var qry = mydt.AsEnumerable().Where(f => f.Field<DateTime?>(xvar) != null && f.Field<double?>(yvar) != null)
				.Select(r => new
				{
					seriesby = r.Field<string>(seriesby),
					id = r.Field<string>("id"),
					x = r.Field<DateTime>(xvar),
					y = r.Field<double>(yvar)
				});

				data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

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

				data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);
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

				data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);
			}
			else
			{
				data = null;
			}

			if (data != null)
			{
				data.Columns["seriesby"].ColumnName = seriesby; 
				data.Columns["x"].ColumnName = xvar;
				data.Columns["y"].ColumnName = yvar;
			}
			return data;

		}


		//public static List<string> GetLevels(string var)
		//{
		//	List<string> levels = new List<string>();

		//	foreach (Groupingvar gv in _dataSubsets.groupingvars)
		//	{
		//		if (gv.Groupingvarname == var) return gv.Levels;
		//	}
		//	return null;
		//}

		//public static List<DataSubset> ExtractSubsets(string groupingvar, string level)
		//{
		//	List<DataSubset> list = new List<DataSubset>();

		//	foreach (DataSubset sub in _dataSubsets.subsets)
		//	{
		//		foreach (ColumnValue cv in sub.cols_and_vals)
		//		{
		//			if (cv.Colname == groupingvar && cv.Colvalue == level) list.Add(sub);
		//		}
		//	}

		//	return list;
		//}


		public static DataTable Data_SelectColumnXY(DataTable mydt, string xvar, string yvar, string seriesby, string colorsby)
		{
			try
			{
				var coltypeX = mydt.Columns[xvar].DataType;
				var coltypeY = mydt.Columns[yvar].DataType;

				if (colorsby == "none")
				{
					//colorsby = seriesby; 
					bool has_none = false;
					foreach (DataColumn col in mydt.Columns)
					{
						if (col.ColumnName == "none") has_none = true;
					}
					if (!has_none)
					{
						DataColumn col = new DataColumn() { ColumnName = "none", DataType = typeof(string) };
						col.DefaultValue = "none";
						mydt.Columns.Add(col);
					}
				}
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
			catch(Exception ex)
			{
				return null;
			}
		}




		public static DataTable StackData(DataTable dt, List<string> vars_to_keep, List<string> vars_to_stack)
		{
			//returns a DataTable in which the vars_to_stack become represented in a "Variable" and "Value" column
			List<DataTable> dts = new List<DataTable>();
			foreach (string v in vars_to_stack)
			{
				DataTable dt_for_var = new DataTable();
				dt_for_var = GetDataTable_for_Variable(dt, vars_to_keep.ToArray<string>(), v);

				dts.Add(dt_for_var);

			}

			DataTable dtStacked = new DataTable();
			dtStacked = AddRows(dts);

			return dtStacked;
		}


		//public DataTable GetDataTable_for_Variable(IEnumerable<DataRow> rows, string[] fields_to_keep, string var_to_stack)
		public static DataTable GetDataTable_for_Variable(DataTable dt, string[] fields_to_keep, string var_to_stack)
		{
			DataTable retVal = new DataTable();

			foreach (DataColumn col in dt.Columns)
			{
				if (fields_to_keep.Contains(col.ColumnName))
				{
					retVal.Columns.Add(col.ColumnName, col.DataType);
				}
			}
			retVal.Columns.Add("variable", typeof(string));
			retVal.Columns.Add("value", typeof(double));


			foreach (DataRow curRow in dt.Rows)
			{
				//    if (retVal.Columns.Count < 0)
				//    {
				//        for (int i = 0; i < fields_to_keep.Length; i++)
				//        {
				//            if (!curRow.IsNull(fields_to_keep[i]))
				//            {
				//                retVal.Columns.Add(fields_to_keep[i], curRow[fields_to_keep[i]].GetType());
				//            }
				//            else
				//            {
				//                // try to find the source columns type...
				//            }
				//        }
				//    }

				//    retVal.Columns.Add("Variable", typeof(string));
				//    retVal.Columns.Add("Value", typeof(double));


				DataRow newRow = retVal.NewRow();

				for (int i = 0; i < fields_to_keep.Length; i++)
				{
					if (!curRow.IsNull(fields_to_keep[i]))
					{
						var thevalue = curRow[fields_to_keep[i]];
						newRow[fields_to_keep[i]] = curRow[fields_to_keep[i]];
					}
				}

				newRow["variable"] = var_to_stack;
				newRow["value"] = curRow[var_to_stack];


				retVal.Rows.Add(newRow);
			}

			return retVal;
		}


		public static DataTable AddRows(List<DataTable> dts)
		{
			DataTable dtStacked = new DataTable();
			for (int i = 0; i < dts.Count; i++)
			{
				if (i == 0)
				{
					dtStacked = dts[0]; //set the first table 
				}
				else
				{
					dtStacked.Merge(dts[i]);
				}
			}
			return dtStacked;
		}

		public static void log(string s)
		{
			//if (printDebug)
			//{
				Debug.Print(s);
			//}
		}


	}

}
