<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Measure.aspx.cs" AutoEventWireup="true"
 Inherits="Library_Measure" Title="Measure Info"      %>  

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
 
<script type="text/javascript">
	var isDirty = false;
	var state = { };
	function onControlsInitialized() {
		ASPxClientEdit.AttachEditorModificationListener(onEditorsChanged, function(control) {
				return control.GetParentControl() === FormLayout // Gets standalone editors nested inside the form layout control
			});
		ASPxClientUtils.AttachEventToElement(window, "beforeunload", onBeforeUnload);
		state = ASPxClientUtils.GetEditorValuesInContainer(FormLayout.GetMainElement());
	}
	function onEditorsChanged(s, e) {
		SaveButton.SetEnabled(true);
		CancelButton.SetEnabled(true);
		isDirty = true;
	}

	function restoreEditorsState() {
		for(var controlName in state) {
			var trackedControl = ASPxClientControl.GetControlCollection().Get(controlName);
			var setValueMethod = trackedControl.SetTokenCollection || trackedControl.SelectValues || trackedControl.SetValue;
			if(setValueMethod === trackedControl.SelectValues)
				trackedControl.UnselectAll();
			setValueMethod.call(trackedControl, state[controlName]);
		}
	}
	function cancelChanges(s, e) {
		restoreEditorsState();
		isDirty = false;
		SaveButton.SetEnabled(false);
		CancelButton.SetEnabled(false);
	}
	function onBeforeUnload(e) {
		if(!isDirty)
			return;
		var confirmMessage = "Are you sure you want to close the form? Any unsaved data will be lost.";
		e.returnValue = confirmMessage;
		return confirmMessage;
	}
	function onSubmitForm() {
		isDirty = false;
	}
</script>

