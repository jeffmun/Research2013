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
	public partial class MeasureDocLinks : System.Web.UI.Page
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			int studyid = -1;

			try
			{
				SqlCommand cmd = new SqlCommand("select * from vwDocs_Measure_ForWeb where studyID = @studyID order by timepoint, studymeasname", Master.SqlConn);
				cmd.Parameters.Add(new SqlParameter("@studyID", System.Data.SqlDbType.Int));

				cmd.Parameters["@studyID"].Value = int.Parse(Request["studyid"]);

				SqlDataReader r = cmd.ExecuteReader();
				DataGrid1.DataSource = r;
				DataGrid1.DataBind();

				r.Close();

			}
			catch {}
		}

		protected string MakeDEFormLink(string sURL)
		{
			string result = string.Empty;
			if (sURL.Trim() == "")
				result = "";
			else if (sURL.Trim() == "NA")
				result = "--no data entry--";
			else
				result = "<a href=\"" + sURL + "\" >Enter Data</a>";

			return result;
		}

		protected string MakeDEDocsLink(string docPath, string sURL)
		{
			string result = string.Empty;
			if (sURL.Trim() == "")
				result = "";
			else
				result = "<a href=\"" + docPath.Trim() + sURL + "\" >DataEntry Instructions</a>";

			return result;
		}

        protected string MakeDEDocsVarMapLink(string docPath, string sURL)
        {
            string result = string.Empty;
            if (sURL.Trim() == "")
                result = "";
            else
                result = "<a href=\"" + docPath.Trim() + sURL + "\" target=\"Doc" + sURL + "\" >Data form/var map</a>";

            return result;
        }
        
        protected string MakeDEDocsNWLink(string docPath, string sURL)
		{
			string result = string.Empty;
			if (sURL.Trim() == "")
				result = "";
			else
				result = "<a href=\"" + docPath.Trim() + sURL + "\" target=\"Doc" + sURL + "\" >Meas Documentation</a>";

			return result;
		}

        protected string MakeDDlink(string link, string label)
        {
            string result = string.Empty;
            if (label== "Data Dictionary")
                result = "<a href=\"" + link.Trim() + "\" >" + label + "</a>";
            else
            result = label;

            return result;
        }
    }
}