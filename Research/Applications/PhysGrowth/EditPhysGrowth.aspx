<%@ Import namespace="System.Drawing" %>
<%@ Import namespace="System.Configuration" %>
<%@ Import namespace="System.Data.Common" %>
<%@ Import namespace="System.Data.SqlClient" %>
<%@ Import namespace="System.Data" %>
<%@ Page language="C#"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<script runat="server">

protected SqlConnection conn = new SqlConnection();
protected SqlCommand cmd = new SqlCommand();

protected enum FormStates
{
	Adding_Entering,
	Adding_Success,
	Adding_ValidationError,
	Editing_Loading,
	Editing_LoadingError,
	Editing_Entering,
	Editing_Success,
	Editing_ValidationError,
	Verifying_Entering,
	Verifying_Success,
	Verifying_ValidationError,
	Verifying_VerificationError_DataMismatch,
	Verifying_VerificationError_DataMissing
}

protected enum VerifyResult
{
	Success = 0,
	VerificationError_DataMismatch = 1,
	VerificationError_DataMissing = 2,
	ValidationError = 3,
	UnknownError = 4
	
}

protected enum FormEvents
{
	Form_Load,
	Button_Click
}


protected int StudyID
{
	get {return int.Parse(lbStudyID.SelectedValue);}
	set {lbStudyID.SelectedValue = value.ToString(); }
}	

protected string SubjectID
{
	get {return txtID.Text.Trim().ToUpper(); }
	set {txtID.Text = value.Trim().ToUpper();}
}


// save PK in formstate so it's available across posts
protected int PK
{
	get {return (ViewState["_pk"] == null)?-1:(int)ViewState["_pk"]; }
	set {ViewState["_pk"] = value; }
}


// save formstate in viewstate so it's persisted across posts
protected FormStates FormState
{
	get {return (FormStates)this.ViewState["_formstate"]; }
	set {ViewState["_formstate"] = value;}
}


protected void Page_Load(object sender, EventArgs e)
{
	try {
		conn = new SqlConnection();
		conn.ConnectionString = ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"];	
		cmd.Connection = conn;

		if (!IsPostBack)	
		{
			// save link back to referrer if available
			if (Request.UrlReferrer != null)
			{
				hlBack.Visible = true;
				hlBack.NavigateUrl = Request.UrlReferrer.AbsoluteUri;
			}
			else
				hlBack.Visible = false;
			
			// fill studyid and source list boxes
			SetupListBoxes();
		
			//add attributes that make enter key work like tab key
			txtDatadate.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
			lbDatatype.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
			txtData1.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
			txtData2.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
            txtData3.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;"); 
            txtNotes.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
			lbSourceID.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
			lbStudyID.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
			txtID.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");


			// set initial form state based on querystring
			if (Request["mode"] == "edit")
			{
				// its an error unless pk and datatype also supplied
				if (Request["pk"] == null || Request["datatype"] == null)
					throw new Exception("Bad querystring.");
				else
					FormState = FormStates.Editing_Loading;
			}
			else if (Request["mode"] == "verify")
				FormState = FormStates.Verifying_Entering;
			else
				FormState = FormStates.Adding_Entering;
			

			// set value of studyid and id controls if passed in querystring
			if (Request["studyid"] != null) lbStudyID.SelectedValue = Request["studyid"];
			if (Request["id"] != null) txtID.Text = Request["id"].ToUpper();

			// do form_load controller event
			Controller(FormEvents.Form_Load);
		}
	}
	catch (Exception ex)
	{
			pnlMain.Visible = false;
			lblError.ForeColor = Color.Red;
			lblError.Text = ex.Message;
			lblError.Visible = true;			
	}
	
}

private void SetupListBoxes()
{	
	try {
		string sql =  "select distinct s.studyID, s.studyname from uwautism_research_backend..tblStudyMeas sm, uwautism_research_backend..tblStudy s where s.studyID not in (1027,1028) AND ((sm.studyID = s.studyID AND sm.measureID = 181) OR (sm.studyID = s.studyID AND sm.measureID = 151 ) OR (sm.studyID = s.studyID AND sm.measureID = 86 ) OR (s.studyID in (1,1008)) ) union all select -1, '-None-' order by s.studyname; ";
		sql += "select sourceid, source from Data_PhysGrowthSource order by source; ";
		cmd.CommandText = sql;
	
		cmd.CommandType = CommandType.Text;
		cmd.Parameters.Clear();
		conn.Open();
		SqlDataReader r = cmd.ExecuteReader();
		lbStudyID.DataTextField = "studyname";
		lbStudyID.DataValueField = "studyid";
		lbStudyID.DataSource = r;
		lbStudyID.DataBind();
		lbStudyID.SelectedValue = "-1";
		
		r.NextResult();
		lbSourceID.DataTextField = "source";
		lbSourceID.DataValueField = "sourceid";
		lbSourceID.DataSource = r;
		lbSourceID.DataBind();
		lbSourceID.SelectedIndex = -1; //nothing initially selected
	}
	catch {}
	finally
	{
		if (conn != null) conn.Close();
	}
}


