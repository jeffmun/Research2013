<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="StaffList.aspx.cs" AutoEventWireup="True" Inherits="StaffList" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<asp:DataGrid	ID="tblStaffList"
				runat="server"
				CssClass="tblReport"
				AutoGenerateColumns="False"
				GridLines="None"
				AlternatingItemStyle-CssClass="trDark"
				OnItemDataBound="Item_Bound">
	<HeaderStyle CssClass="trHeader" />
	<Columns>
		<asp:TemplateColumn HeaderText="Staff Name">
			<ItemTemplate>
				<%# DataBinder.Eval(Container.DataItem, "LastName") %>, <%# DataBinder.Eval(Container.DataItem, "FirstName") %>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:HyperLinkColumn HeaderText="Email Address" DataNavigateUrlFormatString="mailto:{0}" DataNavigateUrlField="Email" DataTextField="Email" />
		<asp:BoundColumn HeaderText="Work Phone" DataField="Phone_Work" />
		<asp:BoundColumn HeaderText="Home Phone" DataField="Phone_Home" />
		<asp:BoundColumn HeaderText="Other Phone" DataField="Phone_Other" />
		<asp:BoundColumn HeaderText="Office" DataField="OfficeLocation" />
		<asp:BoundColumn HeaderText="Staff Type" DataField="StaffType" />
	</Columns>
</asp:DataGrid>

</asp:Content>