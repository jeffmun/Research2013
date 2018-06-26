<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true"  CodeFile="FutureHouseholdActions.aspx.cs" Inherits="WebCal.FutureHouseholdActions" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<asp:DataGrid	ID="tblActions"
				runat="server"
				CssClass="tblReport"
				GridLines="None"
				AutoGenerateColumns="False"
				OnItemDataBound="Item_Bound"
				Caption="Scheduled Actions">
	<HeaderStyle CssClass="trHeader" />
	<AlternatingItemStyle CssClass="trDark" />
	<Columns>
		<asp:BoundColumn HeaderText="Subj. Name" DataField="Subj. Name" />
		<asp:BoundColumn HeaderText="Study" DataField="Study" />
		<asp:HyperLinkColumn HeaderText="Action" DataNavigateUrlFormatString="~/Measures/EditAction.aspx?ActionID={0}" DataNavigateUrlField="_ActionID" DataTextField="Action" />
		<asp:BoundColumn HeaderText="" DataField="Study" />
		<asp:BoundColumn HeaderText="Date/Time" DataField="Date" />
		<asp:BoundColumn HeaderText="Resp. For" DataField="Resp. For" />
		<asp:BoundColumn HeaderText="Comp. By" DataField="Comp. By" />
	</Columns>
</asp:DataGrid>

</asp:Content>