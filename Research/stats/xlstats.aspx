<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="xlstats.aspx.cs" AutoEventWireup="true"
 Inherits="stats_xlstats" Title="XL Stats"   Theme="Skin1" EnableViewState="true" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

	<script type="text/javascript" src="~/js/select2.min.js"></script>




	</script>

		<script>
			$(document).ready(function () {
	
				$(".select2_rows").select2(
					{ placeHolder: "Select rows" });
				$(".select2_cols").select2(
					{ placeHolder: "Select columns" });

				$('.select2_rows').on('change', function () {
					$('#<%=hidRows.ClientID%>').val($(this).val());
				});


			});
	</script>
	<script>

	</script>


	<asp:HiddenField ID="hidRows" runat="server" />


	<table>
		<tr>
	        <td>
				<label for="id_select2_rows">
					Rows in table<br />

					<select class="select2_rows" id="id_select2_rows" multiple="multiple" style="width: 250px">
						<option></option>
						<option value="TimePoint">TimePoint</option>
						<option value="Group">Group</option>
						<option value="txgrp">TxGrp</option>
					</select>
				</label>
			</td>
			<td width="100px"></td>
			<td width="300px">
				<label for="id_select2_cols">
					Columns in table<br />
					<select class="select2_cols" id="id_select2_cols" multiple="multiple" style="width: 250px">
						<option></option>
						<option value="TimePoint">TimePoint</option>
						<option value="Group">Group</option>
						<option value="txgrp">TxGrp</option>
					</select>
				</label>
			</td>
		</tr>

	</table>



	testing:
	<asp:TextBox ID="txtVars" runat="server" Text="mucss,mucoiq,murlagee,muelagee,muvragee,mufmagee" Width="700px" ></asp:TextBox>

<style type="text/css">
	 .foo1
	  {
		text-align:center;
	   font-size:16px;
	   color:#0000DB;
	  }
	  .foo2
	  {
		text-align:center;
	   font-size:16px;
	   color:#DD0022;
	  }
</style>

	<asp:Label ID="lblInfo" runat="server"></asp:Label>
 

<table>
	<tr>
		<td style="vertical-align:top">
				<asp:Panel ID="panel_fileinfo" runat="server"></asp:Panel>
		</td>
		<td style="vertical-align:top">
			<asp:Panel ID="Panel_Controls" runat="server" Visible="true">
				<br />
				<asp:DropDownList ID="ddlDataProj" runat="server" DataValueField="dataproj_pk" DataTextField="projTitlePK" Visible="false"></asp:DropDownList>
				<br />
				<br />
				<table>
					<tr>
						<td colspan="2" style="vertical-align:top">
							<asp:Label ID="lblDescStats" runat="server" Text="Descriptive Stats:" Font-Bold="true" Visible="false"  ></asp:Label>
							<asp:Button ID="btnGetStats" runat="server" Text="Descriptive Stats" ForeColor="ForestGreen" OnClick="btnGetStats_Click" />
						</td>
						<td style="vertical-align:top">
							<asp:Button ID="btnSummaryAll" runat="server" Text="View Summary: All Vars"  ForeColor="ForestGreen" OnClick="btnSummaryAll_Click" />
							<br />
							<asp:DropDownList ID="ddlAllVarsMode" runat="server"  ForeColor="ForestGreen" Font-Size="XX-Small" Visible="false" >
								<asp:ListItem Text="By Timepoint" Value="By Timepoint" Selected="True"></asp:ListItem>
								<asp:ListItem Text="By Group" Value="By Group" ></asp:ListItem>
								<asp:ListItem Text="By TxGrp" Value="By TxGrp" ></asp:ListItem>
								<asp:ListItem Text="By Group,Timepoint" Value="By Group,Timepoint" ></asp:ListItem>
								<asp:ListItem Text="By TxGrp,Timepoint" Value="By TxGrp,Timepoint" ></asp:ListItem>
								<asp:ListItem Text="By Group,TxGrp,Timepoint" Value="By Group,TxGrp,Timepoint" ></asp:ListItem>
							</asp:DropDownList>
						</td>
						<td style="vertical-align:top">
							<asp:Button ID="btnOpenSubjects" runat="server" Text="View Subjects"  ForeColor="ForestGreen" OnClick="btnOpenSubjects_Click" />
						</td>
						<td style="vertical-align:top">
							<asp:Button ID="btnOpenDataDict" runat="server" Text="View DataDict"  ForeColor="ForestGreen" OnClick="btnOpenDataDict_Click" />
							<asp:Button ID="btnStats" runat="server" Text="Stats"  ForeColor="Purple" OnClick="btnStats_Click" />
						</td>


					</tr>
					<tr>
						<td>
							<br />
						</td>
					</tr>
					<tr>
						<td style="vertical-align:top">
							<asp:Label ID="lbl_rbl1" runat="server" Text="Stats" Font-Bold="true" Font-Underline="true" Font-Size="8pt" ForeColor="ForestGreen"></asp:Label>
							<asp:RadioButtonList ID="rbl1" runat="server" RepeatDirection="Vertical" ForeColor="ForestGreen" Visible="false">
							</asp:RadioButtonList>
							<asp:CheckBoxList ID="cblStats" runat="server" ForeColor="ForestGreen" >
								<asp:ListItem Value="2" Text="M" Selected="True"></asp:ListItem>
								<asp:ListItem Value="3" Text="SD" Selected="True"></asp:ListItem>
								<asp:ListItem Value="1" Text="N" Selected="True"></asp:ListItem>
								<asp:ListItem Value="4" Text="Min" Selected="False"></asp:ListItem>
								<asp:ListItem Value="5" Text="Max" Selected="False"></asp:ListItem>
								<asp:ListItem Value="6" Text="Sum" Selected="False"></asp:ListItem>
							</asp:CheckBoxList>
						</td>
						<td style="vertical-align:top">
							<asp:Label ID="lbl_rbl2" runat="server" Text="Rows" Font-Bold="true" Font-Underline="true" Font-Size="8pt" ForeColor="ForestGreen"></asp:Label>
							<asp:CheckBoxList ID="cblRows" runat="server" ForeColor="ForestGreen" OnSelectedIndexChanged="cblRows_SelectedIndexChanged" AutoPostBack="true" >
								<asp:ListItem Value="Group" Selected="False"></asp:ListItem>
								<asp:ListItem Value="TimePoint" Selected="False"></asp:ListItem>
