<%@ Import namespace="System.Drawing" %>
<%@ Import namespace="System.Configuration" %>
<%@ Import namespace="System.Data.Common" %>
<%@ Import namespace="System.Data.SqlClient" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="System.Text" %>
<%@ Page language="C#"   MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<script runat="server" language="C#">


protected SqlConnection conn = new SqlConnection();
protected SqlCommand cmd = new SqlCommand();

protected enum FormStates
{
	Adding,
	Adding_Success,
	Adding_Error,
	Editing,
	Editing_Success,
	Editing_Error,
	Lookup_Error
}

protected enum FormEvents
{
	Lookup,
	Save
}

protected FormStates FormState
{
	get {return (FormStates)ViewState["_formState"]; }
	set {ViewState["_formState"] = value;}
}

protected int PK
{
	get {return (int)ViewState["_PK"]; }
	set {ViewState["_PK"] = value;}
}

protected void Page_Load(object sender, EventArgs e)
{
	try {
		
		conn.ConnectionString = ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"];
		cmd.Connection = conn;
	
		if (!IsPostBack)
		{
			Init();
			
			// if PK is passed in querystring then editing, else adding
			if (Request["PK"] != null && Request["PK"] != string.Empty)
			{
				Controller(FormEvents.Lookup);
			}
			else
			{
				FormState = FormStates.Adding;
			}
		}	
		
	}
	catch(Exception ex)
	{
		lblError.Visible = true;
		lblError.Text = ex.Message;
	}


}


protected void Init()
{
	try 
	{
		string sql = "select activityID, cast(activityID as varchar) + ': ' + activity activity from tx_uwtxactivity order by activityID; ";
		sql += "select missid, cast(missid as varchar) + ': ' + missreason missreason from tx_uwtxmissreason order by missid; ";
		
		cmd.CommandText = sql;
		cmd.CommandType = CommandType.Text;
		cmd.Parameters.Clear();

		conn.Open();
		SqlDataReader r = cmd.ExecuteReader();

		cblActivities.DataTextField = "activity";
		cblActivities.DataValueField = "activityID";
		cblActivities.DataSource = r;
		cblActivities.DataBind();
		
		
		r.NextResult();
		
		lbMissID.DataTextField = "missreason";
		lbMissID.DataValueField = "missid";
		lbMissID.DataSource = r;
		lbMissID.DataBind();
		
		//default to N/A
		lbMissID.SelectedValue = "-1";
		
		r.Close();
	}
	catch {throw;}
	finally
	{
		if (conn != null) conn.Close();
	}
}


