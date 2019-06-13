<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="NewStudy.aspx.cs" Inherits="Admin_NewStudy" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%--<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="Obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.TreeView" Assembly="Obout.Ajax.UI" %>--%>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableViewState="true"></asp:ScriptManager>


	<dx:ASPxLabel ID="lblNew" runat="server" Text="Create New Study" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
	
	<br /><br />
	<dx:ASPxComboBox ID="cboLab" runat="server" Caption="Lab" TextField="labname" ValueField="labID"> 
	</dx:ASPxComboBox>
	<br />
	<dx:ASPxTextBox ID="txtName" runat="server" Text="" Caption="Study Name:" CaptionCellStyle-Width="120px" 
		ValidationSettings-RegularExpression-ValidationExpression=".{3,20}" Width="120"
		ValidationSettings-RegularExpression-ErrorText="Must be between 3 and 20 characters.">
	</dx:ASPxTextBox>
	<br />
	<dx:ASPxTextBox ID="txtNameFull" runat="server" Text="" Caption="Study Full Name:" CaptionCellStyle-Width="120px" Width="400px"
		ValidationSettings-RegularExpression-ValidationExpression=".{3,150}" 
		ValidationSettings-RegularExpression-ErrorText="Must be between 3 and 150 characters.">
	</dx:ASPxTextBox>
	<br />
	<dx:ASPxButton ID="btnNew" runat="server" Text="Create" OnClick="btnNew_OnCLick"></dx:ASPxButton>

</asp:Content>

