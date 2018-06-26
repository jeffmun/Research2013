using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using LinqStatistics;
//using MathNet.Numerics.Statistics;
using uwac;

namespace uwac
{
    /// <summary>
    /// Summary description for DataTableSummary
    /// </summary>
    public class DataTable_DescStats : DataTable
    {
        int numdigits = 2;

        public DataTable_DescStats(DataTable dt)
        {

            this.Columns.Add("Varname", typeof(string));
            this.Columns.Add("N", typeof(int));
            this.Columns.Add("Nunq", typeof(int));
            this.Columns.Add("M", typeof(double));
            this.Columns.Add("SD", typeof(double));
            this.Columns.Add("Min", typeof(double));
            this.Columns.Add("Max", typeof(double));
            this.Columns.Add("Median", typeof(double));
            this.Columns.Add("Mode", typeof(double));
            this.Columns.Add("Pctile25", typeof(double));
            this.Columns.Add("Pctile75", typeof(double));
            this.Columns.Add("IQR", typeof(double));
            this.Columns.Add("N_GT1pt5IQR", typeof(int));
            this.Columns.Add("N_LT1pt5IQR", typeof(int));
            this.Columns.Add("MinZ", typeof(double));
            this.Columns.Add("MaxZ", typeof(double));
            this.Columns.Add("Skewness", typeof(double));
            this.Columns.Add("Kurtosis", typeof(double));
            this.Columns.Add("Sum", typeof(double));
            

            //foreach(DataColumn c in this.Columns)
            //{
            //    c.AllowDBNull = true;
            //}

            foreach (DataColumn col in dt.Columns)
            {
                string Varname = "";
                int? N = 0;
                int? Nunq = 0;
                double? M = null;
                double? SD = null;
                double? Min = null;
                double? Max = null;
                double? Median = null;
                double? Mode = null;
                double? Pctile25 = null;
                double? Pctile75 = null;
                double? IQR = null;
                int? N_GT1pt5IQR = null;
                int? N_LT1pt5IQR = null;
                double? MinZ = null;
                double? MaxZ = null;
                //double? Skewness = null;
                //double? Kurtosis = null;
                double? Sum = null;

                List<double> data = new List<double>();

                List<string> vars_to_skip = new List<string> { "indexnum", "studymeasID", "isREL", "timepointnum", "days_from_txstart" };
                if (col.IsNumeric() & !vars_to_skip.Contains(col.ColumnName))
                {
                    Varname = col.ColumnName;

                    //Convert to double and get rid of DBNull values
                    var origdata = dt.AsEnumerable().Select(x => (x[col.ColumnName]== DBNull.Value) ? -998877 : x[col.ColumnName]).ToList();
                    data = origdata.ConvertAll(x => Convert.ToDouble(x)).Where(x => x != -998877).ToList();

                    //N = data.Count();
                    Nunq = data.Distinct().Count();
                    Sum = data.Sum();

                    MathNet.Numerics.Statistics.DescriptiveStatistics myDS = new MathNet.Numerics.Statistics.DescriptiveStatistics(data);

                    Median = MathNet.Numerics.Statistics.Statistics.Median(data);
                    Mode = data.Mode();  //using LinqStatistics for mode
                    IQR = MathNet.Numerics.Statistics.Statistics.InterquartileRange(data);
                    Pctile25 = MathNet.Numerics.Statistics.Statistics.LowerQuartile(data);
                    Pctile75 = MathNet.Numerics.Statistics.Statistics.UpperQuartile(data);
                    if (Median > 0 & IQR > 0)
                    {
                        N_LT1pt5IQR = data.Where(x => x < Pctile25 - IQR).Count();
                        N_GT1pt5IQR = data.Where(x => x > Pctile75 + IQR).Count();
                    }

                    MinZ = (myDS.Minimum - myDS.Mean) / myDS.StandardDeviation;
                    MaxZ = (myDS.Maximum - myDS.Mean) / myDS.StandardDeviation;

                    if(myDS.Count==0)
                    {
                        this.Rows.Add(Varname
                            , myDS.Count, null,      null, null, null, null, null, null, null, null, null, null, null, null, null);
                    }
                    else if (Nunq == 1)
                    {
                        this.Rows.Add(Varname
                            , myDS.Count, Nunq, myDS.Mean, null, null, null, null, null, null, null, null, null, null, null, null);

                    }
                    else { 
                        this.Rows.Add(Varname
                            , myDS.Count
                            , Nunq 
                            , myDS.Mean 
                            , myDS.StandardDeviation
                            , myDS.Minimum
                            , myDS.Maximum
                            , Median
                            , Mode
                            , Pctile25
                            , Pctile75
                            , IQR
                            , N_LT1pt5IQR
                            , N_GT1pt5IQR
                            , MinZ
                            , MaxZ
                            , myDS.Skewness
                            , myDS.Kurtosis
                            , Sum);
                    }


                     
                    Debug.Print(String.Format("N={0} Nunq={1} M={2} SD={3} Min={4} Max={5}   {6}", N, Nunq, M, SD, Min, Max, col.ColumnName));
                    
                }

            }

        }

    }




}