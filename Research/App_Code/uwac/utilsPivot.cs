
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataPivot
/// 
/// from http://weblogs.sqlteam.com/jeffs/archive/2005/05/11/5101.aspx 
/// 
/// this code is from here: http://weblogs.sqlteam.com/jeffs/articles/5091.aspx 
/// 
/// The arguments for the Pivot() function are as follows:
/// 
/// dataValues -- this is any open DataReader object, ready to be transformed and pivoted into a DataTable.  
///               As mentioned, it should be fully grouped, aggregated, sorted and ready to go. 
/// keyColumn -- This is the column in the DataReader which serves to identify each row.  In the previous example, this would be CustomerID.  
///              Your DataReader's recordset should be grouped and sorted by this column as well.
/// pivotNameColumn -- This is the column in the DataReader that contains the values you'd like to transform from rows into columns.   
///                    In the example, this would be ProductName.
/// pivotValueColumn -- This is the column that in the DataReader that contains the values to pivot into the appropriate columns.  
///                     For our example, it would be Qty, which has been defined in the SELECT statement as SUM(Qty).
///                     
/// And, that's it.  You just call the Pivot() function on any object that implements IDataReader, specify the pivot information, 
///   and a DataTable is returned that you can use however you like.  The example uses this to fill up a DataGrid so you can see the results on a form.
/// 
/// </summary>

namespace uwac
{

    public class utilsPivot
    {



        public static DataTable Pivot(DataTable dt, string[] keepCols, string pivotColumn, string[] pivotValues)
        {

            DataTable dt_pivot = utilsPivot.Pivot(dt, keepCols, dt.Columns[pivotColumn], pivotValues, "", "");

            return dt_pivot;
        }

        
        public static DataTable Pivot(DataTable dt, string[] keepCols, string pivotColumn, string pivotValue)
        {
            DataTable dt_pivot = utilsPivot.Pivot(dt, keepCols, dt.Columns[pivotColumn], dt.Columns[pivotValue], "", "");
            return dt_pivot;
        }
        public static DataTable Pivot(DataTable dt, string[] keepCols, string pivotColumn, string pivotValue, string sortRowsBy, string sortColsBy)
        {
            DataTable dt_pivot = utilsPivot.Pivot(dt, keepCols, dt.Columns[pivotColumn], dt.Columns[pivotValue], sortRowsBy, sortColsBy);
            return dt_pivot;
        }



        public static DataTable Pivot(DataTable dt, string[] keepCols, DataColumn pivotColumn, DataColumn pivotValue, string sortRowsBy, string sortColsBy)
        {
            //Sort the data so that columns will be sorted
            DataView dv = new DataView(dt);

            if (sortRowsBy != "")
            {
                if (!sortRowsBy.EndsWith(" DESC") & !sortRowsBy.EndsWith(" ASC")) sortRowsBy += " ASC";
            }
            if (sortColsBy != "")
            {
                if (!sortColsBy.EndsWith(" DESC") & !sortColsBy.EndsWith(" ASC")) sortColsBy += " ASC";
            }

            string rowfilter_sort = sortColsBy + ((sortRowsBy != "" & sortColsBy != "") ? ", " : "") + sortRowsBy;

            if (rowfilter_sort != "")
            {
                dv.Sort = rowfilter_sort;
            }

            //Remove the columns that are not in the keepCols or PivotColumn or
            DataTable temp = dv.ToTable();

            //Get all the column names in the DataTable
            string[] ColumnNames = temp.Columns.Cast<DataColumn>()
                .Select(c => c.ColumnName)
                .ToArray();


            //Find columns that are not in "keepCols"
            var removevars = ColumnNames.Except(keepCols);

            //Make sure the pivotColumn and pivotValue are not in the the list
            //to remove
            removevars = removevars.Except(new string[] { pivotColumn.ColumnName, pivotValue.ColumnName});
            if (sortColsBy != "")
            {
                removevars = removevars.Except(new string[] { pivotColumn.ColumnName, pivotValue.ColumnName, sortColsBy});
            }
            else
            {
                removevars = removevars.Except(new string[] { pivotColumn.ColumnName, pivotValue.ColumnName });
            }

            foreach (string s in removevars)
            {
                temp.Columns.Remove(s);  //Remove the columns that aren't needed in the final table
            }


            DataTable result = Pivot(temp, temp.Columns[pivotColumn.ColumnName], temp.Columns[pivotValue.ColumnName]);

            return result;

        }


