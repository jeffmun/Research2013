<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" 
CodeFile="DataDictionary.aspx.cs" Inherits="Documents.DataDictionary" Title="Data Dictionary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

<div>
    <strong><span style="text-decoration: underline">Data Dictionary</span></strong>
    <br />Select a data table from the list below to display the variable names, labels, etc.

        <asp:PlaceHolder ID="theFrameHolder" runat="server" /> 
        
</div>

</asp:Content>

