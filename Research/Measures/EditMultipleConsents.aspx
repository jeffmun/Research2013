<%@ Page Language="c#" MasterPageFile="~/PopUp.master" CodeFile="EditMultipleConsents.aspx.cs" AutoEventWireup="True" Inherits="Measures.EditMultipleConsents" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server" style="width: 100%; margin: 0px;">
	<tr class="trTitle">
		<td>Edit Consent Form</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtDateSigned" runat="server">Date Signed</asp:Label><br/>
			<asp:TextBox ID="txtDateSigned" Runat="server" style="width: 200px;" />
			<img src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgDateSigned" alt="" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtTimeSigned" runat="server">Time Signed</asp:Label><br/>
			<asp:TextBox ID="txtTimeSigned" Runat="server" style="width: 200px;" />
		</td>
	</tr>
    <tr>
	    <td><label for="selConsentFormStatusID">Status</label><br/>
		    <asp:dropdownlist id="selConsentFormStatusID" Runat="server" Enabled="True"></asp:dropdownlist></td>
    </tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtNotes" runat="server">Notes</asp:Label><br/>
			<asp:TextBox ID="txtNotes" Runat="server" TextMode="MultiLine" Rows="7" style="width: 90%;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="button" name="btnCancel" id="btnCancel" value="Cancel" onclick="window.close();" />
			<asp:HiddenField id="hidSubjConsentIDs" runat="server" />
			<asp:HiddenField id="hidDoRefresh" runat="server" />
		</td>
	</tr>
</table>

<dlcalendar click_element_id="imgDateSigned" input_element_id="<% =txtDateSigned.ClientID %>"></dlcalendar>

</asp:Content>