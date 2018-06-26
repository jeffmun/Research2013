<%@ Page Title="" Debug="true" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="compare.aspx.cs" Inherits="stats_compare" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">


    <br />
    <br />
                <asp:Button ID="btnView" runat="server" Text="View schema" OnClick="btnView_Click" />
    <br />
    tbl:<asp:TextBox ID="txtTbl" runat="server" Text="tblAddress"></asp:TextBox>  
                    <asp:Button ID="btnUpdateData" runat="server" Text="Update Data" OnClick="btnUpdateData_Click" />

<br />
<br />

    <table>
        <tr>
            <td width ="200px">
                <asp:Label ID="Label2" runat="server" Text="Schema:" Font-Size="XX-Small"></asp:Label>
                   <asp:TextBox ID="txtSchema" runat="server"  Text="trk"  Width="40px"></asp:TextBox>
            </td>
            <td width ="200px">
                <asp:Button ID="btnClear" runat="server" Text="Clear selections" OnClick="btnClear_Click" Visible="false" />
            </td>
            <td>
                <asp:Button ID="btnCompare" runat="server" Text="Compare" OnClick="btnCompare_Click" />
            </td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save Difs to Excel" OnClick="btnSave_Click1" />
            </td>
        </tr>
        <td>
            <asp:Label ID="lblN" runat="server" Text="process from:" Font-Size="XX-Small"></asp:Label>
            <asp:TextBox ID="txtN1" runat="server" Text="130" Width="40px" Font-Size="X-Small"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text=" to:" Font-Size="XX-Small"></asp:Label>
            <asp:TextBox ID="txtN2" runat="server" Text="132" Width="40px" Font-Size="X-Small" ></asp:TextBox>
        </td>
        <td></td>
        <td></td>
    </table>

    <br />
    <asp:Label ID="lblInfo" runat="server"></asp:Label>
<br />

    <table>
        <tr>
            <td style="vertical-align:top">
                    <asp:GridView ID="gvTables" runat="server" AutoGenerateColumns="true" ViewStateMode="Enabled">
                    </asp:GridView>

            </td>
            <td width="10px"></td>
            <td style="vertical-align:top">
                <asp:Label ID="Label5" runat="server" Text="Matches" Font-Bold="true" Font-Size="XX-Small"></asp:Label>
                <asp:Panel ID="Panel_match" runat="server"></asp:Panel>
            </td>
            <td style="vertical-align:top">
                <asp:Label ID="Label3" runat="server" Text="Diffs in Rows & Data" Font-Bold="true" Font-Size="XX-Small"></asp:Label>
                <asp:Panel ID="Panel_rows" runat="server"></asp:Panel>
            </td>
            <td style="vertical-align:top">
                <asp:Label ID="Label4" runat="server" Text="Diffs in Columns" Font-Bold="true" Font-Size="XX-Small"></asp:Label>
                <asp:Panel ID="Panel_cols" runat="server"></asp:Panel>
            </td>

        </tr>
    </table>

</asp:Content>