protected void Controller(FormEvents formEvent)
{
	switch (formEvent)
	{
		case FormEvents.Form_Load:
			if (FormState == FormStates.Editing_Loading)
			{
				if (DoLookup())
					FormState = FormStates.Editing_Entering;
				else
					FormState = FormStates.Editing_LoadingError;
			}	
			break;
			
		case FormEvents.Button_Click:
			switch (FormState)
			{
				case FormStates.Adding_Entering:
				case FormStates.Adding_Success:
				case FormStates.Adding_ValidationError:
					if (DoInsert())
						FormState = FormStates.Adding_Success;
					else
						FormState = FormStates.Adding_ValidationError;
						
					break;
						
				case FormStates.Editing_Entering:
				case FormStates.Editing_ValidationError:
				case FormStates.Editing_Success:
					if (DoSave())
						FormState = FormStates.Editing_Success;
					else
						FormState = FormStates.Editing_ValidationError;

					break;

				case FormStates.Verifying_Entering:
				case FormStates.Verifying_Success:
				case FormStates.Verifying_ValidationError:
				case FormStates.Verifying_VerificationError_DataMissing:
					switch (DoVerify())
					{
						case VerifyResult.Success:
							FormState = FormStates.Verifying_Success;
							break;
							
						case VerifyResult.UnknownError:
							FormState = FormStates.Verifying_ValidationError;
							break;

						case VerifyResult.ValidationError:
							FormState = FormStates.Verifying_ValidationError;
							break;

						case VerifyResult.VerificationError_DataMismatch:
							FormState = FormStates.Verifying_VerificationError_DataMismatch;
							break;

						case VerifyResult.VerificationError_DataMissing:
							FormState = FormStates.Verifying_VerificationError_DataMissing;
							break;
					}	

					break;			


				case FormStates.Verifying_VerificationError_DataMismatch:
					// user must have selected a verify option or else send them back here
					if (rblVerifyOptions.SelectedIndex == -1)
					{
						lblError.Text = "Select option 1, 2, or 3!";
						FormState = FormStates.Verifying_VerificationError_DataMismatch;						
					}
					else
					{
						if (rblVerifyOptions.SelectedValue == "1")
						{	//keep existing
							if (!UpdateVerifiedField())
								// something unexpected happened
								FormState = FormStates.Verifying_VerificationError_DataMismatch;						
							else
								FormState = FormStates.Verifying_Success;						
								
						
						}
						else if (rblVerifyOptions.SelectedValue == "2")
						{	// use new
							if (!SaveVerified())
								FormState = FormStates.Verifying_VerificationError_DataMismatch;						
							else
								FormState = FormStates.Verifying_Success;						
								
								
						}
						else if (rblVerifyOptions.SelectedValue == "3")
							// keep editing
							FormState = FormStates.Verifying_Entering;
						
						
						
						
					}
					break;


			} // end switch(FormState)
			
			break;
			
	}// end switch(formEvent)
			
	SetupForm();
}

protected void btnButton_Click(object sender, EventArgs e)
{
	Controller(FormEvents.Button_Click);
}


