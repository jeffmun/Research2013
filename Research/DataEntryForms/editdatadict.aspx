<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="editdatadict.aspx.cs" Inherits="DataEntryForms_editdatadict" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework4" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	 <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" />

<link rel="stylesheet" type="text/css" href="../../css/dataentryforms.css" />

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
			padding-top: 3px;
			padding-bottom: 3px;
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
			padding-top: 3px;
			padding-bottom: 3px;
		}
	
		.excel-textbox-error
		{
			color: #FF0000;
		}
	
		/*.ob_gCc2 
		{
		   padding-left: 3px !important;
		}*/
	
		/*.ob_gCc2{
			white-space: -moz-pre-wrap !important;
			white-space: -pre-wrap; 
			white-space: -o-pre-wrap; 
			white-space: pre-wrap;
			word-wrap: break-word;
		}*/

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
			field.fldpk = Grid1.Rows[rowIndex].Cells['fldpk'].Value;
			field.fldtypepk = Grid1.Rows[rowIndex].Cells['fldtypepk'].Value;

			field.fieldlabel = Grid1.Rows[rowIndex].Cells['fieldlabel'].Value;
			field.missval = Grid1.Rows[rowIndex].Cells['missval'].Value;
			field.fieldvaluesetID = Grid1.Rows[rowIndex].Cells['fieldvaluesetID'].Value;
			field.minval = Grid1.Rows[rowIndex].Cells['minval'].Value;
			field.maxval = Grid1.Rows[rowIndex].Cells['maxval'].Value;
			field.regex = Grid1.Rows[rowIndex].Cells['regex'].Value;
			field.regexdesc = Grid1.Rows[rowIndex].Cells['regexdescription'].Value;
			field.validlist = Grid1.Rows[rowIndex].Cells['validlist'].Value;
			field.inanalysis = Grid1.Rows[rowIndex].Cells['InAnalysis'].Value;
			field.RelItem = Grid1.Rows[rowIndex].Cells['RelItem'].Value;
			field.RelAgreeThreshold = Grid1.Rows[rowIndex].Cells['RelAgreeThreshold'].Value;

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


	<asp:Label ID="Label13" runat="server" Text="Edit Data Dictionary Info" Font-Size="Medium" Font-Bold="true"  ></asp:Label>
			
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
								<%--<asp:Button ID="btnLoadLayout" runat="server" OnCommand="btnCommand" CommandName="LoadLayout"  ForeColor="Purple"  Text="Show Layout" />--%>
							</td>

						</tr>
						<tr>
							<td></td>
							<td style="vertical-align:top">
	<%--							<asp:Button ID="btnLoadSections" runat="server" OnCommand="btnCommand" CommandName="LoadSections" Text="Load Sections" />--%>
								<asp:Label ID="Label14" runat="server" Text="Sort by:" Font-Size="XX-Small"  ForeColor="DarkGreen" Visible="true"></asp:Label>
								<asp:RadioButtonList ID="rblSort" runat="server"  ForeColor="DarkGreen" Visible="true"  Font-Size="XX-Small" >
									<asp:ListItem Text="Position" Value="Position" Selected="True" ></asp:ListItem>
									<asp:ListItem Text="Field Name" Value="FieldName"  ></asp:ListItem>
									<asp:ListItem Text="Field Name, Reversed" Value="FieldNameREV"  ></asp:ListItem>
									<asp:ListItem Text="Label" Value="Label"  ></asp:ListItem>
									<asp:ListItem Text="Label, Reversed" Value="LabelREV"  ></asp:ListItem>
									<asp:ListItem Text="InAnalysis DESC, Position" Value="InAnalysis DESC, Position"  ></asp:ListItem>
									<asp:ListItem Text="InAnalysis DESC, FieldName" Value="InAnalysis DESC, FieldName"  ></asp:ListItem>
								</asp:RadioButtonList>
							</td>
							<td style="vertical-align:top" style="{ width: 150px; }">				
