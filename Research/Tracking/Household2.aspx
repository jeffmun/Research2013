
<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Household2.aspx.cs" AutoEventWireup="true" EnableEventValidation="true"
 Inherits="Tracking_Household2" Title="Household Info"  %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	
<style type="text/css"> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style type="text/css"> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style type="text/css"> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style type="text/css"> .rowstyleAction   {   background-color:gray;  } </style>  
<style type="text/css"> .right_align { text-align: right; }  </style>
<style type="text/css">  p {color: DarkBlue; }
  .fs14 {    font-size: 12px;  }
</style>
	 
<style> big {font-size:14pt; }</style>

<style type="text/css">
	foo
	{
		color: red;
		position: relative !important;
		top:-2px !important;
		left: -2px !important;
	}
</style>
<style type="text/css">
	.custom-validator
	{
		position: relative !important;
		top:-2px !important;
		left: -2px !important;
	}
</style>


	<style type="text/css">
	.container-red input
	{
		color: #FF0000 !important;
	}

	.container-blue input
	{
		color: #0000FF !important;
	}
</style>


	
<%--from :  http://stackoverflow.com/questions/14746564/asp-net-get-screen-width?rq=1--%>
<input type="hidden" value="" name="clientScreenHeight" id="clientScreenHeight" />
<input type="hidden" value="" name="clientScreenWidth" id="clientScreenWidth" />

<asp:HiddenField ID="hidHouseholdID" runat="server" />
<asp:HiddenField ID="hidPersonID" runat="server" />




	<script type="text/javascript">

		function OnEndCallBack(s, e) {
			if (s.cpIsUpdated != '') {
				txtPopup.SetText ( s.cpIsUpdated);
				popupControl.Show();
			}
			else {
			}
		}

		function OnBeginCallBack(s, e) {

			if (e.command == "DELETEROW") {

			}
			//if (s.cpIsUpdated != '') {
			//	txtPopup.SetText ( s.cpIsUpdated);
			//	popupControl.Show();
			//}
			//else {
			//}
		}

		////use the following to process the click on the popup control
		//function Yes_Click() {
		//    popupControl.Hide();
		//    gvProducts.DeleteRow(gvProducts.cpRowIndex);            
		//}
		//function No_Click() {
		//    pcConfirm.Hide()
		//}

	</script>



 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td ></td></tr>
 </table>

<table style="width:90%">
	
	<tr>
		<td  style="width:20%">
			<asp:Label ID="Label1" runat="server" Text="Household Information" Font-Size="Medium" Font-Bold="false"></asp:Label>
		</td>
		<td  style="width:60%" colspan="2">
			<asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
			<asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>

		</td>
		<td  style="width:20%">

		</td>
	</tr>
	<tr>
		<td >
		</td>  
		<td>
			<dx:ASPxComboBox ID="dxddlID" runat="server" OnSelectedIndexChanged="ddlID_SelectedIndexChanged" Width="210px" AutoPostBack="true"></dx:ASPxComboBox>

		</td>
		<td>
<%--			<asp:Button ID="btnOld" runat="server" Text="Goto Old Household Page" OnClick="btnOld_Click" Font-Bold="true" ForeColor="DeepSkyBlue" Visible="false" />--%>
		</td>
		<td style="align-content:flex-end">


			<dx:ASPxButton ID="btnGotoCreate" runat="server" Text="Create New Household"
				OnClick="btnGotoCreate_OnClick" />
			<br />
			<asp:Label ID="lblEnterName" runat="server" Text="" ForeColor="Blue" Font-Size="XX-Small"></asp:Label>
		</td>
	</tr>
</table>

<%--    OnClick="btnHouseholdINSERT_Click" --%>

<table>
	<tr>
		<td>

		</td>
		<td style="vertical-align:top">
			<asp:Panel  ID="p_timepoint" runat="server"  Visible="true"></asp:Panel>
		</td>
		<td style="width:100px">

		</td>
		<td>
			<obout:OboutButton runat="server" Text="Excel" Visible="false" OnClientClick="exportToExcel();return false;" />
		</td>
	</tr>