protected void SetupForm()
{
	switch (FormState)
	{
		case FormStates.Editing_LoadingError:
			pnlMain.Visible = false;
			lblError.ForeColor = Color.Red;
			lblError.Visible = true;

			break;
			


		case FormStates.Editing_Entering:
			pnlMain.Visible = true;
			EnableDisplay(true);
			pnlVerifyError_DataMismatch.Visible = false;
			btnButton.Text = "Save";
			lblError.Visible = false;
			lblError.Text = String.Empty;
			lbDatatype.Enabled = false;
			lbStudyID.Enabled = false;
			txtID.Enabled = false;
			txtDatadate.Enabled = true;
			txtNotes.Enabled = true;
			lbSourceID.Enabled = true;
			txtData1.Enabled = true;
			txtData2.Enabled = true;
			txtData3.Enabled = true;
            txtValidity.Enabled = true;
			pnlNotes.Visible = true;
			
			break;

		case FormStates.Editing_Loading:
		case FormStates.Adding_Entering:
			pnlMain.Visible = true;
			EnableDisplay(true);
			pnlVerifyError_DataMismatch.Visible = false;
			btnButton.Text = "Save";
			lblError.Visible = false;
			lblError.Text = String.Empty;
			lbStudyID.Enabled = true;
			txtID.Enabled = true;
			txtDatadate.Enabled = true;
			txtNotes.Enabled = true;
			lbSourceID.Enabled = true;
			txtData1.Enabled = true;
			txtData2.Enabled = true;
			txtData3.Enabled = true;
            txtValidity.Enabled = true;
			pnlNotes.Visible = true;

			break;


		case FormStates.Editing_Success:
			pnlMain.Visible = true;
			EnableDisplay(true);
			pnlVerifyError_DataMismatch.Visible = false;
			btnButton.Text = "Save";
			lblError.Visible = true;
			lblError.ForeColor = Color.Blue;
			lbDatatype.Enabled = false;
			lbStudyID.Enabled = false;
			txtID.Enabled = false;
			txtDatadate.Enabled = true;
			txtNotes.Enabled = true;
			lbSourceID.Enabled = true;
			txtData1.Enabled = true;
			txtData2.Enabled = true;
			txtData3.Enabled = true;
			txtValidity.Enabled = true;
			pnlNotes.Visible = true;

			break;


		case FormStates.Editing_ValidationError:
			pnlMain.Visible = true;
			EnableDisplay(true);
			pnlVerifyError_DataMismatch.Visible = false;
			btnButton.Text = "Save";
			lblError.Visible = true;
			lblError.ForeColor = Color.Red;
			lbDatatype.Enabled = false;
			lbStudyID.Enabled = false;
			txtID.Enabled = false;
			txtDatadate.Enabled = true;
			txtNotes.Enabled = true;
			lbSourceID.Enabled = true;
			txtData1.Enabled = true;
			txtData2.Enabled = true;
			txtData3.Enabled = true;
			txtValidity.Enabled = true;
			pnlNotes.Visible = true;

			break;

		case FormStates.Adding_Success:
			pnlMain.Visible = true;
			EnableDisplay(true);
			pnlVerifyError_DataMismatch.Visible = false;
			btnButton.Text = "Save";
			lblError.Visible = true;
			lblError.ForeColor = Color.Blue;
			lbDatatype.Enabled = true;
			lbStudyID.Enabled = true;
			txtID.Enabled = true;
			txtDatadate.Enabled = true;
			txtNotes.Enabled = true;
			lbSourceID.Enabled = true;
			txtData1.Enabled = true;
			txtData2.Enabled = true;
			txtData3.Enabled = true;
			txtValidity.Enabled = true;
			pnlNotes.Visible = true;
			
			//clear controls
			lbSourceID.SelectedIndex = -1;
			txtDatadate.Text = String.Empty;
			lbDatatype.SelectedIndex = -1;
			txtData1.Text = String.Empty;
			txtData2.Text = String.Empty;
			txtData3.Text = String.Empty;
            txtValidity.Text = String.Empty;
			txtNotes.Text = String.Empty;

			break;

		case FormStates.Adding_ValidationError:
			pnlMain.Visible = true;
			EnableDisplay(true);
			pnlVerifyError_DataMismatch.Visible = false;
			btnButton.Text = "Save";
			lblError.Visible = true;
			lblError.ForeColor = Color.Red;
			lbDatatype.Enabled = true;
			lbStudyID.Enabled = true;
			txtID.Enabled = true;
			txtDatadate.Enabled = true;
			txtNotes.Enabled = true;
			lbSourceID.Enabled = true;
			txtData1.Enabled = true;
			txtData2.Enabled = true;
			txtData3.Enabled = true;
			txtValidity.Enabled = true;
			pnlNotes.Visible = true;

			break;
		
		case FormStates.Verifying_Entering:
			pnlMain.Visible = true;
			EnableDisplay(true);
			pnlVerifyError_DataMismatch.Visible = false;
			btnButton.Text = "Verify";
			lblError.Visible = false;
			lblError.Text = String.Empty;
			lbDatatype.Enabled = true;
			lbStudyID.Enabled = true;
			txtID.Enabled = true;
			txtDatadate.Enabled = true;
			txtNotes.Enabled = false;
			lbSourceID.Enabled = true;
			txtData1.Enabled = true;
			txtData2.Enabled = true;
			txtData3.Enabled = true;
            txtValidity.Enabled = true;
			pnlNotes.Visible = false;

			break;
			
		case FormStates.Verifying_Success:
			pnlMain.Visible = true;
			EnableDisplay(true);
			pnlVerifyError_DataMismatch.Visible = false;
			btnButton.Text = "Verify";
			lblError.Visible = true;
			lblError.ForeColor = Color.Blue;
			lbDatatype.Enabled = true;
			lbStudyID.Enabled = true;
			txtID.Enabled = true;
			txtDatadate.Enabled = true;
			txtNotes.Enabled = false;
			lbSourceID.Enabled = true;
			txtData1.Enabled = true;
			txtData2.Enabled = true;
			txtData3.Enabled = true;
			txtValidity.Enabled = true;
			pnlNotes.Visible = false;
			
			//clear controls
			lbSourceID.SelectedIndex = -1;
			txtDatadate.Text = String.Empty;
			lbDatatype.SelectedIndex = -1;
			txtData1.Text = String.Empty;
			txtData2.Text = String.Empty;
			txtData3.Text = String.Empty;
            txtValidity.Text = String.Empty;

			break;
		

		case FormStates.Verifying_ValidationError:
			pnlMain.Visible = true;
			EnableDisplay(true);
			pnlVerifyError_DataMismatch.Visible = false;
			btnButton.Text = "Verify";
			lblError.Visible = true;
			lblError.ForeColor = Color.Red;
			lbDatatype.Enabled = true;
			lbStudyID.Enabled = true;
			txtDatadate.Enabled = true;
			txtID.Enabled = true;
			txtNotes.Enabled = false;
			lbSourceID.Enabled = true;
			txtData1.Enabled = true;
			txtData2.Enabled = true;
            txtData3.Enabled = true;            
			txtValidity.Enabled = true;
			pnlNotes.Visible = false;

			break;

		case FormStates.Verifying_VerificationError_DataMismatch:
			pnlMain.Visible = true;
			EnableDisplay(true);
			pnlVerifyError_DataMismatch.Visible = true;
			rblVerifyOptions.SelectedIndex = -1;
			btnButton.Text = "Verify";
			lblError.Visible = true;
			lblError.ForeColor = Color.Red;
			lbDatatype.Enabled = false;
			lbStudyID.Enabled = false;
			txtID.Enabled = false;
			txtDatadate.Enabled = false;
			txtNotes.Enabled = false;
			lbSourceID.Enabled = false;
			txtData1.Enabled = false;
			txtData2.Enabled = false;
			txtData3.Enabled = false;
			txtValidity.Enabled = false;
			pnlNotes.Visible = false;

			break;
		
		case FormStates.Verifying_VerificationError_DataMissing:
			pnlMain.Visible = true;
			EnableDisplay(true);
			pnlVerifyError_DataMismatch.Visible = false;
			btnButton.Text = "Verify";
			lblError.Visible = true;
			lblError.ForeColor = Color.Red;
			lbDatatype.Enabled = true;
			lbStudyID.Enabled = true;
			txtID.Enabled = true;
			txtDatadate.Enabled = true;
			txtNotes.Enabled = false;
			lbSourceID.Enabled = true;
			txtData1.Enabled = true;
			txtData2.Enabled = true;
			txtData3.Enabled = true;
            txtValidity.Enabled = true;
			pnlNotes.Visible = false;
			
			break;


	}
	
}

