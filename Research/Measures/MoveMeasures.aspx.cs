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

namespace Measures
{
	public partial class MoveMeasures : System.Web.UI.Page
	{
		private int nActionID;
		private int nSubjID;
		private string sStudyMeasSubjIDs;
		private bool bDoRefresh;
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitMoveMeasures());";

			oDBLookup = new DBLookup(Master.SqlConn);

			nActionID = Convert.ToInt32(Request["ActionID"].ToString());
			nSubjID = oDBLookup.GetSubjectIDFromActionID(nActionID);
			sStudyMeasSubjIDs = Request["StudyMeasSubjIDs"].ToString();
			bDoRefresh = Convert.ToBoolean(Request["DoRefresh"]);

			hidStudyMeasSubjIDs.Value = sStudyMeasSubjIDs;

			if (!IsPostBack)
				oDBLookup.BindDropDownList(ref selActionID, "EXEC spGetActionsToMoveMeasuresToBySubjID " + nSubjID.ToString() + ", " + nActionID.ToString(), "ActionTextActionType", "ActionID", nActionID.ToString(), "--Select an Action--");
		}

		protected void SaveChanges(object sender, EventArgs e)
		{
			if (nActionID.ToString() != selActionID.SelectedValue)
			{
				int nCurrentActionID = nActionID;
				nActionID = Convert.ToInt32(selActionID.SelectedValue);
				SqlCommand oCmd = new SqlCommand();

				oCmd.Connection = Master.SqlConn;
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;
				oCmd.CommandText = "spUpdateMeasureToActionAssignment";

				oCmd.Parameters.AddWithValue("@StudyMeasSubjID", sStudyMeasSubjIDs);
				oCmd.Parameters.AddWithValue("@ActionID", nActionID);
				oCmd.Parameters.AddWithValue("@CurrentActionID", nCurrentActionID);

				oCmd.ExecuteNonQuery();

				if (bDoRefresh)
					Response.Write("<script type=\"text/javascript\">window.opener.location.reload(true); window.close();</script>");
				else
					Response.Write("<script type=\"text/javascript\">window.close();</script>");
			}
			else
			{
				tdErrors.Style["display"] = "";
				tdErrors.Style["color"] = "#ff0000";
				tdErrors.InnerHtml = "You are not allowed to move these Measures to the same Action they already belong to.";
			}
		}
	}
}
