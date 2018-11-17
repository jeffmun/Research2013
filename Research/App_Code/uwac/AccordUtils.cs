using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Accord;
using Accord.DataSets;
using uwac;

/// <summary>
/// Summary description for AccordUtils
/// </summary>
public class AccordUtils
{
	public AccordUtils()
	{
		//
		// TODO: Add constructor logic here
		//
	}

	public static DataTable Iris()
	{
		var iris = new Iris();

		DataTable dt = ToDataTable(iris.ClassLabels, iris.ClassNames, iris.Instances, iris.VariableNames);

		dt.Rows[37]["sepalwidth"] = 3.6;
		dt.Rows[37]["petallength"] = 1.4;
		dt.Rows[34]["petalwidth"] = 0.2;

		return dt;
	}


	public static DataTable ToDataTable(int[] classlabels, string[] classname, double[][] input, string[] varnames)
	{
		DataTable dt = new DataTable();

		dt.Columns.Add(new DataColumn("species"));
		dt.Columns.Add(new DataColumn("group"));
		dt.Columns.Add(new DataColumn("category"));

		foreach (string s in varnames)
		{
			string v = s.Replace(" ","").ToLower();
			DataColumn col = new DataColumn( v, typeof(double));

			dt.Columns.Add(col);
		}

		for(int i=0; i < input.Length; i++)
		//foreach (double[] d in input)
		{
			DataRow row = dt.NewRow();
			row[0] = classname[classlabels[i]];
			row[1] = "";

			int colcounter = 2;
			foreach (double x in input[i])
			{
				row[colcounter] = x;
				colcounter++;
			}
			dt.Rows.Add(row);
		}

		Random rand = new Random();
		Random rand2 = new Random();
		int max = rand.Next(2, 8);
		int max2 = rand2.Next(2, 4);
		foreach (DataRow row in dt.Rows)
		{
			row[1] = RandomGroup(rand, max, "group");
			row[2] = RandomGroup(rand2, max2, "cat");
		}


		return dt;
	}


	public static string RandomGroup(Random rand, int max, string prefix)
	{

		int foo = rand.Next(1, max);

		return String.Format("{0}_{1}", prefix, foo);
	}
}