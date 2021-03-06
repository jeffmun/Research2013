﻿using System;
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


		#region Return information about the DataTable
		public static bool HasRows(this DataTable dt)
		{
			bool hasrows = false;

			if (dt != null)
			{
				if (dt.Rows.Count > 0) hasrows = true;
			}
			return hasrows;
		}

		public static bool ContainsColumnName(this DataTable dt, string colname)
		{
			bool containsColname = false;

			if (dt != null)
			{
				foreach (DataColumn col in dt.Columns)
				{
					if (col.ColumnName == colname) containsColname = true;
				}
			}
			return containsColname;
		}

		public static bool ColumnContainsValue(this DataTable dt, string columnName, string targetvalue)
		{
			bool colcontainsvalue = false;

			foreach (DataRow row in dt.Rows)
			{
				if (row[columnName].ToString().Contains(targetvalue)) colcontainsvalue = true;
			}

			return colcontainsvalue;
		}



		public static List<string> ColumnNames(this DataTable dt)
		{
			return ColumnNames(dt, "");
		}


		public static List<string> ColumnNames(this DataTable dt, string upperlower)
		{
			List<string> colnames = new List<string>();

			foreach (DataColumn col in dt.Columns)
			{
				string cname;
				if(upperlower=="upper") cname = col.ColumnName.ToUpper();
				else if (upperlower == "lower") cname = col.ColumnName.ToLower();
				else cname = col.ColumnName;

				colnames.Add(cname);
			}
			return colnames;
		}

		public static DataTable RemoveRowsWithNullID(this DataTable dt)
		{
			int n_rows_deleted = 0;
			Debug.WriteLine(" **** Begin CheckSubjects *****");
			if (dt.HasRows())
			{
				if (dt.ContainsColumnName("id") & dt.ContainsColumnName("studymeasid"))
				{

					List<DataRow> rowsToDelete = new List<DataRow>();

					foreach (DataRow row in dt.Rows)
					//for(int i=0; i < dt.Rows.Count; i++)
					{
						//DataRow row = dt.Rows[i];

						if (row["id"].ToString() == "" | row["id"] == null | row["id"] == DBNull.Value)
						{
							rowsToDelete.Add(row);
						}
					}
					n_rows_deleted = rowsToDelete.Count;

					foreach (DataRow row in rowsToDelete)
					{
						dt.Rows.Remove(row);
					}

					dt.AcceptChanges();

				}

			}


			return dt;

		}


		#endregion


		#region Manipulate the DataTable

		public static void ColumnNamesToLower(this DataTable dt)
		{
			foreach(DataColumn col in dt.Columns)
            {
				col.ColumnName = col.ColumnName.ToLower();
			}
		}

		public static void ChangeColumnIndex(this DataTable dt, string colname, int newindex)
		{
			int idx = -1;
			foreach (DataColumn col in dt.Columns)
			{
				if(col.ColumnName==colname)
                {
					idx = col.Ordinal;
                }
			}

			dt.Columns[idx].SetOrdinal(newindex);
			dt.AcceptChanges();

		}


		public static void ConvertColumnType(this DataTable dt, string columnName, Type newType)
		{
			using (DataColumn dc = new DataColumn(columnName + "_new", newType))
			{
				//Allow NULL values
				dc.AllowDBNull = true;

				// Add the new column which has the new type, and move it to the ordinal of the old column
				int ordinal = dt.Columns[columnName].Ordinal;
				dt.Columns.Add(dc);
				dc.SetOrdinal(ordinal);

				// Get and convert the values of the old column, and insert them into the new
				foreach (DataRow dr in dt.Rows)
				{
					if(dr[columnName] == DBNull.Value | dr[columnName].ToString()=="" | dr[columnName].ToString() == "NaN")
					{
						dr[dc.ColumnName] = DBNull.Value;
					}
					else
					{
						dr[dc.ColumnName] = Convert.ChangeType(dr[columnName], newType);
					}
				}
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


		public static void RescaleColumn(this DataTable dt, string columnName, double newmin, double newmax)
		{
			Type theTypeOfTheColumn = dt.Columns[columnName].DataType;

			double oldmin = 0;
			double oldmax = 0;

			if (theTypeOfTheColumn.Name.ToLower().Contains("int"))
			{
				var omin = Convert.ToDouble(dt.AsEnumerable().Select(f => f.Field<int?>(columnName)).Min());
				var omax = Convert.ToDouble(dt.AsEnumerable().Select(f => f.Field<int?>(columnName)).Max());
				oldmin = omin;
				oldmax = omax;
			}
			else if (theTypeOfTheColumn.Name.ToLower().Contains("decimal"))
			{
				var omin = Convert.ToDouble(dt.AsEnumerable().Select(f => f.Field<decimal?>(columnName)).Min());
				var omax = Convert.ToDouble(dt.AsEnumerable().Select(f => f.Field<decimal?>(columnName)).Max());
				oldmin = omin;
				oldmax = omax;
			}
			else if (theTypeOfTheColumn.Name.ToLower().Contains("double"))
			{
				var omin = Convert.ToDouble(dt.AsEnumerable().Select(f => f.Field<double?>(columnName)).Min());
				var omax = Convert.ToDouble(dt.AsEnumerable().Select(f => f.Field<double?>(columnName)).Max());
				oldmin = omin;
				oldmax = omax;
			}



			//var foominmax = LinqStatistics.EnumerableStats.MinMax(foo);




			using (DataColumn dc = new DataColumn(columnName + "_new", typeof(double)))
			{
				// Add the new column which has the new type, and move it to the ordinal of the old column
				int ordinal = dt.Columns[columnName].Ordinal;
				dt.Columns.Add(dc);
				dc.SetOrdinal(ordinal);

				// Get and convert the values of the old column, and insert them into the new
				foreach (DataRow dr in dt.Rows)
				{
					if (dr[columnName] != DBNull.Value)
					{
						double orig = Convert.ToDouble(dr[columnName]);

						double pct_orig = orig / (oldmax - oldmin);
						double newval = (pct_orig * (newmax - newmin)) + newmin;
						dr[dc.ColumnName] = newval;
					}
					else
					{
						dr[dc.ColumnName] = DBNull.Value;
					}
				}
				// Remove the old column
				dt.Columns.Remove(columnName);

				// Give the new column the old column's name
				dc.ColumnName = columnName;
			}
		}

		public static void RenameColumnsFromRowIndex(this DataTable dt, int rowidx, bool fixcolname)
		{
			DataRow row = dt.Rows[rowidx];

			var rowvals = row.ItemArray.ToList();

			for (int i = 0; i < dt.Columns.Count; i++)
			{
				string colname = dt.Columns[i].ColumnName;

				if (colname.StartsWith("column"))
				{
					string newname = rowvals[i].ToString().ToLower();
					if (fixcolname)
					{
						newname = newname.Replace(" ", "");
						newname = newname.Replace("-", "");
						newname = newname.Replace("#", "num");
						newname = newname.Replace("%", "pct");
						newname = newname.Replace("1", "one");
						newname = newname.Replace("sleep/wake", "sleep0wake1");
						newname = newname.Replace("s/w", "sw");
						newname = newname.Replace("/", "_per_");
					}

					dt.RenameColumn(colname, newname);
				}
			}

		}



		public static void RenameColumn(this DataTable dt, string colname_from, string colname_to)
		{

			foreach(DataColumn col in dt.Columns)
			{
				if(col.ColumnName.ToLower() == colname_from.ToLower())
				{
					col.ColumnName = (colname_to != "") ? colname_to : colname_from;
				}
			}

		}

		public static void AddColumn(this DataTable dt, string columnNameToAdd, Type type)
		{
			if (!dt.ColumnNames().Contains(columnNameToAdd))
			{
				DataColumn col = new DataColumn(columnNameToAdd, type);
				dt.Columns.Add(col);
				dt.AcceptChanges();
			}
		}

		public static void AddColumn(this DataTable dt, string columnNameToAdd, Type type, string defaultvalue)
		{
			if (!dt.ColumnNames().Contains(columnNameToAdd))
			{
				DataColumn col = new DataColumn(columnNameToAdd, type);
				col.DefaultValue = defaultvalue;
				dt.Columns.Add(col);
				dt.AcceptChanges();
			}
		}


		public static void AddColumn(this DataTable dt, string columnNameToAdd, Type type, int defaultvalue)
		{
			if (!dt.ColumnNames().Contains(columnNameToAdd))
			{
				DataColumn col = new DataColumn(columnNameToAdd, type);
				col.DefaultValue = defaultvalue;
				dt.Columns.Add(col);
				dt.AcceptChanges();
			}
		}


		public static void AddRowNumColumn(this DataTable dt)
        {
			DataColumn col = new DataColumn("rownum", typeof(int));
			dt.Columns.Add(col);
			dt.AcceptChanges();

			int counter = 0;
			foreach(DataRow row in dt.Rows)
            {
				row["rownum"] = counter;
				counter++;
            }
		}


		public static void MatchColumnDataTypes(this DataTable dt, DataTable dt_to_match)
		{
			//foreach(DataColumn col in dt.Columns)
			//{
			//	foreach (DataColumn col_to_match in dt_to_match.Columns)

			List<string> dt_to_match_colnames = dt_to_match.ColumnNames();

			//	foreach (DataColumn scol in dt_src.Columns)
			//	{

			for (int i=0; i < dt.Columns.Count; i++)
			{
				DataColumn col = dt.Columns[i];
				string colname = col.ColumnName;

				if(dt_to_match_colnames.Contains(colname))
                {
					DataColumn col_to_match = dt_to_match.Columns[colname];

					if(col.DataType != col_to_match.DataType)
                    {
						ConvertColumnType(dt, col.ColumnName, col_to_match.DataType);
					}

				}
				//for (int j = 0; j < dt_to_match.Columns.Count; j++)
				//{
				//	DataColumn col_to_match = dt_to_match.Columns[j];
				//	if (col.ColumnName == col_to_match.ColumnName)
				//	{
				//		ConvertColumnType(dt, col.ColumnName, col_to_match.DataType);
				//	}
				//}	
			}
		}


		//Needed for SPSSsav and other importing
		public static void AddNeededColumnsBeforeImport(this DataTable dt, DataImportSettings settings)
		{
			bool hasindexnum = dt.ContainsColumnName("indexnum");
			bool hasid = dt.ContainsColumnName("id");
			bool hasstudymeasid = dt.ContainsColumnName("studymeasid");


			if (!hasstudymeasid)
			{
				DataColumn smID = new DataColumn("studymeasid", typeof(int));
				smID.DefaultValue = settings.studymeasID;
				dt.Columns.Add(smID);
			}
			if (!hasindexnum)
			{
				DataColumn idxnum = new DataColumn("indexnum", typeof(int));
				idxnum.DefaultValue = 0;
				dt.Columns.Add(idxnum);
			}


			try
			{
				// Add columns and populate them
				foreach (Importfield importfield in settings.fields)
				{
					string newcolname = "";
					string sourcecolname = "";
					if (importfield.mode == FieldExtractionMode.useOtherFld)
					{
						newcolname = importfield.field;
						sourcecolname = importfield.constString;
					}
					DataColumn sourcecol = dt.Columns[sourcecolname];
					bool hasotherfld = dt.ContainsColumnName(newcolname);

					if (!hasotherfld & newcolname != "" & sourcecolname != "")
					{
						Type type = sourcecol.DataType;
						DataColumn newcol = new DataColumn(newcolname, type);
						dt.Columns.Add(newcol);
						foreach (DataRow row in dt.Rows)
						{
							row[newcolname] = row[sourcecolname];
						}
					}

				}
			}
			catch (Exception ex)
			{
				int x = 0;
			}

		}

		public static void NewColumnByCutpoints(this DataTable dt, string columnName, string cuts)
		{
			List<string> cutpoints = cuts.Split(',').ToList();

			using (DataColumn dc = new DataColumn(columnName + "_cut", typeof(string)))
			{
				// Add the new column 
				dt.Columns.Add(dc);

				// Get and convert the values of the old column, and insert them into the new
				foreach (DataRow dr in dt.Rows)
				{
					double orig = Convert.ToDouble(dr[columnName]);
					string newval = "unassigned";

					foreach(string s in cutpoints)
					{
						double x = Convert.ToDouble(s);
						if (orig <= x) newval = String.Format("<={0}", x);
					}
					if(newval == "unassigned" & orig > Convert.ToDouble(cutpoints[cutpoints.Count]))
					{
						newval = String.Format("> {0}", cutpoints[cutpoints.Count]);
					}


					dr[dc.ColumnName] = newval;
				}
				// Remove the old column
				dt.Columns.Remove(columnName);

				// Give the new column the old column's name
				dc.ColumnName = String.Format("{0}_cut",columnName);
			}

		}

		public static DataTable ConvertEmptyStringToDBNull(this DataTable dt)
		{
			foreach (DataColumn col in dt.Columns)
			{
				col.AllowDBNull = true;
			}

			foreach (DataColumn col in dt.Columns)
			{
				string colname = col.ColumnName;
				foreach (DataRow row in dt.Rows)
				{
					if (row[colname].ToString() == "")
					{
						if (colname == "indexnum") row[colname] = 1;
						else row[colname] = DBNull.Value;
					}
				}
			}

			return dt;
		}

		public static DataTable AddConstantInt(this DataTable dt, string fldname, int val)
        {
			dt.Columns.Add(new DataColumn(fldname, typeof(int)));
			foreach(DataRow row in dt.Rows)
            {
				row[fldname] = val;
            }
			return dt;
        }

		public static DataTable KeepColumns(this DataTable dt, List<string> cols_to_keep)
        {
			DataTable dtout = dt.Copy();
			foreach (DataColumn dc in dt.Columns)
			{
				string colname = dc.ColumnName.ToLower();

				if (cols_to_keep.Contains(colname))
				{
					//keep it
				}
				else
				{
					dtout.Columns.Remove(colname);
				}
			}

			dtout.AcceptChanges();
			return dtout;

		}

		//public static DataTable ConvertMatchingColumns(DataTable dt_src, DataTable dt_dst)
		//{
		//	//Matching columns will be converted to the data type present in the destination table: dt_dst
		//	List<string> dst_colnames = dt_dst.ColumnNames();

		//	foreach (DataColumn scol in dt_src.Columns)
		//	{
		//		string scolname = scol.ColumnName;
		//		if (dst_colnames.Contains(scol.ColumnName))
		//		{
		//			DataColumn dcol = dt_dst.Columns[scol.ColumnName];

		//			dt_src.ConvertColumnType(scolname, scol.DataType);
		//		}
		//	}

		//	return dt_src;
		//}

		#endregion




		#region Extract just part of the DataTable

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


		public static DataTable Data_SelectColumnXY(DataTable mydt, string xvar, string yvar)
		{
			var coltypeX = mydt.Columns[xvar].DataType;
			var coltypeY = mydt.Columns[yvar].DataType;


			Debug.WriteLine(String.Format("xvar {0} {1}", xvar, coltypeX.Name.ToLower()));
			Debug.WriteLine(String.Format("yvar {0} {1}", yvar, coltypeY.Name.ToLower()));


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
			else if (coltypeX.Name.ToLower().Contains( "int") & coltypeY.Name.ToLower().Contains("int"))
			{
				var qry = mydt.AsEnumerable().Where(f => f.Field<int?>(xvar) != null && f.Field<int?>(yvar) != null)
				.Select(r => new
				{
					id = r.Field<string>("id"),
					x = r.Field<int>(xvar),
					y = r.Field<int>(yvar)
				});

				DataTable data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

				data.ConvertColumnType("x", typeof(double));
				data.ConvertColumnType("y", typeof(double));
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


		public static DataTable SelectColumnXY(DataTable mydt, string xvar, string yvar)
		{
			return SelectColumnXY(mydt, xvar, yvar, new List<string>());
		}

		public static DataTable SelectColumnXY(DataTable mydt, string xvar, string yvar, List<string> othervarstokeep)
		{
			var coltypeX = mydt.Columns[xvar].DataType;
			var coltypeY = mydt.Columns[yvar].DataType;


			DataTable data = new DataTable(); ;

			if (coltypeX.Name.ToLower().Contains("int")) mydt.ConvertColumnType(xvar, typeof(double));
			if (coltypeY.Name.ToLower().Contains("int")) mydt.ConvertColumnType(yvar, typeof(double));

			coltypeX = mydt.Columns[xvar].DataType;
			coltypeY = mydt.Columns[yvar].DataType;


			if (othervarstokeep.Count == 0)
			{
				if (coltypeX.Name.ToLower() == "datetime")
				{
					var qry = mydt.AsEnumerable().Where(f => f.Field<DateTime?>(xvar) != null && f.Field<double?>(yvar) != null)
					.Select(r => new
					{
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
						id = r.Field<string>("id"),
						x = r.Field<double>(xvar),
						y = r.Field<double>(yvar)
					});

					data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);
				}

				if (data != null)
				{
					data.Columns["x"].ColumnName = xvar;
					data.Columns["y"].ColumnName = yvar;

				}
			}
			else
			{
				List<string> varproxy = new List<string>();
				for (int i = 0; i < 5; i++)
				{
					varproxy.Add((i < othervarstokeep.Count) ? othervarstokeep[i] : othervarstokeep[othervarstokeep.Count - 1]);
				}


				if (coltypeX.Name.ToLower() == "datetime")
				{
					var qry = mydt.AsEnumerable().Where(f => f.Field<DateTime?>(xvar) != null && f.Field<double?>(yvar) != null)
					.Select(r => new
					{
						id = r.Field<string>("id"),
						x = r.Field<DateTime>(xvar),
						y = r.Field<double>(yvar),
						v0 = r.Field<string>(varproxy[0]),
						v1 = r.Field<string>(varproxy[1]),
						v2 = r.Field<string>(varproxy[2]),
						v3 = r.Field<string>(varproxy[3]),
						v4 = r.Field<string>(varproxy[4])
					});

					data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);

				}

				else if (coltypeX.Name.ToLower() == "string")
				{
					var qry = mydt.AsEnumerable().Where(f => f.Field<string>(xvar) != null && f.Field<double?>(yvar) != null)
					.Select(r => new
					{
						id = r.Field<string>("id"),
						x = r.Field<string>(xvar),
						y = r.Field<double>(yvar),
						v0 = r.Field<string>(varproxy[0]),
						v1 = r.Field<string>(varproxy[1]),
						v2 = r.Field<string>(varproxy[2]),
						v3 = r.Field<string>(varproxy[3]),
						v4 = r.Field<string>(varproxy[4])

					});

					data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);
				}
				else if (coltypeX.Name.ToLower() == "double")
				{
					var qry = mydt.AsEnumerable()
						.Where(f => f.Field<double?>(xvar) != null && f.Field<double?>(yvar) != null)
					.Select(r => new
					{
						id = r.Field<string>("id"),
						x = r.Field<double>(xvar),
						y = r.Field<double>(yvar),
						v0 = r.Field<string>(varproxy[0]),
						v1 = r.Field<string>(varproxy[1]),
						v2 = r.Field<string>(varproxy[2]),
						v3 = r.Field<string>(varproxy[3]),
						v4 = r.Field<string>(varproxy[4])
					});

					data = CustomLINQtoDataSetMethods.CustomCopyToDataTable(qry);
				}

				if (data != null)
				{
					data.Columns["x"].ColumnName = xvar;
					data.Columns["y"].ColumnName = yvar;

					for (int i = 0; i < 5; i++)
					{
						if (i < othervarstokeep.Count)
						{
							data.Columns["v" + i.ToString()].ColumnName = varproxy[i];
						}
						else
						{
							data.Columns.Remove("v" + i.ToString());
						}
					}

				}
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

		#endregion




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


		public static DataTable AddEmptyColumns(this DataTable dt_data, DataTable dt_empty)
		{
			int ncol1 = dt_data.Columns.Count;
			List<string> existingcols = dt_data.ColumnNames();

			foreach(DataColumn col in dt_empty.Columns)
			{
				if(!existingcols.Contains(col.ColumnName))
				{
					DataColumn newcol = new DataColumn();
					newcol.DataType = col.DataType;
					newcol.ColumnName = col.ColumnName;
					dt_data.Columns.Add(newcol);
				}
			}
			int ncol2 = dt_data.Columns.Count;

			return dt_data;
		}




		public enum JoinType
		{
			/// <summary>
			/// Same as regular join. Inner join produces only the set of records that match in both Table A and Table B.
			/// </summary>
			Inner = 0,
			/// <summary>
			/// Same as Left Outer join. Left outer join produces a complete set of records from Table A, with the matching records (where available) in Table B. If there is no match, the right side will contain null.
			/// </summary>
			Left = 1
		}


		/// <summary>
		/// Joins the passed in DataTables on the colToJoinOn.
		/// <para>Returns an appropriate DataTable with zero rows if the colToJoinOn does not exist in both tables.</para>
		/// </summary>
		/// <param name="dtblLeft"></param>
		/// <param name="dtblRight"></param>
		/// <param name="colToJoinOn"></param>
		/// <param name="joinType"></param>
		/// <returns></returns>
		/// <remarks>
		/// <para>http://stackoverflow.com/questions/2379747/create-combined-datatable-from-two-datatables-joined-with-linq-c-sharp?rq=1</para>
		/// <para>http://msdn.microsoft.com/en-us/library/vstudio/bb397895.aspx</para>
		/// <para>http://www.codinghorror.com/blog/2007/10/a-visual-explanation-of-sql-joins.html</para>
		/// <para>http://stackoverflow.com/questions/406294/left-join-and-left-outer-join-in-sql-server</para>
		/// </remarks>
		public static DataTable JoinTwoDataTablesOnOneColumn(DataTable dtblLeft, DataTable dtblRight, string colToJoinOn, JoinType joinType)
		{
			//Change column name to a temp name so the LINQ for getting row data will work properly.
			string strTempColName = colToJoinOn + "_2";
			if (dtblRight.Columns.Contains(colToJoinOn))
				dtblRight.Columns[colToJoinOn].ColumnName = strTempColName;

			//Get columns from dtblLeft
			DataTable dtblResult = dtblLeft.Clone();

			//Get columns from dtblRight
			var dt2Columns = dtblRight.Columns.OfType<DataColumn>().Select(dc => new DataColumn(dc.ColumnName, dc.DataType, dc.Expression, dc.ColumnMapping));

			//Get columns from dtblRight that are not in dtblLeft
			var dt2FinalColumns = from dc in dt2Columns.AsEnumerable()
								  where !dtblResult.Columns.Contains(dc.ColumnName)
								  select dc;

			//Add the rest of the columns to dtblResult
			dtblResult.Columns.AddRange(dt2FinalColumns.ToArray());

			//No reason to continue if the colToJoinOn does not exist in both DataTables.
			if (!dtblLeft.Columns.Contains(colToJoinOn) || (!dtblRight.Columns.Contains(colToJoinOn) && !dtblRight.Columns.Contains(strTempColName)))
			{
				if (!dtblResult.Columns.Contains(colToJoinOn))
					dtblResult.Columns.Add(colToJoinOn);
				return dtblResult;
			}

			switch (joinType)
			{

				default:
				case JoinType.Inner:
					#region Inner
					//get row data
					//To use the DataTable.AsEnumerable() extension method you need to add a reference to the System.Data.DataSetExtension assembly in your project. 
					var rowDataLeftInner = from rowLeft in dtblLeft.AsEnumerable()
										   join rowRight in dtblRight.AsEnumerable() on rowLeft[colToJoinOn] equals rowRight[strTempColName]
										   select rowLeft.ItemArray.Concat(rowRight.ItemArray).ToArray();


					//Add row data to dtblResult
					foreach (object[] values in rowDataLeftInner)
						dtblResult.Rows.Add(values);

					#endregion
					break;
				case JoinType.Left:
					#region Left
					var rowDataLeftOuter = from rowLeft in dtblLeft.AsEnumerable()
										   join rowRight in dtblRight.AsEnumerable() on rowLeft[colToJoinOn] equals rowRight[strTempColName] into gj
										   from subRight in gj.DefaultIfEmpty()
										   select rowLeft.ItemArray.Concat((subRight == null) ? (dtblRight.NewRow().ItemArray) : subRight.ItemArray).ToArray();


					//Add row data to dtblResult
					foreach (object[] values in rowDataLeftOuter)
						dtblResult.Rows.Add(values);

					#endregion
					break;
			}

			//Change column name back to original
			dtblRight.Columns[strTempColName].ColumnName = colToJoinOn;

			//Remove extra column from result
			dtblResult.Columns.Remove(strTempColName);

			return dtblResult;
		}
	

	public static DataTable WidenRelData(this DataTable dt, List<string> vars_to_move, List<string> new_vars, string var_to_joinby
			, string var_to_divide_rows, string divide_val1, string divide_val2)
		{
		

			DataTable dtcopy = dt.Copy();

			Debug.WriteLine(String.Format("dt     nrows:{0}", dt.Rows.Count));
			Debug.WriteLine(String.Format("dtcopy nrows:{0}", dtcopy.Rows.Count));



			DataTable dt1 = dt.AsEnumerable().Where(f => f.Field<string>(var_to_divide_rows) == divide_val1).CopyToDataTable();
			Debug.WriteLine(String.Format("dt1          nrows:{0}", dt1.Rows.Count));

			DataTable dt2orignames = dtcopy.AsEnumerable().Where(f => f.Field<string>(var_to_divide_rows) == divide_val2).CopyToDataTable();
			Debug.WriteLine(String.Format("dt2orignames nrows:{0}", dt2orignames.Rows.Count));


			//Rename vars in the REL copy
			foreach (DataColumn col in dt2orignames.Columns)
			{
				string newv = "";
				for(int j=0; j < vars_to_move.Count; j++)
				{
					if (col.ColumnName == vars_to_move[j]) newv = new_vars[j]; 
				}
				if (col.ColumnName != var_to_joinby & newv != "")  col.ColumnName = newv;
			}

			DataTable dt2newnames = dt2orignames.Copy();

			List<string> cols_to_remove = new List<string>();

			for(int i=0; i < dt2newnames.Columns.Count; i++)
			{
				DataColumn col = dt2newnames.Columns[i];
				bool deletecol = true;
				if (new_vars.Contains(col.ColumnName)) deletecol = false;
				if (col.ColumnName == var_to_joinby) deletecol = false;

				if (deletecol) cols_to_remove.Add(col.ColumnName);
			}

			foreach (string d in cols_to_remove)
			{
				dt2newnames.Columns.Remove(d);
			}

			DataTable dt2 = dt2newnames.Copy();

			DataTable dtWide = JoinTwoDataTablesOnOneColumn(dt1, dt2, var_to_joinby, JoinType.Left);

			//var qryWide = dt1.AsEnumerable()
			//	.GroupJoin(
			//		dt2.AsEnumerable(),
			//		dr1 => new { key1 = dr1[var_to_joinby] },
			//		dr2 => new { key1 = dr2[var_to_joinby] },    //{ key1 = dr2["Key"], key2 = dr2["Key2"] },
			//		(dr1, result) =>
			//			dr1.ItemArray
			//			.Concat(result.Any() ? result.First().ItemArray : Enumerable.Empty<object>())
			//			.ToList());

			//DataTable dtWide = qryWide.CustomCopyToDataTable();

			return dtWide;
			
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


		public static void log(string s)
		{
			//if (printDebug)
			//{
				Debug.Print(s);
			//}
		}


	}

}
