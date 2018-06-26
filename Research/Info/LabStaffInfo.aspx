<%@ Page Language="c#" Debug="true"  MasterPageFile="~/UWAC.master" CodeFile="LabStaffInfo.aspx.cs" AutoEventWireup="True"
Inherits="Info_LabStaffinfo" Title="LabStaff Info"   %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<br/>
 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td></td></tr>
 </table>


<br/>
	<asp:Panel ID="Panel_Legend" runat="server">
		<asp:Label ID="Label6" runat="server" Text="DB roles:" Width ="112px" Font-Bold="true" ></asp:Label><br />
		<asp:Button ID="btnShowLegendTable" runat="server" OnClick="btnShowLegendTable_Click" Text = "Show Role Details" Width="115px"  Font-Size="X-Small" />

	</asp:Panel>
		<asp:Panel ID="Panel_LegendTable" runat="server" Visible="false">
		
	</asp:Panel>
<br/><br/>
<table border = "0" width="100%" cellspacing="0" class="tblinputsmall_white" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="1" id="tdTitle" runat="server"><b>Staff Permissions by Lab</b></td>
	</tr>

<tr><td></td></tr>
<tr>
<td>
	<asp:Label ID="Label1" runat="server" Text="Lab:"></asp:Label>
		<asp:DropDownList ID="DDL_SelectLabID" runat="server" DataSourceID="Sql_Labs" 
			 DataTextField="LabName" DataValueField="labID" Width="200px" OnSelectedIndexChanged="DDL_SelectLabID_SelectedIndexChanged"  AutoPostBack="true" >
		</asp:DropDownList>
		
		<asp:DropDownList ID="DDL_StudyActive" runat="Server"   OnSelectedIndexChanged="DDL_StudyActive_SelectedIndexChanged"  AutoPostBack="true" >
				<asp:ListItem Text="View my studies" Value="0" Selected="True"></asp:ListItem>
				<asp:ListItem Text="View active studies" Value="1" ></asp:ListItem>
				<asp:ListItem Text="View completed studies" Value="2"></asp:ListItem>
				<asp:ListItem Text="View all studies" Value="3"></asp:ListItem>
					</asp:DropDownList>
		
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<asp:Button ID="btnShow_AddNew" runat="server" Text="Add Staff to this Lab" Font-Size="Smaller" OnClick="Show_AddNewStaff" Visible="false"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<asp:Button ID="btnShow_AddLabGroups" runat="server" Text="Add Study/Groups to this Lab" Font-Size="Smaller" OnClick="Show_AddNewLabGroups" Visible="false"/>


	
	<asp:Panel ID="Panel_AddNewLabGroups" runat="server" Visible="false">
			<br/>
			<asp:Label ID="Label2" runat="server" Text="x:"></asp:Label>
				<asp:DropDownList ID="DDL_GroupID" runat="server" DataSourceID="" 
					 DataTextField="study_group" DataValueField="groupID" Width="200px" OnSelectedIndexChanged="DDL_GroupID_SelectedIndexChanged"  AutoPostBack="true" >
				</asp:DropDownList>
 

			<asp:Button ID="btn_AddGroupToLab" runat="server" Font-Size="X-Small" Text="Add this group to this lab" OnClick="cmd_AddGroupToLab"  Visible="false"/>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="Button12" runat="server" Font-Size="X-Small" Text="Cancel" OnClick="cmd_Cancel" Visible="false"/>

	</asp:Panel>
	


	<asp:Panel ID="Panel_AddNewStaff" runat="server" Visible="false">
			<br/>
			<asp:Label ID="Label3" runat="server" Text="Existing Staff:"></asp:Label>
				<asp:DropDownList ID="DDL_SelectStaffID" runat="server" DataSourceID="Sql_StaffList" 
					 DataTextField="StaffName" DataValueField="staffID" Width="200px" OnSelectedIndexChanged="DDL_SelectStaffID_SelectedIndexChanged"  AutoPostBack="true" >
				</asp:DropDownList>
 

			<asp:Button ID="Button1" runat="server" Font-Size="X-Small" Text="Add this staff member to this lab" OnClick="cmd_AddExistingStaff"  Visible="false"/>
		
 
		<asp:Button ID="Button2" runat="server" Font-Size="X-Small" Text="Create New Staff Member" OnClick="cmd_CreateNewStaff" Visible="true"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="Button3" runat="server" Font-Size="X-Small" Text="Cancel" OnClick="cmd_Cancel" Visible="false"/>

	</asp:Panel>
		
		<br />
	<asp:Panel ID="Panel_CreateNewStaff" runat="server" Visible="false">
	<br/><asp:Label ID="Label4" runat="server" Text="Create new staff member:" Font-Bold="true"></asp:Label>
	<br/>       
	
	

	  

