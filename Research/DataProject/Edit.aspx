<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="DataProject_Edit" 
	 EnableEventValidation="false" Title="Edit Data Project"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %> 


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

		function SubjsetSelectionChanged(s, e) {

			gridSubjCallback.PerformCallback();
			//varCallback.PerformCallback();
		}
		function MeasSelectionChanged(s, e) {

			var num = gridSelMeas.GetSelectedRowCount();
			selmeas_n.SetText("(" + num + " selected)");
			selmeas_n2.SetText("(" + num + " selected)");
			//hideResults();

			//This will update the Meas pivot table
			gridMeasCallback.PerformCallback();

			//This will update the gridSelVars
			gridVarsCallback.PerformCallback();

			gridMeasNoVarsCallback.PerformCallback();
		}
		function VarSelectionChanged(s, e) {

			var num = gridSelVars.GetSelectedRowCount();
			selvars_n.SetText("(" + num + " selected)");
			selvars_n2.SetText("(" + num + " selected)");

			pivotVarsCallback.PerformCallback();
		}

		function IntHxSelectionChanged(s, e) {

			//var num = gridSelVars.GetSelectedRowCount();
			//selvars_n.SetText("(" + num + " selected)");
			//selvars_n2.SetText("(" + num + " selected)");
			var grid = gridSelIntHx;
			var measIDs = grid.GetSelectedFieldValues("timept", RefreshTxOptions);


			pivotIntHxCallback.PerformCallback();
		}

		function RefreshTxOptions(measIDs) {

			//gridTxType.SetVisible(false);
			//gridTxCat.SetVisible(false);
			//gridTxAll.SetVisible(false);


			//if (measIDs.length == 0) return;
			//for (j = 0; j < measIDs.length; j++) {
			//	var measID = measIDs[j];

			//	if (measID == "815") gridTxType.SetVisible(true);
			//	if (measID == "816") gridTxCat.SetVisible(true);
			//	if (measID == "817") gridTxAll.SetVisible(true);

			//}
		}

		function gridTxAllSelectionChanged(s, e) {

		}

		function VartypeChanged(s, e)
		{
			var x = rblVartype.GetValue();
			//gridVarsCallback.PerformCallback();
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


		function btnViewSelMeas_ClientClick() {
			if (PivotSelMeas.GetVisible() == true) {
				PivotSelMeas.SetVisible(false);
				pivotIntHxCallback.SetVisible(false);
				btnViewSelMeas.SetText("Show");
			}
			else if (PivotSelMeas.GetVisible() == false) {
				PivotSelMeas.SetVisible(true);
				pivotIntHxCallback.SetVisible(true);
				btnViewSelMeas.SetText("Hide");
			}
		}

		function btnViewSelSubj_ClientClick() {
			if (PivotSelSubj.GetVisible() == true) {
				PivotSelSubj.SetVisible(false);
				btnViewSelSubj.SetText("Show");
			}
			else if (PivotSelSubj.GetVisible() == false) {
				PivotSelSubj.SetVisible(true);
				btnViewSelSubj.SetText("Hide");
			}
		}

	</script>

	

	<dx:ASPxHiddenField ID="needBindVars" runat="server" ClientInstanceName="needBindVars">
	</dx:ASPxHiddenField>



	<dx:ASPxLabel ID="lbl0" runat="server" Text="Edit Data Project" Font-Size="Medium" Font-Bold="true" ForeColor="Gray"></dx:ASPxLabel>
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
						<td style="vertical-align: top; width: 150px; padding: 5px">
							<dx:ASPxButton ID="btnUpdate" runat="server" Text="Update Project" OnClick="btnUpdate_OnClick" ClientInstanceName="btnUpdate">
								<Image IconID="actions_save_16x16devav"></Image>
							</dx:ASPxButton>
							<dx:ASPxButton ID="btnNew" runat="server" Text="Save this Data Project"  OnClick="btnUpdate_OnClick">
								 <Image IconID="actions_save_16x16devav"></Image>
							</dx:ASPxButton>
							<dx:ASPxLabel ID="lblERROR" runat="server" Text="" ForeColor="Red"></dx:ASPxLabel>

						</td>
						<td style="vertical-align: top; padding: 5px">

							<dx:ASPxButton ID="btnExploreProject" runat="server" Visible="false" Text="Explore this Data Project"   ClientInstanceName="btnExploreProject" AutoPostBack="true" OnClick="btnExploreProject_OnClick">
								 <Image IconID="actions_viewsetting_16x16devav"></Image>
							</dx:ASPxButton>							&nbsp;&nbsp;&nbsp;&nbsp;
						<td style="vertical-align: top; padding: 5px">
								<dx:ASPxButton ID="btnFiles" runat="server" Text="Create/View Data Files" OnClick="btnFiles_OnClick" ClientInstanceName="btnFiles" Width="180px">
									<Image IconID="save_saveall_16x16office2013"></Image>
								</dx:ASPxButton>
							<br />
								<dx:ASPxButton ID="btnReports" runat="server" Text="View Data Reports" OnClick="btnReports_OnClick" ClientInstanceName="btnReports" Width="180px">
									<Image IconID="print_profilereport_16x16devav"></Image>
								</dx:ASPxButton>
						</td>
						<td style="vertical-align: top; padding: 5px">
							<dx:ASPxButton ID="btnClone" runat="server" Text="Clone this Data Project"   ClientInstanceName="btnSets" AutoPostBack="true"
								 OnClick="btnClone_OnClick">
								 <clientsideevents click="function(s, e) {document.location.href = 'Index.aspx';}"></clientsideevents>
								<Image IconID="actions_converttorange_16x16"></Image>
							</dx:ASPxButton>
						</td>
						<td style="vertical-align: top; width: 50px; padding: 5px">
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



	<br />
	<br />

		<dx:ASPxButton ID="btnView" runat="server" Text="View Details Summary" Visible="false" OnClick="btnView_OnClick" ClientInstanceName="btnView">
		<Image IconID="actions_search_16x16devav"></Image>
	</dx:ASPxButton>
	<dx:ASPxButton ID="btnHide" runat="server" Text="Hide Details Summary" Visible="false" OnClick="btnHide_OnClick" ClientInstanceName="btnHide">
		<Image IconID="actions_hide_16x16office2013"></Image>
	</dx:ASPxButton>
	<br />

<%--    View the current settings --%>
	<dx:ASPxPanel ID="viewPanel" runat="server" BackColor="AliceBlue" Visible="true">
		<PanelCollection>
			<dx:PanelContent >

	<table>
		<tr>
			<td style="vertical-align: top">
				<dx:ASPxCallbackPanel ID="gridSubjCallback" runat="server" OnCallback="gridSubjCallback_OnCallback" ClientInstanceName="gridSubjCallback">
					<PanelCollection>
						<dx:PanelContent ID="content2" runat="server" >
										
							<table>
								<tr>
									<td style="width: 135px">
										<dx:ASPxLabel ID="title_pivSubj" runat="server" Text="Selected Subjects" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
										<br />	
										<dx:ASPxLabel ID="selsubj_n" ClientInstanceName="selsubj_n" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>

									</td>
									<td style="vertical-align: top">
										<dx:ASPxButton ID="btnViewSelSubj" ClientInstanceName="btnViewSelSubj" runat="server" Text="Hide"
											ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="0" BackColor="WhiteSmoke">
											<ClientSideEvents Click="btnViewSelSubj_ClientClick" />
											</dx:ASPxButton>
									</td>
								</tr>
							</table>

							<dx:ASPxPivotGrid ID="PivotSelSubj" runat="server" OptionsCustomization-AllowFilter="false"   ClientInstanceName="PivotSelSubj"
								EncodeHtml="false" >
								<Fields>
									<dx:PivotGridField ID="field_subjstatus" Area="RowArea" AreaIndex="0"
										Caption="Subject Status" FieldName="subjstatus" Options-ShowTotals="false">
									</dx:PivotGridField>
									<dx:PivotGridField ID="field_TxGroup" Area="RowArea" AreaIndex="0"
										Caption="Tx Group" FieldName="txgrp" SortByAttribute="Tx Group">
									</dx:PivotGridField>
									<dx:PivotGridField ID="field_Group" Area="ColumnArea" AreaIndex="1"
										Caption="Group" FieldName="Group" SortByAttribute="Group">
									</dx:PivotGridField>
									<dx:PivotGridField ID="field_subjID" Area="DataArea" AreaIndex="0" 
										Caption="# Subjects" SummaryType="Count" FieldName="subjID">
									</dx:PivotGridField>
									<dx:PivotGridField ID="field_sex"  Caption="Sex" FieldName="sex" Area="FilterArea" Visible="false"></dx:PivotGridField>
									<dx:PivotGridField ID="field_race"  Caption="Race" FieldName="race"  Area="FilterArea" Visible="false"></dx:PivotGridField>
									<dx:PivotGridField ID="field_ethn"  Caption="Ethnicity" FieldName="ethnicity"  Area="FilterArea" Visible="false"></dx:PivotGridField>
								</Fields>
								<OptionsPager AlwaysShowPager="false" RowsPerPage="20" ></OptionsPager>
								<OptionsView ShowColumnTotals="true" ShowColumnGrandTotals="true" ShowRowGrandTotals="true" ShowFilterHeaders="false"  />
							</dx:ASPxPivotGrid>

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
											<td style="vertical-align: top;">
												<table>
													<tr>
														<td style="width: 145px">
															<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Selected Measures" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
															<br />
															<dx:ASPxLabel ID="selmeas_n" ClientInstanceName="selmeas_n" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>
														</td>
														<td style="vertical-align: top">
															<dx:ASPxButton ID="btnViewSelMeas" ClientInstanceName="btnViewSelMeas" runat="server" Text="Hide"
																ClientEnabled="true" EnableClientSideAPI="true" AutoPostBack="false" Paddings-Padding="0" BackColor="WhiteSmoke">
																<ClientSideEvents Click="btnViewSelMeas_ClientClick" />
																</dx:ASPxButton>
														</td>
													</tr>
												</table>

										
										<dx:ASPxPivotGrid ID="PivotSelMeas" runat="server" OptionsCustomization-AllowFilter="false" ClientInstanceName="PivotSelMeas"   
											OnCustomSummary="PivotSelMeas_Concat"  EncodeHtml="false" >
											<Fields>
												<dx:PivotGridField ID="field_meascat" Area="RowArea" AreaIndex="0"
													Caption="Category" FieldName="Category" Options-ShowTotals="false">
												</dx:PivotGridField>
												<dx:PivotGridField ID="field_timepoint" Area="ColumnArea" AreaIndex="0"
													Caption="TimePt" FieldName="TimePt" SortByAttribute="timepoint">
												</dx:PivotGridField>
												<dx:PivotGridField ID="field_meas" Area="DataArea" AreaIndex="0" 
													Caption="Measure" SummaryType="Custom" FieldName="StudyMeasName">
												</dx:PivotGridField>
											</Fields>
											<OptionsPager AlwaysShowPager="false" RowsPerPage="20" ></OptionsPager>
											<OptionsView ShowColumnTotals="false" ShowColumnGrandTotals="false" ShowRowGrandTotals="false" ShowFilterHeaders="false"  />
										</dx:ASPxPivotGrid>

											</td>
											<td style="vertical-align: top">

											</td>
										</tr>
									</table>
										<br />


									</dx:PanelContent>
								</PanelCollection>
							</dx:ASPxCallbackPanel>





				<table>
					<tr>
						<td style="vertical-align:top; padding: 15px">
							<dx:ASPxCallbackPanel ID="pivotIntHxCallback" runat="server" OnCallback="pivotIntHxCallback_OnCallback" ClientInstanceName="pivotIntHxCallback">
								<PanelCollection>
									<dx:PanelContent ID="PanelContent5" runat="server">
											<dx:ASPxGridView ID="PivotSelIntHx" runat="server"  AllowUserInput="false">
												<Columns>
													<dx:GridViewDataColumn FieldName="timept" Caption="IntHx Timept"></dx:GridViewDataColumn>
												</Columns>
											</dx:ASPxGridView>
									</dx:PanelContent>
								</PanelCollection>
							</dx:ASPxCallbackPanel>
						</td>
						<td style="vertical-align:top; padding: 15px">
								<dx:ASPxCallbackPanel ID="gridMeasNoVarsCallback" runat="server" OnCallback="gridMeasNoVarsCallback_OnCallback" ClientInstanceName="gridMeasNoVarsCallback">
									<PanelCollection>
										<dx:PanelContent ID="PanelContent6" runat="server">
											<dx:ASPxGridView ID="gridMeasWithNoVars"  runat="server" SettingsText-EmptyDataRow="Great! All measures have variables selected."  AllowUserInput="false" >
												<Columns>
													<dx:GridViewDataColumn FieldName="measname" Caption="Measures with No Selected Vars" CellStyle-ForeColor="Red"></dx:GridViewDataColumn>
												</Columns>
											</dx:ASPxGridView>
									</dx:PanelContent>
								</PanelCollection>
							</dx:ASPxCallbackPanel>
						</td>
					</tr>
				</table>





						</td>
						<td style="min-width: 10px;"></td>
						<td style="vertical-align: top; min-width: 800px">
							<dx:ASPxCallbackPanel ID="pivotVarsCallback" runat="server" OnCallback="pivotVarsCallback_OnCallback" ClientInstanceName="pivotVarsCallback">
								<PanelCollection>
									<dx:PanelContent ID="PanelContent3" runat="server">
									<table>
										<tr>
											<td style="vertical-align: top;">
												<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Selected Variables" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
												<dx:ASPxButton runat="server" ID="btnExpandV" Text="+" UseSubmitBehavior="false" AutoPostBack="false"  Native="true" >
													<ClientSideEvents Click="function() { gridProjVars.ExpandAll() }"  />
												</dx:ASPxButton>
												<dx:ASPxButton runat="server" ID="btnCollapseV" Text="-" UseSubmitBehavior="false" AutoPostBack="false"  Native="true"  >
													<ClientSideEvents Click="function() { gridProjVars.CollapseAll() }" />
												</dx:ASPxButton>												<br />
												<dx:ASPxLabel ID="selvars_n2" ClientInstanceName="selvars_n2" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>

										<br />

												<%--OnCustomButtonCallback="gridProjVars_CustomButtonCallback"  --%>
												<dx:ASPxGridView ID="gridProjVars" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridProjVars" Styles-GroupPanel-BackColor="AliceBlue" >
											<ClientSideEvents CustomButtonClick="DeleteVar" />
													
											<Columns>
												<dx:GridViewCommandColumn Caption="Del" ButtonRenderMode="Image" VisibleIndex="0" Width="50px">
													 <CustomButtons>
														<dx:GridViewCommandColumnCustomButton ID="Delete"   >
															<Image ToolTip="Delete Variable" Url="~/images/del.png" />
														</dx:GridViewCommandColumnCustomButton>
													</CustomButtons>
												</dx:GridViewCommandColumn>
												<dx:GridViewDataColumn FieldName="measname" Caption="Measure" VisibleIndex="2" GroupIndex="0" Width="100px"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="fldname" Caption="Variable" VisibleIndex="0" Width="100px"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="fieldlabel" Caption="Label" VisibleIndex="1"  Width="300px"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="VarType" Caption="VarType" VisibleIndex="3"  Width="100px"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="fldpk" Caption="fldpk" Visible="false"></dx:GridViewDataColumn>
											</Columns>
											<Settings ShowGroupPanel="True" VerticalScrollBarMode="Visible" VerticalScrollableHeight="320"  />
											<%--<SettingsPager PageSize="20" EnableAdaptivity="true" >
												<PageSizeItemSettings Visible="true" ShowAllItem="true" />
											</SettingsPager>--%>
											<SettingsPager Mode="ShowAllRecords" />
											<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="true"   />
											<GroupSummary>
												<dx:ASPxSummaryItem FieldName="measname" SummaryType="Count"  />
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

					</tr>

				</table>

			</td>
		</tr>
	</table>
	<br />
	
			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxPanel>



	<br />
	<br />

	<dx:ASPxPageControl ID="Tabs" Width="100%" runat="server" CssClass="dxtcFixed" ActiveTabIndex="0" EnableHierarchyRecreation="True" ActiveTabStyle-BackColor="LightGreen"  >
		<TabPages>
			<dx:TabPage Text="Edit Title & Summary" >
				<ContentCollection>
					<dx:ContentControl ID="ContentControl4" runat="server">
						<dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Title:" Font-Size="XX-Small"></dx:ASPxLabel>
						<dx:ASPxTextBox ID="txtTitle" runat="server" Width="90%" Font-Size="Medium">
							 <ValidationSettings SetFocusOnError="True" ErrorText="Title must be at least 3 characters long" Display="Dynamic" ErrorTextPosition="Top">
								<RequiredField IsRequired="True" ErrorText="Title is required" />
							</ValidationSettings>
						</dx:ASPxTextBox><br />

						<br />
						<dx:ASPxHtmlEditor ID="HtmlEditor" runat="server" Height="450px" Width="90%" ActiveView="Preview" >
							<Settings AllowHtmlView="False"></Settings>
							<SettingsDialogs>
								<InsertImageDialog>
									<SettingsImageUpload UploadFolder="~/UploadFiles/Images/">
										<ValidationSettings AllowedFileExtensions=".jpe,.jpeg,.jpg,.gif,.png" MaxFileSize="500000">
										</ValidationSettings>
									</SettingsImageUpload>
								</InsertImageDialog>
							</SettingsDialogs>
						</dx:ASPxHtmlEditor>
					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>

			<dx:TabPage Text="Select Subjects">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl1" runat="server">

					   <table>
						<tr>
							<td style="vertical-align: top">
								Select Set of Subjects:<dx:ASPxLabel ID="lblSubj" runat="server" Text="" Font-Bold="true"></dx:ASPxLabel>
								<dx:ASPxLabel  ID="ASPxLabel3" runat="server" Text="" Font-Bold="true" ForeColor="RoyalBlue" ClientInstanceName="selsubj_n"></dx:ASPxLabel>   
									<br />

								<%--OnSelectedIndexChanged="cboSubjSet_SelectedIndexChanged" --%>
								<dx:ASPxComboBox ID="cboSubjSet" runat="server" Width="250px"   ValueField="subjset_pk" OnDataBound="cboSubjSet_DataBound"
									  ClientInstanceName="cboSubjSet">
									<ClientSideEvents ValueChanged="SubjsetSelectionChanged"  />
									<Columns>
										<dx:ListBoxColumn FieldName="nsubj" Caption="# Subjects" Width="60px" />
										<dx:ListBoxColumn FieldName="subjset" Caption="Set" Width="200px" />
									</Columns>
<%--									<ValidationSettings SetFocusOnError="False" ErrorText="You must select a subject set" Display="Dynamic"  ErrorTextPosition="Top">
										<RequiredField IsRequired="true" ErrorText="Select subjects" />
									</ValidationSettings>--%>
								</dx:ASPxComboBox>

							</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<dx:ASPxButton ID="ASPxButton1" runat="server" Text="View Subject Sets"   ClientInstanceName="btnSets" AutoPostBack="False" >
									<clientsideevents click="function(s, e) {document.location.href = 'SubjSets.aspx';}"></clientsideevents>
								</dx:ASPxButton>
							</td>
						</tr>
					</table>

					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="Select Measures">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl2" runat="server">
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
					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="Select Variables">
				<ContentCollection>
					<dx:ContentControl ID="ContentControl3" runat="server">

<%--						<dx:ASPxRadioButtonList  ID="rblVartype" runat="server" RepeatColumns="3" RepeatLayout="Flow"
							Caption="Choose Variable Type" ClientInstanceName="rblVartype"  >
							<CaptionSettings Position="Top" />
							<ClientSideEvents SelectedIndexChanged="VartypeChanged" />
							<Items>
								<dx:ListEditItem Value="Continuous" Selected="true" />
								<dx:ListEditItem Value="Categorical" Selected="false" />
								<dx:ListEditItem Value="Date" Selected="false" />
							</Items>
						</dx:ASPxRadioButtonList>
						<br />--%>

							<dx:ASPxCallbackPanel ID="gridVarsCallback" runat="server"  OnCallback="gridVarsCallback_OnCallback" ClientInstanceName="gridVarsCallback">
								<PanelCollection>
									<dx:PanelContent ID="PanelContent2" runat="server">
										<dx:ASPxLabel ID="title_pivVar" runat="server" Text="Variables" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
										<dx:ASPxLabel ID="selvars_n" ClientInstanceName="selvars_n" runat="server" Text="" Font-Size="small" Font-Bold="true" ForeColor="SkyBlue"></dx:ASPxLabel>
						
										<dx:ASPxButton runat="server" ID="btnExpandVars" Visible="true" Text="+" Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true" >
											<ClientSideEvents Click="function() { gridSelVars.ExpandAll() }" />
										</dx:ASPxButton>
										<dx:ASPxButton runat="server" ID="btnCollapseVars" Visible="true" Text="-"  Font-Size="XX-Small" UseSubmitBehavior="false" AutoPostBack="false"  Native="true"  >
											<ClientSideEvents Click="function() { gridSelVars.CollapseAll() }" />
										</dx:ASPxButton>
										<br />
										<dx:ASPxLabel ID="ASPxLabel5" runat="server" Text=" Note: when you select any date variables, an additional var of the subject's age on that date is automatically included (in mos, calculated as age in days/(365/12))." Font-Size="Small" Font-Bold="false"></dx:ASPxLabel>
										
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
			<dx:TabPage Text="Select IntHx Data">
				<ContentCollection>
					<dx:ContentControl>
						<br />
						<dx:ASPxCallbackPanel ID="gridIntHxCallback" runat="server"  OnCallback="gridIntHxCallback_OnCallback" ClientInstanceName="gridIntHxCallback">
							<PanelCollection>
								<dx:PanelContent ID="PanelContent4" runat="server">

						<table>
							<tr>
								<td style="width: 500px">
									<b>Select the Timepoints to include.</b><br />  IntHx data is aggregated across all weeks within one timept up until the next.  The final timept defaults to include data from the timept and the following 12 months.</b>
									<br /><br />
									<b>2 worksheets will be created:
										<br />1) Data_IntHx_by_TP</b> (with info aggregated within TP)
										<br /><b>2) Data_IntHx_TOTAL</b> (with info aggregated across all selected TP)
									<br />
									<i>IntHx data occuring in TP that are not selected will not be included in the data.</i>
									<dx:ASPxTextBox ID="txtMonthsAfterLastTimept" runat="server" Text="12" Width="60" Visible="false" Caption="Include how many months after last time point:"></dx:ASPxTextBox>
								</td>
								<td style="width: 30px"></td>
								<td>
									<br />
									<asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl="~/DataProject/IntHxTxCat.aspx" 
										Text="Click here to view info regarding IntHx Tx Categories"></asp:HyperLink>
								</td>
							</tr>

							<tr>
								<td colspan="3">
									<br />
									<dx:ASPxGridView ID="gridSelIntHx" runat="server"  AutoGenerateColumns="false" ClientInstanceName="gridSelIntHx"
										 KeyFieldName="timept" >
										<ClientSideEvents SelectionChanged="IntHxSelectionChanged" />
										<Columns>
											<dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True"  VisibleIndex="0"/> 
											<dx:GridViewDataColumn FieldName="studyname" Caption="Study" VisibleIndex="0" Visible="true" Width="100px"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="timept" Caption="timept" VisibleIndex="1" Visible="true" Width="100px"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="tporder" Caption="tporder" VisibleIndex="2" Visible="true" Width="50px"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="n_subjects" Caption="# subjects" VisibleIndex="3" Visible="true" Width="50px"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="avg_nwks_in_tp" Caption="Avg # wks in timept" VisibleIndex="4" Visible="true" Width="50px"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="earliest_start_date" Caption="Earliest start date" VisibleIndex="5" Visible="true" Width="50px"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="latest_end_date" Caption="Latest end date" VisibleIndex="6" Visible="true" Width="50px"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="avg_agemos_beg" Caption="Avg Age(mos) beg" VisibleIndex="7" Visible="true" Width="50px"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="avg_agemos_end" Caption="Avg Age(mos) end" VisibleIndex="8" Visible="true" Width="50px"></dx:GridViewDataColumn>

										</Columns>
									</dx:ASPxGridView>
									<br /><br />
								</td>
							</tr>
							
						</table>


									</dx:PanelContent>
								</PanelCollection>
							</dx:ASPxCallbackPanel>
					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			
			<dx:TabPage Text="Define Composites">
				<ContentCollection>
					<dx:ContentControl>
						Define composite variables.
						

						<br />
						<dx:ASPxGridView ID="gridCompvar" runat="server" DataSourceID="SqlCompvar" AutoGenerateColumns="false" ClientInstanceName="gridCompvar"
								KeyFieldName="compvar_pk" OnDataBound="gridCompvar_OnDataBound"   >
							
							<SettingsDataSecurity AllowInsert="true" AllowDelete="true" AllowEdit="true" />
							<SettingsEditing Mode="Inline"/>
							<Columns>
								<dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true" VisibleIndex="0"  ShowDeleteButton="true" Width="80px"></dx:GridViewCommandColumn>
								<dx:GridViewDataColumn FieldName="compvarname" CellStyle-Font-Bold="true" Caption="Composite Var" ReadOnly="false" VisibleIndex="1" CellStyle-Font-Size="12pt"  Width="120px"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="compvarlabel" Caption="Composite Var Label" ReadOnly="false" VisibleIndex="2"  CellStyle-Font-Size="12pt"  Width="350px"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="numvars" Caption="# Variables" ReadOnly="true" Visible="true"  CellStyle-Font-Size="12pt" Width="80px" ></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="compvar_pk" ReadOnly="true" Visible="false" ></dx:GridViewDataColumn>
							</Columns>
							<Templates>
								<DetailRow>
									<dx:ASPxGridView ID="gridCompvarvar" runat="server" DataSourceID="SqlCompvarvar" AutoGenerateColumns="false" ClientInstanceName="gridCompvarvar"
										KeyFieldName="compvarvar_pk"  OnBeforePerformDataSelect="detailGrid_DataSelect" 
										OnInitNewRow="Compvar_InitNewRow" OnParseValue="Compvar_OnParseValue"
										OnRowInserting="Compvarvar_OnRowInserting" OnRowUpdating="Compvarvar_OnRowUpdating"  
										OnHtmlRowPrepared="Compvarvar_HtmlRowPrepared"
										>

										<SettingsDataSecurity AllowInsert="true" AllowDelete="true" AllowEdit="true" />
										<SettingsEditing Mode="Inline"/>
										<Columns>
											<dx:GridViewDataComboBoxColumn FieldName="var_pk" Caption="Variable" ReadOnly="false" Width="400px" PropertiesComboBox-EncodeHtml="false" >
												<PropertiesComboBox DataSourceID="SqlVars" ValueField="var_pk" TextField="varlabel" />
											</dx:GridViewDataComboBoxColumn>											
											<dx:GridViewDataComboBoxColumn FieldName="ref_timepointID" Caption="Reference Timept" ReadOnly="false" >
												<PropertiesComboBox DataSourceID="SqlTimepoint" ValueField="timepointID" TextField="timepoint_text" />
											</dx:GridViewDataComboBoxColumn>
											<dx:GridViewDataComboBoxColumn FieldName="ref_groupID" Caption="Reference Group" ReadOnly="false"  >
												<PropertiesComboBox DataSourceID="SqlGroup" ValueField="groupID" TextField="groupname" />
											</dx:GridViewDataComboBoxColumn>
											<dx:GridViewDataColumn FieldName="varweight" Caption="Var Weight (-1 to invert)" ></dx:GridViewDataColumn>
											<dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true" VisibleIndex="0"  ShowDeleteButton="true" ></dx:GridViewCommandColumn>
											<dx:GridViewDataColumn FieldName="compvar_pk" ReadOnly="true" Visible="false" ></dx:GridViewDataColumn>
										</Columns>
										</dx:ASPxGridView>
								</DetailRow>
							</Templates>
							<SettingsDetail ShowDetailRow="true" />
						</dx:ASPxGridView>


					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			

		</TabPages>
	</dx:ASPxPageControl>
	<br />
	<br />


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


	<asp:SqlDataSource ID="SqlVars" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select a.*, fieldlabel, '['+measname +': <b>' +varname+'</b>] '+ coalesce(fieldlabel,'') as varlabel from dp.Var a 
			join def.fld b ON a.fldpk = b.fldpk join def.tbl c ON b.tblpk = c.tblpk 
			join uwautism_research_backend..tblmeasure d ON c.measureID=d.measureID
			where dataproj_pk = @dataproj_pk">
		 <SelectParameters>
			 <asp:QueryStringParameter QueryStringField="pk" Name="dataproj_pk"  />
		 </SelectParameters>
	 </asp:SqlDataSource> 



	 <asp:SqlDataSource ID="SqlMeasWithNoVars" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select dataproj_pk, measname from (select a.dataproj_pk, a.measureID, sum(case when b.fldpk > 0 then 1 else 0 end) n_vars from dp.Meas a left join dp.[Var] b ON a.measureID = b.measureID and a.dataproj_pk = b.dataproj_pk group by a.dataproj_pk, a.measureID) x left join uwautism_research_backend..tblMeasure y ON x.measureID = y.measureID where n_vars = 0 and dataproj_pk = @dataproj_pk"
		>
		 <SelectParameters>
			 <asp:QueryStringParameter QueryStringField="pk" Name="dataproj_pk" />
		 </SelectParameters>
	 </asp:SqlDataSource>

	 <asp:SqlDataSource ID="SqlCompvar" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select a.*, coalesce(numvars,0) numvars from dp.Compvar a LEFT JOIN (select compvar_pk, count(*) numvars from dp.Compvarvar group by compvar_pk) b ON a.compvar_pk=b.compvar_pk where dataproj_pk=@dataproj_pk order by compvarname"
		InsertCommandType="text" InsertCommand="insert into dp.Compvar (compvarname, compvarlabel, dataproj_pk) values(@compvarname, @compvarlabel, @dataproj_pk)" 
		UpdateCommandType="text" UpdateCommand="update dp.Compvar set compvarname=@compvarname, compvarlabel=@compvarlabel where compvar_pk=@compvar_pk" 
		 >
		 <SelectParameters>
			 <asp:QueryStringParameter QueryStringField="pk" Name="dataproj_pk" />
		 </SelectParameters>
		 <InsertParameters>
			 <asp:Parameter Name="compvarname" Type="string" />
			 <asp:Parameter Name="compvarlabel" Type="string" />
			 <asp:QueryStringParameter QueryStringField="pk" Name="dataproj_pk"  />
		 </InsertParameters>
		 <UpdateParameters>
			 <asp:Parameter Name="compvarname" Type="string" />
			 <asp:Parameter Name="compvarlabel" Type="string" />
			 <asp:QueryStringParameter QueryStringField="pk" Name="dataproj_pk"  />
		 </UpdateParameters>
	 </asp:SqlDataSource> 


		 <asp:SqlDataSource ID="SqlCompvarvar" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select a.*, fldname, fieldlabel 
						 from dp.Compvarvar a 
						 JOIN dp.Var b ON a.var_pk = b.var_pk 
						 JOIN def.Fld c ON b.fldpk = c.fldpk 
						where compvar_pk=@compvar_pk order by fldname"
		InsertCommandType="text" InsertCommand="insert into dp.Compvarvar (compvar_pk, var_pk, ref_timepointID, ref_groupID, varweight) values(@compvar_pk, @var_pk, @ref_timepointID, @ref_groupID, @varweight)" 
		UpdateCommandType="text" UpdateCommand="update dp.Compvarvar set varweight=@varweight,ref_timepointID=@ref_timepointID, ref_groupID=@ref_groupID where compvarvar_pk = @compvarvar_pk" 
		DeleteCommandType="text" DeleteCommand="delete from dp.Compvarvar where compvarvar_pk = @compvarvar_pk" 
		 >
		 <SelectParameters>
			 <asp:SessionParameter SessionField="compvar_pk" Name="compvar_pk" />
		 </SelectParameters>
		 <InsertParameters>
			 <asp:SessionParameter SessionField="compvar_pk" Name="compvar_pk" Type="Int32" />
			 <asp:Parameter Name="var_pk" Type="Int32" />
			 <asp:Parameter Name="ref_timepointID" Type="Int32" />
			 <asp:Parameter Name="ref_groupID" Type="Int32" />
			 <asp:Parameter Name="varweight" Type="Int32" />
		 </InsertParameters>
		 <UpdateParameters>
			 <asp:Parameter Name="compvarvar_pk" Type="Int32" />
			 <asp:Parameter Name="ref_timepointID" Type="Int32" />
			 <asp:Parameter Name="ref_groupID" Type="Int32" />
			 <asp:Parameter Name="varweight" Type="Int32" />
		 </UpdateParameters>
		 <DeleteParameters>
			 <asp:Parameter Name="compvarvar_pk" Type="Int32" />
		 </DeleteParameters>
	 </asp:SqlDataSource> 


