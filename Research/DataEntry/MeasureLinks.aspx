<%@ Page CodeFile="~/DataEntry/MeasureLinks.aspx.cs" MasterPageFile="~/UWAC.master" Inherits="DataEntry.MeasureLinks" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<asp:DataGrid id="DataGrid1" runat="server" AutoGenerateColumns="False" Width="392px" BorderColor="#999999"
	BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3" GridLines="Vertical">
	<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
	<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
	<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#336699"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="studyname" HeaderText="Study">
			<HeaderStyle Width="150px"></HeaderStyle>
			<ItemStyle Wrap="False"></ItemStyle>
		</asp:BoundColumn>
		<asp:BoundColumn DataField="measname" HeaderText="Measure"></asp:BoundColumn>
		<asp:TemplateColumn HeaderText="Data Entry Form">
			<ItemTemplate>
			<%# MakeDEFormLink(DataBinder.Eval(Container.DataItem, "DEform_URL").ToString()) %>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Data Entry Instructions">
			<ItemTemplate>
			<%# MakeDEDocsLink(DataBinder.Eval(Container.DataItem, "WebDocsPath").ToString(), DataBinder.Eval(Container.DataItem, "DEinstruct_file").ToString()) %>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Var Map">
			<ItemTemplate>
			<%# MakeDEDocsLink(DataBinder.Eval(Container.DataItem, "WebDocsPath").ToString(), DataBinder.Eval(Container.DataItem, "VarMap_file").ToString()) %>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Admin Protocol">
			<ItemTemplate>
			<%# MakeDEDocsLink(DataBinder.Eval(Container.DataItem, "WebDocsPath").ToString(), DataBinder.Eval(Container.DataItem, "AdminProt_file").ToString()) %>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</asp:DataGrid>

</asp:Content>