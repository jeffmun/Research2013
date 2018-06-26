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

namespace StudyDesign
{
	public partial class EditConsentAssignments : System.Web.UI.Page
	{
		private DBLookup oDBLookup;
		private int nStudyID;
		private bool bIsFamilyStudy = false;

		private void Page_Load(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup();

			if (!Master.AutismLogin.CheckGroupPermissions("IT Staff Group".Split(',')))
			{
				tblMaster.Rows.Clear();
				tblMaster.Attributes["class"] = "";

				HtmlTableRow oTr = new HtmlTableRow();
				HtmlTableCell oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "error";
				oTd.InnerHtml = "You do not have permission to view this page.";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
			}
			else if (!IsPostBack)
			{
				Form.Attributes["onsubmit"] = "return(DoSubmitEditConsentActionAssignments(event));";

				nStudyID = Convert.ToInt32(Request["StudyID"].ToString());
				string sStudyName = oDBLookup.GetStudyName(nStudyID, false);

				tdTitle.InnerHtml += " - " + sStudyName;

				GetConsentActionAssignments();
			}
			else
				nStudyID = Convert.ToInt32(hidStudyID.Value);

			hidStudyID.Value = nStudyID.ToString();
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			string[] aStudyActionGroupIDs = Request["selStudyActionGroupID"].ToString().Replace(", ", ",").Split(',');
			string[] aConsentFormGroupIDs = Request["hidConsentFormGroupID"].ToString().Replace(", ", ",").Split(',');
			nStudyID = Convert.ToInt32(Request["StudyID"].ToString());

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.CommandText = "spDeleteConsentActionAssignmentsByStudyID";
			oCmd.Parameters.AddWithValue("@StudyID", nStudyID);

			oCmd.ExecuteNonQuery();
			oCmd.Parameters.Clear();

			oCmd.CommandText = "spInsertConsentActionAssignment";
			oCmd.Parameters.Add("@StudyActionGroupID", SqlDbType.Int, 4);
			oCmd.Parameters.Add("@ConsentFormGroupID", SqlDbType.Int, 4);

			for (int i=0;i<aStudyActionGroupIDs.Length;i++)
			{
				if (aStudyActionGroupIDs[i] != "-1")
				{
					oCmd.Parameters["@StudyActionGroupID"].Value = aStudyActionGroupIDs[i];
					oCmd.Parameters["@ConsentFormGroupID"].Value = aConsentFormGroupIDs[i];

					oCmd.ExecuteNonQuery();
				}
			}

			GetConsentActionAssignments();
		}
		#endregion

		#region Get Consent Action Assignments
		private void GetConsentActionAssignments()
		{
			bIsFamilyStudy = oDBLookup.IsFamilyStudy(nStudyID);
			HtmlTableRow oTr;
			HtmlTableCell oTd;

			oDBLookup = new DBLookup();

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetConsentFormGroupsByStudyID";
			oCmd.Parameters.Add(new SqlParameter("@StudyID", nStudyID));

			SqlDataReader oReader = oCmd.ExecuteReader();

			while (oReader.Read())
			{
				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oReader["ConsentFormName"].ToString() + "(" + oReader["GroupName"].ToString() + ")";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();

				if (bIsFamilyStudy)
					oTd.InnerHtml = oDBLookup.BindDropDownList("selStudyActionGroupID", "EXEC spGetStudyActionGroupsByStudyID " + nStudyID.ToString(), "ActionGroupTextAndType", "StudyActionGroupID", oReader["StudyActionGroupID"].ToString(), "--Select Study Action--", "width: 300px;");
				else
					oTd.InnerHtml = oDBLookup.BindDropDownList("selStudyActionGroupID", "EXEC spGetStudyActionsByStudyIDAndGroupID " + nStudyID.ToString() + ", " + oReader["GroupID"].ToString(), "ActionTextAndType", "StudyActionGroupID", oReader["StudyActionGroupID"].ToString(), "--Select Study Action--", "width: 300px;");

				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidConsentFormGroupID\" value=\"" + oReader["ConsentFormGroupID"].ToString() + "\" />";

				oTr.Cells.Add(oTd);

				tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);
			}

			oReader.Close();
		}
		#endregion
	}
}