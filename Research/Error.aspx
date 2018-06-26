<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true"  CodeFile="Error.aspx.cs" Inherits="Error" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<h2>An error has occurred.</h2>
<p>
	An error has occurred on the page you are trying to view. We are sorry about the 
	inconvenience. <!--Core B has been notified about the error.-->
</p>
<p id="pErrMsg" runat="server" style="display: none;">

</p>

</asp:Content>