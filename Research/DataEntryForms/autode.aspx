﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="autode.aspx.cs" Inherits="DataEntryForms_autode" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	 <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" />

<link rel="stylesheet" type="text/css" href="~/css/dataentryforms.css" />

	<asp:HiddenField runat="server" ID="Grid1ExcelDeletedIds" />	
	<asp:HiddenField runat="server" ID="Grid1ExcelData" />   




<%--		<script type="text/javascript">
		window.onload = function () {
			Grid1.convertToExcel(
				['ReadOnly', 'ReadOnly', 'ReadOnly', 'TextBox', 'TextBox', 'TextBox', 'MultiLineTextBox', 'MultiLineTextBox'],
				'<%=Grid1ExcelData.ClientID %>',
				'<%=Grid1ExcelDeletedIds.ClientID %>'
				);
		}
	</script>--%>

<style type="text/css">
		.tdText {
			font:11px Verdana;
			color:#333333;
		}
		.option2{
			font:11px Verdana;
			color:#0033cc;
			background-color:#f6f9fc;
			padding-left:4px;
			padding-right:4px;
		}
		a {
			font:11px Verdana;
			color:#315686;
			text-decoration:underline;
		}
		.excel-textbox
		{
			background-color: transparent;
			border: 0px;
			margin: 0px;
			padding: 0px;
			outline: 0;
			font: inherit;
			width: 100%;
			padding-top: 4px;
			padding-bottom: 4px;
		}
	
		.excel-textbox-focused
		{
			background-color: #ffd800;
			border: 0px;
			margin: 0px;
			padding: 0px;
			outline: 0;
			font: inherit;
			width: 100%;
			padding-top: 4px;
			padding-bottom: 4px;
		}
	
		.excel-textbox-error
		{
			color: #FF0000;
		}
	
		.ob_gCc2 
		{
		   padding-left: 3px !important;
		}
	
		.ob_gBCont
		{
			border-bottom: 1px solid #C3C9CE;
		}
		
		.excel-checkbox
		{
			height: 20px;
			line-height: 20px;
		}
	</style>


	<script type="text/javascript">
		function markAsFocused(textbox) {
			textbox.className = 'excel-textbox-focused';
		}

		function markAsBlured(textbox, dataField, rowIndex) {
			textbox.className = 'excel-textbox';

			Grid1.Rows[rowIndex].Cells[dataField].Value = textbox.value;
			PageMethods.UpdateField(getFieldObject(rowIndex), null, null);
		}


		function getFieldObject(rowIndex) {
			var field = new Object();
			field.pk = Grid1.Rows[rowIndex].Cells['pk'].Value;
			field.layout_section = Grid1.Rows[rowIndex].Cells['layout_section'].Value;
			field.layout_row = Grid1.Rows[rowIndex].Cells['layout_row'].Value;
			field.layout_col = Grid1.Rows[rowIndex].Cells['layout_col'].Value;
			field.width_label = Grid1.Rows[rowIndex].Cells['width_label'].Value;
			field.width_box = Grid1.Rows[rowIndex].Cells['width_box'].Value;
			field.isReadOnly = Grid1.Rows[rowIndex].Cells['isReadOnly'].Value;
			field.DoubleEntryRequired = Grid1.Rows[rowIndex].Cells['DoubleEntryRequired'].Value;
			field.showValueLabels = Grid1.Rows[rowIndex].Cells['showValueLabels'].Value;
			field.fieldlabel = Grid1.Rows[rowIndex].Cells['fieldlabel'].Value;
			field.aspxfieldlabeltext = Grid1.Rows[rowIndex].Cells['aspxfieldlabeltext'].Value;

			return field;
		}
	</script>


