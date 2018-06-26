using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;


public partial class Genetics_GeneEvents : System.Web.UI.Page
{

	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private SqlConnection oConnGene = new SqlConnection();

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();


	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();

		if (!IsPostBack)
		{
			populate_ListBoxes();
			populate_files();
			
		}
	}


	protected void populate_files()
	{
		populate_GridView("select filepk, FileName, SheetName from uwac_genetics..geneevent_files order by 1", gvFiles);
	}
	

	protected void populate_ListBoxes()
	{

		populate_ListBox("select method, method + ' ..... N=' + cast(count(*) as varchar)   as txt from vwGeneEvents group by method", lstMethod, "method", "txt");
		populate_ListBox("select event_type, event_type + ' ..... N=' + cast(count(*) as varchar)   as txt from vwGeneEvents where event_type is not null group by event_type", lstEvent_type, "event_type", "txt");
		populate_ListBox("select region, region + ' ..... N=' + cast(count(*) as varchar)   as txt from vwGeneEvents where region is not null group by region", lstRegion, "region", "txt");
		populate_ListBox("select inheritance, inheritance + ' ..... N=' + cast(count(*) as varchar)   as txt from vwGeneEvents where inheritance is not null group by inheritance", lstInheritance, "inheritance", "txt");
		populate_ListBox("select studyname, studyname + ' ..... N=' + cast(count(*) as varchar)   as txt from vwGeneEvents where studyname is not null group by studyname order by studyname", lstStudy, "studyname", "txt");

		populate_ListBox("select gene, gene+ '......N=' + cast(count(*) as varchar)   as txt from vwGeneEvents where gene is not null group by gene", lstGene, "gene", "txt");

		//add study, gene, region 

	}

	protected void populate_ListBox(string sqltext, ListBox lst, string valuefld, string textfld)
	{

		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConn;
		cmd.CommandType = CommandType.Text;
		cmd.CommandText = sqltext;

		DataTable dt = new DataTable();
		SqlDataAdapter da = new SqlDataAdapter(cmd);
		da.Fill(dt);

		lst.DataSource = dt;
		lst.DataValueField = valuefld;
		lst.DataTextField = textfld;

		lst.DataBind();
	}

	protected void populate_GridView(string sqltext, GridView gv)
	{

		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConn;
		cmd.CommandType = CommandType.Text;
		cmd.CommandText = sqltext;

		DataTable dt = new DataTable();
		SqlDataAdapter da = new SqlDataAdapter(cmd);
		da.Fill(dt);

		gv.DataSource = dt;

		gv.DataBind();
	}

	protected DataTable DataTable_from_ListBox(ListBox lst, string fld)
	{
		DataTable dt = new DataTable();
		dt.Columns.Add("fld", typeof(string));
		dt.Columns.Add("value", typeof(string));
		foreach(ListItem i in lst.Items)
		{
			if (i.Selected)
			{
				//lblInfo.Text += "foo";
				dt.Rows.Add(fld, i.Value.ToString());
			}
			else
			{
				//lblInfo.Text += "fum";
			}
		}

		return (dt);
	}


	protected void populate_GridView()
	{
		lblResults.Text = "";
		lblFileinfo.Text = "";

		DataTable dt1 = DataTable_from_ListBox(lstMethod, "method");
		DataTable dt2 = DataTable_from_ListBox(lstRegion, "region");
		DataTable dt3 = DataTable_from_ListBox(lstEvent_type, "event_type");
		DataTable dt4 = DataTable_from_ListBox(lstInheritance, "inheritance");
		DataTable dt5 = DataTable_from_ListBox(lstInheritance, "studyname");
		DataTable dt6 = DataTable_from_ListBox(lstGene, "gene");


		SqlCommand sqlCmd = new SqlCommand("spGeneEvents", oConn);
		sqlCmd.CommandType = CommandType.StoredProcedure;
		SqlParameter param1 = sqlCmd.Parameters.AddWithValue("@method", dt1);       //Needed TVP
		SqlParameter param2 = sqlCmd.Parameters.AddWithValue("@region", dt2);
		SqlParameter param3 = sqlCmd.Parameters.AddWithValue("@event_type", dt3); 
		SqlParameter param4 = sqlCmd.Parameters.AddWithValue("@inheritance", dt4);
		SqlParameter param5 = sqlCmd.Parameters.AddWithValue("@studyname", dt5);
		SqlParameter param6 = sqlCmd.Parameters.AddWithValue("@gene", dt6); 

		param1.SqlDbType = SqlDbType.Structured; //tells ADO.NET we are passing TVP
		param2.SqlDbType = SqlDbType.Structured; 
		param3.SqlDbType = SqlDbType.Structured;
		param4.SqlDbType = SqlDbType.Structured;
		param5.SqlDbType = SqlDbType.Structured;
		param6.SqlDbType = SqlDbType.Structured; 

		SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
		DataTable dt = new DataTable();
		da.Fill(dt);

		string results = "Query returned " + dt.Rows.Count.ToString() + " records.";
		lblResults.Text = results;

		gvGeneEvents.DataSource = dt;
		gvGeneEvents.DataBind();

		UpdatePanel1.Update();

	}

	protected void btnSearch_Click(object sender, EventArgs e)
	{
		gvDetails.Visible = false;
		populate_GridView();
	}

	protected void btnDetails_Command(object sender, CommandEventArgs e)
	{
		Button b = (Button)sender;

		GridViewRow row = (GridViewRow)b.NamingContainer;

		int rowindex = row.RowIndex;

		HighlightRow(rowindex);

		if (e.CommandName == "details")
		{

			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oConn;
			cmd.CommandType = CommandType.Text;
			cmd.CommandText = "exec spGeneEvents_Details '" + e.CommandArgument.ToString() + "'";

			DataTable dt = new DataTable();
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			da.Fill(dt);

			gvDetails.DataSource = dt;

			gvDetails.DataBind();
			gvDetails.Visible = true;

			oConn.Open();
			SqlCommand cmd2 = new SqlCommand();
			cmd2.Connection = oConn;
			cmd2.CommandType = CommandType.Text;
			cmd2.CommandText = "spGeneEvents_Details_FileInfo '" + e.CommandArgument.ToString() + "'";
			string fileinfo = (string)cmd2.ExecuteScalar();

			lblFileinfo.Text = fileinfo;


		}
	}

	protected void HighlightRow(int idx)
	{
		foreach (GridViewRow row in gvGeneEvents.Rows)
		{
			if(row.RowIndex==idx) row.BackColor = Color.YellowGreen;
			else row.BackColor = Color.White;
		}

	}



}