</asp:Content>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>
	<dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server" ClientSideEvents-ControlsInitialized="onControlsInitialized"></dx:ASPxGlobalEvents>
		<dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="Medium" Text="Measure Library: Details" Font-Bold="true"></dx:ASPxLabel>

	<br />
		<div class="buttonContainer">
			<table>
				<tr>
					<td style="width: 700px;"></td>
					<td style="width: 150px;">
						<div class="buttonContent">
							<dx:ASPxButton ID="SaveButton" ClientInstanceName="SaveButton" runat="server"
								Text="Save Changes" Width="80px" CssClass="buttonWidth" ClientEnabled="false" OnClick="SaveButton_OnClick">
								<ClientSideEvents Click="onSubmitForm" />
							</dx:ASPxButton>
						</div>

					</td>
					<td>
						<div class="buttonContent leftPadding topPadding">
							<dx:ASPxButton ID="CancelButton" ClientInstanceName="CancelButton" runat="server"
								Text="Cancel Changes" Width="80px" CssClass="buttonWidth" AutoPostBack="false" ClientEnabled="false">
								<ClientSideEvents Click="cancelChanges" />
							</dx:ASPxButton>
						</div>
					</td>
				</tr>
			</table>
	</div>

	<dx:ASPxFormLayout ID="FormLayout" ClientInstanceName="FormLayout" runat="server"  AlignItemCaptionsInAllGroups="True" UseDefaultPaddings="false"
			EnableViewState="true">
		<SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
			<Items>
				
				<dx:LayoutItem Caption="Measure" FieldName="measname">
					<LayoutItemNestedControlCollection>
						<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
							<dx:ASPxTextBox ID="measNameTextBox" ClientInstanceName="measname"  runat="server" Width="50%" Font-Size="Medium" Font-Bold="true" />
						</dx:LayoutItemNestedControlContainer>
					</LayoutItemNestedControlCollection>
				</dx:LayoutItem>
				<dx:LayoutItem Caption="Measure Full Name" FieldName="measfullname" >
					<LayoutItemNestedControlCollection>
						<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
							<dx:ASPxTextBox ID="measFullNameTextBox" ClientInstanceName="measfullname"  runat="server" Width="80%" Font-Size="Medium" />
						</dx:LayoutItemNestedControlContainer>
					</LayoutItemNestedControlCollection>
				</dx:LayoutItem>
				
				<dx:LayoutGroup Caption="Measure Information" ColCount="2">
					<Items>
						<dx:LayoutGroup Caption="Details" ColCount="1" Width="60%">
							<Items>

								<dx:LayoutItem Caption="Description" FieldName="DescriptionText" >
									<LayoutItemNestedControlCollection>
										<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
											<dx:ASPxMemo ID="ASPxMemo1" ClientInstanceName="DescriptionText" runat="server" Height="80px" Width="100%" Rows="10" />
										</dx:LayoutItemNestedControlContainer>
									</LayoutItemNestedControlCollection>
								</dx:LayoutItem>
								<dx:LayoutItem Caption="Citation" FieldName="CitationText"  >
									<LayoutItemNestedControlCollection>
										<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
											<dx:ASPxMemo ID="ASPxMemo2" ClientInstanceName="CitationText" runat="server" Height="50px" Width="100%" Rows="5" />
										</dx:LayoutItemNestedControlContainer>
									</LayoutItemNestedControlCollection>
								</dx:LayoutItem>

								<dx:LayoutItem Caption="Copyright Info" Width="100%" FieldName="CopyrightInfo">
									<LayoutItemNestedControlCollection>
										<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
											<dx:ASPxMemo ID="notesMemo" ClientInstanceName="CopyrightInfo" runat="server" Height="25px" Width="100%" Rows="3" />
										</dx:LayoutItemNestedControlContainer>
									</LayoutItemNestedControlCollection>
								</dx:LayoutItem>
								<dx:LayoutItem Caption="Ordering Info" Width="100%" FieldName="orderinginfo">
									<LayoutItemNestedControlCollection>
										<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
											<dx:ASPxMemo ID="ASPxMemo3" ClientInstanceName="orderinginfo" runat="server" Height="25px" Width="100%" Rows="3" />
										</dx:LayoutItemNestedControlContainer>
									</LayoutItemNestedControlCollection>
								</dx:LayoutItem>

							</Items>
						</dx:LayoutGroup>
						<dx:LayoutGroup Caption="Data Information" ColCount="1" Width="38%">
							<Items>

							<dx:LayoutGroup Caption="Describe the measure" ColCount="1" >
								<Items>
									<dx:LayoutItem Caption="Category" FieldName="MeasCatID">
										<LayoutItemNestedControlCollection>
											<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
												<dx:ASPxComboBox ID="cboMeasCat" ClientInstanceName="MeasCatID" runat="server" DataSourceID="sqlMeasCat" TextField="meascat" ValueField="meascatID"
													ValueType="System.Int32" AutoPostBack="false" ></dx:ASPxComboBox>
											</dx:LayoutItemNestedControlContainer>
										</LayoutItemNestedControlCollection>
									</dx:LayoutItem>

									<dx:LayoutItem Caption="Focus" FieldName="FocusPerson">
										<LayoutItemNestedControlCollection>
											<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
												<dx:ASPxComboBox ID="cboMeasFocus" ClientInstanceName="FocusPerson" runat="server" DataSourceID="sqlMeasFocus" TextField="measfocus" ValueField="measfocusID"
													ValueType="System.Int32" AutoPostBack="false"  ></dx:ASPxComboBox>
											</dx:LayoutItemNestedControlContainer>
										</LayoutItemNestedControlCollection>
									</dx:LayoutItem>

									 <dx:LayoutItem Caption="Method" FieldName="Method">
										<LayoutItemNestedControlCollection>
											<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
												<dx:ASPxComboBox ID="cboMeasMeth"  ClientInstanceName="Method" runat="server" DataSourceID="sqlMeasMethod" TextField="measmethod" ValueField="measmethodID"
													ValueType="System.Int32" AutoPostBack="false" ></dx:ASPxComboBox>
											</dx:LayoutItemNestedControlContainer>
										</LayoutItemNestedControlCollection>
									</dx:LayoutItem>

									<dx:LayoutItem Caption="Respondent" FieldName="Respondant">
										<LayoutItemNestedControlCollection>
											<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
												<dx:ASPxComboBox ID="cboMeasResp"  ClientInstanceName="Respondant" runat="server" DataSourceID="sqlMeasResp" TextField="measresp" ValueField="measrespID"
													ValueType="System.Int32" AutoPostBack="false" ></dx:ASPxComboBox>
											</dx:LayoutItemNestedControlContainer>
										</LayoutItemNestedControlCollection>
									</dx:LayoutItem>

									<dx:LayoutItem Caption="Source" FieldName="MeasSourceID">
										<LayoutItemNestedControlCollection>
											<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
												<dx:ASPxComboBox ID="ASPxComboBox4" ClientInstanceName="MeasSourceID" runat="server" DataSourceID="sqlMeasSource" TextField="meassource" ValueField="meassourceID"
													ValueType="System.Int32" AutoPostBack="false" ></dx:ASPxComboBox>
											</dx:LayoutItemNestedControlContainer>
										</LayoutItemNestedControlCollection>
									</dx:LayoutItem>

								</Items>
							</dx:LayoutGroup>
							<dx:EmptyLayoutItem />
							<dx:LayoutGroup Caption="Database Information" ColCount="1" >
								<Items>
									 <dx:LayoutItem Caption="DB table pk" FieldName="tblpk">
										<LayoutItemNestedControlCollection>
											<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
												<dx:ASPxLabel ID="ASPxTextBox2" ClientInstanceName="tblpk" runat="server"  Font-Bold="true" ReadOnly="true" />
											</dx:LayoutItemNestedControlContainer>
										</LayoutItemNestedControlCollection>
									</dx:LayoutItem>
									 <dx:LayoutItem Caption="DB table" FieldName="tblname">
										<LayoutItemNestedControlCollection>
											<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
												<dx:ASPxLabel ID="ASPxTextBox1" ClientInstanceName="tblname" runat="server"  Font-Bold="true" />
											</dx:LayoutItemNestedControlContainer>
										</LayoutItemNestedControlCollection>
									</dx:LayoutItem>
									 <dx:LayoutItem Caption="Scoring proc" FieldName="spname">
										<LayoutItemNestedControlCollection>
											<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
												<dx:ASPxLabel ID="ASPxLabel1"  ClientInstanceName="spname" runat="server"  Font-Bold="false" />
											</dx:LayoutItemNestedControlContainer>
										</LayoutItemNestedControlCollection>
									</dx:LayoutItem>
								</Items>
							</dx:LayoutGroup>


							<dx:EmptyLayoutItem />
							<dx:LayoutGroup Caption="Import Settings" ColCount="1" >
								<Items>
									 <dx:LayoutItem Caption="Import File Type" FieldName="importfiletype">
										<LayoutItemNestedControlCollection>
											<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
												 <dx:ASPxComboBox ID="ASPxComboBox1" ClientInstanceName="importfiletype" runat="server" DataSourceID="sqlImportFileType" TextField="importfiletype_txt" ValueField="importfiletype"
													ValueType="System.Int32" AutoPostBack="false"  ></dx:ASPxComboBox>
											</dx:LayoutItemNestedControlContainer>
										</LayoutItemNestedControlCollection>
									</dx:LayoutItem>
									 <dx:LayoutItem Caption="# rows skip" FieldName="skipstartingrows">
										<LayoutItemNestedControlCollection>
											<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
												<dx:ASPxTextBox ID="ASPxLabel4" ClientInstanceName="skipstartingrows" runat="server"  Font-Bold="true" />
											</dx:LayoutItemNestedControlContainer>
										</LayoutItemNestedControlCollection>
									</dx:LayoutItem>
									 <dx:LayoutItem Caption="Text qualifier" FieldName="textqualifier">
										<LayoutItemNestedControlCollection>
											<dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
												<dx:ASPxComboBox ID="ASPxComboBox2" ClientInstanceName="textqualifier" runat="server" AutoPostBack="false"  >
													<Items>
														<dx:ListEditItem Value="0" Text="none" ></dx:ListEditItem>
														<dx:ListEditItem Value="1" Text="doublequote"></dx:ListEditItem>
														<dx:ListEditItem Value="2" Text="singlequote"></dx:ListEditItem>
													</Items>
												</dx:ASPxComboBox>
											</dx:LayoutItemNestedControlContainer>
										</LayoutItemNestedControlCollection>
									</dx:LayoutItem>
								</Items>
							</dx:LayoutGroup>
							</Items>
						</dx:LayoutGroup>

					</Items>
				</dx:LayoutGroup>
				

