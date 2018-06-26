<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="connstrings.aspx.cs" Inherits="_test_connstrings" 
     EnableEventValidation="false" Title="Test Conns"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >


 
    <br />
        <asp:Label ID="lblConnStrings" runat="server" Text=""></asp:Label>
    <br />
        <asp:Label ID="LabelUser" runat="server" Text="" ForeColor="Indigo"></asp:Label>

    <table>
        <tr>
            <td><b>1</b></td>
            <td><b>2</b></td>
            <td><b>3</b></td>
        </tr>
        <tr>
            <td>
                <%--<asp:Label ID="usera" runat="server" Text="" ForeColor="Indigo"></asp:Label><br />
                <asp:Label ID="Labela1" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="Labela2" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="Labela3" runat="server" Text=""></asp:Label>--%>
                <asp:Panel ID="panel1" runat="server"></asp:Panel>
            </td>
            <td>
                <asp:Panel ID="panel2" runat="server"></asp:Panel>

            </td>
            <td>
                <asp:Panel ID="panel3" runat="server"></asp:Panel>

            </td>
            <td>
                <asp:Panel ID="panel4" runat="server"></asp:Panel>

            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="LabelError1" runat="server" Text="" ForeColor="IndianRed"></asp:Label><br />
    <asp:Label ID="LabelError2" runat="server" Text="" ForeColor="Tomato"></asp:Label><br />
    

    </asp:Content>


