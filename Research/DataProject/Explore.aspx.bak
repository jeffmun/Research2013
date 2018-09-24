<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="Explore.aspx.cs" Inherits="
	DataProject_Explore" 
	 EnableEventValidation="false" Title="Explore Data Project"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dxch" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dxx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v17.2.Web, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxxui" %>


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<%--<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> --%>

	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-ui.min.js"></script>


</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


	<script type="text/javascript">
		function DeleteVar(s, e)
		{
			var x = s.GetRowValues(e.visibleIndex, "fldpk", UnselectVarInGrid);
		}

		function UnselectVarInGrid(key)
		{
			var grid = gridLkupVars.GetGridView();
			grid.UnselectRowsByKey(key);
		}

		function SubjsetSelectionChanged(s, e) {


			pivotSubjCallback.PerformCallback();
			//varCallback.PerformCallback();
		}
		function MeasSelectionChanged(s, e) {
			//btnLoad.SetVisible(true);

			var num = gridLkupMeas.GetGridView().GetSelectedRowCount();
			selmeas_n.SetText("(" + num + " selected)");


			//This will update the Meas pivot table
			pivotMeasCallback.PerformCallback();

			//This will bind the Vars LkupGrid
			varCallback.PerformCallback();
		}
		function VarSelectionChanged(s, e) {

			var num = gridLkupVars.GetGridView().GetSelectedRowCount();
			selvars_n.SetText("(" + num + " selected)");

			pivotVarsCallback.PerformCallback();
			//varCallback.PerformCallback();
		}

		function subjChanged() {
			var num = gridSelSubj.GetSelectedRowCount();
			selsubj_n.SetText("(" + num + " selected)");
			hideResults();
			gridSubjCallback.PerformCallback();
		}
		function measChanged() {
			var num = gridSelMeas.GetSelectedRowCount();
			selmeas_n.SetText("(" + num + " selected)");
			hideResults();
			gridMeasCallback.PerformCallback();
			gridVarsCallback.PerformCallback();
		}
		function varsChanged() {
			var num = gridSelVars.GetSelectedRowCount();
			selvars_n.SetText("(" + num + " selected)");
			hideResults();
			gridVarsCallback.PerformCallback();
		}

		function hideResults()
		{
			btnLoad.SetVisible(true);
			panelInfo.SetVisible(false);

			panelCharts.SetVisible(false);
		}

		function ShowSelected(s, e) {
			var value = s.GetChecked();
			if (value) {
				gridSelSubj.SetVisible(true);
				gridSelMeas.SetVisible(true);
				gridSelVars.SetVisible(true);
			}
			else {
				gridSelSubj.SetVisible(false);
				gridSelMeas.SetVisible(false);
				gridSelVars.SetVisible(false);
			}
		}

	</script>

	

	<dx:ASPxHiddenField ID="needBindVars" runat="server" ClientInstanceName="needBindVars">
	</dx:ASPxHiddenField>



	<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Explore Data Project" Font-Size="Medium" Font-Bold="true" ForeColor="Gray"></dx:ASPxLabel>
	<br />
	<br />

	<table>
		<tr>
			<%--    First Column with TextBoxes--%>
			<td style="width: 425px; vertical-align: top">
				<dx:ASPxLabel ID="lblTitle" runat="server" Text="Title:" Font-Size="XX-Small"></dx:ASPxLabel>
				<dx:ASPxLabel ID="txtTitle" runat="server" Width="400px" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel><br />
				<dx:ASPxButton ID="btnLoad" runat="server" Text="Load Data" OnClick="btnLoad_OnClick" ClientInstanceName="btnLoad"></dx:ASPxButton>
				<br />
				<dx:ASPxLabel ID="lblStatus" runat="server" Text=""  Font-Size="XX-Small"></dx:ASPxLabel><br />
				<dx:ASPxLabel ID="lblLoaded" runat="server" Text=""  Font-Size="XX-Small" ForeColor="DarkRed" Visible="false"></dx:ASPxLabel>
			</td>

			<%--    Second Column with Selectors--%>
			<td>
	<table>
		<tr>
			<td>
				<table>
					<tr>
						<td style="vertical-align: top">
							
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<dx:ASPxButton ID="btnSets" runat="server" Text="View Subject Sets"   ClientInstanceName="btnSets" AutoPostBack="False" Visible="false" >
								<clientsideevents click="function(s, e) {document.location.href = 'SubjSets.aspx';}"></clientsideevents>
							</dx:ASPxButton>
						</td>
						<td style="width: 100px"></td>
						<td>
							<dx:ASPxButton ID="btnEditProject" runat="server" Text="Edit this Data Project"   ClientInstanceName="btnEditProject" AutoPostBack="true" OnClick="btnEditProject_OnClick"></dx:ASPxButton>							&nbsp;&nbsp;&nbsp;&nbsp;
							<dx:ASPxButton ID="btnProjects" runat="server" Text="View Data Projects"   ClientInstanceName="btnProjects" AutoPostBack="False">
								 <clientsideevents click="function(s, e) {document.location.href = 'Index.aspx';}"></clientsideevents>
							</dx:ASPxButton>
						</td>

					</tr>
				</table>


			</td>
		</tr>
	</table>

			</td>
		</tr>
	</table>


	<br />
	<dx:ASPxCheckBox ID="chkShowSelected" runat="server" ClientInstanceName="chkShowSelected" Text="Show Selection Grids" Checked="true">
		<clientsideevents CheckedChanged="ShowSelected"></clientsideevents>
		<ClientSideEvents CheckedChanged="function(s, e) { ShowSelected(s, e); }" />
	</dx:ASPxCheckBox>
	<br />


	<table>
		<tr>
			<td style="vertical-align: top">
				<dx:ASPxCallbackPanel ID="gridSubjCallback" runat="server" OnCallback="gridSubjCallback_OnCallback" ClientInstanceName="gridSubjCallback">
					<PanelCollection>
						<dx:PanelContent ID="content2" runat="server">
							<dx:ASPxLabel ID="title_pivSubj" runat="server" Text="Subjects" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
								<dx:ASPxLabel ID="selsubj_n" ClientInstanceName="selsubj_n" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>
										<dx:ASPxButton runat="server" ID="btnExpandSubj" Visible="true" Text="+" Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true" >
											<ClientSideEvents Click="function() { gridSelSubj.ExpandAll() }" />
										</dx:ASPxButton>
										<dx:ASPxButton runat="server" ID="btnCollapseSubj" Visible="true" Text="-"  Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true"  >
											<ClientSideEvents Click="function() { gridSelSubj.CollapseAll() }" />
										</dx:ASPxButton>                                               
										<br />
										<dx:ASPxGridView ID="gridSelSubj" runat="server" KeyFieldName="subjID" ClientInstanceName="gridSelSubj">
											<ClientSideEvents SelectionChanged="subjChanged" />
											<Columns>
												<dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True"  VisibleIndex="0" />
												<dx:GridViewDataColumn Caption="ID" FieldName="id" ></dx:GridViewDataColumn>
												<dx:GridViewDataColumn Caption="Group" FieldName="Group"  GroupIndex="0" ></dx:GridViewDataColumn>
												<dx:GridViewDataColumn Caption="TxGrp" FieldName="txgrp" ></dx:GridViewDataColumn>
												<dx:GridViewDataColumn Caption="Subject Status" FieldName="subjstatus" ></dx:GridViewDataColumn>
												<dx:GridViewDataColumn Caption="Sex" FieldName="sex" ></dx:GridViewDataColumn>
												<dx:GridViewDataColumn Caption="Race" FieldName="race" Visible="false"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn Caption="Ethnicity" FieldName="ethnicity" Visible="false"></dx:GridViewDataColumn>
												<dx:GridViewCommandColumn ShowClearFilterButton="true" ShowApplyFilterButton="true" />

											</Columns>
											<Settings ShowGroupPanel="true" ShowFilterRow="true" ShowFilterRowMenu="true"   />
											<SettingsPager  PageSize="40" />
											<SettingsBehavior AllowFixedGroups="true"   AllowSort="true" AutoExpandAllGroups="false"  FilterRowMode="OnClick" />
											<GroupSummary>
												<dx:ASPxSummaryItem FieldName="timepoint_text" SummaryType="Count" />
											</GroupSummary>
											
										</dx:ASPxGridView>
						</dx:PanelContent>
					</PanelCollection>
	
				</dx:ASPxCallbackPanel>
			</td>
			<td style="vertical-align: top">

				<table>
					<tr>
						
						<td style="vertical-align: top;" >
							

						</td>
						<td style="min-width: 10px;"></td>
						<td style="vertical-align: top; width: 470px;" >
							<dx:ASPxCallbackPanel ID="gridMeasCallback" runat="server" OnCallback="gridMeasCallback_OnCallback" ClientInstanceName="gridMeasCallback">
								<PanelCollection>
									<dx:PanelContent ID="PanelContent1" runat="server">
									<table>
										<tr>
											<td style="vertical-align: top">
											<dx:ASPxLabel ID="title_pivMeas" runat="server" Text="Measures" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
											<dx:ASPxLabel ID="selmeas_n" ClientInstanceName="selmeas_n" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>
											
										<dx:ASPxButton runat="server" ID="btnExpandMeas" Visible="true" Text="+" Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true" >
											<ClientSideEvents Click="function() { gridSelMeas.ExpandAll() }" />
										</dx:ASPxButton>
										<dx:ASPxButton runat="server" ID="btnCollapseMeas" Visible="true" Text="-"  Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true"  >
											<ClientSideEvents Click="function() { gridSelMeas.CollapseAll() }" />
										</dx:ASPxButton>                                                <br />
											<%--  OnDataBinding="gridSelMeas_OnDataBinding" OnCustomButtonCallback="gridSelVars_CustomButtonCallback" OnCustomCallback="gridSelVars_OnCustomCallback" >--%>
											
											<dx:ASPxGridView ID="gridSelMeas" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridSelMeas"
												 KeyFieldName="studymeasID" >
												<ClientSideEvents SelectionChanged="measChanged" />
												<Columns>
													<dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True"  VisibleIndex="0" />
													<dx:GridViewDataColumn FieldName="TimePt" Caption="TimePt" VisibleIndex="0"  GroupIndex="0"></dx:GridViewDataColumn>
													<dx:GridViewDataColumn FieldName="StudyMeasName" Caption="StudyMeasure" VisibleIndex="1" ></dx:GridViewDataColumn>
													<dx:GridViewDataColumn FieldName="Category" Caption="Category" VisibleIndex="2"></dx:GridViewDataColumn>
													<dx:GridViewCommandColumn ShowClearFilterButton="true" ShowApplyFilterButton="true" VisibleIndex="3" />
													<dx:GridViewDataColumn FieldName="studymeasID" Caption="studymeasID" Visible="false"></dx:GridViewDataColumn>
													<dx:GridViewDataColumn FieldName="measureID" Caption="measureID" Visible="false"></dx:GridViewDataColumn>
													<dx:GridViewDataColumn FieldName="tblname" Caption="tblname" Visible="false"></dx:GridViewDataColumn>
													<dx:GridViewDataColumn FieldName="MeasName" Caption="MeasName" Visible="false"></dx:GridViewDataColumn>
												</Columns>
												<Settings ShowGroupPanel="true" ShowFilterRow="true"  ShowFilterRowMenu="true"  />
												<SettingsPager Mode="ShowAllRecords" />
												<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="false" FilterRowMode="OnClick"  />
												<Settings ShowFilterBar="Visible"  />
												<SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />
												<GroupSummary>
													<dx:ASPxSummaryItem FieldName="timepoint_text" SummaryType="Count" />
												</GroupSummary>
											</dx:ASPxGridView>

											</td>
											<td style="vertical-align: top">

											</td>
										</tr>
									</table>


									</dx:PanelContent>
								</PanelCollection>
							</dx:ASPxCallbackPanel>

						</td>
						<td style="min-width: 10px;"></td>
						<td style="vertical-align: top; min-width: 800px">

							<dx:ASPxCallbackPanel ID="gridVarsCallback" runat="server" OnCallback="gridVarsCallback_OnCallback" ClientInstanceName="gridVarsCallback">
								<PanelCollection>
									<dx:PanelContent ID="PanelContent2" runat="server">
										<dx:ASPxLabel ID="title_pivVar" runat="server" Text="Numeric Variables" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
										<dx:ASPxLabel ID="selvars_n" ClientInstanceName="selvars_n" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>
						
										<dx:ASPxButton runat="server" ID="btnExpandVars" Visible="true" Text="+" Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true" >
											<ClientSideEvents Click="function() { gridSelVars.ExpandAll() }" />
										</dx:ASPxButton>
										<dx:ASPxButton runat="server" ID="btnCollapseVars" Visible="true" Text="-"  Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true"  >
											<ClientSideEvents Click="function() { gridSelVars.CollapseAll() }" />
										</dx:ASPxButton>

										<br />

										<dx:ASPxGridView ID="gridSelVars" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridSelVars"
											  KeyFieldName="fldpk" >
											<ClientSideEvents SelectionChanged="varsChanged" />
											<Columns>
												<dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True"  VisibleIndex="0"/>
												<dx:GridViewDataColumn FieldName="measname" Caption="Measure" VisibleIndex="2" GroupIndex="0"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="fldname" Caption="Variable" VisibleIndex="0"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="fieldlabel" Caption="Label" VisibleIndex="1"></dx:GridViewDataColumn>
												 <dx:GridViewCommandColumn ShowClearFilterButton="true" ShowApplyFilterButton="true" VisibleIndex="3" />
												<%--<dx:GridViewDataColumn FieldName="fldpk" Caption="fldpk" Visible="false"></dx:GridViewDataColumn>--%>
											</Columns>
											<Settings ShowGroupPanel="true" ShowFilterRow="true" ShowFilterRowMenu="true" />
											<SettingsPager Mode="ShowAllRecords" />
											<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="false"  FilterRowMode="OnClick"   />
											<Settings ShowFilterBar="Visible"  />
											<SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />

											<GroupSummary>
												<dx:ASPxSummaryItem FieldName="measname" SummaryType="Count" />
											</GroupSummary>
										</dx:ASPxGridView>

									</dx:PanelContent>
								</PanelCollection>
							</dx:ASPxCallbackPanel>
						</td>

					</tr>

				</table>




			</td>
		</tr>
	</table>

	<asp:Literal ID="lblDataInfo" runat="server"></asp:Literal>

	<dx:ASPxPanel ID="panelInfo" runat="server" ClientVisible ="false" ClientInstanceName="panelInfo">
	<PanelCollection>
		<dx:PanelContent>
			<br /><br />
			<table>
				<tr>
					<td style="vertical-align: top">
						<dx:ASPxLabel ID="lblLoadedDataInfo" runat="server" Text =""></dx:ASPxLabel><br />
						<dx:ASPxGridView ID="gridInfoMsg" runat="server" AutoGenerateColumns="true"  Visible="true"  Width="702px">
							<Columns>
								<dx:GridViewDataColumn Caption="Measure" FieldName="Measure" Width="200px"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn Caption="# Subjs" FieldName="N_IDs" Width="55px"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn Caption="# TPs" FieldName="N_TimePts" Width="50px"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn Caption="# Recs" FieldName="N_Records" Width="50px"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn Caption="# Vars" FieldName="N_Vars" Width="50px"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn Caption="Message" FieldName="Message" Width="400px"></dx:GridViewDataColumn>
							</Columns>
							<Settings HorizontalScrollBarMode="Auto" />
						</dx:ASPxGridView>
					</td>
					<td style="width: 20px"></td>
					<td style="vertical-align: top">
						
						<br />
						<table>
							<tr>
								<td style="vertical-align: top; width: 150px;">
									<dx:ASPxCheckBox ID="chkOpt_hist" runat="server" Text="Histograms"  />
								</td>
								<td style="vertical-align: central; width: 30px;"><dx:ASPxLabel ID="lblby" runat="server" Text="By:"></dx:ASPxLabel></td>
								<td style="vertical-align: central">
									<dx:ASPxComboBox ID="cboHistLevels" runat="server" >
										<Items>
											<dx:ListEditItem Value="group" Text="Group" Selected="True"/>
											<dx:ListEditItem Value="txgrp" Text="TxGrp" Selected="false"/>
											<dx:ListEditItem Value="sex" Text="Sex" Selected="false"/>
											<dx:ListEditItem Value="none" Text="-None-" Selected="false"/>
										</Items>
									</dx:ASPxComboBox>
								</td>
							</tr>
							<tr>
								<td colspan="3"><dx:ASPxCheckBox ID="chkOpt_desc" runat="server" Text="Descriptives tables (M, SD, N, etc.)"  /></td>
							</tr>
							<tr>
								<td colspan="3"><dx:ASPxCheckBox ID="chkOpt_miss" runat="server" Text="Data Counts table (assess missingness)"  /></td>
							</tr>
							<tr>
								<td colspan="3"><dx:ASPxCheckBox ID="chkOpt_data" runat="server" Text="Stacked Data Table (1 row per var)"  /></td>
							</tr>
							<tr>
								<td colspan="3"><dx:ASPxCheckBox ID="chkOpt_data_wide1" runat="server" Text="Wide Data Table (1 row per Subject per TimePt)"  /></td>
							</tr>
						</table>