<%--                <dx:LayoutGroup Caption="X" ColCount="3">
					<Items>


					</Items>
				</dx:LayoutGroup>--%>

			</Items>
		</dx:ASPxFormLayout>


	<br />
	<br />
	<dx:ASPxLabel ID="lblDocs" runat="server" Font-Size="Small" Text="Documents" Font-Bold="true"></dx:ASPxLabel>
	<asp:Button ID="btnShowUploadDocPanel" runat="server" Text="Upload Docs" Font-Size="X-Small" OnClick="ShowUploadDocPanel" />
	<br />

	
 <%--Upload and Edit Docs--%>
	<asp:UpdatePanel ID="Panel_UploadDocs" runat="server" Visible="false" UpdateMode="Conditional">
	<ContentTemplate>
		
		<asp:HiddenField ID="hidDocID" runat="server" Value="0"/>
		<asp:HiddenField ID="hidDocVersID" runat="server" Value="0"/>

	<table style="background-color: aliceblue">
	<tr>
	<%--Left Col--%>
	<td style="vertical-align:top; padding: 10px">
		<asp:Label ID="lblDocType" runat="server" Text="Document type:" Font-Size="X-Small" Width = "200px"></asp:Label>
		<asp:Label ID="Label60" runat="server" Text="Document status:" Font-Size="X-Small"></asp:Label><br /> 
			   
		<asp:DropDownList ID="ddl_DocType" runat="server" DataSourceID="sql_doctype" DataValueField="DocTypeID" DataTextField="DocType" Width="200px">        </asp:DropDownList>
		<asp:DropDownList ID="ddl_DocStatus" runat="server" DataSourceID="sql_docstatus" DataValueField="DocStatusID" DataTextField="DocStatus">        </asp:DropDownList><br />

		<asp:Label ID="Label21" runat="server" Text="Title:" Font-Size="X-Small"></asp:Label><br />
		<asp:TextBox ID="txtDocTitle" runat="server" Width = "450px"></asp:TextBox><br />
		<asp:Label ID="Label51" runat="server" Text="Description:" Font-Size="X-Small"></asp:Label><br />
		<asp:TextBox ID="txtDocDesc" runat="server" TextMode="MultiLine" Width="450px" Height="100px"></asp:TextBox><br /><br />
		
		

		</td>
	

	<%--Right Col--%>
	<td style="vertical-align:top; padding: 10px">        
		<asp:Label ID="Label52" runat="server" Text="Select file:" Font-Size="X-Small"></asp:Label><br />
		<asp:FileUpload ID="FileUpload_Doc" runat="server" Font-Size="Smaller" Width="400px" />
		<br /><br />
		<asp:Button ID="btnUploadDoc" runat="server" AutoPostBack="true" Text="Upload Document" OnClick="UploadDoc" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnUploadDoc_Cancel" runat="server" AutoPostBack="true" Text="Cancel" OnClick="UploadDoc_Cancel" ForeColor="Red" />
		<br />
		<br />
		<asp:Label ID="lblDocUploadInfo" runat="server" Text="" Font-Size="Smaller"></asp:Label>

	</td>
	</tr>
	</table>
	</ContentTemplate>
	<Triggers>
	<asp:PostBackTrigger ControlID="btnUploadDoc" />
	<asp:PostBackTrigger ControlID="btnUploadDoc_Cancel" />
	</Triggers>
	</asp:UpdatePanel>   

	<br />

	<dx:ASPxGridView ID="gridDocs" ClientInstanceName="gridDocs" runat="server" KeyFieldName="DocVersID" PreviewFieldName="DocDesc" Width="90%"
		 SettingsDataSecurity-AllowEdit="true"  OnRowUpdating="gridDocs_OnRowUpdating" >
		<Columns>
			<dx:GridViewDataColumn FieldName="DocTitle" Caption="Doc Title" EditFormSettings-VisibleIndex="0">
