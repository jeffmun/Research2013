
<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master"  AutoEventWireup="true" 
	CodeFile="StartBal.aspx.cs" Inherits="Fin_StartBal" Title="Starting Balances"  %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

		<obout:Grid ID="grid" runat="server"    AllowPageSizeSelection="false" AllowAddingRecords="false" AutoGenerateColumns="true">
	</obout:Grid>






</asp:Content>