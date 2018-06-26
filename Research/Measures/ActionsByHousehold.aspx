<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="ActionsByHousehold.aspx.cs" AutoEventWireup="True" Inherits="Measures.ActionsByHousehold" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<input type="hidden" name="hidSortField" value="" />
<table cellspacing="0" class="tblReport" id="tblMaster" runat="server">

</table>
<p>
	<input type="button" name="btnCompleteAll" id="btnCompleteAll" runat="server" value="Marked Checked Actions as Complete" onclick="EditMultipleActions(null, 'Complete');" />
</p>

</asp:Content>