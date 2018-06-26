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
	public partial class EditMultipleMeasures : System.Web.UI.Page
	{
		private string sStudyMeasSubjIDs;
		private int nActionID;
		private bool bDoRefresh;
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitMultipleMeasureStatus());";

			oDBLookup = new DBLookup(Master.SqlConn);

			sStudyMeasSubjIDs = Request["hidStudyMeasSubjIDs"];
			nActionID = Convert.ToInt32(Request["ActionID"]);
			bDoRefresh = Convert.ToBoolean(Request["DoRefresh"]);

			if (IsPostBack)
			{
				if (bDoRefresh)
					Response.Write("<script type=\"text/javascript\">window.opener.location.reload(true); window.close();</script>");
				else
					Response.Write("<script type=\"text/javascript\">window.close();</script>");
			}
			else
			{
				sStudyMeasSubjIDs = Request["StudyMeasSubjIDs"];
				hidStudyMeasSubjIDs.Value = sStudyMeasSubjIDs;
				string sStaffID = "";
				string sMeasStatusID = "";
				string sMeasStatusDetailID = "";
				string sDateDone = "";
				string sNotes = "";

				if (sStudyMeasSubjIDs.Split(',').Length == 1)
				{
					SqlDataReader oReader = GetMeasureDetails(Convert.ToInt32(sStudyMeasSubjIDs));

					oReader.Read();

					sStaffID = oReader["StaffID_MeasCompBy"].ToString();
					sMeasStatusID = oReader["MeasStatusID"].ToString();
					sMeasStatusDetailID = oReader["MeasStatusDetailID"].ToString();
					sDateDone = oReader["MeasureDateDone"].ToString();
					sNotes = oReader["StudyMeasSubjNotes"].ToString();
					hidDoRefresh.Value = bDoRefresh.ToString();

					oReader.Close();
				}

				oDBLookup.BindDropDownList(ref selStatus, "EXEC spGetAllMeasureStatuses", "MeasStatus", "MeasStatusID", sMeasStatusID, "--Select Status--");

                if (sMeasStatusID != "")
                    oDBLookup.BindDropDownList(ref selStatusDetail, "EXEC spGetMeasureStatusDetails", "MeasStatusDetail", "MeasStatusDetailID", sMeasStatusDetailID, "--Select Status Detail--");
                else
                    oDBLookup.BindDropDownList(ref selStatusDetail, "EXEC spGetMeasureStatusDetails", "MeasStatusDetail", "MeasStatusDetailID", "", "--Select Status Detail--");
/*
				if (sMeasStatusID != "")
					oDBLookup.BindDropDownList(ref selStatusDetail, "EXEC spGetMeasureStatusDetailsByMeasStatusID @MeasStatusID = " + sMeasStatusID, "MeasStatusDetail", "MeasStatusDetailID", sMeasStatusDetailID, "--Select Status Detail--");
				else
					oDBLookup.BindDropDownList(ref selStatusDetail, "EXEC spGetMeasureStatusDetailsByMeasStatusID @MeasStatusID = NULL", "MeasStatusDetail", "MeasStatusDetailID", "", "--Select Status Detail--");
*/
				oDBLookup.BindDropDownList(ref selCompBy, "EXEC spGetAllStaff", "StaffShortName", "StaffID", sStaffID, "--Select Staff--");

				txtDateDone.Text = sDateDone;
				txtNotes.Text = sNotes;

                //DF: 4/13
                selStatus.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, -1, 'measurestatus', 'selStatusDetail');";
                //selStatus.Attributes["onchange"] = "DoSyncDropDowns(this.options[this.selectedIndex].value, -1, 'measures', 'selStatusDetail');";
			}
		}

		#region Update Measures
		protected void SaveChanges(object sender, EventArgs e)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spUpdateMultipleStudyMeasSubjStatuses";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@StudyMeasSubjIDs", hidStudyMeasSubjIDs.Value);
			oCmd.Parameters.AddWithValue("@CompByStaffID", selCompBy.SelectedValue);
			oCmd.Parameters.AddWithValue("@MeasStatusID", selStatus.SelectedValue);
			oCmd.Parameters.AddWithValue("@MeasStatusDetailID", selStatusDetail.SelectedValue);
			oCmd.Parameters.AddWithValue("@DateDone", txtDateDone.Text);
			oCmd.Parameters.AddWithValue("@NoDataFlag", false);
			oCmd.Parameters.AddWithValue("@MissingFormFlag", false);
			oCmd.Parameters.AddWithValue("@Notes", txtNotes.Text);

			if (oCmd.Parameters["@CompByStaffID"].Value.ToString() == "-1") { oCmd.Parameters["@CompByStaffID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@MeasStatusID"].Value.ToString() == "-1") { oCmd.Parameters["@MeasStatusID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@MeasStatusDetailID"].Value.ToString() == "-1") { oCmd.Parameters["@MeasStatusDetailID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@DateDone"].Value.ToString().Trim() == "") { oCmd.Parameters["@DateDone"].Value = DBNull.Value; }
			if (oCmd.Parameters["@Notes"].Value.ToString().Trim() == "") { oCmd.Parameters["@Notes"].Value = DBNull.Value; }

			oCmd.ExecuteNonQuery();
		}
		#endregion

		#region Get Measure Details
		private SqlDataReader GetMeasureDetails(int nStudyMeasSubjID)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spGetStudyMeasSubjDetails";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@StudyMeasSubjID", nStudyMeasSubjID);

			oReader = oCmd.ExecuteReader();

			return oReader;
		}
		#endregion
	}
}