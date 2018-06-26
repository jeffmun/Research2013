<%@ Page Language="c#" MasterPageFile="~/PopUp.master" CodeFile="EditMultipleActions.aspx.cs" AutoEventWireup="True" Inherits="Measures.EditMultipleActions" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" style="width: 100%; margin-left: 0px; margin-right: 0px;">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Edit Action</td>
	</tr>
	<tr>
		<td colspan="2" id="tdErrors" runat="server" style="display: none;"></td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtDateDone" runat="server">Date Done</asp:Label><br />
			<asp:TextBox ID="txtDateDone" runat="server" style="width: 200px;" />
			<img src="<%= Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgCalendar" style="margin-left: 4px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selCompBy" runat="server">Completed By</asp:Label><br />
			<asp:DropDownList id="selCompBy" runat="server" width="200px" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Label AssociatedControlID="txtNotes" runat="server">Notes</asp:Label><br />
			<asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="6" style="width: 90%" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="button" name="btnCancel" value="Cancel" onclick="window.close();" />
			<asp:HiddenField id="hidDoRefresh" runat="server" />
			<asp:HiddenField id="hidActionIDs" runat="server" />
			<asp:HiddenField id="hidActionStatus" runat="server" />
		</td>
	</tr>
</table>
<dlcalendar click_element_id="imgCalendar" input_element_id="<% =txtDateDone.ClientID %>"></dlcalendar>

</asp:Content>