using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
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
	public partial class EditPedigree : System.Web.UI.Page
	{
		private TextFormatter oFormat = new TextFormatter();
		private ReadConfig oConfig = new ReadConfig();
		private SqlConnection oConnData = new SqlConnection();
		private DBLookup oDBLookup;
		private int nHouseholdID;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if (!IsPostBack)
			{
				nHouseholdID = Convert.ToInt32(Request["HouseholdID"].ToString());
				hidHouseholdID.Value = nHouseholdID.ToString();

				DisplayHousehold(nHouseholdID);
			}
		}

		protected void ReturnToHousehold(object sender, System.EventArgs e)
		{
            //DF: 4/12 add app path
			Response.Redirect(Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + hidHouseholdID.Value);
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			nHouseholdID = Convert.ToInt32(hidHouseholdID.Value);
			string[] aPersonIDs = Request["hidPersonID"].ToString().Replace(", ", ",").Split(',');
			string[] aBloodIDs = Request["txtBloodID"].ToString().Replace(", ", ",").Split(',');
			string[] aPedigrees = Request["txtPedigree"].ToString().Replace(", ", ",").Split(',');
			string[] aBloodSourceIDs = Request["selBloodSourceID"].ToString().Replace(", ", ",").Split(',');

			oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();
			oConnData.Open();

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = oConnData;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spUpdatePedigree";

			oCmd.Parameters.Add("@PersonID", SqlDbType.Int, 4);
			oCmd.Parameters.Add("@BloodID", SqlDbType.VarChar, 12);
			oCmd.Parameters.Add("@Pedigree", SqlDbType.VarChar, 5);
			oCmd.Parameters.Add("@BloodSourceID", SqlDbType.Int, 4);
			oCmd.Parameters.Add("@VerboseError", SqlDbType.VarChar, 500);
			
			oCmd.Parameters["@VerboseError"].Direction = ParameterDirection.Output;

			for (int i=0;i<aPersonIDs.Length;i++)
			{
				oCmd.Parameters["@PersonID"].Value = aPersonIDs[i];
				oCmd.Parameters["@BloodID"].Value = aBloodIDs[i];
				oCmd.Parameters["@Pedigree"].Value = aPedigrees[i];
				oCmd.Parameters["@BloodSourceID"].Value = aBloodSourceIDs[i];
				oCmd.Parameters["@VerboseError"].Value = DBNull.Value;

				if (oCmd.Parameters["@BloodID"].Value.ToString().Trim() == "") {oCmd.Parameters["@BloodID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@Pedigree"].Value.ToString().Trim() == "") {oCmd.Parameters["@Pedigree"].Value = DBNull.Value;}
				if (oCmd.Parameters["@BloodSourceID"].Value.ToString().Trim() == "" || oCmd.Parameters["@BloodSourceID"].Value.ToString() == "-1") {oCmd.Parameters["@BloodSourceID"].Value = DBNull.Value;}

				oCmd.ExecuteNonQuery();

				if (oCmd.Parameters["@VerboseError"].Value.ToString() != "")
				{
					tdError.Style["display"] = "inline";
					tdError.Style["padding"] = "8px";
					tdError.InnerHtml += oCmd.Parameters["@VerboseError"].Value.ToString() + "<br/>";
				}
			}

			oConnData.Close();

			DisplayHousehold(nHouseholdID);
		}
		#endregion

		#region Display the Household Form
		private void DisplayHousehold(int nHouseholdID)
		{
			oDBLookup = new DBLookup();
		
			HtmlTableRow oTr;
			HtmlTableCell oTd;

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetPedigreeByHouseholdID";
			oCmd.Parameters.AddWithValue("@HouseholdID", nHouseholdID);

			SqlDataReader oReader = oCmd.ExecuteReader();

			if (oReader.HasRows)
			{
				while (oReader.Read())
				{
					oTr = new HtmlTableRow();

					oTd = new HtmlTableCell();
					oTd.Style["border-bottom"] = "solid 1px #26044a";
					oTd.InnerHtml = oFormat.FormatDBOutput(oReader["FullName"].ToString());
					oTd.InnerHtml += " (" + oFormat.FormatDBOutput(oReader["ID"].ToString());
					if (oReader["PersonRole"].ToString() != "") {oTd.InnerHtml += "/" + oFormat.FormatDBOutput(oReader["PersonRole"].ToString());}
					oTd.InnerHtml += ")";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["border-bottom"] = "solid 1px #26044a";
					oTd.InnerHtml += "<input type=\"text\" name=\"txtBloodID\" id=\"txtBloodID" + oReader["BloodID"].ToString() + "\" value=\"" + oReader["BloodID"].ToString() + "\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["border-bottom"] = "solid 1px #26044a";
					oTd.InnerHtml += "<input type=\"text\" name=\"txtPedigree\" id=\"txtPedigree" + oReader["PersonID"].ToString() + "\" value=\"" + oReader["Pedigree"].ToString() + "\" />";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.Style["border-bottom"] = "solid 1px #26044a";
					oTd.InnerHtml += oDBLookup.BindDropDownList("selBloodSourceID", Convert.ToInt32(oReader["PersonID"]), "EXEC spGetBloodSources", "BloodSource", "BloodSourceID", oReader["BloodSourceID"].ToString(), "--Select Blood Source--", "width: 200px;");
					oTd.InnerHtml += "<input type=\"hidden\" name=\"hidPersonID\" value=\"" + oReader["PersonID"].ToString() + "\" />";
					oTr.Cells.Add(oTd);

					tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);
				}
			}
			else
			{
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "No one in this household is not enrolled in the Family Study of Autism. ";
				oTd.InnerHtml += "This page is only intended for subjects with at least one family member enrolled in that study.";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);

				btnReturn.Style["display"] = "none";
				btnSaveChanges.Style["display"] = "none";
			}

			oReader.Close();
		}
		#endregion
	}
}
