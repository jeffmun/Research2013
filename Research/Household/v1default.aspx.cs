using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;

namespace Household
{
	public partial class _default : System.Web.UI.Page
	{
		private TextFormatter oFormatter = new TextFormatter();
		private ReadConfig oConfig = new ReadConfig();
		private DataTable oTable;
		private DBLookup oDBLookup;
		private int nHouseholdID;
		private bool bDoDark = false;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitSearchHouseholds());";
			oDBLookup = new DBLookup(Master.SqlConn);

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
				nHouseholdID = 0;
//				HtmlTableRow oTr;
//				HtmlTableCell oTd;

				oTable = GetResults(sLastName, sFirstName, sID, nStudyID, sSex, nEthnicityID, sState, sCity);

				if (oTable.Rows.Count > 0)
				{
					tblInput.Style["display"] = "none";
					tblResults.Style["display"] = "inline";

					tblResults.DataSource = oTable;
					tblResults.DataBind();
				}
			}
			else
			{
				oDBLookup.BindDropDownList(ref selEthnicity, "EXEC spGetEthnicities", "EthnicityDesc", "EthnicityID", "", "--Select Ethnicity--");
                oDBLookup.BindDropDownList(ref selStudyID, "EXEC spGetStudies_CanView_by_User__Short_and_FullName", "StudyName", "StudyID", "", "--Select a Study--");
				oDBLookup.BindDropDownList(ref selState, "EXEC spGetStates", "State", "State", "", "--Select State--");
			}
		}

		#region Get Search Results
		private DataTable GetResults(string sLastName, string sFirstName, string sID, int nStudyID, string sSex, int nEthnicityID, string sState, string sCity)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataAdapter oAdapter = new SqlDataAdapter(oCmd);
			DataTable tblReturn = new DataTable();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spSearchHouseholds";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sLastName));
			oCmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sFirstName));
			oCmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, nStudyID));
			oCmd.Parameters.Add(new SqlParameter("@Sex", SqlDbType.Char, 1, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sSex));
			oCmd.Parameters.Add(new SqlParameter("@EthnicityID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, nEthnicityID));
			oCmd.Parameters.Add(new SqlParameter("@State", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sState));
			oCmd.Parameters.Add(new SqlParameter("@City", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sCity));

			if (sLastName == "" || sLastName == null) {oCmd.Parameters["@LastName"].Value = DBNull.Value;}
			if (sFirstName == "" || sFirstName == null) {oCmd.Parameters["@FirstName"].Value = DBNull.Value;}
			if (sID == "" || sID == null) {oCmd.Parameters["@ID"].Value = DBNull.Value;}
			if (nStudyID < 0) {oCmd.Parameters["@StudyID"].Value = DBNull.Value;}
			if (sSex == "-1" || sSex == "" || sSex == null) {oCmd.Parameters["@Sex"].Value = DBNull.Value;}
			if (nEthnicityID < 0) {oCmd.Parameters["@EthnicityID"].Value = DBNull.Value;}
			if (sState == "-1" || sState == "" || sState == null) {oCmd.Parameters["@State"].Value = DBNull.Value;}
			if (sCity == "" || sCity == null) {oCmd.Parameters["@City"].Value = DBNull.Value;}

			oAdapter.Fill(tblReturn);

			return tblReturn;
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
	}
}