<%--								<asp:ListItem Value="Variable" Selected="True"></asp:ListItem>
								<asp:ListItem Value="stats" Selected="True"></asp:ListItem>--%>
								<asp:ListItem Value="txgrp" Text="TxGrp" Selected="True"></asp:ListItem>
							</asp:CheckBoxList>
							<asp:RadioButtonList ID="rbl2" runat="server" RepeatDirection="Vertical" ForeColor="ForestGreen" Visible="false">
							</asp:RadioButtonList>

							<br />
							<br />


							<asp:Label ID="lblSelRows" runat="server" ForeColor="Purple"></asp:Label>




						</td>
						<td style="vertical-align:top">
							<asp:Label ID="lbl_rbl3" runat="server" Text="Columns" Font-Bold="true" Font-Underline="true" Font-Size="8pt" ForeColor="ForestGreen"></asp:Label>
							<asp:CheckBoxList ID="cblCols" runat="server" ForeColor="ForestGreen">
								<asp:ListItem Value="Group" Selected="False"></asp:ListItem>
								<asp:ListItem Value="TimePoint" Selected="True"></asp:ListItem>
<%--								<asp:ListItem Value="Variable" Selected="False"></asp:ListItem>
								<asp:ListItem Value="stats" Selected="True"></asp:ListItem>--%>
								<asp:ListItem Value="txgrp" Text="TxGrp" Selected="False"></asp:ListItem>
							</asp:CheckBoxList>
							<asp:RadioButtonList ID="rbl3" runat="server" RepeatDirection="Vertical" ForeColor="ForestGreen" Visible="false">
							</asp:RadioButtonList>



							<br /><br />


						</td>
						<td>
							<asp:RadioButtonList ID="rbl_stackwide" runat="server" RepeatDirection="Horizontal" BorderColor="Silver" BorderStyle="Solid" Visible="false">
								<asp:ListItem Text="stacked" Value="stacked" Selected="True"></asp:ListItem>
								<asp:ListItem Text="wide" Value="wide"></asp:ListItem>
							</asp:RadioButtonList>
							<asp:Label ID="Label5" runat="server" Text="Place variables as:" Font-Bold="true" Font-Underline="true" Font-Size="8pt" ForeColor="ForestGreen" Visible="true"></asp:Label>
							<asp:RadioButtonList ID="rbl_VarRowCol" runat="server" RepeatDirection="Horizontal" ForeColor="ForestGreen" Visible="true">
								<asp:ListItem Text="Row" Value="Row" Selected="True"></asp:ListItem>
								<asp:ListItem Text="Column" Value="Column"></asp:ListItem>
							</asp:RadioButtonList>
							<asp:RadioButtonList ID="rbl_varsfirstlast" runat="server" RepeatDirection="Horizontal" ForeColor="ForestGreen" Visible="false">
								<asp:ListItem Text="first" Value="first" Selected="True"></asp:ListItem>
								<asp:ListItem Text="last" Value="last"></asp:ListItem>
							</asp:RadioButtonList>

						</td>

					</tr>
				</table>

			</asp:Panel>
		</td>
	</tr>
	<tr>
		<td colspan="2">
				<asp:Panel ID="panel_meas" runat="server">

					<asp:GridView ID="gvMeasures" runat="server" AutoGenerateColumns="false" Visible="false">
						<Columns>
							<asp:TemplateField HeaderText="Select">
								<ItemTemplate>
									<asp:CheckBox ID="chkMeasSelect" runat="server" Checked="false" />
								</ItemTemplate>
							</asp:TemplateField>
							<asp:BoundField DataField="tblname" Visible="false" />
							<asp:BoundField DataField="measureID" Visible="false"/>
							<asp:BoundField DataField="measname" HeaderText="Measure" ItemStyle-Font-Bold="true" />
							<asp:BoundField DataField="TimePoints" HeaderText="TimePoints"  />
							<asp:BoundField DataField="studymeas_csv"  Visible="false" />
							<asp:BoundField DataField="meascat" HeaderText="Category" />
							<asp:BoundField DataField="measresp" HeaderText="Respondent"/>
							<asp:BoundField DataField="measfocus" HeaderText="Measure Focus" />
							<asp:HyperLinkField NavigateUrl='~/Info/MeasureInfo.aspx?measureID=" + <%#   Eval("measureID") %> ' />

						</Columns>
					</asp:GridView>



				</asp:Panel>
		</td>
	</tr>
		<tr>
		<td colspan="2">

			<asp:UpdatePanel ID="panel_subjects" runat="server" UpdateMode="Conditional" Visible="false">
				<ContentTemplate>
				<asp:Label ID="lblSUBJECTS" runat="server" Text="Subjects" Font-Bold="true" Font-Size="Medium" ></asp:Label>
				<asp:Button ID="btnSUBJECTS" runat="server" Text="Show"  ForeColor="Silver" BackColor="WhiteSmoke" BorderStyle="None" Font-Size="XX-Small" 
				OnClick="btnSUBJECTS_Click" Visible="false" ></asp:Button>

					<obout:Grid ID="gridSUBJECTS" runat="server"  PageSize="-1" AllowAddingRecords="false"  Width="80%"  ></obout:Grid>
				</ContentTemplate>
			</asp:UpdatePanel>
		</td>
	</tr>
		<tr>
		<td colspan="2">

			<asp:UpdatePanel ID="panel_datadict" runat="server" UpdateMode="Conditional" Visible="false">
				<ContentTemplate>
				<asp:Label ID="lblDATADICT" runat="server" Text="Data Dictionary" Font-Bold="true" Font-Size="Medium" ></asp:Label>
				<asp:Button ID="btnDATADICT" runat="server" Text="Hide"  ForeColor="Silver" BackColor="WhiteSmoke" BorderStyle="None" Font-Size="XX-Small" 
				OnClick="btnDATADICT_Click" Visible="false" ></asp:Button>

					<obout:Grid ID="gridDATADICT" runat="server" PageSize="-1" AllowAddingRecords="false" Width="80%" ></obout:Grid>
				</ContentTemplate>
			</asp:UpdatePanel>

		</td>
	</tr>
</table>


 
<asp:Panel ID="panel1" runat="server"></asp:Panel>

<asp:Panel ID="Panel_descstats" runat="server"></asp:Panel>

<asp:Panel ID="panel_meas_data" runat="server"></asp:Panel>

	
<asp:Panel ID="panel_foo" runat="server"></asp:Panel>

</asp:Content>