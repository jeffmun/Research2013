using System;

namespace AutismCenterBase.Utilities
{
	public class DataValidator
	{
		public DataValidator()
		{
			
		}

		public bool HasInvalidChars(string sSearchedString, string sInvalidChars)
		{
			bool bReturn = false;
			int i;

			for (i=0;i<sSearchedString.Length;i++)
			{
				if (sInvalidChars.IndexOf(sSearchedString.Substring(i, 1)) != -1)
				{
					bReturn = true;
					break;
				}
			}

			return bReturn;
		}
	}
}
