<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="default.aspx.cs" Inherits="DataSummary.SingleSubject._default" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table class="tblInput" cellspacing="0">
	<tr class="trTitle">
		<td>Single Subject Data Summaries</td>
	</tr>
	<tr>
		<td>
			<a href="/DataSummary/SingleSubject/GeneticsADI.aspx">Genetics ADI</a><br>
		</td>
	</tr>
	<tr>
		<td>
			<a href="/DataSummary/SingleSubject/EDST3ADI.aspx">EDS T3 ADI</a><br>
		</td>
	</tr>
	<tr>
		<td>
			<a href="/DataSummary/SingleSubject/FACEADI.aspx">FACE ADI</a><br>
		</td>
	</tr>
	<tr>
		<td>
			<a href="/DataSummary/SingleSubject/TAPADI.aspx">TAP ADI</a><br>
		</td>
	</tr>
</table>

</asp:Content>