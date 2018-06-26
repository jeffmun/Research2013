<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="EnterStorageUnit.aspx.cs" Inherits="DataEntry.DataStorage.EnterStorageUnit" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<span id="oScriptHolder" runat="server"></span>
<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Enter New Storage Unit</td>
	</tr>
	<tr>
		<td colspan="2" id="tdMsg" runat="server" style="display: none;"></td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selStudyID" runat="server">Study</asp:Label><br/>
			<asp:DropDownList ID="selStudyID" Runat="server" style="width: 250px;" onchange="GetMaxStorageUnitNumber(this.options[this.selectedIndex].value);" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtStorageUnitNumber" runat="server">Storage Unit Number</asp:Label>&nbsp;&nbsp;<span class="verysmalltext" id="oSpan"></span><br/>
			<asp:TextBox ID="txtStorageUnitNumber" Runat="server" style="width: 250px;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selStorageLocationID" runat="server">Storage Location</asp:Label><br/>
			<asp:DropDownList ID="selStorageLocationID" Runat="server" style="width: 250px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selStorageUnitTypeID" runat="server">Storage Unit Type</asp:Label><br/>
			<asp:DropDownList ID="selStorageUnitTypeID" Runat="server" style="width: 250px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Label AssociatedControlID="selStorageContentID" runat="server">Storage Content Type</asp:Label><br/>
			<asp:DropDownList ID="selStorageContentID" Runat="server" style="width: 250px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Label AssociatedControlID="txtDescription" runat="server">Description</asp:Label><br/>
			<asp:TextBox ID="txtDescription" Runat="server" TextMode="MultiLine" Rows="7" style="width: 650px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Label AssociatedControlID="txtSubjects" runat="server">Subjects</asp:Label> <span class="verysmalltext">(one per line)</span><br/>
			<asp:TextBox ID="txtSubjects" Runat="server" TextMode="MultiLine" Rows="7" style="width: 120px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="button" name="btnAddNew" value="Add New Storage Unit" id="btnAddNew" runat="server" style="display: none;" onclick="document.location = '/DataEntry/DataStorage.aspx';" />
			<asp:HiddenField id="hidStorageUnitID" runat="server" />
			<input type="hidden" name="hidMaxStorageUnitNumber" id="hidMaxStorageUnitNumber" />
		</td>
	</tr>
</table>

</asp:Content>