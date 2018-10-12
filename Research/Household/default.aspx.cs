using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;
using uwac;

namespace Household
{
	public partial class _default : BasePage //System.Web.UI.Page
	{
		private TextFormatter oFormatter = new TextFormatter();
		private ReadConfig oConfig = new ReadConfig();
		private DataTable oTable;
		private DBLookup oDBLookup;
		private int nHouseholdID;
		private bool bDoDark = false;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitSearchHouseholds2());";
			oDBLookup = new DBLookup(Master.SqlConn);

			lblNoResults.Text = "";

			if (IsPostBack)
			{
				string sLastName = txtLastName.Text;
				string sFirstName = txtFirstName.Text;
				string sID = txtSubjectID.Text;
				int nStudyID = Convert.ToInt32(selStudyID.SelectedValue);
				string sSex = selSex.SelectedValue;
				int nEthnicityID = Convert.ToInt32(selEthnicity.SelectedValue);
				string sState = selState.SelectedValue;
				string sCity = txtCity.Text;
				string sPhone = txtPhone.Text;

				nHouseholdID = 0;
//				HtmlTableRow oTr;
//				HtmlTableCell oTd;

				oTable = GetResults(sLastName, sFirstName, sID, nStudyID, sSex, nEthnicityID, sState, sCity, sPhone);

				if (oTable.Rows.Count > 0)
				{
					tblInput.Style["display"] = "none";
					tblResults.Style["display"] = "inline";

					tblResults.DataSource = oTable;
					tblResults.DataBind();

					lblNoResults.Text = "";
				}
				else
				{
					lblNoResults.Text = "  ** No matching results **";
				}
			}
			else
			{
				//oDBLookup.BindDropDownList(ref selEthnicity, "EXEC spGetEthnicities", "EthnicityDesc", "EthnicityID", "", "--Select Ethnicity--");
				//oDBLookup.BindDropDownList(ref selStudyID, "EXEC spSEC_GetStudies_CanView_by_User__Short_and_FullName", "StudyName", "StudyID", "", "--Select a Study--");
				//oDBLookup.BindDropDownList(ref selState, "EXEC spGetStates", "State", "State", "", "--Select State--");

				SQL_utils sql = new SQL_utils("backend");

				string sql_study = "Select -1 StudyID,  '--Select Study--' StudyName  UNION Select StudyID, StudyName from tblstudy order by studyID";

				//DataTable dt_study = sql.DataTable_from_ProcName("spSEC_GetStudies_CanView_by_User__Short_and_FullName");
				DataTable dt_study = sql.DataTable_from_SQLstring(sql_study);
				selStudyID.DataSource = dt_study;
				selStudyID.DataTextField = "StudyName";
				selStudyID.DataValueField = "StudyID";
				selStudyID.DataBind();



				string sql_state = "Select '  --Select Locale--' State UNION SELECT DISTINCT State from uwautism_research_backend.dbo.tblAddress WHERE  LTRIM(RTRIM(State)) != '' ORDER BY State ASC ";

				DataTable dt_state = sql.DataTable_from_SQLstring(sql_state);
				selState.DataSource = dt_state;
				selState.DataTextField = "State";
				selState.DataValueField = "State";
				selState.DataBind();


				string sql_eth = "select -1 EthnicityID, '--Select Ethnicity--' EthnicityDesc, 0 sortorder union SELECT EthnicityID, EthnicityDesc, sortorder from uwautism_research_backend.dbo.tblEthnicity ORDER BY SortOrder";


		   DataTable dt_eth = sql.DataTable_from_SQLstring(sql_eth);
				selEthnicity.DataSource = dt_eth;
				selEthnicity.DataTextField = "EthnicityDesc";
				selEthnicity.DataValueField = "EthnicityID";
				selEthnicity.DataBind();



			}
		}

		#region Get Search Results
		private DataTable GetResults(string sLastName, string sFirstName, string sID, int nStudyID, string sSex, int nEthnicityID, string sState, string sCity, string sPhone)
		{
			//SqlCommand oCmd = new SqlCommand();
			//SqlDataAdapter oAdapter = new SqlDataAdapter(oCmd);
			//DataTable tblReturn = new DataTable();

			//oCmd.Connection = Master.SqlConn;
			//oCmd.CommandText = "spSEC_SearchHouseholds_2";
			//oCmd.CommandTimeout = 90;
			//oCmd.CommandType = CommandType.StoredProcedure;

			//oCmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sLastName));
			//oCmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sFirstName));
			//oCmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sID));
			//oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, nStudyID));
			//oCmd.Parameters.Add(new SqlParameter("@Sex", SqlDbType.Char, 1, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sSex));
			//oCmd.Parameters.Add(new SqlParameter("@EthnicityID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, nEthnicityID));
			//oCmd.Parameters.Add(new SqlParameter("@State", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sState));
			//oCmd.Parameters.Add(new SqlParameter("@City", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sCity));
			//oCmd.Parameters.Add(new SqlParameter("@Phone", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sPhone));


			//if (sLastName == "" || sLastName == null) {oCmd.Parameters["@LastName"].Value = DBNull.Value;}
			//if (sFirstName == "" || sFirstName == null) {oCmd.Parameters["@FirstName"].Value = DBNull.Value;}
			//if (sID == "" || sID == null) {oCmd.Parameters["@ID"].Value = DBNull.Value;}
			//if (nStudyID < 0) {oCmd.Parameters["@StudyID"].Value = DBNull.Value;}
			//if (sSex == "-1" || sSex == "" || sSex == null) {oCmd.Parameters["@Sex"].Value = DBNull.Value;}
			//if (nEthnicityID < 0) {oCmd.Parameters["@EthnicityID"].Value = DBNull.Value;}
			//if (sState == "-1" || sState == "" || sState == null) {oCmd.Parameters["@State"].Value = DBNull.Value;}
			//if (sCity == "" || sCity == null) {oCmd.Parameters["@City"].Value = DBNull.Value;}

			//if (sPhone == "" || sPhone == null) { oCmd.Parameters["@Phone"].Value = DBNull.Value; }


			//oAdapter.Fill(tblReturn);

			//return tblReturn;


			SQL_utils sql = new SQL_utils("backend");

			List<SqlParameter> ps = new List<SqlParameter>();

			int studyID = Convert.ToInt32(selStudyID.SelectedValue);


			SqlParameter p1 = (new SqlParameter("@LastName", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sLastName));
			SqlParameter p2 = (new SqlParameter("@FirstName", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sFirstName));
			SqlParameter p3 = (new SqlParameter("@ID", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sID));
			SqlParameter p4 = (new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, studyID));
			SqlParameter p5 = (new SqlParameter("@Sex", SqlDbType.Char, 1, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sSex));
			SqlParameter p6 = (new SqlParameter("@EthnicityID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nEthnicityID));
			SqlParameter p7 = (new SqlParameter("@State", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sState));
			SqlParameter p8 = (new SqlParameter("@City", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sCity));
			SqlParameter p9 = (new SqlParameter("@Phone", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sPhone));

			if (sLastName == "" || sLastName == null) {p1.Value = DBNull.Value; }
			if (sFirstName == "" || sFirstName == null) { p2.Value = DBNull.Value; }
			if (sID == "" || sID == null) { p3.Value = DBNull.Value; }
			if (studyID < 0) { p4.Value = DBNull.Value; }
			if (sSex == "-1" || sSex == "0" || sSex == "" || sSex == null) { p5.Value = DBNull.Value; }
			if (nEthnicityID <= 0) { p6.Value = DBNull.Value; }
			if (sState == "-1" || sState == "" || sState == null || sState == "  --Select Locale--") { p7.Value = DBNull.Value; }
			if (sCity == "" || sCity == null) { p8.Value = DBNull.Value; }
			if (sPhone == "" || sPhone == null) { p9.Value = DBNull.Value; }


			ps.Add(p1);
			ps.Add(p2);
			ps.Add(p3);
			ps.Add(p4);
			ps.Add(p5);
			ps.Add(p6);
			ps.Add(p7);
			ps.Add(p8);
			ps.Add(p9);

			foreach(SqlParameter p in ps)
			{
				Debug.WriteLine(String.Format("{0} [{1}]", p.ParameterName,p.Value.ToString()));
			}

			DataTable dt = sql.DataTable_from_ProcName("spSEC_SearchHouseholds_2", ps);

			return dt;
		}
		#endregion

		protected void Item_Bound(object sender, DataGridItemEventArgs e)
		{
			e.Item.Attributes["onclick"] = "HighlightRow(this);";

			if (e.Item.DataSetIndex >= 0)
			{
				if (nHouseholdID != Convert.ToInt32(oTable.Rows[e.Item.DataSetIndex]["HouseholdID"].ToString()))
				{
					nHouseholdID = Convert.ToInt32(oTable.Rows[e.Item.DataSetIndex]["HouseholdID"].ToString());
					bDoDark =!bDoDark;
				}
			}

			if (bDoDark) { e.Item.Attributes["class"] = "trDark"; }
		}

		protected void btnCreateNewHousehold_OnClick(object sender, EventArgs e)
		{
			Response.Redirect("~/Tracking/CreateHousehold.aspx");
		}

	}
}
