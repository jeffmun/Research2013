<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="DATAvalues.aspx.cs" Inherits="stats_DATAvalues"
	 EnableEventValidation="false" Title="DATA Values by Subject"  %>

 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true" EnableViewState="true"  ></asp:ScriptManager>

	
	<asp:HiddenField ID="hidNumSelectedVars" runat="server" />

<script type="text/javascript">


	// the button action
	$('#minmaxbutton').click(function () {
		var chart = $('#chart2_container').highcharts();
		var xmin = xmin.Text;
		var xmax = xmax.Text;
		var ymin = ymin.Text;
		var ymax = ymax.Text;
		chart.xAxis[0].setExtremes(xmin, xmax);
		chart.yAxis[0].setExtremes(ymin, ymax);
	});



	function getElementText(e) {
		if (e.innerText) {
			return e.innerText;
		}
		else {
			return e.textContent;
		}
	}


	function onClientSelect(arrSelectedRecords) {

		var nsel = arrSelectedRecords.length;
		var sMessage = "";
		for (var i = 0; i < nsel; i++) {
			var record = arrSelectedRecords[i];
			sMessage += " --- " + record.fldpk + " --- ";
		}

		//alert(sMessage);
		
		if (record.fldpk) {
			PageMethods.AddFld(record.fldpk);

			//Grid1.refresh();
		}

		return false;
	}

	function onClientRemove(arrSelectedRecords) {

		var nsel = arrSelectedRecords.length;
		var sMessage = "";
		for (var i = 0; i < nsel; i++) {
			var record = arrSelectedRecords[i];
			sMessage += " --- " + record.fldpk + " --- ";
		}

		//alert(sMessage);

		if (record.fldpk) {
			PageMethods.RemoveFld(record.fldpk);

			//Grid1.refresh();
		}

		return false;
	}



</script>
 
	
<%--	<div id="foo"></div>

<asp:UpdatePanel ID="updatepanel1" runat="server" UpdateMode="Conditional">
	<ContentTemplate>
		<asp:Label ID="x" runat="server" Text="" ForeColor="Blue"></asp:Label>
					</ContentTemplate>
	<Triggers>
	</Triggers>
</asp:UpdatePanel>
		--%>
	<br />
	
	<asp:Label ID="lblTitle" runat="server" Text="Longitudinal DATA Charts: " Font-Bold="true" Font-Size="Medium"></asp:Label>
	<asp:Label ID="lblStudyName" runat="server" Text="" Font-Bold="true" Font-Size="Large" ForeColor="#003399"></asp:Label>
	<br />
	<br />
	<asp:Panel ID="panelChartControls" runat="server" Visible="false">
	

	<table>
		<tr>
			<td style="vertical-align:top" width="100px">
				<asp:Button ID="btnLoadCharts" runat="server"  OnClick="btnLoadCharts_Click" Text="Load Charts" Font-Bold="true" Font-Size="Small" />
				<br />
				<asp:Button ID="btnLoadScatter" runat="server"  OnClick="btnLoadScatter_Click" Text="Load Scatter" Font-Bold="true" Font-Size="Small" Visible="false" />
			</td>
			<td style="vertical-align:top" width="400px">

				<asp:Label ID="Label6" runat="server" Text="Charts for..." Font-Italic="true" Font-Bold="true" Font-Size="XX-Small"></asp:Label><br />
				<asp:RadioButtonList ID="rblPlotsBy" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblPlotsBy_SelectedIndexChanged" AutoPostBack="true">
					<asp:ListItem Value="Each Variable" Text="Each Variable" Selected="True"></asp:ListItem>
					<asp:ListItem Value="Each Variable by Group" Text="Each Variable by Group" ></asp:ListItem>
					<asp:ListItem Value="Each Variable by TxGrp" Text="Each Variable by TxGrp" Enabled="true" ></asp:ListItem>
					<asp:ListItem Value="Each Subject" Text="Each Subject"></asp:ListItem>
					<asp:ListItem Value="Single Subject" Text="Single Subject"></asp:ListItem>
				</asp:RadioButtonList>
				<asp:UpdatePanel ID="panelSelectID" runat="server" UpdateMode="Conditional"   >
					<ContentTemplate>
						<asp:DropDownList ID="ddlNewID" runat="server" DataTextField="IDtxt" DataValueField="personID" OnSelectedIndexChanged="ddlNewID_SelectedIndexChanged"
							 Visible="false" AutoPostBack="true"></asp:DropDownList>
						<asp:Label ID="lblSelectPersonError" runat="server" Text="Select a subject." ForeColor="Red" Visible="false"></asp:Label>
					</ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="rblPlotsBy" EventName="SelectedIndexChanged" />
