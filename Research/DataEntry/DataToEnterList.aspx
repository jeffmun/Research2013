<%@ Page CodeFile="DataToEnterList.aspx.cs" MasterPageFile="~/UWAC.master" 
Inherits="DataEntry.DataToEnterList"  Language="C#" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblInput" runat="server" style="width: 100%;">
	<tr class="trTitle">
		<td colspan="2">Find Data to Enter</td>
	</tr>
	<tr>
		<td colspan="2" id="tdError" runat="server" style="display: none;"></td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selStudyID" runat="server">Study</asp:Label><br>
			<asp:DropDownList id="selStudyID" runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtSubjID" runat="server">Subject ID</asp:Label><br>
			<asp:TextBox ID="txtSubjID" runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selMeasure" runat="server">Measure</asp:Label><br/>
			<asp:ListBox ID="selMeasure" Runat="server" SelectionMode="Multiple" Rows="5" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selSubjStatus" runat="server">Subject Status</asp:Label><br/>
			<asp:ListBox ID="selSubjStatus" Runat="server" SelectionMode="Multiple" Rows="5" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selActionToTake" runat="server">Action to Take</asp:Label><br>
			<asp:DropDownList id="selActionToTake" runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selMeasStatus" runat="server">Measure Status</asp:Label><br/>
			<asp:DropDownList ID="selMeasStatus" Runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="GetDataToEnter" />
		</td>
	</tr>
</table>

<asp:DataGrid	ID="tblReport"
				runat="server"
				CssClass="tblReport"
				style="display: none; margin: 0px; width: 100%;"
				GridLines="None"
				AutoGenerateColumns="False"
				AllowSorting="True"
				OnItemDataBound="Item_Bound"
				OnSortCommand="SortData">
	<AlternatingItemStyle CssClass="trDark" />
	<HeaderStyle CssClass="trHeader" />
	<Columns>
		<asp:HyperLinkColumn HeaderText="Measure" DataNavigateUrlFormatString="~/Measures/EditMeasure.aspx?StudyMeasSubjID={0}" DataNavigateUrlField="StudyMeasSubjID" DataTextField="MeasName" SortExpression="[MeasName] ASC" />
		<asp:HyperLinkColumn HeaderText="Subj. ID" DataNavigateUrlFormatString="~/Measures/EditSubject.aspx?SubjID={0}" DataNavigateUrlField="SubjID" DataTextField="ID" SortExpression="[ID] ASC" />
		<asp:BoundColumn HeaderText="Group Name" DataField="GroupName" SortExpression="[GroupName] ASC" />
		<asp:BoundColumn HeaderText="Date Done" DataField="MeasureDateDone" SortExpression="[MeasDateDone] ASC" />
		<asp:BoundColumn HeaderText="Comp. By" DataField="Staff_MeasCompBy" SortExpression="[Staff_MeasCompBy] ASC" />
		<asp:HyperLinkColumn HeaderText="Action to Take" DataNavigateUrlFormatString="javascript:PopUpWindow('{0}', 'wdwDEForm', 'height=600,width=800,scrollbars=yes,resizable=yes,toolbar=no,status=no,menubar=no,titlebar=no');" DataNavigateUrlField="FormURL" DataTextField="ActionToTake" SortExpression="[ActionToTake] ASC" />
	</Columns>
</asp:DataGrid>

</asp:Content>