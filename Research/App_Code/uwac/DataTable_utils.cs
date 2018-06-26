using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Text;
using LinqStatistics;
using uwac;

namespace uwac
{
/// <summary>
/// Summary description for DataTable_utils
/// </summary>
    public class DataTable_utils
    {
        public DataTable_utils()
        {
            //
            // TODO: Add constructor logic here
            //


        }

        public static DataTable DataTable_Summary(DataTable dt)
        {
            DataTable dtOut = new DataTable();
            dtOut.Columns.Add("Column", typeof(string));
            dtOut.Columns.Add("DataType", typeof(string));
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
                        .Select(r => r.Field<Double>(col))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
                        .Count();
                    Nunq = dt.AsEnumerable()
                        .Select(r => r.Field<Double>(col))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
                        .Distinct()
                        .Count();

                    Min_Length = 0;
                    Max_Length = 0;

                    Min_Value = dt.AsEnumerable()
                        .Select(r => r.Field<Double>(col))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
                        .Min().ToString();
                    Max_Value = dt.AsEnumerable()
                        .Select(r => r.Field<Double>(col))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
                        .Max().ToString();
                    dataType = "Numeric";
                }
                else
                {
                    N = dt.AsEnumerable()
                        .Where(r => r.Field<string>(col) != "")
                        .Select(r => r.Field<string>(col))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
                        .Count();
                    Nunq = dt.AsEnumerable()
                        .Where(r => r.Field<string>(col) != "")
                        .Select(r => r.Field<string>(col))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
                        .Distinct()
                        .Count();
                    Min_Length = dt.AsEnumerable()
                        .Select(r => r.Field<string>(col))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
                        .Min(r => r.Length);
                    Max_Length = dt.AsEnumerable()
                        .Select(r => r.Field<string>(col))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
                        .Max(r => r.Length);
                    Min_Value = dt.AsEnumerable()
                        .Where(r => r.Field<string>(col) != "")
                        .Select(r => r.Field<string>(col))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
                        .Min();
                    Max_Value = dt.AsEnumerable()
                        .Where(r => r.Field<string>(col) != "")
                        .Select(r => r.Field<string>(col))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
                        .Max();
                    dataType = "string";


                }

                if (Min_Value != null) dtOut.Rows.Add(col.ColumnName, dataType, N, Nunq, Min_Length, Max_Length, Min_Value, Max_Value);
            }