<%--						<asp:AsyncPostBackTrigger ControlID="btnLoadCharts" EventName="Click" />--%>
						<asp:PostBackTrigger ControlID="btnLoadCharts" />
					</Triggers>
				</asp:UpdatePanel>

				<br />

				<asp:Label ID="Label2" runat="server" Text="X axis: " Font-Bold="true" Font-Size="XX-Small"></asp:Label>
				<asp:RadioButtonList ID="rblDate_or_Age" runat="server" Font-Size="XX-Small" RepeatDirection="Horizontal" >
					<asp:ListItem Text="Age (subject min age=0)" Value="Age Zero" Selected="True"></asp:ListItem>
					<asp:ListItem Text="Age (months)" Value="Age (months)" ></asp:ListItem>
					<asp:ListItem Text="Admin Date" Value="Admin Date" ></asp:ListItem>
					<asp:ListItem Text="Time point" Value="TimePoint" Enabled="false" ></asp:ListItem>
				</asp:RadioButtonList>

				<br />
				<asp:CheckBox ID="chkRemoveMissval" runat="server" Text="Remove missing values" Checked="true"></asp:CheckBox>
			</td>
			<td width="10px"></td>
			<td style="vertical-align:top">
				<asp:Label ID="Label3" runat="server" Text="chart width:"  Font-Size="XX-Small" Width="70"></asp:Label>
				<asp:TextBox ID="txtWd" runat="server" Text="800" Width="40"   Font-Size="XX-Small"></asp:TextBox>
				<br />
				<asp:Label ID="Label4" runat="server" Text="chart height:"  Font-Size="XX-Small" Width="70"></asp:Label>
				<asp:TextBox ID="txtHt" runat="server" Text="600" Width="40"   Font-Size="XX-Small"></asp:TextBox>
				<br />
				<asp:Label ID="Label7" runat="server" Text="# of columns: "  Font-Size="XX-Small" Width="70"></asp:Label>
				<asp:TextBox ID="txtNcolumns" runat="server" Text="2" Width="40"   Font-Size="XX-Small" ></asp:TextBox>
			</td>
			<td width="10px"></td>
			<td style="vertical-align:top">
				<asp:Label ID="Label10" runat="server" Text="Legend Position:"  Font-Size="XX-Small" Width="100"></asp:Label>
				<asp:DropDownList ID="ddlLegendOpts" runat="server">
					<asp:ListItem Value="Right"></asp:ListItem>
					<asp:ListItem Value="Top"></asp:ListItem>
					<asp:ListItem Value="Bottom"></asp:ListItem>
					<asp:ListItem Value="None"></asp:ListItem>
					<asp:ListItem Value="Floating"></asp:ListItem>
				</asp:DropDownList>
				<br />
				<asp:Label ID="Label11" runat="server" Text="Legend Direction:"  Font-Size="XX-Small" Width="100"></asp:Label>
				<asp:DropDownList ID="ddlLegendDirection" runat="server">
					<asp:ListItem Value="Vertical"></asp:ListItem>
					<asp:ListItem Value="Horizontal"></asp:ListItem>
				</asp:DropDownList>
				<br />
				<asp:Label ID="Label16" runat="server" Text="Sort charts by:"  Font-Size="XX-Small" Width="100" Visible="false"></asp:Label>
				<asp:DropDownList ID="DropDownList1" runat="server"  Visible="false">
					<asp:ListItem Value="ID"></asp:ListItem>
					<asp:ListItem Value="Group, ID"></asp:ListItem>
					<asp:ListItem Value="Max Y"></asp:ListItem>
					<asp:ListItem Value="Max Y - Min Y"></asp:ListItem>
					<asp:ListItem Value="Group, Max Y"></asp:ListItem>
					<asp:ListItem Value="Group, Max Y-Min Y"></asp:ListItem>
				</asp:DropDownList>


