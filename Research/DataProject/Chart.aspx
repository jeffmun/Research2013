<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="Chart.aspx.cs" Inherits="DataProject_Chart" 
	 EnableEventValidation="false" Title="Data Project Charts"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v17.2.Web, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraPdfViewer.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraPdfViewer" TagPrefix="dx" %> 



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<%--<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> --%>

	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-ui.min.js"></script>

	<style type="text/css">
		div[class*="dxchartsuiTooltip"] {
			padding: 8px;
		}
		/*div[class*="dxchartsuiTooltip"] img {
			width: 90px;
		}*/
	</style>


</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>



		<script type="text/javascript">
			var lastDataProject = null;
			var lastFile = null;
			var lastDataSheet = null;
			function OnDataProjectChanged(gridDataProject) {
				if (gridFile.InCallback())
					lastDataProject = gridDataProject.GetValue().toString();
				else {
					var currproject = gridDataProject.GetValue().toString();
					callbackFile.PerformCallback(currproject);
				}
			}
			function OnFileChanged(gridFile) {
				btnViewData.SetEnabled(true);
				if (gridFile.InCallback())
					lastFile = gridFile.GetValue().toString();
				else {
					var currfile = gridFile.GetValue().toString();
					callbackDataSheets.PerformCallback(currfile);
					callbackVars.PerformCallback(currfile);
				}
			}

			function OnDataSheetChanged(gridDataSheets) {
				txtFilter.SetText("");
				if (gridDataSheets.InCallback())
					lastDataSheet = gridDataSheets.GetValue().toString();
				else {
					var currdatasheet = gridDataSheets.GetValue().toString();
					callbackVars.PerformCallback(currdatasheet);
				}
				callbackVarLabels.PerformCallback();
			}


			function OnVarsNumChanged(s, e) {
				btnCreateCharts.SetEnabled(true);
				btnViewData.SetEnabled(true);
				

				callbackVarLabels.PerformCallback();
			}


			function OnVarsTextChanged(s, e) {
				var grid = s.GetGridView();
				var seltext = grid.GetSelectedFieldValues("varname", RefreshSelectedVars);
				callbackVarLabels.PerformCallback();
			}

			function OnVarsDateChanged(s, e) {
				var grid = s.GetGridView();
				var seltext = grid.GetSelectedFieldValues("varname", RefreshSelectedVars);
				callbackVarLabels.PerformCallback();
			}
			function OnVarsAgeChanged(s, e) {
				var grid = s.GetGridView();
				var seltext = grid.GetSelectedFieldValues("varname", RefreshSelectedAgeVars);
				callbackVarLabels.PerformCallback();
			}


			function RefreshSelectedAgeVars(selectedVals) {
				RefreshSelectedVars2(selectedVals, cboXaxisvar);
			}


			function RefreshSelectedVars(selectedVals) {
				RefreshSelectedVars2(selectedVals, cboXaxisvar);
				RefreshSelectedVars2(selectedVals, cboColorsvar);
				RefreshSelectedVars2(selectedVals, cboPanelvar);
			}


			function RefreshSelectedVars2(selectedVals, cbo) {

				var nitems = cbo.GetItemCount(); 
				//Remove all Data: items
				for (var i = nitems - 1; i > 0; i--) {
					var text = cbo.GetItem(i).text;
					if (text.startsWith("Data:")) {
						cbo.RemoveItem(i);
					}
				}

				if (selectedVals.length == 0) return;

				//Add back the selected vars
				for (j = 0; j < selectedVals.length; j++) {
					cbo.AddItem("Data: " + selectedVals[j], selectedVals[j]);
				}
			}




			function onGetRowValues(val) {
				var foo = val;
			}

			function OnEndCallbackFile(s, e) {
				if (lastDataProject) {
					//callbackFile.PerformCallback(lastDataProject);
					lastDataProject = null;
				}
			}

			function btnCreateCharts_ClientClick() {
				var varxaxis= cboXaxisvar.GetValue();
				var varcolors = cboColorsvar.GetValue();
				var varpanel = cboPanelvar.GetValue();

				var params = varxaxis + "," + varcolors + "," + varpanel;

				callbackViewData.SetVisible(false);
				callbackMissing.SetVisible(false);
				callbackCharts.SetVisible(true);

				callbackCharts.PerformCallback(params);
			}

			function btnFilter_ClientClick() {
				var filtertext = "filter!" + txtFilter.GetValue();
				callbackVars.PerformCallback(filtertext);
			}

			function btnViewData_ClientClick() {

				callbackCharts.SetVisible(false);
				callbackMissing.SetVisible(false);
				callbackViewData.SetVisible(true);
				callbackViewData.PerformCallback("foo1");
			}

			function btnViewMissing_ClientClick() {

				callbackCharts.SetVisible(false);
				callbackViewData.SetVisible(false);
				callbackMissing.SetVisible(true);
				callbackMissing.PerformCallback("foo2");
			}




			function btnViewSettings_ClientClick() {
				if (tabSettings.GetVisible() == true) {
					tabSettings.SetVisible (false);
					btnViewSettings.SetText("Show Settings");
				}
				else if (tabSettings.GetVisible() == false) {
					tabSettings.SetVisible (true);
					btnViewSettings.SetText("Hide Settings");
				}
			}

			//function ColorChangedHandler(s, e) {
			//    CallbackPanel.PerformCallback();
			//}

			function OnChangeWhist(s, e) { var position = s.GetPosition(); lblWhist.SetText(position); }
			function OnChangeHhist(s, e) { var position = s.GetPosition(); lblHhist.SetText(position); }
			function OnChangeWscat(s, e) { var position = s.GetPosition(); lblWscat.SetText(position); }
			function OnChangeHscat(s, e) { var position = s.GetPosition(); lblHscat.SetText(position); }
			function OnChangeWbar(s, e) { var position = s.GetPosition(); lblWbar.SetText(position); }
			function OnChangeHbar(s, e) { var position = s.GetPosition(); lblHbar.SetText(position); }
			function OnChangeWline(s, e) { var position = s.GetPosition(); lblWline.SetText(position); }
			function OnChangeHline(s, e) { var position = s.GetPosition(); lblHline.SetText(position); }


			//from https://www.devexpress.com/Support/Center/Question/Details/Q102193/how-to-show-custom-data-in-the-chart-tooltip
			//function chartObjectSelected(s, e) {
			//    if (e.hitInfo.inSeriesPoint) {
			//        var selectedPoint = e.additionalHitObject;
			//        var id = selectedPoint.toolTipHint.split('~');
			//        if (id.length() > 1) {
			//            popup.Show();
			//            popup.PerformCallback("LoadById;" + id[1]);
			//        }
			//    }
			//}


	</script>

	<script>

		//function SelectionChanged_num(s, e) {
		//	gridVarsCallback.PerformCallback("foo");
		//}

	</script>

	<br /><br />


