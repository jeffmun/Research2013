<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true"  CodeFile="ScheduleMiscAction.aspx.cs" Inherits="WebCal.ScheduleMiscAction" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput">
	<tr class="trTitle">
		<td colspan="3">
			Schedule Misc. Item
		</td>
	</tr>
	<tr>
		<td colspan="3" id="tdError" runat="server" style="display: none;"></td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtApptDate" runat="server">Appointment Date</asp:Label><br/>
			<asp:TextBox ID="txtApptDate" Runat="server" style="width: 175px;" />
			
			<%--DF: use server tag and relative ref--%>
			<img runat="server" src="~/images/dlcalendar_2.gif" alt="" id="imgCalendar" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selStartTime" runat="server">Start Time</asp:Label><br/>
			<asp:DropDownList ID="selStartTime" Runat="server" style="width: 200px;">
				<asp:ListItem Value="-1">--Start Time--</asp:ListItem>
				<asp:ListItem Value="08:00">8:00 AM</asp:ListItem>
				<asp:ListItem Value="08:30">8:30 AM</asp:ListItem>
				<asp:ListItem Value="09:00">9:00 AM</asp:ListItem>
				<asp:ListItem Value="09:30">9:30 AM</asp:ListItem>
				<asp:ListItem Value="10:00">10:00 AM</asp:ListItem>
				<asp:ListItem Value="10:30">10:30 AM</asp:ListItem>
				<asp:ListItem Value="11:00">11:00 AM</asp:ListItem>
				<asp:ListItem Value="11:30">11:30 AM</asp:ListItem>
				<asp:ListItem Value="12:00">12:00 PM</asp:ListItem>
				<asp:ListItem Value="12:30">12:30 PM</asp:ListItem>
				<asp:ListItem Value="13:00">1:00 PM</asp:ListItem>
				<asp:ListItem Value="13:30">1:30 PM</asp:ListItem>
				<asp:ListItem Value="14:00">2:00 PM</asp:ListItem>
				<asp:ListItem Value="14:30">2:30 PM</asp:ListItem>
				<asp:ListItem Value="15:00">3:00 PM</asp:ListItem>
				<asp:ListItem Value="15:30">3:30 PM</asp:ListItem>
				<asp:ListItem Value="16:00">4:00 PM</asp:ListItem>
				<asp:ListItem Value="16:30">4:30 PM</asp:ListItem>
				<asp:ListItem Value="17:00">5:00 PM</asp:ListItem>
				<asp:ListItem Value="17:30">5:30 PM</asp:ListItem>
				<asp:ListItem Value="18:00">6:00 PM</asp:ListItem>
				<asp:ListItem Value="18:30">6:30 PM</asp:ListItem>
				<asp:ListItem Value="19:00">7:00 PM</asp:ListItem>
				<asp:ListItem Value="19:30">7:30 PM</asp:ListItem>
				<asp:ListItem Value="20:00">8:00 PM</asp:ListItem>
				<asp:ListItem Value="20:30">8:30 PM</asp:ListItem>
				<asp:ListItem Value="21:00">9:00 PM</asp:ListItem>
				<asp:ListItem Value="21:30">9:30 PM</asp:ListItem>
				<asp:ListItem Value="22:00">10:00 PM</asp:ListItem>
				<asp:ListItem Value="22:30">10:30 PM</asp:ListItem>
				<asp:ListItem Value="23:00">11:00 PM</asp:ListItem>
				<asp:ListItem Value="23:30">11:30 PM</asp:ListItem>
				<asp:ListItem Value="00:00">12:00 PM</asp:ListItem>
				<asp:ListItem Value="00:30">12:30 PM</asp:ListItem>
			</asp:DropDownList>
		</td>
		<td>
			<asp:Label AssociatedControlID="selEndTime" runat="server">End Time</asp:Label><br/>
			<asp:DropDownList ID="selEndTime" Runat="server" style="width: 200px;">
				<asp:ListItem Value="-1">--End Time--</asp:ListItem>
				<asp:ListItem Value="08:00">8:00 AM</asp:ListItem>
				<asp:ListItem Value="08:30">8:30 AM</asp:ListItem>
				<asp:ListItem Value="09:00">9:00 AM</asp:ListItem>
				<asp:ListItem Value="09:30">9:30 AM</asp:ListItem>
				<asp:ListItem Value="10:00">10:00 AM</asp:ListItem>
				<asp:ListItem Value="10:30">10:30 AM</asp:ListItem>
				<asp:ListItem Value="11:00">11:00 AM</asp:ListItem>
				<asp:ListItem Value="11:30">11:30 AM</asp:ListItem>
				<asp:ListItem Value="12:00">12:00 PM</asp:ListItem>
				<asp:ListItem Value="12:30">12:30 PM</asp:ListItem>
				<asp:ListItem Value="13:00">1:00 PM</asp:ListItem>
				<asp:ListItem Value="13:30">1:30 PM</asp:ListItem>
				<asp:ListItem Value="14:00">2:00 PM</asp:ListItem>
				<asp:ListItem Value="14:30">2:30 PM</asp:ListItem>
				<asp:ListItem Value="15:00">3:00 PM</asp:ListItem>
				<asp:ListItem Value="15:30">3:30 PM</asp:ListItem>
				<asp:ListItem Value="16:00">4:00 PM</asp:ListItem>
				<asp:ListItem Value="16:30">4:30 PM</asp:ListItem>
				<asp:ListItem Value="17:00">5:00 PM</asp:ListItem>
				<asp:ListItem Value="17:30">5:30 PM</asp:ListItem>
				<asp:ListItem Value="18:00">6:00 PM</asp:ListItem>
				<asp:ListItem Value="18:30">6:30 PM</asp:ListItem>
				<asp:ListItem Value="19:00">7:00 PM</asp:ListItem>
				<asp:ListItem Value="19:30">7:30 PM</asp:ListItem>
				<asp:ListItem Value="20:00">8:00 PM</asp:ListItem>
				<asp:ListItem Value="20:30">8:30 PM</asp:ListItem>
				<asp:ListItem Value="21:00">9:00 PM</asp:ListItem>
				<asp:ListItem Value="21:30">9:30 PM</asp:ListItem>
				<asp:ListItem Value="22:00">10:00 PM</asp:ListItem>
				<asp:ListItem Value="22:30">10:30 PM</asp:ListItem>
				<asp:ListItem Value="23:00">11:00 PM</asp:ListItem>
				<asp:ListItem Value="23:30">11:30 PM</asp:ListItem>
				<asp:ListItem Value="00:00">12:00 PM</asp:ListItem>
				<asp:ListItem Value="00:30">12:30 PM</asp:ListItem>
			</asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selActionID" runat="server">Action</asp:Label><br/>
			<asp:DropDownList ID="selActionID" Runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selStaffID" runat="server">Staff Member</asp:Label><br/>
			<asp:DropDownList ID="selStaffID" Runat="server" style="width: 200px;" />
		</td>
		<td rowspan="2">
			<asp:Label AssociatedControlID="selAdditionalStaffIDs" runat="server">Assistant Staff</asp:Label><br/>
			<asp:ListBox ID="selAdditionalStaffIDs" Runat="server" SelectionMode="Multiple" Rows="5" style="width: 200px;" /><br/><br/>
			<asp:Label AssociatedControlID="selAsstRole" runat="server">Asst. Role</asp:Label><br/>
			<asp:DropDownList ID="selAsstRole" Runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Label AssociatedControlID="txtNotes" runat="server">Notes</asp:Label><br/>
			<asp:TextBox ID="txtNotes" Runat="server" TextMode="MultiLine" Rows="5" style="width: 95%;" />
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
		</td>
	</tr>
</table>
<dlcalendar click_element_id="<% = imgCalendar.ClientID %>" input_element_id="<% =txtApptDate.ClientID.Replace("_", "$") %>"></dlcalendar>
</asp:Content>