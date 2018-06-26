using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NReco.PivotData;
using NReco.PivotData.Output;

/// <summary>
/// Summary description for ConcatAggregator
/// </summary>


public class ConcatAggregator : IAggregator
{
    string total = ""; // default value for empty aggregator
    uint count = 0; // default value for empty aggregator
    string field;

    public ConcatAggregator(string f)
    {
        field = f;
    }
    public ConcatAggregator(string f, object state)
        : this(f)
    {
        // this constructor is used in SumAggregatorFactory.Create(object)
        var stateArr = state as object[];
        if (stateArr == null || stateArr.Length != 2)
            throw new InvalidOperationException("invalid state");
        count = Convert.ToUInt32(stateArr[0]);
        total = stateArr[1].ToString();
    }
    public void Push(object r, Func<object, string, object> getValue)
    {

        var v = getValue(r, field).ToString();

        if (v == null) v = ".";

        if (v != null)
        {
            // accumulate new value
            total += v; // "<b>" + v + "</b>";
            count++;
        }
    }
    public object Value { get { return total; } }
    public uint Count { get { return count; } }
    public void Merge(IAggregator aggr)
    {
        var concatAggr = aggr as ConcatAggregator;
        if (concatAggr == null)
            throw new ArgumentException("aggr");
        // combine accumulated values from 2 aggregators
        count += concatAggr.count;
        //total += concatAggr.total + " "; //"--";
        total = "--";
    }
    public object GetState()
    {
        // aggregator state: compact serializable structure
        return new object[] { count, total };
    }
}