<%--						<dx:ASPxCheckBoxList ID="chkOptions" runat="server" >
							<Items>
								<dx:ListEditItem Value="Hist" Text="Histograms" />
								<dx:ListEditItem Value="Desc" Text="Descriptives tables (M, SD, N, etc.)" />
								<dx:ListEditItem Value="Miss" Text="(in progress: Missing data table)" />
								<dx:ListEditItem Value="Miss" Text="(in progress: Vars over time)" />
							</Items>
						</dx:ASPxCheckBoxList>--%>

						<br />
						<br />
						<dx:ASPxButton ID="btnGetStats" runat="server" Text="Load Selected Statistics" OnClick="btnGetStats_OnClick" AutoPostBack="false"></dx:ASPxButton>
						<dx:ASPxButton ID="btnXLSX" runat="server" Text="Save XLSX" OnClick="btnXLSX_OnClick"></dx:ASPxButton>

					</td>
					</tr>
				</table>


		</dx:PanelContent>
	</PanelCollection>
	</dx:ASPxPanel>

	<dx:ASPxGridView ID="gridData" runat="server" AutoGenerateColumns="true"  Visible="false">
		<Settings HorizontalScrollBarMode="Auto" />
	</dx:ASPxGridView>
	

	<table>
		<tr>
			<td style="vertical-align: top">
				<dx:ASPxPanel ID="panelCharts" runat="server" ClientInstanceName="panelCharts"></dx:ASPxPanel>
			</td>
