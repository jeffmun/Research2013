<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="AppendLog.aspx.cs" AutoEventWireup="True" Inherits="Household.AppendLog" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<input type="hidden" name="hidHouseholdID_Contact" id="hidHouseholdID_Contact" runat="server" />
<input type="hidden" name="hidIsContactLog" id="hidIsContactLog" />
<input type="hidden" name="hidLogContactID" id="hidLogContactID" runat="server" />
<table class="tblInput" cellspacing="0">
	<tr class="trTitle">
		<td colspan="3" id="tdContactLog" runat="server"></td>
	</tr>
	<tr>
		<td colspan="3">
			<asp:Label AssociatedControlID="txtaContactLogNotes" runat="server">Contact Log Notes</asp:Label><br/>
			<asp:TextBox ID="txtaContactLogNotes" runat="server" TextMode="MultiLine" Rows="5" style="width: 90%;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selContactPriority" runat="server">Priority</asp:Label><br/>
			<asp:DropDownList ID="selContactPriority" Runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selContactType" runat="server">Contact Type</asp:Label><br/>
			<asp:DropDownList ID="selContactType" runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selContactPurpose" runat="server">Purpose</asp:Label><br/>
			<asp:DropDownList ID="selContactPurpose" runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtContactDate" runat="server">Contact Date/Time</asp:Label><br/>
			<asp:TextBox ID="txtContactDate" runat="server" style="width: 75px;" ondoubleclick="AddDateAndTime(this);" />
			<img src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif" alt="" id="imgCalendar" />
			<asp:DropDownList id="selHour" runat="server">
				<asp:ListItem value="01">01 AM</asp:ListItem>
				<asp:ListItem value="02">02 AM</asp:ListItem>
				<asp:ListItem value="03">03 AM</asp:ListItem>
				<asp:ListItem value="04">04 AM</asp:ListItem>
				<asp:ListItem value="05">05 AM</asp:ListItem>
				<asp:ListItem value="06">06 AM</asp:ListItem>
				<asp:ListItem value="07">07 AM</asp:ListItem>
				<asp:ListItem value="08">08 AM</asp:ListItem>
				<asp:ListItem value="09">09 AM</asp:ListItem>
				<asp:ListItem value="10">10 AM</asp:ListItem>
				<asp:ListItem value="11">11 AM</asp:ListItem>
				<asp:ListItem value="12">12 PM</asp:ListItem>
				<asp:ListItem value="13">01 PM</asp:ListItem>
				<asp:ListItem value="14">02 PM</asp:ListItem>
				<asp:ListItem value="15">03 PM</asp:ListItem>
				<asp:ListItem value="16">04 PM</asp:ListItem>
				<asp:ListItem value="17">05 PM</asp:ListItem>
				<asp:ListItem value="18">06 PM</asp:ListItem>
				<asp:ListItem value="19">07 PM</asp:ListItem>
				<asp:ListItem value="20">08 PM</asp:ListItem>
				<asp:ListItem value="21">09 PM</asp:ListItem>
				<asp:ListItem value="22">10 PM</asp:ListItem>
				<asp:ListItem value="23">11 PM</asp:ListItem>
				<asp:ListItem value="00">12 AM</asp:ListItem>
			</asp:DropDownList>
			<b>:</b>
			<asp:DropDownList id="selMinute" runat="server">
				<asp:ListItem value="00">00</asp:ListItem>
				<asp:ListItem value="05">05</asp:ListItem>
				<asp:ListItem value="10">10</asp:ListItem>
				<asp:ListItem value="15">15</asp:ListItem>
				<asp:ListItem value="20">20</asp:ListItem>
				<asp:ListItem value="25">25</asp:ListItem>
				<asp:ListItem value="30">30</asp:ListItem>
				<asp:ListItem value="35">35</asp:ListItem>
				<asp:ListItem value="40">40</asp:ListItem>
				<asp:ListItem value="45">45</asp:ListItem>
				<asp:ListItem value="50">50</asp:ListItem>
				<asp:ListItem value="55">55</asp:ListItem>
			</asp:DropDownList>
		</td>
		<td>
			<asp:Label AssociatedControlID="selStudy" runat="server">Study</asp:Label><br/>
			<asp:DropDownList ID="selStudy" runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selContactStaff" runat="server">Staff</asp:Label><br/>
			<asp:DropDownList ID="selContactStaff" runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<asp:Button ID="btnSaveContactLog" runat="server" Text="Save Contact Log" OnClick="SaveContactLog" OnClientClick="document.getElementById('hidIsContactLog').value = true;" />
		</td>
	</tr>
</table>

<input type="hidden" name="hidHouseholdID_Info" id="hidHouseholdID_Info" runat="server" />
<input type="hidden" name="hidLogInfoID" id="hidLogInfoID" runat="server" />
<input type="hidden" name="hidIsContactLog" value="False" />
<table class="tblInput" cellspacing="0">
	<tr class="trTitle">
		<td colspan="3" id="tdHouseholdInfoLog" runat="server"></td>
	</tr>
	<tr>
		<td colspan="3">
			<asp:Label AssociatedControlID="txtaHouseholdNotes" runat="server">Household Info Log</asp:Label><br/>
			<asp:TextBox ID="txtaHouseholdNotes" runat="server" TextMode="MultiLine" Rows="5" style="width: 90%;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selCategory" runat="server">Category</asp:Label><br/>
			<asp:DropDownList ID="selCategory" runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selHouseholdInfoPriority" runat="server">Priority</asp:Label><br/>
			<asp:DropDownList ID="selHouseholdInfoPriority" runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selHouseholdInfoStaff" runat="server">Staff</asp:Label><br/>
			<asp:DropDownList ID="selHouseholdInfoStaff" runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<asp:Button ID="btnSaveInfoLog" runat="server" Text="Save Info Log" OnClick="SaveInfoLog" OnClientClick="document.getElementById('hidIsContactLog').value = false;" />
		</td>
	</tr>
</table>
<dlcalendar click_element_id="imgCalendar" input_element_id="<% =txtContactDate.ClientID %>"></dlcalendar>

</asp:Content>