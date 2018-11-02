using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for TimeZoneInfoExtensions
	/// </summary>

	public static class TimeZoneInfoExtensions
	{

		public static string Abbreviation(this TimeZoneInfo Source)
		{

			var Map = new Dictionary<string, string>()
		{
			{"eastern standard time","est"},
			{"mountain standard time","mst"},
			{"central standard time","cst"},
			{"pacific standard time","pst"},
			{"alaska standard time", "akst" },
			{"hawaiian standard time", "hst" }
            //etc...
        };

			return Map[Source.Id.ToLower()].ToUpper();

		}

	}
}