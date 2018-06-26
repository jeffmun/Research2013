<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="Default.aspx.cs" AutoEventWireup="True" Inherits="Measures._default" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2">Find Measures/Actions v.2</td>
	</tr>
	<tr>
		<td rowspan="2" style="width: 25%;">
			<label>Search For:</label>
			<p style="margin-top: 10px; margin-left: 20px;">
				<input type="radio" name="radSearchType" value="S" runat="server" id="radSearchTypeSubject" onclick="DoChangeSearchForm(this.value, false)" /><asp:Label AssociatedControlID="radSearchTypeSubject" runat="server" class="lblNotBold">Subjects</asp:Label><br/>
				<input type="radio" name="radSearchType" value="A" runat="server" id="radSearchTypeAction" onclick="DoChangeSearchForm(this.value, false)" /><asp:Label AssociatedControlID="radSearchTypeAction" runat="server" class="lblNotBold">Actions</asp:Label><br/>
				<input type="radio" name="radSearchType" value="M" runat="server" id="radSearchTypeMeas" onclick="DoChangeSearchForm(this.value, false)" /><asp:Label AssociatedControlID="radSearchTypeMeas" runat="server" class="lblNotBold">Measures</asp:Label><br/>
				<input type="radio" name="radSearchType" value="C" runat="server" id="radSearchTypeConsent" onclick="DoChangeSearchForm(this.value, false)" /><asp:Label AssociatedControlID="radSearchTypeConsent" runat="server" class="lblNotBold">Consent Forms</asp:Label>
			</p>
		</td>
		<td style="width: 75%;">
			<label for="selStudyID">Study</label><br/>
			<asp:DropDownList id="selStudyID" runat="server" Font-Names="Courier New" />
		</td>
	</tr>
	<tr>
		<td style="width: 75%;">
			<label for="txtSubjID">Subject ID</label><br/>
			<asp:TextBox id="txtSubjID" runat="server" width=" 200px" />
		</td>
	</tr>
	<tr id="trActionForm" style="display: none;">
		<td style="width: 25%;">&nbsp;</td>
		<td style="width: 75%;" id="tdActionID"></td>
	</tr>
	<tr id="trMeasureForm" style="display: none;">
		<td style="width: 25%;">&nbsp;</td>
		<td style="width: 75%;" colspan="2" id="tdMeasureID"></td>
	</tr>
	<tr id="trConsentForm" style="display: none;">
		<td style="width: 25%;">&nbsp;</td>
		<td style="width: 75%;" colspan="2" id="tdConsentFormID"></td>
	</tr>
	<tr id="trSubmitForm">
		<td colspan="2">
			<input type="submit" name="btnSubmit" value=" Submit " />
		</td>
	</tr>
</table>

</asp:Content>