<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="LabGroups.aspx.cs" Inherits="Admin_LabGroups" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 



<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableViewState="true"></asp:ScriptManager>

		<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Staff Assignments" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>




	<br />
	<br />
	<table>
		<tr>
			<td style="padding:10px; vertical-align:top">
				<dx:ASPxComboBox ID="cboLab" ClientInstanceName="cboLab" runat="server" DataSourceID="Sql_Labs" AutoPostBack="true" 
					TextField="LabName" ValueField="labID" NullText="--Select Lab--"  OnSelectedIndexChanged="cboLab_OnSelectedIndexChanged"></dx:ASPxComboBox>

			</td>
			<td style="padding:10px; vertical-align:top">
				<dx:ASPxGridLookup ID="gridStudies" ClientInstanceName="gridStudies" runat="server" DataSourceID="Sql_Studies" NullText="--Select Studies--" Visible="false"
					 SelectionMode="Multiple" KeyFieldName="studyID" TextFormatString="{1}">
					<GridViewProperties>
						<SettingsPager PageSize="50"></SettingsPager>
					</GridViewProperties>
					<Columns>
						<dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="AllPages" />
						<dx:GridViewDataColumn FieldName="studyID" CellStyle-ForeColor="Silver"  ></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="studyname" ></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="isActive" ></dx:GridViewDataColumn>

					</Columns>

				</dx:ASPxGridLookup>

			</td>
			<td style="padding:10px; vertical-align:top">
				<dx:ASPxButton ID="btnLoadStaff" ClientInstanceName="btnLoadStaff" runat="server" Text="Load Staff" Visible="false" OnClick="btnLoadStaff_OnClick"></dx:ASPxButton>
				</td>
		</tr>
	</table>

	<br />

	<dx:ASPxPageControl ID="pageControl1" ClientInstanceName="pageControl1" runat="server" Visible="false" Width="98%">

		<TabPages>
			<dx:TabPage Text="Edit Staff">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl1" runat="server">

						<table>
							<tr>
								<td style="vertical-align: top; padding:10px">
									<dx:ASPxComboBox ID="cboStaffInLab" ClientInstanceName="cboStaffInLab" runat="server" DataSourceID="Sql_StaffInLab" AutoPostBack="true" 
											Caption="Edit Staff Member:" CaptionSettings-Position="Top" OnSelectedIndexChanged="cboStaffInLab_OnSelectedIndexChanged"
											TextField="staffname" ValueField="staffID" NullText="--Select Lab Staff--"  ></dx:ASPxComboBox>

								</td>
								<td style="vertical-align: top; padding:10px">
									<dx:ASPxComboBox ID="cboStaffNotInLab" ClientInstanceName="cboStaffNotInLab" runat="server" DataSourceID="Sql_StaffNotInLab" AutoPostBack="true" 
											Caption="Add Staff Member to the Lab:" CaptionSettings-Position="Top" Width="220px" OnSelectedIndexChanged="cboStaffNotInLab_OnSelectedIndexChanged"
											TextField="staffname" ValueField="staffID" NullText="--Select Staff Member to Add--" ></dx:ASPxComboBox>

								</td>
							</tr>
						</table>

 <%--                       OnBatchUpdate="gridStaffGroup_BatchUpdate"--%>

						<%--ReadOnly="true" Visible="false"--%>
						<br /><br />
						<dx:ASPxLabel ID="lblStaffEditing" ClientInstanceName="lblStaffEditing" runat="server" Font-Bold="true"></dx:ASPxLabel>
						<br />
						<dx:ASPxGridView ID="gridEditStaff" ClientInstanceName="gridEditStaff" runat="server" Visible="false" 
							KeyFieldName="labgroup_staffID" SettingsDataSecurity-AllowEdit="true"  OnBatchUpdate="gridEditStaff_BatchUpdate"
							 OnCellEditorInitialize="gridEditStaff_OnCellEditorInitialize" OnDataBinding="gridEditStaff_OnDataBinding">
							<SettingsEditing Mode="Batch" BatchEditSettings-StartEditAction="Click" BatchEditSettings-EditMode="Cell" >
							</SettingsEditing>
							<SettingsPager PageSize="50"></SettingsPager>
							<Columns>
								<dx:GridViewDataColumn FieldName="staffID" ReadOnly="true" Visible="true" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="labgroupID" ReadOnly="true" Visible="true" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="studyname" Caption="Study" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="groupname" Caption="Group" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="dbrole" Caption="dbrole" ReadOnly="true"></dx:GridViewDataColumn>
								
								<dx:GridViewDataComboBoxColumn FieldName="dbroleID" Caption="Role" Width="150px" Settings-ShowEditorInBatchEditMode="true"  >
										<PropertiesComboBox TextField="dbrole" ValueField="dbroleID" ValueType="System.Int32" DataSourceID='Sql_DBroles'  >
										</PropertiesComboBox>
								</dx:GridViewDataComboBoxColumn>
								<dx:GridViewDataColumn FieldName="labgroup_staffID" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>
							</Columns>
						</dx:ASPxGridView>



						</dx:ContentControl>
					</ContentCollection>
				</dx:TabPage>

			<dx:TabPage Text="Staff by Study Grid">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl2" runat="server">
							<dx:ASPxPivotGrid ID="pivotStaff" ClientInstanceName="pivotStaff" runat="server" Visible="true" 
							 OptionsView-ShowFilterHeaders="false"
								OptionsView-HorizontalScrollBarMode="Auto" OptionsView-VerticalScrollBarMode="Auto">
								<Fields>
									<dx:PivotGridField FieldName="StaffName" ID="fStaffName" Caption="Staff"  Area="RowArea" Options-ShowTotals="false" Options-ShowGrandTotal="false"  />
									<dx:PivotGridField FieldName="StudyName" ID="fStudyName" Caption="Study"  Area="ColumnArea"  Options-ShowTotals="false" Options-ShowGrandTotal="false"  />
									<dx:PivotGridField FieldName="allowed_groups" ID="fallowed_groups" Caption="Allow Groups"  Area="DataArea" SummaryType="Max" Options-ShowGrandTotal="false"  />
								</Fields>
								<OptionsPager   RowsPerPage="50" Position="Bottom" >
								<PageSizeItemSettings Visible="true" ShowAllItem="true" Items="20,50,200"></PageSizeItemSettings>
							</OptionsPager>
							</dx:ASPxPivotGrid>

						</dx:ContentControl>
					</ContentCollection>
				</dx:TabPage>
			</TabPages>
	</dx:ASPxPageControl>




	<asp:SqlDataSource ID="Sql_Labs" runat="server" SelectCommandType="Text"  
	SelectCommand="select labID, LabName from tblLab where labID in (select * from dbo.fnSEC_Allowed_MANAGEACCOUNTS_Labs_by_User())  or 
		(select dbo.fnGetStaffIDByCurrentUser()) in (8, 722) group by labID, LabName order by labname"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    

	<asp:SqlDataSource ID="Sql_Studies" runat="server" SelectCommandType="Text"  
	SelectCommand="select studyID, studyname, studyfullname, (case when active = 1 then 'Yes' when active=2 then 'No' end) as isActive 
		from tblStudy where active in (1,2) and studyID in 
		 (select studyID from tblgroup where groupID in 
		( select groupID from tbllabgroup where labID=@labID and labgroup_enabled=1)) order by isActive desc, studyname"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
		 <SelectParameters>
			 <asp:ControlParameter ControlID="cboLab" Name="labID" PropertyName="Value" />
		 </SelectParameters>
   </asp:SqlDataSource>    


