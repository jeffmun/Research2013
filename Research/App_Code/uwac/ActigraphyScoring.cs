using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ActigraphyScoring
/// </summary>
public static class ActigraphyScoring
{


	//public ActigraphyScoring()
	//{
	//    //
	//    // TODO: Add constructor logic here
	//    //
	//}


	public static DateTime Date_time_ToDateTime(int date_as_int, double time_as_double_from_0_to_1)
	{
		double days = date_as_int + time_as_double_from_0_to_1;
		DateTime dt = DateTime.FromOADate(days);
		return dt;
	}


	public static DateTime Daymin_to_DateTime(int daymin)
	{
		double days = (daymin / 1440.0);
		DateTime dt = DateTime.FromOADate(days);
		return dt;
	}

	public static String Daymin_to_String(int? _daymin)
	{
		if (_daymin == null) return "**Time_Not_Found**";
		else
		{
			int daymin = _daymin.Value;
			double days = (daymin / 1440.0);
			DateTime dt = DateTime.FromOADate(days);
			string s = String.Format("{0} {1}"
				, dt.DayOfWeek.ToString().Substring(0, 3), dt.ToString("MM/dd/yyyy hh:mm tt"));
			return s;
		}
	}

}