<%--				<asp:Button ID="Button2" runat="server"  OnClick="btnLoadCharts_AllIDs_Click" Text="Load Charts by Subject"  Font-Size="X-Small" />--%>
				
			<%--	<asp:Button ID="btnUpdateDataChk" runat="server" OnClick="btnUpdateDataChk_Click" Text="Update DataCheck Status" Visible="false" />--%>
			</td>
			<td style="vertical-align:top">
							
				<br />
				<table>
					<tr>
						<td align="center" colspan="3" >
							<asp:Label ID="Label17" runat="server" Text="Define range of X & Y axis"  Font-Size="XX-Small" Width="150" Font-Underline="true"></asp:Label>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label15" runat="server" Text="Y max:"  Font-Size="XX-Small" Width="40"></asp:Label>
							<asp:TextBox ID="txt_ymax" runat="server" Text="0" Width="35"   Font-Size="XX-Small"></asp:TextBox>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label13" runat="server" Text="Y min:"  Font-Size="XX-Small" Width="40"></asp:Label>
							<asp:TextBox ID="txt_ymin" runat="server" Text="0" Width="35"   Font-Size="XX-Small"></asp:TextBox>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<asp:Label ID="Label12" runat="server" Text="X min:"  Font-Size="XX-Small" Width="40"></asp:Label>
							<asp:TextBox ID="txt_xmin" runat="server" Text="0" Width="35"   Font-Size="XX-Small"></asp:TextBox>
						</td>
						<td>
							<asp:Label ID="Label14" runat="server" Text="X max:"  Font-Size="XX-Small" Width="40"></asp:Label>
							<asp:TextBox ID="txt_xmax" runat="server" Text="0" Width="35"   Font-Size="XX-Small"></asp:TextBox>
						</td>
					</tr>
				</table>
				<br /><br /><br />

				<asp:Button ID="btnReset" runat="server"  OnClick="btnReset_Click" Text="Select Variables" Font-Bold="true" Font-Size="Small" Visible="false" />

			</td>
		</tr>
	</table>
				</asp:Panel>

	<asp:Panel ID="panelInstructions" runat="server">
				<asp:Label ID="lblSelectVars" runat="server" Text="Add variables from the table on the left using the checkboxes." Font-Bold="false" ForeColor="Red" Font-size="Small"></asp:Label>
				<br />
				<asp:Label ID="Label8" runat="server" Text="Use the filters to search within the Variable names and/or labels." Font-Bold="false" ForeColor="Red" Font-size="Small"></asp:Label>
				<br />
				<asp:Label ID="Label9" runat="server" Text="Click the 'Refresh selected vars' to view the current set of selected vars." Font-Bold="false" ForeColor="Red" Font-size="Small"></asp:Label>
				</asp:Panel>

	<br />

	<asp:Label ID="lblSelectSubjects" runat="server" Text="Select the groups you wish to plot." ForeColor="Red" Font-Size="Small" Visible="false"></asp:Label>
	<asp:Panel ID="gvSubjects_container" runat="server" ></asp:Panel>



	<br />
	<asp:Panel ID="panelVars" runat="server">

	<table>
		<tr>

						<td style="vertical-align:top">
				<asp:Label ID="Label5" runat="server" Text="Add Variables" Font-Bold="true" Font-size="Medium"></asp:Label>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="tdText" value="Collapse All" onclick="gridExpandCollapseLevel(null, false)" id="btnCollapseLevel1" type="button" style="font-size: x-small;">
				<input class="tdText" value="Expand All" onclick="gridExpandCollapseLevel(null, true)" id="btnExpandLevel1" type="button" style="font-size: x-small;">
				<asp:CheckBox ID="chkAllVars" runat="server" Text="Include all vars" AutoPostBack="true" Checked="true" />
				<br />

			<obout:Grid id="ogrid_Fld_numeric" runat="server" PageSize="-1" AutoGenerateColumns="false"    ShowFooter="true" ShowMultiPageGroupsInfo="false"
				  AllowPaging="false" AllowPageSizeSelection="false" AllowAddingRecords="false" 
				  AllowRecordSelection="true" AllowMultiRecordSelection="true" AllowGrouping="true" GroupBy="measname" ShowCollapsedGroups="true"
				 FolderStyle="~/App_Obout/Grid/styles/gray_glass" HideColumnsWhenGrouping="true" AllowFiltering="true"    >
				<FilteringSettings FilterPosition="Top" FilterLinksPosition="Top" InitialState="Hidden" MatchingType="AnyFilter" />
				<ScrollingSettings ScrollHeight="300" />
				<ClientSideEvents OnClientSelect="onClientSelect" />
				<Columns>
					<obout:CheckBoxSelectColumn ShowHeaderCheckBox="false" HeaderText="Add"  />

					<obout:Column DataField="measname"></obout:Column>
					<obout:Column DataField="fldname" HeaderText="Variable"></obout:Column>
					<obout:Column DataField="FieldLabel" HeaderText="Label" Width="300px"></obout:Column>
					<obout:Column DataField="fldpk" Visible="false" ItemStyle-ForeColor="Silver"></obout:Column>
				</Columns>
			</obout:Grid>

			</td>
			<td width="20px"></td>

			
			<td style="vertical-align:top">


