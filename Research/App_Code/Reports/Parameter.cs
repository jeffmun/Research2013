using System;
using System.Data;

using AutismCenterBase.Utilities;
using AutismCenterBase.Security;

namespace AutismCenterBase.Reports
{
	public class Parameter
	{
		private string sName;
		private SqlDbType oType;
		private int nLength;
		private string sValue;
		private string sDataSource;
		private string sSourceIDField;
		private string sSourceTextField;
		private string sFriendlyName;
		private bool bIsRequired;
		private Parameter.DataSourceTypes oDataSourceType;

		public string Name
		{
			get {return sName;}
			set {sName = value;}
		}

		public string FriendlyName
		{
			get {return sFriendlyName;}
			set {sFriendlyName = value;}
		}

		#region DataType Property
		public string DataType
		{
			get
			{
				switch (oType)
				{
					case SqlDbType.VarChar:
						return "string";

					case SqlDbType.Int:
						return "int";

					case SqlDbType.DateTime:
						return "datetime";

					default:
						return "string";
				}
			}
			set
			{
				switch (value)
				{
					case "string":
						oType = SqlDbType.VarChar;
						break;

					case "int":
						nLength = 4;
						oType = SqlDbType.Int;
						break;

					case "datetime":
						nLength = 8;
						oType = SqlDbType.DateTime;
						break;

					default:
						oType = SqlDbType.VarChar;
						break;
				}
			}
		}
		#endregion
		
		public int Length
		{
			get {return nLength;}
			set {nLength = value;}
		}

		public string Value
		{
			get {return sValue;}
			set {sValue = value;}
		}

		public bool IsRequired
		{
			get {return bIsRequired;}
			set {bIsRequired = value;}
		}

		#region DataSource stuff
		public string DataSource
		{
			get {return sDataSource;}
			set {sDataSource = value;}
		}

		public string DataSourceIDField
		{
			get {return sSourceIDField;}
			set {sSourceIDField = value;}
		}

		public string DataSourceTextField
		{
			get {return sSourceTextField;}
			set {sSourceTextField = value;}
		}

		public DataSourceTypes DataSourceType
		{
			get {return oDataSourceType;}
			set {oDataSourceType = value;}
		}

		public enum DataSourceTypes
		{
			SQLString	= 1,
			StoredProc	= 2,
			XMLFile		= 3,
			Empty		= 0
		}
		#endregion
	}
}
