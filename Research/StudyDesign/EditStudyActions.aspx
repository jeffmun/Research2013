<%@ Page Language="c#" MasterPageFile="~/PopUp.master" CodeFile="EditStudyActions.aspx.cs" Inherits="StudyDesign.EditStudyActions" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server" style="width: 100%; margin: 0px;">
	<tr class="trTitle">
		<td colspan="9">Edit Study Actions</td>
	</tr>
	<tr>
		<td colspan="9">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="button" name="btnAddNewStudyAction" id="btnAddNewStudyAction" value="Add New Study Action" runat="server" onserverclick="AddNewStudyAction" />
			<asp:HiddenField id="hidStudyID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>