        // multiple value columns
        public static DataTable Pivot(DataTable dt, string[] keepCols, DataColumn pivotColumn, string[] pivotValues, string sortRowsBy, string sortColsBy)
        {
            //Sort the data so that columns will be sorted
            DataView dv = new DataView(dt);

            if (sortRowsBy != "")
            {
                if (!sortRowsBy.EndsWith(" DESC") & !sortRowsBy.EndsWith(" ASC")) sortRowsBy += " ASC";
            }
            if (sortColsBy != "")
            {
                if (!sortColsBy.EndsWith(" DESC") & !sortColsBy.EndsWith(" ASC")) sortColsBy += " ASC";
            }

            string rowfilter_sort = sortColsBy + ((sortRowsBy != "" & sortColsBy != "") ? ", " : "") + sortRowsBy;

            if (rowfilter_sort != "")
            {
                dv.Sort = rowfilter_sort;
            }

            //Remove the columns that are not in the keepCols or PivotColumn or
            DataTable temp = dv.ToTable();

            //Get all the column names in the DataTable
            string[] ColumnNames = temp.Columns.Cast<DataColumn>()
                .Select(c => c.ColumnName)
                .ToArray();

            //Compile all the columns to keep 
            List<string> lst_keepCols = keepCols.ToList<string>();

            lst_keepCols.Add(pivotColumn.ColumnName);
            lst_keepCols.AddRange(pivotValues.ToList<string>());

            if (sortColsBy != "")
            {
                lst_keepCols.Add(sortColsBy);
            }


            //Find columns that are not in "keepCols"
            var removevars = ColumnNames.Except(lst_keepCols.ToArray());


            foreach (string s in removevars)
            {
                temp.Columns.Remove(s);  //Remove the columns that aren't needed in the final table
            }


            DataTable result = Pivot(temp, temp.Columns[pivotColumn.ColumnName], pivotValues);

            return result;

        }



