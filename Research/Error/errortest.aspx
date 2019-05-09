<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="errortest.aspx.cs" AutoEventWireup="true"
 Inherits="Error_errortest" Title="Test making an error"      %>  

<%@ MasterType VirtualPath="~/UWAC.master" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

    <br />
   Use this page to test global error handling.  <br /><br />
    <br />
    <asp:Button ID="btnError" runat="server" OnClick="btnError_OnClick" Text="Create an error" />
    </br>
    </br>


</asp:Content>