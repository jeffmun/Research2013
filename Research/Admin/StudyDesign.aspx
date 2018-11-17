<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="StudyDesign.aspx.cs" Inherits="Admin_StudyDesign" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%--<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="Obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.TreeView" Assembly="Obout.Ajax.UI" %>--%>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableViewState="true"></asp:ScriptManager>


	<script type="text/javascript">
		var lastMeas = null;
		function OnEndCallBack(s, e) {
			if (lastMeas) {
				grid.GetEditor("StudyMeasName").PerformCallback(lastMeas);
				lastMeas = null;
			}
			else {
				if (s.cpIsUpdated != '') {
					if (s.cpIsUpdated == 'grid_tblgroup' ) {
						grid_tblstudyaction.PerformCallback();
						grid_tblstudymeas.PerformCallback();
					}
					else if (s.cpIsUpdated.startsWith("DELETED.")) {
						grid_tblstudyaction.PerformCallback();
						grid_tblstudymeas.PerformCallback();
						txtPopup.SetText(s.cpIsUpdated);
						popupDeleteInfo.Show();
					}
				}
				else {
				}
			}
		}

		

		//function OnBeginCallBack(s, e) {
		//	if (e.command == "DELETEROW") { }
		//}

		function OnMeasChanged(s, e) {
			var comboValue = s.GetText();
			var x = grid_tblstudymeas.GetEditor('StudyMeasName');
			x.Focus();
			//x.SetValue(''); // PROBLEM HERE
			x.SetValue(comboValue);

			//if(grid.GetEditor("StudyMeasName").InCallback())
			//	lastMeas = cmbMeas.GetValue().toString();
			//else 
			//	grid.GetEditor("StudyMeasName").PerformCallback(cmbMeas.GetValue().toString());
		}

		function HideBulkAssign(s, e) {
			//grid_tblstudymeas.UnselectRows();
			panelBulkAssign.SetClientVisible(false);
		}
		function HideBulkAssign2(s, e) {
			panelBulkAssign2.SetClientVisible(false);
		}

		function ShowBulkAssign(s, e) {
			panelBulkAssign.SetClientVisible(true);
		}

			function ShowBulkAssign2(s, e) {
			panelBulkAssign2.SetClientVisible(true);
		}



		function OnInit_Hide1(s, e) {
			if (s.GetVisibleRowsOnPage() > 0) {
				s.SetVisible(true);
				lblFix1.SetVisible(true);
			}
		}
		function OnInit_Hide2(s, e) {
			if (s.GetVisibleRowsOnPage() > 0) {
				s.SetVisible(true);
				lblFix2.SetVisible(true);
			}
		}

				function OnInit_Hide1CF(s, e) {
			if (s.GetVisibleRowsOnPage() > 0) {
				s.SetVisible(true);
				lblFix1.SetVisible(true);
			}
		}
		function OnInit_Hide2CF(s, e) {
			if (s.GetVisibleRowsOnPage() > 0) {
				s.SetVisible(true);
				lblFix2.SetVisible(true);
			}
		}


		function ShowHelpWindow() {
			popupHelp.Show();
		}

	</script>

<style type="text/css">
	.invisible {
		display: none;
	}
