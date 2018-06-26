<%@ Page Language="C#" MasterPageFile="~/PopUp.master" CodeFile="EditConsentAssignments.aspx.cs" Inherits="StudyDesign.EditConsentAssignments" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server" style="width: 100%; margin: 0px;">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Assign Consent Forms to Actions</td>
	</tr>
	<tr>
		<td class="tdHeaderAlt">Consent Form</td>
		<td class="tdHeaderAlt">Study Action</td>
	</tr>
	<tr>
		<td colspan="9">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="hidden" name="hidStudyID" id="hidStudyID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>