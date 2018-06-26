using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

using AutismCenterBase.Utilities;
using AutismCenterBase.Security;

namespace AutismCenterBase.Reports
{
	public class Report : IEnumerable
	{
		private Guid gReportID;
		private string sReportName;
		private ReportTypes nReportType;
		private string sReportCategory;
		private string sReportSource;
		private ArrayList aParameters = new ArrayList();
		private ArrayList aLinkedReferences = new ArrayList();
		private string sReportDesc;

		public Report()
		{
		}

		public Report(Guid gID, SqlConnection oConn)
		{
			#region Construct a Report from the Report ID and a SQL Connection
			SqlDataReader oReader;
			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = oConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spRPTGetAllReportInfoByReportID";
			oCmd.Parameters.AddWithValue("@ReportID", gID);

			if (oConn.State != ConnectionState.Open)
				oConn.Open();

			DataSet oDataSet = new DataSet();
			SqlDataAdapter oAdapter = new SqlDataAdapter(oCmd);
			oAdapter.Fill(oDataSet, "tblReports");
			DataTable oTable = oDataSet.Tables["tblReports"];

			if (oTable.Rows.Count > 0)
			{
				this.gReportID = new Guid(oTable.Rows[0]["ReportID"].ToString());
				this.sReportName = oTable.Rows[0]["ReportName"].ToString();
				this.sReportSource = oTable.Rows[0]["CommandText"].ToString();
				this.sReportDesc = oTable.Rows[0]["ReportDesc"].ToString();

				switch (oTable.Rows[0]["ReportTypeID"].ToString())
				{
//					case "1":
//						this.nReportType = ReportTypes.CrystalReport;
//						break;
					case "2":
						this.nReportType = ReportTypes.StoredProcedure;
						break;
					case "3":
						this.nReportType = ReportTypes.EmbeddedSQL;
						break;
					case "4":
						this.nReportType = ReportTypes.CustomReport;
						break;
					case "5":
						this.nReportType = ReportTypes.SQLReport;
						break;
					default:
						this.nReportType = ReportTypes.EmbeddedSQL;
						break;
				}

				#region Set the command type for the report.
				//Set the command type.
				switch (oTable.Rows[0]["ReportType"].ToString())
				{
					case "StoredProc":
						this.nReportType = Report.ReportTypes.StoredProcedure;
						break;

					case "EmbeddedSQL":
						this.nReportType = Report.ReportTypes.EmbeddedSQL;
						break;

					case "CustomReport":
						this.nReportType = Report.ReportTypes.CustomReport;
						break;

					case "SQLReport":
						this.nReportType = Report.ReportTypes.SQLReport;
						break;

					default:
						break;
				}
				#endregion

				#region Set the Report Category.
                this.sReportCategory = oTable.Rows[0]["ReportCategory"].ToString();
				#endregion

				#region Lookup and Set any Parameters
				oCmd.CommandText = "spRPTGetReportParamsByReportID";
				oCmd.Parameters["@ReportID"].Value = gID;
				oReader = oCmd.ExecuteReader();

				LinkedReference oLinkRef;
				Parameter oParam;
				oLinkRef = new LinkedReference();

				while (oReader.Read())
				{
					oParam = new Parameter();

					oParam.Name = oReader["ParameterName"].ToString();
					oParam.FriendlyName = oReader["FriendlyName"].ToString();
					oParam.Length = Convert.ToInt16(oReader["Length"].ToString());
					oParam.DataType = oReader["ParameterDataType"].ToString();
					oParam.IsRequired = Convert.ToBoolean(oReader["IsRequired"]);

					if (oReader["DataSourceTypeID"].ToString() != "")
					{
						#region Set the Parameter's Data Source Information if it Exists
						oParam.DataSource = oReader["DataSourceLocation"].ToString();
						oParam.DataSourceIDField = oReader["DataSourceIDField"].ToString();
						oParam.DataSourceTextField = oReader["DataSourceTextField"].ToString();

						switch (oReader["DataSourceType"].ToString().ToLower())
						{
							case "sqlstring":
								oParam.DataSourceType = Parameter.DataSourceTypes.SQLString;
								break;

							case "storedproc":
								oParam.DataSourceType = Parameter.DataSourceTypes.StoredProc;
								break;

							case "xmlfile":
								oParam.DataSourceType = Parameter.DataSourceTypes.XMLFile;
								break;

							default:
								oParam.DataSourceType = Parameter.DataSourceTypes.Empty;
								break;
						}
						#endregion
					}

					this.AddParameter(oParam);
				}

				oReader.Close();
				#endregion

				int nLinkID = 0;

				#region Lookup and Set any Linked References and their Parameters
				oCmd.CommandText = "spRPTGetLinkedColumnsByReportID";
				oReader = oCmd.ExecuteReader();

				while (oReader.Read())
				{
					if (nLinkID != Convert.ToInt32(oReader["LinkedColumnID"].ToString()))
					{
						oLinkRef = new LinkedReference();

						oLinkRef.LinkText = oReader["LinkTextSource"].ToString();
						oLinkRef.URL = oReader["LinkLocation"].ToString();
                        oLinkRef.OpenInNewWindow = Convert.ToBoolean(oReader["NewWindow"].ToString());

						nLinkID = Convert.ToInt32(oReader["LinkedColumnID"].ToString());
					}

					if (oReader["LinkParameterID"].ToString() != "")
						oLinkRef.AddURLParam(oReader["LinkParameterName"].ToString());

					this.AddLinkedReference(oLinkRef);
				}

				oReader.Close();
				#endregion
			}
			#endregion
		}

