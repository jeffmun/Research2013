<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="NewMeasure.aspx.cs" Inherits="Admin_NewMeasure" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableViewState="true"></asp:ScriptManager>

	<asp:Panel ID="panelMeasure" runat="server" Visible="true">
	<dx:ASPxLabel ID="lblNew" runat="server" Text="Create New Measure" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
	
	<br />

		<p>Before creating a new measure go to the <a href="../Track/MeasureLibrary.aspx"><b>Measure Library</b></a> and search to see if it may already exist.</p>

	<br />
	<dx:ASPxTextBox ID="txtName" runat="server" Text="" Caption="Measure Name:" CaptionCellStyle-Width="120px" 
		ValidationSettings-RegularExpression-ValidationExpression="^[a-zA-Z0-9_]*$" Width="120"
		ValidationSettings-RegularExpression-ErrorText="Only letters, numbers, and underscores allowed in the measure name.">
	</dx:ASPxTextBox>
	<br />
	<dx:ASPxTextBox ID="txtNameFull" runat="server" Text="" Caption="Measure Full Name:" CaptionCellStyle-Width="120px" Width="400px"
		ValidationSettings-RegularExpression-ValidationExpression=".{3,100}" 
		ValidationSettings-RegularExpression-ErrorText="Must be between 3 and 100 characters.">
	</dx:ASPxTextBox>
	<br />
	<dx:ASPxButton ID="btnNew" runat="server" Text="Create Measure" OnClick="btnNew_OnCLick"></dx:ASPxButton>
		</asp:Panel>

	<br />
	<br />
	<asp:Panel ID="panelTable" runat="server" Visible="false">
		<br />
		<asp:Label ID="lblNewMeasName" runat="server" Font-Size="Small" Font-Bold="true"></asp:Label>
	<br />
	<dx:ASPxTextBox ID="txtTblName" runat="server" Text="" Caption="Table Name:  " CaptionCellStyle-Width="120px" Width="400px"
		ValidationSettings-RegularExpression-ValidationExpression="^[a-zA-Z0-9_]*$" 
		ValidationSettings-RegularExpression-ErrorText="Only alphanumeric and underscores allowed in the measure name.">
	</dx:ASPxTextBox>
	<br />
	<br />
	<dx:ASPxTextBox ID="txtAbbr" runat="server" Text="" Caption="Table abbreviation:" CaptionCellStyle-Width="120px" Width="120"
		ValidationSettings-RegularExpression-ValidationExpression=".{3,10}" 
		ValidationSettings-RegularExpression-ErrorText="Must be between 3 and 10 characters.">
	</dx:ASPxTextBox>
	<br />
	<dx:ASPxButton ID="btnNewTable" runat="server" Text="Create Table Definition" OnClick="btnNewTable_OnCLick"></dx:ASPxButton>

	</asp:Panel>

	<asp:HiddenField ID="hidNewMeasID" runat="server" />

</asp:Content>

