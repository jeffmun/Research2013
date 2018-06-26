<%@ Page Title="Data Dictionary & Layout" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="editlayout.aspx.cs" Inherits="DataEntryForms_editlayout" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework4" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	 <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true"  />

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


<style type="text/css">
	.btnwrap { white-space: normal; width: 100px; }
	.btnwrap2 { white-space: normal; width: 100px; background-color: whitesmoke; border:solid; border-width:thin; border-color:grey; text-align: center; text-decoration: none;}
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
			field.layout_section = Grid1.Rows[rowIndex].Cells['layout_section'].Value;
			field.layout_row = Grid1.Rows[rowIndex].Cells['layout_row'].Value;
			field.layout_col = Grid1.Rows[rowIndex].Cells['layout_col'].Value;
			field.width_label = Grid1.Rows[rowIndex].Cells['width_label'].Value;
			field.width_box = Grid1.Rows[rowIndex].Cells['width_box'].Value;
			field.fldtypepk = Grid1.Rows[rowIndex].Cells['fldtypepk'].Value;
			field.showValueLabels = Grid1.Rows[rowIndex].Cells['showValueLabels'].Value;
			field.fieldlabel = Grid1.Rows[rowIndex].Cells['fieldlabel'].Value;
			field.aspxfieldlabeltext = Grid1.Rows[rowIndex].Cells['aspxfieldlabeltext'].Value;
			field.missval = Grid1.Rows[rowIndex].Cells['missval'].Value;
			field.fieldvaluesetID = Grid1.Rows[rowIndex].Cells['fieldvaluesetID'].Value;
			field.inAnalysis = Grid1.Rows[rowIndex].Cells['inAnalysis'].Value;
			field.fieldcodeID = Grid1.Rows[rowIndex].Cells['fieldcodeID'].Value;
			field.relitem = Grid1.Rows[rowIndex].Cells['relitem'].Value;
			field.relagreethreshold = Grid1.Rows[rowIndex].Cells['relagreethreshold'].Value;
			field.validlist = Grid1.Rows[rowIndex].Cells['validlist'].Value;
			field.minval = Grid1.Rows[rowIndex].Cells['minval'].Value;
			field.maxval = Grid1.Rows[rowIndex].Cells['maxval'].Value;

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


	<asp:Label ID="Label13" runat="server" Text="Edit Data Dictionary & Layout for Data Entry Form" Font-Size="Medium" Font-Bold="true"  ></asp:Label>
			
	<br />
	<table>
		<tr>
			<td style="vertical-align:top">
					<table>
						<tr>
							<td style="vertical-align:top" style="width: 250px">
								<asp:DropDownList ID="ddlMeas" runat="server" DataTextField="measname" DataValueField="measureID" EnableViewState="true" 
									OnSelectedIndexChanged="ddlMeas_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
								<br />
								<br />
