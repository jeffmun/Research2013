<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" EnableEventValidation="true"
  CodeFile="ManageREDCap.aspx.cs" Inherits="Data_ManageREDCap"  Title ="Manage REDCap"    %>  
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%--<%@ Register Assembly="Microsoft.R.Host.Client, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="Microsoft.R.Host.Client" TagPrefix="r"  %>--%>



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true"></asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

	<script type="text/javascript">

		function ShowUpload() {
			btn1.SetVisible(true);
			btn2.SetVisible(true);
		}

		function ShowLinkedPanel() {
			panelLinked.SetVisible(true);  
			btnShowLinked.SetVisible(false);
		}
		function HideLinkedPanel() {
			panelLinked.SetVisible(false);     
			btnShowLinked.SetVisible(true);
		}

		function Continue() {

		}

	</script>


	<asp:Label ID="lbl1" runat="server" Text="Manage REDCap" Font-Size="Medium" Font-Bold="true"></asp:Label>
	<br />
	<asp:Label ID="lblRESULTS" runat="server" Text="" Font-Size="Small" Font-Bold="false" ForeColor="ForestGreen"></asp:Label>


	<br />
	<dx:ASPxPageControl ID="tabs" runat="server">
		<TabPages>
			<dx:TabPage Text="Matched REDCap fields">
				<ContentCollection>
					<dx:ContentControl ID="tab_import_fields" runat="server">

						<table>
							<tr>
								<td style="padding-left:20px">
									<dx:ASPxGridView ID="gv_redcap_forms_to_db" runat="server" DataSourceID="sql_forms_to_db" AutoGenerateColumns="true"></dx:ASPxGridView>
								</td>
								<td style="padding-left:200px">
									<dx:ASPxButton ID="btnAddFlds" runat="server" Text="Add fields from REDCap form below to DB table" OnClick="btnAddFlds_Click" AutoPostBack="true"></dx:ASPxButton>
									<asp:PlaceHolder ID="placeholder" runat="server"></asp:PlaceHolder>
								</td>
								<td style="padding-left:40px">
				
								</td>
							</tr>
						</table>


						<br />
						<br />

						<dx:ASPxLabel ID="lblMatched" runat="server" Text="REDCap fields & Matched DB fields" Font-Bold="true" Font-Size="Small"></dx:ASPxLabel>
						<dx:ASPxGridView ID="gv_matched_flds" runat="server" AutoGenerateColumns="false" DataSourceID="sql_redcap_matched_fields" Width="98%" >
							<Columns>
								<dx:GridViewDataColumn FieldName="form_name" GroupIndex="0"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="tblname" ></dx:GridViewDataColumn>
								<dx:GridViewBandColumn Caption="REDCap">
									<Columns>
											<dx:GridViewDataColumn FieldName="field_name" Caption="REDCap fld"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="field_label" Caption="REDCap label"></dx:GridViewDataColumn>
											<dx:GridViewDataTextColumn FieldName="select_choices_or_calculations" Caption="REDCap val labels" >
												 <PropertiesTextEdit EncodeHtml="False" />  
											</dx:GridViewDataTextColumn>
										</Columns>
								</dx:GridViewBandColumn>
								<dx:GridViewBandColumn Caption="Research DB" HeaderStyle-BackColor="AliceBlue">
									<Columns>
								<dx:GridViewDataColumn FieldName="fldname" Caption="DB fld" HeaderStyle-BackColor="AliceBlue" CellStyle-BackColor="AliceBlue"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="fieldlabel" Caption="DB label" HeaderStyle-BackColor="AliceBlue" CellStyle-BackColor="AliceBlue"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="matchType" Caption="Match Type" HeaderStyle-BackColor="AliceBlue" CellStyle-BackColor="AliceBlue"></dx:GridViewDataColumn>
								<dx:GridViewDataTextColumn FieldName="vallabels" Caption="DB val labels" HeaderStyle-BackColor="AliceBlue" CellStyle-BackColor="AliceBlue">
									<PropertiesTextEdit EncodeHtml="False" />  
								</dx:GridViewDataTextColumn>
										</Columns>
								</dx:GridViewBandColumn>
							</Columns>
							<Settings ShowGroupPanel="True" VerticalScrollBarMode="Visible" VerticalScrollableHeight="500" />
							<SettingsBehavior AllowFixedGroups="true" />
							<SettingsPager Mode="ShowAllRecords" />
						</dx:ASPxGridView>
												<br /><br />
						
					</dx:ContentControl>
				</ContentCollection>
				</dx:TabPage>


						<dx:TabPage Text="Assign Form-Events to StudyMeasures">
				<ContentCollection>
					<dx:ContentControl>

						<table>
							<tr>
								<td>
									<asp:Label ID="Label1" runat="server" Text="Match the specific REDCap form & event to a study measure" Font-Size="Small" Font-Bold="true"></asp:Label>	
								</td>
								<td style="padding-left:50px">
									
								</td>
								</tr>
							</table>

						<br /><br />
						<dx:ASPxGridView ID="gv_Redcap_FormEvent" runat="server" ClientInstanceName="REDCap_formevent" DataSourceID="sqlRedcapFormevents" KeyFieldName="redcapformeventID"
							 OnRowUpdating="gvcrud_OnRowUpdating" >
							<Columns>
								<dx:GridViewDataColumn FieldName="redcapformeventID" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="arm_num" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="unique_event_name" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataColumn FieldName="form" ReadOnly="true"></dx:GridViewDataColumn>
								<dx:GridViewDataComboBoxColumn FieldName="studymeasid" >
									<PropertiesComboBox DataSourceID="sql_studymeas" ValueField="studymeasid" TextField="studymeasname"></PropertiesComboBox>
								</dx:GridViewDataComboBoxColumn>

							</Columns>
							<SettingsDataSecurity AllowEdit="true" />
							<SettingsEditing Mode="Batch" ></SettingsEditing>
							<SettingsPager PageSize="50"></SettingsPager>
						</dx:ASPxGridView>
					</dx:ContentControl>

				</ContentCollection>

			</dx:TabPage>

				<dx:TabPage Text="Setup (Tokens, etc.)">
				<ContentCollection>
					<dx:ContentControl>

						<table>
							<tr>
								<td colspan="2">
									<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Tokens" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
								</td>
							</tr>
							<tr>
								<td>
									<dx:ASPxLabel ID="lbl" runat="server" Text="For security purposes, the actual REDCap token value is not displayed."></dx:ASPxLabel>
									<dx:ASPxGridView ID="gv_tokens" runat="server" AutoGenerateColumns="true" DataSourceID="sql_tokens">
										<Columns>
											<dx:GridViewDataColumn FieldName="tokenid"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="project"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="url"></dx:GridViewDataColumn>
											<dx:GridViewDataColumn FieldName="idfld"></dx:GridViewDataColumn>
										</Columns>
									</dx:ASPxGridView>
								</td>
								<td style="padding-left:200px">
									<dx:ASPxTextBox ID="txtProjectname" runat="server" Caption="REDCap Project Name:" CaptionCellStyle-Width="130px" Width="300px"></dx:ASPxTextBox>
									<dx:ASPxTextBox ID="txtIDfld" runat="server" Caption="ID field:" CaptionCellStyle-Width="130px" Width="300px"></dx:ASPxTextBox>
									<dx:ASPxTextBox ID="txtToken" runat="server" Caption="New API Token:" CaptionCellStyle-Width="130px" Width="400px"></dx:ASPxTextBox>
									<dx:ASPxButton ID="btnInsertToken" runat="server" Text="Add REDCap Token" OnClick="btnInsertToken_Click"></dx:ASPxButton>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<br /><br />
									<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Import meta-data from REDCap" Font-Size="Small" Font-Bold="true"></dx:ASPxLabel>
									<br />
									<dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="This needs to be done just once, unless changes are made to REDCap." Font-Size="Smaller" Font-Bold="false"></dx:ASPxLabel>
								</td>
							</tr>
							<tr>
								<td>
									<dx:ASPxButton ID="btnFormEvents" runat="server" Text="Save REDCap Form-Events to DB" Visible="true" OnClick="btnFormEvents_Click"></dx:ASPxButton>	
								</td>
								<td style="padding-left:200px">
									<dx:ASPxButton ID="btnFields" runat="server" Text="Save REDCap fields to DB" Visible="true" OnClick="btnFields_Click"></dx:ASPxButton>
								</td>
							</tr>
						</table>

					</dx:ContentControl>
				</ContentCollection>
				</dx:TabPage>
			

			<dx:TabPage Text="View All REDCap Field Info">
				<ContentCollection>
					<dx:ContentControl>

						<table>
							<tr>
								<td style="padding-left:20px">
									<asp:Label ID="Label2" runat="server" Text="Fields defined in REDCap" Font-Size="Medium" Font-Bold="true"></asp:Label>
								</td>
								<td style="padding-left:200px">
								</td>
								<td style="padding-left:40px">
				
								</td>
							</tr>
						</table>

						<br /><br />
						<dx:ASPxGridView ID="gv_redcap_fields" runat="server" AutoGenerateColumns="true" DataSourceID="sql_redcap_fields">
							<SettingsPager PageSize="50"></SettingsPager>
						</dx:ASPxGridView>

					</dx:ContentControl>
				</ContentCollection>
				</dx:TabPage>

				<dx:TabPage Text="View REDCap Data">
				<ContentCollection>
					<dx:ContentControl>

					<asp:Panel ID="panelREDCap_controls" runat="server" Visible="false">
						<table>
							<tr>
								<td style="vertical-align: top; padding: 10px">
									<asp:PlaceHolder ID="placeholder_cboForms" runat="server"></asp:PlaceHolder>
					<%--				<dx:ASPxComboBox ID="cboForms" runat="server" Caption="Forms:"></dx:ASPxComboBox>--%>
								</td>
								<td style="vertical-align: top; padding: 10px">
									<dx:ASPxButton ID="btnLoadFormData" runat="server" Text="Display REDCap Data from Selected Forms" OnClick="btnLoadFormData_OnClick" >
									<%--	<ClientSideEvents Click="function(s,e) {  panel.PerformCallback();}" />--%>
									</dx:ASPxButton>
									   <br /><br />
									<dx:ASPxButton ID="btnSaveFormData" runat="server" Text="Save REDCap Data from Selected Forms to DB" OnClick="btnSaveFormData_OnClick" >
									<%--	<ClientSideEvents Click="function(s,e) {  panel.PerformCallback();}" />--%>
									</dx:ASPxButton>
									   <br /><br />									<dx:ASPxLabel ID="lblNoneSelected" runat="server" Text="" ForeColor="Red"></dx:ASPxLabel>
									   <br /><br />
										<asp:Label ID="lblDictSaveInfo" runat="server" ForeColor="ForestGreen" ></asp:Label>
								</td>
							</tr>
						</table>
					</asp:Panel>

					</dx:ContentControl>
				</ContentCollection>
				</dx:TabPage>
		</TabPages>
	</dx:ASPxPageControl>


	<table>
		<tr>
			<td style="vertical-align: top; padding: 10px">

				<dx:ASPxComboBox ID="cboMeas" ClientInstanceName="cboMeas" runat="server" Caption="Measure:" CaptionCellStyle-Width="90px" NullText="select measure"
						 AutoPostBack="true" OnSelectedIndexChanged="cboMeas_OnSelectedIndexChanged" Visible="false"></dx:ASPxComboBox>

			</td>
			
			<td style="width:400px; padding:10px">
				
				<dx:ASPxGridView ID="gridLinkedREDCapForm" runat="server" ClientInstanceName="gridLinkedREDCapForm" KeyFieldName="redcapformID" 
						Caption="Linked REDCap Forms"   Styles-TitlePanel-HorizontalAlign="Left"
						SettingsDataSecurity-AllowAddingRecords ="true"
						SettingsDataSecurity-AllowInsert="true"
						SettingsDataSecurity-AllowDelete="true"
						OnRowInserting="gridLinkedREDCapForm_OnRowInserting"
						OnRowDeleting="gridLinkedREDCapForm_OnRowDeleting"
						OnCellEditorInitialize="gridLinkedREDCapForm_CellEditorInitialize">
				<Columns>
					<dx:GridViewDataColumn FieldName="redcapformID" Visible="false"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="form_name"></dx:GridViewDataColumn>
					<dx:GridViewCommandColumn ShowDeleteButton="true" ShowNewButtonInHeader="true" />

				</Columns>
				<SettingsEditing Mode="Inline"></SettingsEditing>
										

				</dx:ASPxGridView>
			</td>
			<td style="width:500px">

				   <dx:ASPxButton ID="btnShowLinked" ClientInstanceName="btnShowLinked" runat="server" AutoPostBack="false" Text="Manage Linked Import Tables (from files)"  
					   Native="true" ClientVisible="false">
						<ClientSideEvents Click="ShowLinkedPanel" />
					</dx:ASPxButton>

					<dx:ASPxPanel ID="panelLinked" runat="server" ClientInstanceName="panelLinked" ClientVisible="false">
						<PanelCollection>
							<dx:PanelContent>
								<dx:ASPxButton ID="btnHideLinked" ClientInstanceName="btnHideLinked" runat="server" AutoPostBack="false" Text="Cancel" Native="true" ClientVisible="true">
									<ClientSideEvents Click="HideLinkedPanel" />
									</dx:ASPxButton>
				
								<br />
								<table>
									<tr>
										<td style="vertical-align:top; padding:10px">
											<dx:ASPxGridView ID="gridLinkedImport" runat="server" ClientInstanceName="gridLinkedImport" KeyFieldName="ltpk"
												 Caption="Sets of Linked Tables" 
												 SettingsDataSecurity-AllowAddingRecords="true"
												 SettingsDataSecurity-AllowInsert="true"
												SettingsDataSecurity-AllowUpdate="true"
												 SettingsDataSecurity-AllowDelete="true"
												 OnRowUpdating="gridLinkedImport_OnRowUpdating"
												 OnRowDeleting="gridLinkedImport_OnRowDeleting"
												 OnRowInserting="gridLinkedImport_OnRowInserting">
												<Columns>
												   <dx:GridViewDataColumn FieldName="ltpk" Caption="pk"  CellStyle-ForeColor="Silver" Width="50px" Visible="false"></dx:GridViewDataColumn>
												   <dx:GridViewDataColumn FieldName="linkedimport" Caption="LinkedImport"  Width="150px"></dx:GridViewDataColumn>

												<dx:GridViewCommandColumn ShowEditButton="true" ShowDeleteButton="true" ShowNewButtonInHeader="true" />

												</Columns>
											</dx:ASPxGridView>

										</td>
										<td style="vertical-align:top; padding:10px">
											<dx:ASPxGridView ID="gridLinkedImportTbl" runat="server" ClientInstanceName="gridLinkedImportTbl" 
												 KeyFieldName="ltpk;tblpk" 
												 Caption="Linked Tables"
												 SettingsDataSecurity-AllowAddingRecords ="true"
												 SettingsDataSecurity-AllowInsert="true"
												 SettingsDataSecurity-AllowDelete="true"
												 OnRowInserting="gridLinkedImportTbl_OnRowInserting"
												 OnRowDeleting="gridLinkedImportTbl_OnRowDeleting"
												 OnCellEditorInitialize="gridLinkedImportTbl_CellEditorInitialize">
											<Columns>
												   <dx:GridViewDataComboBoxColumn FieldName="ltpk" Caption="Set of Linked Tables" ReadOnly="false" >
														<PropertiesComboBox DataSourceID="sqlLT" TextField="_linkedimport" ValueField="_ltpk"
															></PropertiesComboBox>
													</dx:GridViewDataComboBoxColumn>



													<dx:GridViewDataComboBoxColumn FieldName="tblpk" Caption="Measure" >
														<PropertiesComboBox DataSourceID="sqlMeas" TextField="_measname" ValueField="_tblpk"
															></PropertiesComboBox>
													</dx:GridViewDataComboBoxColumn>

													<dx:GridViewDataColumn FieldName="sortorder"></dx:GridViewDataColumn>

													<dx:GridViewCommandColumn ShowDeleteButton="true" ShowNewButtonInHeader="true" />

												</Columns>
												<SettingsEditing Mode="Inline"></SettingsEditing>
										

											</dx:ASPxGridView>

										</td>
									</tr>
								</table>
							</dx:PanelContent>
						</PanelCollection>
					</dx:ASPxPanel>

			</td>
		</tr>
	</table>





	
	<br />

	<asp:PlaceHolder ID="placeholder_gridMeta" runat="server"></asp:PlaceHolder>
