<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="foo.aspx.cs" Inherits="Testing_foo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">


    <table>
        <tr>
            <td>
                Backend
            </td>
            </tr>
        <tr>
            <td>
                <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="true"></asp:GridView>
            </td>

            </tr>
<tr>
            <td>
                <br /><br /><br /><br />
                VBackend
            </td>

</tr>

        <tr>
            <td>
                <asp:GridView ID="gv2" runat="server" AutoGenerateColumns="true"></asp:GridView>
                <asp:Label ID="lbl2" runat="server" Text="start condition"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>

