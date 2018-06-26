<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="Explore2.aspx.cs" Inherits="DataProject_Explore2" 
	 EnableEventValidation="false" Title="Explore Data Project"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %> 
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

	<style type="text/css">
		.maxWidth {
			max-width:450px;
		}
		.editor {
			padding-bottom: 8px;
			padding-right: 1px;
			width: 100%;
		} 
		.container {
			display: table;
			width: 100%;
		}
		@media(min-width:500px) {
			.container > * {
				display: table-cell;
				vertical-align: top;
			}
			.editor {
				vertical-align: middle;
				width: 110px;
				padding-right: 10px;
				padding-bottom: 0;
			}
		}
		.lastEditor {
			padding-right: 0; 
			padding-bottom: 0px;
		}
	</style>

	<script type="text/javascript">
		function DeleteVar(s, e)
		{
			var x = s.GetRowValues(e.visibleIndex, "fldpk", UnselectVarInGrid);
		}

		function UnselectVarInGrid(key)
		{
			gridSelVars.UnselectRowsByKey(key);
		}

		function SubjSelectionChanged(s, e) {


			var num = gridSelSubj.GetSelectedRowCount();
			selsubj_n.SetText("(" + num + " selected)");
			selsubj_n2.SetText("(" + num + " selected)");

			SetupReload();

		}
		function MeasSelectionChanged(s, e) {

			var num = gridSelMeas.GetSelectedRowCount();
			selmeas_n.SetText("(" + num + " selected)");

			SetupReload();

		}
		function VarSelectionChanged(s, e) {

			var num = gridSelVars.GetSelectedRowCount();
			selvars_n.SetText("(" + num + " selected)");
			selvars_n2.SetText("(" + num + " selected)");

			SetupReload();
		}

		function SetupReload()
		{
			panelResults.SetVisible(false);
			panelInfo.SetVisible(false);
			btnLoad.SetVisible(true);
		}


		function btStart_Click(s, e) {
			panelResults.PerformCallback();
			//loadingPanel.Show();
			//timerCheckProgress.SetEnabled(true);
			//progressBar.SetPosition(0);

			//btStart.SetEnabled(false);
			//btCancel.SetEnabled(true);
		}

		function panelResults_EndCallback(s, e) {
			loadingPanel.Hide();
			timerCheckProgress.SetEnabled(false);
			btStart.SetEnabled(true);

			btCancel.SetEnabled(false);

			if (s.cp_isFinished) {
				//alert("Process is complete");
				delete (s.cp_isFinished);
			}
		}

		function btCancel_Click(s, e) {
			clbCancel.PerformCallback();
		}


	</script>

	

	<dx:ASPxHiddenField ID="needBindVars" runat="server" ClientInstanceName="needBindVars">
	</dx:ASPxHiddenField>



	<dx:ASPxLabel ID="lbl0" runat="server" Text="Explore2 Data Project" Font-Size="Medium" Font-Bold="true" ForeColor="Gray"></dx:ASPxLabel>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<dx:ASPxLabel ID="lblPK" runat="server" Text="" Font-Size="Medium" Font-Bold="true" ForeColor="Gray"></dx:ASPxLabel>
	<br />
	<br />

	<table>
		<tr>
			<%--    First Column with TextBoxes--%>
		<td style="width: 425px; vertical-align: top">
				<dx:ASPxLabel ID="lblTitle0" runat="server" Text="Title:" Font-Size="XX-Small"></dx:ASPxLabel>
				<dx:ASPxLabel ID="lblTitle" runat="server" Width="400px" Font-Size="Medium"></dx:ASPxLabel><br />

				<br />
				<dx:ASPxLabel ID="lblStatus" runat="server" Text=""  Font-Size="XX-Small"></dx:ASPxLabel>
			</td>

			<%--    Second Column with Selectors--%>
			<td>
					<table>
					<tr>
						<td style="vertical-align: top">

						</td>
						<td style="vertical-align: top; width: 200px">
				<br />
						</td>
						<td style="width: 50px"></td>
						<td style="vertical-align: top">

							<dx:ASPxButton ID="btnEditProject" runat="server" Text="Edit this Data Project"   ClientInstanceName="btnEditProject" AutoPostBack="true" OnClick="btnEditProject_OnClick">
								<Image IconID="actions_edit_16x16devav"></Image>
							</dx:ASPxButton>							&nbsp;&nbsp;&nbsp;&nbsp;
						<td style="width: 50px"></td>
							<td style="vertical-align: top">
							<dx:ASPxButton ID="btnProjects" runat="server" Text="Return To All Data Projects"   ClientInstanceName="btnSets" AutoPostBack="False">
								 <clientsideevents click="function(s, e) {document.location.href = 'Index.aspx';}"></clientsideevents>
								<Image IconID="actions_changeview_16x16devav"></Image>
							</dx:ASPxButton>
						</td>

					</tr>
				</table>


			</td>
		</tr>
	</table>

		<%--	</td>
		</tr>
	</table>--%>


	<br />
	<br />

	
	<dx:ASPxPageControl ID="Tabs" Width="100%" runat="server" CssClass="dxtcFixed" ActiveTabIndex="0" EnableHierarchyRecreation="True" >
		<TabPages>
			<dx:TabPage Text="Loaded Data">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl4" runat="server">





						<table>
							<tr>
								<td style="vertical-align: top; width: 180px">
									<dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Subjects" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
									<dx:ASPxLabel ID="selsubj_n" ClientInstanceName="selsubj_n" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>
									<br />
									<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Measures" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
									<dx:ASPxLabel ID="selmeas_n" ClientInstanceName="selmeas_n" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>
									<br />
									<dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Variables" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
									<dx:ASPxLabel ID="selvars_n" ClientInstanceName="selvars_n" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>
									<br />
									<br />
									<dx:ASPxButton ID="btnLoad" runat="server" Text="Load Data" OnClick="btnLoad_OnClick" ClientInstanceName="btnLoad"></dx:ASPxButton>
									<dx:ASPxButton ID="btnBuild" runat="server" Text="Build Data Project" OnClick="btnBuild_OnClick" ClientInstanceName="btnBuild"></dx:ASPxButton>
				



								</td>
								<td style="vertical-align: top">
									<dx:ASPxPanel ID="panelInfo" runat="server" ClientVisible="false" ClientInstanceName="panelInfo">
										<PanelCollection>
											<dx:PanelContent>
												<br />
												<br />
												<table>
													<tr>
														<td style="vertical-align: top">
															<dx:ASPxLabel ID="lblLoadedDataInfo" runat="server" Text=""></dx:ASPxLabel>
															<br />
															<dx:ASPxGridView ID="gridInfoMsg" runat="server" AutoGenerateColumns="true" Visible="true" Width="702px">
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
																		<dx:ASPxCheckBox ID="chkOpt_hist" runat="server" Text="Histograms" />
																	</td>
																	<td style="vertical-align: central; width: 30px;">
																		
																	</td>
																	<td style="vertical-align: central">
																		<table>
																			<tr>
																				<td>
																					<dx:ASPxLabel ID="lblbyRow" runat="server" Text="Rows:"></dx:ASPxLabel>
																				</td>
																				<td>
																					<dx:ASPxComboBox ID="cboLevelsRow" runat="server">
																						<Items>
																							<dx:ListEditItem Value="timept" Text="TimePt" Selected="true" />
																							<dx:ListEditItem Value="group" Text="Group" Selected="false" />
																							<dx:ListEditItem Value="txgrp" Text="TxGrp" Selected="false" />
																							<dx:ListEditItem Value="sex" Text="Sex" Selected="false" />
																							<dx:ListEditItem Value="none" Text="-None-" Selected="false" />
																						</Items>
																					</dx:ASPxComboBox>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<dx:ASPxLabel ID="lblbyCol" runat="server" Text="Cols:"></dx:ASPxLabel>
																				</td>
																				<td>
																					<dx:ASPxComboBox ID="cboLevelsCol" runat="server">
																						<Items>
																							<dx:ListEditItem Value="timept" Text="TimePt" Selected="false" />
																							<dx:ListEditItem Value="group" Text="Group" Selected="true" />
																							<dx:ListEditItem Value="txgrp" Text="TxGrp" Selected="false" />
																							<dx:ListEditItem Value="sex" Text="Sex" Selected="false" />
																							<dx:ListEditItem Value="none" Text="-None-" Selected="false" />
																						</Items>
																					</dx:ASPxComboBox>
																				</td>
																			</tr>
																		</table>

														
							
																	</td>
																</tr>
																<tr>
																	<td colspan="3">
																		<dx:ASPxCheckBox ID="chkOpt_desc" runat="server" Text="Descriptives tables (M, SD, N, etc.)" />
																	</td>
																</tr>
																<tr>
																	<td colspan="3">
																		<dx:ASPxCheckBox ID="chkOpt_miss" runat="server" Text="Data Counts table (assess missingness)" />
																	</td>
																</tr>