<%--			<asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
				<ContentTemplate>--%>
				
				<asp:Label ID="lblSel" runat="server" Text="Selected Variables" Font-Bold="true" Font-size="Medium"></asp:Label>

				<asp:Button ID="btnRefresh" runat="server" Text="Refresh selected vars" OnClick="btnRefresh_Click" Font-Size="XX-Small" ForeColor="ForestGreen"  />
				<br />

				<obout:Grid id="Grid1" runat="server" PageSize="-1"  AutoGenerateColumns="false"  ShowFooter="false"  
				  AllowRecordSelection="true" AllowMultiRecordSelection="false" AllowGrouping="true" GroupBy="measname" ShowCollapsedGroups="false"
				 FolderStyle="~/App_Obout/Grid/styles/gray_glass" HideColumnsWhenGrouping="true"     >
<%--				<ScrollingSettings ScrollHeight="300" />--%>
				<ClientSideEvents OnClientSelect="onClientRemove" />
				<Columns>
					<obout:CheckBoxSelectColumn ShowHeaderCheckBox="false" HeaderText="Del"  />
					<obout:Column DataField="measname"></obout:Column>
					<obout:Column DataField="fldname"></obout:Column>
					<obout:Column DataField="FieldLabel" Width="300px"></obout:Column>
					<obout:Column DataField="fldpk" Visible="false" ItemStyle-ForeColor="Silver" ></obout:Column>
				</Columns>
			</obout:Grid>

			<br />
			<br />
				

			</td>


		</tr>
	</table>
	</asp:Panel>


	<asp:Label ID="divSelectedRecords" runat="server" Text="" Font-Bold="true" ForeColor="ForestGreen" Font-Size="XX-Small"></asp:Label>
	


	<br />
	<br />


		<br />
		<asp:Panel ID="panel1" runat="server"></asp:Panel>

	<br />
	<asp:Panel ID="panelGrid" runat="server" Visible="false">
	<asp:Label ID="l1" runat="server" Text="Timepoint Dates for subject" Font-Bold="true" Font-Underline="true"></asp:Label>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnRefreshChart" runat="server" Text="Refresh Chart" Font-Size="XX-Small" OnClick="btnRefreshChart_Click" />

<%--		<obout:Grid ID="ogrid" runat="server" PageSize="-1" AutoGenerateColumns="false"  AllowColumnResizing="false"   
			 ShowFooter="false" OnUpdateCommand="ogrid_UpdateCommand" OnRebind="ogrid_Rebind" OnRowDataBound="ogrid_RowDataBound">
			<Columns>
				<obout:Column DataField="ID" HeaderText="ID" Width="100px" ReadOnly="true"></obout:Column>
				<obout:Column DataField="timepoint_text" HeaderText="Timepoint"  Width="150px" ReadOnly="true"></obout:Column>
				<obout:Column DataField="period" HeaderText="Period"  Width="150px" ReadOnly="true"></obout:Column>
				<obout:Column DataField="agemos" HeaderText="Age (mos)"  Width="100px" ReadOnly="true"></obout:Column>
				<obout:Column DataField="tpdatebeg" HeaderText="Date Begin"  Width="120px"   DataFormatString="{0:MM/dd/yyyy}"></obout:Column>
				<obout:Column DataField="tpnotes" HeaderText="Notes"  Width="180px" ></obout:Column>
				<obout:Column DataField="" HeaderText="" Width="125" AllowEdit="true" AllowDelete="false" Visible="true" runat="server" ></obout:Column>
				<obout:Column DataField="timepoint" HeaderText="Timepoint #"  Width="100px" ReadOnly="true"></obout:Column>
				<obout:Column DataField="timepointID" HeaderText="TimeopintID"  Width="100px" ReadOnly="true"></obout:Column>
				<obout:Column DataField="tpsID" HeaderText="tpsID"  Width="100px" ReadOnly="true" Visible="false"></obout:Column>
			</Columns>--%>


	<%--		
		ALSO ADD THIS IN OPENING TAG:  OnColumnsCreated="ogrid_ColumnsCreated"

		<Templates>
				<obout:GridTemplate runat="server" ID="Template1">
					<Template><span><%# Container.Value %></span></Template>
				</obout:GridTemplate>
			</Templates>--%>
		</obout:Grid>
	</asp:Panel>

	<br />
	<br />
	<asp:Label ID="Label1" runat="server" Text="Timepoints for Subject With No Date Entered" Font-Bold="true" Font-Underline="true" ForeColor="DarkRed" Visible="false"></asp:Label>
	<br />
