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
	public partial class EditGroups : System.Web.UI.Page
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
				Form.Attributes["onsubmit"] = "return(DoSubmitEditGroups(event));";
				if (!IsPostBack)
					GetGroups();
			}
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			int nStudyID = Convert.ToInt32(hidStudyID.Value.ToString());

			string[] sGroupID = Request["hidGroupID"].ToString().Replace(", ", ",").Split(',');
			string[] sSortOrder = Request["txtSortOrder"].ToString().Replace(", ", ",").Split(',');
			string[] sGroupName = Request["txtGroupName"].ToString().Replace(", ", ",").Split(',');
			string[] sGroupDesc = Request["txtGroupDesc"].ToString().Replace(", ", ",").Split(',');
			string[] sGoalN = Request["txtGoalN"].ToString().Replace(", ", ",").Split(',');

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spUpdateGroup";

			for (int i=0;i<sGroupID.Length;i++)
			{
				oCmd.Parameters.Add(new SqlParameter("@GroupID", SqlDbType.Int, 4, ParameterDirection.InputOutput, true, 0, 0, "", DataRowVersion.Default, sGroupID[i].ToString()));
				oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, nStudyID));
				oCmd.Parameters.Add(new SqlParameter("@GroupName", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, sGroupName[i].ToString()));
				oCmd.Parameters.Add(new SqlParameter("@SortOrder", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, sSortOrder[i].ToString()));
				oCmd.Parameters.Add(new SqlParameter("@GoalN", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, sGoalN[i].ToString()));
				oCmd.Parameters.Add(new SqlParameter("@GroupDesc", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, sGroupDesc[i].ToString()));

				if (oCmd.Parameters["@GroupID"].Value.ToString() == "") {oCmd.Parameters["@GroupID"].Value = DBNull.Value;}

				oCmd.ExecuteNonQuery();
				oCmd.Parameters.Clear();
			}

			GetGroups();
		}
		#endregion

		#region Get Groups
		private void GetGroups()
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
			oCmd.CommandText = "spGetGroupsByStudyID";
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
					oTd.InnerHtml = "Order";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Group Name";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Group Desc.";
					oTr.Cells.Add(oTd);

					oTd = new HtmlTableCell();
					oTd.InnerHtml = "Goal #";
					oTr.Cells.Add(oTd);

					tblMaster.Rows.Insert(nRowCount+1, oTr);

					bDisplayedHeader = true;
					#endregion
				}

				#region Display the Form Controls for Each Group
				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtSortOrder\" value=\"" + oReader["SortOrder"].ToString() + "\" style=\"width: 50px;\" maxlength=\"5\" id=\"txtSortOrder" + oReader["GroupID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtGroupName\" value=\"" + oReader["GroupName"].ToString() + "\" style=\"width: 100px;\" id=\"txtGroupName" + oReader["GroupID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtGroupDesc\" value=\"" + oReader["GroupDesc"].ToString() + "\" style=\"width: 400px;\" id=\"txtGroupDesc" + oReader["GroupID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtGoalN\" value=\"" + oReader["GoalN"].ToString() + "\" style=\"width: 50px;\" maxlength=\"5\" id=\"txtGoalN" + oReader["GroupID"].ToString() + "\" />";
				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidGroupID\" value=\"" + oReader["GroupID"].ToString() + "\" id=\"hidGroupID" + oReader["GroupID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				tblMaster.Rows.Insert(nRowCount+2,oTr);
				#endregion

				nRowCount++;
			}

			oReader.Close();
		}
		#endregion

		#region Add New Groups
		protected void AddNewGroup(object sender, System.EventArgs e)
		{
			GetGroups();

			HtmlTableRow oTr;
			HtmlTableCell oTd;
			int nNumberToAdd;

			try
			{
				nNumberToAdd = Convert.ToInt32(Request["hidNumGroupsToAdd"].ToString());
			}
			catch
			{
				nNumberToAdd = 1;
			}

			for (int i=0;i<nNumberToAdd;i++)
			{
				#region Display the Form Controls for Each New Group
				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtSortOrder\" value=\"\" style=\"width: 50px;\" maxlength=\"5\" id=\"txtSortOrderNEW" + i.ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtGroupName\" value=\"\" style=\"width: 100px;\" id=\"txtGroupNameNEW" + i.ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtGroupDesc\" value=\"\" style=\"width: 400px;\" id=\"txtGroupDescNEW" + i.ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtGoalN\" value=\"\" style=\"width: 50px;\" maxlength=\"5\" id=\"txtGoalNNEW" + i.ToString() + "\" />";
				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidGroupID\" value=\"\" id=\"hidGroupIDNEW" + i.ToString() + "\" />";
				oTr.Cells.Add(oTd);

				tblMaster.Rows.Insert(tblMaster.Rows.Count-1,oTr);
				#endregion
			}
		}
		#endregion
	}
}