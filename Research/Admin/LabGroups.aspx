<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="LabGroups.aspx.cs" Inherits="Admin_LabGroups" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 



<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableViewState="true"></asp:ScriptManager>

	
	<script type="text/javascript">
		function UpdateColor() {
			gridEditStaff.PerformCallback("updatecolor");
		}

		function StaffSelected(s, e) {
			gridEditStaff.PerformCallback("staffselected");
		}


	</script>
	
	
	<br />
	<table>
		<tr>
			<td style="width:300px">
				<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Staff Assignments" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>

			</td>
			<td style="width:250px">
				<dx:ASPxComboBox ID="cboLab" ClientInstanceName="cboLab" runat="server" DataSourceID="Sql_Labs" AutoPostBack="true" 
					TextField="LabName" ValueField="labID" NullText="--Select Lab--"  OnSelectedIndexChanged="cboLab_OnSelectedIndexChanged" EnableClientSideAPI="true">
				</dx:ASPxComboBox>
			</td>
			<td style="width:250px">


			</td>
			<td>
<%--				<dx:ASPxTrackBar ID="trkColorCorrectionFactor" runat="server" MinValue="0" MaxValue="100" Width="100px" ShowChangeButtons="false"
					Caption="Color Level" ForeColor="Silver" ValueChangedDelay="600" PositionStart="50">
					<ClientSideEvents ValueChanged="UpdateColor"   />
				</dx:ASPxTrackBar>--%>
			</td>
		</tr>
	</table>


	<br />

	<dx:ASPxPageControl ID="pageControl1" ClientInstanceName="pageControl1" runat="server" ClientVisible="false" Width="98%">

		<TabPages>
			<dx:TabPage Name="StaffAccess" Text="Edit Staff Access" ClientVisible="false">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl1" runat="server" ClientIDMode="Static">

						<table>
							<tr>
								<td style="vertical-align: top; padding:10px; width:800px">
									


						<dx:ASPxLabel ID="lblClickToEdit" ClientInstanceName="lblClickToEdit" runat="server" Text="Click 'Select' to edit the staff member." Font-Size="Medium" ForeColor="Silver" Font-Italic="true" />
						<dx:ASPxGridView ID="gridStaffList" ClientInstanceName="gridStaffList" runat="server" DataSourceID="Sql_LabStaff_INFO" KeyFieldName="staffID" 
							  OnCustomCallback="gridStaffList_OnCustomCallback"
							 EnableCallBacks="false"
							OnSelectionChanged="gridStaffList_OnSelectionChanged" SettingsBehavior-ProcessSelectionChangedOnServer="true">
							<%--<ClientSideEvents  SelectionChanged="StaffSelected"  />--%>
							<Settings ShowFilterRow="true" ShowFilterBar="Visible" ShowFilterRowMenu="true"   />
							<SettingsBehavior FilterRowMode="OnClick" AllowSelectSingleRowOnly="true" />
							<Columns>
								<dx:GridViewDataColumn FieldName="staffID" ReadOnly="true" Visible="true" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="staffname" Caption="Staff Name" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="dbrole" Caption="DB Role" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="nunq_otherlabs" Caption="# of Other Labs" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="otherlabs" Caption="Other Labs" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="mismatch_dbrole" Caption="Mismatch in roles across labs" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewCommandColumn ShowClearFilterButton="true" ShowApplyFilterButton="true" ShowSelectButton="true" ></dx:GridViewCommandColumn>
							</Columns>
						</dx:ASPxGridView>
						
						<br />
						<dx:ASPxLabel ID="lblStaffEditing" ClientInstanceName="lblStaffEditing" runat="server" Font-Bold="true" Font-Size="Medium" Width="480px"></dx:ASPxLabel>
	
						<dx:ASPxButton ID="btnCancelStaffEdit" ClientInstanceName="btnCancelStaffEdit" runat="server" Text="Cancel Editing" Visible="false"
							 OnClick="btnCancelStaffEdit_OnClick">
						</dx:ASPxButton>

						<br />
						<dx:ASPxLabel ID="lblInstructions" runat="server" Text="Click in the Role to edit. Then click 'Save Changes' below the table." Font-Size="Small" Font-Italic="true"></dx:ASPxLabel>						<br />
						<dx:ASPxGridView ID="gridEditStaff" ClientInstanceName="gridEditStaff" runat="server" ClientVisible="false" ClientIDMode="Static" 
							KeyFieldName="labgroup_staffID" SettingsDataSecurity-AllowEdit="true"  Settings-ShowGroupPanel="true" Settings-ShowGroupedColumns="true" Settings-ShowGroupButtons="true"
							OnBatchUpdate="gridEditStaff_BatchUpdate"
							OnCellEditorInitialize="gridEditStaff_OnCellEditorInitialize" OnDataBinding="gridEditStaff_OnDataBinding"
							OnHtmlDataCellPrepared="gridEditStaff_OnHtmlDataCellPrepared" OnCustomCallback="gridEditStaff_OnCustomCallback" >
							<SettingsBehavior  AllowGroup="true" AutoExpandAllGroups="true" AllowFixedGroups="true" />
							<SettingsEditing Mode="Batch" BatchEditSettings-StartEditAction="Click" BatchEditSettings-EditMode="Cell" ></SettingsEditing>
							<SettingsPager PageSize="20"></SettingsPager>
							<Columns>
								<dx:GridViewDataColumn FieldName="labgroup_staffID" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="staffID" ReadOnly="true" Visible="false" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="labgroupID" ReadOnly="true" Visible="true" CellStyle-ForeColor="Silver"  Settings-ShowEditorInBatchEditMode="false"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="studyname" Caption="Study" ReadOnly="true"  Settings-ShowEditorInBatchEditMode="false" GroupIndex="1"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="groupname" Caption="Group" ReadOnly="true" Settings-ShowEditorInBatchEditMode="false"></dx:GridViewDataColumn>
								 
								
								<dx:GridViewDataComboBoxColumn FieldName="dbroleID" Caption="Role" Width="150px" Settings-ShowEditorInBatchEditMode="true" GroupIndex="0"
										   >
									
										<PropertiesComboBox TextField="dbrole" ValueField="dbroleID" ValueType="System.Int32" DataSourceID='Sql_DBroles' 
											   >
										</PropertiesComboBox>
								</dx:GridViewDataComboBoxColumn>
							</Columns>
						</dx:ASPxGridView>


								</td>
							</tr>
						</table>

					


						</dx:ContentControl>
					</ContentCollection>
				</dx:TabPage>
			<dx:TabPage Name="CreateAddStaff" Text="Create and Add Staff" ClientVisible="false">
				<ContentCollection>
					<dx:ContentControl>

						<table >
							<tr>

								<td style="padding: 30px; vertical-align: top">
									<b>Step 1.</b> Go to the UW Groups page to make sure this person has been added to your lab (using their UW NETID).  This step allows them to log in to the DB.<br />
									
									<br /><br />
									<dx:ASPxButton ID="btnUWGroups" ClientInstanceName="btnUWGroups" runat="server" Text="Step 1. Add to your lab in UW Groups" TabIndex="99"
										Visible="true" AutoPostBack="false" >
										<ClientSideEvents Click="function(s,e){{ window.open('https://groups.uw.edu/search/?mygroups'); }}" />
									</dx:ASPxButton>

					 
									
								</td>
								<td style="padding: 30px; vertical-align: top">
									<b>Step 2.</b> Check to see if this person has been added to the "Staff" table in the DB.  Try to find them in the drop down control in step 3.  Search by typing in the drop down control.  
									<br /><br />If they aren't in the list, then create a new staff member using the button below and return here for step 3. 
									<br /><br />
									<dx:ASPxButton ID="btnCreateNewStaff" ClientInstanceName="btnCreateNewStaff" runat="server" Text="Step 2. Create New Staff Member" TabIndex="99"
										Visible="true" AutoPostBack="false" >
										<ClientSideEvents Click="function(s,e){{ window.open('Staff.aspx?mode=new'); }}" />
									</dx:ASPxButton>
								</td>
								<td style="padding: 30px; vertical-align: top">
									<b>Step 3.</b> Add this new staff member to the lab.  Select the person, studies, and role.  Once added, you can then edit the specific groups & roles further on the 'Edit Staff Access' tab.
									<br /><br />
									<dx:ASPxComboBox ID="cboStaffNotInLab" ClientInstanceName="cboStaffNotInLab" runat="server" DataSourceID="Sql_StaffNotInLab" AutoPostBack="false" 
											Caption="Select staff:" CaptionStyle-ForeColor="Silver"
											 Width="220px" OnSelectedIndexChanged="cboStaffNotInLab_OnSelectedIndexChanged"
											TextField="staffname" ValueField="staffID" NullText="--Select Staff Member to Add--" ></dx:ASPxComboBox>
									<br /><br />
									<dx:ASPxGridLookup ID="gridStudies" ClientInstanceName="gridStudies" runat="server"
										Caption="Select studies:" CaptionStyle-ForeColor="Silver"
										DataSourceID="Sql_Studies" NullText="--Select Studies--" ClientVisible="false" AutoPostBack="false"
											SelectionMode="Multiple" KeyFieldName="studyID" TextFormatString="{1}">
										<GridViewProperties>
											<SettingsPager PageSize="15"></SettingsPager>
										</GridViewProperties>
										<Columns>
											<dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="AllPages" />
											<dx:GridViewDataColumn FieldName="studyID" CellStyle-ForeColor="Silver"  ></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="studyname" ></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="isActive" ></dx:GridViewDataColumn>

										</Columns>

									</dx:ASPxGridLookup>
									<br /><br />
									<dx:ASPxComboBox ID="cboNewdbroleID" ClientInstanceName="cboNewdbroleID" runat="server" DataSourceID="Sql_DBroles" AutoPostBack="true" 
											Caption="Select role:" CaptionStyle-ForeColor="Silver"
											 Width="220px" OnSelectedIndexChanged="cboStaffNotInLab_OnSelectedIndexChanged"
											TextField="dbrole" ValueField="dbroleID" NullText="--Select DB Role--" ></dx:ASPxComboBox>
									

									<br />
									<dx:ASPxButton ID="btnAddStaff" ClientInstanceName="btnAddStaff" runat="server" Text="Add Staff Member"
									   OnClick="btnAddStaff_OnClick" Visible="false" ></dx:ASPxButton>
									<br /><br />
									<dx:ASPxLabel ID="lblSelectStudies_warning" ClientInstanceName="lblSelectStudies_warning" runat="server" Text="Select some studies to add this staff member to!"
										 ForeColor="Red" Visible="false"></dx:ASPxLabel>


								</td>

							</tr>
						</table>


					</dx:ContentControl>
				</ContentCollection>
				</dx:TabPage>

			<dx:TabPage Text="Staff by Study Grid">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl2" runat="server">

						<table>
							<tr>
								<td style="padding:10px; vertical-align:top">

								</td>
								<td style="padding:10px; vertical-align:top">
									<dx:ASPxButton ID="btnLoadStaff" ClientInstanceName="btnLoadStaff" runat="server" Text="Load Staff Grid" Visible="true" OnClick="btnLoadStaff_OnClick"></dx:ASPxButton>
								</td>
							</tr>
						</table>

						<br/><br/>
							<dx:ASPxPivotGrid ID="pivotStaff" ClientInstanceName="pivotStaff" runat="server" Visible="false"  Width="95%" Height="700px"
							 OptionsView-ShowFilterHeaders="false"
								OptionsView-HorizontalScrollBarMode="Auto" OptionsView-VerticalScrollBarMode="Auto">
								<OptionsView ShowColumnGrandTotals="false" ShowColumnTotals="false" ShowRowGrandTotals="false" ShowRowTotals="false" />
								<Fields>
									<dx:PivotGridField FieldName="DBrole" ID="fDBrole" Caption="DB role"  Area="RowArea" Options-ShowTotals="false" Options-ShowGrandTotal="false"  />
									<dx:PivotGridField FieldName="StaffName" ID="fStaffName" Caption="Staff"  Area="RowArea" Options-ShowTotals="false" Options-ShowGrandTotal="false"  />
									<dx:PivotGridField FieldName="StudyName" ID="fStudyName" Caption="Study"  Area="ColumnArea"  Options-ShowTotals="false" Options-ShowGrandTotal="false"  />
									<dx:PivotGridField FieldName="allowed_groups" ID="fallowed_groups" Caption="Allow Groups"  Area="DataArea" SummaryType="Max" Options-ShowGrandTotal="false"  />
								</Fields>
								<OptionsView HorizontalScrollBarMode="Visible" VerticalScrollBarMode="Visible" />
								<OptionsPager   RowsPerPage="50" Position="Bottom"  >
									<PageSizeItemSettings Visible="true" ShowAllItem="true" Items="20,50,200"></PageSizeItemSettings>
								</OptionsPager>
							</dx:ASPxPivotGrid>

						</dx:ContentControl>
					</ContentCollection>
				</dx:TabPage>

			<dx:TabPage Name="LabAccess" Text="Edit Lab Access" ClientVisible="false">
				<ContentCollection>
					<dx:ContentControl>
						<dx:ASPxGridView ID="gridLabEditing" ClientInstanceName="gridLabEditing" runat="server" DataSourceID="Sql_Study_with_Groups" KeyFieldName="studyID"
							  OnDataBound="gridLabEditing_DataBound" OnCustomButtonInitialize="gridLabEditing_OnCustomButtonInitialize"
							OnCustomButtonCallback="gridLabEditing_CustomButtonCallback"   >
							<Columns>
								<dx:GridViewDataColumn FieldName="studyID" ReadOnly="true" Visible="true" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="isActive" Caption="Active?" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="studyname" Caption="Study" ReadOnly="true" CellStyle-Font-Bold="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="hasparentstudy" Caption="Has Parent Study?" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="parentstudyname" Caption="Parent Study" ReadOnly="true"></dx:GridViewDataColumn>
								
							</Columns>
						</dx:ASPxGridView>
					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>


			
			<%--	<dx:TabPage Text="Lab by Study Grid">
							<ContentCollection>
								<dx:ContentControl ID="ContentControl3" runat="server">

									<br/><br/>
										<dx:ASPxPivotGrid ID="pivotLabStudy" ClientInstanceName="pivotLabStudy" runat="server" DataSourceID="Sql_LabStudy" Visible="true" 
										 OptionsView-ShowFilterHeaders="false" 
											OptionsView-HorizontalScrollBarMode="Auto" OptionsView-VerticalScrollBarMode="Auto">
											<OptionsView ShowColumnGrandTotals="false" ShowColumnTotals="false" ShowRowGrandTotals="false" ShowRowTotals="false" />
											<Fields>
												<dx:PivotGridField FieldName="labname" ID="flabname" Caption="Lab"  Area="RowArea" Options-ShowTotals="false" Options-ShowGrandTotal="false"  />
												<dx:PivotGridField FieldName="studyName" ID="fStudyName" Caption="Study"  Area="ColumnArea"  Options-ShowTotals="false" Options-ShowGrandTotal="false"  />
												<dx:PivotGridField FieldName="labID" ID="flabID" Caption="LabID"  Area="DataArea" SummaryType="Max" Options-ShowGrandTotal="false"  />
											</Fields>
											<OptionsPager   RowsPerPage="50" Position="Bottom" >
											<PageSizeItemSettings Visible="true" ShowAllItem="true" Items="20,50,200"></PageSizeItemSettings>
										</OptionsPager>
										</dx:ASPxPivotGrid>

									</dx:ContentControl>
								</ContentCollection>
							</dx:TabPage>
				--%>
						</TabPages>
				</dx:ASPxPageControl>




	<asp:SqlDataSource ID="Sql_Labs" runat="server" SelectCommandType="Text"  
	SelectCommand="select labID, LabName from tblLab where labID in (select * from dbo.fnSEC_Allowed_MANAGEACCOUNTS_Labs_by_User())  or 
		(select dbo.fnGetStaffIDByCurrentUser()) in (8, 722) group by labID, LabName order by labname"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    

	<asp:SqlDataSource ID="Sql_Studies" runat="server" SelectCommandType="Text"  
	SelectCommand="select studyID, studyname, studyfullname, b.fullstudyname as parentstudyname
		, (case when active = 1 then 'Yes' when active=2 then 'No' end) as isActive 
		from tblStudy a
		left join tblFullStudy b ON a.fullstudyID = b.fullstudyID where active in (1,2) and studyID in 
		 (select studyID from tblgroup where groupID in 
		( select groupID from tbllabgroup where labID=@labID and labgroup_enabled=1)) order by isActive desc, studyname"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
		 <SelectParameters>
			 <asp:ControlParameter ControlID="cboLab" Name="labID" PropertyName="Value" />
		 </SelectParameters>
   </asp:SqlDataSource>    


		<asp:SqlDataSource ID="Sql_LabGroups" runat="server" SelectCommandType="Text"  
	SelectCommand="select a.studyID, studyname, studyfullname, (case when active = 1 then 'Yes' when active=2 then 'No' end) as isActive, c.labgroup_enabled 
		, c.groupID, b.groupname, labgroupID
			from tblStudy a JOIN tblGroup b ON a.studyID=b.studyID 
		  LEFT JOIN (select * from tblLabGroup where labID=@labID ) c ON b.groupID = c.groupID
			order by isActive desc, studyname, groupname"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
		 <SelectParameters>
			 <asp:ControlParameter ControlID="cboLab" Name="labID" PropertyName="Value" />
		 </SelectParameters>
   </asp:SqlDataSource>    


		<asp:SqlDataSource ID="Sql_Study_with_Groups" runat="server" SelectCommandType="Text"  
	SelectCommand="select a.studyID, studyname, studyfullname
			, (case when b.fullstudyname is not null then 'Yes' else 'No' end) as hasparentstudy
			, b.fullstudyname as parentstudyname
			, (case when active = 1 then 'Yes' when active=2 then 'No' end) as isActive
			, dbo.fnCSV_GetGroupNameIDs_by_Study(studyID) abbrids
			, dbo.fnCSV_GetGroupNameIDs_by_StudyAndLab(studyID, @labID) lab_abbrids 
			from tblStudy a  
			left join tblFullStudy b ON a.fullstudyID = b.fullstudyID 
			order by isActive desc, studyname"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
		 <SelectParameters>
			 <asp:ControlParameter ControlID="cboLab" Name="labID" PropertyName="Value" />
		 </SelectParameters>
   </asp:SqlDataSource>    

	

	<asp:SqlDataSource ID="Sql_LabStaff_INFO" runat="server" SelectCommandType="Text"  
	SelectCommand="exec  trk.spINFO_LabStaff @labID"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
		 <SelectParameters>
			 <asp:ControlParameter ControlID="cboLab" Name="labID" PropertyName="Value" />
		 </SelectParameters>  
	</asp:SqlDataSource>  
	

	<asp:SqlDataSource ID="Sql_LabStudy" runat="server" SelectCommandType="Text"  
	SelectCommand="exec  trk.spINFO_LabStudy "  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
	</asp:SqlDataSource>  
	


	<asp:SqlDataSource ID="Sql_StaffInLab" runat="server" SelectCommandType="Text"  
	SelectCommand="select staffID, firstname + ' ' + lastname as staffname, active 
		, (case when active=1 then 'Yes' else 'No' end) isactive
		from tblstaff where active >= 0 and staffID in (select staffID from tblLabGroup_staff where labgroupID in (select labgroupID from tblLabGroup where labID=@labID)) order by 2"  
	
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
		 <SelectParameters>
			 <asp:ControlParameter ControlID="cboLab" Name="labID" PropertyName="Value" />
		 </SelectParameters>  
	</asp:SqlDataSource>  



	
	<asp:SqlDataSource ID="Sql_StaffNotInLab" runat="server" SelectCommandType="Text"  
	SelectCommand="select staffID, firstname + ' ' + lastname + ' (' + actdirID + ')' as staffname from tblstaff where active >= 0 and actdirID is not null and staffID not in (select staffID from tblLabGroup_staff where labgroupID in (select labgroupID from tblLabGroup where labID=@labID)) order by 2"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
		 <SelectParameters>
			 <asp:ControlParameter ControlID="cboLab" Name="labID" PropertyName="Value" />
		 </SelectParameters>
	</asp:SqlDataSource>  

	<asp:SqlDataSource ID="Sql_DBroles" runat="server" 
	SelectCommandType="Text"  SelectCommand="select dbroleID, dbrole, htmlcolor from tblDBrole_lkup"   
	ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    



</asp:Content>

