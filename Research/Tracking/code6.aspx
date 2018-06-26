<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="code6.aspx.cs" Inherits="Tracking_code6" %>

<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

    <br />
    <br />
    <asp:Label ID="lblTitle" runat="server" Text="Create 'code6' ID files" Font-Bold="true" Font-Size="Medium"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlLab" runat="server" DataTextField="labname" DataValueField="labID" AutoPostBack="true" OnSelectedIndexChanged="ddlLab_SelectedIndexChanged" ></asp:DropDownList>
    <br />
    <br />

    <asp:Panel ID="panel_filters" runat="server" Visible ="false">

    <table>
        <tr>
            <td style="vertical-align:top" width="500px">

                <asp:Button ID="btnGetIDList" runat="server" OnClick="btnGetIDList_Click" Text="Download stacked code6 file (.csv)" />

            </td>
            <td style="vertical-align:top">
                <asp:Label ID="lblSingle" runat="server" Text="Enter single code6 to lookup:" Font-Size="XX-Small"></asp:Label><br />
                <asp:TextBox ID="txtCode6" runat="server" Width="100" ></asp:TextBox><br /><br />
                <asp:Button ID="btnSingle" runat="server" OnClick="btnSingle_Click" Text="Get Other ID's" /><br /><br />
                <asp:GridView ID="gvSingle" runat="server" AutoGenerateColumns="true"></asp:GridView>


            </td>
            <td style="vertical-align:top">
                <asp:Panel ID="panelDups" runat="server" Visible="false">
                <asp:Label ID="lblDups" runat="server" Text="Duplicates - same otherID is assigned to different people." Font-Size="Small" Font-Bold="true"   ></asp:Label>
                <br /><br />
                <asp:GridView ID="gvDups" runat="server" AutoGenerateColumns="true"></asp:GridView>
                    </asp:Panel>
            </td>

        </tr>
    </table>





    <br />
    <br />
    <table>
        <tr>
            <td>Select Studies:</td>
        <td><i>UNDER CONSTRUCTION</i><br />Select Groups:  <obout:OboutButton ID="btnLoadGroups" runat="server" OnClick="btnLoadGroups_Click" Text="refresh" Font-Size="XX-Small" ></obout:OboutButton></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
                <obout:ListBox ID="lstStudy" runat="server"  SelectionMode="Multiple" OnSelectedIndexChanged="lstStudy_SelectedIndexChanged" ></obout:ListBox>
            </td>
            <td style="vertical-align:top">
                <obout:ListBox ID="lstGroup" runat="server" ></obout:ListBox>
            </td>
        </tr>
    </table>

        <br />

    <asp:Button ID="btnPivot" runat="server" OnClick="btnPivot_Click" Text="Create wide code6 file, with Filters" />
    <obout:OboutCheckBox ID="chkXLSX" runat="server" Text="Save to .xlsx" ></obout:OboutCheckBox>
    <obout:OboutCheckBox ID="chkDisplayOnPage" runat="server" Text="Display on page" ></obout:OboutCheckBox>
        <asp:Label ID="lblSelectOne" runat="server" Visible="false" Text="Select the output method." Font-Size="XX-Small" ForeColor="Red"></asp:Label>
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="panel_wide" runat="server" >

    </asp:Panel>

</asp:Content>