<table id="tbl_insertfields" runat="server">
<tr>
<td style="vertical-align:top">	
	
	<table>
	<tr><td><asp:Label ID="lblnewstaff_fname" runat="server" Text="First Name: "  Width="100px"></asp:Label><asp:TextBox ID="firstname" runat="server"></asp:TextBox> </td></tr>
	<tr><td><asp:Label ID="lblnewstaff_lname" runat="server" Text="Last Name: " Width="100px"></asp:Label><asp:TextBox ID="lastname" runat="server"></asp:TextBox></td></tr>
	<tr><td><asp:Label ID="lblnewstaff_actdirID" runat="server" Text="Account Name: " Width="100px"></asp:Label><asp:TextBox ID="actdirID" runat="server"></asp:TextBox></td></tr>
	<tr><td><asp:Label ID="lblnewstaff_email" runat="server" Text="Email address: " Width="100px"></asp:Label><asp:TextBox ID="email" runat="server"></asp:TextBox></td></tr>
	<tr><td>
	  <asp:Label ID="lblnewstaff_stafftype" runat="server" Text="Staff type: " Width="100px"></asp:Label>
				<asp:DropDownList ID="DDL_stafftype" runat="server" DataSourceID="Sql_Stafftype" 
					 DataTextField="stafftype" DataValueField="stafftypeID" Width="100px"   AutoPostBack="true" ></asp:DropDownList></td>
		</tr>
</table>
</td>
<td  style="vertical-align:top">
<table>
	<tr><td><asp:Label ID="lblnewstaff_phonework" runat="server" Text="Phone - work: "  Width="100px"></asp:Label><asp:TextBox ID="phone_work" runat="server"></asp:TextBox></td>   </tr>    
	<tr><td><asp:Label ID="lblnewstaff_phonehome" runat="server" Text="Phone - home: "  Width="100px"></asp:Label><asp:TextBox ID="phone_home" runat="server"></asp:TextBox></td>   </tr>
	<tr><td><asp:Label ID="lblnewstaff_phoneother" runat="server" Text="Phone - other: "  Width="100px"></asp:Label><asp:TextBox ID="phone_other" runat="server"></asp:TextBox></td> </tr>
	<tr><td>  <asp:Label ID="lblnewstaff_office" runat="server" Text="Office location: "  Width="100px"></asp:Label><asp:TextBox ID="officelocation" runat="server"></asp:TextBox></td>   </tr>
	</table>
	</td>
	</tr>
	<tr><td id="tblError_Insert" runat="server"></td></tr>
	</table>
	
		<br/>
			   <asp:Button ID="Button5" runat="server" Font-Size="X-Small" Text="Insert new staff" OnClick="cmdnewstaff_Insert"/>
				 <asp:Button ID="Button4" runat="server" Font-Size="X-Small" Text="Cancel" OnClick="cmdnewstaff_Cancel"/>
<br/>
	</asp:Panel>

<br/>
	</td>
</tr>
</table>


	<asp:Panel ID="Panel1" runat="server" Visible="true">
		
	</asp:Panel>


<br/>


	
	<br />
