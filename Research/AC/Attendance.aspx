<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Attendance.aspx.cs" AutoEventWireup="true"
 Inherits="AC_Attendance" Title="LAUNCH Attendance"      %>   <%--Theme="Skin1" EnableEventValidation="true"--%>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">

	<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
	<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' type='text/javascript'></script>  

</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

	<script type="text/javascript">
		function btnNew_Click(s, e) {
			events.AddNewRow();
		}
    </script>


	<dx:ASPxButton ID="btnNew"  ClientInstanceName="btnNew"  runat="server" Text="Insert New Event" AutoPostBack="false">
		<ClientSideEvents Click="btnNew_Click" />
	</dx:ASPxButton>

	<table>
		<tr>
			<td style="padding-left:10px">
				<dx:ASPxLabel ID="lbl" runat="server" Text="Device List" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
			</td>


		</tr>
	</table>


	<br />
	<table>
		<tr>
			<td style="padding-left:10px">

	       <dx:ASPxGridView ID="gv_events" runat="server" ClientInstanceName="events" DataSourceID="sql_events"  KeyFieldName="ID"  Width="1500"
				Styles-Header-Wrap="true"  OnRowUpdating="gvcrud_OnRowUpdating" OnRowInserting="gvcrud_OnRowInserting" OnRowDeleting="gvcrud_OnRowDeleting" 
			   SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true"  SettingsDataSecurity-AllowDelete="true" >
			   <Columns>

					<dx:GridViewDataTextColumn Width="120" FieldName="clientID" Caption="Client"  />
					<dx:GridViewDataDateColumn Width="120" FieldName="date" Caption="Date"  />

				   	 <dx:GridViewDataComboBoxColumn Width="80" FieldName="cohort_ID" Caption="Cohort"  >
					  <PropertiesComboBox DataSourceID="sql_cohorts" ValueField="ID" TextField="Name"/>
				    </dx:GridViewDataComboBoxColumn>

				   	<dx:GridViewDataComboBoxColumn Width="80" FieldName="Event_status_ID" Caption="Status"  >
					  <PropertiesComboBox DataSourceID="sql_absencereasons" ValueField="ID" TextField="Name"/>
				    </dx:GridViewDataComboBoxColumn>
				   
				   	<dx:GridViewDataComboBoxColumn Width="80" FieldName="Event_type_ID" Caption="Event Type"  >
					  <PropertiesComboBox DataSourceID="sql_eventtypes" ValueField="ID" TextField="Name"/>
				    </dx:GridViewDataComboBoxColumn>

				   	<dx:GridViewDataTextColumn Width="120" FieldName="Notes" Caption="Notes"  />
				   	<dx:GridViewDataCheckColumn Width="120" FieldName="BCBA" Caption="BCBA"  />
				   	<dx:GridViewDataCheckColumn Width="120" FieldName="SLP" Caption="SLP"  />

			</Columns>

			<Settings ShowFilterRow="true" ShowFooter="true" ShowGroupPanel="true" VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" VerticalScrollBarStyle="Standard" HorizontalScrollBarMode="Visible"/>
			<SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row"  BatchEditSettings-StartEditAction="Click" NewItemRowPosition="Top" ></SettingsEditing>

			  <SettingsPager Mode="ShowAllRecords"></SettingsPager>
						   <TotalSummary>
							   <dx:ASPxSummaryItem FieldName="devicetype" SummaryType="Count" />
						   </TotalSummary>

			</dx:ASPxGridView>

							</td>
					</tr>
	</table>


	<br />
	<br />



		<asp:SqlDataSource ID="sql_events" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="SELECT [ID], [clientID], [date], [cohort_ID], [Event_status_ID], [Event_type_ID], [Notes], [BCBA], [SLP] FROM [uwautism_research_backend].[att].[Events]">
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_cohorts" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="SELECT [ID], [Name] FROM [uwautism_research_backend].[att].[Cohorts]">
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_absencereasons" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="SELECT [ID], [Name] FROM [uwautism_research_backend].[att].[Event_Statuses]">
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_eventtypes" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="SELECT [ID], [Name] FROM [uwautism_research_backend].[att].[Event_Types]">
		</asp:SqlDataSource>


</asp:Content>

