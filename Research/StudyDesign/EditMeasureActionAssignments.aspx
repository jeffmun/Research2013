<%@ Page Language="C#" MasterPageFile="~/PopUp.master" CodeFile="EditMeasureActionAssignments.aspx.cs" Inherits="StudyDesign.EditMeasureActionAssignments" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server" style="width: 100%; margin: 0px;">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Assign Measures to Actions</td>
	</tr>
	<tr>
		<td class="tdHeaderAlt">Study Measure/Group</td>
		<td class="tdHeaderAlt">Study Action/Group</td>
	</tr>
	<tr>
		<td colspan="2">
			<%--<input type="button" name="btnReturn" id="btnReturn" runat="server" value="Back to Actions" />--%>
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="hidden" name="hidStudyID" id="hidStudyID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>