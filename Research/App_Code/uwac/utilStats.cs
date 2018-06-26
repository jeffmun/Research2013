using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Text;
using System.Reflection;
using NReco.PivotData;
using NReco.PivotData.Output;
using LinqStatistics;
using MathNet.Numerics.Statistics;
using uwac;

namespace uwac
{
	/// <summary>
	/// Summary description for DataTable_utils
	/// </summary>
	public class utilStats
	{
		public utilStats()
		{
			//
			// TODO: Add constructor logic here
			//


		}



		#region Get Data Fields

		public static List<string> GetDataFlds_ToList(string tblname, int desctype)
		{
			List<int> desctypes = new List<int>();
			desctypes.Add(desctype);

			List<string> flds = GetDataFlds_ToList(tblname, desctypes);
			return flds;
		}

		public static List<string> GetDataFlds_ToList(string tblname, List<int> desctype)
		{
			SQL_utils sql = new SQL_utils();

			string desctypes_csv = String.Join<int>(",", desctype);

			int n_cont_flds = sql.IntScalar_from_SQLstring("select coalesce(count(*),0) from vwDataFlds where InAnalysis=2 and tbl= '" + tblname + "'");
			string getflds = "";
			if (n_cont_flds > 0)
			{   //staff selected variables are available
				getflds = "select * from vwDataFlds where InAnalysis in (" + desctypes_csv + ") and tbl= '" + tblname + "'";
			}
			else
			{   //No staff selected vars so use the defaults
				getflds = "select * from vwDataFlds where Default_InAnalysis in (" + desctypes_csv + ") and tbl= '" + tblname + "'";
			}

			DataTable dt_flds = sql.DataTable_from_SQLstring(getflds);

			List<string> fldlist= dt_flds.AsEnumerable().Select(s => s.Field<string>("fld")).ToList<string>();

			return fldlist;
		}

		public static string GetDataFlds(string tblname, int desctype)
		{
			List<int> desctypes = new List<int>();
			desctypes.Add(desctype);

			string flds = GetDataFlds(tblname, desctypes);
			return flds;
		}

		public static string GetDataFlds(string tblname, List<int> desctype)
		{
			SQL_utils sql = new SQL_utils();

			string desctypes_csv = String.Join<int>( ",", desctype);

			int n_cont_flds = sql.IntScalar_from_SQLstring("select coalesce(count(*),0) from vwDataFlds where InAnalysis=2 and tbl= '" + tblname + "'");
			string getflds = "";
			if (n_cont_flds > 0)
			{   //staff selected variables are available
				getflds = "select * from vwDataFlds where InAnalysis in (" + desctypes_csv + ") and tbl= '" + tblname + "'";
			}
			else
			{   //No staff selected vars so use the defaults
				getflds = "select * from vwDataFlds where Default_InAnalysis in (" + desctypes_csv + ") and tbl= '" + tblname + "'";
			}

			DataTable dt_flds = sql.DataTable_from_SQLstring(getflds);
			
			string[] fldarray = dt_flds.AsEnumerable().Select(s => s.Field<string>("fld")).ToArray<string>();

			string flds = "";

			if (fldarray.Length == 0)
			{
				return flds;
			}
			else if (fldarray.Length == 1) flds = fldarray[0];
			else if (fldarray.Length > 1) flds = String.Join(",", fldarray);
			return flds;
		}

		public static string GetDataFlds_byDataProject(int dataproj_pk, string tblname, int measureID)
		{
			List<int> vars = new List<int> {0 };
			return GetDataFlds_byDataProject(dataproj_pk, tblname, measureID, vars);
		}

		public static string GetDataFlds_byDataProject(int dataproj_pk, string tblname, int measureID, List<int> vars)
		{
			SQL_utils sql = new SQL_utils();

			string vars_csv = String.Join(",", vars.ToString());

			string vars_where = "";
			if (vars.Count == 1 & vars[0] == 0) vars_where = "";
			else vars_where = String.Format(" and fldpk in ({0})", vars_csv);

			int n_cont_flds;
			if (dataproj_pk > 0)
			{
				n_cont_flds = sql.IntScalar_from_SQLstring("select coalesce(count(*),0) from dp.Var where measureID=" + measureID.ToString() + " and dataproj_pk=" + dataproj_pk.ToString() + vars_where);
			}
			else
			{
				n_cont_flds = sql.IntScalar_from_SQLstring("select coalesce(count(*),0) from def.vwFld where measureID=" + measureID.ToString() + " and InAnalysis > 0");
			}
			string getflds = "";

			
			if (n_cont_flds > 0)
			{   //staff selected variables are available
				//getflds = "select * from dp.vwVar where dataproj_pk=" + dataproj_pk.ToString() + " and tbl= '" + tblname + "'";

				getflds = (dataproj_pk > 0) ? "select fldname from dp.Var a join def.vwFld b ON a.fldpk=b.fldpk where dataproj_pk=" + dataproj_pk.ToString() + " and tblname= '" + tblname + "'" :
					"select fldname from def.vwFld b where tblname= '" + tblname + "' and InAnalysis > 0";


				DataTable dt_flds = sql.DataTable_from_SQLstring(getflds);

				string[] fldarray = dt_flds.AsEnumerable().Select(s => s.Field<string>("fldname")).ToArray<string>();

				string flds = "";

				if (fldarray.Length == 0)
				{
					return flds;
				}
				else if (fldarray.Length == 1) flds = fldarray[0];
				else if (fldarray.Length > 1) flds = String.Join(",", fldarray).ToLower();

				return ", " + flds;
			}
			else
			{
				return ", 'No variables selected for this measure' as info_msg ";
			}
			

		}



		public static string GetRELFlds_byDataProject(int dataproj_pk, string tblname, int measureID)
		{
			SQL_utils sql = new SQL_utils();

			int n_cont_flds = sql.IntScalar_from_SQLstring("select coalesce(count(*),0) from dp.Var where measureID=" + measureID.ToString() + " and dataproj_pk=" + dataproj_pk.ToString());
			string getflds = "";
			if (n_cont_flds > 0)
			{   //staff selected variables are available
				//getflds = "select * from dp.vwVar where dataproj_pk=" + dataproj_pk.ToString() + " and tbl= '" + tblname + "'";

				getflds = "select 'REL_' + fldname as fldname from dp.Var a join def.vwFld b ON a.fldpk=b.fldpk where dataproj_pk=" + dataproj_pk.ToString() + " and tblname= '" + tblname + "'";


				DataTable dt_flds = sql.DataTable_from_SQLstring(getflds);

				string[] fldarray = dt_flds.AsEnumerable().Select(s => s.Field<string>("fldname")).ToArray<string>();

				string flds = "";

				if (fldarray.Length == 0)
				{
					return flds;
				}
				else if (fldarray.Length == 1) flds = fldarray[0];
				else if (fldarray.Length > 1) flds = String.Join(",", fldarray).ToLower();

				return ", " + flds;
			}
			else
			{
				return ", 'No variables selected for this measure' as info_msg ";
			}


		}


		public static string GetFieldList(string tblname)
		{
			SQL_utils sql = new SQL_utils();

			//DataTable dt_flds = sql.DataTable_from_SQLstring("select databasefield from uwautism_research_data..dat FieldInfo where InAnalysis in (1,2) and " +
			//    " databasefield not in ('studymeasID','verified','indexnum') and " +
			//   " fielddatatype in ('int','float','smallint','bigint') and databasetable= '" + tblname + "'");

			DataTable dt_flds = sql.DataTable_from_SQLstring("select fldname from uwautism_research_data.def.vwFld where InAnalysis in (1,2) and " +
				" fldname not in ('studymeasID','verified','indexnum') and " +
			   "  fielddatatype in ('int','float','smallint','bigint') and tblname= '" + tblname + "'");

			string[] fldarray = dt_flds.AsEnumerable().Select(s => s.Field<string>("fldname")).ToArray<string>();

			string flds = "";

			if (fldarray.Length == 0) flds = "a.studymeasID";
			else if (fldarray.Length == 1) flds = fldarray[0];
			else if (fldarray.Length > 1) flds = String.Join(",", fldarray);
			return flds;
		}


		public static string GetFieldListDiscrete(string tblname)
		{
			SQL_utils sql = new SQL_utils();

			//DataTable dt_flds = sql.DataTable_from_SQLstring("select databasefield from uwautism_research_data..dat FieldInfo where InAnalysis in (3) and " +
			//    " databasefield not in ('studymeasID','verified','indexnum') and " +
			//   " databasetable= '" + tblname + "'");

			DataTable dt_flds = sql.DataTable_from_SQLstring("select fldname from uwautism_research_data.def.vwFld where InAnalysis in (3) and " +
				" fldname not in ('studymeasID','verified','indexnum') and " +
			   " tblname= '" + tblname + "'");

			string[] fldarray = dt_flds.AsEnumerable().Select(s => s.Field<string>("fldname")).ToArray<string>();

			string flds = "";

			if (fldarray.Length == 0) flds = "a.studymeasID";
			else if (fldarray.Length == 1) flds = fldarray[0];
			else if (fldarray.Length > 1) flds = String.Join(",", fldarray);
			return flds;
		}
		#endregion 



