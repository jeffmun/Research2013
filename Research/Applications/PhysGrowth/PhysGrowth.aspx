<%@ Import namespace="System.Data" %>
<%@ Import namespace="System.Data.SqlClient" %>
<%@ Import namespace="System.Data.Common" %>
<%@ Import namespace="System.Configuration" %>

<%@ Page language="C#"   MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<script runat="server">


protected SqlConnection conn = new SqlConnection();
protected SqlCommand cmd = new SqlCommand();

protected void Page_Load(object sender, EventArgs e)
{
	
	try {
		conn.ConnectionString = ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"];
		cmd.Connection = conn;
		conn.Open();	
		
		lblError.Visible = false;	
		lblLookupError.Visible = false;
		

		// if postback then either delete or lookup
		if (IsPostBack)
		{
			if (_command.Value == "delete")
			{// do deletion
				cmd.CommandText = "spPhysGrowthDeleteByPK";
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Clear();
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pk", System.Data.SqlDbType.Int, 4));
				cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datatype", System.Data.SqlDbType.VarChar, 2));

				cmd.Parameters["@pk"].Value = int.Parse(_hiddenDataA.Value);
				cmd.Parameters["@datatype"].Value = _hiddenDataB.Value;
			
				cmd.ExecuteNonQuery();		
			}
			else if (_command.Value == "lookup")
			{
				if (lbStudyID.SelectedIndex == -1)
				{
					lblLookupError.Visible = true;
					lblLookupError.Text = "Select a study first.";
				}
				else if (txtID.Text.Trim() == String.Empty)
				{
					lblLookupError.Visible = true;
					lblLookupError.Text = "Enter the ID to lookup first.";
				}
				else
				{	//do lookup by redirecting back here with studyid and id in querystring
				
					string surl = "PhysGrowth.aspx?StudyID=" + lbStudyID.SelectedValue + "&ID="  + txtID.Text.Trim();
					Response.Redirect(surl, true);
				}
			}
		}
		else
		{
			// fill studyid list box.
			SetupLookup();
		}


		// add links to edit form
		if (Request["ID"] != String.Empty && Request["ID"] != null && 
		Request["StudyID"] != String.Empty && Request["StudyID"] != null)
		{	
			hlAdd.NavigateUrl = "EditPhysGrowth.aspx?mode=add&studyID=" + Request["StudyID"] + "&ID=" + Request["ID"];
			hlVerify.NavigateUrl = "EditPhysGrowth.aspx?mode=verify&studyID=" + Request["StudyID"] + "&ID=" + Request["ID"];
		}
		else if (Request["StudyID"] != String.Empty && Request["StudyID"] != null)
		{	
			hlAdd.NavigateUrl = "EditPhysGrowth.aspx?mode=add&studyID=" + Request["StudyID"];
			hlVerify.NavigateUrl = "EditPhysGrowth.aspx?mode=verify&studyID=" + Request["StudyID"];
		}
		else
		{	
			hlAdd.NavigateUrl = "EditPhysGrowth.aspx?mode=add";
			hlVerify.NavigateUrl = "EditPhysGrowth.aspx?mode=verify";
		}
		

		// always read phys growth data if studyid and id passed in querystring
		if (Request["ID"] != String.Empty && Request["ID"] != null && 
		Request["StudyID"] != String.Empty && Request["StudyID"] != null)
		{
			cmd.CommandText = "spPhysGrowth";
			cmd.CommandType = CommandType.StoredProcedure;

			cmd.Parameters.Clear();
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ID", System.Data.SqlDbType.VarChar, 50));
			cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@datadate", System.Data.SqlDbType.DateTime, 8));
			
			cmd.Parameters["@studyid"].Value = int.Parse(Request["StudyID"]);
			cmd.Parameters["@ID"].Value = Request["ID"];
			cmd.Parameters["@datadate"].Value = DBNull.Value;
		
			rpData.DataSource = cmd.ExecuteReader();
			rpData.DataBind();
			
		}
	
	}
	catch (Exception ex)
	{
		lblError.Visible = true;
		lblError.Text = ex.Message;
	}
	finally
	{
		if (conn != null) conn.Close();
	}
		
}

private void SetupLookup()
{
  string sql = "select distinct s.studyID, s.studyname from uwautism_research_backend..tblStudyMeas sm, uwautism_research_backend..tblStudy s where s.studyID not in (1027,1028) AND ((sm.studyID = s.studyID AND sm.measureID = 181) OR (sm.studyID = s.studyID AND sm.measureID = 151 ) OR (sm.studyID = s.studyID AND sm.measureID = 86 ) OR (s.studyID in (1,1008)) ) order by s.studyname; ";
	cmd.CommandText = sql;

	cmd.CommandType = CommandType.Text;
	cmd.Parameters.Clear();
	SqlDataReader r = cmd.ExecuteReader();
	lbStudyID.DataTextField = "studyname";
	lbStudyID.DataValueField = "studyid";
	lbStudyID.DataSource = r;
	lbStudyID.DataBind();
	r.Close();
	
	// set studyid or id if available in query string
	if (Request["StudyID"] != String.Empty && Request["StudyID"] != null)
		lbStudyID.SelectedValue = Request["StudyID"];
	else
		lbStudyID.SelectedIndex = -1;
		
	if (Request["ID"] != String.Empty && Request["ID"] != null)
		txtID.Text = Request["ID"];
		
}


private string prevDataDate = string.Empty;
private void rpData_ItemDataBound(object sender, RepeaterItemEventArgs e)
{
	if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
	{
		DbDataRecord dr = (DbDataRecord)e.Item.DataItem;
	
		string curDataDate = String.Format( "{0:d}", dr["datadate"]);
		if ( curDataDate != prevDataDate)
		{
			prevDataDate =  curDataDate;
			((PlaceHolder)e.Item.FindControl("phNewDataDate")).Visible = true;
		}
		else
			((PlaceHolder)e.Item.FindControl("phNewDataDate")).Visible = false;

	}			
}