<%--				<EditItemTemplate>
					<dx:ASPxTextBox runat="server" ID="edittxtDocTitle" Text='<%# Bind("DocTitle") %>'  Width="80%" ></dx:ASPxTextBox>
				</EditItemTemplate>--%>
			</dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="Version" ReadOnly="true" EditFormSettings-Visible="false"></dx:GridViewDataColumn>
			<dx:GridViewDataTextColumn Caption="Link" ReadOnly="true" EditFormSettings-Visible="false">
				<DataItemTemplate>
					<dx:ASPxHyperLink runat="server" ID="keyFieldLink" OnInit="keyFieldLink_Init"></dx:ASPxHyperLink>
				</DataItemTemplate>
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataColumn FieldName="fileext" Caption="File Type" ReadOnly="true" EditFormSettings-Visible="false"></dx:GridViewDataColumn>
			<dx:GridViewDataMemoColumn FieldName="DocDesc" Caption="Description of document" Visible="false" PropertiesMemoEdit-Height="50px"   
				EditFormSettings-Caption="Description of the document" EditFormSettings-Visible="true" 
				EditFormSettings-ColumnSpan="2" EditCellStyle-Wrap="true"  EditFormSettings-VisibleIndex="1">
			</dx:GridViewDataMemoColumn>			
			<dx:GridViewDataMemoColumn FieldName="ChangesDesc" Caption="Description of Changes" PropertiesMemoEdit-Height="50px"   
				EditFormSettings-Caption="Changes in this version of the document" EditFormSettings-VisibleIndex="2"
				EditFormSettings-ColumnSpan="2" EditCellStyle-Wrap="true"  >
