<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="ViewHousehold.aspx.cs" Inherits="Household.ViewHousehold" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblViewHousehold" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server"></td>
	</tr>
	<tr>
		<td colspan="2" style="padding-left: 0px; padding-right: 0px; padding-top: 0px; vertical-align: top;" id="tdPersonInfo" runat="server"></td>
	</tr>
	<tr>
		<td style="width: 50%; padding-left: 0px; vertical-align: top;" id="tdPhoneInfo" runat="server"></td>
		<td style="width: 50%; padding-right: 0px; vertical-align: top;" id="tdEmailInfo" runat="server"></td>
	</tr>
	<tr>
		<td colspan="2" style="padding-left: 0px; padding-right: 0px; vertical-align: top;" id="tdInfoLog" runat="server"></td>
	</tr>
	<tr>
		<td colspan="2" style="padding-left: 0px; padding-right: 0px; vertical-align: top;" id="tdContactLog" runat="server"></td>
	</tr>
	<tr>
		<td style="width: 50%; padding-left: 0px; vertical-align: top;" id="tdSecondaryContact" runat="server"></td>
		<td style="width: 50%; padding-right: 0px; vertical-align: top;" id="tdScreening" runat="server"></td>
	</tr>
</table>

</asp:Content>