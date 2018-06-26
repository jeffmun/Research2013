using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
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
	public partial class EditMeasure : System.Web.UI.Page
	{
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitMeasureInfo(event));";

			oDBLookup = new DBLookup(Master.SqlConn);
			string sTab = "";

			if (!IsPostBack)
			{
				btnSubmit.Style["display"] = "none";
				oLink.Style["display"] = "none";

				oDBLookup.BindDropDownList(ref selMeasureID, "EXEC spGetActiveMeasures", "MeasName", "MeasureID", "", "--Select a Measure--");
				oDBLookup.BindDropDownList(ref selMeasCatID, "EXEC spGetMeasCategories", "MeasCat", "MeasCatID", "", "--Select Measure Category--");
				oDBLookup.BindDropDownList(ref selMeasRespondentID, "EXEC spGetMeasRespondents", "MeasResp", "MeasRespID", "", "--Select a Respondent--");
				oDBLookup.BindDropDownList(ref selFocusPerson, "EXEC spGetMeasFocus", "MeasFocus", "MeasFocusID", "", "--Select Focus Person--");
				oDBLookup.BindDropDownList(ref selMethodID, "EXEC spGetMeasMethods", "MeasMethod", "MeasMethodID", "", "--Select Admin. Method--");
				oDBLookup.BindDropDownList(ref selStaffID, "EXEC spGetAllStaff", "StaffShortName", "StaffID", "", "--Select Staff--");

				if (Request["Tab"] != null)
				{
					sTab = Request["Tab"].ToString();
					hidTab.Value = sTab;
				}
			}
			else
				sTab = hidTab.Value.ToString();

			DisplayProperForm(sTab);
		}

		#region Update Measure Info
		protected void UpdateMeasureInfo(Object sender, EventArgs e)
		{
			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spUpdateMeasureMetaData";

			oCmd.Parameters.Add(new SqlParameter("@MeasureID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, selMeasureID.SelectedValue.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@MeasName", SqlDbType.VarChar, 25, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtMeasShortName.Text.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@MeasCatID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, selMeasCatID.SelectedValue.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@MeasFullName", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtMeasFullName.Text.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@Respondent", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, selMeasRespondentID.SelectedValue.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@FocusPerson", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, selFocusPerson.SelectedValue.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@AdminTime", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtAdminTime.Text.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@DateBeginUsing", SqlDbType.DateTime, 8, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, txtStartDate.Text.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@DateEndUsing", SqlDbType.DateTime, 8, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtEndDate.Text.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@Notes", SqlDbType.VarChar, 1500, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtNotes.Text.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@Method", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, selMethodID.SelectedValue.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@CitationText", SqlDbType.VarChar, 1500, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtCitation.Text.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@DescriptionText", SqlDbType.VarChar, 1500, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtDescription.Text.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@CopyrightInfo", SqlDbType.VarChar, 1000, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtCopyright.Text.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@ContactPerson_StaffID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, selStaffID.SelectedValue.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@OrderingInfo", SqlDbType.VarChar, 1000, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtOrdering.Text.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@DEEstTime", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtDEEstTime.Text.ToString()));
			oCmd.Parameters.Add(new SqlParameter("@ScoringInfoText", SqlDbType.VarChar, 1000, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Default, txtDEScoringInfo.Text.ToString()));

			if (oCmd.Parameters["@Notes"].Value.ToString() == "") {oCmd.Parameters["@Notes"].Value = DBNull.Value;}
			if (oCmd.Parameters["@AdminTime"].Value.ToString() == "") {oCmd.Parameters["@AdminTime"].Value = DBNull.Value;}
			if (oCmd.Parameters["@DateBeginUsing"].Value.ToString() == "") {oCmd.Parameters["@DateBeginUsing"].Value = DBNull.Value;}
			if (oCmd.Parameters["@DateEndUsing"].Value.ToString() == "") {oCmd.Parameters["@DateEndUsing"].Value = DBNull.Value;}
			if (oCmd.Parameters["@DescriptionText"].Value.ToString() == "") {oCmd.Parameters["@DescriptionText"].Value = DBNull.Value;}
			if (oCmd.Parameters["@CitationText"].Value.ToString() == "") {oCmd.Parameters["@CitationText"].Value = DBNull.Value;}
			if (oCmd.Parameters["@CopyrightInfo"].Value.ToString() == "") {oCmd.Parameters["@CopyrightInfo"].Value = DBNull.Value;}
			if (oCmd.Parameters["@OrderingInfo"].Value.ToString() == "") {oCmd.Parameters["@OrderingInfo"].Value = DBNull.Value;}
			if (oCmd.Parameters["@ScoringInfoText"].Value.ToString() == "") {oCmd.Parameters["@ScoringInfoText"].Value = DBNull.Value;}
			if (oCmd.Parameters["@DEEstTime"].Value.ToString() == "") {oCmd.Parameters["@DEEstTime"].Value = DBNull.Value;}

//			try
//			{
				oCmd.ExecuteNonQuery();

				tdError.Style["display"] = "inline";
				tdError.Style["color"] = "#008800";
				tdError.InnerHtml = "Your changes have been saved.";
//			}
//			catch
//			{
//				tdError.Style["display"] = "inline";
//				tdError.Style["color"] = "#FF0000";
//				tdError.InnerHtml = "An error occurred and your changes have NOT been saved.";
//			}
		}
		#endregion

		#region Get Measure Info
		protected void GetMeasureInfo(Object sender, EventArgs e)
		{
			if (Convert.ToInt32(selMeasureID.SelectedValue.ToString()) > 0)
			{
				SqlCommand oCmd = new SqlCommand();
				oCmd.Connection = Master.SqlConn;
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;
				oCmd.CommandText = "spGetMeasureByMeasureID";
				oCmd.Parameters.Add(new SqlParameter("@MeasureID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, selMeasureID.SelectedValue));

				SqlDataReader oReader = oCmd.ExecuteReader();
				string sMeasureName = "";

				if (oReader.HasRows)
				{
					oReader.Read();

					sMeasureName = oReader["MeasName"].ToString();

					//Set General Info Controls
					txtMeasShortName.Text = oReader["MeasName"].ToString();
					txtMeasFullName.Text = oReader["MeasFullName"].ToString();
					selMeasCatID.SelectedValue = oReader["MeasCatID"].ToString();
					txtStartDate.Text = oReader["DateBeginUsing"].ToString();
					txtEndDate.Text = oReader["DateEndUsing"].ToString();
					selStaffID.SelectedValue = oReader["ContactPerson_StaffID"].ToString();
					txtNotes.Text = oReader["Notes"].ToString();

					//Set Admin. Info Controls
					selMeasRespondentID.SelectedValue = oReader["Respondant"].ToString();
					selFocusPerson.SelectedValue = oReader["FocusPerson"].ToString();
					selMethodID.SelectedValue = oReader["Method"].ToString();
					txtAdminTime.Text = oReader["AdminTime"].ToString();

					//Set Author Info Controls
					txtDescription.Text = oReader["DescriptionText"].ToString();
					txtCitation.Text = oReader["CitationText"].ToString();
					txtCopyright.Text = oReader["CopyrightInfo"].ToString();
					txtOrdering.Text = oReader["OrderingInfo"].ToString();

					//Set Data Entry Info Controls
					txtDEEstTime.Text = oReader["DEEstTime"].ToString();
					txtDEScoringInfo.Text = oReader["ScoringInfoText"].ToString();
				}

				oReader.Close();

				DisplayDocuments();

				btnSubmit.Style["display"] = "inline";
				oLink.Style["display"] = "inline";

				oLink.HRef = ConfigurationManager.AppSettings["SQL_REPORT_SERVER_URL"] +  "%2fData+Documentation%2fDocs_MeasInfo&rs:Command=Render&measureID=" + selMeasureID.SelectedValue.ToString();
				oLink.InnerHtml = "View Info for " + sMeasureName + " in a Printable Format";
				oLink.Target = "_new";
			}
			else
			{
				//Set General Info Controls
				txtMeasShortName.Text = "";
				txtMeasFullName.Text = "";
				selMeasCatID.SelectedValue = "-1";
				txtStartDate.Text = "";
				txtEndDate.Text = "";
				selStaffID.SelectedValue = "-1";
				txtNotes.Text = "";

				//Set Admin. Info Controls
				selMeasRespondentID.SelectedValue = "-1";
				selFocusPerson.SelectedValue = "-1";
				selMethodID.SelectedValue = "-1";
				txtAdminTime.Text = "";

				//Set Author Info Controls
				txtDescription.Text = "";
				txtCitation.Text = "";
				txtCopyright.Text = "";
				txtOrdering.Text = "";

				//Set Data Entry Info Controls
				txtDEEstTime.Text = "";
				txtDEScoringInfo.Text = "";

				btnSubmit.Style["display"] = "none";
				oLink.Style["display"] = "none";
			}
		}
		#endregion

		#region Display Associated Documents
		private void DisplayDocuments()
		{
			SqlCommand oCmd = new SqlCommand();
			HtmlTableRow oTr;
			HtmlTableCell oTd;
			bool bDoDark = false;

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetDocsByEntityTypeAndEntityID";

			oCmd.Parameters.Add(new SqlParameter("@EntityTypeID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, 1));
			oCmd.Parameters.Add(new SqlParameter("@EntityID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, selMeasureID.SelectedValue.ToString()));

			SqlDataReader oReader = oCmd.ExecuteReader();

			while (oReader.Read())
			{
				oTr = new HtmlTableRow();
				if (bDoDark) {oTr.Attributes["class"] = "trDark";}

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<a href=\"" + ConfigurationManager.AppSettings["DOCUMENT_LOCATION"] + oReader["DocFileName"].ToString() + "\">" + oReader["DocTitle"].ToString() + " v." + oReader["Version"].ToString() + "</a>";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oReader["DocType"].ToString();
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oReader["DocStatus"].ToString();
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oReader["UploadedBy"].ToString();
				oTr.Cells.Add(oTd);

				tblDocuments.Rows.Add(oTr);
				bDoDark = !bDoDark;
			}
		}
		#endregion

		#region Display Proper Form
		private void DisplayProperForm(string sFormName)
		{
			switch (sFormName)
			{
				case "Admin":
					tblGeneral.Style["display"] = "none";
					tblAdminInfo.Style["display"] = "inline";
					tblAuthorInfo.Style["display"] = "none";
					tblDocuments.Style["display"] = "none";
					tblDataEntry.Style["display"] = "none";
					break;
				case "Author":
					tblGeneral.Style["display"] = "none";
					tblAdminInfo.Style["display"] = "none";
					tblAuthorInfo.Style["display"] = "inline";
					tblDocuments.Style["display"] = "none";
					tblDataEntry.Style["display"] = "none";
					break;
				case "Documents":
					tblGeneral.Style["display"] = "none";
					tblAdminInfo.Style["display"] = "none";
					tblAuthorInfo.Style["display"] = "none";
					tblDocuments.Style["display"] = "inline";
					tblDataEntry.Style["display"] = "none";
					break;
				case "DataEntry":
					tblGeneral.Style["display"] = "none";
					tblAdminInfo.Style["display"] = "none";
					tblAuthorInfo.Style["display"] = "none";
					tblDocuments.Style["display"] = "none";
					tblDataEntry.Style["display"] = "inline";
					break;
				default:
					tblGeneral.Style["display"] = "inline";
					tblAdminInfo.Style["display"] = "none";
					tblAuthorInfo.Style["display"] = "none";
					tblDocuments.Style["display"] = "none";
					tblDataEntry.Style["display"] = "none";
					break;
			}		
		}
		#endregion
	}
}