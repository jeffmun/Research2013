<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="DataEntryForms.aspx.cs" AutoEventWireup="True" Inherits="DataEntryForms.DataEntryForms" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<div class="default"><asp:datagrid id="DataGrid1" runat="server" GridLines="Vertical" CellPadding="3" BackColor="White"
		BorderWidth="1px" BorderStyle="None" BorderColor="#999999" Width="392px" AutoGenerateColumns="False">
		<FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
		<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
		<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
		<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
		<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#336699"></HeaderStyle>
		<Columns>
			<asp:BoundColumn DataField="studyname" HeaderText="Study">
				<HeaderStyle Width="150px"></HeaderStyle>
				<ItemStyle Wrap="False"></ItemStyle>
			</asp:BoundColumn>
			<asp:BoundColumn DataField="measname" HeaderText="Measure"></asp:BoundColumn>
			<asp:HyperLinkColumn DataNavigateUrlField="formurl" DataTextField="formurl" HeaderText="Link"></asp:HyperLinkColumn>
		</Columns>
		<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
	</asp:datagrid></div>

</asp:Content>