using System;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Xml.XPath;
using System.Web;
using System.Web.UI;
using System.Collections;

using AutismCenterBase;
using AutismCenterBase.Security;

namespace AutismCenterBase.Reports
{
	public class ReportLibrary : IEnumerable
	{
		private ArrayList aReports = new ArrayList();
		private bool bIsValid = true;

		public ReportLibrary(SqlConnection oConn)
		{
			SqlCommand oCmd = new SqlCommand();
			DataSet oDataSet = new DataSet();
			SqlDataAdapter oAdapter;
			SqlParameter oSqlParam;
			SqlDataReader oReader;
			DataTable oTable;
			Report oReport;
			Parameter oParam;
			LinkedReference oLinkRef;
			Guid gReportID;
			int nLinkID;

			oCmd.Connection = oConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spRPTGetReports";

			oAdapter = new SqlDataAdapter(oCmd);
			oAdapter.Fill(oDataSet, "tblReports");
			oTable = oDataSet.Tables["tblReports"];

			oSqlParam = new SqlParameter();
			oSqlParam.ParameterName = "@ReportID";
			oSqlParam.Direction = ParameterDirection.Input;
			oSqlParam.SqlDbType = SqlDbType.UniqueIdentifier;
			oSqlParam.Size = 16;

			oCmd.Parameters.Add(oSqlParam);

			for (int i=0;i<oTable.Rows.Count;i++)
			{
				gReportID = new Guid(oTable.Rows[i]["ReportID"].ToString());
				nLinkID = 0;

				oReport = new Report();

				oReport.ID = new Guid(oTable.Rows[i]["ReportID"].ToString());
				oReport.Name = oTable.Rows[i]["ReportName"].ToString();
				oReport.Source = oTable.Rows[i]["CommandText"].ToString();
				oReport.Description = oTable.Rows[i]["ReportDesc"].ToString();

				#region Set the command type for the report.
				//Set the command type.
				switch (oTable.Rows[i]["ReportType"].ToString())
				{
//					case "CrystalReport":
//						oReport.Type = Report.ReportTypes.CrystalReport;
//						break;
//
					case "StoredProc":
						oReport.Type = Report.ReportTypes.StoredProcedure;
						break;

					case "EmbeddedSQL":
						oReport.Type = Report.ReportTypes.EmbeddedSQL;
						break;

					case "CustomReport":
						oReport.Type = Report.ReportTypes.CustomReport;
						break;

					case "SQLReport":
						oReport.Type = Report.ReportTypes.SQLReport;
						break;

					default:
						break;
				}
				#endregion

				#region Set the Report Category.
                oReport.Category = oTable.Rows[i]["ReportCategory"].ToString();
				#endregion

				#region Lookup and Set any Parameters
				oCmd.CommandText = "spRPTGetReportParamsByReportID";
				oCmd.Parameters["@ReportID"].Value = new Guid(oTable.Rows[i]["ReportID"].ToString());
				oReader = oCmd.ExecuteReader();

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

					oReport.AddParameter(oParam);
				}

				oReader.Close();
				#endregion

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

						nLinkID = Convert.ToInt32(oReader["LinkedColumnID"].ToString());
					}

					if (oReader["LinkParameterID"].ToString() != "")
						oLinkRef.AddURLParam(oReader["LinkParameterName"].ToString());

					oReport.AddLinkedReference(oLinkRef);
				}

				oReader.Close();
				#endregion

				this.AddReport(oReport);
			}
		}

		public bool IsValid
		{
			get {return bIsValid;}
		}

		#region Report Methods/Properties
		public ArrayList Reports
		{
			get {return aReports;}
		}

		//This method will return a Report class by passing in the ID of the report.
		public Report GetReport(Guid gReportID)
		{
			Report oReturn = null;

			foreach (Report oReport in this.Reports)
			{
				if (oReport.ID == gReportID)
				{
					oReturn = oReport;
					break;
				}
			}
			
			return oReturn;
		}

		//This method will add a Report item to the Reports collection.
		public void AddReport(Report oReport)
		{
			aReports.Add(oReport);
		}
		#endregion

		#region Report Enumeration
		public IEnumerator GetEnumerator()
		{
			return aReports.GetEnumerator();
		}

		public class IReports : IEnumerator
		{
			private int i = -1;
            private Report[] ILibrary;

            public IReports(Report[] aReports)
			{
                ILibrary = aReports;
			}

			public void Reset() {i = -1;}
			public object Current {get {return null;}}

			public bool MoveNext()
			{
                if (i < ILibrary.Length - 1)
					return true;
				else
					return false;
			}
		}
		#endregion
	}
}