using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace AutismCenterBase.Utilities
{
	public class DBLookup
	{
		private SqlConnection oSqlConn;
		private SqlConnection oSqlConnData;
		private ReadConfig oConfig = new ReadConfig();

		public DBLookup()
		{
			oSqlConn = new SqlConnection();

			oSqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
			oSqlConn.Open();        
		}

		public DBLookup(string strDB)
		{
			oSqlConn = new SqlConnection();

			switch (strDB)
			{
				case "backend":
					oSqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
					break;
				case "data":
					oSqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
					break;
				case "ndar":
					oSqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["NDAR_CONN_STRING"].ToString();
					break;
			}
			oSqlConn.Open();
		}


		public DBLookup(SqlConnection oConn)
		{
			if (oConn.ConnectionString == null || oConn.ConnectionString == "")
				throw(new ArgumentException("ConnectionString property cannot be blank."));
			else if (oConn.State == ConnectionState.Closed || oConn.State == ConnectionState.Broken)
				throw(new ArgumentException("The connection object must be opened."));

			oSqlConn = oConn;
		}

		public SqlConnection SqlConnection
		{
			get {return oSqlConn;}
		}

		#region Get View 
		public DataTable GetView(string sView)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "select * from " + sView;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			SqlDataReader dr = oCmd.ExecuteReader();
			DataTable dt = new DataTable();
			dt.Load(dr);

			return dt;
		}
		#endregion



		#region Get SQL
		public DataTable GetSQL(string sView)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sView;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			SqlDataReader dr = oCmd.ExecuteReader();
			DataTable dt = new DataTable();
			dt.Load(dr);

			return dt;
		}
		#endregion



		#region Get Proc
		public DataTable GetProc(string sProc)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sProc;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			SqlDataReader dr = oCmd.ExecuteReader();
			DataTable dt = new DataTable();
			dt.Load(dr);

			return dt;
		}
		#endregion



		#region Get Study Action Text by Study Action ID
		public string GetStudyActionTextByStudyActionID(int nStudyActionID)
		{
			string sReturn = "";
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetStudyActionTextByStudyActionID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@StudyActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStudyActionID));
			oCmd.Parameters.Add(new SqlParameter("@StudyActionText", SqlDbType.VarChar, 100, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, null));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@StudyActionText"].Value != DBNull.Value) {sReturn = oCmd.Parameters["@StudyActionText"].Value.ToString();}

			return sReturn;
		}
		#endregion

		#region Get Action Text Action ID
		public string GetActionTextByStudyActionID(int nStudyActionID)
		{
			string sReturn = "";
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetActionTextByStudyActionID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@StudyActionID", nStudyActionID);
			oCmd.Parameters.AddWithValue("@ActionText", DBNull.Value);

			oCmd.Parameters["@ActionText"].Direction = ParameterDirection.Output;
			oCmd.Parameters["@ActionText"].Size = 500;

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@ActionText"].Value != DBNull.Value) { sReturn = oCmd.Parameters["@ActionText"].Value.ToString(); }

			return sReturn;
		}
		#endregion

		#region Get Action Text Action ID
		public string GetActionTextByActionID(int nActionID)
		{
			string sReturn = "";
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetActionTextByActionID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nActionID));
			oCmd.Parameters.Add(new SqlParameter("@ActionText", SqlDbType.VarChar, 100, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, null));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@ActionText"].Value != DBNull.Value) { sReturn = oCmd.Parameters["@ActionText"].Value.ToString(); }

			return sReturn;
		}
		#endregion

		#region Get Study Measure Name from Study Measure ID
		public string GetStudyMeasureNameByStudyMeasID(int nStudyMeasID)
		{
			string sReturn = "";
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetStudyMeasNameByStudyMeasID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@StudyMeasID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStudyMeasID));
			oCmd.Parameters.Add(new SqlParameter("@StudyMeasName", SqlDbType.VarChar, 100, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, null));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@StudyMeasName"].Value != DBNull.Value) {sReturn = oCmd.Parameters["@StudyMeasName"].Value.ToString();}

			return sReturn;
		}
		#endregion

		#region Get ID from Action ID
		public string GetIDFromActionID(int nActionID)
		{
			string sReturn = "";
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetIDByActionID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nActionID));
			oCmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar, 100, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, null));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@ID"].Value != DBNull.Value)
				sReturn = oCmd.Parameters["@ID"].Value.ToString();

			return sReturn;
		}
		#endregion

		#region Get SubjID From ID
		public int GetSubjIDFromID(string sID, int nStudyID)
		{
			int nReturn = 0;
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetSubjIDFromID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStudyID));
			oCmd.Parameters.Add(new SqlParameter("@SubjID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, null));

			try
			{
				oCmd.ExecuteNonQuery();

				if (oCmd.Parameters["@SubjID"].Value != DBNull.Value)
					nReturn = Convert.ToInt32(oCmd.Parameters["@SubjID"].Value);

				return nReturn;
			}
			catch
			{
				return 0;
			}
		}
		#endregion

		#region GetActionText method
		public string GetActionText(int nActionID)
		{
			string sReturn;
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetActionTextByActionID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nActionID));
			oCmd.Parameters.Add(new SqlParameter("@ActionText", SqlDbType.VarChar, 500, ParameterDirection.Output, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));

			try
			{
				oCmd.ExecuteNonQuery();
				sReturn = oCmd.Parameters["@ActionText"].Value.ToString();
			}
			catch
			{
				sReturn = null;
			}

			return sReturn;
		}
		#endregion

		#region Bind Drop Down List
		public void BindDropDownList(ref DropDownList oDropDownList, string sSQL, string sTextColumn, string sValueColumn, string sSelectedValue, string sStartItemText)
		{
			SqlDataReader oReader = GetDropDownData(sSQL);
			ListItem oItem;

			if (sStartItemText.Trim() != "")
			{
				oItem = new ListItem(sStartItemText, "-1");
				oDropDownList.Items.Add(oItem);
			}

			if (sSelectedValue.Trim() == "" && sSQL.IndexOf("spGetActiveStudies") > 0)
				sSelectedValue = GetDefaultStudyIDFromCookie().ToString();

			if (oReader != null)
			{
				while (oReader.Read())
				{
					oItem = new ListItem();
					oItem.Value = oReader[sValueColumn].ToString();
					oItem.Text = oReader[sTextColumn].ToString();

					if (oReader[sValueColumn].ToString() == sSelectedValue && oReader[sValueColumn].ToString() != "") {oItem.Selected = true;}

					oDropDownList.Items.Add(oItem);
				}

				oReader.Close();
			}
		}

		public void BindDropDownList(ref HtmlSelect oDropDownList, string sSQL, string sTextColumn, string sValueColumn, string sSelectedValue, string sStartItemText)
		{
			SqlDataReader oReader = GetDropDownData(sSQL);
			ListItem oItem;

			if (sStartItemText.Trim() != "")
			{
				oItem = new ListItem(sStartItemText, "-1");
				oDropDownList.Items.Add(oItem);
			}

			if (sSelectedValue.Trim() == "" && sSQL.IndexOf("spGetActiveStudies") > 0)
				sSelectedValue = GetDefaultStudyIDFromCookie().ToString();

			if (oReader != null)
			{
				while (oReader.Read())
				{
					oItem = new ListItem();
					oItem.Value = oReader[sValueColumn].ToString();
					oItem.Text = oReader[sTextColumn].ToString();

					if (oReader[sValueColumn].ToString() == sSelectedValue && oReader[sValueColumn].ToString() != "") {oItem.Selected = true;}

					oDropDownList.Items.Add(oItem);
				}

				oReader.Close();
			}
		}

		public void BindDropDownList(ref DropDownList oDropDownList, string sSQL, string sTextColumn, string sValueColumn, string sOptGroupColumn, string sSelectedValue, string sStartItemText)
		{
			SqlDataReader oReader = GetDropDownData(sSQL);
			ListItem oItem;
			string sOptGroup = "";

			if (sStartItemText.Trim() != "")
			{
				oItem = new ListItem(sStartItemText, "-1");
				oDropDownList.Items.Add(oItem);
			}

			if (sSelectedValue.Trim() == "" && sSQL.IndexOf("spGetActiveStudies") > 0)
				sSelectedValue = GetDefaultStudyIDFromCookie().ToString();

			if (oReader != null)
			{
				while (oReader.Read())
				{
					if (sOptGroup != oReader[sOptGroupColumn].ToString())
					{
						sOptGroup = oReader[sOptGroupColumn].ToString();
						oItem = new ListItem();
						oItem.Value = "-1";
						oItem.Text = "";
						oDropDownList.Items.Add(oItem);

						oItem = new ListItem();
						oItem.Value = "-1";
						oItem.Text = "--" + sOptGroup + "--";
						oDropDownList.Items.Add(oItem);
					}

					oItem = new ListItem();
					oItem.Value = oReader[sValueColumn].ToString();
					oItem.Text = oReader[sTextColumn].ToString();

					if (oReader[sValueColumn].ToString() == sSelectedValue && oReader[sValueColumn].ToString() != "") {oItem.Selected = true;}

					oDropDownList.Items.Add(oItem);
				}

				oReader.Close();
			}
		}

		public void BindDropDownList(ref HtmlSelect oDropDownList, string sSQL, string sTextColumn, string sValueColumn, string sOptGroupColumn, string sSelectedValue, string sStartItemText)
		{
			SqlDataReader oReader = GetDropDownData(sSQL);
			ListItem oItem;
			string sOptGroup = "";

			if (sStartItemText.Trim() != "")
			{
				oItem = new ListItem(sStartItemText, "-1");
				oDropDownList.Items.Add(oItem);
			}

			if (sSelectedValue.Trim() == "" && sSQL.IndexOf("spGetActiveStudies") > 0)
				sSelectedValue = GetDefaultStudyIDFromCookie().ToString();

			if (oReader != null)
			{
				while (oReader.Read())
				{
					if (sOptGroup != oReader[sOptGroupColumn].ToString())
					{
						sOptGroup = oReader[sOptGroupColumn].ToString();
						oItem = new ListItem();
						oItem.Value = "-1";
						oItem.Text = "";
						oDropDownList.Items.Add(oItem);

						oItem = new ListItem();
						oItem.Value = "-1";
						oItem.Text = "--" + sOptGroup + "--";
						oDropDownList.Items.Add(oItem);
					}

					oItem = new ListItem();
					oItem.Value = oReader[sValueColumn].ToString();
					oItem.Text = oReader[sTextColumn].ToString();

					if (oReader[sValueColumn].ToString() == sSelectedValue && oReader[sValueColumn].ToString() != "") {oItem.Selected = true;}

					oDropDownList.Items.Add(oItem);
				}

				oReader.Close();
			}
		}

		public string BindDropDownList(string sName, string sSQL, string sTextColumn, string sValueColumn, string sSelectedValue, string sStartItemText, string sStyle)
		{
			SqlDataReader oReader = GetDropDownData(sSQL);
			string sReturn = "<select name=\"" + sName + "\" id=\"" + sName + "\"";

			if (sStyle.ToString() != "")
				sReturn += " style=\"" + sStyle + "\"";

			sReturn += ">";

			if (sSelectedValue == null)
				sSelectedValue = GetDefaultStudyIDFromCookie().ToString();
			else if (sSelectedValue.Trim() == "" && sSQL.IndexOf("spGetActiveStudies") > 0)
				sSelectedValue = GetDefaultStudyIDFromCookie().ToString();

			if (sStartItemText.Trim() != "")
				sReturn += "<option value=\"-1\">" + sStartItemText + "</option>";

			if (oReader != null)
			{
				while (oReader.Read())
				{
					if (oReader[sValueColumn].ToString() == sSelectedValue && oReader[sValueColumn].ToString() != "")
						sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\" selected=\"True\">" + oReader[sTextColumn].ToString() + "</option>";
					else
						sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\">" + oReader[sTextColumn].ToString() + "</option>";
				}

				oReader.Close();
			}

			sReturn += "</select>";

			return sReturn;
		}

		public string BindDropDownList(string sName, int nID, string sSQL, string sTextColumn, string sValueColumn, string sSelectedValue, string sStartItemText, string sStyle)
		{
			SqlDataReader oReader = GetDropDownData(sSQL);
			string sReturn = "<select name=\"" + sName + "\" id=\"" + sName + nID.ToString() + "\"";

			if (sStyle.ToString() != "")
				sReturn += " style=\"" + sStyle + "\"";

			sReturn += ">";

			if (sSelectedValue.Trim() == "" && sSQL.IndexOf("spGetActiveStudies") > 0)
				sSelectedValue = GetDefaultStudyIDFromCookie().ToString();

			if (sStartItemText.Trim() != "")
				sReturn += "<option value=\"-1\">" + sStartItemText + "</option>";

			if (oReader != null)
			{
				while (oReader.Read())
				{
					if (oReader[sValueColumn].ToString() == sSelectedValue && oReader[sValueColumn].ToString() != "")
						sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\" selected=\"True\">" + oReader[sTextColumn].ToString() + "</option>";
					else
						sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\">" + oReader[sTextColumn].ToString() + "</option>";
				}

				oReader.Close();
			}

			sReturn += "</select>";

			return sReturn;
		}

		public string BindDropDownList(string sName, string sSQL, string sTextColumn, string sValueColumn, string sOptGroupColumn, string sSelectedValue, string sStartItemText, string sStyle)
		{
			SqlDataReader oReader = GetDropDownData(sSQL);

			HtmlGenericControl oOptGroup = new HtmlGenericControl("optgroup");
			bool bCloseOptGroup = false;
			string sOptGroup = "";
			string sReturn = "<select name=\"" + sName + "\" id=\"" + sName + "\"";

			if (sStyle.ToString() != "")
				sReturn += " style=\"" + sStyle + "\"";

			sReturn += ">";

			if (sSelectedValue.Trim() == "" && sSQL.IndexOf("spGetActiveStudies") > 0)
				sSelectedValue = GetDefaultStudyIDFromCookie().ToString();

			if (sStartItemText.Trim() != "")
				sReturn += "<option value=\"-1\">" + sStartItemText + "</option>";

			if (oReader != null)
			{
				while (oReader.Read())
				{
					if (sOptGroup != oReader[sOptGroupColumn].ToString())
					{
						sOptGroup = oReader[sOptGroupColumn].ToString();

						if (bCloseOptGroup) {sReturn += "</optgroup>";}

						sReturn += "<optgroup label=\"" + sOptGroup + "\">";
						bCloseOptGroup = true;
					}

					if (oReader[sValueColumn].ToString() == sSelectedValue && oReader[sValueColumn].ToString() != "")
						sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\" selected=\"True\">" + oReader[sTextColumn].ToString() + "</option>";
					else
						sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\">" + oReader[sTextColumn].ToString() + "</option>";
				}

				oReader.Close();
			}

			if (bCloseOptGroup) {sReturn += "</optgroup>";}
			sReturn += "</select>";

			return sReturn;
		}

		public string BindDropDownList(string sName, int nID, string sSQL, string sTextColumn, string sValueColumn, string sOptGroupColumn, string sSelectedValue, string sStartItemText, string sStyle)
		{
			SqlDataReader oReader = GetDropDownData(sSQL);

			HtmlGenericControl oOptGroup = new HtmlGenericControl("optgroup");
			bool bCloseOptGroup = false;
			string sOptGroup = "";
			string sReturn = "<select name=\"" + sName + "\" id=\"" + sName + nID.ToString() + "\"";

			if (sStyle.ToString() != "")
				sReturn += " style=\"" + sStyle + "\"";

			sReturn += ">";

			if (sSelectedValue.Trim() == "" && sSQL.IndexOf("spGetActiveStudies") > 0)
				sSelectedValue = GetDefaultStudyIDFromCookie().ToString();

			if (sStartItemText.Trim() != "")
				sReturn += "<option value=\"-1\">" + sStartItemText + "</option>";

			if (oReader != null)
			{
				while (oReader.Read())
				{
					if (sOptGroup != oReader[sOptGroupColumn].ToString())
					{
						sOptGroup = oReader[sOptGroupColumn].ToString();

						if (bCloseOptGroup) {sReturn += "</optgroup>";}

						sReturn += "<optgroup label=\"" + sOptGroup + "\">";
						bCloseOptGroup = true;
					}

					if (oReader[sValueColumn].ToString() == sSelectedValue && oReader[sValueColumn].ToString() != "")
						sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\" selected=\"True\">" + oReader[sTextColumn].ToString() + "</option>";
					else
						sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\">" + oReader[sTextColumn].ToString() + "</option>";
				}

				oReader.Close();
			}

			if (bCloseOptGroup) {sReturn += "</optgroup>";}
			sReturn += "</select>";

			return sReturn;
		}
		#endregion

		#region Bind List Box
		public void BindListBox(ref ListBox oListBox, string sSQL, string sTextColumn, string sValueColumn, string sSelectedValue)
		{
			SqlDataReader oReader = GetDropDownData(sSQL);
			string[] aSelectedValues;
			ListItem oItem;

			if (oReader != null)
			{
				while (oReader.Read())
				{
					oItem = new ListItem();
					oItem.Value = oReader[sValueColumn].ToString();
					oItem.Text = oReader[sTextColumn].ToString();

					if (sSelectedValue.IndexOf(",") > 0)
					{
						aSelectedValues = sSelectedValue.Split(',');

						for (int i=0;i<aSelectedValues.Length;i++)
						{
							if (aSelectedValues[i].Trim() == oReader[sValueColumn].ToString() && oReader[sValueColumn].ToString() != "")
							{
								oItem.Selected = true;
								break;
							}
						}
					}
					else
						if (oReader[sValueColumn].ToString() == sSelectedValue) {oItem.Selected = true;}

					oListBox.Items.Add(oItem);
				}

				oReader.Close();
			}
		}

		public string BindListBox(string sName, int nSize, bool bMultiple, string sSQL, string sTextColumn, string sValueColumn, string sSelectedValue, string sStyle)
		{
			SqlDataReader oReader = GetDropDownData(sSQL);
			string[] aSelectedValues;
			string sReturn = "<select name=\"" + sName + "\" id=\"" + sName + "\" size=\"" + nSize + "\"";

			if (bMultiple)
				sReturn += " multiple=\"true\"";

			if (sStyle.ToString() != "")
				sReturn += " style=\"" + sStyle + "\"";

			sReturn += ">";

			if (oReader != null)
			{
				while (oReader.Read())
				{
					if (sSelectedValue.IndexOf(",") > 0)
					{
						aSelectedValues = sSelectedValue.Split(',');

						sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\"";

						for (int i=0;i<aSelectedValues.Length;i++)
						{
							if (aSelectedValues[i].Trim() == oReader[sValueColumn].ToString() && oReader[sValueColumn].ToString() != "")
							{
								sReturn += " selected=\"True\"";
								break;
							}
						}

						sReturn += " >" + oReader[sTextColumn].ToString() + "</option>";
					}
					else
					{
						if (oReader[sValueColumn].ToString() == sSelectedValue && oReader[sValueColumn].ToString() != "")
							sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\" selected=\"True\">" + oReader[sTextColumn].ToString() + "</option>";
						else
							sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\">" + oReader[sTextColumn].ToString() + "</option>";
					}
				}

				oReader.Close();
			}

			sReturn += "</select>";

			return sReturn;
		}

		public string BindListBox(string sName, int nSize, bool bMultiple, string sSQL, string sTextColumn, string sValueColumn, string sOptGroupColumn, string sSelectedValue, string sStyle)
		{
			SqlDataReader oReader = GetDropDownData(sSQL);

			HtmlGenericControl oOptGroup = new HtmlGenericControl("optgroup");
			string[] aSelectedValues;
			bool bCloseOptGroup = false;
			string sOptGroup = "";
			string sReturn = "<select name=\"" + sName + "\" id=\"" + sName + "\" size=\"" + nSize + "\"";

			if (bMultiple)
				sReturn += " multiple=\"true\"";

			if (sStyle.ToString() != "")
				sReturn += " style=\"" + sStyle + "\"";

			sReturn += ">";

			if (oReader != null)
			{
				while (oReader.Read())
				{
					if (sOptGroup != oReader[sOptGroupColumn].ToString())
					{
						sOptGroup = oReader[sOptGroupColumn].ToString();

						if (bCloseOptGroup) {sReturn += "</optgroup>";}

						sReturn += "<optgroup label=\"" + sOptGroup + "\">";
						bCloseOptGroup = true;
					}

					if (sSelectedValue.IndexOf(",") > 0)
					{
						aSelectedValues = sSelectedValue.Split(',');

						sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\"";

						for (int i=0;i<aSelectedValues.Length;i++)
						{
							if (aSelectedValues[i].Trim() == oReader[sValueColumn].ToString() && oReader[sValueColumn].ToString() != "")
							{
								sReturn += " selected=\"True\"";
								break;
							}
						}

						sReturn += " >" + oReader[sTextColumn].ToString() + "</option>";
					}
					else
					{
						if (oReader[sValueColumn].ToString() == sSelectedValue && oReader[sValueColumn].ToString() != "")
							sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\" selected=\"True\">" + oReader[sTextColumn].ToString() + "</option>";
						else
							sReturn += "<option value=\"" + oReader[sValueColumn].ToString() + "\">" + oReader[sTextColumn].ToString() + "</option>";
					}
				}

				oReader.Close();
			}

			if (bCloseOptGroup) {sReturn += "</optgroup>";}
			sReturn += "</select>";

			return sReturn;
		}
		#endregion

		#region Get Study Name
		public string GetStudyName(int nStudyID, bool bFullName)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetStudyNameByStudyID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nStudyID));
			oCmd.Parameters.Add(new SqlParameter("@StudyName", SqlDbType.VarChar, 100, ParameterDirection.Output, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
			oCmd.Parameters.Add(new SqlParameter("@StudyFullName", SqlDbType.VarChar, 100, ParameterDirection.Output, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (bFullName)
				sReturn = oCmd.Parameters["@StudyFullName"].Value.ToString();
			else
				sReturn = oCmd.Parameters["@StudyName"].Value.ToString();

			return sReturn;
		}
		#endregion

		#region Get Full Study Name
		public string GetFullStudyName(int nStudyID, bool bFullName)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetFullStudyNameByStudyID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nStudyID));
			oCmd.Parameters.Add(new SqlParameter("@FullStudyName", SqlDbType.VarChar, 100, ParameterDirection.Output, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));
			oCmd.Parameters.Add(new SqlParameter("@FullStudyFullName", SqlDbType.VarChar, 100, ParameterDirection.Output, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (bFullName)
				sReturn = oCmd.Parameters["@FullStudyFullName"].Value.ToString();
			else
				sReturn = oCmd.Parameters["@FullStudyName"].Value.ToString();

			return sReturn;
		}
		#endregion

		#region Get Household Name
		public string GetHouseholdName(int nHouseholdID)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;
			string sReturn;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetHouseholdByHouseholdID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nHouseholdID));

			try
			{
				oReader = oCmd.ExecuteReader();

				if (oReader.HasRows)
				{
					oReader.Read();
					sReturn = oReader["HouseholdName"].ToString();
				}
				else
					sReturn = null;

				oReader.Close();
			}
			catch
			{
				sReturn = null;
			}

			return sReturn;
		}
		#endregion

		#region Get User Profile
		public SqlDataReader GetUserProfile(string sLoginID)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = oSqlConn;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetUserProfile";
			oCmd.CommandTimeout = 90;

			oCmd.Parameters.Add(new SqlParameter("@UserName", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sLoginID));

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

		#region Get Subject's ID from SubjID
		public string GetIDBySubjID(int nSubjID)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;
			string sReturn;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetSubjectDetailsBySubjectID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@SubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nSubjID));

			oReader = oCmd.ExecuteReader();

			if (oReader.HasRows)
			{
				oReader.Read();
				sReturn = oReader["ID"].ToString();
			}
			else
				sReturn = null;

			oReader.Close();

			return sReturn;
		}

		public string GetIDBySubjID(int nSubjID, bool bIncludeStudy)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;
			string sReturn;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetSubjectDetailsBySubjectID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@SubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nSubjID));

			oReader = oCmd.ExecuteReader();

			if (oReader.HasRows)
			{
				oReader.Read();
				sReturn = oReader["ID"].ToString();

				if (bIncludeStudy)
					sReturn = oReader["StudyName"].ToString() + " - Subj. " + sReturn;
			}
			else
				sReturn = null;

			oReader.Close();

			return sReturn;
		}
		#endregion

		#region Get Subject's Name from SubjID
		public string GetSubjectNameBySubjID(int nSubjID)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;
			string sReturn;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetSubjectDetailsBySubjectID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@SubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nSubjID));

			oReader = oCmd.ExecuteReader();

			if (oReader.HasRows)
			{
				oReader.Read();
				sReturn = oReader["FullName"].ToString();
			}
			else
				sReturn = null;

			oReader.Close();

			return sReturn;
		}
		#endregion

		#region Get PersonID from SubjID
		public int GetPersonIDBySubjID(int nSubjID)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;
			int nReturn;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetSubjectDetailsBySubjectID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@SubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nSubjID));

			oReader = oCmd.ExecuteReader();

			if (oReader.HasRows)
			{
				oReader.Read();

				if (oReader["PersonID"].ToString() != "")
					nReturn = Convert.ToInt32(oReader["PersonID"].ToString());
				else
					nReturn = -1;
			}
			else
				nReturn = -1;

			oReader.Close();

			return nReturn;
		}
		#endregion

		#region Get Subject ID from Action ID
		public int GetSubjectIDFromActionID(int nActionID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = 0;

			oCmd.Connection = this.oSqlConn;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandTimeout = 90;
			oCmd.CommandText = "spGetSubjectIDFromActionID";

			oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nActionID));
			oCmd.Parameters.Add(new SqlParameter("@SubjectID", SqlDbType.Int, 4, ParameterDirection.Output, false, 0, 0, "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@SubjectID"].Value.ToString() != "")
				nReturn = Convert.ToInt32(oCmd.Parameters["@SubjectID"].Value.ToString());

			return nReturn;
		}
		#endregion

		#region Get Subject ID from StudyMeasSubjID
		public int GetSubjectIDFromStudyMeasSubjID(int nStudyMeasSubjID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = 0;

			oCmd.Connection = this.oSqlConn;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandTimeout = 90;
			oCmd.CommandText = "spGetSubjectIDFromStudyMeasSubjID";

			oCmd.Parameters.Add(new SqlParameter("@StudyMeasSubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStudyMeasSubjID));
			oCmd.Parameters.Add(new SqlParameter("@SubjectID", SqlDbType.Int, 4, ParameterDirection.Output, false, 0, 0, "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@SubjectID"].Value.ToString() != "")
				nReturn = Convert.ToInt32(oCmd.Parameters["@SubjectID"].Value.ToString());

			return nReturn;
		}
		#endregion

		#region Get Subject ID from StudyMeasSubjID
		public int GetSubjectIDFromSubjConsentID(int nSubjConsentID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = 0;

			oCmd.Connection = this.oSqlConn;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandTimeout = 90;
			oCmd.CommandText = "spGetSubjectIDFromSubjConsentID";

			oCmd.Parameters.Add(new SqlParameter("@SubjConsentID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nSubjConsentID));
			oCmd.Parameters.Add(new SqlParameter("@SubjID", SqlDbType.Int, 4, ParameterDirection.Output, false, 0, 0, "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@SubjID"].Value.ToString() != "")
				nReturn = Convert.ToInt32(oCmd.Parameters["@SubjID"].Value.ToString());

			return nReturn;
		}
		#endregion

		#region Get Staff's ID from Active Directory ID
		public int GetStaffIDByActiveDirectoryID(string sActDirID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetStaffIDByActDirID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			if (sActDirID.ToLower().StartsWith("autism\\"))
				sActDirID = sActDirID.Substring(7);

			oCmd.Parameters.Add(new SqlParameter("@ActDirID", SqlDbType.VarChar, 255, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, sActDirID));
			oCmd.Parameters.Add(new SqlParameter("@StaffID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@StaffID"].ToString() != "")
				nReturn = Convert.ToInt32(oCmd.Parameters["@StaffID"].Value.ToString());
			else
				nReturn = 0;

			return nReturn;
		}
		#endregion

		#region Get Data for Drop Down Lists and List Boxes
		private SqlDataReader GetDropDownData(string sSQL)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = sSQL;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			oReader = oCmd.ExecuteReader();
			return oReader;
		}
		#endregion

		#region Get Default Study ID From Cookie
		private int GetDefaultStudyIDFromCookie()
		{
			int nReturn = -1;

			if (HttpContext.Current.Request.Cookies["UserProfile"] != null)
			{
				if (HttpContext.Current.Request.Cookies["UserProfile"].Values["DefaultStudyID"] != null)
				{
					if (HttpContext.Current.Request.Cookies["UserProfile"].Values["DefaultStudyID"].ToString() != "")
						nReturn = Convert.ToInt32(HttpContext.Current.Request.Cookies["UserProfile"].Values["DefaultStudyID"].ToString());
				}
			}

			return nReturn;
		}
		#endregion

		#region Is Study Counter Balanced
		public bool IsStudyCounterBalanced(int nStudyID)
		{
			SqlCommand oCmd = new SqlCommand();
			bool bReturn = false;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spIsStudyCounterBalanced";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStudyID));
			oCmd.Parameters.Add(new SqlParameter("@IsCounterBalanced", SqlDbType.Bit, 1, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();
			bReturn = Convert.ToBoolean(oCmd.Parameters["@IsCounterBalanced"].Value.ToString());

			return bReturn;
		}
		#endregion

		#region Is Family Study
		public bool IsFamilyStudy(int nStudyID)
		{
			SqlCommand oCmd = new SqlCommand();
			bool bReturn = false;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spIsFamilyStudy";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStudyID));
			oCmd.Parameters.Add(new SqlParameter("@IsFamilyStudy", SqlDbType.Bit, 1, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();
			bReturn = Convert.ToBoolean(oCmd.Parameters["@IsFamilyStudy"].Value.ToString());

			return bReturn;
		}
		#endregion

		#region Get Study Name and ID by Subject ID
		public void GetStudyAndGroupInfoBySubjectID(int nSubjID, ref int nStudyID, ref string sStudyName, ref int nGroupID, ref string sGroupName, bool bStudyFullName)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oSqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetStudyAndGroupInfoBySubjectID";

			oCmd.Parameters.Add(new SqlParameter("@SubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nSubjID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Output, false, 0, 0, "", DataRowVersion.Current, nStudyID));
			oCmd.Parameters.Add(new SqlParameter("@StudyName", SqlDbType.VarChar, 200, ParameterDirection.Output, false, 0, 0, "", DataRowVersion.Current, sStudyName));
			oCmd.Parameters.Add(new SqlParameter("@GroupID", SqlDbType.Int, 4, ParameterDirection.Output, false, 0, 0, "", DataRowVersion.Current, nGroupID));
			oCmd.Parameters.Add(new SqlParameter("@GroupName", SqlDbType.VarChar, 100, ParameterDirection.Output, false, 0, 0, "", DataRowVersion.Current, sGroupName));
			oCmd.Parameters.Add(new SqlParameter("@StudyFullName", SqlDbType.Bit, 1, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, bStudyFullName));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@StudyID"].Value.ToString() != "")
				nStudyID = Convert.ToInt32(oCmd.Parameters["@StudyID"].Value.ToString());

			if (oCmd.Parameters["@StudyName"].Value.ToString() != "")
				sStudyName = oCmd.Parameters["@StudyName"].Value.ToString();

			if (oCmd.Parameters["@GroupID"].Value.ToString() != "")
				nGroupID = Convert.ToInt32(oCmd.Parameters["@GroupID"].Value.ToString());

			if (oCmd.Parameters["@GroupName"].Value.ToString() != "")
				sGroupName = oCmd.Parameters["@GroupName"].Value.ToString();
		}
		#endregion

		#region Get Staff Name by Staff ID
		public string GetStaffNameByStaffID(int nStaffID)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = oSqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetStaffNameByStaffID";

			oCmd.Parameters.Add(new SqlParameter("@StaffID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStaffID));
			oCmd.Parameters.Add(new SqlParameter("@StaffName", SqlDbType.VarChar, 200, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@StaffName"].Value.ToString() != "")
				sReturn = oCmd.Parameters["@StaffName"].Value.ToString();

			return sReturn;
		}
		#endregion

		#region Get Group Name by Group ID
		public string GetGroupNameByGroupID(int nGroupID)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = oSqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetGroupNameByGroupID";

			oCmd.Parameters.Add(new SqlParameter("@GroupID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nGroupID));
			oCmd.Parameters.Add(new SqlParameter("@GroupName", SqlDbType.VarChar, 100, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@GroupName"].Value.ToString() != "")
				sReturn = oCmd.Parameters["@GroupName"].Value.ToString();

			return sReturn;
		}
		#endregion

		#region Get Consent Form Name by Consent Form ID
		public string GetConsentFormNameByConsentFormID(int nConsentFormID)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetConsentFormNameByConsentFormID";

			oCmd.Parameters.Add(new SqlParameter("@ConsentFormID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nConsentFormID));
			oCmd.Parameters.Add(new SqlParameter("@ConsentFormName", SqlDbType.VarChar, 500, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));

			oCmd.ExecuteNonQuery();

			sReturn = oCmd.Parameters["@ConsentFormName"].Value.ToString();

			return sReturn;
		}
		#endregion

		#region Get Consent Form Name by Consent Form Version ID
		public string GetConsentFormVersionNameByConsentFormVersionID(int nConsentFormVersionID)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetConsentFormVersionNameByConsentFormVersionID";

			oCmd.Parameters.Add(new SqlParameter("@ConsentFormVersionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nConsentFormVersionID));
			oCmd.Parameters.Add(new SqlParameter("@ConsentFormVersionName", SqlDbType.VarChar, 500, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));

			oCmd.ExecuteNonQuery();

			sReturn = oCmd.Parameters["@ConsentFormVersionName"].Value.ToString();

			return sReturn;
		}
		#endregion

		#region Get Consent Form Name by SubjConsentID
		public string GetConsentFormNameBySubjConsentID(int nSubjConsentID)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetConsentFormNameBySubjConsentID";

			oCmd.Parameters.Add(new SqlParameter("@SubjConsentID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nSubjConsentID));
			oCmd.Parameters.Add(new SqlParameter("@ConsentFormName", SqlDbType.VarChar, 500, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));

			oCmd.ExecuteNonQuery();

			sReturn = oCmd.Parameters["@ConsentFormName"].Value.ToString();

			return sReturn;
		}
		#endregion

		#region Get Consent Form ID by SubjConsentID
		public int GetConsentFormIDBySubjConsentID(int nSubjConsentID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = -1;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetConsentFormIDBySubjConsentID";

			oCmd.Parameters.Add(new SqlParameter("@SubjConsentID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nSubjConsentID));
			oCmd.Parameters.Add(new SqlParameter("@ConsentFormID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@ConsentFormID"].Value.ToString() != "")
				nReturn = Convert.ToInt32(oCmd.Parameters["@ConsentFormID"].Value.ToString());

			return nReturn;
		}
		#endregion

		#region Get Consent Form Version ID by SubjConsentID
		public int GetConsentFormVersionIDBySubjConsentID(int nSubjConsentID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = -1;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetConsentFormVersionIDBySubjConsentID";

			oCmd.Parameters.Add(new SqlParameter("@SubjConsentID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nSubjConsentID));
			oCmd.Parameters.Add(new SqlParameter("@ConsentFormVersionID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@ConsentFormVersionID"].Value.ToString() != "")
				nReturn = Convert.ToInt32(oCmd.Parameters["@ConsentFormVersionID"].Value.ToString());

			return nReturn;
		}
		#endregion

		#region Get ActionID from SubjectID and StudyActionID
		public int GetActionIDFromIDAndStudyActionID(int nStudyID, string sSubjectID, int nStudyActionID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = 0;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandText = "spGetActionIDFromIDAndStudyActionID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.VarChar, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStudyID));
			oCmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sSubjectID));
			oCmd.Parameters.Add(new SqlParameter("@StudyActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStudyActionID));
			oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, null));

			oCmd.ExecuteNonQuery();
			nReturn = Convert.ToInt32(oCmd.Parameters["@ActionID"].Value);

			return nReturn;
		}
		#endregion

		#region Get StudyMeasSubjID From StudyMeasID And SubjID
		public int GetStudyMeasSubjIDFromStudyMeasIDAndSubjID(int nStudyID, string sSubjectID, int nStudyMeasureID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = 0;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandText = "spGetStudyMeasSubjIDFromIDAndStudyMeasID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@StudyID", nStudyID);
			oCmd.Parameters.AddWithValue("@ID", sSubjectID);
			oCmd.Parameters.AddWithValue("@StudyMeasID", nStudyMeasureID);
			oCmd.Parameters.AddWithValue("@StudyMeasSubjID", DBNull.Value);

			oCmd.Parameters["@StudyMeasSubjID"].Direction = ParameterDirection.Output;
			oCmd.Parameters["@StudyMeasSubjID"].SqlDbType = SqlDbType.Int;

			oCmd.ExecuteNonQuery();
			nReturn = Convert.ToInt32(oCmd.Parameters["@StudyMeasSubjID"].Value);

			return nReturn;
		}
		#endregion

		#region Get SubjConsentID From SubjID And ConsentFormID
		public int GetSubjConsentIDFromSubjIDAndConsentFormID(string sSubjectID, int nStudyID, int nConsentFormID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = 0;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandText = "spGetSubjConsentIDFromIDAndConsentFormID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sSubjectID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.VarChar, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStudyID));
			oCmd.Parameters.Add(new SqlParameter("@ConsentFormID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nConsentFormID));
			oCmd.Parameters.Add(new SqlParameter("@SubjConsentID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();
			nReturn = Convert.ToInt32(oCmd.Parameters["@SubjConsentID"].Value);

			return nReturn;
		}
		#endregion

		#region Get ActionID by StudyMeasSubjID
		public int GetActionIDByStudyMeasSubjID(int nStudyMeasSubjID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = -1;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetActionIDByStudyMeasSubjID";

			oCmd.Parameters.Add(new SqlParameter("@StudyMeasSubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nStudyMeasSubjID));
			oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@ActionID"].Value.ToString() != "") {nReturn = Convert.ToInt32(oCmd.Parameters["@ActionID"].Value);}

			return nReturn;
		}
		#endregion

		#region Get StudyID by ActionID
		public int GetStudyIDBySubjID(int nSubjID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = -1;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetStudyIDBySubjID";

			oCmd.Parameters.Add(new SqlParameter("@SubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nSubjID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@StudyID"].Value.ToString() != "") {nReturn = Convert.ToInt32(oCmd.Parameters["@StudyID"].Value);}

			return nReturn;
		}
		#endregion

		#region Get StudyID by StudyMeasID
		public int GetStudyIDByStudyMeasID(int nStudyMeasID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = -1;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetStudyIDByStudyMeasID";

			oCmd.Parameters.Add(new SqlParameter("@StudyMeasID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nStudyMeasID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@StudyID"].Value.ToString() != "") {nReturn = Convert.ToInt32(oCmd.Parameters["@StudyID"].Value);}

			return nReturn;
		}
		#endregion

		#region Get StudyID by StudyActionID
		public int GetStudyIDByStudyActionID(int nStudyActionID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = -1;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetStudyIDByStudyActionID";

			oCmd.Parameters.Add(new SqlParameter("@StudyActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nStudyActionID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@StudyID"].Value.ToString() != "") {nReturn = Convert.ToInt32(oCmd.Parameters["@StudyID"].Value);}

			return nReturn;
		}
		#endregion

		#region Get StudyID by ActionID
		public int GetStudyIDByActionID(int nActionID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = -1;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetStudyIDByActionID";

			oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nActionID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@StudyID"].Value.ToString() != "") {nReturn = Convert.ToInt32(oCmd.Parameters["@StudyID"].Value);}

			return nReturn;
		}
		#endregion

		#region Get StudyID by ActionID
		public int GetStudyIDByStudyMeasSubjID(int nStudyMeasSubjID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = -1;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetStudyIDByStudyMeasSubjID";

			oCmd.Parameters.Add(new SqlParameter("@StudyMeasSubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nStudyMeasSubjID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Default, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@StudyID"].Value.ToString() != "") {nReturn = Convert.ToInt32(oCmd.Parameters["@StudyID"].Value);}

			return nReturn;
		}
		#endregion

		#region Get Groups by Study Action ID
		public string GetGroupsByStudyActionID(int nStudyActionID, bool bGroupIDs)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetGroupsByStudyActionID";
			oCmd.Parameters.AddWithValue("@StudyActionID", nStudyActionID);

			SqlDataReader oReader = oCmd.ExecuteReader();

			while (oReader.Read())
			{
				if (bGroupIDs)
					sReturn += "," + oReader["GroupID"].ToString();
				else
					sReturn += "," + oReader["GroupName"].ToString();
			}

			oReader.Close();

			if (sReturn.StartsWith(","))
				sReturn = sReturn.Substring(1);

			return sReturn;
		}
		#endregion

		#region Get Groups by Study Measure ID
		public string GetGroupsByStudyMeasureID(int nStudyMeasID, bool bGroupIDs)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetGroupsByStudyMeasID";
			oCmd.Parameters.AddWithValue("@StudyMeasID", nStudyMeasID);

			SqlDataReader oReader = oCmd.ExecuteReader();

			while (oReader.Read())
			{
				if (bGroupIDs)
					sReturn += "," + oReader["GroupID"].ToString();
				else
					sReturn += "," + oReader["GroupName"].ToString();
			}

			oReader.Close();

			if (sReturn.StartsWith(","))
				sReturn = sReturn.Substring(1);

			return sReturn;
		}
		#endregion

		#region Get Groups by Consent Form ID
		public string GetGroupIDsByConsentFormID(int nConsentFormID)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetGroupsByConsentFormID";
			oCmd.Parameters.AddWithValue("@ConsentFormID", nConsentFormID);

			SqlDataReader oReader = oCmd.ExecuteReader();

			while (oReader.Read())
				sReturn += "," + oReader["GroupID"].ToString();

			oReader.Close();

			if (sReturn.StartsWith(","))
				sReturn = sReturn.Substring(1);

			return sReturn;
		}
		#endregion

		#region Get Group IDs By Study ID
		public string GetGroupIDsByStudyID(int nStudyID)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetGroupsByStudyID";
			oCmd.Parameters.AddWithValue("@StudyID", nStudyID);

			SqlDataReader oReader = oCmd.ExecuteReader();

			while (oReader.Read())
				sReturn += "," + oReader["GroupID"].ToString();

			oReader.Close();

			if (sReturn.StartsWith(","))
				sReturn = sReturn.Substring(1);

			return sReturn;
		}
		#endregion

		#region Get Documents by Entity ID and Entity Type ID
		public DataTable GetDocsByEntityIDAndEntityTypeID(int nEntityTypeID, int nEntityID)
		{
			SqlCommand oCmd = new SqlCommand();
			DataSet oDataSet = new DataSet();
			SqlDataAdapter oDataAdapter;

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetDocsByEntityTypeAndEntityID";
			oCmd.Parameters.AddWithValue("@EntityTypeID", nEntityTypeID);
			oCmd.Parameters.AddWithValue("@EntityID", nEntityID);

			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblDocuments");

			return oDataSet.Tables["tblDocuments"];
		}
		#endregion

		#region Format Entity Type
		public string FormatEntityType(int nEntityTypeID, int nEntityID)
		{
			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetEntityTypeByEntityTypeID";
			oCmd.Parameters.AddWithValue("@EntityTypeID", nEntityTypeID);
			string sEntityName = "";
			string sSQL = "";
			string sReturn = "";

			SqlDataReader oReader = oCmd.ExecuteReader();

			if (oReader.HasRows)
			{
				oReader.Read();
				sEntityName = oReader["EntityType"].ToString();

				sSQL =	"SELECT	" + oReader["EntityPKName"].ToString() + ", " +
						"		" + oReader["EntityDescName"].ToString() + " " +
						"FROM	" + oReader["EntityTableName"].ToString() + " " +
						"WHERE	" + oReader["EntityPKName"].ToString() + " = " + nEntityID;
			}

			oReader.Close();

			if (sSQL != "")
			{
				oCmd.CommandType = CommandType.Text;
				oCmd.CommandText = sSQL;

				oReader = oCmd.ExecuteReader();

				if (oReader.HasRows)
				{
					oReader.Read();
					sReturn = sEntityName + ": " + oReader[1].ToString();
				}
			}

			oReader.Close();

			return sReturn;
		}
		#endregion

		#region Can Action Be Scheduled
		public bool CanActionBeScheduled(int nActionID)
		{
			bool bReturn;

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spCanActionBeScheduled";
			oCmd.Parameters.AddWithValue("@ActionID", nActionID);
			oCmd.Parameters.AddWithValue("ReturnValue", SqlDbType.Int);

			oCmd.Parameters["ReturnValue"].Direction = ParameterDirection.ReturnValue;

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["ReturnValue"].Value.ToString() == "0")
				bReturn = false;
			else
				bReturn = true;

			return bReturn;
		}
		#endregion

		#region Can Action Be Copied
		public bool CanActionBeCopied(int nActionID)
		{
			bool bReturn;

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spCanActionBeCopied";
			oCmd.Parameters.AddWithValue("@ActionID", nActionID);
			oCmd.Parameters.AddWithValue("ReturnValue", SqlDbType.Int);

			oCmd.Parameters["ReturnValue"].Direction = ParameterDirection.ReturnValue;

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["ReturnValue"].Value.ToString() == "0")
				bReturn = false;
			else
				bReturn = true;

			return bReturn;
		}
		#endregion

		#region Get Screening Surveys by StudyID and PersonID
		public DataTable GetScreeningSurveysByStudyIDAndPersonID(int nStudyID, int nPersonID)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataAdapter oDataAdapter = new SqlDataAdapter(oCmd);
			DataSet oDataSet = new DataSet();

			oCmd.Connection = this.SqlConnection;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "usp_SSS_Get_Surveys_By_Person_ID_And_Study_ID";

			oCmd.Parameters.AddWithValue("@StudyID", nStudyID);
			oCmd.Parameters.AddWithValue("@PersonID", nPersonID);

			oDataAdapter.Fill(oDataSet, "tblSurveys");

			return oDataSet.Tables["tblSurveys"];
		}
		#endregion

		#region Get Household ID from Subject ID
		public int GetHouseholdIDBySubjID(int nSubjID)
		{
			SqlCommand oCmd = new SqlCommand();
			int nReturn = 0;

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "spGetHouseholdIDBySubjID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@SubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nSubjID));
			oCmd.Parameters.Add(new SqlParameter("@HouseholdID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@HouseholdID"].Value.ToString() != "")
				nReturn = Convert.ToInt32(oCmd.Parameters["@HouseholdID"].Value.ToString());

			return nReturn;
		}
		#endregion

		#region Get Table Name from Table ID
		public string GetTableNameByTableID(int nTableID)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "uwautism_research_data.dbo.spGetTableNameByTableID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@TableID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nTableID));
			oCmd.Parameters.Add(new SqlParameter("@TableName", SqlDbType.VarChar, 250, ParameterDirection.Output, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@TableName"].Value.ToString() != "")
				sReturn = oCmd.Parameters["@TableName"].Value.ToString();

			return sReturn;
		}
		#endregion

		#region Get Project Title from Project ID
		public string GetProjectTitleByProjectID(int nProjectID)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "uwautism_research_data.dbo.spGetProjectTitleByProjectID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@ProjectID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nProjectID));
			oCmd.Parameters.Add(new SqlParameter("@ProjectTitle", SqlDbType.VarChar, 250, ParameterDirection.Output, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@ProjectTitle"].Value.ToString() != "")
				sReturn = oCmd.Parameters["@ProjectTitle"].Value.ToString();

			return sReturn;
		}
		#endregion

		#region Get Project FolderName from Project ID
		public string GetProjectFolderNameByProjectID(int nProjectID)
		{
			SqlCommand oCmd = new SqlCommand();
			string sReturn = "";

			oCmd.Connection = oSqlConn;
			oCmd.CommandText = "uwautism_research_data.dbo.spGetProjectFolderNameByProjectID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@ProjectID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nProjectID));
			oCmd.Parameters.Add(new SqlParameter("@ProjectFolderName", SqlDbType.VarChar, 1000, ParameterDirection.Output, true, 0, 0 , "", DataRowVersion.Current, DBNull.Value));

			oCmd.ExecuteNonQuery();

			if (oCmd.Parameters["@ProjectFolderName"].Value.ToString() != "")
				sReturn = oCmd.Parameters["@ProjectFolderName"].Value.ToString();

			return sReturn;
		}
		#endregion
	}
}
