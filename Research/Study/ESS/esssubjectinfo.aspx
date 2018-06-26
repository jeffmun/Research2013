<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="esssubjectinfo.aspx.cs" Inherits="Study_ESS_esssubjectinfo" 
	 EnableEventValidation="false" Title="ESS Subject Info"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<%--<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> --%>

	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-ui.min.js"></script>

	<script type="text/javascript">
		function ShowDrillDown() {
			var mainElement = PivotGrid.GetMainElement();
			DrillDownWindow.ShowAtPos(ASPxClientUtils.GetAbsoluteX(mainElement), ASPxClientUtils.GetAbsoluteY(mainElement));
		}
	</script>
</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

	<input runat="server" id="ColumnIndex" type="hidden" enableviewstate="true" />
	<input runat="server" id="RowIndex" type="hidden" enableviewstate="true" />


	<table>
		<tr>
			<td style="vertical-align: top; width: 100px"><b><u>Field</u></b></td>
			<td style="vertical-align: top"><b><u>Description</u></b></td>
		</tr>
		<tr>
			<td style="vertical-align: top">T1234 Data</td>
			<td style="vertical-align: top">2 characters for each timept (T1-T4): M=Mullen, A=ADOS, -=Not collected</td>
		</tr>
	</table>

	<br />

	<dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientInstanceName="PivotGrid"
		DataSourceID="sqldata" Width="100%"  >
		<Styles>
			<CellStyle Cursor="pointer" />
		</Styles>
		<Fields>
			<dx:PivotGridField Area="RowArea" AreaIndex="0" Caption="Step1_screen" FieldName="Step1_screen" ID="fStep1_screen" Options-AllowFilter="false"  />
			<dx:PivotGridField Area="RowArea" AreaIndex="1" Caption="Step2_eval" FieldName="Step2_eval" ID="fStep2_eval" Options-AllowFilter="false" />
			<dx:PivotGridField Area="RowArea" AreaIndex="2" Caption="Step2_failreason" FieldName="Step2_failreason" ID="fStep2_failreason" Options-AllowFilter="false" />
			<dx:PivotGridField Area="RowArea" AreaIndex="3" Caption="Step3_rand" FieldName="Step3_rand" ID="fStep3_rand"  Options-AllowFilter="false"/>
			<dx:PivotGridField Area="RowArea" AreaIndex="4" Caption="txassign" FieldName="txassign" ID="ftxassign"  Options-AllowFilter="false"/>
			<dx:PivotGridField Area="RowArea" AreaIndex="5" Caption="In ESS?" FieldName="InESS" Options-AllowFilter="false"   />
			<dx:PivotGridField Area="RowArea" AreaIndex="6" Caption="Step3_ESS" FieldName="Step3_ESS" ID="fStep3_ESS"  Options-AllowFilter="false"/>
			<dx:PivotGridField Area="RowArea" AreaIndex="7" Caption="# PTP sessions" FieldName="N_PTPsessions"  Options-AllowFilter="false" Options-ShowTotals="false" />
			<dx:PivotGridField Area="RowArea" AreaIndex="8" Caption="TxHrs T2-3" FieldName="sum_CatABChrs_T2_T3"  Options-AllowFilter="false"/>
			<dx:PivotGridField Area="ColumnArea" AreaIndex="0" Caption="T1234 Data" FieldName="hasT1234" ID="fhasT1234"  Options-AllowFilter="false"/>
			<dx:PivotGridField Area="DataArea" AreaIndex="1" Caption="# subjects" FieldName="id" ID="fid" SummaryType="Count" />
		</Fields>
		<OptionsPager  RowsPerPage="50" >
			<PageSizeItemSettings Items="20, 50" ShowAllItem="true" Visible="true" ></PageSizeItemSettings>
		</OptionsPager> 
		<OptionsView ShowFilterHeaders="False" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" />
		<OptionsFilter NativeCheckBoxes="False"  />
	</dx:ASPxPivotGrid>

	 <dx:ASPxPopupControl ID="ASPxPopupControl1" Modal="true" runat="server" Height="1px" 
		AllowDragging="True" ClientInstanceName="DrillDownWindow" 
		CloseAction="CloseButton" Width="153px" HeaderText="Drill Down Window">
		<ContentCollection>
			<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
				<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridView" Width="1000px"
					OnCustomCallback="ASPxGridView1_CustomCallback" >
					<ClientSideEvents EndCallback="function(s, e) { 
							if( s.cpShowDrillDownWindow )
								GridView.SetVisible(true);
						}" />
					<Columns>
						<dx:GridViewDataTextColumn Caption="ID" FieldName="id"   />
						<dx:GridViewDataDateColumn Caption="T1234 Data" FieldName="hasT1234"/>
						<dx:GridViewDataDateColumn Caption="Study Status" FieldName="study_status"/>
						<dx:GridViewDataDateColumn Caption="Refusal code" FieldName="refusal_code"/>
						<dx:GridViewDataDateColumn Caption="Refusal Other" FieldName="refusalOth"/>
						<dx:GridViewDataDateColumn Caption="T1234 M CoIQ" FieldName="T1234mucoiq"/>
						<dx:GridViewDataDateColumn Caption="T1 DSM" FieldName="T1dsm"/>
						<dx:GridViewDataDateColumn Caption="T1 ADOS Dx" FieldName="T1_adosdata"/>
						<dx:GridViewDataDateColumn Caption="T2 DSM" FieldName="T2dsm"/>
						<dx:GridViewDataDateColumn Caption="T2 ADOS Dx" FieldName="T2_adosdata"/>
					</Columns>
					<SettingsLoadingPanel Mode="ShowOnStatusBar" />
					<Styles>
						<Header ImageSpacing="5px" SortingImageSpacing="5px" />
					</Styles>
				</dx:ASPxGridView>
			</dx:PopupControlContentControl>
		</ContentCollection>
	</dx:ASPxPopupControl>


	<br /><br />


	<br /><br />
	<b>Complete data for all 231</b>
	<dx:ASPxGridView ID="ASPxGridView2" runat="server" DataSourceID="sqldata" Width="1100px" AutoGenerateColumns="true" 
		Settings-HorizontalScrollBarMode="Auto" Settings-VerticalScrollBarMode="Auto" SettingsBehavior-AllowSelectByRowClick="true" >
		 <Settings VerticalScrollableHeight="500" ShowFilterRow="true" />
		<SettingsPager PageSize="50">
			<PageSizeItemSettings Visible="true" ShowAllItem="true" />
		</SettingsPager>

	</dx:ASPxGridView>



	<asp:SqlDataSource ID="sqldata" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" 
		SelectCommandType="Text" SelectCommand="select * from vwESS_SubjectInfo_All_withData ">
	</asp:SqlDataSource>




 


</asp:Content>