<%--																<tr>
																	<td colspan="3">
																	</td>
																</tr>--%>
																<tr>
																	<td colspan="3">
																		<dx:ASPxCheckBox ID="chkOpt_data_stackvar" runat="server" Text="Stacked Data Table (1 row per var)" Visible="false" />
																		<dx:ASPxCheckBox ID="chkOpt_data_long" runat="server" Text="Long Data Table (1 row per Subject per TimePt)" />
																	</td>
																</tr>
															</table>

															 <dx:ASPxButton ID="btStart" runat="server" Text="Load Stats" AutoPostBack="false" ClientInstanceName="btStart">
																<Image IconID="actions_viewsetting_16x16devav"></Image>
																<ClientSideEvents Click="btStart_Click" />
															</dx:ASPxButton>
															<br />
															<br />
															<dx:ASPxButton ID="btnXLSX" runat="server" Text="Save XLSX" OnClick="btnXLSX_OnClick" Visible="false">
																<Image IconID="export_exporttoxlsx_16x16office2013"></Image>
															</dx:ASPxButton>
															<br /><br />

															<dx:ASPxButton ID="btCancel" runat="server" Text="Cancel" AutoPostBack="false" ClientEnabled="false" ClientVisible="false" ClientInstanceName="btCancel">
																<Image IconID="actions_cancel_32x32"></Image>
																<ClientSideEvents Click="btCancel_Click" />
															</dx:ASPxButton>
														</td>
													</tr>
												</table>


											</dx:PanelContent>
										</PanelCollection>
									</dx:ASPxPanel>

								</td>
							</tr>
						</table>


					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="Saved Data Files">
				<ContentCollection>
					<dx:ContentControl>
						<dx:ASPxGridView ID="gridFiles" runat="server">

						</dx:ASPxGridView>
					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="Select Subjects">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl1" runat="server">

					 <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Subjects" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
								<dx:ASPxLabel ID="selsubj_n2" ClientInstanceName="selsubj_n2" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>
										<dx:ASPxButton runat="server" ID="btnExpandSubj" Visible="true" Text="+" Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true" >
											<ClientSideEvents Click="function() { gridSelSubj.ExpandAll() }" />
										</dx:ASPxButton>
										<dx:ASPxButton runat="server" ID="btnCollapseSubj" Visible="true" Text="-"  Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true"  >
											<ClientSideEvents Click="function() { gridSelSubj.CollapseAll() }" />
										</dx:ASPxButton>                                               
										<br />
										<dx:ASPxGridView ID="gridSelSubj" runat="server" KeyFieldName="subjID" ClientInstanceName="gridSelSubj">
											<ClientSideEvents SelectionChanged="SubjSelectionChanged" />
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

					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="Select Measures">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl2" runat="server">
						<dx:ASPxCallbackPanel ID="gridMeasCallback" runat="server" OnCallback="gridMeasCallback_OnCallback" ClientInstanceName="gridMeasCallback">
								<PanelCollection>
									<dx:PanelContent ID="PanelContent4" runat="server">



										<dx:ASPxLabel ID="title_pivMeas" runat="server" Text="Measures" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
										<dx:ASPxLabel ID="selmeas_n2" ClientInstanceName="selmeas_n2" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>
											
										<dx:ASPxButton runat="server" ID="btnExpandMeas" Visible="true" Text="+" Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true" >
											<ClientSideEvents Click="function() { gridSelMeas.ExpandAll() }" />
										</dx:ASPxButton>
										<dx:ASPxButton runat="server" ID="btnCollapseMeas" Visible="true" Text="-"  Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true"  >
											<ClientSideEvents Click="function() { gridSelMeas.CollapseAll() }" />
										</dx:ASPxButton>                                                <br />
											
											<dx:ASPxGridView ID="gridSelMeas" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridSelMeas"
													KeyFieldName="studymeasID"  >
												<ClientSideEvents SelectionChanged="MeasSelectionChanged" />
												<Columns>
													<dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True"  VisibleIndex="0" />
													<dx:GridViewDataColumn FieldName="TimePt" Caption="TimePt" VisibleIndex="0"  GroupIndex="0"  Width="120px"></dx:GridViewDataColumn>
													<dx:GridViewDataColumn FieldName="StudyMeasName" Caption="StudyMeasure" VisibleIndex="1"  Width="180px"></dx:GridViewDataColumn>
													<dx:GridViewDataColumn FieldName="Category" Caption="Category" VisibleIndex="2" Width="180px"></dx:GridViewDataColumn>
													<dx:GridViewDataColumn FieldName="isREL" Caption="is REL?" VisibleIndex="3" Width="70px"></dx:GridViewDataColumn>
													<dx:GridViewCommandColumn ShowClearFilterButton="true" ShowApplyFilterButton="true" VisibleIndex="4" />
													<dx:GridViewDataColumn FieldName="studymeasID" Caption="studymeasID" Visible="false"></dx:GridViewDataColumn>
													<dx:GridViewDataColumn FieldName="measureID" Caption="measureID" Visible="false"></dx:GridViewDataColumn>
													<dx:GridViewDataColumn FieldName="tblname" Caption="tblname" Visible="false"></dx:GridViewDataColumn>
													<dx:GridViewDataColumn FieldName="MeasName" Caption="MeasName" Visible="false"></dx:GridViewDataColumn>
												</Columns>
												<Settings ShowGroupPanel="true" ShowFilterRow="true"  ShowFilterRowMenu="true" 
														VerticalScrollBarMode="Visible" VerticalScrollableHeight="400" />
												<SettingsPager Mode="ShowAllRecords" />
												<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="false" FilterRowMode="OnClick"  />
												<Settings ShowFilterBar="Visible"  />
												<SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />
												<GroupSummary>
													<dx:ASPxSummaryItem FieldName="timepoint_text" SummaryType="Count" />
												</GroupSummary>
											</dx:ASPxGridView>


									</dx:PanelContent>
								</PanelCollection>
							</dx:ASPxCallbackPanel>

					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="Select Variables">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl3" runat="server">


							<dx:ASPxCallbackPanel ID="gridVarsCallback" runat="server" OnCallback="gridVarsCallback_OnCallback" ClientInstanceName="gridVarsCallback">
								<PanelCollection>
									<dx:PanelContent ID="PanelContent2" runat="server">
										<dx:ASPxLabel ID="title_pivVar" runat="server" Text="Variables" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
										<dx:ASPxLabel ID="selvars_n2" ClientInstanceName="selvars_n2" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>
						
										<dx:ASPxButton runat="server" ID="btnExpandVars" Visible="true" Text="+" Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true" >
											<ClientSideEvents Click="function() { gridSelVars.ExpandAll() }" />
										</dx:ASPxButton>
										<dx:ASPxButton runat="server" ID="btnCollapseVars" Visible="true" Text="-"  Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true"  >
											<ClientSideEvents Click="function() { gridSelVars.CollapseAll() }" />
										</dx:ASPxButton>

										<br />

										<dx:ASPxGridView ID="gridSelVars" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridSelVars"
											  KeyFieldName="fldpk" >
											<ClientSideEvents SelectionChanged="VarSelectionChanged" />
											<Columns>
												<dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True"  VisibleIndex="0"/>
												<dx:GridViewDataColumn FieldName="measname" Caption="Measure" VisibleIndex="2" GroupIndex="0" Width="100px"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="fldname" Caption="Variable" VisibleIndex="0" Width="150px"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="fieldlabel" Caption="Label" VisibleIndex="1" Width="350px"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="CoreVar" Caption="Core Var" VisibleIndex="3"  Width="150px"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="VarType" Caption="VarType" VisibleIndex="4"  Width="150px"></dx:GridViewDataColumn>
												 <dx:GridViewCommandColumn ShowClearFilterButton="true" ShowApplyFilterButton="true" VisibleIndex="5" />
												<%--<dx:GridViewDataColumn FieldName="fldpk" Caption="fldpk" Visible="false"></dx:GridViewDataColumn>--%>
											</Columns>
											<Settings ShowGroupPanel="true" ShowFilterRow="true" ShowFilterRowMenu="true" ShowFilterBar="Visible"  
												VerticalScrollBarMode="Visible" VerticalScrollableHeight="400" />
											<SettingsPager Mode="ShowAllRecords" />
											<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="false"  FilterRowMode="OnClick"   />
											<SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />

											<GroupSummary>
												<dx:ASPxSummaryItem FieldName="measname" SummaryType="Count" />
											</GroupSummary>
										</dx:ASPxGridView>

									</dx:PanelContent>
								</PanelCollection>
							</dx:ASPxCallbackPanel>
					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>



		</TabPages>
	</dx:ASPxPageControl>
	<br />
	<br />

	<dx:ASPxCallbackPanel ID="panelResults" runat="server" ClientInstanceName="panelResults" ClientVisible="true" 
		 OnCallback="panelResults_OnCallback">
		  <ClientSideEvents EndCallback="panelResults_EndCallback" />
		<PanelCollection>
			<dx:PanelContent>

