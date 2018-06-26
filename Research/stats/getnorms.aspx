<%@ Page Title="" Debug="true" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="getnorms.aspx.cs" Inherits="stats_getnorms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">


    <br />
    <br />

    <table>
        <tr>
            <td width ="200px">
                <asp:Button ID="btnView" runat="server" Text="View selected" OnClick="btnView_Click" />
            </td>
            <td width ="200px">
                <asp:Button ID="btnClear" runat="server" Text="Clear selections" OnClick="btnClear_Click" />
            </td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save selected to Excel" OnClick="btnSave_Click" />
            </td>
        </tr>
        <td>
            <asp:Label ID="lblN" runat="server" Text="# rows to display:" Font-Size="XX-Small"></asp:Label>
            <asp:TextBox ID="txtN" runat="server" Text="30" Width="50px" Font-Size="X-Small"></asp:TextBox>
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
                    <asp:GridView ID="gvTables" runat="server" AutoGenerateColumns="false" ViewStateMode="Enabled">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>Table</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk" runat="server" ViewStateMode="Enabled" />
<%--                                    <asp:Label ID="table_name" runat="server" Text='<%# Eval("table_name")%>' />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField  HeaderText="Table" DataField="table_name" />

                        </Columns>
                    </asp:GridView>

            </td>
            <td width="50px"></td>
            <td style="vertical-align:top">
                <asp:Panel ID="Panel" runat="server"></asp:Panel>
            </td>
        </tr>
    </table>

</asp:Content>

