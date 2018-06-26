using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace uwac
{
    /// <summary>
    /// Summary description for DataTableSummary
    /// </summary>
    public class DataTableSummary : DataTable
    {

        public DataTableSummary(DataTable dt)
        {
            this.Columns.Add("Column", typeof(string));
            this.Columns.Add("DataType", typeof(string));
            this.Columns.Add("N", typeof(int));
            this.Columns.Add("Nunq", typeof(int));
            this.Columns.Add("Min_Length", typeof(int));
            this.Columns.Add("Max_Length", typeof(int));
            this.Columns.Add("Min_Value", typeof(string));
            this.Columns.Add("Max_Value", typeof(string));

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

                if(Min_Value!=null) this.Rows.Add(col.ColumnName, dataType, N, Nunq, Min_Length, Max_Length, Min_Value, Max_Value);
            }

        }

    }

  

}