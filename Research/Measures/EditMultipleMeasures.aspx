<%@ Page Language="c#" MasterPageFile="~/PopUp.master" CodeFile="EditMultipleMeasures.aspx.cs" AutoEventWireup="True" Inherits="Measures.EditMultipleMeasures" EnableEventValidation="False" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<input type="hidden" name="hidStudyMeasSubjIDs" value="" id="hidStudyMeasSubjIDs" runat="server" />
<table id="tblMaster" runat="server" cellspacing="0" class="tblInput" style="width: 100%; margin-left: 0px; margin-right: 0px;">
	<tr class="trTitle">
		<td colspan="2">Edit Measure</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selStatus" runat="server">Measure Status</asp:label><br/>
			<asp:DropDownList id="selStatus" runat="server" width="200px" />
		</td>
		<td id="tdStatusDetail">
			<asp:Label AssociatedControlID="selStatusDetail" runat="server">Measure Status Detail</asp:label><br/>
			<asp:DropDownList id="selStatusDetail" runat="server" width="200px" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selCompBy" runat="server">Completed By</asp:label><br/>
			<asp:DropDownList id="selCompBy" runat="server" width="200px" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtDateDone" runat="server">Date Done</asp:label><br/>
			<asp:TextBox ID="txtDateDone" runat="server" style="width: 200px;" />
			<img src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgCalendar" style="margin-left: 4px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Label AssociatedControlID="txtNotes" runat="server">Notes</asp:label><br/>
			<asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="6" style="width: 90%;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="button" name="btnCancel" value="Cancel" onclick="window.close();" />
			<asp:HiddenField id="hidDoRefresh" runat="server" />
		</td>
	</tr>
</table>

<dlcalendar click_element_id="imgCalendar" input_element_id="<% =txtDateDone.ClientID %>"></dlcalendar>
</asp:Content>