<%--			<td style="vertical-align: top">
				<dx:ASPxPanel ID="panelCharts2" runat="server" ClientInstanceName="panelCharts2"></dx:ASPxPanel>
			</td>--%>
		</tr>
	</table>

	<br />
	<br />


	 <dx:ASPxSplitter ID="splitter1" runat="server" Height="850px" Width="95%" ClientInstanceName="splitter1" ClientVisible="false">
		<Panes>
			<dx:SplitterPane ScrollBars="Auto" ShowCollapseBackwardButton="True">
				<ContentCollection>
					<dx:SplitterContentControl ID="SplitterContentControl1" runat="server">

						
						<dx:ASPxPanel ID="panelDescStats" runat="server" ClientInstanceName="panelDescStats" ClientVisible="false">
							<PanelCollection>
								<dx:PanelContent>
									<dx:ASPxLabel ID="lblp1" runat="server" Text="(Right-click for additional pivot table controls)" Font-Size="xx-small" ForeColor="SkyBlue"></dx:ASPxLabel>
									<dx:ASPxPivotGrid ID="pivotDescStats" runat="server" Height="800" 
										OnCustomChartDataSourceData="pivotDescStats_OnCustomChartDataSourceData"
										OptionsView-ShowColumnGrandTotals="true"
										OptionsView-ShowRowTotals="false"
										OptionsView-ShowRowGrandTotals="false" >
										<Fields>
											<dx:PivotGridField FieldName="Value" Area="DataArea" SummaryType="Average" Caption="M" CellFormat-FormatString="f2" CellFormat-FormatType="Numeric"></dx:PivotGridField>
											<dx:PivotGridField FieldName="Value" Area="DataArea" SummaryType="StdDev" Caption="SD" CellFormat-FormatString="f2" CellFormat-FormatType="Numeric"></dx:PivotGridField>
											<dx:PivotGridField FieldName="Value" Area="DataArea" SummaryType="Count" Caption="N"></dx:PivotGridField>
											<dx:PivotGridField FieldName="Value" Area="DataArea" SummaryType="Min" Caption="Min" Visible="false"></dx:PivotGridField>
											<dx:PivotGridField FieldName="Value" Area="DataArea" SummaryType="Max" Caption="Max" Visible="false"></dx:PivotGridField>
											<dx:PivotGridField FieldName="Variable" Area="RowArea"></dx:PivotGridField>
											<dx:PivotGridField FieldName="timept" Area="RowArea" Caption="TimePt"></dx:PivotGridField>
											<dx:PivotGridField FieldName="group" Caption="Group" Area="FilterArea"></dx:PivotGridField>
											<dx:PivotGridField FieldName="txgrp" Caption="TxGrp" Area="FilterArea"></dx:PivotGridField>
											<dx:PivotGridField FieldName="sex" Caption="Sex" Area="FilterArea"></dx:PivotGridField>
										</Fields>
										<OptionsView HorizontalScrollBarMode="Auto" HorizontalScrollingMode="Standard"
											 VerticalScrollBarMode="Auto" VerticalScrollingMode="Standard"/>
										<OptionsPager RowsPerPage="0"></OptionsPager>
									</dx:ASPxPivotGrid>
												</dx:PanelContent>
							</PanelCollection>
						</dx:ASPxPanel>

						</dx:SplitterContentControl>
				</ContentCollection>
			</dx:SplitterPane>
			<dx:SplitterPane ScrollBars="Auto"  Size="650px"  >
				<ContentCollection>
					<dx:SplitterContentControl ID="SplitterContentControl2" runat="server">
						<dx:ASPxPanel ID="panelDescStatsCharts" runat="server" ClientInstanceName="panelDescStatsCharts" ClientVisible="false">
							<PanelCollection>
								<dx:PanelContent>
								</dx:PanelContent>
							</PanelCollection>
						</dx:ASPxPanel>
						</dx:SplitterContentControl>
				</ContentCollection>
			</dx:SplitterPane>
		</Panes>
	</dx:ASPxSplitter>



	<br />
	<br />

					<dx:ASPxPanel ID="panelMissing" runat="server" ClientInstanceName="panelMissing" ClientVisible="false">
		<PanelCollection>
			<dx:PanelContent>
				<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="(Right-click for additional pivot table controls)" Font-Size="xx-small" ForeColor="SkyBlue"></dx:ASPxLabel>
				<dx:ASPxPivotGrid ID="pivotMissing" runat="server" Width="98%"
					OptionsView-ShowColumnGrandTotals="false"
					OptionsView-ShowRowTotals="false"
					OptionsView-ShowRowGrandTotals="false" >
					<Fields>
						<dx:PivotGridField FieldName="Value" Area="DataArea" SummaryType="Count" Caption="N"></dx:PivotGridField>
						<dx:PivotGridField FieldName="Variable" Area="FilterArea"></dx:PivotGridField>
						<dx:PivotGridField FieldName="timept" Area="RowArea" Caption="TimePt"></dx:PivotGridField>
						<dx:PivotGridField FieldName="id" Caption="ID" Area="ColumnArea"></dx:PivotGridField>
						<dx:PivotGridField FieldName="group" Caption="Group" Area="FilterArea"></dx:PivotGridField>
						<dx:PivotGridField FieldName="txgrp" Caption="TxGrp" Area="FilterArea"></dx:PivotGridField>
					</Fields>
					<OptionsView HorizontalScrollBarMode="Auto" HorizontalScrollingMode="Standard"
						 VerticalScrollBarMode="Auto" VerticalScrollingMode="Standard"/>
					
				</dx:ASPxPivotGrid>

			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxPanel>


	<br />
	<br />

	<dx:ASPxPanel ID="panelData" runat="server" ClientInstanceName="panelData" ClientVisible="false">
		<PanelCollection>
			<dx:PanelContent>
				<dx:ASPxGridView ID="gridStackedData" runat="server" AutoGenerateColumns="true" >
					<Settings HorizontalScrollBarMode="Auto" ShowFilterRow="true" AutoFilterCondition="Contains"  ShowFilterRowMenu="true" ShowFilterRowMenuLikeItem="true"  ShowStatusBar="Visible"  />
					<SettingsBehavior AllowDragDrop="False" EnableRowHotTrack="True" />
					<SettingsPager NumericButtonCount="3"  PageSize="30" Summary-Visible="true" />
				</dx:ASPxGridView>

			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxPanel>

		<dx:ASPxPanel ID="panelDataWide1" runat="server" ClientInstanceName="panelDataWide1" ClientVisible="false">
		<PanelCollection>
			<dx:PanelContent>
				<dx:ASPxGridView ID="gridWide1Data" runat="server" AutoGenerateColumns="true" OnDataBound="gridWide1Data_OnDataBound"   Width="95%" >
					<Settings HorizontalScrollBarMode="Auto" ShowFilterRow="true" AutoFilterCondition="Contains"  
						ShowFilterRowMenu="true" ShowFilterRowMenuLikeItem="true"  ShowStatusBar="Visible" 
						  />
					<SettingsBehavior AllowDragDrop="False" EnableRowHotTrack="True"  />
					<SettingsPager NumericButtonCount="5"  PageSize="20"  Summary-Visible="true" />
					<SettingsExport EnableClientSideExportAPI="true"    />
					 <Toolbars>
					<dx:GridViewToolbar EnableAdaptivity="true">
						<Items>
							<dx:GridViewToolbarItem Command="ExportToXls"  />
							<dx:GridViewToolbarItem Command="ExportToXlsx" />
							<dx:GridViewToolbarItem Command="ExportToCsv" />
						</Items>
					</dx:GridViewToolbar>
				</Toolbars>
				</dx:ASPxGridView>

			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxPanel>



	<br />
	<br />

</asp:Content>

   
