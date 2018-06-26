using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NReco.PivotData;
using NReco.PivotData.Output;
using uwac;

/// <summary>
/// Summary description for ConcatAggregatorFactory
/// </summary>

public class ConcatAggregatorFactory : IAggregatorFactory
{
	public string Field { get; private set; }

	public ConcatAggregatorFactory(string field)
	{
		Field = field;
	}
	public IAggregator Create()
	{
		return new ConcatAggregator(Field);
	}
	public IAggregator Create(object state)
	{
		return new ConcatAggregator(Field, state);
	}
	//public override bool Equals(object obj)
	//{
	//    var aggrFactory = obj as ConcatAggregator;
	//    if (aggrFactory == null)
	//        return false;
	//    return aggrFactory.fld == fld;
	//}
	public override string ToString()
	{
		string output;
		if (Field == "FTEcode")
		{
			output = "FTE";
		}
		else if (Field == "source_of_ID")
		{
			output = "ID";
		}
		else
		{
			output = String.Format("Concat of {0}", Field);
		}
		return output;
	}
}
