<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="Explore.aspx.cs" Inherits="DataProject_Explore" 
	 EnableEventValidation="false" Title="Explore Data Project"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraPdfViewer.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraPdfViewer" TagPrefix="dx" %> 



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<%--<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> --%>

	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-ui.min.js"></script>

	<style type="text/css">
		div[class*="dxchartsuiTooltip"] {
		div[class*="dxchartsuiTooltip"] {
			padding: 8px;
		}
		/*div[class*="dxchartsuiTooltip"] img {
			width: 90px;
		}*/
	</style>

	<style type="text/css">
	 .pivotCell
		{
		  padding: 10px;
		  vertical-align: top;
		}
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
				
				if (gridFile.InCallback())
					lastFile = gridFile.GetValue().toString();
				else {
					var currfile = gridFile.GetValue().toString();
					
					callbackDataSheets.PerformCallback(currfile);  //File changed so refresh the data sheets

				}

				callbackOutput.PerformCallback("clear");
			}
			//function gridFile_OnEndCallback(s, e) {
			//	//File has been loaded so now load the "Data" sheet
   //             //callbackSelectedDataInfo.PerformCallback("Data");
   //         }




			function OnDataSheetChanged(gridDataSheets) {
				txtFilter.SetText("");
				if (gridDataSheets.InCallback()) {
					lastDataSheet = gridDataSheets.GetValue().toString();
					alert("inCallback gridDataSheets");
				}
				else {
					var currdatasheet = gridDataSheets.GetValue().toString();

					callbackSelectedDataInfo.PerformCallback(currdatasheet);    //update the data info

					//callbackVars.PerformCallback(currdatasheet);        //Data sheet changed so refresh the vars
					callbackVars.PerformCallback("all");        //Data sheet changed so refresh the vars

					callbackVars.SetVisible(true);
					callbackFilter.SetVisible(true);
					callbackSelectedDataInfo.SetVisible(true);
				}
				callbackSelectVarInfo.PerformCallback("clear");
				callbackOutput.PerformCallback("clear");
			}

			function btnFilter_ClientClick() {
				var currdatasheet = gridDataSheets.GetValue().toString();
				//var filtertext = "filter!" + txtFilter.GetValue();
				callbackFilter.PerformCallback(currdatasheet);
				callbackSelectedDataInfo.PerformCallback(currdatasheet);
			}



			////
			////
			////
			
			function btnSaveOrder_ClientClick() {
				btnSaveOrder.SetVisible(false);

				//btnSaveOrder.SetVisible(true);

				callbackViewData.SetVisible(false);
				callbackMissing.SetVisible(false);

				callbackOutput.PerformCallback("SaveNewOrder");
				callbackOrders.PerformCallback("SaveNewOrder");
			}


			function btnCreateCharts_ClientClick() {

				btnSaveOrder.SetVisible(true);

				callbackViewData.SetVisible(false);
				callbackMissing.SetVisible(false);

				callbackOutput.PerformCallback("NewOrder");
				//callbackOrders.PerformCallback();
			}


			function btnCreateChartsALL_ClientClick() {
				btnSaveOrder.SetVisible(false);

				callbackViewData.SetVisible(false);
				callbackMissing.SetVisible(false);

				callbackOutput.PerformCallback("DisplayAllOrders");
				callbackOrders.PerformCallback();
			}

			function btnExportDocx_ClientClick() {
				btnSaveOrder.SetVisible(false);

				callbackViewData.SetVisible(false);
				callbackMissing.SetVisible(false);


				callbackOutput.PerformCallback("Docx");
				callbackOrders.PerformCallback();
			}

			////
			////
			////


			function LoadOldOrder(element, key) {
				callbackOutput.SetVisible(true);
				callbackOutput.PerformCallback("OldOrder|" + key);
			}

			function RemoveOrder(element, key) {
				callbackOrders.PerformCallback("RemoveOrder|" + key);
			}



			////
			////
			////
			function OnVarsAllChanged(s, e) {

				var grid = s.GetGridView();
				grid.SortBy("measname");
				btnCreateCharts.SetEnabled(true);
				btnViewData.SetEnabled(true);
				var seltext = grid.GetSelectedFieldValues("varname", RefreshSelectedVars);
				ShowFinalTabs();
				callbackVars.PerformCallback("all");
				callbackSelectVarInfo.PerformCallback("all");
			}

			function DeleteSelVar(s, e)
			{
				var x = s.GetRowValues(e.visibleIndex, "varname", UnselectVarInGrid);
			}

			function UnselectVarInGrid(key)
			{
				gridSelVars.UnselectRowsByKey(key);
			}
			function VarSelectionChanged(s, e)
			{
				var num = gridSelVars.GetSelectedRowCount();
				//selvars_n.SetText("(" + num + " selected)");
				//selvars_n2.SetText("(" + num + " selected)");

	//            pivotVarsCallback.PerformCallback();
				var seltext = gridSelVars.GetSelectedFieldValues("varname", RefreshSelectedVars);
				callbackVars.PerformCallback("all");
				callbackSelectVarInfo.PerformCallback("all");
			}


			function OnVarsNumChanged(s, e) {

				var grid = s.GetGridView();
				grid.SortBy("measname");
				btnCreateCharts.SetEnabled(true);
				btnViewData.SetEnabled(true);
				var seltext = grid.GetSelectedFieldValues("varname", RefreshSelectedVars);
				ShowFinalTabs();
				callbackVars.PerformCallback("num");
				callbackSelectVarInfo.PerformCallback("num");
			}


			function OnVarsTextChanged(s, e) {
				var grid = s.GetGridView();
				grid.SortBy("measname");
				var seltext = grid.GetSelectedFieldValues("varname", RefreshSelectedVars);
				ShowFinalTabs();
				callbackVars.PerformCallback("text");
				callbackSelectVarInfo.PerformCallback("text");
			}

			function OnVarsDateChanged(s, e) {
				var grid = s.GetGridView();
				grid.SortBy("measname");
				var seltext = grid.GetSelectedFieldValues("varname", RefreshSelectedVars);
				ShowFinalTabs();
				callbackVars.PerformCallback("date");
				callbackSelectVarInfo.PerformCallback("date");
			}
			function OnVarsAgeChanged(s, e) {
				var grid = s.GetGridView();
				grid.SortBy("measname");
				var seltext = grid.GetSelectedFieldValues("varname", RefreshSelectedAgeVars);
				ShowFinalTabs();
				callbackVars.PerformCallback("age");
				callbackSelectVarInfo.PerformCallback("age");
			}

			function ShowFinalTabs() {
				tabSteps.GetTabByName("tabPlots").SetVisible(true);
				tabSteps.GetTabByName("tabTables").SetVisible(true);
			}

			function RefreshSelectedAgeVars(selectedVals) {
				RefreshSelectedVars2(selectedVals, cboXaxisvarLINE);
				RefreshSelectedVars2(selectedVals, cboYaxisvarLINE);
			}


			function RefreshSelectedVars(selectedVals) {
				RefreshSelectedVars2(selectedVals, cboColorsvarHIST);
				RefreshSelectedVars2(selectedVals, cboPanelvarHIST);

				RefreshSelectedVars2(selectedVals, cboXaxisvarBAR);
				RefreshSelectedVars2(selectedVals, cboColorsvarBAR);
				RefreshSelectedVars2(selectedVals, cboPanelvarBAR);

//				RefreshSelectedVars2(selectedVals, tokXaxisvarSCAT);
//				RefreshSelectedVars2(selectedVals, tokYaxisvarSCAT);
				RefreshSelectedVars2(selectedVals, cboColorsvarSCAT);
				RefreshSelectedVars2(selectedVals, cboPanevarSCAT);
				RefreshSelectedVars2(selectedVals, cboPanelvarSCAT);

				RefreshSelectedVars2(selectedVals, cboXaxisvarLINE);
				RefreshSelectedVars2(selectedVals, cboYaxisvarLINE);
				RefreshSelectedVars2(selectedVals, cboColorsvarLINE);
				RefreshSelectedVars2(selectedVals, cboPanelvarLINE);


				RefreshSelectedVars2(selectedVals, tokXTrow);
				RefreshSelectedVars2(selectedVals, tokXTcol);
				RefreshSelectedVars2(selectedVals, tokXTpanel);
				RefreshSelectedVars2(selectedVals, tokXTcell);


				//var selected_nums = gridVarsNum.GetGridView().cpSelectedVars;
				//var selected_text = gridVarsText.GetGridView().cpSelectedVars;
				//var selected_nums_text = selected_nums.concat(selected_text);

				//RefreshSelectedVars2(selected_nums_text, tokXTrow);
				//RefreshSelectedVars2(selected_nums_text, tokXTcol);
				//RefreshSelectedVars2(selected_nums_text, tokXTpanel);
				//RefreshSelectedVars2(selected_nums_text, tokXTcell);
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





			var keyValue;




			function btnViewData_ClientClick() {

				callbackCharts.SetVisible(false);
				callbackMissing.SetVisible(false);
				//callbackCrosstabs.SetVisible(false);
				callbackViewData.SetVisible(true);
				callbackViewData.PerformCallback("foo1");
			}

			function btnViewMissing_ClientClick() {

				callbackCharts.SetVisible(false);
				callbackViewData.SetVisible(false);
				//callbackCrosstabs.SetVisible(false);
				callbackMissing.SetVisible(true);
				callbackMissing.PerformCallback("foo2");
			}


			function btnViewMissingID_ClientClick() {

				//TODO
				callbackCharts.SetVisible(false);
				callbackViewData.SetVisible(false);
				callbackMissing.SetVisible(true);
				callbackMissing.PerformCallback("foo2");
			}

			function ShowJitterAmounts(e) {
				if (txtJitterAmtX.GetVisible() == true) {
					txtJitterAmtX.SetVisible(false);
				} else {
					txtJitterAmtX.SetVisible(true);
				}
				if (txtJitterAmtY.GetVisible() == true) {
					txtJitterAmtY.SetVisible(false);
				} else {
					txtJitterAmtY.SetVisible(true);
				}
			}

			
			function ShowPtsCount(e) {
				if (txtPtsCount.GetVisible() == true) {
					txtPtsCount.SetVisible(false);
				} else {
					txtPtsCount.SetVisible(true);
				}
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



		function btnVarLabels_Show(s, e) {
			gvSelectedVars.SetVisible(true);
			btnVarLabelsShow.SetEnabled(false);
			btnVarLabelsHide.SetEnabled(true);
		}
		function btnVarLabels_Hide(s, e) {
			gvSelectedVars.SetVisible(false);
			btnVarLabelsShow.SetEnabled(true);
			btnVarLabelsHide.SetEnabled(false);
		}

		function chkPlots_SelectedIndexChanged(e) {
			var s = chkPlots.GetSelectedValues();

			var ntabs = tabSettings.GetTabCount();
			var nchecked = s.length;
			for (var j = 0; j < ntabs; j++) {
				var tab = tabSettings.GetTab(j);
				tab.SetVisible(false);
			}

			for (var i = 0; i < nchecked; i++) {
				var x = s[i] 
				var tab2 = tabSettings.GetTabByName(x);

				if (tab2 != null) {
					tab2.SetVisible(true);
				}
			}

		}


		function changeOutputStyleHIST(e) {
			if (trkNumColsHIST.GetVisible() == true) {
				trkNumColsHIST.SetVisible(false);
				trkNumRowsHIST.SetVisible(true);
			} else {
				trkNumColsHIST.SetVisible(true);
				trkNumRowsHIST.SetVisible(false);
			}
		}

		function changeOutputStyleBAR(e) {
			if (trkNumColsBAR.GetVisible() == true) {
				trkNumColsBAR.SetVisible(false);
				trkNumRowsBAR.SetVisible(true);
			} else {     
				trkNumColsBAR.SetVisible(true);
				trkNumRowsBAR.SetVisible(false);
			}
		 }

		function changeOutputStyleLINE(e) {
			if (trkNumColsLINE.GetVisible() == true) {
				trkNumColsLINE.SetVisible(false);
				trkNumRowsLINE.SetVisible(true);
			} else {
				trkNumColsLINE.SetVisible(true);
				trkNumRowsLINE.SetVisible(false);
			}
			}

		function changeOutputStyleXT(e) {
			if (trkNumColsXT.GetVisible() == true) {
				trkNumColsXT.SetVisible(false);
				trkNumRowsXT.SetVisible(true);
			} else {    
				trkNumColsXT.SetVisible(true);
				trkNumRowsXT.SetVisible(false);
			}
		}


		function cboXaxisvarLINE_changed(e) {
			if (cboXaxisvarLINE.GetValue() == "variable" & 
				cboColorsvarLINE.GetValue() == "variable")
			{
				cboColorsvarLINE.SetValue("none");
			}
		}

			
		function cboYaxisvarLINE_changed(e) {
			if (cboYaxisvarLINE.GetValue() == "variable" & 
				cboColorsvarLINE.GetValue() == "variable")
			{
				cboColorsvarLINE.SetValue("none");
			}
		}

		function cboColorsvarLINE_changed(e) {
			if (cboXaxisvarLINE.GetValue() == "variable" & 
				cboColorsvarLINE.GetValue() == "variable")
			{
				cboColorsvarLINE.SetValue("none");
			}


		}
	</script>



	<br />
	<table>
		<tr>
			<td style="width:700px">
				<dx:ASPxLabel ID="lblProjTitle" runat="server" Font-Size="Large" Font-Bold="true" Visible="false"></dx:ASPxLabel>

			</td>
			<td style="padding: 15px">
				<dx:ASPxButton ID="btnEdit" runat="server" Text="Edit This Project" 
					OnClick="btnEdit_OnClick" ClientInstanceName="btnEdit">
						<Image IconID="actions_edit_16x16devav"></Image>
				</dx:ASPxButton>

			</td>
			<td style="padding: 15px">
				<dx:ASPxButton ID="btnFiles" runat="server" Text="Create & View Data Files" OnClick="btnFiles_OnClick" ClientInstanceName="btnFiles">
					<Image IconID="save_saveall_16x16office2013"></Image>
				</dx:ASPxButton>

			</td>
			 <td style="padding: 15px">
				<dx:ASPxButton ID="btnProjects" runat="server" Text="Return To All Data Projects"   ClientInstanceName="btnSets" AutoPostBack="False">
						<clientsideevents click="function(s, e) {document.location.href = 'Index.aspx';}"></clientsideevents>
					<Image IconID="actions_changeview_16x16devav"></Image>
				</dx:ASPxButton>
			</td>
		</tr>
	</table>
	<br />
	<%-- CssClass="dxtcFixed" --%>
	<dx:ASPxPageControl ID="tabSteps" Width="100%" runat="server" ClientInstanceName="tabSteps" 
		 ActiveTabIndex="0" EnableHierarchyRecreation="True" EnableClientSideAPI="true" ClientVisible="true"
		>
		<TabPages>

			<%--SELECT DATA TAB--%>
			<dx:TabPage Name="tabData" Text="Select data & variables" TabStyle-Font-Size="12pt" TabStyle-ForeColor="Silver" >
				<ContentCollection>
					<dx:ContentControl ID="ContentControl7" runat="server">
					
						<table>
							<tr>
								<td>
									<asp:Label ID="lblD" runat="server" ForeColor="Gray" Text="Select Data" Font-Size="Small" Font-Bold="true"></asp:Label>
								</td>
								<td>
									<asp:Label ID="lblV" runat="server" ForeColor="Gray" Text="Select Variables" Font-Size="Small" Font-Bold="true"></asp:Label>
								</td>
							</tr>
							<tr>
								<%--COLUMN 1--%>
								<td style="vertical-align: top; padding:5px;">
									<br />
									<%--SELECT PROJECT--%>
									<dx:ASPxCallbackPanel ID="callbackSelectors" runat="server"  ClientInstanceName="callbackSelectors" OnCallback="callbackSelectors_OnCallback">
										<PanelCollection>
											<dx:PanelContent ID="panelcontent0" runat="server">

												<%-- OnValueChanged="gridDataProject_ValueChanged"--%>

							
												<dx:ASPxGridLookup ID="gridDataProject" runat="server" KeyFieldName="dataproj_pk" NullText="Select Data Project..." Width="350px"
													 DataSourceID="SqlDataProject" EnableClientSideAPI="true" ClientInstanceName="gridDataProject" >
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

									<%--SELECT FILE--%>
									<dx:ASPxCallbackPanel ID="callbackFile" runat="server"  ClientInstanceName="callbackFile" EnableClientSideAPI="true" 
											OnCallback="callbackFile_OnCallback"  >
										<SettingsLoadingPanel Text="Loading Data Files..." />
										<PanelCollection>
											<dx:PanelContent ID="panelcontent2" runat="server" >
												<dx:ASPxGridLookup ID="gridFile" runat="server" KeyFieldName="filename" NullText="" Width="350px"
														TextFormatString="{0}" Visible="true" Enabled="true" ClientInstanceName="gridFile" AutoPostBack="false"
													 EnableClientSideAPI="true"  >  <%-- --%>
													<ClientSideEvents   ValueChanged="function(s, e) { OnFileChanged(s); }" /> 
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

									<%--SELECT SHEET--%>
									<dx:ASPxCallbackPanel ID="callbackDataSheets" runat="server"  ClientInstanceName="callbackDataSheets" OnCallback="callbackDataSheets_OnCallback"  >
										<SettingsLoadingPanel Text="Loading Data Sheets..." />
										<PanelCollection>
											<dx:PanelContent ID="panelcontent5" runat="server" >
							
												<dx:ASPxGridLookup ID="gridDataSheets" runat="server" KeyFieldName="sheetname" NullText="" Width="350px"
														TextFormatString="{0}" Visible="false" Enabled="true" ClientInstanceName="gridDataSheets" 
													 EnableClientSideAPI="true"  >  <%-- --%>
													<ClientSideEvents   ValueChanged="function(s, e) { OnDataSheetChanged(s); }"    /> 
													<Columns>
														<dx:GridViewDataColumn FieldName="sheetname" Caption="Data Sheet" VisibleIndex="0" Width="260px"/>
														<dx:GridViewDataColumn FieldName="nrows" Caption="# Data Rows" VisibleIndex="1" Width="70px"/>
													</Columns>
													<GridViewProperties>
														<SettingsBehavior EnableRowHotTrack="true" /> 
													</GridViewProperties>
												</dx:ASPxGridLookup>
											</dx:PanelContent>
										</PanelCollection>
									</dx:ASPxCallbackPanel>

									<%--FILTER--%>
									<dx:ASPxCallbackPanel ID="callbackFilter" runat="server"  ClientInstanceName="callbackFilter" 
										OnCallback="callbackFilter_OnCallback" ClientVisible="false"  >
										<SettingsLoadingPanel Text="Loading Filter Controls..." />
										<PanelCollection>
											<dx:PanelContent ID="panelcontent4" runat="server" >

												<table>
													<tr>
														<td >
															<dx:ASPxTokenBox ID="tokTimepts"  runat="server"    Caption="Include Timepts:" Enabled="false" CaptionStyle-ForeColor="Silver" CaptionSettings-Position="Left" 
																ClientInstanceName="tokTimepts" Width="350px"   EnableCallbackMode="true"  DropDownRows="12" EnableClientSideAPI="true"  >
																<CaptionSettings Position="Top" />
															</dx:ASPxTokenBox>
															<dx:ASPxTokenBox ID="tokGroups"  runat="server"     Caption="Include Groups:" Enabled="false" CaptionStyle-ForeColor="Silver" CaptionSettings-Position="Left" 
																ClientInstanceName="tokGroups" Width="350px"   EnableCallbackMode="true" DropDownRows="12" EnableClientSideAPI="true"  >
																<CaptionSettings Position="Top" />
															</dx:ASPxTokenBox>
														 </td>
													</tr>
													<tr>
														<td>
															<dx:ASPxTextBox ID="txtFilter" runat="server" Width="350px"   NullText="Enter additional filter criteria here..." ClientInstanceName="txtFilter"></dx:ASPxTextBox>
														</td>
													</tr>
													<tr>
														<td >
															<dx:ASPxLabel ID="lblFilterExample" runat="server"   ForeColor="Silver"  ClientInstanceName="lblFilterExample"
																Text="E.g, varX >= 100; varX = varY;" Font-Size="XX-Small"></dx:ASPxLabel>
															
															
															<dx:ASPxButton ID="btnFilter" runat="server" Text="Filter"  Font-Size="XX-Small" 
																ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false">
																<ClientSideEvents Click="btnFilter_ClientClick" />
															</dx:ASPxButton>
														
														
														
														</td>
													</tr>
												</table>
							

										</dx:PanelContent>
									</PanelCollection>
								</dx:ASPxCallbackPanel>

										<%--NEW VARS--%>
<%--									<dx:ASPxCallbackPanel ID="callbackNewVar" runat="server"  ClientInstanceName="callbackNewVar" 
										OnCallback="callbackNewVar_OnCallback" ClientVisible="false"  >
										<SettingsLoadingPanel Text="Loading New Variable Controls..." />
										<PanelCollection>
											<dx:PanelContent ID="panelcontent8" runat="server" >

												

										</dx:PanelContent>
									</PanelCollection>
								</dx:ASPxCallbackPanel>--%>
								</td>

								<%--COLUMN 2--%>
								<td style="vertical-align: top; padding:5px">

									<br />

									<%--VARS--%>
									<dx:ASPxCallbackPanel ID="callbackVars" runat="server"  OnCallback="callbackVars_OnCallback" ClientInstanceName="callbackVars" ClientVisible="false">
										<SettingsLoadingPanel Text="Loading Variables..." />
										<PanelCollection>
											<dx:PanelContent ID="panelcontent1" runat="server">
													<%--VARS--%>

												
										<dx:ASPxGridView ID="gridSelVars" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridSelVars"
											  KeyFieldName="varname"  >
											<ClientSideEvents SelectionChanged="VarSelectionChanged" />
											<Columns>
												<dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True"  VisibleIndex="0"/>
												<dx:GridViewDataColumn FieldName="measname" Caption="Measure" VisibleIndex="2" Width="100px"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="varname" Caption="Variable" VisibleIndex="0" Width="160px"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="fieldlabel" Caption="Label" VisibleIndex="1" Width="400px"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="vartype" Caption="VarType" VisibleIndex="4"  Width="90px"></dx:GridViewDataColumn>
												 <dx:GridViewCommandColumn ShowClearFilterButton="true" ShowApplyFilterButton="true" VisibleIndex="5" />
												<%--<dx:GridViewDataColumn FieldName="fldpk" Caption="fldpk" Visible="false"></dx:GridViewDataColumn>--%>
											</Columns>
											<Settings ShowGroupPanel="true" ShowFilterRow="true" ShowFilterRowMenu="true" ShowFilterBar="Visible"  
												VerticalScrollBarMode="Visible" VerticalScrollableHeight="200" />
											<SettingsPager Mode="ShowAllRecords" />
											<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="false"  FilterRowMode="OnClick"   />
											<SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />

											<GroupSummary>
												<dx:ASPxSummaryItem FieldName="measname" SummaryType="Count" />
											</GroupSummary>
										</dx:ASPxGridView>




													

												<br /><br />
											


											</dx:PanelContent>
										</PanelCollection>
									</dx:ASPxCallbackPanel>
									


								</td>


								
							</tr>
						</table>


				</dx:ContentControl>
			</ContentCollection>
		</dx:TabPage>

			<%--CREATE CHARTS TAB--%>
			<dx:TabPage Name="tabPlots" Text="Create charts" TabStyle-Font-Size="12pt" TabStyle-ForeColor="Silver" >
					<ContentCollection>
						<dx:ContentControl ID="ContentControl9" runat="server">
							<dx:ASPxCallbackPanel ID="callbackSpecifics" runat="server"  OnCallback="callbackSpecifics_OnCallback" ClientInstanceName="callbackSpecifics">
							<PanelCollection>
								<dx:PanelContent ID="panelcontent3" runat="server">
				
									<table>
										<tr>
											<td style="vertical-align: top">
									
											<table>

												<tr>
													<td style="vertical-align: top">
											
														<dx:ASPxCheckBoxList ID="chkPlots" ClientInstanceName="chkPlots" runat="server" Caption="Charts" CaptionSettings-Position="Top"  
															 RepeatColumns="3" RepeatLayout="Table" RepeatDirection="Vertical" Font-Size="9" Paddings-Padding="2px" AutoPostBack="false" 
															 Width="320px"  >
															<ClientSideEvents SelectedIndexChanged="chkPlots_SelectedIndexChanged"   />
															<Items>
																<dx:ListEditItem Value="Barchart" Selected="false" />
																<dx:ListEditItem Value="Histogram" Selected="false"  />
																<dx:ListEditItem Value="Lineplot" Selected="false" />
																<dx:ListEditItem Value="Scatterplot" Selected="false" />
																<dx:ListEditItem Value="PCA" Selected="false" />
																<dx:ListEditItem Value="Crosstabs" Selected="false" />
																<dx:ListEditItem Value="Set Colors" Selected="false" />
															</Items>
														</dx:ASPxCheckBoxList>
													</td>
													<td style="vertical-align: top; padding:10px">
														<dx:ASPxButton ID="btnViewSettings" ClientInstanceName="btnViewSettings" runat="server" Text="Show Settings" Visible="false"
															ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px">
															<Image IconID="chart_chartyaxissettings_16x16office2013"></Image>
															<ClientSideEvents Click="btnViewSettings_ClientClick" />
														</dx:ASPxButton>
													</td>
												</tr>
											</table>
		

										<br />


										<br />
												<table>
													<tr>
														<td style="padding: 10px">
															<dx:ASPxButton ID="btnCreateCharts" ClientInstanceName="btnCreateCharts" runat="server" Text="Create Charts"
																ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px" >
																<Image IconID="chart_chart_16x16office2013"></Image>
																<ClientSideEvents Click="btnCreateCharts_ClientClick" />
															</dx:ASPxButton>

														</td>
														<td style="padding: 10px">
															<dx:ASPxButton ID="btnSaveOrder" ClientInstanceName="btnSaveOrder" runat="server" Text="Save this set of charts"
																ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px" ClientVisible="false" >
																<Image IconID="appearance_savetheme_16x16"></Image>
																<ClientSideEvents Click="btnSaveOrder_ClientClick" />
															</dx:ASPxButton>

														</td>
													</tr>
												</table>

												<dx:ASPxLabel ID="lblSetup_errors" ClientInstanceName="lblSetup_errors" runat="server" Text="" ForeColor="Red"></dx:ASPxLabel>


											</td>
											<td style="vertical-align: top; float:left;">
		
												<%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>

												<asp:Label ID="lblSettings" runat="server" Text="Settings" Font-Bold="true" Font-Size="12pt" ForeColor="Silver"></asp:Label>
												<br />
												<%--CssClass="dxtcFixed"--%>

				<%-- ActiveTabIndex="0" --%>
				<dx:ASPxPageControl ID="tabSettings" runat="server" ClientInstanceName="tabSettings" TabPosition="Left" TabAlign="Left" 
					 EnableHierarchyRecreation="True" EnableClientSideAPI="true" ClientVisible="true" Width="900px" >
					<TabPages>
						<%--HISTOGRAM--%>
						<dx:TabPage Name="Histogram" Text="Histogram..." TabStyle-HorizontalAlign="Left" ClientVisible="false">
							<ContentCollection>
								<dx:ContentControl ID="ContentControl2" runat="server"  Width="600px">
									<table style="padding: 5px 35px 5px 15px;">
										<tr>
											<td style="vertical-align: top; padding: 5px">
											  <table style="padding: 5px">
													<tr>
														<td>
															<b>Chart Width: </b><dx:ASPxLabel ID="lblWhist" ClientInstanceName="lblWhist" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
															<dx:ASPxTrackBar ID="trackWhist" ClientInstanceName="trackWhist" runat="server"  MinValue="100" MaxValue="1200" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
																	Width="150" Height="39" Step="25" LargeTickInterval="200"  EnableClientSideAPI="true" Position="350" DragHandleToolTip="false"   >
																<ClientSideEvents PositionChanged="OnChangeWhist" />
															</dx:ASPxTrackBar>

														</td>
														</tr>
														<tr>
														<td>
															<b>Chart Height: </b><dx:ASPxLabel ID="lblHhist" ClientInstanceName="lblHhist" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
															<dx:ASPxTrackBar ID="trackHhist" ClientInstanceName="trackHhist" runat="server"  MinValue="100" MaxValue="1200" ScalePosition="LeftOrTop"  ShowChangeButtons="false" 
																Width="150" Height="39" Step="25"  LargeTickInterval="200"  EnableClientSideAPI="true" Position="350"  >
																<ClientSideEvents PositionChanged="OnChangeHhist" />
															</dx:ASPxTrackBar>

														</td>
													</tr>
												</table>
											</td>
											<td style="align-content: center; padding: 5px">
												<table>
													<tr>
														<td  style="vertical-align: top; padding: 5px">
															<dx:ASPxComboBox ID="cboColorsvarHIST" runat="server" Caption="Colors:" CaptionSettings-Position="Top" ClientInstanceName="cboColorsvarHIST" Width="130px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" ></dx:ASPxComboBox>
														</td>
														<td  style="vertical-align: top; padding: 5px">
															<dx:ASPxComboBox ID="cboPanelvarHIST" runat="server" Caption="Panels:"  CaptionSettings-Position="Top" ClientInstanceName="cboPanelvarHIST" Width="130px" EnableCallbackMode="true"  DropDownRows="12"></dx:ASPxComboBox>

														</td>
														<td  style="vertical-align: top; padding: 5px">
															<dx:ASPxComboBox ID="cboOutputStyleHIST" runat="server" Caption="Output Style:" CaptionSettings-Position="Top" ClientInstanceName="cboOutputStyleHIST" Width="130px" EnableCallbackMode="true" >
																<ClientSideEvents SelectedIndexChanged="changeOutputStyleHIST" />
																<Items>
																	<dx:ListEditItem Value="Rows, Left to Right" Selected="true" />
																	<dx:ListEditItem Value="Cols, Top to Bottom"  />
																</Items>
															</dx:ASPxComboBox>
														</td>
													</tr>
													<tr>
														<td  style="vertical-align: top; padding: 5px">
															<dx:ASPxComboBox ID="cboPanes" ClientInstanceName="cboPanes" runat="server" Caption="Histogram Panes" CaptionSettings-Position="Top" Width="140px">
																<Items>
																	<dx:ListEditItem Value="horizontal" Text="Horizontal panes" Selected="true" />
																	<dx:ListEditItem Value="vertical" Text="Vertical panes" />
																</Items>
															</dx:ASPxComboBox>
															<br /><br />
									
															<dx:ASPxTrackBar ID="trkNumBins" ClientInstanceName="trkNumBins" runat="server" Caption="# Bins:"  MinValue="0" MaxValue="40" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
																	Height="40" Width="100px" LargeTickInterval="10" SmallTickFrequency="1"   Step="1"  EnableClientSideAPI="true" Position="0"   >
															</dx:ASPxTrackBar>

														</td>
														<td style="padding: 10px">
															<br />
															<dx:ASPxCheckBox ID="chkNormalcurve" runat="server" Text="Normal curve?" Checked="True"></dx:ASPxCheckBox>
															<br />
															<dx:ASPxCheckBox ID="chkHistMSD" runat="server" Text="Add M +/- SD?" Checked="True"></dx:ASPxCheckBox>
														</td>
														<td style="vertical-align: top;">
															<dx:ASPxTrackBar ID="trkNumColsHIST" ClientInstanceName="trkNumColsHIST" runat="server" Caption="# Output Cols:" CaptionSettings-Position="Top"  MinValue="1" MaxValue="12" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
																	Height="45" Width="130px" LargeTickInterval="1" SmallTickFrequency="1" Step="1"  EnableClientSideAPI="true" Position="4"   >
															</dx:ASPxTrackBar>
															<dx:ASPxTrackBar ID="trkNumRowsHIST" ClientInstanceName="trkNumRowsHIST" runat="server" Caption="# Output Rows:" CaptionSettings-Position="Top"  MinValue="1" MaxValue="12" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
																	Height="45" Width="130px" LargeTickInterval="1" SmallTickFrequency="1" Step="1"  EnableClientSideAPI="true" Position="4"  ClientVisible="false"  >
															</dx:ASPxTrackBar>
														</td>
													</tr>
												</table>
												<br />
											</td>
										</tr>
									</table>


						

								</dx:ContentControl>
							</ContentCollection>
						</dx:TabPage>

						<%--SCATTERPLOT--%>
						<dx:TabPage Name="Scatterplot" Text="Scatterplot..." TabStyle-HorizontalAlign="Left" ClientVisible="false">
							<ContentCollection>
								<dx:ContentControl ID="ContentControl3" runat="server"  Width="600px">

									   <table>
										<tr>
											<%--Column 1 - SCAT Width & Height sliders--%>
											<td style="vertical-align: top; padding: 5px">
											  <table>
													<tr>
														<td>
															<b>Chart Width: </b><dx:ASPxLabel ID="lblWscat" ClientInstanceName="lblWscat" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
															<dx:ASPxTrackBar ID="trackWscat" ClientInstanceName="trackWscat" runat="server"  MinValue="100" MaxValue="1200" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
																	Width="150" Height="39" Step="25" LargeTickInterval="200"  EnableClientSideAPI="true" Position="350" DragHandleToolTip="false"   >
																<ClientSideEvents PositionChanged="OnChangeWscat" />
															</dx:ASPxTrackBar>

														</td></tr>
														<tr>
														<td>
															<b>Chart Height: </b><dx:ASPxLabel ID="lblHscat" ClientInstanceName="lblHscat" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
															<dx:ASPxTrackBar ID="trackHscat" ClientInstanceName="trackHscat" runat="server"  MinValue="100" MaxValue="1200" ScalePosition="LeftOrTop"  ShowChangeButtons="false" 
																Width="150" Height="39" Step="25"  LargeTickInterval="200"  EnableClientSideAPI="true" Position="350"  >
																<ClientSideEvents PositionChanged="OnChangeHscat" />
															</dx:ASPxTrackBar>

														</td>
													</tr>
												</table>
												<br />
											</td>
											<%--Column 2--%>
											<td style="vertical-align: top; padding: 5px">

												<table>
													<tr>
														<td style="padding: 5px;">
															<dx:ASPxTokenBox ID="tokXaxisvarSCAT" runat="server" Caption="[TO DO] X axis vars:" Enabled="false" CaptionStyle-ForeColor="Silver" CaptionSettings-Position="Left" ClientInstanceName="tokXaxisvarSCAT" Width="130px" EnableCallbackMode="true" DropDownRows="12" ></dx:ASPxTokenBox>
															</td>
														<td style="padding: 5px;">
															<dx:ASPxTokenBox ID="tokYaxisvarSCAT" runat="server" Caption="Y axis vars:" Enabled="false" CaptionStyle-ForeColor="Silver" CaptionSettings-Position="Left" ClientInstanceName="tokYaxisvarSCAT" Width="130px" EnableCallbackMode="true" DropDownRows="12" ></dx:ASPxTokenBox>

														</td>
														</tr>
													</table>
												<table>
													<tr>
														<td style="padding: 5px;">
															<dx:ASPxComboBox ID="cboColorsvarSCAT" runat="server" Caption="Colors:"  CaptionSettings-Position="Top" ClientInstanceName="cboColorsvarSCAT" Width="130px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" ></dx:ASPxComboBox>
														</td>
														<td style="padding: 5px;">
															<dx:ASPxComboBox ID="cboPanevarSCAT" runat="server" Caption="Panes:"  CaptionSettings-Position="Top" ClientInstanceName="cboPanevarSCAT" Width="130px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" ></dx:ASPxComboBox>
														</td>
														<td style="padding: 5px;">
															<dx:ASPxComboBox ID="cboPanelvarSCAT" runat="server" Caption="Panels:" CaptionSettings-Position="Top" ClientInstanceName="cboPanelvarSCAT" Width="130px" EnableCallbackMode="true"  DropDownRows="12"></dx:ASPxComboBox>

														</td>
														<td style="width: 200px">
															<dx:ASPxComboBox ID="cboOutputStyleSCAT" runat="server" Caption="Output Style:" CaptionSettings-Position="Top" ClientInstanceName="cboOutputStyleSCAT" Width="130px" EnableCallbackMode="true" >
																<Items>
																	<dx:ListEditItem Value="Upper" Text="Upper Triangle"  Selected="true"/>
																	<dx:ListEditItem Value="Rows, Left to Right"  />
																	<dx:ListEditItem Value="Cols, Top to Bottom"  />
																</Items>
															</dx:ASPxComboBox>
														</td>
													</tr>
												</table>
												<br />

												<%--CheckBox settings--%>
												<table>
													<tr>
														<td>
															<dx:ASPxCheckBox ID="chkHist" runat="server" ClientInstanceName="chkHist" Text="Show histograms?" Visible="false"></dx:ASPxCheckBox>
														</td>
														<td>
															<dx:ASPxLabel ID="lblscatmode" runat="server" Text="Select modes:" ></dx:ASPxLabel>
														<dx:ASPxCheckBox ID="chkCorrModeA" runat="server" ClientInstanceName="chkCorrModeA" Text="Same vars ACROSS Time/RptMeas"></dx:ASPxCheckBox>
														<dx:ASPxCheckBox ID="chkCorrModeB" runat="server" ClientInstanceName="chkCorrModeB" Text="Different vars WITHIN Time/RptMeas"></dx:ASPxCheckBox>
														<dx:ASPxCheckBox ID="chkCorrModeC" runat="server" ClientInstanceName="chkCorrModeC" Text="Different vars ACROSS Time/RptMeas"></dx:ASPxCheckBox>
														<dx:ASPxCheckBox ID="chkCorrModeD" runat="server" ClientInstanceName="chkCorrModeD" Text="All vars IGNORE Time/RptMeas" Checked="true"></dx:ASPxCheckBox>
												
														</td>
														<td style="vertical-align: top; padding: 5px; width:150px">
															<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Options:" ></dx:ASPxLabel>
															<dx:ASPxCheckBox ID="chkRegline" runat="server" ClientInstanceName="chkRegline" Text="Show regression line?"></dx:ASPxCheckBox>
															<dx:ASPxCheckBox ID="chkMovingAvg" runat="server" ClientInstanceName="chkMovingAvg" Text="Show moving avg?">
																<ClientSideEvents ValueChanged="ShowPtsCount" />
															</dx:ASPxCheckBox>

															<dx:ASPxCheckBox ID="chkJitter" runat="server" ClientInstanceName="chkMovingAvg" Text="Add jitter?">
																<ClientSideEvents ValueChanged="ShowJitterAmounts" />
															</dx:ASPxCheckBox>
														</td>
														<td style="padding: 5px">
															<%--<dx:ASPxComboBox ID="cboWideMode" runat="server" Caption="Wide mode:" CaptionSettings-Position="Top" ClientInstanceName="cboOutputStyleSCAT" Width="130px" EnableCallbackMode="true" >
																<Items>
																	<dx:ListEditItem Value="0" Text="Only Within timept"  Selected="true"/>
																	<dx:ListEditItem Value="1" Text="Auto correlation by timept"  Selected="false"/>
																	<dx:ListEditItem Value="2" Text="Pool across timept"  Selected="false"/>
																</Items>
															</dx:ASPxComboBox>--%>
														</td>

													</tr>
													<tr>
										
														<td style="padding: 5px">

														</td>
														<td style="padding: 5px">
															<dx:ASPxTextBox ID="txtPtsCount" ClientInstanceName="txtPtsCount" runat="server" Text="15" Caption="# pts:"  Width="40px" ClientVisible="False" >
																<ValidationSettings RegularExpression-ValidationExpression="[0-9]{1,3}" SetFocusOnError="True"
																RegularExpression-ErrorText="Enter a number."
																Display="Dynamic" ErrorTextPosition="Right" />
															</dx:ASPxTextBox>
															</td>
														<td style="padding: 2px">


															<dx:ASPxTextBox ID="txtJitterAmtX" ClientInstanceName="txtJitterAmtX" runat="server" Text="0" Caption="Amt(+/-) x:"  Width="40px" ClientVisible="false" >
																		<ValidationSettings RegularExpression-ValidationExpression="(?:\d*\.\d{1,2}|\d+)$" SetFocusOnError="True"
																			RegularExpression-ErrorText="Enter a number"
																			Display="Dynamic" ErrorTextPosition="Bottom" />
																		</dx:ASPxTextBox>
															<br />
															<dx:ASPxTextBox ID="txtJitterAmtY" ClientInstanceName="txtJitterAmtY" runat="server" Text="0" Caption="Amt(+/-) y:"  Width="40px"  ClientVisible="false" >
																		<ValidationSettings RegularExpression-ValidationExpression="(?:\d*\.\d{1,2}|\d+)$" SetFocusOnError="True"
																			RegularExpression-ErrorText="Enter a number"
																			Display="Dynamic" ErrorTextPosition="Bottom" />
																		</dx:ASPxTextBox>

															</td>
														<td style="padding: 5px">
														</td>
													</tr>
												</table>
												<br />
											</td>
											<td style="width: 30px"></td>
										</tr>
									</table>


								</dx:ContentControl>
							</ContentCollection>
						</dx:TabPage>

						<%--BARCHART--%>
						<dx:TabPage Name="Barchart" Text="Barchart..." TabStyle-HorizontalAlign="Left" ClientVisible="false">
							<ContentCollection>
								<dx:ContentControl ID="ContentControl4" runat="server"  Width="600px">

									<table>
										<tr>
											<td style="vertical-align: top; padding: 5px">
											  <table>
													<tr>
														<td>
															<b>Chart Width: </b><dx:ASPxLabel ID="lblWbar" ClientInstanceName="lblWbar" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
															<dx:ASPxTrackBar ID="trackWbar" ClientInstanceName="trackWbar" runat="server"  MinValue="100" MaxValue="1000" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
																	Width="150" Height="39" Step="25" LargeTickInterval="200"  EnableClientSideAPI="true" Position="350" DragHandleToolTip="false"   >
																<ClientSideEvents PositionChanged="OnChangeWbar" />
															</dx:ASPxTrackBar>

														</td>
													</tr>
													<tr>
														<td>
															<b>Chart Height: </b><dx:ASPxLabel ID="lblHbar" ClientInstanceName="lblHbar" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
															<dx:ASPxTrackBar ID="trackHbar" ClientInstanceName="trackHbar" runat="server"  MinValue="100" MaxValue="1000" ScalePosition="LeftOrTop"  ShowChangeButtons="false" 
																Width="150" Height="39" Step="25"  LargeTickInterval="200"  EnableClientSideAPI="true" Position="350"  >
																<ClientSideEvents PositionChanged="OnChangeHbar" />
															</dx:ASPxTrackBar>

														</td>
													</tr>
												</table>
											</td>

											<td style="vertical-align: top; padding: 5px">

												<table>
													<tr>
														<td style="padding: 5px;">
															<dx:ASPxComboBox ID="cboXaxisvarBAR" runat="server" Caption="X axis:" CaptionSettings-Position="Top" ClientInstanceName="cboXaxisvarBAR" Width="130px" EnableCallbackMode="true" DropDownRows="12" ></dx:ASPxComboBox>

														</td>
														<td style="padding: 5px;">
															<dx:ASPxComboBox ID="cboColorsvarBAR" runat="server" Caption="Colors:" CaptionSettings-Position="Top" ClientInstanceName="cboColorsvarBAR" Width="130px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" ></dx:ASPxComboBox>
														</td>
														<td style="padding: 5px;">
															<dx:ASPxComboBox ID="cboPanelvarBAR" runat="server" Caption="Panels:" CaptionSettings-Position="Top" ClientInstanceName="cboPanelvarBAR" Width="130px" EnableCallbackMode="true"  DropDownRows="12"></dx:ASPxComboBox>

														</td>
														<td style="padding: 5px;">
															<dx:ASPxComboBox ID="cboOutputStyleBAR" runat="server" Caption="Output Style:" CaptionSettings-Position="Top" ClientInstanceName="cboOutputStyleBAR" Width="130px" EnableCallbackMode="true" >
																<ClientSideEvents SelectedIndexChanged="changeOutputStyleBAR" />
																<Items>
																	<dx:ListEditItem Value="Rows, Left to Right" Selected="true" />
																	<dx:ListEditItem Value="Cols, Top to Bottom"  />
																</Items>
															</dx:ASPxComboBox>
														</td>
													</tr>
													<tr>
														<td style="vertical-align:top;" colspan="2">
															<dx:ASPxCheckBox ID="chkStatsTable" runat="server" Text="Display Descriptive Stats table?" Checked="True"></dx:ASPxCheckBox>
														</td>
														<td></td>
														<td style="vertical-align:top;">
															<dx:ASPxTrackBar ID="trkNumColsBAR" ClientInstanceName="trkNumColsBAR" runat="server" Caption="# Output Cols:" CaptionSettings-Position="Top"  MinValue="1" MaxValue="12" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
																	Height="45" Width="130px" LargeTickInterval="1" SmallTickFrequency="1" Step="1"  EnableClientSideAPI="true" Position="4"   >
															</dx:ASPxTrackBar>
															<dx:ASPxTrackBar ID="trkNumRowsBAR" ClientInstanceName="trkNumRowsBAR" runat="server" Caption="# Output Rows:" CaptionSettings-Position="Top"  MinValue="1" MaxValue="12" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
																	Height="45" Width="130px" LargeTickInterval="1" SmallTickFrequency="1" Step="1"  EnableClientSideAPI="true" Position="4"  ClientVisible="false"  >
															</dx:ASPxTrackBar>

														</td>
													</tr>
												</table>
												<br />
											</td>
										</tr>
									</table>

									<br/>
								</dx:ContentControl>
							</ContentCollection>
						</dx:TabPage>

						<%--LINEPLOT--%>
						<dx:TabPage Name="Lineplot" Text="Lineplot..." TabStyle-HorizontalAlign="Left" ClientVisible="false">
							<ContentCollection>
								<dx:ContentControl ID="ContentControl5" runat="server"  Width="800px">
									Lineplots will display values for specific subjects.  If there are multiple timepoints in your data <br />you should probably include a time-oriented variable (timept, date, or age) somewhere in the plot. <br />
									<table>
										<tr>
											<td>Common uses:</td>
											<td>(1) Display a variable over time for each subject (x-axis: timept, age, or date)</td>
										</tr>
										<tr>
											<td></td>
											<td>(2) Display different variables collected at the same time for each subject (x-axis: variable)</td>
										</tr>
									</table>
						
									<br />
									<table>
										<tr>
											<td style="padding: 5px">
											  <table>
													<tr>
														<td >
															<b>Chart Width: </b><dx:ASPxLabel ID="lblWline" ClientInstanceName="lblWline" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
															<dx:ASPxTrackBar ID="trackWline" ClientInstanceName="trackWline" runat="server"  MinValue="100" MaxValue="1000" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
																	Width="150" Height="40" Step="25" LargeTickInterval="200"  EnableClientSideAPI="true" Position="350" DragHandleToolTip="false"   >
																<ClientSideEvents PositionChanged="OnChangeWline" />
															</dx:ASPxTrackBar>

														</td>
														</tr>
														<tr>
														<td>
															<b>Chart Height: </b><dx:ASPxLabel ID="lblHline" ClientInstanceName="lblHline" runat="server" Font-Bold="true" Font-Size="12" ></dx:ASPxLabel>
															<dx:ASPxTrackBar ID="trackHline" ClientInstanceName="trackHline" runat="server"  MinValue="100" MaxValue="1000" ScalePosition="LeftOrTop"  ShowChangeButtons="false" 
																Width="150" Height="40" Step="25"  LargeTickInterval="200"  EnableClientSideAPI="true" Position="350"  >
																<ClientSideEvents PositionChanged="OnChangeHline" />
															</dx:ASPxTrackBar>

														</td>
													</tr>
												</table>
											</td>
											<td style="padding: 5px">
												<table>
													<tr>
														<td style="padding: 5px">
															<dx:ASPxComboBox ID="cboXaxisvarLINE" runat="server" Caption="X axis:" CaptionSettings-Position="Top" ClientInstanceName="cboXaxisvarLINE" Width="120px" EnableCallbackMode="true" DropDownRows="12">
																	<ClientSideEvents SelectedIndexChanged="cboXaxisvarLINE_changed" />
															</dx:ASPxComboBox>
														</td>
														<td style="padding: 5px">
															<dx:ASPxComboBox ID="cboYaxisvarLINE" runat="server" Caption="Y axis:" CaptionSettings-Position="Top" ClientInstanceName="cboYaxisvarLINE" Width="120px" EnableCallbackMode="true" DropDownRows="12">
																	<ClientSideEvents SelectedIndexChanged="cboYaxisvarLINE_changed" />
															</dx:ASPxComboBox>
														</td>
														<td style="padding: 5px">
															<dx:ASPxComboBox ID="cboColorsvarLINE" runat="server" Caption="Colors:" CaptionSettings-Position="Top" ClientInstanceName="cboColorsvarLINE" Width="120px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" >
																	<ClientSideEvents SelectedIndexChanged="cboColorsvarLINE_changed" />
															</dx:ASPxComboBox>
														</td>
														<td style="padding: 5px">
															<dx:ASPxComboBox ID="cboPanelvarLINE" runat="server" Caption="Panels:" CaptionSettings-Position="Top" ClientInstanceName="cboPanelvarLINE" Width="120px" EnableCallbackMode="true"  DropDownRows="12"></dx:ASPxComboBox>

														</td>
														<td style="padding: 5px; width: 200px;">
															<dx:ASPxComboBox ID="cboOutputStyleLINE" runat="server" Caption="Output Style:" CaptionSettings-Position="Top" ClientInstanceName="cboOutputStyleLINE" Width="120px" EnableCallbackMode="true" >
																<ClientSideEvents SelectedIndexChanged="changeOutputStyleLINE" />
																<Items>
																	<dx:ListEditItem Value="Rows, Left to Right" Selected="true" />
																	<dx:ListEditItem Value="Cols, Top to Bottom"  />
																</Items>
															</dx:ASPxComboBox>
														</td>
													</tr>
													<tr>
													<td colspan="2">
														<br />
											  
														<dx:ASPxCheckBox ID="chkLineMatchYaxisRange" runat="server" Text="Match Y axis range across panels?" Checked="True"></dx:ASPxCheckBox>
															<br />
															<dx:ASPxCheckBox ID="chkLineShowLegend" runat="server" Text="Show Legend?" Checked="True"></dx:ASPxCheckBox>
														<br />
															<dx:ASPxCheckBox ID="chkLineHideBlank" runat="server" Text="Hide blank plots?" Checked="True"></dx:ASPxCheckBox>
													</td>
													<td>
														Legend position:
														<dx:ASPxComboBox ID="cboLegendH_LINE" runat="server" Caption="" ClientInstanceName="cboLegendH_LINE" Width="130px" EnableCallbackMode="true" DropDownRows="5">
															<Items>
																<dx:ListEditItem Value="Right"  />
																<dx:ListEditItem Value="RightOutside" Selected="True"/>
																<dx:ListEditItem Value="Left" />
																<dx:ListEditItem Value="LeftOutside" />
																<dx:ListEditItem Value="Center" />

															</Items>
														</dx:ASPxComboBox>
														<dx:ASPxComboBox ID="cboLegendV_LINE" runat="server" Caption="" ClientInstanceName="cboLegendV_LINE" Width="130px" EnableCallbackMode="true" DropDownRows="5">
															<Items>
																<dx:ListEditItem Value="Top" Selected="True" />
																<dx:ListEditItem Value="TopOutside" />
																<dx:ListEditItem Value="Bottom" />
																<dx:ListEditItem Value="BottomOutside" />
																<dx:ListEditItem Value="Center" />

															</Items>
														</dx:ASPxComboBox>
													</td>	
														<td style="vertical-align:top;">
															<dx:ASPxTrackBar ID="trkNumColsLINE" ClientInstanceName="trkNumColsLINE" runat="server" Caption="# Output Cols:" CaptionSettings-Position="Top"  MinValue="1" MaxValue="12" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
																	Height="45" Width="130px" LargeTickInterval="1" SmallTickFrequency="1" Step="1"  EnableClientSideAPI="true" Position="4"   >
															</dx:ASPxTrackBar>
															<dx:ASPxTrackBar ID="trkNumRowsLINE" ClientInstanceName="trkNumRowsLINE" runat="server" Caption="# Output Rows:" CaptionSettings-Position="Top"  MinValue="1" MaxValue="12" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
																	Height="45" Width="130px" LargeTickInterval="1" SmallTickFrequency="1" Step="1"  EnableClientSideAPI="true" Position="4"  ClientVisible="false"  >
															</dx:ASPxTrackBar>

														</td>
													</tr>
												</table>
									
											</td>
										</tr>
									</table>


									<br />
								</dx:ContentControl>
							</ContentCollection>
						</dx:TabPage>
			
						<%--CROSSTABS--%>
						<dx:TabPage Name="Crosstabs" Text="Crosstabs..." TabStyle-HorizontalAlign="Left" ClientVisible="false">
							<ContentCollection>
								<dx:ContentControl ID="ContentControl10" runat="server">
									<table>
										<tr>
											<td colspan="3">
												<asp:Label ID="lblXT1" runat="server" Text="Crosstabs tables will be created for each selected categorical variable."></asp:Label><br />
												<asp:Label ID="lblXT2" runat="server" Text="Select any additional row or column variables here."></asp:Label>
												<asp:Label ID="lblXTError" runat="server" Text="" ForeColor="red" ></asp:Label>
											</td>
										</tr>
										<tr>
											<td style="padding: 5px">
												<dx:ASPxTokenBox ID="tokXTrow" runat="server" Caption="Rows:" CaptionSettings-Position="Top" ClientInstanceName="tokXTrow" Width="150px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" ClearButton-DisplayMode="Always" ></dx:ASPxTokenBox>

											</td>
											<td style="padding: 5px">
												<dx:ASPxTokenBox ID="tokXTcol" runat="server" Caption="Columns:" CaptionSettings-Position="Top" ClientInstanceName="tokXTcol" Width="150px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" ClearButton-DisplayMode="Always" ></dx:ASPxTokenBox>
											</td>
											<td style="padding: 5px">
												<dx:ASPxTokenBox ID="tokXTpanel" runat="server" Caption="Panels:" CaptionSettings-Position="Top" ClientInstanceName="tokXTpanel" Width="150px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" ClearButton-DisplayMode="Always" ></dx:ASPxTokenBox>
											</td>							
											<td style="padding: 5px">
												<dx:ASPxComboBox ID="cboOutputStyleXT" runat="server" Caption="Output Style:" CaptionSettings-Position="Top" ClientInstanceName="cboOutputStyleXT" Width="130px" EnableCallbackMode="true" >
													<ClientSideEvents SelectedIndexChanged="changeOutputStyleXT" />
													<Items>
														<dx:ListEditItem Value="Rows, Left to Right" Selected="true" />
														<dx:ListEditItem Value="Cols, Top to Bottom"  />
													</Items>
												</dx:ASPxComboBox>
											</td>							

										</tr>
										<tr>
											<td style="padding: 5px">
												<dx:ASPxTokenBox ID="tokXTcell" runat="server" Caption="Cell contents:" CaptionSettings-Position="Top" ClientInstanceName="tokXTcell" Width="150px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" ClearButton-DisplayMode="Always" ></dx:ASPxTokenBox>

											</td>
											<td style="padding: 5px">
												<dx:ASPxTokenBox ID="tokXTstats" runat="server" Caption="Cell Stats:" CaptionSettings-Position="Top" ClientInstanceName="tokXTstats" Width="150px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" ClearButton-DisplayMode="Always" ></dx:ASPxTokenBox>

											</td>
											<td style="padding: 5px">
												<dx:ASPxTrackBar ID="trkDecPlaces" ClientInstanceName="trkDecPlaces" runat="server" Caption="Decimal places:" CaptionSettings-Position="Top"  MinValue="0" MaxValue="5" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
														Height="45" Width="80px" LargeTickInterval="1" SmallTickFrequency="1" Step="1"  EnableClientSideAPI="true" Position="2"   >
												</dx:ASPxTrackBar>

											</td>
											<td style="padding: 5px">
												<dx:ASPxTrackBar ID="trkNumColsXT" ClientInstanceName="trkNumColsXT" runat="server" Caption="# Output Cols:" CaptionSettings-Position="Top"  MinValue="1" MaxValue="12" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
														Height="45" Width="130px" LargeTickInterval="1" SmallTickFrequency="1" Step="1"  EnableClientSideAPI="true" Position="4"   >
												</dx:ASPxTrackBar>
												<dx:ASPxTrackBar ID="trkNumRowsXT" ClientInstanceName="trkNumRowsXT" runat="server" Caption="# Output Rows:" CaptionSettings-Position="Top"  MinValue="1" MaxValue="12" ScalePosition="LeftOrTop" ShowChangeButtons="false" 
														Height="45" Width="130px" LargeTickInterval="1" SmallTickFrequency="1" Step="1"  EnableClientSideAPI="true" Position="4"  ClientVisible="false"  >
												</dx:ASPxTrackBar>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<br />
												<asp:Label ID="Label2" runat="server" Text="Separate vs. combined tables mode:"></asp:Label>
												<br />
												<%--<dx:ASPxCheckBox ID="chkXTpairwise" ClientInstanceName="chkXTpairwise" runat="server" ></dx:ASPxCheckBox>
												<asp:Label ID="Label3" runat="server" Text="All pairs of selected vars?"></asp:Label>--%>

												<dx:ASPxComboBox ID="cboXTmode" runat="server" Caption="" ClientInstanceName="cboXTmode" Width="450px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12"  >
													<Items>
														<dx:ListEditItem  Value="1" Text="1. Use each Row/Col var combination in a separate table" Selected="true" />
														<dx:ListEditItem  Value="2" Text="2. Use all Row/Col vars in a single, combined table" />
													</Items>
												</dx:ASPxComboBox>
											</td>
											<td style="vertical-align:top;">
									
									
									


											</td>

										</tr>
										<tr>
											<td colspan="3">
												<br />
												<asp:Label ID="Label1" runat="server" Text="If you wish to create crosstabs tables for the numeric variables you have selected, check the box below."></asp:Label>
												<br />
												<dx:ASPxCheckBox ID="chkXTincludenumeric" ClientInstanceName="chkXTincludenumeric" runat="server" ></dx:ASPxCheckBox>
												<asp:Label ID="lblXT3" runat="server" Text="Include numeric variables?"></asp:Label>
											</td>

										</tr>
									</table>



									</dx:ContentControl>
								</ContentCollection>
							</dx:TabPage>
			
						<%--PCA--%>
						<dx:TabPage Name="PCA" Text="PCA..." ClientEnabled="true" TabStyle-HorizontalAlign="Left" ClientVisible="False">
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

												<dx:ASPxComboBox ID="cboSubgroupsvarPCA" runat="server" Caption="Subgroups:" CaptionSettings-Position="Top" ClientInstanceName="cboSubgroupsvarPCA" Width="130px" EnableClientSideAPI="true" EnableCallbackMode="true" DropDownRows="12" ></dx:ASPxComboBox>

												</td>
										</tr>
									</table>

									</dx:ContentControl>
								</ContentCollection>
							</dx:TabPage>

						<%--SET COLORS--%>
						<dx:TabPage Name="Set Colors" Text="Set Colors..." TabStyle-HorizontalAlign="Left"  ClientVisible="false">
							<ContentCollection>
								<dx:ContentControl ID="ContentControl1" runat="server" Width="600px">

									<br />
	
									
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

									<br />



								</dx:ContentControl>
							</ContentCollection>
						</dx:TabPage>
					</TabPages>
				</dx:ASPxPageControl>


											</td>
										</tr>
									</table>

									</dx:PanelContent>
								</PanelCollection>
							</dx:ASPxCallbackPanel>
				


							</dx:ContentControl>
							</ContentCollection>
					</dx:TabPage>
			
			<%--CREATE TABLES TAB--%>
			<dx:TabPage Name="tabTables" Text="Create Tables" TabStyle-Font-Size="12pt" TabStyle-ForeColor="Silver" >
					<ContentCollection>
						<dx:ContentControl ID="ContentControl11" runat="server">
								<dx:ASPxButton ID="btnViewData" ClientInstanceName="btnViewData" runat="server" Text="View Selected Data"
									ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px">
									<Image IconID="richedit_inserttable_16x16"></Image>
									<ClientSideEvents Click="btnViewData_ClientClick" />
								</dx:ASPxButton>

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<dx:ASPxButton ID="btnViewMissing" ClientInstanceName="btnViewMissing" runat="server" Text="Missing Data by Var"
									ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px">
									<Image IconID="support_question_16x16office2013"></Image>
									<ClientSideEvents Click="btnViewMissing_ClientClick" />
								</dx:ASPxButton>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<dx:ASPxButton ID="btnViewMissingID" ClientInstanceName="btnViewMissingID" runat="server" Text="Missing Data by ID"
									ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px">
									<Image IconID="support_question_16x16office2013"></Image>
									<ClientSideEvents Click="btnViewMissingID_ClientClick" />
								</dx:ASPxButton>

								<br />
								<br /><dx:ASPxTextBox ID="txtOutputFilename" runat="server" Caption="Output filename:" Text="output" Visible="false"></dx:ASPxTextBox>

						</dx:ContentControl>
					</ContentCollection>
			</dx:TabPage>

			<%--SAVED CHART SETS--%>
			<dx:TabPage Name="tabChartSets" Text="Create a Report" TabStyle-Font-Size="12pt" TabStyle-ForeColor="Silver" >
					<ContentCollection>
						<dx:ContentControl ID="ContentControl_Orders"  runat="server">
							This section lists the sets of charts that you have saved.
						
							<%-- OnCustomButtonCallback="gridOrders_CustomButtonCallback" --%>
							<dx:ASPxCallbackPanel ID="callbackOrders" ClientInstanceName="callbackOrders" runat="server"
								 OnCallback="callbackOrders_OnCallback">
								<PanelCollection>
									<dx:PanelContent ID="panelcontentOrders" runat="server">

										<table>
										<tr>
											<td style="vertical-align: top; padding: 10px">
												<dx:ASPxGridView ID="gridOrders" ClientInstanceName="gridOrders" runat="server" KeyFieldName="order_number" 
												 AutoGenerateColumns="false" SettingsText-EmptyDataRow="No sets of charts have been created." Enabled="true"
													 >
										
												 <Columns>
													 <dx:GridViewDataColumn FieldName="order_number" Caption="#" SortIndex="0" SortOrder="Ascending" />
													 <dx:GridViewDataColumn FieldName="worksheet" />
													 <dx:GridViewDataColumn FieldName="filter" />
													 <dx:GridViewDataColumn FieldName="vars" />
													 <dx:GridViewDataColumn FieldName="objects" />
													 <dx:GridViewDataColumn Caption="" >
														<DataItemTemplate>
															<a href="javascript:void(0);" onclick="LoadOldOrder(this, '<%# Container.KeyValue %>')">Display</a>
														</DataItemTemplate>
													</dx:GridViewDataColumn>
													 <dx:GridViewDataColumn Caption="" >
														<DataItemTemplate>
															<a href="javascript:void(0);" onclick="RemoveOrder(this, '<%# Container.KeyValue %>')">Remove</a>
														</DataItemTemplate>
													</dx:GridViewDataColumn>
												</Columns>
									 
											</dx:ASPxGridView>
											</td>
											<td style="width: 50px"></td>
											<td style="vertical-align: top; padding: 10px">
												<br />
												<br />
												<dx:ASPxButton ID="btnCreateChartsALL" ClientInstanceName="btnCreateChartsALL" runat="server" 
													Text="Display All Saved Charts" Wrap="true"  Width="150px"
													ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px" >
													<Image IconID="chart_column2_32x32"></Image>
													<ClientSideEvents Click="btnCreateChartsALL_ClientClick" />
												</dx:ASPxButton>
												<br /><br />
												<dx:ASPxButton ID="btnExportWord" ClientInstanceName="btnExportWord" runat="server" Width="150px"
													Text="Create Report (.docx)" Wrap="true"
													ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="2px" 
													>
													<Image IconID="export_exporttodocx_32x32"></Image>
													<ClientSideEvents Click="btnExportDocx_ClientClick" />
												</dx:ASPxButton>

											</td>
											<td style="vertical-align: top; padding: 10px">
												<dx:ASPxTextBox ID="txtReportTitle" runat="server" Width="600px"
													Caption="Report Title:" CaptionSettings-Position="Top" CaptionStyle-Font-Size="Small" CaptionStyle-ForeColor="Silver"
													Font-Size="Medium" ></dx:ASPxTextBox>
												<br />
												<dx:ASPxMemo ID="txtReportDesc" runat="server" Width="600px" Height="120px"
													Caption="Report Description:" CaptionSettings-Position="Top" CaptionStyle-Font-Size="Small" CaptionStyle-ForeColor="Silver"
													Font-Size="Small" ></dx:ASPxMemo>
											</td>
										</tr>
										</table>

									</dx:PanelContent>
								</PanelCollection>
							</dx:ASPxCallbackPanel>
						
							<%--								
		--%>

						</dx:ContentControl>
					</ContentCollection>
				</dx:TabPage>

		</TabPages>
		</dx:ASPxPageControl>

<%--	<dx:ASPxLabel ID="lbl" runat="server" Text="Select variables to plot:"></dx:ASPxLabel>--%>

<table>
	<tr>
		<%--SELECTED DATA INFO--%>
		<td style="vertical-align: top; padding:10px">
								
				<dx:ASPxCallbackPanel ID="callbackSelectedDataInfo" runat="server"  OnCallback="callbackSelectedDataInfo_OnCallback" ClientInstanceName="callbackSelectedDataInfo">
					<SettingsLoadingPanel Text="Loading Selected Data Information..." />
					<PanelCollection>
						<dx:PanelContent ID="panelcontent9" runat="server">

						
							<dx:ASPXLabel ID="lblDataInfo" runat="server" ClientInstanceName="lblDataInfo" Text="Details for selected data..." ForeColor="Gray" Font-Bold="true"  Visible="false"></dx:ASPXLabel>
							<br /><br />
							<dx:ASPxLabel ID="lblSelectedDataInfo2" runat="server" Text="" ClientInstanceName="lblSelectedDataInfo2" EncodeHtml="false" ></dx:ASPxLabel>
						</dx:PanelContent>
					</PanelCollection>
				</dx:ASPxCallbackPanel>
		</td>

		<%--SELECTED VAR INFO--%>
		<td style="vertical-align: top; padding:10px">

	<table >

		<tr>
			<td colspan="2" style="vertical-align: top;">
				<dx:ASPxCallbackPanel ID="callbackSelectVarInfo" runat="server"  OnCallback="callbackSelectVarInfo_OnCallback" ClientInstanceName="callbackSelectVarInfo" >
					<SettingsLoadingPanel Text="Loading Selected Variables Information..." />
					<PanelCollection>
						<dx:PanelContent ID="panelcontentVarLabels" runat="server" >
							<table style="vertical-align: top;">
								<tr>
							
									<td style="vertical-align: top;">

							<dx:ASPXLabel ID="lblVarLabels" runat="server" ClientInstanceName="lblVarLabels" Text="Details for selected variables..." ForeColor="Gray" Font-Bold="true" Visible="false"></dx:ASPXLabel>
							<dx:ASPxButton ID="btnVarLabelsShow" runat="server" ClientInstanceName="btnVarLabelsShow" Text="Show" Visible="false" Paddings-Padding="0" AutoPostBack="false"  ClientEnabled="false"  >
								<ClientSideEvents  Click="btnVarLabels_Show"/>
							</dx:ASPxButton>
							<dx:ASPxButton ID="btnVarLabelsHide" runat="server" ClientInstanceName="btnVarLabelsHide" Text="Hide" Visible="false" Paddings-Padding="0" AutoPostBack="false" ClientEnabled="true" Checked="false" >
								<ClientSideEvents  Click="btnVarLabels_Hide"/>
							</dx:ASPxButton>

									</td>
								</tr>
								<tr>
								
									<td>
							<dx:ASPxGridView ID="gvSelectedVars" runat="server" 
								ClientInstanceName="gvSelectedVars" AutoGenerateColumns="false" SettingsText-EmptyDataRow="No variables selected" 
								Visible="false"  >
								<ClientSideEvents CustomButtonClick="DeleteSelVar" />
								<Columns>
									<dx:GridViewCommandColumn Caption="Del" ButtonRenderMode="Image" VisibleIndex="0" Width="50px">
											<CustomButtons>
											<dx:GridViewCommandColumnCustomButton ID="Delete"   >
												<Image ToolTip="Delete Variable" Url="~/images/del.png" />
											</dx:GridViewCommandColumnCustomButton>
										</CustomButtons>
									</dx:GridViewCommandColumn>									
									<dx:GridViewDataColumn FieldName="measname" Caption="Measure"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="varname" Caption="Variable"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="fldlabel" Caption="Label"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="datatype" Caption="Data Type"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="vartype" Caption="Var Type"></dx:GridViewDataColumn>

								</Columns>
							</dx:ASPxGridView>
						  <dx:ASPxGridViewExporter ID="gvSelectedVarsExporter" runat="server" GridViewID="gvSelectedVars"></dx:ASPxGridViewExporter>
									</td>
								</tr>
							</table>

						</dx:PanelContent>
					</PanelCollection>
				</dx:ASPxCallbackPanel>

			</td>
		</tr>
	</table>

		
		</td>
	</tr>
</table>			

						


	<br />
	<br />




	<br />
	<br />


		<dx:ASPxCallbackPanel ID="callbackOutput" runat="server"  OnCallback="callbackOutput_OnCallback" ClientInstanceName="callbackOutput">
		<PanelCollection>
			<dx:PanelContent ID="panelcontentOutput" runat="server">
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


	<dx:ASPxPopupControl ID="popError" ClientInstanceName="popError" runat="server" Width="320" CloseAction="CloseButton" CloseOnEscape="true" Modal="True">
												  <ContentCollection>
													  <dx:PopupControlContentControl>
															<dx:ASPxLabel ID="lblError" runat="server" ClientInstanceName="lblError" Text="" ForeColor="Red" EnableClientSideAPI="true" ClientVisible="false"></dx:ASPxLabel>
													  </dx:PopupControlContentControl>
												  </ContentCollection>
											  </dx:ASPxPopupControl>





	<asp:SqlDataSource ID="SqlDataProject" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select 0 dataproj_pk, 'LIVE DATA (coming...)' projTitle  union select dataproj_pk, projTitle from dp.DataProject where studyID=@studyID">
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