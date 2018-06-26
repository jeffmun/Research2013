using System;

namespace AutismCenterBase.Utilities
{
	public class TextFormatter
	{
		private string sString;

		public string FormatDBInput(string s)
		{
			s.Replace("'", "''");

			return s;
		}

		public string FormatDBOutput(string s)
		{
			string sReturn = s;
			if (s == null || s.Trim() == "")
				sReturn = "&nbsp;";

			sReturn = sReturn.Replace("\n", "<br/>");
			sReturn = sReturn.Replace("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");

			return sReturn;
		}

		public string Text
		{
			get {return sString;}
			set {sString = value;}
		}

		public string AgeInYearsAndMonths(DateTime dtDOB)
		{
            //string sReturn = "";
            //TimeSpan tsElapsed;
            //int nElapsedDays;
            //int nYears = 0;
            //int nMonths = 0;
            //tsElapsed = DateTime.Now.Subtract(dtDOB);
            //nElapsedDays = Convert.ToInt32(tsElapsed.TotalDays);
            //nYears = (nElapsedDays/365);
            //nElapsedDays = (nElapsedDays-(nYears*365));
            //nMonths = Convert.ToInt32(nElapsedDays/30);
            //if (nMonths >= 12)
            //{
            //    nMonths = nMonths - 12;
            //    nYears = nYears + 1;
            //}
            //sReturn = nYears.ToString() + " yrs. " + nMonths.ToString() + " mos.";
            //return sReturn;

            string sReturn = "";
            DateTime dtToday = DateTime.Now.Date;
            int monthsApart = 12 * (dtToday.Year - dtDOB.Year) + (dtToday.Month - dtDOB.Month);
            int daysApart = dtToday.Day - dtDOB.Day;

            if (daysApart < 0)
            { monthsApart = monthsApart - 1; }

            int nYears = monthsApart / 12;
            int nMonths = monthsApart - (12 * nYears);

            sReturn = nYears.ToString() + " yrs. " + nMonths.ToString() + " mos.";
            return sReturn;


		}




		public string ConvertToYesNo(string sValue)
		{
			switch (sValue.Trim().ToLower())
			{
				case "1":
					return "Yes";
				case "-1":
					return "Yes";
				case "true":
					return "Yes";
				default:
					return "No";
			}
		}
	}
}