        //from
        //http://stackoverflow.com/questions/12866685/dynamic-pivot-using-c-sharp-linq
        public static DataTable Pivot(DataTable dt, DataColumn pivotColumn, DataColumn pivotValue)
        {

            //IEnumerable<Option> allOptions = optiongroup.Options.OrderByDescending(o => o.SortOrder);

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

            //add new pivoted columns
            dt.AsEnumerable()
                .Select(r => r[pivotColumn.ColumnName].ToString())
                .Distinct().ToList()
                .ForEach(c => result.Columns.Add(c, pivotValue.DataType)); //pivotColumn.DataType));

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


                //multiple pvotValue columns
        public static DataTable Pivot(DataTable dt, DataColumn pivotColumn, string[] pivotValues)
        {
            DataTable dt_out = Pivot(dt, pivotColumn, pivotValues, "ColsThenRows");
            return dt_out;
        }


        //multiple pvotValue columns
        public static DataTable Pivot(DataTable dt, DataColumn pivotColumn, string[] pivotValues, string newcolumnorder )
        {

            //IEnumerable<Option> allOptions = optiongroup.Options.OrderByDescending(o => o.SortOrder);


            // find primary key columns 
            //(i.e. everything but pivot column and pivot value)
            DataTable temp = dt.Copy();
            temp.Columns.Remove(pivotColumn.ColumnName);

            foreach (string str_pivotValue in pivotValues)
            {
                DataColumn pivotValue = temp.Columns[str_pivotValue ];
                temp.Columns.Remove(pivotValue.ColumnName);
            }

            string[] pkColumnNames = temp.Columns.Cast<DataColumn>()
                .Select(c => c.ColumnName)
                .ToArray();

            // prep results table - containing all the primary key columns 
            DataTable result = temp.DefaultView.ToTable(true, pkColumnNames).Copy();
            result.PrimaryKey = result.Columns.Cast<DataColumn>().ToArray();


            int ncols_base = result.Columns.Count;

            foreach (string str_pivotValue in pivotValues)
            {
                DataColumn pivotValue = dt.Columns[str_pivotValue];
                string suffix = str_pivotValue;
                //add new pivoted columns
                dt.AsEnumerable()
                    .Select(r => r[pivotColumn.ColumnName].ToString())
                    .Distinct().ToList()
                    .ForEach(c => result.Columns.Add(c + "_" + suffix, pivotValue.DataType)); //pivotColumn.DataType));
            }

            //Reorder new columns if desired
            if (newcolumnorder == "ColsThenRows")
            {
                int ncols = result.Columns.Count;
                int n_col_pairs = (ncols - ncols_base) / pivotValues.Length;

                for(int i = 0; i < n_col_pairs; i++)
                {
                    int idx = ncols_base + n_col_pairs + i;
                    int newidx = idx - (n_col_pairs - (i+1));
                    result.Columns[idx].SetOrdinal(newidx);
                }
            }


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
                foreach (string str_pivotValue in pivotValues)
                {
                    DataColumn pivotValue = dt.Columns[str_pivotValue];
                    string newcol = row[pivotColumn.ColumnName].ToString() + "_" + str_pivotValue;
                    //aggRow[row[pivotColumn.ColumnName].ToString()] = row[pivotValue.ColumnName];
                    aggRow[newcol] = row[pivotValue.ColumnName];
                }

            }

            return result;
        }



        #region using IDataReader
        public static DataTable Pivot(IDataReader dataValues, string keyColumn, string pivotNameColumn, string pivotValueColumn)
        {
            DataTable tmp = new DataTable();
            DataRow r;
            string LastKey = "//dummy//";
            int i, pValIndex, pNameIndex;
            string s;
            bool FirstRow = true;

            // Add non-pivot columns to the data table:

            pValIndex = dataValues.GetOrdinal(pivotValueColumn);
            pNameIndex = dataValues.GetOrdinal(pivotNameColumn);

            for (i = 0; i <= dataValues.FieldCount - 1; i++)
                if (i != pValIndex && i != pNameIndex)
                    tmp.Columns.Add(dataValues.GetName(i), dataValues.GetFieldType(i));

            r = tmp.NewRow();

            // now, fill up the table with the data:
            while (dataValues.Read())
            {
                // see if we need to start a new row
                if (dataValues[keyColumn].ToString() != LastKey)
                {
                    // if this isn't the very first row, we need to add the last one to the table
                    if (!FirstRow)
                        tmp.Rows.Add(r);
                    r = tmp.NewRow();
                    FirstRow = false;
                    // Add all non-pivot column values to the new row:
                    for (i = 0; i <= dataValues.FieldCount - 3; i++)
                        r[i] = dataValues[tmp.Columns[i].ColumnName];
                    LastKey = dataValues[keyColumn].ToString();
                }
                // assign the pivot values to the proper column; add new columns if needed:
                s = dataValues[pNameIndex].ToString();


                // ORIG is next 2 lines. See comment at:  http://weblogs.sqlteam.com/jeffs/archive/2007/04/20/sorting-columns-with-the-c-pivot-function.aspx
                //if (!tmp.Columns.Contains(s))
                //    tmp.Columns.Add(s, dataValues.GetFieldType(pValIndex));
                // THIS ENSURES PROPER SORTING 

                if (!tmp.Columns.Contains(s))
                {
                    DataColumn c = tmp.Columns.Add(s, dataValues.GetFieldType(pValIndex));
                    // set the index so that it is sorted properly:
                    int newOrdinal = c.Ordinal;
                    for (i = newOrdinal - 1; i >= dataValues.FieldCount - 2; i--)
                        if (c.ColumnName.CompareTo(tmp.Columns[i].ColumnName) < 0)
                            newOrdinal = i;
                    c.SetOrdinal(newOrdinal);
                }
                // end of change from ORIG



                r[s] = dataValues[pValIndex];
            }

            // add that final row to the datatable:
            tmp.Rows.Add(r);

            // Close the DataReader
            dataValues.Close();

            // and that's it!
            return tmp;
        }





