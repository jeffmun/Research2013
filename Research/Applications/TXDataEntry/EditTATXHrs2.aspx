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
			
			// if ID is passed in querystring then editing, else adding
			if (Request["ID"] != null && Request["ID"] != string.Empty)
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
		string sql = "select distinct s.staffid, s.staffshortname ";
		sql += "from uwautism_research_backend..tblstaff s ";
		sql += "join  uwautism_research_backend..tblstaffposition sp on sp.staffid = s.staffid ";
		sql += "where staffposname like '%tx%' or staffposname like '%coe%' ";
		sql += "order by s.staffshortname; ";
		sql += "select txhrsmis_id, cast(txhrsmis_id as varchar) + ': ' + mis_text mis_text, sortorder ";
		sql += "from TX_TATXHRSmis_lkup2 ";
		sql += "union all select -1, '-none-', -1  order by sortorder; ";

		cmd.CommandText = sql;
		cmd.CommandType = CommandType.Text;
		cmd.Parameters.Clear();

		conn.Open();
		SqlDataReader r = cmd.ExecuteReader();
		
		ddlStaffID.DataTextField = "staffshortname";
		ddlStaffID.DataValueField = "staffid";
		ddlStaffID.DataSource = r;
		ddlStaffID.DataBind();
		
		r.NextResult();
		
		lbMissID.DataTextField = "mis_text";
		lbMissID.DataValueField = "txhrsmis_id";
		lbMissID.DataSource = r;
		lbMissID.DataBind();
		
		//default to N/A
		lbMissID.SelectedValue = "-1";
		
		r.Close();
		
		//add attributes that make enter key work like tab key
		ddlStaffID.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtTXID1.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtTXID2.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtDate1.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtDate2.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtExpectedLength1.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtExpectedLength2.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtActualLength1.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtActualLength2.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		lbMissID.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtNotes.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
	}
	catch {}
	finally
	{
		if (conn != null) conn.Close();
	}
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
			lblError.Visible = false;
			break;
	
		case FormStates.Editing:
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
			txtExpectedLength1.Text = string.Empty;
			txtExpectedLength2.Text = string.Empty;
			txtActualLength1.Text = string.Empty;
			txtActualLength2.Text = string.Empty;
			lbMissID.SelectedValue = "-1";
			txtNotes.Text = string.Empty;
			
			break;

		case FormStates.Editing_Success:
			lblError.Visible = true;
			lblError.ForeColor = Color.Blue;
			
			break;			
	}
}

