<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="DeletedRecs.aspx.cs" AutoEventWireup="true"
 Inherits="Info_DeletedRecs" Title="Deleted Recs" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style>  p {color: DarkBlue; }
  .fs14 {    font-size: 12px;  }
</style>


 
 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>
     <asp:Label ID="lblMyInfo" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="lblMyError" runat="server" Text="" ForeColor="Red"></asp:Label><br />
	

    <asp:Label ID="Label1" runat="server" Text="Deleted Records" ForeColor="DarkBlue" Font-Bold="true" Font-Underline="true"></asp:Label><br />
	<br />
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>

   
</asp:Content>
