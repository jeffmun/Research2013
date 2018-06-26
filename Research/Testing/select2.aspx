<%@ Page Title="" Language="C#" MasterPageFile="~/UWBudgetTool.master" AutoEventWireup="true" CodeFile="select2.aspx.cs" Inherits="Testing_select2" %>
<%@ MasterType VirtualPath="~/UWBudgetTool.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">





<%--    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0-rc.1/js/select2.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0-rc.1/css/select2.css" rel="stylesheet" />--%>

<%--	<asp:Hiddenfield ID="hid" runat="server" />--%>


	<br />
	<br />
	Select Budgets.
	<br />

	
	

<select id="ddl" runat="server" multiple="true" style="width:300px" ></select>
<script type="text/javascript">
	$("#<%=ddl.ClientID%>").select2({
		maximumSelectionLength: 3 });
</script>


	<br /><br />

<%--    http://stackoverflow.com/questions/34709792/selec2-4-0-with-multi-select-in-asp-net-how-to-get-and-set-selected-items--%>
<%--<script type="text/javascript">
	$(document).ready(function () {
		$("#select1").select2({
			placeholder: "Select a Subject",
			allowClear: true
		});
	});
</script>--%>


	<asp:Button ID="btn" runat="server" Text="Button" OnClick="btn_Click" />
	<br />
	<br />
	<asp:Label ID="lbl" runat="server" Text="foo"></asp:Label>



</asp:Content>

