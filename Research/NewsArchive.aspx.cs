using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

using AutismCenterBase.Utilities;

public partial class NewsArchive : System.Web.UI.Page
{
	private ReadConfig oConfig = new ReadConfig();
	private SqlConnection oConn = new SqlConnection();
	private DBLookup oDBLookup;

	private void Page_Load(object sender, System.EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

		oDBLookup = new DBLookup(oConn);

		SqlCommand oCmd = new SqlCommand();
		oCmd.Connection = oConn;
		oCmd.CommandType = CommandType.StoredProcedure;
		oCmd.CommandTimeout = 90;
		oCmd.CommandText = "spGetAllNews";
		
		SqlDataReader oReader = oCmd.ExecuteReader();

		tblNews.DataSource = oReader;
		tblNews.DataBind();

		oReader.Close();
		oConn.Close();
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
		this.Load += new System.EventHandler(this.Page_Load);
	}
	#endregion
}