<%--	<asp:GridView ID="Gridview_LabGroup_Staff" runat="server" DataSourceID="Sql_LabGroup_staff" Visible="true" OnRowCommand="Gridview_LabGroup_Staff_RowCommandPAGE"
	  OnRowDataBound="Gridview_LabGroup_Staff_OnRowDataBoundPAGE" >
	<Columns>
	<asp:TemplateField>
		<ItemTemplate>
			<asp:LinkButton ID="btnEditStaff" runat="server" Text="Edit" 
			  CommandArgument= '<%#Eval("staffID") %>' CommandName="rowcmd_Edit_StaffDetails"  OnClick="Edit_StaffDetails"   />
		</ItemTemplate>
	</asp:TemplateField>
	</Columns>
	</asp:GridView>--%>

	<asp:GridView ID="Gridview_LabGroup_Staff2" runat="server"  Visible="true" OnRowCommand="Gridview_LabGroup_Staff_RowCommandPAGE"
	  OnRowDataBound="Gridview_LabGroup_Staff_OnRowDataBoundPAGE" >
	<Columns>
	<asp:TemplateField>
		<ItemTemplate>
			<asp:LinkButton ID="btnEditStaff" runat="server" Text="Edit" 
			  CommandArgument= '<%#Eval("staffID") %>' CommandName="rowcmd_Edit_StaffDetails"  OnClick="Edit_StaffDetails"   />
		</ItemTemplate>
	</asp:TemplateField>
	</Columns>
	</asp:GridView>


	<asp:Label ID="lblCurrentStaffID" runat="server" Text="0" Visible="false"></asp:Label>




<br/>
<br/>


 <asp:Panel ID="Panel_MultLabs" runat="server" Visible="true">

<%--<asp:Label ID="Label2" runat="server" Text="The following staff are also in additional labs:"></asp:Label>
	<asp:GridView ID="Gridview_MultLabs"  class="tblInputSmall" runat="server" DataSoureceID="Sql_MultipleLabs" AutoGenerateColumns="true" Visible="true"  width="600px"    >
	<EmptyDataTemplate> <i>NOTE: Staff in this lab are not included in any other labs.</i> </EmptyDataTemplate>
	</asp:GridView>--%>

	</asp:Panel>




	<table>
	<tr>
		<td style="vertical-align:top">
			<asp:Panel ID="Panel_EditStaff" runat="server" Visible="false" >
			<br />
			<br />
				<table>
				<tr>
				<td width="150px" style="vertical-align:top">        <asp:Button ID="Button6" runat="server" Text="Add selected" ForeColor="Green" Font-Size="Smaller" OnClick="cmd_Insert" /></td>
				<td width="150px" style="vertical-align:top">        <asp:Button ID="Button8" runat="server" Text="Change selected" ForeColor="Blue" Font-Size="Smaller" OnClick="cmd_Change" /></td>
				<td width="150px" style="vertical-align:top"><asp:Button ID="Button7" runat="server" Text="Remove selected" ForeColor="Red" Font-Size="Smaller" OnClick="cmd_Delete"/>
					</td>
				<td width="150px"><asp:Button ID="Button9" runat="server" Text="Cancel" ForeColor="Black" Font-Size="Smaller" OnClick="cmd_Cancel_StaffEdits"  AutoPostBack="true" /></td>    
				</tr>
				<tr> <td colspan="2"> <asp:Label ID="Label5" runat="server" Text="Add/change using the following role: " ></asp:Label>
					<br/>  <asp:DropDownList ID="DDL_DBrole" runat="server" DataSourceID="Sql_DBroles" 
								DataTextField="DBrole" DataValueField="dbroleID" Width="120px"  AutoPostBack="false"  >       </asp:DropDownList>
				</td><td></td> <td></td></tr>
				</table>

				<br/>
			<br />

		<asp:GridView ID="Gridview_EditStaff" runat="server"  AutoGenerateColumns="false"  OnRowDataBound="Gridview_EditStaff_OnDataBound"  >
		  <Columns>
		 <asp:BoundField datafield="StaffName" headertext="StaffName"/>
		 <asp:BoundField datafield="LabName" headertext="LabName"/>
		 <asp:BoundField datafield="StudyName" headertext="StudyName"/>
		 <asp:BoundField datafield="GroupName" headertext="GroupName"/>
		 <asp:BoundField datafield="dbrole" headertext="DB role"/>
		 <asp:TemplateField  HeaderText="Add Access" ItemStyle-HorizontalAlign="Center"> 
			<HeaderTemplate>Add<br/>
			<asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_checkchanged" Width = "50px" />
			</HeaderTemplate>
		 <ItemTemplate>
			<asp:CheckBox ID="chk" runat="server"  OnCheckedChanged="chng_AddStaff" AutoPostBack="false"  /> 
		 </ItemTemplate>
		 </asp:TemplateField>

		 <asp:TemplateField  HeaderText="Change Access" ItemStyle-HorizontalAlign="Center"> 
			<HeaderTemplate>Change<br/>
			<asp:CheckBox ID="chkAll_Change" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_Change_checkchanged" Width = "50px" />
			</HeaderTemplate>
		 <ItemTemplate>
			<asp:CheckBox ID="chkChange" runat="server"  OnCheckedChanged="chng_ChangeStaff" AutoPostBack="false"  /> 
		 </ItemTemplate>
		 </asp:TemplateField>

		 <asp:TemplateField  HeaderText="Remove Access" ItemStyle-HorizontalAlign="Center"> 
			<HeaderTemplate >Remove<br/>
			<asp:CheckBox ID="chkAll_Remove" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_Remove_checkchanged"  Width = "50px" />
			</HeaderTemplate>
		 <ItemTemplate >
			<asp:HiddenField runat="server" ID="hndRowBackColorRemove" Value="" />  
			<asp:CheckBox ID="chkRemove" runat="server"  OnCheckedChanged="chng_RemoveStaff" AutoPostBack="false"  />
		 </ItemTemplate>
		 </asp:TemplateField>

		 <asp:BoundField datafield="StudyID" headertext="StudyID" Visible="false"/>

		 <asp:TemplateField Visible="false">  <ItemTemplate>  <asp:Label ID="lbllabgroupID" runat="server" Text='<%# Eval("labgroupID")%>' ></asp:Label></ItemTemplate>  </asp:TemplateField>
		 <asp:TemplateField Visible="false">  <ItemTemplate>  <asp:Label ID="lbldbroleID" runat="server" Text='<%# Eval("dbroleID")%>' ></asp:Label></ItemTemplate>  </asp:TemplateField>
		 <asp:TemplateField Visible="false">  <ItemTemplate>  <asp:Label ID="lblgroupID" runat="server" Text='<%# Eval("groupID")%>' ></asp:Label></ItemTemplate>  </asp:TemplateField>
		 <asp:TemplateField Visible="false">  <ItemTemplate>  <asp:Label ID="lblstaffID" runat="server" Text='<%# Eval("staffID")%>' ></asp:Label></ItemTemplate>  </asp:TemplateField>

		 <asp:BoundField datafield="LabGroup_staffID" headertext="LabGroup_staffID" Visible="false"/>
			 </Columns>

		</asp:GridView>
			</asp:Panel>
		</td>

		<td style="vertical-align:top">
		<br /><br /><br /><br />
			<asp:Panel ID="Panel_UWAC_ADinfo" runat="server" Visible="false" BackColor="Silver">
			</asp:Panel>

		</td>
	</tr>
	
	</table>
	
	<br /><br />
	<%--<asp:GridView ID="gvNew" runat="server"></asp:GridView>--%>

