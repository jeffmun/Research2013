<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="DataDictionary.aspx.cs" AutoEventWireup="true"
 Inherits="Info_DataDictionary" Title="Data Dictionary" %>
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
    <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
    <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>
    <br />


<asp:DropDownList ID="DDL_SelectMeasureID" runat="server"  
             DataTextField="Measname" DataValueField="measureID" Width="200px" 
             OnSelectedIndexChanged="DDL_SelectMeasureID_SelectedIndexChanged"  AutoPostBack="true" ViewStateMode="Enabled" >
</asp:DropDownList>

    <br/><br/>
    <asp:Label ID="lblINTRO_measname" runat="server" Text="Data Dictionary for: " Visible="false" Font-Size="Medium"></asp:Label>
    <asp:Label ID="lblMeasName_ContentPage" runat="server" Text=" " Font-Bold="true" Font-Size="Large"></asp:Label>
    
    <br />    <br />

    <asp:GridView ID="GridView_DataDict" runat="server" Visible="false" AutoGenerateColumns="true">
    </asp:GridView>
    
    <%-- 
<asp:SqlDataSource ID="Sql_Studies" runat="server" SelectCommandType="StoredProcedure"  
    SelectCommand="spSEC_GetStudies_CanView_by_User__Short__with_SelectStudy"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  
   --%>


</asp:Content>


