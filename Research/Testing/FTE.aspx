<%@ Page Title="" Language="C#" MasterPageFile="~/UWBudgetTool.master" AutoEventWireup="true" CodeFile="FTE.aspx.cs" Inherits="Testing_FTE" %>
<%@ MasterType VirtualPath="~/UWBudgetTool.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework4" %> 
<%--<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>--%>




<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableViewState="true" />


	<asp:HiddenField runat="server" ID="hidEditMode" />	
	
	<asp:HiddenField runat="server" ID="Grid1ExcelDeletedIds" />	
	<asp:HiddenField runat="server" ID="Grid1ExcelData" />   
	<asp:HiddenField runat="server" ID="Grid2ExcelDeletedIds" />	
	<asp:HiddenField runat="server" ID="Grid2ExcelData" />   
	<asp:HiddenField runat="server" ID="Grid3ExcelDeletedIds" />	
	<asp:HiddenField runat="server" ID="Grid3ExcelData" />  
	
	<asp:HiddenField ID="hf1" runat="server" />

	foo2



<%--Grid1 - ???? --%>
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

		field.FirstMiddleLastName = Grid1.Rows[rowIndex].Cells['Name'].Value;
		field.budgetNbr = Grid1.Rows[rowIndex].Cells['budgetNbr'].Value;
		field.futuremo = Grid1.Rows[rowIndex].Cells['futuremo'].Value;
		field.calcFTE = Grid1.Rows[rowIndex].Cells['calcFTE'].Value;

		return field;
	}

</script>


<%--Grid2 - FTE --%>
<script type="text/javascript">
	function markAsFocused2(textbox) {
		textbox.className = 'excel-textbox-focused';
	}


	function callUpdateFTE(p1, p2, p3, p4, colIndex)
	{
		var rbl_mode = document.getElementById('<%= hidEditMode.ClientID %>');
		//alert($('#< %=rblObjectsToEdit.ClientID %> input[type=radio]:checked').val());
		//alert(hidEditMode.value);
		var mode = rbl_mode.value;

		PageMethods.UpdateFTEx(p1, p2, p3, p4, colIndex, mode, onUpdateFTEComplete);
	}

	function onUpdateFTEComplete(output)
	{
		//Update the new subtotal with the value received from the server;
		var params = output.split(",");

		//Find the correct rowindex for the totals so we can update it
		var tot_rowidx = 0;
		var rows = Grid2.Rows;
		for (var i = 0; i < rows.length ; i++) {

			if (typeof Grid2.Rows[i] == 'undefined') {
				var fi = "Here!";
			}
			else {
				var budgetNbr = Grid2.Rows[i].Cells['budgetNbr'].Value;
				var Name = Grid2.Rows[i].Cells['Name'].Value;

				if (budgetNbr == params[0] & Name == "**TOTALS**") {
					tot_rowidx = i;
				}
			}
		}

		var body = Grid2.GridBodyContainer.firstChild.firstChild.childNodes[1];
		var colhead = body.childNodes[tot_rowidx].childNodes[params[1]];
		colhead.firstChild.firstChild.firstElementChild.value = params[2];
					
	}

		
	function markAsBlured2(textbox, dataField, rowIndex, colIndex, origval) {
		textbox.className = 'excel-textbox';

		var p1 = Grid2.Rows[rowIndex].Cells['idnbr'].Value;
		var p2 = Grid2.Rows[rowIndex].Cells['budgetNbr'].Value;
		var p3 = dataField;
		var p4 = textbox.value;

		//Only update if the value is different
		if (p4 != origval) {
			if (p4 > 1.0) {
				textbox.className = 'excel-textbox-toobig';
			}
			else {
				textbox.className = 'excel-textbox-changed';
			}

			//var noo = callUpdateFTE(p1, p2, p3, p4, colIndex);
			callUpdateFTE(p1, p2, p3, p4, colIndex);
		}


	}
</script>


