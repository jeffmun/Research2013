<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" EnableEventValidation="true"
  CodeFile="REDCap.aspx.cs" Inherits="Data_REDCap"  Title ="REDCap Info"    %>  
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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


	<asp:Label ID="lbl1" runat="server" Text="REDCap Info" Font-Size="Medium" Font-Bold="true"></asp:Label>


	<table>
		<tr>
			<td style="vertical-align: top; padding: 5px">
				<dx:ASPxComboBox ID="cboSubject" ClientInstanceName="cboSubject" Visible="false" runat="server" Caption="Subject:" CaptionCellStyle-Width="90px" NullText="select subject"></dx:ASPxComboBox>

				<dx:ASPxComboBox ID="cboStudymeas" ClientInstanceName="cboStudymeas" runat="server" Caption="Measure:" CaptionCellStyle-Width="90px" NullText="select measure"
						 AutoPostBack="true" OnSelectedIndexChanged="cboStudymeas_OnSelectedIndexChanged"></dx:ASPxComboBox>

			

			</td>
			
			
			<td style="width:200px">

			</td>
			<td style="width:500px">
				   <dx:ASPxButton ID="btnShowLinked" ClientInstanceName="btnShowLinked" runat="server" AutoPostBack="false" Text="Manage Linked REDCap Forms"  Native="true" ClientVisible="true">
						<ClientSideEvents Click="ShowLinkedPanel" />
					</dx:ASPxButton>

					<dx:ASPxPanel ID="panelLinked" runat="server" ClientInstanceName="panelLinked" ClientVisible="false">
						<PanelCollection>
							<dx:PanelContent>
								<dx:ASPxButton ID="btnHideLinked" ClientInstanceName="btnHideLinked" runat="server" AutoPostBack="false" Text="Cancel" Native="true" ClientVisible="true">
									<ClientSideEvents Click="HideLinkedPanel" />
									</dx:ASPxButton>
				
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
								<dx:ASPxGridView ID="gridLinkedImportTbl" runat="server" ClientInstanceName="gridLinkedImportTbl" KeyFieldName="ltpk;tblpk" 
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

										<dx:GridViewCommandColumn ShowDeleteButton="true" ShowNewButtonInHeader="true" />

									</Columns>
									<SettingsEditing Mode="Inline"></SettingsEditing>
										

								</dx:ASPxGridView>
							</dx:PanelContent>
						</PanelCollection>
					</dx:ASPxPanel>

			</td>
		</tr>
	</table>





	<asp:Panel ID="panelREDCap_controls" runat="server" Visible="false">
	<table>
		<tr>
			<td style="vertical-align: top; padding: 10px">
				<asp:PlaceHolder ID="placeholder_cboForms" runat="server"></asp:PlaceHolder>
<%--				<dx:ASPxComboBox ID="cboForms" runat="server" Caption="Forms:"></dx:ASPxComboBox>--%>
			</td>
			<td style="vertical-align: top; padding: 10px">
				<dx:ASPxButton ID="btnLoadFormData" runat="server" Text="Load Selected Data" OnClick="btnLoadFormData_OnClick" >
				<%--	<ClientSideEvents Click="function(s,e) {  panel.PerformCallback();}" />--%>
				</dx:ASPxButton>
			</td>
			<td style="vertical-align: top; padding: 10px">
				<dx:ASPxButton ID="btnShowMeta" runat="server" Text="Show REDCap meta data" OnClick="btnShowMeta_OnClick"></dx:ASPxButton>
			</td>
			<td style="vertical-align: top; padding: 10px">
				<dx:ASPxButton ID="btnImportMeta" runat="server" Text="Import this meta data" Visible="false" OnClick="btnImportMeta_OnClick"></dx:ASPxButton>

				<br />
				<br />
					<asp:Label ID="lblDictSaveInfo" runat="server" ForeColor="ForestGreen" ></asp:Label>
			</td>
		</tr>
	</table>
		   </asp:Panel>
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



</asp:Content>