<%--	<dx:ASPxGridView ID="gridREDCap" runat="server" Visible="false" AutoGenerateColumns="true" SettingsPager-AlwaysShowPager="true" EnableViewState="true" Width="95%" ></dx:ASPxGridView>--%>

	<br />
	<dx:ASPxCallbackPanel ID="panel" ClientInstanceName="panel" runat="server"    >
		<PanelCollection>
			<dx:PanelContent ID="panelContent">
				<%--<dx:ASPxGridView ID="grid" runat="server" ClientInstanceName="grid" AutoGenerateColumns="true"></dx:ASPxGridView>--%>
			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxCallbackPanel>


	<asp:Panel ID="panelMerged" runat="server" Visible="false">
		<dx:ASPxGridView ID="gridMerged" runat="server" ClientInstanceName="gridMerged">
			<Columns>
				<dx:GridViewDataColumn FieldName="ord_pos" Caption="Pos"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="fldname"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="fldlabel"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="redcap_formname" CellStyle-BackColor="WhiteSmoke"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="redcap_fldname" CellStyle-BackColor="WhiteSmoke"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="redcap_fldlabel" CellStyle-BackColor="WhiteSmoke"></dx:GridViewDataColumn>
			</Columns>
			<SettingsPager PageSize="50"  PageSizeItemSettings-Items="20,50,200" PageSizeItemSettings-Visible="true"></SettingsPager>
		</dx:ASPxGridView>
	</asp:Panel>



		<asp:SqlDataSource ID="sqlMeas" runat="server" SelectCommandType="Text"  
		SelectCommand="select tblpk as _tblpk, measname as _measname from def.Tbl a JOIN uwautism_research_backend..tblmeasure  b ON a.measureID=b.measureID where a.measureID in (select measureID from uwautism_research_backend..tblstudymeas where studyID= @studyID) "
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>


			<asp:SqlDataSource ID="sqlLT" runat="server" SelectCommandType="Text"  
		SelectCommand="select a.linkedimport as _linkedimport, a.ltpk as _ltpk from def.LinkedImport a  left join (select ltpk, count(*) n from def.LinkedImportTbl group by ltpk) e ON a.ltpk = e.ltpk  where e.n is null or a.ltpk in (select ltpk from def.LinkedImportTbl  where tblpk in (select tblpk from def.Tbl where measureID in  (select measureID from uwautism_research_backend..tblstudymeas where studyID=@studyID )))"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>


			<asp:SqlDataSource ID="sql_RedcapTokens" runat="server" SelectCommandType="Text"  
		SelectCommand="select tblpk as _tblpk, measname as _measname from def.Tbl a JOIN uwautism_research_backend..tblmeasure  b ON a.measureID=b.measureID where a.measureID in (select measureID from uwautism_research_backend..tblstudymeas where studyID= @studyID) "
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sqlRedcapFormevents" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from def.vwRedcap_FormEvent where  studyid = @studyID"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

	

	<asp:SqlDataSource ID="sql_studymeas" runat="server" SelectCommandType="Text"  
		SelectCommand="select studymeasid, studymeasname from uwautism_research_backend..tblstudymeas where studyid = @studyID and measureID in (select measureID from uwautism_research_backend..tblmeasure where measureID in (select measureID from def.tbl where importfiletype in (select importfiletype from def.ImportFileType where importfiletype_txt='REDCap')))"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_redcap_matched_fields" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from def.vwREDCap_matched_fields where  studyid = @studyID  "
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sql_redcap_fields" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from def.REDCap_fields where tokenid in (select tokenid from def.REDCapToken_Study where studyid = @studyID )"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_tokens" runat="server" SelectCommandType="Text"  
		SelectCommand="select a.tokenid, token, project, url, idfld from def.REDCapToken a join def.REDCapToken_Study b ON a.tokenid = b.tokenid where studyid = @studyID "
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_forms_to_db" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from def.vwREDCap_form_to_tbl where studyid = @studyid"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>
	

	

</asp:Content>
