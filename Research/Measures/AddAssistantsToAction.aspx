<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="AddAssistantsToAction.aspx.cs" AutoEventWireup="True" Inherits="Measures.AddAssistantsToAction" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<p>
	This page allows you to add and remove assistants to/from an Action. To add additional
	assistants, click the "Add Assistants" button and enter the number of assistants you
	would like to add. To remove existing assistants, simply set their value in the "Staff"
	drop-down list to the top item ("--Staff Member--"). 
</p>

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="3">Add Assistants</td>
	</tr>
	<tr>
		<td colspan="3" id="tdError" runat="server" style="display: none;"></td>
	</tr>
	<tr>
		<td class="tdHeaderAlt" style="width: 125px; text-align: center;">Staff</td>
		<td class="tdHeaderAlt" style="width: 125px; text-align: center;">Role</td>
		<td class="tdHeaderAlt" style="text-align: center;">Notes</td>
	</tr>
	<tr>
		<td colspan="3">
			<asp:Button ID="btnSubmit" runat="server" Text="Submit" />
			<input type="button" id="btnAddStaff" value=" Add Assistants " runat="server" />
			<input type="button" id="btnGoBack" value=" Back to Edit Action Page" runat="server" />
			<asp:HiddenField id="hidActionID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>