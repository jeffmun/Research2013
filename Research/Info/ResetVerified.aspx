﻿<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="ResetVerified.aspx.cs"
 Inherits="Info_ResetVerified"  Title="Reset data entry form" EnableEventValidation="false" EnableViewState="true"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"   ></asp:ScriptManager>

<br />
<br />

<asp:UpdatePanel ID="UpdatePanel01" runat="server" UpdateMode="Conditional"  EnableViewState="true" >
<ContentTemplate>
	<asp:Label ID="Label2" runat="server" Text="Reset Data Entry Records" Font-Bold="true"></asp:Label>
<br />
<br />


<asp:Label id="lbl0" runat="server" Text="Select Measure:" Width="150px"/>
<asp:DropDownList id="ddl_studymeasID" runat="server" Width="300px" EnableViewState="true" AutoPostBack="true" OnSelectedIndexChanged="ddl_studymeasID_SelectedIndexChanged"></asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<br />
<br />

<table>
<tr>

	<%--left--%>
<td style="vertical-align:top; width:400px">



<asp:Label id="lbl_Clin" runat="server" visible="false" Text="Select Clinician:" Width="150px"/>
<asp:DropDownList id="ddl_Clin" runat="server" visible="false" AutoPostBack="true" OnSelectedIndexChanged="ddl_Clin_SelectedIndexChanged"></asp:DropDownList>

<br />
<br />

<asp:Label id="Label1" runat="server" Text="Select ID to Re-Edit:" Width="150px"/>
<asp:DropDownList id="ddl_ID" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="ddl_ID_SelectedIndexChanged"></asp:DropDownList>
<br />
<br />

<asp:Button id="btnReset" runat="server" Visible="false" Text="Reset to single-entered to allow editing" AutoPostBack="true" OnClick="ResetForm"></asp:Button>

</td>


	<%--middle--%>
<td style="vertical-align:top; width:400px">

<br />
<br />

<asp:Label id="Label6" runat="server" Text="Select ID to Move:" Width="150px"/>
<asp:DropDownList id="ddl_IDmove" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="ddl_IDmove_SelectedIndexChanged"></asp:DropDownList>
<br />
<br />

<asp:Label id="lbl_Studymeas_New" runat="server" Text="Select New Studymeas to Move To:" Width="150px" Visible="false"/>
<asp:DropDownList id="ddl_Studymeas_New" runat="server"  AutoPostBack="true" Visible="false" OnSelectedIndexChanged="ddl_Studymeas_New_SelectedIndexChanged" ></asp:DropDownList>
<br />
<br />


<asp:Button id="btnMove" runat="server" Visible="false" Text="Move this record" AutoPostBack="true" OnClick="MoveRecord"></asp:Button>


</td>


	<%--right--%>
<td style="vertical-align:top">

<asp:Label id="lbl_Clindelete" runat="server" visible="false" Text="Select Clinician:" Width="150px"/>
<asp:DropDownList id="ddl_Clindelete" runat="server" visible="false" AutoPostBack="true" OnSelectedIndexChanged="ddl_Clindelete_SelectedIndexChanged"></asp:DropDownList>


<br />
<br />

<asp:Label id="Label4" runat="server" Text="Select ID to Delete:" Width="150px"  ForeColor="DarkRed" />
<asp:DropDownList id="ddl_IDdelete" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="ddl_IDdelete_SelectedIndexChanged"  ForeColor="DarkRed" ></asp:DropDownList>
<br />
<br />

<asp:Panel ID="panelDelete" runat="server" Visible="false">
	<asp:Label ID="Label3" runat="server" ForeColor="DarkRed" Text="Enter 'del' to confirm you wish to delete this record."></asp:Label>
	<asp:TextBox ID="txtDelete"  runat="server" ForeColor="DarkRed"  Width="80px" AutoPostBack="true" OnTextChanged="ConfirmTextChanged"></asp:TextBox>
	<br />
<asp:Button id="btnDelete" runat="server" Visible="false" ForeColor="DarkRed" Text="Delete this record." AutoPostBack="true" OnClick="DeleteRecord"></asp:Button>
</asp:Panel>

</td>

</tr>
</table>

