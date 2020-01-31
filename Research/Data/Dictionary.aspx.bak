<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Dictionary.aspx.cs" AutoEventWireup="true"
 Inherits="Data_Dictionary" Title="Data Dictionary"      %>  

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
 

</asp:Content>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


<script type="text/javascript">
	function NewMeas(s, e)
	{
		var grid = gridlkupMeas.GetGridView();
		grid.GetRowValues(grid.GetFocusedRowIndex(), "measureID", GotSelectedValues);
  }

	function GotSelectedValues(selectedValues)
	{
		gridDict.PerformCallback(selectedValues);
	}

	function onFocusedCellChanging(s, e) 
	{
		if (e.cellInfo.column.name == 'command') e.cancel = true;
		else if (e.cellInfo.column.fieldName == 'datatype' && e.cellInfo.rowVisibleIndex > -1) e.cancel = true; 
	}


	function EditVallabels(fldpk, x) {
		var myHidden = document.getElementById('<%= hidField2.ClientID %>');
		myHidden.Value = x;
		hidField.Set("fieldvaluesetID", x);
		hidField.Set("fldpk", fldpk);
		gridVallabels.PerformCallback(x);

		if (x > 0)
		{
			popVallabels.Show();
		}
		else
		{
			popNewVallabels.Show();
		}


	}


	var command = "";
	function OnBeginCallbackGridVarlabels(s,e) {
		command = e.command;
	} 

	function OnEndCallbackGridVarlabels(s, e) {
		if (command == "UPDATEEDIT") {
			gridVallabels.Refresh();
			gridDict.Refresh();
			popVallabels.Hide();
		}
	}

   function OnBeginCallbackGridDict(s,e) {
	   command = e.command;
		if (command == "UPDATEEDIT") {
			
		}

	}
	function OnEndCallbackGridDict(s, e) {
		if (command == "UPDATEEDIT") {
			gridDict.Refresh(); //This refreshes the grid after updating it
		}
	}

	function ShowUpload() {
		btn1.SetVisible(true);
		btn2.SetVisible(true);
	}


</script>


	<asp:HiddenField ID="hidField2"  runat="server" />
	<dx:ASPxHiddenField ID="hidField" ClientInstanceName="hidField" runat="server" />

	<br />

	<table>
		<tr>
			<td style="vertical-align: top; padding: 10px">
	<dx:ASPxLabel ID="lbl1" runat="server" Text="Data Dictionary" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
	<dx:ASPxGridLookup ID="gridlkupMeas" ClientInstanceName="gridlkupMeas" runat="server"  DataSourceID="sqlMeas" KeyFieldName="measureID"
		 GridViewProperties-Settings-ShowFilterRow="true" Width="400px" NullText="--Search for a Measure --" TextFormatString="{0}"
		 OnValueChanged="gridlkupMeas_ValueChanged" AutoPostBack="true">
		<ClientSideEvents ValueChanged="NewMeas" />
		<GridViewProperties>
		  <SettingsPager PageSize="20"></SettingsPager>
		</GridViewProperties>
		<Columns>
			<dx:GridViewDataColumn FieldName="measureID" Caption="mID" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="instudy" Caption="In Study?" ></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="measname" Caption="Measure"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="measfullname" Caption="Measure Full Name"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="meascat" Caption="Category"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="measmethod" Caption="Method"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="measfocus" Caption="Focus Person"></dx:GridViewDataColumn>
	   </Columns>
	</dx:ASPxGridLookup>

			</td>
			<td style="vertical-align: top; padding: 10px; width: 200px">
			</td>
			<td style="vertical-align: top; padding: 10px; width: 100px">
				<dx:ASPxButton ID="btnCreateTable" ClientInstanceName="btnCreateTable" runat="server" Visible="false"
								Text="Create SQL Table" Width="80px" CssClass="buttonWidth" AutoPostBack="true" OnClick="btnCreateTable_OnClick" ClientEnabled="true">
				</dx:ASPxButton>
			</td>
			<td style="vertical-align: top; padding: 10px">

				<dx:ASPxButton ID="btnMeasInfo" ClientInstanceName="btnMeasInfo" runat="server"
								Text="Measure Information" Width="80px" CssClass="buttonWidth" AutoPostBack="true" OnClick="btnMeasInfo_OnClick" ClientEnabled="true">
				</dx:ASPxButton>
				<br />
				<dx:ASPxButton ID="btnSaveNDARDict" ClientInstanceName="btnSaveNDARDict" runat="server"
								Text="Save NDA Definitions to Excel" Width="100px" CssClass="buttonWidth" AutoPostBack="true" OnClick="btnSaveNDARDict_OnClick" ClientEnabled="true">
				</dx:ASPxButton>

			</td>
			<td style="vertical-align: top; padding: 10px">
				<asp:Label ID="lblFileUpload" runat="server" Text="Import Data Dictionary from Excel:"></asp:Label><br />
				<asp:FileUpload ID="FileUpload_Doc" runat="server"  Font-Size="Small" Width="300px" onchange="ShowUpload()" Visible ="true" AllowMultiple="false" />
				<br />

				<dx:ASPxLabel ID="lblDocUploadInfo" runat="server" Text="" Font-Size="Smaller" EncodeHtml="false"></dx:ASPxLabel>

			</td>
			<td style="vertical-align: top; padding: 10px">
				<dx:ASPxButton ID="btn1" ClientInstanceName="btn1" runat="server" AutoPostBack="true" Text="Import Dictionary" OnClick="ImportDict" Native="true" ClientVisible="false"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<dx:ASPxButton ID="btn2" ClientInstanceName="btn2" runat="server" AutoPostBack="true" Text="Cancel" OnClick="ImportDict_Cancel" Native="true" ForeColor="Red" ClientVisible="false" />
				<br />
				<br />

			</td>
		</tr>
	</table>




	<br />
	<br />