		#region DataTable Summary
		public static DataSet DataTable_Summary(DataTable dt, DataTable vars)
		{
			DataSet dssummary = new DataSet();


			var vars_numeric = from row in vars.AsEnumerable()
							where row.Field<string>("DataType") == "numeric"
							select row.Field<string>("varname");

			var vars_text= from row in vars.AsEnumerable()
							where row.Field<string>("DataType") == "text"
							select row.Field<string>("varname");

			if (vars_numeric.Any())
			{
				DataTable dt_numeric = dt.DefaultView.ToTable(dt.TableName, false, vars_numeric.ToArray<string>());
				dt_numeric = ChangeColumnTypes_to_Double(dt_numeric);

				DataTable summary_dt_numeric = DataTable_DescStats(dt_numeric);

				//Add labels
				foreach (DataRow r in summary_dt_numeric.Rows)
				{
					string var = r["Variable"].ToString();
					var label = from row in vars.AsEnumerable()
								where row.Field<string>("varname") == var
								select row.Field<string>("FieldLabel");

					r["Label"] = label.First().ToString();
				}

				dssummary.Tables.Add(summary_dt_numeric);
			}

			if (vars_text.Any())
			{
				DataTable dt_text = dt.DefaultView.ToTable(dt.TableName, false, vars_text.ToArray<string>());

				DataTable summary_dt_text = DataTable_Summary_text(dt_text);



				foreach (DataRow r2 in summary_dt_text.Rows)
				{
					string var2 = r2["Variable"].ToString();
					var label_text = from row in vars.AsEnumerable()
									 where row.Field<string>("varname") == var2
									 select row.Field<string>("FieldLabel");

					r2["Label"] = label_text.First().ToString();
				}

				dssummary.Tables.Add(summary_dt_text);
			}

			return dssummary;

		}


		public static DataTable DataTable_Summary_text(DataTable dt)
		{
			//Provides summary of any DataTable with relevent info based on whether a field is numeric or text 

			DataTable dtOut = new DataTable();
			dtOut.Columns.Add("Variable", typeof(string));
			dtOut.Columns.Add("Label", typeof(string));
			dtOut.Columns.Add("N", typeof(int));
			dtOut.Columns.Add("Nunq", typeof(int));
			dtOut.Columns.Add("Min_Length", typeof(int));
			dtOut.Columns.Add("Max_Length", typeof(int));
			dtOut.Columns.Add("Min_Value", typeof(string));
			dtOut.Columns.Add("Max_Value", typeof(string));

			int N;
			int Nunq;
			string dataType;
			int Min_Length;
			int Max_Length;
			string Min_Value;
			string Max_Value;

			foreach (DataColumn col in dt.Columns)
			{
				N = 0; Nunq = 0; Min_Length = 0; Max_Length = 0; Min_Value = null; Max_Value = null;
				if (col.IsNumeric())
				{
					N = dt.AsEnumerable()
						.Select(r => r.Field<Double>(col))   
						.Count();                            
					Nunq = dt.AsEnumerable()                 
						.Select(r => r.Field<Double>(col))   
						.Distinct()                          
						.Count();                            
															 
					Min_Length = 0;                          
					Max_Length = 0;                          
															 
					Min_Value = dt.AsEnumerable()            
						.Select(r => r.Field<Double>(col))   
						.Min().ToString();                   
					Max_Value = dt.AsEnumerable()            
						.Select(r => r.Field<Double>(col))   
						.Max().ToString();
					dataType = "Numeric";
				}
				else
				{
					N = dt.AsEnumerable()
						.Where(r => r.Field<string>(col) != "")
						.Select(r => r.Field<string>(col))  
						.Count();
					Nunq = dt.AsEnumerable()
						.Where(r => r.Field<string>(col) != "")
						.Select(r => r.Field<string>(col))   
						.Distinct()                          
						.Count();                            
					Min_Length = dt.AsEnumerable()           
						.Select(r => r.Field<string>(col))   
						.Min(r => r.Length);                 
					Max_Length = dt.AsEnumerable()           
						.Select(r => r.Field<string>(col))   
						.Max(r => r.Length);                 
					Min_Value = dt.AsEnumerable()
						.Where(r => r.Field<string>(col) != "")
						.Select(r => r.Field<string>(col))   
						.Min();                              
					Max_Value = dt.AsEnumerable()
						.Where(r => r.Field<string>(col) != "")
						.Select(r => r.Field<string>(col))   
						.Max();
					dataType = "string";


				}

				if (Min_Value != null) dtOut.Rows.Add(col.ColumnName, dataType, N, Nunq, Min_Length, Max_Length, Min_Value, Max_Value);
			}

			return dtOut;
		}

		#endregion




		#region Descriptive Stats - Overloads
		public static DataTable DataTable_DescStats(DataTable dt, string tblname, bool missingremoved)
		{
			DataTable dtOut = DataTable_DescStats(dt, tblname, false, missingremoved);
			return dtOut;
		}

		public static DataTable DataTable_DescStats(DataTable dt, string tblname, bool missingremoved, List<string> requested_stats)
		{
			DataTable dtOut = DataTable_DescStats(dt, tblname, false, missingremoved, requested_stats);
			return dtOut;
		}

		public static DataTable DataTable_DescStats(DataTable dt, string tblname, bool extra_stats, bool missingremoved)
		{

			if (tblname == "")
			{
				DataTable dtOut = DataTable_DescStats(dt, extra_stats);
				return dtOut;
			}
			else
			{

				DataTable dt_missing_removed = DataTable_MissingToNULL(dt, tblname, missingremoved);
				dt_missing_removed.TableName = tblname;
				DataTable dtOut = DataTable_DescStats(dt_missing_removed, extra_stats);
				return dtOut;
			}
		}

		public static DataTable DataTable_DescStats(DataTable dt, string tblname, bool extra_stats, bool missingremoved, List<string> requested_stats)
		{

			if (tblname == "")
			{
				DataTable dtOut = DataTable_DescStats(dt, extra_stats, requested_stats);
				return dtOut;
			}
			else
			{

				DataTable dt_missing_removed = DataTable_MissingToNULL(dt, tblname, missingremoved);
				dt_missing_removed.TableName = tblname;
				DataTable dtOut = DataTable_DescStats(dt_missing_removed, extra_stats, requested_stats);
				return dtOut;
			}
		}

		public static DataTable DataTable_DescStats(DataTable dt)
		{
			List<string> requested_stats = new List<string> { "M", "SD", "N" };
			DataTable dt_dict = new DataTable();
			DataTable dtOut = DataTable_DescStats(dt, dt_dict, false, requested_stats);
			return dtOut;
		}
		


		public static DataTable DataTable_DescStats(DataTable dt_input, bool extra_stats)
		{
			List<string> requested_stats = new List<string> { "M", "SD", "N" };
			DataTable dt_dict = new DataTable();
			DataTable dt = DataTable_DescStats(dt_input, dt_dict, extra_stats, requested_stats);
			return dt;
		}

		public static DataTable DataTable_DescStats(DataTable dt_input, bool extra_stats, List<string> requested_stats)
		{
			DataTable dt_dict = new DataTable();
			DataTable dt = DataTable_DescStats(dt_input, dt_dict, extra_stats, requested_stats);
			return dt;
		}
		#endregion

		
		/// <summary>
		/// THIS CALCULATES THE DESCRIPTIVE STATS
		/// </summary>
		/// <param name="dt_input"></param>
		/// <param name="dt_dict"></param>
		/// <param name="extra_stats"></param>
		/// <param name="requested_stats"></param>
		/// <returns></returns>

		public static DataTable DataTable_DescStats(DataTable dt_input, DataTable dt_dict, bool extra_stats, List<string> requested_stats)
		{
			//Assumes that missing values have been removed 
			
			//The following takes too long for the IntHx data, thus skipped for
			//now.
			
			//DataTable dt = ChangeColumnTypes_to_Double(dt_input);

			DataTable dt = dt_input;

			//SQL_utils sql = new SQL_utils();

			if (dt.Rows.Count == 0)
			{
				DataTable dtOut = new DataTable();
				dtOut.Columns.Add("Variable", typeof(string));
				string Variable = "No records in original DataTable";
				dtOut.Rows.Add(Variable);
				return dtOut;
			}
			else
			{
				DataTable dtOut = new DataTable();
				dtOut.Columns.Add("Variable", typeof(string));
				dtOut.Columns.Add("Label", typeof(string));
				dtOut.Columns.Add("stat", typeof(string));
				dtOut.Columns.Add("statvalue", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));


				List<string> cols_to_skip = new List<string> { "timepoint", "timepointnum", "indexnum", "studymeasID", "verified", "DE_link" };

				foreach (DataColumn col in dt.Columns)
				{
					bool skipThisCol = cols_to_skip.Any(s => col.ColumnName.Contains(s));
					bool isnumeric = col.IsNumeric();
					string str_label = "";

					if (isnumeric & !skipThisCol)
					{
						//Convert the numeric column to double
						var data = dt.AsEnumerable().Where(r => !r.IsNull(col.ColumnName))
							.Select(x => Convert.ToDouble(x[col.ColumnName]));

						if (dt_dict != null)
						{
							try
							{
								str_label = dt_dict.AsEnumerable().Where(r => r.Field<string>("varname") == col.ColumnName).Select(r => r.Field<string>("FieldLabel")).First();
							}
							catch(Exception ex)
							{
								string x = ex.Message;
								str_label = "x";
							}
						}
						else
						{
							str_label = ".";
						}
 
						foreach (string stat in requested_stats)
						{
							double? statvalue = null;
							//Calculate the requested stats
							if (stat == "N") statvalue = data.Count();
							else if (stat == "Nunq") statvalue = data.Distinct().Count();

							else if (data.Count() > 0)
							{

								int numdigits = 2;

								if (stat == "M") statvalue = Math.Round(data.Average(), numdigits);
								//Median = data.Median();
								else if (stat == "Median") statvalue = LinqStatistics.EnumerableStats.Median(data);

								//var data1 = data.Where(x => x < Median); var data2
								//= data.Where(x => x > Median);

								//Qtr1 = LinqStatistics.EnumerableStats.Median(data1);
								//Qtr3 = LinqStatistics.EnumerableStats.Median(data2);

								else if (stat == "Mode") statvalue = data.Mode();

								else if (stat == "SD")
								{
									if (data.Count() > 1)
									{
										statvalue = Math.Round(LinqStatistics.EnumerableStats.StandardDeviation(data), numdigits);
									}
									else
									{
										statvalue = null;
									}
								}
								else if (stat == "Min") statvalue = Math.Round(data.Min(), numdigits);
								else if (stat == "Max") statvalue = Math.Round(data.Max(), numdigits);
								else if (stat == "Sum") statvalue = Math.Round(data.Sum(), numdigits);


								//if(extra_stats)
								//{
								//    dtOut.Rows.Add(Variable, Label, N, M, SD, Min, Max, Nunq, Median, Mode, Sum);
								//    //dtOut.Rows.Add(Variable, Label, N, M, SD, Min, Max, Nunq, Qtr1, Median, Qtr3, Mode, Sum);
								//}
								//else
								//{
								//    dtOut.Rows.Add(Variable, Label, N, M, SD, Min, Max);
								//}
							}

							dtOut.Rows.Add(col.ColumnName, str_label, stat, statvalue);
						}

					}

				}

				return dtOut;
			}
		}