protected void EnableDisplay(bool enabled)
{
	pnlDisplay.Enabled = enabled;
	txtDatadate.Enabled = enabled;
	lbDatatype.Enabled = enabled;
	txtData1.Enabled = enabled;
	txtData2.Enabled = enabled;
    txtData3.Enabled = enabled; 
    txtValidity.Enabled = enabled;
	txtNotes.Enabled = enabled;
	lbSourceID.Enabled = enabled;
}

protected bool UpdateVerifiedField()
{
	bool result = true;
	try 
	{
		cmd.CommandText = "dbo.[spPhysGrowthSetVerified]";
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@id", System.Data.SqlDbType.VarChar, 50));
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datadate", System.Data.SqlDbType.DateTime, 8));
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datatype", System.Data.SqlDbType.VarChar, 2));
		
		cmd.Parameters["@studyid"].Value = StudyID;
		cmd.Parameters["@ID"].Value = SubjectID;
		cmd.Parameters["@datadate"].Value = txtDatadate.Text;
		cmd.Parameters["@datatype"].Value = lbDatatype.SelectedValue;
		
		conn.Open();
		cmd.ExecuteNonQuery();
					
	}
	catch (Exception e)
	{
		lblError.Text = e.Message;
		result = false;
	}
	finally
	{
		if (conn != null) conn.Close();
	}
	
	if (result) lblError.Text = "Update successful.";
	return result;		

}

