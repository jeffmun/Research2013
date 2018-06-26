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
	public partial class MeasureSummaries : System.Web.UI.Page
	{
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitMeasSummaries());";
			string sStudyID = "0";
			oDBLookup = new DBLookup(Master.SqlConn);

			if (!IsPostBack)
				oDBLookup.BindDropDownList(ref selStudyID, "EXEC spGetActiveStudies", "StudyFullName", "StudyID", sStudyID, "--Select a Study--");
		}

		protected void GetMeasureSummary(object sender, EventArgs e)
		{
			string sStudyName = oDBLookup.GetStudyName(Convert.ToInt32(selStudyID.SelectedValue), false);
			string sFileName = sStudyName + "-" + DateTime.Today.ToString("MM/dd/yyyy").Replace("/", "-");

			Response.Buffer = true;
			Response.AppendHeader("Content-Disposition", "attachment; filename=" + sFileName + ".csv");
			Response.ContentType = "Application/x-msexcel";

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spGetSubjectMeasureMatrix";
			oCmd.CommandTimeout = 360;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@StudyID", selStudyID.SelectedValue);
			oCmd.Parameters.AddWithValue("@SubjRows", 1);

			SqlDataReader oReader = oCmd.ExecuteReader();

			string sOutput = "";
			int i = 0;

			for (i = 0; i < oReader.FieldCount; i++)
				sOutput += oReader.GetName(i) + ",";

			sOutput += "\n";

			while (oReader.Read())
			{
				for (i = 0; i < oReader.FieldCount; i++)
					sOutput += oReader[i].ToString() + ",";

				sOutput = sOutput.Substring(0, sOutput.Length - 1) + "\n";
			}

			Response.Write(sOutput + "\n");
			Response.End();
		}
	}
}