<%--                           <DataItemTemplate>
							<dx:ASPxButton ID="btnEditVallabels" ClientInstanceName="btnEditVallabels" runat="server" Text="Edit" EnableClientSideAPI="true" >
								<ClientSideEvents Click="function(s, e) { EditVallabels(s, e); }" />
							</dx:ASPxButton>
						</DataItemTemplate>--%>


	<table>
		<tr>
			<td>
				<dx:ASPxLabel ID="lblMeasName" runat="server"  Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
				<dx:ASPxLabel ID="lblMeasFullName" runat="server"  Font-Size="Medium" Font-Bold="false"></dx:ASPxLabel>

			</td>
			<td style="width: 200px"></td>
			<td>
				<dx:ASPxLabel ID="lblTblInfo" runat="server"  Font-Size="small" ForeColor="Silver"></dx:ASPxLabel>
				
			</td>
		</tr>
	</table>
				<br />

				<dx:ASPxGridView ID="gridDict" ClientInstanceName="gridDict" runat="server" KeyFieldName="fldpk" 
					Settings-ShowFilterRow="true"  Settings-ShowFilterRowMenu="true" AllowAddingRecords="true" SettingsDataSecurity-AllowEdit="true"
					SettingsDataSecurity-AllowDelete="true" EnableViewState="true"
					 OnHtmlRowPrepared="gridDict_HtmlRowPrepared" OnHtmlDataCellPrepared="gridDict_HtmlDataCellPrepared"
					 OnCommandButtonInitialize="gridDict_CommandButtonInitialize" OnRowCommand="gridDict_OnRowCommand" OnParseValue="gridDict_OnParseValue" 
					OnRowInserting="gridDict_OnRowInserting" OnRowUpdating="gridDict_OnRowUpdating" OnRowDeleting="gridDict_OnRowDeleting">
					<Styles>
						<AlternatingRow BackColor="WhiteSmoke"></AlternatingRow>
					</Styles>
					<SettingsPager PageSize="50" Summary-Visible="true" AlwaysShowPager="true" >
						<PageSizeItemSettings Visible="true" Items="20,50,100,200" ShowAllItem="true" />
					</SettingsPager>
					<SettingsEditing Mode="EditForm"></SettingsEditing>
					<SettingsBehavior EnableCustomizationWindow="true" />
					<Toolbars>
						<dx:GridViewToolbar>
							<Items>
								<dx:GridViewToolbarItem Command="ShowCustomizationWindow" />
							</Items>
						</dx:GridViewToolbar>
					</Toolbars>
					<ClientSideEvents FocusedCellChanging="onFocusedCellChanging"  BeginCallback="OnBeginCallbackGridDict" EndCallback="OnEndCallbackGridDict"/>

				<Columns>
					<dx:GridViewDataColumn FieldName="fldpk" CellStyle-ForeColor="Silver" Visible="false" ReadOnly="true"></dx:GridViewDataColumn>
					<dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true" />
					<dx:GridViewDataColumn FieldName="ord_pos" Caption="Position"  CellStyle-ForeColor="Silver" Width="50px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="fldname" Caption="Field Name" CellStyle-Font-Bold="true"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="datatype" Caption="Data Type" Width="70px" ></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="fielddatatype" Visible="false"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="fielddatatypelength" Visible="false"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="fieldlabel" Caption="Label"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="missval" Caption="Missing<br/>Values" Width="50px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="fieldvaluesetID" Caption="fvsID" Visible="false"  CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>
					
					<dx:GridViewDataTextColumn FieldName="valuelabels" Caption="Value Labels</br><i>(click to edit)</i>"
						PropertiesTextEdit-EncodeHtml="false" CellStyle-ForeColor="Gray" Width="150px"></dx:GridViewDataTextColumn>
					
					<dx:GridViewDataColumn FieldName="fieldcode" Caption="Special code" Visible="true" ></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="fld_status" Caption="Status" Visible="true" ></dx:GridViewDataColumn>
					
					<dx:GridViewDataColumn FieldName="ExcludeFromNDARdict" Caption="Exclude<br/>NDAR"  Width="50px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="ConvertFromLabelToValue" Caption="Convert<br/>Label"  Width="50px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="fldextractionmode" Visible="false"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="fldextractionmode_txt" Caption="Extraction mode"></dx:GridViewDataColumn>
				   
					<dx:GridViewDataColumn FieldName="importposition" Caption="Import position" Visible="true" ></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="constString" Caption="constString" Visible="true" ></dx:GridViewDataColumn>

					<dx:GridViewCommandColumn ShowDeleteButton="true" />
					
				</Columns>
				<EditFormLayoutProperties ColCount="2" >
					<Items>
						<dx:GridViewColumnLayoutItem ColumnName="fldname" ColumnSpan="1" Width="300px" />
						<%--Field Settings--%>
						<dx:GridViewLayoutGroup ColCount="4" ColumnSpan="1" Caption="Field settings"   Width="600px" >
							<Items>

								<dx:GridViewColumnLayoutItem ColumnName="ord_pos"  ColumnSpan="1"/>
								<dx:GridViewColumnLayoutItem ColumnName="fielddatatype" Caption="Data type" ColumnSpan="1">
									<Template>
										<dx:ASPxComboBox ID="cbofielddatatype" runat="server" Text='<%# Bind("fielddatatype") %>' Width="75px" >
											<Items>
												<dx:ListEditItem Value="int" />
												<dx:ListEditItem Value="float" />
												<dx:ListEditItem Value="varchar" />
												<dx:ListEditItem Value="date" />
												<dx:ListEditItem Value="datetime" />
											</Items>
										</dx:ASPxComboBox>
									</Template>
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem ColumnName="fielddatatypelength" Caption="Length" ColumnSpan="1"/>
								<dx:GridViewColumnLayoutItem ColumnName="missval" Caption="Miss Val" ColumnSpan="1"/>
							</Items>
						</dx:GridViewLayoutGroup>



							<dx:GridViewColumnLayoutItem ColumnName="fieldlabel" ColumnSpan="2"/>

							 <%-- <dx:GridViewColumnLayoutItem ColumnName="fieldvaluesetID" Caption="Field value set ID" Width="150px" /> --%>
							<%-- New ValueLabelSet --%> 
							 <dx:GridViewLayoutGroup ColCount="1" ColumnSpan="1" Caption="Value Labels" Width="600px">
								<Items>
									<dx:GridViewColumnLayoutItem ColumnName="fieldvaluesetID" Caption="Field value set ID" ColumnSpan="1">
										<Template>
											 <dx:ASPxTextBox ID="txtfieldvaluesetID" runat="server" Text='<%# Bind("fieldvaluesetID") %>' Width="50px">
										</dx:ASPxTextBox>

										</Template>
									</dx:GridViewColumnLayoutItem>
								</Items>
							</dx:GridViewLayoutGroup>

						<%-- Import Settings --%>
						 <dx:GridViewLayoutGroup ColCount="1" ColumnSpan="1" Caption="Import settings" Width="600px">
							<Items>

								<dx:GridViewColumnLayoutItem ColumnName="fldextractionmode" Caption="Extraction Mode" ColumnSpan="1">
									<Template>
										<dx:ASPxComboBox ID="cbofldextractionmode" runat="server"   Value='<%# Bind("fldextractionmode") %>' ValueType="System.Int32"   Width="225px"
												 DataSourceID="sqlFldExtractionMode" TextField="mode_txt" ValueField="mode">
										</dx:ASPxComboBox>



									</Template>
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem ColumnName="importposition" Caption="Import position"  ColumnSpan="1" Width="250px"/>
								<dx:GridViewColumnLayoutItem ColumnName="constString" Caption="Text constant"  ColumnSpan="1" Width="500px"/>
								
								<dx:GridViewColumnLayoutItem ColumnName="ExcludeFromNDARdict" Caption="In NDAR dict? (1=Exclude)" Width="250px"  ColumnSpan="1"/>
								<dx:GridViewColumnLayoutItem ColumnName="ConvertFromLabelToValue" Caption="Convert from label to value? (1=Yes)" Width="250px"  ColumnSpan="1"/>

							</Items>
						</dx:GridViewLayoutGroup>


						<dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" ShowUpdateButton="true" ShowCancelButton="true" />
					</Items>
				</EditFormLayoutProperties>
			</dx:ASPxGridView>


	
	<dx:ASPxPopupControl ID="popVallabels" runat="server" Width="320" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
		PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="popVallabels"
		 
		HeaderText="Edit Value Labels" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="true">
		<ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); }" />
		<ContentCollection>
			<dx:PopupControlContentControl runat="server">
				<dx:ASPxPanel ID="Panel1" runat="server" DefaultButton="btOK">
					<PanelCollection>
						<dx:PanelContent runat="server">
						
							<dx:ASPxLabel ID="lblVarlabels" runat="server" Text="Value labels: " Font-Bold="true" Font-Size="Small"></dx:ASPxLabel>
							<br />

								<dx:ASPxGridView ID="gridVallabels" ClientInstanceName="gridVallabels" runat="server" KeyFieldName="pk" Width="600px"
									SettingsDataSecurity-AllowEdit="true"  SettingsDataSecurity-AllowDelete="true" SettingsDataSecurity-AllowInsert="true"
									OnBatchUpdate="gridVallabels_BatchUpdate" OnCustomCallback="gridVallabels_CustomCallback" ClientVisible="true" 
									>
									<SettingsEditing Mode="Batch" BatchEditSettings-StartEditAction="Click" />
									<ClientSideEvents BeginCallback="OnBeginCallbackGridVarlabels" EndCallback="OnEndCallbackGridVarlabels" />
									<Columns>
										<dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowDeleteButton="true" Width="50" />
									<dx:GridViewDataColumn FieldName="pk" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="FieldValueSetID" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="FieldValue" Caption="Value" Width="50px" ></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="FieldValueLabel" Caption="Label" Width="200px"></dx:GridViewDataColumn>

									</Columns>
								</dx:ASPxGridView>


						</dx:PanelContent>
					</PanelCollection>
				</dx:ASPxPanel>
			</dx:PopupControlContentControl>
		</ContentCollection>
	</dx:ASPxPopupControl>


	 <dx:ASPxPopupControl ID="popNewVallabels" runat="server" Width="320" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
		PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="popNewVallabels" 
		HeaderText="Edit Value Labels" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="true">
		
		<ContentCollection>
			<dx:PopupControlContentControl runat="server">
				<dx:ASPxPanel ID="ASPxPanel1" runat="server" DefaultButton="btOK">
					<PanelCollection>
						<dx:PanelContent runat="server">
						
							<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Value labels: " Font-Bold="true" Font-Size="Small"></dx:ASPxLabel>
							<br />

								<dx:ASPxTextBox ID="txtNewValueSet" ClientInstanceName="txtNewValueSet" runat="server" Text="Enter name of new value set"></dx:ASPxTextBox>
							<br />
								<dx:ASPxButton ID="btnCreateNewValueSet" ClientInstanceName="btnCreateNewValueSet" runat="server" Text="Create new value set" ClientVisible="true"
									OnClick="btnCreateNewValueSet_Click"></dx:ASPxButton>


						</dx:PanelContent>
					</PanelCollection>
				</dx:ASPxPanel>
			</dx:PopupControlContentControl>
		</ContentCollection>
	</dx:ASPxPopupControl>




	<asp:SqlDataSource ID="sqlMeas" runat="server" SelectCommandType="Text"  
		SelectCommand="exec  trk.spMeasureList_for_Dictionary @studyID"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

	

	<asp:SqlDataSource ID="sqlFldExtractionMode" runat="server" SelectCommandType="Text"  
		SelectCommand="select fldextractionmode mode, fldextractionmode_txt mode_txt from def.FldExtractionMode"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlImportFileType" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from def.ImportFileType"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql750" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from datfieldvaluesetitem where fieldvaluesetID=@fieldvaluesetID order by fieldvalue"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:ControlParameter ControlID="hidField2" Name="fieldvaluesetID" PropertyName="Value" />
		</SelectParameters>
	</asp:SqlDataSource>



<%--    <asp:SqlDataSource ID="sqlDict" runat="server" SelectCommandType="Text"  
		SelectCommand="select fldpk, tblpk, fldname, fielddatatype, fielddatatypelength, 
			 fielddatatype + (coalesce('(' + cast(fielddatatypelength as varchar)+')','') datatype, fieldlabel from def.Fld where tblpk = (select tblpk from def.tbl where measureID = @measureID) order by ord_pos"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:QueryStringParameter QueryStringField="measureID" Name="measureID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>--%>


</asp:Content>
