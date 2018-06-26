<%@ Page Title="Data Project Stats" Language="C#" EnableEventValidation="false" MasterPageFile="~/UWAC.master"
	 AutoEventWireup="true" CodeFile="DataProjectStats.aspx.cs" Inherits="stats_DataProjectStats" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>


	


	<table>
		<tr>
			<td style="vertical-align:top" style="width: 400px;">
				<asp:Panel ID="panel0" runat="server"></asp:Panel>

			</td>
			<td valign="middle" >
				<asp:Button ID="btnReturn" runat="server" Text="Return to Data Project"  />
			</td>
		</tr>
	</table>
		<br />
		<br />


	<asp:Label ID="lblMeas" runat="server" Text="Measures" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<asp:Panel ID="panelMeasures" runat="server"></asp:Panel>
	
	<br />
	<br />
		<asp:Label ID="Label2" runat="server" Text="Measures & Variables" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<asp:Panel ID="panelVariables" runat="server"></asp:Panel>

		<br />
	<br />
		<asp:Label ID="Label1" runat="server" Text="Decsriptive Statistics" Font-Bold="true" Font-Size="Large"></asp:Label>
	<asp:Panel ID="panel1" runat="server">

	</asp:Panel>

	</asp:Content>