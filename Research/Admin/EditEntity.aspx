<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="EditEntity.aspx.cs" Inherits="Admin_EditEntity" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register TagPrefix="ogrid" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %> 

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">



<%--		<script type="text/javascript">
			function SelectDetail(oRecord) {
				var pkvalue = parseInt(oRecord[0].master_pk);

				// load selected Customer details 
				ob_post.AddParam("pkvalue", pkvalue);
				ob_post.post(null, "Log_pkvalue", UpdateDetails);
				//document.getElementById("order_label").innerHTML = "Orders made by " + oRecord[0].CustomerName;
			}

			function UpdateDetails() {
				//var ogrid_detail = document.getElementById("ogrid_detail");

				ogrid_detail.refresh();
			}
		</script>--%>

	<br />
<asp:Label ID="lblStudy" runat="server" Text="" Font-Size="Large" Font-Bold="true" ForeColor="ForestGreen"></asp:Label><br />
<br />


<asp:Label ID="lblTitle" runat="server" Text="Here you can add/edit records in the following table." Font-Size="Medium" Font-Bold="true"></asp:Label><br />
<asp:Label ID="Label1" runat="server" Text="You must complete each of the required fields that are listed in the top row of the table below." Font-Size="Small" Font-Bold="false"></asp:Label>
<br />
<br />

<table>
	<tr>
		<td>
			<asp:Label ID="lblEntity" runat="server" Font-Size="Large" Font-Bold="true"></asp:Label>
			<br />
			<asp:Label ID="lblOutput" runat="server" Font-Size="Small" ForeColor="Blue"></asp:Label>
		</td>
		<td></td>
		<td>
			<asp:Label ID="lblEntity_detail" runat="server" Font-Size="Large" Font-Bold="true"></asp:Label>
			<br />
			<asp:Label ID="lblOutput_detail" runat="server" Font-Size="Small" ForeColor="Blue"></asp:Label>
		</td>
	</tr>

<tr>

<%--    OnColumnsCreated="ogrid_ColumnsCreated"--%>

<%--    			<ClientSideEvents OnClientSelect="SelectDetail"  />--%>

	<td style="vertical-align:top">
		<obout:Grid ID="ogrid" runat="server"    CallbackMode="false" Serialize="true" AutoGenerateColumns="true" AllowAddingRecords="true" 
				OnInsertCommand="ogrid_InsertCommand" OnUpdateCommand="ogrid_UpdateCommand"   OnColumnsCreated="ogrid_ColumnsCreated" OnRebind="ogrid_Rebind" 
			   AllowSorting="true" PageSize="-1"  AllowColumnResizing="false"   ShowFooter="false" ViewStateMode="Enabled"
			 FolderStyle="~/App_Obout/Grid/styles/gray_glass">
			<AddEditDeleteSettings NewRecordPosition="Top" AddLinksPosition="Top"  />

			<Templates >
				<obout:GridTemplate runat="server" ID="Template1" >
					<Template><span><%# Container.Value %></span></Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>


				<dx:ASPxGridView ID="Grid1" runat="server"    CallbackMode="false" Serialize="true" AutoGenerateColumns="true" AllowAddingRecords="true" 
				
			   AllowSorting="true" PageSize="-1"  AllowColumnResizing="false"   ShowFooter="false" ViewStateMode="Enabled">
			
			
		</dx:ASPxGridView>


<%--        			<Columns>
				<obout:Column AllowEdit="true" Width="100px"></obout:Column>
			</Columns>--%>


	</td>
    <td style="width:30px"></td>
			<td style="vertical-align:top">
				<br /><br /><br />
			<asp:Button ID="btnLoadDetails" runat="server" Text=" >> Load Details >>" OnClick="btnLoadDetails_Click" />
		</td>
    <td style="width:30px"></td>


<%--    OnRowDataBound="ogrid_detail_RowDataBound"--%>
	<td style="vertical-align:top">
			<obout:Grid ID="ogrid_detail" runat="server"  CallbackMode="false" Serialize="true" AutoGenerateColumns="true" AllowAddingRecords="true"
				OnInsertCommand="ogrid_detail_InsertCommand" OnUpdateCommand="ogrid_detail_UpdateCommand" OnRebind="ogrid_detail_Rebind" 
				
		   AllowSorting="true" PageSize="-1"  AllowColumnResizing="false"   OnColumnsCreated="ogrid_detail_ColumnsCreated" ShowFooter="false" Visible="false"
				 FolderStyle="~/App_Obout/Grid/styles/gray_glass">
		<AddEditDeleteSettings NewRecordPosition="Top" AddLinksPosition="Top" />
				<Templates>
			<obout:GridTemplate runat="server" ID="Template2">
				<Template><span><%# Container.Value %></span></Template>
			</obout:GridTemplate>
		</Templates>
	</obout:Grid>


	</td>
</tr>

	</table>

	<br />
	<br />






	
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