</style>

	<asp:HiddenField ID="hidStudyMeasGroup" runat="server" />


	<asp:Label ID="lblTitle" runat="server" Text="Study Design:" Font-size="Medium" ></asp:Label>
	<asp:Label ID="lblStudyname" runat="server" Font-size="Medium"  Font-Bold="true"></asp:Label>



	<br />
	<br />


	<table>
		<tr>
			<td  style="vertical-align:top"> 
				<asp:Label ID="lbl_tblgroup" runat="server" Text="Groups" Font-size="Medium"  Font-Bold="true"></asp:Label><br />
				<asp:Literal id="tblgroup_msg" runat="server" />

			</td>
			<td></td>
			<td style="vertical-align:top">
				<asp:Label ID="lbl_tbltimepoint" runat="server" Text="Timepoints" Font-size="Medium"  Font-Bold="true"></asp:Label><br />
				<asp:Literal id="tbltimepoint_msg" runat="server" />

			</td>
			<td></td>
			<td style="vertical-align:top">

				<asp:Label ID="lbl_study_subjstatus" runat="server" Text="Subject Status" Font-size="Medium"  Font-Bold="true"></asp:Label>
					&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:HyperLink ID="hypSubjStatus" runat="server" BackColor="AliceBlue" ForeColor="Navy" Font-Size="XX-Small"
						Text="Create New Subj Status" Target="_blank"></asp:HyperLink>
				<asp:Literal id="tblstudy_subjstatus_msg" runat="server" />

			</td>
		</tr>
		<tr>
			<td style="vertical-align:top; width: 400px">
				<asp:Panel ID="panel_tblgroup" runat="server">
					<dx:ASPXGridView ID="grid_tblgroup" runat="server"  ClientInstanceName="grid_tblgroup"  DataSourceID="sql_Group"
						AutoGenerateColumns="false"  AllowAddingRecords="true"  AllowSorting="false" 
						ShowFooter="false" KeyFieldName="groupID" 
						  OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting"
						>
						<ClientSideEvents EndCallback="OnEndCallBack" />
						<SettingsEditing Mode="Inline"></SettingsEditing>
						<Columns>
							<dx:GridViewDataColumn FieldName="studyID" Width="80" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>
							<dx:GridViewDataTextColumn FieldName="groupID" Caption="grpID" Width="60" ReadOnly="true"  CellStyle-ForeColor="Silver">
								<PropertiesTextEdit Style-CssClass="invisible"></PropertiesTextEdit>
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataColumn FieldName="groupname" Caption="Group" Width="150"></dx:GridViewDataColumn>
							<dx:GridViewDataTextColumn FieldName="groupabbr" Caption="Abbr" Width="100"   >
								<PropertiesTextEdit ValidationSettings-RegularExpression-ValidationExpression=".{1,5}" Width="80"
									 ValidationSettings-RegularExpression-ErrorText="Abbreviation must be 5 chars or less"></PropertiesTextEdit>
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataColumn FieldName="sortorder" Caption="SortOrd" Width="70"></dx:GridViewDataColumn>
							<dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true"  ShowNewButtonInHeader="true" ></dx:GridViewCommandColumn>
						</Columns>
					</dx:ASPXGridView>



				</asp:Panel>

			</td>
			<td style="width: 50px"></td>
			<td style="vertical-align:top" style="width: 400px">
				<asp:Panel ID="panel_tbltimepoint" runat="server">




					<dx:ASPxGridView ID="grid_tbltimepoint" runat="server"  ClientInstanceName="grid_tbltimepoint"   DataSourceID="sql_Timepoint"
						AutoGenerateColumns="false" 
						AllowAddingRecords="true" AllowSorting="false" ShowFooter="false"  KeyFieldName="timepointID"
						  OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting">
						<ClientSideEvents EndCallback="OnEndCallBack" />
						<SettingsEditing Mode="Inline"></SettingsEditing>
						
						<Columns>
							<dx:GridViewDataColumn FieldName="objtype" Width="80" ReadOnly="true" Visible="false" />
							<dx:GridViewDataColumn FieldName="studyID" Width="80" ReadOnly="true" Visible="false" />
							<dx:GridViewDataTextColumn FieldName="timepointID" Caption="tpID" Width="50"  ReadOnly="true" CellStyle-ForeColor="Silver">
								<PropertiesTextEdit Style-CssClass="invisible"></PropertiesTextEdit>
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataColumn FieldName="timepoint" Caption="Timept #" Width="60" />
							<dx:GridViewDataColumn FieldName="timepoint_text" Caption="Timept" Width="120" />
							<dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true"  ShowNewButtonInHeader="true" />
						</Columns>
					</dx:ASPxGridView>


				</asp:Panel>

			</td>
			<td style="width: 50px"></td>
			<td style="vertical-align:top; width: 400px">
				<asp:Panel ID="panel1" runat="server">
					<dx:ASPXGridView ID="grid_tblsubjstatus" runat="server" ClientInstanceName="grid_tblsubjstatus"    DataSourceID="sql_SubjStatus"
						AutoGenerateColumns="false"  
						AllowAddingRecords="true" AllowSorting="false" ShowFooter="false" KeyFieldName="ssID" 
						  OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting">
						<ClientSideEvents EndCallback="OnEndCallBack" />
						<SettingsEditing Mode="Inline"></SettingsEditing>

						<Columns>
							<dx:GridViewDataColumn FieldName="objtype" Width="80" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>
							<dx:GridViewDataColumn FieldName="studyID" Width="80" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>
							<dx:GridViewDataTextColumn FieldName="ssID" Caption="ssID" Width="50" ReadOnly="true" CellStyle-ForeColor="Silver" >
								 <PropertiesTextEdit Style-CssClass="invisible"></PropertiesTextEdit></dx:GridViewDataTextColumn>
							<dx:GridViewDataColumn FieldName="subjstatus" Caption="Subject Status" Width="150" >
								<%--<TemplateSettings TemplateID="grid_tblsubjstatus_tmp0" EditTemplateId="grid_tblsubjstatus_tmp1" />--%>
							</dx:GridViewDataColumn>
							<dx:GridViewDataColumn FieldName="sortorder" Caption="SortOrd" Width="50" ></dx:GridViewDataColumn>
							<dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true"  ShowNewButtonInHeader="true" />
						</Columns>

					</dx:ASPXGridView>
				</asp:Panel>

			</td>
			<td style="vertical-align:top">
				&nbsp;&nbsp;&nbsp;&nbsp;
				 <dx:ASPxButton ID="btShowModal" runat="server" Text="Help / Instructions" AutoPostBack="False" UseSubmitBehavior="false" >
					<ClientSideEvents Click="function(s, e) { ShowHelpWindow(); }" />
				</dx:ASPxButton>
			</td>
		</tr>
	</table>




	<br /><br />

	
		<table>
		<tr>
			<td  style="vertical-align:top"> 
				<asp:Label ID="lbl_tblstudyaction" runat="server" Text="Actions" Font-size="Medium"  Font-Bold="true"></asp:Label>
					&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:HyperLink ID="hypNEW_ActionType" runat="server" BackColor="AliceBlue" ForeColor="Navy" Font-Size="XX-Small"
						Text="Create New Action Type" Target="_blank"></asp:HyperLink>
				<asp:Literal id="tblstudyaction_msg" runat="server" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnOVERRIDE_tblstudyaction" runat="server" Text="Allow This Deletion" OnClick="btnOVERRIDE_tblstudyaction_Click" Font-Size="X-Small" ForeColor="red"  Visible="false" />

			</td>
			<td style="width: 50px"></td>
		
		</tr>
			<tr>
				<td style="vertical-align:top; width: 600px">


					 <%--OnHtmlCommandCellPrepared="gridSA_HtmlCommandCellPrepared"--%>
						<dx:ASPXGridView ID="grid_tblstudyaction" runat="server" ClientInstanceName="grid_tblstudyaction"  DataSourceID="sql_StudyAction" 
							AutoGenerateColumns="false"  AllowAddingRecords="true" AllowSorting="false" ShowFooter="false" 
							 AllowGrouping="true" GroupBy="timepoint_text"  HideColumnsWhenGrouping="true" KeyFieldName="studyactionID"
							 Settings-ShowHeaderFilterButton="true" 
						  OnCustomCallback="gridSA_CustomCallback" 
						  OnDataBound="dxgridSAM_DataBound" OnCustomButtonCallback="gridSA_CustomButtonCallback" 
							OnCustomButtonInitialize="gridSAM_CustomButtonInitialize" 
						  OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting" >
						<ClientSideEvents EndCallback="OnEndCallBack" />
						<SettingsPager Position="Top" PageSize="10">
							<PageSizeItemSettings Items="10, 20, 50, 100" Visible="true" />
						</SettingsPager>

						<Columns>
							<dx:GridViewDataTextColumn FieldName="studyactionID" Caption="saID" Width="30"  ReadOnly="true" Settings-AllowHeaderFilter="false"  CellStyle-ForeColor="Silver" EditFormSettings-Visible="false">
								 <PropertiesTextEdit Style-CssClass="invisible"></PropertiesTextEdit>
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataColumn FieldName="groupIDs"   Visible="false"></dx:GridViewDataColumn>

							<dx:GridViewDataColumn FieldName="studyID"  ReadOnly="true" Visible="false"  ></dx:GridViewDataColumn>
							<dx:GridViewDataComboBoxColumn FieldName="timepointID" Caption="Timept" Width="60" Visible="true"  >
								<PropertiesComboBox TextField="timepoint_text" ValueField="timepointID" DataSourceID='sql_Timepoint'  />
							</dx:GridViewDataComboBoxColumn>


							<dx:GridViewDataComboBoxColumn FieldName="actiontypeID" Caption="Action Type"  Width="140">
								<PropertiesComboBox TextField="actiontype" ValueField="actiontypeID" DataSourceID='sql_ActionType'  />
							</dx:GridViewDataComboBoxColumn>


							<dx:GridViewDataColumn FieldName="actiontext" Caption="Action"  CellStyle-Font-Bold="true" Width="140"></dx:GridViewDataColumn>
							<dx:GridViewDataColumn FieldName="sortorder" Caption="SortOrd"  Width="30" Settings-AllowHeaderFilter="false"  ></dx:GridViewDataColumn>

							<dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true"  ShowNewButtonInHeader="true" />
						</Columns>
			
					</dx:ASPXGridView>
				</td>
				<td style="width: 50px"></td>
				</tr>
			</table>

	<br /><br />
	<table>
		<tr>
	<td style="vertical-align:top">
				<asp:Label ID="lbl_tblstudymeas" runat="server" Text="Measures" Font-size="Medium"  Font-Bold="true"></asp:Label>
					&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:HyperLink ID="hypMeasure" runat="server" BackColor="AliceBlue" ForeColor="Navy" Font-Size="XX-Small"
						Text="Create New Measure" Target="_blank"></asp:HyperLink>
						<asp:Literal id="tblstudymeas_msg" runat="server"  />&nbsp;&nbsp;&nbsp;
						<asp:Button ID="btnOVERRIDE_tblstudymeas" runat="server" Text="Allow This Deletion" OnClick="btnOVERRIDE_tblstudymeas_Click" Font-Size="X-Small" ForeColor="red"  Visible="false" />

				<asp:HiddenField ID="hidstudymeasID_toDelete" runat="server" />

			</td>
			<td style="width: 50px"></td>
		<td><asp:Label ID="Label1" runat="server" Text="Measures Assigned to Actions" Font-size="Medium" ForeColor="LightGray"  Font-Bold="true"></asp:Label><br /></td>
		</tr>
		<tr>
					<td style="vertical-align:top; width:700px">

					<dx:ASPxPanel ID="panelBulkAssign" runat="server" ClientInstanceName="panelBulkAssign" ClientVisible="false" >
						<PanelCollection>
							<dx:PanelContent>
								<table>
									<tr>
										<td style="padding:10px">
											<dx:ASPxComboBox ID="cboStudyActionContainer" runat="server" ClientInstanceName="cboStudyActionContainer" DataSourceID="sql_StudyAction_ALL"
												 ValueField="studyactionID" NullText="--Select Action--" >
												<Columns>
													<dx:ListBoxColumn FieldName="timepoint_text"></dx:ListBoxColumn>
													<dx:ListBoxColumn FieldName="actiontext"></dx:ListBoxColumn>
												</Columns>
											</dx:ASPxComboBox>
										</td>
										<td style="padding:10px">
											<dx:ASPxButton ID="btnBulkAssign" runat="server" ClientInstanceName="btnBulkAssign" Paddings-Padding="2px" Text ="Assign Measures to Action" OnClick="btnBulkAssign_OnClick"></dx:ASPxButton>

										</td>
										<td style="padding:10px">
											<dx:ASPxButton ID="btnREL" runat="server" ClientInstanceName="btnREL"  Paddings-Padding="2px" Text ="Create RELIABILITY for Measures" OnClick="btnREL_OnClick"></dx:ASPxButton>
										</td>
										<td style="padding:10px">
											<dx:ASPxButton ID="btnCancelBulkAssign" runat="server" ClientInstanceName="btnCancelBulkAssign"  Paddings-Padding="2px"
												Text ="Cancel" ForeColor="DarkRed" AutoPostBack="false" >
												<ClientSideEvents Click="HideBulkAssign" />
											</dx:ASPxButton>
										</td>

									</tr>
								</table>

							</dx:PanelContent>
						</PanelCollection>
					</dx:ASPxPanel>




					<dx:ASPXGridView ID="grid_tblstudymeas" runat="server" ClientInstanceName="grid_tblstudymeas"   DataSourceID="sql_StudyMeas"
						AutoGenerateColumns="false"  AllowAddingRecords="true" AllowSorting="true" ShowFooter="false" 
							 AllowGrouping="true" GroupBy="timepoint_text" HideColumnsWhenGrouping="true" KeyFieldName="studymeasID"
						 Settings-ShowHeaderFilterButton="true"  OnHtmlRowPrepared="grid_tblstudymeas_OnHtmlRowPrepared"
						 OnCustomCallback="gridSM_CustomCallback" Styles-SelectedRow-BackColor="#D4EBD3"
							OnDataBound="dxgridSAM_DataBound" OnCustomButtonCallback="gridSM_CustomButtonCallback" 
							 OnCustomButtonInitialize="gridSAM_CustomButtonInitialize" 
						  OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting"  >
						<ClientSideEvents EndCallback="OnEndCallBack" SelectionChanged="ShowBulkAssign" />
						<SettingsBehavior AllowSelectByRowClick="true"  />
						<SettingsPager Position="Top" PageSize="10">
							<PageSizeItemSettings Items="10, 20, 50, 100" Visible="true" />
						</SettingsPager>

						<Columns>
							<dx:GridViewDataTextColumn FieldName="studymeasID" Caption="smID" Width="30"  ReadOnly="true" Settings-AllowHeaderFilter="false" CellStyle-ForeColor="Silver" EditFormSettings-Visible="false">
								 <PropertiesTextEdit Style-CssClass="invisible"></PropertiesTextEdit>
							</dx:GridViewDataTextColumn>

							<dx:GridViewDataComboBoxColumn FieldName="timepointID" Caption="Timept" Width="60" Visible="true"  >
								<PropertiesComboBox TextField="timepoint_text" ValueField="timepointID" DataSourceID='sql_Timepoint'  />
							</dx:GridViewDataComboBoxColumn>
							<dx:GridViewDataHyperLinkColumn FieldName="measureID" Caption="Measure" EditFormSettings-Visible="false"
								PropertiesHyperLinkEdit-TextField="measname" 
								PropertiesHyperLinkEdit-NavigateUrlFormatString="~/Info/MeasureInfo.aspx?measureID={0}" ></dx:GridViewDataHyperLinkColumn>
							<dx:GridViewDataComboBoxColumn FieldName="measureID" Caption="Measure" Width="60" Visible="false" EditFormSettings-Visible="true" PropertiesComboBox-ClientSideEvents-SelectedIndexChanged="MeasChanged"  >
								<PropertiesComboBox TextField="measname" ValueField="measureID" DataSourceID='sql_Measure'  >
									<ClientSideEvents SelectedIndexChanged="OnMeasChanged" />
									</PropertiesComboBox>
								 
							</dx:GridViewDataComboBoxColumn>

							<dx:GridViewDataColumn FieldName="StudyMeasName" Caption="StudyMeas" CellStyle-Font-Bold="true" Width="140"></dx:GridViewDataColumn>
							<dx:GridViewDataColumn FieldName="sortorder" Caption="SortOrd"  Width="30" Settings-AllowHeaderFilter="false"  ></dx:GridViewDataColumn>

														<dx:GridViewDataColumn FieldName="groupIDs" Width="120"  Visible="false"></dx:GridViewDataColumn>
							<dx:GridViewDataColumn FieldName="studyID" Width="80" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>

							<dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true"  ShowNewButtonInHeader="true" />
						</Columns>

					</dx:ASPXGridView>
				</td>
			<td style="width: 50px"></td>
				<td style="vertical-align:top">

		<dx:ASPxGridView ID="grid_MeasInAction" runat="server"  ClientInstanceName="grid_MeasInAction"   DataSourceID="sql_StudyMeas_in_Action"
		AutoGenerateColumns="false"  OnCellEditorInitialize="grid_MeasNotInAction_CellEditorInitialize"  
		AllowAddingRecords="false" AllowSorting="false" ShowFooter="false"  KeyFieldName="studymeasgroupID"
			OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting">
		<ClientSideEvents EndCallback="OnEndCallBack" />
		<SettingsBehavior AllowGroup="true" />
		<SettingsPager Position="Top" PageSize="10">
			<PageSizeItemSettings Items="10, 20, 50, 100" Visible="true" />
		</SettingsPager>
		<GroupSummary>
			<dx:ASPxSummaryItem FieldName="label" SummaryType="Count" />
		</GroupSummary>
		<Columns>
			<dx:GridViewDataColumn FieldName="label" Caption="Action"  EditFormSettings-Visible="false" GroupIndex="0"  />
			<dx:GridViewDataColumn FieldName="studymeasID" Caption="smID" Width="50"  ReadOnly="true" CellStyle-ForeColor="Silver" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepoint_text" Caption="Timept" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="studymeasname" Caption="StudyMeas" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupname" Caption="Group" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepointID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />

			<dx:GridViewDataComboBoxColumn FieldName="studyactiongroupID" Caption="StudyAction" Width="60" Visible="false" EditFormSettings-Visible="true"   >
				<PropertiesComboBox TextField="label" ValueField="studyactiongroupID" DataSourceID='sql_StudyActionGroups' >
					<Columns>
						<dx:ListBoxColumn FieldName="timepoint_text"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="groupname"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="actiontext"></dx:ListBoxColumn>
					</Columns>
					</PropertiesComboBox>
			</dx:GridViewDataComboBoxColumn>

			<dx:GridViewCommandColumn ShowDeleteButton="false" ShowEditButton="true"  />
		</Columns>
	</dx:ASPxGridView>

