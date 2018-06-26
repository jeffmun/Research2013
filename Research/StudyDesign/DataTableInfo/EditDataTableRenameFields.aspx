<%@ Page Language="C#" MasterPageFile="~/PopUp.master" CodeFile="EditDataTableRenameFields.aspx.cs" Inherits="StudyDesign.DataTableInfo.EditDataTableRenameFields" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" style="width: 100%; margin: 0px;" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="3" id="tdTitle" runat="server">Rename Fields</td>
	</tr>
	<tr>
		<td class="tdHeaderAlt" style="width: 50px;">Delete?</td>
		<td class="tdHeaderAlt" style="width: 260px;">Database Field</td>
		<td class="tdHeaderAlt">New Name</td>
	</tr>
	<tr>
		<td colspan="3">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="button" id="btnAddRenameField" runat="server" value="Add Rename Field" onclick="AddRenameField();" onserverclick="AddRenameField" />
			<input type="hidden" id="hidTableID" runat="server" name="hidTableID" />
			<input type="hidden" id="hidFieldsToAdd" runat="server" name="hidFieldsToAdd" />
		</td>
	</tr>
</table>

</asp:Content>