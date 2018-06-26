<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="ActionList.aspx.cs" Inherits="Tracking_ActionList" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

        <br />
    <asp:Label ID="lblTitle" runat="server" Text ="Subject Actions:" Font-Bold="true"></asp:Label>
    <asp:Label ID="lblStudy" runat="server" Text ="" Font-Bold="true" Font-Size="Medium"></asp:Label>
    <br />
    <br />
    <asp:ListBox ID="lstActions" runat="server" Height="200px" ViewStateMode="Enabled"></asp:ListBox>
    <asp:Button ID="btnDownload" runat="server" Text="Download" OnClick="btnDownload_Click"  />
    <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click"  />

    <br />
    <br />
    <asp:Panel ID="panelViewActions" runat="server"></asp:Panel>


</asp:Content>