<br /><br />
	<dx:ASPxLabel ID="lblFix1" ClientInstanceName="lblFix1"  runat="server" Text="Measures Not Assigned to Actions"  ClientVisible="false" Font-size="Medium" ForeColor="DarkRed"  Font-Bold="true"></dx:ASPxLabel><br />

	<dx:ASPxGridView ID="grid_MeasNotInAction" runat="server"  ClientInstanceName="grid_MeasNotInAction"   DataSourceID="sql_StudyMeas_not_in_Action"  ForeColor="DarkRed"  
		AutoGenerateColumns="false"  OnCellEditorInitialize="grid_MeasNotInAction_CellEditorInitialize" EnableCallBacks="true" ClientVisible="true"
		AllowAddingRecords="false" AllowSorting="false" ShowFooter="false"  KeyFieldName="studymeasgroupID"
			OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting">
		<ClientSideEvents  Init="function(s, e) { s.SetVisible(s.GetVisibleRowsOnPage() != 0); lblFix1.SetVisible(s.GetVisibleRowsOnPage() != 0); }"   />
		<SettingsPager Position="Top" PageSize="10">
			<PageSizeItemSettings Items="10, 20, 50, 100" Visible="true" />
		</SettingsPager>						
		<Columns>
			<dx:GridViewDataColumn FieldName="studymeasID" Caption="smID" Width="50"  ReadOnly="true" CellStyle-ForeColor="Silver" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepoint_text" Caption="Timept" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="studymeasname" Caption="StudyMeas" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupname" Caption="Group" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepointID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />

			<dx:GridViewDataComboBoxColumn FieldName="studyactiongroupID" Caption="StudyAction" Width="60" Visible="true"  >
				<PropertiesComboBox TextField="label" ValueField="studyactiongroupID" DataSourceID='sql_StudyActionGroups' >
					<Columns>
						<dx:ListBoxColumn FieldName="timepoint_text"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="groupname"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="actiontext"></dx:ListBoxColumn>
					</Columns>
					</PropertiesComboBox>
			</dx:GridViewDataComboBoxColumn>

			<dx:GridViewCommandColumn ShowDeleteButton="false" ShowEditButton="true"  />
		</Columns>
	</dx:ASPxGridView>

				<br /><br />
				<dx:ASPxLabel ID="lblFix2" ClientInstanceName="lblFix2" runat="server"  Text="Measures in Actions in Different Timepoints" ForeColor="DarkRed" ClientVisible="false" Font-size="Medium"  Font-Bold="true"></dx:ASPxLabel ><br />

					<dx:ASPxGridView ID="grid_Timepoint_Mismatch" runat="server"  ClientInstanceName="grid_MeasNotInAction"   DataSourceID="sql_Timepoint_Mismatch"
		AutoGenerateColumns="false"  OnCellEditorInitialize="grid_MeasNotInAction_CellEditorInitialize" ClientVisible="false" ForeColor="DarkRed"
		AllowAddingRecords="false" AllowSorting="false" ShowFooter="false"  KeyFieldName="studymeasgroupID"
			OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting">
		<ClientSideEvents   Init="function(s, e) { s.SetVisible(s.GetVisibleRowsOnPage() != 0); lblFix2.SetVisible(s.GetVisibleRowsOnPage() != 0); }"   />
		<SettingsPager Position="Top" PageSize="10">
			<PageSizeItemSettings Items="10, 20, 50, 100" Visible="true" />
		</SettingsPager>						
		<Columns>
			<dx:GridViewDataColumn FieldName="studymeasID" Caption="smID" Width="50"  ReadOnly="true" CellStyle-ForeColor="Silver" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepoint_text" Caption="Timept" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="studymeasname" Caption="StudyMeas" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupname" Caption="Group" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepointID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />

			<dx:GridViewDataComboBoxColumn FieldName="studyactiongroupID" Caption="StudyAction" Width="60" Visible="true"  >
				<PropertiesComboBox TextField="label" ValueField="studyactiongroupID" DataSourceID='sql_StudyActionGroups' >
					<Columns>
						<dx:ListBoxColumn FieldName="timepoint_text"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="groupname"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="actiontext"></dx:ListBoxColumn>
					</Columns>
					</PropertiesComboBox>
			</dx:GridViewDataComboBoxColumn>

			<dx:GridViewCommandColumn ShowDeleteButton="false" ShowEditButton="true"  />
		</Columns>
	</dx:ASPxGridView>



				

