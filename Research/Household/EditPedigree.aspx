<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="EditPedigree.aspx.cs" AutoEventWireup="True" Inherits="Household.EditPedigree" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="4">Edit Pedigree</td>
	</tr>
	<tr>
		<td class="tdHeaderAlt">Name</td>
		<td class="tdHeaderAlt">Blood ID</td>
		<td class="tdHeaderAlt">Pedigree</td>
		<td class="tdHeaderAlt">Blood Source</td>
	</tr>
	<tr>
		<td colspan="4" id="tdError" runat="server" style="display: none; color: red;"></td>
	</tr>
	<tr>
		<td colspan="4">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<asp:Button ID="btnReturn" Runat="server" Text="Return to Household" OnClick="ReturnToHousehold" />
			<input type="hidden" name="hidHouseholdID" id="hidHouseholdID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>