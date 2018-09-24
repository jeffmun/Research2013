﻿<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="DataProject.aspx.cs" Inherits="_test_DataProject" 
	 EnableEventValidation="false" Title="Edit Data Project"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %> 


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

		function OnVarCloseUp(s, e) {
			s.GetGridView().SortBy('IsSelected', 'DSC');
			s.GetGridView().SortBy('CoreVar', 'DSC');
			s.GetGridView().SortBy('measname', 'ASC');
			s.GetGridView().SortBy('fldname', 'ASC');
		}
	</script>


	<dx:ASPxHiddenField ID="needBindVars" runat="server" ClientInstanceName="needBindVars">
	</dx:ASPxHiddenField>


	<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Edit Data Project" Font-Size="Medium" Font-Bold="true" ForeColor="Gray"></dx:ASPxLabel>
	<br />
	<br />


	<table>
		<tr>
			<%--    First Column with TextBoxes--%>
			<td style="width: 425px; vertical-align: top">
				<dx:ASPxLabel ID="lblTitle" runat="server" Text="Title:" Font-Size="XX-Small"></dx:ASPxLabel>
				<dx:ASPxTextBox ID="txtTitle" runat="server" Width="400px" Font-Size="Medium">
					 <ValidationSettings SetFocusOnError="True" ErrorText="Title must be at least 3 characters long" Display="Dynamic" ErrorTextPosition="Top">
						<RequiredField IsRequired="True" ErrorText="Title is required" />
					</ValidationSettings>
				</dx:ASPxTextBox><br />

				<br />
				<dx:ASPxButton ID="btnUpdate" runat="server" Text="Update Data Project Settings" OnClick="btnUpdate_OnClick"></dx:ASPxButton>
				<dx:ASPxButton ID="btnNew" runat="server" Text="Save this Data Project"  OnClick="btnUpdate_OnClick"></dx:ASPxButton>
				<br />
				<dx:ASPxLabel ID="lblStatus" runat="server" Text=""  Font-Size="XX-Small"></dx:ASPxLabel>
			</td>

			<%--    Second Column with Selectors--%>
			<td style="vertical-align: top">
	<table>
		<tr>
			<td style="vertical-align: top">
				<table>
					<tr>
						<td style="vertical-align: top">
							Select Set of Subjects:<dx:ASPxLabel ID="lblSubj" runat="server" Text="" Font-Bold="true"></dx:ASPxLabel>
							<dx:ASPxLabel  ID="selsubj_n" runat="server" Text="" Font-Bold="true" ForeColor="RoyalBlue" ClientInstanceName="selsubj_n"></dx:ASPxLabel>   
								<br />

							<dx:ASPxComboBox ID="cboSubjSet" runat="server" Width="250px"   ValueField="subjset_pk" OnDataBound="cboSubjSet_DataBound"
								  OnSelectedIndexChanged="cboSubjSet_SelectedIndexChanged">
								<ClientSideEvents ValueChanged="SubjsetSelectionChanged"  />
								<Columns>
									<dx:ListBoxColumn FieldName="nsubj" Caption="# Subjects" Width="60px" />
									<dx:ListBoxColumn FieldName="subjset" Caption="Set" Width="200px" />
								</Columns>
								<ValidationSettings SetFocusOnError="False" ErrorText="You must select a subject set" Display="Dynamic"  ErrorTextPosition="Top">
									<RequiredField IsRequired="true" ErrorText="Select subjects" />
								</ValidationSettings>
							</dx:ASPxComboBox>

						</td>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<dx:ASPxButton ID="btnSets" runat="server" Text="View Subject Sets"   ClientInstanceName="btnSets" AutoPostBack="False" >
								<clientsideevents click="function(s, e) {document.location.href = 'SubjSets.aspx';}"></clientsideevents>
							</dx:ASPxButton>
						</td>
						<td style="width: 100px"></td>
						<td>
							<dx:ASPxButton ID="btnExploreProject" runat="server" Text="Explore this Data Project"   ClientInstanceName="btnExploreProject" AutoPostBack="true" OnClick="btnExploreProject_OnClick"></dx:ASPxButton>							&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;
							<dx:ASPxButton ID="btnProjects" runat="server" Text="View Data Projects"   ClientInstanceName="btnSets" AutoPostBack="False">
								 <clientsideevents click="function(s, e) {document.location.href = 'DataProjects.aspx';}"></clientsideevents>
							</dx:ASPxButton>
						</td>

					</tr>
				</table>


			</td>
		</tr>
		<tr>
			<td>
	 Select Measures:<dx:ASPxLabel ID="lblMeasTOTAL" runat="server" Text="" Font-Bold="true"></dx:ASPxLabel>
				<dx:ASPxLabel  ID="selmeas_n" runat="server" Text="" Font-Bold="true" ForeColor="RoyalBlue" ClientInstanceName="selmeas_n"></dx:ASPxLabel>   
					<br />
				<dx:ASPxGridLookup ID="gridLkupMeas" runat="server"  GridViewProperties-EnableRowsCache="true" 
					KeyFieldName="studymeasID" SelectionMode="Multiple" MultiTextSeparator=", " Caption=""
									TextFormatString="{0}" Width="400px" ClientInstanceName="gridLkupMeas"
					IncrementalFilteringMode="None" OnValueChanged="gridLkupMeas_OnValueChanged" 
					OnDataBound="gridLkupMeas_OnDataBound" OnDataBinding="gridLkupMeas_DataBinding">
					<ClearButton DisplayMode="OnHover"></ClearButton>
					<ClientSideEvents ValueChanged="MeasSelectionChanged"  />
					<Columns>
						<dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True" VisibleIndex="0" />
						<dx:GridViewDataTextColumn FieldName="studymeasname" Caption="Measure" />
						<dx:GridViewDataTextColumn FieldName="studyname" Caption="Study" />
						<dx:GridViewDataTextColumn FieldName="timepoint_text" Caption="TimePt" Width="80" />
						<dx:GridViewDataTextColumn FieldName="meascat" Caption="Category"/>
						<dx:GridViewDataTextColumn FieldName="isREL" Caption="Is REL?" Width="60"/>
						<dx:GridViewDataColumn UnboundType="String" Caption="Selected?" FieldName="IsSelected" Visible="true" Width="90px"></dx:GridViewDataColumn>
					</Columns>
					<GridViewProperties>
						<Settings ShowFilterRow="true" AutoFilterCondition="Contains"  ShowFilterRowMenu="true" ShowFilterRowMenuLikeItem="true"  ShowStatusBar="Visible"  />
						<SettingsBehavior AllowDragDrop="False" EnableRowHotTrack="True" />
						<SettingsPager NumericButtonCount="3"  PageSize="40" Summary-Visible="true" />
					</GridViewProperties>
					<ValidationSettings SetFocusOnError="False" ErrorText="You must select some measures" Display="Dynamic"  ErrorTextPosition="Top">
						<RequiredField IsRequired="true" ErrorText="Select measures" />
					</ValidationSettings>
				</dx:ASPxGridLookup>

			</td>
			</tr>
		<tr>
			<td>
				<dx:ASPxCallbackPanel ID="varCallback" runat="server" OnCallback="varCallback_OnCallback" ClientInstanceName="varCallback">
					<PanelCollection>
						<dx:PanelContent ID="varContent" runat="server" >
								 Select Variables:
				<dx:ASPxLabel ID="lblVarsTOTAL" runat="server" Text="" Font-Bold="true"></dx:ASPxLabel>
				<dx:ASPxLabel  ID="selvars_n" runat="server" Text="" Font-Bold="true" ForeColor="RoyalBlue" ClientInstanceName="selvars_n"></dx:ASPxLabel>   
					<br />
				<dx:ASPxGridLookup ID="gridLkupVars" runat="server" 
					KeyFieldName="fldpk" SelectionMode="Multiple" MultiTextSeparator=", " Caption=""
					TextFormatString="{0}" Width="600px" ClientInstanceName="gridLkupVars" IncrementalFilteringMode ="None"  
					OnDataBinding="gridLkupVars_DataBinding" OnDataBound="gridLkupVars_OnDataBound" OnValueChanged="gridLkupVars_OnValueChanged" >
					<ClearButton DisplayMode="OnHover"></ClearButton>
					<ClientSideEvents ValueChanged="VarSelectionChanged"   />  <%--CloseUp="OnVarCloseUp"--%>
					<Columns>
						<dx:GridViewCommandColumn  SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True" VisibleIndex="0"></dx:GridViewCommandColumn>
						<dx:GridViewDataTextColumn FieldName="fldname" Caption="Var" />
						<dx:GridViewDataTextColumn FieldName="fieldlabel" Caption="Label"/>
						<dx:GridViewDataTextColumn FieldName="measname" Caption="Measure"/>
						<dx:GridViewDataTextColumn FieldName="CoreVar" Caption="Core Var" Width="60"/>
						<dx:GridViewDataTextColumn FieldName="Type" Caption="Data Type" Width="60"/>
						<dx:GridViewDataColumn UnboundType="String" Caption="Selected?" FieldName="IsSelected" Visible="true" Width="90px"></dx:GridViewDataColumn>
					</Columns>
					<GridViewProperties>
						<Settings ShowFilterRow="true"  AutoFilterCondition="Contains"  ShowFilterRowMenu="true" ShowFilterRowMenuLikeItem="true"  ShowStatusBar="Visible"  />
						<SettingsBehavior AllowDragDrop="False" EnableRowHotTrack="True" />
						<SettingsPager NumericButtonCount="3"  PageSize="40" Summary-Visible="true" />
					</GridViewProperties>
					<ValidationSettings SetFocusOnError="False" ErrorText="You must select some variables" Display="Dynamic"  ErrorTextPosition="Top">
						<RequiredField IsRequired="true" ErrorText="Select variables" />
					</ValidationSettings>

				</dx:ASPxGridLookup>
						</dx:PanelContent>
					</PanelCollection>
				</dx:ASPxCallbackPanel>


			</td>
		</tr>
	</table>

			</td>
		</tr>
		<tr>
			<td colspan="2">
				<br />
				<dx:ASPxLabel ID="lblSummary" runat="server" Text="Summary:" Font-Size="XX-Small"></dx:ASPxLabel>
				<dx:ASPxTextBox ID="txtSummary" runat="server"  Width="400px" Visible="false"></dx:ASPxTextBox>
				<dx:ASPxHtmlEditor ID="HtmlEditor" runat="server" Height="250px" Width="800px" ActiveView="Preview" >
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
			</td>
		</tr>
	</table>



	<br />
	<br />
	<br />

	<br />
	<br />
	<br />

	<table>
		<tr>
			<td style="vertical-align: top">
				<dx:ASPxCallbackPanel ID="pivotSubjCallback" runat="server" OnCallback="pivotSubjCallback_OnCallback" ClientInstanceName="pivotSubjCallback">
					<PanelCollection>
						<dx:PanelContent ID="content2" runat="server">
							<dx:ASPxLabel ID="title_pivSubj" runat="server" Text="Selected Subjects" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
										<br />
										<dx:ASPxPivotGrid ID="PivotSelSubj" runat="server" OptionsCustomization-AllowFilter="false"  
											EncodeHtml="false" >
											<Fields>
												<dx:PivotGridField ID="field_subjstatus" Area="RowArea" AreaIndex="0"
													Caption="Subject Status" FieldName="subjstatus" Options-ShowTotals="false">
												</dx:PivotGridField>
												<dx:PivotGridField ID="field_TxGroup" Area="ColumnArea" AreaIndex="0"
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
						<td style="min-width: 15px;"></td>
						<td style="vertical-align: top; width: 400px;" >
							<dx:ASPxCallbackPanel ID="pivotMeasCallback" runat="server" OnCallback="pivotMeasCallback_OnCallback" ClientInstanceName="pivotMeasCallback">
								<PanelCollection>
									<dx:PanelContent ID="PanelContent1" runat="server">
										<dx:ASPxLabel ID="title_pivMeas" runat="server" Text="Selected Measures" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
										<br />
										<dx:ASPxPivotGrid ID="PivotSelMeas" runat="server" OptionsCustomization-AllowFilter="false"  
											OnCustomSummary="PivotSelMeas_Concat"  EncodeHtml="false" OnDataBinding="PivotSelMeas_OnDataBinding" >
											<Fields>
												<dx:PivotGridField ID="field_meascat" Area="RowArea" AreaIndex="0"
													Caption="Category" FieldName="meascat" Options-ShowTotals="false">
												</dx:PivotGridField>
												<dx:PivotGridField ID="field_timepoint" Area="ColumnArea" AreaIndex="0"
													Caption="TimePoint" FieldName="timepoint_text" SortByAttribute="timepoint">
												</dx:PivotGridField>
												<dx:PivotGridField ID="field_meas" Area="DataArea" AreaIndex="0" 
													Caption="Measure" SummaryType="Custom" FieldName="studymeasname">
												</dx:PivotGridField>
											</Fields>
											<OptionsPager AlwaysShowPager="false" RowsPerPage="20" ></OptionsPager>
											<OptionsView ShowColumnTotals="false" ShowColumnGrandTotals="false" ShowRowGrandTotals="false" ShowFilterHeaders="false"  />
										</dx:ASPxPivotGrid>

									</dx:PanelContent>
								</PanelCollection>
							</dx:ASPxCallbackPanel>

						</td>
						<td style="min-width: 15px;"></td>
						<td style="vertical-align: top; min-width: 800px">

							<dx:ASPxCallbackPanel ID="pivotVarsCallback" runat="server" OnCallback="pivotVarsCallback_OnCallback" ClientInstanceName="pivotVarsCallback">
								<PanelCollection>
									<dx:PanelContent ID="PanelContent2" runat="server">
										<dx:ASPxLabel ID="title_pivVar" runat="server" Text="Selected Variables" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
						
										<dx:ASPxButton runat="server" ID="btnExpand" Text="+" UseSubmitBehavior="false" AutoPostBack="false"  Native="true" >
											<ClientSideEvents Click="function() { gridSelVar.ExpandAll() }" />
										</dx:ASPxButton>
										<dx:ASPxButton runat="server" ID="btnCollapse" Text="-" UseSubmitBehavior="false" AutoPostBack="false"  Native="true"  >
											<ClientSideEvents Click="function() { gridSelVar.CollapseAll() }" />
										</dx:ASPxButton>

										<br />

										<dx:ASPxGridView ID="gridSelVars" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridSelVars"
											  OnDataBinding="gridSelVars_OnDataBinding"
											OnCustomButtonCallback="gridSelVars_CustomButtonCallback" OnCustomCallback="gridSelVars_OnCustomCallback" >
											<ClientSideEvents CustomButtonClick="DeleteVar" />
											<Columns>
												<dx:GridViewCommandColumn Caption="Del" ButtonRenderMode="Image" VisibleIndex="0">
													 <CustomButtons>
														<dx:GridViewCommandColumnCustomButton ID="Delete"  >
															<Image ToolTip="Delete Variable" Url="~/images/del.png" />
														</dx:GridViewCommandColumnCustomButton>
													</CustomButtons>
												</dx:GridViewCommandColumn>
												<dx:GridViewDataColumn FieldName="measname" Caption="Measure" VisibleIndex="2" GroupIndex="0"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="fldname" Caption="Variable" VisibleIndex="0"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="fieldlabel" Caption="Label" VisibleIndex="1"></dx:GridViewDataColumn>
												<dx:GridViewDataColumn FieldName="fldpk" Caption="fldpk" Visible="false"></dx:GridViewDataColumn>
											</Columns>
											<Settings ShowGroupPanel="false"    />
											<SettingsPager Mode="ShowAllRecords" />
											<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="true"  />
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



	
	
	<br />
	<br />

<%--	<dx:ASPxButton ID="btnHist" runat="server" Text="Histograms" OnClick="btnHist_OnClick" ClientInstanceName="btnHist"></dx:ASPxButton>--%>

	<br />

   <table>
	   <tr>
		   <td style="vertical-align: top">
			   <asp:Panel ID ="panelL" runat="server"></asp:Panel>
		   </td>
		   <td style="vertical-align: top">
			   <asp:Panel ID ="panelR" runat="server"></asp:Panel>
		   </td>
	   </tr>
   </table>




</asp:Content>

   
