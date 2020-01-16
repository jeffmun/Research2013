<%@ Page 
    Language="C#" 
    Debug="true"  
    MasterPageFile="~/UWAC.master"  
    AutoEventWireup="true" 
    CodeFile="ValantTJ.aspx.cs" 
    Inherits="AC_ValantTJ" 
    EnableEventValidation="false" 
    Title="Valant Transaction Journal"%>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 

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

<dx:ASPxLabel ID="lbl1" runat="server" Text="Valant Transaction Journal" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
<br />
<br />
<dx:ASPxLabel ID="lblPerm" runat="server" Text="You do not have permission for this page." Font-Size="Medium" Font-Bold="false"></dx:ASPxLabel>


<dx:ASPxGridView 
    ID="grid" 
    runat="server" 
    DataSourceID="sqlValantTJ" 
    AutoGenerateColumns="false" 
    KeyFieldName="rownames" 
    SettingsBehavior-AllowGroup="true"
	Settings-ShowGroupPanel="true"  
    Settings-VerticalScrollBarMode="Auto" 
    Settings-VerticalScrollableHeight="650"
	Settings-ShowHeaderFilterButton="false" 
    Settings-ShowFilterRow="true"  
	OnRowUpdating="grid_RowUpdating" 
    SettingsEditing-Mode="Inline"
    Width ="100%">
        <Toolbars>
            <dx:GridViewToolbar>
                <Items>
                    <dx:GridViewToolbarItem Command="ShowCustomizationWindow" />
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>
	<Columns>

        <dx:GridViewCommandColumn ShowEditButton="true" Width="60"></dx:GridViewCommandColumn>   
        <dx:GridViewDataColumn FieldName="rownames" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="Comments" ReadOnly="false" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="PatientId" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="PatientName" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="GuarantorName" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="BillingId" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="TimeRecordAdded" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="ChargeDateOfService" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="PayorAdjDate" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="ProviderId" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="SuperviseeProviderId" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="FacilityId" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="Dx1ICDCode" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="Modifier1" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="DetailTransactionCodeId" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="DetailTransactionCodeDescription" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="CPTCode" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="Units" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="PaymentFrom" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="DetailTotalAmount" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="FeeScheduleAdjustment" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="FeeScheduleChargeorRate" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="ChargeNote" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="DetailNote" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="Textbox210" ReadOnly="true" ></dx:GridViewDataColumn>
        <dx:GridViewDataColumn FieldName="InsuranceName" ReadOnly="true" ></dx:GridViewDataColumn>


<%--		<dx:GridViewDataHyperLinkColumn 
            FieldName="docparams" 
            PropertiesHyperLinkEdit-EnableClientSideAPI="true"
			PropertiesHyperLinkEdit-NavigateUrlFormatString="~/Documents/WebdocFileHandler.ashx?file={0}&mode=valant"  
            PropertiesHyperLinkEdit-TextField="docname" 
            PropertiesHyperLinkEdit-Target="_blank" >
		</dx:GridViewDataHyperLinkColumn>--%>


	</Columns>

	<Settings ShowFilterBar="Visible" ShowFooter="true" ShowGroupPanel="True"  />
   
   <SettingsLoadingPanel Mode="ShowOnStatusBar" />
   <SettingsBehavior EnableCustomizationWindow="true" />
	<SettingsFilterControl ViewMode="Visual"></SettingsFilterControl> 
	<SettingsPager PageSize="20">
		 <PageSizeItemSettings Items="10,20,50,200,500,2000" Visible="true"></PageSizeItemSettings>
	</SettingsPager>
</dx:ASPxGridView>

	<asp:SqlDataSource 
        ID="sqlValantTJ" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:ValantTJ %>"
		SelectCommandType="text"
        SelectCommand="select
             [rownames]
            ,[Comments]
            ,[PatientId]
            ,[PatientName]
            ,[GuarantorName]
            ,[BillingId]
            ,[TimeRecordAdded]
            ,[ChargeDateOfService]
            ,[PayorAdjDate]
            ,[ProviderId]
            ,[SuperviseeProviderId]
            ,[FacilityId]
            ,[Dx1ICDCode]
            ,[Modifier1]
            ,[DetailTransactionCodeId]
            ,[DetailTransactionCodeDescription]
            ,[CPTCode]
            ,[Units]
            ,[PaymentFrom]
            ,[DetailTotalAmount]
            ,[FeeScheduleAdjustment]
            ,[FeeScheduleChargeorRate]
            ,[ChargeNote]
            ,[DetailNote]
            ,[Textbox210]
            ,[InsuranceName]
        FROM [dbo].[ValantTJ]">
    
    </asp:SqlDataSource>
	
</asp:Content>