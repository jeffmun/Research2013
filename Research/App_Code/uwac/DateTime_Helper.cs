using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for DateTime_Helper
	/// </summary>
	public static class DateTime_Helper
	{
		//public static DateTime_Helper()
		//{
		//	//
		//	// TODO: Add constructor logic here
		//	//
		//}

		public static string DateTime_for_filename()
		{
			string datenow = DateTime.Now.Year.ToString() + ((DateTime.Now.Month < 10) ? "0" : "") + DateTime.Now.Month.ToString() + ((DateTime.Now.Day < 10) ? "0" : "") + DateTime.Now.Day.ToString();
			string hrminnow = ((DateTime.Now.Hour < 10) ? "0" : "") + DateTime.Now.Hour.ToString() + ((DateTime.Now.Minute < 10) ? "0" : "") + DateTime.Now.Minute.ToString();

			string datetime_for_filename = "_" + datenow + "_" + hrminnow; //TODO
			return datetime_for_filename;
		}
	}
}