using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using RDotNet;

/// <summary>
/// Summary description for DataFrame
/// </summary>
public class DataFrame
{
	public DataFrame()
	{
		//
		// TODO: Add constructor logic here
		//
	}

	public static DataFrame DataTable_to_DataFrame(REngine engine, DataTable dt)
	{
		REngine.SetEnvironmentVariables(@"C:\Program Files\R\R-2.13.0\bin\i386");
		DataFrame df = new DataFrame();




		return df;
	}


	public static DataTable DFtoDT(DataFrame df)
	{

		DataTable dt = new DataTable();

		//for (int i = 0; i < df.ColumnCount; ++i)
		//{
		//	dt.Columns.Add(df.ColumnNames[i]);
		//}


		//for (int i = 0; i < df.RowCount; i++)
		//{
		//	DataRow newRow = dt.Rows.Add();
		//	for (int j = 0; j < df.ColumnCount; j++)
		//	{
		//		newRow[j] = df[i, j];
		//	}
		//}

		return dt;
	}

}