<%--Grid3 - Obj--%>
<script type="text/javascript">

				function markAsFocused3(textbox) {
					textbox.className = 'excel-textbox-focused';
				}

				function markAsBlured3(textbox, dataField, rowIndex) {
					textbox.className = 'excel-textbox';

					var p1 = Grid3.Rows[rowIndex].Cells['ObjCode'].Value;
					var p2 = Grid3.Rows[rowIndex].Cells['budgetNbr'].Value;
					var p3 = dataField;
					var p4 = textbox.value;
					PageMethods.UpdateOBJ(p1, p2, p3, p4);

				}
	</script>


<%--Grid4 - Rev--%>
<script type="text/javascript">

			function markAsFocused4(textbox) {
				textbox.className = 'excel-textbox-focused';
			}

			function markAsBlured4(textbox, dataField, rowIndex) {
				textbox.className = 'excel-textbox';

				var p1 = Grid4.Rows[rowIndex].Cells['RevCode'].Value;
				var p2 = Grid4.Rows[rowIndex].Cells['budgetNbr'].Value;
				var p3 = dataField;
				var p4 = textbox.value;
				PageMethods.UpdateREV(p1, p2, p3, p4);

			}
			
</script>




	<br />

	<table>
		<tr >
			<%-- Display Projections:   Define parameters for Pivot Table--%>
			<td style="vertical-align:top" style="height: 220px;">

				<table class="ltblue"  >
					<tr>
						<td style="vertical-align:top" align="center" >
							<asp:Label ID="lblPivotTable" runat="server" Text="Display Projections" ForeColor="Navy" Font-Size="Medium" Font-Bold="true"></asp:Label>
						</td>

						<td style="vertical-align:top" align="right" >
								<asp:Button ID="btnLoadTotals" runat="server" Text="Load Projections" Visible="true" Font-Bold="true" OnClick="btnLoadTotals_Click" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
											<asp:Label ID="lblShow" runat="server" Font-Size="XX-Small" Text="Display:"></asp:Label>

							<asp:CheckBox  ID="chkShowTotals" runat="server" Text="Totals" Checked="True"  Font-Size="XX-Small" />
							<asp:CheckBox  ID="chkShowFTE" runat="server" Text="FTE table" Checked="False"  Font-Size="XX-Small" />
							<asp:CheckBox  ID="chkPlot" runat="server" Text="Plots" Checked="False"  Font-Size="XX-Small" />
							<asp:CheckBox  ID="chkShowOperations" runat="server" Text="Operations" Checked="True"  Font-Size="XX-Small" Visible="false"/>
						</td>
					</tr>
					<tr>
						<td style="vertical-align:top" >
										<asp:Label ID="lblBudgets" runat="server" Text="Select Budget(s):" Font-Size="XX-Small"></asp:Label> <br />
									<select id="selBudgets" runat="server" multiple="true" style="width:300px"  ></select>
									<script type="text/javascript">
										$("#<%=selBudgets.ClientID%>").select2({
											maximumSelectionLength: 3
										});
									</script>

						</td>
						<%--Column dimensions--%>
						<td style="vertical-align:top" >
										<asp:Label ID="lblCols" runat="server" Text="Column dimensions:" Font-Size="XX-Small"></asp:Label> <br />
									<select id="selCols" runat="server" multiple="true" style="width:300px" ></select>
									<script type="text/javascript">
										$("#<%=selCols.ClientID%>").select2({
											maximumSelectionLength: 4
										});


										//http://stackoverflow.com/questions/21875658/prevent-multiple-select-element-from-automatically-sorting-the-value-assigned-to/29145959#29145959
								<%--	    $("#<%=selCols.ClientID%>").on("select2:select", function (e) {
											$('[data-option-id="' + e.params.data.id + '"]').insertBefore(_this.find('option:not(:selected):eq(0)'));
										}).on("select2:open", function () {
											_this.append(_this.find('option:not(:selected)').sort(function (a, b) {
												return +a.getAttribute('data-sort-order') - +b.getAttribute('data-sort-order');
											}));
										});--%>


										$("#<%=selCols.ClientID%>").on("select2:select", function (evt) {
											var element = evt.params.data.element;
											var $element = $(element);

											$element.detach();
											$(this).append($element);
											$(this).trigger("change");
										});

										$('#sayResult').click(function () {
											// 'data' brings the unordered list, while val does not
											var data = $('select').select2('data');

											// Push each item into an array
											var finalResult = data.map(function () {
												return this.id;
											});

											// Display the result with a comma
											alert(finalResult.join(','));

										}
										);
									</script>
							<br />


						</td>


					</tr>
					<tr>

						<%--Row dimensions--%>
						<td style="vertical-align:top">
								<br />
								<asp:Label ID="lblRows" runat="server" Text="Row dimensions:" Font-Size="XX-Small"></asp:Label> <br />
									<select id="selRows" runat="server" multiple="true" style="width:300px" ></select>
									<script type="text/javascript">
										$("#<%=selRows.ClientID%>").select2({
											maximumSelectionLength: 4
										});
									</script>
							<br />&nbsp;
							<br />
								<asp:Label ID="Label2" runat="server" Text="More filters here?<br/>(e.g., only certain Obj codes)" Font-Size="Small"></asp:Label> <br />
						</td>

						<%--FY & Cell functions--%>
						<td style="vertical-align:top">
							<br />
									<asp:Label ID="lblFY" runat="server" Text="Select Fiscal Year(s):" Font-Size="XX-Small"></asp:Label> <br />
									<select id="selFY" runat="server" multiple="true" style="width:300px"  ></select>
									<script type="text/javascript">
										$("#<%=selFY.ClientID%>").select2({
											maximumSelectionLength: 3
										});
									</script>
							<br />
								<asp:Label ID="lblFunctions" runat="server" Text="Cell values:" Font-Size="XX-Small"></asp:Label> <br />
									<select id="selFunctions" runat="server" multiple="true" style="width:300px" ></select>
									<script type="text/javascript">
										$("#<%=selFunctions.ClientID%>").select2({
											maximumSelectionLength: 3
										});
									</script>
							<br />&nbsp;
			<%--				<br /><br /><asp:Panel ID="panelFY" runat="server"></asp:Panel>--%>
						</td>
					</tr>
				</table>

			</td>


			<%-- Edit Projections:   select items to edit --%>
			<td style="vertical-align:top"  style="height: 220px;">
				

				<table class="ltgreen">
					<tr>
						<td colspan="4" style="vertical-align:top">
											<asp:Label ID="lblEditProjections" runat="server" Text="Edit Projections" ForeColor="ForestGreen" Font-Size="Medium" Font-Bold="true"></asp:Label>

						</td>
					</tr>
					<tr>
						<td style="vertical-align:top">
							<table>
								<tr>
									<td style="vertical-align:top">
										<asp:RadioButtonList ID="rblObjectsToEdit" runat="server" OnSelectedIndexChanged="rblObjectsToEdit_SelectedIndexChanged" AutoPostBack="true" >
											<asp:ListItem Value="All Staff FTE" Text="All Staff FTE" Selected="True"></asp:ListItem>
											<asp:ListItem Value="Expenses" Text="Expenses"></asp:ListItem>
											<asp:ListItem Value="Revenue" Text="Revenue"></asp:ListItem>
											<asp:ListItem Value="Indirect rates" Text="Indirect rates" Enabled="false   "></asp:ListItem>
											<asp:ListItem Value="Single Staff FTE" Text="Single Staff FTE" ></asp:ListItem>
										</asp:RadioButtonList>
									</td>
									<td>&nbsp;&nbsp;&nbsp;
										<asp:Button ID="btnEditProjections" runat="server" Text="Edit" Font-Bold="true" Font-Size="Medium" OnCommand="btnEditProjections_Command" CommandName="Edit"></asp:Button>
									</td>
								 </tr>
							</table>

							<br />
								<asp:UpdatePanel ID="updatepanel_SingleStaff" runat="server" UpdateMode="Conditional" >
									<ContentTemplate>
										<asp:DropDownList ID="ddlStaff" runat="server" DataTextField="staffname" DataValueField="staffname" Visible="false"></asp:DropDownList>
									</ContentTemplate>
								</asp:UpdatePanel>
							<br />
							<asp:Button ID="btnMeta" runat="server" Text="Edit Budget Info" Font-Bold="true" Font-Size="Small" OnClick="btnMeta_Click" Visible="false"></asp:Button>


							<asp:Panel ID="panelEditStaffButtons" runat="server" Visible="false">
								<br />
								<br />
								<asp:Button ID="btnAddStaffToBudget" runat="server" Text="Add Staff to Budget" ForeColor="Navy" Font-Bold="true" Font-Size="xx-small" Visible="true" OnClick="btnAddStaffToBudget_Click"></asp:Button>
								<br />
								<br />
								<asp:Button ID="btnDeleteStaffFromBudget" runat="server" Text="Delete Staff from Budget" ForeColor="Navy" Font-Bold="true" Font-Size="xx-small" Visible="true" OnClick="btnDeleteStaffFromBudget_Click"></asp:Button>
							</asp:Panel>
							<asp:Panel ID="panelEditButtons" runat="server" Visible="false">
								<br />

								<asp:Button ID="btnHideGrid2" runat="server" Text="Cancel editing" ForeColor="DarkRed" Font-Bold="true" Font-Size="xx-small" Visible="true" OnClick="btnHideGrid2_Click"></asp:Button>
							</asp:Panel>
						</td>
						<td style="width: 50px"></td>


						<td style="vertical-align:top">

							<br />
							<asp:Panel ID="panelCustomDates" runat="server" Visible="false">
								<asp:Label ID="lblFrom" runat="server" Text="From:" Width="50" Font-Size="XX-Small"></asp:Label> 
								<asp:TextBox ID="txtFrom" runat="server" Text="" Font-Size="XX-Small"></asp:TextBox> <br />
								<asp:Label ID="lblTo" runat="server" Text="To:"  Width="50" Font-Size="XX-Small"></asp:Label> 
								<asp:TextBox ID="txtTo" runat="server" Text="" Font-Size="XX-Small"></asp:TextBox> <br /><br />
							</asp:Panel>
							<br />


							<asp:Panel ID="panelBudgets" runat="server" Visible="false">
							</asp:Panel>
						</td>

					</tr>
					<tr>
						<td colspan="4">
							<br />
								<asp:Label ID="lblError" runat="server" Text="" Font-Bold="false" ForeColor="DarkGreen" Font-Size="Medium"></asp:Label>
							<br />

						</td>
					</tr>
				</table>
	

			</td>


			<%--My Budgets / Scenarios--%>
			<td style="vertical-align:top" class="ltpurple"   style="height: 220px;">
				<table>
					<tr>
						<td>
							<asp:Button ID="btnMyBudgets" runat="server" Text="Show My Budgets" Font-Bold="true" Font-Size="Small" OnClick="btnMyBudgets_Click"></asp:Button>
							<asp:Button ID="btnMyBudgets2" runat="server" Text="Hide My Budgets" Font-Bold="true" Font-Size="Small" OnClick="btnMyBudgets_Click" Visible="false"></asp:Button>
							<br />
							<br />
							<br />
							<asp:Label ID="lblScenario" runat="server" Text="Current Scenario" Font-Size="XX-Small"></asp:Label><br />
							<asp:DropDownList ID="ddlScenario" runat="server" >
								<asp:ListItem Value="Default scenario"></asp:ListItem>
								<asp:ListItem Value="Scenario 1"></asp:ListItem>
								<asp:ListItem Value="Scenario 2"></asp:ListItem>
							</asp:DropDownList>
						</td>
					</tr>
				</table>

			</td>
		</tr>
	</table>






	<asp:Button ID="btnExcel" runat="server" Text="Download Excel FTE data" OnClick="btnExcel_Click" Visible="false" />
	<br />


				
	<br />

	<obout:Grid ID="GridMeta_Budget" runat="server" CallbackMode="false" AutoGenerateColumns="false" AllowAddingRecords="true"  PageSize="-1"
		 AllowPageSizeSelection="false" Visible="false" OnUpdateCommand="GridMeta_Budget_UpdateCommand" OnRebind="GridMeta_Budget_Rebind">
		
		<Columns>
			<obout:Column AllowEdit="true" Width="60px"></obout:Column>
			<obout:Column ID="c1" DataField="budgetNbr" ReadOnly="true"  Width="80px"></obout:Column>
			<obout:Column ID="c2" DataField="budgetName" ReadOnly="true"></obout:Column>
			<obout:Column ID="c3" DataField="begdate" ReadOnly="false" DataFormatString="{0:M/d/yyyy}" Width="90px"></obout:Column>
			<obout:Column ID="c4" DataField="enddate" ReadOnly="false" DataFormatString="{0:M/d/yyyy}" Width="90px"></obout:Column>
			<obout:Column ID="c5" DataField="useBudgetAmt" HeaderText="Budget Amt" ReadOnly="false" Width="100px"></obout:Column>
			<obout:Column ID="c6" DataField="useBalancePriorAmt" HeaderText="Balance Prior Amt" ReadOnly="false" Width="100px"></obout:Column>
			<obout:Column ID="c7" DataField="useRevenueAmt" HeaderText="Revenue Amt" ReadOnly="false" Width="100px"></obout:Column>
			<obout:Column ID="c8" DataField="useEndowmentAmt" HeaderText="Endowment Amt" ReadOnly="false" Width="100px"></obout:Column>
			<obout:Column ID="c9" DataField="useNonEndowmentAmt" HeaderText="Non-Endowment Amt" ReadOnly="false" Width="100px"></obout:Column>
		</Columns>
	</obout:Grid>

