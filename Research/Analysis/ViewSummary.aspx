<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="ViewSummary.aspx.cs" 
    Inherits="Analysis_ViewSummary" 
     EnableEventValidation="false" Title="Data Summary"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >

           <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"      >
    </asp:ScriptManager>
    
<%--    <style>
    html,body, div, iframe{ width: 100%;
     
        
        margin: 0; padding: 0;
    }
</style>--%>

<%--    height: 100%;
       overflow: hidden;
        overflow-x: hidden;
        overflow-y: hidden;--%>
    
    <br/>
    <br/>
    <asp:Label ID="lblInfo" runat="server" ></asp:Label>
    <br />


<%--        <IFRAME id="frame1"   runat="server" hspace="0" vspace="0" marginHeight = "0" marginWidth = "0" frameborder="no"></IFRAME>--%>

    
    <asp:Panel ID="panel1" runat="server">

    </asp:Panel>

    </asp:Content>

