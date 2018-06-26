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


protected void Page_Load(object sender, EventArgs e)
{
	
	try {
		
		conn.ConnectionString = ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"];
		cmd.Connection = conn;
	
		if (!IsPostBack)
			Init();
		else if (Request.Form["__command"] == "delete")
			DoDelete(int.Parse(Request.Form["__commandval"]));
		

		FillDataList();
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
		sql += "union all ";
		sql += "select -1, '-show all-'";
		sql += "order by s.staffshortname; ";
		cmd.CommandText = sql;
		cmd.CommandType = CommandType.Text;
		cmd.Parameters.Clear();

		conn.Open();
		SqlDataReader r = cmd.ExecuteReader();
		
		ddlStaffID.DataTextField = "staffshortname";
		ddlStaffID.DataValueField = "staffid";
		ddlStaffID.DataSource = r;
		ddlStaffID.DataBind();
		
		r.Close();
		
		//add attributes that make enter key work like tab key
		ddlStaffID.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtTXID.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtDateStart.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtDateEnd.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		ddlOrderBy.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		
			
		// restore control values from session state
		txtTXID.Text = FormState.TXID;
		ddlStaffID.SelectedValue = FormState.TA.ToString();
		txtDateStart.Text = FormState.TXDateStart;
		txtDateEnd.Text = FormState.TXDateEnd;
		ddlOrderBy.SelectedValue = FormState.OrderBy;


	}
	catch {}
	finally
	{
		if (conn != null) conn.Close();
	}
}

protected void DoDelete(int pk)
{
	try
	{
		cmd.CommandText = "delete from tx_tatxhrs2 where txhrs_id = @pk";
		cmd.CommandType = CommandType.Text;
	
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@pk", System.Data.SqlDbType.Int, 4));
		cmd.Parameters["@pk"].Value = pk;
		
		conn.Open();
		cmd.ExecuteNonQuery();
	}
	catch {}
	finally
	{
		if (conn != null) conn.Close();
	}
}

protected void FillDataList()
{
	try
	{
		cmd.CommandText = "spquerytatxhrs2";
		cmd.CommandType = CommandType.StoredProcedure;
	
		cmd.Parameters.Clear();
		
		cmd.Parameters.Add(new SqlParameter("@txid", System.Data.SqlDbType.VarChar, 4));	
		cmd.Parameters.Add(new SqlParameter("@staffID", System.Data.SqlDbType.Int, 4));
		cmd.Parameters.Add(new SqlParameter("@txdatestart", System.Data.SqlDbType.DateTime, 8));
		cmd.Parameters.Add(new SqlParameter("@txdateend", System.Data.SqlDbType.DateTime, 8));
		cmd.Parameters.Add(new SqlParameter("@orderby", System.Data.SqlDbType.VarChar, 10));	


		if (FormState.TXID != string.Empty)
			cmd.Parameters["@txid"].Value = FormState.TXID;
		else
			cmd.Parameters["@txid"].Value = DBNull.Value;
			
		if (FormState.TA != -1)
			cmd.Parameters["@staffid"].Value = FormState.TA;
		else
			cmd.Parameters["@staffid"].Value = DBNull.Value;
			
		if (FormState.TXDateStart != string.Empty)
			cmd.Parameters["@txdatestart"].Value = FormState.TXDateStart;
		else
			cmd.Parameters["@txdatestart"].Value = DBNull.Value;
	
		if (FormState.TXDateEnd != string.Empty)
			cmd.Parameters["@txdateend"].Value = FormState.TXDateEnd;
		else
			cmd.Parameters["@txdateend"].Value = DBNull.Value;
	
		cmd.Parameters["@orderby"].Value = FormState.OrderBy;


		conn.Open();
	
		dgTATXHrs.DataSource = cmd.ExecuteReader();
		dgTATXHrs.DataBind();
	}
	catch {}
	finally
	{
		if (conn != null) conn.Close();
	}
}

protected void Refresh_Click(object sender, EventArgs e)
{
	if (!Validate())
	{
		lblError.Visible = true;
	}
	else
	{
		lblError.Visible = false;
		
		FormState.TXID = txtTXID.Text.Trim();
		FormState.TA = int.Parse(ddlStaffID.SelectedValue);
		FormState.TXDateStart =  txtDateStart.Text.Trim();
		FormState.TXDateEnd =  txtDateEnd.Text.Trim();
		FormState.OrderBy = ddlOrderBy.SelectedValue;
		
		//update session
        Session["_TATXHRSFormState"] = FormState;
        
        FillDataList();
	}	


}

protected bool Validate()
{
	bool result = true;
	if (txtDateStart.Text.Trim() != string.Empty)
	{
		if (!DateValid(txtDateStart.Text))
		{
			result = false;
			lblError.Text = "Start date not valid.";
		}
	}

	if (txtDateEnd.Text.Trim() != string.Empty)
	{
		if (!DateValid(txtDateEnd.Text))
		{
			result = false;
			lblError.Text = "End date not valid.";
		}
	}
	
	return result;

}

