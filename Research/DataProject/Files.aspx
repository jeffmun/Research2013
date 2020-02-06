<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="Files.aspx.cs" Inherits="DataProject_Files" 
	 EnableEventValidation="false" Title="Data Project Files"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<%--<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> --%>

	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-ui.min.js"></script>


</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

	<style type="text/css">
		.maxWidth {
			max-width:450px;
		}
		.editor {
			padding-bottom: 8px;
			padding-right: 1px;
			width: 100%;
		} 
		.container {
			display: table;
			width: 100%;
		}
		@media(min-width:500px) {
			.container > * {
				display: table-cell;
				vertical-align: top;
			}
			.editor {
				vertical-align: middle;
				width: 110px;
				padding-right: 10px;
				padding-bottom: 0;
			}
		}
		.lastEditor {
			padding-right: 0; 
			padding-bottom: 0px;
		}
	</style>

	<script type="text/javascript">
		function DeleteVar(s, e)
		{
			var x = s.GetRowValues(e.visibleIndex, "fldpk", UnselectVarInGrid);
		}

		function UnselectVarInGrid(key)
		{
			gridSelVars.UnselectRowsByKey(key);
		}

		function SubjsetSelectionChanged(s, e) {

			gridSubjCallback.PerformCallback();
			//varCallback.PerformCallback();
		}
		function MeasSelectionChanged(s, e) {

			var num = gridSelMeas.GetSelectedRowCount();
			selmeas_n.SetText("(" + num + " selected)");
			selmeas_n2.SetText("(" + num + " selected)");
			//hideResults();

			//This will update the Meas pivot table
			gridMeasCallback.PerformCallback();

			//This will update the gridSelMeas
			gridVarsCallback.PerformCallback();
		}
		function VarSelectionChanged(s, e) {

			var num = gridSelVars.GetSelectedRowCount();
			selvars_n.SetText("(" + num + " selected)");
			selvars_n2.SetText("(" + num + " selected)");


			pivotVarsCallback.PerformCallback();

		}

		function VartypeChanged(s, e)
		{
			var x = rblVartype.GetValue();
			//gridVarsCallback.PerformCallback();
		}

	
		function ShowSelected(s, e) {
			var value = s.GetChecked();
			if (value) {
				gridSelSubj.SetVisible(true);
				gridSelMeas.SetVisible(true);
				gridSelVars.SetVisible(true);
			}
			else {
				gridSelSubj.SetVisible(false);
				gridSelMeas.SetVisible(false);
				gridSelVars.SetVisible(false);
			}
		}

	</script>

	

	<dx:ASPxHiddenField ID="needBindVars" runat="server" ClientInstanceName="needBindVars">
	</dx:ASPxHiddenField>



	<dx:ASPxLabel ID="lbl0" runat="server" Text="Data Project Files" Font-Size="Medium" Font-Bold="true" ForeColor="Gray"></dx:ASPxLabel>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<dx:ASPxLabel ID="lblPK" runat="server" Text="" Font-Size="Medium" Font-Bold="true" ForeColor="Gray"></dx:ASPxLabel>
	<br />
	<br />

	<table>
		<tr>
			<%--    First Column with TextBoxes--%>
		<td style="width: 425px; vertical-align: top">
				<dx:ASPxLabel ID="lblTitle0" runat="server" Text="Title:" Font-Size="XX-Small"></dx:ASPxLabel>
				<dx:ASPxLabel ID="lblTitle" runat="server" Width="400px" Font-Size="Medium"></dx:ASPxLabel><br />

				<br />
				<dx:ASPxLabel ID="lblStatus" runat="server" Text=""  Font-Size="XX-Small"></dx:ASPxLabel>
			</td>

			<%--    Buttons --%>
			<td>
					<table>
					<tr>
						<td style="vertical-align: top;  width: 250px">
						<dx:ASPxButton ID="btnEdit" runat="server" Text="Edit This Project" 
							OnClick="btnEdit_OnClick" ClientInstanceName="btnEdit">
							 <Image IconID="actions_edit_16x16devav"></Image>
						</dx:ASPxButton>

						</td>
						<td style="vertical-align: top;  width: 250px">
						<dx:ASPxButton ID="btnExplore" runat="server" Text="Explore This Project" 
							OnClick="btnExplore_OnClick" ClientInstanceName="btnExplore">
							 <Image IconID="actions_viewsetting_16x16devav"></Image>
						</dx:ASPxButton>

						</td>
						<td style="vertical-align: top; width: 200px">
						<dx:ASPxButton ID="btnCreate" runat="server" Text="Create New Excel Data File" 
							OnClick="btnCreate_OnClick" ClientInstanceName="btnCreate">
							 <Image IconID="export_exporttoxlsx_16x16office2013"></Image>
						</dx:ASPxButton>

						<br />
							<dx:ASPxCheckBox ID="chkSepTabs" runat="server" Text="Measures on separate tabs?"></dx:ASPxCheckBox>
						</td>
						<td style="width: 50px"></td>
						<td style="vertical-align: top">
						<td style="width: 50px"></td>
							<td style="vertical-align: top">
							<dx:ASPxButton ID="btnProjects" runat="server" Text="Return To All Data Projects"   ClientInstanceName="btnSets" AutoPostBack="False">
								 <clientsideevents click="function(s, e) {document.location.href = 'Index.aspx';}"></clientsideevents>
								<Image IconID="actions_changeview_16x16devav"></Image>
							</dx:ASPxButton>
						</td>

					</tr>
				</table>


			</td>
		</tr>
	</table>



	<br />
	<br />
	<asp:GridView ID="gvViewDatafiles" runat="server" AutoGenerateColumns="false" CellPadding="5" CellSpacing="5" BorderStyle="Solid" 
							BorderColor="Silver" EmptyDataText="No data files created yet." >
						<Columns>
							<asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Download Data File">
								<ItemTemplate>
									<asp:Button ID="btnDownloadExistingFile" runat="server" Text=".xlsx" Font-Size="XX-Small" OnCommand="btnDownloadExistingFile_Command" 
										  CommandName="DownloadExistingFile"  CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[filename]") %>' />
									<asp:Button ID="Button1" runat="server" Text=".xls" Font-Size="XX-Small" OnCommand="btnDownloadExistingFile_Command" 
										  CommandName="DownloadExistingFile_xls"  CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[filename]") %>' Visible="false" />
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="View XLSX" Visible="true">
								<ItemTemplate>
									<asp:Button ID="btnLoadXLSX" runat="server" Text="View on page" Font-Size="XX-Small" OnCommand="btnDownloadExistingFile_Command" 
										  CommandName="LoadXLSX"  CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[filename]").ToString() %>' />
								</ItemTemplate>
							</asp:TemplateField>
									<asp:BoundField HeaderText="File Name" DataField="filename" />
									<asp:BoundField HeaderText="N subjects" DataField="N_subjects" />
									<asp:BoundField HeaderText="N measures" DataField="N_measures" />
									<asp:BoundField HeaderText="N studymeas" DataField="N_studymeas" />
									<asp:BoundField HeaderText="N data rows" DataField="N_datarows" />
									<asp:BoundField HeaderText="N data rows (other tbls)" DataField="N_other_datarows" />
									<asp:BoundField HeaderText="N data cols" DataField="N_datacols" />
									<asp:BoundField HeaderText="N data dups" DataField="N_data_dups" />

									<asp:BoundField HeaderText="created" DataField="created" DataFormatString="{0:g}" />
									<asp:BoundField HeaderText="Time since created" DataField="TimeSinceCreated" />
									<asp:BoundField HeaderText="createdBy" DataField="createdBy" />

							<asp:TemplateField HeaderText="Delete file">
								<ItemTemplate>
									<asp:Button ID="btnDeleteDatafile" runat="server" Text="Delete" Font-Size="XX-Small" OnCommand="btnDeleteDatafile_Command"
										  CommandName="DeleteDatafile"  CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[filename]") %>' />
								</ItemTemplate>
							</asp:TemplateField>
							
						</Columns>
					</asp:GridView>
	<br />
	<br />

		<dx:ASPxSpreadsheet ID="ASPxSpreadsheet" runat="server" Width="100%" Height="700px" Visible="false" 
			ShowConfirmOnLosingChanges="false">
		
		</dx:ASPxSpreadsheet>

	<br />
	<br />



</asp:Content>