</td>
			</tr>
			</table>

		<br /><br />


			
	<br />


	<dx:ASPxPanel ID="panelConsent" runat="server" ClientInstanceName="panelConsent">
		<PanelCollection>
			<dx:PanelContent>

				<table>
					<tr>
					<td style="vertical-align:top; width:700px">
						<asp:Label ID="Label2" runat="server" Text="Consent Forms" Font-size="Medium"  Font-Bold="true"></asp:Label>
							

												<dx:ASPxPanel ID="panelBulkAssign2" runat="server" ClientInstanceName="panelBulkAssign2" ClientVisible="false" >
						<PanelCollection>
							<dx:PanelContent>
								<table>
									<tr>
										<td style="padding:10px">
											<dx:ASPxComboBox ID="cboStudyActionContainer2" runat="server" ClientInstanceName="cboStudyActionContainer2" DataSourceID="sql_StudyAction_ALL"
												 ValueField="studyactionID">
												<Columns>
													<dx:ListBoxColumn FieldName="timepoint_text"></dx:ListBoxColumn>
													<dx:ListBoxColumn FieldName="actiontext"></dx:ListBoxColumn>
												</Columns>
											</dx:ASPxComboBox>
										</td>
										<td style="padding:10px">
											<dx:ASPxButton ID="btnBulkAssign2" runat="server" ClientInstanceName="btnBulkAssign2" Text ="Assign Selected Consents to Action" OnClick="btnBulkAssign2_OnClick"></dx:ASPxButton>

										</td>
										<td style="padding:10px">
											<dx:ASPxButton ID="btnCancelBulkAssign2" runat="server" ClientInstanceName="btnCancelBulkAssign2"  Paddings-Padding="2px"
												Text ="Cancel" ForeColor="DarkRed" AutoPostBack="false" >
												<ClientSideEvents Click="HideBulkAssign2" />
											</dx:ASPxButton>
										</td>
									</tr>
								</table>

							</dx:PanelContent>
						</PanelCollection>
					</dx:ASPxPanel>


						</td>
						<td style="width:50px">

						</td>
						<td>
							<asp:Label ID="Label3" runat="server" Text="Consents Assigned To Actions"  ForeColor="LightGray" Font-size="Medium"  Font-Bold="true"></asp:Label>
						</td>
					</tr>
					<tr>
						<td style="vertical-align:top">
								<dx:ASPXGridView ID="grid_tblconsentform" runat="server" ClientInstanceName="grid_tblconsentform"   DataSourceID="sql_ConsentForm"
						AutoGenerateColumns="false"  AllowAddingRecords="true" AllowSorting="true" ShowFooter="false" 
							 AllowGrouping="true" GroupBy="timepoint_text" HideColumnsWhenGrouping="true" KeyFieldName="consentformID"
							OnDataBound="dxgridSAM_DataBound" OnCustomButtonCallback="gridCF_CustomButtonCallback" 
							 OnCustomButtonInitialize="gridSAM_CustomButtonInitialize"  Styles-SelectedRow-BackColor="#D4EBD3"
						  OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting"  >
						<ClientSideEvents EndCallback="OnEndCallBack" SelectionChanged="ShowBulkAssign2" />
						<SettingsBehavior AllowSelectByRowClick="true" />
						<SettingsPager Position="Top" PageSize="10">
							<PageSizeItemSettings Items="10, 20, 50, 100" Visible="true" />
						</SettingsPager>

						<Columns>
							<dx:GridViewDataColumn FieldName="consentformID" Caption="smID" Width="60"  ReadOnly="true"  CellStyle-ForeColor="Silver" EditFormSettings-Visible="false"></dx:GridViewDataColumn>


							<dx:GridViewDataColumn FieldName="groupIDs" Width="120"  Visible="false"></dx:GridViewDataColumn>
							<dx:GridViewDataColumn FieldName="studyID" Width="80" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>

							<dx:GridViewDataComboBoxColumn FieldName="timepointID" Caption="Timept" Width="60" Visible="true"  >
								<PropertiesComboBox TextField="timepoint_text" ValueField="timepointID" DataSourceID='sql_Timepoint'  />
							</dx:GridViewDataComboBoxColumn>
							<dx:GridViewDataColumn FieldName="consentformname" Caption="ConsentForm" CellStyle-Font-Bold="true" Width="140"></dx:GridViewDataColumn>