<%--	<dx:ASPxLabel ID="lbl" runat="server" Text="Select variables to plot:"></dx:ASPxLabel>--%>
	
	<table>
		<tr>
			<td>
				<dx:ASPxLabel ID="lblStep1" runat="server" ForeColor="LightGray" Font-Size="Medium" Font-Bold="true"
						Text="Step 1: Select data source"></dx:ASPxLabel>
			</td>
			<td>
				<dx:ASPxLabel ID="lblStep2" runat="server" ForeColor="LightGray" Font-Size="Medium" Font-Bold="true"
						Text="Step 2: Select variables"></dx:ASPxLabel>
			</td>
			<td>
				<dx:ASPxLabel ID="lblStep3" runat="server" ForeColor="LightGray" Font-Size="Medium" Font-Bold="true"
						Text="Step 3: Set chart specifics"></dx:ASPxLabel>
			</td>
		</tr>
		<tr>
			<%--Step 1--%>
			<td style="vertical-align: top; width: 400px">
			
				<dx:ASPxCallbackPanel ID="callbackSelectors" runat="server"  ClientInstanceName="callbackSelectors" OnCallback="callbackSelectors_OnCallback">
					<PanelCollection>
						<dx:PanelContent ID="panelcontent0" runat="server">

							<%-- OnValueChanged="gridDataProject_ValueChanged"--%>

							<dx:ASPxLabel ID="lblProjTitle" runat="server" Font-Size="Large" Font-Bold="true" Visible="false"></dx:ASPxLabel>
							<dx:ASPxGridLookup ID="gridDataProject" runat="server" KeyFieldName="dataproj_pk" NullText="Select Data Project..." Width="350px"
								 DataSourceID="SqlDataProject" EnableClientSideAPI="true" ClientInstanceName="gridDataProject">
								<ClientSideEvents ValueChanged="function(s, e) { OnDataProjectChanged(s); }" />
								<Columns>
									<dx:GridViewDataColumn FieldName="dataproj_pk" Caption="Project #" VisibleIndex="0" Width="60px"/>
									<dx:GridViewDataColumn FieldName="projTitle" Caption="Project Title" VisibleIndex="0" Width="150px"/>
								</Columns>
								<GridViewProperties>
									<SettingsBehavior EnableRowHotTrack="true" /> 
								</GridViewProperties>
							</dx:ASPxGridLookup>
					</dx:PanelContent>
				</PanelCollection>
			</dx:ASPxCallbackPanel>

				<dx:ASPxCallbackPanel ID="callbackFile" runat="server"  ClientInstanceName="callbackFile" OnCallback="callbackFile_OnCallback"  >
					<PanelCollection>
						<dx:PanelContent ID="panelcontent2" runat="server" >
							<dx:ASPxGridLookup ID="gridFile" runat="server" KeyFieldName="filename" NullText="" Width="350px"
									TextFormatString="{0}" Visible="true" Enabled="true" ClientInstanceName="gridFile" 
								 EnableClientSideAPI="true"  >  <%-- --%>
								<ClientSideEvents   ValueChanged="function(s, e) { OnFileChanged(s); }"   /> <%--  EndCallback="OnEndCallbackFiles"  --%>
								<Columns>
									<dx:GridViewDataColumn FieldName="filename" Caption="Filename" VisibleIndex="0" Width="260px"/>
									<dx:GridViewDataColumn FieldName="N_subjects" Caption="N Subjects" VisibleIndex="0" Width="70px"/>
									<dx:GridViewDataColumn FieldName="N_measures" Caption="N Measures" VisibleIndex="0" Width="70px"/>
									<dx:GridViewDataColumn FieldName="N_datarows" Caption="N Data Rows" VisibleIndex="0" Width="70px"/>
									<dx:GridViewDataColumn FieldName="N_other_datarows" Caption="N Other Data Rows" VisibleIndex="0" Width="70px"/>
									<dx:GridViewDataColumn FieldName="N_data_dups" Caption="N Other Data Rows" VisibleIndex="0" Width="70px"/>
									<dx:GridViewDataColumn FieldName="elaptime" Caption="File age" VisibleIndex="0" />
									<dx:GridViewDataColumn FieldName="created" Caption="Created" VisibleIndex="0" />
									<dx:GridViewDataColumn FieldName="createdBy" Caption="Created By" VisibleIndex="0" />

								</Columns>
								<GridViewProperties>
									<SettingsBehavior EnableRowHotTrack="true" /> 
								</GridViewProperties>
							</dx:ASPxGridLookup>

					</dx:PanelContent>
				</PanelCollection>
			</dx:ASPxCallbackPanel>

	

				<dx:ASPxCallbackPanel ID="callbackDataSheets" runat="server"  ClientInstanceName="callbackDataSheets" OnCallback="callbackDataSheets_OnCallback"  >
					<PanelCollection>
						<dx:PanelContent ID="panelcontent5" runat="server" >
							
							<dx:ASPxGridLookup ID="gridDataSheets" runat="server" KeyFieldName="sheetname" NullText="" Width="350px"
									TextFormatString="{0}" Visible="false" Enabled="true" ClientInstanceName="gridDataSheets" 
								 EnableClientSideAPI="true"  >  <%-- --%>
								<ClientSideEvents   ValueChanged="function(s, e) { OnDataSheetChanged(s); }"   /> <%--  EndCallback="OnEndCallbackFiles"  --%>
								<Columns>
									<dx:GridViewDataColumn FieldName="sheetname" Caption="Data Sheet" VisibleIndex="0" Width="260px"/>
									<dx:GridViewDataColumn FieldName="nrows" Caption="# Data Rows" VisibleIndex="1" Width="70px"/>
								</Columns>
								<GridViewProperties>
									<SettingsBehavior EnableRowHotTrack="true" /> 
								</GridViewProperties>
							</dx:ASPxGridLookup>
							
							<table>
								<tr>
									<td>
										<dx:ASPxTextBox ID="txtFilter" runat="server" Width="270px" Visible="false" NullText="Enter filter criteria here..." ClientInstanceName="txtFilter"></dx:ASPxTextBox>
									</td>
									<td>
										<dx:ASPxButton ID="btnFilter" runat="server" Text="Filter" Visible="false" Font-Size="XX-Small" 
											ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false">
											<ClientSideEvents Click="btnFilter_ClientClick" />
										</dx:ASPxButton>
									</td>
								</tr>
								<tr>
									<td colspan=2>
										<dx:ASPxLabel ID="lblFilterExample" runat="server" Visible="false" ForeColor="Silver"  ClientInstanceName="lblFilterExample"
											Text="E.g, timept='T1' AND group='ASD';  mucss >= 100;" Font-Size="XX-Small"></dx:ASPxLabel>
									</td>
								</tr>
							</table>
							

					</dx:PanelContent>
				</PanelCollection>
			</dx:ASPxCallbackPanel>
			</td>
			<%--Step 2--%>
			<td style="vertical-align: top; width: 400px">


				<dx:ASPxCallbackPanel ID="callbackVars" runat="server"  OnCallback="callbackVars_OnCallback" ClientInstanceName="callbackVars">
				<PanelCollection>
					<dx:PanelContent ID="panelcontent1" runat="server">

						<dx:ASPxLabel ID="lblSelectedDataInfo2" runat="server" Text="" ClientVisible="true" ClientInstanceName="lblSelectedDataInfo2" EncodeHtml="false" ></dx:ASPxLabel>

						<dx:ASPxGridLookup ID="gridVarsNum" runat="server" KeyFieldName="varname" NullText="Select numeric variables to plot..." Width="350px"
							   ClientInstanceName="gridVarsNum" Visible="false" Enabled="true" TextFormatString="{0}" MultiTextSeparator=","
							 SelectionMode="Multiple"  EnableClientSideAPI="true"    >
							<ClientSideEvents ValueChanged="function(s, e) { OnVarsNumChanged(s); }" />
							<Columns>
								<dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" SelectAllCheckboxMode="AllPages"/>
								<dx:GridViewDataColumn FieldName="varname" Caption="Variable" VisibleIndex="1" Width="150px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="fieldlabel" Caption="Label" VisibleIndex="2" Width="350px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="measname" Caption="Measure" VisibleIndex="3" Width="250px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
								 <dx:GridViewCommandColumn ShowClearFilterButton="true" ShowApplyFilterButton="true" VisibleIndex="4" Width="80px"/>
							</Columns>
							<GridViewProperties>
								<Settings  ShowGroupPanel="true" ShowFilterRow="true" 
									VerticalScrollBarMode="Visible" VerticalScrollableHeight="400"  />
								<SettingsPopup>
									<HeaderFilter>
										<SettingsAdaptivity Mode="OnWindowInnerWidth" />
									</HeaderFilter>
								</SettingsPopup>
								<SettingsPager Mode="ShowAllRecords" />
								<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="false"  FilterRowMode="OnClick" EnableRowHotTrack="true"   />
								

								<GroupSummary>
									<dx:ASPxSummaryItem FieldName="measname" SummaryType="Count" />
								</GroupSummary>
							</GridViewProperties>
						</dx:ASPxGridLookup>


						<dx:ASPxGridLookup ID="gridVarsText" runat="server" KeyFieldName="varname" NullText="Select text variables for grouping..." Width="350px"
							  GridViewProperties-EnableCallBacks="true" Visible="false"  Enabled="true" TextFormatString="{0}" MultiTextSeparator=","
							 SelectionMode="Multiple">
							<ClientSideEvents ValueChanged="function(s, e) { OnVarsTextChanged(s); }" />
							<Columns>
								<dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0"/>
								<dx:GridViewDataColumn FieldName="varname" Caption="Variable" VisibleIndex="1" Width="150px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="fieldlabel" Caption="Label" VisibleIndex="2" Width="350px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="measname" Caption="Measure" VisibleIndex="3" Width="250px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
							</Columns>
							<GridViewProperties>
								<Settings ShowGroupPanel="true" ShowFilterRow="true" ShowFilterRowMenu="true" ShowFilterBar="Visible"  
											VerticalScrollBarMode="Visible" VerticalScrollableHeight="400" />
								<SettingsPager Mode="ShowAllRecords" />
								<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="false"  FilterRowMode="OnClick"   />
								<%--<SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />--%>

								<GroupSummary>
									<dx:ASPxSummaryItem FieldName="measname" SummaryType="Count" />
								</GroupSummary>


							</GridViewProperties>
						</dx:ASPxGridLookup>


						<dx:ASPxGridLookup ID="gridVarsDate" runat="server" KeyFieldName="varname" NullText="Select date variables..." Width="350px"
							  GridViewProperties-EnableCallBacks="true" Visible="false" Enabled="true" TextFormatString="{0}" MultiTextSeparator=","
							 SelectionMode="Multiple">
							<ClientSideEvents ValueChanged="function(s, e) { OnVarsDateChanged(s); }" />
							<Columns>
								<dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0"/>
								<dx:GridViewDataColumn FieldName="varname" Caption="Variable" VisibleIndex="1" Width="150px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="fieldlabel" Caption="Label" VisibleIndex="2" Width="350px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="measname" Caption="Measure" VisibleIndex="3" Width="250px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
							</Columns>
							<GridViewProperties>
								<Settings ShowGroupPanel="true" ShowFilterRow="true" ShowFilterRowMenu="true" ShowFilterBar="Visible"  
											VerticalScrollBarMode="Visible" VerticalScrollableHeight="400" />
								<SettingsPager Mode="ShowAllRecords" />
								<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="false"  FilterRowMode="OnClick"   />
								<%--<SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />--%>

								<GroupSummary>
									<dx:ASPxSummaryItem FieldName="measname" SummaryType="Count" />
								</GroupSummary>


							</GridViewProperties>
						</dx:ASPxGridLookup>


						
						<dx:ASPxGridLookup ID="gridVarsAge" runat="server" KeyFieldName="varname" NullText="Select age variables..." Width="350px"
							  GridViewProperties-EnableCallBacks="true" Visible="false" Enabled="true" TextFormatString="{0}" MultiTextSeparator=","
							 SelectionMode="Multiple">
							<ClientSideEvents ValueChanged="function(s, e) { OnVarsAgeChanged(s); }" />
							<Columns>
								<dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0"/>
								<dx:GridViewDataColumn FieldName="varname" Caption="Variable" VisibleIndex="1" Width="150px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="fieldlabel" Caption="Label" VisibleIndex="2" Width="350px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="measname" Caption="Measure" VisibleIndex="3" Width="250px">
									<Settings AutoFilterCondition="Contains" />
								</dx:GridViewDataColumn>
							</Columns>
							<GridViewProperties>
								<Settings ShowGroupPanel="true" ShowFilterRow="true" ShowFilterRowMenu="true" ShowFilterBar="Visible"  
											VerticalScrollBarMode="Visible" VerticalScrollableHeight="400" />
								<SettingsPager Mode="ShowAllRecords" />
								<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="false"  FilterRowMode="OnClick"   />
								<%--<SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />--%>

								<GroupSummary>
									<dx:ASPxSummaryItem FieldName="measname" SummaryType="Count" />
								</GroupSummary>


							</GridViewProperties>
						</dx:ASPxGridLookup>





					</dx:PanelContent>
				</PanelCollection>
			</dx:ASPxCallbackPanel>

			</td>


			<%--Step 3--%>
			<td style="vertical-align: top;" rowspan="2">

				<dx:ASPxCallbackPanel ID="callbackSpecifics" runat="server"  OnCallback="callbackSpecifics_OnCallback" ClientInstanceName="callbackSpecifics">
				<PanelCollection>
					<dx:PanelContent ID="panelcontent3" runat="server">
				
								<table>
									<tr>
										<td>
											X axis:<br />
											<dx:ASPxComboBox ID="cboXaxisvar" runat="server" Caption="" ClientInstanceName="cboXaxisvar" Width="130px" EnableCallbackMode="true" DropDownRows="12" ></dx:ASPxComboBox>

										</td>
										<td>
											Colors:<br />
											<dx:ASPxComboBox ID="cboColorsvar" runat="server" Caption="" ClientInstanceName="cboColorsvar" Width="130px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" ></dx:ASPxComboBox>
										</td>
										<td>
											Panels:<br />
											<dx:ASPxComboBox ID="cboPanelvar" runat="server" Caption="" ClientInstanceName="cboPanelvar" Width="130px" EnableCallbackMode="true"  DropDownRows="12"></dx:ASPxComboBox>

										</td>
										<td style="width: 200px"></td>
										</tr>
									<tr>
										<td colspan="2">
											
											<dx:ASPxCheckBoxList ID="chkPlots" runat="server" Caption="Plots" CaptionSettings-Position="Top"  
												 RepeatColumns="3" RepeatLayout="Flow" Font-Size="9" Paddings-Padding="2px"  >
												<Items>
													<dx:ListEditItem Value="Histogram" Selected="false" />
													<dx:ListEditItem Value="Scatterplot" Selected="false" />
													<dx:ListEditItem Value="Barcharts" Selected="false" />
													<dx:ListEditItem Value="Lineplots" Selected="false" />
													<dx:ListEditItem Value="PCA" Selected="false" />
												</Items>
											</dx:ASPxCheckBoxList>
										</td>
										<td style="padding:10px">
											<dx:ASPxButton ID="btnViewSettings" ClientInstanceName="btnViewSettings" runat="server" Text="Show Settings"
												ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px">
												<Image IconID="chart_chartyaxissettings_16x16office2013"></Image>
												<ClientSideEvents Click="btnViewSettings_ClientClick" />
											</dx:ASPxButton>
										</td>
									</tr>
								</table>

								

							<br />

							<br />
							<dx:ASPxButton ID="btnCreateCharts" ClientInstanceName="btnCreateCharts" runat="server" Text="Create Charts"
								ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px" >
								<Image IconID="chart_chart_16x16office2013"></Image>
								<ClientSideEvents Click="btnCreateCharts_ClientClick" />
							</dx:ASPxButton>

							<dx:ASPxButton ID="btnViewData" ClientInstanceName="btnViewData" runat="server" Text="View Selected Data"
								ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px">
								<Image IconID="richedit_inserttable_16x16"></Image>
								<ClientSideEvents Click="btnViewData_ClientClick" />
							</dx:ASPxButton>
							<dx:ASPxButton ID="btnViewMissing" ClientInstanceName="btnViewMissing" runat="server" Text="Missing Data Report"
								ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px">
								<Image IconID="support_question_16x16office2013"></Image>
								<ClientSideEvents Click="btnViewMissing_ClientClick" />
							</dx:ASPxButton>
							<dx:ASPxButton ID="btnPDF" ClientInstanceName="btnPDF" runat="server" Text="Save to PDF" Visible="false"
								ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px"
								OnClick="btnPDF_OnClick">
								<Image IconID="export_exporttopdf_16x16"></Image>