<br />
<br />

	
	<asp:Label ID="lbl_DeleteSubjectDENIED" runat="server" Visible="false" Text="Staff in the 'Admin' role can delete subjects here." Font-Bold="true"></asp:Label>
	
	<asp:Panel ID="editSubjectPanel" runat="server" Visible="false">
	
	<asp:Label ID="lbl_DeleteSubject" runat="server" Visible="true" Text="Delete subject:" Font-Bold="true"></asp:Label>

	<asp:DropDownList id="ddl_delSubj1" runat="server"  Visible="true" AutoPostBack="true" OnSelectedIndexChanged ="ddl_delSubj_SelectedIndexChanged"></asp:DropDownList>
	<asp:DropDownList id="ddl_delSubj2" runat="server"  Visible="true" AutoPostBack="true" OnSelectedIndexChanged ="ddl_delSubj_SelectedIndexChanged"></asp:DropDownList>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<asp:Button id="btn_DeleteSubject" runat="server" Visible="false" ForeColor="DarkRed" Text="Delete this subject" AutoPostBack="true" OnClick="DeleteSubject"></asp:Button>

	<br/><br/>
	<br/>

		<table>
			<tr>
				<td>
					<asp:Label ID="Label8" runat="server" Visible="true" Text="Change group for subject:" Font-Bold="true" Width="200"></asp:Label>
	
				</td>
				<td>
					<asp:Label ID="Label9" runat="server" Visible="true" Text="New Group:" Font-Bold="true"></asp:Label>
				</td>
				<td>
					<asp:Label ID="Label10" runat="server" Visible="true" Text="New Group (enter again):" Font-Bold="true"></asp:Label>
				</td>

			</tr>
			<tr>
				<td>
	<asp:DropDownList id="ddl_ChangeGroupID" runat="server"  Visible="true" AutoPostBack="true" ></asp:DropDownList>

				</td>
				<td>
					<asp:DropDownList id="ddl_newGroup1" runat="server"  Visible="true" AutoPostBack="true" OnSelectedIndexChanged ="ddl_ChangeGroup_SelectedIndexChanged"
						 DataSourceID="sql_group" DataTextField="groupname" DataValueField="groupID" Width="120"></asp:DropDownList>

				</td>
				<td>
					<asp:DropDownList id="ddl_newGroup2" runat="server"  Visible="true" AutoPostBack="true" OnSelectedIndexChanged ="ddl_ChangeGroup_SelectedIndexChanged"
							DataSourceID="sql_group" DataTextField="groupname" DataValueField="groupID"  Width="120"></asp:DropDownList>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>

	<asp:Button id="btn_ChangeGroup" runat="server" Visible="false" ForeColor="Navy" Text="Change groups for this subject" AutoPostBack="true" OnClick="ChangeGroup"></asp:Button>

	<br/><br/>
	<br/>

	
   <table>
	   <tr>
		   <td>
	<asp:Label ID="lblNewID" runat="server" Visible="true" Text="Change subject ID:" Font-Bold="true" Width="200"></asp:Label>

		   </td>
		   <td>
			<asp:Label ID="Label5" runat="server" Visible="true" Text="New ID:" Font-Bold="true"></asp:Label>

		   </td>
		   <td>
			<asp:Label ID="Label7" runat="server" Visible="true" Text="New ID (enter again):" Font-Bold="true"></asp:Label>

		   </td>
	   </tr>
	   <tr>
		   <td>
	<asp:DropDownList id="ddl_newID" runat="server"  Visible="true" AutoPostBack="true"  OnSelectedIndexChanged="ddl_newID_SelectedIndexChanged"></asp:DropDownList>

		   </td>
		   <td>
				<asp:TextBox ID="newID1" runat="server"></asp:TextBox>
		   </td>
		   <td>
				<asp:TextBox ID="newID2" runat="server"></asp:TextBox>
		   </td>
	   </tr>
   </table>
	<asp:Button id="btnValidateNewID" runat="server" Visible="false" ForeColor="Navy" Text="Validate New ID" AutoPostBack="true" OnClick="ValidateNewID"></asp:Button>
	<asp:Button id="btnNewID" runat="server" Visible="false" ForeColor="Navy" Text="Change ID" AutoPostBack="true" OnClick="ChangeIDSubject"></asp:Button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<asp:CheckBox id="chkDataToo" runat="server" Visible="false" ForeColor="Navy" Text="Update entered data to new ID?" ></asp:CheckBox>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<asp:Button id="btnCancelNewID" runat="server" Visible="false" ForeColor="DarkRed" Text="Cancel" AutoPostBack="true" OnClick="CancelNewID"></asp:Button>
	
<%--        <asp:TextBox ID="txtOVERRIDE" runat="server" Visible="false" Text="Enter 'fix' here to update entered data with the new ID." Width="380px" ForeColor="Blue" ></asp:TextBox>--%>


	</asp:Panel>

	
<%--    <asp:Label ID="Label8" runat="server" ForeColor="DarkRed" ></asp:Label>--%>
	<asp:Literal ID="error_label" runat="server" ></asp:Literal>

<br />

</ContentTemplate>

<Triggers>
<asp:AsyncPostBackTrigger ControlID="ddl_studymeasID" EventName="SelectedIndexChanged" />
<asp:AsyncPostBackTrigger ControlID="ddl_ID" EventName="SelectedIndexChanged" />
<asp:AsyncPostBackTrigger ControlID="ddl_IDdelete" EventName="SelectedIndexChanged" />
<asp:AsyncPostBackTrigger ControlID="ddl_Clin" EventName="SelectedIndexChanged" />
<asp:AsyncPostBackTrigger ControlID="ddl_Clindelete" EventName="SelectedIndexChanged" />
<asp:AsyncPostBackTrigger ControlID="txtDelete" EventName="TextChanged" />

<asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
<asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />

	<asp:AsyncPostBackTrigger ControlID="btn_DeleteSubject" EventName="Click" />
</Triggers>

</asp:UpdatePanel>

<br />
<br /><br />
<br /><br />
<br />

		<asp:SqlDataSource runat="server" ID="sql_group"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
	 SelectCommand="select -1 groupID, '--select--' groupname union select groupID, groupname  from tblGroup where studyID=@studyID order by groupID" SelectCommandType="text">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID"  Name="studyID" Type="Int32" />
			</SelectParameters>  
	</asp:SqlDataSource>


</asp:Content>