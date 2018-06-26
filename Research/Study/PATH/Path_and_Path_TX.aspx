<%@ Page Language="C#" Debug="true" MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="Path_and_Path_TX.aspx.cs" Inherits="Study_PATH_Path_and_Path_TX" Title="PATH & PATH_TX" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style> .DataDictCell   { border-color:Gray;   font: 8pt verdana;   font-weight:100; border-width:thin;  color:black; outline-color:gray;    }  </style>

 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>


    <br /> <br />
    <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false" Visible="false"></asp:Label>
    <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
    <br />
    <asp:Label ID="Label1" runat="server" Text="PATH & PATH_TX Subject Status" Font-Size="Medium" Font-Bold="true" Font-Underline="true"></asp:Label>


    <br/><br/>
    <table>
        <tr>
            <td style="vertical-align:top">   <asp:Panel ID="Panel1a" runat="server">    </asp:Panel></td>
            <td style="vertical-align:top">   <asp:Panel ID="Panel1b" runat="server">    </asp:Panel></td>
        </tr>
    </table>
 
    
    <br/><br/>
    <asp:Panel ID="Panel2" runat="server">    </asp:Panel>

    
    <%-- 
<asp:SqlDataSource ID="Sql_Studies" runat="server" SelectCommandType="StoredProcedure"  
    SelectCommand="spSEC_GetStudies_CanView_by_User__Short__with_SelectStudy"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  
   --%>


</asp:Content>
