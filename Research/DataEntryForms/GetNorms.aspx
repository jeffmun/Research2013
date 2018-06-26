<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="GetNorms.aspx.cs" Inherits="DataEntryForms_GetNorms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">


    <br />
    <asp:Label ID="lblTitle" runat="server" Text ="UWAC DB Norms Tables" Font-Bold="true"></asp:Label>
    <br />
    <br />
    <asp:ListBox ID="lstTables" runat="server" Height="300px" ViewStateMode="Enabled"></asp:ListBox>
    <asp:Button ID="btnDownload" runat="server" Text="Download" OnClick="btnDownload_Click"  />
    <asp:Button ID="btnView" runat="server" Text="View Tables" OnClick="btnView_Click"  />

    <br />
    <br />
    <asp:Panel ID="panelViewTables" runat="server"></asp:Panel>

</asp:Content>