		#region Descriptive Stats By Group - Overloads
		public static DataTable DataTable_DescStats_ByGroup(DataTable dt, string tblname, string groupvar)
		{
			List<string> groupvars = new List<string> { groupvar };
			DataTable dtOut = DataTable_DescStats_ByGroup(dt, tblname, groupvars, "stacked", false);
			return dtOut;
		}

		public static DataTable DataTable_DescStats_ByGroup(DataTable dt, string tblname, string groupvar, string stackwide)
		{
			List<string> groupvars = new List<string> { groupvar };
			DataTable dtOut = DataTable_DescStats_ByGroup(dt, tblname, groupvars, stackwide, false);
			return dtOut;
		}

		public static DataTable DataTable_DescStats_ByGroup(DataTable dt, string tblname, List<string> groupvars)
		{
			DataTable dtOut = DataTable_DescStats_ByGroup(dt, tblname, groupvars, "stacked", false);
			return dtOut;
		}
		public static DataTable DataTable_DescStats_ByGroup(DataTable dt, string tblname, List<string> groupvars, bool missingremoved)
		{
			DataTable dtOut = DataTable_DescStats_ByGroup(dt, tblname, groupvars, "stacked", missingremoved);
			return dtOut;
		}
		public static DataTable DataTable_DescStats_ByGroup(DataTable dt, string tblname, List<string> groupvars, string stackwide, bool missingremoved)
		{
			List<string> requested_stats = new List<string> { "M", "SD", "N" };
			DataTable dt_dict = new DataTable();
			DataTable dtOut = DataTable_DescStats_ByGroup(dt, tblname, dt_dict, groupvars, stackwide, missingremoved, requested_stats);
			return dtOut;

		}
		#endregion


		public static DataTable DataTable_DescStats_ByGroup(DataTable dt, string tblname, DataTable dt_dict, List<string> groupvars, string stackwide, bool missingremoved, List<string> requested_stats )
		{
			string tracker = "";

			DataTable dtMerged = new DataTable();
			try
			{

				DataSet dsOut = new DataSet();
				if (dt.Rows.Count == 0)
				{
					//NO DATA
					DataTable dtOut = new DataTable();
					dtOut.Columns.Add("Variable", typeof(string));
					string Variable = "No records in original DataTable";
					dtOut.Rows.Add(Variable);
					return dtOut;
				}
				else if (groupvars[0] == "" | groupvars == null)
				{
					//NO GROUPING REQUIRED
					DataTable dt_missing_removed = DataTable_MissingToNULL(dt, dt_dict, tblname, missingremoved);
					DataTable dtOut = DataTable_DescStats(dt_missing_removed, dt_dict, missingremoved, requested_stats);
					return dtOut;
				}
				else
				{
					tracker += "1";
					//SUBGROUPS
					DataTable dt_missing_removed = DataTable_MissingToNULL(dt, dt_dict, tblname, missingremoved);
					DataTable dt_grand = DataTable_DescStats(dt_missing_removed, dt_dict, missingremoved, requested_stats);

					//Split the table into each subgroup 
					List<DataTable> dts = qryGroupBy(dt_missing_removed, tblname, groupvars);
					List<DataTable> dts_stats = new List<DataTable>();

					//Loop through and calculate the DescStats
					for (int g = 0; g < dts.Count; g++)
					{
						tracker += "2";

						DataTable dtstats = DataTable_DescStats(dts[g], tblname, missingremoved, requested_stats);

						//Add columns for the grouping vars
						//for (int s = 0; s < groupvars.Count; s++)
						foreach (string s in groupvars.Reverse<string>())  //Reverse so that the first var in the list is placed at the beginning of the datatable
						{
							tracker += "3";

							//dtstats.Columns.Add(groupvars[s], typeof(string)).SetOrdinal(0);
							//DataColumn col = dtstats.Columns[groupvars[s]];
							dtstats.Columns.Add(s, typeof(string)).SetOrdinal(0);
							DataColumn col = dtstats.Columns[s];
						}

						#region Z values
						////Add Z column
						//dtstats.Columns.Add("Z", typeof(double));
						//DataColumn colZ = dtstats.Columns["Z"];
						//dtstats.Columns.Add("Zgraph", typeof(string));
						//DataColumn colZg = dtstats.Columns["Zgraph"];

						//Get new values
						foreach (DataRow row in dtstats.Rows)
						{
							tracker += "4";

							//Populate grouping variables
							for (int k = 0; k < groupvars.Count; k++)
							{
								row[groupvars[k]] = dts[g].AsEnumerable().Select(r => r[groupvars[k]]).First().ToString(); // rowGroup.Key.v1.ToString();
							}

							////Calculate Z
							//int curr_N = row.Field<int>("N");
							//string curr_Variable = row.Field<string>("Variable").ToString();
							//double? curr_M = row.Field<double?>("M");

							//double? grandM = dt_grand.AsEnumerable().Where(r => r.Field<string>("Variable") == curr_Variable).Select(r => r.Field<double?>("M")).First();
							//double? grandSD = dt_grand.AsEnumerable().Where(r => r.Field<string>("Variable") == curr_Variable).Select(r => r.Field<double?>("SD")).First();

							//if (grandSD != null & grandM != null & curr_M != null)
							//{
							//    tracker += "5";
							//    double gSD = (double)grandSD;
							//    tracker += "a";
							//    double gM = (double)grandM;
							//    tracker += "b";
							//    double cM = (double)curr_M;
							//    tracker += "c";
							//    row["Z"] = (curr_N > 1 & grandSD > 0) ? Math.Round((cM - gM) / gSD, 2) : 0;  //Zero if N==0
							//    tracker += "d";
							//}
							//else
							//{
							//    tracker += "6";
							//    row["Z"] = DBNull.Value;
							//}

							//row["Zgraph"] = "";
						}
						#endregion 


						dts_stats.Add(dtstats);

					}


					//Combine the results 

					if (stackwide == "stacked")
					{
						dtMerged = AddRows(dts_stats);
					}
					else if (stackwide == "wide")
					{
						//dtMerged = AddColumns(dts_stats[0], dts_stats[1], "Variable", "1");
						dtMerged = AddColumns(dts_stats, "Variable");
					}


					//Remove the rows of the groupvars variables
					for (int i = 0; i < dtMerged.Rows.Count; i++)
					{
						DataRow row = dtMerged.Rows[i];
						string v = row["Variable"].ToString();
						if (groupvars.Contains(v))
						{
							dtMerged.Rows.Remove(row);
						}

					}

					return dtMerged;
				}
			}
			catch (Exception ex)
			{
				if (ex.Message == "Sequence contains no elements" & dtMerged != null)
				{
					//do nothing
					return dtMerged;
				}
				else
				{
					throw new Exception("ERROR!! " + tracker + ex.Message + "...." + ex.StackTrace.ToString() + "...." + ex.Source.ToString());
				}
			}
		}




		#region Misc Utilities
		public static DataSet ChangeColumnTypes_to_Double(DataSet ds)
		{
			DataSet ds_out = new DataSet();
			//foreach(DataTable dt in ds.Tables)
			for (int i = 0; i < ds.Tables.Count; i++ )
			{
				DataTable dt_out = ChangeColumnTypes_to_Double(ds.Tables[i]);
				dt_out.TableName = ds.Tables[i].TableName;
				ds_out.Tables.Add(dt_out);
			}
			return ds_out;
		}




		public static DataTable ChangeColumnTypes_to_Double(DataTable dt)
		{
			DataTable dtnew = new DataTable();
			foreach (DataColumn c in dt.Columns)
			{
				string p = c.ColumnName;
				DataColumn newcol = new DataColumn();
				newcol.DataType = typeof(double);
				newcol.AllowDBNull = true;
				newcol.ColumnName = p;
				dtnew.Columns.Add(newcol);
			}

			foreach (System.Data.DataRow dr in dt.Rows)
			{   // Will need switch Case for others if Date is not the only one.
				//dr[p + "_new"] = DateTime.FromOADate(double.Parse(dr[p].ToString())); // dr[p].ToString();

				DataRow drnew = dtnew.NewRow();

				foreach (DataColumn c in dt.Columns)
				{
					string p = c.ColumnName;
					try
					{
						//dr[p] = double.Parse(dr[p].ToString()); // dr[p].ToString();
						if (dr[p].ToString() != "")
						{
							drnew[p] = double.Parse(dr[p].ToString()); // dr[p].ToString();
						}
						else
						{
							drnew[p] = DBNull.Value;
						}
					}
					catch (Exception ex)
					{
						string x = ex.Message;
						drnew[p] = DBNull.Value;
					}
				}

				dtnew.Rows.Add(drnew);

			}

			return dtnew;
		}


