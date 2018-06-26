<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="CheckOutStorageUnit.aspx.cs" Inherits="DataEntry.DataStorage.CheckOutStorageUnit" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Check Out Storage Unit</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selStudyID" runat="server">Study</asp:Label><br/>
			<asp:DropDownList ID="selStudyID" Runat="server" />
		</td>
	</tr>
</table>

</asp:Content>