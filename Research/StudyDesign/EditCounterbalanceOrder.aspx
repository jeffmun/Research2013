<%@ Page Language="C#" MasterPageFile="~/PopUp.master" CodeFile="EditCounterbalanceOrder.aspx.cs" Inherits="StudyDesign.EditCounterbalanceOrder" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server" style="width: 100%; margin: 0px;">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Assign Measures to Actions (Counterbalance)</td>
	</tr>
	<tr>
		<td>
			<label for="selCounterBalanceOrderID">CB Order</label><br/>
			<asp:DropDownList ID="selCounterBalanceOrderID" Runat="server" style="width: 150px;" AutoPostBack="True" OnSelectedIndexChanged="GetCBInfo" />
		</td>
	</tr>
	<tr>
		<td class="tdHeaderAlt">Study Measures</td>
		<td class="tdHeaderAlt">Study Actions</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" name="btnReturn" id="btnReturn" runat="server" value="Back to Actions" />
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="hidden" name="hidStudyID" id="hidStudyID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>