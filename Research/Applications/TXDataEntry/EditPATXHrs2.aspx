<%@ Import namespace="System.Drawing" %>
<%@ Import namespace="System.Configuration" %>
<%@ Import namespace="System.Data.Common" %>
<%@ Import namespace="System.Data.SqlClient" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Collections" %>

<%@ Page language="C#"   MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<script language="C#" runat="server" >
protected SqlConnection conn = new SqlConnection();
protected SqlCommand cmd = new SqlCommand();
protected ArrayList ChangedPATXData = new ArrayList();

class PATXData
{
	public PATXData(RepeaterItem ri)
	{
		pahrs_id = int.Parse(((HtmlInputHidden)ri.FindControl("txtPAHRS_ID")).Value);
		par1 = ((TextBox)ri.FindControl("txtPAHrs1")).Text.Trim();
		par2 = ((TextBox)ri.FindControl("txtPAHrs2")).Text.Trim();
		spc1 = ((TextBox)ri.FindControl("txtSPHrs1")).Text.Trim();
		spc2 = ((TextBox)ri.FindControl("txtSPHrs2")).Text.Trim();
		ot1 = ((TextBox)ri.FindControl("txtOTHrs1")).Text.Trim();
		ot2 = ((TextBox)ri.FindControl("txtOTHrs2")).Text.Trim();
		oth1 = ((TextBox)ri.FindControl("txtOthHrs1")).Text.Trim();
		oth2 = ((TextBox)ri.FindControl("txtOthHrs2")).Text.Trim();
		oth_desc = ((TextBox)ri.FindControl("txtDesc")).Text.Trim();
		notes = ((TextBox)ri.FindControl("txtNotes")).Text.Trim();

	}
	
	public int pahrs_id;
	public string par1;
	public string par2;
	public string spc1;
	public string spc2;
	public string ot1;
	public string ot2;
	public string oth1;
	public string oth2;
	public string oth_desc;
	public string notes;

	/* All values must be valid floats and match */
	public string Validate()
	{	
		string msg = string.Empty;

//^([1-4](\.00*)?|[1-3]\.50*|[1-3]\.25|[1-3]\.75|9)$
//^([0-4](\.00*)?|[0-3]\.50*|[0-3]\.25|[0-3]\.75|(\.25)|\.50*|\.75)$
		
		if (par1 != par2)
			msg = "Parent hours mismatch.";
		else if (spc1 != spc2)
			msg = "Speech hours mismatch.";
		else if (ot1 != ot2)
			msg = "OT/PT hours mismatch.";
		else if (oth1 != oth2)
			msg = "Other hours mismatch.";
		else if (!FloatValid(par1))
			msg = "Invalid parent hours.";
		else if (!FloatValid(spc1))
			msg = "Invalid speech hours.";
		else if (!FloatValid(ot1))
			msg = "Invalid OT/PT hours.";
		else if (!FloatValid(oth1))
			msg = "Invalid Other hours.";
			
		return msg;

	}
	
	private bool FloatValid(string fstring)
	{
		float ftest = -1;
		try
		{
			ftest = float.Parse(fstring);
		}
		catch {}
		return (ftest >= 0 && ftest < 12);
	}	
}

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
	AddNew,
	Lookup,
	ButtonClick
}

protected FormStates FormState
{
	get {return (FormStates)ViewState["_formState"]; }
	set {ViewState["_formState"] = value;}
}

