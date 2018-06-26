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
using uwac;

public partial class Info_StudyDesign : BasePage // System.Web.UI.Page
{

	//////BLANK SqlCommand
	//SqlCommand sqlCmd = new SqlCommand();
	//sqlCmd.Connection = oConn;
	//sqlCmd.CommandType = CommandType.StoredProcedure;
	//sqlCmd.CommandText = "";

	//sqlCmd.Parameters.Add("@", SqlDbType.Int, 4);
	//sqlCmd.Parameters["@"].Value = 0;

	//sqlCmd.Parameters.Add("@", SqlDbType.VarChar, 50);
	//sqlCmd.Parameters["@"].Value = "";



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
	public string currently_editing = "";

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

	int _SA_numitems;
	public List<int> _SA_studyactionID;
	public List<string> _SA_action_label;
	public DataTable dt_SA_for_moving;
	public int _SA_moving_to;



	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		LogToPage("---------------- Page_Init ---------------------");
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();


		oDBLookup = new DBLookup(oConn);
		GetCurrentDefaultStudyID();
		Create_Group_Edit_Controls();

		
		//Load_Editing_Panels(); //called here before load?
	}



	protected void Page_Load(object sender, EventArgs e)
	{
		_EnableEditing = 1;

		//if (oLogin.CheckGroupPermissions("StudyDesign group".Split(',')))
		//{           //enable editing here 
		//	_EnableEditing = 1;
		//}
		//else { _EnableEditing = 0; }

		_SA_studyactionID = new List<int>();
		_SA_action_label = new List<string>();


		lblMyError.Text = "";
		lblMyInfo.Text = "";


		//LoadGrids();


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
			LogToPage("----------------- Page_Load ....NOT IsPostBack");
		}
		else
		{
			LogToPage("----------------- Page_Load ....YES IsPostBack");
		}

		LoadGrids();
	}




	protected void Create_Group_Edit_Controls() //string gv_name, string mycmd, string mylabel, string mypanel) //, string[] hidecols)
	{
		LogToPage("---------------- CREATE Group Edit Controls ---------------- ");


		//UpdatePanel1.ContentTemplateContainer.Controls.Clear();

		//initialize the labels

		Label lblCurrentGroups = new Label();
		Label updateWITH = new Label();

		Label lblIsDirty = new Label();

		lblCurrentGroups.ID = "lblCurrentGroups";
		updateWITH.ID = "updateWITH";
		lblIsDirty.ID = "lblIsDirty";

		lblCurrentGroups.Text = "Current Groups:";
		lblCurrentGroups.Font.Bold = false;
		lblCurrentGroups.Width = Unit.Pixel(250);
		updateWITH.Font.Bold = true;
		updateWITH.Width = Unit.Pixel(250);

		Literal litbr = new Literal();
		litbr.Text = "<br/>";

		lblCurrentGroups.EnableViewState = true;
		updateWITH.EnableViewState = true;
		litbr.EnableViewState = true;

		UpdatePanel1.ContentTemplateContainer.Controls.Add(lblCurrentGroups);
		UpdatePanel1.ContentTemplateContainer.Controls.Add(litbr);
		UpdatePanel1.ContentTemplateContainer.Controls.Add(updateWITH);
		UpdatePanel1.ContentTemplateContainer.Controls.Add(litbr);

		updateWITH.Text = "";

		//Button testbtn = new Button();
		//testbtn.Text = "test button";
		//testbtn.ID = "testbtn";
		//testbtn.Click += new EventHandler(testbtn_Click);
		//UpdatePanel1.ContentTemplateContainer.Controls.Add(testbtn);
		//ScriptManager1.RegisterAsyncPostBackControl(testbtn);


		string sql_getgroups = "select groupID, groupname from tblgroup where studyID =  " + _content_studyID.ToString();

		LogToPage("--  sql_getgroups: " + sql_getgroups);

		SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_getgroups, oConn);
		SqlDataReader sqlReader = sqlCmd.ExecuteReader();

		DataTable dt = new DataTable();
		dt.Load(sqlReader);

		//Create the controls in the UpdatePanel to ADD and DELETE groups from this entity 
		int counter = 0;
		foreach (DataRow row in dt.Rows)
		{
			counter++;
			Button btn = new Button();
			Literal lit = new Literal();
			Label btnlbl = new Label();
			Label btngrp = new Label();

			btn.Font.Size = FontUnit.Point(9);
			btn.Width = Unit.Pixel(180);
			lit.Text = "<br/>";
			btnlbl.Width = Unit.Pixel(100);
			btnlbl.Text = "";
			btngrp.Width = Unit.Pixel(60);
			btngrp.Text = "";
			btn.Text = "";

			LogToPage("^^^^^^^^^^ Create Loop : " + row["groupname"].ToString());
			btn.Text = row["groupname"].ToString();
			btn.ForeColor = Color.Gray;
			btn.ID = row["groupID"].ToString() + "|" + row["groupname"];
			btn.Click += new EventHandler(btnAddDelete_Click);
			btn.CommandArgument = "cmdarg0" + counter.ToString();


			btnlbl.ID = "btnlbl|" + row["groupID"].ToString() + "|" + row["groupname"];
			btngrp.ID = "btngrp|" + row["groupID"].ToString() + "|" + row["groupname"];


			LogToPage("^^^^^^^^^^^  ID: " + btn.ID);

			btn.EnableViewState = true;
			btnlbl.EnableViewState = true;
			btngrp.EnableViewState = true;
			lit.EnableViewState = true;

			UpdatePanel1.ContentTemplateContainer.Controls.Add(lit);
			UpdatePanel1.ContentTemplateContainer.Controls.Add(btn);
			UpdatePanel1.ContentTemplateContainer.Controls.Add(btnlbl);
			UpdatePanel1.ContentTemplateContainer.Controls.Add(btngrp);

			AsyncPostBackTrigger trig = new AsyncPostBackTrigger();

			trig.ControlID = btn.ID;
			trig.EventName = "Click";
			UpdatePanel1.Triggers.Add(trig);

			ScriptManager1.RegisterAsyncPostBackControl(btn);

		}

		UpdatePanel1.ContentTemplateContainer.Controls.Add(litbr);
		UpdatePanel1.ContentTemplateContainer.Controls.Add(lblIsDirty);

		//UpdatePanel1.Visible = true;

	}




	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		GetCurrentDefaultStudyID();

		CancelEditing();

		//Populate_DDL_SelectMeasureID(0);  //load the DDL with the measures in this study
		LoadGrids();
	}


	protected void cmdLoadGrids(object sender, EventArgs e)
	{
		LogToPage("==Here at cmdLoadGrids ....");
		CancelEditing(); 
		ClearErrorLog();
		//LoadGrids();
	}

	

	protected void DDL_StudyMeasSort_SelectedIndexChanged(object sender, EventArgs e)
	{
		//LoadGrid_Studymeas();
	}


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



	#region ================= Load Grids =================
	protected void LoadGrids()
	{
		LogToPage("==Here at LoadGrids ....");

		btnAddGroup.Visible = false;
		btnAddTimepoint.Visible = false;

		PanelR3C1_sorter.Visible = false;

		if (chkGroups.Checked) LoadGrid_Groups();
		if (chkTimepoints.Checked) LoadGrid_Timepoints();

		if (chkActions.Checked) LoadGrid_Studyaction();
		if (chkMeasures.Checked) LoadGrid_Studymeas();
		if (chkConsents.Checked) LoadGrid_Studyconsent();
		if (chkAM.Checked) LoadGrid_StudyAction_StudyMeas();
		if (chkAC.Checked) LoadGrid_StudyAction_Consent();
		if (chkProblems.Checked) LoadGrid_Problems();
		if (chkTriggers.Checked) LoadGrid_Triggers();

		if (!IsPostBack)
		{
			UpdatePanel1.Visible = false;
		}
		//removed from here so that they are loaded in Page_Init Load_Editing_Panels();

   }


	protected void LoadGrid_Groups()
	{
		if (_EnableEditing == 1)
		{
			btnAddGroup.Visible = true;
		}
		else
		{
			btnAddGroup.Visible = false;
		}

		PanelR1C1.Controls.Clear();
		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_Group", "exec spSEC_StudyDesign__Group 1" ,"Groups", "PanelR1C1");
		}
		else
		{
			Populate_GridView("GridView_Group", "exec spSEC_StudyDesign__Group 0","Groups", "PanelR1C1");
		}
		Panel_AddTimepoint.Visible = false;
		Panel_AddGroup.Visible = false;
	}

	protected void LoadGrid_Timepoints()
	{
		if (_EnableEditing == 1)
		{
			btnAddTimepoint.Visible = true;
		}
		else
		{
			btnAddTimepoint.Visible = false;
		}

		PanelR1C2.Controls.Clear();
		if (_content_num_timepoints >= 1)
		{
			if (_EnableEditing==1)
			{
			   Populate_GridView("GridView_Timepoint", "exec spSEC_StudyDesign__TimePoint 1" ,"Time Points", "PanelR1C2");
			}
			else
			{
				Populate_GridView("GridView_Timepoint", "exec spSEC_StudyDesign__TimePoint 0","Time Points", "PanelR1C2");
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
			Populate_GridView("GridView_StudyAction", "exec spSEC_StudyDesign__StudyAction 1", "Actions", "PanelR2C1");
		}
		else
		{
			Populate_GridView("GridView_StudyAction", "exec spSEC_StudyDesign__StudyAction 0", "Actions", "PanelR2C1");
		}
	}

	protected void LoadGrid_Studymeas()
	{
		PanelR3C1.Controls.Clear();
		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_StudyMeas", "exec spSEC_StudyDesign__StudyMeas 1, '" + DDL_StudyMeasSort.SelectedItem.Value+ "'" , "Measures", "PanelR3C1");
		}
		else
		{
			Populate_GridView("GridView_StudyMeas", "exec spSEC_StudyDesign__StudyMeas 0, '" + DDL_StudyMeasSort.SelectedItem.Value + "'", "Measures", "PanelR3C1");
		}
		PanelR3C1_sorter.Visible = true;
	}

	protected void LoadGrid_Studyconsent()
	{
		PanelR4C1.Controls.Clear();
		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_StudyConsent", "exec spSEC_StudyDesign__StudyConsent 1", "Consents", "PanelR4C1");
		}
		else
		{
			Populate_GridView("GridView_StudyConsent", "exec spSEC_StudyDesign__StudyConsent 0", "Consents", "PanelR4C1");
		}
	}

	protected void LoadGrid_StudyAction_StudyMeas()
	{
		//This loads the info needed to populate the dropdown for moving to a new SA
		Load_Studyactions_toArrays();


		PanelR5C1.Controls.Clear();
		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_StudyAction_StudyMeas", "exec spSEC_StudyDesign__StudyAction_StudyMeas 1", "Actions > Measures", "PanelR5C1");
		}
		else
		{
			Populate_GridView("GridView_StudyAction_StudyMeas", "exec spSEC_StudyDesign__StudyAction_StudyMeas 0", "Actions > Measures", "PanelR5C1");
		}
	}

	protected void LoadGrid_StudyAction_Consent()
	{
		//This loads the info needed to populate the dropdown for moving to a new SA
		Load_Studyactions_toArrays();


		PanelR6C1.Controls.Clear();

		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_StudyAction_StudyConsent", "exec spSEC_StudyDesign__StudyAction_StudyConsent 1", "Actions > Consents", "PanelR6C1");
		}
		else
		{
			Populate_GridView("GridView_StudyAction_StudyConsent", "exec spSEC_StudyDesign__StudyAction_StudyConsent 0", "Actions > Consents", "PanelR6C1");
		}
	}

	protected void LoadGrid_Triggers()
	{
		PanelR7C1.Controls.Clear();

		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_Triggers", "exec spSEC_StudyDesign__Trigger 1", "Triggers", "PanelR7C1");
		}
		else
		{
			Populate_GridView("GridView_Triggers", "exec spSEC_StudyDesign__Trigger 0", "Triggers", "PanelR7C1");
		}


	}

	protected void LoadGrid_Problems()
	{
		PanelR8C1.Controls.Clear();
		if (_EnableEditing == 1)
		{
			Populate_GridView("GridView_Problems", "exec spSEC_StudyDesign__Problems", "Problems to fix", "PanelR8C1");
		}
	}


	 protected void LoadGrid_ConsentItems(int cfvID)
	{
		int edit = (_EnableEditing == 1) ? 1 : 0;
		

			SqlCommand sqlCI = new SqlCommand();
			sqlCI.Connection = oConn;
			sqlCI.CommandType = CommandType.StoredProcedure;
			sqlCI.CommandText = "spSEC_StudyDesign__ConsentItems";

			sqlCI.Parameters.Add("@edit", SqlDbType.Int, 4);
			sqlCI.Parameters.Add("@consentformversionID", SqlDbType.Int, 4);

			sqlCI.Parameters["@edit"].Value = edit;
			sqlCI.Parameters["@consentformversionID"].Value = cfvID;

			SqlDataReader drCI = sqlCI.ExecuteReader();

			DataTable dtCI = new DataTable();
			dtCI.Load(drCI);

			//Persist the table in the Session object.
			Session["dtCI"] = dtCI;

			gv_EditCFV_Items.DataSource = dtCI;
			gv_EditCFV_Items.DataBind();

	 }
	

	#endregion





	#region ------------- Populate the GridView:  Custom Dynamically added columns -------------
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
			gv.EnableViewState = true;

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
				//LogToPage("now at c=" + c.ToString() + "   _colnames[c] = {" + _colnames[c] + "}" );

				try
				{

					if (_colnames[c].StartsWith("btn_"))   //add a button if the colname begins with "btn"
					{
						tf.HeaderTemplate = new DynamicGridViewButtonTemplate(_colnames[c], DataControlRowType.Header);
						tf.ItemTemplate = new DynamicGridViewButtonTemplate(_colnames[c], DataControlRowType.DataRow);
						_colvisible[c] = true;

					}
					else if (_colnames[c].StartsWith("chk_"))   //add a checkbox if the colname begins with "chk"
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
					else if (_colnames[c].StartsWith("ddl_MoveSM"))   //add a DropDownList if the colname begins with "ddl_"
					{
						tf.HeaderTemplate = new DynamicGridViewDDLTemplate(_colnames[c], "sql_SAcontainers", "studyactionID", "action_label", DataControlRowType.Header);
						tf.ItemTemplate = new DynamicGridViewDDLTemplate(_colnames[c], "sql_SAcontainers", "studyactionID", "action_label", DataControlRowType.DataRow);
						_colvisible[c] = true;
					}
					else if (_colnames[c].StartsWith("ddl_MoveC"))   //add a DropDownList if the colname begins with "ddl_"
					{
						tf.HeaderTemplate = new DynamicGridViewDDLTemplate(_colnames[c], "sql_SAcontainers", "studyactionID", "action_label", DataControlRowType.Header);
						tf.ItemTemplate = new DynamicGridViewDDLTemplate(_colnames[c], "sql_SAcontainers", "studyactionID", "action_label", DataControlRowType.DataRow);
						_colvisible[c] = true;
					}
					else
					{
						tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.Header);
						tf.ItemTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.DataRow);
						_colvisible[c] = true;
					}


					tf.Visible = _colvisible[c];
					//footer
					gv.Columns.Add(tf);

					//if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> GV ColCount: " + gv.Columns.Count.ToString() + " <br/>";
				}

				catch (Exception err)
				{
					LogToPage("err.Message = " + err.Message);
					LogToPage("err.StackTrace = " + err.StackTrace);
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
			lbl.Font.Underline = false;

			Literal lit_blank = new Literal();
			lit_blank.Text = "<br/>";

			Control ctl = this.FindControlRecursive(this.Page, mypanel);

			Panel p = (Panel)ctl;
			p.Controls.Add(lbl);
			p.Controls.Add(gv);
			p.Controls.Add(lit_blank);



			// sqlReader.Close();
		}


		catch (SqlException oException)
		{
			foreach (SqlError oErr in oException.Errors)
			{
				tblmyinfo.Rows[0].Cells[0].InnerHtml += oErr.Message + "<br/>" + oErr.LineNumber.ToString() + "<br/>" + oErr.Procedure;
			}
		}

	}
	#endregion


	protected void Load_Editing_Panels()
	{
		///This section populates the necessary controls to edit & add entities to the study design
		///.

		LogToPage("==Here at Load_Editing_Panels ....");
		//HideAll_AddPanels();

		HiddenField hidEntity = (HiddenField)FindControlRecursive(this.Page, "hidEntity");
		HiddenField hidEntityID = (HiddenField)FindControlRecursive(this.Page, "hidEntityID");
		HiddenField hidEdittype = (HiddenField)FindControlRecursive(this.Page, "hidEdittype");

		HiddenField hidMode = (HiddenField)FindControlRecursive(this.Page, "hidMode");



		string cmdarg;
		string[] cmdargs;
		cmdarg = hidEntityID.Value;
		cmdargs = cmdarg.Split('|');

		if (hidEdittype.Value == "add")
		{
			Int16 container_studyactionID; //start at -1, update to the studyactionID for those that get added into an action

			container_studyactionID = (Convert.ToInt16(cmdargs[0]) > 0) ? Convert.ToInt16(cmdargs[0]) : (Int16)(-1);

			UpdatePanel1.Visible = true;
			switch (hidEntity.Value)
			{
				case "group":
					Panel_AddGroup.Visible = true;
					break;
				case "timepoint":
					Panel_AddTimepoint.Visible = true;
					break;
				case "action":
					LogToPage("**FIX**  " + cmdarg);
					ddl_AddAction_TimePoint.SelectedValue = Convert.ToString(cmdargs[0]);

					Panel_AddAction.Visible = true;
					break;
				case "meas":

					lblAddMeas_Header.Text = cmdargs[1] + " (" + cmdargs[0] + ")";
					lblStudyactionID.Text = cmdargs[0];
					Panel_AddMeas.Visible = true;
					break;
				case "consent":

					//OLD
					//lblAddConsent_Header.Text = "Adding consent.." + cmdargs[1] + " (" + cmdargs[0] + ")";
					//lblStudyactionID_consent.Text = cmdargs[0];
					//Panel_EditConsent.Visible = true;


					lblEditConsentVersion_Header.Text = "Adding NEW Consent...(into " + cmdargs[0] + ")";
					editstudyactionID_for_newC.Text = cmdargs[0];
					editCSVID.Text = "-1";

					edittxtConsentName.Text = "";
					edittxtConsentNameShort.Text = "";
					edittxtCFVNumber.Text = "1";
					edittxtCFVName.Text = "v1";
					edittxtCFVapprvdate.Text = "";
					edittxtCFVeffdate.Text = "";
					edittxtCFVenddate.Text = "";
					edittxtReasonForChange.Text = "*First Version*";

					edittxtConsentName.Enabled = true;
					edittxtConsentNameShort.Enabled = true;


					Panel_EditConsentVersion.Visible = true;

					btn_AddConsent_Submit.Visible = true;
					btn_AddCFV_Submit.Visible = false;
					btn_EditCFV_Submit.Visible = false;

					btn_AddCI.Visible = false;          //No add items
					Panel_EditCFV_Items.Visible = false; //NO items
					btn_EditCFV_Delete.Visible = false; //NO delete

					break;
				case "CFV":
					//Panel_AddConsentVersion.Visible = true;


					lblEditConsentVersion_Header.Text = "Adding New CFV..(" + cmdargs[1] + ")";
					editCSVID.Text = cmdargs[0];

					int nextvers = Int32.Parse(cmdargs[3]) ;

					edittxtConsentName.Text = cmdargs[1];
					edittxtConsentNameShort.Text = cmdargs[2];
					edittxtCFVNumber.Text = nextvers.ToString();
					edittxtCFVName.Text = "v" + nextvers.ToString();
					edittxtCFVapprvdate.Text = "";
					edittxtCFVeffdate.Text = "";
					edittxtCFVenddate.Text = "";
					edittxtReasonForChange.Text = "";

					edittxtConsentName.Enabled = false;
					edittxtConsentNameShort.Enabled = false;


					Panel_EditConsentVersion.Visible = true;

					btn_AddConsent_Submit.Visible = false;
					btn_AddCFV_Submit.Visible = true;
					btn_EditCFV_Submit.Visible = false;


					btn_AddCI.Visible = false;          //NO add items - only when editing
					Panel_EditCFV_Items.Visible = false; //NO items
					btn_EditCFV_Delete.Visible = false; //NO delete


					break;
				case "trigger":
					Panel_AddTrigger.Visible = true;
					break;
				case "trigger_duedate":
					Panel_AddTrigger_DueDate.Visible = true;
					break;
			}

			try
			{
				Populate_Groups_for_Editing(hidEntity.Value, container_studyactionID, hidEdittype.Value);
			}
			catch (Exception exc) 
			{
				LogToPageSQLError(exc.Message + "<br/>" + exc.StackTrace);
			}


		}



		else if (hidEdittype.Value == "edit")
		{
			if (hidEntity.Value == "group" | hidEntity.Value == "timepoint")
			{
				//no need for UpdatePanel1
			}
			else
			{
				UpdatePanel1.Visible = true;
			}


			cmdarg = hidEntityID.Value;
			cmdargs = cmdarg.Split('|');

			switch (hidEntity.Value)
			{


				case "group":

					lblGroupID.Text = cmdargs[0];
					etxt_groupname.Text = cmdargs[1];
					etxt_goaln.Text = cmdargs[2];
					etxt_groupdesc.Text = cmdargs[3];
					eddlSite.Text = cmdargs[4];

					Panel_EditGroup.Visible = true;
					break;
				case "timepoint":

					edit_lblTimepointID.Text = cmdargs[0];
					etxt_tpnumber.Text = cmdargs[1];
					etxt_tpname.Text = cmdargs[2];
					eddl_vrp.SelectedValue = cmdargs[3];

					Panel_EditTimepoint.Visible = true;
					break;

				case "action":

					//update the following to a more robust solution
					if (Panel_EditAction.Visible == false)
					{

						lbl_EditAction_studyactionID.Text = cmdargs[0];
						txt_EditAction_ActionText.Text = cmdargs[1];
						ddl_EditAction_TimePoint.SelectedValue = cmdargs[2];
						ddl_EditAction_ActionType.SelectedValue = cmdargs[3];
						txt_EditAction_SortOrder.Text = cmdargs[4];

						Panel_EditAction.Visible = true;
					}
					break;

				case "meas":
					//update the following to a more robust solution
					if (Panel_EditMeas.Visible == false)
					{
						lbl_EditSM_studymeasID.Text = cmdargs[0];
						txt_EditSM_studymeasname.Text = cmdargs[1];
						ddl_EditSM_TimePoint.SelectedValue = cmdargs[2];
						txt_EditSM_SortOrder.Text = cmdargs[3];
						ddl_EditSM_vrp.SelectedValue = cmdargs[4];

						Panel_EditMeas.Visible = true;
					}
					break;
				//TO DEL
				//case "consent":
				//    //only changing the name and the groups when editing a consent
				//    lblEditConsent_Header.Text = "Editing consent.." + cmdargs[1] + " (" + cmdargs[0] + ")";
				//    editlblStudyactionID_consent.Text = cmdargs[0];

				//    edittxtNewConsentFormName.Text = cmdargs[1];

				//    Panel_EditConsent.Visible = true;


				//    //ToFix Panel_EditConsent.Visible = true;
				//    break;
				case "CFV":
					lblEditConsentVersion_Header.Text = "Editing CFV.." + cmdargs[1] + " (" + cmdargs[0] + ")";
					editCSVID.Text = cmdargs[0];

					edittxtConsentName.Text = cmdargs[1];
					edittxtConsentNameShort.Text = cmdargs[2];
					edittxtCFVNumber.Text = cmdargs[3];
					edittxtCFVName.Text = cmdargs[4];
					edittxtCFVapprvdate.Text = cmdargs[5];
					edittxtCFVeffdate.Text = cmdargs[6];
					edittxtCFVenddate.Text = cmdargs[7];
					edittxtReasonForChange.Text = cmdargs[8];

					Panel_EditConsentVersion.Visible = true;

					btn_AddConsent_Submit.Visible = false;
					btn_AddCFV_Submit.Visible = false;
					btn_EditCFV_Submit.Visible = true;


					btn_AddCI.Visible = true;          //Yes add items
					Panel_EditCFV_Items.Visible = true; //Yes items
					btn_EditCFV_Delete.Visible = true; //Yes delete

					

					LoadGrid_ConsentItems(Int32.Parse(cmdargs[0]));

					//ToFix Panel_EditConsentVersion.Visible = true;
					break;
				case "trigger":
					//add and edit are the same
					LogToPageSQLInfo(cmdarg);
					//JMtofix
					//lblEditTrigger_TriggerID.Text = hidEditTrigger_triggerID.Value;
					//lblEditTrigger_StudyactionID.Text = hidEditTrigger_studyactionID.Value;
					//ddl_EditTrigger_actionstatus.SelectedValue = hidEditTrigger_actionstatusID.Value;  //Put the action status in a hidden field so that the EditTrigger panel stays populated
					//txt_EditTrigger_TriggerDesc.Text = hidEditTrigger_triggerdesc.Value;
					//lblEditTrigger_Header.Text = hidEditTrigger_actiontext.Value;

					Panel_EditTrigger.Visible = true;
					break;
				case "trigger_duedate":
					Panel_EditTrigger_DueDate.Visible = true;
					break;
			}

			try
			{
				Populate_Groups_for_Editing(hidEntity.Value, Convert.ToInt16(cmdargs[0]), hidEdittype.Value);

			}
			catch (Exception exc) 
			{
				LogToPageSQLError(exc.Message + "<br/>" + exc.StackTrace);
			}
		}

	}

	protected void Populate_Groups_for_Editing(string entity, int entityID, string edittype)
	{

		
		if (edittype != "none")
		{
			string sql_for_groups = "exec spSEC_StudyDesign_LoadGroups_by_Entity '" + entity + "'," + entityID.ToString() + ",'" + edittype + "'";

			LogToPageUrgent("sql_for_groups = " + sql_for_groups);
			LogToPage("== *** Here at Populate_Groups_for_Editing : " + edittype + "  " + entity + " ***  ....");
			LogToPage("== *******  sql_for_groups =  [" + sql_for_groups + "]");


			if (edittype == "add")
			{

				switch (entity)
				{
					case "action":
						Populate_Groups_for_Editing__Controls("GridView_Groups_for_Editing", sql_for_groups, "Groups", "Panel_AddAction_Groups_for_Editing");
						break;
					case "meas":
						Populate_Groups_for_Editing__Controls("GridView_Groups_for_Editing", sql_for_groups, "Groups", "Panel_AddMeas_Groups_for_Editing");
						break;
					case "consent":
						Populate_Groups_for_Editing__Controls("GridView_Groups_for_Editing", sql_for_groups, "Groups", "Panel_EditConsent_Groups_for_Editing");
						break;
					case "CFV":
						Populate_Groups_for_Editing__Controls("GridView_Groups_for_Editing", sql_for_groups, "Groups", "Panel_EditConsent_Groups_for_Editing");
						break;
					case "trigger":
						Populate_Groups_for_Editing__Controls("GridView_Groups_for_Editing", sql_for_groups, "Groups", "Panel_AddTrigger_Groups_for_Editing");
						break;
					
				}
			}

			else if (edittype == "edit")
			{
				switch (entity)
				{
					case "action":
						Populate_Groups_for_Editing__Controls("GridView_Groups_for_Editing", sql_for_groups, "Groups", "Panel_EditAction_Groups_for_Editing");
						break;
					case "meas":
						Populate_Groups_for_Editing__Controls("GridView_Groups_for_Editing", sql_for_groups, "Groups", "Panel_EditMeas_Groups_for_Editing");
						break;
					case "CFV":
						Populate_Groups_for_Editing__Controls("GridView_Groups_for_Editing", sql_for_groups, "Groups", "Panel_EditConsent_Groups_for_Editing");
						break;
					case "trigger":
						Populate_Groups_for_Editing__Controls("GridView_Groups_for_Editing", sql_for_groups, "Groups", "Panel_EditTrigger_Groups_for_Editing");
						break;
				}
			}
		}
		else
		{
			LogToPage(".....just passing through..... Populate_Groups_for_Editing : " + edittype + "  " + entity + " ");
		}

	}

	protected void Populate_Groups_for_Editing__Controls(string gv_name, string mycmd, string mylabel, string mypanel) //, string[] hidecols)
	{

		LogToPage("=== Populate Group Edit Controls:" + gv_name + "  <br/>");
		//try
		//{

		Label updateWITH = (Label)FindControlRecursive(UpdatePanel1.ContentTemplateContainer, "updateWITH");
		updateWITH.Text = "";

		
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(mycmd, oConn);
			SqlDataReader sqlReader = sqlCmd.ExecuteReader();

			DataTable dt = new DataTable();
			dt.Load(sqlReader);
		
				//Create the controls in the UpdatePanel to ADD and DELETE groups from this entity 
  
					foreach (DataRow row in dt.Rows)
					{
						string btnlbl_ID = "btnlbl|" + row["groupID"].ToString() + "|" + row["groupname"];
						string btngrp_ID = "btngrp|" + row["groupID"].ToString() + "|" + row["groupname"];
						string btn_ID = row["groupID"].ToString() + "|" + row["groupname"];

						
						Button btn = (Button)FindControlRecursive(UpdatePanel1.ContentTemplateContainer, btn_ID);
						Label btnlbl = (Label)FindControlRecursive(UpdatePanel1.ContentTemplateContainer, btnlbl_ID);
						Label btngrp = (Label)FindControlRecursive(UpdatePanel1.ContentTemplateContainer, btngrp_ID);

						LogToPage("@@@@@@@@@@@@ Loop : " + row["IsCurrent"].ToString() + "   " + row["groupname"].ToString());
						btn.Text = (row["IsCurrent"].ToString() == "True") ? "Delete " + row["groupname"] : "Add " + row["groupname"];
						btn.ForeColor = (row["IsCurrent"].ToString() == "True") ? Color.Red : Color.Green;

						LogToPage("@@@@@@@@@@@@  ID: " + btn.ID);

						updateWITH.Text += (row["IsCurrent"].ToString() == "True") ? Convert.ToString(row["groupname"]) + ", " : "";


				}


		//}


		//catch (SqlException oException)
		//{
		//    foreach (SqlError oErr in oException.Errors)
		//    {
		//        tblmyinfo.Rows[0].Cells[0].InnerHtml += oErr.Message + "<br/>" + oErr.LineNumber.ToString() + "<br/>" + oErr.Procedure;
		//    }
		//}


	}



	#region GridView ROW operations: Command & DataBound
	protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
	{  //Run when buttons in a GridView are clicked, if they are set up through the DynamicGridView class
		//the switch statement processes each button click that is done within a gridview row

		ClearErrorLog();

		string[] args;
		string sql_string_ActionStatus;

		LogToPage("=============RowCmd=========");


		switch (e.CommandName)
		{

			#region EditConsent
			case "btn_EditConsent":
				LogToPage("----RowCmd-- here at btn_EditConsent");
				UpdateEditingEntity("consent", Convert.ToString(e.CommandArgument), "edit");
				try
				{//FIX need to get mystudyactionID to show where to move the SM
				}
				catch (SqlException sqlexp)
				{
					LogToPageSQLError(sqlexp.Message);
				}
				break;
			#endregion

			#region EditCFV
			case "btn_EditCFV":
				LogToPage("----RowCmd-- here at btn_EditCFV");
				UpdateEditingEntity("CFV", Convert.ToString(e.CommandArgument), "edit");
				try
				{//FIX need to get mystudyactionID to show where to move the SM
				}
				catch (SqlException sqlexp)
				{
					LogToPageSQLError(sqlexp.Message);
				}
				break;
			#endregion


			#region EditGroup
			case "btn_EditGroup":
				LogToPage("----RowCmd-- here at btn_EditGroup");

				UpdateEditingEntity("group", Convert.ToString(e.CommandArgument), "edit");

				try
				{//FIX need to get mystudyactionID to show where to move the SM
					//Panel_EditGroup.Visible = true;
					//Populate_Groups_for_Editing("studyaction", Convert.ToInt16(cmdargs[0]), "edit");
				}
				catch (SqlException sqlexp)
				{
					LogToPageSQLError(sqlexp.Message);
				}

				break;
			#endregion

			#region EditTimepoint
			case "btn_EditTimepoint":
				LogToPage("----RowCmd-- here at btn_EditTimepoint");

				UpdateEditingEntity("timepoint", Convert.ToString(e.CommandArgument), "edit");

				try
				{//FIX need to get mystudyactionID to show where to move the SM
					//Panel_EditGroup.Visible = true;
					//Populate_Groups_for_Editing("studyaction", Convert.ToInt16(cmdargs[0]), "edit");
				}
				catch (SqlException sqlexp)
				{
					LogToPageSQLError(sqlexp.Message);
				}

				break;
			#endregion

			#region AddAction
			case "btn_AddAction":
				LogToPage("----RowCmd-- here at btn_AddAction");

				args = Convert.ToString(e.CommandArgument).Split('|');

				UpdateEditingEntity("action", Convert.ToString(e.CommandArgument), "add");
				_content_timepointID = Convert.ToInt16(args[0]);

				//ddl_AddAction_TimePoint.SelectedValue = Convert.ToString(args[0]);
				//show_Panel_AddAction();
				break;
			#endregion


			#region EditAction
			case "btn_EditAction":
				LogToPage("----RowCmd-- here at btn_EditAction");

				UpdateEditingEntity("action", Convert.ToString(e.CommandArgument), "edit");

				try
				{//FIX need to get mystudyactionID to show where to move the SM

					//Panel_EditAction.Visible = true;

					//Populate_Groups_for_Editing("studyaction", Convert.ToInt16(cmdargs[0]), "edit");

				}
				catch (SqlException sqlexp)
				{
					LogToPageSQLError(sqlexp.Message);
				}

				break;
			#endregion


			#region EditTrigger_DueDate
			case "btn_EditTrigger_DueDate":
				LogToPage("----RowCmd-- here at btn_EditTrigger_DueDate");
				UpdateEditingEntity("trigger_duedate", Convert.ToString(e.CommandArgument), "edit");
				args = Convert.ToString(e.CommandArgument).Split('|');

				lblEditTrigger_DueDate_triggerdateID.Text = args[6];


				ddlSA_for_DueDate_Edit.SelectedValue = Convert.ToString(args[1]);
				txt_numtoaddstart_Edit.Text = Convert.ToString(args[2]);
				txt_numtoaddend_Edit.Text = Convert.ToString(args[3]);
				ddl_Dateunits_Edit.SelectedValue = Convert.ToString(args[4]);
				ddl_Datebase_Edit.SelectedValue = Convert.ToString(args[5]);

				break;
			#endregion


			#region EditTrigger
			case "btn_EditTrigger":
				LogToPage("----RowCmd-- here at btn_EditTrigger");
				LogToPage("Here is the arg:[" + e.CommandArgument + "]");
				args = Convert.ToString(e.CommandArgument).Split('|');

				UpdateEditingEntity("trigger", Convert.ToString(e.CommandArgument), "edit");
				//JMtofix?
				//hidEditTrigger_triggerID.Value = args[0];
				//hidEditTrigger_studyactionID.Value = args[1];
				//hidEditTrigger_actionstatusID.Value = args[2];  //Put the action status in a hidden field so that the EditTrigger panel stays populated
				//hidEditTrigger_triggerdesc.Value = args[3];
				//hidEditTrigger_actiontext.Value = args[4];

				sql_string_ActionStatus = "exec spGetActionStatusValues_for_studyactionID  " + Convert.ToInt16(args[1]).ToString();
				SqlCommand sqlCmd_EditTrigg = new System.Data.SqlClient.SqlCommand(sql_string_ActionStatus, oConn);
				SqlDataReader sqlReader_EditTrigg = sqlCmd_EditTrigg.ExecuteReader();
				DataTable dt_EditTrigg = new DataTable();
				dt_EditTrigg.Load(sqlReader_EditTrigg);
				ddl_EditTrigger_actionstatus.DataSource = dt_EditTrigg;
				ddl_EditTrigger_actionstatus.DataTextField = "actionstatus";
				ddl_EditTrigger_actionstatus.DataValueField = "actionstatusID";
				ddl_EditTrigger_actionstatus.DataBind();

				lblEditTrigger_StudyactionID.Text = Convert.ToString(args[1]);
				ddl_EditTrigger_actionstatus.SelectedValue = Convert.ToString(args[2]);
				txt_EditTrigger_TriggerDesc.Text = args[3];
				lblEditTrigger_TriggerID.Text = args[0];
				break;
			#endregion

			#region AddTrigger
			case "btn_AddTrigger":

				LogToPage("----RowCmd-- here at btn_AddTrigger");

				LogToPage(" ......  btn_AddTrigger args = " + e.CommandArgument);
				args = Convert.ToString(e.CommandArgument).Split('|');
				UpdateEditingEntity("trigger", Convert.ToString(args[0]), "add");

				_content_studyactionID = Convert.ToInt16(args[0]);

				lblEditTrigger_StudyactionID.Text = _content_studyactionID.ToString();

				sql_string_ActionStatus = "exec spGetActionStatusValues_for_studyactionID  " + _content_studyactionID.ToString();
				SqlCommand sqlCmd_AddTrigg = new System.Data.SqlClient.SqlCommand(sql_string_ActionStatus, oConn);
				SqlDataReader sqlReader_AddTrigg = sqlCmd_AddTrigg.ExecuteReader();
				DataTable dt_AddTrigg = new DataTable();
				dt_AddTrigg.Load(sqlReader_AddTrigg);
				ddl_AddTrigger_actionstatus.DataSource = dt_AddTrigg;
				ddl_AddTrigger_actionstatus.DataTextField = "actionstatus";
				ddl_AddTrigger_actionstatus.DataValueField = "actionstatusID";
				ddl_AddTrigger_actionstatus.DataBind();

				lblAddTrigger_Header.Text = "Add Trigger to: " + args[1];
				lblAddTrigger_StudyactionID.Text = args[0];
				break;
			#endregion

			#region BuildViews
			case "btn_BuildViews":

				LogToPage("----RowCmd-- here at btn_BuildViews");

				LogToPage(" ......  btn_BuildViews args = " + e.CommandArgument);
				//args = Convert.ToString(e.CommandArgument).Split('|');
				//UpdateEditingEntity("trigger", Convert.ToString(args[0]), "add");


				lblEditTrigger_StudyactionID.Text = _content_studyactionID.ToString();

				SqlCommand sqlCmd_BuildView = new System.Data.SqlClient.SqlCommand();
				sqlCmd_BuildView.CommandText = "spDEF_create_views__BEGIN_for_studymeas";
				sqlCmd_BuildView.CommandType = CommandType.StoredProcedure;
				sqlCmd_BuildView.Connection = oConnData;
				if (oConnData.State == ConnectionState.Closed) oConnData.Open();
				sqlCmd_BuildView.Parameters.Add("@studymeasID", SqlDbType.Int);
				sqlCmd_BuildView.Parameters.Add("@print_debug", SqlDbType.Int);
				sqlCmd_BuildView.Parameters.Add("@execute", SqlDbType.Int);

				sqlCmd_BuildView.Parameters["@studymeasID"].Value = Convert.ToInt32(e.CommandArgument);
				sqlCmd_BuildView.Parameters["@print_debug"].Value = 0;
				sqlCmd_BuildView.Parameters["@execute"].Value = 1;

				try
				{
					sqlCmd_BuildView.ExecuteNonQuery();
				}
				catch (SqlException exc)
				{
					LogToPageSQLError(exc.Message);
				}


				break;
			#endregion


			#region AddMeas
			case "btn_AddMeas":
				LogToPage("----RowCmd-- here at btn_AddMeas");
				UpdateEditingEntity("meas", Convert.ToString(e.CommandArgument), "add");
				args = Convert.ToString(e.CommandArgument).Split('|');
				_content_studyactionID = Convert.ToInt16(args[0]);
				break;
			#endregion

			#region AddConsent
			case "btn_AddConsent":
				LogToPage("----RowCmd-- here at btn_AddConsent");
				UpdateEditingEntity("consent", Convert.ToString(e.CommandArgument), "add");
				args = Convert.ToString(e.CommandArgument).Split('|');
				_content_studyactionID = Convert.ToInt16(args[0]);
				break;
			#endregion

			#region AddCFV
			case "btn_AddCFV":
				LogToPage("----RowCmd-- here at btn_AddCFV");
				UpdateEditingEntity("CFV", Convert.ToString(e.CommandArgument), "add");
				args = Convert.ToString(e.CommandArgument).Split('|');
				//_content_consentformID = Convert.ToInt16(e.CommandArgument);
				//show_Panel_AddConsentVersion();
				break;
			#endregion


			#region EditMeas
			case "btn_EditMeas":
				LogToPage("----RowCmd-- here at btn_EditMeas");

				UpdateEditingEntity("meas", Convert.ToString(e.CommandArgument), "edit");

				try
				{//FIX need to get mystudyactionID to show where to move the SM

					//Panel_EditSM.Visible = true;
					//Populate_Groups_for_Editing("studymeas", Convert.ToInt16(cmdargs[0]), "edit");

				}
				catch (SqlException sqlexp)
				{
					LogToPageSQLError(sqlexp.Message);
				}

				break;
			#endregion


			#region AddRelSM
			case "btn_AddRelSM":
				LogToPage("----RowCmd-- here at btn_AddRelSM");
				try
				{//FIX need to get mystudyactionID to show where to move the SM

					string sql_string = "exec  spStudyDesign_add_reliability_StudyMeas  " + Convert.ToString(e.CommandArgument);

					SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
					sqlCmd.ExecuteNonQuery();


					//LoadGrid_Studymeas();
				}
				catch (SqlException sqlexp)
				{
					LogToPageSQLError(sqlexp.Message);
				}

				break;
			#endregion

		}

		Load_Editing_Panels();

	}

	protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		GridView mygv = (GridView)e.Row.NamingContainer;
		int counter = 0;


		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			counter++;

			//LogToPage(mygv.ToString() + "<br/>");

			//We're only interested in Rows that contain data
			//get a reference to the data used to databound the row
			DataRowView drv = ((DataRowView)e.Row.DataItem);

			#region GridView_Group
			if (mygv.ID == "GridView_Group")
			{
				//YES!!! I can add all the functionality for the button here without needing to update App_Code\Untilities\DynamicGridview.cs

				Button btn_EditGroup = e.Row.FindControl("btn_EditGroup") as Button;
				if (btn_EditGroup != null)
				{
					btn_EditGroup.Text = "Edit";
				}
			}
			#endregion

			#region GridView_StudyConsent
			if (mygv.ID == "GridView_StudyConsent")
			{
				//YES!!! I can add all the functionality for the button here without needing to update App_Code\Untilities\DynamicGridview.cs
				Button btn_EditConsent = e.Row.FindControl("btn_EditConsent") as Button;
				if (btn_EditConsent != null)
				{
					btn_EditConsent.Text = "Edit Consent";
				}

				Button btn_EditCFV = e.Row.FindControl("btn_EditCFV") as Button;
				if (btn_EditCFV != null)
				{
					btn_EditCFV.Text = "Edit";
				}

				Label lblConsent = e.Row.FindControl("Consent") as Label;
				if (lblConsent != null)
				{
					lblConsent.Font.Bold = true;
				}

			}
			#endregion

			#region GridView_Timepoint
			if (mygv.ID == "GridView_Timepoint")
			{
				//YES!!! I can add all the functionality for the button here without needing to update App_Code\Untilities\DynamicGridview.cs

				Button btn_EditTimepoint = e.Row.FindControl("btn_EditTimepoint") as Button;
				if (btn_EditTimepoint != null)
				{
					btn_EditTimepoint.Text = "Edit";
				}
			}
			#endregion

			#region GridView_Triggers
			if (mygv.ID == "GridView_Triggers")
			{
				//YES!!! I can add all the functionality for the button here without needing to update App_Code\Untilities\DynamicGridview.cs

				Button btn_EditTrigger = e.Row.FindControl("btn_EditTrigger") as Button;
				if (btn_EditTrigger != null)
				{
					btn_EditTrigger.Text = "Edit";
					btn_EditTrigger.ForeColor = Color.Purple;
					btn_EditTrigger.Font.Size = FontUnit.Point(9);
					btn_EditTrigger.CommandName = "btn_EditTrigger";
					btn_EditTrigger.CommandArgument = Convert.ToString(drv["btn_EditTrigger"]);  //tofix

					if (Convert.ToString(drv["btn_EditTrigger"]) == "0") btn_EditTrigger.Visible = false;
				}

				Button btn_EditTrigger_DueDate = e.Row.FindControl("btn_EditTrigger_DueDate") as Button;
				if (btn_EditTrigger_DueDate != null)
				{
					btn_EditTrigger_DueDate.Text = "Edit";
					btn_EditTrigger_DueDate.ForeColor = Color.Purple;
					btn_EditTrigger_DueDate.Font.Size = FontUnit.Point(9);
					btn_EditTrigger_DueDate.CommandName = "btn_EditTrigger_DueDate";
					btn_EditTrigger_DueDate.CommandArgument = Convert.ToString(drv["btn_EditTrigger_DueDate"]);  //tofix

					if (Convert.ToString(drv["btn_EditTrigger_DueDate"]) == "0") btn_EditTrigger_DueDate.Visible = false;
				}


			}
			#endregion



			//Hide duplicates of the first column if there are more than 1 timepoint
			if (_content_num_timepoints > 1)
			{
				#region GridView_StudyAction
				if (mygv.ID == "GridView_StudyAction")
				{
					//YES!!! I can add all the funcitonality for the button here without needing to update App_Code\Untilities\DynamicGridview.cs
					Button btn_AddTrigger = e.Row.FindControl("btn_AddTrigger") as Button;
					if (btn_AddTrigger != null)
					{
						btn_AddTrigger.Text = "Add Trigger";
						btn_AddTrigger.ForeColor = Color.Green;
						//btn_AddTrigger.Font.Size = FontUnit.Point(9);
						btn_AddTrigger.CommandName = "btn_AddTrigger";
						btn_AddTrigger.CommandArgument = drv["btn_AddTrigger"].ToString();  //tofix
					}
					Label lblAction = e.Row.FindControl("Action") as Label;
					if (lblAction != null)
					{
						lblAction.Font.Bold = true;
					}

					#region Merge first cell based on timepoint
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
							LogToPage("*error* <br/>");
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
					#endregion

				}
				#endregion

				#region GridView_StudyMeas
				if (mygv.ID == "GridView_StudyMeas")
				{
					Button btn_BuildViews = e.Row.FindControl("btn_BuildViews") as Button;
					if (btn_BuildViews != null)
					{
						btn_BuildViews.Text = "exec";
						btn_BuildViews.ForeColor = Color.Green;
						//btn_AddTrigger.Font.Size = FontUnit.Point(9);
						btn_BuildViews.CommandName = "btn_BuildViews";
						btn_BuildViews.CommandArgument = drv["btn_BuildViews"].ToString();  //tofix
					}

					Label lblMeasure = e.Row.FindControl("Measure") as Label;
					if (lblMeasure != null)
					{
						lblMeasure.Font.Bold = true;
					}


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
							LogToPage("*error* <br/>");
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
				#endregion


			}

			#region GridView_StudyAction_StudyMeas
			//Hide first 4 columns only for these 
			if (mygv.ID == "GridView_StudyAction_StudyMeas")
			{
				thisRow = e.Row.RowIndex;
				Label rank = e.Row.FindControl("rank") as Label;
				rank.Visible = false;

				//hide the dup rows of studyaction info
				if (drv["rank"].ToString() != "1")
				{
					Label l1 = e.Row.FindControl("TimePoint") as Label;
					Label l2 = e.Row.FindControl("studyactionID") as Label;
					Label l3 = e.Row.FindControl("ActionType") as Label;
					Label l4 = e.Row.FindControl("Action") as Label;

					l1.ForeColor = Color.White;
					l2.ForeColor = Color.White;
					l3.ForeColor = Color.White;
					l4.ForeColor = Color.White;
				}



				foreach (TableCell cell in e.Row.Cells)
				{
					foreach (Control cellctl in cell.Controls)
					{
						//pop the moveto ddl
						if (cellctl.ID != null && cellctl.ID.ToString().StartsWith("ddl_MoveSM"))
						{
							string ddlname = cellctl.ID.ToString();
							//Populate the dropdownlist!!!
							//DropDownList ddl = e.Row.FindControl("ddl_MoveSM") as DropDownList;

							try
							{
								DropDownList ddl = e.Row.FindControl(ddlname) as DropDownList;

								if (ddl != null)
								{

									//Here need to filter the DataTable as a function of ddl.ID
									DataView dv = new DataView(dt_SA_for_moving);

									dv.RowFilter = ddlname.Replace("ddl_MoveSM_", "") + " is not null ";

									if (ddlname.Contains("_ALL"))
									{
										ddl.ForeColor = Color.DarkBlue;
									}
									else
									{
										ddl.ForeColor = Color.Green;
									}

									ddl.DataSource = dv;
									ddl.DataValueField = "studyactionID";
									ddl.DataTextField = ddlname.Replace("ddl_MoveSM_", "");
									//ddl.DataTextField = "action_label";
									ddl.DataBind();
									ddl.SelectedIndexChanged += new EventHandler(ddl_MoveSM_SelectedIndexChanged);
									ddl.AutoPostBack = true;

									if (drv[ddlname].ToString() == "0") ddl.Visible = false;
								}
								else
								{
									LogToPageUrgent("..NO DDL");
								}
							}
							catch (Exception) 
							{ }

						}




					}
				}


				Label lblMeasname = e.Row.FindControl("MeasName") as Label;
				lblMeasname.Font.Bold = true;


				// ********** StudyAction ********** 
				if (previousRowValue == drv[0].ToString() && previousRowValue2 == drv[1].ToString())
				{
					//If it's the same category as the previous one
					try
					{
						if (mygv.Rows.Count > 1)
						{
							int ctlcount = 0;

							try
							{
								Button mybtn = (Button)mygv.Rows[thisRow - 1].FindControl("btn_destSA");
								mybtn.Visible = false;
							}
							catch { }

						}
						//LogToPage("e.Row.RowIndex = " + e.Row.RowIndex.ToString());
					}
					catch (SyntaxErrorException err)
					{
						LogToPage("*error* <br/>");
						LogToPage("err.Message = " + err.Message + " <br/>");
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

			}
			#endregion

			#region GridView_StudyAction_StudyConsent
			//Hide first 4 columns only for these 
			if (mygv.ID == "GridView_StudyAction_StudyConsent")
			{
				thisRow = e.Row.RowIndex;
				Label rank = e.Row.FindControl("rank") as Label;
				rank.Visible = false;

				//hide the dup rows of studyaction info
				if (drv["rank"].ToString() != "1")
				{
					Label l1 = e.Row.FindControl("TimePoint") as Label;
					Label l2 = e.Row.FindControl("studyactionID") as Label;
					Label l3 = e.Row.FindControl("ActionType") as Label;
					Label l4 = e.Row.FindControl("Action") as Label;

					l1.ForeColor = Color.White;
					l2.ForeColor = Color.White;
					l3.ForeColor = Color.White;
					l4.ForeColor = Color.White;
				}



				foreach (TableCell cell in e.Row.Cells)
				{
					foreach (Control cellctl in cell.Controls)
					{
						//pop the moveto ddl
						if (cellctl.ID != null && cellctl.ID.ToString().StartsWith("ddl_MoveC"))
						{
							string ddlname = cellctl.ID.ToString();
							//Populate the dropdownlist!!!
							//DropDownList ddl = e.Row.FindControl("ddl_MoveSM") as DropDownList;
							DropDownList ddl = e.Row.FindControl(ddlname) as DropDownList;

							if (ddl != null)
							{

								//Here need to filter the DataTable as a function of ddl.ID
								DataView dv = new DataView(dt_SA_for_moving);

								dv.RowFilter = ddlname.Replace("ddl_MoveC_", "") + " is not null ";

								if (ddlname.Contains("_ALL"))
								{
									ddl.ForeColor = Color.DarkBlue;
								}
								else
								{
									ddl.ForeColor = Color.Green;
								}

								ddl.DataSource = dv;
								ddl.DataValueField = "studyactionID";
								ddl.DataTextField = ddlname.Replace("ddl_MoveC_", "");
								//ddl.DataTextField = "action_label";
								ddl.DataBind();
								ddl.SelectedIndexChanged += new EventHandler(ddl_MoveC_SelectedIndexChanged);
								ddl.AutoPostBack = true;

								if (drv[ddlname].ToString() == "0") ddl.Visible = false;
							}
							else
							{
								LogToPageUrgent("..NO DDL");
							}
						}




					}
				}


				Label lblMeasname = e.Row.FindControl("ConsentForm") as Label;
				lblMeasname.Font.Bold = true;


				// ********** StudyAction ********** 
				if (previousRowValue == drv[0].ToString() && previousRowValue2 == drv[1].ToString())
				{
					//If it's the same category as the previous one
					try
					{
						if (mygv.Rows.Count > 1)
						{
							int ctlcount = 0;

							try
							{
								Button mybtn = (Button)mygv.Rows[thisRow - 1].FindControl("btn_destSA");
								mybtn.Visible = false;
							}
							catch { }

						}
						//LogToPage("e.Row.RowIndex = " + e.Row.RowIndex.ToString());
					}
					catch (SyntaxErrorException err)
					{
						LogToPage("*error* <br/>");
						LogToPage("err.Message = " + err.Message + " <br/>");
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

			}
			#endregion


		}

		//Placed out of the above so that the header also gets hidden
		if (_content_num_timepoints == 1 && (mygv.ID == "GridView_StudyAction" || mygv.ID == "GridView_StudyMeas"))  //Hide the first column when only 1 timepoint
		{
			e.Row.Cells[0].Visible = false;
		}



	}

	#endregion


	protected void Load_Studyactions_toArrays()
	{

		try
		{


			string mycmd = "exec spSEC_StudyDesign__StudyAction_for_MoveTo_DLL "  ;
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(mycmd, oConn);
			SqlDataReader sqlReader = sqlCmd.ExecuteReader();

			dt_SA_for_moving = new DataTable();
			dt_SA_for_moving.Load(sqlReader);

			int counter = 0;
			_SA_numitems = dt_SA_for_moving.Rows.Count;

			
			if (dt_SA_for_moving.Rows.Count > 0)
			{
				_SA_studyactionID.Clear();
				_SA_action_label.Clear();
				foreach (DataRow row in dt_SA_for_moving.Rows)
				{
					//LogToPage(row["action_label"].ToString());

					_SA_studyactionID.Add(Convert.ToInt16(row["studyactionID"]));
					_SA_action_label.Add(Convert.ToString(row["action_label"]));
					counter++;
				}
			}
		}
		catch (Exception exc) 
		{
			LogToPageSQLError(exc.Message);
		}

	}

	protected void ResetActionSortOrder(object sender, EventArgs e)
	{
		string mycmd = "exec spStudyDesign__Reset_StudyAction_SortOrder " + _content_studyID.ToString();
		SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(mycmd, oConn);
		sqlCmd.ExecuteNonQuery();
	}

	protected void ResetMeasSortOrder(object sender, EventArgs e)
	{
		string mycmd = "exec spStudyDesign__Reset_StudyMeas_SortOrder " + _content_studyID.ToString();
		SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(mycmd, oConn);
		sqlCmd.ExecuteNonQuery();
	}



	protected void ddl_MoveC_SelectedIndexChanged(object sender, EventArgs e)
	{

		try
		{
			DropDownList ddl = (DropDownList)sender;
			GridViewRow gvrow = (GridViewRow)ddl.NamingContainer;

			_SA_moving_to = Convert.ToInt16(ddl.SelectedItem.Value);
			hidSA_moving_to.Value = _SA_moving_to.ToString();

			Label cfID = (Label)gvrow.FindControl("consentformID");
			Label saID = (Label)gvrow.FindControl("studyactionID");
			//LogToPageUrgent("    cfID = " + cfID.Text);
			//LogToPageUrgent("    saID = " + saID.Text);
			//LogToPageUrgent("    new saID = " + ddl.SelectedItem.Value.ToString());
			//LogToPageUrgent("    ddl name= " + ddl.ID);

			Edit_MoveC(Convert.ToInt16(cfID.Text), Convert.ToInt16(ddl.SelectedItem.Value), "[" + ddl.ID.ToString().Replace("ddl_MoveC_", "") + "]"); //add brackets so the replace in SQL capture the whole name, rather than just a part

		}
		catch (Exception exc) 
		{
			LogToPageUrgent(exc.Message + exc.StackTrace);
		}
	}



	protected void ddl_MoveSM_SelectedIndexChanged(object sender, EventArgs e)
	{

	 try
		{
			DropDownList ddl = (DropDownList)sender;
			GridViewRow gvrow = (GridViewRow)ddl.NamingContainer;

			_SA_moving_to = Convert.ToInt16(ddl.SelectedItem.Value);
			hidSA_moving_to.Value = _SA_moving_to.ToString(); 

			Label smID = (Label)gvrow.FindControl("studymeasID");
			Label saID = (Label)gvrow.FindControl("studyactionID");
			//LogToPageUrgent("    smID = " + smID.Text);
			//LogToPageUrgent("    saID = " + saID.Text);
			//LogToPageUrgent("    new saID = " + ddl.SelectedItem.Value.ToString());
			//LogToPageUrgent("    ddl name= " + ddl.ID);

			Edit_MoveSM(Convert.ToInt16(smID.Text), Convert.ToInt16(ddl.SelectedItem.Value), "[" + ddl.ID.ToString().Replace("ddl_MoveSM_", "") + "]"); //add brackets so the replace in SQL capture the whole name, rather than just a part

		}
		catch (Exception exc) 
		{
			LogToPageUrgent(exc.Message + exc.StackTrace);
		}
	}


	protected void Remove_GridView_Groups(string pname)
	{
		Panel p = (Panel)FindControlRecursive(this.Page, pname);
		foreach (Control ctl in p.Controls)
		{
			if (ctl.ID == "GridView_Groups_for_Editing")
			{
				p.Controls.Remove(ctl);
			}
		}
	}


	protected void ChangeActionType(object sender, EventArgs e)
	{

		EditAction_IsDirty.Text = "change_Actiontype";
		Panel_EditAction.Update();
	}

	
   
	protected void btnAddDelete_Click(object sender, EventArgs e)
	{

		//LogToPageSQLInfo(" >>>>  btnAddDelete_Click...");
		UpdatePanel_Info.Update();
		Button btn = (Button)sender;
		//LogToPageSQLInfo(">>>>>>>>>>>> btn.ID = " + btn.ID.ToString());
//        LogToPageSQLInfo(">>>>>>>>>>>> btn.CommandArgument = " + btn.CommandArgument.ToString());

		string[] args = btn.ID.Split('|');
		string groupID = args[0];
		string groupname = args[1];

		Label lbl= (Label)FindControlRecursive(UpdatePanel1.ContentTemplateContainer, "btnlbl|" + btn.ID);
		Label lblg = (Label)FindControlRecursive(UpdatePanel1.ContentTemplateContainer, "btngrp|" + btn.ID);

		string mode = "";

		LogToPage("&&&&&&&& btnAddDelete_Click &&&&&&&&&&&&  groupID=" + groupID);

//        LogToPageSQLInfo(">>>>>>  groupID=" + groupID.ToString());

		if (btn.Text.StartsWith("Add")) mode="Add";
		else if (btn.Text.StartsWith("Don't Add")) mode="Don't Add";
		else if (btn.Text.StartsWith("Delete")) mode="Delete";
		else if (btn.Text.StartsWith("Don't Delete")) mode="Don't Delete";

		switch (mode)
		{
			case "Add":
//                LogToPageSQLInfo(">>>>>>  case Add");
				btn.Text = btn.Text.Replace("Add ", "Don't Add ");
				btn.ForeColor = Color.Black;
				lbl.Text = "To be added";
				lbl.ForeColor = Color.Green;
				lblg.Text = groupID;
				lblg.ForeColor = Color.Green;
				break;
			case "Delete":
//                LogToPageSQLInfo(">>>>>>  case Delete");
				btn.Text = btn.Text.Replace("Delete ", "Don't Delete ");
				btn.ForeColor = Color.Black;
				lbl.Text = "To be deleted";
				lbl.ForeColor = Color.Red;
				lblg.Text = groupID;
				lblg.ForeColor = Color.Red;
				break;
			case "Don't Add":
//                LogToPageSQLInfo(">>>>>>  case Don't Add");
				btn.Text = btn.Text.Replace("Don't Add ", "Add ");
				btn.ForeColor = Color.Green;
				lbl.Text = "";
				lblg.Text = "";
				break;
			case "Don't Delete":
//                LogToPageSQLInfo(">>>>>>  case Don't Delete");
				btn.Text = btn.Text.Replace("Don't Delete ", "Delete ");
				btn.ForeColor = Color.Red;
				lbl.Text = "";
				lblg.Text = "";
				break;

		}


		//foreach (Control ctl in UpdatePanel1.ContentTemplateContainer.Controls)
		//{
		//    LogToPageSQLInfo("<br/>..." + ctl.ID );
		//}

		UpdatePanel1.Update();

	}

	
	protected void UpdateGroupsToAdd(string grouptoadd, string method)
	{
		//HiddenField hidGroupsToAdd = (HiddenField)this.FindControl("hidGroupsToAdd");

		//string grpsadd = hidGroupsToAdd.Value;

		//if (method == "add")
		//{
		//    int pos = hidGroupsToAdd.Value.IndexOf("," + grouptoadd + ",");
		//    if (pos <= 0) hidGroupsToAdd.Value += "," + grouptoadd;
		//}
		//if (method == "remove")
		//{
		//    hidGroupsToAdd.Value = hidGroupsToAdd.Value.Replace("," + grouptoadd + ",", ",");
		//}

		//lblADD.Text = hidGroupsToAdd.Value;

		//if (method == "add")
		//{
		//    int pos = updateADD.Text.IndexOf("," + grouptoadd + ",");
		//    if (pos <= 0) updateADD.Text += "," + grouptoadd;
		//}
		//if (method == "remove")
		//{
		//    updateADD.Text = updateADD.Text.Replace("," + grouptoadd + ",", ",");
		//}

		//UpdatePanel1.Update();

	}
	

	protected void UpdateGroupsToDel(string grouptodel, string method)
	{
		HiddenField hidGroupsToDel = (HiddenField)this.FindControl("hidGroupsToDel");

		//if (method == "add")
		//{
		//    int pos = hidGroupsToDel.Value.IndexOf("," + grouptodel + ",");
		//    if (pos <= 0) hidGroupsToDel.Value += "," + grouptodel;
		//}
		//if (method == "remove")
		//{
		//    hidGroupsToDel.Value = hidGroupsToDel.Value.Replace("," + grouptodel + ",", ",");
		////}

		//if (method == "add")
		//{
		//    int pos = updateDEL.Text.IndexOf("," + grouptodel + ",");
		//    if (pos <= 0) updateDEL.Text += "," + grouptodel;
		//}
		//if (method == "remove")
		//{
		//    updateDEL.Text = updateDEL.Text.Replace("," + grouptodel + ",", ",");
		//}

		//UpdatePanel1.Update();

	}

	
	protected void UpdateEditingEntity(string entity, string entityID, string edittype)
	{
		//this sets these hidden fields with the needed values to preform the update: entity, entityID, and edit type

		LogToPage("+++ UpdateEditingEntity ");

		hidEntity.Value = entity;
		hidEntityID.Value = entityID;
		hidEdittype.Value = edittype;
		
		if(hidMode.Value != "now_editing")         hidMode.Value = edittype;

		
		//if (edittype == "edit" && hidEntity.Value == entity && hidEntityID.Value == entityID)
		//{
		//    hidEdittype.Value = "now_editing";
		//}
		//else
		//{
		//}




		LogToPage("+++   hidEdittype.Value = [" + hidEdittype.Value + "]");

		//Load_Editing_Panels();

		MatchHidFields();

	}


	protected void MatchHidFields()
	{
		lblhidEntity.Text = hidEntity.Value ;
		lblhidEntityID.Text = hidEntityID.Value.ToString();
		lblhidEdittype.Text = hidEdittype.Value;
		lblhidMode.Text = hidMode.Value; 
	}

	protected void ResetEditingEntity()
	{
		LogToPage("+++++ ResetEditingEntity ");

		hidEntity.Value = "none";
		hidEntityID.Value = "none";
		hidEdittype.Value = "none";
		hidMode.Value = "none";

		MatchHidFields();

		UpdatePanel_hid.Update();

		HideAll_AddPanels();

		//lblUpdateError.Text = "";
		//lblUpdateInfo.Text = "";
	}

	protected void ChangeIn_EditAction(object sender, EventArgs e)
	{
		Panel_EditAction.Update();

		Label lblIsDirty = (Label)FindControlRecursive(UpdatePanel1, "lblIsDirty");

		lblIsDirty.Text = "editing action...";
		UpdatePanel1.Update();
	}


	protected void ChangeMeas(object sender, EventArgs e)
	{

		txt_AddMeas_studymeasname.Text = ddl_Meas.SelectedItem.Text;
		Panel_AddMeas.Update();

		Label lblIsDirty = (Label)FindControlRecursive(UpdatePanel1, "lblIsDirty");

		lblIsDirty.Text = "editing measure...";
		UpdatePanel1.Update();
	}
	



	#region ======================= SUBMIT CHANGES ==================================
	//only initiated from button in the edit Panel

	#region TRIGGERS
	protected void AddTrigger_Submit(object sender, EventArgs e)
	{
		//Step 1 - an action status must be selected
		if (Convert.ToInt16(ddl_AddTrigger_actionstatus.SelectedValue) > 0)
		{
			string groups_to_add = GetGroupsListForEdits("add", "Panel_AddTrigger", "Panel_AddTrigger_Groups_for_Editing");
			//LogToPage("GetGroupsListForEdits ADD=[" + groups_to_add + "]");

			if (groups_to_add == "greeneggs")
			{
				LogToPageSQLError("No groups were checked.");
			}
			else
			{
				//add the study action
				try
				{

					//create proc spSEC_StudyDesign__AddTrigger  
					// (@studyactionID int, @triggerdesc varchar(100), @actionstatusID int)  

					string str_lblAddTrigger_StudyactionID = ((Label)Panel_AddTrigger.FindControl("lblAddTrigger_StudyactionID")).Text;
					string str_txt_AddTrigger_TriggerDesc = ((TextBox)Panel_AddTrigger.FindControl("txt_AddTrigger_TriggerDesc")).Text;

					string sql_string_addTrig = "exec  spStudyDesign_ADD_Trigger__from_web  '" + str_txt_AddTrigger_TriggerDesc + "'," + 
						str_lblAddTrigger_StudyactionID + ", '" + groups_to_add + "', " +
						 ddl_AddTrigger_actionstatus.SelectedItem.Value.ToString();
					LogToPageUrgent(".........SUBMIT  AddTrigger............<br/>---> " + sql_string_addTrig);

					SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string_addTrig, oConn);
					sqlCmd.ExecuteNonQuery();
					

				}
				catch (SqlException sqlexp)
				{
					LogToPageSQLError(sqlexp.Message);
				}
			}


		}
		else
		{ LogToPageSQLError("You must something."); }



	}


	protected void EditTrigger_Submit(object sender, EventArgs e)
	{

		//lblMyError.Text = "";
		//lblMyInfo.Text = "";

		Label lblEditTrigger_TriggerID = ((Label)Panel_EditTrigger.FindControl("lblEditTrigger_TriggerID"));
		Label lblEditTrigger_StudyactionID = ((Label)Panel_EditTrigger.FindControl("lblEditTrigger_StudyactionID"));
		TextBox txt_EditTrigger_TriggerDesc =  ((TextBox)Panel_EditTrigger.FindControl("txt_EditTrigger_TriggerDesc"));

		string str_lblEditTrigger_TriggerID = lblEditTrigger_TriggerID.Text;

		string str_lblEditTrigger_StudyactionID = lblEditTrigger_StudyactionID.Text;
		string str_txt_EditTrigger_TriggerDesc = txt_EditTrigger_TriggerDesc.Text;

		LogToPage("str_lblEditTrigger_TriggerID [" + str_lblEditTrigger_TriggerID + "]");
		LogToPage("str_lblEditTrigger_StudyactionID [" + str_lblEditTrigger_StudyactionID + "]");
		LogToPage("str_txt_EditTrigger_TriggerDesc [" + str_txt_EditTrigger_TriggerDesc + "]");




		string groups_to_add = "";

		//Step 1 - an action type must be selected
		if (Convert.ToInt16(ddl_EditTrigger_actionstatus.SelectedValue) > 0)
		{
			groups_to_add = GetGroupsListForEdits("add", "Panel_EditTrigger", "Panel_EditTrigger_Groups_for_Editing");


			if (groups_to_add == "" || groups_to_add == null)
			{
				groups_to_add = " ";
			}

			LogToPage("groups_to_add [" + groups_to_add + "]");
			//else
			//{
				//add the study action
				try
				{

					//CREATE proc spStudyDesign_EDIT_Trigger__from_web                    
					//(@triggerID int, @triggerdesc varchar(100), @studyactionID int, @groups_to_add varchar(50), @actionstatusID int)                    



					string sql_string_addTrig = "exec  spStudyDesign_EDIT_Trigger__from_web " + str_lblEditTrigger_TriggerID + ", '" + 
						str_txt_EditTrigger_TriggerDesc + "'," +
						str_lblEditTrigger_StudyactionID + ", '" + groups_to_add + "', " +
						 ddl_EditTrigger_actionstatus.SelectedValue.ToString();
					LogToPageUrgent(".........SUBMIT  EditTrigger............<br/>---> " + sql_string_addTrig);


					SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string_addTrig, oConn);
					sqlCmd.ExecuteNonQuery();


				}
				catch (SqlException sqlexp)
				{
					LogToPageSQLError(sqlexp.Message);
				}
			//}


		}
		else
		{ LogToPageSQLError("You must something."); }


	}


				   
	protected void AddTrigger_DueDate_Submit(object sender, EventArgs e)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";
		//todo
		string btnText="";

		try
		{
			//create proc spSEC_StudyDesign__AddTrigger_DueDate__from_Web  
			//(@triggerID int, @studyactionID int, @numtoaddstart int, @numtoaddend int, @dateunitsID int, @datebaseID int) 

			string str_lblEditTrigger_TriggerID = ((Label)Panel_AddTrigger.FindControl("lblEditTrigger_TriggerID")).Text;
			string str_lblEditTrigger_StudyactionID = ((Label)Panel_EditTrigger.FindControl("lblEditTrigger_StudyactionID")).Text;

			string str_ddlSA_for_DueDate = ((DropDownList)Panel_AddTrigger_DueDate.FindControl("ddlSA_for_DueDate")).SelectedValue;

			string str_ddl_Dateunits = ((DropDownList)Panel_AddTrigger_DueDate.FindControl("ddl_Dateunits")).SelectedValue;
			string str_ddl_Datebase = ((DropDownList)Panel_AddTrigger_DueDate.FindControl("ddl_Datebase")).SelectedValue;

			Button btn_AddTrigger_DueDate_Submit = ((Button)Panel_AddTrigger_DueDate.FindControl("btn_AddTrigger_DueDate_Submit"));
			btnText = btn_AddTrigger_DueDate_Submit.Text;
			string sql_string_addTrig ;

			sql_string_addTrig = "exec  spSEC_StudyDesign_ADD_Trigger_DueDate__from_Web  " + str_lblEditTrigger_TriggerID + "," +
				   str_ddlSA_for_DueDate + ", " + txt_numtoaddstart.Text + ", " + txt_numtoaddend.Text + ", " + str_ddl_Dateunits + ", " + str_ddl_Datebase;

			LogToPageUrgent(".........SUBMIT  AddTrigger_DueDate ............<br/>---> " + sql_string_addTrig);


			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string_addTrig, oConn);
			sqlCmd.ExecuteNonQuery();
		}
		catch { }



			//LoadGrid_Triggers();
			//Load_Editing_Panels();
			show_Panel_AddTrigger_DueDate();
		
	}



	protected void EditTrigger_DueDate_Submit(object sender, EventArgs e)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";
		//todo

		LogToPage("yes I am here.");
		try
		{
			//alter proc spSEC_StudyDesign_EDIT_Trigger_DueDate__from_Web      
			//(@triggerdateID int, @studyactionID int, @numtoaddstart int, @numtoaddend int, @dateunitsID int, @datebaseID int) 

			string str_lblEditTrigger_DueDate_triggerdateID = ((Label)Panel_EditTrigger_DueDate.FindControl("lblEditTrigger_DueDate_triggerdateID")).Text;
			
			string str_ddlSA_for_DueDate = ((DropDownList)Panel_EditTrigger_DueDate.FindControl("ddlSA_for_DueDate_Edit")).SelectedValue;

			string str_ddl_Dateunits = ((DropDownList)Panel_EditTrigger_DueDate.FindControl("ddl_Dateunits_Edit")).SelectedValue;
			string str_ddl_Datebase = ((DropDownList)Panel_EditTrigger_DueDate.FindControl("ddl_Datebase_Edit")).SelectedValue;




			//LogToPage("str_lblEditTrigger_DueDate_triggerdateID=[" + str_lblEditTrigger_DueDate_triggerdateID + "]");
			//LogToPage("str_ddlSA_for_DueDate=[" + str_ddlSA_for_DueDate + "]");
			//LogToPage("str_ddl_Dateunits=[" + str_ddl_Dateunits + "]");
			//LogToPage("str_ddl_Datebase=[" + str_ddl_Datebase + "]");


			string sql_string_addTrig = "exec  spSEC_StudyDesign_EDIT_Trigger_DueDate__from_Web  " + str_lblEditTrigger_DueDate_triggerdateID + "," +
				   str_ddlSA_for_DueDate + ", " + txt_numtoaddstart_Edit.Text + ", " + txt_numtoaddend_Edit.Text + ", " + str_ddl_Dateunits + ", " + str_ddl_Datebase;


			LogToPageUrgent(".........SUBMIT  EditTrigger_DueDate............<br/>---> " + sql_string_addTrig);



			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string_addTrig, oConn);
			sqlCmd.ExecuteNonQuery();
		}
		catch (Exception exc) 
		{
			LogToPageSQLError(exc.Message);
		}

		ResetEditingEntity();
		LoadGrid_Triggers();
		Panel_EditTrigger_DueDate.Visible = false;
		//Load_Editing_Panels();
	}


	protected void DeleteTrigger_Submit(object sender, EventArgs e)
	{
		string del_triggerID = ((Label)Panel_EditTrigger.FindControl("lblEditTrigger_TriggerID")).Text;

		try
		{
			string sql_string = "exec  spSEC_StudyDesign_DELETE_Trigger__from_Web " + del_triggerID;
			LogToPageUrgent(".........SUBMIT  DELETE Trigger ............<br/>---> " + sql_string);
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();
		}
		catch (SqlException sqlexc)
		{
			LogToPageSQLError(sqlexc.Message);
		}

		ResetEditingEntity();
		LoadGrids();
	}


	protected void DeleteTrigger_DueDate_Submit(object sender, EventArgs e)
	{
		string del_triggerdateID = ((Label)Panel_EditTrigger_DueDate.FindControl("lblEditTrigger_DueDate_triggerdateID")).Text;

		try
		{
			string sql_string = "exec  spSEC_StudyDesign_DELETE_Trigger_DueDate__from_Web " + del_triggerdateID;
			LogToPageUrgent(".........SUBMIT  DELETE Trigger_DueDate............<br/>---> " + sql_string);
			
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();
		}
		catch (SqlException sqlexc)
		{
			LogToPageSQLError(sqlexc.Message);
		}

		ResetEditingEntity();
		LoadGrid_Triggers();
		Panel_EditTrigger_DueDate.Visible = false;
	}

	#endregion


	#region GROUPS
	protected void AddGroup_Submit(object sender, EventArgs e)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";
		Control ctl_groupname = this.FindControlRecursive(Panel_AddGroup, "txt_groupname");
		Control ctl_groupdesc = this.FindControlRecursive(Panel_AddGroup, "txt_groupdesc");
		Control ctl_goaln = this.FindControlRecursive(Panel_AddGroup, "txt_goaln");

		DropDownList ddlSite = (DropDownList)this.FindControlRecursive(Panel_AddGroup, "ddlSite");


		TextBox groupname = (TextBox)ctl_groupname;
		TextBox groupdesc = (TextBox)ctl_groupdesc;
		TextBox goaln = (TextBox)ctl_goaln;

		string goaln_txt = goaln.Text;

		if (String.IsNullOrEmpty(goaln_txt)) goaln_txt = "0";

		try
		{
			string sql_string = "exec  spStudyDesign_ADD_Group__from_web " + _content_studyID.ToString() + ", '" + groupname.Text + "','" +
			   groupdesc.Text + "'," + goaln_txt + "," + ddlSite.SelectedValue;

			LogToPageUrgent(".........SUBMIT  Add Group ............<br/>---> " + sql_string);


			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();

			ResetEditingEntity();
		}
		catch (SqlException sqlexc)
		{
			LogToPageSQLError(sqlexc.Message);
		}

		LoadGrids();
	}

	protected void EditGroup_Submit(object sender, EventArgs e)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";
		Control ctl_lblGroupID = this.FindControlRecursive(Panel_EditGroup, "lblGroupID");
		Control ctl_groupname = this.FindControlRecursive(Panel_EditGroup, "etxt_groupname");
		Control ctl_groupdesc = this.FindControlRecursive(Panel_EditGroup, "etxt_groupdesc");
		Control ctl_goaln = this.FindControlRecursive(Panel_EditGroup, "etxt_goaln");

		DropDownList ddlSite = (DropDownList)this.FindControlRecursive(Panel_EditGroup, "eddlSite");

		Label lblGroupID = (Label)ctl_lblGroupID;
		TextBox groupname = (TextBox)ctl_groupname;
		TextBox groupdesc = (TextBox)ctl_groupdesc;
		TextBox goaln = (TextBox)ctl_goaln;

		
		try
		{
			string sql_string = "exec  spStudyDesign_EDIT_Group__from_web " + lblGroupID.Text + ", '" + groupname.Text + "','" +
			   groupdesc.Text + "'," + goaln.Text + "," + ddlSite.SelectedValue;

			LogToPage(".........SUBMIT  Edit Group ............<br/>---> " + sql_string);


			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();

			ResetEditingEntity();
		}
		catch (SqlException sqlexc)
		{
			LogToPageSQLError(sqlexc.Message);
		}

		LoadGrids();
	}
	#endregion

	#region TIMEPOINTS
	protected void AddTimepoint_Submit(object sender, EventArgs e)
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
			LogToPageUrgent(".........SUBMIT  Add Timepoint ............<br/>---> " + sql_string);
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();

			ResetEditingEntity();


		}
		catch (SqlException sqlexc)
		{
			LogToPageSQLError(sqlexc.Message);
		}


		LoadGrids();

	}

	protected void EditTimepoint_Submit(object sender, EventArgs e)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";
		Label edit_lblTimepointID = (Label)this.FindControlRecursive(Panel_EditTimepoint, "edit_lblTimepointID");
		TextBox etxt_tpnumber = (TextBox)this.FindControlRecursive(Panel_EditTimepoint, "etxt_tpnumber");
		TextBox etxt_tpname = (TextBox)this.FindControlRecursive(Panel_EditTimepoint, "etxt_tpname");

		DropDownList eddl_vrp = (DropDownList)this.FindControlRecursive(Panel_EditTimepoint, "eddl_vrp");


		try
		{
			string sql_string = "exec  spStudyDesign_EDIT_Timepoint__from_web " + edit_lblTimepointID.Text + ", " + etxt_tpnumber.Text + ",'" +
			   etxt_tpname.Text + "'," + eddl_vrp.SelectedValue;

			LogToPage(".........SUBMIT  Edit Group ............<br/>---> " + sql_string);


			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();

			ResetEditingEntity();
		}
		catch (SqlException sqlexc)
		{
			LogToPageSQLError(sqlexc.Message);
		}

		LoadGrids();
	}
	#endregion


	#region ACTIONS
	protected void AddAction_Submit(object sender, EventArgs e)
	{
		//UpdatePanel_AddAction.Update();

		lblMyError.Text = "";
		lblMyInfo.Text = "";

		lblUpdateInfo.Text = "";
		lblUpdateError.Text = "";


		LogToPage("");
		LogToPage("=========== SUBMIT =============");
		LogToPage("==Here at AddAction_Submit ....");

		string groups_to_add = "";

		//Step 1 - an action type must be selected
		if (Convert.ToInt16(ddl_AddAction_ActionType.SelectedValue) > 0)
		{
			groups_to_add = GetGroupsListForEdits("add", "UpdatePanel_AddAction", "Panel_AddAction_Groups_for_Editing");

			if (groups_to_add == "")
			{
				lblUpdateError.Text = "No groups were checked.";
			}
		}
		else
		{
			lblUpdateError.Text = "No action type was selected.";
		}

		if (groups_to_add != "" && Convert.ToInt16(ddl_AddAction_ActionType.SelectedValue) > 0)
		{
			//add the study action
			try
			{
				//alter proc spStudyDesign_EDIT_StudyAction__from_web                  
				//(@mode varchar(10), @studyID int, @studyactionID int, @actiontext varchar(100), @actiontypeID int, @timepointID int,  @sortorder float,     
				// @groups_to_add varchar(200), @groups_to_del varchar(200), @infomsg varchar(500) OUTPUT)     

				string sql_string = "exec  spStudyDesign_EDIT_StudyAction__from_web 'add'," + _content_studyID + ",0, '" + txt_AddAction_actiontext.Text + "', " +
				  ddl_AddAction_ActionType.SelectedValue.ToString() + ", " + ddl_AddAction_TimePoint.SelectedValue.ToString() + "," + txt_AddAction_SortOrder.Text +
				  ",'" + groups_to_add + "',''";



				SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
				sqlCmd.CommandType = CommandType.StoredProcedure;
				sqlCmd.CommandText = "spStudyDesign_EDIT_StudyAction__from_web";
				sqlCmd.CommandTimeout = 90;


				sqlCmd.Parameters.Add(new SqlParameter("@mode", "add"));
				sqlCmd.Parameters.Add(new SqlParameter("@studyID", _content_studyID));
				sqlCmd.Parameters.Add(new SqlParameter("@studyactionID", SqlDbType.Int, 4));
				sqlCmd.Parameters.Add(new SqlParameter("@actiontext", txt_AddAction_actiontext.Text));
				sqlCmd.Parameters.Add(new SqlParameter("@actiontypeID", ddl_AddAction_ActionType.SelectedValue));
				sqlCmd.Parameters.Add(new SqlParameter("@timepointID", ddl_AddAction_TimePoint.SelectedValue));
				sqlCmd.Parameters.Add(new SqlParameter("@sortorder", txt_AddAction_SortOrder.Text));
				sqlCmd.Parameters.Add(new SqlParameter("@groups_to_add", groups_to_add));
				sqlCmd.Parameters.Add(new SqlParameter("@groups_to_del", ""));

				sqlCmd.Parameters.Add(new SqlParameter("@infomsg", SqlDbType.VarChar, 500)); //, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));
				sqlCmd.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int, 4)); //, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));

				sqlCmd.Parameters["@studyactionID"].Value = 0;

				sqlCmd.Parameters["@infomsg"].Direction = ParameterDirection.Output;
				sqlCmd.Parameters["@ReturnValue"].Direction = ParameterDirection.ReturnValue;
				sqlCmd.Parameters["@infomsg"].Value = DBNull.Value;
				sqlCmd.Parameters["@ReturnValue"].Value = DBNull.Value;


				//LogToPageUrgent(".........SUBMIT  Add Action ............<br/>---> " + sqlCmd.CommandText);
				//LogToPageUrgent("...num params = " + sqlCmd.Parameters.Count.ToString() + "<br/>");
				//foreach (SqlParameter par in sqlCmd.Parameters)
				//{
				//    try
				//    {
				//        LogToPageUrgent("....................." + par.ParameterName + ", " + par.Direction.ToString() + ", " + par.Value.ToString() + "<br/> ");
				//    }
				//    catch (Exception) 
				//    {
				//        LogToPageUrgent("...caught..." + exc.Message + "<br/>");
				//    }
				//}


				sqlCmd.ExecuteNonQuery();

				int sReturnValue = Convert.ToInt16(sqlCmd.Parameters["@ReturnValue"].Value);
				string infomsg = sqlCmd.Parameters["@infomsg"].Value.ToString();

				if (sReturnValue == 0)
				{
					LogToPageSQLInfo(infomsg);
				}

				// ResetEditingEntity();

			}
			catch (Exception sqlexp)//(SqlException sqlexp)
			{
				LogToPageUrgent(sqlexp.Message);

				//lblUpdateError.Text = sqlexp.Message;
				LogToPageSQLError(sqlexp.Message);
			}

			//LoadGrids();

		}

	}

	protected void EditAction_Submit(object sender, EventArgs e)
	{
		LogToPage("");
		LogToPage("=========== SUBMIT =============");

		LogToPage("==Here in EditAction_Submit");

		string groups_to_add = GetGroupsListForEdits("add", "Panel_EditAction", "Panel_EditAction_Groups_for_Editing");
		//LogToPage("GetGroupsListForEdits ADD=[" + groups_to_add + "]");

		string groups_to_del = GetGroupsListForEdits("del", "Panel_EditAction", "Panel_EditAction_Groups_for_Editing");
		//LogToPage("GetGroupsListForEdits DEL=[" + groups_to_del + "]");

		LogToPage(" ");

		//Control mainctl = this.FindControlRecursive(this.Page, "Panel_EditAction");
		//if (mainctl != null) DisplayControlsInObject(mainctl);
		//Panel_EditAction.Update();


		//edit the study action
		try
		{
			//alter proc spStudyDesign_EDIT_StudyAction__from_web              
			//(@mode varchar(10), @studyID int, @studyactionID int, @actiontext varchar(100), @actiontypeID int, @timepointID int,  @sortorder float, 
			// @groups_to_add varchar(200), @groups_to_del varchar(200))              

			string sql_string = "exec  spStudyDesign_EDIT_StudyAction__from_web 'edit'," + _content_studyID + "," + lbl_EditAction_studyactionID.Text + ", '" +
				txt_EditAction_ActionText.Text + "', " +
				ddl_EditAction_ActionType.SelectedValue.ToString() + ", " + ddl_EditAction_TimePoint.SelectedValue.ToString() + "," + txt_EditAction_SortOrder.Text +
				",'" + groups_to_add + "','" + groups_to_del + "'";


			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("", oConn);
			sqlCmd.CommandType = CommandType.StoredProcedure;
			sqlCmd.CommandText = "spStudyDesign_EDIT_StudyAction__from_web";
			sqlCmd.CommandTimeout = 90;


			sqlCmd.Parameters.Add(new SqlParameter("@mode", "edit"));
			sqlCmd.Parameters.Add(new SqlParameter("@studyID", _content_studyID));
			sqlCmd.Parameters.Add(new SqlParameter("@studyactionID", SqlDbType.Int, 4));
			sqlCmd.Parameters.Add(new SqlParameter("@actiontext", txt_EditAction_ActionText.Text));
			sqlCmd.Parameters.Add(new SqlParameter("@actiontypeID", ddl_EditAction_ActionType.SelectedValue));
			sqlCmd.Parameters.Add(new SqlParameter("@timepointID", ddl_EditAction_TimePoint.SelectedValue));
			sqlCmd.Parameters.Add(new SqlParameter("@sortorder", txt_EditAction_SortOrder.Text));
			sqlCmd.Parameters.Add(new SqlParameter("@groups_to_add", groups_to_add));
			sqlCmd.Parameters.Add(new SqlParameter("@groups_to_del", groups_to_del));

			sqlCmd.Parameters.Add(new SqlParameter("@infomsg", SqlDbType.VarChar, 500)); //, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));
			sqlCmd.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int, 4)); //, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));

			sqlCmd.Parameters["@studyactionID"].Value = Convert.ToInt16(lbl_EditAction_studyactionID.Text);

			sqlCmd.Parameters["@infomsg"].Direction = ParameterDirection.Output;
			sqlCmd.Parameters["@ReturnValue"].Direction = ParameterDirection.ReturnValue;
			sqlCmd.Parameters["@infomsg"].Value = DBNull.Value;
			sqlCmd.Parameters["@ReturnValue"].Value = DBNull.Value;


			//LogToPageUrgent(".........SUBMIT  Edit Action ............<br/>---> " + sqlCmd.CommandText);
			//LogToPageUrgent("...num params = " + sqlCmd.Parameters.Count.ToString() + "<br/>");
			//foreach (SqlParameter par in sqlCmd.Parameters)
			//{
			//    try
			//    {
			//        LogToPageUrgent("....................." + par.ParameterName + ", " + par.Direction.ToString() + ", " + par.Value.ToString() + "<br/> ");
			//    }
			//    catch (Exception) 
			//    {
			//        LogToPageUrgent("...caught..." + exc.Message + "<br/>");
			//    }

			//}


			sqlCmd.ExecuteNonQuery();

			int sReturnValue = Convert.ToInt16(sqlCmd.Parameters["@ReturnValue"].Value);
			string infomsg = sqlCmd.Parameters["@infomsg"].Value.ToString();

			if (sReturnValue == 0)
			{
				LogToPageSQLInfo(infomsg);
			}





		}
		catch (SqlException sqlexp)
		{
			//lblUpdateInfo.Text = sqlexp.Message;
			LogToPageSQLError(sqlexp.Message);
		}

		//LoadGrid_Studyaction();
		//LoadGrid_StudyAction_Consent();
		//LoadGrid_StudyAction_StudyMeas();

		//Panel_EditAction.Visible = false;

		//LoadGrids();
		//hidEdittype.Value = "none";

		//CancelEditing(sender, e);
	}

	protected void DeleteAction_Submit(object sender, EventArgs e)
	{
		string del_studyactionID = ((Label)Panel_EditMeas.FindControl("lbl_EditAction_studyactionID")).Text;
		string sql_string = "exec  spStudyDesign_DELETE_StudyAction_from_Web " + del_studyactionID + ", 'commit'";
		//LogToPageSQLInfo(".........SUBMIT  DELETE Action ............<br/>---> " + sql_string);

		try
		{
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.CommandType = CommandType.StoredProcedure;
			sqlCmd.CommandText = "spStudyDesign_DELETE_StudyAction_from_Web";
			sqlCmd.Parameters.Add(new SqlParameter("@studyactionID", SqlDbType.Int));
			sqlCmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 10));
			sqlCmd.Parameters.Add(new SqlParameter("@infomsg", SqlDbType.VarChar, 500));
			sqlCmd.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int, 4));

			sqlCmd.Parameters["@studyactionID"].Direction = ParameterDirection.Input;
			sqlCmd.Parameters["@studyactionID"].Value = Convert.ToInt16(del_studyactionID);
			sqlCmd.Parameters["@mode"].Direction = ParameterDirection.Input;
			sqlCmd.Parameters["@mode"].Value = "commit";
			sqlCmd.Parameters["@infomsg"].Direction = ParameterDirection.Output;
			sqlCmd.Parameters["@infomsg"].Value = "";

			sqlCmd.Parameters["@ReturnValue"].Direction = ParameterDirection.ReturnValue;
			sqlCmd.Parameters["@ReturnValue"].Value = DBNull.Value;

			sqlCmd.ExecuteNonQuery();

			int sReturnValue = Convert.ToInt16(sqlCmd.Parameters["@ReturnValue"].Value);
			string infomsg = sqlCmd.Parameters["@infomsg"].Value.ToString();

			if (sReturnValue == 0)
			{
				LogToPageSQLInfo(infomsg);
			}
			else
			{
				LogToPageSQLInfo("else!!!!!!!!!!!!!");
			}

		}
		catch (Exception sqlexc)
		{
			LogToPageSQLInfo(sqlexc.Message);
			//LogToPageUrgent(sqlexc.Message + sqlexc.StackTrace);

		}


		//ResetEditingEntity();
		//LoadGrids();
	}

	#endregion


	#region MEAS
	protected void AddMeas_Submit(object sender, EventArgs e)
	{
		string groups_to_add = "";

		//Step 1 - an measure must be selected
		if (Convert.ToInt16(ddl_Meas.SelectedValue) > 0)
		{
			groups_to_add = GetGroupsListForEdits("add", "Panel_AddMeas", "Panel_AddMeas_Groups_for_Editing");

			if (groups_to_add == "")
			{
				lblUpdateError.Text = "No groups were checked.";
			}
		}
		else
		{
			LogToPageSQLError("No measure was selected.");
		}



		if (groups_to_add != "" && Convert.ToInt16(ddl_Meas.SelectedValue) > 0)
		{
			try
			{
				//CREATE proc spStudyDesign_ADD_StudyMeas__from_web                
				//(@measureID int, @measname varchar(50), @studyactionID int, @group_list varchar(100), @vrpID int = 0)                

				string sql_string = "exec  spStudyDesign_ADD_StudyMeas__from_web " + ddl_Meas.SelectedValue.ToString() + ", '" +
					txt_AddMeas_studymeasname.Text + "'," + lblStudyactionID.Text + ", '" + groups_to_add + "'," + ddl_AddMeas_vrp.SelectedValue;

				LogToPageUrgent(".........SUBMIT  Add Meas ............<br/>---> " + sql_string);


				SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
				sqlCmd.ExecuteNonQuery();

				//ResetEditingEntity();
			}
			catch (SqlException sqlexc)
			{
				LogToPageSQLError(sqlexc.Message);
			}

		}
		else
		{
			LogToPageSQLError("You must select a Measure.");
		}

		//LoadGrids();

	}

	protected void EditMeas_Submit(object sender, EventArgs e)
	{
		string groups_to_add = GetGroupsListForEdits("add", "Panel_EditMeas", "Panel_EditMeas_Groups_for_Editing");
		//LogToPage("GetGroupsListForEdits ADD=[" + groups_to_add + "]");

		string groups_to_del = GetGroupsListForEdits("del", "Panel_EditMeas", "Panel_EditMeas_Groups_for_Editing");
		//LogToPage("GetGroupsListForEdits DEL=[" + groups_to_del + "]");

		//edit the study meas
		//try
		//{
		//alter proc spStudyDesign_EDIT_StudyMeas__from_web          
		// (@studymeasID int,  @studymeasname varchar(100),  @timepointID int,  @sortorder float, 
		//     @groups_to_add varchar(100), @groups_to_del varchar(100), @infomsg varchar(800) OUTPUT )          


		string sql_string = "exec  spStudyDesign_EDIT_StudyMeas__from_web " + lbl_EditSM_studymeasID.Text + ", '" + txt_EditSM_studymeasname.Text + "', " +
			ddl_EditSM_TimePoint.SelectedValue.ToString() + "," + txt_EditSM_SortOrder.Text + ",'" + groups_to_add + "','" + groups_to_del + "'";

		LogToPageUrgent(".........SUBMIT  Edit Meas ............<br/>---> " + sql_string);


		SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand();
		sqlCmd.Connection = oConn;
		sqlCmd.CommandType = CommandType.StoredProcedure;
		sqlCmd.CommandText = "spStudyDesign_EDIT_StudyMeas__from_web";
		sqlCmd.CommandTimeout = 90;

		sqlCmd.Parameters.Add(new SqlParameter("@studymeasID", SqlDbType.Int, 4));
		sqlCmd.Parameters.Add(new SqlParameter("@studymeasname", txt_EditSM_studymeasname.Text));
		sqlCmd.Parameters.Add(new SqlParameter("@timepointID", ddl_EditSM_TimePoint.SelectedValue));
		sqlCmd.Parameters.Add(new SqlParameter("@sortorder", Convert.ToDouble(txt_EditSM_SortOrder.Text)));
		sqlCmd.Parameters.Add(new SqlParameter("@vrpID", ddl_EditSM_vrp.SelectedValue));
		sqlCmd.Parameters.Add(new SqlParameter("@groups_to_add", groups_to_add));
		sqlCmd.Parameters.Add(new SqlParameter("@groups_to_del", groups_to_del));

		sqlCmd.Parameters.Add(new SqlParameter("@FlagSQLtable_isNA", txt_EditSM_FlagSQLtable_isNA.Text));


		sqlCmd.Parameters.Add(new SqlParameter("@infomsg", SqlDbType.VarChar, 500));
		sqlCmd.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int, 4));

		sqlCmd.Parameters["@studymeasID"].Value = Convert.ToInt16(lbl_EditSM_studymeasID.Text);

		sqlCmd.Parameters["@infomsg"].Direction = ParameterDirection.Output;
		sqlCmd.Parameters["@ReturnValue"].Direction = ParameterDirection.ReturnValue;
		sqlCmd.Parameters["@infomsg"].Value = DBNull.Value;
		sqlCmd.Parameters["@ReturnValue"].Value = DBNull.Value;


		//LogToPageUrgent(".........SUBMIT  Edit Action ............<br/>---> " + sqlCmd.CommandText);
		//LogToPageUrgent("...num params = " + sqlCmd.Parameters.Count.ToString() + "<br/>");
		//foreach (SqlParameter par in sqlCmd.Parameters)
		//{
		//    try
		//    {
		//        LogToPageUrgent("....................." + par.ParameterName + ", " + par.Direction.ToString() + ", " + par.Value.ToString() + "<br/> ");
		//    }
		//    catch (Exception) 
		//    {
		//        LogToPageUrgent("...caught..." + exc.Message + "<br/>");
		//    }
		//}


		sqlCmd.ExecuteNonQuery();

		int sReturnValue = Convert.ToInt16(sqlCmd.Parameters["@ReturnValue"].Value);
		string infomsg = sqlCmd.Parameters["@infomsg"].Value.ToString();

		LogToPageSQLInfo(infomsg);

		if (sReturnValue == 0)
		{
			LogToPageSQLInfo(infomsg);
		}

		//}

		//catch (SqlException sqlexp)
		//{
		//    LogToPageSQLError(sqlexp.Message);
		//}

		//ResetEditingEntity();


		//LoadGrid_Studymeas();
		//LoadGrid_StudyAction_StudyMeas();

		//Panel_EditMeas.Visible = false;
	}


	protected void DeleteMeas_Submit(object sender, EventArgs e)
	{
		string del_studymeasID = ((Label)Panel_EditMeas.FindControl("lbl_EditSM_studymeasID")).Text;
		string sql_string = "exec  spStudyDesign_DELETE_StudyMeas_from_Web " + del_studymeasID + ", 'commit'";
		//LogToPageSQLInfo(".........SUBMIT  DELETE Meas ............<br/>---> " + sql_string);

		try
		{
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.CommandType = CommandType.StoredProcedure;
			sqlCmd.CommandText = "spStudyDesign_DELETE_StudyMeas_from_Web";
			sqlCmd.Parameters.Add(new SqlParameter("@studymeasID", SqlDbType.Int));
			sqlCmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 10));
			sqlCmd.Parameters.Add(new SqlParameter("@infomsg", SqlDbType.VarChar, 500));
			sqlCmd.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int, 4));

			sqlCmd.Parameters["@studymeasID"].Direction = ParameterDirection.Input;
			sqlCmd.Parameters["@studymeasID"].Value = Convert.ToInt16(del_studymeasID);
			sqlCmd.Parameters["@mode"].Direction = ParameterDirection.Input;
			sqlCmd.Parameters["@mode"].Value = "commit";
			sqlCmd.Parameters["@infomsg"].Direction = ParameterDirection.Output;
			sqlCmd.Parameters["@infomsg"].Value = "";

			sqlCmd.Parameters["@ReturnValue"].Direction = ParameterDirection.ReturnValue;
			sqlCmd.Parameters["@ReturnValue"].Value = DBNull.Value;

			sqlCmd.ExecuteNonQuery();

			int sReturnValue = Convert.ToInt16(sqlCmd.Parameters["@ReturnValue"].Value);
			string infomsg = sqlCmd.Parameters["@infomsg"].Value.ToString();

			if (sReturnValue == 0)
			{
				LogToPageSQLInfo(infomsg);
			}
			else
			{
				LogToPageSQLInfo("else!!!!!!!!!!!!!");
			}

		}
		catch (Exception sqlexc)
		{
			LogToPageSQLInfo(sqlexc.Message);
			//LogToPageUrgent(sqlexc.Message + sqlexc.StackTrace);

		}



		//ResetEditingEntity();
		//LoadGrids();
	}

	#endregion
 
	#region CONSENTS



	protected void AddCI(object sender, EventArgs e)
	{
		lblTempCIO.Text = "";  //initialize new CIO
		txtaddCI_ConsentItemText.Text = "";
		txtaddCI_ConsentItemText_long.Text = "";
		ddladdCI_DefaultOptionText.Items.Clear();

		ddladdCI_DefaultOptionText.Items.Insert(0, new ListItem("--Select default--", "--Select default--"));
		ddladdCI_DefaultOptionText.Items.Insert(1, new ListItem("Unknown", "Unknown"));
		ddladdCI_DefaultOptionText.Items.Insert(1, new ListItem("Missing", "Missing"));
		ddladdCI_DefaultOptionText.DataBind();

		UpdatePanel_AddCI.Visible = true;
		btn_AddCI.Visible = false;
		UpdatePanel_AddCI.Update();

	}

	protected void AddCIO(object sender, EventArgs e)
	{

		if (lblTempCIO.Text.Length > 1) lblTempCIO.Text += "|";
		lblTempCIO.Text += txtaddCIO_OptionText.Text + ";" + txtaddCIO_OptionTextLong.Text;

		ddladdCI_DefaultOptionText.Items.Insert(ddladdCI_DefaultOptionText.Items.Count, new ListItem(txtaddCIO_OptionText.Text, txtaddCIO_OptionText.Text));
		ddladdCI_DefaultOptionText.DataBind();

		txtaddCIO_OptionText.Text = "";
		txtaddCIO_OptionTextLong.Text = "";

		UpdatePanel_AddCI.Update();

	}

	protected void AddCI_cancel(object sender, EventArgs e)
	{
		UpdatePanel_AddCI.Visible = false;
		btn_AddCI.Visible = true;

	}

	protected void AddCI_submit(object sender, EventArgs e)
	{
		lbladdCIO_Error.Text = "";

		//Check that the necessary info is populated
		string valcheck = "";

		if (txtaddCI_ConsentItemText.Text == "") valcheck += "Enter the Item Text.<br/>";
		if (ddladdCI_DefaultOptionText.SelectedValue == "--Select default--") valcheck += "Select a default option.<br/>";
		if (ddladdCI_DefaultOptionText.Items.Count <= 4) valcheck += "You must add at least 2 new options for this item.<br/>";

		if (valcheck == "")
		{
			//LogToPageUrgent("!!!!!! passed check");

			//add the CI:  create CI, add the CIO, update the CI with the default
			try
			{
				lbladdCIO_Error.Text = "_ok_";
				lbladdCIO_Error.ForeColor = Color.Blue;

				SqlCommand sqlAddCI = new SqlCommand();
				sqlAddCI.Connection = oConn;
				sqlAddCI.CommandType = CommandType.StoredProcedure;
				sqlAddCI.CommandText = "spStudyDesign__AddCIO";

				sqlAddCI.Parameters.Add("@consentformversionID", SqlDbType.Int, 4);
				sqlAddCI.Parameters.Add("@consentitemtext", SqlDbType.VarChar, 500);
				sqlAddCI.Parameters.Add("@consentitemtext_long", SqlDbType.VarChar, 2000);
				sqlAddCI.Parameters.Add("@consentitemoption_list", SqlDbType.VarChar, 2000);
				sqlAddCI.Parameters.Add("@default_option", SqlDbType.VarChar, 30);

				sqlAddCI.Parameters["@consentformversionID"].Value = Int32.Parse(editCSVID.Text);
				sqlAddCI.Parameters["@consentitemtext"].Value = txtaddCI_ConsentItemText.Text;
				sqlAddCI.Parameters["@consentitemtext_long"].Value = txtaddCI_ConsentItemText_long.Text;
				sqlAddCI.Parameters["@consentitemoption_list"].Value = lblTempCIO.Text;
				sqlAddCI.Parameters["@default_option"].Value = ddladdCI_DefaultOptionText.SelectedValue;


				LogToPageUrgent("exec spStudyDesign__AddCIO ");
				LogToPageUrgent(" , @consentformversionID = " + sqlAddCI.Parameters["@consentformversionID"].Value.ToString());
				LogToPageUrgent(" , @consentitemtext = '" + sqlAddCI.Parameters["@consentitemtext"].Value.ToString() + "'");
				LogToPageUrgent(" , @consentitemtext_long='" + sqlAddCI.Parameters["@consentitemtext_long"].Value.ToString() + "'");
				LogToPageUrgent(" , @consentitemoption_list='" + sqlAddCI.Parameters["@consentitemoption_list"].Value.ToString() + "'");
				LogToPageUrgent(" , @default_option='" + sqlAddCI.Parameters["@default_option"].Value.ToString() + "'");


				sqlAddCI.ExecuteNonQuery();

				//reset the CIO controls
				lblTempCIO.Text = "";  //initialize new CIO
				txtaddCI_ConsentItemText.Text = "";
				txtaddCI_ConsentItemText_long.Text = "";
				ddladdCI_DefaultOptionText.Items.Clear();

				//reload the panels
				Load_Editing_Panels();

				UpdatePanel_AddCI.Visible = false;
				btn_AddCI.Visible = true;


			}
			catch (SqlException exc)
			{
				LogToPageUrgent(exc.Message);
			}


		}
		else
		{// some error
			lbladdCIO_Error.Text = valcheck;
			lbladdCIO_Error.ForeColor = Color.Red;
			LogToPageUrgent("!!!!!! NO passed check");

		}





	}

	protected void EditCI_RowEditing(object sender, GridViewEditEventArgs e)
	{

	}

	protected void gv_EditCFV_Items_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		LogToPageUrgent(" >>>>>>>>>> HERE IN gv_EditCFV_Items_RowUpdating*** e.RowIndex = " + e.RowIndex.ToString());

		//GridView gv_EditCFV = this.Page.FindControl("gv_EditCFV_Items");

		GridViewRow row = (GridViewRow)gv_EditCFV_Items.Rows[e.RowIndex];

		Label txtCI_cfv_ciID = (Label)row.FindControl("txtCI_cfv_ciID");
		TextBox txtCI_ConsentItemText = (TextBox)row.FindControl("txtCI_ConsentItemText");
		TextBox txtCI_ConsentItemText_long = (TextBox)row.FindControl("txtCI_ConsentItemText_long");
		DropDownList ddlCI_OptionText = (DropDownList)row.FindControl("ddlCI_OptionText");

		LogToPageUrgent(" >>>>>" + txtCI_cfv_ciID.Text + "  " + txtCI_ConsentItemText.Text + "  " + txtCI_ConsentItemText_long.Text + "  " + ddlCI_OptionText.SelectedValue.ToString());

		try
		{
			SqlCommand sqlCmd = new SqlCommand();
			sqlCmd.Connection = oConn;
			sqlCmd.CommandType = CommandType.StoredProcedure;
			sqlCmd.CommandText = "spStudyDesign_EDIT_CFV_CI";

			sqlCmd.Parameters.Add("@consentformversion_consentitemID", SqlDbType.Int, 4);
			sqlCmd.Parameters["@consentformversion_consentitemID"].Value = Convert.ToInt16(txtCI_cfv_ciID.Text);

			sqlCmd.Parameters.Add("@ConsentItemText", SqlDbType.VarChar, 500);
			sqlCmd.Parameters["@ConsentItemText"].Value = txtCI_ConsentItemText.Text;

			sqlCmd.Parameters.Add("@ConsentItemText_long", SqlDbType.VarChar, 2000);
			sqlCmd.Parameters["@ConsentItemText_long"].Value = txtCI_ConsentItemText_long.Text;

			sqlCmd.Parameters.Add("@default_cioID", SqlDbType.Int, 4);
			sqlCmd.Parameters["@default_cioID"].Value = Convert.ToInt16(ddlCI_OptionText.SelectedValue.ToString());

			sqlCmd.ExecuteNonQuery();
		}
		catch (SqlException exc)
		{
			LogToPageUrgent(exc.Message);
		}


		int cfvID = Convert.ToInt16(editCSVID.Text);

		gv_EditCFV_Items.EditIndex = -1;
		
		LoadGrid_ConsentItems(cfvID);

		
		//gv_EditCFV_Items_Bind();
		Panel_EditConsentVersion.Update();

	}



	protected void gv_EditCFV_Items_RowDataBound(object sender, GridViewRowEventArgs e)
	{

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			GridViewRow row = e.Row;
			//LogToPageUrgent(" ** HERE IN gv_EditCFV_Items_RowDataBound*** ");


			try
			{
				//Label lblCI_ciID = e.Row.FindControl("lblCI_ciID") as Label;
				//DropDownList ddlCI_OptionText = e.Row.FindControl("ddlCI_OptionText") as DropDownList;
				//Label txtCI_cfv_ciID = (Label)row.FindControl("txtCI_cfv_ciID");
				//LogToPageUrgent(" **gv_EditCFV_Items_RowDataBound***  txtCI_cfv_ciID = " + txtCI_cfv_ciID.Text);


			}
			catch (Exception exc) 
			{
				LogToPageUrgent(exc.Message);
			}
		}
	}


	protected void gv_EditCFV_Items_RowEditing(object sender, GridViewEditEventArgs e)
	{


		LogToPageUrgent("##### gv_EditCFV_Items_RowEditing");

		//HERER WHY ISN"T THIS BEING CALLED?
		//Set the edit index.
		gv_EditCFV_Items.EditIndex = e.NewEditIndex;

		//Bind data to the GridView control.
		gv_EditCFV_Items_Bind();

		GridViewRow row = gv_EditCFV_Items.Rows[e.NewEditIndex];

		gv_EditCFV_Items.Rows[e.NewEditIndex].BackColor = Color.Yellow;


		Label txtCI_cfv_ciID;
		DropDownList ddlCI_OptionText = new DropDownList();
		HiddenField hidCI_OptionText;
		int ciID = 0;
		string defopt = "";
		bool got_ciID = false;
		bool got_defopt = false;
		bool got_ddl = false;

		int counter = 0;

		foreach (TableCell cell in row.Cells)
		{
			foreach (Control ctl in cell.Controls)
			{
				counter++;
				//LogToPageUrgent(ctl.UniqueID + "  " + ctl.GetType().ToString() + "   " + ctl.ID);

				if (ctl.ID == "txtCI_cfv_ciID")
				{
					txtCI_cfv_ciID = (Label)ctl;
					ciID = Int16.Parse(txtCI_cfv_ciID.Text);
					//LogToPageUrgent(ctl.UniqueID + "  " + ctl.GetType().ToString() + "   " + ctl.ID + " ==== " + txtCI_ciID.Text);
					got_ciID = true;
				}

				if (ctl.ID == "hidCI_OptionText")
				{
					hidCI_OptionText = (HiddenField)ctl;
					defopt = hidCI_OptionText.Value;
					//LogToPageUrgent(ctl.UniqueID + "  " + ctl.GetType().ToString() + "   " + ctl.ID + " ==== " + hidCI_OptionText.Value);
					got_defopt = true;
				}


				if (ctl.ID == "ddlCI_OptionText")
				{
					ddlCI_OptionText = (DropDownList)ctl;
					LogToPageUrgent(ctl.UniqueID + "  " + ctl.GetType().ToString() + "   " + ctl.ID + "  ");


					got_ddl = true;
				}

			}
		}

		LogToPageUrgent(" HERE!!  {" + ciID.ToString() + "}   counter=" + counter.ToString());

		LogToPageUrgent(" got_ciID {" + got_ciID.ToString() + "}   got_defopt={" + got_defopt.ToString() + "}   got_ddl={" + got_ddl.ToString() + "}");

		if (got_ciID & got_defopt & got_ddl)
		{
			try
			{
				LogToPageUrgent("in loop HERE!!  {" + ciID.ToString() + "}   ");

				SqlCommand sqlddl = new SqlCommand();
				sqlddl.Connection = oConn;
				sqlddl.CommandType = CommandType.StoredProcedure;
				sqlddl.CommandText = "spSEC_StudyDesign__ConsentItemOptions";
				sqlddl.Parameters.Add("@cfv_ciID", SqlDbType.Int, 4);
				sqlddl.Parameters["@cfv_ciID"].Value = (ciID);
				SqlDataReader sqlddl_reader = sqlddl.ExecuteReader();
				DataTable dtCIO = new DataTable();
				dtCIO.Load(sqlddl_reader);

				ddlCI_OptionText.DataSource = dtCIO;
				ddlCI_OptionText.DataTextField = "OptionText";
				ddlCI_OptionText.DataValueField = "cioID";
				ddlCI_OptionText.DataBind();
				ddlCI_OptionText.Items.FindByText(defopt).Selected = true;


			}
			catch (Exception exc) 
			{
				LogToPageUrgent(exc.Message);
			}
		}



	}

	private void gv_EditCFV_Items_Bind()
	{
		gv_EditCFV_Items.DataSource = Session["dtCI"];
		gv_EditCFV_Items.DataBind();
	}

	protected void gv_EditCFV_Items_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		LogToPageUrgent(" >>>>>>> gv_EditCFV_Items_RowCancelingEdit!!     ");

		//Reset the edit index.
		gv_EditCFV_Items.EditIndex = -1;
		//Bind data to the GridView control.
		gv_EditCFV_Items_Bind();
	}




	protected void EditCFV_submit(object sender, EventArgs e)
	{
		ChangeConsent_submit("edit");
		LogToPageUrgent("edit");
	}

	protected void AddCFV_submit(object sender, EventArgs e)
	{
		ChangeConsent_submit("add_CFV");
		LogToPageUrgent("add_CFV");
	}

	protected void AddConsent_submit(object sender, EventArgs e)
	{
		ChangeConsent_submit("add_consent");
		LogToPageUrgent("add_consent");
	}

	protected void ChangeConsent_submit(string mode)
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";
		bool continue_submission = true;
		string errorList = "";

		Label editCSVID = (Label)this.FindControlRecursive(Panel_EditConsentVersion, "editCSVID");
		TextBox edittxtConsentName = (TextBox)this.FindControlRecursive(Panel_EditConsentVersion, "edittxtConsentName");
		TextBox edittxtConsentNameShort = (TextBox)this.FindControlRecursive(Panel_EditConsentVersion, "edittxtConsentNameShort");
		Label edittxtCFVNumber = (Label)this.FindControlRecursive(Panel_EditConsentVersion, "edittxtCFVNumber");
		TextBox edittxtCFVName = (TextBox)this.FindControlRecursive(Panel_EditConsentVersion, "edittxtCFVName");
		TextBox edittxtCFVeffdate = (TextBox)this.FindControlRecursive(Panel_EditConsentVersion, "edittxtCFVeffdate");
		TextBox edittxtCFVenddate = (TextBox)this.FindControlRecursive(Panel_EditConsentVersion, "edittxtCFVenddate");
		TextBox edittxtReasonForChange = (TextBox)this.FindControlRecursive(Panel_EditConsentVersion, "edittxtReasonForChange");
		


		//Step 1 - Consent form name must be populated
		if (edittxtCFVName.Text.Length > 0)
		{

			try
			{

				string groups_to_add = GetGroupsListForEdits("add", "Panel_EditConsent", "Panel_EditConsent_Groups_for_Editing");
				LogToPage("GetGroupsListForEdits ADD=[" + groups_to_add + "]");

				string groups_to_del = GetGroupsListForEdits("del", "Panel_AddConsent", "Panel_EditConsent_Groups_for_Editing");
				LogToPage("GetGroupsListForEdits DEL=[" + groups_to_del + "]");

				//LogToPageUrgent(" groups_to_add=" + groups_to_add);
				//LogToPageUrgent(" groups_to_adel=" + groups_to_del);


				SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand();
				sqlCmd.Connection = oConn;
				sqlCmd.CommandType = CommandType.StoredProcedure;
				sqlCmd.CommandText = "spStudyDesign_EDIT_StudyConsent_and_Vers__from_web";

				sqlCmd.Parameters.Add("@mode", SqlDbType.VarChar, 20);
				sqlCmd.Parameters.Add("@studyID", SqlDbType.Int, 4);
				sqlCmd.Parameters.Add("@consentformversionID", SqlDbType.Int, 4);
				sqlCmd.Parameters.Add("@consentformname", SqlDbType.VarChar, 250);
				sqlCmd.Parameters.Add("@ConsentFormNameShort", SqlDbType.VarChar, 50);
				sqlCmd.Parameters.Add("@cfv_version", SqlDbType.Int, 4);
				sqlCmd.Parameters.Add("@consentformversionname", SqlDbType.VarChar, 250);
				sqlCmd.Parameters.Add("@apprvdate", SqlDbType.VarChar, 12);
				sqlCmd.Parameters.Add("@effdate", SqlDbType.VarChar, 12);
				sqlCmd.Parameters.Add("@endingdate", SqlDbType.VarChar, 12);
				sqlCmd.Parameters.Add("@ReasonForChange", SqlDbType.VarChar, 2000);
				sqlCmd.Parameters.Add("@studyactionID", SqlDbType.Int, 4);
				sqlCmd.Parameters.Add("@groups_to_add", SqlDbType.VarChar, 200);
				sqlCmd.Parameters.Add("@groups_to_del", SqlDbType.VarChar, 200);
				sqlCmd.Parameters.Add("@infomsg", SqlDbType.VarChar, 500);

				sqlCmd.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int, 4));

				//sqlCmd.Parameters["@infomsg"].Direction = ParameterDirection.Output;
				//sqlCmd.Parameters["@infomsg"].Value = "";

				sqlCmd.Parameters["@ReturnValue"].Direction = ParameterDirection.ReturnValue;
				sqlCmd.Parameters["@ReturnValue"].Value = DBNull.Value;



				if (mode == "edit")
				{
					sqlCmd.Parameters["@mode"].Value = "edit";
					sqlCmd.Parameters["@studyID"].Value = _content_studyID;
					sqlCmd.Parameters["@consentformversionID"].Value = Convert.ToInt32(editCSVID.Text);
					sqlCmd.Parameters["@consentformname"].Value = edittxtConsentName.Text;
					sqlCmd.Parameters["@ConsentFormNameShort"].Value = edittxtConsentNameShort.Text;
					sqlCmd.Parameters["@cfv_version"].Value = Convert.ToInt32(edittxtCFVNumber.Text);
					sqlCmd.Parameters["@consentformversionname"].Value = edittxtCFVName.Text;
					sqlCmd.Parameters["@apprvdate"].Value = edittxtCFVapprvdate.Text;
					sqlCmd.Parameters["@effdate"].Value = edittxtCFVeffdate.Text;
					sqlCmd.Parameters["@endingdate"].Value = edittxtCFVenddate.Text;
					sqlCmd.Parameters["@ReasonForChange"].Value = edittxtReasonForChange.Text;
					sqlCmd.Parameters["@groups_to_add"].Value = groups_to_add;
					sqlCmd.Parameters["@groups_to_del"].Value = groups_to_del;
					sqlCmd.Parameters["@infomsg"].Direction = ParameterDirection.Output;

					sqlCmd.Parameters["@studyactionID"].Value = 0;
				}

				if (mode == "add_CFV")
				{
					if (edittxtReasonForChange.Text == "") errorList += "Enter the reason this consent form changed.<br/>";

					sqlCmd.Parameters["@mode"].Value = "add_CFV";
					sqlCmd.Parameters["@studyID"].Value = _content_studyID;
					sqlCmd.Parameters["@consentformversionID"].Value = Convert.ToInt32(editCSVID.Text);
					sqlCmd.Parameters["@consentformname"].Value = edittxtConsentName.Text;
					sqlCmd.Parameters["@ConsentFormNameShort"].Value = edittxtConsentNameShort.Text;
					sqlCmd.Parameters["@cfv_version"].Value = Convert.ToInt32(edittxtCFVNumber.Text);
					sqlCmd.Parameters["@consentformversionname"].Value = edittxtCFVName.Text;
					sqlCmd.Parameters["@apprvdate"].Value = edittxtCFVapprvdate.Text;
					sqlCmd.Parameters["@effdate"].Value = edittxtCFVeffdate.Text;
					sqlCmd.Parameters["@endingdate"].Value = edittxtCFVenddate.Text;
					sqlCmd.Parameters["@ReasonForChange"].Value = edittxtReasonForChange.Text;
					sqlCmd.Parameters["@groups_to_add"].Value = groups_to_add;
					sqlCmd.Parameters["@groups_to_del"].Value = "";
					sqlCmd.Parameters["@infomsg"].Direction = ParameterDirection.Output;

					sqlCmd.Parameters["@studyactionID"].Value = 0;
				}


				if (mode == "add_consent")
				{

					if (groups_to_add == "") errorList += "Select the groups for this consent.<br/>";

					if (edittxtConsentName.Text == "") errorList += "Enter a consent form name.<br/>";
					if (edittxtCFVapprvdate.Text == "") errorList += "Enter the date of approval.<br/>";
					if (edittxtCFVeffdate.Text == "") errorList += "Enter the effective date.<br/>";


					sqlCmd.Parameters["@mode"].Value = "add_consent";
					sqlCmd.Parameters["@studyID"].Value = _content_studyID;
					sqlCmd.Parameters["@consentformversionID"].Value = -1;
					sqlCmd.Parameters["@consentformname"].Value = edittxtConsentName.Text;
					sqlCmd.Parameters["@ConsentFormNameShort"].Value = edittxtConsentNameShort.Text;
					sqlCmd.Parameters["@cfv_version"].Value = 1;
					sqlCmd.Parameters["@consentformversionname"].Value = edittxtCFVName.Text;
					sqlCmd.Parameters["@apprvdate"].Value = edittxtCFVapprvdate.Text;
					sqlCmd.Parameters["@effdate"].Value = edittxtCFVeffdate.Text;
					sqlCmd.Parameters["@endingdate"].Value = edittxtCFVenddate.Text;
					sqlCmd.Parameters["@ReasonForChange"].Value = "";
					sqlCmd.Parameters["@groups_to_add"].Value = groups_to_add;
					sqlCmd.Parameters["@groups_to_del"].Value = "";
					sqlCmd.Parameters["@infomsg"].Direction = ParameterDirection.Output;

					sqlCmd.Parameters["@studyactionID"].Value = Int32.Parse(editstudyactionID_for_newC.Text);

				}


				if (errorList != "") continue_submission = false;

				if (continue_submission)
				{
					editConsent_INFO.Text = "";

					LogToPageUrgent("declare @msg varchar(500)");
					LogToPageUrgent("exec  spStudyDesign_EDIT_StudyConsent_and_Vers__from_web ");
					LogToPageUrgent(" @mode = '" + sqlCmd.Parameters["@mode"].Value.ToString() + "'");
					LogToPageUrgent(",@studyID =           " + sqlCmd.Parameters["@studyID"].Value.ToString());
					LogToPageUrgent(",@consentformversionID =    " + sqlCmd.Parameters["@consentformversionID"].Value.ToString());
					LogToPageUrgent(",@consentformname = '" + sqlCmd.Parameters["@consentformname"].Value.ToString() + "'");
					LogToPageUrgent(",@ConsentFormNameShort = '" + sqlCmd.Parameters["@ConsentFormNameShort"].Value.ToString() + "'");
					LogToPageUrgent(",@cfv_version =       " + sqlCmd.Parameters["@cfv_version"].Value.ToString());
					LogToPageUrgent(",@consentformversionname= '" + sqlCmd.Parameters["@consentformversionname"].Value.ToString() + "'");
					LogToPageUrgent(",@apprvdate = '" + sqlCmd.Parameters["@apprvdate"].Value.ToString() + "'");
					LogToPageUrgent(",@effdate = '" + sqlCmd.Parameters["@effdate"].Value.ToString() + "'");
					LogToPageUrgent(",@endingdate = '" + sqlCmd.Parameters["@endingdate"].Value.ToString() + "'");
					LogToPageUrgent(",@ReasonForChange = '" + sqlCmd.Parameters["@ReasonForChange"].Value.ToString() + "'");
					LogToPageUrgent(",@studyactionID = '" + sqlCmd.Parameters["@studyactionID"].Value.ToString() + "'"); 
					LogToPageUrgent(",@groups_to_add = '" + sqlCmd.Parameters["@groups_to_add"].Value.ToString() + "'");
					LogToPageUrgent(",@groups_to_del = '" + sqlCmd.Parameters["@groups_to_del"].Value.ToString() + "'");
					LogToPageUrgent(",@infomsg = @msg");

					sqlCmd.ExecuteNonQuery();

					int sReturnValue = Convert.ToInt16(sqlCmd.Parameters["@ReturnValue"].Value);
					string infomsg = sqlCmd.Parameters["@infomsg"].Value.ToString();

					if (sReturnValue == 0)
					{
						LogToPageSQLInfo(infomsg);
					}
					else
					{
						LogToPageSQLInfo("else!!!!!!!!!!!!!");
					}
				}
				else
				{
					editConsent_INFO.Text = errorList;
				}
			}

			catch (SqlException sqlexp)
			{
				LogToPageSQLError(sqlexp.Message);

				editConsent_INFO.Text = sqlexp.Message;
			}
		}


		else
			{ 
				LogToPageSQLError("You must enter a name for this Version.");
			}


		CancelEditing();

		LoadGrid_Studyconsent();

		//LoadGrid_StudyAction_Consent();

	}




	protected void DeleteCFV_submit(object sender, EventArgs e)
	{
		string del_CFVID = ((Label)Panel_EditConsentVersion.FindControl("editCSVID")).Text;

		try
		{
			string sql_string = "exec  spStudyDesign_DELETE_ConsentFormVersion_from_Web " + del_CFVID + ", 'commit'";
			LogToPageUrgent(".........SUBMIT  DELETE CFV ............<br/>---> " + sql_string);
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand();
			sqlCmd.Connection = oConn;
			sqlCmd.CommandType = CommandType.StoredProcedure;
			sqlCmd.CommandText = "spStudyDesign_DELETE_ConsentFormVersion_from_Web";

			sqlCmd.Parameters.Add("@consentformversionID", SqlDbType.Int, 4);
			sqlCmd.Parameters.Add("@mode", SqlDbType.VarChar, 10);

			sqlCmd.Parameters["@consentformversionID"].Value = Int32.Parse(del_CFVID);
			sqlCmd.Parameters["@mode"].Value = "commit";


			sqlCmd.Parameters.Add("@infomsg", SqlDbType.VarChar, 500);
			sqlCmd.Parameters["@infomsg"].Direction = ParameterDirection.Output;
			sqlCmd.Parameters["@infomsg"].Value = "";


			sqlCmd.Parameters.Add("@ReturnValue", SqlDbType.Int, 4);
			sqlCmd.Parameters["@ReturnValue"].Direction = ParameterDirection.ReturnValue;
			sqlCmd.Parameters["@ReturnValue"].Value = DBNull.Value;

			sqlCmd.ExecuteNonQuery();

			int sReturnValue = Convert.ToInt16(sqlCmd.Parameters["@ReturnValue"].Value);
			string infomsg = sqlCmd.Parameters["@infomsg"].Value.ToString();

			if (sReturnValue == 0)
			{
				LogToPageSQLInfo(infomsg);
			}
			else
			{
				LogToPageSQLInfo("else!!!!!!!!!!!!!");
			}


		}
		catch (SqlException sqlexc)
		{
			LogToPageSQLError(sqlexc.Message);
		}

		//ResetEditingEntity();
		//LoadGrids();

		CancelEditing();
	}



	protected void gv_EditCFV_Items_RowUpdated(object sender, GridViewUpdatedEventArgs e)
	{

	}

	#endregion



	#region MOVE items to different actions
	protected void Edit_MoveC(int sourceC, int destSA, string groups_to_move)
	{

		try
		{
			string sql_string = "exec  spStudyDesign_MOVE_StudyConsent_from_Web " + sourceC.ToString() +
				", " + destSA.ToString() + ", '" + groups_to_move + "', 'noprint', 'commit'";

			LogToPageUrgent(sql_string);
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();
		}
		catch (SqlException sqlexp)
		{
			LogToPageSQLError(sqlexp.Message);
		}

		LoadGrid_StudyAction_Consent();

	}

	protected void Edit_MoveSM(int sourceSM, int destSA, string groups_to_move)
	{
		//lblMyError.Text = "";
		//lblMyInfo.Text = "";

		//Control ctlParent = this.FindControlRecursive(this.Page, "PanelR1C1");
		//Control ctl = this.FindControlRecursive(ctlParent, "GridView_Group");
		//GridView mygvGroups = (GridView)ctl;

		//Control ctl_actiontext = this.FindControlRecursive(Panel_AddAction, "txt_actiontext");
		//TextBox actiontext = (TextBox)ctl_actiontext;
		//int numgroupsadded = 0;
		//string groups_to_add = "";
		//string sql_string = "";


		try
		{
			string sql_string = "exec  spStudyDesign_MOVE_StudyMeas_from_Web " + sourceSM.ToString() +
				", " + destSA.ToString() + ", '" + groups_to_move + "', 'noprint', 'commit'";

			LogToPageUrgent(sql_string);
			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
			sqlCmd.ExecuteNonQuery();


		}
		catch (SqlException sqlexp)
		{
			LogToPageSQLError(sqlexp.Message);
		}

		LoadGrid_StudyAction_StudyMeas();

	}
	#endregion

	#region CANCEL editing
	protected void CancelEditing(object sender, EventArgs e)
	{
		CancelEditing();
	}

	protected void CancelEditing()
	{
		ResetEditingEntity();

		ClearErrorLog();
		ClearInfoLog();
		//lblUpdateInfo.Text = "";
		//lblUpdateError.Text = "";


		UpdatePanel1.ContentTemplateContainer.Controls.Clear();

		Panel_EditGroup.Visible = false;
		Panel_EditTimepoint.Visible = false;

		LoadGrids();
		// Panel_AddAction.Visible = false;
	}


	#endregion

	#endregion

	////TO DEL
	//protected void AddConsent_submit(object sender, EventArgs e)
	//{
	//    lblMyError.Text = "";
	//    lblMyInfo.Text = "";

	//    Control ctlParent = this.FindControlRecursive(this.Page, "PanelR1C1");
	//    Control ctl = this.FindControlRecursive(ctlParent, "GridView_Group");
	//    GridView mygvGroups = (GridView)ctl;

	//    Control ctl_txtNewConsentFormName = this.FindControlRecursive(Panel_AddConsent, "txtNewConsentFormName");
	//    TextBox txtNewConsentFormName = (TextBox)ctl_txtNewConsentFormName;

	//    Control ctl_txtNewConsentFormNameShort = this.FindControlRecursive(Panel_AddConsent, "txtNewConsentFormNameShort");
	//    TextBox txtNewConsentFormNameShort = (TextBox)ctl_txtNewConsentFormNameShort;

	//    Control ctl_effdate = this.FindControlRecursive(Panel_AddConsent, "effdate");
	//    TextBox effdate = (TextBox)ctl_effdate;


	//    int numgroupsadded = 0;

	//    //Step 1 - Consent form name must be populated
	//    if (txtNewConsentFormName.Text.Length > 2)
	//    {
	//        string groups_to_add = GetGroupsListForEdits("add", "Panel_AddConsent", "Panel_AddConsent_Groups_for_Editing");
	//        LogToPage("GetGroupsListForEdits ADD=[" + groups_to_add + "]");

	//        string groups_to_del = GetGroupsListForEdits("del", "Panel_AddConsent", "Panel_AddConsent_Groups_for_Editing");
	//        LogToPage("GetGroupsListForEdits DEL=[" + groups_to_del + "]");


	//        if (groups_to_add == "")
	//        {
	//            lblUpdateError.Text = "No groups were checked.";
	//        }
	//        else
	//        {
	//            try
	//            {
	//                numgroupsadded++;
	//                string sql_string = "exec  spStudyDesign_ADD_NEWStudyConsent__from_web " + _content_studyID.ToString() + ", '" + groups_to_add + "', '" +
	//                    txtNewConsentFormName.Text + "','" + effdate.Text + "'";

	//                LogToPageUrgent("......SUBMIT  Add Consent ............<br/>---> " + sql_string);

	//                SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
	//                sqlCmd.ExecuteNonQuery();

	//               // ResetEditingEntity();
	//            }
	//            catch (SqlException sqlexp)
	//            {
	//                lblUpdateInfo.Text = sqlexp.Message;

	//            }
	//        }

	//        //    if (numgroupsadded == 0)
	//        //    {
	//        //        LogToPageSQLError("No groups were checked.");
	//        //    }

	//        //}



	//    }
	//    else
	//    { LogToPageSQLError("You must enter a Consent Form name."); }


	//    //LoadGrids();

	//}



	////TO DEL
	//protected void EditConsent_Submit(object sender, EventArgs e)
	//{
	//    lblMyError.Text = "";
	//    lblMyInfo.Text = "";

	//    Control ctlParent = this.FindControlRecursive(this.Page, "PanelR1C1");
	//    Control ctl = this.FindControlRecursive(ctlParent, "GridView_Group");
	//    GridView mygvGroups = (GridView)ctl;

	//    TextBox edittxtNewConsentFormName = (TextBox)this.FindControlRecursive(Panel_AddConsent, "edittxtNewConsentFormName");
	//    TextBox txtNewConsentFormNameShort = (TextBox)this.FindControlRecursive(Panel_AddConsent, "txtNewConsentFormNameShort");



	//    int numgroupsadded = 0;

	//    //Step 1 - Consent form name must be populated
	//    if (txtNewConsentFormName.Text.Length > 2)
	//    {
	//        string groups_to_add = GetGroupsListForEdits("add", "Panel_EditConsent", "Panel_EditConsent_Groups_for_Editing");
	//        LogToPage("GetGroupsListForEdits ADD=[" + groups_to_add + "]");

	//        string groups_to_del = GetGroupsListForEdits("del", "Panel_AddConsent", "Panel_EditConsent_Groups_for_Editing");
	//        LogToPage("GetGroupsListForEdits DEL=[" + groups_to_del + "]");

	//        LogToPageUrgent(" groups_to_add=" + groups_to_add);
	//        LogToPageUrgent(" groups_to_adel=" + groups_to_del);

	//        if (groups_to_add == "")
	//        {
	//            lblUpdateError.Text = "No groups were checked.";
	//        }
	//        else
	//        {
	//            try
	//            {
	//                numgroupsadded++;
	//                string sql_string = "exec  spStudyDesign_EDIT_StudyConsent_and_Vers__from_web " + _content_studyID.ToString() + ", '" + groups_to_add + "', '" +
	//                    txtNewConsentFormName.Text + "','" + effdate.Text + "'";

	//                LogToPageUrgent("......SUBMIT  Add Consent ............<br/>---> " + sql_string);

	//                SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
	//                sqlCmd.ExecuteNonQuery();

	//                ResetEditingEntity();
	//            }
	//            catch (SqlException sqlexp)
	//            {
	//                lblUpdateInfo.Text = sqlexp.Message;

	//            }
	//        }


	//    }
	//    else
	//    { LogToPageSQLError("You must enter a Consent Form name."); }


	//    //LoadGrids();

	//}


	//TO DEL
	//protected void AddCFV_submit(object sender, EventArgs e)
	//{
	//    lblMyError.Text = "";
	//    lblMyInfo.Text = "";

	//    Control ctlParent = this.FindControlRecursive(this.Page, "PanelR1C1");
	//    Control ctl = this.FindControlRecursive(ctlParent, "GridView_Group");
	//    GridView mygvGroups = (GridView)ctl;

	//    Label lblConsentFormID_CFV = (Label)this.FindControlRecursive(Panel_AddConsentVersion, "lblConsentFormID_CFV");
	//    TextBox txtCFVName = (TextBox)this.FindControlRecursive(Panel_AddConsentVersion, "txtCFVName");
	//    TextBox txtCFVeffdate = (TextBox)this.FindControlRecursive(Panel_AddConsentVersion, "txtCFVeffdate");
	//    TextBox txtReasonForChange = (TextBox)this.FindControlRecursive(Panel_AddConsentVersion, "txtReasonForChange");


	//    int numgroupsadded = 0;

	//    //Step 1 - Consent form name must be populated
	//    if (txtCFVName.Text.Length > 0)
	//    {

	//        try
	//        {
	//            numgroupsadded++;
	//            string sql_string = "exec  spStudyDesign_ADD_NEWStudyConsentVersion__from_web " + _content_studyID.ToString() + ", " + lblConsentFormID_CFV.Text + ", '" +
	//                txtCFVName.Text + "','" + txtCFVeffdate.Text + "','" + txtReasonForChange.Text + "'";

	//            SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql_string, oConn);
	//            sqlCmd.ExecuteNonQuery();
	//        }

	//        catch (SqlException sqlexp)
	//        {
	//            LogToPageSQLError(sqlexp.Message);
	//        }

	//    }


	//    else
	//    {
	//        LogToPageSQLError("You must enter a name for this Version.");
	//    }

	//    LoadGrid_Studyconsent();

	//}



	//TO DEL


	//TO DEL
	//protected void AddAction_Cancel(object sender, EventArgs e)
	//{
	//    ResetEditingEntity();
	//   // Panel_AddAction.Visible = false;
	//}

	//protected void AddMeas_Cancel(object sender, EventArgs e)
	//{
	//    ResetEditingEntity();
	//   // Panel_AddMeas.Visible = false;
	//}

	//protected void AddConsent_Cancel(object sender, EventArgs e)
	//{
	//    ResetEditingEntity();
	//   // Panel_AddConsent.Visible = false;
	//}

	//protected void AddTrigger_Cancel(object sender, EventArgs e)
	//{
	//    ResetEditingEntity();
	//   // Panel_AddTrigger.Visible = false;
	//}

	//protected void EditAction_Cancel(object sender, EventArgs e)
	//{
	//    ResetEditingEntity();
	//   // Panel_EditAction.Visible = false;
	//}

	//protected void EditMeas_Cancel(object sender, EventArgs e)
	//   {
	//       ResetEditingEntity();
	//      // Panel_EditMeas.Visible = false;
	//   }

 


	protected string GetGroupsListForEdits(string mode, string container1, string container2)
	{
		LogToPage("^^^^^^ Here at GetGroupsListForEdits: mode=[" + mode + "] ,  con1=[" + container1 + "] ,  con2=[" + container2 + "]");

		string gv = "GridView_Groups_for_Editing";
		string groups_to_add_list = "";

		foreach (Control ctl in UpdatePanel1.ContentTemplateContainer.Controls)
		{
			if (ctl != null && ctl.ID != null)
			{
				//get the label
				if (ctl.ID.StartsWith("btnlbl"))
				{
					Label btnlbl = (Label)ctl;
					if ((btnlbl.Text == "To be added" && mode == "add") || (btnlbl.Text == "To be deleted" && mode == "del"))
					{
						string[] args = btnlbl.ID.Split('|');
						groups_to_add_list += args[1] + ",";
					}
				}
			}
		}

		//}
		//catch (Exception)  
		//{
		//    LogToPageSQLError("get groups error.");
		//    LogToPageSQLError(exc.Message); 
		//}

		LogToPage("^^^^^^ groups_to_add_list =[" + groups_to_add_list + "]");

		return groups_to_add_list;
	}

	
	

	#region Show/Cancel Edit Panels
	protected void show_Panel_AddGroup()
	{
		ShowPanel("Group");
	}
	protected void show_Panel_AddGroup(object sender, EventArgs e)
	{
		ShowPanel("Group");
	}


	protected void show_Panel_EditGroup()
	{
		ShowPanel("Group");
	}
	protected void show_Panel_EditGroup(object sender, EventArgs e)
	{
		ShowPanel("Group");
	}


	protected void show_Panel_AddTimepoint()
	{
		ShowPanel("Timepoint");
	}
	protected void show_Panel_AddTimepoint(object sender, EventArgs e)
	{
		ShowPanel("Timepoint");
	}

	protected void show_Panel_AddTrigger_DueDate()
	{
		// next line NOT needed?
		UpdateEditingEntity("trigger", Convert.ToString(lblEditTrigger_StudyactionID.Text), "edit");

		ddlSA_for_DueDate.SelectedValue = null;
		txt_numtoaddstart.Text = "";
		txt_numtoaddend.Text = "";
		ddl_Dateunits.SelectedValue = null;
		ddl_Datebase.SelectedValue = null;
		btn_AddTrigger_DueDate_Submit.Text = "Insert Due Date Trigger";


		Panel_AddTrigger_DueDate.Visible = true;

	}
	protected void show_Panel_AddTrigger_DueDate(object sender, EventArgs e)
	{
		show_Panel_AddTrigger_DueDate(); 
	}

	protected void Cancel_AddDueDate(object sender, EventArgs e)
	{
		Panel_AddTrigger_DueDate.Visible = false;
	}



	protected void ShowPanel(string thispanel)
	{
		LogToPage("== Here in ShowPanel....  thispanel = " + thispanel);
		HideAll_AddPanels();
		//btnAddTimepoint.Visible = false;
		//btnAddGroup.Visible = false;

		switch (thispanel)
		{
			case "Group":
				Panel_AddGroup.Visible = true;
				break;
			case "Timepoint":
				Panel_AddTimepoint.Visible = true;
				break;
			//case "Trigger_DueDate":
			//    Panel_AddTrigger_DueDate.Visible = true;
			//    break;        
			//    case "Action":
			//        Panel_AddAction.Visible = true;
			//        //Populate_Groups_for_Editing("action", -1, "add");
			//        break;
			//    case "Measure":
			//        Panel_AddMeas.Visible = true;
			//        //Populate_Groups_for_Editing("studymeas", -1, "add");
			//        break;
			//    case "Consent":
			//        Panel_AddConsent.Visible = true;
			//        //Populate_Groups_for_Editing("consent", -1, "add");
			//        break;
			//    case "CFV":
			//        Panel_AddConsentVersion.Visible = true;
			//        break;
			//    case "Trigger":
			//        Panel_AddTrigger.Visible = true;
			//        //Populate_Groups_for_Editing("trigger", -1, "add");
			//        break;
		}
	}



	protected void HideAll_AddPanels()
	{
	   // ResetEditingEntity();
		//ClearErrorLog();

		LogToPage("== Here in HideAll_AddPanels ....");
		Panel_AddGroup.Visible = false;
		Panel_AddTimepoint.Visible = false;
		Panel_AddAction.Visible = false;
		Panel_AddMeas.Visible = false;
		//Panel_AddConsent.Visible = false;
		//Panel_AddConsentVersion.Visible = false;
		Panel_AddTrigger.Visible = false;
		Panel_AddTrigger_DueDate.Visible = false;

		Panel_EditGroup.Visible = false;
		Panel_EditTimepoint.Visible = false;
		Panel_EditAction.Visible = false;
		Panel_EditMeas.Visible = false;
		//Panel_EditConsent.Visible = false;
		Panel_EditConsentVersion.Visible = false;
		Panel_EditTrigger.Visible = false;

		UpdatePanel_AddCI.Visible = false;
		Panel_EditCFV_Items.Visible = false;

		PanelR3C1_sorter.Visible = false;

		//btnAddTimepoint.Visible = true;
		//btnAddGroup.Visible = true;
	}
	protected void HideAll_AddPanels(object sender, EventArgs e) {
		
		HideAll_AddPanels();
	}




	#endregion


	//TO DEL
	//private void Gridview_RowDataBound_Create_Literals(Object sender, GridViewRowEventArgs e)
	//{

	//    if (e.Row.RowType == DataControlRowType.DataRow)  //if a data row
	//    {

	//        LogToPage("==========> e.Row.Cells.Count = " + e.Row.Cells.Count.ToString() + "  <br/>");
	//        LogToPage("==========>   _colnames.length = " + _colnames.Length.ToString() + "  <br/>");

	//        for (int c = 0; c < e.Row.Cells.Count; c++)
	//        {

	//            //Get the control  - NOT CLEAR WHY .Text DOES NOT GIVE THE LABEL TEXT??
	//            DataControlFieldCell celllabel = (DataControlFieldCell)e.Row.Controls[c];

	//            //if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "==========> c: " + c.ToString() + " <br/>";

	//            if (c <= _colnames.Length)  //This prevents an out of range error
	//            {
	//                string cellval_full = "";
	//                try
	//                {
	//                    cellval_full = Convert.ToString(DataBinder.Eval(e.Row.DataItem, _colnames[c]));
	//                }
	//                catch
	//                {
	//                    cellval_full = "";
	//                }
	//                string cellval = "";

	//            }
	//        }

	//    }
	//}


	#region MsgBox / Alert code (not implemented)
	//public static void ShowAlert(Page page, String message)
	//{
	//    String Output;
	//    Output = String.Format("alert('{0}');", message);
	//    page.ClientScript.RegisterStartupScript(page.GetType(), "Key", Output, true);
	//}


	//protected bool jmConfirm()
	//{
	//    bool mybool = this.Page.ClientScript.RegisterStartupScript(this.GetType(), "confirm", "confirm('You clicked YES!, correct?')", true);

	//    if (mybool)
	//    {
	//        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked OK')", true);

	//    }
	//    else
	//    {
	//        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked CANCEL')", true);

	//    }
	//}


	//public void OnConfirm(object sender, EventArgs e)
	//{
	//    string confirmValue = Request.Form["confirm_value"];
	//    if (confirmValue == "Yes")
	//    {
	//        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "confirm", "return confirm('You clicked YES!, correct?')", true);
			
	//    }
	//    else
	//    {
	//        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked NO!')", true);
	//    }
	//}
	#endregion 


	#region Misc Utilities
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
		string hid = "  ";
		//string hid = "  [" + hidEntity.Value + "][" + hidEntityID.Value + "][" + hidEdittype.Value + "][" + hidMode.Value + "]"+
		//    "....G_Add[" + hidGroupsToAdd.Value + "]....G_Del[" + hidGroupsToDel.Value + "]";
		tblmyinfo.Rows[0].Cells[0].InnerHtml += text + "   " + hid + "<br/>";
	}



	private void LogToPageSQLInfo(string text)
	{
		UpdatePanel_Info.Visible = true;
		lblUpdateInfo.Text += text.Replace("Warning: Null value is eliminated by an aggregate or other SET operation.", "");
		//if (text.Contains("rror"))
		//{
		//    lblUpdateInfo.Text = text.Replace("Warning: Null value is eliminated by an aggregate or other SET operation.", "");
		//    //lblMyInfo.Text += "";
		//}
		//else
		//{

		//    //lblMyInfo.Text = text.Replace("Warning: Null value is eliminated by an aggregate or other SET operation.","");
		//    //lblMyError.Text = "";
		//}
	}

	private void LogToPageSQLError(string text)
	{
		lblUpdateError.Text = text;
		//if (text.Contains("rror"))
		//{
		//    lblUpdateError.Text = text;
		//    //lblMyInfo.Text += "";
		//}
		//else
		//{            
		//    //lblMyInfo.Text = text.Replace("Warning: Null value is eliminated by an aggregate or other SET operation.","");
		//    //lblMyError.Text = "";
		//}
	}

	private void ClearErrorLog()
	{
		LogToPage("== Here in ClearErrorLog .... TURN back on when needed....");
		lblUpdateError.Text = "";
		//tofix turn back on when needed
		//lblMyError.Text = "";
		//lblMyInfo.Text = "";
		//tblmyerror.Rows[0].Cells[0].InnerHtml = "";
	}

	private void ClearInfoLog()
	{
		lblUpdateInfo.Text = "";
		//tblmyinfo.Rows[0].Cells[0].InnerHtml = "cleared.<br/>";
	}

	protected void ClearLogs(object sender, EventArgs e)
	{
		ClearInfoLog();
		ClearErrorLog();
	}


	protected void DisplayControlsInObject(Control mainctl)
	{
		if (mainctl != null)
		{
			Panel p = (Panel)mainctl;

			LogToPage(" //////// Start Controls in " + mainctl.ID + " ////////////");
			foreach (Control ctl in p.Controls)
			{
				LogToPage("..." + ctl.ID);
				if (ctl.ID != null)
				{
					string ctlID = ctl.ID.ToString();
					LogToPage("..." + ctl.ID);
					if (ctlID.StartsWith("txt"))
					{
						TextBox txt = (TextBox)ctl;
						LogToPage("        [" + txt.Text + "]");
					}
					if (ctlID.StartsWith("ddl"))
					{
						DropDownList ddl = (DropDownList)ctl;
						LogToPage("        [" + ddl.SelectedValue + "]");
					}
				}

			}
			LogToPage(" //////// End Controls in " + mainctl.ID + " ////////////");
		}
	}


	public static DataRow GridViewRowToDataRow(GridViewRow gvr)
	{
		object di = null;
		DataRowView drv = null;
		DataRow dr = null;

		if (gvr != null)
		{
			di = gvr.DataItem as System.Object;
			if (di != null)
			{
				drv = di as System.Data.DataRowView;
				if (drv != null)
				{
					dr = drv.Row as System.Data.DataRow;
				}
			}
		}

		return dr;
	}



	protected void UPclick(object sender, EventArgs e)
	{
	   // UpdateGroupsToAdd(UPtxt.Text, "add");
	}

	protected void UpdateActionText(object sender, EventArgs e)
	{



	}

	#endregion

	

}



