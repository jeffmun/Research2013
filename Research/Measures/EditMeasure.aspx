<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="EditMeasure.aspx.cs" AutoEventWireup="True" Inherits="Measures.EditMeasure" EnableEventValidation="false" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="3" id="tdTitle" runat="server"></td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selMeasStatusID" runat="server">Measure Status</asp:Label><br/>
			<asp:DropDownList ID="selMeasStatusID" Runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selMeasStatusDetailID" runat="server">Measure Status Detail</asp:Label><br/>
			<asp:DropDownList ID="selMeasStatusDetailID" Runat="server" style="width: 200px;" />
		</td>
		<td rowspan="2" id="tdInfo" runat="server" style="border-left: solid 1px #336699; width: 250px; padding: 0px;">
			<div style="text-align: center; width: 100%; background-color: #a1b5cf; font-weight: bold; padding: 2px;">
				Other Info.
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selCompByID" runat="server">Completed By</asp:Label><br/>
			<asp:DropDownList ID="selCompByID" Runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtDateDone" runat="server">Date Done</asp:Label><br/>
			<asp:TextBox ID="txtDateDone" Runat="server" style="width: 200px;" />
			<img alt="Date Picker" src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgCalendar" style="margin-left: 4px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Label AssociatedControlID="txtNotes" runat="server">Notes</asp:Label><br/>
			<asp:TextBox ID="txtNotes" Runat="server" TextMode="MultiLine" rows="6" style="width:90%;" />
		</td>
		<td rowspan="2" id="tdDocuments" runat="server" style="border-left: solid 1px #336699; border-bottom: solid 1px #336699; width: 250px; padding: 0px;">
			<div style="text-align: center; width: 100%; background-color: #a1b5cf; font-weight: bold; padding: 2px;">
				Subject Documents
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="border-bottom: solid 1px #336699;">
			<asp:CheckBox ID="chkMissingFormFlag" Runat="server" />
			<asp:Label AssociatedControlID="chkMissingFormFlag" Runat="server">Missing Paper Form</asp:Label>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<asp:Button ID="btnChangeAction" Runat="server" Text="Change Action" OnClick="ChangeAction" />
			<asp:Button ID="btnUploadDocument" Runat="server" Text="Upload Document" OnClick="UploadDocument" />
			<asp:HiddenField ID="hidStudyMeasSubjID" Runat="server" />
			<asp:HiddenField ID="hidDoRefresh" Runat="server" />
		</td>
	</tr>
</table>

<dlcalendar click_element_id="imgCalendar" input_element_id="<%=txtDateDone.ClientID %>"></dlcalendar>

</asp:Content>