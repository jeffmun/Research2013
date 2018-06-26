<%@ Page Language="C#"   MasterPageFile="~/PopUp.master" CodeFile="EditGroups.aspx.cs" Inherits="StudyDesign.EditGroups" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server" style="width: 100%; margin: 0px;">
	<tr class="trTitle">
		<td colspan="6">Edit Groups</td>
	</tr>
	<tr>
		<td colspan="6">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="button" name="btnAddNewGroup" id="btnAddNewGroup" value="Add New Group" runat="server" onserverclick="AddNewGroup" onclick="GetNumStudyActionsToAdd();" />
			<input type="hidden" name="hidNumGroupsToAdd" value="" id="hidNumActionsToAdd" />
			<asp:HiddenField id="hidStudyID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>