		public Guid ID
		{
			get {return gReportID;}
			set {gReportID = value;}
		}

		public string Name
		{
			get {return sReportName;}
			set {sReportName = value;}
		}

		public ReportTypes Type
		{
			get {return nReportType;}
			set {nReportType = value;}
		}

		public string Category
		{
			get {return sReportCategory;}
			set {sReportCategory = value;}
		}

		public string Source
		{
			get {return sReportSource;}
			set {sReportSource = value;}
		}

		public string Description
		{
			get {return sReportDesc;}
			set {sReportDesc = value;}
		}

		#region ReportTypes Enumeration
		public enum ReportTypes
		{
//			CrystalReport	= 1,
			StoredProcedure	= 2,
			EmbeddedSQL		= 3,
			CustomReport	= 4,
			SQLReport		= 5
		}
		#endregion

		#region Parameters Collection
		public ArrayList Parameters
		{
			get {return aParameters;}
		}
		#endregion

		#region Parameter Methods
		public Parameter CreateParameter(string sName, string sFriendlyName, string sType, int nLength, string sValue, string sDataSource, Parameter.DataSourceTypes oDataSourceType)
		{
			Parameter oParam = new Parameter();

			oParam.DataType = sType;
			oParam.Name = sName;
			oParam.Length = nLength;
			oParam.Value = sValue;
			oParam.DataSource = sDataSource;
			oParam.DataSourceType = oDataSourceType;
			oParam.FriendlyName = sFriendlyName;

			return oParam;
		}

		public void AddParameter(Parameter oParam)
		{
			aParameters.Add(oParam);
		}

		public void DeleteParameter(string sName)
		{
			int i;
			Parameter oParam;
			
			for (i = 0; i < aParameters.Count; i++)
			{
				oParam = (Parameter) aParameters[i];

				if (oParam.Name == sName)
				{
					aParameters.RemoveAt(i);
					break;
				}
			}
		}

        public Parameter GetParameter(string sName)
        {
            int i;
            Parameter oParam;
            Parameter oReturn = null;

            for (i = 0; i < aParameters.Count; i++)
            {
                oParam = (Parameter)aParameters[i];
                if (oParam.Name == sName)
                {
                    oReturn = oParam;
                    break;
                }
            }

            return oReturn;
        }

        public Parameter GetParameter(int nIndex)
        {
            return (Parameter)aParameters[nIndex];
        }
        #endregion

		#region Parameter Enumeration
		public IEnumerator GetEnumerator()
		{
			return aParameters.GetEnumerator();
		}

		private class IParameters : IEnumerator
		{
			private int i = -1;
			private Report[] IReport;

			public void Reset() {i = -1;}
			public object Current {get {return null;}}

			public IParameters(Report[] aReport)
			{
                this.IReport = aReport;
			}

			public bool MoveNext()
			{
                if (i < IReport.Length - 1)
					return true;
				else
					return false;
			}
		}
		#endregion

		#region LinkedReferences Collection
		public ArrayList LinkedReferences
		{
			get {return aLinkedReferences;}
		}
		#endregion

		#region LinkedReference Methods
		public LinkedReference CreateLinkedReference(string sLinkText, string sURL)
		{
			LinkedReference oLinkedReference = new LinkedReference();

			oLinkedReference.URL = sURL;
			oLinkedReference.LinkText = sLinkText;

			return oLinkedReference;
		}

		public void AddLinkedReference(LinkedReference oLinkedReference)
		{
			aLinkedReferences.Add(oLinkedReference);
		}

		public void DeleteLinkedReference(string sLinkText)
		{
			int i;
			LinkedReference oLinkedReference;

			for (i = 0; i < this.LinkedReferences.Count; i++)
			{
				oLinkedReference = (LinkedReference) aLinkedReferences[i];

				if (oLinkedReference.LinkText == sLinkText)
				{
					aLinkedReferences.RemoveAt(i);
					break;
				}
			}
		}

		public LinkedReference GetLinkedReference(string sLinkText)
		{
			LinkedReference oLinkedRef;
			LinkedReference oReturn = null;
			int i;

			for (i = 0;i < aLinkedReferences.Count;i++)
			{
				oLinkedRef = (LinkedReference) aLinkedReferences[i];
			
				if (oLinkedRef.LinkText == sLinkText)
				{
					oReturn = oLinkedRef;
					break;
				}
			}

			return oReturn;
		}

		#endregion

		#region LinkedReference Enumeration
		private class ILinkedReferences : IEnumerator
		{
			private int i = -1;
			private Report[] IReport;

			public void Reset() {i = -1;}
			public object Current {get {return null;}}

			public ILinkedReferences(Report[] aReport)
			{
				this.IReport = aReport;
			}

			public bool MoveNext()
			{
                if (i < IReport.Length - 1)
					return true;
				else
					return false;
			}
		}
		#endregion
	}
}