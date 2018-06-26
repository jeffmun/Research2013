using System;
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

public partial class Info_DataDictionary : System.Web.UI.Page
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
	private int _content_studyID ;
	private string  _content_studyname ;

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
		Populate_DDL_SelectMeasureID(0);  //load the DDL with the measures in this study
	}


	protected string MySelectedMeasureID
	{
		get
		{
			return (ViewState["MySelectedMeasureID"] == null) ? null : ViewState["MySelectedMeasureID"].ToString();
		}
		set
		{
			ViewState["MySelectedMeasureID"] = value;
		}
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

		oDBLookup = new DBLookup(oConn);


		GetCurrentDefaultStudyID();
		


		//TOHANDLE VIEWSTATE
		// Check if the selectedValue has changed.
		string selectedValue = Request[DDL_SelectMeasureID.UniqueID];
		if (selectedValue != MySelectedMeasureID)
		{
			// Value has changed, do whatever you would do in the SelectedIndexChanged event here.
		}
		MySelectedMeasureID = selectedValue;

		// TODO: Populate the drop-down control
		Populate_DDL_SelectMeasureID(0);

		// set the set the selectedValue on the drop-down
		if (selectedValue != null)
		{
			DDL_SelectMeasureID.Items.FindByValue(selectedValue).Selected = true;
		}


		if (!IsPostBack)
		{
			Process_QueryString();
		}


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


	public void Process_QueryString()
	{
		if (Page.Request.QueryString["studymeasID"] != null)
		{
			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----------> Process_QueryString <br/>";

			studymeasID = int.Parse(Page.Request.QueryString["studymeasid"]);
			
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("select measureID, measname, studyID, studyname from vwstudymeas where studymeasID= " + studymeasID.ToString(), oConn);
			DataTable dt = new DataTable();
			SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
			sqlAdapter.Fill(dt);

			foreach (DataRow row  in dt.Rows)
			{
				measureID = Convert.ToInt16(row["measureID"]);
				measurename= "Data Dictionary for " + Convert.ToString(row["measname"]);
				measurename_nameonly = "Data Dictionary for " + Convert.ToString(row["measname"]);
				qs_studyID = Convert.ToInt16(row["studyID"]);
				qs_studyname = Convert.ToString(row["studyname"]);
			}

			if (measureID > 0)
			{

				if (_content_studyID != qs_studyID)
				{
					Populate_DDL_SelectMeasureID(qs_studyID);
					lblStudyname_ContentPage.Text = qs_studyname;
				}
				else
				{
					Populate_DDL_SelectMeasureID(0);
				}

				//update the selected value of a DDL with this:  final parameter is a string of the value (usually int) of the DDL
				DDL_SelectMeasureID.SelectedIndex = DDL_SelectMeasureID.Items.IndexOf(DDL_SelectMeasureID.Items.FindByValue(measureID.ToString()));

				//Fill the Grid since we have a measure from the querystring 
				Populate_GridView_DataDict();

			}
		
			//No querystring parameter    
			else
			{
				Populate_DDL_SelectMeasureID(0);
			}

		}
	}



	protected void DDL_SelectMeasureID_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "--> DDL_SelectMeasureID_SelectedIndexChanged <br/>";


		measureID = Convert.ToInt16(DDL_SelectMeasureID.SelectedValue);
		measurename = Convert.ToString(DDL_SelectMeasureID.SelectedItem);

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += " :::IdxChanged::: " +  measureID.ToString() + " - "  + measurename + "<br/>";

		lblINTRO_measname.Text = "Data Dictionary for: ";
		lblMeasName_ContentPage.Text = measurename;


		Populate_GridView_DataDict();

	}


	protected void Populate_DDL_SelectMeasureID(int manual_studyID)
	{

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "---> Populate_DDL_SelectMeasureID <br/>";

		
		string sqlCmd2_text; 

		if (manual_studyID > 0)
		{
			sqlCmd2_text= "exec spStudyMeas_by_StudyID__for_DataDict " +  manual_studyID.ToString();
		}
		else
		{
			sqlCmd2_text = "exec spStudyMeas_by_DefaultStudyID__for_DataDict";
		}
		SqlCommand sqlCmd2 = new System.Data.SqlClient.SqlCommand(sqlCmd2_text, oConn);

		SqlDataReader sqlReader2 = sqlCmd2.ExecuteReader();
		DataTable dt2 = new DataTable();
		dt2.Load(sqlReader2);

		DDL_SelectMeasureID.DataSource = dt2;
		DDL_SelectMeasureID.DataBind();

		//update the studyname labels

		//hide the grid
			GridView_DataDict.Visible = false;
		//hide the measname label
		lblINTRO_measname.Visible = false;
		lblMeasName_ContentPage.Visible = false;

	}


	protected void Populate_GridView_DataDict()
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "<br/>---> Populate_GridView_DataDict <br/>";

		try
		{
		
		string mycmd = "exec spDataDict_by_measureID " + DDL_SelectMeasureID.SelectedValue.ToString();

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "=Pop GridView=" + mycmd + ".<br/>";

			SqlCommand sqlCmd3 = new System.Data.SqlClient.SqlCommand(mycmd, oConn);
			SqlDataReader sqlReader3 = sqlCmd3.ExecuteReader();
			DataTable dt3 = new DataTable();
			dt3.Load(sqlReader3);

			GridView_DataDict.DataSource = dt3;
			GridView_DataDict.CssClass = "DataDictCell";
			GridView_DataDict.DataBind();

			lblMeasName_ContentPage.Text = measurename;

			GridView_DataDict.Visible = true;

			lblINTRO_measname.Visible = true;
			lblMeasName_ContentPage.Visible = true;

		}


		catch (SqlException oException)
		{
			foreach (SqlError oErr in oException.Errors)
			{
				tblmyinfo.Rows[0].Cells[0].InnerHtml += oErr.Message;
			}
		}

	}




}