protected DataSet dsPAHrs
{
	get {return (DataSet)ViewState["_dsPAHrs"]; }
	set {ViewState["_dsPAHrs"] = value; }
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

protected void SetupForm()
{
	switch(FormState)
	{
		case FormStates.Editing:
			lblError.Visible = false;
			lblWeekOf.Visible = true;
			txtWeekOf1.Visible = false;
			txtWeekOf2.Visible = false;
			lblTXID.Visible = true;
			txtTXID1.Visible = false;
			txtTXID2.Visible = false;
			btnMain.Visible = true;
			btnMain.Text = "Save";
			btnMain.TabIndex = notesBase;

			break;
	

		case FormStates.Editing_Success:
			lblError.ForeColor = Color.Blue;
			lblError.Visible = true;
			lblWeekOf.Visible = true;
			txtWeekOf1.Visible = false;
			txtWeekOf2.Visible = false;
			lblTXID.Visible = true;
			txtTXID1.Visible = false;
			txtTXID2.Visible = false;
			btnMain.Visible = true;
			btnMain.Text = "Save";

			break;

	
		case FormStates.Adding:
			lblError.Visible = false;
			lblWeekOf.Visible = false;
			txtWeekOf1.Visible = true;
			txtWeekOf2.Visible = true;
			lblTXID.Visible = false;
			txtTXID1.Visible = true;
			txtTXID2.Visible = true;
			btnMain.Visible = true;
			btnMain.Text = "Add New";

			break;
	

		case FormStates.Adding_Error:
			lblError.ForeColor = Color.Red;
			lblError.Visible = true;
			lblWeekOf.Visible = false;
			txtWeekOf1.Visible = true;
			txtWeekOf2.Visible = true;
			lblTXID.Visible = false;
			txtTXID1.Visible = true;
			txtTXID2.Visible = true;
			btnMain.Visible = true;
			btnMain.Text = "Add New";

			break;
			
		case FormStates.Lookup_Error:
			lblError.ForeColor = Color.Red;
			lblError.Visible = true;
			lblWeekOf.Visible = true;
			txtWeekOf1.Visible = false;
			txtWeekOf2.Visible = false;
			lblTXID.Visible = true;
			txtTXID1.Visible = false;
			txtTXID2.Visible = false;
			btnMain.Visible = false;
			break;
			
		case FormStates.Editing_Error:
			lblError.ForeColor = Color.Red;
			lblError.Visible = true;
			lblWeekOf.Visible = true;
			txtWeekOf1.Visible = false;
			txtWeekOf2.Visible = false;
			lblTXID.Visible = true;
			txtTXID1.Visible = false;
			txtTXID2.Visible = false;
			btnMain.Visible = true;
			btnMain.Text = "Save";
			
			break;
	}
}


protected bool DoUpdate()
{
	bool result = true;
	
	try
	{
		// get data from repeater
		ChangedPATXData.Clear();
		foreach(RepeaterItem ri in rpPAHrs.Items)
		{
			if (ri.ItemType == ListItemType.Item || ri.ItemType == ListItemType.AlternatingItem)
			{
				PATXData pd = new PATXData(ri);
				ChangedPATXData.Add(pd);
				
				// abort if any validation errors
				string msg = pd.Validate();
				if (msg != string.Empty)
				{
					// add error to repeater control
					((Label)ri.FindControl("lbl1Error")).Text = msg;
					throw new Exception(msg);
				}
			}			
		}
		
		//save
		string	sql = "UPDATE TX_PATXHRS ";
				sql += "SET PAHRSpar = @PAHRSpar, PAHRSspc = @PAHRSspc, PAHRSot = @PAHRSot, ";
				sql += "PAHRSoth = @PAHRSoth, PAHRSoth_desc = @PAHRSoth_desc, PAHRSnotes = @PAHRSnotes ";
				sql += "WHERE pahrs_id = @pahrs_id ";
		cmd.CommandText = sql;
		cmd.CommandType = CommandType.Text;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@pahrs_id", System.Data.SqlDbType.Int, 4, "pahrs_id"));
		cmd.Parameters.Add(new SqlParameter("@PAHRSpar", System.Data.SqlDbType.Float, 8, "PAHRSpar"));
		cmd.Parameters.Add(new SqlParameter("@PAHRSspc", System.Data.SqlDbType.Float, 8, "PAHRSspc"));
		cmd.Parameters.Add(new SqlParameter("@PAHRSot", System.Data.SqlDbType.Float, 8, "PAHRSot"));
		cmd.Parameters.Add(new SqlParameter("@PAHRSoth", System.Data.SqlDbType.Float, 8, "PAHRSoth"));
		cmd.Parameters.Add(new SqlParameter("@PAHRSoth_desc", System.Data.SqlDbType.VarChar, 200, "PAHRSoth_desc"));
		cmd.Parameters.Add(new SqlParameter("@PAHRSnotes", System.Data.SqlDbType.VarChar, 500, "PAHRSnotes"));		
		
		conn.Open();
		
		foreach(PATXData p in ChangedPATXData)
		{
			cmd.Parameters["@pahrs_id"].Value = p.pahrs_id;
			cmd.Parameters["@PAHRSpar"].Value = p.par1;
			cmd.Parameters["@PAHRSspc"].Value = p.spc1;
			cmd.Parameters["@PAHRSot"].Value = p.ot1;
			cmd.Parameters["@PAHRSoth"].Value = p.oth1;
			cmd.Parameters["@PAHRSoth_desc"].Value = p.oth_desc;
			cmd.Parameters["@PAHRSnotes"].Value = p.notes;
			
			if (p.oth_desc == string.Empty) cmd.Parameters["@PAHRSoth_desc"].Value = DBNull.Value;
			if (p.notes == string.Empty) cmd.Parameters["@PAHRSnotes"].Value = DBNull.Value;
		
			cmd.ExecuteNonQuery();
			
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
	
	if (result) lblError.Text = "Saved.";
	
	
	return result;
}

protected bool ValidateAddNew()
{
	bool result = true;
	string msg = string.Empty;
	
	// week of and txid are required and must match
	if (txtWeekOf1.Text.Trim() == string.Empty || txtWeekOf2.Text.Trim() == string.Empty ||
		txtTXID1.Text.Trim() == string.Empty || txtTXID2.Text.Trim() == string.Empty)
		msg = "Both WeekOf and TXID are required.";
	else if (txtWeekOf1.Text.Trim() != txtWeekOf2.Text.Trim())
		msg = "WeekOf mismatch.";
	else if (txtTXID1.Text.Trim() != txtTXID2.Text.Trim())
		msg = "TXID mismatch.";
	else if (!DateValid(txtWeekOf1.Text))
		msg = "WeekOf not a valid date.";
	else if (DateTime.Parse(txtWeekOf1.Text).DayOfWeek != DayOfWeek.Sunday)
		msg = "WeekOf must be a Sunday.";
	else if (!Regex.IsMatch(txtTXID1.Text, "(^[0-9][1-9]$)|(^[1-9][0-9]$)"))
		msg = "TXID not valid.";		
		
	if (msg != string.Empty)
	{
		lblError.Text = msg;
		result = false;
	}
		
	return result;
}

protected bool DoAddNew()
{
	bool result = true;

	if (!ValidateAddNew() )	
		result = false;
	else
	{
		
		try 
		{
			lblTXID.Text = "TX" + txtTXID1.Text.Trim();
			lblWeekOf.Text = string.Format("{0:ddd M/d/yy}", DateTime.Parse(txtWeekOf1.Text));
		
			cmd.CommandText = "spEditPATXHrsWeek";
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Clear();
			cmd.Parameters.Add(new SqlParameter("@TXID", System.Data.SqlDbType.VarChar, 4));
			cmd.Parameters.Add(new SqlParameter("@editdate", System.Data.SqlDbType.DateTime, 8));

			cmd.Parameters["@TXID"].Value = "TX" + txtTXID1.Text.Trim();
			cmd.Parameters["@editdate"].Value = txtWeekOf1.Text.Trim();
			
			conn.Open();
			rpPAHrs.DataSource = cmd.ExecuteReader();
			rpPAHrs.DataBind();
			
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
	}
	return result;
}


protected bool DoLookup()
{
	bool result = true;
	
	try 
	{
	
		cmd.CommandText = "spEditPATXHrsWeek";
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@TXID", System.Data.SqlDbType.VarChar, 4));
		cmd.Parameters.Add(new SqlParameter("@editdate", System.Data.SqlDbType.DateTime, 8));
	
		lblTXID.Text = Request["ID"].ToUpper();
		lblWeekOf.Text = string.Format("{0:ddd M/d/yy}", DateTime.Parse(Request["date"]));
		
		cmd.Parameters["@TXID"].Value = Request["ID"];
		cmd.Parameters["@editdate"].Value = Request["date"];
		
		conn.Open();
		rpPAHrs.DataSource = cmd.ExecuteReader();
		rpPAHrs.DataBind();
		
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
		case FormEvents.AddNew:
			FormState = FormStates.Adding;
			break;
			
		case FormEvents.ButtonClick:
			switch (FormState)
			{
				case FormStates.Adding_Error:
				case FormStates.Adding:
					if (!DoAddNew())
						FormState = FormStates.Adding_Error;
					else
						FormState = FormStates.Editing;
					break;
					
				case FormStates.Editing_Error:	
				case FormStates.Editing_Success:					
				case FormStates.Editing:
					if (!DoUpdate())
						FormState = FormStates.Editing_Error;
					else
						FormState = FormStates.Editing_Success;
						
					break;
			
			
			
			}
			break;
			
	}
	
	SetupForm();
}



protected void Init()
{

	
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
			if (Request["ID"] != null && Request["ID"] != string.Empty && Request["date"] != null && Request["date"] != string.Empty)
			{
				Controller(FormEvents.Lookup);
			}
			else
			{
				Controller(FormEvents.AddNew);
			}
		}	
		
	}
	catch(Exception ex)
	{
		lblError.Visible = true;
		lblError.Text = ex.Message;
	}


}


protected void btnMain_Click(object sender, EventArgs e)
{
	Controller(FormEvents.ButtonClick);

}

short parBase = 100;
short otBase = 200;
short spBase = 300;
short othBase = 400;
short notesBase = 500;

/* setup control tab order */
private void rpPAHrs_ItemDataBound(object sender, RepeaterItemEventArgs e)
{	

	
	if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
	{
		((TextBox)e.Item.FindControl("txtPAHrs1")).TabIndex = parBase++;
		((TextBox)e.Item.FindControl("txtPAHrs2")).TabIndex = parBase++;
		((TextBox)e.Item.FindControl("txtOTHrs1")).TabIndex = otBase++;
		((TextBox)e.Item.FindControl("txtOTHrs2")).TabIndex = otBase++;
		((TextBox)e.Item.FindControl("txtSPHrs1")).TabIndex = spBase++;
		((TextBox)e.Item.FindControl("txtSPHrs2")).TabIndex = spBase++;
		((TextBox)e.Item.FindControl("txtOthHrs1")).TabIndex = othBase++;
		((TextBox)e.Item.FindControl("txtOthHrs2")).TabIndex = othBase++;
		((TextBox)e.Item.FindControl("txtDesc")).TabIndex = othBase++;
		((TextBox)e.Item.FindControl("txtNotes")).TabIndex = notesBase++;
	}
}
</script>

						<asp:label id="lblError" ForeColor="Red" Runat="server"  EnableViewState="False"></asp:label><br>
						<h3>Parent Treatment Hours</h3>
						<A href="PATXhrs2.aspx">Back to list</A>&nbsp;&nbsp;<a href="EditPATXHrs2.aspx">Add Another</a>
						<table class="layout">
							<tr>
								<td>Week Of:</td>
								<td><asp:Label ID="lblWeekOf" Runat="server" Font-Bold="true" Font-Size="10"/>
								<asp:textbox id="txtWeekOf1" Runat="server" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox>
								<asp:textbox id="txtWeekOf2" Runat="server" OnKeyDown="if(event.keyCode==13) event.keyCode=9;" ></asp:textbox></td>
							</tr>
							<tr>
								<td>ID #:</td>
								<td><asp:Label ID="lblTXID" Runat="server"  Font-Bold="true" Font-Size="10"/>
								<asp:textbox id="txtTXID1" Runat="server" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox>
								<asp:textbox id="txtTXID2" Runat="server" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox></td>
							</tr>
						</table>
						
						<asp:Repeater ID="rpPAHrs" Runat="server"  OnItemDataBound="rpPAHrs_ItemDataBound" >
						<HeaderTemplate>
						<table class="grid">
							<tr>
								<td></td>
								<td class="heading">Parent Hours</td>
								<td class="heading">OT/PT</td>
								<td class="heading">Speech</td>
								<td class="heading">Other</td>
								<td class="heading">Notes:</td>
							</tr>						
						</HeaderTemplate>
						<ItemTemplate>
							<TR>
								<TD colSpan="6">
									<asp:label id="lbl1Error" runat="server" forecolor="Red" EnableViewState="False"></asp:label></TD>
							</TR>
							<tr>
								<td class="heading"><%# DataBinder.Eval(Container.DataItem, "pahrsdate", "{0:ddd M/d}") %><input type="hidden" id="txtPAHRS_ID" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "pahrs_id") %>'/></td>
								<td><asp:textbox Text='<%# DataBinder.Eval(Container.DataItem, "pahrspar", "{0:f2}") %>' id="txtPAHrs1" Runat="server" Width="40px" OnKeyDown="if(event.keyCode==13) event.keyCode=9;">
								</asp:textbox><asp:textbox  Text='<%# DataBinder.Eval(Container.DataItem, "pahrspar", "{0:f2}") %>' id="txtPAHrs2" Runat="server" Width="40px" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox></td>
								<td><asp:textbox  Text='<%# DataBinder.Eval(Container.DataItem, "pahrsot", "{0:f2}") %>' id="txtOTHrs1" Runat="server" Width="40px" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox>
								<asp:textbox  Text='<%# DataBinder.Eval(Container.DataItem, "pahrsot", "{0:f2}") %>' id="txtOTHrs2" Runat="server" Width="40px" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox></td>
								<td><asp:textbox  Text='<%# DataBinder.Eval(Container.DataItem, "pahrsspc", "{0:f2}") %>' id="txtSPHrs1" Runat="server" Width="40px" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox>
								<asp:textbox  Text='<%# DataBinder.Eval(Container.DataItem, "pahrsspc", "{0:f2}") %>' id="txtSPHrs2" Runat="server" Width="40px" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox></td>
								<td><asp:textbox  Text='<%# DataBinder.Eval(Container.DataItem, "pahrsoth", "{0:f2}") %>' id="txtOthHrs1" Runat="server" Width="40px" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox>
								<asp:textbox  Text='<%# DataBinder.Eval(Container.DataItem, "pahrsoth", "{0:f2}") %>' id="txtOthHrs2" Runat="server" Width="40px" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox><br>Describe:<br>
									<asp:textbox  Text='<%# DataBinder.Eval(Container.DataItem, "pahrsoth_desc", "{0:f2}") %>' id="txtDesc" Runat="server" MaxLength="200" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox></td>
								<td><asp:textbox  Text='<%# DataBinder.Eval(Container.DataItem, "pahrsnotes", "{0:f2}") %>' id="txtNotes" Runat="server" Width="200px" Height="60px" TextMode="MultiLine" OnKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox></td>
							</tr>

						
						</ItemTemplate>
						
						<FooterTemplate>
						</table>
						</FooterTemplate>
						</asp:Repeater><br><br>
						
						<asp:Button ID="btnMain" Runat="server"  OnClick="btnMain_Click"  AccessKey="s"/>

</asp:Content>