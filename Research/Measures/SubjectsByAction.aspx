<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="SubjectsByAction.aspx.cs" AutoEventWireup="True" Inherits="Measures.ActionSubjectDetail" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblReport">
	<tr class="trTitle">
		<td style="border-bottom: 0px;">
			<div id="divTitle" runat="server"></div>
			
			<div class="DoNotPrint" style="font-size: 8pt;">
				<a id="aHideNAActions" runat="server" onserverclick="HideNAActions">Hide NA Actions</a>
			<div class="verysmalltext"><% =DateTime.Now.ToString("MM/dd/yyyy hh:mm tt") %></div>
		</td>
	</tr>
</table>
<asp:DataGrid	ID="tblReport"
				runat="server"
				CssClass="tblReport"
				GridLines="None"
				AutoGenerateColumns="False"
				AllowSorting="True"
				OnItemDataBound="Item_Bound"
				OnSortCommand="SortResults">
	<HeaderStyle CssClass="trHeader" />
	<AlternatingItemStyle CssClass="trDark" />
	<Columns>
		<asp:BoundColumn HeaderText="Subject" DataField="ID" SortExpression="[ID] ASC" />
		<asp:BoundColumn HeaderText="Action" DataField="Action_ActionText" SortExpression="[actiontext] ASC" />
		<asp:HyperLinkColumn HeaderText="Subj. Status" DataNavigateUrlField="SubjID" DataNavigateUrlFormatString="~/Measures/EditSubject.aspx?SubjID={0}" DataTextField="SubjStatus" SortExpression="[SubjStatus] ASC" />
		<asp:HyperLinkColumn HeaderText="Action Status" DataNavigateUrlField="ActionID" DataNavigateUrlFormatString="~/Measures/EditAction.aspx?ActionID={0}" DataTextField="ActionStatus" SortExpression="[ActionStatus] ASC" />
		<asp:BoundColumn HeaderText="Resp. For" DataField="Staff_RespFor" SortExpression="[Staff_RespFor] ASC" />
		<asp:BoundColumn HeaderText="Comp. By" DataField="Staff_CompBy" SortExpression="[Staff_CompBy] ASC" />
		<asp:BoundColumn HeaderText="Date Done" DataField="DateDone" SortExpression="[DateDone] ASC" />
	</Columns>
</asp:DataGrid>
<asp:HiddenField ID="hidHideNA" runat="server" Value="false" />


<!--
<table cellspacing="0" class="tblReport" id="tblMaster" runat="server">
	<tr class="trHeader">
		<td>
			Subject
			<a href="javascript:DoSubmitSort('[ID] ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('[ID] DESC');"><img src="/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>
			Subj. Status
			<a href="javascript:DoSubmitSort('SubjStatus ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('SubjStatus DESC');"><img src="/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>
			Act. Status
			<a href="javascript:DoSubmitSort('ActionStatus ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('ActionStatus DESC');"><img src="/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>
			Resp. For
			<a href="javascript:DoSubmitSort('Staff_RespFor ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('Staff_RespFor DESC');"><img src="/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>
			Comp. By
			<a href="javascript:DoSubmitSort('Staff_CompBy ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('Staff_CompBy DESC');"><img src="/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>
			Date Done
			<a href="javascript:DoSubmitSort('DateDone ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('DateDone DESC');"><img src="/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
	</tr>
</table>
-->

</asp:Content>