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

namespace DataEntry
{
	public partial class MeasureLinks : System.Web.UI.Page
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			int studyid = -1;
			SqlConnection conn = null;
			try
			{
				SqlCommand cmd = new SqlCommand("select * from vwDocs_Measure_FullSet where studyID = @studyID order by measname", Master.SqlConn);
				cmd.Parameters.Add(new SqlParameter("@studyID", System.Data.SqlDbType.Int));

				cmd.Parameters["@studyID"].Value = int.Parse(Request["studyid"]);

				SqlDataReader r = cmd.ExecuteReader();
				DataGrid1.DataSource = r;
				DataGrid1.DataBind();

				r.Close();

			}
			catch
			{
				// do nothing
			}
			finally
			{
				if (conn != null) conn.Close();
			}
		}

		protected string MakeDEFormLink(string sURL)
		{
			string result = string.Empty;
			if (sURL.Trim() == "")
				result = "";
			else if (sURL.Trim() == "NA")
				result = "N/A";
			else
				result = "<a href=\"" + sURL + "\" >Open</a>";

			return result;
		}

		protected string MakeDEDocsLink(string docPath, string sURL)
		{
			string result = string.Empty;
			if (sURL.Trim() == "")
				result = "";
			else
				result = "<a href=\"" + docPath.Trim() + sURL + "\" >Open</a>";

			return result;
		}
	}
}