<%--    UpdateCommand="update tblLabGroup_staff set dbroleID=@dbroleID where labgroup_staffID=@labgroup_staffID"--%>
	<asp:SqlDataSource ID="Sql_StaffInLab" runat="server" SelectCommandType="Text"  
	SelectCommand="select staffID, firstname + ' ' + lastname as staffname from tblstaff where active >= 0 and staffID in (select staffID from tblLabGroup_staff where labgroupID in (select labgroupID from tblLabGroup where labID=@labID)) order by 2"  
	
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
		 <SelectParameters>
			 <asp:ControlParameter ControlID="cboLab" Name="labID" PropertyName="Value" />
		 </SelectParameters>  
<%--		<UpdateParameters>
			<asp:Parameter Name="labgroup_staffID" DbType="Int32" />
			<asp:Parameter Name="dbroleID" DbType="Int32" />
		</UpdateParameters>--%>
	</asp:SqlDataSource>  
	
	<asp:SqlDataSource ID="Sql_StaffNotInLab" runat="server" SelectCommandType="Text"  
	SelectCommand="select staffID, firstname + ' ' + lastname as staffname from tblstaff where active >= 0 and staffID not in (select staffID from tblLabGroup_staff where labgroupID in (select labgroupID from tblLabGroup where labID=@labID)) order by 2"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
		 <SelectParameters>
			 <asp:ControlParameter ControlID="cboLab" Name="labID" PropertyName="Value" />
		 </SelectParameters>
	</asp:SqlDataSource>  

	<asp:SqlDataSource ID="Sql_DBroles" runat="server" 
	SelectCommandType="Text"  SelectCommand="select dbroleID, dbrole from tblDBrole_lkup"   
	ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    



</asp:Content>