		public static DataTable StackData(DataTable dt, List<string> vars_to_keep, List<string> vars_to_stack)
		{
			//returns a DataTable in which the vars_to_stack become represented in a "Variable" and "Value" column
			List<DataTable> dts = new List<DataTable>();
			foreach(string v in vars_to_stack)
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

			foreach(DataColumn col in dt.Columns)
			{
				if(fields_to_keep.Contains(col.ColumnName))
				{
					retVal.Columns.Add(col.ColumnName,  col.DataType);
				}
			}
			retVal.Columns.Add("Variable", typeof(string));
			retVal.Columns.Add("Value", typeof(double));


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

				newRow["Variable"] = var_to_stack;
				newRow["Value"] = curRow[var_to_stack];


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






		public static DataTable AddColumns (DataTable dt1, DataTable dt2, string matchcol, string suffix)
		{
			DataTable dt1copy = dt1.Clone();

			//Columns from dt2
			var dt2Columns = dt2.Columns.OfType<DataColumn>().Select(dc =>
				new DataColumn(dc.ColumnName + suffix, dc.DataType, dc.Expression, dc.ColumnMapping));
			//Add cols from dt2 into dt1
			dt1copy.Columns.AddRange(dt2Columns.ToArray());

			var rowData =
				from row1 in dt1.AsEnumerable()
				join row2 in dt2.AsEnumerable()
					on row1.Field<string>(matchcol) equals row2.Field<string>(matchcol)
				select row1.ItemArray.Concat(row2.ItemArray).ToArray();
			foreach (object[] values in rowData)
				dt1copy.Rows.Add(values);

			return dt1copy;
		}


		public static DataTable AddColumns(List<DataTable> dts, string matchcol)
		{
			DataTable dtTmp = new DataTable();
			DataTable dtOut = new DataTable();

			for (int i = 0; i < dts.Count; i++)
			{
				if (i == 0)
				{
					dtTmp = dts[i];
				}
				else
				{
					dtTmp = AddColumns(dtTmp, dts[i], matchcol, i.ToString());
					//dtTmp = dtOut.Copy();
				}

			}
			return dtTmp;
		}




		public static List<DataTable> qryGroupBy(DataTable dt, string tblname, List<string> groupvars)
		//public static string qryGroupBy(DataTable dt, string tblname, List<string> vars)
		{
			List<DataTable> dt_groups = new List<DataTable>();
			try
			{

					// from: http://www.scriptscoop.net/t/7516b362c821/c-c-linq-how-to-build-group-by-clause-dynamically.html
					IEnumerable<string> columnsToGroupBy = groupvars;
					var groups = dt.AsEnumerable()
								.GroupBy(r => new NTuple<object>(from column in columnsToGroupBy select r[column]));

					foreach (var group in groups)
					{
						DataTable dtSub = group.CopyToDataTable();

						//List<string> keyvalues = group.Key.Values[0].ToString();
						List<string> keyvalues = new List<string>();
						foreach(var s in group.Key.Values)
						{
							keyvalues.Add(s.ToString());
						}


						//dtSub.TableName = tblname + ">> " + String.Join(",", keyvalues);
						dtSub.TableName =  String.Join(",", keyvalues);


						dt_groups.Add(dtSub);
						//foreach (var keyValue in group.Key.Values)
						//{ }
					}
				
			}
			catch(Exception ex)
			{
				throw new Exception("ERROR! qryGroupBy  Msg:" + ex.Message + "............." + ex.StackTrace.ToString());
			}
			return dt_groups;
		}




		public static List<DataTable> qryGroupBy(DataTable dt, string tblname, List<string> groupvars, List<string> orderby)
		//public static string qryGroupBy(DataTable dt, string tblname, List<string> vars)
		{
			string orderby1 = orderby[0];

			List<DataTable> dt_groups = new List<DataTable>();
			try
			{

				// from: http://www.scriptscoop.net/t/7516b362c821/c-c-linq-how-to-build-group-by-clause-dynamically.html
				IEnumerable<string> columnsToGroupBy = groupvars;
				IEnumerable<string> columnsToOrderBy = orderby;
				var groups = dt.AsEnumerable()
							.GroupBy(r => new NTuple<object>(from column in columnsToGroupBy select r[column]));

				//groups.OrderBy

				foreach (var group in groups)
				{
					DataTable dtSub = group.CopyToDataTable();

					//List<string> keyvalues = group.Key.Values[0].ToString();

					dtSub.TableName = tblname + ">> " + group.Key.Values[0].ToString();

					dt_groups.Add(dtSub);
					//foreach (var keyValue in group.Key.Values)
					//{ }
				}

			}
			catch (Exception ex)
			{
				throw new Exception("ERROR! qryGroupBy  Msg:" + ex.Message + "............." + ex.StackTrace.ToString());
			}
			return dt_groups;
		}

		//public static List<DataTable> DataTable_Crosstab(DataTable dt, string var, List<string> groupvars)
		//{
		//    string[] grpvars = new string[] {"group","timepoint_text","ados2_mod"};

		//    var pivotData = new PivotData(
		//        grpvars,
		//        new CountAggregatorFactory(),
		//        new DataTableReader(dt));

		//    var pivotTable = new PivotTable(
		//        new[] { "name" }, // row dimension(s)
		//        new[] { "age" }, // column dimension(s)
		//        pivotData);

		//    var htmlResult = new StringWriter();
		//    //var pvtHtmlWr = new PivotTableHtmlWriter(htmlResult);
		//    //pvtHtmlWr.Write(pivotTable);

		//}


		public class NTuple<T> : IEquatable<NTuple<T>>
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
		}



		//This procedure converts a LINQ query to a DataTable
		//from http://blog.softartisans.com/2011/08/18/joining-datatables-in-linq/
		public static DataTable LINQResultToDataTable<T>(IEnumerable<T> varlist)
		{
			DataTable dt = new DataTable();

			PropertyInfo[] columns = null;

			if (varlist == null) return dt;

			foreach (T Record in varlist)
			{

				if (columns == null)
				{
					columns = ((Type)Record.GetType()).GetProperties();
					foreach (PropertyInfo pi in columns)
					{
						Type IcolType = pi.PropertyType;

						if ((IcolType.IsGenericType) && (IcolType.GetGenericTypeDefinition() == typeof(Nullable<>)))
						{
							IcolType = IcolType.GetGenericArguments()[0];
						}

						dt.Columns.Add(new DataColumn(pi.Name, IcolType));
					}
				}

				DataRow dr = dt.NewRow();

				foreach (PropertyInfo p in columns)
				{
					dr[p.Name] = p.GetValue(Record, null) == null ? DBNull.Value : p.GetValue
					(Record, null);
				}

				dt.Rows.Add(dr);
			}
			return dt;
		}




		public static DataSet RemoveMissingValues_from_DataSet(DataSet ds)
		{

			if (ds.Tables["DataDict"] != null)
			{
				DataTableCollection dtc = ds.Tables;

				List<string> todrop = new List<string> { "subjects", "subjects_excluded", "datadict", "fileinfo", "measures" };
				List<string> measnames = new List<string>();

				for (int i = 0; i < ds.Tables.Count; i++)
				{
					if (!todrop.Contains(ds.Tables[i].TableName.ToLower()))
					{
						string tblname = ds.Tables[i].TableName;

						if (!tblname.StartsWith("IntHx"))
						{
							measnames.Add(tblname);
						}
					}
				}
				foreach (string m in measnames)
				{
					//remove the missing values
					//DataTable dt_clean = utilStats.DataTable_MissingToNULL(ds.Tables[m], ds.Tables["DataDict"], m, false);

					List<DataTable> dt_clean = DataTable_MissingToNULL_withMissingList(ds.Tables[m], ds.Tables["DataDict"], m, true);


					ds.Tables.Remove(m);

					//Add the missing values list
					if(ds.Tables["MissVals_List"] == null)
					{
						//add the missing values list to the dataset
						ds.Tables.Add(dt_clean[1]);
					}
					else
					{
						ds.Tables["MissVals_List"].Merge(dt_clean[1]);
					}

					//now add the cleaned data
					ds.Tables.Add(dt_clean[0]);


				}
			}

			return ds;

		}

		public static List<DataTable> DataTable_MissingToNULL_withMissingList(DataTable dt,   string tblname)
		{
			SQL_utils sql = new SQL_utils();


			//DataTable missvals = sql.DataTable_from_SQLstring("select  DatabaseField varname, coalesce(MissVal, '-9999') MissVal, InAnalysis " + 
			//	" from uwautism_research_data..dat FieldInfo " +
			//	" where databasetable='" + tblname + "' and InAnalysis>0");

			DataTable missvals = sql.DataTable_from_SQLstring("select fldname varname, coalesce(MissVal, '-9999') MissVal, InAnalysis " + 
				" from def.vwFld " +
				" where databasetable = '" + tblname + "' missval is not null");


			sql.Close();

			List<DataTable> list_dt = DataTable_MissingToNULL_withMissingList(dt, missvals, tblname, false);

			return list_dt;
		}