<%--                                OnSelectedIndexChanged="rblMode_SelectedIndexChanged" AutoPostBack="true"--%>
								<asp:RadioButtonList ID="rblMode" runat="server" Font-Size="10pt"  >
									<asp:ListItem Value="Edit Data Dictionary"></asp:ListItem>
									<asp:ListItem Value="Edit Layout" Selected="true"></asp:ListItem>
									<asp:ListItem Value="Edit Reliability Items"></asp:ListItem>
								</asp:RadioButtonList>
							</td>
							<td style="vertical-align:top" >
								<asp:Button ID="btnLoadLayout" runat="server" OnCommand="btnCommand" CommandName="LoadLayout"   Text="Display Fields" />
								<asp:Button ID="btnLoadFields" runat="server" OnCommand="btnCommand" CommandName="LoadFields" ForeColor="DarkGreen" Text="Load Fields" Visible="false" />
								<br />
								<asp:Label ID="Label14" runat="server" Text="Sort by:" Font-Size="XX-Small"  ForeColor="DarkGreen" Visible="true" Width="120"></asp:Label>
								<asp:RadioButtonList ID="rblSort" runat="server"  ForeColor="DarkGreen" Visible="true"  Font-Size="XX-Small" >
									<asp:ListItem Text="Section, Row, Col" Value="SectionRowCol" Selected="True" ></asp:ListItem>
									<asp:ListItem Text="Section, Col, Row" Value="SectionColRow"   ></asp:ListItem>
									<asp:ListItem Text="Position" Value="Position"  ></asp:ListItem>
									<asp:ListItem Text="Field Name" Value="FieldName"  ></asp:ListItem>
									<asp:ListItem Text="Field Name (reversed)" Value="FieldNameREV"  ></asp:ListItem>
								</asp:RadioButtonList>

							</td>
							<td style="vertical-align:top" colspan="2">
								<asp:Panel ID="panelLayoutControls" runat="server" Visible="false">
									<table>
										<tr>
											<td style="vertical-align:top">
												<br />
												<asp:Label ID="Label2" runat="server" Text="Display the:" Font-Size="XX-Small"  ForeColor="Indigo" Width="140" Visible="false"></asp:Label>
												<asp:RadioButtonList ID="rbl2" runat="server" ForeColor="Indigo"   >
													<asp:ListItem Text="Layout" Value="Layout" Selected="True" ></asp:ListItem>
													<asp:ListItem Text="Code" Value="Code" ></asp:ListItem>
												</asp:RadioButtonList>

											</td>
											<td style="vertical-align:top">
												<asp:Label ID="lblSection" runat="server" Text="Section #:" Font-Size="XX-Small" Width="60px"></asp:Label>
												<asp:TextBox ID="txtSection" runat="server" Text="" Width="60px"></asp:TextBox>
												<br />
												<asp:Label ID="Label5" runat="server" Text="Row #:" Font-Size="XX-Small" Width="60px"></asp:Label>
												<asp:TextBox ID="txtRow" runat="server" Text="" Width="60px"></asp:TextBox>
												<br />
												<asp:Label ID="Label7" runat="server" Text="Col #:" Font-Size="XX-Small" Width="60px"></asp:Label>
												<asp:TextBox ID="txtCol" runat="server" Text="" Width="60px"></asp:TextBox>

											</td>
											<td style="vertical-align:top">
												<asp:Button ID="btnEdit" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="InsertSection" Text="Insert section" Font-Size="X-Small" />
												<asp:Label ID="Label3" runat="server" Text=" " Font-Size="XX-Small"></asp:Label>
												<asp:Button ID="btnDelete" runat="server" ForeColor="DarkRed" OnCommand="btnCommand" CommandName="DeleteSection" Text="Delete section" Font-Size="X-Small" />
												<br />
												<br />&nbsp;&nbsp;&nbsp;&nbsp;
												<asp:Label ID="Label11" runat="server" Text="Enter 0 to apply width to a <br/>&nbsp;&nbsp;&nbsp;&nbsp;whole Section, Row, or Col" Font-Size="XX-Small"></asp:Label>
											</td>
											<td style="vertical-align:top" style="width: 30px">
											<td style="vertical-align:top" style="width: 260px">


											</td>
										</tr>
									</table>

								</asp:Panel>
							</td>

						</tr>

					</table>

			</td>
			<td width="10px"></td>
			<td style="vertical-align:top">
				

			</td>
			
			
			<td style="vertical-align:top" >
					<asp:Button ID="btnNewFld" runat="server" Text="Add new field" OnClick="btnNewFld_Click" />
				<asp:Panel ID="panelNewFld" runat="server" Visible="false">
					<b><u>Add New Field</u></b><br />
					<asp:Label ID="l1" runat="server" Text="Postion:" Width ="70px"></asp:Label><asp:TextBox ID="newOrdpos" runat="server" Width="60px"></asp:TextBox><br />
					<asp:Label ID="Label1" runat="server" Text="Fld name:" Width ="70px"></asp:Label><asp:TextBox ID="newFldname" runat="server" Width="100px"></asp:TextBox><br />
					<asp:Label ID="Label16" runat="server" Text="Data Type:" Width ="70px" ></asp:Label>
						<asp:DropDownList ID="newFieldDatatype" runat="server" OnSelectedIndexChanged="newFieldDatatype_SelectedIndexChanged" AutoPostBack="true">
							<asp:ListItem Value="int" Text="integer"></asp:ListItem>
							<asp:ListItem Value="float" Text="decimal"></asp:ListItem>
							<asp:ListItem Value="date" Text="date"></asp:ListItem>
							<asp:ListItem Value="smalldatetime" Text="date and time"></asp:ListItem>
							<asp:ListItem Value="varchar" Text="text"></asp:ListItem>
						</asp:DropDownList>
					<br />
					<asp:Label ID="Label17" runat="server" Text="Text Length:" Width ="50px"></asp:Label><asp:TextBox ID="newFieldDatatypelength" runat="server" Width="40px" Enabled="false"></asp:TextBox><br />
					<br /><br />
					 <asp:Button ID="btnNewFld_submit" runat="server" Text="Submit" OnClick="btnNewFld_submit_Click"  />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 <asp:Button ID="btnNewFld_cancel" runat="server" Text="Cancel" OnClick="btnNewFld_cancel_Click" />

				</asp:Panel>    
				
				<br />
				<br />
				 <asp:GridView ID="gvFldtype" runat="server" AutoGenerateColumns="true" OnRowDataBound="gvFldtype_RowDataBound"></asp:GridView>


			</td>
			<td style="vertical-align:top">
				<asp:Label ID="lblFieldCodes" runat="server" Text="Fields with Special Codes" Font-Size="XX-Small" Font-Bold="true" />
				<asp:Label ID="lblFieldCodes2" runat="server" Text=" (hover here for full list)" Font-Size="XX-Small" Font-Bold="false" 
					ToolTip="1=ID_number&#013;2=Admin_Date&#013;3=Admin_byWhom&#013;5=Notes/Comments&#013;6=ValidityRating&#013;8=subjDOB&#013;9=Age&#013;10=PrimaryKey&#013;11=parentDOB&#013;13=Validity Comments&#013;16=ScoreMsg&#013;17=Respondent&#013;18=REL_coder&#013;19=REL_date&#013;20=Coder&#013;" ></asp:Label>
				<asp:Panel ID="panelFieldCodes" runat="server" ></asp:Panel>
			</td>
		<td style="vertical-align:top">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%--			<asp:Button ID="btnEnterData" runat="server" Text="Test Data Entry Form" Font-Size="XX-Small"  OnClick="btnEnterData_Click" CssClass="btnwrap" Width="80px"/>--%>

			<asp:Hyperlink ID="lnkEnterData" runat="server" Text="Test Data Entry Form" Font-Size="XX-Small" Target="_blank" Visible="false" CssClass="btnwrap2" Width="60px"></asp:Hyperlink>
		</td>
		</tr>
	</table>


	<br />



	<asp:Panel ID="panelCopyColHeader" runat="server" Visible="false">
		<asp:Label ID="lCCH1" runat="server" Text="Copy Column Headers To This Section:" Font-Size="XX-Small"></asp:Label>
		<asp:TextBox ID="txtSectionNum2" runat="server" Width="40" ></asp:TextBox>
		<asp:Button ID="btnCopyColHeader" runat="server" Text ="Copy" OnClick="btnCopyColHeader_Click" />
	</asp:Panel>

	

