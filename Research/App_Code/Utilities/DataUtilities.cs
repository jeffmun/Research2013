using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataUtilities
/// </summary>
public class DataUtilities
{
    //public DataUtilities()
    //{
    //    //
    //    // TODO: Add constructor logic here
    //    //
    //}

    public static DataTable PivotLINQ(DataTable dt, DataColumn keyColumn, DataColumn pivotColumn, DataColumn pivotValue)
    {

        // find primary key columns 
        //(i.e. only the keyColumn )
        DataTable temp = dt.Copy();

        foreach(DataColumn c in dt.Columns)
        {
            if (c.ColumnName != keyColumn.ColumnName) 
                temp.Columns.Remove(c.ColumnName);
        }
         
        //temp.Columns.Remove(pivotColumn.ColumnName);
        //for(int i=0; i<pivotValues.Length; i++)
        //{
        //    temp.Columns.Remove(pivotValues[i].ColumnName);
        //}

        string[] pkColumnNames = temp.Columns.Cast<DataColumn>()
            .Select(c => c.ColumnName)
            .ToArray();


        // prep results table
        DataTable result = temp.DefaultView.ToTable(true, pkColumnNames).Copy();
        result.PrimaryKey = result.Columns.Cast<DataColumn>().ToArray();
        dt.AsEnumerable()
            .Select(r => r[pivotColumn.ColumnName].ToString())
            .Distinct().ToList()
            .ForEach(c => result.Columns.Add(c, pivotColumn.DataType));

        // load it
        foreach (DataRow row in dt.Rows)
        {
            // find row to update
            DataRow aggRow = result.Rows.Find(
                pkColumnNames
                    .Select(c => row[c])
                    .ToArray());
            // the aggregate used here is LATEST 
            // adjust the next line if you want (SUM, MAX, etc...)

            aggRow[row[pivotColumn.ColumnName].ToString()] = row[pivotValue.ColumnName];
        }

        return result;
    }

    public static DataTable PivotLINQ_ORIG(DataTable dt, DataColumn pivotColumn, DataColumn pivotValue)
    {
        // find primary key columns 
        //(i.e. everything but pivot column and pivot value)
        DataTable temp = dt.Copy();
        temp.Columns.Remove(pivotColumn.ColumnName);
        temp.Columns.Remove(pivotValue.ColumnName);
        string[] pkColumnNames = temp.Columns.Cast<DataColumn>()
            .Select(c => c.ColumnName)
            .ToArray();

        // prep results table
        DataTable result = temp.DefaultView.ToTable(true, pkColumnNames).Copy();
        result.PrimaryKey = result.Columns.Cast<DataColumn>().ToArray();
        dt.AsEnumerable()
            .Select(r => r[pivotColumn.ColumnName].ToString())
            .Distinct().ToList()
            .ForEach(c => result.Columns.Add(c, pivotColumn.DataType));

        // load it
        foreach (DataRow row in dt.Rows)
        {
            // find row to update
            DataRow aggRow = result.Rows.Find(
                pkColumnNames
                    .Select(c => row[c])
                    .ToArray());
            // the aggregate used here is LATEST 
            // adjust the next line if you want (SUM, MAX, etc...)
            aggRow[row[pivotColumn.ColumnName].ToString()] = row[pivotValue.ColumnName];
        }

        return result;
    }

}