<%--    From obout Examples\HTMLEditor\cs_oboutGrid.aspx--%>
	<script type="text/JavaScript">
		function onAddEdit() {
			// get the Editor component
			var editorObject = $find(document.getElementById("<%= EditorID.ClientID %>").value);
		// set the Editor's content
		editorObject.set_content(document.getElementById('EditorContent').value);

		// trick against weird behavior of IE with version number more than or equal 8
		if (Obout.Ajax.UI.HTMLEditor.isIE && Sys.Browser.version >= 8) {
			// get the EditPanel of the Editor
			var editPanel = editorObject.get_editPanel();
			// get active edit mode
			var activeMode = editPanel.get_activeMode();
			// for Design and Preview modes only
			if (activeMode == Obout.Ajax.UI.HTMLEditor.ActiveModeType.Design ||
				activeMode == Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview
			) {
				// preserve the content
				var content = editPanel.getContent();
				// currently active panel in EditPanel
				var panel = editPanel.get_activePanel();
				// deactivate it
				panel._deactivate();
				// activate the panel again with the preserved content
				panel._activate(content);
			}
		}
	}

	function onBeforeInsertUpdate() {
		var editorObject = $find(document.getElementById("<%= EditorID.ClientID %>").value);
		document.getElementById('EditorContent').value = editorObject.get_content();
		editorObject.clearHistory();
	}

	function onBeforeClientCancelEdit() {
		var editorObject = $find(document.getElementById("<%= EditorID.ClientID %>").value);
		var editPanel = editorObject.get_editPanel();
		editPanel.ensurePopupsClosed();
		editorObject.clearHistory();
	}
</script>

<%--<def:dataentrycontroller id="DataEntryController1" runat="server" ></def:dataentrycontroller>

