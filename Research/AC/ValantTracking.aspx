<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="ValantTracking.aspx.cs" Inherits="AC_ValantTracking" 
	 EnableEventValidation="false" Title="Valant Tracking"%>
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

<dx:ASPxLabel ID="lbl1" runat="server" Text="Valant Tracking" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
<br />
<br />

<dx:ASPxGridView ID="grid" runat="server" DataSourceID="sqlValantTJ" AutoGenerateColumns="false" KeyFieldName="rownames" SettingsBehavior-AllowGroup="true"
	 Settings-ShowGroupPanel="true"  Settings-VerticalScrollBarMode="Auto" Settings-VerticalScrollableHeight="650"
	 Settings-ShowHeaderFilterButton="false" Settings-ShowFilterRow="true" >
	<TotalSummary>
		<dx:ASPxSummaryItem ValueDisplayFormat="c2" FieldName="amtowed" SummaryType="Sum" />
	</TotalSummary>
	<GroupSummary>
		<dx:ASPxSummaryItem SummaryType="Sum" FieldName="amtowed"  ValueDisplayFormat="c2"  />
	</GroupSummary>
	<Columns>
		<dx:GridViewDataColumn FieldName="rownames" Caption="Num" ReadOnly="true" Width="60"></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="client" ReadOnly="true" Width="200"></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="payor" ReadOnly="true" Width="200"></dx:GridViewDataColumn>
		<dx:GridViewDataTextColumn FieldName="amtowed" ReadOnly="true" Width="80"><PropertiesTextEdit DisplayFormatString="c" /></dx:GridViewDataTextColumn>
		<dx:GridViewDataTextColumn FieldName="costperunit" ReadOnly="true" Width="80"><PropertiesTextEdit DisplayFormatString="c" /></dx:GridViewDataTextColumn>
		<dx:GridViewDataColumn FieldName="apparentunits" ReadOnly="true" Width="80"></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="dos" ReadOnly="true" Width="100"> <Settings GroupInterval="DateMonth" /></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="provider" ReadOnly="true" Width="100"><Settings GroupInterval="DateMonth" /></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="cpt" ReadOnly="true" Width="60"></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="dx" ReadOnly="false" Width="260"></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="datefrom" ReadOnly="false" Width="100"></dx:GridViewDataColumn>
		<%--<dx:GridViewDataColumn FieldName="dateto" ReadOnly="false"></dx:GridViewDataColumn>--%>
		<dx:GridViewDataColumn FieldName="status" ReadOnly="false" Width="60"></dx:GridViewDataColumn>
		<dx:GridViewDataColumn FieldName="notes" ReadOnly="false" Width="200"></dx:GridViewDataColumn>
	</Columns>
	<FormatConditions>
			<dx:GridViewFormatConditionHighlight FieldName="client" Expression="[status] is not null" Format="GreenFillWithDarkGreenText" />
		</FormatConditions>
	<Settings ShowFilterBar="Visible" ShowFooter="true"    />
	<SettingsFilterControl ViewMode="Visual"></SettingsFilterControl> 
	<SettingsEditing Mode="Batch" BatchEditSettings-StartEditAction="Click" BatchEditSettings-EditMode="Cell" ></SettingsEditing>
	<SettingsPager PageSize="20">
		 <PageSizeItemSettings Items="10,20,50,200,500,2000" Visible="true"></PageSizeItemSettings>
	</SettingsPager>
</dx:ASPxGridView>


	
	<asp:SqlDataSource ID="sqlValantTJ" runat="server" ConnectionString="<%$ ConnectionStrings:ValantTJ %>"
		SelectCommandType="text"
		SelectCommand="select rownames, payor, client, amtowed, costperunit, round(apparentunits, 2) apparentunits, dos, billed, cpt, provider, dx, datefrom, dateto, status, notes from vwValantTracking"
		UpdateCommand="update IA set status=@status, notes=@notes, updated=getdate(), updatedBy=sec.systemuser() where rownames=@rownames"	>
	</asp:SqlDataSource>
	

</asp:Content>