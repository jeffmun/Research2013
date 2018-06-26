
<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Tracking.aspx.cs" AutoEventWireup="true"
 Inherits="Info_Tracking" Title="Tracking Info"  %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style>  p {color: DarkBlue; }
  .fs14 {    font-size: 12px;  }
</style>
	 

<%--from :  http://stackoverflow.com/questions/14746564/asp-net-get-screen-width?rq=1--%>
	<input type="hidden" value=""
   name="clientScreenHeight" id="clientScreenHeight" />
<input type="hidden" value=""
   name="clientScreenWidth" id="clientScreenWidth" />



 
 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>

<table>
<tr><td colspan="4">
	<asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
	<asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>

</td>  </tr>

</table>


	<%--CheckBox Selectors--%>
	<table>
		<tr>            
			<td style="vertical-align:top">
				<asp:Label ID="lbl01" runat="server" Text="Select Info To View..." Font-Size="X-Small" ForeColor="Navy"></asp:Label>
				<br />
				<asp:RadioButtonList id="RadioButtonList_mode" runat="server"  Font-Size="Small" ForeColor="Navy" AutoPostBack="true" 
					OnSelectedIndexChanged="RadioButtonList_mode_SelectedIndexChanged">
					<asp:ListItem Value="S" Selected="True">Subjects</asp:ListItem>
					<asp:ListItem Value="A">Actions</asp:ListItem>
					<asp:ListItem Value="M">Measures</asp:ListItem>
					<asp:ListItem Value="C">Consents</asp:ListItem>
				</asp:RadioButtonList>
				<br />
				<br />

				<asp:RadioButtonList id="RadioButtonList_IDplacement" runat="server" Visible="false">
					<asp:ListItem Value="row" Selected="True">ID's as Rows</asp:ListItem>
					<asp:ListItem Value="col">ID's as Columns</asp:ListItem>
				</asp:RadioButtonList>
					<br/>
				<asp:Button ID="btnInfo" runat="server" Text="LOAD" CommandName="Info" CommandArgument="x" OnCommand="Process_Button_Command" />

			</td>

			<td style="vertical-align:top">
				<asp:Panel ID="p_group" runat="server"></asp:Panel>


			</td>
			<td style="vertical-align:top">
				<asp:Panel ID="p_subjstatus" runat="server"></asp:Panel>
			</td>
			<td style="vertical-align:top">
				<asp:Panel  ID="p_id" runat="server" ScrollBars="Vertical" Height="200px" BorderColor="WhiteSmoke" Visible="false"
					BorderWidth="1" BorderStyle="Solid"></asp:Panel>
			</td>
			<td style="vertical-align:top">
				<asp:Panel  ID="p_timepoint" runat="server"  Visible="false"></asp:Panel>
			</td>
			<td style="vertical-align:top">
				<asp:Panel  ID="p_actiontype" runat="server"  Visible="false"></asp:Panel>
			</td>
			<td style="vertical-align:top">
				<asp:Panel  ID="p_studyaction" runat="server" ScrollBars="Vertical" Height="200px" BorderColor="WhiteSmoke"  Visible="false" 
					BorderWidth="1" BorderStyle="Solid"></asp:Panel>
			</td>
			<td style="vertical-align:top">
				<asp:Panel  ID="p_measure" runat="server" ScrollBars="Vertical" Height="200px" BorderColor="WhiteSmoke" Visible="false"
					BorderWidth="1" BorderStyle="Solid"></asp:Panel>
			</td>
			<td style="vertical-align:top">
				<asp:Panel  ID="p_consent" runat="server"  Visible="false"></asp:Panel>
			</td>
			<td width="10px"></td>

		</tr>
	</table>


	<br/>
	<br/>


	<asp:Label ID="lblInfo" runat="server"></asp:Label>

	<br />
	<br />
<%--	<obout:Grid id="grid1" runat="server" AllowSorting="true" AllowFiltering="true"  AllowAddingRecords="false" AutoGenerateColumns="true" 
		AllowPageSizeSelection="false" PageSize="50" Visible="false"
		 OnRowDataBound="grid1_RowDataBound"   >
		<FilteringSettings FilterPosition="Bottom" />
		<ScrollingSettings ScrollHeight="600" ScrollWidth="95%"  />
		</obout:Grid>--%>

	<asp:Panel ID="Panel_grid" runat="server" Visible="false">
		<obout:Grid id="grid0" runat="server" AutoGenerateColumns="true" AllowGrouping="true" ShowGroupsInfo="true"  AllowSorting="true" AllowFiltering="true"
			AllowAddingRecords="false" AllowColumnResizing="false" AllowPageSizeSelection="true" PageSize="30" 
			FolderStyle="~/App_Obout/Grid/styles/gray_glass"
		   OnColumnsCreated="grid0_ColumnsCreated" OnRowDataBound="grid0_RowDataBound">
			<FilteringSettings FilterLinksPosition="Bottom" FilterPosition="Bottom" />
		<ScrollingSettings ScrollWidth="1000"   />
		<Templates>
			<obout:GridTemplate runat="server" ID="Template1">
				<Template><span><%# Container.Value %></span></Template>
			</obout:GridTemplate>
		</Templates>
	</obout:Grid>
		</asp:Panel>

	<%--        <ScrollingSettings ScrollWidth="1000"  NumberOfFixedColumns="2" FixedColumnsPosition="Left" />--%>

		<br />
	<br />



	<br /><br />
	<asp:Panel ID="panel_test" runat="server"></asp:Panel>





	 <script type="text/javascript">
		// Copy this JavaScript code to the bottom of your page (right before the closing </form> tag):

		oboutGrid.prototype._assignBodyEvents = oboutGrid.prototype.assignBodyEvents;
		oboutGrid.prototype.assignBodyEvents = function () {
			this._assignBodyEvents();

			this._autoResizeColumns();
		}

		oboutGrid.prototype._getColumnWidth = function () {
			var totalWidth = 0;
			for (var i = 0; i < this.ColumnsCollection.length; i++) {
				if (this.ColumnsCollection[i].Visible) {
					totalWidth += this.ColumnsCollection[i].Width;
				}
			}

			return totalWidth;
		}

		oboutGrid.prototype._autoResizeColumns = function () {
			var columnWidths = new Array();
			var body = this.getBodyTableBody();

			for (var i = 0; i < this.ColumnsCollection.length; i++) {
				var headerCell = this.getHeaderCell(i);
				var extraWidth = headerCell.firstChild.offsetWidth - headerCell.firstChild.firstChild.offsetWidth;
				var maxWidth = headerCell.firstChild.firstChild.firstChild.offsetWidth + extraWidth;

				for (j = 0; j < body.childNodes.length; j++) {
					var bodyCell = body.childNodes[j].childNodes[i];
					var extraWidth = bodyCell.firstChild.offsetWidth - bodyCell.firstChild.firstChild.offsetWidth;
					var cellWidth = bodyCell.firstChild.firstChild.firstChild.offsetWidth + extraWidth;

					if (cellWidth > maxWidth) {
						maxWidth = cellWidth;
					}
				}

				columnWidths.push(maxWidth - this.ColumnsCollection[i].Width);
			}

			for (var i = 0; i < columnWidths.length; i++) {
				this.resizeColumn(i, columnWidths[i] + 20, false);
			}

			var width = this._getColumnWidth();
			this.GridMainContainer.style.width = width + 'px';
		}
	</script>
 
</asp:Content>
