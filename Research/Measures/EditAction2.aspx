<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="EditAction2.aspx.cs" AutoEventWireup="True" Inherits="Measures.EditAction2" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" style="margin: 0px; width: 100%;">
	<tr class="trTitle">
		<td colspan="3" id="tdTitle" runat="server"></td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selRespForID" runat="server">Resp. For</asp:Label><br/>
			<asp:DropDownList ID="selRespForID" Runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selActionStatusID" runat="server">Action Status</asp:Label><br/>
			<asp:DropDownList ID="selActionStatusID" Runat="server" style="width: 200px;" />
		</td>
		<td rowspan="3" id="tdInfo" runat="server" style="border-left: solid 1px #336699; width: 250px; padding: 0px;">
			<div style="text-align: center; width: 100%; background-color: #a1b5cf; font-weight: bold; padding: 2px;">
				Other Info.
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selCompByID" runat="server">Comp. By</asp:Label><br/>
			<asp:DropDownList ID="selCompByID" Runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtDateDone" runat="server">Date Done</asp:Label><br/>
			<asp:TextBox ID="txtDateDone" Runat="server" style="width: 200px;" />
			<img src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgCalendar" alt="Select Date" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtDueDateStart" runat="server">Due Date Start</asp:Label><br/>
			<asp:TextBox ID="txtDueDateStart" Runat="server" style="width: 200px;" />
			<img src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgCalendar2" alt="Select Date" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtDueDateEnd" runat="server">Due Date End</asp:Label><br/>
			<asp:TextBox ID="txtDueDateEnd" Runat="server" style="width: 200px;" />
			<img src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgCalendar3" alt="Select Date" />
		</td>
	</tr>
	<tr>
		<td colspan="2" style="border-bottom: solid 1px #336699;">
			<asp:Label AssociatedControlID="txtNotes" runat="server">Notes</asp:Label><br/>
			<asp:TextBox ID="txtNotes" Runat="server" TextMode="MultiLine" Rows="7" style="width: 90%;" />
		</td>
		<td id="tdDocuments" runat="server" style="border-left: solid 1px #336699; border-bottom: solid 1px #336699; width: 250px; padding: 0px;">
			<div style="text-align: center; width: 100%; background-color: #a1b5cf; font-weight: bold; padding: 2px;">
				Subject Documents
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<asp:Button ID="btnScheduleAction" Runat="server" Text="Schedule" OnClick="ScheduleAction" />
			<asp:Button ID="btnAddAssistants" Runat="server" Text="Add Assistants" OnClick="AddAssistants" />
			<asp:Button ID="btnCopyAction" Runat="server" Text="Copy Action" OnClick="CopyAction" />
			<asp:Button ID="btnUploadDocument" Runat="server" Text="Upload Document" OnClick="UploadDocument" />
			<asp:HiddenField ID="hidActionID" runat="server" />
		</td>
	</tr>
</table>
<asp:DataGrid	ID="tblMeasures"
				runat="server"
				CssClass="tblReport"
				CellSpacing="0"
				GridLines="None"
				AutoGenerateColumns="False"
				OnItemDataBound="Meas_Item_Bound">
	<HeaderStyle CssClass="trHeader" />
	<AlternatingItemStyle CssClass="trDark" />
	<Columns>
		<asp:BoundColumn HeaderText="Edit" />
		<asp:HyperLinkColumn HeaderText="Measure" DataNavigateUrlFormatString="~/Measures/EditMeasure.aspx?StudyMeasSubjID={0}" DataNavigateUrlField="StudyMeasSubjID" DataTextField="StudyMeasName" />
        <asp:BoundColumn HeaderText="Subject ID" DataField="ID" />
		<asp:BoundColumn HeaderText="Meas. Status" DataField="MeasStatus" />
		<asp:BoundColumn HeaderText="Date Collected" DataField="MeasDate" />
		<asp:BoundColumn HeaderText="Clinician" DataField="StaffShortName" />


		<asp:TemplateColumn HeaderText="DataEntry Status"  SortExpression="[ActionToTake] ASC" >
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1"  
                    NavigateUrl='<%# Eval("FormURL") %>' 
                    runat="server" 
                    Text='<%# Eval("ActionToTake") %>' 
                    ></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateColumn>
        
        
	</Columns>
</asp:DataGrid>
<table cellspacing="0" class="tblReport" style="border-top: 0px;" id="tblMeasControl" runat="server">
	<tr>
		<td>
			<a href="javascript:ChangeCheckBoxes('chkMeasToEdit', true);">Check All</a> |
			<a href="javascript:ChangeCheckBoxes('chkMeasToEdit', false);">Clear All</a>
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" name="btnEditMeasures" id="btnEditMeasures" runat="server" value="Edit Checked Measures" />
			<input type="button" name="btnMoveMeasures" id="btnMoveMeasures" runat="server" value="Move Checked Measures" />
		</td>
	</tr>
</table>
<asp:DataGrid	ID="tblConsents"
				runat="server"
				CssClass="tblReport"
				CellSpacing="0"
				GridLines="None"
				AutoGenerateColumns="False"
				OnItemDataBound="Consent_Item_Bound">
	<HeaderStyle CssClass="trHeader" />
	<AlternatingItemStyle CssClass="trDark" />
	<Columns>
		<asp:BoundColumn HeaderText="Edit" />
		<asp:HyperLinkColumn HeaderText="Consent Form" DataNavigateUrlFormatString="~/Measures/EditConsentForm.aspx?SubjConsentID={0}" DataNavigateUrlField="SubjConsentID" DataTextField="ConsentFormName" />
		<asp:BoundColumn HeaderText="Version" DataField="ConsentFormVersionName" />
		<asp:BoundColumn HeaderText="Date Signed" DataField="DateSigned" />
	</Columns>
</asp:DataGrid>
<table cellspacing="0" class="tblReport" style="border-top: 0px;" id="tblConsentControl" runat="server">
	<tr>
		<td>
			<a href="javascript:ChangeCheckBoxes('chkConsentToEdit', true);">Check All</a> |
			<a href="javascript:ChangeCheckBoxes('chkConsentToEdit', false);">Clear All</a>
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" name="btnEditConsents" id="btnEditConsents" runat="server" value="Edit Checked Consents" />
			<input type="button" name="btnMoveConsents" id="btnMoveConsents" runat="server" value="Move Checked Consents" />
		</td>
	</tr>
</table>

<dlcalendar click_element_id="imgCalendar" input_element_id="<% =txtDateDone.ClientID %>"></dlcalendar>
<dlcalendar click_element_id="imgCalendar2" input_element_id="<% =txtDueDateStart.ClientID %>"></dlcalendar>
<dlcalendar click_element_id="imgCalendar3" input_element_id="<% =txtDueDateEnd.ClientID %>"></dlcalendar>

</asp:Content>