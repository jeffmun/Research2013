<%@ Page Language="C#" MasterPageFile="~/PopUp.master" CodeFile="EditDataTableFieldInfo.aspx.cs" Inherits="StudyDesign.DataTableInfo.EditDataTableFieldInfo" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server" style="width: 100%; margin: 0px;">
	<tr class="trTitle">
		<td id="tdTitle" runat="server" colspan="11">Edit Variable Info.</td>
	</tr>
	<tr>
		<td class="tdHeaderAlt">Field Name</td>
		<td class="tdHeaderAlt">Field Label</td>
		<td class="tdHeaderAlt">Min</td>
		<td class="tdHeaderAlt">Max</td>
		<td class="tdHeaderAlt">Valid List</td>
		<td class="tdHeaderAlt">Miss.</td>
		<td class="tdHeaderAlt">Analysis</td>
		<td class="tdHeaderAlt">Calc SPSS</td>
		<td class="tdHeaderAlt">S. Plot</td>
		<td class="tdHeaderAlt">B. Plot</td>
		<td class="tdHeaderAlt">Value Set</td>
	</tr>
	<tr>
		<td colspan="11">
			<input type="submit" id="btnSaveChanges" name="btnSaveChanges" value="Save Changes" />
			<input type="button" id="btnAddVariables" runat="server" name="btnAddVariables" value="Add Variables" onserverclick="AddVariables" onclick="AddVariables();" />
			<asp:HiddenField id="hidTableID" runat="server" />
			<input type="hidden" name="hidNumVarsToAdd" value="" id="hidNumVarsToAdd" />
		</td>
	</tr>
</table>

</asp:Content>