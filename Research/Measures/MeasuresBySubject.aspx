<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="MeasuresBySubject.aspx.cs" AutoEventWireup="True" Inherits="Measures.MeasuresBySubject" Title="Measures by subject" Debug="true" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblReport">
	<tr class="trTitle">
		<td style="border-bottom: 0px;">
			<div id="divTitle" runat="server"></div>
			
			<div class="DoNotPrint" style="font-size: 8pt;">
				<a id="aHideNAActions" runat="server" onserverclick="HideNAActions">Hide NA Actions</a> |
				<a id="aViewMeasures" runat="server">View Actions</a> |
				<a id="aViewConsents" runat="server">View Consent Forms</a> |
				<a id="aViewHousehold" runat="server">View Household</a>
			</div>
			
			<asp:DropDownList ID="selStudyID" runat="server" style="font-size: 7pt;" /><asp:TextBox ID="txtID" runat="server" style="font-size: 7pt; width: 50px;" />
            <asp:Button ID="btnChangeSubject" runat="server" Text="Update" OnClick="ChangeSubject" style="font-size: 7pt;" />
			
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
		<asp:BoundColumn HeaderText="Edit" >
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundColumn>
		<asp:HyperLinkColumn HeaderText="Meas Name" DataNavigateUrlField="StudyMeasSubjID" DataNavigateUrlFormatString="~/Measures/EditMeasure.aspx?StudyMeasSubjID={0}" DataTextField="MeasName" SortExpression="[MeasName] ASC" />
		<asp:BoundColumn HeaderText="Meas. Status" DataField="MeasStatus" SortExpression="[MeasStatus] ASC" />
		<asp:HyperLinkColumn HeaderText="Action" DataNavigateUrlField="ActionID" DataNavigateUrlFormatString="~/Measures/EditAction.aspx?ActionID={0}" DataTextField="ActionText" SortExpression="[ActionText] ASC" />
		<asp:BoundColumn HeaderText="Action Status" DataField="ActionStatus" SortExpression="[ActionStatus] ASC" />
	<%-- 	<asp:BoundColumn HeaderText="Resp. For" DataField="Staff_RespFor" SortExpression="[Staff_RespFor] ASC" /> --%>
		<asp:BoundColumn HeaderText="Comp. By" DataField="Staff_CompBy" SortExpression="[Staff_CompBy] ASC" />
		<asp:BoundColumn HeaderText="Date Done" DataField="MeasureDateDone" SortExpression="[MeasureDateDone] ASC" />
        <asp:TemplateColumn HeaderText="DataEntry Status"  SortExpression="[ActionToTake] ASC" >
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1"  
                    NavigateUrl='<%# Eval("FormURL") %>' 
                    runat="server" 
                    Text='<%# Eval("ActionToTake") %>' 
                    ></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateColumn>
	</Columns>
</asp:DataGrid>
<asp:HiddenField ID="hidHideNA" runat="server" Value="false" />

<!--
<input type="hidden" name="hidSortField" id="hidSortField" runat="server">
<table cellspacing="0" class="tblReport" id="tblMaster" runat="server">
	<tr class="trHeader">
		<td>Edit</td>
		<td>
			Measure
			<a href="javascript:DoSubmitSort('MeasName ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending"></a>
			<a href="javascript:DoSubmitSort('MeasName DESC');"><img src="/images/sort-za.gif" alt="Sort Descending"></a>
		</td>
		<td>
			Measure Status
			<a href="javascript:DoSubmitSort('MeasStatus ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending"></a>
			<a href="javascript:DoSubmitSort('MeasStatus DESC');"><img src="/images/sort-za.gif" alt="Sort Descending"></a>
		</td>
		<td>
			Action
			<a href="javascript:DoSubmitSort('ActionText ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending"></a>
			<a href="javascript:DoSubmitSort('ActionText DESC');"><img src="/images/sort-za.gif" alt="Sort Descending"></a>
		</td>
		<td>
			Action Status
			<a href="javascript:DoSubmitSort('ActionStatus ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending"></a>
			<a href="javascript:DoSubmitSort('ActionStatus DESC');"><img src="/images/sort-za.gif" alt="Sort Descending"></a>
		</td>
		<td>
			Resp. For
			<a href="javascript:DoSubmitSort('Staff_RespFor ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending"></a>
			<a href="javascript:DoSubmitSort('Staff_RespFor DESC');"><img src="/images/sort-za.gif" alt="Sort Descending"></a>
		</td>
		<td>
			Comp. By
			<a href="javascript:DoSubmitSort('Staff_MeasCompBy ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending"></a>
			<a href="javascript:DoSubmitSort('Staff_MeasCompBy DESC');"><img src="/images/sort-za.gif" alt="Sort Descending"></a>
		</td>
		<td>
			Date Done
			<a href="javascript:DoSubmitSort('DateDone ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending"></a>
			<a href="javascript:DoSubmitSort('DateDone DESC');"><img src="/images/sort-za.gif" alt="Sort Descending"></a>
		</td>
		<td>
			Action To Take
			<a href="javascript:DoSubmitSort('ActionToTake ASC');"><img src="/images/sort-az.gif" alt="Sort Ascending"></a>
			<a href="javascript:DoSubmitSort('ActionToTake DESC');"><img src="/images/sort-za.gif" alt="Sort Descending"></a>
		</td>
	</tr>
</table>
-->
<p class="DoNotPrint">
	<input type="button" name="btnEditMeasures" value="Edit Checked Measures" id="btnEditMeasures"
		runat="server">
</p>

</asp:Content>