<%@ Page Language="c#" Debug="true"  EnableEventValidation="false" MasterPageFile="~/UWAC.master" 
CodeFile="NDARcsv.aspx.cs" AutoEventWireup="true"
 Inherits="NDAR_NDARcsv" Title="NDAR files"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<br />    <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="DarkRed"></asp:Label><br />
<br />
    <asp:Label ID="Label1" runat="server" Text="Files in NDAR to do:" Font-Size="Medium" Font-Bold="true"></asp:Label>
    <br /><br />

<table>
<tr>
<td width = "400px"><asp:Label ID="Label2" runat="server" Text="Limit to folder: "></asp:Label>&nbsp;<asp:TextBox ID="txtSubFolder" runat="server" Text="todo"></asp:TextBox></td>    
<%--<td width = "400px"> <asp:Label ID="Label3" runat="server" Text="Remove this file: "></asp:Label>&nbsp;<asp:TextBox ID="txtTblToDelete" runat="server" Text=""></asp:TextBox>
    <asp:Button ID="Button3" runat="server" Text="Remove" OnClick="RemoveNDARcsv" />
</td>    --%>
</tr></table>
<br />
<br />
    <asp:TreeView ID="TreeView1" runat="server">
    </asp:TreeView>
<br />
<br />
    <asp:Button ID="btnHideDataTable" runat="server" Text="Hide Data Table" OnClick="HideDataTable" Visible="false"/> 
    <asp:Panel ID="Panel_ndarcsv" runat="server">
    </asp:Panel>
<br />
<br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"   >
    <Columns>
    <asp:TemplateField>
    <HeaderTemplate>CSV</HeaderTemplate>
    <ItemTemplate>
        <asp:Button ID="Button2" runat="server" Text="view" OnCommand="GridView1_RowCommand"   CommandName="ViewNDARcsvTable" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name") %>'  />
    </ItemTemplate>
    </asp:TemplateField>
    
    <asp:BoundField DataField="Name" HeaderText="Name" />
    
    <asp:TemplateField>
    <HeaderTemplate>Delete</HeaderTemplate>
    <ItemTemplate>
        <asp:Button ID="Button3" runat="server" Text="delete" ForeColor="DarkRed" OnCommand="GridView1_RowCommand"   CommandName="DeleteNDARcsv" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name") %>'  />
    </ItemTemplate>
    </asp:TemplateField>
    
    <asp:BoundField DataField="Length" HeaderText="Length" />
    <asp:BoundField DataField="CreationTime" HeaderText="CreationTime" />
    <asp:BoundField DataField="DirectoryName" HeaderText="DirectoryName" />


        
    </Columns>
    </asp:GridView>


</asp:Content>