<asp:Label ID="lbl_tblpk" runat="server" Font-Size="X-Small" ForeColor="Gray"></asp:Label>	&nbsp;&nbsp;&nbsp;
<asp:Label ID="lbl_measureID" runat="server" Font-Size="X-Small"  ForeColor="Gray"></asp:Label>	
	
	<br />

					
<obout:Grid ID="Grid1" runat="server" CallbackMode="false" Serialize="false" AutoGenerateColumns="false" Width="95%" 
	AllowRecordSelection="false" ShowFooter="true" AllowSorting="false" PageSize="-1" AllowAddingRecords="false" AllowGrouping="true"
	ShowLoadingMessage="false" AllowPageSizeSelection="false" AllowPaging="false" Visible="false" AllowKeyNavigation="true" AllowFiltering="true" 
	FolderStyle="~/App_Obout/Grid/styles/gray_glass" 
	OnRowDataBound="Grid1_RowDataBound"  >
	<ScrollingSettings ScrollHeight="650px" />
	<AddEditDeleteSettings AddLinksPosition="TopAndBottom" NewRecordPosition="Dynamic" />
	
	<Columns>
		<obout:Column ID="Column1_00" DataField="fldpk" ReadOnly="true" HeaderText="fldpk" Width="50" runat="server" Visible="false"></obout:Column>			
		<obout:Column ID="Column1_01" DataField="ord_pos" ReadOnly="true" HeaderText="Pos" Width="60" runat="server" Visible="true"></obout:Column>			
		<obout:Column ID="Column1_02" DataField="fldname" ReadOnly="true" HeaderText="Field" Width="120" runat="server" Visible="true"></obout:Column>			
		<obout:Column ID="Column1_03" DataField="fldtypepk" HeaderText="FldType" Width="70" runat="server"   Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate"  />
		</obout:Column>
		<obout:Column ID="Column1_04alwayshide" DataField="fldtype_backcolor" ReadOnly="true" HeaderText="fldtype_backcolor" Width="50" runat="server" Visible="false"></obout:Column>			
		<obout:Column ID="Column1_05" DataField="layout_section" HeaderText="Section" Width="60" runat="server"  Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>				
		<obout:Column ID="Column1_06" DataField="layout_row" HeaderText="Row" Width="40" runat="server"  Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_07" DataField="layout_col" HeaderText="Col" Width="40" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_08" DataField="width_label" HeaderText="Label Width" Width="80" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_09" DataField="width_box" HeaderText="Box Width" Width="80" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_10" DataField="relitem" HeaderText="RelItem" ReadOnly="true" Width="60" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_11" DataField="relscore" HeaderText="RelScore" ReadOnly="true" Width="60" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_12" DataField="relagreethreshold" HeaderText="RelAgreeThreshold" ReadOnly="true" Width="60" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_13" DataField="showValueLabels" HeaderText="ShowValLbls" Width="70" runat="server"   Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_14" DataField="aspxfieldlabeltext" HeaderText="DE Form Label" Width="300" runat="server" ItemStyle-Wrap="true" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_15" DataField="fieldlabel" HeaderText="Dictionary Label" Width="500" runat="server" Wrap="true"  Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1" DataField="validlist" HeaderText="Valid List" Width="100" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column2" DataField="minval" HeaderText="Min" Width="60" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column3" DataField="maxval" HeaderText="Max" Width="60" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_16" DataField="missval" HeaderText="MissVal" Width="80" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_17" DataField="fieldvaluesetID" HeaderText="ValueLabelsID" Width="80" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_18" DataField="ValueLabels" HeaderText="ValueLabels" ReadOnly="true" Width="120" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate"  />
		</obout:Column>
		<obout:Column ID="Column1_19" DataField="inAnalysis" HeaderText="InAnalysis" ReadOnly="true" Width="60" runat="server" Visible="true">
			<TemplateSettings TemplateId="PlainEditTemplate" />
		</obout:Column>
		<obout:Column ID="Column1_20" DataField="fieldcodeID" HeaderText="fldcodeID" ReadOnly="true" Width="60" runat="server" Visible="true">
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
		<obout:GridTemplate runat="server" ID="InsertFld">
			<Template>
				<table>
					<tr>
						<td>
							Field name:<asp:TextBox ID="txtFldname" runat="server"></asp:TextBox>
							<br />
							DataType:<asp:DropDownList ID="ddlDataType" runat="server">
										<asp:ListItem Text="Integer" Value="int"></asp:ListItem>
										<asp:ListItem Text="Decimal" Value="float"></asp:ListItem>
										<asp:ListItem Text="Text" Value="varchar"></asp:ListItem>
										<asp:ListItem Text="Date" Value="date"></asp:ListItem>
										</asp:DropDownList>
							Length of text:<asp:TextBox ID="txtLength" runat="server"></asp:TextBox>

						</td>
					</tr>
				</table>
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



	<asp:Panel ID="panelDEInsert" runat="server" Visible="false" ></asp:Panel>

	<asp:Panel ID="panelscroll" runat="server" Visible="true" ScrollBars="Vertical" Height="1200px">

	<asp:UpdatePanel ID="panelDEMainBody" runat="server" Visible="false" UpdateMode="Conditional" >
		<ContentTemplate>

			<def:DataEntryController ID="DataEntryController1" runat="server" DatabaseTable="x" PrimaryKeyField="x" FormState="EDITING_LAYOUT" />
		</ContentTemplate>

	</asp:UpdatePanel>
		</asp:Panel>
	<br /><br />