<%--			<dx:ASPxGridView ID="gridData" runat="server" AutoGenerateColumns="true"  Visible="true">
					<Settings HorizontalScrollBarMode="Auto" />
				</dx:ASPxGridView>
	--%>

				<dx:ASPxPanel ID="panelCharts" runat="server" ClientInstanceName="panelCharts" EncodeHtml="false">
					<PanelCollection >
						<dx:PanelContent ID="panelChartsContent" runat="server"  >
						</dx:PanelContent>
					</PanelCollection>
				</dx:ASPxPanel>
				<br />
				<br />


				 <dx:ASPxSplitter ID="splitter_descstats" runat="server" Height="850px" Width="95%" ClientInstanceName="splitter1" ClientVisible="true">
					<Panes>
						<dx:SplitterPane ScrollBars="Auto" ShowCollapseBackwardButton="true" >
							<ContentCollection>
								<dx:SplitterContentControl ID="SplitterContentControl1" runat="server">

						
									<dx:ASPxPanel ID="panelDescStats" runat="server" ClientInstanceName="panelDescStats" >
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
						<dx:SplitterPane ScrollBars="Auto"  Size="550px" ShowCollapseForwardButton="true" >
							<ContentCollection>
								<dx:SplitterContentControl ID="SplitterContentControl2" runat="server">
									<dx:ASPxPanel ID="panelDescStatsCharts" runat="server" ClientInstanceName="panelDescStatsCharts" >
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
				<dx:ASPxPanel ID="panelMissing" runat="server"   >
					<PanelCollection>
						<dx:PanelContent>
						<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="(Right-click for additional pivot table controls)" Font-Size="xx-small" ForeColor="SkyBlue"></dx:ASPxLabel>
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
				

				<dx:ASPxPanel ID="panelDataStackvar" runat="server" ClientInstanceName="panelDataStackvar"  >
				<PanelCollection>
					<dx:PanelContent>
						<dx:ASPxGridView ID="gridDataStackvar" runat="server" AutoGenerateColumns="true" >
							<Settings HorizontalScrollBarMode="Auto" ShowFilterRow="true" AutoFilterCondition="Contains"  ShowFilterRowMenu="true" ShowFilterRowMenuLikeItem="true"  ShowStatusBar="Visible"  />
							<SettingsBehavior AllowDragDrop="False" EnableRowHotTrack="True" />
							<SettingsPager NumericButtonCount="3"  PageSize="30" Summary-Visible="true" />
						</dx:ASPxGridView>

					</dx:PanelContent>
				</PanelCollection>
			</dx:ASPxPanel>

				<dx:ASPxPanel ID="panelDataLong" runat="server" ClientInstanceName="panelDataLong" >
				<PanelCollection>
					<dx:PanelContent>
						<dx:ASPxGridView ID="gridDataLong" runat="server" AutoGenerateColumns="true" OnDataBound="gridDataLong_OnDataBound"   Width="95%" >
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
			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxCallbackPanel>

	<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server"
		ClientInstanceName="loadingPanel" Modal="True" ContainerElementID="gridView">
		<Template>
			<div style="text-align: center">
				<dx:ASPxLabel ID="ASPxLabelprocessing" runat="server" Text="Processing..." Font-Size="18"></dx:ASPxLabel>
				<br />
				<dx:ASPxProgressBar ID="ASPxProgressBar1" runat="server" Position="0"
					Width="200px" ClientInstanceName="progressBar">
				</dx:ASPxProgressBar>
			</div>
		</Template>
	</dx:ASPxLoadingPanel>

	 <dx:ASPxCallback ID="clbProgress" runat="server" ClientInstanceName="clbProgress" OnCallback="clbProgress_Callback">
			<ClientSideEvents
				CallbackComplete="function(s, e) {
					progressBar.SetPosition(e.result);
				}" />
		</dx:ASPxCallback>

		<dx:ASPxTimer ID="timerCheckProgress" runat="server" ClientInstanceName="timerCheckProgress" Enabled="False" Interval="100">
			<ClientSideEvents
				Tick="function(s, e) {
					clbProgress.PerformCallback();
				}" />
		</dx:ASPxTimer>

		<dx:ASPxCallback ID="clbCancel" runat="server" ClientInstanceName="clbCancel" OnCallback="clbCancel_Callback"></dx:ASPxCallback>

	<br />
	<br />

</asp:Content>

   