</table>




<br />


<%--	<asp:UpdatePanel ID="panel" runat="server" Visible="false" UpdateMode="Conditional" >
		<ContentTemplate>--%>

	<asp:Panel ID="panelMAIN" runat="server" Visible="false" >


	<dx:ASPxLabel ID="clientLabel" runat="server" ClientInstanceName="clientLabel"></dx:ASPxLabel>

	<asp:Label ID="lblHHname" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"  ></asp:Label>

		<dx:ASPxButton ID="btnShowAll" runat="server" ClientInstanceName="btnShowAll"  Text="+" AutoPostBack="false" Paddings-Padding="0">                                <ClientSideEvents Click="onShowAll" />
			<ClientSideEvents Click="function() { dxgridPeople.ExpandAllDetailRows(); }" />
		</dx:ASPxButton>
		<dx:ASPxButton ID="btnCollapseAll" runat="server" ClientInstanceName="btnCollapseAll"  Text="-" AutoPostBack="false" Paddings-Padding="0">                                <ClientSideEvents Click="onShowAll" />
			<ClientSideEvents Click="function() { dxgridPeople.CollapseAllDetailRows(); }" />
		</dx:ASPxButton>

	<table>
		<tr>
			<td >
				<dx:ASPxGridView ID="dxgridPeople" runat="server" ClientInstanceName="dxgridPeople"  
					DataSourceID="sql__person" KeyFieldName="personID"   KeyboardSupport="true" AccessKey="D"
					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true"
					OnRowValidating="dxgridPeople_RowValidating" 
					OnHtmlRowPrepared="dxgridPeople_OnHtmlRowPrepared" 
					OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating"  OnRowDeleting="dxgrid_OnRowDeleting" >
					<SettingsEditing Mode="EditFormAndDisplayRow" />
					<SettingsPager Mode="ShowAllRecords" />
					<SettingsBehavior ConfirmDelete="true" />
					<ClientSideEvents EndCallback="OnEndCallBack" />
					<Columns>
						<dx:GridViewDataColumn FieldName="personID" Caption="" Visible="false" ></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="LastName" Caption="Last Name"  Width="120px" CellStyle-Font-Bold="true"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="FirstName" Caption="First Name"  Width="100px"  CellStyle-Font-Bold="true"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="NickName" Caption="Nick Name"  Width="80px"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="MiddleName" Caption="Middle Name"  Visible="false" Width="80px"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Sex" Caption="Sex" Width="50px"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="DOB" Caption="DOB" Width="100px"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="currageYM" Caption="Age (Y:M)" Width="60px"   ReadOnly="true"  EditFormSettings-Visible="false"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="CityOfBirth" Caption="City of birth" Visible="false" ></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="StateOfBirth" Caption="State of birth" Visible="false" ></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="LastNameOnBC" Caption="Last Name on Birth Cert" Visible="false" ></dx:GridViewDataColumn>


						<dx:GridViewDataComboBoxColumn FieldName="Role" Caption="Role" PropertiesComboBox-NullText="Undefined"  >
							<PropertiesComboBox TextField="PersonRole" ValueField="Role" DataSourceID='sql_Personrole'  />
						</dx:GridViewDataComboBoxColumn>

						<dx:GridViewDataComboBoxColumn FieldName="EthnicityID" Caption="Race"  PropertiesComboBox-NullText="Unknown">
							<PropertiesComboBox TextField="EthnicityDesc" ValueField="EthnicityID" DataSourceID='sql_Ethnicity'  />
						</dx:GridViewDataComboBoxColumn>

						<dx:GridViewDataComboBoxColumn FieldName="HispanicID" Caption="Ethnicity" PropertiesComboBox-NullText="Unknown" >
							<PropertiesComboBox TextField="HispanicDesc" ValueField="HispanicID" DataSourceID='sql_Hispanic'  />
						</dx:GridViewDataComboBoxColumn>

						<dx:GridViewDataTextColumn FieldName="Notes" Caption="Notes"  Width="400px"   Visible="false"></dx:GridViewDataTextColumn>


						<dx:GridViewDataTextColumn FieldName="notesOtherID" Caption="Notes/OtherID's" Width="250px" 
							PropertiesTextEdit-EncodeHtml="false" ReadOnly="true"
							EditFormSettings-Visible="false">

						</dx:GridViewDataTextColumn>
						<dx:GridViewDataColumn FieldName="MainContact" Caption="MainContact" Visible="false"></dx:GridViewDataColumn>


						<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" ShowDeleteButton="true" />

					</Columns>
					 <Styles>
						<AlternatingRow Enabled="true" BackColor="Gray" />
					</Styles>
					<Templates>
						<EditForm>
							<b><i>Personal Info</i></b>
							<dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server">
							</dx:ASPxGridViewTemplateReplacement>

							
							<table>
								<tr>
									<td>
										<b><i>NDAR Info</i></b><br />
										<table>
											<td>Middle Name:</td>
												<td><dx:ASPxGridViewTemplateReplacement ID="rMiddleName" ColumnID="MiddleName" ReplacementType="EditFormCellEditor" runat="server"/></td>
												<td style="width:50px"></td>
												<td>Last Name on Birth Cert:</td>
												<td><dx:ASPxGridViewTemplateReplacement ID="rLastNameOnBC" ColumnID="LastNameOnBC" ReplacementType="EditFormCellEditor"  runat="server"/></td>
											<tr>
												<td>City of Birth:</td>
												<td><dx:ASPxGridViewTemplateReplacement ID="rCityOfBirth" ColumnID="CityOfBirth" ReplacementType="EditFormCellEditor"  runat="server"/></td>
												<td style="width:50px"></td>
												<td>State of Birth:</td>
												<td><dx:ASPxGridViewTemplateReplacement ID="rStateOfBirth" ColumnID="StateOfBirth" ReplacementType="EditFormCellEditor"  runat="server"/></td>
											</tr>

										</table>

									</td>
							<td style="width:150px"></td>
							<td>
								<dx:ASPxButton ID="btnCreateSubject" runat="server" OnInit="btnCreateSubject_OnInit" Text="Create Subject" Font-Size="12pt" ></dx:ASPxButton> 
							</td>
								</tr>
							</table>


							<dx:ASPxFormLayout ID="layout1" runat="server" ColCount="2">
							</dx:ASPxFormLayout>

							<br />
							<dx:ASPxMemo ID="ASPxMemo1" runat="server" Caption="Notes" Width="50%" Height="100" Text='<%# Bind("Notes") %>' />


							<div style="text-align: right; padding: 12px">
								<dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
									runat="server">
								</dx:ASPxGridViewTemplateReplacement>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
									runat="server">
								</dx:ASPxGridViewTemplateReplacement>
							</div>
						</EditForm>
						<DetailRow>
							Subject Details:
							<br /><br />
							<dx:ASPxGridView ID="dxgridSubjects" runat="server" ClientInstanceName="dxgridSubjects"
								DataSourceID="sql__subject"  EnablePagingGestures="False" OnBeforePerformDataSelect="detailGrid_DataSelect"
								OnCustomButtonInitialize="detailGrid_CustomButtonInitialize" KeyFieldName="subjID"
								>
								 <Styles>
									<%--<CommandColumnItem ForeColor="Green"></CommandColumnItem>--%>
								</Styles>
								<Columns>
									<dx:GridViewDataColumn FieldName="subjID" Caption="" Visible="false"></dx:GridViewDataColumn>

									<dx:GridViewDataColumn FieldName="studyname" Caption="Study" Visible="true"></dx:GridViewDataColumn>
									<dx:GridViewDataTextColumn Name="IDcolumn">
										<DataItemTemplate>
											<dx:ASPxButton ID="btnID" runat="server" AutoPostBack="false" OnInit="btnID_Init" ClientInstanceName="btnFoo"
											   EnableClientSideAPI="true" Font-Bold="true"  ></dx:ASPxButton>
										</DataItemTemplate>
									</dx:GridViewDataTextColumn>
									<dx:GridViewDataColumn FieldName="groupname" Caption="Group" Visible="true" CellStyle-Font-Bold="true"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="subjstatus" Caption="Subject Status" Visible="true"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="subjstatusdetail" Caption="Subject Status Detail" Visible="true"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="Notes" Caption="Notes" Visible="true"></dx:GridViewDataColumn>
								</Columns>
								<SettingsCommandButton>
									<EditButton>
									</EditButton>
								</SettingsCommandButton>
							</dx:ASPxGridView>
						</DetailRow>
					</Templates>


					<SettingsDetail ShowDetailRow="true" />
				</dx:ASPxGridView>
			</td>
		</tr>
	</table>

