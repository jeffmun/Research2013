<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="Search.aspx.cs" AutoEventWireup="True" Inherits="Measures.Search" EnableEventValidation="False" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2">Find Subjects/Measures/Actions - Advanced Search</td>
	</tr>
	<tr>
		<td colspan="2" id="tdMsg" runat="server" style="color: #ff0000; display: none;"></td>
	</tr>
	<tr>
		<td style="width: 25%;">
			<label>Search For:</label>
			<p style="margin-top: 10px; margin-left: 20px;">
				<input type="radio" name="radSearchType" value="S" id="radSearchTypeSubj" onclick="DoChangeSearchForm(this.value, true)" runat="server" /><asp:Label AssociatedControlID="radSearchTypeSubj" runat="server" class="lblNotBold">Subjects</asp:Label><br/>
				<input type="radio" name="radSearchType" value="A" id="radSearchTypeAction" onclick="DoChangeSearchForm(this.value, true)" runat="server" /><asp:Label AssociatedControlID="radSearchTypeAction" runat="server" class="lblNotBold">Actions</asp:Label><br/>
				<input type="radio" name="radSearchType" value="M" id="radSearchTypeMeas" onclick="DoChangeSearchForm(this.value, true)" runat="server" /><asp:Label AssociatedControlID="radSearchTypeMeas" runat="server" class="lblNotBold">Measures</asp:Label>
			</p>
		</td>
		<td style="width: 75%;">
			<asp:Label AssociatedControlID="selStudyID" runat="server">Study</asp:Label><br/>
			<asp:DropDownList id="selStudyID" runat="server" /><br/><br/>
			<asp:Label AssociatedControlID="txtSubjID" runat="server">Subject ID</asp:Label><br/>
			<asp:TextBox id="txtSubjID" runat="server" width=" 200px" />
		</td>
	</tr>
	<tr id="trSubjectForm">
		<td colspan="2" style="padding: 0px;">
		<table cellspacing="0" style="width: 100%">
			<tr>
				<td style="width: 25%;">
					<asp:Label AssociatedControlID="selSubjectStatusID" runat="server">Subject Status</asp:Label><br/>
					<asp:ListBox id="selSubjectStatusID" SelectionMode="Multiple" Rows="4" runat="server" width=" 200px" />
				</td>
				<td style="width: 75%; vertical-align: top;">
					<asp:Label AssociatedControlID="selGroupID" runat="server">Group</asp:Label><br />
					<asp:DropDownList ID="selGroupID" runat="server" style="width: 200px;" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr id="trSharedForm" style="display: none;">
		<td colspan="2" style="padding: 0px;">
		<table cellspacing="0" style="width: 100%">
			<tr>
				<td style="width: 25%;">
					<asp:Label AssociatedControlID="selLabID" runat="server">Lab</asp:Label><br/>
					<asp:DropDownList id="selLabID" runat="server" style="width: 200px;" />
				</td>
				<td style="width: 75%;">
					<asp:Label AssociatedControlID="selActionStatusID" runat="server">Action Status</asp:Label><br/>
					<asp:DropDownList id="selActionStatusID" runat="server" width=" 200px" />
				</td>
			</tr>
			<tr>
				<td style="width: 25%;">
					<asp:Label AssociatedControlID="txtStartDate" runat="server">Start Date:</asp:Label><br/>
					<asp:TextBox ID="txtStartDate" runat="server" style="width: 175px;" />
					<img src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgStartDate" alt="Select Start Date" />
				</td>
				<td style="width: 75%;">
					<asp:Label AssociatedControlID="txtEndDate" runat="server">End Date:</asp:Label><br/>
					<asp:TextBox ID="txtEndDate" runat="server" style="width: 175px;" />
					<img src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgEndDate" alt="Select End Date" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr id="trActionForm" style="display: none;">
		<td colspan="2" style="padding: 0px;">
		<table cellspacing="0" style="width: 100%">
			<tr>
				<td style="width: 25%;">
					<asp:Label AssociatedControlID="selStudyActionID" runat="server">Study Action</asp:Label><br />
					<asp:ListBox ID="selStudyActionID" runat="server" SelectionMode="Multiple" style="height: 140px; width: 200px;" />
				</td>
				<td style="width: 75%;">
					<asp:Label AssociatedControlID="selActionType" runat="server">Action Type</asp:Label><br/>
					<asp:DropDownList id="selActionType" runat="server" width="200px" />
				</td>
			</tr>
			<tr>
				<td style="width: 25%;">
					<asp:Label AssociatedControlID="selRespForID" runat="server">Staff Resp. For</asp:Label><br/>
					<asp:DropDownList id="selRespForID" runat="server" width=" 200px" />
				</td>
				<td style="width: 75%;">
					<asp:Label AssociatedControlID="selCompByID" runat="server">Staff Completed By</asp:Label><br/>
					<asp:DropDownList id="selCompByID" runat="server" width=" 200px" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr id="trMeasureForm" style="display: none;">
		<td colspan="2" style="padding: 0px;">
		<table cellspacing="0" style="width: 100%">
			<tr>
				<td colspan="2">
					<asp:Label AssociatedControlID="selStudyMeasureID" runat="server">Study Measure</asp:Label><br />
					<asp:ListBox ID="selStudyMeasureID" runat="server" SelectionMode="Multiple" style="height: 140px; width: 200px;" />
				</td>
			</tr>
			<tr>
				<td style="width: 25%;">
					<asp:Label AssociatedControlID="selMeasureStatusID" runat="server">Measure Status</asp:Label><br/>
					<asp:DropDownList id="selMeasureStatusID" runat="server" style="width: 200px" />
				</td>
				<td style="width: 75%;">
					<asp:Label AssociatedControlID="selMeasureStatusDetailID" runat="server">Measure Status Detail</asp:Label><br />
					<asp:DropDownList ID="selMeasureStatusDetailID" runat="server" style="width: 200px;" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr id="trSubmitForm" style="display: none;">
		<td colspan="2">
			<asp:Button ID="btnSubmit" Runat="server" Text="Submit" OnClick="DoSearch" />
		</td>
	</tr>
</table>

<asp:DataGrid	ID="tblSearchResults"
				runat="server"
				CssClass="tblReport"
				GridLines="None"
				AutoGenerateColumns="False"
				OnItemDataBound="Item_Bound">
	<AlternatingItemStyle CssClass="trDark" />
	<HeaderStyle CssClass="trHeader" />
</asp:DataGrid>


<dlcalendar click_element_id="imgStartDate" input_element_id="<% =txtStartDate.ClientID %>"></dlcalendar>
<dlcalendar click_element_id="imgEndDate" input_element_id="<% =txtEndDate.ClientID %>"></dlcalendar>
</asp:Content>