protected bool DoSave()
{

	bool result = true;

	SqlTransaction tran = null;

	try
	{
	
		conn.Open();
		tran = conn.BeginTransaction();
		cmd.Transaction = tran;
	
		// update existing record and delete any existing activity assignments
		string	sql = "UPDATE TX_UWTXHRS2 ";
		sql += "SET TXID=@TXID, UWHRSdate=@UWHRSdate, UWHRStot=@UWHRStot, UWHRSch=@UWHRSch, UWHRSoth=@UWHRSoth, missID=@missID, UWHRSnotes=@UWHRSnotes ";
		sql += "where uwhrs_id = @uwhrs_id; ";
		sql += "delete from tx_uwtxactivityassignment where uwhrs_id = @uwhrs_id;";
		
		cmd.CommandText = sql;
		cmd.CommandType = CommandType.Text;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@TXID", System.Data.SqlDbType.VarChar, 4));	
		cmd.Parameters.Add(new SqlParameter("@UWHRSdate", System.Data.SqlDbType.DateTime, 8));
		cmd.Parameters.Add(new SqlParameter("@UWHRStot", System.Data.SqlDbType.Float, 8));
		cmd.Parameters.Add(new SqlParameter("@UWHRSch", System.Data.SqlDbType.Float, 8));
		cmd.Parameters.Add(new SqlParameter("@UWHRSoth", System.Data.SqlDbType.Float, 8));
		cmd.Parameters.Add(new SqlParameter("@missID", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new SqlParameter("@uwhrsnotes", System.Data.SqlDbType.VarChar, 500));	
		cmd.Parameters.Add(new SqlParameter("@uwhrs_id", System.Data.SqlDbType.Int, 4));

		cmd.Parameters["@TXID"].Value = "TX" + txtTXID1.Text.Trim();
		cmd.Parameters["@UWHRSdate"].Value = txtDate1.Text;
		cmd.Parameters["@UWHRStot"].Value = txtSession1.Text;
		cmd.Parameters["@UWHRSch"].Value = txtChild1.Text;
		cmd.Parameters["@UWHRSoth"].Value = txtOther1.Text;
		cmd.Parameters["@missID"].Value = int.Parse(lbMissID.SelectedValue);
		cmd.Parameters["@UWHRSnotes"].Value = txtNotes.Text;
		cmd.Parameters["@uwhrs_id"].Value = PK;

		if (txtNotes.Text.Trim() == string.Empty) cmd.Parameters["@UWHRSnotes"].Value = DBNull.Value;

		cmd.ExecuteNonQuery();
		
		//update activites by adding back selected
		cmd.CommandText = "insert into tx_uwtxactivityassignment (uwhrs_id, activityID) values (@uwhrs_id, @activityID) ";
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@uwhrs_id", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new SqlParameter("@activityID", System.Data.SqlDbType.Int, 4));
		cmd.Parameters["@uwhrs_id"].Value = PK;
		
		foreach(ListItem li in cblActivities.Items)
		{
			if (li.Selected)
			{
				cmd.Parameters["@activityID"].Value = int.Parse(li.Value);
				cmd.ExecuteNonQuery();
			}
		}		
		
		tran.Commit();
		
	}
	catch(Exception ex)
	{
		lblError.Text = ex.Message;
		result = false;
		
		try
		{
			tran.Rollback();
		}
		catch {}
	}
	finally
	{
		if (conn != null) conn.Close();
	}	
	
	if (result) lblError.Text = "Save successful.";
	return result;


}

protected bool DoAdd()
{
	bool result = true;
	SqlTransaction tran = null;
	
	try
	{
		conn.Open();
		tran = conn.BeginTransaction();
		cmd.Transaction = tran;
		

		cmd.CommandText = "spTX_InsertUWhrs";
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@TXID", System.Data.SqlDbType.VarChar, 4));	
		cmd.Parameters.Add(new SqlParameter("@UWHRSdate", System.Data.SqlDbType.DateTime, 8));
		cmd.Parameters.Add(new SqlParameter("@UWHRStot", System.Data.SqlDbType.Float, 8));
		cmd.Parameters.Add(new SqlParameter("@UWHRSch", System.Data.SqlDbType.Float, 8));
		cmd.Parameters.Add(new SqlParameter("@UWHRSoth", System.Data.SqlDbType.Float, 8));
		cmd.Parameters.Add(new SqlParameter("@missID", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new SqlParameter("@uwhrsnotes", System.Data.SqlDbType.VarChar, 500));	
		cmd.Parameters.Add(new SqlParameter("@newPK", System.Data.SqlDbType.Int, 4)).Direction = ParameterDirection.Output;
		
		cmd.Parameters["@TXID"].Value = "TX" + txtTXID1.Text.Trim();
		cmd.Parameters["@UWHRSdate"].Value = txtDate1.Text;
		cmd.Parameters["@UWHRStot"].Value = txtSession1.Text;
		cmd.Parameters["@UWHRSch"].Value = txtChild1.Text;
		cmd.Parameters["@UWHRSoth"].Value = txtOther1.Text;
		cmd.Parameters["@missID"].Value = int.Parse(lbMissID.SelectedValue);
		cmd.Parameters["@UWHRSnotes"].Value = txtNotes.Text;
		
		if (txtNotes.Text.Trim() == string.Empty) cmd.Parameters["@UWHRSnotes"].Value = DBNull.Value;

		cmd.ExecuteNonQuery();
		
		int newPK = (int)cmd.Parameters["@newPK"].Value;

		//update activites by adding back selected
		cmd.CommandText = "insert into tx_uwtxactivityassignment (uwhrs_id, activityID) values (@uwhrs_id, @activityID) ";
		cmd.CommandType = CommandType.Text;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@uwhrs_id", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new SqlParameter("@activityID", System.Data.SqlDbType.Int, 4));
		cmd.Parameters["@uwhrs_id"].Value = newPK;
		
		foreach(ListItem li in cblActivities.Items)
		{
			if (li.Selected)
			{
				cmd.Parameters["@activityID"].Value = int.Parse(li.Value);
				cmd.ExecuteNonQuery();
			}
		}		
		
		tran.Commit();		
	}
	catch(Exception ex)
	{
		lblError.Text = ex.Message;
		result = false;
		
		try
		{
			tran.Rollback();
		}
		catch {}		
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
	SqlDataReader r = null;
	try
	{
		string sql = "select * from TX_UWTXHRS2 where uwhrs_id = @uwhrs_id; ";
		sql += "select * from tx_uwtxactivityassignment where uwhrs_id = @uwhrs_id; ";
		cmd.CommandText = sql;
		cmd.CommandType = CommandType.Text;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@uwhrs_id", System.Data.SqlDbType.Int, 4));
		cmd.Parameters["@uwhrs_id"].Value = int.Parse(Request["PK"]);
		
		conn.Open();
		r = cmd.ExecuteReader();
		
		if (!r.HasRows)
			throw new Exception(string.Format("No data with ID={0} found.", Request["PK"]));
		else
		{
			r.Read();		
			
			PK = (int)r["uwhrs_id"];
			txtDate1.Text =  string.Format("{0:d}", r["uwhrsdate"]);
			txtDate2.Text =  string.Format("{0:d}", r["uwhrsdate"]);
			txtTXID1.Text = r["txid"].ToString().Substring(2);
			txtTXID2.Text = r["txid"].ToString().Substring(2);
			txtSession1.Text = string.Format("{0:f}", r["uwhrstot"]);
			txtSession2.Text = string.Format("{0:f}", r["uwhrstot"]);
			txtChild1.Text = string.Format("{0:f}", r["uwhrsch"]);
			txtChild2.Text = string.Format("{0:f}", r["uwhrsch"]);
			txtOther1.Text = string.Format("{0:f}", r["uwhrsoth"]);
			txtOther2.Text = string.Format("{0:f}", r["uwhrsoth"]);
			txtNotes.Text = r["uwhrsnotes"].ToString();
			lbMissID.SelectedValue = r["missID"].ToString();
			
			// activities
			r.NextResult();
			while (r.Read())
			{
				foreach(ListItem li in cblActivities.Items)
					if (int.Parse(li.Value) == (int)r["activityID"]) li.Selected = true;
			
			}
			
		
		}
	}
	catch(Exception ex)
	{
		lblError.Text = ex.Message;
		result = false;
	}
	finally
	{
		if (conn != null) conn.Close();
	}
	return result;
}


private bool ActivitySelected()
{
	bool result = false;
	
	foreach(ListItem li in cblActivities.Items)
		if (li.Selected) result = true;
	
	return result;
}


protected bool Validate()
{
	bool result;
	string errmsg = string.Empty;
	
	if (txtDate1.Text.Trim() == string.Empty || txtDate2.Text.Trim() == string.Empty)
		errmsg = "Both date fields are required.";
	else if (txtTXID1.Text.Trim() == string.Empty || txtTXID2.Text.Trim() == string.Empty)
		errmsg = "Both TX ID fields are required.";
	else if (txtSession1.Text.Trim() == string.Empty || txtSession2.Text.Trim() == string.Empty)
		errmsg = "Both total session time fields are required.";
	else if (txtChild1.Text.Trim() == string.Empty || txtChild2.Text.Trim() == string.Empty)
		errmsg = "Both time with child fields are required.";
	else if (txtOther1.Text.Trim() == string.Empty || txtOther2.Text.Trim() == string.Empty)
		errmsg = "Both other time fields are required.";
	else if (!ActivitySelected())
		errmsg = "Select at least one activity.";
	else if (txtTXID1.Text.Trim() != txtTXID2.Text.Trim())
		errmsg = "TX ID mismatch.";
	else if (txtDate1.Text.Trim() != txtDate2.Text.Trim())
		errmsg = "Date mismatch.";
	else if (txtSession1.Text.Trim() != txtSession2.Text.Trim())
		errmsg = "Total time of session mismatch.";
	else if (txtChild1.Text.Trim() != txtChild2.Text.Trim())
		errmsg = "Time with child mismatch.";
	else if (txtOther1.Text.Trim() != txtOther2.Text.Trim())
		errmsg = "Other time mismatch.";
	else if (!Regex.IsMatch(txtTXID1.Text, "(^[0-9][1-9]$)|(^[1-9][0-9]$)"))
		errmsg = "Invalid TXID value.";
	else if (!DateValid(txtDate1.Text))
		errmsg = "Date not valid.";
	else if (!FloatValid(txtSession1.Text))
		errmsg = "Total session time not valid.";	
	else if (!FloatValid(txtChild1.Text))
		errmsg = "Time with child not valid.";	
	else if (!FloatValid(txtOther1.Text))
		errmsg = "Other time not valid.";	
	else if (float.Parse(txtSession1.Text) > 3)
		errmsg = "Total session time must be less than 3.";
	else if (float.Parse(txtChild1.Text) + float.Parse(txtOther1.Text) != float.Parse(txtSession1.Text) )
		errmsg = "Child time and Other time doesn't equal Total Session Time.";
	
		
	if (errmsg == string.Empty)
		result = true;
	else
	{
		result = false;
		lblError.Text = errmsg;
	}
	
	return result;
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


protected void Controller(FormEvents f)
{
	switch (f)
	{
		case FormEvents.Lookup:
			if (!DoLookup())
				FormState = FormStates.Lookup_Error;
			else
				FormState = FormStates.Editing;
					
		
			break;
		

		case FormEvents.Save:
			switch (FormState)
			{
				case FormStates.Lookup_Error:
				case FormStates.Adding:
				case FormStates.Adding_Error:
				case FormStates.Adding_Success:
					if (!Validate())
						FormState = FormStates.Adding_Error;
					else if (!DoAdd())
						FormState = FormStates.Adding_Error;
					else
						FormState = FormStates.Adding_Success;
					
					break;
			
				case FormStates.Editing:
				case FormStates.Editing_Error:
				case FormStates.Editing_Success:
					if (!Validate())
						FormState = FormStates.Editing_Error;
					else if (!DoSave())
						FormState = FormStates.Editing_Error;
					else
						FormState = FormStates.Editing_Success;
					
					break;
						
			}
			
			
			break;
			
	}


	SetupForm();
}

protected void SetupForm()
{
	switch(FormState)
	{
	
		case FormStates.Adding:
			txtDate1.Enabled = true;
			txtDate2.Enabled = true;
			txtTXID1.Enabled = true;
			txtTXID2.Enabled = true;
			lblError.Visible = false;
			break;
	
		case FormStates.Editing:
			txtDate1.Enabled = false;
			txtDate2.Enabled = false;
			txtTXID1.Enabled = false;
			txtTXID2.Enabled = false;
			lblError.Visible = false;
			break;
			
		case FormStates.Adding_Error:
		case FormStates.Editing_Error:
			lblError.Visible = true;
			lblError.ForeColor = Color.Red;
			
			break;
			
		case FormStates.Adding_Success:
			lblError.Visible = true;
			lblError.ForeColor = Color.Blue;
			
			// clear controls for next entry
			txtDate1.Text = string.Empty;
			txtDate2.Text = string.Empty;
			txtTXID1.Text = string.Empty;
			txtTXID2.Text = string.Empty;
			txtSession1.Text = string.Empty;
			txtSession2.Text = string.Empty;
			txtChild1.Text = string.Empty;
			txtChild2.Text = string.Empty;
			txtOther1.Text = string.Empty;
			txtOther2.Text = string.Empty;
			lbMissID.SelectedValue = "-1";
			txtNotes.Text = string.Empty;
			foreach(ListItem li in cblActivities.Items) li.Selected = false;

			break;

		case FormStates.Editing_Success:
			lblError.Visible = true;
			lblError.ForeColor = Color.Blue;
			
			break;			
	}


}

protected void Save_Click(object sender, EventArgs e)
{
	Controller(FormEvents.Save);
}

</script>
						<asp:Label ID="lblError" Runat="server" ForeColor="Red" /><br>
						<h3>UW Treatment Hours</h3>
						<a href="UWTXhrs2.aspx">Back to list</a><br>


						<table class="layout"><tr><td>Date:</td><td><asp:TextBox ID="txtDate1" Runat="server" onKeyDown="if(event.keyCode==13) event.keyCode=9;"/></td>
						<td><asp:TextBox ID="txtDate2" Runat="server"  onKeyDown="if(event.keyCode==13) event.keyCode=9;"/></td></tr>
						<tr><td>TXID:</td><td><asp:TextBox ID="txtTXID1" Runat="server"  onKeyDown="if(event.keyCode==13) event.keyCode=9;"/></td>
						<td><asp:TextBox ID="txtTXID2" Runat="server"  onKeyDown="if(event.keyCode==13) event.keyCode=9;"/></td></tr>
						<tr><td>Total Time of Session:</td><td><asp:TextBox ID="txtSession1" Runat="server"  onKeyDown="if(event.keyCode==13) event.keyCode=9;"/></td>
						<td><asp:TextBox ID="txtSession2" Runat="server"  onKeyDown="if(event.keyCode==13) event.keyCode=9;"/></td></tr>
						<tr><td>Time with Child:</td><td><asp:TextBox ID="txtChild1" Runat="server" onKeyDown="if(event.keyCode==13) event.keyCode=9;" /></td>
						<td><asp:TextBox ID="txtChild2" Runat="server" onKeyDown="if(event.keyCode==13) event.keyCode=9;" /></td></tr>
						<tr><td>Other Time:</td><td><asp:TextBox ID="txtOther1" Runat="server" onKeyDown="if(event.keyCode==13) event.keyCode=9;" /></td>
						<td><asp:TextBox ID="txtOther2" Runat="server" onKeyDown="if(event.keyCode==13) event.keyCode=9;" /></td></tr>
						</table>
						
						<table class="layout">
						<tr><td>Activities:<asp:CheckBoxList ID="cblActivities" Runat="server" onKeyDown="if(event.keyCode==13) event.keyCode=9;" /></td>
						<td>Missed Reason:<br><asp:ListBox ID="lbMissID" Runat="server" SelectionMode="Single" Rows="11"  onKeyDown="if(event.keyCode==13) event.keyCode=9;"/></td></tr>
						</table>
						Notes:<br><asp:TextBox ID="txtNotes" Runat="server" TextMode="MultiLine" Width="200px" Height="150px" onKeyDown="if(event.keyCode==13) event.keyCode=9;" /><br>
						



						<asp:Button ID="btnSave" Text="Save" Runat="server" OnClick="Save_Click" />
</asp:Content>