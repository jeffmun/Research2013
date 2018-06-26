<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="ConsentsBySubject.aspx.cs" AutoEventWireup="True" Inherits="Measures.ConsentsBySubject" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblReport" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="7" id="tdTitle" runat="server"></td>
	</tr>
	<tr class="trHeader">
		<td>&nbsp;</td>
		<td>Consent Form Name</td>
		<td>Version</td>
		<td>ConsentApproved</td>
		<td>Date Signed</td>
		<td>Status</td>
		<td>Consent Items</td>
	</tr>
	<tr class="trDark">
		<td colspan="7" class="DoNotPrint">
			<a href="javascript:ChangeCheckBoxes('chkConsentToEdit', true);">Check All</a> - <a href="javascript:ChangeCheckBoxes('chkConsentToEdit', false);">Clear All</a>
		</td>
	</tr>
	<tr class="trDark">
		<td colspan="7" class="DoNotPrint">
			<input type="button" name="btnEdit" id="btnEdit" value="Edit Checked Consent Forms" onclick="EditMultipleConsents(null);" />
			<input type="button" name="btnNew" id="btnNew" value="Add New Consent Form" onclick="AddConsentForm();" />
			<input type="hidden" name="hidSubjID" id="hidSubjID" runat="server" />
			<input type="hidden" name="hidStudyID" id="hidStudyID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>