<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxWidth="80px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>--%>

		<obout:EditorPopupHolder runat="Server" ID="popupHolder" />

		<asp:HiddenField ID="EditorID" runat="server" />


	<asp:Label ID="Label13" runat="server" Text="Edit Labels & Layout for Data Entry Form" Font-Size="Medium" Font-Bold="true"  ></asp:Label>
			
	<br />
	<table>
		<tr>
			<td style="vertical-align:top">
					<table>
						<tr>
							<td style="vertical-align:top">
								<asp:DropDownList ID="ddlMeas" runat="server" DataTextField="measname" DataValueField="measureID" EnableViewState="true" 
									OnSelectedIndexChanged="ddlMeas_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
							</td>
							<td style="vertical-align:top">
								<asp:Button ID="btnLoadFields" runat="server" OnCommand="btnCommand" CommandName="LoadFields" ForeColor="DarkGreen" Text="Load Fields" />
							</td>
							<td style="vertical-align:top" colspan="2">
								<asp:Button ID="btnLoadLayout" runat="server" OnCommand="btnCommand" CommandName="LoadLayout"  ForeColor="Purple"  Text="Show Layout" />
							</td>

						</tr>
						<tr>
							<td></td>
							<td style="vertical-align:top">
	<%--							<asp:Button ID="btnLoadSections" runat="server" OnCommand="btnCommand" CommandName="LoadSections" Text="Load Sections" />--%>
								<asp:Label ID="Label14" runat="server" Text="Sort by:" Font-Size="XX-Small"  ForeColor="DarkGreen" Visible="true"></asp:Label>
								<asp:RadioButtonList ID="rblSort" runat="server"  ForeColor="DarkGreen" Visible="true"  Font-Size="XX-Small" >
									<asp:ListItem Text="Section, Row, Col" Value="SectionRowCol" Selected="True" ></asp:ListItem>
									<asp:ListItem Text="Section, Col, Row" Value="SectionColRow"   ></asp:ListItem>
									<asp:ListItem Text="Position" Value="Position"  ></asp:ListItem>
									<asp:ListItem Text="Field Name" Value="FieldName"  ></asp:ListItem>
								</asp:RadioButtonList>
							</td>
							<td style="vertical-align:top">				
								<asp:Label ID="Label1" runat="server" Text="Render as:" Font-Size="XX-Small"  ForeColor="Purple" Visible="false"></asp:Label>
								<asp:RadioButtonList ID="rbl1" runat="server"  ForeColor="Purple" Visible="false">
									<asp:ListItem Text="DE Form" Value="DE Form" ></asp:ListItem>
									<asp:ListItem Text="Text" Value="Text" Selected="True" ></asp:ListItem>
								</asp:RadioButtonList>


							</td>
							<td style="vertical-align:top">
								<asp:Label ID="Label2" runat="server" Text="Display the:" Font-Size="XX-Small"  ForeColor="Indigo"></asp:Label>
								<asp:RadioButtonList ID="rbl2" runat="server" ForeColor="Indigo"   >
									<asp:ListItem Text="Layout" Value="Layout" Selected="True" ></asp:ListItem>
									<asp:ListItem Text="Code" Value="Code" ></asp:ListItem>
								</asp:RadioButtonList>

							</td>
							<td width="10px"></td>
							<td></td>
						</tr>
					</table>

			</td>
			<td width="100px"></td>
			<td style="vertical-align:top">
				

				<table>
					<tr>
						<td style="vertical-align:top">
							<asp:Label ID="lblSection" runat="server" Text="Section #:" Font-Size="XX-Small" Width="60px"></asp:Label>
							<asp:TextBox ID="txtSection" runat="server" Text="" Width="60px"></asp:TextBox>
							<asp:Button ID="btnEdit" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="InsertSection" Text="Insert section" />
							</td>
						<td>
							<asp:Label ID="Label3" runat="server" Text=" " Font-Size="XX-Small"></asp:Label>
							<asp:Button ID="btnDelete" runat="server" ForeColor="DarkRed" OnCommand="btnCommand" CommandName="DeleteSection" Text="Delete section" />
						</td>
					</tr>
					<tr>
						<td style="vertical-align:top">
							<asp:Label ID="Label5" runat="server" Text="Row #:" Font-Size="XX-Small" Width="60px"></asp:Label>
							<asp:TextBox ID="txtRow" runat="server" Text="" Width="60px"></asp:TextBox>
							<asp:Button ID="Button1" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="InsertRow" Text="Insert row" Visible="false" />
							</td>
						<td>
							<asp:Label ID="Label6" runat="server" Text=" " Font-Size="XX-Small"></asp:Label>
							<asp:Button ID="Button2" runat="server" ForeColor="DarkRed" OnCommand="btnCommand" CommandName="DeleteRow" Text="Delete row" Visible="false" />
						</td>
					</tr>
					<tr>
						<td style="vertical-align:top">
							<asp:Label ID="Label7" runat="server" Text="Col #:" Font-Size="XX-Small" Width="60px"></asp:Label>
							<asp:TextBox ID="txtCol" runat="server" Text="" Width="60px"></asp:TextBox>
							<asp:Button ID="Button3" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="InsertColumn" Text="Insert column" Visible="false" />
							</td>
						<td>
							<asp:Label ID="Label8" runat="server" Text=" " Font-Size="XX-Small"></asp:Label>
							<asp:Button ID="Button4" runat="server" ForeColor="DarkRed" OnCommand="btnCommand" CommandName="DeleteColumn" Text="Delete column" Visible="false" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<asp:Label ID="Label11" runat="server" Text="Enter 0 to apply width to a whole Section, Row, or Col" Font-Size="XX-Small"></asp:Label>
						</td>
					</tr>
				</table>


			</td>
			
			<td width="100px"></td>
			
			<td style="vertical-align:top">
				<table>
					<tr>
						<td style="vertical-align:top">
							<asp:Label ID="Label9" runat="server" Text="Label Width:" Font-Size="XX-Small" Width="80px"></asp:Label>
							<asp:TextBox ID="txtWidth_label" runat="server" Text="" Width="60px"></asp:TextBox>
							<asp:Button ID="Button5" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="UpdateWidth" Text="Update Widths" />
							</td>
					</tr>
					<tr>
						<td style="vertical-align:top">
							<asp:Label ID="Label10" runat="server" Text="TextBox Width:" Font-Size="XX-Small" Width="80px"></asp:Label>
							<asp:TextBox ID="txtWidth_box" runat="server" Text="" Width="60px"></asp:TextBox>
