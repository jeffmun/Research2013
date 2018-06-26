<%@ Page Language="C#" ValidateRequest="false" Debug="True" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="DATAdates.aspx.cs" Inherits="Tracking_DATAdates"
	Title="DATA Dates by Subject"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"  ></asp:ScriptManager>

	


	
<%--	<script type="text/javascript">
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
	--%>
	
	<asp:Label ID="lblTitle" runat="server" Text="DATA Dates: " Font-Bold="true" Font-Size="Medium"></asp:Label>
	<asp:Label ID="lblStudyName" runat="server" Text="" Font-Bold="true" Font-Size="Large" ForeColor="#003399"></asp:Label>
	<br />
	<br />
	<asp:Button ID="btnALL" runat="server" OnClick="btnALL_Click" Text="Show All Subjects" Visible="true" />
	<asp:RadioButtonList ID="rblMode" runat="server" RepeatDirection="Horizontal" >
		<asp:ListItem Value="ToDo" />
		<asp:ListItem Value="NeedFUP" />
		<asp:ListItem Value="Complete" />
		<asp:ListItem Value="Active,Finished"/>
		<asp:ListItem Value="NOT Active,Finished"/>

	</asp:RadioButtonList>
	<br />


	<asp:Button ID="btnALL2" runat="server" CommandName="ShowALL_withPROGRESS" OnCommand="Button_Command"  Text="Show All Subjects with PROGRESS" Visible="true" />
	<asp:Panel ID="panelProgressBar" runat="server" Visible="false">
					
		<asp:Label ID="lblmaxy" runat="server" Text="Progress bar:" Font-Size="XX-Small"></asp:Label>
		<br />

			<eo:ProgressBar ID="ProgressBar1" runat="server" Width="200px" Height="15px" BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px"
				BackColor="White" IndicatorColor="SkyBlue" ShowPercentage="true"
				StartTaskButton="btnALL2"  OnRunTask="getDATADates_for_subjects_with_PROGRESS"  
				></eo:ProgressBar>

		<br /><br />
	</asp:Panel>



	<table>
		<tr>
			<td>
	<asp:DropDownList ID="ddlNewID" runat="server" DataTextField="IDtxt" DataValueField="subjID" OnSelectedIndexChanged="ddlNewID_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

			</td>
			<td width="100px"></td>
			<td>
	<asp:DropDownList ID="ddlDataChk" runat="server" DataSourceID="sqlDataChk" DataValueField="datachkID" DataTextField="datachk" EnableViewState="true"  Visible="false" AutoPostBack="false"></asp:DropDownList>
			</td>
			<td>
				<asp:Button ID="btnUpdateDataChk" runat="server" OnClick="btnUpdateDataChk_Click" Text="Update DataCheck Status" Visible="false" />
			</td>
		</tr>
	</table>

		<br />
		<asp:Panel ID="panel1" runat="server"></asp:Panel>

	<br />
	<asp:Panel ID="panelGrid" runat="server" Visible="false">
	<asp:Label ID="l1" runat="server" Text="Timepoint Dates for subject" Font-Bold="true" Font-Underline="true"></asp:Label>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnRefreshChart" runat="server" Text="Refresh Chart" Font-Size="XX-Small" OnClick="btnRefreshChart_Click" />

		<obout:Grid ID="ogrid" runat="server" PageSize="-1" AutoGenerateColumns="false"  AllowColumnResizing="false"   
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
			</Columns>


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
	<obout:Grid ID="ogrid2" runat="server" PageSize="-1" AutoGenerateColumns="false"  AllowColumnResizing="true"  Visible="false"  
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
		</obout:Grid>
			<br />


	<asp:Panel ID="panelCharts" runat="server"></asp:Panel>

	<asp:SqlDataSource ID="sqlDataChk" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		 SelectCommand="select -1 datachkID, '--Select DataCheck Status--' datachk, -1 sortorder  union select datachkID, datachk, sortorder from uwautism_research_backend..tblDataChk_lkup order by sortorder">

	</asp:SqlDataSource>

</asp:Content>

