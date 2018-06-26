<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="SearchStorageUnits.aspx.cs" Inherits="DataEntry.DataStorage.SearchStorageUnits" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Search Storage Units</td>
	</tr>
	<tr>
		<td colspan="2" id="tdErrMsg" runat="server"></td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selStudyID" runat="server">Study</asp:Label><br/>
			<asp:DropDownList ID="selStudyID" Runat="server" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtSubjID" runat="server">Subject ID</asp:Label><br/>
			<asp:TextBox ID="txtSubjID" Runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selStorageLocationID" runat="server">Storage Location</asp:Label><br/>
			<asp:DropDownList ID="selStorageLocationID" Runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selStorageContent" runat="server">Contents</asp:Label><br/>
			<asp:DropDownList ID="selStorageContent" Runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button ID="btnFindStorageUnits" Runat="server" Text="Find Storage Units" OnClick="FindStorageUnits" />
		</td>
	</tr>
</table>

<asp:DataGrid	ID="tblSearchResults"
				runat="server"
				CssClass="tblReport"
				style="width: 95%; margin-left: 10px; display: none;"
				GridLines="None"
				AutoGenerateColumns="False"
				OnItemDataBound="Item_Bound">
	<AlternatingItemStyle CssClass="trDark" />
	<HeaderStyle CssClass="trHeader" />
	<Columns>
		<asp:BoundColumn HeaderText="Location" DataField="StorageLocation" />
		<asp:BoundColumn HeaderText="Unit Type" DataField="StorageUnitType" />
		<asp:BoundColumn HeaderText="Content" DataField="StorageContent" />
		<asp:BoundColumn HeaderText="Unit #" DataField="StorageUnitNumber" />
		<asp:BoundColumn HeaderText="Subj. ID" DataField="ID" />
		<asp:BoundColumn HeaderText="Status" DataField="StaffShortName" />
		<asp:BoundColumn HeaderText="Desc." DataField="UnitDescription" />
	</Columns>
</asp:DataGrid>

</asp:Content>