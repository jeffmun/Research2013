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
	public partial class EditCounterbalanceOrder : System.Web.UI.Page
	{
		private DBLookup oDBLookup;
		private int nStudyID;

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
			else if (!IsPostBack)
			{
				Form.Attributes["onsubmit"] = "return (DoSubmitEditMeasureActionAssignments(event, true));";

				nStudyID = Convert.ToInt32(Request["StudyID"].ToString());
				hidStudyID.Value = nStudyID.ToString();

				oDBLookup = new DBLookup();

				oDBLookup.BindDropDownList(ref selCounterBalanceOrderID, "EXEC spGetCounterBalanceOrdersByStudyID " + nStudyID.ToString(), "Description", "CounterbalanceOrderID", "", "--Select CB Order--");

				btnSaveChanges.Style["display"] = "none";
			}
			else
				btnSaveChanges.Style["display"] = "inline";
		}

		#region Get Counterbalance Info
		protected void GetCBInfo(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup();
			string sStudyName;
			HtmlTableRow oTr;
			HtmlTableCell oTd;

			nStudyID = Convert.ToInt32(hidStudyID.Value);
			sStudyName = oDBLookup.GetStudyName(nStudyID, false);
			tdTitle.InnerHtml += " - " + sStudyName;

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetCounterbalanceAssignmentByCounterbalanceOrderID";
			oCmd.Parameters.AddWithValue("@CounterbalanceOrderID", selCounterBalanceOrderID.SelectedValue);

			SqlDataReader oReader = oCmd.ExecuteReader();

			while (oReader.Read())
			{
				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oReader["StudyMeasName"].ToString();
				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidStudyMeasID\" value=\"" + oReader["StudyMeasID"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oDBLookup.BindDropDownList("selStudyActionID", "EXEC spGetStudyActionsByStudyID " + nStudyID.ToString(), "ActionText", "StudyActionID", oReader["StudyActionID"].ToString(), "--Study Action--", "width: 200px");
				oTr.Cells.Add(oTd);

				tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);
			}

			oReader.Close();
		}
		#endregion

		protected void SaveChanges(object sender, System.EventArgs e)
		{
			SqlCommand oCmd = new SqlCommand();
			string[] aStudyActionIDs = Request["selStudyActionID"].ToString().Replace(", ", ",").Split(',');
			string[] aStudyMeasIDs = Request["hidStudyMeasID"].ToString().Replace(", ", ",").Split(',');
			nStudyID = Convert.ToInt32(hidStudyID.Value);

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.CommandText = "spDeleteCounterBalanceAssignmentByCounterBalanceOrderID";
			oCmd.Parameters.Add(new SqlParameter("@CounterBalanceOrderID", selCounterBalanceOrderID.SelectedValue));
			oCmd.ExecuteNonQuery();
			oCmd.Parameters.Clear();

			oCmd.CommandText = "spInsertCounterBalanceAssignment";
			oCmd.Parameters.Add(new SqlParameter("@StudyActionID", SqlDbType.Int, 4));
			oCmd.Parameters.Add(new SqlParameter("@StudyMeasID", SqlDbType.Int, 4));
			oCmd.Parameters.Add(new SqlParameter("@CounterBalanceOrderID", selCounterBalanceOrderID.SelectedValue));

			for (int i=0;i<aStudyActionIDs.Length;i++)
			{
				oCmd.Parameters["@StudyActionID"].Value = aStudyActionIDs[i];
				oCmd.Parameters["@StudyMeasID"].Value = aStudyMeasIDs[i];

				if (oCmd.Parameters["@StudyActionID"].Value.ToString() == "" || oCmd.Parameters["@StudyActionID"].Value.ToString() == "-1") {oCmd.Parameters["@StudyActionID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@StudyMeasID"].Value.ToString() == "" || oCmd.Parameters["@StudyMeasID"].Value.ToString() == "-1") {oCmd.Parameters["@StudyMeasID"].Value = DBNull.Value;}

				oCmd.ExecuteNonQuery();
			}

			GetCBInfo(sender, e);
		}
	}
}