		public static List<DataTable> DataTable_MissingToNULL_withMissingList(DataTable dt, DataTable dt_dict, string tblname, bool missvalsFromDataProject)
		{
			SQL_utils sql = new SQL_utils();
			DataTable dtOut = new DataTable();

			DataTable dtMissingList = new DataTable();
			dtMissingList.Columns.Add(new DataColumn("Measure", typeof(string)));
			dtMissingList.Columns.Add(new DataColumn("ID", typeof(string)));
			dtMissingList.Columns.Add(new DataColumn("TimePoint", typeof(string)));
			dtMissingList.Columns.Add(new DataColumn("Variable", typeof(string)));
			dtMissingList.Columns.Add(new DataColumn("Value", typeof(string)));
			dtMissingList.TableName = "MissVals_List";

			DataTable missvals = new DataTable();

			if (missvalsFromDataProject)
			{
				DataView dv_missvals = dt_dict.AsDataView();
				dv_missvals.RowFilter = "measname = '" + tblname + "' AND missval <> ''";

				missvals = dv_missvals.ToTable();
			}
			else
			{
				missvals = dt_dict.Copy();
			}


			int counter = 0; int rowcounter = 0;
			//var mv_csv = from a in missvals.AsEnumerable()

			string err_stuff = "";

			try
			{
				if (missvals == null)
				{
					DataRow row = dtMissingList.NewRow();

					row["Measure"] = tblname;
					row["ID"] = "*No missing values*";
					row["TimePoint"] = "";
					row["Variable"] = "";
					row["Value"] = "";

					dtMissingList.Rows.Add(row);

					List<DataTable> dt_cleaned = new List<DataTable>()  {dt, dtMissingList};

					return dt_cleaned;
				}
				else
				{

					foreach (DataRow row in dt.Rows)
					{
						rowcounter++;
						foreach (DataColumn col in dt.Columns)
						{
							bool isMissing = false;
							counter++;

							var mv = missvals.AsEnumerable()
											.Where(r => r.Field<string>("varname") == col.ColumnName);

							//Test to see if the query returns any results, that there are some missing values in metadata to test for
							bool has_mv = mv.Any();

							if (has_mv & col.IsNumeric())
							{
								DataTable dtmv = mv.CopyToDataTable();
								string mv_csv = dtmv.Rows[0]["MissVal"].ToString();

								////USE TO TEST QUERY ABOVE 
								//if (rowcounter == 1) return dtmv;
								double? val = null;
								string ID = row.Field<string>("ID"); 
								string Timepoint = row.Field<string>("TimePoint"); 

								if (mv_csv != "")
								{
										
									//Get the value for this column in this row
									if (col.DataType == typeof(double))
									{
										val = row.Field<double?>(col.ColumnName);
									}
									else if (col.DataType == typeof(Int16))
									{
										Int16? int16val = row.Field<Int16?>(col.ColumnName);
										val = Convert.ToDouble(int16val);
									}
									else if (col.DataType == typeof(Int32))
									{
										Int32? int32val = row.Field<Int32?>(col.ColumnName);
										val = Convert.ToDouble(int32val);
									}
									else if (col.DataType == typeof(Int64))
									{
										Int64? int64val = row.Field<Int64?>(col.ColumnName);
										val = Convert.ToDouble(int64val);
									}
									else
									{
										val = null;
									}




									err_stuff += "{mv_csv=" + mv_csv + "}"; ;

									//if this column has missing values defined in metadata def.Fld (was dat FieldInfo) then check to see if "val" is missing
									if (mv.Count() > 0 & val.HasValue)
									{
										mv_csv = mv_csv.Replace(";", ",");

										List<string> mvs = mv_csv.Split(',').ToList();

										List<double> numbers = new List<double>(Array.ConvertAll(mv_csv.Split(','), double.Parse));

										// Uses Linq
										//var numbers = Array.ConvertAll(sNumbers.Split(','), int.Parse).ToList();

										////ERROR Checking stuff
										//err_stuff += " {mvs.count=" + mvs.Count.ToString() + "}{colName=" + col.ColumnName + "}";
										//err_stuff += " {numbers.count=" + numbers.Count.ToString() + "}";

										//for (int j = 0; j < numbers.Count; j++)
										//{
										//    err_stuff += "{" + numbers[j].ToString() + "}";
										//}

										//err_stuff += "[[" + row[col.ColumnName].ToString() + "]]";

										if (numbers.Count() > 0) isMissing = (numbers.Contains((double)val));

										//if (numbers.Count() > 0) isMissing = (numbers.Contains(row.Field<double>(col.ColumnName)));
										//if (mvs.Count() > 0) isMissing = (mvs.Contains(row.Field<double>(col.ColumnName).ToString()));


									}
									else if (!val.HasValue)
									{
										isMissing = true;
									}
								}

								if (isMissing)
								{
									//Set to Null if the value is in the set of missing values in   def.Fld (was dat FieldInfo)
									row[col.ColumnName] = DBNull.Value;

									DataRow logrow = dtMissingList.NewRow();

									logrow["Measure"] = tblname;
									logrow["ID"] = ID;
									logrow["TimePoint"] = Timepoint;
									logrow["Variable"] = col.ColumnName;
									logrow["Value"] = val.ToString();

									dtMissingList.Rows.Add(logrow);

								}
							}
						}
					}
	

					List<DataTable> dt_cleaned = new List<DataTable>() { dt, dtMissingList };

					return dt_cleaned;

				}
			}
			catch (Exception ex)
			{
				throw new Exception("ERROR! DataTable_MissingToNULL_withMissingList: err_stuff=" + err_stuff + "  Msg:" + ex.Message + "............." + ex.StackTrace.ToString());

				//return dt;
			}
			
		}

		public static DataTable DataTable_MissingToNULL(DataTable dt, string tblname, bool missingremoved)
		{
			DataTable dtout = DataTable_MissingToNULL(dt, tblname, missingremoved, "");
			return dtout;
		}


		public static DataTable DataTable_MissingToNULL(DataTable dt, string tblname, bool missingremoved, string fldpk_csv)
		{

			string where_flds = (fldpk_csv == "") ? "" : String.Format(" and fldpk in ({0})", fldpk_csv);

			if (!missingremoved)
			{
				SQL_utils sql = new SQL_utils();
				DataTable dtOut = new DataTable();

				DataTable missvals = sql.DataTable_from_SQLstring("select  fldname as DatabaseField, coalesce(MissVal, '-9999') MissVal, InAnalysis " + 
					" from uwautism_research_data.def.vwFld " +
					" where databasetable in ('" + tblname + "') and MissVal is not null " + where_flds);

				int counter = 0; int rowcounter = 0;
				//var mv_csv = from a in missvals.AsEnumerable()

				string err_stuff = "";

				try
				{
					if (missvals == null)
					{
						return dt;
					}
					else
					{

						foreach (DataRow row in dt.Rows)
						{
							rowcounter++;
							foreach (DataColumn col in dt.Columns)
							{
								bool isMissing = false;
								counter++;

								var mv = missvals.AsEnumerable()
											  .Where(r => r.Field<string>("DatabaseField") == col.ColumnName);

								//Test to see if the query returns any results, that there are some missing values in metadata to test for
								bool has_mv = mv.Any();

								if (has_mv & col.IsNumeric())
								{
									DataTable dtmv = mv.CopyToDataTable();
									string mv_csv = dtmv.Rows[0]["MissVal"].ToString();

									////USE TO TEST QUERY ABOVE 
									//if (rowcounter == 1) return dtmv;

									if (mv_csv != "")
									{

										//Get the value for this column in this row
										double? val;
										if (col.DataType == typeof(double))
										{
											val = row.Field<double?>(col.ColumnName);
										}
										else if (col.DataType == typeof(Int16))
										{
											Int16? int16val = row.Field<Int16?>(col.ColumnName);
											val = Convert.ToDouble(int16val);
										}
										else if (col.DataType == typeof(Int32))
										{
											Int32? int32val = row.Field<Int32?>(col.ColumnName);
											val = Convert.ToDouble(int32val);
										}
										else if (col.DataType == typeof(Int64))
										{
											Int64? int64val = row.Field<Int64?>(col.ColumnName);
											val = Convert.ToDouble(int64val);
										}
										else
										{
											val = null;
										}

										mv_csv = mv_csv.Replace(";", ",");


										err_stuff += "{mv_csv=" + mv_csv + "}"; ;

										//if this column has missing values defined in metadata def.Fld (was dat FieldInfo) then check to see if "val" is missing
										if (mv.Count() > 0 & val.HasValue)
										{
											List<string> mvs = mv_csv.Split(',').ToList();

											List<double> numbers = new List<double>(Array.ConvertAll(mv_csv.Split(','), double.Parse));

											// Uses Linq
											//var numbers = Array.ConvertAll(sNumbers.Split(','), int.Parse).ToList();


											err_stuff += " {mvs.count=" + mvs.Count.ToString() + "}{colName=" + col.ColumnName + "}";
											err_stuff += " {numbers.count=" + numbers.Count.ToString() + "}";

											for (int j = 0; j < numbers.Count; j++)
											{
												err_stuff += "{" + numbers[j].ToString() + "}";
											}

											err_stuff += "[[" + row[col.ColumnName].ToString() + "]]";

											if (numbers.Count() > 0) isMissing = (numbers.Contains((double)val));

											//if (numbers.Count() > 0) isMissing = (numbers.Contains(row.Field<double>(col.ColumnName)));
											//if (mvs.Count() > 0) isMissing = (mvs.Contains(row.Field<double>(col.ColumnName).ToString()));


										}
										else if (!val.HasValue)
										{
											isMissing = true;
										}
									}

									if (isMissing)
									{
										//Set to Null if the value is in the set of missing values in def.Fld (was dat FieldInfo)
										row[col.ColumnName] = DBNull.Value;
									}
								}
							}
						}

						return dt;
					}
				}
				catch (Exception ex)
				{
					throw new Exception("ERROR! DataTable_MissingToNULL: err_stuff=" + err_stuff + "  Msg:" + ex.Message + "............." + ex.StackTrace.ToString());

					//return dt;
				}
			}
			else
			{
				return dt;
			}
		}





