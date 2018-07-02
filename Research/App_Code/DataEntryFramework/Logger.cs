using System;
using System.Data;
using System.Data.SqlClient;

namespace DataEntryFramework
{

	
	public class Logger
	{

		public static void Log(DataEntryController dec, string logType, bool logFieldDetail)
		{

			SqlConnection conn = null;
			SqlCommand cmd = null;

			try 
			{
				// open connection using connection string from web.config and setup command
				conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"]);
				cmd = new SqlCommand();
				cmd.CommandText = "dbo.[spWriteLog2]";
				cmd.CommandType = System.Data.CommandType.StoredProcedure;
				cmd.Connection = conn;
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@logUser", System.Data.SqlDbType.VarChar, 50));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@logType", System.Data.SqlDbType.VarChar, 50));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@logDateTime", System.Data.SqlDbType.DateTime, 8));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@logText", System.Data.SqlDbType.VarChar, 400));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@logDBField", System.Data.SqlDbType.VarChar, 50));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@logTable", System.Data.SqlDbType.VarChar, 50));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@logMeasurePK", System.Data.SqlDbType.Int, 4));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@logMasterPK", System.Data.SqlDbType.Int, 4));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@logStudyMeasID", System.Data.SqlDbType.Int, 4));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pk", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));

				conn.Open();
				
				// get a date for the log entry
				string logDateTime = System.DateTime.Now.ToString("G");
				
				// use the first entry in the data entry controllers errors list for logText
				string logText = (dec.Notifications.Count>0)?(string)dec.Notifications[0]:string.Empty;
				if (logText.Length > 400) logText = logText.Substring(0, 400);

				string logTable = dec.DatabaseTable;
				int	logMeasurePK = dec.PrimaryKeyVal;
				int logStudyMeasID = dec.StudyMeasID;

				// write to log
				int logMasterPK = WriteLog(	cmd,
							string.Empty,
							logType,
							logDateTime,
							logText,
							string.Empty,
							logTable,
							logStudyMeasID,
							logMeasurePK,
							-1
						);


				// log field detail if requested
				if (logFieldDetail)
				{
					//loop over all fields and log those with errors
					foreach(DataFieldControl def in dec.AllDataFields)
					{
						if (def.HasError())
						{
							LogField(	cmd,
										def,
										logDateTime,
										logTable,
										logStudyMeasID,
										logMeasurePK,
										logMasterPK
								);
						}
					}
				}

			}
			catch
			{
				// catch all errors but do nothing
			}
			finally 
			{
				// close connection
				if (conn != null) conn.Close();
			}
		}


		public static void LogField(
			SqlCommand cmd,
			DataFieldControl dfc,
			string logDateTime,
			string logTable,
			int		logStudyMeasID,
			int logMeasurePK,
			int logMasterPK
			)
		{

			string logEntryType = (dfc.VerifyError)?LogEntryType.FIELD_ERROR_VERIFY:LogEntryType.FIELD_ERROR_VALIDATE;
			string logText = dfc.GetErrorText();
	
			WriteLog(
				cmd,
				string.Empty,
				logEntryType,
				logDateTime,
				logText,
				dfc.DatabaseField,
				logTable,
				logStudyMeasID,
				logMeasurePK,
				logMasterPK
				);



		}


		public static int WriteLog(
			SqlCommand cmd,
			string	logUser,
			string	logType,
			string	logDateTime,
			string	logText,
			string	logDBField,
			string	logTable,
			int		logStudyMeasID,
			int		logMeasurePK,
			int		logMasterPK
			)
		{
			try 
			{

				//set parameters
				if (logUser == string.Empty)
					cmd.Parameters["@logUser"].Value = DBNull.Value;
				else
					cmd.Parameters["@logUser"].Value = logUser;

				cmd.Parameters["@logType"].Value = logType;
			
				if (logDateTime == string.Empty)
					cmd.Parameters["@logDateTime"].Value = DBNull.Value;
				else
					cmd.Parameters["@logDateTime"].Value = logDateTime;

				cmd.Parameters["@logText"].Value = logText;
				cmd.Parameters["@logDBField"].Value = logDBField;
				cmd.Parameters["@logTable"].Value = logTable;
				cmd.Parameters["@logStudyMeasID"].Value = logStudyMeasID;
				cmd.Parameters["@logMeasurePK"].Value = logMeasurePK;
				cmd.Parameters["@logMasterPK"].Value = logMasterPK;

				// execute
				cmd.ExecuteNonQuery();
			}
			catch
			{
			}

			return (int)cmd.Parameters["@pk"].Value;
		}


	}


	public class LogEntryType
	{
		public static string FIELD_ERROR_VALIDATE = "FIELD_ERROR_VALIDATE";
		public static string FIELD_ERROR_VERIFY = "FIELD_ERROR_VERIFY";
		public static string RECORD_SUCCESS_LOOKUP = "RECORD_SUCCESS_LOOKUP";
		public static string RECORD_ERROR_LOOKUP = "RECORD_ERROR_LOOKUP";
		public static string RECORD_SUCCESS_INSERT = "RECORD_SUCCESS_INSERT";
		public static string RECORD_ERROR_INSERT = "RECORD_ERROR_INSERT";
		public static string RECORD_SUCCESS_SAVE = "RECORD_SUCCESS_SAVE";
		public static string RECORD_ERROR_SAVE = "RECORD_ERROR_SAVE";
		public static string RECORD_SUCCESS_VERIFY = "RECORD_SUCCESS_VERIFY";
		public static string RECORD_ERROR_VERIFY_VALIDATE = "RECORD_ERROR_VERIFY_VALIDATE";
		public static string RECORD_ERROR_VERIFY_VERIFY = "RECORD_ERROR_VERIFY_VERIFY";
		public static string RECORD_SUCCESS_SCORE = "RECORD_SUCCESS_SCORE";
		public static string RECORD_ERROR_SCORE = "RECORD_ERROR_SCORE";
		public static string RECORD_SUCCESS_STARTDOUBLEENTRY = "RECORD_SUCCESS_STARTDOUBLEENTRY";
		public static string RECORD_ERROR_STARTDOUBLEENTRY = "RECORD_ERROR_STARTDOUBLEENTRY";
		public static string RECORD_SUCCESS_NODATA = "RECORD_SUCCESS_NODATA";
		public static string RECORD_ERROR_NODATA = "RECORD_ERROR_NODATA";
		public static string RECORD_SUCCESS_DELETE = "RECORD_SUCCESS_DELETE";
		public static string RECORD_ERROR_DELETE = "RECORD_ERROR_DELETE";


	}
}
