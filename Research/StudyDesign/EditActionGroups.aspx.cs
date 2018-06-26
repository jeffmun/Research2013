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

public partial class StudyDesign_EditActionGroups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
        else
        {
            Form.Attributes["onsubmit"] = "return(DoSubmitEditActionGroups(event));";
            if (!IsPostBack)
                GetActionGroups();
        }

    }

	#region Save Changes
    protected void SaveChanges(object sender, System.EventArgs e)
    {
        int nStudyID = Convert.ToInt32(hidStudyID.Value.ToString());

        string[] sStudyActionGroupID = Request["hidStudyActionGroupID"].ToString().Replace(", ", ",").Split(',');
        string[] sMosFromStart = Request["txtmos_from_start"].ToString().Replace(", ", ",").Split(',');
        string[] sLengthHrs = Request["txtlength_hrs"].ToString().Replace(", ", ",").Split(',');

        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = Master.SqlConn;
        oCmd.CommandTimeout = 90;
        oCmd.CommandType = CommandType.StoredProcedure;
        oCmd.CommandText = "spUpdateActionGroup";

        for (int i = 0; i < sStudyActionGroupID.Length; i++)
        {
            oCmd.Parameters.Add(new SqlParameter("@StudyActionGroupID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, sStudyActionGroupID[i].ToString()));
            oCmd.Parameters.Add(new SqlParameter("@mos_from_start", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, sMosFromStart[i].ToString()));
            oCmd.Parameters.Add(new SqlParameter("@length_hrs", SqlDbType.Float, 8, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, sLengthHrs[i].ToString()));

            if (oCmd.Parameters["@mos_from_start"].Value.ToString() == "") { oCmd.Parameters["@mos_from_start"].Value = DBNull.Value; }
            if (oCmd.Parameters["@length_hrs"].Value.ToString() == "") { oCmd.Parameters["@length_hrs"].Value = DBNull.Value; }

            oCmd.ExecuteNonQuery();
            oCmd.Parameters.Clear();
        }

        GetActionGroups();


    }
    #endregion


    #region Get Action Groups
    private void GetActionGroups()
    {
        int nStudyID;

        if (IsPostBack)
            nStudyID = Convert.ToInt32(hidStudyID.Value.ToString());
        else
            nStudyID = Convert.ToInt32(Request["StudyID"].ToString());

        hidStudyID.Value = nStudyID.ToString();

        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = Master.SqlConn;
        oCmd.CommandTimeout = 90;
        oCmd.CommandType = CommandType.StoredProcedure;
        oCmd.CommandText = "spGetActionGroupsByStudyID";
        oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nStudyID));

        SqlDataReader oReader = oCmd.ExecuteReader();

        HtmlTableRow oTr;
        HtmlTableCell oTd;
        int nRowCount = 0;
        bool bDisplayedHeader = false;

        while (oReader.Read())
        {
            if (!bDisplayedHeader)
            {
                #region Display Column Headers
                oTr = new HtmlTableRow();
                oTr.Attributes["class"] = "trHeader";

                oTd = new HtmlTableCell();
                oTd.InnerHtml = "Action";
                oTr.Cells.Add(oTd);

                oTd = new HtmlTableCell();
                oTd.InnerHtml = "Group Name";
                oTr.Cells.Add(oTd);

                oTd = new HtmlTableCell();
                oTd.InnerHtml = "Months From Start (integer)";
                oTr.Cells.Add(oTd);

                oTd = new HtmlTableCell();
                oTd.InnerHtml = "Length(hours)";
                oTr.Cells.Add(oTd);

                tblMaster.Rows.Insert(nRowCount + 1, oTr);

                bDisplayedHeader = true;
                #endregion
            }

            #region Display the Form Controls for Each Group
            oTr = new HtmlTableRow();

            oTd = new HtmlTableCell();
            oTd.InnerHtml += oReader["actiontext"].ToString();
            oTr.Cells.Add(oTd);

            oTd = new HtmlTableCell();
            oTd.InnerHtml += oReader["groupname"].ToString();
            oTr.Cells.Add(oTd);

            oTd = new HtmlTableCell();
            oTd.InnerHtml += "<input type=\"text\" name=\"txtmos_from_start\" value=\"" + oReader["mos_from_start"].ToString() + "\" style=\"width: 50px;\" id=\"txtmos_from_start" + oReader["studyactiongroupid"].ToString() + "\" />";
            oTr.Cells.Add(oTd);

            oTd = new HtmlTableCell();
            oTd.InnerHtml += "<input type=\"text\" name=\"txtlength_hrs\" value=\"" + oReader["length_hrs"].ToString() + "\" style=\"width: 50px;\" maxlength=\"5\" id=\"txtlength_hrs" + oReader["studyactiongroupid"].ToString() + "\" />";
            oTd.InnerHtml += "<input type=\"hidden\" name=\"hidStudyActionGroupID\" value=\"" + oReader["studyactiongroupid"].ToString() + "\" id=\"hidStudyActionGroupID" + oReader["studyactiongroupid"].ToString() + "\" />";
            oTr.Cells.Add(oTd);

            tblMaster.Rows.Insert(nRowCount + 2, oTr);
            #endregion

            nRowCount++;
        }

        oReader.Close();
    }
    #endregion

}
