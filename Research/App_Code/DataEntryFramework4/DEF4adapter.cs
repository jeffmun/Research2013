using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using uwac;

namespace DataEntryFramework4
{
	/// <summary>
	/// Summary description for DEF4adapter
	/// </summary>
	public static class DEF4adapter
	{


		public static DataTable SqlCommand_returns_DataTable(SqlCommand sqlcmd)
		{


			//New Feb 2019
			SQL_utils sql = new SQL_utils("data");

			SqlParameter[] newps = new SqlParameter[sqlcmd.Parameters.Count];

			List<SqlParameter> ps = new List<SqlParameter>();
			foreach (SqlParameter p in sqlcmd.Parameters)
			{
				SqlParameter newp = new SqlParameter();
				newp.ParameterName = p.ParameterName;
				newp.Value = p.Value;
				newp.SqlValue = p.SqlValue;
				newp.SqlDbType = p.SqlDbType;
				ps.Add(newp);
			}

			string sqlproc = sqlcmd.CommandText;

			DataTable dt = sql.DataTable_from_SQLstring(sqlproc, ps);

			sql.Close();

			return dt;
		}

		public static void SqlCommand_NonQuery(SqlCommand sqlcmd)
		{


			//New Feb 2019
			SQL_utils sql = new SQL_utils("data");

			SqlParameter[] newps = new SqlParameter[sqlcmd.Parameters.Count];

			List<SqlParameter> ps = new List<SqlParameter>();
			foreach (SqlParameter p in sqlcmd.Parameters)
			{
				SqlParameter newp = new SqlParameter();
				newp.ParameterName = p.ParameterName;
				newp.Value = p.Value;
				newp.SqlValue = p.SqlValue;
				newp.SqlDbType = p.SqlDbType;
				ps.Add(newp);
			}

			string sqlproc = sqlcmd.CommandText;

			sql.NonQuery_from_SQLstring(sqlproc, ps);

			sql.Close();

		}
	}
}