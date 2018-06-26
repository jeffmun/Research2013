<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="default.aspx.cs" Inherits="WebCal._default" Title="WebCal"%>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<table class="tblCalendar" cellspacing="0" id="tblMaster" runat="server">
	<tr class="trHeader">
		<td colspan="5" style="border-left: solid 1px #26044a; border-right: solid 1px #26044a; border-top: solid 1px #26044a;">Web Calendar</td>
	</tr>
	<tr>
		<td colspan="5" style="border-left: solid 1px #26044a; border-right: solid 1px #26044a; padding: 0px;" class="tdForm">
		<table class="tblInput" cellspacing="0" border="0" style="margin: 0px; width: 100%;">
			<tr>
				<td>
					<asp:Label AssociatedControlID="selStaffID" runat="server">Staff</asp:Label><br/>
					<asp:DropDownList ID="selStaffID" runat="server" style="width: 150px;" />
				</td>
				<td>
					<asp:Label AssociatedControlID="selLabID" runat="server">Lab</asp:Label><br/>
					<asp:DropDownList ID="selLabID" runat="server" style="width: 150px;" />
				</td>
				<td rowspan="2">
					<asp:Label AssociatedControlID="selStudyID" runat="server">Study</asp:Label><br/>
					<asp:ListBox ID="selStudyID" runat="server" SelectionMode="Multiple" Rows="5" style="width: 125px;" />
				</td>
				<td style="vertical-align: middle;">
					<input type="checkbox" name="chkShowCancelled" id="chkShowCancelled" runat="server" />
					<asp:Label AssociatedControlID="chkShowCancelled" runat="server">Show Cancelled Actions</asp:Label>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label AssociatedControlID="txtStartDate" runat="server">Start Date</asp:Label><br/>
					<asp:TextBox ID="txtStartDate" runat="server" style="width: 130px" />
					<%--DF: 4/9 converted to server control, added ~--%>
					<img runat="server" id="imgStartDate" src="~/images/dlcalendar_2.gif" alt="" /><br/>
				</td>
				<td>
					<asp:Label AssociatedControlID="txtEndDate" runat="server">End Date</asp:Label><br/>
				 	<asp:TextBox ID="txtEndDate" runat="server" style="width: 130px" />
					<%--DF: 4/9 converted to server control, added ~--%>
					<img runat="server" id="imgEndDate" src="~/images/dlcalendar_2.gif" alt="" />
				</td>
				<td style="vertical-align: middle;">
					<asp:Button ID="btnSubmit" runat="server" Text="Submit" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<%--DF: Used imgStartDate.ClientID--%>
<dlcalendar click_element_id='<% =imgStartDate.ClientID %>' input_element_id="<% =txtStartDate.ClientID.Replace("_", "$") %>"></dlcalendar>
<dlcalendar click_element_id='<% =imgEndDate.ClientID %>' input_element_id="<% =txtEndDate.ClientID.Replace("_", "$") %>"></dlcalendar>



</asp:Content>