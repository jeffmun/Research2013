<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true"
CodeFile="new.aspx.cs" Inherits="AutismCenterResearch_Study_Tadpole_new" Title="Tadpole Tx Log Report" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<br />
    <asp:Label ID="Label1" runat="server" Text="Reports" Font-Bold="true"></asp:Label>

 <div id="root">
            <asp:PlaceHolder ID="iframeDiv" runat="server"/>
</div>


</asp:Content>