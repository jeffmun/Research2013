<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="SubjectMatrix.aspx.cs" Inherits="Track_SubjectMatrix" 
	 EnableEventValidation="false" Title="Subject Matrix"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraPdfViewer.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraPdfViewer" TagPrefix="dx" %> 



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">

</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


	<script type="text/javascript">
		function OnStudiesChanged(s, e) {
			var grid = s.GetGridView();
			var seltext = grid.GetSelectedFieldValues("studygroup", RefreshSelectedVars);
		}

		function OnStudiesChanged2(s, e) {
			var grid = s.GetGridView();
			var seltext = grid.GetSelectedFieldValues("studygroup", RefreshSelectedVars);
		}

		function ChangedMode(s,e) {
			lbl2.SetVisible(true);
			gridStudies2.SetVisible(true);
		}

		onCellPrepared: function(e) {
		$("<a />", {
			href : "http://www.devexpress.com",
			text : "Visit DevExpress"
		}).appendTo(e.cellElement);
		},

	</script>
	
	<dx:ASPxLabel ID="lbl" runat="server" Text="Subject Matrix" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
<br />

	<table>
		<tr>
			<td style="vertical-align: top; padding:10px;">
				<dx:ASPxLabel ID="lbl1" runat="server" Text ="Step 1) Subjects in:"></dx:ASPxLabel>
		<dx:ASPxGridLookup ID="gridStudies" ClientInstanceName="gridStudies"  runat="server" KeyFieldName="groupID" NullText="Select studies..." Width="350px"
				GridViewProperties-EnableCallBacks="true" Visible="false"  Enabled="true" TextFormatString="{0}" MultiTextSeparator=","
				SelectionMode="Multiple"    >
			
			<ClientSideEvents  ValueChanged="function(s, e) { OnStudiesChanged(s); }" />
			<Columns>
				<dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0"/>
				<dx:GridViewDataColumn FieldName="studygroup" Caption="Study & Group" VisibleIndex="1" Width="350px">
					<Settings AutoFilterCondition="Contains" />
				</dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="groupID" Caption="groupID" VisibleIndex="2" Width="150px" >
					<Settings AutoFilterCondition="Contains" />
				</dx:GridViewDataColumn>
			</Columns>
			<GridViewProperties>
				<Settings ShowGroupPanel="true" ShowFilterRow="false" ShowFilterRowMenu="true" ShowFilterBar="Hidden"  
							VerticalScrollBarMode="Visible" VerticalScrollableHeight="400" />
				<SettingsPager Mode="ShowAllRecords" />
				<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="false"  FilterRowMode="OnClick"   />
				<%--<SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />--%>
			</GridViewProperties>
		</dx:ASPxGridLookup>

				<br />
				<br />

			</td>

			<td style="vertical-align: top; padding:10px;">

								<dx:ASPxLabel ID="lbl2" ClientInstanceName="lbl2" runat="server" Text ="Step 2) Limit results to these other studies:"></dx:ASPxLabel>
				
		<dx:ASPxGridLookup ID="gridStudies2" ClientInstanceName="gridStudies2"  runat="server" KeyFieldName="groupID" NullText="...who are also in these studies..." Width="350px"
				GridViewProperties-EnableCallBacks="true" Visible="false"  Enabled="true" TextFormatString="{0}" MultiTextSeparator=","
				SelectionMode="Multiple"    >
			
			<ClientSideEvents  ValueChanged="function(s, e) { OnStudiesChanged2(s); }" />
			<Columns>
				<dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0"/>
				<dx:GridViewDataColumn FieldName="studygroup" Caption="Study & Group" VisibleIndex="1" Width="350px">
					<Settings AutoFilterCondition="Contains" />
				</dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="groupID" Caption="groupID" VisibleIndex="2" Width="150px" >
					<Settings AutoFilterCondition="Contains" />
				</dx:GridViewDataColumn>
			</Columns>
			<GridViewProperties>
				<Settings ShowGroupPanel="true" ShowFilterRow="false" ShowFilterRowMenu="true" ShowFilterBar="Hidden"  
							VerticalScrollBarMode="Visible" VerticalScrollableHeight="400" />
				<SettingsPager Mode="ShowAllRecords" />
				<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="false"  FilterRowMode="OnClick"   />
				<%--<SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />--%>
			</GridViewProperties>
		</dx:ASPxGridLookup>