protected bool Validate()
{
	bool result;
	string errmsg = string.Empty;
	
	if (ddlStaffID.SelectedIndex == -1)
		errmsg = "Select a TA.";
	else if (txtTXID1.Text.Trim() == string.Empty || txtTXID2.Text.Trim() == string.Empty)
		errmsg = "Both TX ID fields are required.";
	else if (txtDate1.Text.Trim() == string.Empty || txtDate2.Text.Trim() == string.Empty)
		errmsg = "Both date fields are required.";
	else if (txtExpectedLength1.Text.Trim() == string.Empty || txtExpectedLength2.Text.Trim() == string.Empty)
		errmsg = "Both expected length fields are required.";
	else if (txtActualLength1.Text.Trim() == string.Empty || txtActualLength2.Text.Trim() == string.Empty)
		errmsg = "Both actual length fields are required.";
	else if (lbMissID.SelectedIndex == -1)
		errmsg = "Specify a missed reason.";
	else if (txtTXID1.Text.Trim() != txtTXID2.Text.Trim())
		errmsg = "TX ID mismatch.";
	else if (txtDate1.Text.Trim() != txtDate2.Text.Trim())
		errmsg = "Date mismatch.";
	else if (txtExpectedLength1.Text.Trim() != txtExpectedLength2.Text.Trim())
		errmsg = "Expected length mismatch.";
	else if (txtActualLength1.Text.Trim() != txtActualLength2.Text.Trim())
		errmsg = "Actual length mismatch.";
	else if (!Regex.IsMatch(txtTXID1.Text, "(^[0-9][1-9]$)|(^[1-9][0-9]$)"))
		errmsg = "Invalid TXID value.";
	else if (!DateValid(txtDate1.Text))
		errmsg = "Date not valid.";
	else if (!FloatValid(txtExpectedLength1.Text))
		errmsg = "Expected length not valid.";	
	else if (!FloatValid(txtActualLength1.Text))
		errmsg = "Actual length not valid.";	
	else if (float.Parse(txtExpectedLength1.Text) > 3)
		errmsg = "Expected length must be less than 3.";
	else if (float.Parse(txtActualLength1.Text) > 3)
		errmsg = "Actual length must be less than 3.";
	
		
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


protected bool DoSave()
{

	bool result = true;
	
	try
	{
		string sql = "update tx_tatxhrs2 ";
		sql += "set TXHRSstaffID=@TXHRSstaffID,TXID=@TXID,TXHRSdate=@TXHRSdate,TXHRSActual=@TXHRSActual,TXHRSExpected=@TXHRSExpected,TXHRSmis=@TXHRSmis,TXHRSnotes=@TXHRSnotes ";
		sql += "where txhrs_id = @txhrs_id";
	
		cmd.CommandText = sql;
		cmd.CommandType = CommandType.Text;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@txhrs_id", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new SqlParameter("@TXHRSstaffID", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new SqlParameter("@TXID", System.Data.SqlDbType.VarChar, 4));	
		cmd.Parameters.Add(new SqlParameter("@TXHRSdate", System.Data.SqlDbType.DateTime, 8));
		cmd.Parameters.Add(new SqlParameter("@TXHRSActual", System.Data.SqlDbType.Float, 8));
		cmd.Parameters.Add(new SqlParameter("@TXHRSExpected", System.Data.SqlDbType.Float, 8));
		cmd.Parameters.Add(new SqlParameter("@TXHRSmis", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new SqlParameter("@TXHRSnotes", System.Data.SqlDbType.VarChar, 500));	
		
		cmd.Parameters["@txhrs_id"].Value = PK;
		cmd.Parameters["@TXHRSstaffID"].Value = int.Parse(ddlStaffID.SelectedValue);
		cmd.Parameters["@TXID"].Value = "TX" + txtTXID1.Text.Trim();
		cmd.Parameters["@TXHRSdate"].Value = txtDate1.Text;
		cmd.Parameters["@TXHRSActual"].Value = txtActualLength1.Text;
		cmd.Parameters["@TXHRSExpected"].Value = txtExpectedLength1.Text;
		cmd.Parameters["@TXHRSmis"].Value = int.Parse(lbMissID.SelectedValue);
		cmd.Parameters["@TXHRSnotes"].Value = txtNotes.Text;
		
		if (txtNotes.Text.Trim() == string.Empty) cmd.Parameters["@TXHRSnotes"].Value = DBNull.Value;
		if (lbMissID.SelectedValue == "-1") cmd.Parameters["@TXHRSmis"].Value = DBNull.Value;
		
		conn.Open();
		cmd.ExecuteNonQuery();
		
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
	
	if (result) lblError.Text = "Save successful.";
	return result;


}


protected bool DoAdd()
{
	bool result = true;
	
	try
	{
		string sql = "insert into tx_tatxhrs2 ";
		sql += " (TXHRSstaffID,TXID,TXHRSdate,TXHRSActual,TXHRSExpected,TXHRSmis,TXHRSnotes) ";
		sql += " values (@TXHRSstaffID,@TXID,@TXHRSdate,@TXHRSActual,@TXHRSExpected,@TXHRSmis,@TXHRSnotes) ";
	
		cmd.CommandText = sql;
		cmd.CommandType = CommandType.Text;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@TXHRSstaffID", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new SqlParameter("@TXID", System.Data.SqlDbType.VarChar, 4));	
		cmd.Parameters.Add(new SqlParameter("@TXHRSdate", System.Data.SqlDbType.DateTime, 8));
		cmd.Parameters.Add(new SqlParameter("@TXHRSActual", System.Data.SqlDbType.Float, 8));
		cmd.Parameters.Add(new SqlParameter("@TXHRSExpected", System.Data.SqlDbType.Float, 8));
		cmd.Parameters.Add(new SqlParameter("@TXHRSmis", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new SqlParameter("@TXHRSnotes", System.Data.SqlDbType.VarChar, 500));	
		
		cmd.Parameters["@TXHRSstaffID"].Value = int.Parse(ddlStaffID.SelectedValue);
		cmd.Parameters["@TXID"].Value = "TX" + txtTXID1.Text.Trim();
		cmd.Parameters["@TXHRSdate"].Value = txtDate1.Text;
		cmd.Parameters["@TXHRSActual"].Value = txtActualLength1.Text;
		cmd.Parameters["@TXHRSExpected"].Value = txtExpectedLength1.Text;
		cmd.Parameters["@TXHRSmis"].Value = int.Parse(lbMissID.SelectedValue);
		cmd.Parameters["@TXHRSnotes"].Value = txtNotes.Text;
		
		if (txtNotes.Text.Trim() == string.Empty) cmd.Parameters["@TXHRSnotes"].Value = DBNull.Value;
		if (lbMissID.SelectedValue == "-1") cmd.Parameters["@TXHRSmis"].Value = DBNull.Value;
		
		conn.Open();
		cmd.ExecuteNonQuery();
		
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
	
	if (result) lblError.Text = "Save successful.";
	return result;
}


protected bool DoLookup()
{
	bool result = true;
	SqlDataReader r = null;
	try
	{
		string sql = "select * from TX_TATXHRS2 where txhrs_id = @txhrs_id";
		cmd.CommandText = sql;
		cmd.CommandType = CommandType.Text;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@txhrs_id", System.Data.SqlDbType.Int, 4));
		cmd.Parameters["@txhrs_id"].Value = int.Parse(Request["ID"]);
		
		conn.Open();
		r = cmd.ExecuteReader();
		
		if (!r.HasRows)
			throw new Exception(string.Format("No data with ID={0} found.", Request["ID"]));
		else
		{
			r.Read();		
			
			PK = (int)r["txhrs_id"];
			ddlStaffID.SelectedValue = r["txhrsstaffid"].ToString();
			txtTXID1.Text = r["txid"].ToString().Substring(2);
			txtTXID2.Text = r["txid"].ToString().Substring(2);
			txtDate1.Text = string.Format("{0:d}", r["txhrsdate"]);
			txtDate2.Text = string.Format("{0:d}", r["txhrsdate"]);
			txtExpectedLength1.Text = string.Format("{0:f}", r["txhrsexpected"]);
			txtExpectedLength2.Text = string.Format("{0:f}", r["txhrsexpected"]);
			txtActualLength1.Text = string.Format("{0:f}", r["txhrsactual"]);
			txtActualLength2.Text = string.Format("{0:f}", r["txhrsactual"]);
			
			if (r["txhrsmis"] == DBNull.Value)
				lbMissID.SelectedValue = "-1";
			else
				lbMissID.SelectedValue = r["txhrsmis"].ToString();

			txtNotes.Text = r["txhrsnotes"].ToString();
		
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




protected void Save_Click(object sender, EventArgs e)
{
	Controller(FormEvents.Save);
}

</script>
						<asp:Label ID="lblError" Runat="server" ForeColor="Red" /><br>
												<h3>TA Treatment Hours</h3>

						<a href="TATXhrs2.aspx">Back to list</a><br>
						
						
						
						<table class="layout"><tr><td>TA:</td><td colspan="2"><asp:DropDownList ID="ddlStaffID" Runat="server"/></td></tr>
						<tr><td>2 digit TX ID (eg. enter 05 for TX05):</td><td><asp:TextBox ID="txtTXID1" Runat="server" /></td>
						<td><asp:TextBox ID="txtTXID2" Runat="server" /></td></tr>
						<tr><td>Date:</td><td><asp:TextBox ID="txtDate1" Runat="server" /></td><td><asp:TextBox ID="txtDate2" Runat="server" /></td></tr>
						<tr><td>Expected Length:</td><td><asp:TextBox ID="txtExpectedLength1" runat="server" /></td>
						<td><asp:TextBox ID="txtExpectedLength2" runat="server" /></td></tr>
						<tr><td>Actual Length:</td><td><asp:TextBox ID="txtActualLength1" Runat="server" /></td>
						<td><asp:TextBox ID="txtActualLength2" Runat="server" /></td></tr>
						<tr><td>Missed Reason:</td><td colspan="2"><asp:ListBox ID="lbMissID" Runat="server" Rows="11"  /></td></tr>
						<tr><td>Notes:</td><td colspan="2"><asp:TextBox ID="txtNotes" Runat="server" TextMode="MultiLine" Width="200px" Height="150px" /></td></tr>
						</table>
						<asp:Button ID="btnSave" Text="Save" Runat="server" OnClick="Save_Click" />
</asp:Content>