protected class FormSessionState
{
	public int TA;
	public string TXDateStart;
	public string TXDateEnd;
	public string TXID;
	public string OrderBy;

	public FormSessionState
	(
		int TA,
		string TXDateStart,
		string TXDateEnd,
		string TXID,
		string OrderBy
	)
	{
		this.TA = TA;
		this.TXDateStart = TXDateStart;
		this.TXDateEnd = TXDateEnd;
		this.TXID = TXID;
		this.OrderBy = OrderBy;
	}
}

private FormSessionState _fstate = null;
protected FormSessionState FormState
{
	get { 
			if (_fstate == null)
			{
				_fstate = (FormSessionState)Session["_TATXHRSFormState"];
				if (_fstate == null)
				{
					_fstate = new FormSessionState(-1, DateTime.Today.AddDays(-7).ToShortDateString(), "", "", "date");
				}
			}
			
			return _fstate;
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
	</script>
						<INPUT type="hidden" name="__command"> <INPUT type="hidden" name="__commandval">
						<SCRIPT language="JavaScript">
function DoDeleteEntry(txhrs_id)
{
 var doit = confirm("Confirm deletion.");
 if (doit == true)
 {

		var theform;
		theform = document.forms["<%= ((HtmlControl)Master.FindControl("oForm")).ClientID %>"];
		theform.__command.value = "delete";
		theform.__commandval.value = txhrs_id;
		theform.submit();
 }

}
						</SCRIPT>
						<asp:Label ID="lblError" Runat="server" ForeColor="Red" /><br>
						<br>
						<h3>TA Treatment Hours</h3>
						<table class="layout">
							<tr>
								<td>TA:</td>
								<td width="218"><asp:dropdownlist id="ddlStaffID" tabIndex="1" runat="server" Width="192px"></asp:dropdownlist></td>
								<td>TX ID:</td>
								<td><asp:textbox id="txtTXID" tabIndex="4" runat="server"></asp:textbox></td>
								<td><asp:button id="btnRefresh" runat="server" Text="Refresh" TabIndex="6" OnClick="Refresh_Click"></asp:button></td>
							</tr>
							<tr>
								<td>TX Date Start:</td>
								<td width="218"><asp:textbox id="txtDateStart" tabIndex="2" runat="server"></asp:textbox></td>
								<td>Order By:</td>
								<td><asp:dropdownlist id="ddlOrderBy" tabIndex="5" runat="server" Width="112px">
										<asp:ListItem Value="date" Selected="True">Date</asp:ListItem>
										<asp:ListItem Value="txid">TX ID</asp:ListItem>
										<asp:ListItem Value="ta">TA</asp:ListItem>
									</asp:dropdownlist></td>
								<td><asp:hyperlink id="addnew" runat="server" NavigateUrl="EditTATXHrs2.aspx" TabIndex="7">Add New</asp:hyperlink></td>
							</tr>
							<tr>
								<td>TX Date End:</td>
								<td width="218"><asp:textbox id="txtDateEnd" tabIndex="3" runat="server"></asp:textbox></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
						<br>
						<asp:datagrid id="dgTATXHrs" runat="server" EnableViewState="False" AutoGenerateColumns="False"
							BorderColor="#999999" BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3"
							GridLines="Vertical">
							<FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
							<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
							<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
							<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#336699"></HeaderStyle>
							<Columns>
								<asp:HyperLinkColumn Text="Edit" DataNavigateUrlField="txhrs_id" DataNavigateUrlFormatString="EditTATXHrs2.aspx?ID={0}"></asp:HyperLinkColumn>
								<asp:TemplateColumn>
									<ItemTemplate>
										<a href='<%# string.Format("javascript:DoDeleteEntry({0})", DataBinder.Eval(Container.DataItem, "txhrs_id")) %>'>
											Delete</a>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="staffshortname" HeaderText="TA"></asp:BoundColumn>
								<asp:BoundColumn DataField="txid" HeaderText="TX ID"></asp:BoundColumn>
								<asp:BoundColumn DataField="txhrsdate" HeaderText="Date" DataFormatString="{0:d}"></asp:BoundColumn>
								<asp:BoundColumn DataField="txhrsexpected" HeaderText="Expected Duration" DataFormatString="{0:f2}"></asp:BoundColumn>
								<asp:BoundColumn DataField="txhrsactual" HeaderText="Actual Duration" DataFormatString="{0:f2}"></asp:BoundColumn>
								<asp:BoundColumn DataField="mis_text" HeaderText="Missed Reason"></asp:BoundColumn>
								<asp:BoundColumn DataField="txhrsnotes" HeaderText="Notes"></asp:BoundColumn>
							</Columns>
						</asp:datagrid>
</asp:Content>