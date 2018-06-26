<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="ActionsBySubject.aspx.cs" AutoEventWireup="True" Inherits="Measures.ActionsBySubject" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblReport">
	<tr class="trTitle">
		<td style="border-bottom: 0px;">
			<div id="divTitle" runat="server"></div>
			
			<div class="DoNotPrint" style="font-size: 8pt;">
				<a id="aHideNAActions" runat="server" onserverclick="HideNAActions">Hide NA Actions</a> |
				<a id="aViewMeasures" runat="server">View Measures</a> |
				<a id="aViewConsents" runat="server">View Consent Forms</a> |
				<a id="aViewHousehold" runat="server">View Household</a>
			</div>
			
			<asp:DropDownList ID="selStudyID" runat="server" style="font-size: 7pt;" /><asp:TextBox ID="txtID" runat="server" style="font-size: 7pt; width: 50px;" /><asp:Button ID="btnChangeSubject" runat="server" Text="Update" OnClick="ChangeSubject" style="font-size: 7pt;" />
			
			<div class="verysmalltext"><% =DateTime.Now.ToString("MM/dd/yyyy hh:mm tt") %></div>
		</td>
	</tr>
</table>
<asp:DataGrid	ID="tblReport"
				runat="server"
				CssClass="tblReport"
				GridLines="None"
				AutoGenerateColumns="False"
				AllowSorting="True"
				OnItemDataBound="Item_Bound"
				OnSortCommand="SortResults">
	<HeaderStyle CssClass="trHeader" />
	<AlternatingItemStyle CssClass="trDark" />
	<Columns>
		<asp:BoundColumn HeaderText="Edit" />
		
			<%--DF: 4/12 add ~ --%>
		<asp:HyperLinkColumn HeaderText="Action" DataNavigateUrlField="ActionID" DataNavigateUrlFormatString="~/Measures/EditAction.aspx?ActionID={0}" DataTextField="Action_ActionText" SortExpression="[Action_ActionText] ASC" />
		<asp:BoundColumn HeaderText="Action Type" DataField="ActionType" SortExpression="[ActionType] ASC" />
		<asp:BoundColumn HeaderText="Action Status" DataField="ActionStatus" SortExpression="[ActionStatus] ASC" />
	<%--	<asp:BoundColumn HeaderText="Lab" DataField="LabName" SortExpression="[LabName] ASC" />  
		<asp:BoundColumn HeaderText="Resp. For" DataField="Staff_RespFor" SortExpression="[Staff_RespFor] ASC" />--%>
		<asp:BoundColumn HeaderText="Comp. By" DataField="Staff_CompBy" SortExpression="[Staff_CompBy] ASC" />
		<asp:BoundColumn HeaderText="Date Done" DataField="DateDone" SortExpression="[DateDone] ASC" />
	</Columns>
</asp:DataGrid>
<asp:HiddenField ID="hidHideNA" runat="server" Value="false" />

<p class="DoNotPrint">
	<input type="button" name="btnEditActions" value="Mark Checked Actions as Complete" id="btnEditActions" runat="server" />
</p>
</asp:Content>