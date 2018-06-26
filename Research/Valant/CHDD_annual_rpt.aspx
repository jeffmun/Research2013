<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="CHDD_annual_rpt.aspx.cs" Inherits="Valant_CHDD_annual_rpt" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %> 


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

    <br />
    <br />


    <table>
        <tr>
            <td>
                <asp:Label ID="lperiod1" runat="server" Text="Period 1" Font-Bold="true" ></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Period 2" Font-Bold="true" ></asp:Label>
            </td>
        </tr>
       <tr>
            <td>


    <asp:Label ID="l1" runat="server" Text="From:" />
    <asp:TextBox ID="txtD1" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="l2" runat="server" Text="To:" />
    <asp:TextBox ID="txtD2" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Button ID="btnRefresh" runat="server" Text="Refresh data" OnClick="btnRefresh_Click" />
        <br />
    <br />
               
            </td>
            <td style="vertical-align:top">
    <asp:Label ID="Label1" runat="server" Text="From:" />
    <asp:TextBox ID="txtD1_B" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Text="To:" />
    <asp:TextBox ID="txtD2_B" runat="server"></asp:TextBox>
        <br />
    <br />
            </td>

        </tr>
        <tr>
            <td  style="vertical-align:top">
                <asp:Panel ID="panel1" runat="server"></asp:Panel>
            </td>
            <td  style="vertical-align:top">
                <asp:Panel ID="panel2" runat="server"></asp:Panel>
            </td>
        </tr>
    </table>

    </asp:Content>

