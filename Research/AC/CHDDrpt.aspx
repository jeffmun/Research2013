<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="CHDDrpt.aspx.cs" Inherits="AC_CHDDrpt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">



    <br />
    <b>CHDD report from Valant Transaction Journal data</b>
    <br />
    Group by:
    <asp:DropDownList ID="ddlMode" runat="server">
        <asp:ListItem Value="Yr"></asp:ListItem>
        <asp:ListItem Value="YrQtr"></asp:ListItem>
        <asp:ListItem Value="YrMo"></asp:ListItem>
        <asp:ListItem Value="EntireRange"></asp:ListItem>

    </asp:DropDownList>


    <asp:TextBox ID="txtYr" runat="server" Text="" Width="80px" Visible="false"></asp:TextBox><br />
    From:
    <asp:TextBox ID="txtDate1" runat="server" Text="2018-05-01" Width="80px"></asp:TextBox>
    &nbsp;&nbsp;To:
    <asp:TextBox ID="txtDate2" runat="server" Text="2019-04-30" Width="80px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;
<%--    <asp:Button ID="btnLoad" runat="server" Text="Load" OnClick="btnLoad_Click" Visible="false"/>--%>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnLoad2" runat="server" Text="Load" OnClick="btnLoad2_Click" />
    <br />  <br />  <br />
    Min Age (leave 0 for all):
    <asp:TextBox ID="txtminage" runat="server" Text="0" Width="80px"></asp:TextBox>
    &nbsp;&nbsp;Max Age (leave 0 for all):
    <asp:TextBox ID="txtmaxage" runat="server" Text="0" Width="80px"></asp:TextBox>
    
    <br />  <br />  <br />

    <asp:Label ID="info" runat="server" Text="To determine the # of patients with both Dx & Tx visits: (N pts DX + N pts TX) - (N pts)"></asp:Label>
    <table>
        <tr>
            <td style="vertical-align:top">
    <asp:Label ID="l1" runat="server" Text="Also include records in which TotalAmount=0 ?" Visible="false" Font-Bold="true" Font-Size="Small" Font-Italic="true"></asp:Label>   
    <asp:CheckBox ID="chk1" runat="server" Checked="false"  Visible="false"/>
                 <br />
    <table>
        <tr>
            <td style="vertical-align:top">
                <asp:Panel ID="panel1" runat="server"></asp:Panel>
            </td>
            <td style="width: 30px;"></td>
            <td style="vertical-align:top">
                <asp:Panel ID="panel2" runat="server"></asp:Panel>
            </td>
           <td style="width: 30px;"></td>
            <td style="vertical-align:top">
                <asp:Panel ID="panel3" runat="server"></asp:Panel>
            </td>
        </tr>
    </table>



            </td>
            <td style="width: 60px;"></td>

            <td style="vertical-align:top">
    <asp:Label ID="Label1" runat="server" Text="Valant TJ records in which TotalAmount >= 0" Visible="false" Font-Bold="true" Font-Size="Small" Font-Italic="true"></asp:Label>    
        <asp:CheckBox ID="chk2" runat="server" Checked="false" Visible="false" />
    <br />
    <table>
        <tr>
            <td style="vertical-align:top">
                <asp:Panel ID="panel1B" runat="server"></asp:Panel>
            </td>
            <td style="width: 30px;"></td>
            <td style="vertical-align:top">
                <asp:Panel ID="panel2B" runat="server"></asp:Panel>
            </td>
        </tr>
    </table>

            </td>
        </tr>
    </table>



        <br />
    <br />
</asp:Content>