<%--								<asp:Label ID="Label1" runat="server" Text="Render as:" Font-Size="XX-Small"  ForeColor="Purple" Visible="false"></asp:Label>
								<asp:RadioButtonList ID="rbl1" runat="server"  ForeColor="Purple" Visible="false">
									<asp:ListItem Text="DE Form" Value="DE Form" ></asp:ListItem>
									<asp:ListItem Text="Text" Value="Text" Selected="True" ></asp:ListItem>
								</asp:RadioButtonList>--%>

								<asp:Label ID="Label1" runat="server" Text="Filter by:" Font-Size="XX-Small"  ForeColor="DarkGreen" Visible="true"></asp:Label>
								<asp:RadioButtonList ID="rblFilterBy" runat="server"  ForeColor="DarkGreen" Visible="true"  Font-Size="XX-Small" >
									<asp:ListItem Text="*No Filter*" Value="None" Selected="True" ></asp:ListItem>
									<asp:ListItem Text="InAnalysis>0" Value="InAnalysis>0"  ></asp:ListItem>
									<asp:ListItem Text="With a Label" Value="WithLabel"  ></asp:ListItem>
									<asp:ListItem Text="With No Label" Value="NoLabel"  ></asp:ListItem>
									<asp:ListItem Text="With a color" Value="WithColor"  ></asp:ListItem>
									<asp:ListItem Text="With no color" Value="NoColor"  ></asp:ListItem>
									<asp:ListItem Text="Reliability items" Value="RelItems"  ></asp:ListItem>

								</asp:RadioButtonList>


							</td>
							<td style="vertical-align:top">

								<asp:Label ID="lblFldtype" runat="server" Text="Key for the FldType colors" Font-Size="X-Small"  ForeColor="Indigo" Visible="False"></asp:Label>
							<asp:GridView ID="gvFldtype" runat="server" AutoGenerateColumns="true" OnRowDataBound="gvFldtype_RowDataBound"></asp:GridView>

<%--								<asp:Label ID="Label2" runat="server" Text="Display the:" Font-Size="XX-Small"  ForeColor="Indigo"></asp:Label>
								<asp:RadioButtonList ID="rbl2" runat="server" ForeColor="Indigo"   >
									<asp:ListItem Text="Layout" Value="Layout" Selected="True" ></asp:ListItem>
									<asp:ListItem Text="Code" Value="Code" ></asp:ListItem>
								</asp:RadioButtonList>--%>

							</td>
							<td style="{ width: 150px; }"></td>
							<td style="vertical-align:top" >
									<asp:Label ID="lblInAnalysis" runat="server" Text="Key for the InAnalysis colors" Font-Size="X-Small"  ForeColor="Indigo" Visible="False"></asp:Label>
							<asp:GridView ID="gvInAnalysis" runat="server" AutoGenerateColumns="true" OnRowDataBound="gvInAnalysis_RowDataBound"></asp:GridView>

							</td>
						</tr>
					</table>

			</td>
			<td width="100px"></td>
			<td style="vertical-align:top">
				



			</td>
			
			<td width="100px"></td>
			
			<td style="vertical-align:top">
				<table>
					<tr>
						<td style="vertical-align:top">
<%--							<asp:Label ID="Label9" runat="server" Text="Label Width:" Font-Size="XX-Small" Width="80px"></asp:Label>
							<asp:TextBox ID="txtWidth_label" runat="server" Text="" Width="60px"></asp:TextBox>
							<asp:Button ID="Button5" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="UpdateWidth" Text="Update Widths" />--%>
							</td>
					</tr>
					<tr>
						<td style="vertical-align:top">
							<%--<asp:Label ID="Label10" runat="server" Text="TextBox Width:" Font-Size="XX-Small" Width="80px"></asp:Label>
							<asp:TextBox ID="txtWidth_box" runat="server" Text="" Width="60px"></asp:TextBox>--%>

							<br /><br />
