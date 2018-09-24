<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="Admin_Staff" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 



<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableViewState="true"></asp:ScriptManager>

	
	
	<br />
	<table>
		<tr>
			<td style="width:300px">
				<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Staff List" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>

			</td>
			<td style="width:250px">

			</td>
			<td style="width:250px">
					

			</td>
			<td>

			</td>
		</tr>
	</table>


	<br />


	<dx:ASPxGridView ID="gridStaffList" ClientInstanceName="gridStaffList" runat="server" DataSourceID="Sql_Staff" KeyFieldName="staffID" 
		SettingsBehavior-AllowSelectByRowClick="true"    Settings-ShowFilterRow="true" Settings-ShowFilterRowMenu="true" 
		 SettingsDataSecurity-AllowInsert="true" SettingsDataSecurity-AllowEdit="true" 
		OnRowInserting="dxgrid_OnRowInserting"  OnRowUpdating="dxgrid_OnRowUpdating"  
		>
		<SettingsEditing EditFormColumnCount="3"></SettingsEditing>
							<Columns>
								<dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true"></dx:GridViewCommandColumn>
								<dx:GridViewDataColumn FieldName="staffID" ReadOnly="true" Visible="true" CellStyle-ForeColor="Silver" 
									EditFormSettings-Visible="false" Settings-AllowAutoFilter="false"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="active" Caption="Active?" EditFormSettings-Visible="false" ></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="firstname" Caption="First Name" ></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="lastname" Caption="Last Name" ></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="actdirID" Caption="UW NETID" CellStyle-Font-Bold="true" ></dx:GridViewDataColumn>
								<dx:GridViewDataComboBoxColumn FieldName="stafftypeID" Caption="Staff Type"  >
									<PropertiesComboBox TextField="stafftype" ValueField="stafftypeID" DataSourceID='Sql_StaffType'  />
								</dx:GridViewDataComboBoxColumn>
								<dx:GridViewDataColumn FieldName="email" Caption="email" ></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="phone_work" Caption="Work phone" ></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="phone_home" Caption="Home phone" ></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="phone_other" Caption="Other phone" ></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="officelocation" Caption="Office" ></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="n_studies" Caption="# studies" ReadOnly="true" EditFormSettings-Visible="false"></dx:GridViewDataColumn>

							</Columns>
						</dx:ASPxGridView>



	<asp:SqlDataSource ID="Sql_Staff" runat="server" SelectCommandType="Text"  
	SelectCommand="select a.staffID, firstname, lastname, staffinits, staffshortname, actdirID, email, phone_work, phone_home, phone_other
				 , officelocation, stafftypeID , active, n_studies
				from tblStaff a
				left join 
					(select staffID, count(distinct(studyID)) n_studies
					from tbllabgroup_staff b1
					join tbllabgroup b2 ON b1.labgroupID = b2.labgroupID
					join tblgroup b3 ON b2.groupID = b3.GroupID
					group by staffID) b ON a.staffID = b.StaffID
				order by firstname, lastname"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
	</asp:SqlDataSource>  
	

	<asp:SqlDataSource ID="Sql_StaffType" runat="server" 
	SelectCommandType="Text"  SelectCommand="select * from tblStaffType_Lkup"   
	ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    


	<asp:SqlDataSource ID="Sql_DBroles" runat="server" 
	SelectCommandType="Text"  SelectCommand="select dbroleID, dbrole, htmlcolor from tblDBrole_lkup"   
	ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    



</asp:Content>

