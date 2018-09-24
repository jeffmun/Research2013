<%@ Page Title="Data Project Stats" Language="C#" EnableEventValidation="false" MasterPageFile="~/UWAC.master"
	 AutoEventWireup="true" CodeFile="MeasureStats.aspx.cs" Inherits="stats_MeasureStats" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

	<style type="text/css">
		.GridViewClass td,th
		{
			padding-left:10px;
			padding-right:10px;
		}
	</style>

	
	<br />

	<%--TokenBoxes--%>
	<table>
		<tr>
			<td style="vertical-align:top">
				
				<table>
				<tr>
					<td style="vertical-align:top" style="width: 220px;">
						<asp:Label ID="Label3" runat="server" Text="Select Measures:" Font-Bold="true" Font-Size="Medium"></asp:Label>
					</td>
					<td>
						<dx:ASPxTokenBox ID="MeasTokenBox" runat="server" ItemValueType="System.String" ShowDropDownOnFocus="Always" Width="400" AllowCustomTokens="false"></dx:ASPxTokenBox>
					</td>
				</tr>
				<tr>
					<td>
						<asp:Label ID="Label5" runat="server" Text="Select TimePoints:" Font-Bold="true" Font-Size="Medium"></asp:Label>
					</td>
					<td>
						<dx:ASPxTokenBox ID="TimepointTokenBox" runat="server" ItemValueType="System.String" ShowDropDownOnFocus="Always" Width="400" AllowCustomTokens="false"></dx:ASPxTokenBox>
					</td>
				</tr>
				<tr>
					<td>
						<asp:Label ID="Label6" runat="server" Text="Select Groups:" Font-Bold="true" Font-Size="Medium"></asp:Label>
					</td>
					<td>
						<dx:ASPxTokenBox ID="GroupTokenBox" runat="server" ItemValueType="System.String" ShowDropDownOnFocus="Always"  Width="400" AllowCustomTokens="false"></dx:ASPxTokenBox>
					</td>
				</tr>
				<tr>
					<td>
						<asp:Label ID="Label7" runat="server" Text="Select Subject Status:" Font-Bold="true" Font-Size="Medium"></asp:Label>
					</td>
					<td>
						<dx:ASPxTokenBox ID="SubjstatusTokenBox" runat="server" ItemValueType="System.String" ShowDropDownOnFocus="Always"  Width="400" AllowCustomTokens="false"></dx:ASPxTokenBox>
					</td>
				</tr>
					<tr>
						<td style="vertical-align:top">
							<br /><br />
							<asp:Label ID="Label8" runat="server" Text="Select Grouping Vars:" Font-Bold="true" Font-Size="Medium"></asp:Label>
						</td>

						<td  style="vertical-align:top">
							<br /><br />
							<dx:ASPxTokenBox ID="DescByTokenBox" runat="server" ItemValueType="System.String" ShowDropDownOnFocus="Always"  Width="300" AllowCustomTokens="false"></dx:ASPxTokenBox>
						</td>
					</tr>

	</table>

			</td>
			<td  style="vertical-align:top">
				<table>
					<tr>
						<td style="vertical-align:top" style="width: 20px">
							
						</td>

						<td  style="vertical-align:top">
							<asp:Button ID="btnGetDescstats" runat="server" Text="Display Descriptive Stats" OnClick="btnGetDescstats_Click"  />
							<br /><br /><br />
							<asp:Button ID="btnGetNs" runat="server" Text="Display N's" OnClick="btnGetNs_Click"  />
							<br /><br /><br />

							<asp:Button ID="btnReturn" runat="server" Text="Return to Measure List" Visible="false"  />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>



	
		<br />
		<br />
	
	<asp:Panel ID="panel0" runat="server"></asp:Panel>

		<br />
		<br />


	<asp:Label ID="lblMeas" runat="server" Text="Measure" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<asp:Panel ID="panelMeasures" runat="server"></asp:Panel>
	
	<br />
	<br />
		<asp:Label ID="Label2" runat="server" Text="Variables" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<asp:Panel ID="panelVariables" runat="server"></asp:Panel>

		<br />
	<br />
		<asp:Label ID="lblMode" runat="server" Text="" Font-Bold="true" Font-Size="Large"></asp:Label>
	<asp:Panel ID="panel1" runat="server">

	</asp:Panel>

	</asp:Content>