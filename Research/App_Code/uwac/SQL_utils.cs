using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

namespace uwac
{
	/// <summary>
	/// Summary description for db_utils
	/// </summary>
	public class SQL_utils
	{
		private SqlConnection oSqlConn;
		private string _errormsg;
		private string _user;
		private string _identityuser;
		private string _sqlsessionuser;
		private string _instantiateAs;
		private Config_utils oConfig = new Config_utils();


		public string Errormsg { get { return _errormsg; } }

		public string User { get { return _user; } }
		public string IdentityUser { get { return _identityuser; } }
		public string SqlSessionUser { get { return _sqlsessionuser; } }
		public string InstantiateAs {  get { return _instantiateAs; } }


		#region ............STRUCTS............

		public static List<string> Numtypes =  new List<string> { "number", "int", "smallint", "bigint", "tinyint", "float", "decimal" };
		public static List<string> Texttypes = new List<string> { "text", "string", "char", "varchar", "nchar", "nvarchar" };
		public static List<string> Datetypes = new List<string> { "date", "datetime", "smalldatetime" };


		#endregion


		#region ............CONSTRUCTORS............


		public SQL_utils()
		{
			//Default to data database
			InstantiateConnection("data", GetUserNameFromIdentity());
		}


		public SQL_utils(string strDB)
		{
			InstantiateConnection(strDB, GetUserNameFromIdentity());
		}

		//Use this constructor to manually set the identity of the individual connecting to SQL
		public SQL_utils(string strDB, string user)
		{
			InstantiateConnection(strDB, user);
		}


		public void InstantiateConnection(string strDB, string user)
		{
			oSqlConn = new SqlConnection();
			oSqlConn.ConnectionString = GetConnString(strDB);

			try
			{
				this._errormsg = "trying...";
				oSqlConn.Open();
				if (oSqlConn.State == ConnectionState.Open)
				{
					_instantiateAs = user;
					bool userConfirmed = SetUserSessionContext(user);

					if (!userConfirmed)
					{
						this._errormsg += String.Format("User '{0}' not present in staff table", user);
						oSqlConn.Close();
					}
					else
					{
						this._errormsg += String.Format("User '{0}' confirmed.", user);
					}
				}
				else 
				{
					this._errormsg += String.Format("Sql connection is closed.");
				}
			}
			catch (Exception ex)
			{
				string msg = ex.Message;
				this._errormsg += String.Format("ERROR: ", ex.Message);
			}
		}

		public string GetUserNameFromIdentity()
		{
			string user = HttpContext.Current.User.Identity.Name;

			if (user == "") user = "jeffmun";

			user = user.ToLower().Replace(@"netid\", "");
			user = user.ToLower().Replace("@uw.edu", "");
			user = user.ToLower().Replace("@u.washington.edu", "");

			this._user = user;

			return user;
		}

		public bool SetUserSessionContext(string user)
		{
			string sqlcode = String.Format("EXEC sec.spSetUserContext {0}", user);
			NonQuery_from_SQLstring(sqlcode);


			string sqlcode2 = String.Format("select SESSION_CONTEXT(N'netid') ");
			_identityuser = this.StringScalar_from_SQLstring(sqlcode2);


			bool isConfirmedUser = ConfirmUser(user);
			return isConfirmedUser;
		}

		public string GetSessionContextValue(string session_varname)
		{
			string sqlcode = String.Format("select coalesce(SESSION_CONTEXT(N'{0}'),'NULL') ", session_varname);
			string session_var_value = this.StringScalar_from_SQLstring(sqlcode);
			return session_var_value;
		}


		public string GetSessionContextViewableInfo()
		{
			string sqlcode = String.Format("select viewableinfo from sec.vwInfoViewableBySESSION_CONTEXT");
			string session_viewable = this.StringScalar_from_SQLstring(sqlcode);
			return session_viewable;
		}
		

		public string GetSqlSystemuser()
		{
			string sqlcode = String.Format("select system_user");
			string system_user = this.StringScalar_from_SQLstring(sqlcode);
			return system_user;
		}


		public bool ConfirmUser(string user)
		{
			string sqlcode = String.Format("select count(*) n from uwautism_research_backend..tblstaff where active=1 and actdirID = '{0}'", user);
			int n = IntScalar_from_SQLstring(sqlcode);
			bool isUserInStaff = (n > 0) ? true : false;
			return isUserInStaff;
		}

		public string GetConnString(string strDB)
		{
			string connstring = "";


			var appsett = ConfigurationManager.AppSettings;
			var constr = ConfigurationManager.ConnectionStrings;

			switch (strDB)
			{
				//Connections strings managed in Web.Config and the various publishing profile transforms

				case "uwacdb":
					connstring = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
					break;

				case "tracking":
					connstring = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
					break;

				case "backend":
					connstring = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
					break;

				case "data":
					connstring = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
					break;

				case "uwautism_research_backend":
					connstring = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
					break;

				case "uwautism_research_data":
					connstring = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
					break;

				case "ndar":
					connstring = ConfigurationManager.ConnectionStrings["NDAR_CONN_STRING"].ToString();
					break;

				case "FinMart":
					connstring = ConfigurationManager.ConnectionStrings["FinMart_ConnectionString"].ToString();
					break;

				case "abackend":
					connstring = ConfigurationManager.ConnectionStrings["ATRACKING_CONN_STRING"].ToString();
					break;
				case "vbackend":
					connstring = ConfigurationManager.ConnectionStrings["VTRACKING_CONN_STRING"].ToString();
					break;

			}
			return connstring;
		}


		public SQL_utils(SqlConnection oConn)
		{
			if (oConn.ConnectionString == null || oConn.ConnectionString == "")
				throw (new ArgumentException("ConnectionString property cannot be blank."));
			else if (oConn.State == ConnectionState.Closed || oConn.State == ConnectionState.Broken)
				throw (new ArgumentException("The connection object must be opened."));

			oSqlConn = oConn;
		}



		#endregion ............CONSTRUCTORS............

		public void Close()
		{
			oSqlConn.Close();
		}

		#region ............ACCESSORS............

		public SqlConnection SqlConnection
		{
			get { return oSqlConn; }
		}



		#endregion ............ACCESSORS............

		public string GetUserStudyName()
		{
			//DataTable dt = oDB.GetProc("spSEC_Get_Default_StudyID_for_User");
			DataTable dt = DataTable_from_ProcName("uwautism_research_backend..spSEC_Get_Default_StudyID_for_User");

			string master_studyname = "";

			foreach (DataRow row in dt.Rows)
			{
				//master_studyID = Convert.ToInt16(row["defaultstudyID"]);
				master_studyname = Convert.ToString(row["studyname"]);
			}

			return master_studyname;
		}

		public int GetUserStudyID()
		{
			//DataTable dt = oDB.GetProc("spSEC_Get_Default_StudyID_for_User");
			DataTable dt = DataTable_from_ProcName("uwautism_research_backend..spSEC_Get_Default_StudyID_for_User");

			int master_studyID = 0;

			foreach (DataRow row in dt.Rows)
			{
				master_studyID = Convert.ToInt16(row["defaultstudyID"]);
				//master_studyname = Convert.ToString(row["studyname"]);
			}

			return master_studyID;
		}

		public string GetDataEntryURL(string shortName)
		{
			//DataTable dt = oDB.GetProc("spSEC_Get_Default_StudyID_for_User");
			string url = StringScalar_from_SQLstring("select dbo.fnNDAR_getDataEntryURL('" + shortName + "')");
			return url;
		}

		#region............Get Data from SQL............

		#region..1..................return DataTable.....

		#region .............................from.string....

		public DataTable DataTable_from_ViewName(string sView)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "select * from " + sView;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{
				SqlDataReader dr = oCmd.ExecuteReader();
				DataTable dt = new DataTable();
				dt.Load(dr);

				return dt;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!1 ", exc);
			}
		}