<%--				<EditItemTemplate>
					<dx:ASPxTextBox runat="server" ID="edittxtChangesDesc" Text='<%# Bind("ChangesDesc") %>' Height="50px" Width="80%" Multi ></dx:ASPxTextBox>
				</EditItemTemplate>--%>

			</dx:GridViewDataMemoColumn>
			<dx:GridViewCommandColumn ShowEditButton="true"></dx:GridViewCommandColumn>
			<dx:GridViewDataColumn FieldName="DateSubmitted" Caption="Date Submitted" ReadOnly="true" EditFormSettings-Visible="false"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="doctype" Caption="Document Type" GroupIndex="0" ReadOnly="true" EditFormSettings-Visible="false"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="DocID" ReadOnly="true"  Visible="false" Width="50px" EditCellStyle-ForeColor="Silver" EditFormCaptionStyle-ForeColor="Silver">
				  <EditFormSettings Visible="True" VisibleIndex="4"/>
			</dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="DocVersID" ReadOnly="true" Visible="false" Width="50px" EditCellStyle-ForeColor="Silver" EditFormCaptionStyle-ForeColor="Silver" >
				  <EditFormSettings Visible="True" VisibleIndex="5"  />
			</dx:GridViewDataColumn>
		</Columns>
		<Settings ShowGroupPanel="true"  />
		<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="true" />
		<Settings ShowPreview="true" />
		<SettingsPager Mode="ShowAllRecords" />
	</dx:ASPxGridView>


		<asp:SqlDataSource ID="sqlMeasCat" runat="server" SelectCommandType="Text"  
		SelectCommand="select meascatID, meascat from tblMeasureCat_lkup order by meascat"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>

		<asp:SqlDataSource ID="sqlMeasFocus" runat="server" SelectCommandType="Text"  
		SelectCommand="select measfocusID, measfocus from tblMeasFocus_lkup order by measfocus"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlMeasSource" runat="server" SelectCommandType="Text"  
		SelectCommand="select meassourceID, meassource from tblMeasSource_lkup order by meassource"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlMeasResp" runat="server" SelectCommandType="Text"  
		SelectCommand="select measrespID, measresp from tblMeasResp_lkup order by sortorder"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlMeasMethod" runat="server" SelectCommandType="Text"  
		SelectCommand="select measmethodID, measmethod from tblMeasMethod_lkup order by measmethod"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sqlImportFileType" runat="server" SelectCommandType="Text"  
		SelectCommand="select importfiletype, importfiletype_txt from def.ImportFileType order by 2"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_doctype" runat="server" SelectCommandType="Text" SelectCommand="select 0 DocTypeID, '<..select..>' as DocType union select DocTypeID, DocType from tblDocType_lkup where DocTypeID in (2,21,10, 15,16) order by DocType" ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"></asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_docstatus" runat="server" SelectCommandType="Text" SelectCommand="select 0 DocStatusID, '<..select..>' DocStatus union select DocStatusID, DocStatus from tblDocStatus_lkup order by 1" ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"></asp:SqlDataSource>



</asp:Content>