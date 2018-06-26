﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
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

public partial class Info_MyStudyInfo : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private DBLookup oDBLookup;

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();

	private int qs_studyID;
	private string qs_studyname;
	private int studymeasID;
	private int measureID;
	private string measurename;
	private string measurename_nameonly;
	private int[] studies;
	private int _content_studyID;
	private string _content_studyname;

	private string previousRowValue = "";
	private string previousRowValue2 = "";
	private int firstRow = 0;

	private bool debugprint = false;

	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}


	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		GetCurrentDefaultStudyID();
		//Populate_DDL_SelectMeasureID(0);  //load the DDL with the measures in this study
		LoadGrids();
	}


	//protected string MySelectedMeasureID
	//{
	//    get
	//    {
	//        return (ViewState["MySelectedMeasureID"] == null) ? null : ViewState["MySelectedMeasureID"].ToString();
	//    }
	//    set
	//    {
	//        ViewState["MySelectedMeasureID"] = value;
	//    }
	//}

	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

		oDBLookup = new DBLookup(oConn);


		GetCurrentDefaultStudyID();

		LoadGrids();

		////TOHANDLE VIEWSTATE
		//// Check if the selectedValue has changed.
		//string selectedValue = Request[DDL_SelectMeasureID.UniqueID];
		//if (selectedValue != MySelectedMeasureID)
		//{
		//    // Value has changed, do whatever you would do in the SelectedIndexChanged event here.
		//}
		//MySelectedMeasureID = selectedValue;

		//// TODO: Populate the drop-down control
		//Populate_DDL_SelectMeasureID(0);

		//// set the set the selectedValue on the drop-down
		//if (selectedValue != null)
		//{
		//    DDL_SelectMeasureID.Items.FindByValue(selectedValue).Selected = true;
		//}


		if (!IsPostBack)
		{
			//Process_QueryString();
		}


	}


	protected void LoadGrids()
	{
		Populate_GridView("GridView_01", "select * from vwSEC_MyStudyInfo order by StudyName, groupname");

	   // Populate_GridView("GridView_02", "select * from tblGroup where studyID = " + _content_studyID.ToString());

	}


	protected void GetCurrentDefaultStudyID()
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-------> GetCurrentDefaultStudyID <br/>";

		SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("exec spSEC_Get_Default_StudyID_for_User", oConn);
		DataTable dt = new DataTable();
		SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
		sqlAdapter.Fill(dt);

		foreach (DataRow row in dt.Rows)
		{
			_content_studyID = Convert.ToInt16(row["defaultstudyID"]);
			_content_studyname = Convert.ToString(row["studyname"]);
		}


		lblINTRO_studyname.Text = "Study: ";
		lblStudyname_ContentPage.Text = _content_studyname;
	}


	//public void Process_QueryString()
	//{
	//    if (Page.Request.QueryString["studymeasID"] != null)
	//    {
	//        if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----------> Process_QueryString <br/>";

	//        studymeasID = int.Parse(Page.Request.QueryString["studymeasid"]);

	//        SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("select measureID, measname, studyID, studyname from vwstudymeas where studymeasID= " + studymeasID.ToString(), oConn);
	//        DataTable dt = new DataTable();
	//        SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
	//        sqlAdapter.Fill(dt);

	//        foreach (DataRow row  in dt.Rows)
	//        {
	//            measureID = Convert.ToInt16(row["measureID"]);
	//            measurename= "Data Dictionary for " + Convert.ToString(row["measname"]);
	//            measurename_nameonly = "Data Dictionary for " + Convert.ToString(row["measname"]);
	//            qs_studyID = Convert.ToInt16(row["studyID"]);
	//            qs_studyname = Convert.ToString(row["studyname"]);
	//        }

	//        if (measureID > 0)
	//        {

	//            if (_content_studyID != qs_studyID)
	//            {
	//                Populate_DDL_SelectMeasureID(qs_studyID);
	//                lblStudyname_ContentPage.Text = qs_studyname;
	//            }
	//            else
	//            {
	//                Populate_DDL_SelectMeasureID(0);
	//            }

	//            //update the selected value of a DDL with this:  final parameter is a string of the value (usually int) of the DDL
	//            DDL_SelectMeasureID.SelectedIndex = DDL_SelectMeasureID.Items.IndexOf(DDL_SelectMeasureID.Items.FindByValue(measureID.ToString()));

	//            //Fill the Grid since we have a measure from the querystring 
	//            Populate_GridView_DataDict();

	//        }

	//        //No querystring parameter    
	//        else
	//        {
	//            Populate_DDL_SelectMeasureID(0);
	//        }

	//    }
	//}




	protected void Populate_GridView(string gv_name, string mycmd)
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "<br/>---> Populate:" + gv_name + "  <br/>";

		try
		{

			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "--> mycmd: " + mycmd + "<br/>";

			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(mycmd, oConn);
			SqlDataReader sqlReader = sqlCmd.ExecuteReader();
			DataTable dt = new DataTable();
			dt.Load(sqlReader);

			GridView gv = new GridView();
			gv.RowDataBound += new GridViewRowEventHandler(gv_RowDataBound);  // Use RowDataBound to control the visibility of cells

			gv.DataSource = dt;
			gv.DataBind();


			Panel1.Controls.Add(gv);
		}


		catch (SqlException oException)
		{
			foreach (SqlError oErr in oException.Errors)
			{
				tblmyinfo.Rows[0].Cells[0].InnerHtml += oErr.Message;
			}
		}

	}





	protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
	{

		GridView mygv = (GridView)e.Row.NamingContainer;

		if (e.Row.RowType == DataControlRowType.DataRow)
		{

			LogToPage(mygv.ToString() + "<br/>");

			//We're only interested in Rows that contain data
			//get a reference to the data used to databound the row
			DataRowView drv = ((DataRowView)e.Row.DataItem);

			//Hide duplicates of the first column 

			//Hide first column only for these grids
			//if (mygv.ID == "GridView_StudyAction" || mygv.ID == "GridView_StudyMeas")
			if (1==1)
				{
				if (previousRowValue == drv[0].ToString())
				{
					//If it's the same category as the previous one
					//Increment the rowspan
					try
					{
						if (mygv.Rows[firstRow].Cells[0].RowSpan == 0)
							mygv.Rows[firstRow].Cells[0].RowSpan = 2;
						else
							mygv.Rows[firstRow].Cells[0].RowSpan += 1;
						//Remove the cell
						e.Row.Cells.RemoveAt(0);
					}
					catch
					{
						LogToPageUrgent("*error* <br/>");
					}

				}
				else //It's a new category
				{
					//Set the vertical alignment to top
					e.Row.VerticalAlign = VerticalAlign.Top;
					//Maintain the category in memory
					previousRowValue = drv[0].ToString();
					firstRow = e.Row.RowIndex;
				}

			}

		}
	}


	private void LogToPage(string text)
	{

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += text + "<br/>";
	}

	private void LogToPageUrgent(string text)
	{

		tblmyinfo.Rows[0].Cells[0].InnerHtml += text + "<br/>";
	}

}