protected bool SaveVerified()
{
	bool result = true;
	try 
	{
		cmd.CommandText = "dbo.[spPhysGrowthSaveVerified]";
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ID", System.Data.SqlDbType.VarChar, 50));
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datadate", System.Data.SqlDbType.DateTime, 8));
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data1", System.Data.SqlDbType.Float, 8));
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data2", System.Data.SqlDbType.Float, 8));
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data3", System.Data.SqlDbType.Float, 8)); 
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@validity", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sourceID", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datatype", System.Data.SqlDbType.VarChar, 2));
		
		cmd.Parameters["@studyid"].Value = StudyID;
		cmd.Parameters["@ID"].Value = SubjectID;
		cmd.Parameters["@datadate"].Value = txtDatadate.Text;
		cmd.Parameters["@data1"].Value = txtData1.Text;
		cmd.Parameters["@data2"].Value = txtData2.Text;
        cmd.Parameters["@data3"].Value = txtData3.Text; 
        cmd.Parameters["@validity"].Value = txtValidity.Text;
		cmd.Parameters["@sourceID"].Value = lbSourceID.SelectedValue;
		cmd.Parameters["@datatype"].Value = lbDatatype.SelectedValue;
		
		if (txtData1.Text.Trim() == String.Empty) cmd.Parameters["@data1"].Value = DBNull.Value;
		if (txtData2.Text.Trim() == String.Empty) cmd.Parameters["@data2"].Value = DBNull.Value;
        if (txtData3.Text.Trim() == String.Empty) cmd.Parameters["@data3"].Value = DBNull.Value;
        		
		conn.Open();
		cmd.ExecuteNonQuery();
					
	}
	catch (Exception e)
	{
		lblError.Text = e.Message;
		result = false;
	}
	finally
	{
		if (conn != null) conn.Close();
	}
	
	if (result) lblError.Text = "Update successful.";
	return result;		
}


protected bool DoSave()
{
	bool result = true;
	try 
	{
		if (!Validate())
			result = false;
		else
		{
			cmd.CommandText = "dbo.[spPhysGrowthUpdateByPK]";
			cmd.CommandType = System.Data.CommandType.StoredProcedure;
			cmd.Parameters.Clear();
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pk", System.Data.SqlDbType.Int, 4));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datadate", System.Data.SqlDbType.DateTime, 8));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data1", System.Data.SqlDbType.Float, 8));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data2", System.Data.SqlDbType.Float, 8));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data3", System.Data.SqlDbType.Float, 8)); 
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@validity", System.Data.SqlDbType.Int, 4));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@notes", System.Data.SqlDbType.VarChar, 250));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sourceID", System.Data.SqlDbType.Int, 4));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datatype", System.Data.SqlDbType.VarChar, 2));
			
			cmd.Parameters["@pk"].Value = PK;
			cmd.Parameters["@datadate"].Value = txtDatadate.Text;
			cmd.Parameters["@data1"].Value = txtData1.Text;
			cmd.Parameters["@data2"].Value = txtData2.Text;
            cmd.Parameters["@data3"].Value = txtData3.Text;
            cmd.Parameters["@validity"].Value = txtValidity.Text;
			cmd.Parameters["@notes"].Value = txtNotes.Text;
			cmd.Parameters["@sourceID"].Value = lbSourceID.SelectedValue;
			cmd.Parameters["@datatype"].Value = lbDatatype.SelectedValue;
			
			if (txtData1.Text.Trim() == String.Empty) cmd.Parameters["@data1"].Value = DBNull.Value;
            if (txtData2.Text.Trim() == String.Empty) cmd.Parameters["@data2"].Value = DBNull.Value; 
            if (txtData3.Text.Trim() == String.Empty) cmd.Parameters["@data3"].Value = DBNull.Value;
			if (txtNotes.Text.Trim() == String.Empty) cmd.Parameters["@notes"].Value = DBNull.Value;
			
			conn.Open();
			cmd.ExecuteNonQuery();
		}
					
	}
	catch (Exception e)
	{
		lblError.Text = e.Message;
		result = false;
	}
	finally
	{
		if (conn != null) conn.Close();
	}
	
	if (result) lblError.Text = "Save successful.";
	return result;		
}


