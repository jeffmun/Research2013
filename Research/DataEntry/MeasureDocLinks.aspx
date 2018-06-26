<%@ Page CodeFile="~/DataEntry/MeasureDocLinks.aspx.cs" 
MasterPageFile="~/UWAC.master" Inherits="DataEntry.MeasureDocLinks"  Language="C#" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<asp:DataGrid id="DataGrid1" runat="server" AutoGenerateColumns="False" Width="740px" BorderColor="#888888"
	BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3" GridLines="Vertical">
	<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
	<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
	<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#336699"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="studyname" HeaderText="Study">
			<HeaderStyle Width="150px"></HeaderStyle>
			<ItemStyle Wrap="False" BorderColor="Red"></ItemStyle>
		</asp:BoundColumn>
		<asp:BoundColumn DataField="timepoint_text" HeaderText="TimePoint">
			<HeaderStyle Width="150px"></HeaderStyle>
			<ItemStyle Wrap="False"></ItemStyle>
		</asp:BoundColumn>
		<asp:BoundColumn DataField="studymeasname" HeaderText="Measure">
			<HeaderStyle Width="150px"></HeaderStyle>
			<ItemStyle Wrap="False"></ItemStyle>
		</asp:BoundColumn>
		<asp:TemplateColumn HeaderText="Data Entry Form"> 
			<HeaderStyle Width="110px"></HeaderStyle>
			<ItemStyle Wrap="False"></ItemStyle>
			<ItemTemplate>
                <asp:HyperLink ID="hyp1" runat="server" NavigateUrl='<%# Eval("DEform_URL") %>' Text='<%# Eval("DEform_URL_text") %>' ></asp:HyperLink>
<%--				<%# MakeDEFormLink(DataBinder.Eval(Container.DataItem, "DEform_URL").ToString()) %>--%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Data Entry Instructions">
			<HeaderStyle Width="110px"></HeaderStyle>
			<ItemStyle Wrap="False"></ItemStyle>
			<ItemTemplate>
				<%# MakeDEDocsLink(DataBinder.Eval(Container.DataItem, "WebDocsPath").ToString(), DataBinder.Eval(Container.DataItem, "DEinstruct_file").ToString()) %>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Variable Map">
			<HeaderStyle Width="110px"></HeaderStyle>
			<ItemStyle Wrap="False"></ItemStyle>
			<ItemTemplate>
				<%# MakeDEDocsVarMapLink(DataBinder.Eval(Container.DataItem, "WebDocsPath").ToString(), DataBinder.Eval(Container.DataItem, "VarMap_file").ToString()) %>
			</ItemTemplate>
		</asp:TemplateColumn>
 		<asp:TemplateColumn HeaderText="Measure Documentation">
			<HeaderStyle Width="110px"></HeaderStyle>
			<ItemStyle Wrap="False"></ItemStyle>
 			<ItemTemplate>
				<%# MakeDEDocsNWLink(DataBinder.Eval(Container.DataItem, "ReportsPath").ToString(), DataBinder.Eval(Container.DataItem, "measureID").ToString()) %>
			</ItemTemplate>
		</asp:TemplateColumn>
 		<asp:TemplateColumn HeaderText="Data Dictionary">
			<HeaderStyle Width="110px"></HeaderStyle>
			<ItemStyle Wrap="False"></ItemStyle>
 			<ItemTemplate>
				<%# MakeDDlink(DataBinder.Eval(Container.DataItem, "DDlink").ToString(), DataBinder.Eval(Container.DataItem, "DDlink_text").ToString()) %>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</asp:DataGrid>
</asp:Content>