<%-- OnSelecting="Sql_LabGroup_staff_Selecting"--%> 
<%--		<asp:SqlDataSource ID="Sql_LabGroup_staff" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spSEC_PIVOT__Lab_and_AllStaffInLab_by_Studies"   
			 ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
		<SelectParameters>    
			<asp:ControlParameter ControlID="DDL_SelectLabID" PropertyName="SelectedValue" Name="labID" /> 
			<asp:ControlParameter ControlID="DDL_StudyActive" PropertyName="SelectedValue" Name="studyactive" /> 
			<asp:Parameter Name="single_staffID" DbType="Int16" DefaultValue="0" />
		</SelectParameters>
   </asp:SqlDataSource> --%>


   

<asp:SqlDataSource ID="Sql_Labs" runat="server" SelectCommandType="Text"  
	SelectCommand="EXEC sec.spSetUserContext @netid; select 0 labID, '...select lab...' LabName 
					union select labID, LabName from tblLab where labID in (select * from dbo.fnSEC_Allowed_MANAGEACCOUNTS_Labs_by_User())  or 
		(select dbo.fnGetStaffIDByCurrentUser()) in (8, 722) group by labID, LabName order by labname"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
	<SelectParameters>
		<asp:SessionParameter SessionField="netid" Name="netid" DbType="string" />
	</SelectParameters>
   </asp:SqlDataSource>    

 

