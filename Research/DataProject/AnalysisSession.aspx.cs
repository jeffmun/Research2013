using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class DataProject_AnalysisSession : BasePage
{

	public string path;
	public string pathcache;
	public string serverpath;
	public string serverpathcache;
	public List<string> htmltables = new List<string>();

	#region Page Setup
	protected void Page_Init(object sender, EventArgs e)
	{
		
		this.Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
		Session["studyID"] = this.Master.Master_studyID.ToString();
	}


	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("AnalysisSession.aspx");
	}



	#endregion

	protected void Page_Load(object sender, EventArgs e)
	{
		path = "~/_temp/AnalysisSession/";
		pathcache = "~/_temp/AnalysisSession/Thumb";
		serverpath = Server.MapPath(path);
		serverpathcache = Server.MapPath(pathcache);

		int pk = Convert.ToInt32(Request.QueryString["pk"]);
		string file = Request.QueryString["file"];

		//http://localhost:60094/DataProject/AnalysisSession.aspx?mode=new&file=Proj_5169_Data_20181116_1548.xlsx

		if (pk==0 & file != null)
		{
			NewSession( file);
		}
		else if (pk > 0 & file != null)
		{
			ExistingSession(file, pk);
			//LoadPix(CreatePixTable());
			//LoadTable("h1.txt");
			//LoadTable("h2.txt");
			//LoadTable("h3.txt");
		}

		Session["analysissessionfile"] = Request.QueryString["file"];
	}

	protected void NewSession(string file)
	{
		//string mode = Request.QueryString["mode"];
		//string file = Request.QueryString["filename"];

		//http://localhost:60094/DataProject/AnalysisSession.aspx?mode=new&file=Proj_5169_Data_20181116_1548.xlsx

		SQL_utils sql = new SQL_utils("data");

		string code1 = String.Format("select coalesce(max(pk),0) maxpk from dp.analysissession where createdBy=sec.systemuser() and filename='{0}'", file);
		int newpk = sql.IntScalar_from_SQLstring(code1) + 1;

		int dataproj_pk = sql.IntScalar_from_SQLstring("select dataproj_pk from dp.Download where  filename = '" + file + "'");

		string sqlcode = String.Format("insert into dp.analysissession(pk, dataproj_pk, filename, createdBy, created) select {0},{1},'{2}',sec.systemuser(),getdate()", newpk, dataproj_pk, file );
		sql.NonQuery_from_SQLstring(sqlcode);

		sql.Close();

		string title = String.Format("Session #{0}</br>  File: {1}", newpk, file);
		lbltitle.Text = title;

	}

	protected void ExistingSession(string file, int pk)
	{
		//string mode = Request.QueryString["mode"];
		//string file = Request.QueryString["filename"];

		//http://localhost:60094/DataProject/AnalysisSession.aspx?mode=new&file=Proj_5169_Data_20181116_1548.xlsx

		SQL_utils sql = new SQL_utils("data");


		string code1 = String.Format(" select * from dp.analysissession where createdBy=sec.systemuser() and filename='{0}' and pk={1}", file, pk);

		DataTable dt = sql.DataTable_from_SQLstring(code1);


		sql.Close();

		string title = String.Format("Session #{0}</br>  File: {1}", pk, file);
		lbltitle.Text = title;

		DataTable dt_plot = CreatePlotTable(file, pk);
		gridplots.DataSource = dt_plot;
		gridplots.DataBind();
		LoadPlots(dt_plot);

		DataTable dt_output = CreateOutputTable(file, pk);
		gridtables.DataSource = dt_output;
		gridtables.DataBind();
		//LoadOutput(dt_output);

		cardview.DataSource = dt_output;
		cardview.DataBind();


	}


	protected DataTable CreatePlotTable(string file, int pk)
	{
		List<string> files = Directory.GetFiles(serverpath).ToList();

		string usr = (Master.Master_netid == null) ? "jeffmun" : Master.Master_netid;

		string match = String.Format("PK{0}_{1}_{2}_PN", pk, file.Replace(".xlsx",""), usr);

		List<string> matchingfiles = new List<string>();

		foreach(string f in files)
		{
			if (f.Contains(match)) matchingfiles.Add(f);
		}

		DataTable dt = new DataTable();
		DataColumn c0 = new DataColumn("filenamepath", typeof(string));
		DataColumn c1 = new DataColumn("filename", typeof(string));
		DataColumn c2 = new DataColumn("notes", typeof(string));
		DataColumn c3 = new DataColumn("index", typeof(Int32));

		dt.Columns.Add(c0);
		dt.Columns.Add(c1);
		dt.Columns.Add(c2);
		dt.Columns.Add(c3);

		for (int i = 0; i < matchingfiles.Count; i++)
		{
			DataRow row = dt.NewRow();
			row["filenamepath"] = (String.Format("~/_temp/AnalysisSession/{0}",matchingfiles[i].Replace(serverpath, "")));
			row["filename"] = matchingfiles[i].Replace(serverpath, "");
			row["index"] = i;
			dt.Rows.Add(row);
		}

		Session["dt_plots"] = dt;
		return dt;
	}



	protected DataTable CreateOutputTable(string file, int pk)
	{
		List<string> files = Directory.GetFiles(serverpath).ToList();

		string usr = (Master.Master_netid == null) ? "jeffmun" : Master.Master_netid;

		string match = String.Format("PK{0}_{1}_{2}_TN", pk, file.Replace(".xlsx", ""), usr);

		List<string> matchingfiles = new List<string>();

		foreach (string f in files)
		{
			if (f.Contains(match)) matchingfiles.Add(f);
		}

		DataTable dt = new DataTable();
		DataColumn c0 = new DataColumn("filenamepath", typeof(string));
		DataColumn c1 = new DataColumn("filename", typeof(string));
		DataColumn c2 = new DataColumn("contents", typeof(string));
		DataColumn c3 = new DataColumn("index", typeof(Int32));
		DataColumn c4 = new DataColumn("type", typeof(string));

		dt.Columns.Add(c0);
		dt.Columns.Add(c1);
		dt.Columns.Add(c2);
		dt.Columns.Add(c3);
		dt.Columns.Add(c4);

		for (int i = 0; i < matchingfiles.Count; i++)
		{
			DataRow row = dt.NewRow();
			row["filenamepath"] = (String.Format("~/_temp/AnalysisSession/{0}", matchingfiles[i].Replace(serverpath, "")));
			row["filename"] = matchingfiles[i].Replace(serverpath, "");
			row["index"] = i;
			row["contents"] = LoadOutput(matchingfiles[i].Replace(serverpath, ""));
			dt.Rows.Add(row);
		}

		Session["dt_output"] = dt;
		return dt;
	}


	protected string LoadOutput(string filename)
	{
		string tblpath = Server.MapPath(String.Format("~/_temp/AnalysisSession/{0}", filename));


		string[] lines = System.IO.File.ReadAllLines(tblpath);

		string littext = String.Format("<br/><br/><b>{0}</b>", filename);


		Literal lit = new Literal();
		foreach (string line in lines)
		{
			// Use a tab to indent each line of the file.
			littext += line;
		}

		return littext;
	}



	protected void LoadOutputFile(string filename)
	{
		string tblpath = Server.MapPath(String.Format("~/_temp/AnalysisSession/{0}", filename));


		string[] lines = System.IO.File.ReadAllLines(tblpath);

		string littext = "";


		Literal lit = new Literal();
		foreach (string line in lines)
		{
			// Use a tab to indent each line of the file.
			littext += line;
		}
		lit.Text = littext;
		htmltables.Add(littext);
		panel.Controls.Add(lit);
	}

	protected void LoadPlots(DataTable dt)
	{

		imageGallery.DataSource = dt;
		imageGallery.ImageUrlField = "filenamepath";
		imageGallery.DataBind();

		imageSlider.DataSource = dt;
		imageSlider.ImageUrlField = "filenamepath";
		imageSlider.DataBind();

	}

	protected void LoadOutput(DataTable dt)
	{
		foreach(DataRow row in dt.Rows)
		{
			string filename = row["filename"].ToString();
			LoadOutputFile(filename);
		}

	}



	protected void btnRefresh_Click(object sender, EventArgs e)
	{
		//LoadPix(CreatePixTable());
	}


	protected void btnExportWord_OnClick(object sender, EventArgs e)
	{
		//save to word

		DataTable dt_plots = (DataTable)Session["dt_plots"];
		DataTable dt_output = (DataTable)Session["dt_output"];

		string wordfilename = String.Format("Session{0}_{1}_{2}.docx", Request.QueryString["pk"], Request.QueryString["file"].Replace(".xlsx", ""), Master.Master_netid);

		string savefile = Server.MapPath(String.Format("~/App_Data/AnalysisDownloads/{0}", wordfilename));
		string outputtitle = String.Format("Analysis Session #{0}", Request.QueryString["pk"]);


		if (dt_plots != null)
		{
			if(dt_plots.Rows.Count > 1)
			{
				//DxDoc doc = new DxDoc(dt_plots, dt_output, serverpath, savefile, outputtitle, Session["analysissessionfile"].ToString(), Master.Master_userfullname); //MakeDocx

				//DxDoc doc = new DxDoc(dt_plots, dt_output, serverpath, savefile, outputtitle, Session["analysissessionfile"].ToString(), Master.Master_userfullname); //MakeDocx

			}
		}

	}

}