		public static DataTable DataTable_MissingToNULL(DataTable dt, DataTable dt_dict, string tblname, bool missingremoved)
		{
			if (!missingremoved)
			{
				SQL_utils sql = new SQL_utils();
				DataTable dtOut = new DataTable();

				DataView dv_missvals = dt_dict.AsDataView();
				dv_missvals.RowFilter = "measname = '" + tblname + "' AND missval <> ''";

				DataTable missvals = dv_missvals.ToTable();

				//DataTable missvals = sql.DataTable_from_SQLstring("select 
				//DatabaseField, coalesce(MissVal, '-9999') MissVal, InAnalysis
				//from uwautism_research_data..dat FieldInfo " +
				//    " where databasetable='" + tblname + "' and InAnalysis>0");

				int counter = 0; int rowcounter = 0;
				//var mv_csv = from a in missvals.AsEnumerable()

				string err_stuff = "";

				try
				{
					if (missvals == null)
					{
						return dt;
					}
					else
					{

						foreach (DataRow row in dt.Rows)
						{
							rowcounter++;
							foreach (DataColumn col in dt.Columns)
							{
								bool isMissing = false;
								counter++;

								var mv = missvals.AsEnumerable()
											  .Where(r => r.Field<string>("varname") == col.ColumnName);

								//Test to see if the query returns any results, that there are some missing values in metadata to test for
								bool has_mv = mv.Any();

								if (has_mv & col.IsNumeric())
								{
									DataTable dtmv = mv.CopyToDataTable();
									string mv_csv = dtmv.Rows[0]["missval"].ToString();

									////USE TO TEST QUERY ABOVE 
									//if (rowcounter == 1) return dtmv;

									if (mv_csv != "")
									{

										//Get the value for this column in this row
										double? val;
										if (col.DataType == typeof(double))
										{
											val = row.Field<double?>(col.ColumnName);
										}
										else if (col.DataType == typeof(Int16))
										{
											Int16? int16val = row.Field<Int16?>(col.ColumnName);
											val = Convert.ToDouble(int16val);
										}
										else if (col.DataType == typeof(Int32))
										{
											Int32? int32val = row.Field<Int32?>(col.ColumnName);
											val = Convert.ToDouble(int32val);
										}
										else if (col.DataType == typeof(Int64))
										{
											Int64? int64val = row.Field<Int64?>(col.ColumnName);
											val = Convert.ToDouble(int64val);
										}
										else
										{
											val = null;
										}




										err_stuff += "{mv_csv=" + mv_csv + "}"; ;

										//if this column has missing values defined in metadata def.Fld (was dat FieldInfo) then check to see if "val" is missing
										if (mv.Count() > 0 & val.HasValue)
										{
											mv_csv = mv_csv.Replace(",", ";");
											List<string> mvs = mv_csv.Split(';').ToList();

											List<double> numbers = new List<double>(Array.ConvertAll(mv_csv.Split(';'), double.Parse));

											// Uses Linq
											//var numbers = Array.ConvertAll(sNumbers.Split(','), int.Parse).ToList();


											err_stuff += " {mvs.count=" + mvs.Count.ToString() + "}{colName=" + col.ColumnName + "}";
											err_stuff += " {numbers.count=" + numbers.Count.ToString() + "}";

											for (int j = 0; j < numbers.Count; j++)
											{
												err_stuff += "{" + numbers[j].ToString() + "}";
											}

											err_stuff += "[[" + row[col.ColumnName].ToString() + "]]";

											if (numbers.Count() > 0) isMissing = (numbers.Contains((double)val));

											//if (numbers.Count() > 0) isMissing = (numbers.Contains(row.Field<double>(col.ColumnName)));
											//if (mvs.Count() > 0) isMissing = (mvs.Contains(row.Field<double>(col.ColumnName).ToString()));


										}
										else if (!val.HasValue)
										{
											isMissing = true;
										}
									}

									if (isMissing)
									{
										//Set to Null if the value is in the set of missing values in def.Fld (was dat FieldInfo) 
										row[col.ColumnName] = DBNull.Value;
									}
								}
							}
						}
						sql.Close();
						return dt;
					}
				}
				catch (Exception ex)
				{
					throw new Exception("ERROR! DataTable_MissingToNULL: err_stuff=" + err_stuff + "  Msg:" + ex.Message + "............." + ex.StackTrace.ToString());

					//return dt;
				}

				
			}
			else
			{
				
				return dt;
			}
		}






		public static double RoundToNearestX(double val, int x)
		{
			return Math.Round(val / x, MidpointRounding.AwayFromZero) * x;
		}
		#endregion
		//misc util


		#region CORR
		public static double Corr(double[] x, double[] y )
		{
			double r = Corr(x,y,"Pearson");
			return r;
		}

		//public static double Corr(DataTable dt)
		//{
		//    double[] x = dt.AsEnumerable().Select(r => r.Field<double>("x"), double[] y

		//    double r = Corr(x, y, "Pearson");
		//    return r;
		//}


		public static double Corr(double[] x, double[] y, string type)
		{
			double correlation;
			if (type == "Spearman")
			{
				correlation = Correlation.Spearman(x, y);
			}
			else 
			{
				correlation = Correlation.Pearson(x, y);
			}
			return correlation ;
		}


		public static double ICC(double[] x, double[] y, int type)
		{

			/*

					MS(betw subj) - MS(w/in subj)		MSB - MSW
			ICC =  ------------------------------- =   -----------
					MS(betw subj) + MS(w/in subj)		MSB + MSW
			*/



			double correlation;
			if (type == 1)
			{


				correlation = Correlation.Spearman(x, y);
			}
			else
			{
				correlation = Correlation.Pearson(x, y);
			}
			return correlation;
		}



		#endregion


		//public static string GetFullStudyList(int studyID)
		//{
		//    //string studies = studyID.ToString();
		//    SQL_utils sql = new SQL_utils();


		//    DataTable dt = sql.DataTable_from_SQLstring("select a.studyID from uwautism_research_backend..tblstudy " +
		//        " where fullstudyID in (select fullstudyID from uwautism_research_backend..tblstudy where studyID = " + studyID.ToString() + ") " + 
		//        " or studyID = " + studyID.ToString() );



		//    var studies = dt.AsEnumerable().Select(r => r.Field<int>("studyID")).ToList();


		//    return studies;
		//}

		#region Intraclass Correlation - Shrout & Fleiss, 1979



		public static DataTable ShroutFleissTable2()
		{
			DataTable tbl2 = new DataTable();
			DataColumn target = new DataColumn("target", typeof(int));
			DataColumn j1 = new DataColumn("j1", typeof(double));
			DataColumn j2 = new DataColumn("j2", typeof(double));
			DataColumn j3 = new DataColumn("j3", typeof(double));
			DataColumn j4 = new DataColumn("j4", typeof(double));

			tbl2.Columns.Add(target);
			tbl2.Columns.Add(j1);
			tbl2.Columns.Add(j2);
			tbl2.Columns.Add(j3);
			tbl2.Columns.Add(j4);


			tbl2.Rows.Add(1, 9, 2, 5, 8);
			tbl2.Rows.Add(2, 6, 1, 3, 2);
			tbl2.Rows.Add(3, 8, 4, 6, 8);
			tbl2.Rows.Add(4, 7, 1, 2, 6);
			tbl2.Rows.Add(5, 10, 5, 6, 9);
			tbl2.Rows.Add(6, 6, 2, 4, 7);



			return tbl2;
		}


		public struct ICCstats
		{
			public int n_targets;
			public int n_judges;
			public int df_between_targets;
			public int df_within_targets;
			public int df_between_judges;
			public int df_resid;

			public double BMS;
			public double WMS;
			public double JMS;
			public double EMS;
			public double ICC1;
			public double ICC2;
			public double ICC3;

			public double ICC1x;
			public double ICC2x;
			public double ICC3x;

		}


		public static ICCstats ShroutFleissICC(DataTable dt, string orig_val, string rel_val, string datatype)
		{
			double[][] data = new double[2][];

			data[0] = DataColumn_to_ArrayDouble(dt, orig_val, datatype);
			data[1] = DataColumn_to_ArrayDouble(dt, rel_val, datatype);

			ICCstats icc = ShroutFleissICC(data);
			return icc;
		}



		public static ICCstats ShroutFleissICC(double[][] data)
		{
			Fstats_output f1 = Fstat(data);

			Fstats_output f2 = Fstat(TransposeRowsAndColumns(data));

			ICCstats iccstats = new ICCstats();

			iccstats.n_targets = f2.K;
			iccstats.n_judges = f1.K;

			iccstats.df_between_targets = f2.df[0];
			iccstats.df_within_targets = f2.df[1];
			iccstats.df_between_judges = f1.df[0];
			iccstats.df_resid = iccstats.df_within_targets - iccstats.df_between_judges;

			iccstats.BMS = f2.MSb;  //MSb from transformed data, where columns are targets
			iccstats.WMS = f2.MSw;  //MSw from transformed data, where columns are targets
			iccstats.JMS = f1.MSb;  //MSb from orig data, where columns are rater1 and rater2
			iccstats.EMS = (f2.SSw - f1.SSb) / iccstats.df_resid;

			iccstats.ICC1 = Math.Round((iccstats.BMS - iccstats.WMS) / (iccstats.BMS + ((iccstats.n_judges - 1) * iccstats.WMS)), 4);

			iccstats.ICC2 = Math.Round(
				(iccstats.BMS - iccstats.EMS) /
				(iccstats.BMS +
				  ((iccstats.n_judges - 1) * iccstats.EMS) +
				  ((iccstats.n_judges * (iccstats.JMS - iccstats.EMS)) / iccstats.n_targets)
				 )
				, 4);

			iccstats.ICC3 = Math.Round(
				(iccstats.BMS - iccstats.EMS) / (iccstats.BMS + ((iccstats.n_judges - 1) * iccstats.EMS))
				, 4);

			iccstats.ICC1x = Math.Round(
				   (iccstats.BMS - iccstats.WMS) / iccstats.BMS
				, 4);

			iccstats.ICC2x = Math.Round(
				   (iccstats.BMS - iccstats.EMS) / (iccstats.BMS + ((iccstats.JMS - iccstats.EMS) / iccstats.n_targets))
				, 4);

			iccstats.ICC3x = Math.Round(
			   (iccstats.BMS - iccstats.EMS) / iccstats.BMS
			, 4);

			return iccstats;
		}