<%--    Grid1 - MyBudgets--%>


					<obout:Grid ID="Grid_MyBudgets" runat="server" CallbackMode="false" Serialize="false" AutoGenerateColumns="false" 
						FolderStyle="~/App_Obout/Grid/styles/gray_glass"
					AllowRecordSelection="false" ShowFooter="true" AllowSorting="false" PageSize="-1" AllowAddingRecords="true"
					ShowLoadingMessage="false" AllowPageSizeSelection="false" AllowPaging="false" Visible="false" AllowKeyNavigation="true"
					  OnInsertCommand="Grid_MyBudgets_InsertCommand"
					  OnUpdateCommand="Grid_MyBudgets_UpdateCommand"
					  OnDeleteCommand="Grid_MyBudgets_DeleteCommand"
						>
					<Columns>
						<obout:Column ID="Column1_1" DataField="budgetNbr" ReadOnly="false" HeaderText="BudgetNbr" Width="90"   Visible="true"></obout:Column>			
						<obout:Column ID="Column1_2" DataField="budgetName" HeaderText="BudgetName" Width="150"    Visible="true"></obout:Column>
						<obout:Column ID="Column1_3" DataField="isTemp"  HeaderText="isTemp" Width="60"   Visible="true" ></obout:Column>			
						<obout:Column ID="Column1_4" DataField="begdate" HeaderText="BegDate" Width="80"   Visible="true" DataFormatString="{0:d}"></obout:Column>	
						<obout:Column ID="Column1_5" DataField="enddate" HeaderText="EndDate" Width="80"   Visible="true" DataFormatString="{0:d}"></obout:Column>	
						<obout:Column ID="Column1_6" DataField="sortorder" HeaderText="sortorder" Width="80"   Visible="true" ></obout:Column>
						<obout:Column ID="Column1_7" DataField="mybudgetpk" HeaderText="pk"   Visible="false" ></obout:Column>
						<obout:Column AllowDelete="true" AllowEdit="true"></obout:Column>	
										
					</Columns>
	<%--				<Templates>
						<obout:GridTemplate runat="server" ID="PlainEditTemplate">
							<Template>
								<input type="text" class="excel-textbox" value="<%# Container.Value %>"
									onfocus="markAsFocused(this)" onblur="markAsBlured(this, '<%# Grid1.Columns[Container.ColumnIndex].DataField %>', <%# Container.PageRecordIndex %>)" />
							</Template>
						</obout:GridTemplate>


					</Templates>--%>
				</obout:Grid>


