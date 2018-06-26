<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="MyInfo.aspx.cs" Inherits="MyInfo" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">
			Staff Information
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtEmail" runat="server">Email</asp:Label><br />
			<asp:TextBox ID="txtEmail" runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtWorkPhone" runat="server">Work Phone</asp:Label><br />
			<asp:TextBox ID="txtWorkPhone" runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtHomePhone" runat="server">Home Phone</asp:Label><br />
			<asp:TextBox ID="txtHomePhone" runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="txtOtherPhone" runat="server">Other Phone</asp:Label><br />
			<asp:TextBox ID="txtOtherPhone" runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="txtOffice" runat="server">Office Location</asp:Label><br />
			<asp:TextBox ID="txtOffice" runat="server" style="width: 200px;" />
		</td>
		<td>
			<asp:Label AssociatedControlID="selDefaultStudyID" runat="server">Default Study</asp:Label><br />
			<asp:DropDownList ID="selDefaultStudyID" runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button ID="btnSubmit" runat="server" Text="Save Changes" OnClick="SaveChanges" />
		</td>
	</tr>
</table>


</asp:Content>