		public static string ICCstats_ToString(ICCstats i)
		{
			string s = "";

			s += "<b><u>ICC info (See Shrout & Fleiss, 1979)</u></b>";
			s += "<table><tr><td>";
			s += "n_targets = " + i.n_targets + ", n_judges = " + i.n_judges;
			s += "<br/>df_between_targets = " + i.df_between_targets + ", df_within_targets = " + i.df_within_targets;
			s += "<br/>df_between_judges = " + i.df_between_judges + ", df_resid = " + i.df_resid;
			s += "</td></tr>";
			s += "<tr><td valign=\"top\">";
			s += "<br/>BMS = " + Math.Round(i.BMS, 3);
			s += "<br/>WMS = " + Math.Round(i.WMS, 3);
			s += "<br/>JMS = " + Math.Round(i.JMS, 3);
			s += "<br/>EMS = " + Math.Round(i.EMS, 3);
			s += "</td></tr>";
			s += "<tr><td valign=\"top\">";
			s += "<br/><br/>Single raters absolute ICC(type 1, 1) = " + i.ICC1 + "     ";
			s += "<br/>Single random raters  ICC(type 2, 1) = " + i.ICC2;
			s += "<br/>Single fixed raters   ICC(type 3, 1) = " + i.ICC3;
			s += "<br/><br/>Average raters absolute ICC(type 1, " + i.n_judges.ToString() + ") = " + i.ICC1x;
			s += "<br/> Average random raters  ICC(type 2, " + i.n_judges.ToString() + ") = " + i.ICC2x;
			s += "<br/> Average fixed raters   ICC1(type 3, " + i.n_judges.ToString() + ") = " + i.ICC3x;
			s += "</td></tr></table>";


//            Intraclass correlation coefficients 
//                         type    ICC    F df1 df2    p lower bound upper bound
//Single_raters_absolute   ICC1 -0.098 0.82   7   8 0.60       -0.69        0.60
//Single_random_raters     ICC2  0.073 1.24   7   7 0.39       -0.32        0.63
//Single_fixed_raters      ICC3  0.106 1.24   7   7 0.39       -0.60        0.72
//Average_raters_absolute ICC1k -0.218 0.82   7   8 0.60       -4.51        0.75
//Average_random_raters   ICC2k  0.136 1.24   7   7 0.39       -0.94        0.77
//Average_fixed_raters    ICC3k  0.192 1.24   7   7 0.39       -3.03        0.84



			return s;
		}


		public static Table ICCstats_ToHTML(ICCstats i)
		{
			Table t = new Table();
			
			TableRow r1 = new TableRow();
			TableRow r2 = new TableRow();

			TableCell c0 = new TableCell();

			TableCell c1 = new TableCell();
			TableCell c2 = new TableCell();
			TableCell c3 = new TableCell();
			TableCell c4 = new TableCell();



			c0.Text += "<b><u>ICC info (See Shrout & Fleiss, 1979)</u></b>";
			c0.ColumnSpan = 4;

			c1.Text += "n_targets = " + i.n_targets;
			c1.Text += "<br/>n_judges = " + i.n_judges;
			c1.Text += "<br/>df_between_targets = " + i.df_between_targets;
			c1.Text += "<br/>df_within_targets = " + i.df_within_targets;
			c1.Text += "<br/>df_between_judges = " + i.df_between_judges;
			c1.Text += "<br/>df_resid = " + i.df_resid;
			   

			c2.Text += "BMS = " + Math.Round(i.BMS, 3) ;
			c2.Text += "<br/>WMS = " + Math.Round(i.WMS, 3) ;
			c2.Text += "<br/>JMS = " + Math.Round(i.JMS, 3) ;
			c2.Text += "<br/>EMS = " + Math.Round(i.EMS, 3) ;

			c3.Text += "Single raters absolute";
			c3.Text += "<br/><b>Single random raters</b>";
			c3.Text += "<br/>Single fixed raters";
			c3.Text += "<br/><br/>Average raters_absolute";
			c3.Text += "<br/>Average random raters";
			c3.Text += "<br/>Average fixed raters";


			c4.Text += "ICC(type 1, 1) = " + i.ICC1;
			c4.Text += "<br/><b>ICC(type 2, 1) = " + i.ICC2 + "</b>";
			c4.Text += "<br/>ICC(type 3, 1) = " + i.ICC3;
			c4.Text += "<br/><br/>ICC(type 1, " + i.n_judges.ToString() + ") = " + i.ICC1x;
			c4.Text += "<br/>ICC(type 2, " + i.n_judges.ToString() + ") = " + i.ICC2x;
			c4.Text += "<br/>ICC(type 3, " + i.n_judges.ToString() + ") = " + i.ICC3x;


			c1.VerticalAlign = VerticalAlign.Top;
			c2.VerticalAlign = VerticalAlign.Top;
			c3.VerticalAlign = VerticalAlign.Top;
			c4.VerticalAlign = VerticalAlign.Top;

			c1.Width = 160;
			c2.Width = 100;
			c3.Width = 150;
			c4.Width = 150;

			r1.Cells.Add(c0);
			r2.Cells.Add(c1);
			r2.Cells.Add(c2);
			r2.Cells.Add(c3);
			r2.Cells.Add(c4);
			t.Rows.Add(r1);
			t.Rows.Add(r2);
			return t;
		}



		public static ICCstats testICC(string vers)
		{

			DataTable dt = new DataTable();
			Fstats_output f = new Fstats_output();
			ICCstats icc = new ICCstats();

			if (vers == "a")
			{
				dt = utilStats.ShroutFleissTable2();
				double[][] data = new double[4][];

				data[0] = DataColumn_to_ArrayDouble(dt, "j1", "double");
				data[1] = DataColumn_to_ArrayDouble(dt, "j2", "double");
				data[2] = DataColumn_to_ArrayDouble(dt, "j3", "double");
				data[3] = DataColumn_to_ArrayDouble(dt, "j4", "double");
				f = Fstat(data);

				icc = ShroutFleissICC(data);
			}

			return icc;
		}



		public static double[][] TransposeRowsAndColumns(double[][] arr)
		{
			int rowCount = arr.Length;
			int columnCount = arr[0].Length;
			double[][] transposed = new double[columnCount][];
			if (rowCount == columnCount)
			{
				transposed = (double[][])arr.Clone();
				for (int i = 1; i < rowCount; i++)
				{
					for (int j = 0; j < i; j++)
					{
						double temp = transposed[i][j];
						transposed[i][j] = transposed[j][i];
						transposed[j][i] = temp;
					}
				}
			}
			else
			{
				for (int column = 0; column < columnCount; column++)
				{
					transposed[column] = new double[rowCount];
					for (int row = 0; row < rowCount; row++)
					{
						transposed[column][row] = arr[row][column];
					}
				}
			}
			return transposed;
		}

		#endregion


		#region Cohen's Kappa

		public struct Kappa_stats
		{
			public int[] x;
			public double prop_observed_agreement;
			public double prop_random_agreement;
			public double kappa;
		}


		public static Kappa_stats CalculateKappa(PivotTable pivot)
		{
			Kappa_stats kappa_stats = new Kappa_stats();

			//Check to make sure there is only 1 Row and 1 Col dimension
			if(pivot.Rows.Length==1 & pivot.Columns.Length==1)
			{
				PivotData data = (PivotData)pivot.PivotData;

				int n_agree = 0;
				int n_tot = 0;

				//loop through and sum agreements and totals
				foreach(KeyValuePair<ValueKey, IAggregator> key in data.AllValues.AsEnumerable())
				{
					n_tot += Convert.ToInt32(key.Value.Count);

					string s1 = key.Key.DimKeys[0].ToString();
					string s2 = key.Key.DimKeys[1].ToString();
					if(s1 == s2)
					{
						n_agree += Convert.ToInt32(key.Value.Count);
					}
				}
				kappa_stats.prop_observed_agreement = Math.Round((double)n_agree / (double)n_tot, 4);

				int[] rowmarg = new int[pivot.RowKeys.Length];
				int[] colmarg = new int[pivot.RowKeys.Length];
				double[] expected_diag = new double[pivot.RowKeys.Length];

				double sum_expected_diag = 0;
			   //Get marginal totals for each level to calculate expected count
				for(int i=0; i < pivot.RowKeys.Length; i++)
				{
					ValueKey valkey = pivot.RowKeys[i];

					string level_value = valkey.DimKeys[0].ToString();

					rowmarg[i] = 0;
					colmarg[i] = 0;

					foreach (KeyValuePair<ValueKey, IAggregator> key in data.AllValues.AsEnumerable())
					{
						string row1 = key.Key.DimKeys[0].ToString();
						string col1 = key.Key.DimKeys[1].ToString();
						if (row1 == level_value) rowmarg[i] += Convert.ToInt32(key.Value.Count);
						if (col1 == level_value) colmarg[i] += Convert.ToInt32(key.Value.Count);

					}

					expected_diag[i] = ((double)rowmarg[i] * (double)colmarg[i]) / (double)n_tot;
					sum_expected_diag += expected_diag[i];
				}

				kappa_stats.prop_random_agreement = Math.Round(sum_expected_diag / (double)n_tot, 4);

				kappa_stats.kappa = Math.Round((kappa_stats.prop_observed_agreement - kappa_stats.prop_random_agreement) /
									(1 - kappa_stats.prop_random_agreement), 4);
				 
			}
			else{
				//more than 1 row and 1 column, Kappa is not appropriate
			}


			return kappa_stats;
		}


		public static string PrintKappa_stats(Kappa_stats k)
		{
			string kout = "";

			kout += "<b>Kappa Statistics" + "</b><br/>";
			kout += "po (observed proportion of agreement) = " + k.prop_observed_agreement + "<br/>";
			kout += "pe (probability of random agreement)  = " + k.prop_random_agreement + "<br/>";
			kout += "Kappa = <b>" + k.kappa + "</b>" ;

			return kout;
		}


		#endregion Cohen's Kappa



		#region ANOVA

		// from  https://msdn.microsoft.com/en-us/magazine/mt742873.aspx

		public struct Fstats_output
		{
			public double F;
			public int K;
			public int N;
			public int[] df;
			public double[] means;
			public double[] sds;
			public double gMean;
			public double SSb;
			public double SSw;
			public double MSb;
			public double MSw;
			public double p;
			public string pstars;
			public double SSt;  
			
		}


