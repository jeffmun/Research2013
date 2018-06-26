using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NReco.PivotData;
using NReco.PivotData.Output;

/// <summary>
/// Summary description for ConcatAggregator
/// </summary>


public class Concat2Aggregator : IAggregator
{
    string total = ""; // default value for empty aggregator
    uint count = 0; // default value for empty aggregator
    string field;

    public Concat2Aggregator(string f)
    {
        field = f;
    }
    public Concat2Aggregator(string f, object state)
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
        var concat2Aggr = aggr as Concat2Aggregator;
        if (concat2Aggr == null)
            throw new ArgumentException("aggr");
        // combine accumulated values from 2 aggregators
        count += concat2Aggr.count;
        total += concat2Aggr.total + " ";  //Concat2
        //total = "--";  //Concat
    }
    public object GetState()
    {
        // aggregator state: compact serializable structure
        return new object[] { count, total };
    }
}
