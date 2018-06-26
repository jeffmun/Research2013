<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="ScheduleAction.aspx.cs" AutoEventWireup="True" Inherits="Measures.ScheduleAction" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Schedule Action</td>
	</tr>
	<tr>
		<td colspan="2" id="tdError" runat="server" style="display: none;"></td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtDateDone" runat="server">Appointment Date</asp:Label><br/>
			<asp:TextBox ID="txtDateDone" Runat="server" style="width: 150px" />
			<img src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif" alt="" id="imgCalendar" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selLocation" runat="server">Location</asp:Label><br/>
			<asp:DropDownList ID="selLocation" Runat="server" style="width: 150px;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selStartTime" runat="server">Start Time</asp:Label><br/>
			<asp:DropDownList ID="selStartTime" Runat="server" style="width: 150px;">
				<asp:ListItem Value="-1">--Start Time--</asp:ListItem>
				<asp:ListItem Value="01:00">1:00 AM</asp:ListItem>
				<asp:ListItem Value="01:30">1:30 AM</asp:ListItem>
				<asp:ListItem Value="02:00">2:00 AM</asp:ListItem>
				<asp:ListItem Value="02:30">2:30 AM</asp:ListItem>
				<asp:ListItem Value="03:00">3:00 AM</asp:ListItem>
				<asp:ListItem Value="03:30">3:30 AM</asp:ListItem>
				<asp:ListItem Value="04:00">4:00 AM</asp:ListItem>
				<asp:ListItem Value="04:30">4:30 AM</asp:ListItem>
				<asp:ListItem Value="05:00">5:00 AM</asp:ListItem>
				<asp:ListItem Value="05:30">5:30 AM</asp:ListItem>
				<asp:ListItem Value="06:00">6:00 AM</asp:ListItem>
				<asp:ListItem Value="06:30">6:30 AM</asp:ListItem>
				<asp:ListItem Value="07:00">7:00 AM</asp:ListItem>
				<asp:ListItem Value="07:30">7:30 AM</asp:ListItem>
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
				<asp:ListItem Value="00:00">12:00 AM</asp:ListItem>
				<asp:ListItem Value="00:30">12:30 AM</asp:ListItem>
			</asp:DropDownList>
		</td>
		<td>
			<asp:Label AssociatedControlID="selEndTime" runat="server">End Time</asp:Label><br/>
			<asp:DropDownList ID="selEndTime" Runat="server" style="width: 150px;">
				<asp:ListItem Value="-1">--End Time--</asp:ListItem>
				<asp:ListItem Value="01:00">1:00 AM</asp:ListItem>
				<asp:ListItem Value="01:30">1:30 AM</asp:ListItem>
				<asp:ListItem Value="02:00">2:00 AM</asp:ListItem>
				<asp:ListItem Value="02:30">2:30 AM</asp:ListItem>
				<asp:ListItem Value="03:00">3:00 AM</asp:ListItem>
				<asp:ListItem Value="03:30">3:30 AM</asp:ListItem>
				<asp:ListItem Value="04:00">4:00 AM</asp:ListItem>
				<asp:ListItem Value="04:30">4:30 AM</asp:ListItem>
				<asp:ListItem Value="05:00">5:00 AM</asp:ListItem>
				<asp:ListItem Value="05:30">5:30 AM</asp:ListItem>
				<asp:ListItem Value="06:00">6:00 AM</asp:ListItem>
				<asp:ListItem Value="06:30">6:30 AM</asp:ListItem>
				<asp:ListItem Value="07:00">7:00 AM</asp:ListItem>
				<asp:ListItem Value="07:30">7:30 AM</asp:ListItem>
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
				<asp:ListItem Value="00:00">12:00 AM</asp:ListItem>
				<asp:ListItem Value="00:30">12:30 AM</asp:ListItem>
			</asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selAsstStatus" runat="server">Assistant Status</asp:Label><br/>
			<asp:DropDownList ID="selAsstStatus" Runat="server" style="width: 150px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtAsstNotes" runat="server">Assistant Notes</asp:Label><br/>
			<asp:TextBox ID="txtAsstNotes" Runat="server" TextMode="MultiLine" Rows="4" style="width: 300px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<asp:Button ID="btnCancel" Runat="server" Text="Cancel" OnClick="CancelChanges" />
			<asp:HiddenField id="hidActionID" runat="server" />
		</td>
	</tr>
</table>

<dlcalendar click_element_id="imgCalendar" input_element_id="<% =txtDateDone.ClientID %>"></dlcalendar>
</asp:Content>