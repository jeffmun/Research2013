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

public partial class Info_StudyDesign2 : System.Web.UI.Page
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
	private int _content_timepointID = 0;
	public int _content_studyactionID = 0;
	public int _content_consentformID = 0;

	public int _content_sourceSM = 0;
	public int _content_destSA = 0;

	private int _content_num_timepoints;

	private string  _content_studyname ;

	private bool debugprint = false;

	private string previousRowValue = "";
	private string previousRowValue2 = "";
	private int firstRow = 0;
	private int thisRow = 0;

	int _columncount ;
	string[] _colnames ;
	string[] _url1 ;
	bool[] _colvisible ;
	int _EnableEditing;

	//TODO:
	//add delete buttons for Studyaction
	//for specific groups


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



	protected void Page_Load(object sender, EventArgs e)
	{
		if (oLogin.CheckGroupPermissions("StudyDesign group".Split(',')))
		{           //enable editing here 
			_EnableEditing = 1;
		}
		else { _EnableEditing = 0; }


		lblMyError.Text = "";
		lblMyInfo.Text = "";
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

	#region Load Grids
	protected void LoadGrids()
	{

		if (_EnableEditing == 1)
		{
			btnAddGroup.Visible = true;
			btnAddTimepoint.Visible = true;
			btnShowHideProblems.Visible = true;
		}
		else
		{
			btnAddGroup.Visible = false;
			btnAddTimepoint.Visible = false;
			btnShowHideProblems.Visible = false;
		}

		LoadGrid_Groups();
		LoadGrid_Timepoints();
		LoadGrid_Studyaction();
		LoadGrid_Studymeas();
		LoadGrid_Studyconsent();
		LoadGrid_StudyAction_StudyMeas();
		LoadGrid_StudyAction_Consent();
		LoadGrid_Problems();



//        string[] hidecols = new string[2];
//        hidecols[0] = "SortOrder";
 //       Populate_GridView_AutoGenerateColumns("GridView_04", "select * from vwSEC_StudyDesign__StudyMeasures order by timepoint_num, sortorder, category", "Measures", "PanelR2C1");

	}


	protected void LoadGrid_Groups()
	{
		PanelR1C1.Controls.Clear();
		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_Group", "select 0 as chk_Include, groupID, GroupName, GoalN, [Desc] as Description from tblGroup where studyID = " + _content_studyID.ToString(), "Groups", "PanelR1C1");
		}
		else
		{
			Populate_GridView("GridView_Group", "select groupID, GroupName, GoalN, [Desc] as Description from tblGroup where studyID = " + _content_studyID.ToString(), "Groups", "PanelR1C1");
		}


		Panel_AddTimepoint.Visible = false;
		Panel_AddGroup.Visible = false;
	}

	protected void LoadGrid_Timepoints()
	{
		PanelR1C2.Controls.Clear();
		if (_content_num_timepoints >= 1)
		{
			if (_EnableEditing==1)
			{
				Populate_GridView("GridView_Timepoint", "select timepoint as #, timepoint_text as Name, ddl_label as [Var Rename Pattern], timepointID as btn_AddAction " +
					" from tblTimepoint a  join tblVar_Rename_Pattern b ON a.default_vrpID = b.vrpID where studyID = " +
					_content_studyID.ToString() + " order by timepoint", "Time Points", "PanelR1C2");
			}
			else
			{
				Populate_GridView("GridView_Timepoint", "select timepoint as #, timepoint_text as Name, ddl_label as [Var Rename Pattern] " +
			" from tblTimepoint a  join tblVar_Rename_Pattern b ON a.default_vrpID = b.vrpID where studyID = " +
			_content_studyID.ToString() + " order by timepoint", "Time Points", "PanelR1C2");
			}

		}

		Panel_AddTimepoint.Visible = false;
		Panel_AddGroup.Visible = false;
	}



	protected void LoadGrid_Studyaction()
	{
		PanelR2C1.Controls.Clear();
		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_StudyAction", "exec spSEC_StudyDesign__StudyActions 1", "Actions", "PanelR2C1");
		}
		else
		{
			Populate_GridView("GridView_StudyAction", "exec spSEC_StudyDesign__StudyActions 0", "Actions", "PanelR2C1");
		}
	}



	protected void LoadGrid_Studymeas()
	{
		PanelR3C1.Controls.Clear();
		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_StudyMeas", "exec spSEC_StudyDesign__StudyMeas 1", "Measures", "PanelR3C1");
		}
		else
		{
			Populate_GridView("GridView_StudyMeas", "exec spSEC_StudyDesign__StudyMeas 0", "Measures", "PanelR3C1");
		}
	}

	protected void LoadGrid_Studyconsent()
	{
		PanelR4C1.Controls.Clear();
		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_StudyConsent", "exec spSEC_StudyDesign__StudyConsents 1", "Consents", "PanelR4C1");
		}
		else
		{
			Populate_GridView("GridView_StudyConsent", "exec spSEC_StudyDesign__StudyConsents 0", "Consents", "PanelR4C1");
		}
	}


	protected void LoadGrid_StudyAction_StudyMeas()
	{
		PanelR5C1.Controls.Clear();
		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_StudyAction_StudyMeas", "exec spSEC_StudyDesign__StudyActions_StudyMeas 1", "Actions > Measures", "PanelR5C1");
		}
		else
		{
			Populate_GridView("GridView_StudyAction_StudyMeas", "exec spSEC_StudyDesign__StudyActions_StudyMeas 0", "Actions > Measures", "PanelR5C1");
		}
	}

	protected void LoadGrid_StudyAction_Consent()
	{
		PanelR6C1.Controls.Clear();

		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_StudyAction_StudyConsents", "exec spSEC_StudyDesign__StudyActions_StudyConsents 1", "Actions > Consents", "PanelR6C1");
		}
		else
		{
			Populate_GridView("GridView_StudyAction_StudyConsents", "exec spSEC_StudyDesign__StudyActions_StudyConsents 0", "Actions > Consents", "PanelR6C1");
		}
	}


	protected void LoadGrid_Problems()
	{
		PanelR7C1.Controls.Clear();

		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_Problems", "exec spSEC_StudyDesign__Problems", "Problems to fix", "PanelR7C1");
		}


	}

	#endregion


	#region Show/Hide Panels with Buttons
	protected void ShowHideActions(object sender, EventArgs e)
	{


		Control ctl = this.FindControlRecursive(this.Page, "PanelR2C1");
		Panel gv = (Panel)ctl;

		if (gv.Visible) { 
			gv.Visible = false;  btnShowHideActions.Text = "Show Actions";
		}
		else
		{
			gv.Visible = true; btnShowHideActions.Text = "Hide Actions";
		}
	}


	protected void ShowHideMeasures(object sender, EventArgs e)
	{
		Control ctl = this.FindControlRecursive(this.Page, "PanelR3C1");
		Panel gv = (Panel)ctl;

		if (gv.Visible)
		{
			gv.Visible = false; btnShowHideMeasures.Text = "Show Measures";
		}
		else
		{
			gv.Visible = true; btnShowHideMeasures.Text = "Hide Measures";
		}
	}

	protected void ShowHideConsents(object sender, EventArgs e)
	{
		Control ctl = this.FindControlRecursive(this.Page, "PanelR4C1");
		Panel gv = (Panel)ctl;

		if (gv.Visible)
		{
			gv.Visible = false; btnShowHideConsents.Text = "Show Consents";
		}
		else
		{
			gv.Visible = true; btnShowHideConsents.Text = "Hide Consents";
		}
	}


	protected void ShowHideAM(object sender, EventArgs e)
	{
		Control ctl = this.FindControlRecursive(this.Page, "PanelR5C1");
		Panel gv = (Panel)ctl;

		if (gv.Visible)
		{
			gv.Visible = false; btnShowHideAM.Text = "Show Act>Meas";
		}
		else
		{
			gv.Visible = true; btnShowHideAM.Text = "Hide Act>Meas";
		}
	}

	protected void ShowHideAC(object sender, EventArgs e)
	{
		Control ctl = this.FindControlRecursive(this.Page, "PanelR6C1");
		Panel gv = (Panel)ctl;

		if (gv.Visible)
		{
			gv.Visible = false; btnShowHideAM.Text = "Show Act>Cons";
		}
		else
		{
			gv.Visible = true; btnShowHideAM.Text = "Hide Act>Cons";
		}
	}


	protected void ShowHideProblems(object sender, EventArgs e)
	{
		Control ctl = this.FindControlRecursive(this.Page, "PanelR7C1");
		Panel gv = (Panel)ctl;

		if (gv.Visible)
		{
			gv.Visible = false; btnShowHideProblems.Text = "Show Problems";
		}
		else
		{
			gv.Visible = true; btnShowHideProblems.Text = "Hide Problems";
		}
	}