<%--							<asp:Button ID="Button6" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="TextBoxWidth" Text="Update TextBox Width" />--%>
							</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>





	<br />
	<br />
				<asp:UpdatePanel ID="updatepanel_Sections" runat="server" UpdateMode="Conditional" Visible="false">
					<ContentTemplate>

	<table>
		<tr>
			<td style="vertical-align:top">
				<asp:HiddenField ID="hidSectionID" runat="server" />
				<asp:HiddenField ID="hidColumnID" runat="server" />
		
				<asp:Label ID="Label4" runat="server" Text="Section Text" Font-Size="Small" Font-Bold="true"></asp:Label>

						<asp:GridView ID="GridSections1" runat="server" AutoGenerateColumns="false">
							<Columns>
								<asp:BoundField HeaderText ="sectionID"  DataField="sectionID" ReadOnly="true"  runat="server" Visible="true" ControlStyle-ForeColor="Gray" />
								<asp:BoundField  HeaderText ="Section #" DataField="sectionnum" ReadOnly="true" runat="server" Visible="true" />
								<asp:TemplateField HeaderText="Section Header Text">
									<ItemTemplate>
										<asp:Literal ID="lit1" runat="server" Text='<%# Eval("sectionheadertext") %>'></asp:Literal>
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField>
									<ItemTemplate>
										<asp:Button ID="btnEditSection" runat="server" Text="Edit" OnCommand="btnCommand" CommandName="EditSectionHeaderText" CommandArgument='<%# Eval("sectionID") %>' />
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>


			
			</td>
			<td width="50px"></td>
			<td style="vertical-align:top">
						<asp:Label ID="Label12" runat="server" Text="Column Text" Font-Size="Small" Font-Bold="true"></asp:Label>

						<asp:GridView ID="GridColumns" runat="server" AutoGenerateColumns="false">
							<Columns>
								<asp:BoundField HeaderText ="columnID"  DataField="columnID" ReadOnly="true"  runat="server" Visible="true" ControlStyle-ForeColor="Gray" />
								<asp:BoundField  HeaderText ="Column #" DataField="colnum" ReadOnly="true" runat="server" Visible="true" />
								<asp:TemplateField HeaderText="Column Header Text">
									<ItemTemplate>
										<asp:Literal ID="lit2" runat="server" Text='<%# Eval("colheadertext") %>'></asp:Literal>
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField>
									<ItemTemplate>
										<asp:Button ID="btnEditColumn" runat="server" Text="Edit" OnCommand="btnCommand" CommandName="EditColumnHeaderText" CommandArgument='<%# Eval("columnID") %>' />
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>


			</td>			

						<td width="50px"></td>

				<td style="vertical-align:top" width="600px">


				<asp:Label ID="lblEditor_Contents" runat="server" Font-Size="X-Small" ></asp:Label>
					<br />
				<obout:Editor runat="server" ID="Editor" EditPanel-Height="150px" Width="100%" Visible="false" >
					<TopToolbar Appearance="custom" >
						<AddButtons>
							<obout:ButtonsGroup runat="server"><Buttons>
								<obout:Undo runat="server" />
								<obout:Redo runat="server" />
								<obout:HorizontalSeparator runat="server" />
							</Buttons></obout:ButtonsGroup>
							<obout:ButtonsGroup runat="server"><Buttons>
								<obout:Bold runat="server" />
								<obout:Italic runat="server" />
								<obout:Underline runat="server" />
								<obout:HorizontalSeparator runat="server" />
							</Buttons></obout:ButtonsGroup>
							<obout:HorizontalSeparator runat="server" />
							<obout:FontSize runat="server" />
							<obout:HorizontalSeparator runat="server" />
							<obout:ButtonsGroup runat="server"><Buttons>
								<obout:FixedForeColor ID="FixedForeColorButton" runat="server" />
								<obout:ForeColorSelector FixedColorButtonID="FixedForeColorButton" runat="server" />
							</Buttons></obout:ButtonsGroup>
							<obout:HorizontalSeparator runat="server" />
							<obout:ButtonsGroup runat="server"><Buttons>
								<obout:FixedBackColor ID="FixedBackColorButton" runat="server" />
								<obout:BackColorSelector FixedColorButtonID="FixedBackColorButton" runat="server" />
							</Buttons></obout:ButtonsGroup>
							<obout:HorizontalSeparator runat="server" />
							<obout:RemoveStyles runat="server" />
							<obout:TextIndicator runat="server" />
						</AddButtons>
					</TopToolbar>
					<BottomToolbar ShowDesignButton="false" ShowHtmlTextButton="false" ShowPreviewButton="false" />
				</obout:Editor>
				<br />
				<asp:Button ID="btnSaveSectionText" runat="server" Text="Update Section Text" OnClick="btnSaveSectionText_Click" Visible="false" />
				<asp:Button ID="btnSaveColumnText" runat="server" Text="Update Column Text" OnClick="btnSaveColumnText_Click" Visible="false" />
			

			</td>

		</tr>
	</table>
					</ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="btnSaveSectionText" EventName="Click" />

					</Triggers>
				</asp:UpdatePanel>


	<table>
		<tr>
			<td style="vertical-align:top">
				
				<obout:Grid ID="Grid1" runat="server" CallbackMode="false" Serialize="false" AutoGenerateColumns="false"
					AllowRecordSelection="false" ShowFooter="true" AllowSorting="false" PageSize="-1" AllowAddingRecords="false"
					ShowLoadingMessage="false" AllowPageSizeSelection="false" AllowPaging="false" Visible="false"
					OnRowDataBound="Grid1_RowDataBound">
					<Columns>
						<obout:Column ID="Column9" DataField="pk" ReadOnly="true" HeaderText="pk" Width="50" runat="server" Visible="false"></obout:Column>			
						<obout:Column ID="Column10" DataField="ord_pos" ReadOnly="true" HeaderText="Pos" Width="60" runat="server" Visible="true"></obout:Column>			
						<obout:Column ID="Column11" DataField="databasefield" ReadOnly="true" HeaderText="Field" Width="120" runat="server" Visible="true"></obout:Column>			
						<obout:Column ID="Column12" DataField="layout_section" HeaderText="Section" Width="60" runat="server"  Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>				
						<obout:Column ID="Column13" DataField="layout_row" HeaderText="Row" Width="40" runat="server"  Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column14" DataField="layout_col" HeaderText="Col" Width="40" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column15" DataField="width_label" HeaderText="Label Width" Width="80" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column1" DataField="width_box" HeaderText="Box Width" Width="80" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column17" DataField="isReadOnly" HeaderText="Read Only" Width="70" runat="server"   Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column2" DataField="DoubleEntryRequired" HeaderText="DblEntry" Width="70" runat="server"   Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column18" DataField="showValueLabels" HeaderText="ValLabels" Width="70" runat="server"   Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column19" DataField="aspxfieldlabeltext" HeaderText="DE Form Label" Width="300" runat="server" ItemStyle-Wrap="true" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column20" DataField="fieldlabel" HeaderText="Dictionary Label" Width="700" runat="server" Wrap="true" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
					</Columns>
					<Templates>
						<obout:GridTemplate runat="server" ID="PlainEditTemplate">
							<Template>
								<input type="text" class="excel-textbox" value="<%# Container.Value %>"
									onfocus="markAsFocused(this)" onblur="markAsBlured(this, '<%# Grid1.Columns[Container.ColumnIndex].DataField %>', <%# Container.PageRecordIndex %>)" />
							</Template>
						</obout:GridTemplate>
					</Templates>
				</obout:Grid>

			</td>
			<td style="vertical-align:top">
				<asp:Panel ID="panel1" runat="server"></asp:Panel>
			</td>
		</tr>
	</table>

	<br />
	
	<br /><br />

