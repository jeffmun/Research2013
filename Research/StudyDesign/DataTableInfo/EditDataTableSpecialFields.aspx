<%@ Page Language="C#" MasterPageFile="~/PopUp.master" CodeFile="EditDataTableSpecialFields.aspx.cs" Inherits="StudyDesign.DataTableInfo.EditDataTableSpecialFields" %>
<%@ MasterType VirtualPath="~/PopUp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" style="width: 100%; margin: 0px;" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td id="tdTitle" runat="server">Edit Special Field Info.</td>
	</tr>
	<tr>
		<td>
			<label for="selFieldID">Field</label><br/>
			<asp:DropDownList ID="selFieldID" Runat="server" style="width: 250px;" onchange="SyncEditSpecialFieldsForm();" />
		</td>
	</tr>
	<tr>
		<td>
			<label for="txtFieldName">Field Name</label><br/>
			<asp:TextBox ID="txtFieldName" Runat="server" style="width: 250px;" />
		</td>
	</tr>
	<tr>
		<td>
			<label for="selFieldCodeID">Field Code</label><br/>
			<asp:DropDownList ID="selFieldCodeID" Runat="server" style="width: 250px;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:CheckBox ID="chkIsIDField" Runat="server" Text="Is ID Field?" />
		</td>
	</tr>
	<tr>
		<td id="tdDelete" style="display: none;">
			<asp:CheckBox ID="chkDelete" Runat="server" Text="Delete Field?" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="hidden" id="hidTableID" runat="server" name="hidTableID" />
		</td>
	</tr>
</table>

</asp:Content>