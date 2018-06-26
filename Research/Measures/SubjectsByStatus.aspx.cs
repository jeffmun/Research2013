using System;
using System.Configuration;
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
	public partial class SubjectsByStatus : System.Web.UI.Page
	{
		//protected HtmlTable tblMaster;

		private TextFormatter oFormat = new TextFormatter();
		private ReadConfig oConfig = new ReadConfig();
		private SqlConnection oConn = new SqlConnection();
		private int nStudyID = 0;
		private int nSubjStatusID = 0;
		private int nSubjStatusDetailID = 0;

		private void Page_Load(object sender, System.EventArgs e)
		{
			string ap = Request.ApplicationPath;

			bool bDisplayedHeader = false;
			bool bDoDark = false;
			string sSortField;
			string sDOB;
			HtmlAnchor aLink;
			HtmlTableRow oTr;
			HtmlTableCell oTd;

			nStudyID = Convert.ToInt32(Request["StudyID"]);

			if (Request["SubjStatusID"] == null)
				Response.Redirect(ap + "/measures/SubjectsByStudy.aspx?StudyID=" + nStudyID.ToString(), true);

			nSubjStatusID = Convert.ToInt32(Request["SubjStatusID"]);
			sSortField = Request["hidSortField"];
			if (Request["SubjStatusDetailID"] != "") {nSubjStatusDetailID = Convert.ToInt32(Request["SubjStatusDetailID"]);}

			oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
			oConn.Open();

			SqlDataReader oReader = GetSubjectsByStatus(oConn, nStudyID, nSubjStatusID, nSubjStatusDetailID, sSortField);

			while (oReader.Read())
			{
				if (!bDisplayedHeader)
				{
					#region Display Header Title
					oTr = new HtmlTableRow();
					oTr.Attributes["class"] = "trTitle";

					oTd = new HtmlTableCell();
					oTd.ColSpan = 8;

					if (nSubjStatusDetailID != 0)
						oTd.InnerHtml = oReader["StudyName"].ToString() + " - " + oReader["SubjStatus"].ToString() + "/" + oReader["SubjStatusDetail"].ToString() + " Subjects";
					else
						oTd.InnerHtml = oReader["StudyName"].ToString() + " - " + oReader["SubjStatus"].ToString() + " Subjects";

					oTr.Cells.Add(oTd);

					tblMaster.Rows.Insert(0, oTr);

					bDisplayedHeader = true;
					#endregion
				}

				#region Display Data Items
				oTr = new HtmlTableRow();
				aLink = new HtmlAnchor();

				oTr.Attributes.Add("onclick", "HighlightRow(this);");
				if (bDoDark) {oTr.Attributes.Add("class", "trDark");}

				aLink.HRef = ap + "/measures/EditSubject.aspx?SubjID=" + oReader["SubjID"].ToString();
				aLink.InnerHtml = oReader["ID"].ToString();

				oTd = new HtmlTableCell();
				oTd.Controls.Add(aLink);
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oFormat.FormatDBOutput(oReader["LastName"].ToString()) + ", " + oFormat.FormatDBOutput(oReader["FirstName"].ToString());
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oFormat.FormatDBOutput(oReader["GroupName"].ToString());
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oFormat.FormatDBOutput(oReader["SubjStatusAndDetail"].ToString());
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				sDOB = oReader["DOB"].ToString();
				
				if (sDOB != "")
					oTd.InnerHtml = oFormat.AgeInYearsAndMonths(Convert.ToDateTime(sDOB));
				else
					oTd.InnerHtml = "&nbsp;";
				
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oFormat.FormatDBOutput(oReader["DOB"].ToString());
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oFormat.FormatDBOutput(oReader["Sex"].ToString());
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.Style["white-space"] = " normal";
				oTd.InnerHtml = oFormat.FormatDBOutput(oReader["Notes"].ToString());
				oTr.Cells.Add(oTd);

				tblMaster.Rows.Add(oTr);

				bDoDark = !bDoDark;
				#endregion
			}

			oConn.Close();
		}

		#region Get Subjects by Status
		private SqlDataReader GetSubjectsByStatus(SqlConnection oConn, int nStudyID, int nSubjStatusID, int nSubjStatusDetailID, string sSortField)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = oConn;
			oCmd.CommandText = "spGetSubjectsBySubjectStatusAndDetail";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nStudyID));
			oCmd.Parameters.Add(new SqlParameter("@SubjStatusID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0 , "", DataRowVersion.Current, nSubjStatusID));
			oCmd.Parameters.Add(new SqlParameter("@SubjStatusDetailID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, nSubjStatusDetailID));
			oCmd.Parameters.Add(new SqlParameter("@SortField", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, sSortField));

			if (nSubjStatusID == 0)
				oCmd.Parameters["@SubjStatusID"].Value = DBNull.Value;

			if (nSubjStatusDetailID == 0)
				oCmd.Parameters["@SubjStatusDetailID"].Value = DBNull.Value;

			if (sSortField == "")
				oCmd.Parameters["@SortField"].Value = DBNull.Value;

			oReader = oCmd.ExecuteReader();

			return oReader;
		}
		#endregion

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);
		}
		#endregion
	}
}
