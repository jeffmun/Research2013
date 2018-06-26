<%@ Page Language="C#" MasterPageFile="~/PopUp.master" CodeFile="EditStudyMeasures.aspx.cs" Inherits="StudyDesign.EditStudyMeasures" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server" style="width: 100%; margin: 0px;">
	<tr class="trTitle">
		<td colspan="9">Edit Study Measures</td>
	</tr>
	<tr>
		<td colspan="9">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="button" name="btnAddNewStudyMeasure" id="btnAddNewStudyMeasure" value="Add New Study Measure" runat="server"  onserverclick="AddNewStudyMeasure" />
			<asp:HiddenField id="hidStudyID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>