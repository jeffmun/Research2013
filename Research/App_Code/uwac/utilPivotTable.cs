using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using NReco.PivotData;
using NReco.PivotData.Output;
using uwac;

/// <summary>
/// Summary description for utilPivotTable
/// </summary>
/// 

namespace uwac
{

    public class utilPivotTable
    {
        public utilPivotTable()
        {
            //
            // TODO: Add constructor logic here
            //
        }



        //This takes a DataTable and returns a PivotTable on a given field (var_to_process) by a list of Rows and Cols 
        public static PivotTable DataTable_to_PivotTable(DataTable dt, List<string> keepCols, List<string> pivotRows, List<string> pivotCols, List<string> flds_to_process, List<AggrFx> requested_stats, string flds_as_row_or_column)
        {

            //List<string> keepCols = new List<string>();
            //keepCols.AddRange(pivotRows);
            //keepCols.AddRange(pivotCols);

            DataTable dtStacked = utilStats.StackData(dt, keepCols, flds_to_process);

            //add Variable here now that it exists in the stacked data.  "Value" is the field to process in this stacked data.
            if (flds_as_row_or_column == "Row") pivotRows.Add("Variable");
            else if (flds_as_row_or_column == "Column") pivotCols.Add("Variable");


            //This takes a DataTable and returns a PivotTable on a given field (var_to_process) by a list of Rows and Cols 
            PivotTable pt = DataTable_to_PivotTable(dtStacked, pivotRows, pivotCols, "Value", requested_stats);


            return pt;
        }


        public enum AggrFx
        {
            N = 1,
            M = 2,
            SD = 3,
            Min = 4,
            Max = 5,
            Sum = 6,
            Concat = 7,  //this supresses the total
            Nunq = 8,
            Concat2 = 9  //This implements the total, used in code6.aspx
        }


        public static List<AggrFx> StringToAggrFx (List<string> lst)
        {
            List<AggrFx> aggrs = new List<AggrFx>();

            foreach(string s in lst)
            {
                AggrFx fx = (AggrFx)Convert.ToInt16(s);
                aggrs.Add(fx);
            }

            return aggrs;
        }

        //This takes a DataTable and returns a PivotTable on a given field (var_to_process) by a list of Rows and Cols 
        public static PivotTable DataTable_to_PivotTable(DataTable dtStacked, List<string> pivotRows, List<string> pivotCols, string fldname, List<AggrFx> requested_stats)
        {

            if (dtStacked.Rows.Count > 0)
            {

                List<string> keepCols = new List<string>();

                keepCols.AddRange(pivotRows);
                keepCols.AddRange(pivotCols);
                keepCols.Add(fldname);


                IAggregatorFactory[] aggs = new IAggregatorFactory[requested_stats.Count];

                CountAggregatorFactory aggrN = new CountAggregatorFactory();
                AverageAggregatorFactory aggrM = new AverageAggregatorFactory(fldname);
                VarianceAggregatorFactory aggrSD = new VarianceAggregatorFactory(fldname, VarianceAggregatorValueType.StandardDeviation);
                MinAggregatorFactory aggrMin = new MinAggregatorFactory(fldname);
                MaxAggregatorFactory aggrMax = new MaxAggregatorFactory(fldname);
                SumAggregatorFactory aggrSum = new SumAggregatorFactory(fldname);
                ConcatAggregatorFactory aggrConcat = new ConcatAggregatorFactory(fldname);
                CountUniqueAggregatorFactory aggrNunq = new CountUniqueAggregatorFactory(fldname);
                Concat2AggregatorFactory aggrConcat2 = new Concat2AggregatorFactory(fldname);


                int counter = 0;
                foreach (AggrFx s in requested_stats)
                {
                    if (s == AggrFx.M) aggs[counter] = aggrM;
                    else if (s == AggrFx.SD) aggs[counter] = aggrSD;
                    else if (s == AggrFx.N) aggs[counter] = aggrN;
                    else if (s == AggrFx.Nunq) aggs[counter] = aggrNunq;
                    else if (s == AggrFx.Min) aggs[counter] = aggrMin;
                    else if (s == AggrFx.Max) aggs[counter] = aggrMax;
                    else if (s == AggrFx.Sum) aggs[counter] = aggrSum;
                    else if (s == AggrFx.Concat) aggs[counter] = aggrConcat;
                    else if (s == AggrFx.Concat2) aggs[counter] = aggrConcat2;
                    counter++;
                }


                if (aggs.Length > 1)
                {
                    CompositeAggregatorFactory compositeFactory = new CompositeAggregatorFactory(aggs);

                    var cube = new PivotData(keepCols.ToArray(), compositeFactory);
                    cube.ProcessData(new DataTableReader(dtStacked));

                    var allKeys = cube.GetDimensionKeys(); // returns array of keys for each dimension

                    var pivotTable = new PivotTable(
                        pivotRows.ToArray(), // row dimension(s)
                        pivotCols.ToArray(), // column dimension(s)
                        cube);
                    return pivotTable;

                }
                else
                {
                    var cube = new PivotData(keepCols.ToArray(), aggs[0]);
                    cube.ProcessData(new DataTableReader(dtStacked));

                    var allKeys = cube.GetDimensionKeys(); // returns array of keys for each dimension

                    var pivotTable = new PivotTable(
                        pivotRows.ToArray(), // row dimension(s)
                        pivotCols.ToArray(), // column dimension(s)
                        cube);
                    return pivotTable;

                }

            }
            else
            {
                return null;
            }
        }


    }
}