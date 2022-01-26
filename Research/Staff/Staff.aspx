<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Staff.aspx.cs" AutoEventWireup="true"
 Inherits="Staff_Staff" Title="Staff Info"      %>   <%--Theme="Skin1" EnableEventValidation="true"--%>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">

	<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
	<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' type='text/javascript'></script>  

</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


	

	<table>
		<tr>
			<td style="vertical-align:top; padding-left:10px">

				<dx:ASPxLabel ID="lbl" runat="server" Text="Edit Staff Info" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>

	       <dx:ASPxGridView ID="gv_staff" runat="server" ClientInstanceName="staff" DataSourceID="sql_staff"  KeyFieldName="staffpk" 
			   OnRowInserting="gvcrud_OnRowInserting"  OnRowUpdating="gvcrud_OnRowUpdating" Styles-Header-Wrap="true" 
			   SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true" >
			   <Columns>
				  <dx:GridViewDataColumn Width="80" FieldName="staffpk" CellStyle-ForeColor="Silver" ReadOnly="true"/>
				   <dx:GridViewDataComboBoxColumn Width="150" FieldName="stafftypepk" Caption="Staff Type">
					  <PropertiesComboBox DataSourceID="sql_stafftype" ValueField="stafftypepk" TextField="stafftype"/>
				  </dx:GridViewDataComboBoxColumn>
				  <dx:GridViewDataColumn Width="100" FieldName="first_name" Caption="First" />
				  <dx:GridViewDataColumn Width="100" FieldName="last_name" Caption="Last"/>
				  <dx:GridViewDataColumn Width="120" FieldName="pref_name" Caption="Preferred Name" />
				  <dx:GridViewDataDateColumn Width="100" FieldName="dob" Caption="DOB"/>
				  <dx:GridViewDataColumn Width="80" FieldName="employee_id" Caption="Employee ID" />
				  <dx:GridViewDataColumn Width="80" FieldName="net_id" Caption="NETID" />
				  <dx:GridViewDataComboBoxColumn Width="80" FieldName="clinic_staff" Caption="Clinic staff?">
						<PropertiesComboBox>
							<Items>
								<dx:ListEditItem Value="No" />
								<dx:ListEditItem Value="Yes" />
								<dx:ListEditItem Value="Other" />
							</Items>
						</PropertiesComboBox>
				  </dx:GridViewDataComboBoxColumn>
				  <dx:GridViewDataComboBoxColumn Width="80" FieldName="research_staff" Caption="Research staff?">
					  <PropertiesComboBox>
							<Items>
								<dx:ListEditItem Value="No" />
								<dx:ListEditItem Value="Yes" />
								<dx:ListEditItem Value="Other" />
							</Items>
						</PropertiesComboBox>
				  </dx:GridViewDataComboBoxColumn>
				   <dx:GridViewDataComboBoxColumn Width="150" FieldName="deptpk" Caption="Department">
					  <PropertiesComboBox DataSourceID="sql_dept" ValueField="deptpk" TextField="department"/>
				  </dx:GridViewDataComboBoxColumn>
				</Columns>

			  <SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row"  BatchEditSettings-StartEditAction="Click"></SettingsEditing>
			  <SettingsPager Mode="ShowAllRecords"></SettingsPager>
			</dx:ASPxGridView>

							</td>
					</tr>
	</table>


	<br />
	<br />
	<table>
		<tr>
			<td style="vertical-align:top; padding-left:10px">


		<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Events / Dates" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>

	 <dx:ASPxGridView ID="gv_staffevent" runat="server" ClientInstanceName="staffevent" DataSourceID="sql_staffevent"  KeyFieldName="staffeventpk" 
   OnRowInserting="gvcrud_OnRowInserting"  OnRowUpdating="gvcrud_OnRowUpdating" OnRowDeleting="gvcrud_OnRowDeleting"  Styles-Header-Wrap="true" 
   SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true"  SettingsDataSecurity-AllowDelete="true">
   <Columns>
	   	   <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowDeleteButton="true"></dx:GridViewCommandColumn>

	   <dx:GridViewDataColumn Width="50" FieldName="staffeventpk" CellStyle-ForeColor="Silver" ReadOnly="true" Visible="false" />
	   <dx:GridViewDataComboBoxColumn Width="200" FieldName="eventpk"  Caption="Event" >
		   <PropertiesComboBox DataSourceID="sql_events" TextField="eventname" ValueField="eventpk"></PropertiesComboBox>
	   </dx:GridViewDataComboBoxColumn>
	   <dx:GridViewDataDateColumn Width="100" FieldName="eventdate" Caption="Date"></dx:GridViewDataDateColumn>

	   </Columns>
		   <SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row"  BatchEditSettings-StartEditAction="Click"></SettingsEditing>
  <SettingsPager Mode="ShowAllRecords"></SettingsPager>
		 </dx:ASPxGridView>

				</td>
			<td style="vertical-align:top; padding-left:60px">


			<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Misc Info" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>

	 <dx:ASPxGridView ID="gv_staffproperty" runat="server" ClientInstanceName="staffproperty" DataSourceID="sql_staffproperty"  KeyFieldName="staffpropertypk" Width="500"
   OnRowInserting="gvcrud_OnRowInserting"  OnRowUpdating="gvcrud_OnRowUpdating" OnRowDeleting="gvcrud_OnRowDeleting" Styles-Header-Wrap="true" 
   SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true"  SettingsDataSecurity-AllowDelete="true" >
   <Columns>
	   <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowDeleteButton="true"></dx:GridViewCommandColumn>
	   <dx:GridViewDataColumn Width="50" FieldName="staffpropertypk" CellStyle-ForeColor="Silver" ReadOnly="true" Visible="false"/>
	   <dx:GridViewDataComboBoxColumn Width="200" FieldName="propertypk" Caption="Property"  >
		   <PropertiesComboBox DataSourceID="sql_property" TextField="propertyname" ValueField="propertypk"></PropertiesComboBox>
	   </dx:GridViewDataComboBoxColumn>
	   <dx:GridViewDataColumn Width="120" FieldName="propertyvalue" Caption="Value"></dx:GridViewDataColumn>

	   </Columns>
		   <SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row"  BatchEditSettings-StartEditAction="Click"></SettingsEditing>
  <SettingsPager Mode="ShowAllRecords"></SettingsPager>
		 </dx:ASPxGridView>

			</td>
		</tr>
	</table>


		<asp:SqlDataSource ID="sql_staff" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.staff where staffpk=@staffpk">
			<SelectParameters>
				<asp:QueryStringParameter QueryStringField="staffpk" Name="staffpk" Type="Int32" />
			</SelectParameters> 
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_staffevent" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.vwstaffevent where staffpk=@staffpk order by eventdate desc">
			<SelectParameters>
				<asp:QueryStringParameter QueryStringField="staffpk" Name="staffpk" Type="Int32" />
			</SelectParameters> 
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_staffproperty" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.vwstaffproperty where staffpk=@staffpk">
			<SelectParameters>
				<asp:QueryStringParameter QueryStringField="staffpk" Name="staffpk" Type="Int32" />
			</SelectParameters> 
		</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_events" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.event_lkup ">
			<SelectParameters>
				<asp:QueryStringParameter QueryStringField="staffpk" Name="staffpk" Type="Int32" />
			</SelectParameters> 
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_property" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.property_lkup ">
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_dept" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.dept_lkup ">
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_stafftype" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.stafftype_lkup ">
		</asp:SqlDataSource>

</asp:Content>

