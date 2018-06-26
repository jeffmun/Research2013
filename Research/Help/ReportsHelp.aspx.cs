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

namespace Help
{
	public partial class ReportsHelp : System.Web.UI.Page
	{
		SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString());

		private void Page_Load(object sender, System.EventArgs e)
		{
			oConn.Open();

			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;
			HtmlGenericControl oH2;
			HtmlGenericControl oH3;
			HtmlGenericControl oDesc;
			HtmlAnchor oLink;
			string sCategoryID = "";

			oCmd.Connection = oConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;
			oCmd.CommandText =	"SELECT	r.ReportID, " +
								"		r.ReportName, " +
								"		r.CommandText, " +
								"		r.IsActive, " +
								"		r.ReportTypeID, " +
								"		rt.ReportType, " +
								"		rt.ReportTypeCode, " +
								"		r.ReportCategoryID, " +
								"		rc.ReportCategory, " +
								"		rc.ReportCategoryCode, " +
								"		r.ReportDesc " +
								"FROM	RPT_Reports r " +
								"	INNER JOIN RPT_ReportCategories rc ON r.ReportCategoryID = rc.ReportCategoryID " +
								"	INNER JOIN RPT_ReportTypes rt ON r.ReportTypeID = rt.ReportTypeID " +
								"WHERE	r.IsActive = 1 " +
								"ORDER BY	rc.ReportCategory, r.ReportName";

			oReader = oCmd.ExecuteReader();

			while (oReader.Read())
			{
				if (sCategoryID != oReader["ReportCategoryID"].ToString())
				{
					oH2 = new HtmlGenericControl("h2");
					oH2.InnerHtml = oReader["ReportCategory"].ToString();
					divMain.Controls.Add(oH2);

					oLink = new HtmlAnchor();
					oLink.Name = oReader["ReportCategory"].ToString() + " Reports";
					divMain.Controls.Add(oLink);

					sCategoryID = oReader["ReportCategoryID"].ToString();
				}

				oLink = new HtmlAnchor();
				oH3 = new HtmlGenericControl("h3");
				oDesc = new HtmlGenericControl("p");

				oLink.Name = oReader["ReportName"].ToString() + oReader["ReportID"].ToString();
				oH3.InnerHtml = oReader["ReportName"].ToString();
				oDesc.InnerHtml = oReader["ReportDesc"].ToString();

				if (oDesc.InnerHtml == "") {oDesc.InnerHtml = "TBD";}

				divMain.Controls.Add(oLink);
				divMain.Controls.Add(oH3);
				divMain.Controls.Add(oDesc);
			}

			oReader.Close();
			oConn.Close();
		}

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