        public static DataTable Pivot2(IDataReader dataValues, string keyColumn, string pivotNameColumn, string pivotValueColumn)
        {
            DataTable tmp = new DataTable();
            DataRow r;
            string LastKey = "//dummy//";
            int i, pValIndex, pNameIndex, keyColumnIndex;
            string s;
            bool FirstRow = true;

            // Add non-pivot columns to the data table:

            pValIndex = dataValues.GetOrdinal(pivotValueColumn);
            pNameIndex = dataValues.GetOrdinal(pivotNameColumn);
            keyColumnIndex = dataValues.GetOrdinal(keyColumn);

            for (i = 0; i <= dataValues.FieldCount - 1; i++)
                if (i != pValIndex && i != pNameIndex)
                    tmp.Columns.Add(dataValues.GetName(i), dataValues.GetFieldType(i));


            r = tmp.NewRow();

            // now, fill up the table with the data:
            while (dataValues.Read())
            {
                // see if we need to start a new row
                if (dataValues[keyColumn].ToString() != LastKey)
                {
                    // if this isn't the very first row, we need to add the last one to the table
                    if (!FirstRow)
                        tmp.Rows.Add(r);
                    r = tmp.NewRow();
                    FirstRow = false;

                    // add all non-pivot column values to the new row:
                    for (i = 0; i <= dataValues.FieldCount - 3; i++)
                        r[i] = dataValues[tmp.Columns[i].ColumnName];
                    LastKey = dataValues[keyColumn].ToString();
                }
                // assign the pivot values to the proper column; add new columns if needed:
                s = dataValues[pNameIndex].ToString();


                // ORIG is next 2 lines. See comment at:  http://weblogs.sqlteam.com/jeffs/archive/2007/04/20/sorting-columns-with-the-c-pivot-function.aspx
                //if (!tmp.Columns.Contains(s))
                //    tmp.Columns.Add(s, dataValues.GetFieldType(pValIndex));
                // THIS ENSURES PROPER SORTING 

                if (!tmp.Columns.Contains(s))
                {
                    DataColumn c = tmp.Columns.Add(s, dataValues.GetFieldType(pValIndex));
                    // set the index so that it is sorted properly:
                    int newOrdinal = c.Ordinal;
                    for (i = newOrdinal - 1; i >= dataValues.FieldCount - 2; i--)
                        if (c.ColumnName.CompareTo(tmp.Columns[i].ColumnName) < 0)
                            newOrdinal = i;
                    c.SetOrdinal(newOrdinal);
                }
                // end of change from ORIG



                r[s] = dataValues[pValIndex];
            }

            // add that final row to the datatable:
            tmp.Rows.Add(r);

            // Close the DataReader
            dataValues.Close();

            // and that's it!
            return tmp;
        }
        #endregion 


        ////USAGE: CopyColumns(source, destiny, "Column1", "column2");
        //private void CopyColumns(DataTable source, DataTable dest, params string[] columns)
        //{
        // foreach (DataRow sourcerow in source.Rows)
        // {
        //   DataRow destRow = dest.NewRow();
        //    foreach(string colname in columns)
        //    {
        //      destRow[colname] = sourcerow[colname];
        //    }
        //   dest.Rows.Add(destRow);
        //  }
        //}



        //public DataTable MergeMSD(DataTable dt, string x1, string x2, string[] stats)
        //{
        //    DataTable[] dts = new DataTable[stats.Length];    
        //    for(int i=0; i < stats.Length; i++)
        //    {
        //        dts[i] = Pivot(dataValues, )
        //    }
        //}







    }

}
