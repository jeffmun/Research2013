<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="SubjectsByConsent.aspx.cs" AutoEventWireup="True" Inherits="Measures.SubjectsByConsent" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblReport" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="5" id="tdTitle" runat="server"></td>
	</tr>
	<tr class="trHeader">
		<td>Subj. ID</td>
		<td>Version</td>
		<td>Status</td>
		<td>Date Signed</td>
		<td>Consent Items</td>
	</tr>
</table>

</asp:Content>