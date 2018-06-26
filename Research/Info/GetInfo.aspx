<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="GetInfo.aspx.cs" Inherits="Info_GetInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">


    <br />
    <asp:Label ID="Label3" runat="server" Text="Download Database Information" Font-Bold="true" Font-Size="12pt"></asp:Label>

    <br />
    <table>
        <tr>
            <td style="vertical-align:top" width="200px">
            <asp:Label ID="Label2" runat="server" Text="Select studies"></asp:Label> <br />
                <asp:ListBox ID="lstStudies" runat="server" SelectionMode="Multiple" Rows="12"></asp:ListBox>
            </td>
            <td style="vertical-align:top"  width="200px">
            <asp:Label ID="Label1" runat="server" Text="Information to download:"></asp:Label> <br />
            <asp:DropDownList ID="ddlInfoType" runat="server">
                <asp:ListItem Text="--Select--" Value="--Select--" />
                <asp:ListItem Text="Mailing list" Value="spGetMailingList" />
            </asp:DropDownList>

            </td>
            <td style="vertical-align:top" width="200px">
            <asp:Button ID="btnGetInfo" runat="server" Text="Download to Excel" OnClick="btnGetInfo_Click" />

            </td>
        </tr>
    </table>


    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label><br />
        <asp:GridView ID="gv" runat="server"></asp:GridView>
    </asp:Panel>

</asp:Content>

