<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="OnlineAccessRequest.aspx.cs" Inherits="Help.OnlineAccessRequest" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2">Online Access Request</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtRequestor" runat="server">Your Name</asp:Label><br/>
			<asp:TextBox ID="txtRequestor" runat="server" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtEmailAddress" runat="server">Email Address</asp:Label><br/>
			<asp:TextBox ID="txtEmailAddress" runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtPhoneNumber" runat="server">Phone Number</asp:Label><br/>
			<asp:TextBox ID="txtPhoneNumber" runat="server" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtAccessFor" runat="server">Who is this access for?</asp:Label><br/>
			<asp:TextBox ID="txtAccessFor" runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtDateRequired" runat="server">Date Required</asp:Label><br/>
			<asp:TextBox ID="txtDateRequired" runat="server" />
			<img src="<%= Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgCalendar" alt="" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtSupervisor" runat="server">Who is their supervisor?</asp:Label><br/>
			<asp:TextBox ID="txtSupervisor" runat="server" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Label AssociatedControlID="txtTypeOfAccess" runat="server">Type of Access</asp:Label><br/>
			<asp:TextBox ID="txtTypeOfAccess" runat="server" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Label AssociatedControlID="txtComments" runat="server">Comments</asp:Label><br/>
			<asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="5" style="width: 100%;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="SendMail" />
		</td>
	</tr>
</table>

<dlcalendar click_element_id="imgCalendar" input_element_id="<% =txtDateRequired.ClientID %>"></dlcalendar>
</asp:Content>