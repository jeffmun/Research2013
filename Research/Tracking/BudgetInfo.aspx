<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="BudgetInfo.aspx.cs" AutoEventWireup="true"
 Inherits="Tracking_BudgetInfo" Title="Budget Info"  %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>


    <br />
    <br />

    <asp:Panel ID="panel1" runat="server"></asp:Panel>


</asp:Content>