		public DataTable DataTable_from_SQLstring(string sSQL)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sSQL;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{
				SqlDataReader dr = oCmd.ExecuteReader();
				DataTable dt = new DataTable();
				dt.Load(dr);

				return dt;
			}
			catch (Exception ex)
			{
				string x = ex.Message;
				//QQQ temp
				DataTable dt2 = new DataTable();
				return dt2;
				//throw new System.Exception("An Error!2  sSQL={" + sSQL + "} ", ex);
			}
		}


		public DataSet DataSet_from_SQLstring(string sSQL)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sSQL;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{

				SqlDataAdapter adapter = new SqlDataAdapter(oCmd);
				DataSet ds = new DataSet();
				adapter.Fill(ds);
				adapter.Dispose();

				return ds;

			}
			catch (Exception ex)
			{
				string x = ex.Message;
				//QQQ temp
				DataSet dt2 = new DataSet();
				return dt2;
				//throw new System.Exception("An Error!2  sSQL={" + sSQL + "} ", ex);
			}
		}

		

		#endregion .............................from.string....

		#region ..............................from.PROCS....

		public DataTable DataTable_from_ProcName(string sProc)
		{
			List<SqlParameter> p = new List<SqlParameter>();

			DataTable dt = DataTable_from_ProcName(sProc, p);
			return dt;
		}

		public DataTable DataTable_from_ProcName(string sProc, SqlParameter myp)
		{
			List<SqlParameter> p = new List<SqlParameter>();
			p.Add(myp);
			DataTable dt = DataTable_from_ProcName(sProc, p);
			return dt;
		}

		public DataTable DataTable_from_ProcName(string sProc, List<SqlParameter> p)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sProc;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			try
			{
				foreach (SqlParameter myp in p)
				{
					oCmd.Parameters.Add(myp);
				}
				SqlDataReader dr = oCmd.ExecuteReader();
				DataTable dt = new DataTable();
				dt.Load(dr);

				return dt;
			}
			catch
			{
				return null;
			}
		}

		public DataSet DataSet_from_ProcName(string sProc, SqlParameter p)
		{
			List<SqlParameter> ps = new List<SqlParameter>();
			ps.Add(p);
			DataSet ds = DataSet_from_ProcName(sProc, ps);
			return (ds);
		}

		public DataSet DataSet_from_ProcName(string sProc, List<SqlParameter> p)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sProc;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			try
			{
				foreach (SqlParameter myp in p)
				{
					oCmd.Parameters.Add(myp);
				}

				SqlDataAdapter adapter = new SqlDataAdapter(oCmd);
				DataSet ds = new DataSet();
				adapter.Fill(ds);
				adapter.Dispose();

				return ds;
			}
			catch
			{
				return null;
			}
		}

		#endregion ..............................from.PROCS....

		#endregion

		#region....................return string.OUTPUT....

		#region..............................from string....

		public string String_from_ViewName(string sView)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "select * from " + sView;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{
				oCmd.ExecuteNonQuery();
				string output = Convert.ToString(oCmd.Parameters["@output"].Value);
				return output;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!3 ", exc);
			}
		}

		public string String_from_SQLstring(string sSQL)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sSQL;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{
				oCmd.ExecuteNonQuery();
				string output = Convert.ToString(oCmd.Parameters["@output"].Value);
				return output;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!4 ", exc);
			}
		}

		#endregion

		#region ..............................from.PROCS....

		public string String_from_ProcName(string sProc)
		{
			List<SqlParameter> p = new List<SqlParameter>();
			string output = String_from_ProcName(sProc, p);
			return output;
		}

		public string String_from_ProcName(string sProc, SqlParameter myp)
		{
			List<SqlParameter> p = new List<SqlParameter>();
			p.Add(myp);
			string output = String_from_ProcName(sProc, p);
			return output;
		}

		public string String_from_ProcName(string sProc, List<SqlParameter> p)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sProc;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			try
			{
				foreach (SqlParameter myp in p)
				{
					oCmd.Parameters.Add(myp);
				}
				oCmd.ExecuteNonQuery();
				string output = Convert.ToString(oCmd.Parameters["@output"].Value);
				return output;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!5 ", exc);
			}
		}

		#endregion

		#endregion

		#region....................return string.SCALAR....

		#region..............................from string....

		public string StringScalar_from_ViewName(string sView)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "select * from " + sView;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{
				oCmd.ExecuteNonQuery();
				string s = (string)oCmd.ExecuteScalar();
				return s;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!6 ", exc);
			}
		}

		public string StringScalar_from_SQLstring(string sSQL)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sSQL;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{
				//oCmd.ExecuteNonQuery();
				string s = (string)oCmd.ExecuteScalar();
				return s;
			}
			catch (Exception exc)
			{
				string err = "An Error!7 SQL:" + sSQL + " Msg: " + exc.Message;
				return err;
				//throw new System.Exception("An Error!7 ", exc);
			}
		}

		#endregion

		#region ..............................from.PROCS....

		public string StringScalar_from_ProcName(string sProc)
		{
			List<SqlParameter> p = new List<SqlParameter>();
			string output = StringScalar_from_ProcName(sProc, p);
			return output;
		}

		public string StringScalar_from_ProcName(string sProc, SqlParameter myp)
		{
			List<SqlParameter> p = new List<SqlParameter>();
			p.Add(myp);
			string output = StringScalar_from_ProcName(sProc, p);
			return output;
		}

		public string StringScalar_from_ProcName(string sProc, List<SqlParameter> p)
		{
			string param_info = "";
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sProc;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			try
			{
				foreach (SqlParameter myp in p)
				{
					oCmd.Parameters.Add(myp);
					param_info += "[Name:" + myp.ParameterName + " Val:" + myp.Value + " Type:" + myp.DbType + " Sz:" + myp.Size.ToString() + "]";
				}

				string s = (string)oCmd.ExecuteScalar();
				return s;
			}
			catch (Exception exc)
			{
				string err = "An Error!8 Proc:" + sProc + " Params: " + param_info + " Msg: " + exc.Message;
				return err;
				//throw new System.Exception("An Error! ", exc);
			}
		}

		#endregion

		#endregion

		#region....................return int.OUTPUT....

		// USE AN EXAMPLE FOR RETURNING ERROR WHEN RETURNING AN INT
		//int GetValueFromArray(int[] array, int index)
		//{
		//    try
		//    {
		//        return array[index];
		//    }
		//    catch (System.IndexOutOfRangeException ex)
		//    {
		//        System.ArgumentException argEx = new System.ArgumentException("Index is out of range", "index", ex);
		//        throw argEx;
		//    }
		//}

		#region..............................from string....

		public int Int_from_ViewName(string sView)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "select * from " + sView;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{
				oCmd.ExecuteNonQuery();
				int output = Convert.ToInt32(oCmd.Parameters["@output"].Value);
				return output;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!9 ", exc);
			}
		}

		public int Int_from_SQLstring(string sSQL)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sSQL;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{
				oCmd.ExecuteNonQuery();
				int output = Convert.ToInt32(oCmd.Parameters["@output"].Value);
				return output;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!10 ", exc);
			}
		}

		#endregion

		#region ..............................from.PROCS....

		public int Int_from_ProcName(string sProc)
		{
			List<SqlParameter> p = new List<SqlParameter>();

			int output = Int_from_ProcName(sProc, p);
			return output;
		}

		public int Int_from_ProcName(string sProc, SqlParameter myp)
		{
			List<SqlParameter> p = new List<SqlParameter>();
			p.Add(myp);
			int output = Int_from_ProcName(sProc, p);
			return output;
		}

		public int Int_from_ProcName(string sProc, List<SqlParameter> p)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sProc;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			try
			{
				foreach (SqlParameter myp in p)
				{
					oCmd.Parameters.Add(myp);
				}
				oCmd.ExecuteNonQuery();
				int output = Convert.ToInt32(oCmd.Parameters["@output"].Value);
				return output;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!11 ", exc);
			}
		}

		#endregion

		#endregion

		#region....................return int.SCALAR....

		#region..............................from string....

		public int IntScalar_from_ViewName(string sView)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "select * from " + sView;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{
				int x = (int)oCmd.ExecuteScalar();
				return x;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!12 ", exc);
			}
		}

		public int IntScalar_from_SQLstring(string sSQL)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sSQL;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{
				int x = (int)oCmd.ExecuteScalar();
				return x;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!13 ", exc);
			}
		}

		#endregion

		#region ..............................from.PROCS....

		public int IntScalar_from_ProcName(string sProc)
		{
			List<SqlParameter> p = new List<SqlParameter>();

			int output = IntScalar_from_ProcName(sProc, p);
			return output;
		}

		public int IntScalar_from_ProcName(string sProc, SqlParameter myp)
		{
			List<SqlParameter> p = new List<SqlParameter>();
			p.Add(myp);
			int output = IntScalar_from_ProcName(sProc, p);
			return output;
		}

		public int IntScalar_from_ProcName(string sProc, List<SqlParameter> p)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sProc;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			try
			{
				foreach (SqlParameter myp in p)
				{
					oCmd.Parameters.Add(myp);
				}

				int x = (int)oCmd.ExecuteScalar();
				return x;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!14 ", exc);
			}
		}

		public double DoubleScalar_from_ProcName(string sProc)
		{
			List<SqlParameter> p = new List<SqlParameter>();

			double output = DoubleScalar_from_ProcName(sProc, p);
			return output;
		}

		public double DoubleScalar_from_ProcName(string sProc, SqlParameter myp)
		{
			List<SqlParameter> p = new List<SqlParameter>();
			p.Add(myp);
			double output = DoubleScalar_from_ProcName(sProc, p);
			return output;
		}

		public double DoubleScalar_from_ProcName(string sProc, List<SqlParameter> p)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sProc;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			try
			{
				foreach (SqlParameter myp in p)
				{
					oCmd.Parameters.Add(myp);
				}

				double val = (double)oCmd.ExecuteScalar();

				return val;
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!14 ", exc);
			}
		}

		#endregion

		#endregion

		#region ....................return READER.......

		#region Procs - return SqlDataReader

		//        public SqlDataReader GetProc_reader(string proc)
		public SqlDataReader Reader_from_PROCname(string proc)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = oSqlConn;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = proc;
			oCmd.CommandTimeout = 90;

			try
			{
				oReader = oCmd.ExecuteReader();

				return oReader;
			}
			catch
			{
				return null;
			}
		}

		//        public SqlDataReader GetProc_reader(string proc, SqlParameter myp)
		public SqlDataReader Reader_from_PROCname(string proc, SqlParameter myp)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = oSqlConn;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = proc;
			oCmd.CommandTimeout = 90;

			oCmd.Parameters.Add(myp);

			try
			{
				oReader = oCmd.ExecuteReader();

				return oReader;
			}
			catch
			{
				return null;
			}
		}

		public SqlDataReader Reader_from_SQLstring(string sSQL, SqlParameter myp)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = oSqlConn;
			oCmd.CommandType = CommandType.Text;
			oCmd.CommandText = sSQL;
			oCmd.CommandTimeout = 90;

			oCmd.Parameters.Add(myp);

			try
			{
				oReader = oCmd.ExecuteReader();

				return oReader;
			}
			catch
			{
				return null;
			}
		}

		#endregion

		#endregion

		#region ....................NonQuery

		public string NonQuery_from_SQLstring_withRollback(string sSQL)
		{
			//using (SqlConnection connection = new SqlConnection(ConnectionString))
			//{
			//	using (SqlCommand cmd = new SqlCommand(queryString, connection))
			//	{

					SqlCommand oCmd = new SqlCommand();

					oCmd.Connection = oSqlConn;
					oCmd.CommandText = sSQL;
					oCmd.CommandTimeout = 90;
					oCmd.CommandType = CommandType.Text;

					SqlTransaction trans;
					trans = oSqlConn.BeginTransaction("Trans");
					oCmd.Transaction = trans;

					try
					{
						oCmd.ExecuteNonQuery();
						trans.Commit();
						return "success";
					}
					catch (Exception ex)
					{
						if (trans != null) trans.Rollback();
						return ex.Message;
					}
			//	}
			//}

		}




		public void NonQuery_from_SQLstring(string sSQL)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sSQL;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			try
			{
				oCmd.ExecuteNonQuery();
			}
			catch (Exception exc)
			{
				throw new System.Exception("An Error!NonQuery1 sql={" + sSQL + "}", exc);
			}
		}

		public void NonQuery_from_ProcName(string sProc, SqlParameter myp)
		{
			List<SqlParameter> p = new List<SqlParameter>();
			p.Add(myp);
			NonQuery_from_ProcName(sProc, p);
		}

		public void NonQuery_from_ProcName(string sSQL, List<SqlParameter> p)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sSQL;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			foreach (SqlParameter myp in p)
			{
				oCmd.Parameters.Add(myp);
			}

			try
			{
				oCmd.ExecuteNonQuery();
			}
			catch (Exception exc)
			{
				string param_data = " PARAMS:";
				foreach (SqlParameter pd in p)
				{
					param_data += "([" + pd.SqlDbType.ToString() + "] " + pd.ParameterName + "=" + pd.Value.ToString() + ")";
				}
				throw new System.Exception("An Error!NonQuery2 sql={" + sSQL + param_data + "}", exc);
			}
		}


		public int NonQuery_from_ProcName(string sSQL, List<SqlParameter> p, string output_param)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sSQL;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;


			foreach (SqlParameter myp in p)
			{
				oCmd.Parameters.Add(myp);
			}

			try
			{
				oCmd.ExecuteNonQuery();

				int output = Convert.ToInt32(oCmd.Parameters[output_param].Value);

				return output;
			}
			catch (Exception exc)
			{
				string param_data = " PARAMS:";
				foreach (SqlParameter pd in p)
				{
					param_data += "([" + pd.SqlDbType.ToString() + "] " + pd.ParameterName + "=" + pd.Value.ToString() + ")";
				}
				throw new System.Exception("An Error!NonQuery2 sql={" + sSQL + param_data + "}", exc);
			}
		}


		#endregion

		#endregion

		#region ............Build Parameters............

		public class MyParam
		{
			//private string name;
			//private string value;
			//private string type;

			public string Name { get; set; }
			public string Value { get; set; }
			public string Type { get; set; }
		}

		public SqlParameter CreateParam(string name, string value, string type, string direction)
		{
			SqlParameter p = new SqlParameter();

			p.ParameterName = name;
			switch (type)
			{
				case "float":
					p.SqlDbType = SqlDbType.Float;

					break;

				case "int":
					p.SqlDbType = SqlDbType.Int;
					break;

				case "text":
					p.SqlDbType = SqlDbType.VarChar;
					break;

				case "string":
					p.SqlDbType = SqlDbType.VarChar;
					break;

				case "date":
					p.SqlDbType = SqlDbType.Date;
					break;
			}

			switch (direction)
			{
				case "input":
					p.Direction = ParameterDirection.Input;
					break;

				case "output":
					p.Direction = ParameterDirection.Output;
					break;
			}

			if (value == "")
			{
				p.Value = DBNull.Value;
			}
			else
			{
				p.Value = value;
			}

			return p;
		}

		public SqlParameter CreateParam(string name, string value, string type)
		{
			SqlParameter p = new SqlParameter();

			p = CreateParam(name, value, type, "input");

			return p;
		}

		public SqlParameter CreateParam(string name, DataTable dt)
		{
			SqlParameter p = new SqlParameter();
			p.ParameterName = name;
			p.SqlDbType = SqlDbType.Structured;
			p.Value = dt;

			return p;
		}

		public SqlParameter CreateParam(MyParam myp)
		{
			SqlParameter p = new SqlParameter();

			p.ParameterName = myp.Name;
			switch (myp.Type)
			{
				case "float":
					p.SqlDbType = SqlDbType.Float;
					break;

				case "int":
					p.SqlDbType = SqlDbType.Int;
					break;

				case "string":
					p.SqlDbType = SqlDbType.VarChar;
					break;

				case "text":
					p.SqlDbType = SqlDbType.VarChar;
					break;

				case "date":
					p.SqlDbType = SqlDbType.Date;
					break;
			}

			p.Value = myp.Value;

			return p;
		}

		#endregion

		#region ...............Get Metadata from SQL ..............

		public string GetLabelFieldForTable(string db, string tbl, string schema)
		{
			string sql = " SELECT  labelfld FROM " + schema + ".enumEntity where entitytbl = '" + tbl + "'";
			string labelfld = StringScalar_from_SQLstring(sql);
			return labelfld;
		}

		public string GetPKForTable(string db, string tbl)
		{
			string pk = GetPKForTable(db, tbl, "dbo");
			return pk;
		}

		public string GetPKForTable(string db, string tbl, string schema)
		{
			////For getting IDENTITY fields
			//string sql = " SELECT a.name as pk, b.name as tbl  FROM " + db + ".sys.identity_columns a " +
			//" join " + db + ".sys.objects b ON a.object_id = b.object_id and b.name = '" + tbl + "'";

			string sql = " SELECT column_name as pk FROM " + db + ".INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC " +
				" INNER JOIN " + db + ".INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KU ON TC.CONSTRAINT_TYPE = 'PRIMARY KEY' " +
				" AND TC.CONSTRAINT_NAME = KU.CONSTRAINT_NAME and ku.table_name='" + tbl + "'";

			string pk = StringScalar_from_SQLstring(sql);

			return pk;
		}

		public string GetAllColumnsInTable(string db, string tbl)
		{
			string cols = GetAllColumnsInTable(db, tbl, "dbo", false);
			return cols;
		}

		public string GetAllColumnsInTable(string db, string tbl, string schema)
		{
			string cols = GetAllColumnsInTable(db, tbl, schema, false);
			return cols;
		}

		public string GetAllColumnsInTable(string db, string tbl, string schema, bool OnlyNotNullable)
		{
			string cols = "";
			string sql = "select column_name from " + db + ".information_schema.columns where table_name = '" + tbl + "' and table_schema='" + schema + "'";

			if (OnlyNotNullable)
			{
				sql += " and is_nullable = 'NO'";
			}

			DataTable dt = DataTable_from_SQLstring(sql);

			for (int i = 0; i < dt.Rows.Count; i++)
			{
				string prefix = (i == 0) ? "" : ",";
				cols += prefix + dt.Rows[i]["column_name"];
			}

			return cols;
		}

		public string GetUpdateSQLForAllColumnsInTable(string db, string tbl, string schema, string pk)
		{
			string updateCols = "";
			string sql = "select column_name from " + db + ".information_schema.columns where table_name = '" + tbl + "' and table_schema='" + schema + "'" +
				" AND column_name not in ('" + pk + "')";
			DataTable dt = DataTable_from_SQLstring(sql);

			for (int i = 0; i < dt.Rows.Count; i++)
			{
				string prefix = (i == 0) ? "" : ",";
				if (dt.Rows[i]["column_name"].ToString() != pk) updateCols += prefix + " " + dt.Rows[i]["column_name"] + "=b." + dt.Rows[i]["column_name"];
			}

			return updateCols;
		}

		public string GetPKsOfUnequalRecords(string db, string tbl, string schema)
		{
			string pk = GetPKForTable(db, tbl);
			string pks = "";

			string sql = "select pk1 from (select " + pk + " as pk1 , checksum(*) checksum1 from " + db + ".." + tbl + ") a " +
						 " full outer join " +
						 " (select " + pk + " as pk2, checksum(*) checksum2 from uwacdb." + schema + "." + tbl + ") b ON a.pk1 = b.pk2 where checksum1 <> checksum2";

			DataTable dt = DataTable_from_SQLstring(sql);

			for (int i = 0; i < dt.Rows.Count; i++)
			{
				string prefix = (i == 0) ? "" : ",";
				pks += prefix + dt.Rows[i]["pk1"].ToString();
			}

			return pks;
		}

		#endregion


		#region ...................BULK INSERT...................

		public string BulkInsert(DataTable dt_source, string dest_tbl)
		{
			int n_start = IntScalar_from_SQLstring("select count(*) from " + dest_tbl);
			string msg="";

			using (oSqlConn)
			{

				using (SqlBulkCopy bulkCopy = new SqlBulkCopy(oSqlConn, SqlBulkCopyOptions.FireTriggers, null))
				{
					bulkCopy.ColumnMappings.Clear();

					try
					{ 
						bulkCopy.BulkCopyTimeout = 150;

						// column mapping defined
						dt_source.Columns.Cast<DataColumn>().ToList().ForEach(f =>
						{
							SqlBulkCopyColumnMapping bccm = new SqlBulkCopyColumnMapping();
							bccm.DestinationColumn = f.ColumnName;
							bccm.SourceColumn = f.ColumnName;
							bulkCopy.ColumnMappings.Add(bccm);
						});
						// column mapping defined

						bulkCopy.DestinationTableName = dest_tbl;


						// Write from the source to the destination.
						bulkCopy.WriteToServer(dt_source);
					}
					catch (Exception ex)
					{
						Debug.WriteLine(ex.Message);
						Debug.WriteLine(ex.StackTrace.ToString());

					}
				}

				int n_end = IntScalar_from_SQLstring("select count(*) from " + dest_tbl);
				

				if (n_start == n_end)
				{ msg = String.Format("No records inserted into [{0}]", dest_tbl); }
				else
				{
					msg = String.Format("{0} records inserted into [{0}].", n_end - n_start, dest_tbl);
				}
			}

			return msg;
		}


		#endregion



		#region ............Build SQL statement to create a table from a DataTable object ............
		/// <summary>
		/// Inspects a DataTable and return a SQL string that can be used to CREATE a TABLE in SQL Server.
		/// </summary>
		/// <param name="table">System.Data.DataTable object to be inspected for building the SQL CREATE TABLE statement.</param>
		/// <returns>String of SQL</returns>
		///

		public string GetCreateTableSql(DataTable table, string schemaname)
		{
			string sql = GetCreateTableSql(table, schemaname, table.TableName, false);
			return sql;
		}

		public string GetCreateTableSql(DataTable table, string schemaname, string tblname, bool addDefaultValues)
		{
			bool flag_toolong = false;
			string col_toolong = "";
			StringBuilder sql = new StringBuilder();
			StringBuilder alterSql = new StringBuilder();

			////If I need to delete the table
			//sql.AppendFormat("IF OBJECT_ID(N'[{0}].[{1}]', N'U') IS NOT NULL  DROP TABLE N'[{0}].[{1}]'; GO;", schemaname, tblname);

			sql.AppendFormat("CREATE TABLE [{0}].[{1}] (", schemaname, tblname);

			for (int i = 0; i < table.Columns.Count; i++)
			{
				bool isNumeric = false;
				bool usesColumnDefault = true;

				sql.AppendFormat("\n\t[{0}]", table.Columns[i].ColumnName);

				//int maxlength = table.AsEnumerable()
				//        .SelectMany(r => r.Field<string>(table.Columns[i]))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
				//        .Max(i => i.Length);

				//DataColumn col = table.Columns[i];

				//int maxLength = table.AsEnumerable().Select(r => r.Field<string>(table.Columns[i])).Max(i => i.Length);

				//var maxl = table.AsEnumerable()
				//            .Select(r => r.Field<string>(table.Columns[i]))
				//            .Max(i => i.Length);

				int maxLength;

				switch (table.Columns[i].DataType.ToString().ToUpper())
				{
					case "SYSTEM.INT16":
						sql.Append(" smallint");
						isNumeric = true;
						break;

					case "SYSTEM.INT32":
						sql.Append(" int");
						isNumeric = true;
						break;

					case "SYSTEM.INT64":
						sql.Append(" bigint");
						isNumeric = true;
						break;

					case "SYSTEM.DATETIME":
						sql.Append(" datetime");
						usesColumnDefault = false;
						break;

					case "SYSTEM.STRING":
						maxLength = table.AsEnumerable()
							.Select(r => r.Field<string>(table.Columns[i]))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
							.Max(r => r.Length);
						maxLength = (maxLength == 0) ? 1 : maxLength;
						if (maxLength > 200)
						{
							maxLength = 200;
							flag_toolong = true;
							col_toolong = table.Columns[i].ColumnName;
						}
						sql.AppendFormat(" varchar({0})", maxLength);
						break;

					case "SYSTEM.SINGLE":
						sql.Append(" single");
						isNumeric = true;
						break;

					case "SYSTEM.DOUBLE":
						sql.Append(" double");
						isNumeric = true;
						break;

					case "SYSTEM.DECIMAL":
						sql.AppendFormat(" decimal(18, 6)");
						isNumeric = true;
						break;

					default:
						maxLength = table.AsEnumerable()
							.Select(r => r.Field<string>(table.Columns[i]))  // Compiler error: "Cannot convert lambda expression to type 'string' because it is not a delegate type"
							.Max(r => r.Length);
						maxLength = (maxLength == 0) ? 1 : maxLength;
						if (maxLength > 200)
						{
							maxLength = 200;
							flag_toolong = true;
							col_toolong = table.Columns[i].ColumnName;
						}

						sql.AppendFormat(" varchar({0})", maxLength);
						break;
				}

				if (table.Columns[i].AutoIncrement)
				{
					sql.AppendFormat(" IDENTITY({1},{1})",
						table.Columns[i].AutoIncrementSeed,
						table.Columns[i].AutoIncrementStep);
				}
				else
				{
					// DataColumns will add a blank DefaultValue for any AutoIncrement column.
					// We only want to create an ALTER statement for those columns that are not set to AutoIncrement.
					if (table.Columns[i].DefaultValue != null)
					{
						if (usesColumnDefault)
						{
							if (isNumeric)
							{
								alterSql.AppendFormat("\nALTER TABLE [{0}].[{1}] ADD CONSTRAINT [DF_{1}_{2}]  DEFAULT ({3}) FOR [{2}];",
									schemaname,
									tblname,
									table.Columns[i].ColumnName,
									table.Columns[i].DefaultValue);
							}
							else
							{
								alterSql.AppendFormat("\nALTER TABLE [{0}].[{1}] ADD CONSTRAINT [DF_{1}_{2}]  DEFAULT ('{3}') FOR [{2}];",
									schemaname,
									tblname,
									table.Columns[i].ColumnName,
									table.Columns[i].DefaultValue);
							}
						}
						else
						{
							////NOT IMPLEMENTED - JM
							//// Default values on Date columns, e.g., "DateTime.Now" will not translate to SQL.
							//// This inspects the caption for a simple XML string to see if there is a SQL compliant default value, e.g., "GETDATE()".
							//try
							//{
							//    System.Xml.XmlDocument xml = new System.Xml.XmlDocument();

							//    xml.LoadXml(table.Columns[i].Caption);

							//    alterSql.AppendFormat("\nALTER TABLE {0} ADD CONSTRAINT [DF_{0}_{1}]  DEFAULT ({2}) FOR [{1}];",
							//        tblname,
							//        table.Columns[i].ColumnName,
							//        xml.GetElementsByTagName("defaultValue")[0].InnerText);
							//}
							//catch
							//{
							//    // Handle
							//}
						}
					}
				}

				if (!table.Columns[i].AllowDBNull)
				{
					sql.Append(" NOT NULL");
				}

				sql.Append(",");
			}

			if (table.PrimaryKey.Length > 0)
			{
				StringBuilder primaryKeySql = new StringBuilder();

				primaryKeySql.AppendFormat("\n\tCONSTRAINT PK_{0} PRIMARY KEY (", tblname);

				for (int i = 0; i < table.PrimaryKey.Length; i++)
				{
					primaryKeySql.AppendFormat("{0},", table.PrimaryKey[i].ColumnName);
				}

				primaryKeySql.Remove(primaryKeySql.Length - 1, 1);
				primaryKeySql.Append(")");

				sql.Append(primaryKeySql);
			}
			else
			{
				sql.Remove(sql.Length - 1, 1);
			}

			if (addDefaultValues)
			{
				sql.AppendFormat("\n);\n{0}", alterSql.ToString());
			}
			else
			{
				sql.AppendFormat("\n);");
			}

			if (flag_toolong)
			{
				string err = "/*TOOLONG*/ " + sql.ToString();
				return err;
			}
			else
			{
				return sql.ToString();
			}
		}

		#endregion

		public struct dbfield
		{
			public string fieldname;
			public string value;
			public string sqldbtype;
		}

		public struct sql_result
		{
			public bool success;
			public string msg;
			public int pk;
		}

		//todo: implement the sql_result
		//in the following methods

		public string sql_insert_from_list(string schema, string tbl, List<dbfield> flds)
		{
			// if no pk is provided
			string result = sql_insert_from_list(schema, tbl, flds, "", 0);
			return result;
		}

		public string sql_insert_from_list(string schema, string tbl, List<dbfield> flds, string pk, int pkval)
		{
			//explicit pk value is provided
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oSqlConn;
			cmd.CommandType = CommandType.Text;
			string sql = "insert into " + schema + "." + tbl + "(";
			string vars = "";
			string vals = "";

			foreach (dbfield fld in flds)
			{
				if (fld.value != "")
				{
					vars += fld.fieldname + ",";

					List<string> numtypes = new List<string> { "number", "int", "smallint", "bigint", "tinyint", "float", "decimal" };
					List<string> texttypes = new List<string> { "text", "string", "char", "varchar", "nchar", "nvarchar" };
					List<string> datetypes = new List<string> { "date", "datetime", "smalldatetime" };

					if (numtypes.Any(s => fld.sqldbtype.Contains(s)))
					{
						vals += CleanString(fld.value, false) + ",";
					}
					else if (texttypes.Any(s => fld.sqldbtype.Contains(s)))
					{
						vals += "" + CleanString(fld.value, true) + ",";
					}
					else if (datetypes.Any(s => fld.sqldbtype.Contains(s)))
					{
						vals += "" + CleanString(fld.value, true) + ",";
					}
					else
					{
						vals += "" + CleanString(fld.value, true) + ",";
					}
				}
			}

			vars = vars.Substring(0, vars.Length - 1);
			vals = vals.Substring(0, vals.Length - 1);

			if (pk == "" | pkval == 0)  //do not explicitly add the pk value
			{
				sql += vars + ") values (" + vals + ") ";
			}
			else if (pk.Length > 1 & pkval > 0)  //explicitly add the pk value
			{
				sql += vars + ", " + pk + ") values (" + vals + ", " + pkval.ToString() + ")";
			}

			cmd.CommandText = sql;

			try
			{
				//cmd.ExecuteNonQuery();
				//return "INSERTED!";

				string newpk = StringScalar_from_SQLstring(sql + "  SELECT cast(SCOPE_IDENTITY() as varchar)").ToString();  //escape single quotes

				return "INSERTED! New pk = " + newpk;
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
			//return cmd;
			//return sql;
		}

		public string sql_delete(string schema, string tbl, string pk, int pkval, bool validate)
		{
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oSqlConn;
			cmd.CommandType = CommandType.Text;
			bool proceedWithDelete = false;
			string msg = "";

			if (validate)
			{
				List<SqlParameter> ps = new List<SqlParameter>();
				ps.Add(CreateParam("tbl", tbl, "text"));
				ps.Add(CreateParam("pk", pkval.ToString(), "int"));

				DataTable dt = DataTable_from_ProcName("spValidate_DELETE", ps);

				if (dt != null)
				{
					if (dt.Rows.Count > 0)
					{
						DataRow row = dt.Rows[0];
						proceedWithDelete = (bool)row["result"];
						msg = row["msg"].ToString();
					}
				}
			}
			else
			{
				proceedWithDelete = true;  //Skip validation so proceed
			}

			if (proceedWithDelete)
			{
				//Create the "DEL_" table if it doesn't exist

				try
				{
					string sqldel = "exec spCreate_DEL_table_if_not_exist '" + schema + "','" + tbl + "'";
					cmd.CommandText = sqldel;
					cmd.ExecuteNonQuery();
				}
				catch (Exception ex)
				{
					return ex.Message;
				}

				//Insert the record into the DEL_ table
				string sql_backup = "insert into " + schema + ".DEL_" + tbl + " select *, getdate() as deleted, system_user as deletedBy from " +
						schema + "." + tbl + " where " + pk + '=' + pkval.ToString();
				cmd.CommandText = sql_backup;

				try
				{
					cmd.ExecuteNonQuery();
					// "BackedUp!";// +sql;
				}
				catch (Exception ex)
				{
					return ex.Message;
				}

				//Delete the record
				string sql = "delete from " + schema + "." + tbl + " where " + pk + " = " + pkval.ToString();
				cmd.CommandText = sql;

				try
				{
					cmd.ExecuteNonQuery();
					return pk + " = " + pkval.ToString() + " has been deleted!";// +sql;
				}
				catch (Exception ex)
				{
					return ex.Message;
				}
			}
			else
			{
				return msg;
			}
		}

		public string sql_delete(string schema, string tbl, string pk, int pkval)
		{
			return sql_delete(schema, tbl, pk, pkval, false);
		}

		public string sql_update_from_list(string schema, string tbl, List<dbfield> flds, string pk, int pkval)
		{
			int[] pkvals = new int[] { pkval };
			string s = sql_update_from_list(schema, tbl, flds, pk, pkvals);

			return s;
		}

		public string sql_update_from_list(string schema, string tbl, List<dbfield> flds, string pk, int[] pkvals)
		{
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oSqlConn;
			cmd.CommandType = CommandType.Text;
			string sql = "update " + schema + "." + tbl + " set ";

			List<string> numtypes = new List<string> { "number", "int", "smallint", "bigint", "float", "decimal" };
			List<string> texttypes = new List<string> { "text", "string", "char", "varchar", "nchar" };
			List<string> datetypes = new List<string> { "date", "datetime", "smalldatetime" };

			foreach (dbfield fld in flds)
			{
				if (fld.fieldname.ToLower() != pk.ToLower())  //don't add the PK
				{
					if (fld.value != "")
					{
						if (numtypes.Any(s => fld.sqldbtype.Contains(s)))
						{
							sql += fld.fieldname + "= " + CleanString(fld.value, false) + ",";
						}
						else if (texttypes.Any(s => fld.sqldbtype.Contains(s)))
						{
							sql += fld.fieldname + "= " + CleanString(fld.value, true) + ",";
						}
						else if (datetypes.Any(s => fld.sqldbtype.Contains(s)))
						{
							sql += fld.fieldname + "= " + CleanString(fld.value, true) + ",";
						}
						else
						{
							sql += fld.fieldname + "= " + CleanString(fld.value, true) + ",";
						}
					}
				}
			}

			sql = sql.Substring(0, sql.Length - 1);

			string pkvals_csv = string.Join(",", pkvals);

			sql += "   where " + pk + " in (" + pkvals_csv.ToString() + ")";

			cmd.CommandText = sql;

			if (sql.Contains(" where "))  //must have a where clause
			{
				try
				{
					cmd.ExecuteNonQuery();
					return pk + " = " + pkvals_csv + " updated!";// +sql;
				}
				catch (Exception ex)
				{
					return ex.Message;
				}
			}
			else
			{
				return "No Where Clause!!";
			}
			//return cmd;
			//return sql;
		}

		public string sql_update_from_list(string schema, string tbl, List<dbfield> flds, Dictionary<string, int> pkvals)
		{
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oSqlConn;
			cmd.CommandType = CommandType.Text;
			string sql = "update " + schema + "." + tbl + " set ";

			List<string> numtypes = new List<string> { "number", "int", "smallint", "bigint", "float", "decimal" };
			List<string> texttypes = new List<string> { "text", "string", "char", "varchar", "nchar" };
			List<string> datetypes = new List<string> { "date", "datetime", "smalldatetime" };

			///HERE!!! NEED TO CREATE THE WHERE CLAUSE WITH THE DICTIONARY

			List<string> pk_flds = pkvals.Select(k => k.Key.ToLower()).ToList();

			foreach (dbfield fld in flds)
			{
				if (!pk_flds.Contains(fld.fieldname.ToLower()))  //don't add the PK
				{
					if (fld.value != "")
					{
						if (numtypes.Any(s => fld.sqldbtype.Contains(s)))
						{
							sql += fld.fieldname + "= " + CleanString(fld.value, false) + ",";
						}
						else if (texttypes.Any(s => fld.sqldbtype.Contains(s)))
						{
							sql += fld.fieldname + "= " + CleanString(fld.value, true) + ",";
						}
						else if (datetypes.Any(s => fld.sqldbtype.Contains(s)))
						{
							sql += fld.fieldname + "= " + CleanString(fld.value, true) + ",";
						}
						else
						{
							sql += fld.fieldname + "= " + CleanString(fld.value, true) + ",";
						}
					}
				}
			}

			sql = sql.Substring(0, sql.Length - 1);

			List<string> where_elements = new List<string>();
			foreach (KeyValuePair<string, int> pair in pkvals)
			{
				where_elements.Add(String.Format("{0}={1}", pair.Key, pair.Value.ToString()));
			}

			//string pkvals_csv = string.Join(",", pkvals);
			string where_clause = "   where " + string.Join(" and ", where_elements);
			sql += where_clause;

			cmd.CommandText = sql;

			if (sql.Contains(" where "))  //must have a where clause
			{
				try
				{
					cmd.ExecuteNonQuery();
					return string.Join(" and ", where_elements) + " updated!";// +sql;
				}
				catch (Exception ex)
				{
					return ex.Message;
				}
			}
			else
			{
				return "No Where Clause!!";
			}
			//return cmd;
			//return sql;
		}

		public static string CleanString(string text, bool addsinglequote)
		{
			string cleanvalue = text.Replace("DROP", "/*DR0P*/");
			cleanvalue = cleanvalue.Replace("DELETE", "/*D3L3T3*/");
			cleanvalue = cleanvalue.Replace("INSERT", "/*INS3RT*/");
			cleanvalue = cleanvalue.Replace("UPDATE", "/*UPD4T3*/");

			//double the apostrophes
			cleanvalue = cleanvalue.Replace("'", "''");

			if (text == "*NULL*")
			{
				cleanvalue = cleanvalue.Replace("*NULL*", "NULL");
				addsinglequote = false;
			}

			if (addsinglequote) cleanvalue = "'" + cleanvalue + "'";

			return cleanvalue;
		}

		public static string CleanString(string text, bool addsinglequote, string singlequoteswap)
		{
			string cleanvalue = text.Replace("DROP", "/*DR0P*/");
			cleanvalue = cleanvalue.Replace("DELETE", "/*D3L3T3*/");
			cleanvalue = cleanvalue.Replace("INSERT", "/*INS3RT*/");
			cleanvalue = cleanvalue.Replace("UPDATE", "/*UPD4T3*/");

			//double the apostrophes
			cleanvalue = cleanvalue.Replace("'", singlequoteswap);

			if (text == "*NULL*")
			{
				cleanvalue = cleanvalue.Replace("*NULL*", "NULL");
				addsinglequote = false;
			}

			if (addsinglequote) cleanvalue = singlequoteswap + cleanvalue + singlequoteswap;

			return cleanvalue;
		}
	}
}
