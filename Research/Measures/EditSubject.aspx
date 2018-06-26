<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="EditSubject.aspx.cs" 
AutoEventWireup="True" Inherits="Measures.EditSubject"  EnableEventValidation="false" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" runat="server" id="tblMaster">
	<tr class="trTitle">
		<td colspan="3" id="tdTitle" runat="server"></td>
	</tr>
	<tr>
		<td>
			<label for="selSubjStatusID">Subject Status</label><br/>
			<asp:DropDownList ID="selSubjStatusID" Runat="server" style="width: 200px;" />
		</td>
		<td>
			<label for="selSubjStatusDetailID">Subject Status Detail</label><br/>
			<asp:DropDownList ID="selSubjStatusDetailID" Runat="server" style="width: 200px;" />
		</td>
		<td rowspan="2" id="tdInfo" runat="server" style="border-left: solid 1px #336699; border-bottom: solid 1px #336699; width: 250px; padding: 0px;">
			<div style="text-align: center; width: 100%; background-color: #a1b5cf; font-weight: bold; padding: 2px;">
				Other Info.
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="border-bottom: solid 1px #336699;">
			<label for="txtNotes">Subject Notes</label><br/>
			<asp:TextBox ID="txtNotes" Runat="server" TextMode="MultiLine" Rows="6" style="width: 90%;" />
		</td>
	</tr>
	<tr>
		<td colspan="3" style="vertical-align: top;">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<asp:Button ID="btnUploadDocument" Runat="server" Text="Upload Document" OnClick="UploadDocument" />
			<asp:HiddenField ID="hidSubjectID" runat="server" />
		</td>
	</tr>
</table>




<dlcalendar click_element_id="imgCalendar" input_element_id="txtDateDone"></dlcalendar>
</asp:Content>