<%--								<ClientSideEvents Click="btnViewMissing_ClientClick" />--%>
							</dx:ASPxButton>
							<br />
							<br /><dx:ASPxTextBox ID="txtOutputFilename" runat="server" Caption="Output filename:" Text="output" Visible="false"></dx:ASPxTextBox>

						</dx:PanelContent>
					</PanelCollection>
				</dx:ASPxCallbackPanel>
				



			</td>
		</tr>
		<tr>
			<td colspan="2">
				<dx:ASPxCallbackPanel ID="callbackVarLabels" runat="server"  OnCallback="callbackVarLabels_OnCallback" ClientInstanceName="callbackVarLabels">
					<PanelCollection>
						<dx:PanelContent ID="panelcontentVarLabels" runat="server" >
							<br />
							<dx:ASPXLabel ID="lblVarLabels" runat="server" ClientInstanceName="lblVarLabels" Text="Selected variables..." ForeColor="Gray" Font-Bold="true" Visible="false"></dx:ASPXLabel>
							<dx:ASPxGridView ID="gvSelectedVars" runat="server" ClientInstanceName="gvSelectedVars" AutoGenerateColumns="false" Visible="false"  >
								
								<Columns>
									<dx:GridViewDataColumn FieldName="measname" Caption="Measure"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="varname" Caption="Variable"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="FieldLabel" Caption="Label"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="DataType" Caption="Data Type"></dx:GridViewDataColumn>
								</Columns>
							</dx:ASPxGridView>

						</dx:PanelContent>
					</PanelCollection>
				</dx:ASPxCallbackPanel>

			</td>
		</tr>
	</table>

				

						


	<br />
	<br />



	<dx:ASPxPageControl ID="tabSettings" Width="100%" runat="server" ClientInstanceName="tabSettings" 
		CssClass="dxtcFixed" ActiveTabIndex="0" EnableHierarchyRecreation="True" EnableClientSideAPI="true" ClientVisible="false" >
		<TabPages>
			<dx:TabPage Text="Chart Settings">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl1" runat="server">

						<table>
							<tr>
								<td style="vertical-align: top">
									<dx:ASPxTrackBar ID="trkNumCols" ClientInstanceName="trkNumCols" runat="server" Caption="# Cols:"  MinValue="1" MaxValue="8" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
											Height="35" Width="100px" LargeTickInterval="1" SmallTickFrequency="1" Step="1"  EnableClientSideAPI="true" Position="4"   >
									</dx:ASPxTrackBar>

								</td>
								<td style="width: 50px"></td>
								<td>
									
							<table>
								<tr>
									<td>Colors<br /> 1 - 5:</td>
									<td><dx:ASPxColorEdit runat="server" ID="Color1" Color="#377eb8" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color2" Color="#e41a1c" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color3" Color="#4daf4a" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color4" Color="#984ea3" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color5" Color="#626567" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
								</tr>
								<tr>
									<td>Colors<br /> 6 - 10:</td>
									<td><dx:ASPxColorEdit runat="server" ID="Color6"  Color="#81d4fa" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color7"  Color="#ff7f00" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color8"  Color="#99ff00" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color9"  Color="#f781bf" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color10" Color="#BDC3C7" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
								</tr>
								<tr>
									<td>Colors<br />11 - 15:</td>
									<td><dx:ASPxColorEdit runat="server" ID="Color11" Color="#0000CC" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color12" Color="#B71C1C" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color13" Color="#145A32" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color14" Color="#311B92" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
									<td><dx:ASPxColorEdit runat="server" ID="Color15" Color="#212121" Width="30px" ClearButton-DisplayMode="Never" EnableCustomColors="true"/></td>
								</tr>
							</table>

								</td>
							</tr>
						</table>


					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="Histogram settings">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl2" runat="server">
						<br />
						<table style="padding: 5px 35px 5px 15px;">
							<tr>
								<td>
								  <table>
										<tr>
											<td>
												<b>Chart Width: </b><dx:ASPxLabel ID="lblWhist" ClientInstanceName="lblWhist" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
												<dx:ASPxTrackBar ID="trackWhist" ClientInstanceName="trackWhist" runat="server"  MinValue="100" MaxValue="1200" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
														Width="150" Height="39" Step="50" LargeTickInterval="200"  EnableClientSideAPI="true" Position="350" DragHandleToolTip="false"   >
													<ClientSideEvents PositionChanged="OnChangeWhist" />
												</dx:ASPxTrackBar>

											</td>
											<td>
												<b>Chart Height: </b><dx:ASPxLabel ID="lblHhist" ClientInstanceName="lblHhist" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
												<dx:ASPxTrackBar ID="trackHhist" ClientInstanceName="trackHhist" runat="server"  MinValue="100" MaxValue="1200" ScalePosition="LeftOrTop"  ShowChangeButtons="false" 
													Width="150" Height="39" Step="50"  LargeTickInterval="200"  EnableClientSideAPI="true" Position="350"  >
													<ClientSideEvents PositionChanged="OnChangeHhist" />
												</dx:ASPxTrackBar>

											</td>
										</tr>
									</table>
								</td>
								<td>
									<dx:ASPxComboBox ID="cboPanes" ClientInstanceName="cboPanes" runat="server" Caption="Histogram Panes" Width="140px">
										<Items>
											<dx:ListEditItem Value="horizontal" Text="Horizontal panes" Selected="true" />
											<dx:ListEditItem Value="vertical" Text="Vertical panes" />
										</Items>
									</dx:ASPxComboBox>
								</td>
								<td>
									
									<dx:ASPxTrackBar ID="trkNumBins" ClientInstanceName="trkNumBins" runat="server" Caption="# Bins:"  MinValue="0" MaxValue="40" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
											Height="35" Width="100px" LargeTickInterval="10" SmallTickFrequency="1"   Step="1"  EnableClientSideAPI="true" Position="0"   >
									</dx:ASPxTrackBar>
								</td>
								<td>
									<br />
									<dx:ASPxCheckBox ID="chkNormalcurve" runat="server" Text="Normal curve?" Checked="True"></dx:ASPxCheckBox>
									<dx:ASPxCheckBox ID="chkHistMSD" runat="server" Text="Add M +/- SD?" Checked="True"></dx:ASPxCheckBox>
								</td>
							</tr>
						</table>


						

					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="Scatterplot settings">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl3" runat="server">

						<br />
						   <table>
							<tr>
								<td style="vertical-align: top">
								  <table>
										<tr>
											<td>
												<b>Chart Width: </b><dx:ASPxLabel ID="lblWscat" ClientInstanceName="lblWscat" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
												<dx:ASPxTrackBar ID="trackWscat" ClientInstanceName="trackWscat" runat="server"  MinValue="100" MaxValue="1200" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
														Width="150" Height="39" Step="50" LargeTickInterval="200"  EnableClientSideAPI="true" Position="350" DragHandleToolTip="false"   >
													<ClientSideEvents PositionChanged="OnChangeWscat" />
												</dx:ASPxTrackBar>

											</td>
											<td>
												<b>Chart Height: </b><dx:ASPxLabel ID="lblHscat" ClientInstanceName="lblHscat" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
												<dx:ASPxTrackBar ID="trackHscat" ClientInstanceName="trackHscat" runat="server"  MinValue="100" MaxValue="1200" ScalePosition="LeftOrTop"  ShowChangeButtons="false" 
													Width="150" Height="39" Step="50"  LargeTickInterval="200"  EnableClientSideAPI="true" Position="350"  >
													<ClientSideEvents PositionChanged="OnChangeHscat" />
												</dx:ASPxTrackBar>

											</td>
										</tr>
									</table>
								</td>
								<td style="vertical-align: top">
									
									<dx:ASPxTextBox ID="txtPtsCount" runat="server" Text="15" Caption="Moving Avg - # pts:"  Width="40px" >
									<%--<MaskSettings  Mask="###" />--%>
									<ValidationSettings RegularExpression-ValidationExpression="[0-9]{1,3}" SetFocusOnError="True"
										RegularExpression-ErrorText="Enter a number."
										Display="Dynamic" ErrorTextPosition="Right" />
									</dx:ASPxTextBox>
									<br />
								</td>
								<td style="width: 30px"></td>
							</tr>
						</table>


					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="Barchart settings">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl4" runat="server">

						<br />
						<table>
							<tr>
								<td>
								  <table>
										<tr>
											<td>
												<b>Chart Width: </b><dx:ASPxLabel ID="lblWbar" ClientInstanceName="lblWbar" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
												<dx:ASPxTrackBar ID="trackWbar" ClientInstanceName="trackWbar" runat="server"  MinValue="100" MaxValue="1000" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
														Width="150" Height="39" Step="50" LargeTickInterval="200"  EnableClientSideAPI="true" Position="350" DragHandleToolTip="false"   >
													<ClientSideEvents PositionChanged="OnChangeWbar" />
												</dx:ASPxTrackBar>

											</td>
											<td>
												<b>Chart Height: </b><dx:ASPxLabel ID="lblHbar" ClientInstanceName="lblHbar" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
												<dx:ASPxTrackBar ID="trackHbar" ClientInstanceName="trackHbar" runat="server"  MinValue="100" MaxValue="1000" ScalePosition="LeftOrTop"  ShowChangeButtons="false" 
													Width="150" Height="39" Step="50"  LargeTickInterval="200"  EnableClientSideAPI="true" Position="350"  >
													<ClientSideEvents PositionChanged="OnChangeHbar" />
												</dx:ASPxTrackBar>

											</td>
										</tr>
									</table>
								</td>
								<td>

								</td>
								<td>
									<dx:ASPxCheckBox ID="chkStatsTable" runat="server" Text="Display Descriptive Stats table?" Checked="True"></dx:ASPxCheckBox>
								</td>
							</tr>
						</table>


						<br />
					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="Lineplot settings">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl5" runat="server">

						<br />
						<table>
							<tr>
								<td>
								  <table>
										<tr>
											<td>
												<b>Chart Width: </b><dx:ASPxLabel ID="lblWline" ClientInstanceName="lblWline" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
												<dx:ASPxTrackBar ID="trackWline" ClientInstanceName="trackWline" runat="server"  MinValue="100" MaxValue="1000" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
														Width="150" Height="39" Step="50" LargeTickInterval="200"  EnableClientSideAPI="true" Position="350" DragHandleToolTip="false"   >
													<ClientSideEvents PositionChanged="OnChangeWline" />
												</dx:ASPxTrackBar>

											</td>
											<td>
												<b>Chart Height: </b><dx:ASPxLabel ID="lblHline" ClientInstanceName="lblHline" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
												<dx:ASPxTrackBar ID="trackHline" ClientInstanceName="trackHline" runat="server"  MinValue="100" MaxValue="1000" ScalePosition="LeftOrTop"  ShowChangeButtons="false" 
													Width="150" Height="39" Step="50"  LargeTickInterval="200"  EnableClientSideAPI="true" Position="350"  >
													<ClientSideEvents PositionChanged="OnChangeHline" />
												</dx:ASPxTrackBar>

											</td>
										</tr>
									</table>
								</td>
								<td>

								</td>
								<td>
									<dx:ASPxCheckBox ID="chkLineMatchYaxisRange" runat="server" Text="Match Y axis range across panels?" Checked="True"></dx:ASPxCheckBox>
								</td>
								<td>
									<dx:ASPxCheckBox ID="chkLineShowLegend" runat="server" Text="Show Legend?" Checked="True"></dx:ASPxCheckBox>
								</td>
							</tr>
						</table>


						<br />
					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="PCA settings">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl6" runat="server">
						<table>
							<tr>
								<td style="vertical-align: top">
									<dx:ASPxRadioButtonList ID="rblMethod" runat="server" Caption="Method">
										<Items>
											<dx:ListEditItem Value="Center" Text="Center (mean-centered data) [same as R prcomp with: 'scale.=F']" />
											<dx:ListEditItem Value="Standardize" Text="Standardize (mean-centered & standardized data) [same as R prcomp with: 'scale.=T']" Selected="true"/>
										</Items>
									</dx:ASPxRadioButtonList>
							</tr>
						</table>

						</dx:ContentControl>
					</ContentCollection>
				</dx:TabPage>

		</TabPages>
	</dx:ASPxPageControl>



	<br />
	<br />



	
	<dx:ASPxCallbackPanel ID="callbackCharts" runat="server"  OnCallback="callbackCharts_OnCallback" ClientInstanceName="callbackCharts">
		<PanelCollection>
			<dx:PanelContent ID="panelcontent4" runat="server">
			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxCallbackPanel>


		
	<dx:ASPxCallbackPanel ID="callbackViewData" runat="server"  OnCallback="callbackViewData_OnCallback" ClientInstanceName="callbackViewData">
		<PanelCollection>
			<dx:PanelContent ID="panelcontent6" runat="server">
			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxCallbackPanel>


		<dx:ASPxCallbackPanel ID="callbackMissing" runat="server"  OnCallback="callbackMissing_OnCallback" ClientInstanceName="callbackMissing" ClientVisible="false">
		<PanelCollection>
			<dx:PanelContent ID="panelcontent7" runat="server">

				<dx:ASPxPivotGrid ID="pivotMissing" runat="server" ClientInstanceName="pivotMissing">
					<Fields>
						<dx:PivotGridField ID="fmeasname" Area="RowArea" AreaIndex="0" Caption="measname" FieldName="measname" Options-ShowTotals="true"></dx:PivotGridField>
						<dx:PivotGridField ID="fvarname" Area="RowArea" AreaIndex="1" Caption="varname" FieldName="varname" Options-ShowTotals="true"></dx:PivotGridField>

						<dx:PivotGridField ID="ftimept" Area="ColumnArea" AreaIndex="0" Caption="timept" FieldName="timept" Options-ShowTotals="true"></dx:PivotGridField>

						<dx:PivotGridField ID="fisvalid" Area="DataArea" AreaIndex="0" Caption="N valid" SummaryType="Sum" FieldName="isvalid"></dx:PivotGridField>

						<dx:PivotGridField ID="fid" Area="FilterArea" AreaIndex="0" Caption="id" FieldName="id" Options-ShowTotals="true"></dx:PivotGridField>
						<dx:PivotGridField ID="fgroup" Area="FilterArea" AreaIndex="1" Caption="group" FieldName="group" Options-ShowTotals="true"></dx:PivotGridField>
						<dx:PivotGridField ID="ftxgrp" Area="FilterArea" AreaIndex="2" Caption="txgroup" FieldName="txgrp" Options-ShowTotals="true"></dx:PivotGridField>

					</Fields>
					<OptionsPager RowsPerPage="10" ColumnsPerPage="15" AlwaysShowPager="True" >
						<Summary Visible="True" />
						<PageSizeItemSettings Visible="True">
						</PageSizeItemSettings>
					</OptionsPager>
				</dx:ASPxPivotGrid>

			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxCallbackPanel>



	<asp:UpdatePanel ID="panel" runat="server" UpdateMode="Conditional">	</asp:UpdatePanel>

	<asp:Panel ID="testpanel" runat="server" Visible="true" >	</asp:Panel>




	<asp:SqlDataSource ID="SqlDataProject" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select * from dp.DataProject where studyID=@studyID">
		 <SelectParameters>
			 <asp:SessionParameter SessionField="studyID" Name="studyID" />
		 </SelectParameters>
	 </asp:SqlDataSource> 


	<asp:SqlDataSource ID="SqlTimepoint" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select timepointID, timepoint_text from uwautism_research_backend..tbltimepoint where studyID=@studyID order by timepoint">
		 <SelectParameters>
			 <asp:SessionParameter SessionField="studyID" Name="studyID" />
		 </SelectParameters>
	 </asp:SqlDataSource> 

	
	 <asp:SqlDataSource ID="SqlGroup" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select 0 groupID, 'ALL' groupname union select groupID, groupname from uwautism_research_backend..tblgroup where studyID=@studyID order by groupname">
		 <SelectParameters>
			 <asp:SessionParameter SessionField="studyID" Name="studyID" />
		 </SelectParameters>
	 </asp:SqlDataSource> 



</asp:Content>