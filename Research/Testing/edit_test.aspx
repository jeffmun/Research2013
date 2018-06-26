<%@ Page Language="C#" Debug="true" EnableEventValidation="false" AutoEventWireup="true"  MasterPageFile="~/UWAC.master" CodeFile="edit_test.aspx.cs" Inherits="Testing_edit_test" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <br/>
    Insert a new client.<br/>
    <asp:Button ID="btnInsert" runat="server" Text="insert" OnClick="btnInsert_Click" />

    <br/>
    Update the client.<br/>
    <asp:Button ID="btnUpdate" runat="server" Text="update" OnClick="btnUpdate_Click" />
    <br/>

    <asp:Label ID="lblInfo" runat="server" ></asp:Label>
    <br/>



    </asp:Content>