<%@ Page Language="c#" MasterPageFile="~/PopUp.master" CodeFile="MoveConsents.aspx.cs" AutoEventWireup="True" Inherits="Measures.MoveConsents" EnableEventValidation="False" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" style="width: 100%; margin-left: 0px; margin-right: 0px;">
	<tr class="trTitle">
		<td>Move Consent Forms to Different Action</td>
	</tr>
	<tr>
		<td id="tdErrors" runat="server" style="display: none;"></td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selActionID" runat="server">Action</asp:Label><br/>
			<asp:DropDownList ID="selActionID" Runat="server" style="width: 300px;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Button id="btnSaveChanges" runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="button" name="btnCancel" id="btnCancel" value="Cancel" onclick="window.close();" />
			<asp:HiddenField id="hidSubjConsentIDs" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>