protected bool DoLookup()
{
	bool result = true;
	try 
	{
		cmd.CommandText = "dbo.[spPhysGrowthGetByPK]";
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datatype", System.Data.SqlDbType.VarChar, 2));
		cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pk", System.Data.SqlDbType.Int, 4));

		cmd.Parameters["@datatype"].Value = Request["datatype"];
		cmd.Parameters["@pk"].Value = Request["pk"];
		
		conn.Open();
		
		SqlDataReader r = cmd.ExecuteReader();
		if (!r.HasRows)	
			throw new Exception("Record not found.");
		else
		{
			r.Read();
			lbStudyID.SelectedValue = r["studyid"].ToString();
			txtID.Text = r["id"].ToString();
			lbSourceID.SelectedValue = r["sourceID"].ToString();			
			txtDatadate.Text = String.Format("{0:d}", r["datadate"]);
			lbDatatype.SelectedValue = r["datatype"].ToString();
			txtData1.Text = r["data1"].ToString();
			txtData2.Text = r["data2"].ToString();
            txtData3.Text = r["data3"].ToString();
            txtValidity.Text = r["validity"].ToString();
			txtNotes.Text = r["notes"].ToString();
			
			// save PK
			PK = int.Parse(Request["pk"]);
		}
		
	}
	catch (Exception e)
	{
		lblError.Text = e.Message;
		result = false;
	}		
	finally
	{
		if (conn != null) conn.Close();
	}
	
	return result;
}

protected bool DoInsert()
{
	bool result = true;
	if (!Validate())
		result = false;
	else
	{
		try {
			cmd.CommandText = "spPhysGrowthInsert";
			cmd.CommandType = CommandType.StoredProcedure;

			cmd.Parameters.Clear();
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ID", System.Data.SqlDbType.VarChar, 50));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datadate", System.Data.SqlDbType.DateTime, 8));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data1", System.Data.SqlDbType.Float, 8));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data2", System.Data.SqlDbType.Float, 8));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data3", System.Data.SqlDbType.Float, 8)); 
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@validity", System.Data.SqlDbType.Int, 4));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@notes", System.Data.SqlDbType.VarChar, 250));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sourceID", System.Data.SqlDbType.Int, 4));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datatype", System.Data.SqlDbType.VarChar, 2));	

			cmd.Parameters["@studyid"].Value = StudyID;
			cmd.Parameters["@ID"].Value = SubjectID;
			cmd.Parameters["@datadate"].Value = txtDatadate.Text;
			cmd.Parameters["@data1"].Value = txtData1.Text;
			cmd.Parameters["@data2"].Value = txtData2.Text;
            cmd.Parameters["@data3"].Value = txtData3.Text;
            cmd.Parameters["@validity"].Value = txtValidity.Text;
			cmd.Parameters["@notes"].Value = txtNotes.Text;
			cmd.Parameters["@sourceID"].Value = lbSourceID.SelectedValue;
			cmd.Parameters["@datatype"].Value = lbDatatype.SelectedValue;
			
			if (txtData1.Text.Trim() == String.Empty) cmd.Parameters["@data1"].Value = DBNull.Value;
			if (txtData2.Text.Trim() == String.Empty) cmd.Parameters["@data2"].Value = DBNull.Value;
            if (txtData3.Text.Trim() == String.Empty) cmd.Parameters["@data3"].Value = DBNull.Value;
            if (txtNotes.Text.Trim() == String.Empty) cmd.Parameters["@notes"].Value = DBNull.Value;
			
			conn.Open();
			cmd.ExecuteNonQuery();
			}
		catch (SqlException exsql)
		{
			//if number = 2627 then violation of unique constraint on studyid, id, datadate in height, weight, or ofc table
			if (exsql.Number == 2627)
			{
				string measure = string.Empty;
				switch (lbDatatype.SelectedValue)
				{
					case "hc":
						measure = "head circumference";
						break;
					case "ht":
						measure = "height";
						break;
					case "wt":
						measure = "weight";
						break;
				}
				string serr = string.Format(SubjectID.ToUpper() + " already has " + measure + " data for {0:d}", DateTime.Parse(txtDatadate.Text));
				lblError.Text = serr;
				result = false;
			}
			else
			{
				lblError.Text = exsql.Message;
				result = false;
			}
		}	
		catch (Exception ex)
		{
			lblError.Text = ex.Message;
			result = false;
		}
		finally
		{
			if (conn != null) conn.Close();
		}		
	}

	if (result) lblError.Text = "Insert successful.";
	
	return result;

}

