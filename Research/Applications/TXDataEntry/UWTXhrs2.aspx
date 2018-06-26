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
		
		// restore control values from session state
		txtTXID.Text = FormState.TXID;
		txtDateStart.Text = FormState.TXDateStart;
		txtDateEnd.Text = FormState.TXDateEnd;
		ddlSortBy.SelectedValue = FormState.sortby;


	}
	catch {}
}

protected void DoDelete(int pk)
{
	try
	{
		cmd.CommandText = "delete from tx_uwtxhrs2 where uwhrs_id = @pk";
		cmd.CommandType = CommandType.Text;
	
		cmd.Parameters.Clear();
		cmd.Parameters.Add(new SqlParameter("@pk", System.Data.SqlDbType.Int, 4));
		cmd.Parameters["@pk"].Value = pk;
		
		conn.Open();
		cmd.ExecuteNonQuery();
	}
	catch(Exception ex)
	{
		string s = ex.Message;
	}
	finally
	{
		if (conn != null) conn.Close();
	}
}


protected DataSet ds = new DataSet();

protected void FillDataList()
{
	try
	{
		SqlDataAdapter da = new SqlDataAdapter();
		cmd.CommandText = "spQueryUWTXhrs2";
		cmd.CommandType = CommandType.StoredProcedure;
	
		cmd.Parameters.Clear();
		
		cmd.Parameters.Add(new SqlParameter("@txid", System.Data.SqlDbType.VarChar, 4));	
		cmd.Parameters.Add(new SqlParameter("@txdatestart", System.Data.SqlDbType.DateTime, 8));
		cmd.Parameters.Add(new SqlParameter("@txdateend", System.Data.SqlDbType.DateTime, 8));
		cmd.Parameters.Add(new SqlParameter("@sortby", System.Data.SqlDbType.VarChar, 50));	


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
	

		if (FormState.sortby != string.Empty)
			cmd.Parameters["@sortby"].Value = FormState.sortby;
		else
			cmd.Parameters["@sortby"].Value = DBNull.Value;



		da.SelectCommand = cmd;
		da.Fill(ds);
		
		rpUWTXHrs.DataSource = ds.Tables[0];
		rpUWTXHrs.DataBind();
		
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
		FormState.sortby = ddlSortBy.SelectedValue;
		
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
	public string sortby;

	public FormSessionState
	(
		string TXDateStart,
		string TXDateEnd,
		string TXID,
		string sortby
	)
	{
		this.TXDateStart = TXDateStart;
		this.TXDateEnd = TXDateEnd;
		this.TXID = TXID;
		this.sortby = sortby;
	}
}

private FormSessionState _fstate = null;
protected FormSessionState FormState
{
	get { 
			if (_fstate == null)
			{
				_fstate = (FormSessionState)Session["_UWTXHRSFormState"];
				if (_fstate == null)
				{
					_fstate = new FormSessionState(DateTime.Today.AddDays(-7).ToShortDateString(), "", "","date");
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
private void rpUWTXHrs_ItemDataBound(object sender, RepeaterItemEventArgs e)
{

	if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
	{
		DataRowView dr = (DataRowView)e.Item.DataItem;

		int pk = (int)dr["uwhrs_id"];
		
		string curWeekOf = dr["weekof"].ToString();
		if ( curWeekOf != prevWeekOf)
		{
			prevWeekOf =  curWeekOf;
			((PlaceHolder)e.Item.FindControl("phWeekOf")).Visible = true;
		}
		else
			((PlaceHolder)e.Item.FindControl("phWeekOf")).Visible = false;


		// get activites
		string activities = "<ul>";
		DataRow[] rows = ds.Tables[1].Select(string.Format("uwhrs_id = {0}", pk), "activityID");
		foreach(DataRow dataRow in rows)
		{
			activities += "<li>" + dataRow["activityID"].ToString() + ":&nbsp;" + dataRow["activity"].ToString() + "</li>";
		}
		activities += "</ul>";
		((Label)e.Item.FindControl("lblActivities")).Text = activities;

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
						<h3>UW Treatment Hours</h3>
						<table class="layout">
							<tr>
								<td>TX Date Start:</td>
								<td width="218"><asp:textbox id="txtDateStart" tabIndex="2" runat="server" onKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox></td>
								<td>TX ID:</td>
								<td><asp:textbox id="txtTXID" tabIndex="4" runat="server" onKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox></td>
								<td><asp:button id="btnRefresh" runat="server" Text="Refresh" TabIndex="6" OnClick="Refresh_Click"></asp:button></td>
							</tr>
							<tr>
								<td>TX Date End:</td>
								<td width="218"><asp:textbox id="txtDateEnd" tabIndex="3" runat="server"  onKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:textbox></td>
								<td>Order By:</td>
								<td><asp:dropdownlist id="ddlSortBy" tabIndex="5" runat="server" Width="112px" onKeyDown="if(event.keyCode==13) event.keyCode=9;">
										<asp:ListItem Value="date" Selected="True">Date</asp:ListItem>
										<asp:ListItem Value="txid">TX ID</asp:ListItem>
									</asp:dropdownlist></td>
								<td><asp:hyperlink id="addnew" runat="server" NavigateUrl="EditUWTXHrs2.aspx" TabIndex="7">Add New</asp:hyperlink></td>
							</tr>
						</table>
						<br>
						
						<asp:Repeater ID="rpUWTXHrs" Runat="server" OnItemDataBound="rpUWTXHrs_ItemDataBound" EnableViewState="False">
						
							<HeaderTemplate>
								<table class="txMainTable">


							</HeaderTemplate>
							
							<ItemTemplate>
								<asp:PlaceHolder ID="phWeekOf" Runat="server">
									<tr><td colspan="9"  class="majorheading" >Week of: <%# DataBinder.Eval(Container.DataItem, "weekof", "{0:ddd M/d/yy}") %></td></tr>
								<tr>
								<td ></td>
								<td class="heading">Date</td>
								<td class="heading">TXID</td>
								<td class="heading">Total Session Time</td>
								<td class="heading">Time with Child</td>
								<td class="heading">Other Time</td>
								<td class="heading">Activities</td>
								<td class="heading">Miss Reason</td>
								<td class="heading">Notes</td>
								</tr>
								</asp:PlaceHolder>

									<tr>
									<td><a href='EditUWTXHrs2.aspx?PK=<%# DataBinder.Eval(Container.DataItem, "uwhrs_id") %>'>Edit</a>&nbsp;
									<a href='<%# string.Format("javascript:DoDeleteEntry({0})", DataBinder.Eval(Container.DataItem, "uwhrs_id")) %>'>
											Delete</a></td>
									<td width="80px"><%# DataBinder.Eval(Container.DataItem, "uwhrsdate", "{0:ddd M/d}") %></td>
									<td><%# DataBinder.Eval(Container.DataItem, "txid") %></td>
									<td><%# DataBinder.Eval(Container.DataItem, "uwhrstot", "{0:f2}") %></td>
									<td><%# DataBinder.Eval(Container.DataItem, "uwhrsch", "{0:f2}") %></td>
									<td><%# DataBinder.Eval(Container.DataItem, "uwhrsoth", "{0:f2}") %></td>
									<td><asp:Label ID="lblActivities" Runat="server" /></td>
									<td><%# DataBinder.Eval(Container.DataItem, "missreason", "{0:f2}") %></td>
									<td><%# DataBinder.Eval(Container.DataItem, "uwhrsnotes") %></td>
									
									
									</tr>
							</ItemTemplate>
							
													
							<FooterTemplate>
								</table>
							</FooterTemplate>
							
						</asp:Repeater>
</asp:Content>