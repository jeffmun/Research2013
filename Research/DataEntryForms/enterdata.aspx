<%@ Register TagPrefix="def" Namespace="DataEntryFramework4" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Data Entry" 
CodeFile="enterdata.aspx.cs" Inherits="DataEntryForms_enterdata" Debug="true"%>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true"  />


<def:dataentrycontroller  id="DataEntryController1" runat="server" DatabaseTable="ALL_ABC" PrimaryKeyField="abcpk" ScoreAfterSave="true" ></def:dataentrycontroller>

    
<asp:Panel ID="Panel_selector" runat="server" Visible="false" >
    <asp:Label ID="lbl" runat="server" Text = "Select a measure:" Font-Bold="true"></asp:Label>
    <asp:DropDownList ID="ddlMeas" runat="server"></asp:DropDownList>
    <asp:Button ID="btnLoadMeas" runat="server" Text ="Load Measure" OnCommand="btnButton_Command" CommandName="LoadMeas" />
    <br /><br />
    <asp:Label ID="lblNotReady" runat="server" Text = "" Font-Bold="true"></asp:Label>
    <br /><br />
    <asp:Button ID="btnEditLayout" runat="server" Text ="Click Here to Edit Layout" Visible="false"/>
    
</asp:Panel>

<asp:Panel ID="panelDEInsert" runat="server"  ></asp:Panel>
<asp:Panel ID="mainPanel"  CssClass="mainPanel" runat="server">
    <asp:UpdatePanel ID="panelDEMainBody" runat="server" ></asp:UpdatePanel>
</asp:Panel>


</asp:Content>