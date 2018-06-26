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
		{
			Init();
			FillDataList();
		}
		else if (Request.Form["__command"] == "delete")
		{
			DoDelete(int.Parse(Request.Form["__commandval"]));
			FillDataList();
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
		
		//add attributes that make enter key work like tab key
		txtTXID.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtDateStart.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");
		txtDateEnd.Attributes.Add("onKeyDown", "if(event.keyCode==13) event.keyCode=9;");

		
			
		// restore control values from session state
		txtTXID.Text = FormState.TXID;
		txtDateStart.Text = FormState.TXDateStart;
		txtDateEnd.Text = FormState.TXDateEnd;


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
		cmd.CommandText = "delete from tx_patxhrs where pahrs_id = @pk";
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
		cmd.CommandText = "spQueryPATXhrs2";
		cmd.CommandType = CommandType.StoredProcedure;
	
		cmd.Parameters.Clear();
		
		cmd.Parameters.Add(new SqlParameter("@txid", System.Data.SqlDbType.VarChar, 4));	
		cmd.Parameters.Add(new SqlParameter("@txdatestart", System.Data.SqlDbType.DateTime, 8));
		cmd.Parameters.Add(new SqlParameter("@txdateend", System.Data.SqlDbType.DateTime, 8));


		if (FormState.TXID != string.Empty)
			cmd.Parameters["@txid"].Value = FormState.TXID;
		else
			cmd.Parameters["@txid"].Value = DBNull.Value;
			
		if (FormState.TXDateStart != string.Empty)
			cmd.Parameters["@txdatestart"].Value = FormState.TXDateStart;
		else
			cmd.Parameters["@txdatestart"].Value = DBNull.Value;
	
		if (FormState.TXDateEnd != string.Empty)
			cmd.Parameters["@txdateend"].Value = FormState.TXDateEnd;
		else
			cmd.Parameters["@txdateend"].Value = DBNull.Value;
	
		conn.Open();
	
		rpPATXHrs.DataSource = cmd.ExecuteReader();
		rpPATXHrs.DataBind();
	}
	catch { throw; }
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
		FormState.TXDateStart =  txtDateStart.Text.Trim();
		FormState.TXDateEnd =  txtDateEnd.Text.Trim();
		
		//update session
        Session["_PATXHRSFormState"] = FormState;
        
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
	public string TXDateStart;
	public string TXDateEnd;
	public string TXID;

	public FormSessionState
	(
		string TXDateStart,
		string TXDateEnd,
		string TXID
	)
	{
		this.TXDateStart = TXDateStart;
		this.TXDateEnd = TXDateEnd;
		this.TXID = TXID;
	}
}

private FormSessionState _fstate = null;
protected FormSessionState FormState
{
	get { 
			if (_fstate == null)
			{
				_fstate = (FormSessionState)Session["_PATXHRSFormState"];
				if (_fstate == null)
				{
					_fstate = new FormSessionState(DateTime.Today.AddDays(-7).ToShortDateString(), "", "");
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


private string prevWeekOf = string.Empty;
private string prevTXID  = string.Empty;
private void rpPATXHrs_ItemDataBound(object sender, RepeaterItemEventArgs e)
{

	if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
	{
		IDataRecord dr = (IDataRecord)e.Item.DataItem;

		int pk = (int)dr["pahrs_id"];
	
		string curWeekOf = dr["weekof"].ToString();
		if ( curWeekOf != prevWeekOf)
		{
			prevWeekOf =  curWeekOf;
			((PlaceHolder)e.Item.FindControl("phWeekOf")).Visible = true;
			prevTXID = string.Empty;
		}
		else
			((PlaceHolder)e.Item.FindControl("phWeekOf")).Visible = false;

		string curTXID = dr["txid"].ToString().ToUpper();
		if ( curTXID != prevTXID)
		{
			prevTXID =  curTXID;
			((PlaceHolder)e.Item.FindControl("phTXID")).Visible = true;
		}
		else
			((PlaceHolder)e.Item.FindControl("phTXID")).Visible = false;
		
	}			

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
						<h3>Parent Treatment Hours</h3>
						<table class="layout">
							<tr>
								<td>TX Date Start:</td>
								<td width="218"><asp:textbox id="txtDateStart" tabIndex="2" runat="server"></asp:textbox></td>
								<td>TX ID:</td>
								<td><asp:textbox id="txtTXID" tabIndex="4" runat="server"></asp:textbox></td>
								<td><asp:button id="btnRefresh" runat="server" Text="Refresh" TabIndex="6" OnClick="Refresh_Click"></asp:button></td>
							</tr>
							<tr>
								<td>TX Date End:</td>
								<td width="218"><asp:textbox id="txtDateEnd" tabIndex="3" runat="server"></asp:textbox></td>
								<td></td>
								<td></td>
								<td><asp:hyperlink id="addnew" runat="server" NavigateUrl="EditPATXHrs2.aspx" TabIndex="7">Add New</asp:hyperlink></td>
							</tr>
						</table>
						<br>
						
						<asp:Repeater ID="rpPATXHrs" Runat="server" OnItemDataBound="rpPATXHrs_ItemDataBound" EnableViewState="False">
						
							<HeaderTemplate>
							<table class="txMainTable">
							</HeaderTemplate>
							
							<ItemTemplate>
								<asp:PlaceHolder ID="phWeekOf" Runat="server">
									<tr><td colspan="8"  class="majorheading" >Week of: <%# DataBinder.Eval(Container.DataItem, "weekof", "{0:ddd M/d/yy}") %></td></tr>
															<tr><td colspan="2"></td>
							<td>Parent</td>
							<td>OT/PT</td>
							<td>Speech</td>
							<td>Other</td>
							<td>Other Desc.</td>
							<td>Notes</td>
							
							</tr>

								</asp:PlaceHolder>
								<asp:PlaceHolder ID="phTXID" Runat="server">
									<tr><td colspan="8" class="minorheading"><%# DataBinder.Eval(Container.DataItem, "txid") %>
									<a href='EditPATXHrs2.aspx?id=<%# DataBinder.Eval(Container.DataItem, "txid") %>&date=<%# DataBinder.Eval(Container.DataItem, "weekof", "{0:d}") %>'>Edit</a>
									</td></tr>
								</asp:PlaceHolder>
									<tr>
									<td><a href='<%# string.Format("javascript:DoDeleteEntry({0})", DataBinder.Eval(Container.DataItem, "pahrs_id")) %>'>
											Delete</a></td>
									<td width="80px"><%# DataBinder.Eval(Container.DataItem, "pahrsdate", "{0:ddd M/d}") %></td>
									<td><%# DataBinder.Eval(Container.DataItem, "pahrspar", "{0:f2}") %></td>
									<td><%# DataBinder.Eval(Container.DataItem, "pahrsot", "{0:f2}") %></td>
									<td><%# DataBinder.Eval(Container.DataItem, "pahrsspc", "{0:f2}") %></td>
									<td><%# DataBinder.Eval(Container.DataItem, "pahrsschoth", "{0:f2}") %></td>
									<td><%# DataBinder.Eval(Container.DataItem, "pahrsoth_desc") %></td>
									<td><%# DataBinder.Eval(Container.DataItem, "pahrsnotes") %></td>
									
									
									</tr>
							</ItemTemplate>	
						
						
							<FooterTemplate>
							</table>
							</FooterTemplate>
						</asp:Repeater>
</asp:Content>