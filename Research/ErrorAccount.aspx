<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true"  CodeFile="ErrorAccount.aspx.cs" Inherits="ErrorAccount" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<h2>Your account is not active.</h2>
<p>
	Please contact the appropriate people. <!--Core B has been notified about the error.-->
</p>
<p id="pErrMsg" runat="server" style="display: none;">

</p>

</asp:Content>