#endregion


	protected void GetCurrentDefaultStudyID()
	{


		LogToPage("-------> GetCurrentDefaultStudyID <br/>");

		SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("exec spSEC_Get_Default_StudyID_for_User", oConn);
		DataTable dt = new DataTable();
		SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
		sqlAdapter.Fill(dt);

		foreach (DataRow row in dt.Rows)
		{
			_content_studyID = Convert.ToInt16(row["defaultstudyID"]);
			_content_studyname = Convert.ToString(row["studyname"]);
			_content_num_timepoints = Convert.ToInt16(row["num_timepoints"]);
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



	#region POPULATE the GridView:  AUTO GENERATED COLUMNS
	protected void Populate_GridView_AutoGenerateColumns(string gv_name, string mycmd, string mylabel, string mypanel) //, string[] hidecols)
	{
		LogToPage("<br/>---> Populate:" + gv_name + "  <br/>");
		GridView gv = new GridView();

		gv.ID = gv_name;

		try
		{

			LogToPage("--> mycmd: " + mycmd + "<br/>");

			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(mycmd, oConn);
			SqlDataReader sqlReader = sqlCmd.ExecuteReader();
			DataTable dt = new DataTable();
			dt.Load(sqlReader);


			
			
			gv.RowDataBound += new GridViewRowEventHandler(GridView_AutoGenerateColumns_RowDataBound);    
			gv.DataSource = dt;
			gv.DataBind();
			

			////Hide Columns
			//for (int i = 0; i < hidecols.Length; i++)
			//{
			//}


			Label lbl = new Label();

			lbl.Text = mylabel;
			lbl.Font.Size = 12;
			lbl.Font.Bold = true;
			lbl.Font.Underline = false;

			Literal lit_blank = new Literal();
			lit_blank.Text = "<br/>";

			Control ctl = this.FindControlRecursive(this.Page, mypanel);
			Panel p = (Panel)ctl;
			p.Controls.Add(lbl);
			p.Controls.Add(gv);
			p.Controls.Add(lit_blank);


		}


		catch (SqlException oException)
		{
			foreach (SqlError oErr in oException.Errors)
			{
				LogToPageUrgent( oErr.Message);
			}
		}



	}



	protected void GridView_AutoGenerateColumns_RowDataBound(object sender, GridViewRowEventArgs e)
	{

		GridView mygv = (GridView)e.Row.NamingContainer;

		if (e.Row.RowType == DataControlRowType.DataRow)
		{

		   LogToPage( mygv.ToString() + "<br/>");

			//We're only interested in Rows that contain data
			//get a reference to the data used to databound the row
			DataRowView drv = ((DataRowView)e.Row.DataItem);

			//Hide duplicates of the first column if there are more than 1 timepoint
			if (_content_num_timepoints > 1)
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

		//Placed out of the above so that the header also gets hidden
		if (_content_num_timepoints == 1 && (mygv.ID == "GridView_StudyAction" || mygv.ID == "GridView_StudyMeas"))  //Hide the first column when only 1 timepoint
		{
			e.Row.Cells[0].Visible = false;
		}
		

	}
	#endregion


	#region POPULATE the GridView:  Custom Dynamically added columns
	protected void Populate_GridView(string gv_name, string mycmd, string mylabel, string mypanel) //, string[] hidecols)
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "<br/>---> Populate:" + gv_name + "  <br/>";

		try
		{
		
			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "--> mycmd: " + mycmd + "<br/>";

			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(mycmd, oConn);
			SqlDataReader sqlReader = sqlCmd.ExecuteReader();
			

			//Get the Columnnames 
			_columncount = sqlReader.FieldCount;
			_colnames = new string[_columncount];
			_url1 = new string[_columncount];
			_colvisible = new bool[_columncount];

			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> ColCount: " + _columncount.ToString() + " <br/>";
			

			GridView gv = new GridView();
			gv.ID = gv_name;

			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> gv.ID : " + gv.ID.ToString() + " <br/>";

			//add a row bind event
			gv.AutoGenerateColumns = false;  //Check here - DO NOT AUTO GENERATE THE COLUMNS, Add based on visibility assigned above

			DataTable dt = new DataTable();
			dt.Load(sqlReader);

			for (int k = 0; k < _columncount; k++)
			{
				_colnames[k] = dt.Columns[k].ColumnName;
			}


			TemplateField tf = null;
			//Loop through columns
			for (int c = 0; c < _columncount; c++)      
			{
				_colnames[c] = dt.Columns[c].ColumnName;
				tf = new TemplateField();
				LogToPage("now at c=" + c.ToString() + "   _colnames[c] = {" + _colnames[c] + "}" );

				try
				{

					if (_colnames[c].StartsWith("btn_"))   //add a button if the colname begins with "btn"
					{
						tf.HeaderTemplate = new DynamicGridViewButtonTemplate(_colnames[c], DataControlRowType.Header);
						tf.ItemTemplate = new DynamicGridViewButtonTemplate(_colnames[c], DataControlRowType.DataRow);
						_colvisible[c] = true;
					}
					else if (_colnames[c].StartsWith("chk_"))   //add a button if the colname begins with "btn"
					{
						tf.HeaderTemplate = new DynamicGridViewCheckBoxTemplate(_colnames[c], DataControlRowType.Header);
						tf.ItemTemplate = new DynamicGridViewCheckBoxTemplate(_colnames[c], DataControlRowType.DataRow);
						_colvisible[c] = true;
					}
					else if (_colnames[c].StartsWith("txt_"))   //add a textbox if the colname begins with "txt_"
					{
						tf.HeaderTemplate = new DynamicGridViewTextBoxTemplate(_colnames[c], DataControlRowType.Header);
						tf.ItemTemplate = new DynamicGridViewTextBoxTemplate(_colnames[c], DataControlRowType.DataRow);
						_colvisible[c] = true;
					}
					//else if (_colnames[c]==("ddl_TimePoint"))   //add a DropDownList if the colname begins with "ddl_"
					//{
					//    tf.HeaderTemplate = new DynamicGridViewDDLTemplate(_colnames[c], DataControlRowType.Header);
					//    tf.ItemTemplate = new DynamicGridViewDDLTemplate(_colnames[c], DataControlRowType.DataRow);
					//    _colvisible[c] = true;
					//}
					//else if (_colnames[c].StartsWith("ddl_"))   //add a DropDownList if the colname begins with "ddl_"
					//{
					//    tf.HeaderTemplate = new DynamicGridViewDDLTemplate(_colnames[c], "sql_TimePoints" , DataControlRowType.Header);
					//    tf.ItemTemplate = new DynamicGridViewDDLTemplate(_colnames[c], "sql_TimePoints", DataControlRowType.DataRow);
					//    _colvisible[c] = true;
					//}
					else
					{
						tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.Header);
						tf.ItemTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.DataRow);
						_colvisible[c] = true;
					}


					//if (_colnames[c] == "StudyMeasName")
					//{
					//    tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.Header);
					//    tf.ItemTemplate = new DynamicGridViewURLTemplate(_colnames[c], "url1", DataControlRowType.DataRow);
					//}
					//else if (_colnames[c] == "TimePoint")
					//{
					//    tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.Header);
					//    tf.ItemTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.DataRow);
					//}
					//else
					//{
					//    int subjID = oDBLookup.GetSubjIDFromID(_colnames[c], _content_studyID);  //TO DO: get the subjID

					//    string myurl = @"~/Measures/MeasuresBySubject.aspx?subjectID=" + subjID.ToString();

					//    tf.HeaderTemplate = new DynamicGridViewURLTemplate(_colnames[c], myurl, DataControlRowType.Header);
					//    tf.ItemTemplate = new DynamicGridViewURLTemplate(_colnames[c], @"~", DataControlRowType.DataRow);
					//}
					tf.Visible = _colvisible[c];
					//footer
					gv.Columns.Add(tf);

					if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> GV ColCount: " + gv.Columns.Count.ToString() + " <br/>";
				}

				catch(Exception err)
				{
					LogToPageUrgent(err.Message);
					LogToPageUrgent(err.StackTrace);
				}
			}


			gv.RowCommand += new GridViewCommandEventHandler(gv_RowCommand);    //This allows buttons in each row to use the CommandName & CommandArgument 
			gv.RowDataBound += new GridViewRowEventHandler(gv_RowDataBound);  // Use RowDataBound to control the visibility of buttons

			gv.DataSource = dt;
			gv.DataBind();

			////Hide Columns
			//for (int i = 0; i < hidecols.Length; i++)
			//{

			//}

			Label lbl = new Label();

			lbl.Text = mylabel;
			lbl.Font.Size = 12;
			lbl.Font.Bold = true;
			lbl.Font.Underline = false ;

			Literal lit_blank = new Literal();
			lit_blank.Text = "<br/>";

			Control ctl = this.FindControlRecursive(this.Page, mypanel);
			Panel p = (Panel)ctl;
			p.Controls.Add(lbl);
			p.Controls.Add(gv);
			p.Controls.Add(lit_blank);

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

			//Hide duplicates of the first column if there are more than 1 timepoint
			if (_content_num_timepoints > 1)
			{

				//Hide first column onlye for these 
				if (mygv.ID == "GridView_StudyAction" || mygv.ID == "GridView_StudyMeas" )
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

				//Hide first 4 columns only for these 
				if (mygv.ID == "GridView_StudyAction_StudyMeas")
				{
					thisRow = e.Row.RowIndex;

					// ********** StudyAction ********** 
					if (previousRowValue == drv[0].ToString() && previousRowValue2 == drv[1].ToString())
					{                        
						//If it's the same category as the previous one
						try
						{
							if (mygv.Rows.Count > 1)
							{
								//mygv.Rows[thisRow - 1].Cells[0].ForeColor = Color.White;
								//mygv.Rows[thisRow - 1].Cells[1].ForeColor = Color.White;
								//mygv.Rows[thisRow - 1].Cells[2].ForeColor = Color.White;
								//mygv.Rows[thisRow - 1].Cells[3].ForeColor = Color.White;

								int ctlcount=0;

								Button mybtn = (Button)mygv.Rows[thisRow - 1].FindControl("btn_destSA");
								mybtn.Visible = false;




									//foreach (Control ctl in mygv.Rows[thisRow - 1].Cells[4].Controls)
								//{

								//    Button mybtn = (Button)e.Row.FindControl("btndestSA");
								//    ctlcount++;
								//    LogToPageUrgent("*ctls = " + ctl.ID + " <br/>");
								//    mybtn.Visible = false;
								//}

							}
							//LogToPageUrgent("e.Row.RowIndex = " + e.Row.RowIndex.ToString());
						}
						catch(SyntaxErrorException err)
						{
							LogToPageUrgent("*error* <br/>");
							LogToPageUrgent(err.Message + " <br/>");
						}

					}

					else //It's a new Timepoint
					{
						//Set the vertical alignment to top
						e.Row.VerticalAlign = VerticalAlign.Top;
						//Maintain the category in memory
						previousRowValue = drv[0].ToString();
						previousRowValue2 = drv[1].ToString();
						firstRow = e.Row.RowIndex;
					}

					int mysmID = 0;
					if (mygv.Rows.Count > 1)
					{
						//Show/Hide the MoveSM button
						Label lblsmID = (Label)mygv.Rows[thisRow - 1].FindControl("studymeasID");
						try { mysmID = Convert.ToInt16(lblsmID.Text); }
						catch { }
						
						Button mybtn2 = (Button)mygv.Rows[thisRow - 1].FindControl("btn_MoveSM");
						if (mysmID > 0) {
							mybtn2.Visible = true;
							mybtn2.CssClass = "ButtonText";
							}
						else { mybtn2.Visible = false; }

					}

				}



			}

		}

		//Placed out of the above so that the header also gets hidden
		if (_content_num_timepoints == 1 && (mygv.ID == "GridView_StudyAction" || mygv.ID == "GridView_StudyMeas"))  //Hide the first column when only 1 timepoint
		{
			e.Row.Cells[0].Visible = false;
		}

	

	}

	protected void gv_RowCommand(object sender, CommandEventArgs e)
	{  //Run when buttons in a GridView are clicked, if they are set up through the DynamicGridView class
		//the switch statement processes each button click that is done within a gridview row

		ClearErrorLog();
		
		switch (e.CommandName)
		{
			case "btn_AddAction":
				_content_timepointID = Convert.ToInt16(e.CommandArgument);
				show_Panel_AddAction();
				break;

			case "btn_AddMeas":

				_content_studyactionID = Convert.ToInt16(e.CommandArgument);
				show_Panel_AddMeas();
				break;

			case "btn_AddConsent":
				_content_studyactionID = Convert.ToInt16(e.CommandArgument);
				show_Panel_AddConsent();
				break;

			case "btn_AddCFV":
				_content_consentformID = Convert.ToInt16(e.CommandArgument);
				show_Panel_AddConsentVersion();
				break;
			

			case "btn_DeleteSM":
				try
				{
					int studymeasID = Convert.ToInt16(e.CommandArgument);
					string sql_string = "exec  spStudyDesign_DELETE_StudyMeas_from_Web " + studymeasID.ToString() + ", 'commit'";
					
					SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
					sqlCmd.ExecuteNonQuery();
					LoadGrid_Studymeas();
				}
				catch (SqlException sqlexp)
				{
					LogToPageError(sqlexp.Message);
				}
				break;


			case "btn_MoveSM":
				try
				{//FIX need to get mystudyactionID to show where to move the SM

					Panel_MoveSM.Visible = true;
					lblSourceSM.Text = Convert.ToString(e.CommandArgument);
				}
				catch (SqlException sqlexp)
				{
					LogToPageError(sqlexp.Message);
				}
				break;

			case "btn_destSA":
				try
				{//FIX need to get mystudyactionID to show where to move the SM

					Panel_MoveSM.Visible = true;
					lblDestSA.Text = Convert.ToString(e.CommandArgument);
				}
				catch (SqlException sqlexp)
				{
					LogToPageError(sqlexp.Message);
				}

				break;

			case "btn_EditAction":
				try
				{//FIX need to get mystudyactionID to show where to move the SM

					Panel_EditAction.Visible = true;
					string cmdarg =  Convert.ToString(e.CommandArgument);
					string[] cmdargs = cmdarg.Split('|');

					lbl_EditAction_studyactionID.Text = cmdargs[0];
					txt_EditAction_ActionText.Text = cmdargs[1];
					ddl_EditAction_TimePoint.SelectedValue = cmdargs[2];
					ddl_EditAction_ActionType.SelectedValue = cmdargs[3];
					txt_EditAction_SortOrder.Text = cmdargs[4];

				}
				catch (SqlException sqlexp)
				{
					LogToPageError(sqlexp.Message);
				}

				break;


			case "btn_EditSM":
				try
				{//FIX need to get mystudyactionID to show where to move the SM

					Panel_EditSM.Visible = true;
					string cmdarg = Convert.ToString(e.CommandArgument);
					string[] cmdargs = cmdarg.Split('|');

					lbl_EditSM_studymeasID.Text = cmdargs[0];
					txt_EditSM_studymeasname.Text = cmdargs[1];
					ddl_EditSM_TimePoint.SelectedValue = cmdargs[2];
					txt_EditSM_SortOrder.Text = cmdargs[3];
					ddl_EditSM_vrp.SelectedValue = cmdargs[4];
					
				}
				catch (SqlException sqlexp)
				{
					LogToPageError(sqlexp.Message);
				}

				break;


		}


	}

	#endregion



	#region ADD & EDIT entities
	//only initiated from button in the edit Panel

	protected void Edit_AddAction(object sender, EventArgs e)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";

		Control ctlParent = this.FindControlRecursive(this.Page, "PanelR1C1");
		Control ctl = this.FindControlRecursive(ctlParent, "GridView_Group");
		GridView mygvGroups = (GridView)ctl;

		Control ctl_actiontext = this.FindControlRecursive(Panel_AddAction, "txt_actiontext");
		TextBox  actiontext = (TextBox)ctl_actiontext;
		int numgroupsadded = 0;

		//Step 1 - an action type must be selected
		if (Convert.ToInt16(ddl_ActionType.SelectedValue) > 0)
		{
			string groups_to_add = "";

			for (int count = 0; count < mygvGroups.Rows.Count; count++)//Loop across each group
			{
				string mygroupID = ((Label)mygvGroups.Rows[count].FindControl("groupID")).Text;
				CheckBox chk = (CheckBox)mygvGroups.Rows[count].FindControl("chk_Include");

				int tpID = Convert.ToInt16(lblTimepointID.Text);

				//Step 2 - process only if a group is checked
				if (chk.Checked && tpID > 0)
				{
					groups_to_add +=  "," + mygroupID.ToString() ;
					numgroupsadded++; 
				}

				if (numgroupsadded == 0)
				{
					LogToPageError("No groups were checked.");
				}

			}

			//add the study action
			try
			{
				string sql_string = "exec  spStudyDesign_ADD_StudyAction__from_web " + _content_studyID.ToString() + ", '" + groups_to_add.Substring(1) + "', " +
					ddl_ActionType.SelectedValue.ToString() + ", " + lblTimepointID.Text + ",'" + actiontext.Text + "'";
				
				SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
				sqlCmd.ExecuteNonQuery();


			}
			catch (SqlException sqlexp)
			{
				LogToPageError(sqlexp.Message);
			}



		}
		else 
			{ LogToPageError("You must select an Action Type."); }


		LoadGrid_Studyaction();
		LoadGrid_StudyAction_StudyMeas();


	}
	
	protected void Edit_AddMeas(object sender, EventArgs e)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";
		Control ctlParent = this.FindControlRecursive(this.Page, "PanelR1C1");
		Control ctl = this.FindControlRecursive(ctlParent, "GridView_Group");
		GridView mygvGroups = (GridView)ctl;

		string groups_list = "";
		int numgroupsadded = 0;

		//Step 1 - an measure must be selected
		if (Convert.ToInt16(ddl_Meas.SelectedValue) > 0)
		{


			for (int count = 0; count < mygvGroups.Rows.Count; count++)//Loop across each group
			{
				string mygroupID = ((Label)mygvGroups.Rows[count].FindControl("groupID")).Text;
				CheckBox chk = (CheckBox)mygvGroups.Rows[count].FindControl("chk_Include");

				//Step 2 - process only if a group is checked
				if (chk.Checked)  
				{
					groups_list += mygroupID.ToString() + ", ";
					numgroupsadded++;
					//LogToPageUrgent("  insert:   = " + ddl_Meas.SelectedValue.ToString() + "  timepointID = " + timepointID.ToString() + "  groupID = " + mygroupID);

				}
			}

			if (numgroupsadded == 0)
			{
				LogToPageError("No groups were checked.");
			}
			else
			{

				try
				{
					
					string sql_string = "exec  spStudyDesign_ADD_StudyMeas__from_web " + ddl_Meas.SelectedValue.ToString() + ", " +
						 lblStudyactionID.Text + ", '" + groups_list + "'," + ddl_AddMeas_vrp.SelectedValue;
					
					SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
					sqlCmd.ExecuteNonQuery();
				}
				catch (SqlException sqlexc)
				{
					LogToPageError(sqlexc.Message);
				}


			}

		}
		else
		{
			LogToPageError("You must select a Measure.");
		}

		LoadGrid_Studymeas();

	}

	protected void Edit_AddNewConsent(object sender, EventArgs e)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";

		Control ctlParent = this.FindControlRecursive(this.Page, "PanelR1C1");
		Control ctl = this.FindControlRecursive(ctlParent, "GridView_Group");
		GridView mygvGroups = (GridView)ctl;

		Control ctl_txtNewConsentFormName = this.FindControlRecursive(Panel_AddConsent, "txtNewConsentFormName");
		TextBox txtNewConsentFormName = (TextBox)ctl_txtNewConsentFormName;

		Control ctl_effdate = this.FindControlRecursive(Panel_AddConsent, "effdate");
		TextBox effdate = (TextBox)ctl_effdate;


		int numgroupsadded = 0;

		//Step 1 - Consent form name must be populated
		if (txtNewConsentFormName.Text.Length > 2)
		{

			for (int count = 0; count < mygvGroups.Rows.Count; count++)//Loop across each group
			{
				string mygroupID = ((Label)mygvGroups.Rows[count].FindControl("groupID")).Text;
				CheckBox chk = (CheckBox)mygvGroups.Rows[count].FindControl("chkInclude");

				//Step 2 - process only if a group is checked
				if (chk.Checked )
				{
					try
					{
						numgroupsadded++;
						string sql_string = "exec  spStudyDesign_ADD_NEWStudyConsent__from_web " + _content_studyID.ToString() + ", " + mygroupID.ToString() + ", '" +
							txtNewConsentFormName.Text + "','" + effdate.Text + "'";
						
						SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
						sqlCmd.ExecuteNonQuery();

						
					}
					catch (SqlException sqlexp)
					{
						LogToPageError(sqlexp.Message);
					}
				}

				if (numgroupsadded == 0)
				{
					LogToPageError("No groups were checked.");
				}

			}



		}
		else
		{ LogToPageError("You must enter a Consent Form name."); }


		LoadGrid_Studyconsent();

	}

	protected void Edit_AddCFV(object sender, EventArgs e)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";

		Control ctlParent = this.FindControlRecursive(this.Page, "PanelR1C1");
		Control ctl = this.FindControlRecursive(ctlParent, "GridView_Group");
		GridView mygvGroups = (GridView)ctl;

		Control ctl_lblConsentFormID_CFV = this.FindControlRecursive(Panel_AddConsentVersion, "lblConsentFormID_CFV");
		Label lblConsentFormID_CFV = (Label)ctl_lblConsentFormID_CFV;

		Control ctl_txtCFVName = this.FindControlRecursive(Panel_AddConsentVersion, "txtCFVName");
		TextBox txtCFVName = (TextBox)ctl_txtCFVName;

		Control ctl_txtCFVeffdate = this.FindControlRecursive(Panel_AddConsentVersion, "txtCFVeffdate");
		TextBox txtCFVeffdate = (TextBox)ctl_txtCFVeffdate;

		Control ctl_txtReasonForChange = this.FindControlRecursive(Panel_AddConsentVersion, "txtReasonForChange");
		TextBox txtReasonForChange = (TextBox)ctl_txtReasonForChange;


		int numgroupsadded = 0;

		//Step 1 - Consent form name must be populated
		if (txtCFVName.Text.Length > 0)
		{

			try
			{
				numgroupsadded++;
				string sql_string = "exec  spStudyDesign_ADD_NEWStudyConsentVersion__from_web " + _content_studyID.ToString() + ", " + lblConsentFormID_CFV.Text + ", '" +
					txtCFVName.Text + "','" + txtCFVeffdate.Text + "','" + txtReasonForChange.Text + "'";
				
				SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
				sqlCmd.ExecuteNonQuery();
			}

			catch (SqlException sqlexp)
			{
				LogToPageError(sqlexp.Message);
			}
			
		}


		else
			{ 
				LogToPageError("You must enter a name for this Version.");
			}

		LoadGrid_Studyconsent();

	}
	
	protected void Edit_AddGroup(object sender, EventArgs e)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";
		Control ctl_groupname = this.FindControlRecursive(Panel_AddGroup, "txt_groupname");
		Control ctl_groupdesc = this.FindControlRecursive(Panel_AddGroup, "txt_groupdesc");
		Control ctl_goaln = this.FindControlRecursive(Panel_AddGroup, "txt_goaln");

		TextBox groupname = (TextBox)ctl_groupname;
		TextBox groupdesc = (TextBox)ctl_groupdesc;
		TextBox goaln = (TextBox)ctl_goaln;

		try
		{
			string sql_string = "exec  spStudyDesign_ADD_Group__from_web " + _content_studyID.ToString() + ", '" + groupname.Text + "','" +
			   groupdesc.Text + "'," + goaln.Text;
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();
		}
		catch (SqlException sqlexc)
		{
			LogToPageError(sqlexc.Message);
		}


		LoadGrid_Groups();

	}

	protected void Edit_AddTimepoint(object sender, EventArgs e)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";
		Control ctl_tpnumber = this.FindControlRecursive(Panel_AddTimepoint, "txt_tpnumber");
		Control ctl_tpname = this.FindControlRecursive(Panel_AddTimepoint, "txt_tpname");
		Control ctl_vrpID = this.FindControlRecursive(Panel_AddTimepoint, "ddl_vrp");

		TextBox tpnumber = (TextBox)ctl_tpnumber;
		TextBox tpname = (TextBox)ctl_tpname;
		DropDownList vrpID = (DropDownList)ctl_vrpID;

		try
		{
			string sql_string = "exec  spStudyDesign_ADD_Timepoint__from_web " + _content_studyID.ToString() + ", " + tpnumber.Text + ",'" +
			   tpname.Text + "'," + vrpID.SelectedValue;
			LogToPageUrgent(sql_string);
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();
		}
		catch (SqlException sqlexc)
		{
			LogToPageError(sqlexc.Message);
		}


		LoadGrid_Timepoints();

	}

	protected void Edit_MoveSM(int sourceSM, int destSA, int changeTP)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";

		Control ctlParent = this.FindControlRecursive(this.Page, "PanelR1C1");
		Control ctl = this.FindControlRecursive(ctlParent, "GridView_Group");
		GridView mygvGroups = (GridView)ctl;

		Control ctl_actiontext = this.FindControlRecursive(Panel_AddAction, "txt_actiontext");
		TextBox actiontext = (TextBox)ctl_actiontext;
		int numgroupsadded = 0;
		string groups_to_add = "";

		//Loop through groups
			for (int count = 0; count < mygvGroups.Rows.Count; count++)//Loop across each group
			{
				string mygroupID = ((Label)mygvGroups.Rows[count].FindControl("groupID")).Text;
				CheckBox chk = (CheckBox)mygvGroups.Rows[count].FindControl("chk_Include");

				//Step 2 - process only if a group is checked
				if (chk.Checked )
				{
					groups_to_add += "," + mygroupID.ToString();
					numgroupsadded++; 
				}

				if (numgroupsadded == 0)
				{
					LogToPageError("No groups were checked.");
				}

				//move it for the checked groups
				try
				{
					string sql_string = "exec  spStudyDesign_MOVE_StudyMeas_from_Web " + sourceSM.ToString() +
						", " + destSA.ToString() + ", '" + groups_to_add + "', " + changeTP.ToString();

					LogToPageUrgent(sql_string);

					SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
					sqlCmd.ExecuteNonQuery();


				}
				catch (SqlException sqlexp)
				{
					LogToPageError(sqlexp.Message);
				}

			}


			LoadGrid_StudyAction_StudyMeas();

	}

	protected void EditAction_Submit(object sender, EventArgs e)
	{

		//add the study action
		try
		{
			//CREATE proc spStudyDesign_EDIT_StudyAction__from_web          
			//(@studyactionID int, @actiontext varchar(100), @actiontypeID int, @timepointID int,  @sortorder float)          


			string sql_string = "exec  spStudyDesign_EDIT_StudyAction__from_web " + lbl_EditAction_studyactionID.Text + ", '" + txt_EditAction_ActionText.Text + "', " +
				ddl_EditAction_ActionType.SelectedValue.ToString() + ", " + ddl_EditAction_TimePoint.SelectedValue.ToString() + "," + txt_EditAction_SortOrder.Text ;
		   // LogToPageUrgent(sql_string);

			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();


		}
		catch (SqlException sqlexp)
		{
			LogToPageError(sqlexp.Message);
		}

		LoadGrid_Studyaction();
		LoadGrid_StudyAction_Consent();
		LoadGrid_StudyAction_StudyMeas();

		Panel_EditAction.Visible = false;
	}

	protected void EditAction_Cancel(object sender, EventArgs e)
		{
		   Panel_EditAction.Visible = false;
		}

	protected void EditSM_Submit(object sender, EventArgs e)
	   {
			//edit the study meas
		   try
		   {
			   string sql_string = "exec  spStudyDesign_EDIT_StudyMeas__from_web " + lbl_EditSM_studymeasID.Text + ", '" + txt_EditSM_studymeasname.Text + "', " +
				   ddl_EditSM_TimePoint.SelectedValue.ToString() + "," + txt_EditSM_SortOrder.Text;
			   //LogToPageUrgent(sql_string);

			   SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			   sqlCmd.ExecuteNonQuery();


		   }
		   catch (SqlException sqlexp)
		   {
			   LogToPageError(sqlexp.Message);
		   }

		   LoadGrid_Studymeas();
		   LoadGrid_StudyAction_StudyMeas();

		   Panel_EditSM.Visible = false;
	   }

	protected void EditSM_Cancel(object sender, EventArgs e)
	   {
		   Panel_EditSM.Visible = false;
	   }

	protected void MoveSM(object sender, EventArgs e)
	{
		int smID = 0;
		int destSA = 0;
		int changeTP = 0;

		try
		{
			smID = Convert.ToInt16(lblSourceSM.Text);
			destSA = Convert.ToInt16(lblDestSA.Text);

			if (chkAllowNewTimePoint.Checked) { changeTP = 1; }

			LogToPageUrgent("[" + smID.ToString() + "] - [" + destSA.ToString() + "]<br/>");


			if (smID > 0 && destSA > 0)
			{
				LogToPageUrgent("I made it!! <br/>");
				Edit_MoveSM(smID, destSA, changeTP);
			}
		}
		catch
		{
			LogToPageUrgent("ERROR [" + smID.ToString() + "] - [" + destSA.ToString() + "]<br/>");
			LogToPageError("Invalid studymeasID and/or studyactionID.");
		}
	}

	protected void Cancel_MoveSM(object sender, EventArgs e)
	{
		Panel_MoveSM.Visible = false;
		lblDestSA.Text = "0";
		lblSourceSM.Text = "0";
	}

	#endregion



	#region Show/Cancel Edit Panels
	protected void show_Panel_AddGroup()
	{
		ShowPanel("Group");
	}
	protected void show_Panel_AddGroup(object sender, EventArgs e)
	{
		ShowPanel("Group");
	}

	protected void show_Panel_AddTimepoint()
	{
		ShowPanel("Timepoint");
	}
	protected void show_Panel_AddTimepoint(object sender, EventArgs e)
	{
		ShowPanel( "Timepoint");
	}




	protected void show_Panel_AddAction()
	{
		lblAddAction_Header.Text = "Add action in timepointID: ";
		lblTimepointID.Text = _content_timepointID.ToString();
		ShowPanel( "Action");
	}

	protected void show_Panel_AddMeas()
	{
		lblAddMeas_Header.Text = "Add measure in studyactionID: ";
		lblStudyactionID.Text = _content_studyactionID.ToString();
		ShowPanel( "Measure");
	}

	protected void show_Panel_AddConsent()
	{
		lblAddConsent_Header.Text = "Add Consent in studyactionID: ";
		lblStudyactionID_consent.Text = _content_studyactionID.ToString();
		ShowPanel("Consent");
	}

	protected void show_Panel_AddConsentVersion()
	{
		lblAddConsentVersion_Header.Text = "Add Version to consentformID: ";
		lblConsentFormID_CFV.Text = _content_consentformID.ToString();
		ShowPanel("CFV");
	}


	protected void ShowPanel( string thispanel)
	{

		HideAll_AddPanels();
		btnAddTimepoint.Visible = false;
		btnAddGroup.Visible = false;

		switch (thispanel)
		{
			case "Group":
				Panel_AddGroup.Visible = true;
				break;
			case "Timepoint":
				Panel_AddTimepoint.Visible = true;
				break;
			case "Action":
				Panel_AddAction.Visible = true;
				break;
			case "Measure":
				Panel_AddMeas.Visible = true;
				break;
			case "Consent":
				Panel_AddConsent.Visible = true;
				break;
			case "CFV":
				Panel_AddConsentVersion.Visible = true;
				break;
		}
	}

	protected void HideAll_AddPanels()
	{
		Panel_AddGroup.Visible = false;
		Panel_AddTimepoint.Visible = false;
		Panel_AddAction.Visible = false;
		Panel_AddMeas.Visible = false;
		Panel_AddConsent.Visible = false;

		btnAddTimepoint.Visible = true;
		btnAddGroup.Visible = true;
	}
	protected void HideAll_AddPanels(object sender, EventArgs e) {
		Panel_AddGroup.Visible = false;
		Panel_AddTimepoint.Visible = false;
		Panel_AddAction.Visible = false;
		Panel_AddMeas.Visible = false;
		Panel_AddConsent.Visible = false;
		Panel_AddConsentVersion.Visible = false;

		btnAddTimepoint.Visible = true;
		btnAddGroup.Visible = true;
	}




	#endregion



	private void Gridview_RowDataBound_Create_Literals(Object sender, GridViewRowEventArgs e)
	{

		if (e.Row.RowType == DataControlRowType.DataRow)  //if a data row
		{

			LogToPage("==========> e.Row.Cells.Count = " + e.Row.Cells.Count.ToString() + "  <br/>");
			LogToPage("==========>   _colnames.length = " + _colnames.Length.ToString() + "  <br/>");

			for (int c = 0; c < e.Row.Cells.Count; c++)
			{

				//Get the control  - NOT CLEAR WHY .Text DOES NOT GIVE THE LABEL TEXT??
				DataControlFieldCell celllabel = (DataControlFieldCell)e.Row.Controls[c];

				//if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========> c: " + c.ToString() + " <br/>";

				if (c <= _colnames.Length)  //This prevents an out of range error
				{
					string cellval_full = "";
					try
					{
						cellval_full = Convert.ToString(DataBinder.Eval(e.Row.DataItem, _colnames[c]));
					}
					catch
					{
						cellval_full = "";
					}
					string cellval = "";

				}
			}

		}
	}



	//Use to find controls in other controls
	private Control FindControlRecursive(Control rootControl, string controlID)
	{
		if (rootControl.ID == controlID) return rootControl;

		foreach (Control controlToSearch in rootControl.Controls)
		{
			Control controlToReturn =
				FindControlRecursive(controlToSearch, controlID);
			if (controlToReturn != null) return controlToReturn;
		}
		return null;
	}


	private void LogToPage(string text)
	{

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += text + "<br/>";
	}

	private void LogToPageUrgent(string text)
	{

		tblmyinfo.Rows[0].Cells[0].InnerHtml += text + "<br/>";
	}

	private void LogToPageError(string text)
	{
		if (text.Contains("rror"))
		{
			lblMyError.Text += text;
			lblMyInfo.Text += "";
		}
		else
		{
			
			lblMyInfo.Text = text.Replace("Warning: Null value is eliminated by an aggregate or other SET operation.","");
			lblMyError.Text = "";
		}
	}

	private void ClearErrorLog()
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";
		//tblmyerror.Rows[0].Cells[0].InnerHtml = "";
	}



	protected void UpdateActionText(object sender, EventArgs e)
	{



	}


}



