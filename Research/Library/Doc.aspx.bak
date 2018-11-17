<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Doc.aspx.cs" AutoEventWireup="true"
 Inherits="Library_Doc" Title="Document"      %>  

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
        <script type="text/javascript">
        function OnExceptionOccurred(s, e) {
            e.handled = true;
            alert(e.message);
            window.location.reload();
            }

    function OnInit(s, e) { 
        s.SetFullscreenMode(true); 
     }
    </script>
</asp:Content>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


    <dx:ASPxLabel ID="lbl1" runat="server" Text="Document" Font-Bold="true"></dx:ASPxLabel>

 <dx:ASPxRichEdit ID="richeditDoc" runat="server" Width="100%" Height="700px" 
        ActiveTabIndex="0" >
        <ClientSideEvents CallbackError="OnExceptionOccurred" Init="OnInit" ></ClientSideEvents>
<%--        <SettingsDocumentSelector FileListSettings-View="Details"></SettingsDocumentSelector>--%>
    </dx:ASPxRichEdit>


   <%-- <dx:ASPxWebDocumentViewer ID="webdocDoc" runat="server" ></dx:ASPxWebDocumentViewer>--%>


    <br /><br />
    <dx:ASPxLabel ID="lblLoadError" runat="server" Text="File not found." ForeColor="DarkRed" Font-Bold ="true" Visible="false"></dx:ASPxLabel>

</asp:Content>