</script>

					<asp:Label ID="lblError" ForeColor="Red" Runat="server"/><br>
					
					<script language="javascript">
					function doCommand(a, b, command)
					{

						var theform;
						//theform = document.forms["mainForm"];
						theform = document.forms['<%= ((HtmlControl)Master.FindControl("oForm")).ClientID %>'];

						if (command == "delete")
						{
							if (confirm("Delete record?"))
							{
								theform.<%= _hiddenDataA.ClientID %>.value = a;
								theform.<%= _hiddenDataB.ClientID %>.value = b;
								theform.<%= _command.ClientID %>.value = command;

								theform.submit();
							}
						}
						else if (command == "lookup")
						{
							theform.<%= _command.ClientID %>.value = command;
							theform.submit();
						}
					}
					
					</script>
					
					<input type="hidden" id="_hiddenDataA" runat="server" NAME="_hiddenDataA"/>
					<input type="hidden" id="_hiddenDataB" runat="server" NAME="_hiddenDataB"/>
					<input type="hidden" id="_command" runat="server" NAME="_command"/>
					<table class="layout" width="100%">
						<tr>
							<td><h3>Physical Growth Data</h3></td>
							<td ><table class="layout" bgcolor="#a1b5cf">
								<tr><td colspan="2">Lookup existing growth data<br><asp:Label ID="lblLookupError" Runat="server"  ForeColor="Red"/></td></tr>
								<tr><td>Study:</td><td><asp:DropDownList id="lbStudyID" Runat="server" DataValueField="studyid" DataTextField="studyname"></asp:DropDownList></td></tr>
							<tr><td>ID:</td><td><asp:TextBox id="txtID" runat="server" onKeyDown="if(event.keyCode==13) doCommand('','','lookup');"></asp:TextBox></td></tr>
							<tr><td><input type="button"  value="Lookup" onclick="doCommand('','','lookup')"/></td><td></td></tr>
							</table>
							</td>
						</tr>
					</table>
					<asp:HyperLink id="hlAdd" Text="Add" Runat="server" />
					<asp:HyperLink ID="hlVerify" Text="Double Enter" Runat="server" />
					<!--<a href="EditPhysGrowth.aspx?mode=add&studyID=<%= Request["StudyID"] %>&ID=<%= Request["ID"] %>">Add</a>&nbsp;
					<a href="EditPhysGrowth.aspx?mode=verify&studyID=<%= Request["StudyID"] %>&ID=<%= Request["ID"] %>">Double Enter</a>-->
					
					&nbsp;*=Double Entered
					
					<br><br>
						<asp:Repeater ID="rpData" Runat="server" OnItemDataBound="rpData_ItemDataBound">
							<HeaderTemplate>
							<table class="grid">
							<tr>
								<td class="heading"></td>
								<td class="heading">Subject</td>
								<td class="heading">Type</td>
								<td class="heading">Data1</td>
								<td class="heading">Data2</td>
								<td class="heading">Age(mos)</td>
								<td class="heading">Validity</td>
								<td class="heading">Z</td>
								<td class="heading">Ztxt</td>
								<td class="heading">Pctile</td>
								<td class="heading">Source</td>
								<td class="heading">Notes</td>
							</tr>
							</HeaderTemplate>
							<ItemTemplate>
								<asp:PlaceHolder ID="phNewDataDate" Runat="server">	
									<tr><td colspan="10"><b><%# DataBinder.Eval(Container.DataItem, "datadate", "{0:d}") %> </b>
									
									
									</td></tr>
								</asp:PlaceHolder>
								<tr>								
								<td>
									<a href="EditPhysGrowth.aspx?mode=edit&datatype=
									<%# DataBinder.Eval(Container.DataItem, "datatype") %>&pk=
									<%# DataBinder.Eval(Container.DataItem, "pk") %>">Edit</a>&nbsp;
								<a href="javascript:doCommand('<%# DataBinder.Eval(Container.DataItem, "pk") %>', '<%# DataBinder.Eval(Container.DataItem, "datatype") %>','delete')">delete</a>

								<td><%# DataBinder.Eval(Container.DataItem, "studyname") + ": " + DataBinder.Eval(Container.DataItem, "id") %></td>
								<td><%# DataBinder.Eval(Container.DataItem, "datatype")%><%#((int)DataBinder.Eval(Container.DataItem, "verified")==1)?"*":"" %></td>
								<td><%# string.Format("{0:f}{1}", DataBinder.Eval(Container.DataItem, "data1"), DataBinder.Eval(Container.DataItem, "units")) %></td>
								<td><%# string.Format("{0:f}{1}", DataBinder.Eval(Container.DataItem, "data2"), DataBinder.Eval(Container.DataItem, "units")) %></td>
								<td><%# DataBinder.Eval(Container.DataItem, "agemo") %></td>
                                <td><%# DataBinder.Eval(Container.DataItem, "validity") %></td>
                                <td><%# DataBinder.Eval(Container.DataItem, "Z") %></td>
								<td><%# DataBinder.Eval(Container.DataItem, "Ztxt") %></td>
								<td><%# DataBinder.Eval(Container.DataItem, "pctile") %></td>
								<td><%# DataBinder.Eval(Container.DataItem, "source") %></td>
								<td><%# DataBinder.Eval(Container.DataItem, "notes") %></td></tr>
							</ItemTemplate>
							<FooterTemplate>
							</table>
							</FooterTemplate>
						</asp:Repeater>
						
</asp:Content>