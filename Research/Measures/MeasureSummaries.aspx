<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="MeasureSummaries.aspx.cs" AutoEventWireup="True" Inherits="Measures.MeasureSummaries" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<table class="tblInput" cellspacing="0" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td>Measure Summaries</td>
	</tr>
	<tr>
		<td>
			This page allows you to download the status of all measures for all subjects in a study
			in a MS Excel format. Select the study you wish to view and click the &quot;Submit&quot;
			button.
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label AssociatedControlID="selStudyID" runat="server">Study</asp:Label><br/>
			<asp:DropDownList id="selStudyID" runat="server" />
		</td>
	</tr>
	<tr>
		<td><asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="GetMeasureSummary" /></td>
	</tr>
</table>

</asp:Content>