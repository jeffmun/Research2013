using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using AutismCenterBase.Utilities;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Measures_ChangeMeasActionAssignments : System.Web.UI.Page
{


    private ReadConfig oConfig = new ReadConfig();
    private SqlConnection oConn = new SqlConnection();
    private DBLookup oDBLookup;

    private void Page_Load(object sender, System.EventArgs e)
    {
        oConn.ConnectionString = WebConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ConnectionString;
        oConn.Open();

        oDBLookup = new DBLookup(oConn);

        int nStudyMeasSubjID = Convert.ToInt32(Request["StudyMeasSubjID"].ToString());
        SqlDataReader oReader;
        int nSubjID = 0;
        int nActionID = 0;
        int nCurrentActionID = oDBLookup.GetActionIDByStudyMeasSubjID(nStudyMeasSubjID);
        string sMeasure = "";
        string sID = "";
        string sStudyName = "";

        btnReturn.Attributes["onclick"] = "document.location = '" + Request.ApplicationPath + "/measures/EditMeasure.aspx?StudyMeasSubjID=" + nStudyMeasSubjID.ToString() + "';";
        hidStudyMeasSubjID.Value = nStudyMeasSubjID.ToString();

        if (IsPostBack)
        {
            //nStudyMeasSubjID = Convert.ToInt32(Request["hidStudyMeasSubjID"].ToString());
            nStudyMeasSubjID = Convert.ToInt32(hidStudyMeasSubjID.Value);

            //nActionID = Convert.ToInt32(Request["selActionID"].ToString());
            nActionID = Convert.ToInt32(selActionID.SelectedValue);

            UpdateMeasureActionAssignment(nStudyMeasSubjID, nActionID, nCurrentActionID, oConn);

            tdMessage.Style["color"] = "#009900";
            tdMessage.InnerHtml = "Your changes have been saved.";
        }

        oReader = GetMeasureDetails(nStudyMeasSubjID, oConn);

        if (oReader.Read())
        {
            if (oReader["ActionID"].ToString() != "")
                nActionID = Convert.ToInt32(oReader["ActionID"].ToString());
            else
                nActionID = 0;

            nSubjID = Convert.ToInt32(oReader["SubjID"].ToString());
            sMeasure = oReader["MeasName"].ToString();
            sID = oReader["ID"].ToString();
            sStudyName = oReader["StudyName"].ToString();

            if (!IsPostBack)
                tdTitle.InnerHtml += " - " + sMeasure + " (" + sStudyName + " - " + sID + ")";

            oReader.Close();
        }

        if (selActionID.Items.Count == 0)
            oDBLookup.BindDropDownList(ref selActionID, "EXEC spGetActionsToMoveMeasuresToBySubjID " + nSubjID.ToString() + ", " + nCurrentActionID.ToString(), "ActionTextActionType", "ActionID", nActionID.ToString(), "--Select an Action--");

        oConn.Close();
    }

    #region Get Measure Details
    private SqlDataReader GetMeasureDetails(int nStudyMeasSubjID, SqlConnection oConn)
    {
        SqlCommand oCmd = new SqlCommand();
        SqlDataReader oReader;

        oCmd.Connection = oConn;
        oCmd.CommandText = "spGetStudyMeasSubjDetails";
        oCmd.CommandTimeout = 90;
        oCmd.CommandType = CommandType.StoredProcedure;

        oCmd.Parameters.Add(new SqlParameter("@StudyMeasSubjID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStudyMeasSubjID));

        oReader = oCmd.ExecuteReader();

        return oReader;
    }
    #endregion

    #region Update Measure/Action Assignment
    private void UpdateMeasureActionAssignment(int nStudyMeasSubjID, int nActionID, int nCurrentActionID, SqlConnection oConn)
    {
        SqlCommand oCmd = new SqlCommand();

        oCmd.Connection = oConn;
        oCmd.CommandTimeout = 90;
        oCmd.CommandType = CommandType.StoredProcedure;
        oCmd.CommandText = "spUpdateMeasureToActionAssignment";

        oCmd.Parameters.Add(new SqlParameter("@StudyMeasSubjID", SqlDbType.VarChar, 2000, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nStudyMeasSubjID.ToString()));
        oCmd.Parameters.Add(new SqlParameter("@ActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nActionID));
        oCmd.Parameters.Add(new SqlParameter("@CurrentActionID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nCurrentActionID));

        oCmd.ExecuteNonQuery();
    }
    #endregion

}
