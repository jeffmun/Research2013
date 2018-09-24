<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="ProcessData.aspx.cs" Inherits="Study_AVH_ProcessData" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableViewState="true"></asp:ScriptManager>

	<dx:ASPxLabel ID="lblNew" runat="server" Text="Process Data" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
	
	<br />

	<br />
	<dx:ASPxButton ID="btnProcessSurvey" runat="server" Text="Process Survey Data" OnClick="btnProcessSurvey_OnCLick"></dx:ASPxButton>


	<br />
	<br />
	<asp:Panel ID="panelTable" runat="server" Visible="false">
		<br />
		
	</asp:Panel>


	<dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="true"></dx:ASPxGridView>

</asp:Content>

