<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="ActionsByActionStatus.aspx.cs" AutoEventWireup="True" Inherits="Measures.ActionsByActionStatus" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

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
	
		<%--DF: 4/12 add ~ --%>
		<asp:HyperLinkColumn HeaderText="Subj.ID" DataNavigateUrlField="SubjID" DataNavigateUrlFormatString="~/Measures/ActionsBySubject.aspx?SubjectID={0}" DataTextField="ID" SortExpression="[ID] ASC" />
		<asp:HyperLinkColumn HeaderText="Subj. Status" DataNavigateUrlField="SubjID" DataNavigateUrlFormatString="~/Measures/EditSubject.aspx?SubjID={0}" DataTextField="SubjStatus" SortExpression="[SubjStatus] ASC" />
		<asp:HyperLinkColumn HeaderText="Action Status" DataNavigateUrlField="ActionID" DataNavigateUrlFormatString="~/Measures/EditAction.aspx?ActionID={0}" DataTextField="ActionStatus" SortExpression="[ActionStatus] ASC" />
		<asp:BoundColumn HeaderText="Comp. By" DataField="Staff_CompBy" SortExpression="[Staff_CompBy] ASC" />
		<asp:BoundColumn HeaderText="Date Done" DataField="DateDone" SortExpression="[DateDone] ASC" />
	</Columns>
</asp:DataGrid>


</asp:Content>