<%@ Page Title="GEV ID's" Language="C#" Debug="true" EnableEventValidation="false" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="ids_gev.aspx.cs" Inherits="Genetics_ids_gev" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">


    <asp:Label ID="Label2" runat="server" Text="Search ID's for Gene Events" Font-Bold="true" Font-Size="12"></asp:Label><br />

        <br /><br />
    <asp:ListBox ID="lstStudies" runat="server" Visible="false"></asp:ListBox>
    <asp:ListBox ID="lstSites" runat="server"  Visible="false"></asp:ListBox>

    <asp:DropDownList ID="ddlStudies" runat="server"  Visible="false"></asp:DropDownList>
    <asp:DropDownList ID="ddlSites" runat="server"  Visible="false"></asp:DropDownList>

    <asp:Label ID="Label1" runat="server" Text="Enter ID:"></asp:Label><br />
    <asp:TextBox ID="txtIDToFind" runat="server"></asp:TextBox>

    <asp:Button ID="btnFindID" runat="server" Text="Find ID" OnClick="btnFindID_Click" />

    <br /><br />
    <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Blue"></asp:Label>
    <br /><br />
    <asp:GridView ID="gv" runat="server" OnRowDataBound="gv_RowDataBound"></asp:GridView>

</asp:Content>