<asp:SqlDataSource ID="Sql_StaffList" runat="server" SelectCommandType="Text"  
	SelectCommand="select 0 as staffID, ' ..select staff..' staffname union select staffID, firstname + ' ' + lastname as staffname from tblstaff where active >= 0 order by 2"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    

<%--<asp:SqlDataSource ID="Sql_LabGroup_Staff_details" runat="server" 
	SelectCommandType="StoredProcedure"  SelectCommand="spSEC_LabGroup_Staff_details"   
	ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    --%>



<asp:SqlDataSource ID="Sql_StaffType" runat="server" 
	SelectCommandType="Text"  SelectCommand="select stafftypeID, stafftype from tblStaffType_Lkup order by stafftypeID"   
	ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    


<asp:SqlDataSource ID="Sql_DBroles" runat="server" 
	SelectCommandType="Text"  SelectCommand="select DBroleID, DBrole from tblDBrole_lkup where DBroleID > 0 "   
	ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    




<asp:SqlDataSource ID="Sql_MultipleLabs" runat="server" SelectCommandType="Text"  
	SelectCommand="select StaffName as [___StaffName___], LabName, Studies from vwSEC_Staff_in_MultipleLabs where staffID in (select staffID from vwSEC_Staff_in_MultipleLabs where labID = @labID)
		 AND labID <> @labID order by staffname"   
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   <SelectParameters>     <asp:ControlParameter ControlID="DDL_SelectLabID" PropertyName="SelectedValue" Name="labID" />   </SelectParameters>
   </asp:SqlDataSource>    



<%-- 
<asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spUWAC_ADgroups_by_User"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    

<asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spSEC_GetGroups_CanView_by_User"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    

<asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommandType="Text"  SelectCommand="select * from vwDBroles"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  
   --%>  



<script language="javascript" type="text/javascript">
	var gridViewCtlId = '<%=Gridview_EditStaff.ID%>';
	var gridViewCtl = null;
	var curSelRow = null;

	function SelectRow(Id) {

		// 1) white  #FFFFFF   #99FF99  
		// 2) orange #FFA500   #99FF98  
		// 3) gold   #FFD700   #99FF97  

		var myindex;
		//Store the current color
		for (var i = 0; i < document.getElementById(Id).parentNode.childNodes.length; i++) {
			//alert("this is i = " + i);
			if (document.getElementById(Id).parentNode.childNodes[i].id != null) {

				var controlSplitIds = document.getElementById(Id).parentNode.childNodes[i].id.split('_');

				if (controlSplitIds[controlSplitIds.length - 1] == 'hndRowBackColor') {

					//alert(i + "  " + document.getElementById(Id).parentNode.parentNode.style.backgroundColor);
					document.getElementById(Id).parentNode.childNodes[i].value = document.getElementById(Id).parentNode.parentNode.style.backgroundColor;
					myindex = i;
				}
			}
		}

		//alert("myindex = " + myindex + "   " +  document.getElementById(Id).parentNode.childNodes[myindex].value);

		if (document.getElementById(Id).checked == true) {

			//now checked and was red, return to green
			if (document.getElementById(Id).parentNode.childNodes[myindex].value == '#ff0000') {
				document.getElementById(Id).parentNode.parentNode.style.backgroundColor = '#99ff99';
			}

			//now checked and was white, make green1
			else if (document.getElementById(Id).parentNode.childNodes[myindex].value == '') {
				document.getElementById(Id).parentNode.parentNode.style.backgroundColor = '#99ff99';
			}
		}

		if (document.getElementById(Id).checked == false) {

			//now unchecked and was blue, make red
			if (document.getElementById(Id).parentNode.childNodes[myindex].value == '#6495ed') {
				document.getElementById(Id).parentNode.parentNode.style.backgroundColor = '#ff0000';
			}

			//now unchecked and was white, make green1
			else if (document.getElementById(Id).parentNode.childNodes[myindex].value == '#99ff99') {
				document.getElementById(Id).parentNode.parentNode.style.backgroundColor = '#ffffff';
			}
		}

	}
	

</script>   



</asp:Content>
