<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="ValantDoc.aspx.cs" Inherits="AC_ValantDoc" 
	 EnableEventValidation="false" Title="Valant Documents"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<%--<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> --%>

	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-ui.min.js"></script>

	 <script type="text/javascript">
		function OnExceptionOccurred(s, e) {
			e.handled = true;
			alert(e.message);
			window.location.reload();
			}

		function OnInit(s, e) { 
			//s.SetFullscreenMode(true); 
	 }
	</script>
</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

<dx:ASPxLabel ID="lbl1" runat="server" Text="Valant Documents" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
<br />
<br />
<dx:ASPxLabel ID="lblPerm" runat="server" Text="You do not have permission for this page." Font-Size="Medium" Font-Bold="false"></dx:ASPxLabel>


<dx:ASPxGridView ID="grid" runat="server" DataSourceID="sqlValantDoc" AutoGenerateColumns="false" KeyFieldName="valdocID" SettingsBehavior-AllowGroup="true"
	 Settings-ShowGroupPanel="true"  Settings-VerticalScrollBarMode="Auto" Settings-VerticalScrollableHeight="650"
	 Settings-ShowHeaderFilterButton="false" Settings-ShowFilterRow="true"  
	  OnRowUpdating="grid_RowUpdating" SettingsEditing-Mode="Inline"    >
	<Columns>
		<dx:GridViewCommandColumn ShowEditButton="true" Width="60"></dx:GridViewCommandColumn>
		<dx:GridViewDataColumn FieldName="valdocID" ReadOnly="true" Width="60" ></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="client"  ReadOnly="true" Width="80"></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="lastname"  ReadOnly="true" Width="100"></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="firstname"  ReadOnly="true" Width="100"></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="doctype" ReadOnly="true" Width="150"></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="docdate" ReadOnly="true" Width="120"></dx:GridViewDataColumn>
		<dx:GridViewDataHyperLinkColumn FieldName="docparams" PropertiesHyperLinkEdit-EnableClientSideAPI="true"
			PropertiesHyperLinkEdit-NavigateUrlFormatString="~/Documents/WebdocFileHandler.ashx?file={0}&mode=valant"  PropertiesHyperLinkEdit-TextField="docname" PropertiesHyperLinkEdit-Target="_blank" ></dx:GridViewDataHyperLinkColumn>
		<dx:GridViewDataColumn FieldName="notes" ></dx:GridViewDataColumn>

	</Columns>
<%--	L:\ops\uwac%20it\valantexport\docs\
	
		<FormatConditions>
			<dx:GridViewFormatConditionHighlight FieldName="client" Expression="[status] is not null" Format="GreenFillWithDarkGreenText" />
		</FormatConditions>--%>
	<Settings ShowFilterBar="Visible" ShowFooter="true"    />
	<SettingsFilterControl ViewMode="Visual"></SettingsFilterControl> 
	<SettingsPager PageSize="20">
		 <PageSizeItemSettings Items="10,20,50,200,500,2000" Visible="true"></PageSizeItemSettings>
	</SettingsPager>
</dx:ASPxGridView>


	
	<asp:SqlDataSource ID="sqlValantDoc" runat="server" ConnectionString="<%$ ConnectionStrings:ValantTJ %>"
		SelectCommandType="text"
		SelectCommand="select a.*, lastname, firstname ,  folder + '\' + client + '\' + doctype + '@!@' + docname as docparams from valantdocdump a left join ClientMaster b ON a.client = b.patientID where docname not like '%.sig'">
	</asp:SqlDataSource>
	

</asp:Content>