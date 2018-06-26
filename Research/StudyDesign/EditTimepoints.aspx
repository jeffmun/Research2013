<%@ Page Language="C#" Debug="true"  MasterPageFile="~/PopUp.master" CodeFile="EditTimepoints.aspx.cs" Inherits="StudyDesign.EditTimepoints" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server" style="width: 100%; margin: 0px;">
	<tr class="trTitle">
		<td colspan="6">Edit Timepoints</td>
	</tr>
	<tr>
		<td colspan="6">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="button" name="btnAddNewTimepoint" id="btnAddNewTimepoint" value="Add New Timepoint" runat="server" onserverclick="AddNewTimepoint" onclick="GetNumStudyActionsToAdd();" />
			<input type="hidden" name="hidNumTimepointsToAdd" value="" id="hidNumActionsToAdd" />
			<asp:HiddenField id="hidStudyID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>