<%--	<obout:Grid ID="Grid2" runat="server" CallbackMode="false" Serialize="false" AutoGenerateColumns="false"
		AllowRecordSelection="false" ShowFooter="true" AllowSorting="false" PageSize="-1" 
		ShowLoadingMessage="false" AllowPageSizeSelection="false" AllowPaging="false" Visible="false">
		<TemplateSettings NewRecord_TemplateId="ButtonsTemplate" MultiRecordSaveCancel_TemplateId="ButtonsTemplate2" />
		<Columns>
			<obout:Column ID="Column1" DataField="pk" ReadOnly="true" HeaderText="pk" Width="75" runat="server" Visible="false">
				<TemplateSettings TemplateId="ReadOnlyTemplate" />
			</obout:Column>			
			<obout:Column ID="Column2" DataField="ord_pos" ReadOnly="true" HeaderText="Pos" Width="120" runat="server" Visible="true">
				<TemplateSettings TemplateId="ReadOnlyTemplate" />
			</obout:Column>			
			<obout:Column ID="Column3" DataField="databasefield" ReadOnly="true" HeaderText="Field" Width="120" runat="server" Visible="true">
				<TemplateSettings TemplateId="ReadOnlyTemplate" />
			</obout:Column>			
			<obout:Column ID="Column4" DataField="layout_section" HeaderText="Section" Width="60" runat="server"  Visible="true">
				<TemplateSettings TemplateId="TextBoxEditTemplate" />
			</obout:Column>				
			<obout:Column ID="Column5" DataField="layout_row" HeaderText="Row" Width="60" runat="server"  Visible="true">
				<TemplateSettings TemplateId="TextBoxEditTemplate" />
			</obout:Column>
			<obout:Column ID="Column6" DataField="layout_col" HeaderText="Col" Width="60" runat="server" Visible="true">
				<TemplateSettings TemplateId="TextBoxEditTemplate" />
			</obout:Column>
			<obout:Column ID="Column7" DataField="aspxfieldlabeltext" HeaderText="DE Form Label" Width="300" runat="server" Visible="true">
				<TemplateSettings TemplateId="MultiLineTextBoxEditTemplate" />
			</obout:Column>
			<obout:Column ID="Column8" DataField="fieldlabel" HeaderText="Label" Width="300" runat="server" Visible="true">
				<TemplateSettings TemplateId="MultiLineTextBoxEditTemplate" />
			</obout:Column>
		</Columns>
		<Templates>
			<obout:GridTemplate runat="server" ID="ReadOnlyTemplate">
				<Template>
					<input type="text" name="TextBox1" class="excel-textbox" value='<%# Container.Value %>' readonly="readonly" />
				</Template>
			</obout:GridTemplate>
			<obout:GridTemplate runat="server" ID="TextBoxEditTemplate">
				<Template>
					<input type="text" name="TextBox1" class="excel-textbox" value='<%# Container.Value %>' readonly="readonly"
						onfocus="Grid1.editWithTextBox(this)" />
				</Template>
			</obout:GridTemplate>
			<obout:GridTemplate runat="server" ID="MultiLineTextBoxEditTemplate">
				<Template>
					<input type="text" name="TextBox1" class="excel-textbox" value='<%# Container.Value %>' readonly="readonly"
						onfocus="Grid1.editWithMultiLineTextBox(this)" />
				</Template>
			</obout:GridTemplate>

			<obout:GridTemplate runat="server" ID="ButtonsTemplate">
				<Template>                    
					<obout:OboutButton ID="OboutButton2" runat="server" Text="Save Changes" OnClientClick="return Grid1.saveExcelChanges()" OnClick="SaveChanges" />
					<obout:OboutButton ID="OboutButton3" runat="server" Text="Cancel Changes" />                    
				</Template>
			</obout:GridTemplate>
			<obout:GridTemplate runat="server" ID="ButtonsTemplate2">
				<Template>
				</Template>
			</obout:GridTemplate>

		</Templates>
	</obout:Grid>--%>

<%--	<div style="display: none;" id="FieldEditorsContainer">
		<div id="TextBoxEditorContainer" style="width: 100%">
			<obout:OboutTextBox runat="server" ID="TextBoxEditor" FolderStyle="~/Interface/styles/premiere_blue/OboutTextBox" Width="100%" AutoCompleteType="None">
				<ClientSideEvents OnKeyDown="navigateThroughCells" />
			</obout:OboutTextBox>
		</div>

		<div id="MultiLineTextBoxEditorContainer" style="width: 100%">
			<obout:OboutTextBox runat="server" ID="MultiLineTextBoxEditor" TextMode="MultiLine"  
				Width="100%" Height="60px" AutoCompleteType="None">
				<ClientSideEvents OnKeyDown="navigateThroughCells" />
			</obout:OboutTextBox>
		</div>
	</div>--%>

<%--    See Example: http://obout.com/grid/commands/aspnet_commands_excel_style_full.aspx--%>

<script type="text/javascript" src="<%# Request.ApplicationPath %>/App_Obout/Grid/custom_scripts/excel-style/excel-style.js"></script>


</asp:Content>