<%--<script type="text/javascript" src="../../App_Obout/Grid/custom_scripts/excel-style/excel-style.js"></script>--%>


<%--    See Example: http://obout.com/grid/commands/aspnet_commands_excel_style_full.aspx--%>

<%--    FOR LOCAL DEVELOPMENT --%>


<%--    from cs_ModalPopup--%>




<%--    SECTION TEXT --%>
	<obout:PopupHolder runat="server" id="popupHolder1" DefaultAddPolicy="Demand" PopupsZIndex="200000" />
	<asp:LinkButton ID="LinkButton1" runat="server" Text=""  />

	<asp:Panel ID="popupPanel" runat="server" Style="display: none" CssClass="modalPopup">

	   <asp:UpdatePanel ID="updatePanel1" runat="server">
	   <ContentTemplate>
		   <asp:Label ID="lblControlname" runat="server" ></asp:Label><br />
		   <table>
			   <tr>
				   <td style="width: 150px;">
						<asp:Button ID="btnInsertSectionBefore" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="InsertLayoutDimension" CommandArgument="before" CssClass="btnwrap"
							 Text="Insert a section before this one" Width="100" Font-Size="X-Small" />

						<asp:Button ID="btnInsertColBefore" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="InsertLayoutDimension" CommandArgument="before" CssClass="btnwrap"
							 Text="Insert a column before this one" Width="100" Font-Size="X-Small" />

						<asp:Button ID="btnInsertRowBefore" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="InsertLayoutDimension" CommandArgument="before" CssClass="btnwrap"
							 Text="Insert a row before this one" Width="100" Font-Size="X-Small" />

				   </td>
				   <td>
						<asp:Label ID="Label9" runat="server" Text="Label Width:" Font-Size="XX-Small" Width="75px"></asp:Label>
						<asp:TextBox ID="poptxtWidth_label_WHOLE" runat="server" Text="" Width="50px"></asp:TextBox>
						<br />
						<asp:Label ID="Label10" runat="server" Text="TextBox Width:" Font-Size="XX-Small" Width="75px"></asp:Label>
						<asp:TextBox ID="poptxtWidth_box_WHOLE" runat="server" Text="" Width="50px"></asp:TextBox>
						<br />
						<asp:Button ID="Button5" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="UpdateWidth"
								Text="Update Widths"  Font-Size="X-Small"/>
				   </td>
								   <td style="width: 150px;">
						<asp:Button ID="btnInsertSectionAfter" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="InsertLayoutDimension" CommandArgument="after" CssClass="btnwrap"
							 Text="Insert a section after this one" Width="100" Font-Size="X-Small" />

						<asp:Button ID="btnInsertColAfter" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="InsertLayoutDimension" CommandArgument="after" CssClass="btnwrap"
							 Text="Insert a column after this one" Width="100" Font-Size="X-Small" />

						<asp:Button ID="btnInsertRowAfter" runat="server" ForeColor="DarkGreen" OnCommand="btnCommand" CommandName="InsertLayoutDimension" CommandArgument="after" CssClass="btnwrap"
							 Text="Insert a row after this one" Width="100" Font-Size="X-Small" />

				   </td>
				   <td style="width: 50px;"></td>
				   <td>
						<asp:Button ID="btnDeleteSection" runat="server" Text="Delete this section" ForeColor="DarkRed" Font-Size="XX-Small" OnCommand="btnCommand" CommandName="DeleteLayoutDimension" />  <%--onmousedown="return windowPreClose();"--%>
						<asp:Button ID="btnDeleteCol" runat="server" Text="Delete this column" ForeColor="DarkRed" Font-Size="XX-Small" OnCommand="btnCommand" CommandName="DeleteLayoutDimension" />  <%--onmousedown="return windowPreClose();"--%>
						<asp:Button ID="btnDeleteRow" runat="server" Text="Delete this row" ForeColor="DarkRed" Font-Size="XX-Small" OnCommand="btnCommand" CommandName="DeleteLayoutDimension" />  <%--onmousedown="return windowPreClose();"--%>
				   </td>
			   </tr>
		   </table>
		   <br />
		   <br />
		  <obout:Editor runat="server" ID="Editor" Height="400px" Width="100%" PopupHolderID="popupHolder1">
			<TopToolBar Appearance="Full" />
			<EditPanel  AutoFocus="true" ActiveMode="design" />
			<BottomToolBar ShowDesignButton="true" ShowHtmlTextButton="true" ShowPreviewButton="true" />
		  </obout:Editor>
		  <br />
		  <asp:Button runat="server" Text="Update Section Text" ID="submit" OnClick="submit_Click" OnClientClick="SubmitModalHtml" />
	   </ContentTemplate>
	   </asp:UpdatePanel>
		<br /><br />
	   <asp:Button ID="CancelButton" runat="server" Text="Cancel" ForeColor="DarkRed" onmousedown="return windowPreClose();" />  <%--onmousedown="return windowPreClose();"--%>
				
	</asp:Panel>

	

	<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server"  
		TargetControlID="LinkButton1"
		PopupControlID="popupPanel" 
		BackgroundCssClass="modalBackground" 
		CancelControlID="CancelButton" 
		DropShadow="true"
		PopupDragHandleControlID="Panel3"
		BehaviorID="behavID" />


	
