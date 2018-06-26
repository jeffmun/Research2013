using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

using uwac;

/// <summary>
/// Summary description for CheckData_utils
/// </summary>
namespace uwac
{


    public static class CheckData_utils
    {
        //WRONG private SQL_utils SQL = new SQL_utils();

        public static bool IsNumeric(this DataColumn col)
        {
            if (col == null)
                return false;
            // Make this const
            var numericTypes = new[] { typeof(Byte), typeof(Decimal), typeof(Double),
                typeof(Int16), typeof(Int32), typeof(Int64), typeof(SByte),
                typeof(Single), typeof(UInt16), typeof(UInt32), typeof(UInt64),
                typeof(Decimal?), typeof(Double?), typeof(Int16?), typeof(Int32?), typeof(Int64?)
                , typeof(int), typeof(int?), typeof(double), typeof(double?)
            };

            return numericTypes.Contains(col.DataType);
        }


    }

}