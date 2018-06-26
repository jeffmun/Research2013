using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

using uwac;

namespace uwac.trk
{

	/// <summary>
	/// Summary description for validateuser
	/// </summary>
	public static class validateuser
	{

		public static bool IsActive()
		{

			SQL_utils sql = new SQL_utils("backend");

			int isactive01 = sql.IntScalar_from_ProcName("trk.fnCurrentUser_IsActive");

			sql.Close();

			bool isactive = (isactive01 == 1) ? true : false;

			return isactive;

		}
	}
}