<%--    Grid2 - FTE for whole budget --%>		
					<obout:Grid ID="Grid2" runat="server" CallbackMode="false" Serialize="false" AutoGenerateColumns="false" 
						FolderStyle="~/App_Obout/Grid/styles/gray_glass"
					AllowRecordSelection="false" ShowFooter="true" AllowSorting="false" PageSize="-1" AllowAddingRecords="true"
					ShowLoadingMessage="false" AllowPageSizeSelection="false" AllowPaging="false" Visible="false" AllowKeyNavigation="false"
					AllowGrouping="true"  HideColumnsWhenGrouping="true" OnRebind="Grid2_Rebind"
					OnRowDataBound="Grid2_RowDataBound">
						<TemplateSettings RowEditTemplateId="Grid2_AddStaff" />
					<Columns>
						<obout:Column ID="Column1" DataField="idnbr" HeaderText="ID" ReadOnly="true"  Width="100"    Visible="true"></obout:Column>			
						<obout:Column ID="Column5" DataField="Name" HeaderText="Name" ReadOnly="true"  Width="120"   Visible="true"></obout:Column>			
						<obout:Column ID="Column8" DataField="budgetNbrName" HeaderText="BudgetNbrName" ReadOnly="true" Width="150"   Visible="true"></obout:Column>
						<obout:Column ID="Column6" DataField="budgetNbr" HeaderText="BudgetNbr" Width="100" ReadOnly="true"   Visible="false"></obout:Column>
						<obout:Column ID="Column7" DataField="EndDate" HeaderText="EndDate" Width="100"  ReadOnly="true"  Visible="true" ></obout:Column>
						<obout:Column ID="Column_mo01" DataField="mo01" HeaderText="mo01" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo02" DataField="mo02" HeaderText="mo02" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo03" DataField="mo03" HeaderText="mo03" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo04" DataField="mo04" HeaderText="mo04" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo05" DataField="mo05" HeaderText="mo05" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo06" DataField="mo06" HeaderText="mo06" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo07" DataField="mo07" HeaderText="mo07" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo08" DataField="mo08" HeaderText="mo08" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo09" DataField="mo09" HeaderText="mo09" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo10" DataField="mo10" HeaderText="mo10" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo11" DataField="mo11" HeaderText="mo11" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo12" DataField="mo12" HeaderText="mo12" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo13" DataField="mo13" HeaderText="mo13" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo14" DataField="mo14" HeaderText="mo14" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo15" DataField="mo15" HeaderText="mo15" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo16" DataField="mo16" HeaderText="mo16" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo17" DataField="mo17" HeaderText="mo17" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo18" DataField="mo18" HeaderText="mo18" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo19" DataField="mo19" HeaderText="mo19" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo20" DataField="mo20" HeaderText="mo20" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo21" DataField="mo21" HeaderText="mo21" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo22" DataField="mo22" HeaderText="mo22" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo23" DataField="mo23" HeaderText="mo23" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
						<obout:Column ID="Column_mo24" DataField="mo24" HeaderText="mo24" Width="75"   Visible="true"><TemplateSettings TemplateId="PlainEditTemplate2" /></obout:Column>
							
					</Columns>
					<Templates>
						<obout:GridTemplate runat="server" ID="PlainEditTemplate2">
							<Template>
								<input type="text" class="excel-textbox" value="<%# Container.Value %>"
									onfocus="markAsFocused2(this)" 
									onblur="markAsBlured2(this, '<%# Grid2.Columns[Container.ColumnIndex].DataField %>', <%# Container.PageRecordIndex %>, <%# Container.ColumnIndex %>, <%# Container.Value %>)" >
								<input/>
							

							</Template>
						</obout:GridTemplate>
						
						<obout:GridTemplate runat="server" ID="Grid2_AddStaff"  >
							<Template>
								<obout:OboutDropDownList ID="ddlAddStaff" runat="server" Width="200px"></obout:OboutDropDownList>
								<obout:OboutButton ID="btnAddStaff" runat="server" Text="Add Staff" ></obout:OboutButton>
							</Template>
						</obout:GridTemplate>


					</Templates>
				</obout:Grid>