<%--							<asp:Button ID="Button6" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="TextBoxWidth" Text="Update TextBox Width" />--%>
							</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>




	<br />
	<br />
				
					



	<table>
		<tr>
			<td style="vertical-align:top">
				
				<obout:Grid ID="Grid1" runat="server" CallbackMode="false" Serialize="false" AutoGenerateColumns="false" 
					AllowRecordSelection="false" ShowFooter="true" AllowSorting="false" PageSize="-1" AllowAddingRecords="false"
					ShowLoadingMessage="false" AllowPageSizeSelection="false" AllowPaging="false" Visible="false" AllowKeyNavigation="true"
					OnRowDataBound="Grid1_RowDataBound">
					<Columns>
						<obout:Column ID="Column9" DataField="fldpk" ReadOnly="true" HeaderText="fldpk" Width="50" runat="server" Visible="false"></obout:Column>			
						<obout:Column ID="Column10" DataField="ord_pos" ReadOnly="true" HeaderText="Pos" Width="60" runat="server" Visible="true"></obout:Column>			
						<obout:Column ID="Column11" DataField="fldname" ReadOnly="true" HeaderText="Field" Width="120" runat="server" Visible="true"></obout:Column>			
						<obout:Column ID="Column17" DataField="fldtypepk" Width="50" runat="server"   Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" HeaderTemplateId="head_fldtypepk" />
						</obout:Column>
						<obout:Column ID="fieldtype_backcolor" DataField="fldtype_backcolor" ReadOnly="true" HeaderText="fldtype_backcolor" Width="50" runat="server" Visible="false"></obout:Column>			
						<obout:Column ID="Column8" DataField="InAnalysis" HeaderText="In Analysis" ReadOnly="true" Width="50" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" HeaderTemplateId="head_inanalysis" />
						</obout:Column>
						<obout:Column ID="Column20" DataField="fieldlabel" HeaderText="Dictionary Label" Width="400"  runat="server" Wrap="true" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column21" DataField="missval" HeaderText="MissVal" Width="80" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column1" DataField="minval" HeaderText="MinVal" Width="80" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column4" DataField="maxval" HeaderText="MaxVal" Width="80" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column5" DataField="validlist" HeaderText="Valid List" Width="90" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>

						<obout:Column ID="Column6" DataField="regex" HeaderText="RegEx" Width="100" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column7" DataField="regexdescription" HeaderText="RegEx Desc" Width="140" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>

						<obout:Column ID="Column2" DataField="fieldvaluesetID" HeaderText="ValueLabelsID" Width="80" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column3" DataField="ValueLabels" HeaderText="ValueLabels" ReadOnly="true" Width="120" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column12" DataField="RelItem" HeaderText="RelItem" ReadOnly="true" Width="60" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
						<obout:Column ID="Column13" DataField="RelAgreeThreshold" HeaderText="RelAgreeThreshold" ReadOnly="true" Width="80" runat="server" Visible="true">
							<TemplateSettings TemplateId="PlainEditTemplate" />
						</obout:Column>
					</Columns>
					<Templates>
						<obout:GridTemplate runat="server" ID="head_fldtypepk">
							<Template>
								Fld<br />Type
							</Template>
						</obout:GridTemplate>        
						<obout:GridTemplate runat="server" ID="head_inanalysis">
							<Template>
								In<br />Analysis
							</Template>
						</obout:GridTemplate>        
	

						<obout:GridTemplate runat="server" ID="PlainEditTemplate">
							<Template>
								<input type="text"  class="excel-textbox" value="<%# Container.Value %>"
									onfocus="markAsFocused(this)" onblur="markAsBlured(this, '<%# Grid1.Columns[Container.ColumnIndex].DataField %>', <%# Container.PageRecordIndex %>)" />
							</Template>
						</obout:GridTemplate>

<%--						<obout:GridTemplate runat="server" ID="TextBoxEditTemplate">
							<Template>
								<input type="text" name="TextBox1" class="excel-textbox" value='<%# Container.Value %>' readonly="readonly"
									onfocus="Grid1.editWithTextBox(this)" />
							</Template>
						</obout:GridTemplate>--%>

					</Templates>
				</obout:Grid>

			</td>
			<td style="vertical-align:top">
				<asp:Panel ID="insertPanel" runat="server" Visible="false"></asp:Panel>

				<asp:Panel ID="panel1" runat="server" Visible="false">
					<def:DataEntryController ID="DataEntryController1" runat="server" DatabaseTable="x" PrimaryKeyField="x" />
				</asp:Panel>
			</td>
		</tr>
	</table>

	<br />                 
	
	<br /><br />


	</div>


<%--<script type="text/javascript" src="../../App_Obout/Grid/custom_scripts/excel-style/excel-style.js"></script>--%>


<%--    See Example: http://obout.com/grid/commands/aspnet_commands_excel_style_full.aspx--%>

<%--    FOR LOCAL DEVELOPMENT --%>


</asp:Content>