protected VerifyResult DoVerify()
{
	if (!Validate())
		return VerifyResult.ValidationError;
	else
	{	//verify
		VerifyResult result = VerifyResult.Success;
		try
		{
		
			cmd.CommandText = "dbo.[spPhysGrowthVerify]";
			cmd.CommandType = System.Data.CommandType.StoredProcedure;
			cmd.Parameters.Clear();
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyID", System.Data.SqlDbType.Int, 4));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ID", System.Data.SqlDbType.VarChar, 50));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datadate", System.Data.SqlDbType.DateTime, 8));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data1", System.Data.SqlDbType.Float, 8));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data2", System.Data.SqlDbType.Float, 8));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@data3", System.Data.SqlDbType.Float, 8));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@validity", System.Data.SqlDbType.Int, 4));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sourceID", System.Data.SqlDbType.Int, 4));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datatype", System.Data.SqlDbType.VarChar, 2));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@errmsg", System.Data.SqlDbType.VarChar, 400, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));

			cmd.Parameters["@studyid"].Value = StudyID;
			cmd.Parameters["@ID"].Value = SubjectID;
			cmd.Parameters["@datadate"].Value = txtDatadate.Text;
			cmd.Parameters["@data1"].Value = txtData1.Text;
			cmd.Parameters["@data2"].Value = txtData2.Text;
            cmd.Parameters["@data3"].Value = txtData3.Text;
            cmd.Parameters["@validity"].Value = txtValidity.Text;
			cmd.Parameters["@sourceID"].Value = lbSourceID.SelectedValue;
			cmd.Parameters["@datatype"].Value = lbDatatype.SelectedValue;
			
			if (txtData1.Text.Trim() == String.Empty) cmd.Parameters["@data1"].Value = DBNull.Value;
			if (txtData2.Text.Trim() == String.Empty) cmd.Parameters["@data2"].Value = DBNull.Value;
            if (txtData3.Text.Trim() == String.Empty) cmd.Parameters["@data3"].Value = DBNull.Value;

			conn.Open();
			cmd.ExecuteNonQuery();
			
			result = (VerifyResult)cmd.Parameters["@RETURN_VALUE"].Value;
			
			if (result == VerifyResult.VerificationError_DataMismatch)
				lblVerifyError.Text = cmd.Parameters["@errmsg"].Value.ToString();
			else if (result == VerifyResult.VerificationError_DataMissing)
				lblError.Text = cmd.Parameters["@errmsg"].Value.ToString();
	
		}
		catch (Exception e)
		{
			lblError.Text = e.Message;
			result = VerifyResult.UnknownError;
		}
		finally
		{
			if (conn != null) conn.Close();
		}

		if (result == VerifyResult.Success) lblError.Text = "Verification successful.";		
		return result;	
				
	}
}


protected bool DateValid(string date)
{	
	DateTime test = DateTime.MinValue;
	try {
			test = DateTime.Parse(date);
		}
	catch {}
	return (DateTime.Compare(DateTime.Parse("1/1/1910"), test) < 0);
}

protected bool FloatValid(string fstring)
{
	float ftest = -1;
	try
	{
		ftest = float.Parse(fstring);
	}
	catch {}
	return (ftest >= 0);
}	

protected bool IntValid(string istring)
{
	int itest = -1;
	try
	{
		itest = int.Parse(istring);
	}
	catch {}
	return (itest >= 0);
}

