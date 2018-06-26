<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="tblparam.aspx.cs" Inherits="_test_tblparam" 
     EnableEventValidation="false" Title="tbl param"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >


    <asp:Button ID="btn" runat="server" Text="foo" OnClick="foo" />
    <asp:Button ID="Button1" runat="server" Text="foo2" OnClick="foo2" />



    <br /><br /><br />
    <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="true"></asp:GridView>

    </asp:Content>