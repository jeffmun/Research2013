<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="StaffList.aspx.cs" AutoEventWireup="true"
 Inherits="Staff_StaffList" Title="Staff List"      %>   <%--Theme="Skin1" EnableEventValidation="true"--%>

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
			//txtLast.SetVisible(true);
   //         btnSubmit.SetVisible(true);
   //         btnCancel.SetVisible(true);
			//btnNew.SetVisible(false);

			staff.AddNewRow();
		}

        //function btnCancel_Click(s, e) {
        //    txtLast.SetVisible(false);
        //    btnSubmit.SetVisible(false);
        //    btnCancel.SetVisible(false);

        //    btnNew.SetVisible(true);
        //}


    </script>

	<table>
		<tr>
			<td style="padding-left:10px">
				<dx:ASPxLabel ID="lbl" runat="server" Text="Staff List" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
			</td>
			<td style="padding-left:10px">
				<dx:ASPxButton ID="btnNew"  ClientInstanceName="btnNew"  runat="server" Text="Insert New Staff" AutoPostBack="false">
					<ClientSideEvents Click="btnNew_Click" />
				</dx:ASPxButton>
			</td>
	<%--		<td style="padding-left:10px">
				<dx:ASPxTextBox ID="txtLast" ClientInstanceName="txtLast" runat="server" Caption="Enter Last Name:" ClientVisible="false"></dx:ASPxTextBox>
			</td>
			<td style="padding-left:10px">
				<dx:ASPxButton ID="btnSubmit" ClientInstanceName="btnSubmit"  runat="server" Text="Submit" OnClick="btnSubmit_Click" ClientVisible="false"></dx:ASPxButton>
				<dx:ASPxButton ID="btnCancel" ClientInstanceName="btnCancel"  runat="server" Text="Cancel" ClientVisible="false" AutoPostBack="false">
					<ClientSideEvents Click="btnCancel_Click" />
				</dx:ASPxButton>

				</td>--%>
		</tr>
	</table>


	<br />
	<table>
		<tr>
			<td style="padding-left:10px">

	       <dx:ASPxGridView ID="gv_staff" runat="server" ClientInstanceName="staff" DataSourceID="sql_staff"  KeyFieldName="staffpk"  Width="1600"
				Styles-Header-Wrap="true"  OnRowUpdating="gvcrud_OnRowUpdating" OnRowInserting="gvcrud_OnRowInserting" OnRowDeleting="gvcrud_OnRowDeleting" 
			   SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true"  SettingsDataSecurity-AllowDelete="true" >
			   <Columns>
				   <dx:GridViewDataHyperLinkColumn Width="60"  FieldName="staffpk"  PropertiesHyperLinkEdit-NavigateUrlFormatString="Staff.aspx?staffpk={0}"  FixedStyle="Left"/>

				   <dx:GridViewDataComboBoxColumn Width="170" FieldName="stafftypepk" Caption="Staff Type">
					  <PropertiesComboBox DataSourceID="sql_stafftype" ValueField="stafftypepk" TextField="stafftype"/>
				  </dx:GridViewDataComboBoxColumn>
					<dx:GridViewDataColumn Width="120" FieldName="first_name" Caption="First" />
					<dx:GridViewDataColumn Width="120" FieldName="last_name" Caption="Last"/>
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
					<dx:GridViewDataColumn Width="100" FieldName="hire_date" Caption="Hire Date" ReadOnly="true"/>
					<dx:GridViewDataColumn Width="100" FieldName="background_check_date" Caption="Background Check Date" ReadOnly="true"/>
				   <dx:GridViewCommandColumn ShowDeleteButton="true"></dx:GridViewCommandColumn>
			</Columns>

			<Settings ShowFooter="true" ShowGroupPanel="true" VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" VerticalScrollBarStyle="Standard"  HorizontalScrollBarMode="Visible"/>
			<SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row"  BatchEditSettings-StartEditAction="Click" NewItemRowPosition="Top" ></SettingsEditing>

			  <SettingsPager Mode="ShowAllRecords"></SettingsPager>
						   <TotalSummary>
							   <dx:ASPxSummaryItem FieldName="stafftype" SummaryType="Count" />
						   </TotalSummary>
			</dx:ASPxGridView>

							</td>
					</tr>
	</table>


	<br />
	<br />



		<asp:SqlDataSource ID="sql_staff" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.vwstaff_summary_info ">
		</asp:SqlDataSource>

			<asp:SqlDataSource ID="sql_dept" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.dept_lkup ">
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_stafftype" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from stf.stafftype_lkup ">
		</asp:SqlDataSource>

</asp:Content>

