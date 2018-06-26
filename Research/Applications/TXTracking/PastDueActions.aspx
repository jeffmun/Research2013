<%@ Page language="c#" Inherits="EditableWeeklyCalendar.PastDueActions" CodeFile="PastDueActions.aspx.cs"     MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
		<table class="layout">
		<tr>
			<td width="100px"><a href="IntakeActions.aspx">Intake Actions</a></td>
			<td width="100px" ><a href="WeeklyActions.aspx">Weekly Actions</a></td>
			<td width="100px"><a href="PastDueActions.aspx">Past Due Actions</a></td>
			<td width="100px"><a href="StaffEditActions.aspx">Assigned Actions</a></td>
		</tr>
		</table><br>

					<span style="FONT-WEIGHT: bold; FONT-SIZE: 12pt">Past Due Actions</span> (All actions due today or earlier with status 'To Be Done')<br>
					<asp:Label ID="lblError" Runat="server" ForeColor="Red" Visible="false" EnableViewState="false"/><br>
					
					<table class="grid">
					<tr><td width="200px" class="heading">Use the check boxes to select all of the actions you want to mark as complete.<br><br>
					Set the desired values for Date Done and Completed By then click the 'Set to Complete' button. 
					</td>
					
					<td>
					
					Date Done<br><asp:TextBox ID="txtDateDone" Runat="server"/><br>
					Completed By<br><asp:DropDownList ID="ddlCompletedBy" Runat="server"/><br><br>
					<asp:Button ID="btnSetComplete" Runat="server" Text="Set to Complete" OnClick="btnSetComplete_Click" />
					
					</td>
					</table><br>

					<table class="grid">
					<tr><td width="200px" class="heading">Use the check boxes to select all of the actions you want to assign.<br><br>
					Set the desired value for Responsible For then click the 'Assign' button. 
					</td>
					
					<td>
					Responsible For<br><asp:DropDownList ID="ddlRespFor" Runat="server"/><br><br>
					<asp:Button ID="btnAssign" Runat="server" Text="Assign" OnClick="btnAssign_Click" />
					
					</td>
					</table><br>

					
					<asp:Repeater id="rpPastDue" Runat="server">
							<HeaderTemplate>
								<table class="txMainTable" style="WIDTH: 100%">
							</HeaderTemplate>
					
							<ItemTemplate>
									<asp:PlaceHolder ID="phNewWeekOfPastDue" Runat="server">
										<tr >
										
											<td colspan="8" class="majorheading" align="center" >
												<%# DataBinder.Eval(Container.DataItem, "weekof", "Week Of: {0:ddd M/d/yy}") %></td></tr>
											<tr>
												<td class="heading">Select</td>
												<td class="heading">Date Due/Done</td>
												<td class="heading">Resp. For</td>
												<td class="heading">Comp. By</td>
												<td class="heading" width="80px">Status</td><td class="heading">Subject</td>
												<td class="heading">Action</td><td class="heading">Notes</td>
											</tr>
									</asp:PlaceHolder>
									<tr>
										<td><asp:CheckBox ID="chkEdit" Runat="server" Checked="False"  OnCheckedChanged="chkEdit_CheckedChanged"/>
										<INPUT type="hidden" id="txtActionID" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "actionid") %>' NAME="txtActionID"/>
										</td>
										<td><%# DataBinder.Eval(Container.DataItem, "duedate4") %></td>
										<td><%# DataBinder.Eval(Container.DataItem, "staffshortname") %></td>
										<td><%# DataBinder.Eval(Container.DataItem, "completedby_staffshortname") %></td>
										<td><%# DataBinder.Eval(Container.DataItem, "actionstatus") %></td>
										<td>
										<a href=<%# Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + DataBinder.Eval(Container.DataItem, "householdid") %>><%# DataBinder.Eval(Container.DataItem, "id") %></a>
										</td>
										<td>
										<a href=<%# Request.ApplicationPath + "/measures/EditAction.aspx?ActionID=" + DataBinder.Eval(Container.DataItem, "actionid") %>><%# DataBinder.Eval(Container.DataItem, "actiontype") + " - " + DataBinder.Eval(Container.DataItem, "actiontext") %></a>
										
										
										</td>
										<td><%# DataBinder.Eval(Container.DataItem, "notes") %></td>
									</tr>
								
							</ItemTemplate>
							<FooterTemplate>
								</table>
							</FooterTemplate>							


					</asp:Repeater><br>

					
</asp:Content>