<%--							<dx:GridViewDataColumn FieldName="sortorder" Caption="SortOrd"  Width="50"  ></dx:GridViewDataColumn>--%>

							<dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true"  ShowNewButtonInHeader="true" />
						</Columns>

					</dx:ASPXGridView>
						</td>
						<td style="width:50px">

						</td>
						<td style="vertical-align:top">
			
		<dx:ASPxGridView ID="grid_ConsentInAction" runat="server"  ClientInstanceName="grid_ConsentInAction"   DataSourceID="sql_Consent_in_Action"
		AutoGenerateColumns="false"  OnCellEditorInitialize="grid_MeasNotInAction_CellEditorInitialize"  
		AllowAddingRecords="false" AllowSorting="false" ShowFooter="false"  KeyFieldName="consentformID"
			OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting">
		<ClientSideEvents EndCallback="OnEndCallBack" />
		<SettingsBehavior AllowGroup="true" />
		<SettingsPager Position="Top" PageSize="10">
			<PageSizeItemSettings Items="10, 20, 50, 100" Visible="true" />
		</SettingsPager>
		<GroupSummary>
			<dx:ASPxSummaryItem FieldName="label" SummaryType="Count" />
		</GroupSummary>
		<Columns>
			<dx:GridViewDataColumn FieldName="label" Caption="Action"  EditFormSettings-Visible="false" GroupIndex="0"  />
			<dx:GridViewDataColumn FieldName="consentformID" Caption="cfID" Width="50"  ReadOnly="true" CellStyle-ForeColor="Silver" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepoint_text" Caption="Timept" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="consentformname" Caption="Consent" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupname" Caption="Group" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepointID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />

			<dx:GridViewDataComboBoxColumn FieldName="studyactiongroupID" Caption="StudyAction" Width="60" Visible="false" EditFormSettings-Visible="true"   >
				<PropertiesComboBox TextField="label" ValueField="studyactiongroupID" DataSourceID='sql_StudyActionGroups' >
					<Columns>
						<dx:ListBoxColumn FieldName="timepoint_text"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="groupname"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="actiontext"></dx:ListBoxColumn>
					</Columns>
					</PropertiesComboBox>
			</dx:GridViewDataComboBoxColumn>

			<dx:GridViewCommandColumn ShowDeleteButton="false" ShowEditButton="true"  />
		</Columns>
	</dx:ASPxGridView>
	
