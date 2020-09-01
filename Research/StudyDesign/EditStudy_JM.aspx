<%@ Page MasterPageFile="~/UWAC.master" Language="C#" Debug="true" CodeFile="EditStudy_JM.aspx.cs" Inherits="StudyDesign.EditStudy_JM" %>

<%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

	<%--DeleteThisPage!--%>

<table cellspacing="0" id="tblMaster" class="tblInputSmall" runat="server">
	<tr class="trTitle">
		<td colspan="4">Edit Study Info.</td>
	</tr>
	<tr>
		<td colspan="4">
			<label for="selStudyID">Study</label><br/>
			<asp:DropDownList ID="selStudyID" Runat="server" style="width: 350px;" AutoPostBack="True" OnSelectedIndexChanged="GetStudyInfo" />
		</td>
	</tr>
	<tr>
		<td>
			<label for="selFullStudyID">Full Study</label><br/>
			<asp:DropDownList ID="selFullStudyID" Runat="server" style="width: 100px;" />
		</td>
		<td>
			<label for="txtStudyName">Study Name</label><br/>
			<asp:TextBox ID="txtStudyName" Runat="server" style="width: 100px;" MaxLength="20" />
		</td>
		<td>
			<label for="txtStudyFullName">Study Full Name</label><br/>
			<asp:TextBox ID="txtStudyFullName" Runat="server" style="width: 200px;" MaxLength="150" />
		</td>
		<td rowspan="3">
			<asp:CheckBox ID="chkIsActive" Runat="server" Checked="True" /><label for="chkIsActive">Active?</label><br/>
			<asp:CheckBox ID="chkIsFamilyStudy" Runat="server" Checked="False" /><label for="chkIsFamilyStudy">Family Study?</label><br/>
			<asp:CheckBox ID="chkCanAppearInReports" Runat="server" Checked="True" /><label for="chkCanAppearInReports">Appears in Reports?</label><br/>
			<asp:CheckBox ID="chkIsCounterBalanced" Runat="server" Checked="False" /><label for="chkIsCounterBalanced">Counterbalanced?</label><br/>
		</td>
	</tr>
	<tr>
		<td>
			<label for="selGrantID">Grant</label><br/>
			<asp:DropDownList ID="selGrantID" Runat="server" style="width: 100px;" />
		</td>
		<td>
			<label for="txtStartDate">Start Date</label><br/>
			<asp:TextBox ID="txtStartDate" Runat="server" style="width: 100px;" MaxLength="10" />
			<img src="<%= Request.ApplicationPath %>/images/dlcalendar_2.gif" alt="Select a Date" id="imgCalendar1" />
		</td>
		<td>
			<label for="txtEndDate">End Date</label><br/>
			<asp:TextBox ID="txtEndDate" Runat="server" style="width: 100px;" MaxLength="10" />
			<img src="<%= Request.ApplicationPath %>/images/dlcalendar_2.gif" alt="Select a Date" id="imgCalendar2" />
		</td>
	</tr>
	<tr>
		<td>
			<label for="selStaffContact">Staff Contact</label><br/>
			<asp:DropDownList ID="selStaffContact" Runat="server" style="width: 150px;" />
		</td>
		<td colspan="2">
			<label for="selStaffPI">PI</label><br/>
			<asp:DropDownList ID="selStaffPI" Runat="server" style="width: 150px;" />
		</td>
	</tr>
	<tr>
		<td colspan="4" style="padding: 8px;">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" /><br/>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<table cellspacing="0" class="tblInput" style="width: 100%; margin: 0px;">
				<tr>
					<td id="tdGroups" class="tdHeaderAlt" style="text-align: center; padding: 8px" onclick="AdjustIFrame('groups');">Groups</td><td style="width: 10px;">&nbsp;</td>
					<td id="tdTimepoints" class="tdHeaderAlt" style="text-align: center; padding: 8px" onclick="AdjustIFrame('timepoints');">TimePoints</td><td style="width: 10px;">&nbsp;</td>
					<td id="tdAction" class="tdHeaderAlt" style="text-align: center; padding: 8px" onclick="AdjustIFrame('actions');">Actions</td><td style="width: 10px;">&nbsp;</td>
					<td id="tdMeasures" class="tdHeaderAlt" style="text-align: center; padding: 8px" onclick="AdjustIFrame('measures');">Measures</td><td style="width: 10px;">&nbsp;</td>
					<td id="tdConsents" class="tdHeaderAlt" style="text-align: center; padding: 8px" onclick="AdjustIFrame('consents');">Consents</td><td style="width: 10px;">&nbsp;</td>
					<td id="tdMeasActAssign" class="tdHeaderAlt" style="text-align: center; padding: 8px" onclick="AdjustIFrame('assignments');">Measure/Action Assignments</td><td style="width: 10px;">&nbsp;</td>
					<td id="tdConsentActAssign" class="tdHeaderAlt" style="text-align: center; padding: 8px" onclick="AdjustIFrame('consentassignments');">Consent/Action Assignments</td><td style="width: 10px;">&nbsp;</td>
					<td id="tdActionGroup" class="tdHeaderAlt" style="text-align: center; padding: 8px" onclick="AdjustIFrame('actiongroups');">Action Groups</td><td style="width: 10px;">&nbsp;</td>
				</tr>
			</table>
			<iframe id="oIFrame" runat="server" src="/" frameborder="0" scrolling="auto" style="background-color: #efefef; width: 100%; height: 350px; display: none; margin: 0px;"></iframe>
		</td>
	</tr>
</table>

<asp:scriptmanager id="ScriptManager1" runat="server" enablepagemethods="true" />

<%--    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" ProcessingMode="Remote" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" >
        <ServerReport ReportPath="/Study Design/Study_Design_-_Groups" 
            ReportServerUrl="https://autism.washington.edu/SQLReportserver/" />
    </rsweb:ReportViewer>


<dlcalendar click_element_id="imgCalendar1" input_element_id="<%= txtStartDate.ClientID  %>"></dlcalendar>
<dlcalendar click_element_id="imgCalendar2" input_element_id="<%= txtEndDate.ClientID %>"></dlcalendar>--%>
</asp:Content>