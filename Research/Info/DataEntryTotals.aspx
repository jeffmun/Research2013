<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="DataEntryTotals.aspx.cs" AutoEventWireup="true"
 Inherits="Info_DataEntryTotals" Title="Data Entry Totals" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style> .DataDictCell   { border-color:Gray;   font: 8pt verdana;   font-weight:100; border-width:thin;  color:black; outline-color:gray;    }  </style>

 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td Font-Color="red"></td></tr>
 </table>
 <br />
  <table id="tblmyerror" runat="server" width="100%">
 <tr><td>
     <asp:Label ID="lblMyError" runat="server" Text="" CssClass="ErrorCell" ></asp:Label>
     <asp:Label ID="lblMyInfo" runat="server" Text="" CssClass="InfoCell" ></asp:Label>
 </td></tr>
 </table>

  
    <asp:Button ID="btnShowHide_Panel_DataSets" runat="server" Text="View DataSets rather than entire study" OnClick="Click_DisplaySetPanel" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    <asp:Panel ID="Panel_DataSets" runat="server" Visible="false">
        <asp:Label ID="lbl_set" runat="server" Text="Data Set:"></asp:Label>
        <asp:DropDownList ID="ddl_set" runat="server" DataSourceID="Sql_autosets" DataTextField="set_label" DataValueField="setpk" >
        </asp:DropDownList>


        <asp:Button ID="Button1" runat="server" Text="View Info for Selected DataSet" OnClick="Click_LoadSet" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Click_LoadStudy" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </asp:Panel>

    <br /> <br />

    <asp:Panel ID="Panel1_header" runat="server" Visible="true">
        <asp:Label ID="Label1" runat="server" Text="Study: " Font-Size="Medium" Font-Bold="false" ></asp:Label>
        <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true" ></asp:Label>
        <br />
    </asp:Panel>

    <asp:Panel ID="Panel1" runat="server" Visible="true">
    </asp:Panel>
    <br/>

        <asp:Panel ID="Panel2_header" runat="server" Visible="false">
        <asp:Label ID="Label2" runat="server" Text="Data set info: " Font-Size="Medium" Font-Bold="false" ></asp:Label>
        <br />
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Visible="false">
    </asp:Panel>
    
    
<asp:SqlDataSource ID="Sql_autosets" runat="server" SelectCommandType="text"  
    SelectCommand="select * from vwAUTOSETS_for_ddl"  
    ConnectionString="<%$ ConnectionStrings: DATA_CONN_STRING %>">
   </asp:SqlDataSource>  


</asp:Content>