            return dtOut;
        }



        public static DataTable DataTable_DescStats(DataTable dt)
        {
            DataTable dtOut = new DataTable();
            dtOut.Columns.Add("Varname", typeof(string));
            dtOut.Columns.Add("N", Nullable.GetUnderlyingType(typeof(int)) ?? typeof(int));
            dtOut.Columns.Add("Nunq", Nullable.GetUnderlyingType(typeof(int)) ?? typeof(int));
            dtOut.Columns.Add("M", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
            dtOut.Columns.Add("Median", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
            dtOut.Columns.Add("Mode", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
            dtOut.Columns.Add("SD", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
            dtOut.Columns.Add("Min", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
            dtOut.Columns.Add("Max", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));
            dtOut.Columns.Add("Sum", Nullable.GetUnderlyingType(typeof(double)) ?? typeof(double));


            string Varname = "";
            int N = 0;
            int Nunq = 0;
            double M = 0;
            double Median = 0;
            double? Mode = 0;
            double SD = 0;
            double Min = 0;
            double Max = 0;
            double Sum = 0;


            foreach (DataColumn col in dt.Columns)
            {
                if (col.IsNumeric())
                {

                    //List<double> data = dt.AsEnumerable().Select(r => r.Field<Double>(col)).Where(r => r != null).ToList();
                    //var data = from dc in dt.AsEnumerable() select dc;

                    //List<double> data = dt.AsEnumerable().Select(f => f.Field<Double>(col.ColumnName)).ToList();
                    //try
                    //{

                    //List<double> data = dt.AsEnumerable().Select(r => r.Field<double>(col.ColumnName)).Where(r => r != null).ToList();

                    
                    //List<double> data = dt.AsEnumerable().Select(x => Convert.ToDouble(x[col.ColumnName])).ToList();
                    var data = dt.AsEnumerable().Where(r => !r.IsNull(col.ColumnName))
                        .Select(x => Convert.ToDouble(x[col.ColumnName]));
  
                        
                        //Convert.ToDouble(x[col.ColumnName]));
                    


                    ////But this does not work
                    //List<double> data = dt.AsEnumerable().Select(r => r.Field<double>(col.ColumnName)).ToList<double>();
                    
                    //var data = dt.AsEnumerable().Select(r => r.Field<double>(col.ColumnName));


                    //List<double> data = (List<double>)data_nullable;

                    Varname = col.ColumnName;
                    N = data.Count();
                    Nunq = data.Distinct().Count();

                    //Nunq = dt.AsEnumerable()
                    //    .Select(r => r.Field<Double>(col))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
                    //    .Distinct()
                    //    .Count();



                    M = data.Average();
                    Median = data.Median();
                    Mode = data.Mode();
                    SD = data.StandardDeviation();
                    Min = data.Min();
                    Max = data.Max();
                    Sum = data.Sum();


                    //}
                    //catch (Exception ex)
                    //{
                    //    throw new SystemException("DataTable_DescStats ERROR!", ex);
                    //}

                    if (N >= 0) dtOut.Rows.Add(Varname, N, Nunq, M, Median, Mode, SD, Min, Max, Sum);

                }

            }

            return dtOut;
        }



        public static DataTable DataTable_DescStats(DataTable dt, string tblname)
        {
            DataTable dt_missing_removed =  DataTable_MissingToNULL(dt, tblname);

            DataTable dtOut = DataTable_DescStats(dt_missing_removed);

            return dtOut;

        }


        public static DataTable DataTable_MissingToNULL(DataTable dt, string tblname)
        {
            SQL_utils sql = new SQL_utils();
            DataTable dtOut = new DataTable();

            //DataTable missvals = sql.DataTable_from_SQLstring("select  DatabaseField, MissVal, InAnalysis from dat.dat FieldInfo where databasetable='" +
            //    tblname + "' and InAnalysis>0");

			DataTable missvals = sql.DataTable_from_SQLstring("select fldname DatabaseField, MissVal, InAnalysis from def.vwFld " +
				" where databasetable = '" + tblname + "' missval is not null");



			int counter = 0; int rowcounter = 0;
            //var mv_csv = from a in missvals.AsEnumerable()

            foreach (DataRow row in dt.Rows)
            {
                rowcounter++;
                foreach (DataColumn col in dt.Columns)
                {
                    bool isMissing = false;
                    counter++;
                    var mv = missvals.AsEnumerable()
                                  .Where(r => r.Field<string>("DatabaseField") == col.ColumnName)
                                  .Select(r => r.Field<string>("MissVal")); //.ToString();

                    if (col.IsNumeric())
                    {
                        int? val = row.Field<int?>(col.ColumnName);
                        if (mv.Count() > 0 & val.HasValue)
                        {
                            List<string> mvs = mv.First().ToString().Split(',').ToList();
                            isMissing = (mvs.Contains(row.Field<int>(col.ColumnName).ToString()));

                            //mvout += "row " + rowcounter.ToString() + " #" + counter.ToString() + "  " + col.ColumnName + ":" + val.ToString() + " --- " + mvs + " --> " + isMissing.ToString() + "<br/>";
                        }
                        else if (!val.HasValue)
                        {
                            isMissing = true;
                            //mvout += "row " + rowcounter.ToString() + " #" + counter.ToString() + "  " + col.ColumnName + ":" + val.ToString() + " --> " + isMissing.ToString() + "<br/>";
                        }
                    }

                    if (isMissing)
                    {
                        //row[col.ColumnName] = 987654;
                        row[col.ColumnName] = DBNull.Value;
                    }
                }
            }

            return dt;
        }


        
    }
}