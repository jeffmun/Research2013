<%@ Page Language="c#" MasterPageFile="~/PopUp.master" CodeFile="AddConsentForm.aspx.cs" AutoEventWireup="True" Inherits="Measures.AddConsentForm" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table class="tblInput" cellspacing="0">
	<tr>
		<td>
			<label for="selConsentFormVersionID">Version</label><br/>
			<asp:DropDownList ID="selConsentFormVersionID" Runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtDateSigned" runat="server">Date Signed</asp:Label><br/>
			<asp:TextBox ID="txtDateSigned" Runat="server" />
			<img src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgDateSigned" alt="" />
		</td>
	</tr>
  <tr>
		<td><label for="selConsentFormStatusID">Status</label><br/>
			<asp:dropdownlist id="selConsentFormStatusID" Runat="server" Enabled="True"></asp:dropdownlist></td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selActionID" runat="server">Action</asp:Label><br/>
			<asp:DropDownList ID="selActionID" Runat="server" />
		</td>
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
			<input type="button" id="btnCancel" name="btnCancel" value="Cancel" onclick="window.close();" />
			<asp:HiddenField id="hidSubjID" runat="server" />
			<asp:HiddenField id="hidStudyID" runat="server" />
		</td>
	</tr>
</table>

<dlcalendar click_element_id="imgDateSigned" input_element_id="<% =txtDateSigned.ClientID %>"></dlcalendar>
</asp:Content>