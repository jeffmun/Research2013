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
	public partial class AddConsentForm : System.Web.UI.Page
	{
		private DBLookup oDBLookup;
		private int nStudyID = 0;
		private int nSubjID = 0;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitAddConsentForm());";

			if (!IsPostBack)
			{
				oDBLookup = new DBLookup(Master.SqlConn);

				nStudyID = Convert.ToInt32(Request["StudyID"].ToString());
				hidStudyID.Value = nStudyID.ToString();
				nSubjID = Convert.ToInt32(Request["SubjID"].ToString());
				hidSubjID.Value = nSubjID.ToString();

				oDBLookup.BindDropDownList(ref selConsentFormVersionID, "EXEC spGetConsentFormsToAddBySubjID " + nSubjID.ToString(), "ConsentFormFullName", "ConsentFormVersionID", "", "--Select Consent Form Version--");
                oDBLookup.BindDropDownList(ref selConsentFormStatusID, "EXEC spGetAllConsentStatus", "ConsentStatus", "ConsentStatusID", "3", "--Select Consent Status--");
				oDBLookup.BindDropDownList(ref selActionID, "EXEC spGetActionsToMoveConsentsToBySubjID " + nSubjID.ToString(), "ActionTextActionType", "ActionID", "", "--Select an Action--");
			}
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			bool bDoRefresh = Convert.ToBoolean(Request["DoRefresh"]);

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spInsertConsentForm";

			oCmd.Parameters.AddWithValue("@ConsentFormVersionID", selConsentFormVersionID.SelectedValue);
			oCmd.Parameters.AddWithValue("@SubjID", hidSubjID.Value);
			oCmd.Parameters.AddWithValue("@DateSigned", txtDateSigned.Text);
            oCmd.Parameters.AddWithValue("@ConsentStatusID", selConsentFormStatusID.SelectedValue);
			oCmd.Parameters.AddWithValue("@Notes", txtNotes.Text);
			oCmd.Parameters.AddWithValue("@ActionID", selActionID.SelectedValue);
			oCmd.Parameters.AddWithValue("@SubjConsentID", DBNull.Value);

			if (oCmd.Parameters["@DateSigned"].Value.ToString() == "") {oCmd.Parameters["@DateSigned"].Value = DBNull.Value;}
			if (oCmd.Parameters["@Notes"].Value.ToString() == "") {oCmd.Parameters["@Notes"].Value = DBNull.Value;}
			if (oCmd.Parameters["@ActionID"].Value.ToString() == "-1") {oCmd.Parameters["@ActionID"].Value = DBNull.Value;}

			oCmd.ExecuteNonQuery();

			if (bDoRefresh)
				Response.Write("<script type=\"text/javascript\">window.opener.location.reload(true); window.close();</script>");
			else
				Response.Write("<script type=\"text/javascript\">window.close();</script>");
		}
		#endregion
	}
}