<table>
		<tr>
			<td>
				<br /><br />
				<asp:Label ID="Label12" runat="server" Text="Phone" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>


				<dx:ASPxGridView ID="dxgridPhone" runat="server" ClientInstanceName="dxgridPhone"  
					DataSourceID="sql__phone" KeyFieldName="phoneID" 
					OnRowInserting="dxgrid_OnRowInserting"  OnRowUpdating="dxgrid_OnRowUpdating"  OnRowDeleting="dxgrid_OnRowDeleting" 
					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true">
					<SettingsBehavior ConfirmDelete="true" />
					<ClientSideEvents EndCallback="OnEndCallBack" />

					<Columns>
						<dx:GridViewDataColumn FieldName="phoneID" Caption="" Visible="false"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="PhoneNum" Caption="Phone Number"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="PhoneType" Caption="Phone Type"></dx:GridViewDataColumn>
						<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" ShowDeleteButton="true" />
					</Columns>
				</dx:ASPxGridView>

				<br />
				<br />
				<asp:Label ID="Label13" runat="server" Text="Email" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>

				<dx:ASPxGridView ID="dxgridEmail" runat="server" ClientInstanceName="dxgridEmail"  
					DataSourceID="sql__email" KeyFieldName="emailID" 
					OnRowInserting="dxgrid_OnRowInserting"  OnRowUpdating="dxgrid_OnRowUpdating"  OnRowDeleting="dxgrid_OnRowDeleting" 
					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true">
					<SettingsBehavior ConfirmDelete="true" />
					<ClientSideEvents EndCallback="OnEndCallBack" />

					<Columns>
						<dx:GridViewDataColumn FieldName="emailID" Caption="" Visible="false"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="emailaddress" Caption="Email"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="emailType" Caption="Email Type"></dx:GridViewDataColumn>
						<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" ShowDeleteButton="true" />
					</Columns>
				</dx:ASPxGridView>


	

			</td>

			<td style="width: 50px"></td>

			<td style="vertical-align: top">
				 <br /><br />
				<asp:Label ID="Label14" runat="server" Text="Address" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>

				<dx:ASPxGridView ID="dxgridAddress" runat="server" ClientInstanceName="dxgridAddress"  
					DataSourceID="sql__address" KeyFieldName="addressID" 
					OnRowInserting="dxgrid_OnRowInserting"  OnRowUpdating="dxgrid_OnRowUpdating"  OnRowDeleting="dxgrid_OnRowDeleting" 
					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true" SettingsDataSecurity-AllowDelete="true">
					<SettingsEditing Mode="Inline"></SettingsEditing>
					<SettingsBehavior ConfirmDelete="true" />
					<ClientSideEvents EndCallback="OnEndCallBack" />
					<Columns>
						<dx:GridViewDataColumn FieldName="addressID" Caption="" Visible="false"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="address1" Caption="Address1"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="address2" Caption="Address2"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="city" Caption="City"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="state" Caption="State"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="zip" Caption="Zip"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="country" Caption="Country"></dx:GridViewDataColumn>
						<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true"  ShowDeleteButton="true"/>

					</Columns>
				</dx:ASPxGridView>

				<br /><br />
				<asp:Label ID="Label15" runat="server" Text="Emergency Contact" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>

				
				<dx:ASPxGridView ID="dxgridEmerContact" runat="server" ClientInstanceName="dxgridEmerContact"  
					DataSourceID="sql__emercontact" KeyFieldName="EmerID" 
					OnRowInserting="dxgrid_OnRowInserting"  OnRowUpdating="dxgrid_OnRowUpdating"  OnRowDeleting="dxgrid_OnRowDeleting" 
					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true" SettingsDataSecurity-AllowDelete="true">
					<SettingsEditing Mode="Inline"></SettingsEditing>
					<SettingsBehavior ConfirmDelete="true" />
					<ClientSideEvents EndCallback="OnEndCallBack" />
					<Columns>

						<dx:GridViewDataColumn FieldName="EmerID" Caption="" Visible="false"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="LastName" Caption="Last"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Firstname" Caption="First"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Address" Caption="Address"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Phone1" Caption="Phone"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Notes" Caption="Notes"></dx:GridViewDataColumn>
						<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" ShowDeleteButton="true"  />
					</Columns>
				</dx:ASPxGridView>
			</td>
		</tr>
	</table>

	<br />
	<br />

		<asp:Label ID="Label16" runat="server" Text="Contact Log" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>


	<dx:ASPxGridView ID="dxgridLogContact" runat="server" ClientInstanceName="dxgridLogContact"  
		DataSourceID="sql__logcontact" KeyFieldName="logcontactID"
		OnRowInserting="dxgrid_OnRowInserting"  OnRowUpdating="dxgrid_OnRowUpdating"  OnRowDeleting="dxgrid_OnRowDeleting" 
	 OnInitNewRow="dxgridLogContact_OnInitNewRow"
		SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true"    >

		<SettingsEditing Mode="Inline"></SettingsEditing>
		<SettingsBehavior ConfirmDelete="true" />
		<SettingsBehavior ConfirmDelete="true" />
		<SettingsPager Position="TopAndBottom" PageSize="10">
							<PageSizeItemSettings Items="10, 20, 50, 100" Visible="true" />
						</SettingsPager>
		<ClientSideEvents EndCallback="OnEndCallBack" />
		<Columns>
			<dx:GridViewDataColumn FieldName="logcontactID" Caption="" Visible="false"></dx:GridViewDataColumn>
			<dx:GridViewDataDateColumn FieldName="logdate" Caption="Date1" PropertiesDateEdit-ClientInstanceName="foobar" 
				PropertiesDateEdit-EditFormat="DateTime" 
				PropertiesDateEdit-DisplayFormatString="MM/dd/yyyy hh:mm tt"   >
				<PropertiesDateEdit>
					<TimeSectionProperties ShowSecondHand="false" Visible="True" >
							  <TimeEditProperties EditFormatString="hh:mm tt"  >
							  </TimeEditProperties>
							  <TimeEditCellStyle>
								   <Paddings PaddingLeft="20px" PaddingRight="20px" />
							  </TimeEditCellStyle>
						 </TimeSectionProperties>
				</PropertiesDateEdit>
			</dx:GridViewDataDateColumn>
			<dx:GridViewDataColumn FieldName="logcontact_timesince" Caption="Time Since" ReadOnly="true"  EditFormSettings-Visible="false"></dx:GridViewDataColumn>

			<dx:GridViewDataComboBoxColumn FieldName="logpriorityID" Caption="Priority"  >
				<PropertiesComboBox TextField="logpriority" ValueField="logpriorityID" DataSourceID='sql_logpriority'  />
			</dx:GridViewDataComboBoxColumn>

			<dx:GridViewDataComboBoxColumn FieldName="logcontacttypeID" Caption="Contact Type"  >
				<PropertiesComboBox TextField="logcontacttype" ValueField="logcontacttypeID" DataSourceID='sql_logcontacttype'  />
			</dx:GridViewDataComboBoxColumn>

			<dx:GridViewDataComboBoxColumn FieldName="logcontactpurposeID" Caption="Purpose"  >
				<PropertiesComboBox TextField="logcontactpurpose" ValueField="logcontactpurposeID" DataSourceID='sql_logcontactpurpose'  />
			</dx:GridViewDataComboBoxColumn>

			<dx:GridViewDataColumn FieldName="lognotes" Caption="Notes"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="studyname" Caption="From Study"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="staffshortname" Caption="By Staff"></dx:GridViewDataColumn>

			<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" ShowDeleteButton="true" />
		</Columns>
	</dx:ASPxGridView>


	<br />
	<br />
				
			<asp:Label ID="Label17" runat="server" Text="Information Log" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>

