<%@ Page Language="C#" MasterPageFile="~/PopUp.master" CodeFile="EditConsents.aspx.cs" Inherits="StudyDesign.EditConsents" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server" style="width: 100%; margin: 0px;">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Edit Consent Forms</td>
	</tr>
	<tr>
		<td>
			<label for="selConsentFormID">Consent Form</label><br/>
			<asp:DropDownList ID="selConsentFormID" Runat="server" OnSelectedIndexChanged="ShowEditConsentForm" AutoPostBack="True" />
		</td>
		<td>
			<label for="txtConsentFormName">Consent Form Name</label><br/>
			<asp:TextBox ID="txtConsentFormName" Runat="server" style="width: 300px;" />
		</td>
	</tr>
	<tr>
		<td>
			<label for="txtConsentFormNameShort">Consent Form Short Name</label><br/>
			<asp:TextBox ID="txtConsentFormNameShort" Runat="server" style="width: 200px;" /><br/><br/>
			<asp:CheckBox ID="chkIsActive" Runat="server" /><label for="chkIsActive">Active?</label><br/>
			<asp:CheckBox ID="chkAssignOnEntry" Runat="server" /><label for="chkAssignOnEntry">Assign On Entry?</label>
		</td>
		<td>
			<label for="selGroupIDs">Groups</label><br/>
			<asp:ListBox ID="selGroupIDs" Runat="server" SelectionMode="Multiple" Rows="4" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2" id="tdVersionsForm" runat="server" style="padding: 0px; padding-top: 20px;"></td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<asp:Button ID="btnAddConsentVersion" Runat="server" Text="Add New Version" OnClick="AddConsentVersion" style="display: none;" />
			<asp:HiddenField id="hidStudyID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>