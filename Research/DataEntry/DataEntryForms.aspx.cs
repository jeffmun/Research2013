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

namespace DataEntryForms
{
	public partial class DataEntryForms : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlCommand sqlCommand1;

		private ReadConfig oConfig = new ReadConfig();

		private void Page_Load(object sender, System.EventArgs e)
		{
			int studyid = -1;

			try 
			{
				studyid = int.Parse(Request.QueryString["studyid"]);
			}
			catch {}

			if (studyid == -1)
				this.sqlCommand1.Parameters["@studyid"].Value = DBNull.Value;
			else
				this.sqlCommand1.Parameters["@studyid"].Value = studyid;

			sqlCommand1.Connection = Master.SqlConn;
			SqlDataReader r = this.sqlCommand1.ExecuteReader();
			DataGrid1.DataSource = r;
			DataGrid1.DataBind();
			r.Close();
		
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			System.Configuration.AppSettingsReader configurationAppSettings = new System.Configuration.AppSettingsReader();
			this.sqlCommand1 = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlCommand1
			// 
			this.sqlCommand1.CommandText = @"SELECT tblstudymeas.*, tblmeasure.measname, tblmeasure.measfullname, tblstudy.studyname FROM tblstudymeas INNER JOIN tblmeasure ON tblstudymeas.measureID = tblmeasure.measureID INNER JOIN tblstudy ON tblstudymeas.studyID = tblstudy.studyID WHERE (tblstudymeas.studyID = @studyid) OR (@studyid IS NULL) ORDER BY tblstudymeas.studyID, tblmeasure.measname";
			this.sqlCommand1.Connection = Master.SqlConn;
			this.sqlCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4, "studyID"));
			// 
			// sqlConnection1
			// 
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