<%--	<obout:Grid ID="ogrid2" runat="server" PageSize="-1" AutoGenerateColumns="false"  AllowColumnResizing="true"  Visible="false"  
		ShowFooter="false" AllowAddingRecords="false" OnUpdateCommand="ogrid_UpdateCommand" OnRebind="ogrid_Rebind" >
		<Columns>
			<obout:Column DataField="ID" HeaderText="ID" Width="100px" ReadOnly="true"></obout:Column>
			<obout:Column DataField="timepoint_text" HeaderText="Timepoint"  Width="150px" ReadOnly="true"></obout:Column>
			<obout:Column DataField="period" HeaderText="Period"  Width="150px" ReadOnly="true"></obout:Column>
			<obout:Column DataField="tpdatebeg" HeaderText="Date Begin"  Width="120px"   DataFormatString="{0:MM/dd/yyyy}"></obout:Column>
			<obout:Column DataField="tpnotes" HeaderText="Notes"  Width="180px" ></obout:Column>
			<obout:Column DataField="" HeaderText="" Width="125" AllowEdit="true" AllowDelete="false" Visible="true" runat="server" ></obout:Column>
			<obout:Column DataField="timepoint" HeaderText="Timepoint #"  Width="100px" ReadOnly="true"></obout:Column>
			<obout:Column DataField="timepointID" HeaderText="TimepointID"  Width="100px" ReadOnly="true"></obout:Column>
			<obout:Column DataField="tpsID" HeaderText="tpsID"  Width="100px" ReadOnly="true" Visible="false"></obout:Column>
		</Columns>
		</obout:Grid>--%>
			<br />


	<asp:Panel ID="panelCharts" runat="server" EnableViewState="true"></asp:Panel>

<%--	<asp:SqlDataSource ID="sqlDataChk" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		 SelectCommand="select -1 datachkID, '--Select DataCheck Status--' datachk, -1 sortorder  union select datachkID, datachk, sortorder from uwautism_research_backend..tblDataChk_lkup order by sortorder">

	</asp:SqlDataSource>--%>


<%--	<asp:SqlDataSource ID="sqlSelectedFlds" runat="server" SelectCommandType="StoredProcedure"  ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand="def.spFld_InAnalysis_by_studyIDfull" >
		<SelectParameters>
			<asp:ControlParameter Name="studyIDfull" ControlID="lblMasterStudyIDfull" PropertyName="Text" />
			<asp:Parameter Name="datatype" DefaultValue="numeric" />
			<asp:Parameter Name="selectmode" DefaultValue="SELECTED" />
		</SelectParameters>
	</asp:SqlDataSource>--%>


<%--Collapse / Exapnd Grid Groups--%>
	<script language="javascript">
		function gridExpandCollapseLevel(level, isExpand) {
			if (level != null) {
				level = level - 1;
			}
			var tdArr = document.getElementsByTagName("DIV");
			var groupClassNamePrefix = "ob_gRGHB";

			for (i = 0; i < tdArr.length; i++) {
				var td = tdArr[i];
				if (td.className == groupClassNamePrefix) {
					var img = tdArr[i].firstChild;

					var tempLevel = tdArr[i].parentNode.childNodes.length - 3;
					if (level == null || tempLevel == level) {
						gridExpandCollapseGroup(img, isExpand);
					}
				}
			}
		}
		function gridExpandCollapseGroup(img, isExpand) {
			if ((isExpand && img.src.indexOf("group_btn_open.gif") >= 0)
			|| (!isExpand && img.src.indexOf("group_btn_close.gif") >= 0)) {
				ogrid_Fld_numeric.manageGroupExpandCollapse(img, false);
			}
		}
</script>

		<script type="text/javascript" src="<%# Request.ApplicationPath %>/js/checkbox.js"></script>


</asp:Content>

