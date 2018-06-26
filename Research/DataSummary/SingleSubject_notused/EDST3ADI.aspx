<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="EDST3ADI.aspx.cs" Inherits="DataSummary.SingleSubject.EDST3ADI" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table class="tblInput" cellspacing="0" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td>EDS T3 ADI - Single Subject Summary</td>
	</tr>
	<tr>
		<td id="tdMsg" runat="server" style="color: #ff0000; display: none;"></td>
	</tr>
	<tr>
		<td id="tdComboBox" runat="server">
			<asp:Label AssociatedControlID="selSubjectID" runat="server">Subject ID</asp:Label><br />
			<asp:DropDownList ID="selSubjectID" runat="server" style="width: 200px;" AutoPostBack="True" OnSelectedIndexChanged="GetADI" />
		</td>
	</tr>
</table>

</asp:Content>