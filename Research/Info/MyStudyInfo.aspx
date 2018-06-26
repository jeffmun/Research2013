<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="MyStudyInfo.aspx.cs" AutoEventWireup="true"
 Inherits="Info_MyStudyInfo" Title="My Study Info" %>
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
    <asp:Label ID="Label1" runat="server" Text="My Study Access" Font-Bold="true" Font-Size="Medium"></asp:Label>
    <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false" Visible="false"></asp:Label>
    <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
    <br />


    <br/><br/>
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
    
    
    <%-- 
<asp:SqlDataSource ID="Sql_Studies" runat="server" SelectCommandType="StoredProcedure"  
    SelectCommand="spSEC_GetStudies_CanView_by_User__Short__with_SelectStudy"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  
   --%>


</asp:Content>
