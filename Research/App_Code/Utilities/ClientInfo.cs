using System;
using System.Web;

namespace AutismCenterBase.Utilities
{
	public class ClientInfo
	{
		private bool bIsUplevelBrowser;
		private bool bIsMac;
		private HttpBrowserCapabilities oBrowseCap;

		public ClientInfo()
		{
			//Check the browser capabilities and set a value as to whether or not it is an
			//up-level browser. This will determine how certain controls and tables are
			//displayed on the site.
			oBrowseCap = HttpContext.Current.Request.Browser;
			bIsUplevelBrowser = false;
			bIsMac = false;

			if (oBrowseCap.Platform.ToUpper().StartsWith("WIN") && !oBrowseCap.Win16)
			{
				bIsMac = false;

				if (oBrowseCap.Browser.ToUpper().IndexOf("IE") >= 0)
				{
					if (Convert.ToDouble(oBrowseCap.Version) > 5.01)
						bIsUplevelBrowser = true;
				}
				else if (oBrowseCap.Browser.ToUpper().IndexOf("NETSCAPE") >= 0)
				{
					if (Convert.ToDouble(oBrowseCap.Version) >= 5.0)
						bIsUplevelBrowser = true;
				}
			}
			else if (oBrowseCap.Platform.ToUpper().StartsWith("MAC"))
				bIsMac = true;
		}

		public bool IsMac
		{
			get {return bIsMac;}
		}

		public bool IsUplevelBrowser
		{
			get {return bIsUplevelBrowser;}
		}
	}
}
