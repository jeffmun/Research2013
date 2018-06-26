<%@ Page Language="C#" MasterPageFile="~/PopUp.master" AutoEventWireup="true" CodeFile="EditActionGroups.aspx.cs" Inherits="StudyDesign_EditActionGroups" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">


<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server" style="width: 100%; margin: 0px;">
	<tr class="trTitle">
		<td colspan="6">Edit Action Groups</td>
	</tr>
	<tr>
		<td colspan="6">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<asp:HiddenField id="hidStudyID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>