<%--  DxGrid etc. created with:  sp_CreateSqlDataSource 'tblName'   --%>

<%--  GridView for tblLogInfo  --%>
<dx:ASPxGridView ID="dxgridLogInfo" runat="server" ClientInstanceName="dxgridLogInfo" 
					DataSourceID="sql__tblLogInfo" KeyFieldName="loginfoID"  OnInitNewRow="dxgridLogInfo_OnInitNewRow"
					OnRowInserting="dxgrid_OnRowInserting"  OnRowUpdating="dxgrid_OnRowUpdating"  OnRowDeleting="dxgrid_OnRowDeleting" 
					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true" SettingsDataSecurity-AllowDelete="true">
	<SettingsBehavior ConfirmDelete="true" />	
	<ClientSideEvents EndCallback="OnEndCallBack" />
	<SettingsPager Position="TopAndBottom" PageSize="10">
							<PageSizeItemSettings Items="10, 20, 50, 100" Visible="true" />
						</SettingsPager>
	<Columns>
		<dx:GridViewDataColumn FieldName="loginfoID" Caption="loginfoID" Visible="false" CellStyle-Font-Bold="false"> </dx:GridViewDataColumn> 

		<dx:GridViewDataDateColumn FieldName="loginfodate" Caption="Date" PropertiesDateEdit-ClientInstanceName="foobar2" 
			PropertiesDateEdit-EditFormat="DateTime" 
			PropertiesDateEdit-DisplayFormatString="MM/dd/yyyy hh:mm tt"   >
			<PropertiesDateEdit>
				<TimeSectionProperties ShowSecondHand="false" Visible="True" >
							<TimeEditProperties EditFormatString="hh:mm tt"  >
							</TimeEditProperties>
							<TimeEditCellStyle>
								<Paddings PaddingLeft="20px" PaddingRight="20px" />
							</TimeEditCellStyle>
						</TimeSectionProperties>
			</PropertiesDateEdit>
		</dx:GridViewDataDateColumn>

		<dx:GridViewDataColumn FieldName="loginfo_timesince" Caption="Time Since" Visible="true" CellStyle-Font-Bold="false" EditFormSettings-Visible="false"> </dx:GridViewDataColumn> 

		<dx:GridViewDataComboBoxColumn FieldName="logpriorityID" Caption="Priority"  >
			<PropertiesComboBox TextField="logpriority" ValueField="logpriorityID" DataSourceID='sql_logpriority'  />
		</dx:GridViewDataComboBoxColumn>

		<dx:GridViewDataComboBoxColumn FieldName="loginfocatID" Caption="Category"  >
			<PropertiesComboBox TextField="loginfocat" ValueField="loginfocatID" DataSourceID='sql_loginfocat'  />
		</dx:GridViewDataComboBoxColumn>

		<dx:GridViewDataColumn FieldName="loginfonotes" Caption="Notes" Visible="true" CellStyle-Font-Bold="false" Width="400px"> </dx:GridViewDataColumn> 
		<dx:GridViewDataColumn FieldName="staffshortname" Caption="Staff" Visible="true" CellStyle-Font-Bold="false" EditFormSettings-Visible="false"> </dx:GridViewDataColumn> 
		<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" ShowDeleteButton="true" />
						
	</Columns>
	</dx:ASPxGridView>



	<br />
	<br />
	
	<asp:Button ID="btnMergeHousehold" runat="server" Text="Merge Duplicate Into This Household" OnCommand="ButtonCommand_Click" CommandName="MergeHousehold"   BackColor="LawnGreen" ForeColor="Blue" Visible="false" />
	<br />