protected bool Validate()
{
	string err = String.Empty;
	
	
	// study is required
	if (lbStudyID.SelectedIndex < 1)
		err = "Select a study.";
	
	// id required
	else if (txtID.Text.Trim() == String.Empty)
		err = "Subject ID is required.";
	
	//source is required
	else if (lbSourceID.SelectedIndex == -1)
		err = "Select a source.";
	//date date is required
	else if (txtDatadate.Text.Trim() == String.Empty)
		err = "Data Date is required.";
	else if (!DateValid(txtDatadate.Text))
		err = "Invalid data date.";

	
	//measurement is required
	else if (lbDatatype.SelectedIndex == -1)
		err = "Select a measurement type.";

	// data1 or data2 must be supplied
	else if (txtData1.Text.Trim() == String.Empty && txtData2.Text.Trim() == String.Empty)
		err = "Data1 or Data2 are required.";
	else if (txtData1.Text.Trim() != String.Empty && !FloatValid(txtData1.Text))
		err = "Data1 not valid.";
	else if (txtData2.Text.Trim() != String.Empty && !FloatValid(txtData2.Text))
		err = "Data2 not valid.";
    else if (txtData3.Text.Trim() != String.Empty && !FloatValid(txtData3.Text))
        err = "Data3 not valid.";

	//validity is required and must be 1,2, or 3
	else if (txtValidity.Text.Trim() == String.Empty)
		err = "Validity is required.";
	
	else if (!IntValid(txtValidity.Text))
		err = "Validity must be an integer.";
		
	else if (!( int.Parse(txtValidity.Text) == 1 
				|| int.Parse(txtValidity.Text) == 2 
				|| int.Parse(txtValidity.Text) == 3))
		err = "Validity must be 1, 2, or 3";
	
	lblError.Text = err;
	return (err == String.Empty);

}
	</script>
					<h3>Physical Growth Data Entry</h3><asp:HyperLink id="hlBack" Runat="server" Text="Back to Physical Growth Data" /><br>
						<asp:Label ID="lblError" Runat="server" Visible="True" ForeColor="Red" /><br>
						<asp:Panel ID="pnlMain" Runat="server" Visible="False">
						<%-- Panel is used to easily hide/show verify error controls --%>
<table class="layout">
<tr><td><asp:Panel id="pnlVerifyError_DataMismatch" Runat="server" backcolor="LightCyan" >
<asp:Label id="lblVerifyError" ForeColor="red" Runat="server"></asp:Label><BR>What 
      do you want to do? Make a choice of 1, 2, or 3 and click 'verify':<BR>
<asp:RadioButtonList id="rblVerifyOptions" Runat="server">
									<asp:ListItem Value="1">1. Keep current values</asp:ListItem>
									<asp:ListItem Value="2">2. Overwrite with values from below</asp:ListItem>
									<asp:ListItem Value="3">3. Edit the values below</asp:ListItem>
								</asp:RadioButtonList></asp:Panel>
</td></tr></table>
<table class="layout">
<tr><td>Study:</td>
<td><asp:DropDownList id="lbStudyID" Runat="server" DataValueField="studyid" DataTextField="studyname"></asp:DropDownList></td></tr>
 <tr><td>ID:</td><td><asp:TextBox id="txtID" runat="server"></asp:TextBox></td></tr>
 
 <%-- Panel is used to easily enable/disable display controls --%>
<asp:Panel id="pnlDisplay" Runat="server"><tr><td>Source:</td>
<td><asp:ListBox id="lbSourceID" Runat="server" SelectionMode="Single" Rows="3">
								</asp:ListBox></td></tr>
								<tr><td>Data Date:</td>
<td><asp:TextBox id="txtDatadate" Runat="server"></asp:TextBox></td></tr>
<tr><td>Measurement:</td><td>
<asp:ListBox id="lbDatatype" Runat="server" SelectionMode="Single" Rows="3" >
									<asp:ListItem Value="ht">1. Height(cm)</asp:ListItem>
									<asp:ListItem Value="wt">2. Weight(kg)</asp:ListItem>
									<asp:ListItem Value="hc">3. Head Circ.(cm)</asp:ListItem>
								</asp:ListBox></td></tr>
								
<tr><td colspan="2"><b>Convert all data to correct units before entering.</b></td>
<tr><td>Data 1:</td><td><asp:TextBox id="txtData1" Runat="server"></asp:TextBox></td></tr>
<tr><td>Data 2:</td><td><asp:TextBox id="txtData2" Runat="server"></asp:TextBox></td></tr>
<tr><td>Data 3:</td><td><asp:TextBox id="txtData3" Runat="server"></asp:TextBox></td></tr>
<tr><td>Validity:</td><td><asp:TextBox id="txtValidity" Runat="server"></asp:TextBox><br>
1=Valid, 2=Questionable, 3=Invalid</td></tr>
<asp:Panel id="pnlNotes" Runat="server"><tr><td>Notes:</td>
<td><asp:TextBox id="txtNotes" Runat="server" Width="200px" Height="150px" MaxLength="250" TextMode="MultiLine"></asp:TextBox></td></tr></asp:Panel>

</asp:Panel>
</table>

<asp:Button id="btnButton" onclick="btnButton_Click" Runat="server"></asp:Button>
					</asp:Panel>

</asp:Content>