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

namespace Measures
{
	public partial class CopyAction : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
			SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString());
			oConn.Open();

			int nActionID = Convert.ToInt32(Request["ActionID"].ToString());
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = oConn;
			oCmd.CommandText = "spCopyAction";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@ActionID", nActionID);
			oCmd.Parameters.AddWithValue("@CopyMeasures", false);
			oCmd.Parameters.AddWithValue("@ReturnValue", DBNull.Value);

			oCmd.Parameters["@ReturnValue"].Direction = ParameterDirection.ReturnValue;

			oCmd.ExecuteNonQuery();
			oConn.Close();

			Response.Redirect(Request.ApplicationPath + "/Measures/EditAction.aspx?ActionID=" + oCmd.Parameters["@ReturnValue"].Value.ToString(), true);
		}
	}
}