</asp:Panel>

 


	<br/>
	<br/>


	<asp:Label ID="lblInfo" runat="server"></asp:Label>


	 <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="popupControl" Height="83px" ShowOnPageLoad="false"
		 Modal="True" CloseAction="CloseButton" Width="207px" AllowDragging="True"
		 PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" HeaderText="">
		 
			<ContentCollection>
				<dx:PopupControlContentControl runat="server">
					<dx:ASPxLabel ID="txtPopup" runat="server" Width="170px" ClientInstanceName="txtPopup">
								</dx:ASPxLabel>
								<br/><br/>
					<table style="border:none">
						<tr>
							<td>
								<%--OnClick="btnOK_Click"--%>
								<dx:ASPxButton ID="btnOK" runat="server"  ClientInstanceName="btnOK" AutoPostBack="False" Text="OK" Width="200px" >
									<ClientSideEvents Click="function(s, e) { popupControl.Hide(); popupControl.ShowOnPageLoad = false; }" />
								</dx:ASPxButton>
							</td>
							<td>
								<dx:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" ClientInstanceName="btnCancel"
									Text="Cancel" Width="80px" Visible="false">
									<ClientSideEvents Click="function(s, e) { popupControl.Hide(); }" />
								</dx:ASPxButton>
							</td>
						</tr>
					</table>
				</dx:PopupControlContentControl>
			</ContentCollection>
		</dx:ASPxPopupControl>

	<br />
	<hr />
	<br />

	<asp:SqlDataSource ID="sqlSS" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select subjstatusID, subjstatus from uwautism_research_backend..tblsubjectstatus_lkup">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlSSD" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select a.subjstatusdetailID, subjstatusdetail from uwautism_research_backend..tblsubjstatusdetail_lkup a
		join tblsubjstatusanddetail b ON a.subjstatusdetailID = b.subjstatusdetailID 
		where b.subjstatusID = @subjstatusID">
		<SelectParameters>
			<asp:Parameter Name="subjstatusID" Type="Int32" />
		</SelectParameters>	    
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sql_PersonRole" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select personroleID Role, personrole from uwautism_research_backend..tblPersonRole_lkup">
	</asp:SqlDataSource>
	

	<asp:SqlDataSource ID="sql_Ethnicity" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select EthnicityID, EthnicityDesc from uwautism_research_backend..tblethnicity">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_Hispanic" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select HispanicID, HispanicDesc from uwautism_research_backend..tblHispanic_lkup">
	</asp:SqlDataSource>
	

	<asp:SqlDataSource ID="sql_logpriority" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select logpriorityID, logpriority from uwautism_research_backend..tbllogpriority_lkup order by 2">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_logcontactpurpose" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select logcontactpurposeID	, logcontactpurpose, sortorder from tblLogContactPurpose_Lkup order by sortorder">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_logcontacttype" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select logcontacttypeID	, logcontacttype, sortorder from tblLogContactType_Lkup order by sortorder">
	</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_loginfocat" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select loginfocatID	, loginfocat from tblLogInfoCat_Lkup where loginfocat not like 'old:%' and loginfocat not in ('a','b','c')">
	</asp:SqlDataSource>

	


	<asp:SqlDataSource ID="sql_Staff" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="exec spTracking_Staff_byStudy">
	</asp:SqlDataSource>



	<asp:SqlDataSource runat="server" ID="sql_Subjects_by_Person"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
	 SelectCommand="hh.spSubject_by_Person" SelectCommandType="StoredProcedure">
			<SelectParameters>
				<asp:Parameter Name="personID" Type="Int32" />
			</SelectParameters>  
	</asp:SqlDataSource>


	<asp:SqlDataSource runat="server" ID="sql__person"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text" InsertCommandType="Text" UpdateCommandType="Text" DeleteCommandType="Text"
	 SelectCommand="exec hh.spPerson_by_HouseholdID @HouseholdID" 
	
	 DeleteCommand="delete from tblperson where personID = @personID" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="HouseholdID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  

		<DeleteParameters>
			<asp:Parameter Name="personID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>


		<asp:SqlDataSource runat="server" ID="sql__subject"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
	 SelectCommand="exec hh.spSubject_by_Person @personID" SelectCommandType="Text">
			<SelectParameters>
				<asp:SessionParameter SessionField="personID" Name="personID" Type="Int32" />
			</SelectParameters>  
	</asp:SqlDataSource>



	<asp:SqlDataSource runat="server" ID="sql__phone"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text"  DeleteCommandType="Text"
	 SelectCommand="select phoneID, PhoneNum, PhoneType, householdID from tblPhoneNumber where HouseholdID = @hhID" 
	 DeleteCommand="delete from tblPhoneNumber where phoneID = @phoneID" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  
		<DeleteParameters>
			<asp:Parameter Name="phoneID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>



		<asp:SqlDataSource runat="server" ID="sql__email"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text" DeleteCommandType="Text"
	 SelectCommand="select emailID, emailaddress, emailType, householdID from tblemail where HouseholdID = @hhID" 
	 DeleteCommand="delete from tblemail where emailID = @emailID" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  
		<DeleteParameters>
			<asp:Parameter Name="emailID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>



	
		<asp:SqlDataSource runat="server" ID="sql__address"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text" DeleteCommandType="Text"
	 SelectCommand="select addressID, address1, address2, city, state, zip, country, householdID from tbladdress where HouseholdID = @hhID" 
	 DeleteCommand="delete from tbladdress where addressID = @addressID" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  
		<DeleteParameters>
			<asp:Parameter Name="addressID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>


	
	<asp:SqlDataSource runat="server" ID="sql__emercontact"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text" DeleteCommandType="Text"
	 SelectCommand="select * from tblEmerContact where householdID = @hhID" 
	 DeleteCommand="delete from tblEmerContact where EmerID = @EmerID" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  
		<DeleteParameters>
			<asp:Parameter Name="EmerID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>

		<asp:SqlDataSource runat="server" ID="sql__logcontact"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text" 
	 SelectCommand="select logcontactID,logpriorityID,logcontacttypeID,logdate,logcontactpurposeID
			, dbo.fnElapTime_text(logdate, getdate()) as logcontact_timesince
			, (case when b.householdID is null then '**Notes from another study**' else  lognotes end) lognotes
			, (case when b.householdID is null then '**NO ACCESS**' else  studyname end) studyname
			, a.studyID, a.staffID
			, timestamp, a.HouseholdID, logcontactpurpose, logcontacttype, logpriority, staffshortname
			from vwLogContact a
			join tblStudy a1 ON a.studyID = a1.studyID
			left join (select * from dbo.fnSEC_Allowed_PHI_Households_by_User()) b ON a.HouseholdID = b.householdID 	
			where a.HouseholdID = @hhID
			order by logdate desc" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  
	</asp:SqlDataSource>


	<%--  SqlDataSource for tblLogInfo  --%>
<asp:SqlDataSource runat="server" ID="sql__tblLogInfo"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" SelectCommandType="Text" InsertCommandType="Text" UpdateCommandType="Text" DeleteCommandType="Text" 
SelectCommand="select loginfoID,logpriorityID,loginfocatID,loginfodate,actionadded,actionID
		, (case when b.householdID is null then '**Notes from another study**' else  loginfonotes end) loginfonotes
		, dbo.fnElapTime_text(loginfodate, getdate()) as loginfo_timesince
		, a.staffID
		, timestamp, a.HouseholdID, logpriority, loginfocat, staffshortname
		from vwLogInfo a
		left join (select * from dbo.fnSEC_Allowed_PHI_Households_by_User()) b ON a.HouseholdID = b.householdID 	
		where a.HouseholdID = @hhID
		order by loginfodate desc " 
>
<SelectParameters>
	<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" /> 
</SelectParameters>
</asp:SqlDataSource>

	

</asp:Content>