		public static string pStars(double p)
		{
			string stars = "";

			if(p<.001)
			{
				stars = "***";
			}
			else if (p < .01)
			{
				stars = "**";
			}
			else if (p < .01)
			{
				stars = "*";
			}
			else if (p < .1)
			{
				stars = "+";
			}

			return stars;

		}

		public static int MakeInt (string x, int default_if_null)
		{
			int int_result = default_if_null;
			bool result = int.TryParse(x, out int_result);
			//if (!result) 
			//{ 
			//    int_result = default_if_null; 
			//}
			return int_result;

		}


		
		public static double[] DataColumn_to_ArrayDouble(DataTable dt, string fld, string origdatatype)
		{
			
			double[] d;

			if (origdatatype == "int")
			{
				//remove null values
				int[] i = dt.AsEnumerable().Where(f => f.Field<int?>(fld) != null).Select(f => f.Field<int>(fld)).ToArray<int>();

				d = i.Select(x => Convert.ToDouble(x)).ToArray<double>();
			}
			else if(origdatatype == "float" | origdatatype == "decimal" | origdatatype=="double")
			{
				//remove null values
				d = dt.AsEnumerable().Where(f => f.Field<double?>(fld) != null).Select(f => f.Field<double>(fld)).ToArray<double>();
			}
			//else if (origdatatype == "varchar" | origdatatype == "char" | origdatatype == "text")
			//{
			//    //remove null values

			//    //data[0] = dt.AsEnumerable().Select(f => Double.Parse(f.Field<string>(orig_val))).ToArray<double>();
			//    //data[1] = dt.AsEnumerable().Select(f => Double.Parse(f.Field<string>(rel_val))).ToArray<double>();
			//    //d = dt.AsEnumerable().Where(f => f.Field<double?>(fld) != null).Select(f => f.Field<double>(fld)).ToArray<double>();
			//}
			else
			{
				d = null;
			}

			return d;
		}

		//static Fstats Fstat(double[][] data, out int[] df)
		public static Fstats_output Fstat(DataTable dt, string orig_val, string rel_val, string datatype)
		{
			double[][] data = new double[2][];

			data[0] = DataColumn_to_ArrayDouble(dt, orig_val, datatype);
			data[1] = DataColumn_to_ArrayDouble(dt, rel_val, datatype);

			Fstats_output fstats = Fstat(data);
			return fstats;
		}


		public static Fstats_output Fstat(double[][] data)
		{
			// calculate F statistic and degrees freedom num, denom
			// assumes data has specific structure:
			// data[0] -> 3, 4, etc (group 1)
			// data[1] -> 8, 12, etc. (group 2)
			// etc.

			int[] df = new int[data.Length];

			int K = data.Length; // number groups
			int[] n = new int[K]; // number items each group
			int N = 0; // total number data points
			for (int i = 0; i < K; ++i)
			{
				n[i] = data[i].Length;
				N += data[i].Length;
			}

			// 1. group means and grand mean
			double[] means = new double[K];
			double[] sds= new double[K];
			double gMean = 0.0;
			for (int i = 0; i < K; ++i)
			{
				for (int j = 0; j < data[i].Length; ++j)
				{
					means[i] += data[i][j];
					gMean += data[i][j];
				}
				means[i] /= n[i];

				sds[i] = MathNet.Numerics.Statistics.Statistics.StandardDeviation(data[i]);

				//Console.WriteLine("Group [" + i + "] mean = " + means[i].ToString("F2"));
			}
			gMean /= N;
			//Console.WriteLine("Overall mean = " + gMean.ToString("F2"));

			// 2. SSb and MSb
			double SSb = 0.0;
			for (int i = 0; i < K; ++i)
				SSb += n[i] * (means[i] - gMean) * (means[i] - gMean);
			double MSb = SSb / (K - 1);

			// 3. SSw and MSw
			double SSw = 0.0;
			double SSt = 0.0;
			for (int i = 0; i < K; ++i)
				for (int j = 0; j < data[i].Length; ++j)
				{
					SSw += (data[i][j] - means[i]) * (data[i][j] - means[i]);
					SSt += (data[i][j] - gMean) * (data[i][j] - gMean);
				}
			double MSw = SSw / (N - K);

			df = new int[2]; // store df values
			df[0] = K - 1;
			df[1] = N - K;

			double F = MSb / MSw;

			double p = QF(df[0], df[1], F);

			Fstats_output fstats = new Fstats_output();


			fstats.F = F;
			fstats.K = K;
			fstats.N = N;
			fstats.df = df;
			fstats.means = means;
			fstats.sds = sds;
			fstats.gMean = gMean;
			fstats.SSb = SSb;
			fstats.SSw = SSw;
			fstats.MSb = MSb;
			fstats.MSw = MSw;
			fstats.p = p;
			fstats.pstars = pStars(p);
			fstats.SSt = SSt;

			return fstats;

		} // Fstat


		public static string Fstats_output_ToString(Fstats_output fstats_output)
		{
			string str_fstats = "";

			str_fstats += "<br/>F = " + fstats_output.F.ToString() + "<br/>";
			str_fstats += "N = " + fstats_output.N.ToString() + "<br/>";
			str_fstats += "K = " + fstats_output.K.ToString() + "<br/>";

			str_fstats += "gMean = " + fstats_output.gMean.ToString() + "<br/>";

			str_fstats += "df = ";
			foreach (double x in fstats_output.df) { str_fstats += x.ToString() + ", "; }
			str_fstats += "<br/>";

			str_fstats += "means = ";
			foreach (double x in fstats_output.means) { str_fstats += x.ToString() + ", "; }
			str_fstats += "<br/>";

			str_fstats += "SDs = ";
			foreach (double x in fstats_output.sds) { str_fstats += x.ToString() + ", "; }
			str_fstats += "<br/>";


			str_fstats += "SSt = " + fstats_output.SSt.ToString() + "<br/>";
			str_fstats += "SSb = " + fstats_output.SSb.ToString() + "<br/>";
			str_fstats += "SSw = " + fstats_output.SSw.ToString() + "<br/>";
			str_fstats += "MSb = " + fstats_output.MSb.ToString() + "<br/>";
			str_fstats += "MSw = " + fstats_output.MSw.ToString() + "<br/>";
			str_fstats += "p = " + fstats_output.p.ToString() + fstats_output.pstars + "<br/>";

			return str_fstats;
		}

		static double LogGamma(double z)
		{
			// Lanczos approximation g=5, n=7
			double[] coef = new double[7] { 1.000000000190015,
		 76.18009172947146, -86.50532032941677,
		24.01409824083091, -1.231739572450155,
		0.1208650973866179e-2, -0.5395239384953e-5 };

			double LogSqrtTwoPi = 0.91893853320467274178;

			if (z < 0.5) // Gamma(z) = Pi / (Sin(Pi*z))* Gamma(1-z))
				return Math.Log(Math.PI / Math.Sin(Math.PI * z)) -
				  LogGamma(1.0 - z);

			double zz = z - 1.0;
			double b = zz + 5.5; // g + 0.5
			double sum = coef[0];

			for (int i = 1; i < coef.Length; ++i)
				sum += coef[i] / (zz + i);

			return (LogSqrtTwoPi + Math.Log(sum) - b) +
			  (Math.Log(b) * (zz + 0.5));
		}

		static double BetaInc(double a, double b, double x)
		{
			// Incomplete Beta function
			// A & S 6.6.2 and 26.5.8
			double bt;
			if (x == 0.0 || x == 1.0)
				bt = 0.0;
			else
				bt = Math.Exp(LogGamma(a + b) - LogGamma(a) -
				  LogGamma(b) + a * Math.Log(x) +
				  b * Math.Log(1.0 - x));

			if (x < (a + 1.0) / (a + b + 2.0))
				return bt * BetaIncCf(a, b, x) / a;
			else
				return 1.0 - bt * BetaIncCf(b, a, 1.0 - x) / b;
		}

		static double BetaIncCf(double a, double b, double x)
		{
			// Approximate Incomplete Beta computed by
			// continued fraction
			// A & S 26.5.8 
			int max_it = 100;
			double epsilon = 3.0e-7;
			double small = 1.0e-30;

			int m2; // 2*m
			double aa, del;

			double qab = a + b;
			double qap = a + 1.0;
			double qam = a - 1.0;
			double c = 1.0;
			double d = 1.0 - qab * x / qap;
			if (Math.Abs(d) < small) d = small;
			d = 1.0 / d;
			double result = d;

			int m;
			for (m = 1; m <= max_it; ++m)
			{
				m2 = 2 * m;
				aa = m * (b - m) * x / ((qam + m2) * (a + m2));
				d = 1.0 + aa * d;
				if (Math.Abs(d) < small) d = small;
				c = 1.0 + aa / c;
				if (Math.Abs(c) < small) c = small;
				d = 1.0 / d;
				result *= d * c;
				aa = -(a + m) * (qab + m) * x / ((a + m2) *
				  (qap + m2));
				d = 1.0 + aa * d;
				if (Math.Abs(d) < small) d = small;
				c = 1.0 + aa / c;
				if (Math.Abs(c) < small) c = small;
				d = 1.0 / d;
				del = d * c;
				result *= del;
				if (Math.Abs(del - 1.0) < epsilon) break;
			} // for

			if (m > max_it)
				throw new Exception("BetaIncCf() failure ");
			return result;
		} // BetaCf

		static double PF(double a, double b, double x)
		{
			// approximate lower tail of F-dist
			// (area from 0.0 to x)
			// equivalent to the R pf() function
			// only accurate to about 8 decimals
			double z = (a * x) / (a * x + b);
			return BetaInc(a / 2, b / 2, z);
		}

		static double QF(double a, double b, double x)
		{
			// area from x to +infinity under F
			// for ANOVA = prob(all means equal)
			return 1.0 - PF(a, b, x);
		}

		#endregion 



	}








}