<%--    Grid3 - OBJ for whole budget --%>		
	
					<obout:Grid ID="Grid3" runat="server" CallbackMode="false" Serialize="false" AutoGenerateColumns="false" 
						FolderStyle="~/App_Obout/Grid/styles/gray_glass"
					AllowRecordSelection="false" ShowFooter="true" AllowSorting="false" PageSize="-1" AllowAddingRecords="false"
					ShowLoadingMessage="false" AllowPageSizeSelection="false" AllowPaging="false" Visible="false" AllowKeyNavigation="true" 
						AllowGrouping="true" GroupBy="budgetNbrName" HideColumnsWhenGrouping="true"
						OnRebind="Grid3_Rebind"
					OnRowDataBound="Grid3_RowDataBound">
						<GroupingSettings AllowChanges="true" />
					<Columns>
						<obout:Column ID="Column37" DataField="ObjCode" HeaderText="ObjCode" ReadOnly="true"  Width="70" runat="server" Visible="true"></obout:Column>			
						<obout:Column ID="Column9"  DataField="ObjDesc" HeaderText="ObjDesc" ReadOnly="true"  Width="130" runat="server" Visible="true"></obout:Column>			
						<obout:Column ID="Column22" DataField="budgetNbrName" HeaderText="Budget" Width="150" runat="server"  Visible="true"></obout:Column>
						<obout:Column ID="Column23" DataField="budgetNbr" HeaderText="BudgetNbr" Width="100" runat="server"  Visible="false"></obout:Column>
						<obout:Column ID="Column24" DataField="EndDate" HeaderText="EndDate" Width="100" runat="server"  Visible="true" ></obout:Column>
						<obout:Column ID="Column25" DataField="mo01" HeaderText="mo01" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
						<obout:Column ID="Column26" DataField="mo02" HeaderText="mo02" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
						<obout:Column ID="Column27" DataField="mo03" HeaderText="mo03" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
						<obout:Column ID="Column28" DataField="mo04" HeaderText="mo04" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
						<obout:Column ID="Column29" DataField="mo05" HeaderText="mo05" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
						<obout:Column ID="Column30" DataField="mo06" HeaderText="mo06" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
						<obout:Column ID="Column31" DataField="mo07" HeaderText="mo07" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
						<obout:Column ID="Column32" DataField="mo08" HeaderText="mo08" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
						<obout:Column ID="Column33" DataField="mo09" HeaderText="mo09" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
						<obout:Column ID="Column34" DataField="mo10" HeaderText="mo10" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
						<obout:Column ID="Column35" DataField="mo11" HeaderText="mo11" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
						<obout:Column ID="Column36" DataField="mo12" HeaderText="mo12" Width="90" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate3" /></obout:Column>
							
					</Columns>
					<Templates>
						<obout:GridTemplate runat="server" ID="PlainEditTemplate3">
							<Template>
								<input type="text" class="excel-textbox" value="<%# Container.Value %>"
									onfocus="markAsFocused3(this)" onblur="markAsBlured3(this, '<%# Grid3.Columns[Container.ColumnIndex].DataField %>', <%# Container.PageRecordIndex %>)" />
							</Template>
						</obout:GridTemplate>


					</Templates>
				</obout:Grid>