<%--    SPECIFIC FIELD--%>
	<obout:PopupHolder runat="server" id="popupHolder2" DefaultAddPolicy="Demand" PopupsZIndex="200000" />
	<asp:LinkButton ID="LinkButton2" runat="server" Text=""  />
	<asp:Panel ID="popupPanel2" runat="server" Style="display: none" CssClass="modalPopup">

	   <asp:UpdatePanel ID="updatePanel2" runat="server">
	   <ContentTemplate>

		   <table>
			   <tr>
				   <td colspan="2">
					   <asp:Label ID="Label18" runat="server" Width="50px" Text="fldpk: "></asp:Label><asp:Label ID="popfldpk" runat="server"  Width="50px"></asp:Label>
					   <br />
					   <asp:Label ID="Label19" runat="server" Width="50px" Text="FldName: "></asp:Label><asp:Label ID="popfldname" runat="server"  Width="150px" Font-Bold="true"></asp:Label><br /><br />

				   </td>
				   <td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   <asp:Button runat="server" Text="Update Field Info"  ID="Button6" OnClick="submit_Click2" ForeColor="ForestGreen" Font-Bold="true" OnClientClick="SubmitModalHtml2" />

				   </td>
			   </tr>
			   <tr>
				   <td>
					   <asp:Label ID="lbl_poptxt1" runat="server" Width="80px" Text="Section:"></asp:Label><asp:TextBox ID="poptxt1" runat="server"  Width="50px"></asp:TextBox><br />
					   <asp:Label ID="lbl_poptxt2" runat="server" Width="80px" Text="Row:"></asp:Label><asp:TextBox ID="poptxt2" runat="server" Width="50px"></asp:TextBox><br />
					   <asp:Label ID="lbl_poptxt3" runat="server" Width="80px" Text="Column:"></asp:Label><asp:TextBox ID="poptxt3" runat="server" Width="50px" ></asp:TextBox><br />

					   <asp:HiddenField ID="hid_pop_fldpk" runat="server" />
					   <asp:HiddenField ID="hid_pop_fldname" runat="server" />

				   </td>
				   <td>
						<asp:Label ID="Label4" runat="server" Text="Label Width:" Font-Size="XX-Small" Width="75px"></asp:Label>
						<asp:TextBox ID="poptxtWidth_label" runat="server" Text="" Width="50px"></asp:TextBox>
						<br />
						<asp:Label ID="Label12" runat="server" Text="TextBox Width:" Font-Size="XX-Small" Width="75px"></asp:Label>
						<asp:TextBox ID="poptxtWidth_box" runat="server" Text="" Width="50px"></asp:TextBox>
						<br />
				   </td>
				   <td>
					   <asp:Label ID="lbl_poptxt6" runat="server" Width="80px" Text="Field Type:"></asp:Label><asp:TextBox ID="poptxt6" runat="server"  Width="50px"></asp:TextBox><br />
					   <asp:Label ID="lbl_poptxt7" runat="server" Width="80px" Text="Missing value:"></asp:Label><asp:TextBox ID="poptxt7" runat="server" Width="50px"></asp:TextBox><br />
					   
				   </td>
			   </tr>
			   <tr>
				   <td colspan="3">
					   <br />
					   <asp:Label ID="lbl_poptxt4" runat="server" Width="350px" Text="Dictionary Label"></asp:Label><br />
							<asp:TextBox ID="poptxt4" runat="server"  Width="450px" Height="60px" TextMode="MultiLine"  ></asp:TextBox><br />
					   <asp:Label ID="lbl_poptxt5" runat="server" Width="350px" Text="DE Form Label (enter a space to make this blank)"></asp:Label><br />
							<asp:TextBox ID="poptxt5" runat="server" Width="450px" Height="60px" TextMode="MultiLine"  ></asp:TextBox><br />

				   </td>
			   </tr>
		   </table>
	
	
		  <br />
	   </ContentTemplate>
	   </asp:UpdatePanel>
		<br />
	   <asp:Button ID="CancelButton2" runat="server" Text="Cancel" ForeColor="DarkRed" Font-Bold="true"  />  <%--onmousedown="return windowPreClose();"--%>
				
	</asp:Panel>




		<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server"  
		TargetControlID="LinkButton2"
		PopupControlID="popupPanel2" 
		BackgroundCssClass="modalBackground" 
		CancelControlID="CancelButton2" 
		DropShadow="true"
		BehaviorID="behavID2" />


	<asp:HiddenField runat="server" ID="hid_modal_ctl_name" />	
	<asp:HiddenField runat="server" ID="hid_layout_section" />	
	<asp:HiddenField runat="server" ID="hid_layout_dim" />   
	<asp:HiddenField runat="server" ID="hid_dim_index" />   


	<style type="text/css">
		a {
				font-size:10pt;font-family:Tahoma
		}
		a:hover {
				color:crimson;
		}
		.tdText {
				font:11px Verdana;
				color:#333333;
		}
		.modalPopup {
				background-color:#ffffdd;
				border-width:3px;
				border-style:solid;
				border-color:Gray;
				padding:3px;
				width:600px;
		}
		.modalBackground 
		{
			background-color:Gray;
			opacity:0.7;
			filter:alpha(opacity=70);
		}
	</style>

		<script type="text/javascript">
			function windowPreClose() {
				var editorObject = $find("<%= Editor.ClientID %>");
				var editPanel = editorObject.get_editPanel();
				editPanel.ensurePopupsClosed();
				return true;
			}
	</script>

	<script type="text/javascript">

		function SubmitModalHtml() {

			//var ctl = $find("section1");
			//var ctl = document.getElementsById("section1");
			//ctl.firstChild.data = "foo";

			$find("behavID").hide();
			return false;
		}

		function SubmitModalHtml2() {

			$find("behavID2").hide();
			return false;
		}


		function ShowModalPopup( html_content, layout_section, dim_index, layout_dim) {

			var foo = 1;
			var hid_layout_section =   document.getElementById("<%= hid_layout_section.ClientID %>");
			var hid_layout_dim =  document.getElementById("<%= hid_layout_dim.ClientID %>");
			var hid_dim_index =  document.getElementById("<%= hid_dim_index.ClientID %>");

			var lblControlname = document.getElementById("<%= lblControlname.ClientID %>");

			var btnInsertSectionAfter = document.getElementById("<%= btnInsertSectionAfter.ClientID %>");
			var btnInsertColAfter = document.getElementById("<%= btnInsertColAfter.ClientID %>");
			var btnInsertRowAfter = document.getElementById("<%= btnInsertRowAfter.ClientID %>");

			var btnInsertSectionBefore = document.getElementById("<%= btnInsertSectionBefore.ClientID %>");
			var btnInsertColBefore = document.getElementById("<%= btnInsertColBefore.ClientID %>");
			var btnInsertRowBefore = document.getElementById("<%= btnInsertRowBefore.ClientID %>");


			var btnDeleteSection = document.getElementById("<%= btnDeleteSection.ClientID %>");
			var btnDeleteCol= document.getElementById("<%= btnDeleteCol.ClientID %>");
			var btnDeleteRow = document.getElementById("<%= btnDeleteRow.ClientID %>");
			


			if (layout_dim == "section") {
				lblControlname.innerHTML = "<b>" + layout_dim + " " + layout_section + "</b>";

				btnInsertSectionAfter.style.display = "";
				btnInsertColAfter.style.display = "none";
				btnInsertRowAfter.style.display = "none";

				btnInsertSectionBefore.style.display = "";
				btnInsertColBefore.style.display = "none";
				btnInsertRowBefore.style.display = "none";

				btnDeleteSection.style.display = "";
				btnDeleteCol.style.display = "none";
				btnDeleteRow.style.display = "none";

			}
			else if (layout_dim == "row") {
				lblControlname.innerHTML = "<b>section " + layout_section  + "  " + layout_dim + " " + dim_index + "</b>";

				btnInsertSectionAfter.style.display = "none";
				btnInsertColAfter.style.display = "none";
				btnInsertRowAfter.style.display = "";

				btnInsertSectionBefore.style.display = "none";
				btnInsertColBefore.style.display = "none";
				btnInsertRowBefore.style.display = "";

				btnDeleteSection.style.display = "none";
				btnDeleteCol.style.display = "none";
				btnDeleteRow.style.display = "";
			}
			else if (layout_dim == "col") {
				lblControlname.innerHTML = "<b>section " + layout_section  + "  " + layout_dim + " " + dim_index + "</b>";

				btnInsertSectionAfter.style.display = "none";
				btnInsertColAfter.style.display = "";
				btnInsertRowAfter.style.display = "none";

				btnInsertSectionBefore.style.display = "none";
				btnInsertColBefore.style.display = "";
				btnInsertRowBefore.style.display = "none";

				btnDeleteSection.style.display = "none";
				btnDeleteCol.style.display = "";
				btnDeleteRow.style.display = "none";

			}

			
			hid_layout_section.value = layout_section;
			hid_layout_dim.value = layout_dim;
			hid_dim_index.value = dim_index;

			var editorObject = $find("<%= Editor.ClientID %>");
			editorObject.set_content( html_content);

			var behavID = "behavID";
			var ed = $find(behavID);
			ed.show();



			return false;
		}


		function HideModalPopup() {
			$find("behavID").hide();
			return false;
		}



		function ShowModalPopup2(fldpk, fldname, fieldlabel, aspxfieldlabeltext, layout_section, layout_row, layout_col, fldtypepk, missval, width_label, width_box) {

			var hid_pop_fldpk = document.getElementById("<%= hid_pop_fldpk.ClientID %>");
			var hid_pop_fldname = document.getElementById("<%= hid_pop_fldname.ClientID %>");

			var popfldpk = document.getElementById("<%= popfldpk.ClientID %>");
			var popfldname = document.getElementById("<%= popfldname.ClientID %>");

			var poptxt1 = document.getElementById("<%= poptxt1.ClientID %>");
			var poptxt2 = document.getElementById("<%= poptxt2.ClientID %>");
			var poptxt3 = document.getElementById("<%= poptxt3.ClientID %>");

			var poptxt4 = document.getElementById("<%= poptxt4.ClientID %>");
			var poptxt5 = document.getElementById("<%= poptxt5.ClientID %>");

			var poptxt6 = document.getElementById("<%= poptxt6.ClientID %>");
			var poptxt7 = document.getElementById("<%= poptxt7.ClientID %>");

			var poptxtWidth_label = document.getElementById("<%= poptxtWidth_label.ClientID %>");
			var poptxtWidth_box = document.getElementById("<%= poptxtWidth_box.ClientID %>");


			hid_pop_fldpk.value = fldpk;
			hid_pop_fldname.value = fldname;


			popfldpk.innerText = fldpk;
			popfldname.innerText = fldname;

			poptxt1.value = layout_section;
			poptxt2.value = layout_row;
			poptxt3.value = layout_col;

			poptxt4.value = fieldlabel;
			poptxt5.value = aspxfieldlabeltext;

			poptxt6.value = fldtypepk;
			poptxt7.value = missval;

			poptxtWidth_label.value = width_label;
			poptxtWidth_box.value = width_box;


			var behavID2 = "behavID2";
			var ed2 = $find(behavID2);
			ed2.show();

			return false;
		}

</script>



		<script type="text/javascript">
			el.addEventListener('contextmenu', function (ev) {
				ev.preventDefault();
				
				return false;
			}, false);
	</script>

<%--	<div oncontextmenu="javascript:ShowModalPopup2('hi','there');return false;">
	RightClick
</div>--%>


</asp:Content>