<%--	<asp:SqlDataSource ID="sqlTxAll" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select txallID, txall from ALL_MIND_IntHx_vers2_STACKED_by_PERIOD_ALL where studyIDfull = @studyIDfull group by txallID, txall order by 1">
		<SelectParameters>
			<asp:SessionParameter SessionField="studyIDfull" Name="studyIDfull" />
		 </SelectParameters>
	</asp:SqlDataSource>--%>
	<%--<asp:SqlDataSource ID="sqlTxCat" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select txcatID, left(txall, (CHARindex(')', txall)-1)) txall, txcat from ALL_MIND_IntHx_vers2_STACKED_by_PERIOD_CAT where studyIDfull = @studyIDfull group by txcatID, txall, txcat order by 1">
		<SelectParameters>
			 <asp:SessionParameter SessionField="studyIDfull" Name="studyIDfull" />
		 </SelectParameters>
	</asp:SqlDataSource>--%>

	<asp:SqlDataSource ID="sqlTxCat" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select  txcat1, txcat2, txcat3, txcat4 from vwconst_MIND_IntHXv2_TxTypeCat group by  txcat1, txcat2, txcat3, txcat4 order by txcat1, txcat2, txcat3 ">
		<SelectParameters>
			 <asp:SessionParameter SessionField="studyIDfull" Name="studyIDfull" />
		 </SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlTimept" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select  studyID, studyname, timepointID, timepoint_text timept from uwautism_research_backend..tblTimePt group by  txcat1, txcat2, txcat3, txcat4 order by txcat1, txcat2, txcat3 ">
		<SelectParameters>
			 <asp:SessionParameter SessionField="studyIDfull" Name="studyIDfull" />
		 </SelectParameters>
	</asp:SqlDataSource>
	

	<asp:SqlDataSource ID="sqlTxType" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select txtypeID, left(txcat4,3) txcat4, txtype from vwconst_MIND_IntHXv2_TxTypeCat order by txcat4, txtype">
		<SelectParameters>
			 <asp:SessionParameter SessionField="studyIDfull" Name="studyIDfull" />
		 </SelectParameters>
	</asp:SqlDataSource>



	<asp:SqlDataSource ID="sqlPeriods" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select period from ALL_MIND_IntHx_vers2_STACKED_by_PERIOD_ALL where studyIDfull = @studyIDfull group by period order by 1">
		<SelectParameters>
			 <asp:SessionParameter SessionField="studyIDfull" Name="studyIDfull" />
		 </SelectParameters>
	</asp:SqlDataSource>








</asp:Content>