<%--				<dx:ASPxLabel ID="lblMode" runat="server" Text =" "></dx:ASPxLabel>

				<dx:ASPxComboBox ID="cboMode" runat="server" ClientInstanceName="cboMode" Width="300" >
					<ClientSideEvents SelectedIndexChanged="ChangedMode" />
					<Items>
						<dx:ListEditItem Value="selected" Text="Return only subjects in the selected groups" Selected="true" />
						<dx:ListEditItem Value="all" Text="Return all other subjects for the selected groups" Selected="false" />
					</Items>
				</dx:ASPxComboBox>--%>
				</td>
			<td style="vertical-align: top; padding:10px;">
					<dx:ASPxButton ID="btnLoad" runat="server" ClientInstanceName="btnLoad" Text="Load Subjects" OnClick="btnLoad_Click"></dx:ASPxButton>
			</td>
		</tr>
	</table>


	<br />
	<br />

<%--                        OnDataBinding="pivotENT_DataBinding" 
					 OnCustomCellDisplayText="pivotENT_CustomCellDisplayText"  OnCustomCellStyle="pivotENT_CustomCellStyle"
					 OnBeginRefresh="pivotENT_OnBeginRefresh"  OnHtmlCellPrepared="pivotENT_OnHtmlCellPrepared"   --%>

	
					<dx:ASPxPivotGrid ID="pivotENT" runat="server"   Visible="false"  Width="95%" 
					 EnableCallbackAnimation="true"  >
						
					<Fields>
						<dx:PivotGridField  FieldName="lastname" ID="fldlastname" Caption="Last" Area="RowArea" AreaIndex="0"  />
						<dx:PivotGridField  FieldName="firstname" ID="fldfirstname" Caption="First" Area="RowArea" AreaIndex="1"  />
						<dx:PivotGridField  FieldName="sex" ID="fldsex" Caption="Sex" Area="RowArea" AreaIndex="2"/>
<%--						<dx:PivotGridField  FieldName="ethnicitydesc" ID="fldethnicitydesc" Caption="Race"  Area="RowArea"  />                        
						<dx:PivotGridField  FieldName="hispanicdesc" ID="fldhispanicdesc" Caption="Ethnicity"  Area="RowArea"  />--%>
						<%--<dx:PivotGridField  FieldName="zip" ID="fldzip" Caption="Zip"  Area="RowArea"  />--%>

						<dx:PivotGridField  FieldName="studyname" ID="fldstudyname" Caption="studyname"  Area="ColumnArea" AreaIndex="0" />
						<dx:PivotGridField  FieldName="groupname" ID="fldgroupname" Caption="groupname"  Area="ColumnArea" AreaIndex="1" />

						<dx:PivotGridField Area="DataArea" AreaIndex="0" FieldName="IDinfo" ID="fldIDinfo" Caption="ID" SummaryType="Min">
						</dx:PivotGridField>  

						<%--<dx:PivotGridField  FieldName="txgrp" ID="ftxgrp" Caption="TxGrp" />  --%>                      
						
					</Fields>
					
					<OptionsData DataProcessingEngine="Default"    />   <%--LockDataRefreshOnCustomCallback="true"--%>
					<OptionsFilter NativeCheckBoxes="False" />
					
					<OptionsPager RowsPerPage="300" ColumnsPerPage="15"  ShowNumericButtons="false" >
						<PageSizeItemSettings Visible="true" ShowAllItem="true"></PageSizeItemSettings>
					</OptionsPager>
					<OptionsView HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" 
						HorizontalScrollingMode="Standard" VerticalScrollingMode="Standard" 
						ShowColumnTotals="false" ShowRowTotals="false" ShowRowGrandTotals="false" ShowColumnGrandTotals="false" />
				</dx:ASPxPivotGrid>


	<br />
	<asp:Panel ID="panel" runat="server"></asp:Panel>

</asp:Content>