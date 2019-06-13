<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="Calendar.aspx.cs" Inherits="WebCal_Calendar" Title="WebCal"%>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<script type="text/javascript">
		function UpdateInfo() {
			var daysTotal = deEnd.GetRangeDayCount();
			tbInfo.SetText(daysTotal !== -1 ? daysTotal + ' days' : '');
		}
	</script>

<%--<table class="tblCalendar" cellspacing="0" id="tblMaster" runat="server">
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
					<%--DF: 4/9 converted to server control, added ~-- %>
					<img runat="server" id="imgStartDate" src="~/images/dlcalendar_2.gif" alt="" /><br/>
				</td>
				<td>
					<asp:Label AssociatedControlID="txtEndDate" runat="server">End Date</asp:Label><br/>
					<asp:TextBox ID="txtEndDate" runat="server" style="width: 130px" />
					<%--DF: 4/9 converted to server control, added ~-- %>
					<img runat="server" id="imgEndDate" src="~/images/dlcalendar_2.gif" alt="" />
				</td>
				<td style="vertical-align: middle;">
					<asp:Button ID="btnSubmit" runat="server" Text="Submit" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>--%>



<%--DF: Used imgStartDate.ClientID--%>
<%--<dlcalendar click_element_id='<% =imgStartDate.ClientID %>' input_element_id="<% =txtStartDate.ClientID.Replace("_", "$") %>"></dlcalendar>
<dlcalendar click_element_id='<% =imgEndDate.ClientID %>' input_element_id="<% =txtEndDate.ClientID.Replace("_", "$") %>"></dlcalendar>--%>




	<dx:ASPxFormLayout ID="flDateRangePicker" runat="server" RequiredMarkDisplayMode="None" CssClass="indent" UseDefaultPaddings="false">
		<SettingsItemCaptions Location="Top"></SettingsItemCaptions>
		<SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
		<Items>
			<dx:LayoutGroup ColCount="3" GroupBoxDecoration="none" UseDefaultPaddings="false" BackColor="WhiteSmoke">
				<Items>
					<dx:LayoutItem Caption="Start Date">
						<LayoutItemNestedControlCollection>
							<dx:LayoutItemNestedControlContainer runat="server">
								<dx:ASPxDateEdit ID="deStart" ClientInstanceName="deStart" runat="server">
									<ClientSideEvents DateChanged="UpdateInfo"></ClientSideEvents>
									<CalendarProperties>
										<FastNavProperties DisplayMode="Inline" />
									</CalendarProperties>
									<ValidationSettings Display="Dynamic" SetFocusOnError="True" CausesValidation="True" ErrorDisplayMode="ImageWithTooltip">
										<RequiredField IsRequired="True" ErrorText="Start date is required"></RequiredField>
									</ValidationSettings>
								</dx:ASPxDateEdit>
							</dx:LayoutItemNestedControlContainer>
						</LayoutItemNestedControlCollection>
					</dx:LayoutItem>
					<dx:LayoutItem Caption="End Date">
						<LayoutItemNestedControlCollection>
							<dx:LayoutItemNestedControlContainer runat="server">
								<dx:ASPxDateEdit ID="deEnd" ClientInstanceName="deEnd" runat="server">
									<CalendarProperties>
										<FastNavProperties DisplayMode="Inline" />
									</CalendarProperties>
									<DateRangeSettings StartDateEditID="deStart"></DateRangeSettings>
									<ClientSideEvents DateChanged="UpdateInfo"></ClientSideEvents>
									<ValidationSettings Display="Dynamic" SetFocusOnError="True" CausesValidation="True" ErrorDisplayMode="ImageWithTooltip">
										<RequiredField IsRequired="True" ErrorText="End date is required"></RequiredField>
									</ValidationSettings>
								</dx:ASPxDateEdit>
							</dx:LayoutItemNestedControlContainer>
						</LayoutItemNestedControlCollection>
					</dx:LayoutItem>
					<dx:LayoutItem Caption="Duration">
						<LayoutItemNestedControlCollection>
							<dx:LayoutItemNestedControlContainer runat="server">
								<dx:ASPxLabel ID="tbInfo" ClientInstanceName="tbInfo" runat="server" ReadOnly="True">
								</dx:ASPxLabel>
							</dx:LayoutItemNestedControlContainer>
						</LayoutItemNestedControlCollection>
					</dx:LayoutItem>

					<dx:LayoutItem ShowCaption="False" ColSpan="3" Height="30" Width="95%">
						<LayoutItemNestedControlCollection>
							<dx:LayoutItemNestedControlContainer runat="server">
								<dx:ASPxValidationSummary ID="ASPxValidationSummary1" runat="server" ClientInstanceName="validationSummary" ShowErrorsInEditors="True">
								</dx:ASPxValidationSummary>
							</dx:LayoutItemNestedControlContainer>
						</LayoutItemNestedControlCollection>
					</dx:LayoutItem>
					<dx:LayoutItem ShowCaption="False" Width="95%" HorizontalAlign="Right">
						<LayoutItemNestedControlCollection>
							<dx:LayoutItemNestedControlContainer runat="server">
								<dx:ASPxButton ID="ASPxButton1" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
							</dx:LayoutItemNestedControlContainer>
						</LayoutItemNestedControlCollection>
					</dx:LayoutItem>
				</Items>
			</dx:LayoutGroup>
		</Items>
	</dx:ASPxFormLayout>



	<br />
	<br />


	<dx:ASPxLabel ID="lblCount" runat="server" Font-Size="Medium" ForeColor="Silver"></dx:ASPxLabel>
	<br />

	<dx:ASPxScheduler ID="dxSched" runat="server" Width="100%" ActiveViewType="Agenda" Visible="true" 
		ClientInstanceName="dxSched"  GroupType="Resource" 
		AppointmentDataSourceID="sql_appts"
		ResourceDataSourceID="sql_studies" >
		<ResourceNavigator EnableIncreaseDecrease="true" />
		<Storage EnableReminders="false">
			<Appointments CommitIdToDataSource="false" AutoReload="true"> 
				<Mappings AppointmentId="ActionID" End="ApptEndTime" Start="ApptStartTime" Subject="Subject" Description="ActionNotes"
					Location="Location"  Type="ActionType" 
					 Label="StudyName" Status="Status" ResourceId="StudyID" />
			</Appointments>
			<Resources >
				<Mappings ResourceId="StudyID" Caption="StudyName" />
			</Resources>
		</Storage>
		<Views>
			<DayView Enabled="False"/>
			<WorkWeekView ResourcesPerPage="1" ShowWorkTimeOnly="true">
				<WorkTime Start="07:00:00" End="20:00:00" />
			</WorkWeekView>
			<WeekView Enabled="False" />
			<MonthView Enabled="True" />
			<TimelineView Enabled="True" ResourcesPerPage="3" />
			<AgendaView Enabled="True" DayCount="14" />
		</Views>
		<OptionsBehavior ShowViewSelector="True" />
		<Storage EnableReminders="false" />
	</dx:ASPxScheduler>



		<%--  SqlDataSource for tblLogInfo  --%>
