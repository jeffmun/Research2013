<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="AnalysisSession.aspx.cs" Inherits="DataProject_AnalysisSession" 
	 EnableEventValidation="false" Title="Data Project Analysis Session"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v19.2.Web, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraPdfViewer.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraPdfViewer" TagPrefix="dx" %> 



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<%--<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> --%>

	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-ui.min.js"></script>

</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

	<script type="text/javascript">
		
			function btnExportDocx_ClientClick() {

				callbackCharts.PerformCallback("Docx");
				callbackOrders.PerformCallback();
			}

		function switchMode() {
			var x = rblMode.GetSelectedItem();

			 if(x.value == "Slider"){
				 imageSlider.SetVisible(true);
				 imageGallery.SetVisible(false);
			 } else {
				 imageSlider.SetVisible(false);
				 imageGallery.SetVisible(true);
				}
		}

	</script>

		<table>
		<tr>
			<td style="width: 500px; vertical-align: top; padding: 5px">
			<dx:ASPxLabel ID="lbl1" runat="server" Text="Analysis Session" Font-Bold="true" Font-Size="Small" ForeColor="Gray"></dx:ASPxLabel>
			<br />
			<dx:ASPxLabel ID="lbltitle" runat="server" Text="" Font-Bold="true" Font-Size="Medium" EncodeHtml="false"></dx:ASPxLabel>
			</td>
			<td style="width: 100px; vertical-align: top; padding: 5px">
				<dx:ASPxRadioButtonList ID="rblMode" runat="server" ClientInstanceName="rblMode" AutoPostBack="false">
					<ClientSideEvents SelectedIndexChanged="switchMode" />
					<Items>
						<dx:ListEditItem Value="Slider" Selected="true" />
						<dx:ListEditItem Value="Gallery" />
					</Items>
				</dx:ASPxRadioButtonList>
			   </td>
			<td style="width: 100px; vertical-align: top; padding: 5px">
				<dx:ASPxButton ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Text="Refresh">
					<Image IconID="actions_refresh_32x32"></Image>
				</dx:ASPxButton>
			</td>
			<td style="width: 180px; vertical-align: top; padding: 5px">
				<dx:ASPxButton ID="btnExportWord" ClientInstanceName="btnExportWord" runat="server" Width="150px"
					Text="Export to Word (.docx)" Wrap="true" OnClick="btnExportWord_OnClick"
					ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px" 
					>
					<Image IconID="export_exporttodocx_32x32"></Image>
			<%--		<ClientSideEvents Click="btnExportDocx_ClientClick" />--%>
				</dx:ASPxButton>

			</td>
		</tr>
	</table>


	<table>
		<tr>
			<td style="vertical-align: top; padding: 10px;">
				<dx:ASPxGridView ID="gridplots" runat="server" KeyFieldName="index" Caption="Plots" SettingsDataSecurity-AllowEdit="true">
					<Columns>
						<dx:GridViewDataColumn FieldName="index" ReadOnly="true"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="filename" ReadOnly="true"></dx:GridViewDataColumn>
						<dx:GridViewDataMemoColumn FieldName="notes"></dx:GridViewDataMemoColumn>
						<dx:GridViewCommandColumn ShowEditButton="true" ShowDeleteButton="true"></dx:GridViewCommandColumn>

					</Columns>
				</dx:ASPxGridView>

			</td>
			<td style="vertical-align: top; padding: 10px;">
				<dx:ASPxGridView ID="gridtables" runat="server" KeyFieldName="index" Caption="Text Output" SettingsDataSecurity-AllowEdit="true">
					<Columns>
						<dx:GridViewDataColumn FieldName="index" ReadOnly="true"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="filename" ReadOnly="true"></dx:GridViewDataColumn>
						<dx:GridViewDataMemoColumn FieldName="type"></dx:GridViewDataMemoColumn>
						<dx:GridViewCommandColumn ShowEditButton="true" ShowDeleteButton="true"></dx:GridViewCommandColumn>

					</Columns>
				</dx:ASPxGridView>

			</td>
		</tr>
	</table>


	<dx:ASPxCallbackPanel ID="callbackPix" ClientInstanceName="callbackPix" runat="server">
		<PanelCollection>
			<dx:PanelContent>
				<dx:ASPxImageSlider ID="imageSlider" ClientInstanceName="imageSlider" runat="server" Width="95%" 
					BackColor="LightGray" Styles-ImageArea-BackColor="LightGray" ></dx:ASPxImageSlider>

				 <dx:ASPxImageGallery ID="imageGallery" ClientInstanceName="imageGallery" runat="server" Width="95%" Layout="Flow" ClientVisible="false">
					 <SettingsFlowLayout ItemsPerPage="12" />
				 </dx:ASPxImageGallery>
				
			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxCallbackPanel>


	
	<dx:ASPxCardView ID="cardview" runat="server" ClientInstanceName="cardview" Width="95%" KeyFieldName="index" >
		<Columns>
			<dx:CardViewColumn FieldName="index"></dx:CardViewColumn>
			<dx:CardViewMemoColumn FieldName="contents" PropertiesMemoEdit-EncodeHtml="false"></dx:CardViewMemoColumn>
		</Columns>
		 <SettingsPager Mode="EndlessPaging" SettingsTableLayout-ColumnCount="2" />
	</dx:ASPxCardView>


	<dx:ASPxPanel ID="panel" runat="server" ClientInstanceName="panel"></dx:ASPxPanel>

	</asp:Content>