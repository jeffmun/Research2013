using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using uwac;


public partial class _test_connstrings : System.Web.UI.Page
{

	

	private ReadConfig oConfig = new ReadConfig();

	protected void Page_Load(object sender, EventArgs e)
	{
		GetConnectionStrings();     //from web.config
									//GetXMLConnectionStrings();	//from APP_DATA/config.xml

		List<string> tbls = new List<string>() { "tblPerson", "tblStudy", "tblSubject" };


		GetCounts("backend", panel1, tbls);
		//GetCounts("abackend", panel2, tbls);
		GetCounts("vbackend", panel3, tbls);

		CountGroups();

		//read from FinMart
		GetCounts("FinMart", panel4, new List<string> { "fin_budget" });



	}



	protected void CountGroups()
	{

		SQL_utils sql = new SQL_utils("backend");

		string sqlcode = "select groupID, groupname from tblGroup where groupID in (select groupID from trk.fnSEC_Allowed_TRACKING_Groups_by_User()) and studyID=" + Master.Master_studyID.ToString();
		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		GridView gv = new GridView();
		gv.AutoGenerateColumns = true;
		gv.DataSource = dt;
		gv.DataBind();

		Literal lit = new Literal();
		lit.Text = sqlcode + "<br/><br/>";

		panel4.Controls.Add(lit);
		panel4.Controls.Add(gv);

		sql.Close();

	}



	protected void GetCounts(string db, Panel panel, List<string> tbls)
	{
		string identityname = (String.IsNullOrEmpty(HttpContext.Current.User.Identity.Name)) ? "NULL" : HttpContext.Current.User.Identity.Name;
		LabelUser.Text = "HttpContext.Identity = " + HttpContext.Current.User.Identity.ToString() +
			"  Name = " + identityname;

		try
		{
			SQL_utils sql = new SQL_utils(db);

			string sqluser = sql.StringScalar_from_SQLstring("select system_user");

			Label connstring = new Label() { Text = db + "<br/>" };
			connstring.Font.Bold = true;

			Label user = new Label() { Text = "SQL system_user = " + (String.IsNullOrEmpty(sqluser) ? "NULL" : sqluser) + "<br/>" } ;

			panel.Controls.Add(connstring);
			panel.Controls.Add(user);
			
			//List<string> tbls = new List<string>() { "tblPerson", "tblStudy", "tblSubject" };

			foreach (string s in tbls)
			{
				N n = GetCount(sql, "select count(*) from " + s);

				Label lbl = new Label();

				if (n.error == 1)
				{
					lbl.Text = n.errortext;
				}
				else
				{
					lbl.Text = s + " = " + n.count.ToString() + "<br/>";
				}

				panel.Controls.Add(lbl);
			}

			sql.Close();
		}
		catch (Exception ex)
		{
			LabelError1.Text = "#1 " + ex.Message + "  " + ex.InnerException;
		}


	}

	protected struct N {
		public int count;
		public int error;
		public string errortext;
	}

	protected N GetCount(SQL_utils sql, string sqlcode)
	{
		N n = new N();

		try{
			int count = sql.IntScalar_from_SQLstring(sqlcode);

			n.count = count;
			n.error = 0;
			n.errortext = "";
		}
		catch(Exception ex) {
			n.count = -999;
			n.error = 1;
			n.errortext = ex.InnerException.ToString();
		}
		
		return n;
	}


	protected void GetConnectionStrings()
	{
		ConnectionStringSettingsCollection settings =
			ConfigurationManager.ConnectionStrings;

		if (settings != null)
		{
			foreach (ConnectionStringSettings cs in settings)
			{
				lblConnStrings.Text += cs.Name + ". . ." + cs.ProviderName + ". . ." + cs.ConnectionString + "<br/>";
			}
		}
	}



	//These are from the APP_DATA/config.xml file
	protected void GetXMLConnectionStrings()
	{
		lblConnStrings.Text += "<br/><br/>";
		lblConnStrings.Text += "DEPRECATED";

		lblConnStrings.Text += Master.SqlConn.ConnectionString + "<br/>";

		SqlCommand cmd = new SqlCommand();
		cmd.Connection = Master.SqlConn;
		cmd.CommandType = CommandType.Text;
		cmd.CommandText = "select notes from tblperson where personID=1860";

		string x = (string)cmd.ExecuteScalar();

		lblConnStrings.Text += "<br/><br/>" + x;

	}


}