<%--<asp:SqlDataSource runat="server" ID="sql_labs"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" SelectCommandType="Text"  
SelectCommand="select a.LabID, LabName 
from tblLab a join tbllabgroup b ON a.labID = b.labID join tbllabgroup_staff c ON b.labgroupID=c.LabGroupID where staffID = sec.systemuser_staffID()
group by a.LabID, LabName" >
</asp:SqlDataSource>--%>


<%--	<asp:SqlDataSource runat="server" ID="sql_studies"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" SelectCommandType="Text" 
SelectCommand="select a.StudyID, StudyName from tblStudy a join tblGroup b ON a.studyID = b.studyID group by a.StudyID, StudyName " >
</asp:SqlDataSource>--%>

	
<asp:SqlDataSource runat="server" ID="sql_appts"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" SelectCommandType="Text" 
SelectCommand="exec sec.spSetUserContext 'jeffmun'; exec [trk].[spAuthUser_GetCalendar] @StartDate, @EndDate" >
	<SelectParameters>
		<asp:ControlParameter ControlID="flDateRangePicker$deStart" DbType="DateTime" Name="StartDate" PropertyName="Value"  />
		<asp:ControlParameter ControlID="flDateRangePicker$deEnd" DbType="DateTime" Name="EndDate" PropertyName="Value"/>
	</SelectParameters>
</asp:SqlDataSource>


	<asp:SqlDataSource runat="server" ID="sql_studies"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" SelectCommandType="Text" 
SelectCommand="exec sec.spSetUserContext 'jeffmun'; exec [trk].[spAuthUser_GetCalendar_Studies] @StartDate, @EndDate" >
	<SelectParameters>
		<asp:ControlParameter ControlID="flDateRangePicker$deStart" DbType="DateTime" Name="StartDate" PropertyName="Value" />
		<asp:ControlParameter ControlID="flDateRangePicker$deEnd" DbType="DateTime" Name="EndDate" PropertyName="Value" />
	</SelectParameters>
</asp:SqlDataSource>




</asp:Content>