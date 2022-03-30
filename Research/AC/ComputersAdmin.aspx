<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="ComputersAdmin.aspx.cs" AutoEventWireup="true"
 Inherits="AC_Computers" Title="Technology Checkouts"      %>   <%--Theme="Skin1" EnableEventValidation="true"--%>

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

			devices.AddNewRow();
		}




    </script>

	<a href = "https://uwac.autism.washington.edu/Research/Staff/StaffList.aspx">[ Add Staff Member ]</a>
	<br />

	<table>
		<tr>
			<td style="padding-left:10px">
				<dx:ASPxLabel ID="lbl" runat="server" Text="Device List" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
			</td>
<%--			<td style="padding-left:10px">
				<dx:ASPxButton ID="btnNew"  ClientInstanceName="btnNew"  runat="server" Text="Insert New Device" AutoPostBack="false">
					<ClientSideEvents Click="btnNew_Click" />
				</dx:ASPxButton>
			</td>--%>

		</tr>
	</table>


	<br />
	<table>
		<tr>
			<td style="padding-left:10px">

	       <dx:ASPxGridView ID="gv_devices" runat="server" ClientInstanceName="devices" DataSourceID="sql_devices"  KeyFieldName="DeviceId"  Width="1500"
				Styles-Header-Wrap="true"  OnRowUpdating="gvcrud_OnRowUpdating" OnRowInserting="gvcrud_OnRowInserting" OnRowDeleting="gvcrud_OnRowDeleting" 
			   SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true"  SettingsDataSecurity-AllowDelete="true" >
			   <Columns>
  <dx:GridViewDataHyperLinkColumn Width="60"  
	  FieldName="staffpk" Caption="Edit User"
	  PropertiesHyperLinkEdit-NavigateUrlFormatString="~/Staff/Staff.aspx?staffpk={0}"  
	  FixedStyle="Left" Settings-AllowSort="False" ReadOnly = "True"/>
				   

				   
			   <dx:GridViewCommandColumn ShowDeleteButton="true" Caption="Clear User From Device" ></dx:GridViewCommandColumn>
<%--					<dx:GridViewDataTextColumn Width="120" FieldName="username" Caption="User" />--%>
				   	 <dx:GridViewDataComboBoxColumn Width="80" FieldName="staffpk" Caption="User"  >
					  <PropertiesComboBox DataSourceID="sql_users" ValueField="staffpk" TextField="username"/>
				    </dx:GridViewDataComboBoxColumn>

<%--					<dx:GridViewDataTextColumn Width="120" FieldName="useremail" Caption="Email" ReadOnly = "True" />--%>
				   				    <dx:GridViewDataComboBoxColumn Width="80" FieldName="stafftypepk" Caption="Staff Type" ReadOnly = "True" >
					  <PropertiesComboBox DataSourceID="sql_stafftype" ValueField="stafftypepk" TextField="stafftype"/>
				    </dx:GridViewDataComboBoxColumn>
				   <dx:GridViewDataComboBoxColumn Width="80" FieldName="devicestatuspk" Caption="Device Status"  >
					  <PropertiesComboBox DataSourceID="sql_devicestatus" ValueField="devicestatuspk" TextField="devicestatus"/>
				    </dx:GridViewDataComboBoxColumn>
					<dx:GridViewDataTextColumn Width="120" FieldName="devicename" Caption="Device"  />
				    <dx:GridViewDataComboBoxColumn Width="80" FieldName="devicetype" Caption="Device Type" >
					  <PropertiesComboBox DataSourceID="sql_devicetype" ValueField="Id" TextField="devicetype"/>
				    </dx:GridViewDataComboBoxColumn>
					<dx:GridViewDataTextColumn Width="240" FieldName="description" Caption="Description" />
					<dx:GridViewDataTextColumn Width="120" FieldName="location" Caption="Location" />
<%--				   	<dx:GridViewDataDateColumn Width="120" FieldName="lastconfirmation" Caption="Last Confirmation"/>--%>
					<dx:GridViewDataCheckColumn Width="80" FieldName="archived" Caption="Archived" />
					<dx:GridViewDataTextColumn Width="360" FieldName="notes" Caption="Notes" />


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



		<asp:SqlDataSource ID="sql_devices" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select DeviceId, username, useremail, devicename, devicetype, description, location, lastconfirmation, archived, notes, staffpk, stafftypepk, devicestatuspk from [mob].[vwSummary] ">
		</asp:SqlDataSource>

			<asp:SqlDataSource ID="sql_users" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="SELECT distinct staffpk, [first_name] + ' ' + last_name as username FROM [uwautism_research_backend].[stf].[staff] where last_name is not null union all select NULL, '' order by username asc">
		</asp:SqlDataSource>

	





<%--			<asp:SqlDataSource ID="sql_dept" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.dept_lkup ">
		</asp:SqlDataSource>
--%>
		<asp:SqlDataSource ID="sql_devicetype" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from mob.device_types">
		</asp:SqlDataSource>

			<asp:SqlDataSource ID="sql_devicestatus" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from mob.device_statuses">
		</asp:SqlDataSource>

			<asp:SqlDataSource ID="sql_stafftype" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.stafftype_lkup">
		</asp:SqlDataSource>

</asp:Content>

