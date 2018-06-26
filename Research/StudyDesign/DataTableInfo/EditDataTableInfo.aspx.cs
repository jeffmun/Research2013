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

namespace StudyDesign.DataTableInfo
{
	public partial class EditDataTableInfo : System.Web.UI.Page
	{
		private SqlConnection oDataConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString());
		private DBLookup oDBLookup;

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
			if (!IsPostBack)
			{
				oDataConn.Open();
				oDBLookup = new DBLookup(oDataConn);

				oDBLookup.BindDropDownList(ref selTableID, "spGetAllDataTables", "Name", "TableID", "", "--Select Data Table--");
				oDBLookup.BindDropDownList(ref selStudyID, "uwautism_research_backend.dbo.spGetAllStudies", "StudyName", "StudyID", "", "--Select Study--");
				oDBLookup.BindDropDownList(ref selFieldInfoStatusID, "uwautism_research_backend.dbo.spGetAllDocumentStatuses", "DocStatus", "DocStatusID", "", "--Select Status--");
				oDBLookup.BindDropDownList(ref selAllTableID, "spGetAllALLTables", "Name", "TableID", "", "--Select ALL Table--");
				oDBLookup.BindDropDownList(ref selDEScoringStatusID, "spGetAllDEScoringStatuses", "DEScoringStatus", "DEScoringStatusID", "", "--Select Scoring Status--");
				oDBLookup.BindDropDownList(ref selDEScoringTypeID, "spGetAllDEScoringTypes", "DEScoringType", "DEScoringTypeID", "", "--Select Scoring Type--");

				oDataConn.Close();
			}
		}

		protected void SaveChanges(object sender, System.EventArgs e)
		{
		}
	}
}