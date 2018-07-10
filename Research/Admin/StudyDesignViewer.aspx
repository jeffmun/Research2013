<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="StudyDesignViewer.aspx.cs" Inherits="Admin_StudyDesignViewer" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableViewState="true"></asp:ScriptManager>



	<asp:Label ID="lblTitle" runat="server" Text="Study Design:" Font-size="Medium" ></asp:Label>
	<asp:Label ID="lblStudyname" runat="server" Font-size="Medium"  Font-Bold="true"></asp:Label>



	<br />
	<br />
	<dx:ASPxButton ID="btnLoad" runat="server" Text="Reload Study Design" OnClick="btnLoad_OnClick" AutoPostBack="false" ClientInstanceName="btnLoad" />
				

					<dx:ASPxRadioButtonList ID="rblObj" runat="server" Font-Size="9" Border-BorderStyle="None" RepeatColumns="3" >
					<Items>
						<dx:ListEditItem Text="Timept, Actions BY Groups" Value="1" Selected="true" />
						<dx:ListEditItem Text="Actions BY Timept,Groups" Value="4" Selected="true" />
						<dx:ListEditItem Text="Timept, Measures BY Groups" Value="2" Selected="false" />
						<dx:ListEditItem Text="Measures BY Timept,Groups" Value="5" Selected="false" />
						<dx:ListEditItem Text="Timept, Action, Measures BY Groups" Value="3" Selected="false" />
						<dx:ListEditItem Text="Action, Measures BY Timept,Groups" Value="6" Selected="false" />
					</Items>
				</dx:ASPxRadioButtonList>

	<br />

<%--    OnDataBinding="pivotENT_DataBinding"     
	OnCustomCellDisplayText="pivotENT_CustomCellDisplayText"  OnCustomCellStyle="pivotENT_CustomCellStyle"
		OnBeginRefresh="pivotENT_OnBeginRefresh"   --%>

	<dx:ASPxPivotGrid ID="pivotENT" runat="server" DataSourceID="sql_StudyDesign"  Visible="true"  Width="95%" 
		 OnCustomSummary="pivotENT_CustomSummary"
		EnableCallbackAnimation="true">
	<Fields>
		<dx:PivotGridField FieldName="studyactionID" ID="fsaID" Caption="saID"   />
		<dx:PivotGridField FieldName="studymeasID" ID="fsmID" Caption="smID"   />
		<dx:PivotGridField FieldName="groupname" ID="fgroupname" Caption="Group"  />
		<dx:PivotGridField FieldName="timepoint_text" ID="ftimepoint_text" Caption="Timept" />                        
		<dx:PivotGridField FieldName="actiontype" ID="factiontype" Caption="Action Type" />                        
		<dx:PivotGridField FieldName="actiontext" ID="factiontext" Caption="Action" />                        
		<dx:PivotGridField FieldName="studymeasname" ID="fstudymeasname" Caption="StudyMeas" />                        
		<dx:PivotGridField FieldName="measname" ID="fmeasname" Caption="Measure" />                        
		<%--<dx:PivotGridField  FieldName="txgrp" ID="ftxgrp" Caption="TxGrp" />  --%>                      
						
	</Fields>
					
	<OptionsData DataProcessingEngine="Default"    />   <%--LockDataRefreshOnCustomCallback="true"--%>
	<OptionsFilter NativeCheckBoxes="False" />
					
	<OptionsPager  ColumnsPerPage="15"  ShowNumericButtons="false" RowsPerPage="20" >
		<PageSizeItemSettings Visible="true" ShowAllItem="true" Items="20,50,200"></PageSizeItemSettings>
	</OptionsPager>
	<OptionsView HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" 
		HorizontalScrollingMode="Standard" VerticalScrollingMode="Standard" 
		ShowColumnTotals="false" ShowRowTotals="false" ShowRowGrandTotals="false" ShowColumnGrandTotals="false" />
</dx:ASPxPivotGrid>



	<asp:SqlDataSource ID="sql_StudyDesign_A" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from vwStudyDesign_GTA where studyID=@studyID">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_StudyDesign_M" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from vwStudyDesign_GTM where studyID=@studyID">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>



</asp:Content>

