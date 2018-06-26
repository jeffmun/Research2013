<%@ Page Language="c#"  Debug="true" MasterPageFile="~/UWAC.master" CodeFile="GetIntHxData.aspx.cs" AutoEventWireup="True" Inherits="stats_GetIntHxData"
     Title="Download MIND_IntHx v2 Data"   EnableEventValidation="false"  %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


    <br />
    <br />
    <asp:Label ID="l1" runat="server" Text="Download Intervention History Data" Font-Underline="true" Font-Bold="true"></asp:Label>
    <br />
    <br />
    <asp:CheckBox ID="chkGetAll" runat="server" Text="Get data from all associated studies" />
<br />
    <br />
    <asp:Button ID="btnGetData" runat="server" Text ="Download Data" OnClick="btnGetData_Click"  />
    
    <asp:Panel ID="Panel1"  runat="server">

    </asp:Panel>    

    <br />
    <asp:Button ID="btnSave" runat="server" Text="Save to Excel" OnClick="btnSave_Click" Visible="false" />


    </asp:Content>