<br /><br />
	<dx:ASPxLabel ID="lblFixCF1" ClientInstanceName="lblFixCF1"  runat="server" Text="Consents Not Assigned to Actions"  ClientVisible="false" Font-size="Medium" ForeColor="DarkRed"  Font-Bold="true"></dx:ASPxLabel><br />

	<dx:ASPxGridView ID="grid_ConsentNotInAction" runat="server"  ClientInstanceName="grid_ConsentNotInAction"   DataSourceID="sql_Consent_not_in_Action"  ForeColor="DarkRed"  
		AutoGenerateColumns="false"  OnCellEditorInitialize="grid_ConsentNotInAction_CellEditorInitialize" EnableCallBacks="true" ClientVisible="true"
		AllowAddingRecords="false" AllowSorting="false" ShowFooter="false"  KeyFieldName="consentformgroupID"
			OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting">
		<ClientSideEvents  Init="function(s, e) { s.SetVisible(s.GetVisibleRowsOnPage() != 0); lblFixCF1.SetVisible(s.GetVisibleRowsOnPage() != 0); }"   />
		<SettingsPager Position="Top" PageSize="10">
			<PageSizeItemSettings Items="10, 20, 50, 100" Visible="true" />
		</SettingsPager>						
		<Columns>
			<dx:GridViewDataColumn FieldName="consentformID" Caption="smID" Width="50"  ReadOnly="true" CellStyle-ForeColor="Silver" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepoint_text" Caption="Timept" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="consentformname" Caption="Consent" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupname" Caption="Group" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepointID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />

			<dx:GridViewDataComboBoxColumn FieldName="studyactiongroupID" Caption="StudyAction" Width="60" Visible="true"  >
				<PropertiesComboBox TextField="label" ValueField="studyactiongroupID" DataSourceID='sql_StudyActionGroups' >
					<Columns>
						<dx:ListBoxColumn FieldName="timepoint_text"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="groupname"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="actiontext"></dx:ListBoxColumn>
					</Columns>
					</PropertiesComboBox>
			</dx:GridViewDataComboBoxColumn>

			<dx:GridViewCommandColumn ShowDeleteButton="false" ShowEditButton="true"  />
		</Columns>
	</dx:ASPxGridView>

				<br /><br />
				<dx:ASPxLabel ID="lblFixCF2" ClientInstanceName="lblFix2" runat="server"  Text="Consents in Actions in Different Timepoints" ForeColor="DarkRed" ClientVisible="false" Font-size="Medium"  Font-Bold="true"></dx:ASPxLabel ><br />

					<dx:ASPxGridView ID="grid_Consent_Timepoint_Mismatch" runat="server"  ClientInstanceName="grid_Consent_Timepoint_Mismatch"   DataSourceID="sql_Consent_Timepoint_Mismatch"
		AutoGenerateColumns="false"  OnCellEditorInitialize="grid_MeasNotInAction_CellEditorInitialize" ClientVisible="false" ForeColor="DarkRed"
		AllowAddingRecords="false" AllowSorting="false" ShowFooter="false"  KeyFieldName="consentformgroupID"
			OnRowInserting="dxgrid_OnRowInserting" OnRowUpdating="dxgrid_OnRowUpdating" OnRowDeleting="dxgrid_OnRowDeleting">
		<ClientSideEvents   Init="function(s, e) { s.SetVisible(s.GetVisibleRowsOnPage() != 0); lblFix2.SetVisible(s.GetVisibleRowsOnPage() != 0); }"   />
		<SettingsPager Position="Top" PageSize="10">
			<PageSizeItemSettings Items="10, 20, 50, 100" Visible="true" />
		</SettingsPager>						
		<Columns>
			<dx:GridViewDataColumn FieldName="consentformID" Caption="smID" Width="50"  ReadOnly="true" CellStyle-ForeColor="Silver" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepoint_text" Caption="Timept" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="ConsentFormName" Caption="Consent" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupname" Caption="Group" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="groupID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />
			<dx:GridViewDataColumn FieldName="timepointID" ReadOnly="true" Visible="false" EditFormSettings-Visible="false" />

			<dx:GridViewDataComboBoxColumn FieldName="studyactiongroupID" Caption="StudyAction" Width="60" Visible="true"  >
				<PropertiesComboBox TextField="label" ValueField="studyactiongroupID" DataSourceID='sql_StudyActionGroups' >
					<Columns>
						<dx:ListBoxColumn FieldName="timepoint_text"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="groupname"></dx:ListBoxColumn>
						<dx:ListBoxColumn FieldName="actiontext"></dx:ListBoxColumn>
					</Columns>
					</PropertiesComboBox>
			</dx:GridViewDataComboBoxColumn>

			<dx:GridViewCommandColumn ShowDeleteButton="false" ShowEditButton="true"  />
		</Columns>
	</dx:ASPxGridView>


						</td>
					</tr>
				</table>

				
			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxPanel>

			
					

	<br /><br />


	<table>
		<tr>
			<td>
				
			</td>
			<td style="width:50px"></td>
			<td>
			</td>
		</tr>

		<tr>
			<td style="vertical-align:top">
			
		</td>
						<td style="width:50px"></td>

		
		</tr>
	</table>

			



	<asp:Panel ID="panel_action" runat="server"></asp:Panel>

	<br /><br />

	<asp:Panel ID="panel_measure" runat="server"></asp:Panel>



	 <dx:ASPxPopupControl ID="popupDeleteInfo" runat="server" ClientInstanceName="popupDeleteInfo" Height="83px" ShowOnPageLoad="false"
		 Modal="True" CloseAction="CloseButton" Width="207px" AllowDragging="True"
		 PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" HeaderText="">
		 
			<ContentCollection>
				<dx:PopupControlContentControl runat="server">
					<dx:ASPxLabel ID="txtPopup" runat="server" Width="170px" ClientInstanceName="txtPopup">
								</dx:ASPxLabel>
								<br/><br/>
					<table style="border:none">
						<tr>
							<td>
								<%--OnClick="btnOK_Click"--%>
								<dx:ASPxButton ID="btnOK" runat="server"  ClientInstanceName="btnOK" AutoPostBack="False" Text="OK" Width="200px" >
									<ClientSideEvents Click="function(s, e) { popupDeleteInfo.Hide(); popupDeleteInfo.ShowOnPageLoad = false; }" />
								</dx:ASPxButton>
							</td>
							<td>
								<dx:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" ClientInstanceName="btnCancel"
									Text="Cancel" Width="80px" Visible="false">
									<ClientSideEvents Click="function(s, e) { popupDeleteInfo.Hide(); }" />
								</dx:ASPxButton>
							</td>
						</tr>
					</table>
				</dx:PopupControlContentControl>
			</ContentCollection>
		</dx:ASPxPopupControl>

	<dx:ASPxPopupControl ID="popupHelp" runat="server" Width="900" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
		PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="popupHelp"
		HeaderText="Study Design Instructions" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="true">
		<%--<ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); tbLogin.Focus(); }" />--%>
		<ContentCollection>
			<dx:PopupControlContentControl runat="server">
			
				<div style="font-size:medium; line-height:22px">
				<b>Measures</b><br />
				Click a row to select it.  Once clicked, new controls appear to enable you to:<br />
				  1. Assign the Measure to an Action<br />
				  2. Create a RELIABILITY measure for the Measure.<br />
					</div>
				</dx:PopupControlContentControl>
			</ContentCollection>
		</dx:ASPxPopupControl>

	<asp:SqlDataSource ID="sql_Group" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select groupID, groupname, groupabbr, sortorder from uwautism_research_backend..tblgroup  where studyID=@studyID">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_SubjStatus" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select ssID, subjstatus, sortorder from uwautism_research_backend..tblSS where studyID = @studyID">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sql_Actiontype" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select actiontypeID, actiontype from uwautism_research_backend..tblactiontype_lkup">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_Timepoint" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select * from uwautism_research_backend..tblTimepoint where studyID= @studyID">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_Measure" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select 0 measureID, '--select measure--' measname, '' measfullname  union select measureID, measname, measfullname from uwautism_research_backend..tblMeasure where measname not like '2del%' order by measname">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>

	<%--<asp:SqlDataSource ID="sql_ParentStudyaction" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select 0 studyactionID, '--select action--' actiontext union select studyactionID, actiontext from uwautism_research_backend..tblStudyaction where actiontypeID in (1,2,4) and studyID= @studyID order by actiontext">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>--%>

	<asp:SqlDataSource ID="sql_StudyMeas" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select 'studymeas' objtype, studymeasID objpk, *
			, dbo.fnCSV_GetLinkedIDs('studymeas','group',studymeasID, ',') groupIDs , dbo.fnCSV_GetLinkedIDs_text('studymeas','group',studymeasID, ',') groupabbrs 
		from vwstudymeas where studyID = @studyID order by timepoint, sortorder">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>


		<asp:SqlDataSource ID="sql_ConsentForm" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select 'studymeas' objtype, consentformID objpk, consentformID, consentformname, timepointID
			, dbo.fnCSV_GetLinkedIDs('consentform','group',consentformID, ',') groupIDs  
		from tblConsentForm where studyID = @studyID ">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sql_StudyAction" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select 'studyaction' objtype, studyactionID objpk, *, dbo.fnCSV_GetLinkedIDs('studyaction','group',studyactionID,',') groupIDs  , dbo.fnCSV_GetLinkedIDs_text('studyaction','group',studyactionID, ',') groupabbrs from vwstudyaction where studyID = @studyID order by timepoint, sortorder">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sql_StudyMeas_not_in_Action" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select sm.studymeasID, sm.timepointID, timepoint_text, studymeasname, smg.groupID, groupname, studymeasgroupID, studyactiongroupID 
	from tblStudyMeas sm
	join tblTimepoint tp ON sm.timepointID = tp.timepointID
	join tblStudymeasGroup smg ON sm.studymeasID = smg.studymeasID
	join tblGroup g ON smg.groupID = g.groupID
	where smg.studyactiongroupID is null and sm.studyID=@studyID">
		<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
		</SelectParameters> 
	</asp:SqlDataSource>


		<asp:SqlDataSource ID="sql_Consent_not_in_Action" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select sm.consentformID, sm.timepointID, timepoint_text, consentformname, smg.groupID, groupname, consentformgroupID, studyactiongroupID 
	from tblConsentForm sm
	join tblTimepoint tp ON sm.timepointID = tp.timepointID
	join tblConsentFormGroup smg ON sm.consentformID = smg.consentformID
	join tblGroup g ON smg.groupID = g.groupID
	where smg.studyactiongroupID is null and sm.studyID=@studyID">
		<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
		</SelectParameters> 
	</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_Timepoint_Mismatch" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select sm.studymeasID, sm.timepointID, timepoint_text, studymeasname, smg.groupID, groupname, studymeasgroupID, smg.studyactiongroupID 
	from tblStudyMeas sm
	join tblTimepoint tp ON sm.timepointID = tp.timepointID
	join tblStudymeasGroup smg ON sm.studymeasID = smg.studymeasID
	join tblGroup g ON smg.groupID = g.groupID
	join tblStudyActionGroup sag ON smg.studyactiongroupID = sag.studyactiongroupID
	join tblStudyAction sa ON sag.studyactionID = sa.studyactionID
	where sm.timepointID != sa.timepointID and sm.studyID=@studyID">
		<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
		</SelectParameters> 
	</asp:SqlDataSource>


			<asp:SqlDataSource ID="sql_Consent_Timepoint_Mismatch" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select sm.consentformID, sm.timepointID, timepoint_text, ConsentFormName, smg.groupID, groupname, consentformgroupID, smg.studyactiongroupID 
	from tblConsentForm sm
	join tblTimepoint tp ON sm.timepointID = tp.timepointID
	join tblConsentFormGroup smg ON sm.consentformID = smg.consentformID
	join tblGroup g ON smg.groupID = g.groupID
	join tblStudyActionGroup sag ON smg.studyactiongroupID = sag.studyactiongroupID
	join tblStudyAction sa ON sag.studyactionID = sa.studyactionID
	where sm.timepointID != sa.timepointID and sm.studyID=@studyID">
		<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
		</SelectParameters> 
	</asp:SqlDataSource>



		<asp:SqlDataSource ID="sql_StudyMeas_in_Action" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select sm.studymeasID, sm.timepointID, timepoint_text, studymeasname, smg.groupID, groupname, studymeasgroupID, smg.studyactiongroupID, actiontext
			, '[' + timepoint_text + '] ' + replicate('.', 25-len(actiontext)) + actiontext as label
	from tblStudyMeas sm
	join tblTimepoint tp ON sm.timepointID = tp.timepointID
	join tblStudymeasGroup smg ON sm.studymeasID = smg.studymeasID
	join tblGroup g ON smg.groupID = g.groupID
	join tblStudyActionGroup sag ON smg.studyactiongroupID = sag.studyactiongroupID
	join tblStudyAction sa ON sag.studyactionID = sa.studyactionID
	where smg.studyactiongroupID is not null and sm.studyID=@studyID">
		<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
		</SelectParameters> 
	</asp:SqlDataSource>


			<asp:SqlDataSource ID="sql_Consent_in_Action" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select sm.consentformID, sm.timepointID, timepoint_text, consentformname, smg.groupID, groupname, consentformgroupID, smg.studyactiongroupID, actiontext
			, '[' + timepoint_text + '] ' + replicate('.', 25-len(actiontext )) + actiontext as label
	from tblConsentForm sm
	join tblTimepoint tp ON sm.timepointID = tp.timepointID
	join tblConsentFormGroup smg ON sm.consentformID = smg.consentformID
	join tblGroup g ON smg.groupID = g.groupID
	join tblStudyActionGroup sag ON smg.studyactiongroupID = sag.studyactiongroupID
	join tblStudyAction sa ON sag.studyactionID = sa.studyactionID
	where smg.studyactiongroupID is not null and sm.studyID=@studyID">
		<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
		</SelectParameters> 
	</asp:SqlDataSource>


		<asp:SqlDataSource ID="sql_StudyActionGroups" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select studyactiongroupID, sa.timepointID, sa.studyactionID, actiontext,  sma.groupID, groupname
			,  timepoint_text, timepoint_text + ' ' + groupname + ' ' + actiontext as label 
	from tblStudyAction sa
	join tblTimepoint tp ON sa.timepointID = tp.timepointID
	join tblStudyActionGroup sma ON sa.studyactionID = sma.studyactionID
	join tblGroup g ON sma.groupID = g.groupID
	where actiontypeID in (1,2,4) and sa.studyID=@studyID and sa.timepointID=@timepointID and sma.groupID=@groupID order by timepoint_text, groupname, sa.sortorder">
		<SelectParameters>
			<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			<asp:Parameter Name="timepointID" Type="Int32" />
			<asp:Parameter Name="groupID" Type="Int32" />
		</SelectParameters> 
	</asp:SqlDataSource>


			<asp:SqlDataSource ID="sql_StudyAction_ALL" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select studyactionID, sa.timepointID, actiontext
			,  timepoint_text, timepoint_text + ' ' + actiontext as label 
	from tblStudyAction sa
	join tblTimepoint tp ON sa.timepointID = tp.timepointID
	where actiontypeID in (1,2,4) and sa.studyID=@studyID order by timepoint_text, sa.sortorder">
		<SelectParameters>
			<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
		</SelectParameters> 
	</asp:SqlDataSource>


	

</asp:Content>

