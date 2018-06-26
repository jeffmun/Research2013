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
	public partial class EditMultipleConsents : System.Web.UI.Page
	{
		private string sSubjConsentID;
		private string[] aSubjConsentID;
		private bool bDoRefresh;
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitMultipleConsentForms());";

			oDBLookup = new DBLookup(Master.SqlConn);

			bDoRefresh = Convert.ToBoolean(Request["DoRefresh"].ToString());
			sSubjConsentID = Request["SubjConsentIDs"].ToString().Replace(", ", ",");
			aSubjConsentID = sSubjConsentID.Split(',');

			if (!IsPostBack)
			{
				#region Display the Form with the Appropriate Controls.
				hidSubjConsentIDs.Value = sSubjConsentID;

				oDBLookup.BindDropDownList(ref selConsentFormStatusID, "EXEC spGetAllConsentStatus", "ConsentStatus", "ConsentStatusID", "", "--Select Consent Status--");

				//string sConsentItemsList = "";
				//HtmlTableRow oTr;
				//HtmlTableCell oTd;

				//for (int i=0;i<aSubjConsentID.Length;i++)
				//{
				//    #region Get All of the Consent Items for Each Consent Form Version
				//    DataTable oTable = GetConsentItems(Convert.ToInt32(aSubjConsentID[i]));
				//    bool bDisplayedHeader = false;

				//    for (int j=0;j<oTable.Rows.Count;j++)
				//    {
				//        if (oTable.Rows[j]["ConsentItemID"].ToString() != "")
				//        {
				//            if (!bDisplayedHeader)
				//            {
				//                oTr = new HtmlTableRow();
				//                oTd = new HtmlTableCell();
				//                oTd.Attributes["class"] = "tdHeaderAlt";
				//                oTd.InnerHtml = oDBLookup.GetConsentFormNameBySubjConsentID(Convert.ToInt32(aSubjConsentID[i])) + " Consent Items";
				//                oTr.Cells.Add(oTd);
				//                tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);

				//                bDisplayedHeader = true;
				//            }
				//            oTr = new HtmlTableRow();
				//            oTd = new HtmlTableCell();

				//            if (oTable.Rows[j]["IsItemConsented"].ToString() == "1")
				//                oTd.InnerHtml = "<input type=\"checkbox\" name=\"chkConsentItemIDs\" id=\"chkConsentItemIDs" + oTable.Rows[j]["ConsentItemID"].ToString() + "\" value=\"" + oTable.Rows[j]["ConsentItemID"].ToString() + "\" checked=\"checked\" /> " + oTable.Rows[j]["ConsentItemText"].ToString();
				//            else
				//                oTd.InnerHtml = "<input type=\"checkbox\" name=\"chkConsentItemIDs\" id=\"chkConsentItemIDs" + oTable.Rows[j]["ConsentItemID"].ToString() + "\" value=\"" + oTable.Rows[j]["ConsentItemID"].ToString() + "\" /> " + oTable.Rows[j]["ConsentItemText"].ToString();

				//            oTr.Cells.Add(oTd);
				//            tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);

				//            sConsentItemsList += oTable.Rows[j]["ConsentItemID"].ToString() + ",";
				//        }
				//    }
				//    #endregion
				//}

				//if (sConsentItemsList != "")
				//{
				//    oTr = new HtmlTableRow();
				//    oTd = new HtmlTableCell();
				//    oTd.InnerHtml = "<a href=\"javascript:ChangeCheckBoxes('chkConsentItemIDs', true);\">Check All Consent Items</a>";
				//    oTd.InnerHtml += " - <a href=\"javascript:ChangeCheckBoxes('chkConsentItemIDs', false);\">Clear All Consent Items</a>";
				//    oTr.Cells.Add(oTd);
				//    tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);
				//}
				#endregion
			}
		}

		#region Get Consent and Consent Items
		private DataTable GetConsentItems(int nSubjConsentID)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataAdapter oAdapter = new SqlDataAdapter(oCmd);
			DataTable oTable = new DataTable();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetConsentFormAndConsentItemsBySubjConsentID";
			oCmd.CommandTimeout = 90;

			oCmd.Parameters.AddWithValue("@SubjConsentID", nSubjConsentID);

			oAdapter.Fill(oTable);

			return oTable;
		}
		#endregion

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			bDoRefresh = Convert.ToBoolean(Request["DoRefresh"].ToString());
			aSubjConsentID = hidSubjConsentIDs.Value.Replace(", ", ",").Split(',');
			string sConsentItemIDs = "";

			if (Request["chkConsentItemIDs"] != null) { sConsentItemIDs = Request["chkConsentItemIDs"].ToString(); }

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			for (int i=0;i<aSubjConsentID.Length;i++)
			{
				int nSubjConsentID = Convert.ToInt32(aSubjConsentID[i]);
				int nSubjID = oDBLookup.GetSubjectIDFromSubjConsentID(nSubjConsentID);
				int nConsentFormVersionID = oDBLookup.GetConsentFormVersionIDBySubjConsentID(nSubjConsentID);

				#region Make the Updates to the db for Each Consent Form Version
				oCmd.CommandText = "spUpdateConsentForm";
				oCmd.Parameters.Clear();
				oCmd.Parameters.AddWithValue("@SubjConsentID", nSubjConsentID);
				oCmd.Parameters.AddWithValue("@DateSigned", txtDateSigned.Text);
				oCmd.Parameters.AddWithValue("@TimeSigned", txtTimeSigned.Text);
				oCmd.Parameters.AddWithValue("@ConsentStatusID", selConsentFormStatusID.SelectedValue);
				oCmd.Parameters.AddWithValue("@Notes", txtNotes.Text);
				oCmd.Parameters.AddWithValue("@ConsentFormVersionID", DBNull.Value);

				if (oCmd.Parameters["@DateSigned"].Value.ToString().Trim() == "") {oCmd.Parameters["@DateSigned"].Value = DBNull.Value;}
				if (oCmd.Parameters["@ConsentFormVersionID"].Value.ToString().Trim() == "") {oCmd.Parameters["@ConsentFormVersionID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@Notes"].Value.ToString().Trim() == "") {oCmd.Parameters["@Notes"].Value = DBNull.Value;}

				oCmd.ExecuteNonQuery();

				//oCmd.Parameters.Clear();
				//oCmd.CommandText = "spDeleteConsentItemExclusions";
				//oCmd.Parameters.AddWithValue("@SubjID", nSubjID);
				//oCmd.Parameters.AddWithValue("@ConsentFormVersionID", nConsentFormVersionID);

				//oCmd.ExecuteNonQuery();

				//oCmd.Parameters.Clear();
				//oCmd.CommandText = "spInsertSubjectConsentExclusions";
				//oCmd.Parameters.AddWithValue("@ConsentItemIDs", sConsentItemIDs);
				//oCmd.Parameters.AddWithValue("@SubjConsentID", nSubjConsentID);

				//if (oCmd.Parameters["@ConsentItemIDs"].Value.ToString() == "")
				//    oCmd.Parameters["@ConsentItemIDs"].Value = DBNull.Value;

				//oCmd.ExecuteNonQuery();
				#endregion

			}

			if (bDoRefresh)
				Response.Write("<script type=\"text/javascript\">window.opener.location.reload(true); window.close();</script>");

		
		}
		#endregion
	}
}
