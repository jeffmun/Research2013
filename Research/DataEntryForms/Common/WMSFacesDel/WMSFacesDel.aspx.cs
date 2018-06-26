using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;

public partial class DataEntryForms_Common_WMSFacesDel_WMSFacesDel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DataEntryController1_DoScore(object sender, EventArgs e)
    {
            try
            {
                using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ConnectionString))
                {
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spScoreWMSDetail_ALL";
                        cmd.Parameters.AddWithValue("@pk", DataEntryController1.PrimaryKeyVal);
                        cmd.Parameters.AddWithValue("@studymeasid", DataEntryController1.StudyMeasID);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                DataEntryController1.AddNotification(string.Format("An exception ocurred while scoring: {0}", ex.Message));
                DataEntryController1.FormError = true;
            }
    }
}