<br />

	
<%--    Grid 4 -  Revenue for whole budget  --%>
					<obout:Grid ID="Grid4" runat="server" CallbackMode="false" Serialize="false" AutoGenerateColumns="false" 
						FolderStyle="~/App_Obout/Grid/styles/gray_glass"
					AllowRecordSelection="false" ShowFooter="true" AllowSorting="false" PageSize="-1" AllowAddingRecords="false"
					ShowLoadingMessage="false" AllowPageSizeSelection="false" AllowPaging="false" Visible="false" AllowKeyNavigation="true"
					OnRowDataBound="Grid4_RowDataBound">
					<Columns>
						<obout:Column ID="Column38" DataField="budgetname" HeaderText="BudgetName" Width="150" runat="server"  Visible="true"></obout:Column>
						<obout:Column ID="Column4_23" DataField="budgetNbr" HeaderText="BudgetNbr" Width="100" runat="server"  Visible="true"></obout:Column>
						<obout:Column ID="Column4_24" DataField="EndDate" HeaderText="EndDate" Width="100" runat="server"  Visible="true" ></obout:Column>
						<obout:Column ID="Column4_25" DataField="mo01" HeaderText="mo01" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
						<obout:Column ID="Column4_26" DataField="mo02" HeaderText="mo02" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
						<obout:Column ID="Column4_27" DataField="mo03" HeaderText="mo03" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
						<obout:Column ID="Column4_28" DataField="mo04" HeaderText="mo04" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
						<obout:Column ID="Column4_29" DataField="mo05" HeaderText="mo05" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
						<obout:Column ID="Column4_30" DataField="mo06" HeaderText="mo06" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
						<obout:Column ID="Column4_31" DataField="mo07" HeaderText="mo07" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
						<obout:Column ID="Column4_32" DataField="mo08" HeaderText="mo08" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
						<obout:Column ID="Column4_33" DataField="mo09" HeaderText="mo09" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
						<obout:Column ID="Column4_34" DataField="mo10" HeaderText="mo10" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
						<obout:Column ID="Column4_35" DataField="mo11" HeaderText="mo11" Width="75" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
						<obout:Column ID="Column4_36" DataField="mo12" HeaderText="mo12" Width="90" runat="server"  Visible="true"><TemplateSettings TemplateId="PlainEditTemplate4" /></obout:Column>
							
					</Columns>
					<Templates>
						<obout:GridTemplate runat="server" ID="PlainEditTemplate4">
							<Template>
								<input type="text" class="excel-textbox" value="<%# Container.Value %>"
									onfocus="markAsFocused4(this)" onblur="markAsBlured4(this, '<%# Grid4.Columns[Container.ColumnIndex].DataField %>', <%# Container.PageRecordIndex %>)" />
							</Template>
						</obout:GridTemplate>


					</Templates>
				</obout:Grid>


	<table>
		<tr>
			<td style="width: 50px" align="center">
				<asp:Label ID="Label1" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
			</td>
			<td style="width: 50px"></td>
			<td align="center">
				<asp:Label ID="l2" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top">
				<asp:Panel ID="panel_TOTAL" runat="server"></asp:Panel>

			</td>
			<td style="width: 50px" ></td>
			<td style="vertical-align:top">
				<asp:Panel ID="panelPlots_TOTAL" runat="server"></asp:Panel>
			</td>
		</tr>
	</table>
	<br />
	<table>
		<tr>
			<td style="vertical-align:top">
				<asp:Panel ID="panel_FTE" runat="server"></asp:Panel>
			</td>
			<td style="width: 50px" ></td>
			<td style="vertical-align:top">
				<asp:Panel ID="panelPlots_FTE" runat="server"></asp:Panel>
			</td>

		</tr>
	</table>

					<%--<asp:Placeholder ID="panelPlots_FTE" runat="server" EnableViewState="true" Visible="true">
					</asp:Placeholder>--%>

	<asp:Label ID="x" runat="server"></asp:Label>

	<script src="../../App_Obout/Grid/custom_scripts/excel-style/excel-style.js" type="text/javascript"></script>

	
	<script type="text/javascript">
		window.onload = function () {
			Grid2.convertToExcel(
				['ReadOnly', 'ReadOnly', 'ReadOnly', 'ReadOnly', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox'],
				'<%=Grid2ExcelData.ClientID %>',
				'<%=Grid2ExcelDeletedIds.ClientID %>'
				);
			}
	</script>


	<script type="text/javascript">
		window.onload = function () {


			try {
				Grid3.convertToExcel(
				['ReadOnly', 'ReadOnly', 'ReadOnly', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox', 'TextBox'],
				'<%=Grid3ExcelData.ClientID %>',
				'<%=Grid3ExcelDeletedIds.ClientID %>'
				);
			}
			catch (e) {
				// statements to handle any exceptions
				//logMyErrors(e); // pass exception object to error handler
			}

		}
	</script>


</asp:Content>



