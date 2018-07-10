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
using System.Data.OleDb;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;
using uwac;

public partial class Info_MeasureInfo : BasePage
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private DBLookup oDBLookup;

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();

	private string page_state;
	private bool CanEdit;
	private int qs_studyID;
	private string qs_studyname;
	private int studymeasID;
	private int measureID;
	private string measurename;
	private string measurename_nameonly;
	private int[] studies;
	private int _content_studyID;
	private string _content_studyname;

	private int _columncount;
	private string[] _colnames;
	private bool[] _colvisible;
	private bool debugprint = false;

	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);

		//btnShow_MeasInfo.Visible = true;
		//btnHide_MeasInfo.Visible = false;
		//btnEdit_MeasInfo.Visible = false;

		//btnShow_TableInfo.Visible = true;
		//btnHide_TableInfo.Visible = false;
		//btnShowEdit_TableInfo_AddFields.Visible = false;
		//btnHideEdit_TableInfo_AddFields.Visible = false;

		//btnEdit_TableInfo_UpdateFields.Visible = false;



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
		//string groups = oLogin.GetGroups_public();
		//LogToPageUrgent(groups);

		if (oLogin.CheckGroupPermissions("StudyDesign group".Split('|')))
		{
			CanEdit = true;
		}
		else
		{

			CanEdit = true;
		}

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();

		oDBLookup = new DBLookup(oConn);


		GetCurrentDefaultStudyID();

		//TODO: clear the text boxes

		if (_content_studyID > 0)
		{
			Populate_DDL_SelectMeasureID(0);
		}
		else
		{
			Populate_DDL_SelectMeasureID(_content_studyID);
		}

		//TOHANDLE VIEWSTATE
		// Check if the selectedValue has changed.
		string selectedValue = Request[DDL_SelectMeasureID.UniqueID];
		if (selectedValue != MySelectedMeasureID)
		{
			// Value has changed, do whatever you would do in the SelectedIndexChanged event here.
		}
		MySelectedMeasureID = selectedValue;


		// set the set the selectedValue on the drop-down
		if (selectedValue != null)
		{
			DDL_SelectMeasureID.Items.FindByValue(selectedValue).Selected = true;
		}


		if (!IsPostBack)
		{
			Process_QueryString();

			Show_Buttons_By_MeasureID();

			try
			{
				if (Convert.ToInt32(DDL_SelectMeasureID.SelectedValue) > 0)
				{
					//Turned off so that no info is shown when first loaded
					//Show_MeasInfo(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));
				}
			}
			catch (Exception) 
			{
			}
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


		lblINTRO_studyname.Text = "Measures in Study: ";
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

			foreach (DataRow row in dt.Rows)
			{
				measureID = Convert.ToInt16(row["measureID"]);
				measurename = "Data Dictionary for " + Convert.ToString(row["measname"]);
				measurename_nameonly = "Data Dictionary for " + Convert.ToString(row["measname"]);
				qs_studyID = Convert.ToInt16(row["studyID"]);
				qs_studyname = Convert.ToString(row["studyname"]);
			}

			if (_content_studyID != qs_studyID)
			{
				Populate_DDL_SelectMeasureID(qs_studyID);
				lblStudyname_ContentPage.Text = qs_studyname;
			}
			else
			{
				Populate_DDL_SelectMeasureID(0);
			}
			DDL_SelectMeasureID.SelectedIndex = DDL_SelectMeasureID.Items.IndexOf(DDL_SelectMeasureID.Items.FindByValue(measureID.ToString()));

			page_state = "viewing_both";

		}

		else if (Page.Request.QueryString["measureID"] != null)
		{
			measureID = int.Parse(Page.Request.QueryString["measureID"]);

			if (measureID > 0)
			{

				if (_content_studyID > 0)
				{
					Populate_DDL_SelectMeasureID(_content_studyID);
					lblStudyname_ContentPage.Text = _content_studyname;
				}
				else
				{
					Populate_DDL_SelectMeasureID(0);
				}

				//update the selected value of a DDL with this:  final parameter is a string of the value (usually int) of the DDL
				DDL_SelectMeasureID.SelectedIndex = DDL_SelectMeasureID.Items.IndexOf(DDL_SelectMeasureID.Items.FindByValue(measureID.ToString()));

				page_state = "viewing_both";

			}
		}

		//No querystring parameter    
		else
		{
			Populate_DDL_SelectMeasureID(0);
		}

		Show_Buttons_By_MeasureID();

	}



	protected void DDL_SelectMeasureID_SelectedIndexChanged(object sender, EventArgs e)
	{
		hidMeasureID.Value = Convert.ToString(DDL_SelectMeasureID.SelectedValue);
		hidMeasName.Value = Convert.ToString(DDL_SelectMeasureID.SelectedItem);

		Panel_ViewMeasInfo.Visible = false;
		//Panel_ViewMeasInfo.Update();

		Panel_ViewDocs.Visible = false;
		//Panel_ViewDocs.Update();

		Panel_TableInfo.Visible = false;
		//Panel_TableInfo.Update();

		Panel_FieldInfo.Visible = false;


		Show_Buttons_By_MeasureID();
		UpdatePanel_MainControls.Update();

		if (Convert.ToInt32(DDL_SelectMeasureID.SelectedValue) > 0)
		{
			Show_MeasInfo(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));
		}

	}

	protected void Show_Buttons_By_MeasureID()
	{
		if (Convert.ToInt32(DDL_SelectMeasureID.SelectedValue) != -1)
		{

			btnShow_MeasInfo.Visible = true;

			if (Math.Abs(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue)) > 0)
			{
				//Determine what buttons should show based on selected Measure
				string SelectedMeas = DDL_SelectMeasureID.SelectedItem.ToString();

				if (SelectedMeas.Contains("data table needed")) // && CanEdit)
				{
					if (CanEdit) btnCreateTable_Begin.Visible = true;
					btnShow_TableInfo.Visible = false;  // do not show table info as there is none
				}
				else
				{
					btnCreateTable_Begin.Visible = false;
					btnShow_TableInfo.Visible = true;  // do not show table info as there is none

				}



			}
		}
	}

	protected void Process_Page_State(string new_page_state, int measID)
	{
		//LogToPageUrgent("** PPS: " + new_page_state + "  measID = [" + measID.ToString() + "]");

		//do things based on current state
		switch (page_state)
		{
			case "viewing":
				break;
			case "editing_measinfo":
				break;

			case "editing_tableinfo":
				break;

		}

		//transition to the new state
		switch (new_page_state)
		{
			case "viewing_both":
				Show_MeasInfo(measID);
				Show_TableInfo(measID);
				page_state = "viewing_both";
				break;
			case "viewing_measinfo":
				Show_MeasInfo(measID);
				page_state = "viewing_measinfo";
				break;
			case "viewing_tableinfo":
				Show_TableInfo(measID);
				page_state = "viewing_tableinfo";
				break;
			case "hiding_measinfo":
				Hide_MeasInfo();
				page_state = "hiding_measinfo";
				break;
			case "hiding_tableinfo":
				Hide_TableInfo();
				page_state = "hiding_tableinfo";
				break;

			case "editing_measinfo":
				Hide_TableInfo();
				Begin_EditMeasureInfo();
				page_state = "editing_measinfo";

				break;

			case "editing_tableinfo":
				Hide_MeasInfo();
				break;



		}


	}




	protected void Show_Stuff(object sender, CommandEventArgs e)
	{

		Process_Page_State(e.CommandArgument.ToString(), Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));
	}

	protected void Show_MeasInfo(object sender, EventArgs e)
	{
		int measID = Convert.ToInt32(DDL_SelectMeasureID.SelectedValue);
		Show_MeasInfo(measID);

	}

	protected void Show_MeasInfo(int measID)
	{
		//LogToPageUrgent(hidMeasureID.Value.ToString());
		//Populate_GridView_DataDict(measID);

		if (measID != -1)
		{

			Populate_MeasInfo(measID);
			Populate_Docs_Meas(measID);


			btnShow_MeasInfo.Visible = false;
			btnHide_MeasInfo.Visible = true;
			if(CanEdit) btnEdit_MeasInfo.Visible = true;
			else btnEdit_MeasInfo.Visible = false;

			btnEdit_MeasInfo_Submit.Visible = false;
			btnEdit_MeasInfo_Cancel.Visible = false;

			Panel_ViewMeasInfo.Visible = true;
			Panel_ViewDocs.Visible = true;
			Panel_EditMeasInfo.Visible = false;

			//Panel_MeasInfo.Update();
		}
	}

	protected void Hide_MeasInfo(object sender, EventArgs e)
	{
		Hide_MeasInfo();
	}

	protected void Hide_MeasInfo()
	{

		btnShow_MeasInfo.Visible = true;
		btnHide_MeasInfo.Visible = false;
		btnEdit_MeasInfo.Visible = false;

		Panel_ViewMeasInfo.Visible = false;
		Panel_ViewDocs.Visible = false;

	}


	protected void Show_Edit_TableInfo_BatchAddFields(object sender, EventArgs e)
	{
	}
	protected void Hide_Edit_TableInfo_BatchAddFields(object sender, EventArgs e)
	{
	}

	protected void Show_TableInfo(object sender, EventArgs e)
	{

		int measID = Convert.ToInt32(DDL_SelectMeasureID.SelectedValue);
		Show_TableInfo(measID);
	}

	protected void Show_TableInfo(int measID)
	{
		//LogToPageUrgent(hidMeasureID.Value.ToString());

		if (measID != -100000)
		{
			Populate_GridView_DataDict(measID);
			//Populate_TableInfo(measID);

			btnShow_TableInfo.Visible = false;
			btnHide_TableInfo.Visible = true;


			if (CanEdit)
			{
				btnBatchEdit_TableInfo.Visible = true;
				txt_ValueSet_ToEdit.Visible = true;
				btn_editValueSet.Visible = true;
			}
			else
			{
				btnBatchEdit_TableInfo.Visible = false;
				txt_ValueSet_ToEdit.Visible = false;
				btn_editValueSet.Visible = false;
			}

			//btnShowEdit_TableInfo_AddFields.Visible = true;
			//btnHideEdit_TableInfo_AddFields.Visible = true;
			//btnEdit_TableInfo_UpdateFields.Visible = true;

			Panel_TableInfo.Visible = true;

			Panel_FieldInfo.Visible = true;
			//Panel_TableInfo.Update();
		}
	}

	protected void Hide_TableInfo(object sender, EventArgs e)
	{
		Hide_TableInfo();
	}
	protected void Hide_TableInfo()
	{
		btnShow_TableInfo.Visible = true;
		btnHide_TableInfo.Visible = false;

		//btnShowEdit_TableInfo_AddFields.Visible = false;
		//btnHideEdit_TableInfo_AddFields.Visible = false;
		//btnEdit_TableInfo_UpdateFields.Visible = false;

		Panel_TableInfo.Visible = false;
		Panel_FieldInfo.Visible = false;
		//Panel_TableInfo.Update();
	}



	protected void ValueSet_RowCommand(object sender, CommandEventArgs e)
	{

		switch (e.CommandName)
		{
			case "EditValueSetItem":
				string[] args = e.CommandArgument.ToString().Split('|');
				hid_valueset_edittype.Value = "update";
				hidpk.Value = args[0];
				txt_Insert_NewValue.Text = args[1];
				txt_Insert_NewValueLabel.Text = args[2];

				btnEdit_ValueSet_InsertNew.Visible = false;
				Panel_ValueSet_Edits.Visible = true;

				break;
		}


	}


	protected void EditValueSet(object sender, EventArgs e)
	{
		if (!String.IsNullOrEmpty(txt_ValueSet_ToEdit.Text))
		{
			string valuesetID = txt_ValueSet_ToEdit.Text;
			lbl_fvsID_main.Text = valuesetID;

			btnEdit_ValueSet_InsertNew.Visible = true;
			Panel_ValueSet_Edits.Visible = false;


			Load_ValueSet(valuesetID);

			txt_ValueSet_ToEdit.Text = "";

		}


	}



	protected void CreateTableFromMetaData(object sender, EventArgs e)
	{
		//SqlDataSource sql_ValueSet = (SqlDataSource)FindControlRecursive(this.Page, "sql_ValueSet");
		//SqlDataSourceView vw = sql_ValueSet.SqlDataSourceView;

		//vw.SelectParmeters("@fvsID").DefaultValue = fieldvaluesetID;

		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConnData;
		cmd.CommandText = "spDEF_Create_Table_from_MetaData ";
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.Parameters.Add("@tablename", SqlDbType.VarChar);

		cmd.Parameters["@tablename"].Direction = ParameterDirection.Input;
		
		cmd.Parameters["@tablename"].Value = lbl_TableName.Text;
		
		if (oConnData.State == ConnectionState.Closed) oConnData.Open();

		cmd.ExecuteNonQuery();

		Populate_GridView_DataDict(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));

	}


		protected void Copy_FieldLabels_to_ASPXLabels(object sender, EventArgs e)
	{

		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConnData;
		cmd.CommandText = "spDEF_Copy_FieldLabels_to_ASPXLabels_that_are_NULL";
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.Parameters.Add("@tblname", SqlDbType.VarChar, 200);
		cmd.Parameters.Add("@n", SqlDbType.VarChar, 200);
		
		cmd.Parameters["@tblname"].Direction = ParameterDirection.Input;
		cmd.Parameters["@n"].Direction = ParameterDirection.Output;

		cmd.Parameters["@tblname"].Value = lbl_TableName.Text;

		if (oConnData.State == ConnectionState.Closed) oConnData.Open();

		cmd.ExecuteNonQuery();

		string n = (string)cmd.Parameters["@n"].Value;

		lblBatchInfo.Text += n + "<br/>";

		Populate_GridView_DataDict(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));
	}


	protected void CreateNewValueSet(object sender, EventArgs e)
	{
		//SqlDataSource sql_ValueSet = (SqlDataSource)FindControlRecursive(this.Page, "sql_ValueSet");
		//SqlDataSourceView vw = sql_ValueSet.SqlDataSourceView;

		//vw.SelectParmeters("@fvsID").DefaultValue = fieldvaluesetID;

		

		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConnData;
		cmd.CommandText = "spDEF_CreateNewValueSet";
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.Parameters.Add("@tblname", SqlDbType.VarChar, 200);
		cmd.Parameters.Add("@setname", SqlDbType.VarChar, 2000);
		cmd.Parameters.Add("@mode", SqlDbType.VarChar, 50);
		cmd.Parameters.Add("@valset", SqlDbType.VarChar, 300);
		

		cmd.Parameters["@tblname"].Direction = ParameterDirection.Input;
		cmd.Parameters["@setname"].Direction = ParameterDirection.Input;
		cmd.Parameters["@mode"].Direction = ParameterDirection.Input;
		cmd.Parameters["@valset"].Direction = ParameterDirection.Output;

		cmd.Parameters["@tblname"].Value = lbl_TableName.Text;
		cmd.Parameters["@setname"].Value = txt_ValueSet_ToAdd.Text;
		cmd.Parameters["@mode"].Value = ddl_ValueSetMode.SelectedValue;
		//cmd.Parameters["@valset"].Value = "";

		if (oConnData.State == ConnectionState.Closed) oConnData.Open();

		cmd.ExecuteNonQuery();

		string newvalset = (string)cmd.Parameters["@valset"].Value;

		lblnewValueSets.Text += newvalset + "<br/>";
	}

	protected void Load_ValueSet(string fieldvaluesetID)
	{
		//SqlDataSource sql_ValueSet = (SqlDataSource)FindControlRecursive(this.Page, "sql_ValueSet");
		//SqlDataSourceView vw = sql_ValueSet.SqlDataSourceView;

		//vw.SelectParmeters("@fvsID").DefaultValue = fieldvaluesetID;

		gv_ValueSet.DataBind();
		txt_Insert_NewValue.Text = "";
		txt_Insert_NewValueLabel.Text = "";
		Panel_ValueSet.Visible = true;

	}

	protected void Edit_ValueSet_Cancel(object sender, EventArgs e)
	{
		hid_valueset_edittype.Value = "";
		hidpk.Value = "";
		txt_Insert_NewValue.Text = "";
		txt_Insert_NewValueLabel.Text = "";
		Panel_ValueSet.Visible = false;

		Show_TableInfo(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));
		//gv_FieldInfo.DataBind();


	}



	protected void Edit_ValueSet_Submit(object sender, EventArgs e)
	{
		if (hid_valueset_edittype.Value == "update")
		{
			string cmd_text = "update DatFieldValueSetItem set FieldValue=@FieldValue, FieldValueLabel=@FieldValueLabel where pk = @pk";
			SqlCommand cmd = new SqlCommand(cmd_text, oConnData);
			cmd.CommandType = CommandType.Text;
			cmd.Parameters.Add("@pk", SqlDbType.Int);
			cmd.Parameters.Add("@FieldValue", SqlDbType.Int);
			cmd.Parameters.Add("@FieldValueLabel", SqlDbType.VarChar);

			cmd.Parameters["@pk"].Value = Convert.ToInt32(hidpk.Value);
			cmd.Parameters["@FieldValue"].Value = Convert.ToInt32(txt_Insert_NewValue.Text);
			cmd.Parameters["@FieldValueLabel"].Value = txt_Insert_NewValueLabel.Text;

			try
			{
				if (oConnData.State == ConnectionState.Closed) oConnData.Open();
				cmd.ExecuteNonQuery();

				gv_ValueSet.DataBind();

				btnEdit_ValueSet_InsertNew.Visible = true;
				Panel_ValueSet_Edits.Visible = false;
			}
			catch (SqlException exc)
			{
				LogToPageError(exc.Message);
			}
		}

		if (hid_valueset_edittype.Value == "insertnew")
		{
			string cmd_text = "Insert into DatFieldValueSetItem (FieldValueSetID, FieldValue, FieldValueLabel) values (@FieldValueSetID, @FieldValue, @FieldValueLabel)";
			SqlCommand cmd = new SqlCommand(cmd_text, oConnData);
			cmd.CommandType = CommandType.Text;
			cmd.Parameters.Add("@FieldValueSetID", SqlDbType.Int);
			cmd.Parameters.Add("@FieldValue", SqlDbType.Int);
			cmd.Parameters.Add("@FieldValueLabel", SqlDbType.VarChar);

			cmd.Parameters["@FieldValueSetID"].Value = Convert.ToInt32(lbl_fvsID_main.Text);
			cmd.Parameters["@FieldValue"].Value = Convert.ToInt32(txt_Insert_NewValue.Text);
			cmd.Parameters["@FieldValueLabel"].Value = txt_Insert_NewValueLabel.Text;

			try
			{
				if (oConnData.State == ConnectionState.Closed) oConnData.Open();
				cmd.ExecuteNonQuery();

				gv_ValueSet.DataBind();

				btnEdit_ValueSet_InsertNew.Visible = true;
				Panel_ValueSet_Edits.Visible = false;

			}
			catch (SqlException exc)
			{
				LogToPageError(exc.Message);
			}
		}


	}




	protected void Edit_ValueSet_InsertNew(object sender, EventArgs e)
	{
		hid_valueset_edittype.Value = "insertnew";
		Panel_ValueSet_Edits.Visible = true;

		btnEdit_ValueSet_InsertNew.Visible = false;
	}



	protected void Populate_DDL_SelectMeasureID(int manual_studyID)
	{

		string sqlCmd2_text;

		CheckBox chk = (CheckBox)FindControlRecursive(this.Page, "chkAllMeas");

		if (manual_studyID > 0)
		{
			sqlCmd2_text = "exec spStudyMeas_by_StudyID__for_DataDict " + manual_studyID.ToString();
		}
		else
		{
			sqlCmd2_text = "exec spStudyMeas_by_DefaultStudyID__for_DataDict";
		}

		SQL_utils sql = new SQL_utils("backend");
		DataTable dt2 = sql.DataTable_from_SQLstring(sqlCmd2_text);


		//SqlCommand sqlCmd2 = new System.Data.SqlClient.SqlCommand(sqlCmd2_text, oConn);
		//sqlCmd2.CommandTimeout = 90;
		//SqlDataReader sqlReader2 = sqlCmd2.ExecuteReader();
		//DataTable dt2 = new DataTable();
		//dt2.Load(sqlReader2);

		DDL_SelectMeasureID.DataSource = dt2;
		DDL_SelectMeasureID.DataBind();

		//sqlReader2.Close();
		//update the studyname labels

		sql.Close();

	}


	//protected void Load_gv_FieldInfo()
	//{
	//    Load_gv_FieldInfo(hidTblName.Value);
	//}

	//protected void Load_gv_FieldInfo(string tblname)
	//{
	//    Label lblCurrentTable = (Label)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "lblCurrentTable");

	//    //Get the tableID
	//    SqlCommand cmd1 = new SqlCommand();
	//    cmd1.CommandType = CommandType.Text;
	//    cmd1.CommandText = "select tableID from dattable where name = '" + tblname + "' ";
	//    if (oConnData.State == ConnectionState.Closed) oConnData.Open();
	//    cmd1.Connection = oConnData;
	//    try
	//    {
	//        int tableID = (int)cmd1.ExecuteScalar();

	//        lblCurrentTable.Text = tblname + " (tableID=" + tableID.ToString() + ")";

	//        hidTblName.Value = tblname;
	//        GridView gv_FieldInfo = (GridView)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "gv_FieldInfo");

	//        SqlCommand cmd = new SqlCommand();
	//        cmd.CommandType = CommandType.Text;
	//        cmd.CommandText = "select ord_pos pos, databasefield as fldName, FieldDataType as dataType, FieldDataTypeLength as length, MinVal Min, MaxVal Max, ValidList VldLst, MissVal, FieldValueSetID fvsID, " +
	//            " InAnalysis, fieldLabel as Label , ASPXFieldLabelText [DE Form Label], RelItem, RelScore, RelAgreeThreshold " + 
	//            " from dat Fieldinfo where databasetable = '" + tblname + "' order by ord_pos";
	//        if (oConnData.State == ConnectionState.Closed) oConnData.Open();
	//        cmd.Connection = oConnData;
	//        SqlDataReader rdr = cmd.ExecuteReader();
	//        DataTable dt_FieldInfo = new DataTable();
	//        dt_FieldInfo.Load(rdr);
	//        gv_FieldInfo.DataSource = dt_FieldInfo;

	//        //Persist the table in the Session object.
	//        Session["dt_FieldInfo"] = dt_FieldInfo; 

	//        gv_FieldInfo_Bind();

	//        if (dt_FieldInfo.Rows.Count > 0)
	//        {
	//            PlaceHolder_NewTableInfo.Visible = false;
	//        }

	//    }
	//    catch(Exception exc) {
	//        lblCurrentTable.Text = "Table not found.";
	//    }
	//}

	//protected void Lookup_Table_InProgress(object sender, EventArgs e)
	//{
	//    TextBox txtTblName = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTblName");

	//    if (txtTblName.Text != "ALL_")
	//    {
	//        Load_gv_FieldInfo(txtTblName.Text);

	//        gv_FieldInfo.Visible = true;
	//        Panel_InsertField_Controls.Visible = true;
	//        Panel_UpdateField_Controls.Visible = true;
	//        Panel_FieldDelete_TableCreate_Controls.Visible = true;

	//    }
	//}


	#region  ##### Create new Measure #####
	protected void CreateNewMeasure_Begin(object sender, EventArgs e)
	{
		UpdatePanel_CreateNewMeasure.Visible = true;
	}


	protected void CreateNewMeasure_submit(object sender, EventArgs e)
	{
		
		//try
		//{
			////BLANK SqlCommand
			SqlCommand sqlCmd = new SqlCommand();
			sqlCmd.Connection = oConn;
			sqlCmd.CommandType = CommandType.StoredProcedure;
			sqlCmd.CommandText = "spStudyDesign__CreateNewMeasure";

			TextBox txtCNM_Name = (TextBox)FindControlRecursive(UpdatePanel_CreateNewMeasure, "txtCNM_Name");
			TextBox txtCNM_NameFull = (TextBox)FindControlRecursive(UpdatePanel_CreateNewMeasure, "txtCNM_NameFull");
		
			sqlCmd.Parameters.Add("@measname", SqlDbType.VarChar, 50);
			sqlCmd.Parameters["@measname"].Value = txtCNM_Name.Text;

			sqlCmd.Parameters.Add("@measfullname", SqlDbType.VarChar, 200);
			sqlCmd.Parameters["@measfullname"].Value = txtCNM_NameFull.Text;

		

			sqlCmd.Parameters.Add("@newmeasureID", SqlDbType.Int, 4);
			sqlCmd.Parameters["@newmeasureID"].Value = 0;
			sqlCmd.Parameters["@newmeasureID"].Direction = ParameterDirection.Output;



			sqlCmd.ExecuteNonQuery();

			int newmeasID = (int)sqlCmd.Parameters["@newmeasureID"].Value;

			
			if (newmeasID > 0)
			{
				DDL_SelectMeasureID.DataBind();

				//LogToPageUrgent("numitems = " + DDL_SelectMeasureID.Items.Count.ToString());

				//DDL_SelectMeasureID.Items.FindByValue(newmeasID.ToString()).Selected = true;
				//DDL_SelectMeasureID.SelectedIndex = DDL_SelectMeasureID.Items.IndexOf(DDL_SelectMeasureID.Items.FindByValue(newmeasID.ToString()));


				Show_MeasInfo(newmeasID);
			}

			UpdatePanel_CreateNewMeasure.Visible = false;
		//}
		//catch (Exception) 
		//{
		//    LogToPageError(exc.Message);
		//}

	}
	#endregion



	#region ========= Get Table Info =========

	protected void Populate_GridView_DataDict(int measID)
	{
		//SQL_utils sql = new SQL_utils();

		//DataTable dt = sql.DataTable_from_SQLstring("select * from def.vwFld where measureID = '" + measID.ToString() +"' order by ord_pos");

		//Grid_DataDict.DataSource = dt;
		//Grid_DataDict.DataBind();



	}

	protected void Populate_GridView_DataDict(int measID, int old_one)
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "<br/>---> Populate_GridView_DataDict <br/>";


		if (Math.Abs(measID) > 0)  //only those with a table
		{

			//table info

			try
			{
				SQL_utils sql = new SQL_utils("backend");
				string cmdtext = String.Format("exec spDEF_TableInfo_by_measureID {0}", measID);
				DataTable dtti = sql.DataTable_from_SQLstring(cmdtext);

				//SqlCommand cmdti = new SqlCommand("exec spDEF_TableInfo_by_measureID " + measID.ToString(),  oConn);
				//cmdti.CommandTimeout = 90;
				//SqlDataReader rti = cmdti.ExecuteReader();
				//DataTable dtti = new DataTable();
				//dtti.Load(rti);

				DataRow row = dtti.Rows[0];

				string n = "";

				if (String.IsNullOrEmpty(row["N_Fields"].ToString()))
				{
					n = "TABLE NOT YET CREATED!!";
					lbl_N_Fields.ForeColor = Color.Red;

					btn_CreateTableFromMetaData.Visible = true;
				}
				else
				{
					n = row["N_Fields"].ToString();
					lbl_N_Fields.ForeColor = Color.Black;

					btn_CreateTableFromMetaData.Visible = false;

				}

				//TOFIX
				if (Convert.ToInt32(row["N_flds_not_in_datFieldInfo"]) > 0)
				{
					btnInsertIntoFieldInfo.Visible = true;
					btnInsertIntoFieldInfo.Text = "Insert into Meta Data (n=" + row["N_flds_not_in_datFieldInfo"].ToString() + ")" ;
				}
				else
				{
					btnInsertIntoFieldInfo.Visible = false;
				}


				lbl_tableID.Text = row["tableID"].ToString();
				lbl_TableName.Text = row["TableName"].ToString();
				lbl_N_Fields.Text = n;

				link_ScoringProc.Text = row["spName"].ToString();
				link_ScoringProc.NavigateUrl = row["spLink"].ToString();

			}
			catch (Exception exc) 
			{
				LogToPageError(exc.Message + "............." + exc.StackTrace);
			}


			//field info
			try
			{
				string mycmd = "exec spDataDict_by_measureID " + measID.ToString();
				//LogToPageUrgent("...Populate_GridView_DataDict: " + mycmd + "<br/>");


				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "=Pop GridView=" + mycmd + ".<br/>";



				SqlCommand sqlCmd3 = new System.Data.SqlClient.SqlCommand(mycmd, oConn);
				sqlCmd3.CommandTimeout = 120; 
				SqlDataReader sqlReader3 = sqlCmd3.ExecuteReader();

				//Get the Columnnames 
				_columncount = sqlReader3.FieldCount;
				_colnames = new string[_columncount];
				_colvisible = new bool[_columncount];

				DataTable dt_FieldInfo = new DataTable();
				dt_FieldInfo.Load(sqlReader3);

				gv_FieldInfo.DataSource = dt_FieldInfo;
				
				if(CanEdit) gv_FieldInfo.AutoGenerateEditButton = true;
				else gv_FieldInfo.AutoGenerateEditButton = false; 

				for (int k = 0; k < _columncount; k++)
				{
					_colnames[k] = dt_FieldInfo.Columns[k].ColumnName;
				}

				//Persist the table in the Session object.
				Session["dt_FieldInfo"] = dt_FieldInfo;

				gv_FieldInfo_Bind();

				gv_FieldInfo.Visible = true;

				sqlReader3.Close();

				//Panel_FieldInfo.Controls.Add(gv);



				#region Loop through columns
				//TemplateField tf = null;

				//for (int c = 0; c < _columncount; c++)
				//{
				//    _colnames[c] = dt3.Columns[c].ColumnName;
				//    tf = new TemplateField();
				//    LogToPage("now at c=" + c.ToString() + "   _colnames[c] = {" + _colnames[c] + "}");

				//    try
				//    {
				//        //tf.HeaderTemplate = new DynamicGridViewTextTemplate_with_EDIT(_colnames[c], ListItemType.Header);
				//        //tf.ItemTemplate = new DynamicGridViewTextTemplate_with_EDIT(_colnames[c], ListItemType.Item);
				//        //tf.EditItemTemplate = new DynamicGridViewTextBoxTemplate_with_EDIT(_colnames[c], ListItemType.EditItem);


				//        tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.Header);
				//        tf.ItemTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.DataRow);
				//        tf.EditItemTemplate = new DynamicGridViewTextBoxTemplate(_colnames[c], DataControlRowType.DataRow);
				//        _colvisible[c] = true;
				//        tf.Visible = _colvisible[c];
				//        //footer
				//        gv.Columns.Add(tf);

				//        if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> GV ColCount: " + gv.Columns.Count.ToString() + " <br/>";
				//    }

				//    catch (Exception err)
				//    {
				//        if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 0 <br/>";

				//        LogToPageUrgent(err.Message + ".........." + err.StackTrace);
				//    }
				//}
				#endregion

			}

			catch (Exception err)
			{
				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 3 <br/>";

				LogToPageUrgent(err.Message + ".........." + err.StackTrace);

				//foreach (SqlError oErr in err.Errors)
				//{
				//    tblmyinfo.Rows[0].Cells[0].InnerHtml += oErr.Message;
				//}
			}
		}

		else
		{
			LogToPageUrgent("No measID passed into Populate_GridView_DataDict()");
		}

	}

	#endregion


	#region *************** Edit Table Info ***************

	#region **** Buttons ****

	protected void InsertIntoFieldInfo(object sender, EventArgs e)
	{
		//TOFIX
		SqlCommand cmd = new SqlCommand();
		cmd.CommandText = "spDEF__Insert_into_datFieldInfo_from_SQLtable";
		cmd.CommandType = CommandType.StoredProcedure;

		if (oConnData.State == ConnectionState.Closed) oConnData.Open();
		cmd.Connection = oConnData;
		cmd.Parameters.Add("@tbl", SqlDbType.VarChar);
		cmd.Parameters["@tbl"].Value = lbl_TableName.Text;
		try
		{
			cmd.ExecuteNonQuery();
		}
		catch (SqlException sqlexc)
		{
			lblNewTableInfo.Text = sqlexc.Message;
		}

		//Update in the new meta data
		SQL_utils sql = new SQL_utils("data");
		sql.NonQuery_from_SQLstring("exec def.spUTIL_insert_into_Fld_from_sqltable  '" + lbl_TableName.Text + "', 0");
		sql.Close();


	}

	

	protected void Edit_TableInfo_AddFields(object sender, EventArgs e)
	{
	}


	protected void Edit_TableInfo_BatchUpdateFields(object sender, EventArgs e)
	{
	}


	protected void Submit_EditTableInfo(object sender, EventArgs e)
	{
	}


	protected void Cancel_EditTableInfo(object sender, EventArgs e)
	{
	}




	protected void BatchEditFields_Cancel(object sender, EventArgs e)
	{
		Panel_BatchEditFields.Visible = false;

		//Show_Buttons_By_MeasureID();

		btnHide_TableInfo.Visible = true;
		btnBatchEdit_TableInfo.Visible = true;

		lblCurrentTable.Text = "";
		hidTblName.Value = "";

	}


	protected void InsertTableInfo_Cancel(object sender, EventArgs e)
	{
		Panel_NewTable.Visible = false;
	}


	protected void InsertTableInfo_Submit(object sender, EventArgs e)
	{
		//HiddenField hidTblName = (HiddenField)FindControlRecursive(Panel_NewTable.ContentTemplateContainer, "hidTblName");
		TextBox txtTblName = (TextBox)FindControlRecursive(Panel_NewTable.ContentTemplateContainer, "txtTblName");
		TextBox txtTblAbbr = (TextBox)FindControlRecursive(Panel_NewTable.ContentTemplateContainer, "txtTblAbbr");

		if (txtTblName.Text == "" || txtTblAbbr.Text == "")
		{
			lblNewTableInfo.Text = "Enter values for both table name and abbreviation.";
		}
		else
		{
			InsertTableInfo_Submit("ALL_" + txtTblName.Text, txtTblAbbr.Text);
		}


	}

	protected void InsertTableInfo_Submit(string tblname, string tblabbr)
	{
		try
		{

			SqlCommand cmd = new SqlCommand();
			cmd.CommandText = "spDEF_Insert_new_DataTableInfo";
			cmd.CommandType = CommandType.StoredProcedure;

			if (oConnData.State == ConnectionState.Closed) oConnData.Open();
			cmd.Connection = oConnData;
			cmd.Parameters.Add("@tbl", SqlDbType.VarChar);
			cmd.Parameters.Add("@abbr", SqlDbType.VarChar);

			cmd.Parameters["@tbl"].Value = "ALL_" + txtTblName.Text;
			cmd.Parameters["@abbr"].Value = txtTblAbbr.Text;

			cmd.Parameters.Add("@measureID", SqlDbType.Int);
			cmd.Parameters["@measureID"].Value = Math.Abs(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));

			try
			{
				cmd.ExecuteNonQuery();

				//Load_gv_FieldInfo(txtTblName.Text);
			}
			catch (SqlException sqlexc)
			{
				lblNewTableInfo.Text = sqlexc.Message;
			}

			hidTblName.Value = txtTblName.Text;


		}
		catch (Exception exc) 
		{
			LogToPageError(exc.Message + "<br/>" + exc.StackTrace);
		}


		Populate_DDL_SelectMeasureID(_content_studyID);
	}



	protected void CreateNewTable_Begin(object sender, EventArgs e)
	{
		btnShow_MeasInfo.Visible = false;
		btnShow_TableInfo.Visible = false;


		Panel_NewTable.Visible = true;
		Panel_BatchEditFields.Visible = false;
		btnCreateTable_Begin.Visible = false;

		if (hidTblName.Value != "")
		{
			//Load_gv_FieldInfo();
		}
		else
		{
			lblNewTableInfo.Text = "";
		}
	}


	#endregion

	#region **** Batch Editing ****


	protected void Begin_BatchEditTableInfo(object sender, EventArgs e)
	{
		Hide_MeasInfo();
		Panel_BatchEditFields.Visible = true;

		btnHide_TableInfo.Visible = false;
		btnBatchEdit_TableInfo.Visible = false;

	}


	protected void UpdateField(GridViewRow row)
	{
		try
		{
			Label lbl_TableName = (Label)Panel_TableInfo.FindControl("lbl_TableName");
			

			Label lblitm_pk = (Label)FindControlRecursive(row, "lblitm_pk");
			TextBox txtitm_pos = (TextBox)FindControlRecursive(row, "txtitm_pos");
			TextBox txtitm_fldName = (TextBox)FindControlRecursive(row, "txtitm_fldName");
			DropDownList ddlitm_dataType = (DropDownList)FindControlRecursive(row, "ddlitm_dataType");
			TextBox txtitm_DatatypeLength = (TextBox)FindControlRecursive(row, "txtitm_DatatypeLength");
			TextBox txtitm_Label = (TextBox)FindControlRecursive(row, "txtitm_Label");
			TextBox txtitm_DE_Form_Label = (TextBox)FindControlRecursive(row, "txtitm_DE_Form_Label");
			TextBox txtitm_MinVal = (TextBox)FindControlRecursive(row, "txtitm_MinVal");
			TextBox txtitm_MaxVal = (TextBox)FindControlRecursive(row, "txtitm_MaxVal");
			TextBox txtitm_ValdLst = (TextBox)FindControlRecursive(row, "txtitm_ValdLst");
			TextBox txtitm_RegEx = (TextBox)FindControlRecursive(row, "txtitm_RegEx");
			TextBox txtitm_RegExDesc = (TextBox)FindControlRecursive(row, "txtitm_RegExDesc");
			TextBox txtitm_MissVal = (TextBox)FindControlRecursive(row, "txtitm_MissVal");
			TextBox txtitm_fvsID = (TextBox)FindControlRecursive(row, "txtitm_fvsID");
			TextBox txtitm_InAnalysis = (TextBox)FindControlRecursive(row, "txtitm_InAnalysis");
			TextBox txtitm_RelItem = (TextBox)FindControlRecursive(row, "txtitm_RelItem");
			TextBox txtitm_RelScore = (TextBox)FindControlRecursive(row, "txtitm_RelScore");
			TextBox txtitm_RelAgreeThreshold = (TextBox)FindControlRecursive(row, "txtitm_RelAgreeThreshold");

			DropDownList ddlitm_FieldCodeID = (DropDownList)FindControlRecursive(row, "ddlitm_FieldCodeID");


			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "spDEF_UpdateField";
			cmd.Connection = oConnData;
			if (oConnData.State == ConnectionState.Closed) oConnData.Open();


			cmd.Parameters.Add("@fieldinfo_pk", SqlDbType.Int);
			cmd.Parameters.Add("@tblname", SqlDbType.VarChar);
			cmd.Parameters.Add("@ord_pos", SqlDbType.Float);
			cmd.Parameters.Add("@DatabaseField", SqlDbType.VarChar);
			cmd.Parameters.Add("@FieldDataType", SqlDbType.VarChar);
			cmd.Parameters.Add("@FieldDataTypeLength", SqlDbType.Int);
			cmd.Parameters.Add("@MinVal", SqlDbType.Int);
			cmd.Parameters.Add("@MaxVal", SqlDbType.Int);
			cmd.Parameters.Add("@ValidList", SqlDbType.VarChar);
			cmd.Parameters.Add("@RegEx", SqlDbType.VarChar);
			cmd.Parameters.Add("@RegExDescription", SqlDbType.VarChar);
			cmd.Parameters.Add("@MissVal", SqlDbType.VarChar);
			cmd.Parameters.Add("@FieldValueSetID", SqlDbType.Int);
			cmd.Parameters.Add("@FieldLabel", SqlDbType.VarChar);
			cmd.Parameters.Add("@ASPXFieldLabelText", SqlDbType.VarChar);
			cmd.Parameters.Add("@InAnalysis", SqlDbType.Int);
			//            cmd.Parameters.Add("@ValueRequired", SqlDbType.VarChar);
			//            cmd.Parameters.Add("@DoubleEntryRequired", SqlDbType.VarChar);
			cmd.Parameters.Add("@RelItem", SqlDbType.Int);
			cmd.Parameters.Add("@RelScore", SqlDbType.Int);
			cmd.Parameters.Add("@RelAgreeThreshold", SqlDbType.Float);

			cmd.Parameters.Add("@fieldcodeID", SqlDbType.Int);


			//Ints
			if (String.IsNullOrEmpty(lblitm_pk.Text)) { cmd.Parameters["@fieldinfo_pk"].Value = -98765; } else { cmd.Parameters["@fieldinfo_pk"].Value = Convert.ToInt32(lblitm_pk.Text); }
			if (String.IsNullOrEmpty(txtitm_pos.Text)) { cmd.Parameters["@ord_pos"].Value = -98765; } else { cmd.Parameters["@ord_pos"].Value = Convert.ToInt32(txtitm_pos.Text); }
			if (String.IsNullOrEmpty(txtitm_DatatypeLength.Text)) { cmd.Parameters["@FieldDataTypeLength"].Value = -98765; } else { cmd.Parameters["@FieldDataTypeLength"].Value = Convert.ToInt32(txtitm_DatatypeLength.Text); }
			if (String.IsNullOrEmpty(txtitm_MinVal.Text)) { cmd.Parameters["@MinVal"].Value = -98765; } else { cmd.Parameters["@MinVal"].Value = Convert.ToInt32(txtitm_MinVal.Text); }
			if (String.IsNullOrEmpty(txtitm_MaxVal.Text)) { cmd.Parameters["@MaxVal"].Value = -98765; } else { cmd.Parameters["@MaxVal"].Value = Convert.ToInt32(txtitm_MaxVal.Text); }
			if (String.IsNullOrEmpty(txtitm_fvsID.Text)) { cmd.Parameters["@FieldValueSetID"].Value = -98765; } else { cmd.Parameters["@FieldValueSetID"].Value = Convert.ToInt32(txtitm_fvsID.Text); }
			if (String.IsNullOrEmpty(txtitm_InAnalysis.Text)) { cmd.Parameters["@InAnalysis"].Value = -98765; } else { cmd.Parameters["@InAnalysis"].Value = Convert.ToInt32(txtitm_InAnalysis.Text); }
			if (String.IsNullOrEmpty(txtitm_RelItem.Text)) { cmd.Parameters["@RelItem"].Value = -98765; } else { cmd.Parameters["@RelItem"].Value = Convert.ToInt32(txtitm_RelItem.Text); }
			if (String.IsNullOrEmpty(txtitm_RelScore.Text)) { cmd.Parameters["@RelScore"].Value = -98765; } else { cmd.Parameters["@RelScore"].Value = Convert.ToInt32(txtitm_RelScore.Text); }
			if (String.IsNullOrEmpty(txtitm_RelAgreeThreshold.Text)) { cmd.Parameters["@RelAgreeThreshold"].Value = -98765; } else { cmd.Parameters["@RelAgreeThreshold"].Value = Convert.ToDouble(txtitm_RelAgreeThreshold.Text); }
			if (String.IsNullOrEmpty(ddlitm_FieldCodeID.SelectedValue)) { cmd.Parameters["@fieldcodeID"].Value = -98765; } else { cmd.Parameters["@fieldcodeID"].Value = Convert.ToDouble(ddlitm_FieldCodeID.SelectedValue); }

			//Strings      
			if (String.IsNullOrEmpty(lbl_TableName.Text)) { cmd.Parameters["@tblname"].Value = DBNull.Value; } else { cmd.Parameters["@tblname"].Value = (lbl_TableName.Text); }
			if (String.IsNullOrEmpty(txtitm_fldName.Text)) { cmd.Parameters["@DatabaseField"].Value = DBNull.Value; } else { cmd.Parameters["@DatabaseField"].Value = (txtitm_fldName.Text); }
			if (String.IsNullOrEmpty(ddlitm_dataType.Text)) { cmd.Parameters["@FieldDataType"].Value = DBNull.Value; } else { cmd.Parameters["@FieldDataType"].Value = (ddlitm_dataType.SelectedValue); }
			if (String.IsNullOrEmpty(txtitm_ValdLst.Text)) { cmd.Parameters["@ValidList"].Value = DBNull.Value; } else { cmd.Parameters["@ValidList"].Value = (txtitm_ValdLst.Text); }
			if (String.IsNullOrEmpty(txtitm_RegEx.Text)) { cmd.Parameters["@RegEx"].Value = DBNull.Value; } else { cmd.Parameters["@RegEx"].Value = (txtitm_RegEx.Text); }
			if (String.IsNullOrEmpty(txtitm_RegExDesc.Text)) { cmd.Parameters["@RegExDescription"].Value = DBNull.Value; } else { cmd.Parameters["@RegExDescription"].Value = (txtitm_RegExDesc.Text); }
			if (String.IsNullOrEmpty(txtitm_MissVal.Text)) { cmd.Parameters["@MissVal"].Value = DBNull.Value; } else { cmd.Parameters["@MissVal"].Value = (txtitm_MissVal.Text); }
			if (String.IsNullOrEmpty(txtitm_Label.Text)) { cmd.Parameters["@FieldLabel"].Value = DBNull.Value; } else { cmd.Parameters["@FieldLabel"].Value = (txtitm_Label.Text); }
			if (String.IsNullOrEmpty(txtitm_DE_Form_Label.Text)) { cmd.Parameters["@ASPXFieldLabelText"].Value = DBNull.Value; } else { cmd.Parameters["@ASPXFieldLabelText"].Value = (txtitm_DE_Form_Label.Text); }


			cmd.ExecuteNonQuery();


		}
		catch (SqlException exc)
		{
			LogToPageError(exc.Message + "...." + exc.StackTrace);
		}


	}


	protected void BatchAddFields(object sender, EventArgs e)
	{
		try
		{
			DropDownList ddlDataType = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlDataType");

			if (ddlDataType.SelectedValue == "NULL")
			{
				lblBatchInfo.Text = "Select a DataType for these fields.";
				lblBatchInfo.ForeColor = Color.Red;
			}
			else
			{

				TextBox txtDataTypeLength = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtDataTypeLength");
				TextBox txtMain = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtMain");
				TextBox txtText1 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText1");
				TextBox txtText2 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText2");
				TextBox txtText3 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText3");
				TextBox txtText4 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText4");
				TextBox txtText5 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText5");
				TextBox txtFrom1 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom1");
				TextBox txtTo1 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo1");
				TextBox txtFrom2 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom2");
				TextBox txtTo2 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo2");
				TextBox txtFrom3 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom3");
				TextBox txtTo3 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo3");

				TextBox txtFrom4 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom4");
				TextBox txtTo4 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo4");
				TextBox txtFrom5 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom5");
				TextBox txtTo5 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo5");
				TextBox txtInsertAtPos = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtInsertAtPos");


				DropDownList ddlIncrementType1 = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType1");
				DropDownList ddlIncrementType2 = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType2");
				DropDownList ddlIncrementType3 = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType3");
				DropDownList ddlIncrementType4 = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType4");
				DropDownList ddlIncrementType5 = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType5");

				string csv1 = txtText1.Text;
				string csv2 = txtText2.Text;
				string csv3 = txtText3.Text;
				string csv4 = txtText4.Text;
				string csv5 = txtText5.Text;

				SqlCommand cmd = new SqlCommand();
				cmd.CommandText = "spDEF_InsertFields";
				cmd.CommandType = CommandType.StoredProcedure;
				if (oConnData.State == ConnectionState.Closed) oConnData.Open();
				cmd.Connection = oConnData;

				//(@tbl varchar(200), @datatype varchar(50), @csv varchar(max), @prefix varchar(20),  @x int=0, @y int=0, @increment_type varchar(10), @mode varchar(10))    

				cmd.Parameters.Add("@tbl", SqlDbType.VarChar);
				cmd.Parameters.Add("@datatype", SqlDbType.VarChar);
				cmd.Parameters.Add("@main", SqlDbType.VarChar);
				cmd.Parameters.Add("@csv1", SqlDbType.VarChar);
				cmd.Parameters.Add("@csv2", SqlDbType.VarChar);
				cmd.Parameters.Add("@csv3", SqlDbType.VarChar);
				cmd.Parameters.Add("@csv4", SqlDbType.VarChar);
				cmd.Parameters.Add("@csv5", SqlDbType.VarChar);
				cmd.Parameters.Add("@x1", SqlDbType.Int);
				cmd.Parameters.Add("@y1", SqlDbType.Int);
				cmd.Parameters.Add("@increment_type1", SqlDbType.VarChar);
				cmd.Parameters.Add("@x2", SqlDbType.Int);
				cmd.Parameters.Add("@y2", SqlDbType.Int);
				cmd.Parameters.Add("@increment_type2", SqlDbType.VarChar);
				cmd.Parameters.Add("@x3", SqlDbType.Int);
				cmd.Parameters.Add("@y3", SqlDbType.Int);
				cmd.Parameters.Add("@increment_type3", SqlDbType.VarChar);

				cmd.Parameters.Add("@x4", SqlDbType.Int);
				cmd.Parameters.Add("@y4", SqlDbType.Int);
				cmd.Parameters.Add("@increment_type4", SqlDbType.VarChar);

				cmd.Parameters.Add("@x5", SqlDbType.Int);
				cmd.Parameters.Add("@y5", SqlDbType.Int);
				cmd.Parameters.Add("@increment_type5", SqlDbType.VarChar);

				cmd.Parameters.Add("@insertpos", SqlDbType.Int);

				int insertpos;

				try
				{
					insertpos = Convert.ToInt16(txtInsertAtPos.Text);
				}
				catch (Exception exc1)
				{
					insertpos = 0;
				}



				cmd.Parameters["@tbl"].Value = lbl_TableName.Text;

				string datatype = ddlDataType.SelectedValue;
				if (datatype == "varchar")
				{
					datatype += "(" + txtDataTypeLength.Text + ")";
				}
				cmd.Parameters["@datatype"].Value = datatype;

				#region  process From & To vars
				int from1; int to1; int from2; int to2; int from3; int to3; int from4; int to4; int from5; int to5;

				//if (ddlIncrementType1.SelectedValue == "..type..") { from1 = 0; to1 = 0; }
				//else
				//{
				//    from1 = (txtFrom1.Text == "") ? 0 : Convert.ToInt32(txtFrom1.Text);
				//    to1 = (txtTo1.Text == "") ? 0 : Convert.ToInt32(txtTo1.Text);
				//}


				//if (ddlIncrementType2.SelectedValue == "..type..") { from2 = 0; to2 = 0; }
				//else
				//{
				//    from2 = (txtFrom2.Text == "") ? 0 : Convert.ToInt32(txtFrom2.Text);
				//    to2 = (txtTo2.Text == "") ? 0 : Convert.ToInt32(txtTo2.Text);
				//}


				//if (ddlIncrementType3.SelectedValue == "..type..") { from3 = 0; to3 = 0; }
				//else
				//{
				//    from3 = (txtFrom3.Text == "") ? 0 : Convert.ToInt32(txtFrom3.Text);
				//    to3 = (txtTo3.Text == "") ? 0 : Convert.ToInt32(txtTo3.Text);
				//}

				//if (ddlIncrementType4.SelectedValue == "..type..") { from4 = 0; to4 = 0; }
				//else
				//{
				//    from4 = (txtFrom4.Text == "") ? 0 : Convert.ToInt32(txtFrom4.Text);
				//    to4 = (txtTo4.Text == "") ? 0 : Convert.ToInt32(txtTo4.Text);
				//}

				//if (ddlIncrementType5.SelectedValue == "..type..") { from5 = 0; to5 = 0; }
				//else
				//{
				//    from5 = (txtFrom5.Text == "") ? 0 : Convert.ToInt32(txtFrom5.Text);
				//    to5 = (txtTo5.Text == "") ? 0 : Convert.ToInt32(txtTo5.Text);
				//}

				#endregion


				from1 = (txtFrom1.Text == "") ? 0 : Convert.ToInt32(txtFrom1.Text);
				to1 = (txtTo1.Text == "") ? 0 : Convert.ToInt32(txtTo1.Text);
			
				from2 = (txtFrom2.Text == "") ? 0 : Convert.ToInt32(txtFrom2.Text);
				to2 = (txtTo2.Text == "") ? 0 : Convert.ToInt32(txtTo2.Text);
			
				from3 = (txtFrom3.Text == "") ? 0 : Convert.ToInt32(txtFrom3.Text);
				to3 = (txtTo3.Text == "") ? 0 : Convert.ToInt32(txtTo3.Text);
			
				from4 = (txtFrom4.Text == "") ? 0 : Convert.ToInt32(txtFrom4.Text);
				to4 = (txtTo4.Text == "") ? 0 : Convert.ToInt32(txtTo4.Text);
			
				from5 = (txtFrom5.Text == "") ? 0 : Convert.ToInt32(txtFrom5.Text);
				to5 = (txtTo5.Text == "") ? 0 : Convert.ToInt32(txtTo5.Text);



				if (from1 > to1 || from2 > to2 || from3 > to3 || from4 > to4 || from5 > to5)
				{
					lblBatchInfo.Text = "The 'From' value cannot be greater than the 'To' value.";
					lblBatchInfo.ForeColor = Color.Red;
				}
				else if (
					(from1 >0 & ddlIncrementType1.SelectedValue == "..type..") ||
					(from2 >0 & ddlIncrementType2.SelectedValue == "..type..") ||
					(from3 >0 & ddlIncrementType3.SelectedValue == "..type..") ||
					(from4 >0 & ddlIncrementType4.SelectedValue == "..type..") ||
					(from5 >0 & ddlIncrementType5.SelectedValue == "..type..") )
				{
					lblBatchInfo.Text = "Select a Sequence Type for the range.";
					lblBatchInfo.ForeColor = Color.Red;
				}

				else
				{
					cmd.Parameters["@main"].Value = txtMain.Text;
					cmd.Parameters["@csv1"].Value = csv1;
					cmd.Parameters["@csv2"].Value = csv2;
					cmd.Parameters["@csv3"].Value = csv3;
					cmd.Parameters["@csv4"].Value = csv4;
					cmd.Parameters["@csv5"].Value = csv5;
					cmd.Parameters["@x1"].Value = from1;
					cmd.Parameters["@y1"].Value = to1;
					cmd.Parameters["@increment_type1"].Value = ddlIncrementType1.SelectedValue;
					cmd.Parameters["@x2"].Value = from2;
					cmd.Parameters["@y2"].Value = to2;
					cmd.Parameters["@increment_type2"].Value = ddlIncrementType2.SelectedValue;
					cmd.Parameters["@x3"].Value = from3;
					cmd.Parameters["@y3"].Value = to3;
					cmd.Parameters["@increment_type3"].Value = ddlIncrementType3.SelectedValue;

					cmd.Parameters["@x4"].Value = from4;
					cmd.Parameters["@y4"].Value = to4;
					cmd.Parameters["@increment_type4"].Value = ddlIncrementType4.SelectedValue;

					cmd.Parameters["@x5"].Value = from5;
					cmd.Parameters["@y5"].Value = to5;
					cmd.Parameters["@increment_type5"].Value = ddlIncrementType5.SelectedValue;

					cmd.Parameters["@insertpos"].Value = insertpos;


					try
					{
						cmd.ExecuteNonQuery();

						Populate_GridView_DataDict(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));

						lblBatchInfo.Text = "Fields added.";
						lblBatchInfo.ForeColor = Color.Green;

					}
					catch (SqlException sqlexc)
					{
						LogToPageError(sqlexc.Message);
					}

					//Load_gv_FieldInfo();
				}

			}
		}


		catch (Exception exc) 
		{
			LogToPageError(exc.Message + exc.StackTrace);
		}
	}

	protected void TextChanged1(object sender, EventArgs e)
	{
		TextBox txtFrom = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom1");
		TextBox txtTo = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo1");
		DropDownList ddlIncrementType = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType1");
		ResetFromTo(txtFrom, txtTo, ddlIncrementType);
	}

	protected void TextChanged2(object sender, EventArgs e)
	{
		TextBox txtFrom = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom2");
		TextBox txtTo = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo2");
		DropDownList ddlIncrementType = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType2");
		ResetFromTo(txtFrom, txtTo, ddlIncrementType);
	}


	protected void TextChanged3(object sender, EventArgs e)
	{
		TextBox txtFrom = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom3");
		TextBox txtTo = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo3");
		DropDownList ddlIncrementType = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType3");
		ResetFromTo(txtFrom, txtTo, ddlIncrementType);

	}

	protected void TextChanged4(object sender, EventArgs e)
	{
		TextBox txtFrom = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom4");
		TextBox txtTo = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo4");
		DropDownList ddlIncrementType = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType4");
		ResetFromTo(txtFrom, txtTo, ddlIncrementType);
	}

	protected void TextChanged5(object sender, EventArgs e)
	{
		TextBox txtFrom = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom5");
		TextBox txtTo = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo5");
		DropDownList ddlIncrementType = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType5");
		ResetFromTo(txtFrom, txtTo, ddlIncrementType) ;
	}


	protected void ResetFromTo(TextBox txtFrom, TextBox txtTo, DropDownList ddlIncrementType)
	{
		txtFrom.Text = "";
		txtTo.Text = "";
		ddlIncrementType.SelectedIndex = 0;
		Panel_InsertField_Controls.Update();
	}


	protected void TextChanged1s(object sender, EventArgs e)
	{
		TextBox txtText = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText1");
		ResetTextCSV(txtText);
	}

	protected void TextChanged2s(object sender, EventArgs e)
	{
		TextBox txtText = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText2");
		ResetTextCSV(txtText);
	}

	protected void TextChanged3s(object sender, EventArgs e)
	{
		TextBox txtText = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText3");
		ResetTextCSV(txtText);
	}

	protected void TextChanged4s(object sender, EventArgs e)
	{
		TextBox txtText = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText4");
		ResetTextCSV(txtText);
	}

	protected void TextChanged5s(object sender, EventArgs e)
	{
		TextBox txtText = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText5");
		ResetTextCSV(txtText);
	}

	protected void TextChanged1e(object sender, EventArgs e)
	{
		TextBox txtText = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText1");
		ResetTextCSV(txtText);
	}

	protected void TextChanged2e(object sender, EventArgs e)
	{
		TextBox txtText = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText2");
		ResetTextCSV(txtText);
	}

	protected void TextChanged3e(object sender, EventArgs e)
	{
		TextBox txtText = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText3");
		ResetTextCSV(txtText);
	}

	protected void TextChanged4e(object sender, EventArgs e)
	{
		TextBox txtText = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText4");
		ResetTextCSV(txtText);
	}

	protected void TextChanged5e(object sender, EventArgs e)
	{
		TextBox txtText = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText5");
		ResetTextCSV(txtText);
	}


	protected void ResetTextCSV(TextBox txtText)
	{
		txtText.Text = "";
	}





	protected void ResetFields(object sender, EventArgs e)
	{

		TextBox txtMain = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtMain");
		TextBox txtText1 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText1");
		TextBox txtText2 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText2");
		TextBox txtText3 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText3");
		TextBox txtText4 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText4");
		TextBox txtText5 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtText5");

		TextBox txtFrom1 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom1");
		TextBox txtTo1 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo1");
		TextBox txtFrom2 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom2");
		TextBox txtTo2 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo2");
		TextBox txtFrom3 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom3");
		TextBox txtTo3 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo3");
		TextBox txtFrom4 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom4");
		TextBox txtTo4 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo4");
		TextBox txtFrom5 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFrom5");
		TextBox txtTo5 = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtTo5");

		TextBox txtInsertAtPos = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtInsertAtPos");



		DropDownList ddlIncrementType1 = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType1");
		DropDownList ddlIncrementType2 = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType2");
		DropDownList ddlIncrementType3 = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType3");
		DropDownList ddlIncrementType4 = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType4");
		DropDownList ddlIncrementType5 = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlIncrementType5");

		txtMain.Text = "";
		txtText1.Text = "";
		txtText2.Text = "";
		txtText3.Text = "";
		txtText4.Text = "";
		txtText5.Text = "";

		txtFrom1.Text = "";
		txtTo1.Text = "";
		txtFrom2.Text = "";
		txtTo2.Text = "";
		txtFrom3.Text = "";
		txtTo3.Text = "";
		txtFrom4.Text = "";
		txtTo4.Text = "";
		txtFrom5.Text = "";
		txtTo5.Text = "";

		txtInsertAtPos.Text = "";

		ddlIncrementType1.SelectedValue = "..type..";
		ddlIncrementType2.SelectedValue = "..type..";
		ddlIncrementType3.SelectedValue = "..type..";
		ddlIncrementType4.SelectedValue = "..type..";
		ddlIncrementType5.SelectedValue = "..type..";

	}



	protected void BatchClearFields(object sender, EventArgs e)
	{

		CheckBox chkClear_MinMax = (CheckBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "chkClear_MinMax");
		CheckBox chkClear_ValidList = (CheckBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "chkClear_ValidList");
		CheckBox chkClear_MissVal = (CheckBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "chkClear_MissVal");
		CheckBox chkClear_ValueSetID = (CheckBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "chkClear_ValueSetID");


		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.CommandText = "spDEF_BATCH_ClearFields";

		cmd.Connection = oConnData;



		cmd.Parameters.Add("@minval", SqlDbType.Int);
		cmd.Parameters.Add("@maxval", SqlDbType.Int);
		cmd.Parameters.Add("@validlist", SqlDbType.Int);
		cmd.Parameters.Add("@missval", SqlDbType.Int);
		cmd.Parameters.Add("@fieldvaluesetID", SqlDbType.Int);

		cmd.Parameters.Add("@fieldlist", SqlDbType.VarChar);
		cmd.Parameters.Add("@frompos", SqlDbType.VarChar);
		cmd.Parameters.Add("@topos", SqlDbType.VarChar);
		cmd.Parameters.Add("@tblname", SqlDbType.VarChar);

		cmd.Parameters.Add("@result", SqlDbType.VarChar, 300);
		cmd.Parameters["@result"].Direction = ParameterDirection.Output;

		cmd.Parameters["@tblname"].Value = lbl_TableName.Text;

		if (String.IsNullOrEmpty(txtFromUpdate.Text)) { cmd.Parameters["@frompos"].Value = -98765; } else { cmd.Parameters["@frompos"].Value = Convert.ToInt32(txtFromUpdate.Text); }
		if (String.IsNullOrEmpty(txtToUpdate.Text)) { cmd.Parameters["@topos"].Value = -98765; } else { cmd.Parameters["@topos"].Value = Convert.ToInt32(txtToUpdate.Text); }


		cmd.Parameters["@minval"].Value = chkClear_MinMax.Checked  ? 1 : 0;
		cmd.Parameters["@maxval"].Value =   chkClear_MinMax.Checked ? 1 : 0;
		cmd.Parameters["@validlist"].Value = chkClear_ValidList .Checked? 1 : 0; 
		cmd.Parameters["@missval"].Value =   chkClear_MissVal.Checked  ? 1 : 0;
		cmd.Parameters["@fieldvaluesetID"].Value = chkClear_ValueSetID.Checked   ? 1 : 0;

		if (String.IsNullOrEmpty(txtUpdateList.Text)) { cmd.Parameters["@fieldlist"].Value = "<NULL>"; } else { cmd.Parameters["@fieldlist"].Value = (txtUpdateList.Text); }


		try
		{
			if (oConnData.State == ConnectionState.Closed) oConnData.Open();
			cmd.ExecuteNonQuery();

			lblBatchInfo.Text = cmd.Parameters["@result"].Value.ToString();
			lblBatchInfo.ForeColor = Color.DarkGreen;

			Populate_GridView_DataDict(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));
		}
		catch (SqlException exc)
		{
			lblBatchInfo.ForeColor = Color.Red;
			lblBatchInfo.Text = exc.Message;
		}


			}

	protected void BatchUpdateFields(object sender, EventArgs e)
	{
		Panel_UpdateField_Controls.Update();

		DropDownList ddlDataType = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddlDataType");
		TextBox txtDataTypeLength = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtDataTypeLength");


		TextBox txtMin = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtMin");
		TextBox txtMax = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtMax");
		TextBox txtValidList = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtValidList");
		TextBox txtMissVal = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtMissVal");
		TextBox txtValueSetID = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtValueSetID");
		TextBox txtUpdateList = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtUpdateList");
		TextBox txtFromUpdate = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtFromUpdate");
		TextBox txtToUpdate = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtToUpdate");
		DropDownList ddl_InAnalysis = (DropDownList)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "ddl_InAnalysis");



		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.CommandText = "spDEF_BATCH_UpdateFields";

		cmd.Connection = oConnData;

		cmd.Parameters.Add("@fielddatatype", SqlDbType.VarChar);
		cmd.Parameters.Add("@fielddatatypelength", SqlDbType.Int);

		cmd.Parameters.Add("@minval", SqlDbType.VarChar);
		cmd.Parameters.Add("@maxval", SqlDbType.VarChar);
		cmd.Parameters.Add("@validlist", SqlDbType.VarChar);

		cmd.Parameters.Add("@inanalysis", SqlDbType.VarChar);

		cmd.Parameters.Add("@missval", SqlDbType.VarChar);
		cmd.Parameters.Add("@fieldvaluesetID", SqlDbType.VarChar);

		cmd.Parameters.Add("@fieldlist", SqlDbType.VarChar);
		cmd.Parameters.Add("@frompos", SqlDbType.VarChar);
		cmd.Parameters.Add("@topos", SqlDbType.VarChar);
		cmd.Parameters.Add("@tblname", SqlDbType.VarChar);

 

		cmd.Parameters.Add("@result", SqlDbType.VarChar, 300);
		cmd.Parameters["@result"].Direction = ParameterDirection.Output;


		//cmd.Parameters["@tblname"].Value = hidTblName.Value.ToString();
		cmd.Parameters["@tblname"].Value = lbl_TableName.Text;


		//Ints
		if (ddlDataType.SelectedValue == "int" || ddlDataType.SelectedValue == "float" || ddlDataType.SelectedValue == "datetime")
		{ cmd.Parameters["@fielddatatypelength"].Value = -98765; }
		else
		{
			if (String.IsNullOrEmpty(txtDataTypeLength.Text)) { cmd.Parameters["@fielddatatypelength"].Value = -98765; } else { cmd.Parameters["@fielddatatypelength"].Value = Convert.ToInt32(txtDataTypeLength.Text); }
		}
		if (String.IsNullOrEmpty(txtMin.Text)) { cmd.Parameters["@minval"].Value = -98765; } else { cmd.Parameters["@minval"].Value = Convert.ToInt32(txtMin.Text); }
		if (String.IsNullOrEmpty(txtMax.Text)) { cmd.Parameters["@maxval"].Value = -98765; } else { cmd.Parameters["@maxval"].Value = Convert.ToInt32(txtMax.Text); }
		if (String.IsNullOrEmpty(ddl_InAnalysis.SelectedValue)) { cmd.Parameters["@inanalysis"].Value = -98765; } else { cmd.Parameters["@inanalysis"].Value = Convert.ToInt32(ddl_InAnalysis.SelectedValue); }
		if (String.IsNullOrEmpty(txtValueSetID.Text)) { cmd.Parameters["@fieldvaluesetID"].Value = -98765; } else { cmd.Parameters["@fieldvaluesetID"].Value = Convert.ToInt32(txtValueSetID.Text); }
		if (String.IsNullOrEmpty(txtFromUpdate.Text)) { cmd.Parameters["@frompos"].Value = -98765; } else { cmd.Parameters["@frompos"].Value = Convert.ToInt32(txtFromUpdate.Text); }
		if (String.IsNullOrEmpty(txtToUpdate.Text)) { cmd.Parameters["@topos"].Value = -98765; } else { cmd.Parameters["@topos"].Value = Convert.ToInt32(txtToUpdate.Text); }

	   
		//Strings      
		cmd.Parameters["@fielddatatype"].Value = (ddlDataType.SelectedValue); 
		if (String.IsNullOrEmpty(txtValidList.Text)) { cmd.Parameters["@validlist"].Value = "<NULL>"; } else { cmd.Parameters["@validlist"].Value = (txtValidList.Text); }
		if (String.IsNullOrEmpty(txtMissVal.Text)) { cmd.Parameters["@missval"].Value = "<NULL>"; } else { cmd.Parameters["@missval"].Value = (txtMissVal.Text); }
		if (String.IsNullOrEmpty(txtUpdateList.Text)) { cmd.Parameters["@fieldlist"].Value = "<NULL>"; } else { cmd.Parameters["@fieldlist"].Value = (txtUpdateList.Text); }


		try
		{
			if (oConnData.State == ConnectionState.Closed) oConnData.Open();
			cmd.ExecuteNonQuery();

			lblBatchInfo.Text = cmd.Parameters["@result"].Value.ToString();
			lblBatchInfo.ForeColor = Color.DarkGreen;

			Populate_GridView_DataDict(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));
		}
		catch (SqlException exc)
		{
			lblBatchInfo.ForeColor = Color.Red;
			lblBatchInfo.Text = exc.Message;
		}
	}

	protected void DeleteFields_Submit(object sender, EventArgs e)
	{
		TextBox txtDelFrom = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtDelFrom");
		TextBox txtDelTo = (TextBox)FindControlRecursive(Panel_BatchEditFields.ContentTemplateContainer, "txtDelTo");

		Label lbl_TableName = (Label)FindControlRecursive(Panel_TableInfo.ContentTemplateContainer, "lbl_TableName");


		SqlCommand cmd = new SqlCommand();
		cmd.CommandText = "spDEF_DeleteFields";
		cmd.CommandType = CommandType.StoredProcedure;
		if (oConnData.State == ConnectionState.Closed) oConnData.Open();
		cmd.Connection = oConnData;

		cmd.Parameters.Add("@tablename", SqlDbType.VarChar);
		cmd.Parameters["@tablename"].Value = lbl_TableName.Text;

		cmd.Parameters.Add("@from", SqlDbType.Int);
		cmd.Parameters["@from"].Value = Convert.ToInt32(txtDelFrom.Text);

		cmd.Parameters.Add("@to", SqlDbType.Int);
		cmd.Parameters["@to"].Value = Convert.ToInt32(txtDelTo.Text);

		try
		{
			cmd.ExecuteNonQuery();

			lblBatchInfo.ForeColor = Color.Green;
			lblBatchInfo.Text = "Fields deleted from " + lbl_TableName.Text + ".";

			//gv_FieldInfo.DataBind();

			//refresh the table info
			int measID = Convert.ToInt32(DDL_SelectMeasureID.SelectedValue);
			Show_TableInfo(measID);

			txtDelFrom.Text = "";
			txtDelTo.Text = "";

		}
		catch (SqlException sqlexc)
		{
			lblBatchInfo.ForeColor = Color.Red;
			lblBatchInfo.Text = sqlexc.Message;
			LogToPageError(sqlexc.Message);
		}

		//Load_gv_FieldInfo();

	}

	#endregion





	#region ****** gv_FieldInfo GridView Methods ******

	protected void gv_FieldInfo_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		//   gv_FieldInfo_RowEditing(e.Row, e.Row.RowIndex);
	}


	protected void gv_FieldInfo_RowEditing(object sender, GridViewEditEventArgs e)
	{
		//HERER WHY ISN"T THIS BEING CALLED?
		//Set the edit index.
		gv_FieldInfo.EditIndex = e.NewEditIndex;
		//Bind data to the GridView control.
		gv_FieldInfo_Bind();

		gv_FieldInfo.Rows[e.NewEditIndex].BackColor = Color.Yellow;
	}

	protected void gv_FieldInfo_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		//Retrieve the table from the session object.
		DataTable dt = (DataTable)Session["dt_FieldInfo"];

		GridViewRow row = gv_FieldInfo.Rows[e.RowIndex];

		//Update the values.
		UpdateField(row);

		//Reset the edit index. 
		gv_FieldInfo.EditIndex = -1;

		Populate_GridView_DataDict(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));

		Panel_FieldInfo.Visible = true;
	}

	protected void gv_FieldInfo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		//Reset the edit index.
		gv_FieldInfo.EditIndex = -1;
		//Bind data to the GridView control.
		gv_FieldInfo_Bind();
	}

	private void gv_FieldInfo_Bind()
	{
		gv_FieldInfo.DataSource = Session["dt_FieldInfo"];
		gv_FieldInfo.DataBind();
	}
	#endregion

	#endregion


	#region ========= Get Meas Info =========
	protected void Populate_Docs_Meas(int measID)
	{
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = CommandType.Text;
		cmd.CommandText = "select DocID,DocTitle,DocDesc,DocVersID,Version,DocFileName,ChangesDesc,DateSubmitted,doctype,docstatus,DocLink, fileext from	vwDocs_Meas where entityID = " + measID.ToString();
		cmd.Connection = oConn;
		//LogToPageUrgent("...Populate_Docs_Meas: " + cmd.CommandText + "<br/>");

		SqlDataReader dr = cmd.ExecuteReader();

		if (dr.HasRows == true)
		{
			lblDocs.Text = "Documents associated with this measure:";
			lblDocs.ForeColor = Color.Black;
		}
		else
		{
			lblDocs.Text = "No documents associated with this measure.";
			lblDocs.ForeColor = Color.Red;
		}

		Repeater Repeater_Docs_Meas = (Repeater)FindControlRecursive(this.Page, "Repeater_Docs_Meas");
		Repeater_Docs_Meas.DataSource = dr;
		Repeater_Docs_Meas.DataBind();

		dr.Close();
	}


	protected void Populate_MeasInfo(int measID)
	{
		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "<br/>---> Populate_GridView_DataDict <br/>";

		if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 3 <br/>";


		try
		{
			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 4 <br/>";

			string mycmd = "exec spDEF_MeasInfo_by_measureID " + measID.ToString();
			//LogToPageUrgent("...Populate_MeasInfo: " + mycmd + "<br/>");

			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "=Pop GridView=" + mycmd + ".<br/>";

			SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(mycmd, oConn);
			SqlDataReader sqlReader = sqlCmd.ExecuteReader();

			//Get the Columnnames 
			_columncount = sqlReader.FieldCount;
			_colnames = new string[_columncount];
			_colvisible = new bool[_columncount];

			DataTable dt = new DataTable();
			dt.Load(sqlReader);


			//for (int k = 0; k < _columncount; k++)
			//{
			//    _colnames[k] = dt.Columns[k].ColumnName;

			//    //LogToPageUrgent(_colnames[k] + "<br/>");
			//}


			foreach (DataRow row in dt.Rows)
			{

				//NOT CURRENTLY USED, WOULD NEED TO BE ADDED TO VIEW (NOT TRIVIAL DUE TO MANY SMID'S ARE POSSIBLE)  lbl_studymeasID.Text = row["studymeasID"].ToString();
				lbl_measureID.Text = row["measureID"].ToString();
				lbl_MeasName.Text = row["MeasName"].ToString();
				lbl_MeasFullName.Text = row["MeasFullName"].ToString();
				lbl_CitationText.Text = row["CitationText"].ToString();
				lbl_DescriptionText.Text = row["DescriptionText"].ToString();
				lbl_CopyrightInfo.Text = row["CopyrightInfo"].ToString();
				lbl_OrderingInfo.Text = row["OrderingInfo"].ToString();
				lbl_DataCategory.Text = row["DataCategory"].ToString();
				lbl_DataFocus.Text = row["DataFocus"].ToString();
				lbl_DataMethod.Text = row["DataMethod"].ToString();
				lbl_DataRespondent.Text = row["DataRespondent"].ToString();
				lbl_meassource.Text = row["MeasSource"].ToString();
				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 5 <br/>";


				lbl_MeasSource_desc.Text = row["MeasSource_desc"].ToString();
				txt_MeasSource_desc.Text = row["MeasSource_desc"].ToString();

				txt_measureID.Text = row["measureID"].ToString();
				txt_MeasName.Text = row["MeasName"].ToString();
				txt_MeasFullName.Text = row["MeasFullName"].ToString();
				txt_CitationText.Text = row["CitationText"].ToString();
				txt_DescriptionText.Text = row["DescriptionText"].ToString();
				txt_CopyrightInfo.Text = row["CopyrightInfo"].ToString();
				txt_OrderingInfo.Text = row["OrderingInfo"].ToString();

				ddl_cat.DataBind();
				ddl_resp.DataBind();
				ddl_meth.DataBind();
				ddl_focus.DataBind();
				ddl_source.DataBind();


				ddl_cat.SelectedValue = ddl_cat.Items.FindByValue(row["meascatID"].ToString()).Value;
				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 6a1 <br/>";
				ddl_resp.SelectedValue = ddl_resp.Items.FindByValue(row["Respondant"].ToString()).Value;
				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 6a2 <br/>";
				ddl_meth.SelectedValue = ddl_meth.Items.FindByValue(row["Method"].ToString()).Value;
				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 6a3 <br/>";
				ddl_focus.SelectedValue = ddl_focus.Items.FindByValue(row["FocusPerson"].ToString()).Value;
				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 6a4 <br/>";
				ddl_source.SelectedValue = ddl_source.Items.FindByValue(row["meassourceID"].ToString()).Value;

				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 6a5 <br/>";

				txt_DEformname.Text = row["DEformname"].ToString();


				//if (row["spName"].ToString().Length > 2)
				//{
				//    lbl_SPlink.Text = "View scoring procedure: " + row["spName"].ToString();
				//}
				//else
				//{
				//    lbl_SPlink.Text = "** No scoring procedure **";
				//}


				if (row["SPlink"].ToString().Length > 5)
				{
					lbl_SPlink.Visible = false;
					hyp_SPlink.Visible = true;
					hyp_SPlink.Text = "View scoring procedure: " + row["spName"].ToString();
					hyp_SPlink.NavigateUrl = row["SPlink"].ToString();
				}
				else
				{
					hyp_SPlink.Visible = false;
					lbl_SPlink.Visible = true;
				}



				if (row["DElink"].ToString().Length > 5)
				{
					lbl_DElink.Visible = false;
					hyp_DElink.Visible = true;
					hyp_DElink.Text = "Open Data Entry Form: " + row["DEformname"].ToString();
					hyp_DElink.NavigateUrl = row["DElink"].ToString();
				}
				else
				{
					hyp_DElink.Visible = false;
					lbl_DElink.Visible = true;
				}

				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 6b <br/>";

				if (row["total_timeest"].ToString() == "0")
				{
					lblTimeEstTotal.Visible = false;
					lblNoTimeEst.Visible = true;
				}
				else
				{
					lblTimeEstTotal.Visible = true;
					lblNoTimeEst.Visible = false;
				}

				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 7 <br/>";


				if (row["Admin_desc"].ToString().Length > 0)
				{
					lbl_Admin_desc.Text = row["Admin_desc"].ToString();
					lbl_Admin_time.Text = row["Admin_time"].ToString();
					lbl_Admin_desc.Visible = true;
					lbl_Admin_time.Visible = true;
				}
				else
				{
					lbl_Admin_desc.Visible = true;
					lbl_Admin_time.Visible = true;
				}

				if (row["Subject_desc"].ToString().Length > 0)
				{
					lbl_Subject_desc.Text = row["Subject_desc"].ToString();
					lbl_Subject_time.Text = row["Subject_time"].ToString();
					lbl_Subject_desc.Visible = true;
					lbl_Subject_time.Visible = true;
				}
				else
				{
					lbl_Subject_desc.Visible = true;
					lbl_Subject_time.Visible = true;
				}

				if (row["DataEntry_desc"].ToString().Length > 0)
				{
					lbl_DataEntry_desc.Text = row["DataEntry_desc"].ToString();
					lbl_DataEntry_time.Text = row["DataEntry_time"].ToString();
					lbl_DataEntry_desc.Visible = true;
					lbl_DataEntry_time.Visible = true;
				}
				else
				{
					lbl_DataEntry_desc.Visible = true;
					lbl_DataEntry_time.Visible = true;
				}

				if (row["Process_desc"].ToString().Length > 0)
				{
					lbl_Process_desc.Text = row["Process_desc"].ToString();
					lbl_Process_time.Text = row["Process_time"].ToString();
					lbl_Process_desc.Visible = true;
					lbl_Process_time.Visible = true;
				}
				else
				{
					lbl_Process_desc.Visible = true;
					lbl_Process_time.Visible = true;
				}

				if (row["N_Fields"].ToString().Length >= 1)
				{
					lbl_NoDataTable.Visible = false;
				}

				else
				{
					lbl_NoDataTable.Visible = true;
				}

				if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 8 <br/>";

			}

			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 9 <br/>";

			Panel_MeasInfo_L.Visible = true;
			Panel_MeasInfo_R.Visible = true;


			sqlReader.Close();

			gv_OtherStudies.DataBind();
			Panel_OtherStudies.Visible = true;

		}

		catch (Exception err)
		{
			if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 10 <br/>";

			//if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "-----------> Here 3 <br/>";

			LogToPageUrgent(err.Message);

			//foreach (SqlError oErr in err.Errors)
			//{
			//    tblmyinfo.Rows[0].Cells[0].InnerHtml += oErr.Message;
			//}
		}

	}
	#endregion



	#region *************** Edit Meas Info ***************
	protected void Begin_EditMeasureInfo(object sender, EventArgs e)
	{
		Begin_EditMeasureInfo();
	}

	protected void Begin_EditMeasureInfo()
	{
		if (CanEdit)
		{
			Panel_ViewMeasInfo.Visible = false;
			Panel_EditMeasInfo.Visible = true;
			Panel_MeasInfo_L.Visible = false;
			Panel_MeasInfo_L_Edit.Visible = true;

			Panel_MeasInfo_R.Visible = false;
			Panel_MeasInfo_R_Edit.Visible = true;

			btnEdit_MeasInfo.Visible = false;
			btnHide_MeasInfo.Visible = false;


			btnEdit_MeasInfo_Submit.Visible = true;
			btnEdit_MeasInfo_Cancel.Visible = true;
		}


		//try
		//{
		//    if (Convert.ToInt16(lbl_tableID.Text) > 0)
		//    {
		//        Panel_LinkToTable.Visible = false;
		//    }
		//    else{
		//           Panel_LinkToTable.Visible = true;
		//    }
		//}
		//catch (Exception)  { Panel_LinkToTable.Visible = true; }


	}

	protected void Submit_EditMeasureInfo(object sender, EventArgs e)
	{
		try
		{

			Label txt_measureID = (Label)FindControlRecursive(Panel_MeasInfo_L_Edit, "txt_measureID");

			if (Convert.ToInt32(txt_measureID.Text) > 0)
			{

				TextBox txt_MeasName = (TextBox)FindControlRecursive(Panel_MeasInfo_L_Edit, "txt_MeasName");
				TextBox txt_MeasFullName = (TextBox)FindControlRecursive(Panel_MeasInfo_L_Edit, "txt_MeasFullName");
				TextBox txt_CitationText = (TextBox)FindControlRecursive(Panel_MeasInfo_L_Edit, "txt_CitationText");
				TextBox txt_DescriptionText = (TextBox)FindControlRecursive(Panel_MeasInfo_L_Edit, "txt_DescriptionText");
				TextBox txt_CopyrightInfo = (TextBox)FindControlRecursive(Panel_MeasInfo_L_Edit, "txt_CopyrightInfo");
				TextBox txt_OrderingInfo = (TextBox)FindControlRecursive(Panel_MeasInfo_L_Edit, "txt_OrderingInfo");


				DropDownList ddl_cat = (DropDownList)FindControlRecursive(Panel_MeasInfo_R_Edit, "ddl_cat");
				DropDownList ddl_focus = (DropDownList)FindControlRecursive(Panel_MeasInfo_R_Edit, "ddl_focus");
				DropDownList ddl_meth = (DropDownList)FindControlRecursive(Panel_MeasInfo_R_Edit, "ddl_meth");
				DropDownList ddl_resp = (DropDownList)FindControlRecursive(Panel_MeasInfo_R_Edit, "ddl_resp");
				DropDownList ddl_source = (DropDownList)FindControlRecursive(Panel_MeasInfo_R_Edit, "ddl_source");
				TextBox txt_MeasSource_desc = (TextBox)FindControlRecursive(Panel_MeasInfo_R_Edit, "txt_MeasSource_desc");
				TextBox txt_DEformname = (TextBox)FindControlRecursive(Panel_MeasInfo_R_Edit, "txt_DEformname");


				SqlCommand cmd = new SqlCommand();
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.CommandText = "spDEF_UpdateMeasInfo";
				cmd.Connection = oConn;
				if (oConn.State == ConnectionState.Closed) oConn.Open();

				cmd.Parameters.Add("@measureID", SqlDbType.Int);
				cmd.Parameters.Add("@MeasName", SqlDbType.VarChar);
				cmd.Parameters.Add("@MeasFullName", SqlDbType.VarChar);
				cmd.Parameters.Add("@CitationText", SqlDbType.VarChar);
				cmd.Parameters.Add("@DescriptionText", SqlDbType.VarChar);
				cmd.Parameters.Add("@CopyrightInfo", SqlDbType.VarChar);
				cmd.Parameters.Add("@OrderingInfo", SqlDbType.VarChar);
				cmd.Parameters.Add("@MeasSource_desc", SqlDbType.VarChar);
				cmd.Parameters.Add("@DEformname", SqlDbType.VarChar);

				cmd.Parameters.Add("@source", SqlDbType.Int);
				cmd.Parameters.Add("@cat", SqlDbType.Int);
				cmd.Parameters.Add("@focus", SqlDbType.Int);
				cmd.Parameters.Add("@meth", SqlDbType.Int);
				cmd.Parameters.Add("@resp", SqlDbType.Int);

				//Ints
				if (String.IsNullOrEmpty(txt_measureID.Text)) { cmd.Parameters["@measureID"].Value = -98765; } else { cmd.Parameters["@measureID"].Value = Convert.ToInt32(txt_measureID.Text); }
				if (String.IsNullOrEmpty(ddl_cat.SelectedValue)) { cmd.Parameters["@cat"].Value = -98765; } else { cmd.Parameters["@cat"].Value = Convert.ToInt32(ddl_cat.SelectedValue); }
				if (String.IsNullOrEmpty(ddl_focus.SelectedValue)) { cmd.Parameters["@focus"].Value = -98765; } else { cmd.Parameters["@focus"].Value = Convert.ToInt32(ddl_focus.SelectedValue); }
				if (String.IsNullOrEmpty(ddl_meth.SelectedValue)) { cmd.Parameters["@meth"].Value = -98765; } else { cmd.Parameters["@meth"].Value = Convert.ToInt32(ddl_meth.SelectedValue); }
				if (String.IsNullOrEmpty(ddl_resp.SelectedValue)) { cmd.Parameters["@resp"].Value = -98765; } else { cmd.Parameters["@resp"].Value = Convert.ToInt32(ddl_resp.SelectedValue); }
				if (String.IsNullOrEmpty(ddl_source.SelectedValue)) { cmd.Parameters["@source"].Value = -98765; } else { cmd.Parameters["@source"].Value = Convert.ToInt32(ddl_source.SelectedValue); }

				//Strings      
				if (String.IsNullOrEmpty(txt_MeasName.Text)) { cmd.Parameters["@MeasName"].Value = DBNull.Value; } else { cmd.Parameters["@MeasName"].Value = (txt_MeasName.Text); }
				if (String.IsNullOrEmpty(txt_MeasFullName.Text)) { cmd.Parameters["@MeasFullName"].Value = DBNull.Value; } else { cmd.Parameters["@MeasFullName"].Value = (txt_MeasFullName.Text); }
				if (String.IsNullOrEmpty(txt_CitationText.Text)) { cmd.Parameters["@CitationText"].Value = DBNull.Value; } else { cmd.Parameters["@CitationText"].Value = (txt_CitationText.Text); }
				if (String.IsNullOrEmpty(txt_DescriptionText.Text)) { cmd.Parameters["@DescriptionText"].Value = DBNull.Value; } else { cmd.Parameters["@DescriptionText"].Value = (txt_DescriptionText.Text); }
				if (String.IsNullOrEmpty(txt_CopyrightInfo.Text)) { cmd.Parameters["@CopyrightInfo"].Value = DBNull.Value; } else { cmd.Parameters["@CopyrightInfo"].Value = (txt_CopyrightInfo.Text); }
				if (String.IsNullOrEmpty(txt_OrderingInfo.Text)) { cmd.Parameters["@OrderingInfo"].Value = DBNull.Value; } else { cmd.Parameters["@OrderingInfo"].Value = (txt_OrderingInfo.Text); }
				if (String.IsNullOrEmpty(txt_MeasSource_desc.Text)) { cmd.Parameters["@MeasSource_desc"].Value = DBNull.Value; } else { cmd.Parameters["@MeasSource_desc"].Value = (txt_MeasSource_desc.Text); }
				if (String.IsNullOrEmpty(txt_DEformname.Text)) { cmd.Parameters["@DEformname"].Value = DBNull.Value; } else { cmd.Parameters["@DEformname"].Value = (txt_DEformname.Text); }

				cmd.ExecuteNonQuery();

				Show_MeasInfo(Convert.ToInt32(txt_measureID.Text));

			}
		}
		catch (SqlException exc)
		{
			LogToPageError(exc.Message);
		}


	}

	protected void Cancel_EditMeasureInfo(object sender, EventArgs e)
	{
		Panel_MeasInfo_L.Visible = true;
		Panel_MeasInfo_L_Edit.Visible = false;

		Panel_MeasInfo_R.Visible = true;
		Panel_MeasInfo_R_Edit.Visible = false;

		btnShow_MeasInfo.Visible = false;
		btnHide_MeasInfo.Visible = true;

		if(CanEdit) btnEdit_MeasInfo.Visible = true;
		btnEdit_MeasInfo_Submit.Visible = false;
		btnEdit_MeasInfo_Cancel.Visible = false;

		//Populate_GridView_DataDict();

	}

	#endregion




	#region  ----------- Handle Template -----------
	protected void DownloadExcelTemplate(object sender, EventArgs e)
	{

		string filename = "UWAC_datadict_template.txt";
		System.IO.FileStream fs = null;
		fs = System.IO.File.Open(Server.MapPath("~/Info/" + filename), System.IO.FileMode.Open);
		byte[] btFile = new byte[fs.Length];
		fs.Read(btFile, 0, Convert.ToInt32(fs.Length));
		fs.Close();
		Response.AddHeader("Content-disposition", "attachment; filename=" + filename);
		Response.ContentType = "application/octet-stream";
		Response.BinaryWrite(btFile);
		Response.End();


		//Response.ContentType = "text/plain";
		//Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);
		//string aaa = Server.MapPath("~/Info/" + filename);
		//Response.TransmitFile(Server.MapPath("~/Info/" + filename));
		//Response.End();
	}

	protected void ShowUploadDocPanel(object sender, EventArgs e)
	{
		ddl_DocType.SelectedValue = "0";
		ddl_DocStatus.SelectedValue = "0";
		txtDocTitle.Text = "";
		txtDocDesc.Text = "";
		lblDocUploadInfo.Text = "";

		Panel_UploadDocs.Visible = true;
		btnShowUploadDocPanel.Visible = false;
	}

	protected void UploadDoc(object sender, EventArgs e)
	{

		//Debug.WriteLine("Passed Checkpoint 1");




		if (FileUpload_Doc.HasFile)
		{

			int nDocID = Convert.ToInt32(hidDocID.Value.ToString());
			int nDocVersID = Convert.ToInt32(hidDocVersID.Value.ToString());
			string sDocumentTitle = txtDocTitle.Text.ToString();
			string sDocumentDesc = txtDocDesc.Text.ToString();
			int nDocumentType = Convert.ToInt32(ddl_DocType.SelectedValue);
			int nDocumentStatus = Convert.ToInt32(ddl_DocStatus.SelectedValue);
			int nEntityType = 1; //measure is 1; 
			string sEntityValue = DDL_SelectMeasureID.SelectedValue; //Request["selEntityValue"];

			string sFileExt = FileUpload_Doc.PostedFile.FileName.Substring(FileUpload_Doc.PostedFile.FileName.LastIndexOf("."));
			string sOrigFileName = FileUpload_Doc.PostedFile.FileName;

			string sFilePath = ConfigurationManager.AppSettings["DOCUMENT_LOCATION"];
			string sFilePathWeb = ConfigurationManager.AppSettings["DOCUMENT_LOCATION"];
			//string sFilePath = oConfig.ReadWebDocsLocation;
			//string sFilePathWeb = oConfig.ReadWebDocsLocation;
			string sFileName;

			lblDocUploadInfo.Text += "sFilePath:" + sFilePath + "<br/>" + "sFilePathWeb:" + sFilePathWeb+"<br/>";


			string[] allowedExts = { ".docx", ".xlsx", ".pptx", ".doc", ".xls", ".ppt", ".pdf", ".rtf" , ".txt", ".csv", 
											 ".wmv", ".mp3", ".wav", ".avi", ".mov", ".mpeg", ".mpg",  ".gif", ".png", ".jpeg", ".jpg", ".bmp", 
											 ".sps", ".sav", ".spo", ".R", ".Rdata", ".zip"};

			//string allowedExtsList = "doc,docx,jpg,jpeg,bmp,png,wav,mp3,avi,mpg,mov,flv,xls,xlsx,pdf,txt,csv,ppt,pptx,R,sps,sav,mat,m,Rdata,zip";
			//string[] allowedExts = allowedExtsList.Split(',');
			bool isallowed = new bool();
			isallowed = false;
			int matches = 0;
			for (int i=0; i < allowedExts.Length; i++ )
			{
				if (allowedExts[i] == sFileExt) matches++;
			}

			if (matches>=1)
			{
				//Debug.WriteLine("Passed Checkpoint 2");

				//NEW file-naming convention based on DocVersID - the pk of the table
				if (nDocVersID > 0)
				{
					//Debug.WriteLine("Passed Checkpoint 3");

					sFileName = "DocVersID_" + Convert.ToString(nDocVersID) + sFileExt; //selDocumentType.SelectedItem.Text.Replace(" ", "") + "-" + selEntityType.SelectedItem.Text.Replace(" ", "") + "-" + sEntityValue + sFileExt;
				}
				else
				{
					//Debug.WriteLine("Passed Checkpoint 4");

					//GetDocVersID(oConn);
					sFileName = "DocVersID_" + Convert.ToString(GetDocVersID()) + sFileExt; //selDocumentType.SelectedItem.Text.Replace(" ", "") + "-" + selEntityType.SelectedItem.Text.Replace(" ", "") + "-" + sEntityValue + sFileExt;
				}



				//OLD file-naming convention
				//string sFileName = selDocumentType.SelectedItem.Text.Replace(" ", "") + "-" + selEntityType.SelectedItem.Text.Replace(" ", "") + "-" + sEntityValue + sFileExt;

				if (!sFilePath.EndsWith("\\"))
				{
					sFilePath += "\\" + sFileName;
					sFilePathWeb += "/" + sFileName;
				}
				else
				{
					sFilePath += sFileName;
					sFilePathWeb += sFileName;
				}

				try
				{

					//FileUpload_Doc.PostedFile.SaveAs(sFilePath);
					string myfilepath = Server.MapPath("~/webdocs/") + sFileName;
					FileUpload_Doc.PostedFile.SaveAs(myfilepath);

					UpdateDB_with_Doc_Info(nDocID, nDocVersID, sDocumentTitle, sDocumentDesc, sFileName, nDocumentType, nDocumentStatus, nEntityType, sEntityValue, sOrigFileName);

					lblDocUploadInfo.Text = "You have successfully upload this document.";
					lblDocUploadInfo.ForeColor = Color.Green;


				}
				catch (Exception oErr)
				{
					lblDocUploadInfo.Text += "Error: " + oErr.Message + "<br/>";
					lblDocUploadInfo.Text += "StackTrace: " + oErr.StackTrace;

					lblDocUploadInfo.ForeColor = Color.Red;

				}
			}
			else { //Not an allowed file type

				lblDocUploadInfo.Text = "Error: This file type is not allowed." ;
					lblDocUploadInfo.ForeColor = Color.Red;
			}
			
		}

		else
		{
			lblDocUploadInfo.Text = "You must select a file for upload.";
			lblDocUploadInfo.ForeColor = Color.Red;
		}
		//oConn.Close();
	}



	protected void UploadDoc_Cancel(object sender, EventArgs e)
	{
		ddl_DocType.SelectedValue = "0";
		ddl_DocStatus.SelectedValue = "0";
		txtDocTitle.Text = "";
		txtDocDesc.Text = "";
		lblDocUploadInfo.Text = "";


		Panel_UploadDocs.Update();


		Panel_UploadDocs.Visible = false;

		btnShowUploadDocPanel.Visible = true;

		Populate_Docs_Meas(Convert.ToInt32(DDL_SelectMeasureID.SelectedValue));
	}


	#region Get the DocVersID when it is null
	private int GetDocVersID()
	{
		SqlCommand oCmd = new SqlCommand();
		string sUser = "";
		int nNewDocVersID;

		if (Request.ServerVariables["AUTH_USER"].ToString() == "")
			sUser = Request.Cookies["UserProfile"].Values["StaffShortName"].ToString();
		else
			sUser = Request.ServerVariables["AUTH_USER"].ToString();

		oCmd.Connection = oConn;
		oCmd.CommandType = CommandType.StoredProcedure;
		oCmd.CommandTimeout = 90;

		//		oCmd.Parameters.Clear();
		oCmd.CommandText = "spReturnNextDocVersID";

		oCmd.Parameters.Add(new SqlParameter("@DocVersID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, "nNewDocVersID"));

		oCmd.ExecuteNonQuery();

		nNewDocVersID = Convert.ToInt32(oCmd.Parameters["@DocVersID"].Value.ToString());

		return nNewDocVersID;
	}
	#endregion


	#region Update the db w/ the Uploaded File Info
	private int UpdateDB_with_Doc_Info(int nDocID, int nDocVersID, string sDocTitle, string sDocDesc, string sFileName, int nDocTypeID, int nDocStatusID, int nEntityTypeID, string sEntityTypeValue, string sOrigFileName)
	{
		SqlCommand oCmd = new SqlCommand();
		string sUser = "";

		if (Request.ServerVariables["AUTH_USER"].ToString() == "")
			sUser = Request.Cookies["UserProfile"].Values["StaffShortName"].ToString();
		else
			sUser = Request.ServerVariables["AUTH_USER"].ToString();

		oCmd.Connection = oConn;
		oCmd.CommandType = CommandType.StoredProcedure;
		oCmd.CommandTimeout = 300;
		oCmd.CommandText = "spStudyDesign_InsertDocument";

		oCmd.Parameters.Add(new SqlParameter("@DocID", SqlDbType.Int, 4, ParameterDirection.InputOutput, true, 0, 0, "", DataRowVersion.Current, nDocID));
		oCmd.Parameters.Add(new SqlParameter("@DocTitle", SqlDbType.VarChar, 250, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sDocTitle));
		oCmd.Parameters.Add(new SqlParameter("@DocDesc", SqlDbType.VarChar, 1500, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sDocDesc));
		oCmd.Parameters.Add(new SqlParameter("@DocTypeID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nDocTypeID));
		oCmd.Parameters.Add(new SqlParameter("@DocStatusID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nDocStatusID));
		oCmd.Parameters.Add(new SqlParameter("@UpdateMainDoc", SqlDbType.Bit, 1, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, true));
		oCmd.Parameters.Add(new SqlParameter("@DocVersionID", SqlDbType.Int, 4, ParameterDirection.InputOutput, true, 0, 0, "", DataRowVersion.Current, nDocVersID));
		oCmd.Parameters.Add(new SqlParameter("@DocFileName", SqlDbType.VarChar, 1000, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sFileName));
		oCmd.Parameters.Add(new SqlParameter("@Version", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, 1));
		oCmd.Parameters.Add(new SqlParameter("@OrigFileName", SqlDbType.VarChar, 1000, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sOrigFileName));
		oCmd.Parameters.Add(new SqlParameter("@UploadedBy", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sUser));

		oCmd.Parameters["@DocID"].Value = 0;

		//if (Convert.ToInt32(oCmd.Parameters["@DocID"].Value.ToString()) <= 0) { oCmd.Parameters["@DocID"].Value = DBNull.Value; }
		if (Convert.ToInt32(oCmd.Parameters["@DocVersionID"].Value.ToString()) <= 0) { oCmd.Parameters["@DocVersionID"].Value = DBNull.Value; }
		if (Convert.ToInt32(oCmd.Parameters["@DocStatusID"].Value.ToString()) <= 0) { oCmd.Parameters["@DocStatusID"].Value = DBNull.Value; }



		//LogToPageUrgent("@DocID  [" + oCmd.Parameters["@DocID"].Value.ToString() + "]");
		//LogToPageUrgent("@DocVersionID  [" + oCmd.Parameters["@DocVersionID"].Value.ToString() + "]");
		//LogToPageUrgent("@DocStatusID  [" + oCmd.Parameters["@DocStatusID"].Value.ToString() + "]");
		//LogToPageUrgent("@DocTitle  [" + oCmd.Parameters["@DocTitle"].Value.ToString() + "]");
		//LogToPageUrgent("@DocDesc  [" + oCmd.Parameters["@DocDesc"].Value.ToString() + "]");
		//LogToPageUrgent("@DocStatusID  [" + oCmd.Parameters["@DocStatusID"].Value.ToString() + "]");
		

		oCmd.ExecuteNonQuery();

		nDocID = Convert.ToInt32(oCmd.Parameters["@DocID"].Value.ToString());

		if (nEntityTypeID > 0)
		{
			oCmd.Parameters.Clear();
			oCmd.CommandText = "spDeleteDocumentForeignKeysByDocID";
			oCmd.Parameters.Add(new SqlParameter("@DocID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nDocID));

			oCmd.ExecuteNonQuery();
			oCmd.CommandText = "spInsertDocumentForeignKey";
			oCmd.Parameters.Add(new SqlParameter("@EntityTypeID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nEntityTypeID));
			oCmd.Parameters.Add(new SqlParameter("@EntityID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sEntityTypeValue));

			oCmd.ExecuteNonQuery();
		}

		return nDocID;
	}
	#endregion



	protected void UploadExcelTemplate(object sender, EventArgs e)
	{

		if (FileUpload1.HasFile)
		{
			string fileExt =
			   System.IO.Path.GetExtension(FileUpload1.FileName);

			if (fileExt == ".txt")
			{
				try
				{
					string FilePath = Server.MapPath(@"~\Info");

					FileUpload1.SaveAs(FilePath + @"\" + FileUpload1.FileName);

					lblFileUpload.Text = "File name: " +
						FileUpload1.PostedFile.FileName + "<br>" +
						FileUpload1.PostedFile.ContentLength + " kb<br>" +
						"Content type: " +
						FileUpload1.PostedFile.ContentType;

					string filepathname = FilePath + @"\" + FileUpload1.FileName;

					InsertTableInfo_Submit("foo", "foo");

					processTAB("foo", filepathname, FileUpload1.FileName);

				}
				catch (Exception ex)
				{
					lblFileUpload.Text = "ERROR: " + ex.Message.ToString();
				}
			}
			else
			{
				lblFileUpload.Text = "Only .xlsx files allowed!";
			}
		}
		else
		{
			lblFileUpload.Text = "You have not specified a file.";
		}
	}



	protected void processTAB(string tablename, string filename, string filenameonly)
	{
		//if (FileUpload1.HasFile)   //Upload file here
		//{
		//    string fileExt = System.IO.Path.GetExtension(FileUpload1.FileName);  //Get extension
		//    if (fileExt == ".txt")   //check to see if its a .csv file
		//    {
		//        FileUpload1.SaveAs("C:\\FolderName\\" + FileUpload1.FileName);        //save file to the specified folder


		OleDbConnection oconn = new OleDbConnection(String.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0}; Extended Properties='text; HDR=Yes; FMT=Delimited'", filename));   //string connection for .CSV     OR Text file

		try
		{
			OleDbCommand ocmd = new OleDbCommand("SELECT * FROM [" + FileUpload1.FileName + "]", oconn);
			//Select statement, if your using .CSV...put the name of the file NOT the excel tab

			oconn.Open();

			OleDbDataReader odr = ocmd.ExecuteReader();

			string FieldName = "";
			string DataType = "";
			int DataTypeLength = -98765;
			string FieldLabel = "";
			int MinVal = -98765;
			int MaxVal = -98765;
			string ValidList = "";
			string MissVal = "";
			int ValueSetID = -98765;


			while (odr.Read())
			{

				FieldName = valid_str(odr, 0);     //Call the valid method...see below
				DataType = valid_str(odr, 1);
				DataTypeLength = valid_int(odr, 2);
				FieldLabel = valid_str(odr, 3);
				MinVal = valid_int(odr, 4);
				MaxVal = valid_int(odr, 5);
				ValidList = valid_str(odr, 6);
				MissVal = valid_str(odr, 7);

				//TOFIX
				InsertInto_datFieldInfo(tablename, FieldName, DataType, DataTypeLength, FieldLabel, MinVal, MaxVal, ValidList, MissVal);  //Call the InsertDataIntoSql method...see below

				FileUpload1.Dispose();  //Dispose the file
			}

			oconn.Close();   //Close connection
		}

		catch (Exception ee)
		{
			lblX.Text = ee.Message;
			lblX.ForeColor = System.Drawing.Color.Red;
		}
		finally
		{
			lblX.Text = "Data Inserted Successfully";
			lblX.ForeColor = System.Drawing.Color.Green;

		}

	}


	protected string valid_str(OleDbDataReader myreader, int stval)  //this method checks for null values in the .CSV file, if there are null replace them with 0
	{
		object val = myreader[stval];
		if (val != DBNull.Value)
		{
			return val.ToString();
		}
		else
		{
			return Convert.ToString("<NULL>");
		}

	}

	protected int valid_int(OleDbDataReader myreader, int stval)  //this method checks for null values in the .CSV file, if there are null replace them with 0
	{
		object val = myreader[stval];
		if (val != DBNull.Value)
		{
			return Convert.ToInt32(val.ToString());
		}
		else
		{
			return -98765;
		}

	}

	//TOFIX
	public void InsertInto_datFieldInfo(string tablename, string FieldName, string DataType, int DataTypeLength, string FieldLabel, int MinVal, int MaxVal, string ValidList, string MissVal) //method to insert data into database
	{
		SqlConnection conn = new SqlConnection("Server=ServerAddress; Database=MyDatabaseName; Trusted_Connection=True");                        //SQL connection
		SqlCommand cmd = new SqlCommand();                           //SQL command
		cmd.CommandType = System.Data.CommandType.Text;
		cmd.Connection = oConnData;
		if (oConnData.State == ConnectionState.Closed) oConnData.Open();

		//TOFIX
		cmd.CommandText = "USE [MyDataBase] INSERT INTO datFieldInfo(databasetable , databasefield ,fieldDataType,fieldDataTypeLength,FieldLabel,MinVal,MaxVal,ValidList,MissVal) " +
			"VALUES(@FieldName, @DataType, @DataTypeLength, @FieldLabel, @MinVal, @MaxVal, @ValidList, @MissVal)";

		cmd.Parameters.Add("@tablename", System.Data.SqlDbType.VarChar).Value = tablename;
		cmd.Parameters.Add("@FieldName", System.Data.SqlDbType.VarChar).Value = FieldName;
		cmd.Parameters.Add("@DataType", System.Data.SqlDbType.VarChar).Value = DataType;
		cmd.Parameters.Add("@DataTypeLength", System.Data.SqlDbType.Int).Value = DataTypeLength;
		cmd.Parameters.Add("@FieldLabel", System.Data.SqlDbType.VarChar).Value = FieldLabel;
		cmd.Parameters.Add("@MinVal", System.Data.SqlDbType.Int).Value = MinVal;
		cmd.Parameters.Add("@MaxVal", System.Data.SqlDbType.Int).Value = MaxVal;
		cmd.Parameters.Add("@ValidList", System.Data.SqlDbType.VarChar).Value = ValidList;
		cmd.Parameters.Add("@MissVal", System.Data.SqlDbType.VarChar).Value = MissVal;
		cmd.ExecuteNonQuery();

		//TOFIX
		cmd.CommandText = "USE [MyDataBase] INSERT INTO datFieldInfo(databasetable , databasefield ,fieldDataType,fieldDataTypeLength,FieldLabel,MinVal,MaxVal,ValidList,MissVal) " +
			"VALUES(@FieldName, @DataType, @DataTypeLength, @FieldLabel, @MinVal, @MaxVal, @ValidList, @MissVal)";

		cmd.Parameters.Add("@tablename", System.Data.SqlDbType.VarChar).Value = tablename;
		cmd.Parameters.Add("@FieldName", System.Data.SqlDbType.VarChar).Value = FieldName;
		cmd.Parameters.Add("@DataType", System.Data.SqlDbType.VarChar).Value = DataType;
		cmd.Parameters.Add("@DataTypeLength", System.Data.SqlDbType.Int).Value = DataTypeLength;
		cmd.Parameters.Add("@FieldLabel", System.Data.SqlDbType.VarChar).Value = FieldLabel;
		cmd.Parameters.Add("@MinVal", System.Data.SqlDbType.Int).Value = MinVal;
		cmd.Parameters.Add("@MaxVal", System.Data.SqlDbType.Int).Value = MaxVal;
		cmd.Parameters.Add("@ValidList", System.Data.SqlDbType.VarChar).Value = ValidList;
		cmd.Parameters.Add("@MissVal", System.Data.SqlDbType.VarChar).Value = MissVal;
		cmd.ExecuteNonQuery();
		oConnData.Close();

	}
	#endregion




	//protected void LinkMeasureToTable(object sender, EventArgs e)
	//{
	//    try
	//    {
	//        int tableID = Convert.ToInt16(ddl_AllTablesToLink.SelectedValue);
	//        if (tableID > 0)
	//        {
	//            string mycmd = "insert into uwautism_research_data..datTable_Measure (measureID, tableID) values (" + lbl_measureID.Text + ", " + tableID.ToString() + ")";

	//            LogToPageUrgent(mycmd);

	//            SqlCommand cmd = new SqlCommand(mycmd, oConn);
	//            cmd.ExecuteNonQuery();
	//        }
	//    }
	//    catch (Exception) 
	//    {

	//    }



	//}




	#region ******************** Utilities ********************
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

			lblMyInfo.Text = text.Replace("Warning: Null value is eliminated by an aggregate or other SET operation.", "");
			lblMyError.Text = "";
		}
	}

	private void ClearErrorLog()
	{
		lblMyError.Text = "";
		lblMyInfo.Text = "";
		//tblmyerror.Rows[0].Cells[0].InnerHtml = "";
	}
	#endregion


}


/*
 *  to do: make a Measure Library page.  spStudyDesign__MeasureList
 * */
