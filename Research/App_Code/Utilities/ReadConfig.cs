using System;
using System.Web;
using System.Xml;

namespace AutismCenterBase.Utilities
{
	public class ReadConfig
	{
		private XmlDocument oXMLDoc = new XmlDocument();
		private string sConfigPath;

		public ReadConfig()
		{
			//DF: 4/8 changed to use ~ for application path
			sConfigPath = HttpContext.Current.Server.MapPath("~/App_Data/config.xml");
			oXMLDoc.Load(sConfigPath);
		}

		#region Read Generic Node Value
		public string ReadGenericValue(string sXPathQuery)
		{
			string sReturn = "";
			XmlNode oNode = oXMLDoc.SelectSingleNode(sXPathQuery);

			if (oNode != null)
				sReturn = oNode.InnerText;

			return sReturn;
		}
		#endregion

		public string ReadConnectionString(ConnectionStringType oConnStrType)
		{
			string sReturn = "";
			XmlNode oNode = null;

			if (oConnStrType == ConnectionStringType.Analysis)
				oNode = oXMLDoc.SelectSingleNode("/AutismCenterWebConfig/AnalysisConnectionString");
			else if (oConnStrType == ConnectionStringType.Data)
				oNode = oXMLDoc.SelectSingleNode("/AutismCenterWebConfig/DataConnectionString");
			else if (oConnStrType == ConnectionStringType.Tracking)
				oNode = oXMLDoc.SelectSingleNode("/AutismCenterWebConfig/TrackingConnectionString");
			else if (oConnStrType == ConnectionStringType.NDAR)
				oNode = oXMLDoc.SelectSingleNode("/AutismCenterWebConfig/NDARConnectionString");
			else if (oConnStrType == ConnectionStringType.NDAR)
				oNode = oXMLDoc.SelectSingleNode("/AutismCenterWebConfig/NDARConnectionString");
			else if (oConnStrType == ConnectionStringType.WS03_Excel_Imports)
				oNode = oXMLDoc.SelectSingleNode("/AutismCenterWebConfig/ws03_Excel_Imports_ConnectionString");
			else if (oConnStrType == ConnectionStringType.WS03_uwac_Genetics)
				oNode = oXMLDoc.SelectSingleNode("/AutismCenterWebConfig/ws03_uwac_genetics_ConnectionString");
			

			if (oNode != null)
				sReturn = oNode.InnerText;

			return sReturn;
		}

		#region Read Web Site Root URL
		public string ReadWebSiteRootURL
		{
			get
			{
				XmlNode oNode = oXMLDoc.SelectSingleNode("//AutismCenterWebConfig/WebSiteRootURL");

				if (oNode.InnerText != "")
				{
					if (oNode.InnerText.EndsWith("/"))
						return oNode.InnerText;
					else
						return oNode.InnerText + "/";
				}
				else
					return "https://autism.washington.edu/";
			}
		}
		#endregion

		#region Read Web Docs Location
		public string ReadWebDocsLocation
		{
			get
			{
				XmlNode oNode = oXMLDoc.SelectSingleNode("//AutismCenterWebConfig/DocumentLocation");

				if (oNode.InnerText != "")
				{
					if (oNode.InnerText.EndsWith("\\"))
						return oNode.InnerText;
					else
						return oNode.InnerText + "\\";
				}
				else
					return "\\\\Autism-fs01\\WebDocs$\\";
			}
		}
		#endregion

		#region Read the Session Duration
		public int SessionDuration
		{
			get
			{
				XmlNode oNode = oXMLDoc.SelectSingleNode("//AutismCenterWebConfig/SessionDuration");
				int nReturn = 10;

				if (oNode.InnerText != "")
				{
					try
					{
						nReturn = Convert.ToInt16(oNode.InnerText);
					}
					catch
					{
						nReturn = 10;
					}
				}

				return nReturn;
			}
		}
		#endregion

		#region Read the Error Message Emails
		public string[] ErrorMessageEmail
		{
			get
			{
				XmlNodeList oNodes = oXMLDoc.SelectNodes("//AutismCenterWebConfig/ErrorMessageEmail");
				string[] sReturn;

				if (oNodes.Count > 0)
				{
					sReturn = new string[oNodes.Count];

					for (int i=0;i<oNodes.Count;i++)
						sReturn[i] = oNodes[i].InnerText;
				}
				else
					sReturn = null;

				return sReturn;
			}
		}
		#endregion

		#region Read the Access Request Email
		public string AccessRequestEmail
		{
			get
			{
				XmlNode oNode = oXMLDoc.SelectSingleNode("//AutismCenterWebConfig/OnlineAccessRequestEmail");

				if (oNode.InnerText != "")
					return oNode.InnerText;
				else
					return "authelp@u.washington.edu";
			}
		}
		#endregion


		public enum ConnectionStringType
		{
			Data		= 1,
			Tracking	= 2,
			Analysis	= 3,
			NDAR        = 4,
			WS03_Excel_Imports = 5,
			WS03_uwac_Genetics = 6
		}
	}
}
