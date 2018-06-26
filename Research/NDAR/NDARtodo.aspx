<%@ Page Language="c#" Debug="true"  EnableEventValidation="false" MasterPageFile="~/UWAC.master" 
CodeFile="NDARtodo.aspx.cs" AutoEventWireup="true"
 Inherits="NDAR_NDARtodo" Title="NDAR to do"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<br /><br />
    <asp:Label ID="Label1" runat="server" Text="Files in NDAR to do:"></asp:Label>
<br />
<br />
    <asp:TreeView ID="TreeView1" runat="server">
    </asp:TreeView>
<br />
<br />
    
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>


</asp:Content>
