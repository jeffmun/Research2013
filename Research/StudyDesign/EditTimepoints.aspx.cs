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
using System.Windows.Forms;

using AutismCenterBase.Utilities;

namespace StudyDesign
{
	public partial class EditTimepoints : System.Web.UI.Page
	{
		private TextFormatter oFormat = new TextFormatter();

		private void Page_Load(object sender, System.EventArgs e)
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
				Form.Attributes["onsubmit"] = "return(DoSubmitEditTimepoints(event));";
				if (!IsPostBack)
					GetTimepoints();
			}
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			int nStudyID = Convert.ToInt32(hidStudyID.Value.ToString());

			string[] sTimepointID = Request["hidTimepointID"].ToString().Replace(", ", ",").Split(',');
			string[] stimepoint_text = Request["txtTimepoint_text"].ToString().Replace(", ", ",").Split(',');
            string[] nmonths_offset = Request["txtMonths_offset"].ToString().Replace(", ", ",").Split(',');
            string[] ndefault_vrpID = Request["txtDefault_vrpID"].ToString().Replace(", ", ",").Split(',');

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spUpdateTimepoint";

            for (int i = 0; i < sTimepointID.Length; i++)
			{
                oCmd.Parameters.Add(new SqlParameter("@TimepointID", SqlDbType.Int, 4, ParameterDirection.InputOutput, true, 0, 0, "", DataRowVersion.Default, sTimepointID[i].ToString()));
				oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nStudyID));
                oCmd.Parameters.Add(new SqlParameter("@timepoint_text", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, stimepoint_text[i].ToString()));
                oCmd.Parameters.Add(new SqlParameter("@months_offset", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nmonths_offset[i].ToString()));
                oCmd.Parameters.Add(new SqlParameter("@default_vrpID", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, ndefault_vrpID[i].ToString()));

                if (oCmd.Parameters["@timepointID"].Value.ToString() == "") { oCmd.Parameters["@timepointID"].Value = DBNull.Value; }

				oCmd.ExecuteNonQuery();
				oCmd.Parameters.Clear();
			}

			GetTimepoints();
		}
		#endregion

		#region Get Timepoints
		private void GetTimepoints()
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
			oCmd.CommandText = "spGetTimepointsByStudyID";
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
					oTd.InnerHtml = "Timepoint";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Timepoint_text";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Months_offset";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Default_vrpID";
					oTr.Cells.Add(oTd);

					tblMaster.Rows.Insert(nRowCount+1, oTr);

					bDisplayedHeader = true;
					#endregion
				}

				#region Display the Form Controls for Each Timepoint
				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
                oTd.InnerHtml += "<input type=\"text\" name=\"txtTimepoint\" value=\"" + oReader["Timepoint"].ToString() + "\" style=\"width: 50px;\" maxlength=\"5\" id=\"txtTimepoint" + oReader["TimepointID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
                oTd.InnerHtml += "<input type=\"text\" name=\"txtTimepoint_text\" value=\"" + oReader["timepoint_text"].ToString() + "\" style=\"width: 100px;\" id=\"txtTimepoint_text" + oReader["TimepointID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

                oTd = new HtmlTableCell();
                oTd.InnerHtml += "<input type=\"text\" name=\"txtMonths_offset\" value=\"" + oReader["Months_offset"].ToString() + "\" style=\"width: 100px;\" id=\"txtMonths_offset" + oReader["TimepointID"].ToString() + "\" />";
                oTr.Cells.Add(oTd);
                
                oTd = new HtmlTableCell();
                oTd.InnerHtml += "<input type=\"text\" name=\"txtDefault_vrpID\" value=\"" + oReader["Default_vrpID"].ToString() + "\" style=\"width: 100px;\" id=\"txtDefault_vrpID" + oReader["TimepointID"].ToString() + "\" />";
                oTd.InnerHtml += "<input type=\"hidden\" name=\"hidTimepointID\" value=\"" + oReader["TimepointID"].ToString() + "\" id=\"hidTimepointID" + oReader["TimepointID"].ToString() + "\" />";
                oTr.Cells.Add(oTd);

				tblMaster.Rows.Insert(nRowCount+2,oTr);
				#endregion

				nRowCount++;
			}

			oReader.Close();
		}
		#endregion

		#region Add New Timepoints
		protected void AddNewTimepoint(object sender, System.EventArgs e)
		{
			GetTimepoints();

			HtmlTableRow oTr;
			HtmlTableCell oTd;
			int nNumberToAdd;

			try
			{
				nNumberToAdd = Convert.ToInt32(Request["hidNumTimepointsToAdd"].ToString());
			}
			catch
			{
				nNumberToAdd = 1;
			}

			for (int i=0;i<nNumberToAdd;i++)
			{
				#region Display the Form Controls for Each New Timepoint
				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
                oTd.InnerHtml += "<input type=\"text\" name=\"txtTimepoint\" value=\"\" style=\"width: 50px;\" maxlength=\"5\" id=\"txtTimepointNEW" + i.ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
                oTd.InnerHtml += "<input type=\"text\" name=\"txtTimepoint_text\" value=\"\" style=\"width: 100px;\" id=\"txtTimepoint_textNEW" + i.ToString() + "\" />";
				oTr.Cells.Add(oTd);

                oTd = new HtmlTableCell();
                oTd.InnerHtml += "<input type=\"text\" name=\"txtMonths_offset\" value=\"\" style=\"width: 100px;\" id=\"txtMonths_offsetNEW" + i.ToString() + "\" />";
                oTr.Cells.Add(oTd);

                oTd = new HtmlTableCell();
                oTd.InnerHtml += "<input type=\"text\" name=\"txtDefault_vrpID\" value=\"\" style=\"width: 100px;\" id=\"txtDefault_vrpIDNEW" + i.ToString() + "\" />";
                oTd.InnerHtml += "<input type=\"hidden\" name=\"hidTimepointID\" value=\"\" id=\"hidTimepointIDNEW" + i.ToString() + "\" />";
                oTr.Cells.Add(oTd);

				tblMaster.Rows.Insert(tblMaster.Rows.Count-1,oTr);
				#endregion
			}
		}
		#endregion
	}
}