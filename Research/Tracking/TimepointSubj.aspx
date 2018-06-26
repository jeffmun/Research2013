<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="TimepointSubj.aspx.cs" Inherits="Tracking_TimepointSubj"
	Title="Timepoints by Subject"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"  ></asp:ScriptManager>

	

	
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
					totalWidth += this.ColumnsCollection[i].Width ;
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
				var maxWidth = headerCell.firstChild.firstChild.firstChild.offsetWidth + extraWidth + 1;

				for (j = 0; j < body.childNodes.length; j++) {
					var bodyCell = body.childNodes[j].childNodes[i];
					var extraWidth = bodyCell.firstChild.offsetWidth - bodyCell.firstChild.firstChild.offsetWidth;
					var cellWidth = bodyCell.firstChild.firstChild.firstChild.offsetWidth + extraWidth + 1;

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
	
	
	<asp:Label ID="lblTitle" runat="server" Text="PATH Assessment & Treatment Dates" Font-Bold="true" Font-Size="Medium"></asp:Label>
	<br />
		<asp:Panel ID="panel1" runat="server"></asp:Panel>

	<br />
	<obout:Grid ID="ogrid" runat="server" PageSize="-1"  AllowColumnResizing="false" OnColumnsCreated="ogrid_ColumnsCreated">
		<Templates>
			<obout:GridTemplate runat="server" ID="Template1">
				<Template><span><%# Container.Value %></span></Template>
			</obout:GridTemplate>
		</Templates>
	</obout:Grid>
	<br />
	<br />


	<asp:Panel ID="panelCharts" runat="server"></asp:Panel>

</asp:Content>

