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
	public partial class EditMeasureActionAssignments : System.Web.UI.Page
	{
		private DBLookup oDBLookup;
		private int nStudyID;

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
				Form.Attributes["onsubmit"] = "return(DoSubmitEditMeasureActionAssignments(event, false));";

				nStudyID = Convert.ToInt32(Request["StudyID"].ToString());
				hidStudyID.Value = nStudyID.ToString();

				GetMeasureActionAssignments();
			}
			else
				nStudyID = Convert.ToInt32(hidStudyID.Value);

			//btnReturn.Attributes["onclick"] = "document.location = '/StudyDesign/EditStudyActions.aspx?StudyID=" + nStudyID.ToString() + "';";
		}

		#region Get the Measure/Action Assignments
		private void GetMeasureActionAssignments()
		{
			string sStudyName = oDBLookup.GetStudyName(nStudyID, false);
			HtmlTableRow oTr;
			HtmlTableCell oTd;

			tdTitle.InnerHtml += " - " + sStudyName;

			oDBLookup = new DBLookup();

			if (oDBLookup.IsStudyCounterBalanced(nStudyID))
				Response.Redirect("EditCounterbalanceOrder.aspx?StudyID=" + nStudyID.ToString(), true);

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetStudyMeasGroupsByStudyID";
			oCmd.Parameters.Add(new SqlParameter("@StudyID", nStudyID));

			SqlDataReader oReader = oCmd.ExecuteReader();

			while (oReader.Read())
			{
				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oReader["StudyMeasName"].ToString() + " (" + oReader["GroupName"].ToString() + ")";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oDBLookup.BindDropDownList("selStudyActionGroupID", "EXEC spGetStudyActionGroupsByStudyID " + nStudyID.ToString(), "StudyActionGroup", "StudyActionGroupID", oReader["StudyActionGroupID"].ToString(), "--Select Study Action Group--", "");
				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidStudyMeasGroupID\" value=\"" + oReader["StudyMeasGroupID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);
			}

			oReader.Close();
		}
		#endregion

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			SqlCommand oCmd = new SqlCommand();
			string[] aStudyMeasGroupIDs = Request["hidStudyMeasGroupID"].ToString().Replace(", ", ",").Split(',');
			string[] aStudyActionGroupIDs = Request["selStudyActionGroupID"].ToString().Replace(", ", ",").Split(',');
			int nStudyID = Convert.ToInt32(hidStudyID.Value);

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.CommandText = "spDeleteMeasureActionAssignmentsByStudyID";
			oCmd.Parameters.Add(new SqlParameter("@StudyID", nStudyID));
			oCmd.ExecuteNonQuery();
			oCmd.Parameters.Clear();

			oCmd.CommandText = "spInsertMeasureActionAssignment";
			oCmd.Parameters.Add(new SqlParameter("@StudyActionGroupID", SqlDbType.Int, 4));
			oCmd.Parameters.Add(new SqlParameter("@StudyMeasGroupID", SqlDbType.Int, 4));

			for (int i=0;i<aStudyMeasGroupIDs.Length;i++)
			{
				oCmd.Parameters["@StudyActionGroupID"].Value = aStudyActionGroupIDs[i];
				oCmd.Parameters["@StudyMeasGroupID"].Value = aStudyMeasGroupIDs[i];

				if (oCmd.Parameters["@StudyActionGroupID"].Value.ToString() == "" || oCmd.Parameters["@StudyActionGroupID"].Value.ToString() == "-1") {oCmd.Parameters["@StudyActionGroupID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@StudyMeasGroupID"].Value.ToString() == "" || oCmd.Parameters["@StudyMeasGroupID"].Value.ToString() == "-1") {oCmd.Parameters["@StudyMeasGroupID"].Value = DBNull.Value;}

				oCmd.ExecuteNonQuery();
			}

			GetMeasureActionAssignments();
		}
		#endregion
	}
}