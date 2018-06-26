<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/UWAC.master"  CodeFile="IDlist.aspx.cs" Inherits="Tracking_IDlist" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <br />
    <br />
    <asp:Label ID="lblLab" runat="server" Text="Select Lab:" ></asp:Label>
    <asp:DropDownList ID="ddlLab" runat="server"></asp:DropDownList>


</asp:Content>

